import { pause, resume } from "@bjornpagen/den/runtime/seats"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { array, boolean, type Gen } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option } from "effect"
import { openLedgers, sliceLayer } from "#integration/support/slice.ts"
import { caseHangMillis } from "#test/support/suites.ts"

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

layer(sliceLayer)("pauses", (it) => {
	it.effect(
		"pauses and resumes a target as one live turn at a time, in any drawn interleaving",
		(ctx) =>
			searched(
				ctx,
				explore(
					{
						suite: "pauses",
						oracle: {
							kind: "specification",
							name: "a flag each pause sets and each resume clears, at once, read back as the live pauses"
						},
						draw: drawn(operators),
						literal: Formatter.format,
						coverage: required<Feature>(
							["both last paused", "both last resumed", "their last moves differ"],
							{ cases: 9, sense: notesOnly }
						),
						kept: [],
						runs: 12,
						shrink: boundedShrink(4),
						steerEvery: 3,
						caseHang: caseHangMillis
					},
					(drawnOperators, c) =>
						Effect.gen(function* () {
							const { fan } = yield* openLedgers
							const ledger = fan.ledger
							const live = Effect.map(ledger.coordination.paused, (rows) =>
								Arr.filter(rows, (row) => row.target === target)
							)
							const paused = Effect.map(live, (rows) => {
								assert.isAtMost(rows.length, 1)
								return Arr.isReadonlyArrayNonEmpty(rows)
							})
							yield* resume(ledger, target)
							const cleared = yield* paused
							assert.isFalse(cleared)
							const run = (_session: Session, move: Move): Effect.Effect<Move> =>
								Effect.gen(function* () {
									yield* move === "pause" ? pause(ledger, target) : resume(ledger, target)
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
									assert.isTrue(Arr.contains([lastA, lastB], ended ? "pause" : "resume"))
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
							yield* pause(ledger, target)
							const pausedAfter = yield* paused
							assert.isTrue(pausedAfter)
							yield* resume(ledger, target)
							const resumedAfter = yield* paused
							assert.isFalse(resumedAfter)
						})
				)
			)
	)
})
