import {
	type Answer as Answered,
	type CommandName,
	program,
	type Real,
	refused,
	runProgram,
	type StepFeature,
	took
} from "@den/testing/commands"
import { type Case, drawn, explore, Run } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import type { Source } from "@den/testing/source"
import { swarm } from "@den/testing/swarm"
import { searched } from "@den/testing/vitest"
import { runOfTest } from "@den/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option, Order } from "effect"
import { stepText } from "#identity.ts"
import { type Rules, SOUND } from "#ledger.ts"
import {
	type Flat,
	flatMachine,
	type Model,
	type Parameters,
	type Refusal,
	type Report
} from "#machine.ts"
import { fenceOnAttempt } from "#planted.ts"
import { ordinals } from "#program.ts"
import { caught, exploration } from "#search.ts"

/**
 * What the specification notices on the way to a commit from a retired graph: a retirement, an admission after one, a
 * commit naming a lease of a retired graph, and one whose attempt number matches the new graph's live claim.
 */
type Toward = "retired" | "readmitted" | "old-lease" | "retired-lease"

/** One step of the specification: its key, whether it is the finish, and what the laws say it holds. */
type Spec = {
	key: string
	due: number
	hold: Option.Option<Readonly<{ token: number; claim: number; until: number }>>
	claims: number
	retried: Option.Option<Readonly<{ token: number; at: number }>>
	attempts: number
	reclaims: number
	result: Option.Option<Readonly<{ token: Option.Option<number>; report: Option.Option<Report> }>>
	finish: boolean
}

const BY_DUE = Order.combine(
	Order.mapInput(Order.Number, (step: Spec) =>
		step.hold.pipe(Option.match({ onNone: () => step.due, onSome: (hold) => hold.until }))
	),
	Order.mapInput(Order.String, (step: Spec) => step.key)
)

/**
 * The flat program's ledger as the proposal's laws state it, written apart from ledger.ts: a claim takes the earliest
 * due step of a lane with room, a reclaim past the ceiling fails the step instead, a commit lands only on the claim its
 * token names and the same report again changes nothing, the finish starts once every child has a result, a stop ends
 * everything, and a root retires only once it finished.
 */
const specOf = (
	flat: Flat,
	notice: (seen: Toward) => void
): Real<Model, Parameters, Refusal, never, never> => {
	const scope = { _tag: "RootScope", root: { trigger: "Flat", key: "flat" } } as const
	let now = 0
	let admitted = false
	let finished = false
	let steps: Array<Spec> = []
	let minted = 0
	let graph = 0
	const leases: Array<Readonly<{ key: string; token: number; claim: number; graph: number }>> = []
	const fresh = (key: string, finish: boolean): Spec => ({
		key,
		due: now,
		hold: Option.none(),
		claims: 0,
		retried: Option.none(),
		attempts: 0,
		reclaims: 0,
		result: Option.none(),
		finish
	})
	const settle = () => {
		const children = Arr.filter(steps, (step) => !step.finish)
		const finishes = Arr.filter(steps, (step) => step.finish)
		if (
			Arr.isReadonlyArrayEmpty(finishes) &&
			Arr.every(children, (step) => Option.isSome(step.result))
		) {
			steps.push(fresh(stepText({ _tag: "FinishStep", scope }), true))
		}
		if (Arr.some(finishes, (step) => Option.isSome(step.result))) {
			finished = true
		}
	}
	const end = (step: Spec, token: Option.Option<number>, report: Option.Option<Report>) => {
		step.result = Option.some({ token, report })
		step.hold = Option.none()
		settle()
	}
	const answer = (result: Answered<Refusal>) => Effect.succeed(result)
	return {
		admit: () => {
			if (admitted) {
				return answer(refused("unchanged"))
			}
			admitted = true
			graph += 1
			if (graph > 1) {
				notice("readmitted")
			}
			finished = false
			steps = Arr.map(ordinals(flat.steps), (ordinal) =>
				fresh(stepText({ _tag: "StartStep", scope, ordinal }), false)
			)
			settle()
			return answer(took)
		},
		claim: () => {
			const live = Arr.filter(
				steps,
				(step) => Option.isNone(step.result) && Option.exists(step.hold, (hold) => hold.until > now)
			)
			if (live.length >= flat.width) {
				return answer(refused("at-width"))
			}
			const due = Arr.sort(
				Arr.filter(
					steps,
					(step) =>
						Option.isNone(step.result) &&
						Option.match(step.hold, {
							onNone: () => step.due <= now,
							onSome: (hold) => hold.until <= now
						})
				),
				BY_DUE
			)
			return Option.match(Arr.head(due), {
				onNone: () => answer(refused("idle")),
				onSome: (step) => {
					const reclaims = step.reclaims + (Option.isSome(step.hold) ? 1 : 0)
					if (reclaims >= flat.ceilings.reclaims) {
						end(step, Option.none(), Option.none())
						return answer(took)
					}
					step.reclaims = reclaims
					step.hold = Option.some({ token: minted, claim: step.claims, until: now + flat.lease })
					leases.push({ key: step.key, token: minted, claim: step.claims, graph })
					step.claims += 1
					minted += 1
					return answer(took)
				}
			})
		},
		commit: ({ lease, report }) =>
			Option.match(Arr.get(leases, lease), {
				onNone: () => answer(refused("gone")),
				onSome: (held) =>
					Option.match(
						Arr.findFirst(steps, (step) => step.key === held.key),
						{
							onNone: () => answer(refused("gone")),
							onSome: (step) => {
								if (
									held.graph !== graph &&
									Option.exists(step.hold, (hold) => hold.claim === held.claim)
								) {
									notice("retired-lease")
								}
								if (Option.isSome(step.result)) {
									const landed = step.result.value
									return answer(
										refused(
											Option.contains(landed.token, held.token) &&
												Option.contains(landed.report, report)
												? "unchanged"
												: "lost"
										)
									)
								}
								if (Option.exists(step.hold, (hold) => hold.token === held.token)) {
									if (report === "output") {
										end(step, Option.some(held.token), Option.some(report))
										return answer(took)
									}
									if (step.attempts + 1 >= flat.ceilings.attempts) {
										end(step, Option.some(held.token), Option.some(report))
										return answer(took)
									}
									step.attempts += 1
									step.hold = Option.none()
									step.retried = Option.some({ token: held.token, at: now })
									step.due = now
									return answer(took)
								}
								const again =
									Option.isNone(step.hold) &&
									Option.exists(
										step.retried,
										(retried) =>
											retried.token === held.token && retried.at === now && report === "retry"
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
		stop: () => {
			if (!admitted) {
				return answer(refused("gone"))
			}
			if (finished) {
				return answer(refused("unchanged"))
			}
			Arr.forEach(steps, (step) => {
				if (Option.isNone(step.result)) {
					step.result = Option.some({ token: Option.none(), report: Option.none() })
					step.hold = Option.none()
				}
			})
			finished = true
			return answer(took)
		},
		retire: () => {
			if (!admitted) {
				return answer(refused("gone"))
			}
			if (!finished) {
				return answer(refused("live"))
			}
			admitted = false
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
	"stop",
	"retire"
]

const flatGen: Gen<Flat> = (source) => ({
	width: source.draw(int(1, 2)),
	steps: source.draw(int(0, 3)),
	lease: source.draw(int(1, 3)),
	ceilings: {
		attempts: source.draw(int(1, 3)),
		waits: 0,
		reclaims: source.draw(int(1, 3))
	}
})

/** A flat program and a command program over the ledger under `rules`, a swarm of the commands on. */
const programsOf = (rules: Rules) => (source: Source) => {
	const flat = source.draw(flatGen)
	const mix = source.draw(swarm(COMMANDS))
	return { flat, steps: source.draw(program(flatMachine(flat, rules), { min: 1, max: 40 }, mix)) }
}

describe("the ledger against the laws' own statement", () => {
	it.effect(
		"every command a worker, the clock and an operator make is answered as the specification of a flat program says",
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
								"claim accepted",
								"claim refused at-width",
								"claim refused idle",
								"commit accepted",
								"commit refused lost",
								"commit refused unchanged",
								"commit refused gone",
								"stop accepted",
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

	it.effect(
		"the specification catches a commit fenced on its attempt number, not its token",
		(ctx) =>
			caught(
				explore(
					exploration({
						suite: "planted: fence on the attempt",
						draw: drawn(programsOf(fenceOnAttempt.rules)),
						coverage: required<"retired-lease">(["retired-lease"], {
							cases: 800,
							sense: notesOnly
						}),
						runs: 400,
						shrink: 40,
						oracle: {
							kind: "second-implementation",
							name: "a flat program's ledger as the laws state it, against a ledger fenced on the attempt"
						}
					}),
					(sketch, c: Case<Toward>) =>
						Effect.asVoid(
							runProgram(
								flatMachine(sketch.flat, fenceOnAttempt.rules),
								specOf(sketch.flat, (seen) => c.note(seen)),
								sketch.steps
							)
						)
				)
			).pipe(Effect.provideServiceEffect(Run, runOfTest(ctx)))
	)
})
