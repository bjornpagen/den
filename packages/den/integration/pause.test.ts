import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"
import { FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, boolean, finite, type Gen, int } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { openLedgers, sliceCase } from "#integration/support/slice.ts"

/**
 * A pause is a chain of turns: `Paused(target, turn)`, each turn after the first contained in its predecessor's
 * `Resumed`, so a target holds at most one live pause. Two operators pause and resume the Pool, each its own moves in
 * order, every move of each in flight beside the other's: after every move the Pool holds at most one live pause, and
 * at the end it is paused exactly as some serial order of the two operators' moves leaves it, which is the last move of
 * one of them (paused when both last paused, resumed when both last resumed). A pause and a resume made one after the
 * other then pause it and resume it again.
 *
 * Oracle (specification): a pause is a flag set and a resume a flag cleared, each taking effect at once, against the
 * coordinator role's live pauses read back, over interleavings drawn by the testing library's `drawn` strategy.
 */

type Session = "a" | "b"
type Move = "pause" | "resume"

type Feature = "both last paused" | "both last resumed" | "their last moves differ"

/** Each operator's moves, in order. */
interface Operators {
	readonly a: Arr.NonEmptyReadonlyArray<Move>
	readonly b: Arr.NonEmptyReadonlyArray<Move>
}

const moves: Gen<Arr.NonEmptyReadonlyArray<Move>> = (source) => {
	const first: Move = source.draw(boolean) ? "pause" : "resume"
	const rest = source.draw(array(boolean, { min: 0, max: 2 }))
	return [first, ...Arr.map(rest, (paused): Move => (paused ? "pause" : "resume"))]
}

const operators: Gen<Operators> = (source) => ({ a: source.draw(moves), b: source.draw(moves) })

const target = "Pool"

/**
 * Pauses and resumes a target as one live turn at a time, in any drawn interleaving.
 *
 * Budget: its suite's count before the conversion (pauses: 12 independent cases and 9 steered, Vitest at den dc5bd11).
 */
export const pausesAndResumesATargetAsOneLiveTurnAtATime = property.explore(operators, {
	needs: { slice: sliceCase },
	situations: [
		"both last paused",
		"both last resumed",
		"their last moves differ"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(drawnOperators) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { fan } = yield* openLedgers
						const ledger = fan.ledger
						const live = Effect.map(ledger.coordination.paused, (rows) =>
							Arr.filter(rows, (row) => row.target === target)
						)
						const paused = Effect.map(live, (rows) => {
							assert.ok(rows.length <= 1)
							return Arr.isReadonlyArrayNonEmpty(rows)
						})
						yield* ledger.coordination.resume(target)
						const cleared = yield* paused
						assert.equal(cleared, false)
						const run = (_session: Session, move: Move): Effect.Effect<Move> =>
							Effect.gen(function* () {
								yield* move === "pause"
									? ledger.coordination.pause(target)
									: ledger.coordination.resume(target)
								yield* paused
								return move
							}).pipe(Effect.orDie)
						const lastA = Arr.lastNonEmpty(drawnOperators.a)
						const lastB = Arr.lastNonEmpty(drawnOperators.b)
						c.note(
							lastA !== lastB
								? "their last moves differ"
								: lastA === "pause"
									? "both last paused"
									: "both last resumed"
						)
						const judge = (_record: Interleaving<Session, Move, Move, never, never, never>) =>
							Effect.gen(function* () {
								const ended = yield* paused
								assert.ok(Arr.contains([lastA, lastB], ended ? "pause" : "resume"))
							}).pipe(Effect.orDie)
						yield* interleave(
							{
								reset: Effect.void,
								run,
								waitOf: () => Effect.never,
								quiesce: () => Effect.void,
								outcome: (_move, ended) => ({
									key: ended.kind === "ended" ? ended.outcome : "cancelled",
									session: "continues"
								}),
								release: () => Effect.void,
								commute: () => false,
								onWait: () => "wait",
								read: () => Effect.die("the judgment reads the live pauses itself")
							},
							{
								sessions: {
									a: { moves: drawnOperators.a, after: Option.none() },
									b: { moves: drawnOperators.b, after: Option.none() }
								},
								exclusive: [],
								state: Option.none()
							},
							{ kind: "drawn", nature: c },
							judge
						)
						yield* ledger.coordination.pause(target)
						const pausedAfter = yield* paused
						assert.ok(pausedAfter)
						yield* ledger.coordination.resume(target)
						const resumedAfter = yield* paused
						assert.equal(resumedAfter, false)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a flag each pause sets and each resume clears, at once, read back as the live pauses"
	},
	budget: { runs: 12, steered: 9 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/seats.ts",
			original: "\t\t\tif (Arr.some(live, (row) => row.target === target)) {",
			replacement: "\t\t\tif (Arr.some(live, (row) => false)) {",
			why: "Operator mutant (boolean-return) at packages/den/src/runtime/seats.ts:225 in pauseIn: `row.target === target` becomes `false`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})

type Refusal = "a pause of an unknown name" | "a resume of an unknown name"

/** A name an operator could mean for Fan's Pool, which is no target of Fan's: its Pool resource and its FanRun root. */
const unknown = "Pol"

/**
 * A pause or a resume of a name that is no resource and no root kind of its flow is refused, naming the flow and the
 * name, before anything is read or written, where a pause of it wrote no row and a resume of it found nothing live, and
 * each reported success, leaving the target the operator meant as it was.
 *
 * Oracle (specification): the call fails with UnknownPauseTarget, Fan's and the name's, and the coordinator role's
 * live pauses read back are none, as before it.
 *
 * Box: its suite's, every case of it (a pause, and a resume, of a name that is no target of Fan's).
 */
export const refusesAPauseOrAResumeOfANameNoTargetHolds = property.exhaust(finite(int(0, 1)), {
	box: "a pause, and a resume, of a name that is no target of Fan's",
	needs: { slice: sliceCase },
	situations: ["a pause of an unknown name", "a resume of an unknown name"] satisfies ReadonlyArray<
		Reached<Refusal>
	>,
	check:
		({ slice }, c: Case<Refusal>) =>
		(move) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { fan } = yield* openLedgers
						const coordination = fan.ledger.coordination
						c.note(move === 0 ? "a pause of an unknown name" : "a resume of an unknown name")
						const refused = yield* (
							move === 0 ? coordination.pause(unknown) : coordination.resume(unknown)
						).pipe(
							Effect.as(Option.none<{ readonly flow: FlowName; readonly target: string }>()),
							Effect.catchTag("UnknownPauseTarget", (refusal: UnknownPauseTarget) =>
								Effect.succeedSome({ flow: refusal.flow, target: refusal.target })
							)
						)
						assert.deepEqual(refused, Option.some({ flow: FlowName.make("Fan"), target: unknown }))
						const live = yield* coordination.paused
						assert.deepEqual(live, [])
					}).pipe(Effect.orDie),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "an unknown name's pause and resume each fail with UnknownPauseTarget, the live pauses read back unchanged"
	},
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/fan.binding.ts",
			original: "\t\tpause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),",
			replacement:
				'\t\tpause: (target) => Effect.catchTag(Effect.flatMap(pausableOf(target), pauseIn(pauseChains)), "UnknownPauseTarget", () => Effect.void),',
			why: "A pause of a name no target holds reports success having written nothing, as the binding's pause did when it dropped a row whose target was no handle of the flow's Pausable roster."
		},
		{
			file: "packages/den/integration/slice/generated/fan.binding.ts",
			original: "\t\tresume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))",
			replacement:
				'\t\tresume: (target) => Effect.catchTag(Effect.flatMap(pausableOf(target), resumeIn(pauseChains)), "UnknownPauseTarget", () => Effect.void)',
			why: "A resume of a name no target holds reports success, as the seat module's resume did when it found no live pause of the name."
		}
	]
})
