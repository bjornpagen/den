import { Array as Arr, Option } from "effect"
import {
	type Admission,
	admissionOf,
	type Claimed,
	type Edge,
	type Ladder,
	type Outcome,
	ordinals,
	type Program,
	type Resource,
	type RootKind,
	rootedOf,
	type Runs,
	type StepKind,
	spawn,
	stepOf
} from "#program.ts"

/**
 * The limits of AlphaTest's Timeback writeback, each the test's input: Timeback's seats (calls in flight), how a call
 * runs (its lease and its ladder), the question results one batch writes (the 20-at-a-time window inside one step), and
 * the ticks Timeback's `Retry-After` names when it throttles a call.
 */
export type WritebackLimits = Readonly<{
	seats: number
	lease: number
	ladder: Ladder
	batch: number
	retryAfter: number
}>

/**
 * One graded attempt as the writeback sees it: its id, the questions it holds, and how many times Timeback throttles
 * each call of it before it answers.
 */
export type Graded = Readonly<{ attempt: string; questions: number; throttles: number }>

/** One call of the chain: its attempt and, for a batch, its place. */
type Call = Readonly<{ graded: Graded; seq: number }>

/**
 * A call's body: Timeback throttles it while the attempt's throttles last, naming when to call again, which waits and
 * spends nothing; then it answers, and its writes are PUTs to sourcedIds derived from the attempt, safe to repeat.
 */
const answered = <O>(
	limits: WritebackLimits,
	graded: Graded,
	claimed: Claimed,
	answer: () => Outcome<O, never>
): Outcome<O, never> =>
	claimed.waits < graded.throttles
		? { _tag: "Retry", at: claimed.at + limits.retryAfter, counts: "wait" }
		: answer()

/**
 * AlphaTest's Timeback writeback at grading as a den program: grading's own commit requests the attempt's root in the
 * same transaction, so the submit never waits on Timeback; the chain writes the line item, the parent result, the
 * Caliper XP event, then the question results batch by batch, each call holding a seat of Timeback and waiting out
 * Timeback's throttles; the root's finish marks the attempt written back only once every call landed.
 */
export const writebackOf = (
	limits: WritebackLimits
): Readonly<{ program: Program; request: (graded: Graded) => Admission }> => {
	const timeback: Resource = { name: "timeback", seats: limits.seats }
	const runs: Runs = { lease: limits.lease, holds: [timeback], ladder: limits.ladder }
	const free: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }
	const batches = (graded: Graded): number => Math.ceil(graded.questions / limits.batch)

	const Batch: StepKind<Call, number, never> = {
		name: "QuestionBatch",
		runs,
		input: (call) => ({ attempt: call.graded.attempt, seq: call.seq }),
		output: (written) => written,
		error: () => 0,
		reads: () => [],
		body: (call, claimed) =>
			answered(limits, call.graded, claimed, () => {
				const questions = Arr.map(
					ordinals(Math.min(limits.batch, call.graded.questions - call.seq * limits.batch)),
					(offset) => call.seq * limits.batch + offset
				)
				return {
					_tag: "Output",
					output: questions.length,
					writes: Arr.map(questions, (question) => ({
						relation: "timeback_result",
						key: `${call.graded.attempt}:${question}`,
						value: question
					}))
				}
			}),
		edges: () => [
			spawn("batch", Batch, (call: Call) =>
				call.seq + 1 < batches(call.graded) ? [{ graded: call.graded, seq: call.seq + 1 }] : []
			)
		]
	}

	/** One call of the chain before the batches: its name, the relation it PUTs, and the call after it. */
	const call = (
		name: string,
		relation: string,
		then: () => ReadonlyArray<Edge<Call, number>>
	): StepKind<Call, number, never> => ({
		name,
		runs,
		input: (c) => ({ attempt: c.graded.attempt }),
		output: (written) => written,
		error: () => 0,
		reads: () => [],
		body: (c, claimed) =>
			answered(limits, c.graded, claimed, () => ({
				_tag: "Output",
				output: 1,
				writes: [{ relation, key: c.graded.attempt, value: c.graded.questions }]
			})),
		edges: then
	})

	const Caliper = call("CaliperXP", "caliper_xp", () => [
		spawn("batch", Batch, (c: Call) =>
			batches(c.graded) > 0 ? [{ graded: c.graded, seq: 0 }] : []
		)
	])
	const ParentResult = call("ParentResult", "timeback_parent", () => [
		spawn("caliper", Caliper, (c: Call) => [c])
	])
	const LineItem = call("LineItem", "timeback_line_item", () => [
		spawn("parent", ParentResult, (c: Call) => [c])
	])

	const Writeback: RootKind<Graded, boolean, never> = {
		name: "Writeback",
		trigger: { _tag: "App", heading: "WritebackInput" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "Writeback",
			input: (graded) => ({ attempt: graded.attempt, questions: graded.questions }),
			start: (graded) => [stepOf(LineItem, { graded, seq: 0 })],
			finish: {
				runs: free,
				output: (written) => written,
				error: () => false,
				body: (graded, children) => {
					const written = Arr.every(children, (child) => child._tag === "Done")
					return {
						_tag: "Output",
						output: written,
						writes: written ? [{ relation: "written_back", key: graded.attempt, value: true }] : []
					}
				}
			}
		}
	}

	return {
		program: { name: "writeback", resources: [timeback], roots: [rootedOf(Writeback)] },
		request: (graded) => admissionOf(Writeback, graded.attempt, graded)
	}
}
