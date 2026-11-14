import {
	type Answer as Answered,
	type CommandName,
	program,
	type Real,
	refused,
	runProgram,
	type StepFeature,
	took
} from "@bjornpagen/testing/commands"
import { type Case, drawn, explore, Run } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import type { Source } from "@bjornpagen/testing/source"
import { swarm } from "@bjornpagen/testing/swarm"
import { searched } from "@bjornpagen/testing/vitest"
import { runOfTest } from "@bjornpagen/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option, Order } from "effect"
import { type Rules, SOUND } from "#ledger.ts"
import {
	type Flat,
	flatMachine,
	type Model,
	type Parameters,
	type Refusal,
	type Report
} from "#machine.ts"
import { retiredKeysRecur } from "#planted.ts"
import { ordinals } from "#program.ts"
import { caught, exploration } from "#search.ts"

/** What the specification notices on the way to a re-admission: a retirement, and an admission after one. */
type Toward = "retired" | "readmitted"

/** One step of the specification: whether it is the finish, and what the laws say it holds. */
type Spec = {
	index: number
	key: string
	due: number
	hold: Option.Option<Readonly<{ attempt: number; until: number }>>
	claims: number
	retried: Option.Option<Readonly<{ attempt: number; at: number }>>
	attempts: number
	result: Option.Option<Readonly<{ attempt: number; report: Option.Option<Report> }>>
	finish: boolean
}

/** The order seats are given in within one root: the earliest due, then the step's key. */
const BY_DUE = Order.combine(
	Order.mapInput(Order.Number, (step: Spec) =>
		Option.match(step.hold, { onNone: () => step.due, onSome: (hold) => hold.until })
	),
	Order.mapInput(Order.String, (step: Spec) => step.key)
)

/**
 * The flat program's ledger as the proposal's laws state it, written apart from ledger.ts: a claim names a step and
 * takes it once its due instant passed and no live claim holds it, a seat free and owed to no step due before it; a
 * reclaim spends an attempt and one at the end of the ladder fails the step instead; a commit lands only on the step's
 * latest claim while it holds no result, and the same report again changes nothing; the finish, which holds no seat,
 * starts once every child has a result; a root retires only once it finished, and its key never recurs.
 */
const specOf = (
	flat: Flat,
	notice: (seen: Toward) => void
): Real<Model, Parameters, Refusal, never, never> => {
	let now = 0
	let admitted = false
	let retired = false
	let finished = false
	let steps: Array<Spec> = []
	const leases: Array<Readonly<{ index: number; attempt: number }>> = []
	const keyOf = (index: number) =>
		index === 0 ? `Flat("flat")/finish` : `Flat("flat")/start#${index - 1}`
	const fresh = (index: number): Spec => ({
		index,
		key: keyOf(index),
		due: now,
		hold: Option.none(),
		claims: 0,
		retried: Option.none(),
		attempts: 0,
		result: Option.none(),
		finish: index === 0
	})
	const settle = () => {
		const children = Arr.filter(steps, (step) => !step.finish)
		const finishes = Arr.filter(steps, (step) => step.finish)
		if (
			Arr.isReadonlyArrayEmpty(finishes) &&
			Arr.every(children, (step) => Option.isSome(step.result))
		) {
			steps.push(fresh(0))
		}
		if (Arr.some(finishes, (step) => Option.isSome(step.result))) {
			finished = true
		}
	}
	const end = (step: Spec, attempt: number, report: Option.Option<Report>) => {
		step.result = Option.some({ attempt, report })
		step.hold = Option.none()
		settle()
	}
	const live = (step: Spec) =>
		Option.isNone(step.result) && Option.exists(step.hold, (hold) => hold.until > now)
	const due = (step: Spec) =>
		Option.isNone(step.result) &&
		Option.match(step.hold, {
			onNone: () => step.due <= now,
			onSome: (hold) => hold.until <= now
		})
	const answer = (result: Answered<Refusal>) => Effect.succeed(result)
	return {
		admit: () => {
			if (admitted) {
				return answer(refused("unchanged"))
			}
			if (retired) {
				notice("readmitted")
				return answer(refused("retired"))
			}
			admitted = true
			steps = Arr.map(ordinals(flat.steps), (ordinal) => fresh(ordinal + 1))
			settle()
			return answer(took)
		},
		claim: (index) =>
			Option.match(
				Arr.findFirst(steps, (step) => step.index === index),
				{
					onNone: () => answer(refused("gone")),
					onSome: (step) => {
						if (Option.isSome(step.result) || live(step)) {
							return answer(refused("lost"))
						}
						if (!due(step)) {
							return answer(refused("early"))
						}
						if (!step.finish) {
							const free =
								flat.seats - Arr.filter(steps, (other) => !other.finish && live(other)).length
							if (free <= 0) {
								return answer(refused("full"))
							}
							const ahead = Arr.filter(
								Arr.sort(
									Arr.filter(steps, (other) => !other.finish && due(other)),
									BY_DUE
								),
								(other) => BY_DUE(other, step) < 0
							).length
							if (ahead >= free) {
								return answer(refused("behind"))
							}
						}
						const lapsed = Option.isSome(step.hold)
						if (lapsed && step.attempts + 1 >= flat.attempts) {
							end(
								step,
								Option.match(step.hold, { onNone: () => 0, onSome: (hold) => hold.attempt }),
								Option.none()
							)
							return answer(took)
						}
						step.attempts += lapsed ? 1 : 0
						step.hold = Option.some({ attempt: step.claims, until: now + flat.lease })
						leases.push({ index: step.index, attempt: step.claims })
						step.claims += 1
						return answer(took)
					}
				}
			),
		commit: ({ lease, report }) =>
			Option.match(Arr.get(leases, lease), {
				onNone: () => answer(refused("gone")),
				onSome: (held) =>
					Option.match(
						Arr.findFirst(steps, (step) => step.index === held.index),
						{
							onNone: () => answer(refused("gone")),
							onSome: (step) => {
								if (Option.isSome(step.result)) {
									const landed = step.result.value
									return answer(
										refused(
											landed.attempt === held.attempt && Option.contains(landed.report, report)
												? "unchanged"
												: "lost"
										)
									)
								}
								if (Option.exists(step.hold, (hold) => hold.attempt === held.attempt)) {
									if (report === "output" || step.attempts + 1 >= flat.attempts) {
										end(step, held.attempt, Option.some(report))
										return answer(took)
									}
									step.attempts += 1
									step.hold = Option.none()
									step.retried = Option.some({ attempt: held.attempt, at: now })
									step.due = now
									return answer(took)
								}
								const again =
									Option.isNone(step.hold) &&
									Option.exists(
										step.retried,
										(retry) =>
											retry.attempt === held.attempt && retry.at === now && report === "retry"
									)
								return answer(refused(again ? "unchanged" : "lost"))
							}
						}
					)
			}),
		tick: (ticks) => {
			now += ticks
			return answer(took)
		},
		retire: () => {
			if (!admitted) {
				return answer(refused(retired ? "unchanged" : "gone"))
			}
			if (!finished) {
				return answer(refused("live"))
			}
			admitted = false
			retired = true
			steps = []
			notice("retired")
			return answer(took)
		}
	}
}

const COMMANDS: Arr.NonEmptyReadonlyArray<CommandName<Parameters>> = [
	"admit",
	"claim",
	"commit",
	"tick",
	"retire"
]

const flatGen: Gen<Flat> = (source) => ({
	seats: source.draw(int(1, 2)),
	steps: source.draw(int(0, 3)),
	lease: source.draw(int(1, 3)),
	attempts: source.draw(int(1, 3))
})

/** A flat program and a command program over the ledger under `rules`, a swarm of the commands on. */
const programsOf = (rules: Rules) => (source: Source) => {
	const flat = source.draw(flatGen)
	const mix = source.draw(swarm(COMMANDS))
	return { flat, steps: source.draw(program(flatMachine(flat, rules), { min: 1, max: 40 }, mix)) }
}

describe("the ledger against the laws' own statement", () => {
	it.effect(
		"every claim, seat, commit, retirement and admission a worker, the clock and an operator make is answered as the specification of a flat program says",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "machine: flat program",
						draw: drawn(programsOf(SOUND)),
						coverage: required<StepFeature<Parameters, Refusal>>(
							[
								"admit accepted",
								"admit refused unchanged",
								"admit refused retired",
								"claim accepted",
								"claim refused full",
								"claim refused behind",
								"claim refused lost",
								"claim refused gone",
								"commit accepted",
								"commit refused lost",
								"commit refused unchanged",
								"commit refused gone",
								"retire accepted",
								"retire refused live"
							],
							{ cases: 400, sense: notesOnly }
						),
						runs: 600,
						shrink: 400,
						oracle: {
							kind: "second-implementation",
							name: "a flat program's ledger as the laws state it, written apart from ledger.ts"
						}
					}),
					(sketch, c: Case<StepFeature<Parameters, Refusal>>) =>
						Effect.map(
							runProgram(
								flatMachine(sketch.flat, SOUND),
								specOf(sketch.flat, () => undefined),
								sketch.steps
							),
							(ran) => c.noteAll(ran.verdicts)
						)
				)
			)
	)

	it.effect("the specification catches a ledger whose retired keys recur", (ctx) =>
		caught(
			explore(
				exploration({
					suite: "planted: retired keys recur, against the specification",
					draw: drawn(programsOf(retiredKeysRecur.rules)),
					coverage: required<Toward>(["readmitted"], { cases: 800, sense: notesOnly }),
					runs: 400,
					shrink: 40,
					oracle: {
						kind: "second-implementation",
						name: "a flat program's ledger as the laws state it, against a ledger that forgets retired keys"
					}
				}),
				(sketch, c: Case<Toward>) =>
					Effect.asVoid(
						runProgram(
							flatMachine(sketch.flat, retiredKeysRecur.rules),
							specOf(sketch.flat, (seen) => c.note(seen)),
							sketch.steps
						)
					)
			)
		).pipe(Effect.provideServiceEffect(Run, runOfTest(ctx)))
	)
})
