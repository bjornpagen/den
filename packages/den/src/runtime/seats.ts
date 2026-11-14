import type { CallError } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Order } from "effect"
import type { Holder, Instant, ScopeKey } from "#runtime/identity.ts"
import type { Coordination, ExclusiveRow, HoldRow, Ledger } from "#runtime/ledger.ts"

/**
 * The seat module: exact seats in grizzle's own work-queue shape (`Seat(resource, seat)`, a hold keyed by
 * `(resource, seat)` and contained in `Seat`), so no two holders share a seat key and a bound is never exceeded. A step
 * takes a seat of each resource it uses before its claim and gives them back after its last write; a scope takes its
 * exclusivity seat at its admission and gives it back once its finish has its result.
 *
 * At `a226cbac` every write here deletes, so den's coordination role certifies SERIALIZABLE and any call may meet
 * `transient` (40001, a serialization failure that changed nothing), which this module retries in place. It is the one
 * seam grizzle's LEASE replaces: the same relations, taken and given back by a certified READ COMMITTED race, with
 * nothing outside this module changed.
 */

/** A coordination call, retried in place while SERIALIZABLE refuses it as transient: it changed nothing. */
const serialized = <A>(call: Effect.Effect<A, CallError>): Effect.Effect<A, CallError> =>
	Effect.retry(call, { while: (error) => error.kind === "transient" })

/** Whether a refusal names the hold's or the exclusivity seat's key, another holder's. */
const takenBy = (error: CallError, relation: string): boolean =>
	error.kind === "refused" &&
	Arr.some(error.refused.laws, ({ law }) => law.kind === "primaryKey" && law.relation === relation)

/** A seat's coordinates. */
interface SeatAt {
	readonly resource: string
	readonly seat: bigint
}

const BY_SEAT: Order.Order<SeatAt> = Order.mapInput(Order.BigInt, (s: SeatAt) => s.seat)

/**
 * The seat of `resource` a holder may take at `now`: the lowest free one, or the lowest whose hold lapsed (its `until`
 * before `now`), which the take deletes in the same call.
 */
const freeSeat = (
	resource: string,
	seats: ReadonlyArray<SeatAt>,
	holds: ReadonlyArray<HoldRow>,
	now: Instant
): Option.Option<{ readonly seat: bigint; readonly lapsed: Option.Option<HoldRow> }> =>
	Arr.head(
		Arr.flatMap(
			Arr.sort(
				Arr.filter(seats, (s: SeatAt) => s.resource === resource),
				BY_SEAT
			),
			(s: SeatAt) => {
				const held = Arr.findFirst(holds, (h) => h.resource === resource && h.seat === s.seat)
				return Option.match(held, {
					onNone: () => [{ seat: s.seat, lapsed: Option.none<HoldRow>() }],
					onSome: (h) => (h.until < now ? [{ seat: s.seat, lapsed: Option.some(h) }] : [])
				})
			}
		)
	)

/**
 * Takes one seat of each of `resources` for `holder` until `until`, all in one call or none: the holds it took, or none
 * when some resource has no free seat. A resource with no seat rows yet has its seats provisioned first. A seat another
 * holder took between the read and the take refuses the take on the hold's key, and the take starts again from a fresh
 * read, so it ends once it holds seats or finds none free.
 */
export const take = <R>(
	ledger: Ledger<R>,
	resources: ReadonlyArray<string>,
	holder: Holder,
	until: Instant,
	now: Instant
): Effect.Effect<Option.Option<ReadonlyArray<HoldRow>>, CallError> =>
	Arr.isReadonlyArrayEmpty(resources)
		? Effect.succeedSome([])
		: Effect.gen(function* () {
				const coordination = ledger.coordination
				const stored = yield* serialized(coordination.seats)
				const unprovisioned = Arr.some(resources, (r) => !Arr.some(stored, (s) => s.resource === r))
				const seats = unprovisioned
					? yield* Effect.andThen(provision(ledger), serialized(coordination.seats))
					: stored
				const holds = yield* serialized(coordination.holds)
				const picked = Option.all(
					Arr.map(resources, (resource) =>
						Option.map(freeSeat(resource, seats, holds, now), (free) => ({ resource, ...free }))
					)
				)
				if (Option.isNone(picked)) {
					return Option.none()
				}
				const taken = Arr.map(picked.value, (p): HoldRow => ({
					resource: p.resource,
					seat: p.seat,
					holder,
					until
				}))
				const lapsed = Arr.flatMap(picked.value, (p) => Option.toArray(p.lapsed))
				return yield* serialized(coordination.take(lapsed, taken)).pipe(
					Effect.as(Option.some(taken)),
					Effect.catchIf(
						(error: CallError) => takenBy(error, `${ledger.flow}Hold`),
						() => take(ledger, resources, holder, until, now)
					)
				)
			})

/** Gives back a turn's holds: a delete of exactly those rows, so a hold another holder took over is left as it is. */
export const giveBack = <R>(
	ledger: Ledger<R>,
	holds: ReadonlyArray<HoldRow>
): Effect.Effect<void> =>
	Arr.isReadonlyArrayEmpty(holds)
		? Effect.void
		: serialized(ledger.coordination.giveBack(holds)).pipe(Effect.ignore)

/**
 * Takes the exclusivity seat `(kind, key)` for `scope`: held when this call or an earlier one of the same scope holds it
 * (the same row is no change), not held when another scope does.
 */
export const holdExclusive = <R>(
	ledger: Ledger<R>,
	row: ExclusiveRow
): Effect.Effect<boolean, CallError> =>
	serialized(ledger.coordination.holdExclusive(row)).pipe(
		Effect.as(true),
		Effect.catchIf(
			(error: CallError) => takenBy(error, `${ledger.flow}Exclusive`),
			() => Effect.succeed(false)
		)
	)

/** Gives back exclusivity seats whose scopes finished. */
export const releaseExclusive = <R>(
	ledger: Ledger<R>,
	rows: ReadonlyArray<ExclusiveRow>
): Effect.Effect<void> =>
	Arr.isReadonlyArrayEmpty(rows)
		? Effect.void
		: serialized(ledger.coordination.releaseExclusive(rows)).pipe(Effect.ignore)

/** The exclusivity seat a scope holds, if it holds one. */
export const exclusiveOf = <R>(
	ledger: Ledger<R>,
	scope: ScopeKey
): Effect.Effect<ReadonlyArray<ExclusiveRow>, CallError> =>
	Effect.map(serialized(ledger.coordination.exclusives), (rows) =>
		Arr.filter(rows, (row) => row.scope === scope)
	)

/** The seat numbers `0 … count − 1`, none for a count of 0. */
const seatsOf = (count: number): ReadonlyArray<number> =>
	Array.from({ length: count }, (_, seat) => seat)

/**
 * Makes the seat rows what the flow declares: each resource's seats `0 … n − 1`, adding the missing and removing the
 * rest. A seat still held refuses its removal by the hold's containment, and the next provision removes it.
 */
export const provision = <R>(ledger: Ledger<R>): Effect.Effect<void, CallError> =>
	Effect.gen(function* () {
		const coordination: Coordination = ledger.coordination
		const stored = yield* serialized(coordination.seats)
		const declared = Arr.flatMap(ledger.resources, (r) =>
			Arr.map(seatsOf(r.seats), (seat) => ({ resource: r.name, seat: BigInt(seat) }))
		)
		const same = (a: SeatAt, b: SeatAt) => a.resource === b.resource && a.seat === b.seat
		const add = Arr.filter(declared, (d) => !Arr.some(stored, (s) => same(s, d)))
		const remove = Arr.filter(stored, (s) => !Arr.some(declared, (d) => same(s, d)))
		if (Arr.isReadonlyArrayEmpty(add) && Arr.isReadonlyArrayEmpty(remove)) {
			return
		}
		yield* serialized(coordination.provision(add, remove))
	})

/** Pauses a resource or a root kind: nothing that touches it is eligible until it is resumed. */
export const pause = <R>(ledger: Ledger<R>, target: string): Effect.Effect<void, CallError> =>
	Effect.asVoid(serialized(ledger.coordination.pause(target)))

/** Resumes a paused resource or root kind. */
export const resume = <R>(ledger: Ledger<R>, target: string): Effect.Effect<void, CallError> =>
	Effect.asVoid(serialized(ledger.coordination.resume(target)))
