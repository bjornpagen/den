import { Array as Arr, Option } from "effect"
import {
	type Admission,
	admissionOf,
	type Claimed,
	type Ladder,
	open,
	type Outcome,
	ordinals,
	type Program,
	type Resource,
	type RootKind,
	rootedOf,
	type Runs,
	type ScopeKind,
	type StepKind,
	spawn,
	stepOf
} from "#program.ts"

/**
 * The limits of AlphaTest's gap analysis and its plan (DCAN), each the test's input: Anthropic's seats (model calls in
 * flight across every run), Timeback's seats, how a call runs (its lease and its ladder), and the ticks Anthropic's
 * `retry-after` names when it throttles a call.
 */
export type GapLimits = Readonly<{
	anthropic: number
	timeback: number
	lease: number
	ladder: Ladder
	retryAfter: number
}>

/**
 * One attempt's analysis as the source answers it: its gap analysis id, its wrong answers, how many times Anthropic
 * throttles each model call before it answers, and its plan: the gap groups the orchestrator hands its subagents, its
 * turns, and the turn after which the subagents run.
 */
export type Analysis = Readonly<{
	gap: string
	wrong: number
	throttles: number
	groups: number
	turns: number
	fanAt: number
}>

/** One missed question of an analysis, by its place. */
type Question = Readonly<{ analysis: Analysis; question: number }>

/** A group's cluster, saved: the analysis and how many of its questions the cluster read. */
type Clustered = Readonly<{ analysis: Analysis; clustered: number }>

/** One orchestrator turn of a plan: its place, and what the subagents before it reported, if any ran. */
type Turn = Readonly<{ analysis: Analysis; turn: number; heard: number }>

/** One subagent of a plan's fan-out: the turn it follows and its gap group. */
type Group = Readonly<{ analysis: Analysis; turn: number; group: number }>

/** A model call's body: Anthropic throttles it while the analysis's throttles last, naming when to call again. */
const modelCall = <O>(
	limits: GapLimits,
	analysis: Analysis,
	claimed: Claimed,
	answer: () => Outcome<O, never>
): Outcome<O, never> =>
	claimed.waits < analysis.throttles
		? { _tag: "Retry", at: claimed.at + limits.retryAfter, counts: "wait" }
		: answer()

/**
 * AlphaTest's gap analysis as a map and a reduce, and its plan, as a den program. Grading's own commit requests the
 * analysis's root. Its review object is frozen, then its edge opens the Questions scope, one AnalyzeQuestion per wrong
 * answer, each one short model call holding a seat of Anthropic; the scope's finish, the cluster, reads every
 * question's analysis, and the edge that follows it saves the report in the root, from the cluster's output; the save's
 * edge stamps Timeback (a seat of Timeback), and the stamp's dispatches the plan: a Plan scope whose orchestrator turns
 * run as a chain, each a model call, and whose fan-out turn opens a Subagents scope, one subagent per gap group, the
 * orchestrator's next turn following that scope's finish with what the subagents reported. The root's finish marks the
 * analysis done once every stage did.
 */
export const gapOf = (
	limits: GapLimits
): Readonly<{ program: Program; request: (analysis: Analysis) => Admission }> => {
	const anthropic: Resource = { name: "anthropic", seats: limits.anthropic }
	const timeback: Resource = { name: "timeback", seats: limits.timeback }
	const model: Runs = { lease: limits.lease, holds: [anthropic], ladder: limits.ladder }
	const stamping: Runs = { lease: limits.lease, holds: [timeback], ladder: limits.ladder }
	const free: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }
	const show = (analysis: Analysis) => ({ gap: analysis.gap })

	const Subagent: StepKind<Group, number, never> = {
		name: "Subagent",
		runs: model,
		input: (group) => ({ gap: group.analysis.gap, turn: group.turn, group: group.group }),
		output: (lessons) => lessons,
		error: () => 0,
		reads: () => [],
		body: (group, claimed) =>
			modelCall(limits, group.analysis, claimed, () => ({
				_tag: "Output",
				output: 1,
				writes: [
					{
						relation: "dcan_subagent",
						key: `${group.analysis.gap}:${group.group}`,
						value: group.turn
					}
				]
			})),
		edges: () => []
	}

	const Subagents: ScopeKind<Turn, number, never> = {
		name: "Subagents",
		input: (turn) => ({ gap: turn.analysis.gap, turn: turn.turn }),
		start: (turn) =>
			Arr.map(ordinals(turn.analysis.groups), (group) =>
				stepOf(Subagent, { analysis: turn.analysis, turn: turn.turn, group })
			),
		finish: {
			runs: free,
			output: (reported) => reported,
			error: () => 0,
			body: (_turn, children) => ({
				_tag: "Output",
				output: Arr.filter(children, (child) => child._tag === "Done").length,
				writes: []
			})
		}
	}

	const Orchestrate: StepKind<Turn, number, never> = {
		name: "Orchestrate",
		runs: model,
		input: (turn) => ({ gap: turn.analysis.gap, turn: turn.turn, heard: turn.heard }),
		output: (turn) => turn,
		error: () => 0,
		reads: () => [],
		body: (turn, claimed) =>
			modelCall(limits, turn.analysis, claimed, () => ({
				_tag: "Output",
				output: turn.turn,
				writes: [
					{ relation: "dcan_message", key: `${turn.analysis.gap}:${turn.turn}`, value: turn.heard }
				]
			})),
		edges: () => [
			spawn("next", Orchestrate, (turn: Turn) =>
				turn.turn !== turn.analysis.fanAt && turn.turn + 1 < turn.analysis.turns
					? [{ analysis: turn.analysis, turn: turn.turn + 1, heard: 0 }]
					: []
			),
			open(
				"subagents",
				Subagents,
				(turn: Turn) => (turn.turn === turn.analysis.fanAt ? [turn] : []),
				() => [
					spawn("resume", Orchestrate, (turn: Turn, reported: number) =>
						turn.turn + 1 < turn.analysis.turns
							? [{ analysis: turn.analysis, turn: turn.turn + 1, heard: reported }]
							: []
					)
				]
			)
		]
	}

	const Plan: ScopeKind<Analysis, number, never> = {
		name: "Plan",
		input: show,
		start: (analysis) => [stepOf(Orchestrate, { analysis, turn: 0, heard: 0 })],
		finish: {
			runs: free,
			output: (turns) => turns,
			error: () => 0,
			body: (analysis, children) => {
				const turns = Arr.filter(
					children,
					(child) => child._tag === "Done" && child.kind === "Orchestrate"
				).length
				return {
					_tag: "Output",
					output: turns,
					writes: [{ relation: "plan", key: analysis.gap, value: turns }]
				}
			}
		}
	}

	const Dispatch: StepKind<Analysis, boolean, never> = {
		name: "Dispatch",
		runs: free,
		input: show,
		output: (dispatched) => dispatched,
		error: () => false,
		reads: () => [],
		body: (analysis) => ({
			_tag: "Output",
			output: true,
			writes: [{ relation: "dispatched", key: analysis.gap, value: true }]
		}),
		edges: () => [
			open(
				"plan",
				Plan,
				(analysis: Analysis) => [analysis],
				() => []
			)
		]
	}

	const Stamp: StepKind<Analysis, boolean, never> = {
		name: "TimebackStamp",
		runs: stamping,
		input: show,
		output: (stamped) => stamped,
		error: () => false,
		reads: () => [],
		body: (analysis) => ({
			_tag: "Output",
			output: true,
			writes: [{ relation: "timeback_stamp", key: analysis.gap, value: true }]
		}),
		edges: () => [spawn("dispatch", Dispatch, (analysis: Analysis) => [analysis])]
	}

	const Save: StepKind<Clustered, number, never> = {
		name: "Save",
		runs: free,
		input: (saved) => ({ gap: saved.analysis.gap, clustered: saved.clustered }),
		output: (clustered) => clustered,
		error: () => 0,
		reads: () => [],
		body: (saved) => ({
			_tag: "Output",
			output: saved.clustered,
			writes: [{ relation: "gap_report", key: saved.analysis.gap, value: saved.clustered }]
		}),
		edges: () => [spawn("stamp", Stamp, (saved: Clustered) => [saved.analysis])]
	}

	const Analyze: StepKind<Question, number, never> = {
		name: "AnalyzeQuestion",
		runs: model,
		input: (question) => ({ gap: question.analysis.gap, question: question.question }),
		output: (question) => question,
		error: () => 0,
		reads: () => [],
		body: (question, claimed) =>
			modelCall(limits, question.analysis, claimed, () => ({
				_tag: "Output",
				output: question.question,
				writes: [
					{
						relation: "gap_question",
						key: `${question.analysis.gap}:${question.question}`,
						value: question.question
					}
				]
			})),
		edges: () => []
	}

	/** The cluster reads every question's ending, as the prompt's cross-question rules read every analysis. */
	const Questions: ScopeKind<Analysis, number, never> = {
		name: "Questions",
		input: show,
		start: (analysis) =>
			Arr.map(ordinals(analysis.wrong), (question) => stepOf(Analyze, { analysis, question })),
		finish: {
			runs: model,
			output: (clustered) => clustered,
			error: () => 0,
			body: (_analysis, children) => ({
				_tag: "Output",
				output: Arr.filter(children, (child) => child._tag === "Done").length,
				writes: []
			})
		}
	}

	const ReviewObject: StepKind<Analysis, number, never> = {
		name: "ReviewObject",
		runs: free,
		input: show,
		output: (wrong) => wrong,
		error: () => 0,
		reads: () => [],
		body: (analysis) => ({
			_tag: "Output",
			output: analysis.wrong,
			writes: [{ relation: "review_object", key: analysis.gap, value: analysis.wrong }]
		}),
		edges: () => [
			open(
				"questions",
				Questions,
				(analysis: Analysis) => [analysis],
				() => [
					spawn("save", Save, (analysis: Analysis, clustered: number) => [{ analysis, clustered }])
				]
			)
		]
	}

	const GapAnalysis: RootKind<Analysis, boolean, never> = {
		name: "GapAnalysis",
		trigger: { _tag: "App" },
		from: { _tag: "Given", heading: "GapAnalysisInput" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "GapAnalysis",
			input: show,
			start: (analysis) => [stepOf(ReviewObject, analysis)],
			finish: {
				runs: free,
				output: (done) => done,
				error: () => false,
				body: (analysis, children) => {
					const done = Arr.every(children, (child) => child._tag === "Done")
					return {
						_tag: "Output",
						output: done,
						writes: done ? [{ relation: "gap_done", key: analysis.gap, value: true }] : []
					}
				}
			}
		}
	}

	return {
		program: { name: "gap", resources: [anthropic, timeback], roots: [rootedOf(GapAnalysis)] },
		request: (analysis) => admissionOf(GapAnalysis, analysis.gap, analysis)
	}
}
