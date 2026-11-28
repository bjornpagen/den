import * as g from "@bjornpagen/grizzle"
import { Array as Arr, Effect, Option } from "effect"
import type { Resource } from "#algebra/kinds.ts"
import type { Instant } from "#runtime/identity.ts"
import type {
	ExclusiveAt,
	ExclusiveRow,
	ExclusiveTurn,
	HoldRow,
	Ledger,
	SeatAt
} from "#runtime/ledger.ts"
import { refusedLaws, refusedOnKey } from "#runtime/ledger.ts"
import type { Settled } from "#runtime/settled.ts"
import type { FlowName } from "#transport.ts"

/**
 * The seat module. A step's seats are its claim's: a claim's one write holds them, each a member of the claim carrying
 * its step and attempt, so a lost claim holds none, and a seat is given back by the fact that ends its claim's attempt (a
 * retry, a fence, a result, or its lapse), so a turn gives nothing back. A seat holds at most one live hold, the live
 * holds' key, and each live hold sits below its resource's count; a claim that takes a seat another live hold holds is
 * refused whole on that key, and the turn picks its seats again from a fresh read. An exclusivity seat and a pause are
 * chains of turns, inserted and never deleted, so den's coordinator role certifies READ COMMITTED.
 *
 * No chain here races: a take of several turns must win all or none, which one call refused whole on any turn another
 * holder took first gives, and a raced insert would not (it can win one turn and meet another); and a raced insert at a
 * turn a stale read chose meets that turn's old row, which says nothing of who holds the seat now. A refusal on a turn's
 * key and a fresh read do.
 */

/** A chain's next turn: one past its latest, or its first, 0, when it has none. */
const nextTurn = (latest: Option.Option<bigint>): bigint =>
	Option.match(latest, { onNone: () => 0n, onSome: (turn) => turn + 1n })

/** The seat numbers `0 … count − 1`, none for a count of 0. */
const seatsOf = (count: number): ReadonlyArray<bigint> =>
	Array.from({ length: count }, (_, seat) => BigInt(seat))

/** A seat a claim takes, and the live hold whose lease lapsed there, if one did, whose end the claim's write records. */
interface Taken {
	readonly seat: SeatAt
	readonly lapsed: Option.Option<HoldRow>
}

/**
 * The seats a claim takes at `now`, one of each of `resources`, each the lowest with no live hold or whose live hold's
 * lease lapsed (its `until` before `now`), with the lapsed holds; none when some resource has no such seat.
 */
export const seatsFor = (
	resources: ReadonlyArray<Resource>,
	live: ReadonlyArray<HoldRow>,
	now: Instant
): Option.Option<{
	readonly seats: ReadonlyArray<SeatAt>
	readonly lapsed: ReadonlyArray<HoldRow>
}> =>
	Option.map(
		Option.all(
			Arr.map(resources, (resource) =>
				Arr.findFirst(seatsOf(resource.seats), (seat): Option.Option<Taken> => {
					const held = Arr.findFirst(live, (h) => h.resource === resource.name && h.seat === seat)
					return Option.match(held, {
						onNone: () =>
							Option.some({ seat: { resource: resource.name, seat }, lapsed: Option.none() }),
						onSome: (h) =>
							h.until < now
								? Option.some({ seat: { resource: resource.name, seat }, lapsed: Option.some(h) })
								: Option.none()
					})
				})
			)
		),
		(taken) => ({
			seats: Arr.map(taken, (t) => t.seat),
			lapsed: Arr.flatMap(taken, (t) => Option.toArray(t.lapsed))
		})
	)

/** Whether a claim was refused because another live hold holds one of its seats: the live holds' key. */
export const seatTaken = (flow: string, error: Settled): boolean =>
	error._tag === "refused" &&
	Arr.some(refusedLaws(error.refused), ({ law }) => {
		const own = law.kind === "above" ? law.law : law
		return own.kind === "key" && own.side.relation === `${flow}Live`
	})

/** The live turn of the exclusivity seat `seat`, if one holds it. */
const liveExclusive = <R>(
	ledger: Ledger<R>,
	seat: ExclusiveAt
): Effect.Effect<Option.Option<ExclusiveRow>, Settled> =>
	Effect.map(ledger.coordination.exclusives, (rows) =>
		Arr.findFirst(rows, (row) => row.kind === seat.kind && g.Sha256.equals(row.key, seat.key))
	)

/**
 * Takes the exclusivity seat `(kind, key)` for `scope`: held when a live turn of `scope`'s holds it, from this call or
 * an earlier one, not held when another scope's live turn does. A free seat is taken at its next turn; a turn another
 * scope took first refuses the take on its key, and the seat is judged again from a fresh read.
 */
export const holdExclusive = <R>(
	ledger: Ledger<R>,
	seat: ExclusiveAt & { readonly scope: g.Sha256 }
): Effect.Effect<boolean, Settled> =>
	Effect.gen(function* () {
		const live = yield* liveExclusive(ledger, seat)
		if (Option.isSome(live)) {
			return g.Sha256.equals(live.value.scope, seat.scope)
		}
		const turns = yield* ledger.coordination.exclusiveTurns
		const turn = nextTurn(
			Option.map(
				Arr.findFirst(turns, (t) => t.kind === seat.kind && g.Sha256.equals(t.key, seat.key)),
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
	scope: g.Sha256
): Effect.Effect<ReadonlyArray<ExclusiveRow>, Settled> =>
	Effect.map(ledger.coordination.exclusives, (rows) =>
		Arr.filter(rows, (row) => g.Sha256.equals(row.scope, scope))
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
 * Pauses a resource, a pause handle or a root kind: nothing that touches it is eligible until it is resumed. A target
 * already paused stays paused at its live turn; another target's pause is taken at its next turn, and a turn another
 * pauser took first is judged again from a fresh read.
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

/**
 * Resumes a paused resource, pause handle or root kind: its live pause's turn resumed, nothing for a target not paused.
 */
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
