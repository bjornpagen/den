import { caseHang, longestLeaseMillis } from "@bjornpagen/den/limits"
import { holderOf, instantOf } from "@bjornpagen/den/runtime/identity"
import type { HoldRow } from "@bjornpagen/den/runtime/ledger"
import { giveBack, take } from "@bjornpagen/den/runtime/seats"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, HashMap, Option, Ref } from "effect"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { nonce, openLedgers, sliceLayer } from "#integration/support/slice.ts"

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

layer(sliceLayer)("exact seats", (it) => {
	it.effect(
		"never seats more than two of five eligible squares at once, in any drawn interleaving",
		(ctx) =>
			searched(
				ctx,
				explore(
					{
						suite: "exact seats",
						oracle: {
							kind: "postgresql",
							name: "each seat's chain of turns, read as the live holds after every move of five takers of two seats"
						},
						draw: drawn(takers),
						literal: Formatter.format,
						coverage: required<Feature>(
							["a full pool", "both seats held", "a seat taken again", "a lapsed seat taken over"],
							{ cases: 8, sense: notesOnly }
						),
						kept: [],
						runs: 8,
						shrink: boundedShrink(4),
						steerEvery: 4,
						caseHang
					},
					(drawnTakers, c) =>
						Effect.gen(function* () {
							const { fan, ledgers } = yield* openLedgers
							const ledger = fan.ledger
							const batch = `contended-${yield* nonce}`
							const at = yield* fan.ledger.now
							const requested = yield* fan.request.FanRun(batch, at, { batch, size: 5n })
							assert.isTrue(requested.fresh)
							const ends = instantOf(Number(at) + longestLeaseMillis.value)
							const admitted = yield* serve(
								ledgers,
								{ _tag: "Admit", flow: FlowName.make("Fan"), scope: requested.scope },
								ends
							)
							const squares =
								admitted.ending.kind === "admitted" ? admitted.ending.spawned.steps : []
							assert.strictEqual(squares.length, 5)
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
								assert.isAtMost(live.length, 2)
								assert.strictEqual(
									Arr.dedupeWith(live, (a, b) => a.seat === b.seat).length,
									live.length
								)
								assert.isTrue(Arr.every(live, (row) => Arr.contains(holders, row.holder)))
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
										taker.lapsed ? Number(instant) - 1 : Number(instant) + longestLeaseMillis.value
									)
									const taken = yield* take(ledger, ["Pool"], taker.holder, until, instant)
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
										assert.isTrue(
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
									waitOf: () => Effect.succeedNone,
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
							assert.deepStrictEqual(left, [])
						})
				)
			)
	)
})
