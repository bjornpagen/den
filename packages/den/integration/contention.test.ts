import { holderOf, instantOf } from "@bjornpagen/den/runtime/identity"
import type { HoldRow } from "@bjornpagen/den/runtime/ledger"
import { giveBack, take } from "@bjornpagen/den/runtime/seats"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, HashMap, Option, Ref } from "effect"
import { pool } from "#integration/slice/flows.ts"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { openLedgers, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * Exact seats: the Pool holds two seats and a batch, admitted with its root, makes five squares eligible at once. Five
 * sessions, one per square, each take a seat of the Pool and give it back, in an interleaving drawn from the case's
 * tape, every move of each in flight beside the others'; some take under a lease already lapsed, which another taker
 * frees and takes over in one call. Then the batch runs to its end. No two live holds ever share a seat, so never more
 * than two hold a seat at once; a take that finds no seat free takes none; a standing lease is never taken over; a
 * lapsed hold given back after it was taken over frees nothing of its taker's; and every seat is free again at the end.
 *
 * Oracle (postgresql): each seat's chain of turns, a turn keyed by `(resource, seat, turn)`, contained in its
 * predecessor's `Freed`, and checked below the Pool's count, read back as the live holds after every move, against the
 * holds each session took, over interleavings drawn by the testing library's `drawn` strategy.
 */

type Session = "s0" | "s1" | "s2" | "s3" | "s4"
type Move = "take" | "give"
type Outcome = "held" | "full" | "given" | "idle"

type Feature = "a full pool" | "both seats held" | "a seat taken again" | "a lapsed seat taken over"

const sessions: ReadonlyArray<Session> = ["s0", "s1", "s2", "s3", "s4"]

/** A case: the holders' nonce, and which sessions take under a lease already lapsed. */
interface Takers {
	readonly copy: number
	readonly lapsed: ReadonlyArray<boolean>
}

const takers: Gen<Takers> = (source) => ({
	copy: source.draw(int(0, 9_999)),
	lapsed: Arr.map(sessions, () => source.draw(boolean))
})

/** Whether two holds are one turn of one seat. */
const sameTurn = (a: HoldRow, b: HoldRow): boolean =>
	a.resource === b.resource && a.seat === b.seat && a.turn === b.turn

/**
 * Never seats more than two of five eligible squares at once, in any drawn interleaving.
 *
 * Budget: its suite's count before the conversion (exact seats: 8 independent cases and 8 steered, Vitest at den
 * dc5bd11).
 */
export const neverSeatsMoreThanTwoOfFiveEligibleSquaresAtOnce = property.explore(takers, {
	needs: { slice: sliceCase },
	situations: [
		"a full pool",
		"both seats held",
		"a seat taken again",
		"a lapsed seat taken over"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(drawnTakers) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { fan, ledgers } = yield* openLedgers
						const ledger = fan.ledger
						const batch = "contended"
						const at = yield* fan.ledger.now
						const requested = yield* fan.request.FanRun(batch, { batch, size: 5n })
						assert.ok(requested.fresh)
						const ends = instantOf(Number(at) + longestLeaseMillis)
						const admitted = yield* serve(
							ledgers,
							{ _tag: "Admit", flow: FlowName.make("Fan"), scope: requested.scope },
							ends
						)
						const squares = admitted.ending.kind === "admitted" ? admitted.ending.spawned.steps : []
						assert.equal(squares.length, 5)
						const pairs = yield* Effect.forEach(
							Arr.zip(Arr.zip(sessions, drawnTakers.lapsed), squares),
							([[session, lapsed], square]) =>
								Effect.map(
									holderOf(square.step, 1, drawnTakers.copy),
									(holder) => [session, { holder, lapsed }] as const
								)
						)
						const takersOf = HashMap.fromIterable(pairs)
						const held = yield* Ref.make(HashMap.empty<Session, ReadonlyArray<HoldRow>>())
						const peak = yield* Ref.make(0)
						const seen = yield* Ref.make(0)
						const holders = Arr.map(pairs, ([, t]) => t.holder)
						/** What every move leaves: at most one live hold a seat, each a taker's. */
						const exact = Effect.gen(function* () {
							const live = yield* ledger.coordination.holds
							yield* Ref.update(peak, (p) => Math.max(p, live.length))
							assert.ok(live.length <= 2)
							assert.equal(Arr.dedupeWith(live, (a, b) => a.seat === b.seat).length, live.length)
							assert.ok(Arr.every(live, (row) => Arr.contains(holders, row.holder)))
							return live
						})
						const run = (session: Session, move: Move): Effect.Effect<Outcome> =>
							Effect.gen(function* () {
								const before = yield* Ref.get(held)
								const mine = Option.getOrElse(HashMap.get(before, session), () => [])
								const taker = Option.getOrThrow(HashMap.get(takersOf, session))
								if (move === "give") {
									if (Arr.isReadonlyArrayEmpty(mine)) {
										return "idle" satisfies Outcome
									}
									yield* giveBack(ledger, mine)
									yield* Ref.update(held, HashMap.remove(session))
									yield* exact
									return "given" satisfies Outcome
								}
								const instant = yield* ledger.now
								const until = instantOf(
									taker.lapsed ? Number(instant) - 1 : Number(instant) + longestLeaseMillis
								)
								const taken = yield* take(ledger, [pool], taker.holder, until, instant)
								if (Option.isSome(taken)) {
									yield* Ref.update(seen, (n) => n + 1)
									yield* Ref.update(held, HashMap.set(session, taken.value))
									if (Arr.some(taken.value, (hold) => hold.turn > 0n)) {
										const over = Arr.some(taken.value, (hold) =>
											Arr.some(Arr.flatten(HashMap.toValues(before)), (other) =>
												sameTurn(other, { ...hold, turn: hold.turn - 1n })
											)
										)
										if (over) {
											c.note("a lapsed seat taken over")
										}
									}
								}
								const live = yield* exact
								if (!taker.lapsed) {
									assert.ok(
										Arr.every(
											Option.getOrElse(taken, () => []),
											(hold) => Arr.some(live, (row) => sameTurn(row, hold))
										)
									)
								}
								return Option.isNone(taken)
									? ("full" satisfies Outcome)
									: ("held" satisfies Outcome)
							}).pipe(Effect.orDie)
						const judge = (record: Interleaving<Session, Move, Outcome, never, never, never>) =>
							Effect.sync(() => {
								const outcomes = Arr.flatMap(record.order, (r) =>
									Option.toArray(
										Option.flatMap(r.result, (result) =>
											result.ended.kind === "ended"
												? Option.some(result.ended.outcome)
												: Option.none()
										)
									)
								)
								if (Arr.contains(outcomes, "full")) {
									c.note("a full pool")
								}
							})
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
								release: (session) =>
									Effect.flatMap(Ref.get(held), (map) =>
										giveBack(
											ledger,
											Option.getOrElse(HashMap.get(map, session), () => [])
										)
									),
								commute: () => false,
								onWait: () => "wait",
								read: () => Effect.die("the race reads no final state")
							},
							{
								sessions: {
									s0: { moves: ["take", "give"], after: Option.none() },
									s1: { moves: ["take", "give"], after: Option.none() },
									s2: { moves: ["take", "give"], after: Option.none() },
									s3: { moves: ["take", "give"], after: Option.none() },
									s4: { moves: ["take", "give"], after: Option.none() }
								},
								exclusive: [],
								state: Option.none()
							},
							{ kind: "drawn", nature: c },
							judge
						)
						if ((yield* Ref.get(peak)) === 2) {
							c.note("both seats held")
						}
						if ((yield* Ref.get(seen)) > 2) {
							c.note("a seat taken again")
						}
						yield* ringOnAndDrain(ledgers, admitted)
						const left = yield* ledger.coordination.holds
						assert.deepEqual(left, [])
					}),
					services
				)
			),
	oracle: {
		kind: "postgresql",
		name: "each seat's chain of turns, read as the live holds after every move of five takers of two seats"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\tconst deadline = instantOf(Number(ends) - margin)",
			replacement: "\t\tconst deadline = instantOf(margin - Number(ends))",
			why: "Operator mutant (operand-swap) at packages/den/src/runtime/turn.ts:819 in serveStep: `Number(ends) - margin` becomes `margin - Number(ends)`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
