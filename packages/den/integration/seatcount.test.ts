import { lower } from "@bjornpagen/den/lower/fragment"
import { atOnce, delayOf, instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, finite, type Gen } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option, String as Str } from "effect"
import { fan } from "#integration/slice/flows.ts"
import { liveSliceCase, migrateIn, openLedgers, sliceCopyNeed } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A resource's seat count is a closed relation of the flow's declaration, and every live hold's seat is checked below
 * it, on the seat level the slice's schema states over its own: the live holds, a derived relation of the claims' holds
 * whose attempt has neither ended nor held its step's result, under a rule over a query. Lowering the Pool from two
 * seats to one is a migration that grizzle validates against the live holds, so it is admitted exactly when no live
 * hold sits at seat 1: an ended attempt's hold stays a row until its graph retires, and it is no live hold.
 *
 * Oracle (postgresql): `grizzle migrate` of the slice to a copy of it whose Pool holds one seat, over a database where
 * one square's claim holds seat 0 and seat 1 was never taken, is held by another square's claim, or was held and its
 * attempt ended: admitted, or refused by the seat law the existing rows violate (its validation's
 * integrity_constraint_violation, SQLSTATE 23000, naming the law).
 */

/** What became of seat 1 after seat 0 was taken: never taken, or taken and then held or given back. */
type Seat = "never taken" | "held" | "freed"

/**
 * Seat 1's fate, each of the three a case of its own: whether it was taken after seat 0, and only once it was, whether
 * its hold was then given back.
 */
const seatOne: Gen<Seat> = (source) => {
	if (!source.draw(boolean)) {
		return "never taken"
	}
	return source.draw(boolean) ? "freed" : "held"
}

/** The fan-out flow lowered as a deploy that gave its Pool one seat declares it: every other count as it is. */
const oneSeat = (() => {
	const flow = lower(fan)
	return {
		...flow,
		seats: Option.map(flow.seats, (seats) => ({
			...seats,
			counts: {
				...seats.counts,
				rows: Arr.map(seats.counts.rows, (row) => ({ ...row, count: 1n }))
			}
		}))
	}
})()

/** The slice with its Pool lowered to one seat, which its validation holds every live hold's seat below. */
const loweredSlice = sliceCopyNeed(
	"den seat counts: the slice lowered to one Pool seat",
	"fan",
	oneSeat
)

/**
 * Admits lowering a seat count exactly when no live hold sits at or above the new count.
 *
 * Box: its suite's, every case of it.
 */
export const admitsLoweringASeatCountExactlyWhenNoLiveHoldSitsAtOrAboveTheNewCount =
	property.exhaust(finite(seatOne), {
		box: "seat 1 of the Pool's two, never taken, held or freed, beside seat 0 held",
		needs: { slice: liveSliceCase, loweredCopy: loweredSlice },
		situations: ["never taken", "held", "freed"] satisfies ReadonlyArray<Reached<Seat>>,
		check:
			({ slice, loweredCopy }, c: Case<Seat>) =>
			(seat) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							c.note(seat)
							const { fan: ledgers, ledgers: all } = yield* openLedgers
							const ledger = ledgers.ledger
							const at = yield* ledger.now
							const ends = instantOf(Number(at) + longestLeaseMillis)
							const requested = yield* ledgers.request.FanRun("seat counts", {
								batch: "seat counts",
								size: 2n
							})
							const admitted = yield* serve(
								all,
								{ _tag: "Admit", flow: FlowName.make("Fan"), scope: requested.scope },
								ends
							)
							const squares =
								admitted.ending.kind === "admitted" ? admitted.ending.spawned.steps : []
							const takeOne = (ordinal: number) =>
								Effect.gen(function* () {
									const square = Arr.getUnsafe(squares, ordinal)
									const attempt = yield* ledger.claim({
										step: square.step,
										root: requested.scope,
										budget: delayOf(longestLeaseMillis),
										seats: [{ resource: "Pool", seat: BigInt(ordinal) }],
										lapsed: []
									})
									return { step: square.step, attempt }
								})
							yield* takeOne(0)
							if (seat !== "never taken") {
								const second = yield* takeOne(1)
								if (seat === "freed") {
									yield* ledger.retry({
										step: second.step,
										root: requested.scope,
										attempt: second.attempt,
										delay: atOnce,
										why: "transient"
									})
								}
							}
							const live = yield* ledger.holds
							assert.deepEqual<ReadonlyArray<bigint>>(
								Arr.map(live, (hold) => hold.seat),
								seat === "held" ? [0n, 1n] : [0n]
							)
							const copy = yield* loweredCopy
							const migrated = yield* Effect.result(migrateIn(copy))
							assert.deepEqual(
								migrated._tag === "Success"
									? "admitted"
									: Str.includes("SQLSTATE 23000")(migrated.failure.message) &&
										  Str.includes("fan_seat_below_count")(migrated.failure.message)
										? "refused by the seat law"
										: migrated.failure.message,
								seat === "held" ? "refused by the seat law" : "admitted"
							)
						}),
						services
					)
				),
		oracle: {
			kind: "postgresql",
			name: "grizzle migrate to one Pool seat, validating each live hold's seat below the count"
		},
		kept: [],
		kills: [
			{
				file: "packages/den/src/lower/fragment.ts",
				original: "\tterms: Arr.map(terms, (field) => ({ field, pred: false }))",
				replacement: "\tterms: Arr.map(terms, (field) => ({ field, pred: true }))",
				why: "Operator mutant (boolean) at packages/den/src/lower/fragment.ts:324 in sideOf: `false` becomes `true`; the property fails (lane CATCH, den 9cffaba)."
			},
			{
				file: "packages/den/src/lower/print.ts",
				original: `\t\t.where(r.not(\${l.prefix}Ended, { step, root, attempt }), r.not(\${l.prefix}Held, { step, root, attempt }))\n`,
				replacement: `\t\t.where(r.not(\${l.prefix}Held, { step, root, attempt }))\n`,
				why: "The seat level checks every hold whose step has no result, ended attempts' included, so a hold given back still counts against the lowered seat count and the freed case is refused."
			}
		]
	})
