import type { Settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option } from "effect"
import type { Resource } from "#algebra/kinds.ts"
import type { Holder, Instant, ScopeKey } from "#runtime/identity.ts"
import type {
	ExclusiveAt,
	ExclusiveRow,
	ExclusiveTurn,
	HoldRow,
	Ledger,
	SeatTurn
} from "#runtime/ledger.ts"
import { refusedOnKey } from "#runtime/ledger.ts"
import type { FlowName } from "#transport.ts"

/**
 * The seat module: exact seats as chains of turns. A seat's turns run from 0, each held by one holder until it is
 * freed, and a turn after the first is contained in its predecessor's `Freed`, so a seat holds at most one live hold,
 * its latest turn, and a bound is never exceeded; a hold's seat is checked below its resource's count, a closed
 * relation of the flow's declaration. A step takes a seat of each resource it uses before its claim and frees them
 * after its last write; a scope takes its exclusivity seat at its admission and releases it once its finish has its
 * result. Pauses are chains of the same shape. Nothing is deleted, so den's coordinator role certifies READ COMMITTED.
 *
 * No relation here races: a take of several seats must win all or none, which one call refused whole on any turn
 * another holder took first gives, and a raced insert would not (it can win one seat and meet another); and a raced
 * insert at a turn a stale read chose meets that turn's old row, which says nothing of who holds the seat now. A
 * refusal on a turn's key and a fresh read do.
 */

/** A chain's next turn: one past its latest, or its first, 0, when it has none. */
const nextTurn = (latest: Option.Option<bigint>): bigint =>
	Option.match(latest, { onNone: () => 0n, onSome: (turn) => turn + 1n })

/** The seat numbers `0 … count − 1`, none for a count of 0. */
const seatsOf = (count: number): ReadonlyArray<bigint> =>
	Array.from({ length: count }, (_, seat) => BigInt(seat))

/**
 * The seat of `resource` a holder may take at `now`, and its turn: the lowest seat with no live hold, at its next turn,
 * or the lowest whose live hold lapsed (its `until` before `now`), at the turn after it, which the take frees in the
 * same call.
 */
const freeSeat = (
	resource: string,
	count: number,
	turns: ReadonlyArray<SeatTurn>,
	holds: ReadonlyArray<HoldRow>,
	now: Instant
): Option.Option<{ readonly seat: SeatTurn; readonly lapsed: Option.Option<SeatTurn> }> =>
	Arr.head(
		Arr.flatMap(seatsOf(count), (seat) => {
			const live = Arr.findFirst(holds, (h) => h.resource === resource && h.seat === seat)
			return Option.match(live, {
				onNone: () => [
					{
						seat: {
							resource,
							seat,
							turn: nextTurn(
								Option.map(
									Arr.findFirst(turns, (t) => t.resource === resource && t.seat === seat),
									(t) => t.turn
								)
							)
						},
						lapsed: Option.none<SeatTurn>()
					}
				],
				onSome: (h) =>
					h.until < now
						? [
								{
									seat: { resource, seat, turn: h.turn + 1n },
									lapsed: Option.some<SeatTurn>({ resource, seat, turn: h.turn })
								}
							]
						: []
			})
		})
	)

/**
 * Takes one seat of each of `resources` for `holder` until `until`, all in one call or none: the holds it took, or none
 * when some resource has no seat free at `now`. A turn another holder took between the reads and the take refuses the
 * take whole on that turn's key, and the take starts again from a fresh read, so it ends once it holds seats or finds
 * none free.
 */
export const take = <R>(
	ledger: Ledger<R>,
	resources: ReadonlyArray<Resource>,
	holder: Holder,
	until: Instant,
	now: Instant
): Effect.Effect<Option.Option<ReadonlyArray<HoldRow>>, Settled> =>
	Arr.isReadonlyArrayEmpty(resources)
		? Effect.succeedSome([])
		: Effect.gen(function* () {
				const coordination = ledger.coordination
				const turns = yield* coordination.seatTurns
				const holds = yield* coordination.holds
				const picked = Option.all(
					Arr.map(resources, (resource) =>
						freeSeat(resource.name, resource.seats, turns, holds, now)
					)
				)
				if (Option.isNone(picked)) {
					return Option.none()
				}
				const taken = Arr.map(picked.value, (p): HoldRow => ({ ...p.seat, holder, until }))
				const lapsed = Arr.flatMap(picked.value, (p) => Option.toArray(p.lapsed))
				return yield* coordination.take(lapsed, taken).pipe(
					Effect.as(Option.some(taken)),
					Effect.catchIf(
						(error: Settled) => refusedOnKey(error, [`${ledger.flow}Hold`]),
						() => take(ledger, resources, holder, until, now)
					)
				)
			})

/**
 * Gives back a turn's holds: each one's turn freed, so a hold whose lapsed turn another holder freed and took over is
 * left as it is (its `Freed` is the same row, no change).
 */
export const giveBack = <R>(
	ledger: Ledger<R>,
	holds: ReadonlyArray<HoldRow>
): Effect.Effect<void> =>
	Arr.isReadonlyArrayEmpty(holds)
		? Effect.void
		: ledger.coordination.giveBack(holds).pipe(Effect.ignore)

/** The live turn of the exclusivity seat `seat`, if one holds it. */
const liveExclusive = <R>(
	ledger: Ledger<R>,
	seat: ExclusiveAt
): Effect.Effect<Option.Option<ExclusiveRow>, Settled> =>
	Effect.map(ledger.coordination.exclusives, (rows) =>
		Arr.findFirst(rows, (row) => row.kind === seat.kind && row.key === seat.key)
	)

/**
 * Takes the exclusivity seat `(kind, key)` for `scope`: held when a live turn of `scope`'s holds it, from this call or
 * an earlier one, not held when another scope's live turn does. A free seat is taken at its next turn; a turn another
 * scope took first refuses the take on its key, and the seat is judged again from a fresh read.
 */
export const holdExclusive = <R>(
	ledger: Ledger<R>,
	seat: ExclusiveAt & { readonly scope: ScopeKey }
): Effect.Effect<boolean, Settled> =>
	Effect.gen(function* () {
		const live = yield* liveExclusive(ledger, seat)
		if (Option.isSome(live)) {
			return live.value.scope === seat.scope
		}
		const turns = yield* ledger.coordination.exclusiveTurns
		const turn = nextTurn(
			Option.map(
				Arr.findFirst(turns, (t) => t.kind === seat.kind && t.key === seat.key),
				(t) => t.turn
			)
		)
		return yield* ledger.coordination
			.holdExclusive({
				kind: seat.kind,
				key: seat.key,
				turn,
				scope: seat.scope
			})
			.pipe(
				Effect.as(true),
				Effect.catchIf(
					(error: Settled) => refusedOnKey(error, [`${ledger.flow}Exclusive`]),
					() => holdExclusive(ledger, seat)
				)
			)
	})

/** Releases the live turns of exclusivity seats whose scopes finished. */
export const releaseExclusive = <R>(
	ledger: Ledger<R>,
	rows: ReadonlyArray<ExclusiveTurn>
): Effect.Effect<void> =>
	Arr.isReadonlyArrayEmpty(rows)
		? Effect.void
		: ledger.coordination.releaseExclusive(rows).pipe(Effect.ignore)

/** The live exclusivity seat a scope holds, if it holds one. */
export const exclusiveOf = <R>(
	ledger: Ledger<R>,
	scope: ScopeKey
): Effect.Effect<ReadonlyArray<ExclusiveRow>, Settled> =>
	Effect.map(ledger.coordination.exclusives, (rows) =>
		Arr.filter(rows, (row) => row.scope === scope)
	)

/**
 * A flow's chains of pauses over its own targets T, its Pausable roster's handles, as its binding reads and writes them
 * once it has parsed a target's name (Coordination's pause and resume): each target's latest turn, its live turns, a
 * pause's turn taken and a live turn resumed.
 */
export interface PauseChains<T extends string> {
	readonly flow: FlowName
	readonly turns: Effect.Effect<ReadonlyArray<PauseOf<T>>, Settled>
	readonly live: Effect.Effect<ReadonlyArray<PauseOf<T>>, Settled>
	readonly pause: (row: PauseOf<T>) => Effect.Effect<void, Settled>
	readonly resume: (row: PauseOf<T>) => Effect.Effect<void, Settled>
}

/** A pause's turn of a target T of the flow's. */
interface PauseOf<T extends string> {
	readonly target: T
	readonly turn: bigint
}

/**
 * Pauses a resource or a root kind: nothing that touches it is eligible until it is resumed. A target already paused
 * stays paused at its live turn; another target's pause is taken at its next turn, and a turn another pauser took
 * first is judged again from a fresh read.
 */
export const pauseIn =
	<T extends string>(chains: PauseChains<T>) =>
	(target: T): Effect.Effect<void, Settled> =>
		Effect.gen(function* () {
			const live = yield* chains.live
			if (Arr.some(live, (row) => row.target === target)) {
				return
			}
			const turns = yield* chains.turns
			const turn = nextTurn(
				Option.map(
					Arr.findFirst(turns, (t) => t.target === target),
					(t) => t.turn
				)
			)
			yield* chains.pause({ target, turn }).pipe(
				Effect.catchIf(
					(error: Settled) => refusedOnKey(error, [`${chains.flow}Paused`]),
					() => pauseIn(chains)(target)
				)
			)
		})

/** Resumes a paused resource or root kind: its live pause's turn resumed, nothing for a target not paused. */
export const resumeIn =
	<T extends string>(chains: PauseChains<T>) =>
	(target: T): Effect.Effect<void, Settled> =>
		Effect.flatMap(chains.live, (live) =>
			Effect.forEach(
				Arr.filter(live, (row) => row.target === target),
				(row) => chains.resume(row),
				{ discard: true }
			)
		)
