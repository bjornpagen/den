import { atOnce, delayOf, instantOf, type StepKey } from "@bjornpagen/den/runtime/identity"
import { seatsFor } from "@bjornpagen/den/runtime/seats"
import { serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { pool, poolSeats } from "#integration/slice/flows.ts"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A seat given back rings the steps waiting on it, so a fan-out on a resource drains at the pace its seats free, never
 * at the census's. A batch of squares on the two-seat Pool is admitted; two of its squares are claimed by hand with
 * both seats, as two turns still running would hold them; every other square is served and ends waiting on seats,
 * ringing nothing. Then each held square's attempt ends, a wait that spends nothing and gives its seat back, and its
 * next attempt is served, whose end rings on what it made eligible; the transport is drained after each, and no census
 * ticks and no relay runs.
 *
 * Oracle (specification): every square ends done, the batch's tally counts all of them and sums their squares,
 * n(n + 1)(2n + 1) / 6, the root finishes done, and every seat is free again; each square that found no seat ended
 * waiting on seats and rang nothing.
 */

type Feature =
	| "a square waiting on a seat"
	| "more waiters than seats"
	| "a waiter rung by a seat given back"

interface Run {
	readonly size: number
}

const runs: Gen<Run> = (source) => ({ size: source.draw(int(poolSeats + 1, poolSeats + 5)) })

/**
 * Drains a seat-bound fan-out with no census: each seat given back rings a waiter.
 *
 * Budget: provisional, the fan-out flow's own (10 independent cases and 10 steered), over batches of one to five
 * squares more than the Pool's seats.
 */
export const aSeatGivenBackRingsTheStepsWaitingOnIt = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"a square waiting on a seat",
		"more waiters than seats",
		"a waiter rung by a seat given back"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { fan, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const ledger = fan.ledger
						const flow = FlowName.make("Fan")
						const batch = `waited-${run.size}`
						const requested = yield* fan.request.FanRun(batch, { batch, size: BigInt(run.size) })
						const at = yield* ledger.now
						const ends = instantOf(Number(at) + longestLeaseMillis)
						const admitted = yield* serve(
							ledgers,
							{ _tag: "Admit", flow, scope: requested.scope },
							ends
						)
						const squares = admitted.ending.kind === "admitted" ? admitted.ending.spawned.steps : []
						assert.equal(squares.length, run.size)
						const root = requested.scope
						const wakeOf = (step: StepKey, attempt: bigint) =>
							({ _tag: "Step", flow, step, attempt: AttemptNumber.make(Number(attempt)) }) as const
						const holders = Arr.take(squares, poolSeats)
						const held = yield* Effect.forEach(holders, (square) =>
							Effect.gen(function* () {
								const live = yield* ledger.holds
								const instant = yield* ledger.now
								const picked = Option.getOrThrow(seatsFor([pool], live, instant))
								const attempt = yield* ledger.claim({
									step: square.step,
									root,
									budget: delayOf(longestLeaseMillis),
									seats: picked.seats,
									lapsed: []
								})
								return { step: square.step, attempt }
							})
						)
						const waiting = Arr.drop(squares, poolSeats)
						if (waiting.length > poolSeats) {
							c.note("more waiters than seats")
						}
						yield* Effect.forEach(waiting, (square) =>
							Effect.map(serve(ledgers, wakeOf(square.step, 0n), ends), (waited) => {
								assert.deepEqual(
									[
										waited.ending.kind === "waiting" ? waited.ending.why : waited.ending.kind,
										waited.onward
									],
									["seats", []]
								)
								c.note("a square waiting on a seat")
							})
						)
						yield* Effect.forEach(held, (holder, index) =>
							Effect.gen(function* () {
								yield* ledger.retry({
									step: holder.step,
									root,
									attempt: holder.attempt,
									delay: atOnce,
									why: "transient"
								})
								const again = yield* serve(ledgers, wakeOf(holder.step, holder.attempt + 1n), ends)
								assert.equal(again.ending.kind, "done")
								if (index === 0 && Arr.isReadonlyArrayNonEmpty(again.onward)) {
									c.note("a waiter rung by a seat given back")
								}
								yield* ringOnAndDrain(ledgers, again)
							})
						)
						const tallies = yield* rows(app.workload.tallies.once({ params: {}, facts: {} }))
						const n = BigInt(run.size)
						assert.deepEqual(
							Arr.map(
								Arr.filter(tallies, (t) => t.batch === batch),
								(t) => ({ batch: t.batch, count: t.count, total: t.total })
							),
							[{ batch, count: n, total: (n * (n + 1n) * (2n * n + 1n)) / 6n }]
						)
						const finishes = yield* rows(app.workload.fanFinishes.once({ params: {}, facts: {} }))
						assert.ok(Arr.some(finishes, (f) => f.scope === root && f.outcome === "done"))
						const left = yield* ledger.holds
						assert.deepEqual(left, [])
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "every square of a seat-bound batch done with no census tick, its tally whole, every seat given back"
	},
	budget: { runs: 10, steered: 10 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original:
				"\treturn Effect.zipWith(own, waitersOf(ledger, freed), (mine, waiters) => [...mine, ...waiters])",
			replacement: "\treturn Effect.zipWith(own, waitersOf(ledger, freed), (mine) => mine)",
			why: "A seat given back rings no waiter: every square that found no seat waits for the census, and with no tick the batch never finishes."
		}
	]
})
