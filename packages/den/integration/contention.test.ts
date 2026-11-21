import { atOnce, delayOf, instantOf, type StepKey } from "@bjornpagen/den/runtime/identity"
import type { SeatAt } from "@bjornpagen/den/runtime/ledger"
import { seatsFor, seatTaken } from "@bjornpagen/den/runtime/seats"
import type { Settled } from "@bjornpagen/den/runtime/settled"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, type Gen } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, HashMap, Option, Ref } from "effect"
import { TestClock } from "effect/testing"
import { pool } from "#integration/slice/flows.ts"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { openLedgers, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * Exact seats: the Pool holds two seats and a batch, admitted with its root, makes five squares eligible at once. Five
 * sessions, one per square, each claim its square's first attempt with a seat of the Pool, the claim and its hold one
 * write, and end the attempt, which gives the seat back, in an interleaving drawn from the case's tape, every move of
 * each in flight beside the others'; some claim under a lease of no time, which lapses while they hold it as the
 * suite's clock moves past it, and which another claim ends and takes over in its own write. Then the batch runs to its end. No two live holds ever share a seat, so never more than two hold a seat
 * at once; a claim that finds no seat free claims nothing; a standing lease is never taken over; a lapsed attempt ended
 * after it was taken over frees nothing of its taker's; and every seat is free again at the end.
 *
 * Oracle (postgresql): the live holds, each a claim's hold whose attempt has neither ended nor held its step's result,
 * keyed by their seat and checked below the Pool's count, read back after every move, against the claims each session
 * made, over interleavings drawn by the testing library's `drawn` strategy.
 */

type Session = "s0" | "s1" | "s2" | "s3" | "s4"
type Move = "take" | "give"
type Outcome = "held" | "full" | "given" | "idle"

type Feature = "a full pool" | "both seats held" | "a seat taken again" | "a lapsed seat taken over"

const sessions: ReadonlyArray<Session> = ["s0", "s1", "s2", "s3", "s4"]

/** A case: which sessions claim under a lease that lapses while they hold it. */
interface Takers {
	readonly lapsed: ReadonlyArray<boolean>
}

const takers: Gen<Takers> = (source) => ({
	lapsed: Arr.map(sessions, () => source.draw(boolean))
})

/** A session's claim: its square's attempt and the seats it holds. */
interface Holding {
	readonly attempt: bigint
	readonly seats: ReadonlyArray<SeatAt>
}

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
						const takersOf = HashMap.fromIterable(
							Arr.map(
								Arr.zip(Arr.zip(sessions, drawnTakers.lapsed), squares),
								([[session, lapsed], square]) => [session, { step: square.step, lapsed }] as const
							)
						)
						const steps: ReadonlyArray<StepKey> = Arr.map(squares, (square) => square.step)
						const root = requested.scope
						const held = yield* Ref.make(HashMap.empty<Session, Holding>())
						/** A claim with whether it took over a lapsed hold. */
						type Taken = Holding & { readonly over: boolean }
						const peak = yield* Ref.make(0)
						const seen = yield* Ref.make(0)
						/** What every move leaves: at most one live hold a seat, each a square's claim. */
						const exact = Effect.gen(function* () {
							const live = yield* ledger.holds
							yield* Ref.update(peak, (p) => Math.max(p, live.length))
							assert.ok(live.length <= 2)
							assert.equal(Arr.dedupeWith(live, (a, b) => a.seat === b.seat).length, live.length)
							assert.ok(Arr.every(live, (row) => Arr.contains(steps, row.step)))
							return live
						})
						/** Ends a session's attempt, which gives its seats back. */
						const end = (step: StepKey, mine: Holding) =>
							ledger.retry({ step, root, attempt: mine.attempt, delay: atOnce, why: "transient" })
						/** Claims a session's square with a seat of the Pool, picked again from a fresh read when another takes it. */
						const claimSeat = (
							step: StepKey,
							lapsed: boolean
						): Effect.Effect<Option.Option<Taken>, Settled> =>
							Effect.gen(function* () {
								const live = yield* ledger.holds
								const instant = yield* ledger.now
								const picked = seatsFor([pool], live, instant)
								if (Option.isNone(picked)) {
									return Option.none()
								}
								const claimed = yield* Effect.result(
									ledger.claim({
										step,
										root,
										budget: lapsed ? atOnce : delayOf(longestLeaseMillis),
										seats: picked.value.seats,
										lapsed: Arr.map(picked.value.lapsed, (h) => ({
											step: h.step,
											root: h.root,
											attempt: h.attempt
										}))
									})
								)
								if (claimed._tag === "Success") {
									if (lapsed) {
										yield* TestClock.adjust(Duration.millis(1))
									}
									return Option.some({
										attempt: claimed.success,
										seats: picked.value.seats,
										over: Arr.isReadonlyArrayNonEmpty(picked.value.lapsed)
									})
								}
								if (seatTaken("Fan", claimed.failure)) {
									return yield* claimSeat(step, lapsed)
								}
								return yield* Effect.fail(claimed.failure)
							})
						const run = (session: Session, move: Move): Effect.Effect<Outcome> =>
							Effect.gen(function* () {
								const before = yield* Ref.get(held)
								const mine = HashMap.get(before, session)
								const taker = Option.getOrThrow(HashMap.get(takersOf, session))
								if (move === "give") {
									if (Option.isNone(mine)) {
										return "idle" satisfies Outcome
									}
									yield* end(taker.step, mine.value)
									yield* Ref.update(held, HashMap.remove(session))
									yield* exact
									return "given" satisfies Outcome
								}
								const taken = yield* claimSeat(taker.step, taker.lapsed)
								if (Option.isSome(taken)) {
									yield* Ref.update(seen, (n) => n + 1)
									yield* Ref.update(
										held,
										HashMap.set(session, { attempt: taken.value.attempt, seats: taken.value.seats })
									)
									if (taken.value.over) {
										c.note("a lapsed seat taken over")
									}
								}
								const live = yield* exact
								if (!taker.lapsed) {
									assert.ok(
										Arr.every(Option.toArray(taken), (mineNow) =>
											Arr.every(mineNow.seats, (seat) =>
												Arr.some(
													live,
													(row) =>
														row.step === taker.step &&
														row.attempt === mineNow.attempt &&
														row.seat === seat.seat
												)
											)
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
										Option.match(HashMap.get(map, session), {
											onNone: () => Effect.void,
											onSome: (mine) =>
												Effect.ignore(
													end(Option.getOrThrow(HashMap.get(takersOf, session)).step, mine)
												)
										})
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
						const left = yield* ledger.holds
						assert.deepEqual(left, [])
					}),
					services
				)
			),
	oracle: {
		kind: "postgresql",
		name: "the live holds keyed by their seat, read after every move of five claimers of two seats"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\tconst deadline = instantOf(Number(ends) - leaseMarginMillis)",
			replacement: "\t\tconst deadline = instantOf(leaseMarginMillis - Number(ends))",
			why: "Operator mutant (operand-swap) at packages/den/src/runtime/turn.ts:803 in serveStep: `Number(ends) - leaseMarginMillis` becomes `leaseMarginMillis - Number(ends)`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
