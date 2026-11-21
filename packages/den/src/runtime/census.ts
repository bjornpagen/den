import { Array as Arr, Clock, Cron, Duration, Effect } from "effect"
import type { Digest } from "effect/crypto"
import { censusPeriodSeconds } from "#algebra/kinds.ts"
import { eligible } from "#runtime/eligible.ts"
import { type Instant, instantOf } from "#runtime/identity.ts"
import type { Ledger } from "#runtime/ledger.ts"
import { retire } from "#runtime/retire.ts"
import { releaseExclusive } from "#runtime/seats.ts"
import type { Settled } from "#runtime/settled.ts"
import { CensusInstant, idempotencyKey, type Ring, Transport, type Wake } from "#transport.ts"

/**
 * The census: a tick, once a census period, that rings what time made eligible (due instants passed, windows opened,
 * leases lapsed) and heals every lost wake. At the tick's instant, one reading of the database's clock, it requests each
 * scheduled root's latest instant (its key, so a tick repeated requests nothing), releases the exclusivity seats of
 * finished scopes, and rings every eligible wake. A step whose latest attempt was fenced on a refused credential waits
 * on the deployment: the tick asks once whether the commits' login is let in (the ledger's `authenticated`, one read
 * that runs no body) and rings those steps only when it is, so no body runs again while the deployment stays broken. It
 * writes only key races and the coordination group's turns.
 *
 * The census is a wake itself, `Census`, named by the instant its period starts: served like any other, it ticks every
 * flow an app runs, retires what has ended, and rings the next period's census, due when that period starts. Its key
 * is its period alone, so the chains of any number of rings collapse into one census a period, and it runs wherever the
 * transport delivers, every environment alike, where a platform's cron reaches one deployment only; a cron, a write's
 * revival (runtime/request.ts) or a census before it is what rings it.
 */

/** What a tick rang. */
export interface Tick {
	readonly rings: ReadonlyArray<Ring>
}

/**
 * The wakes one flow's census finds due at a reading of the database's instant: every eligible wake, and the steps
 * fenced on a refused credential once the commits' login is let in; requesting each scheduled root's latest instant and
 * releasing the exclusivity seats of finished scopes on the way.
 */
const dueOf = <R>(
	ledger: Ledger<R>
): Effect.Effect<
	{ readonly at: Instant; readonly wakes: ReadonlyArray<Wake> },
	Settled,
	Digest.Digest
> =>
	Effect.gen(function* () {
		const at = yield* ledger.now
		yield* Effect.forEach(ledger.scheduled, (s) =>
			s.request(instantOf(Cron.prev(s.cron, Number(at) + 1).getTime()))
		)
		const snapshot = yield* ledger.snapshot
		const found = eligible(ledger, snapshot, at)
		yield* releaseExclusive(ledger, found.release)
		const letIn = Arr.isReadonlyArrayNonEmpty(found.fenced)
			? yield* Effect.isSuccess(ledger.authenticated)
			: false
		return { at, wakes: [...found.wakes, ...(letIn ? found.fenced : [])] }
	})

/** One census tick of one flow, at a reading of the database's instant: its due wakes rung at once. */
export const tick = <R>(
	ledger: Ledger<R>
): Effect.Effect<Tick, Settled, Digest.Digest | Transport> =>
	Effect.gen(function* () {
		const { at, wakes } = yield* dueOf(ledger)
		const rings = Arr.map(wakes, (wake): Ring => ({
			wake,
			delay: Duration.zero,
			cause: { _tag: "Census", at: Number(at) }
		}))
		const transport = yield* Transport
		yield* transport.send(rings)
		return { rings }
	})

/** The census's rings of several flows, each ticked at a reading of its own, in their order. */
export const tickAll = <R>(
	ledgers: ReadonlyArray<Ledger<R>>
): Effect.Effect<ReadonlyArray<Ring>, Settled, Digest.Digest | Transport> =>
	Effect.map(
		Effect.forEach(ledgers, (ledger) => tick(ledger)),
		(ticks) => Arr.flatMap(ticks, (t) => t.rings)
	)

/** A census period in milliseconds: the census's period. */
const periodMillis = censusPeriodSeconds * 1000

/** The census wake of the period that starts at `start`, a multiple of the period. */
const censusOf = (start: number): Extract<Wake, { readonly _tag: "Census" }> => ({
	_tag: "Census",
	at: CensusInstant.make(start)
})

/**
 * The census wake of the period after the one holding `millis`, a reading of a clock in milliseconds since the epoch,
 * and how long after it that period starts: the period names the census and the delay is its doorbell's, so a census
 * a host's clock rings and one the database's rings meet at one key, or at two periods' censuses near a boundary,
 * either of which is a census.
 */
export const nextCensus = (
	millis: number
): {
	readonly wake: Extract<Wake, { readonly _tag: "Census" }>
	readonly delay: Duration.Duration
} => {
	const next = (Math.floor(millis / periodMillis) + 1) * periodMillis
	return { wake: censusOf(next), delay: Duration.millis(next - millis) }
}

/**
 * The ring of the census of the period holding `millis`, at once: a period's census rung where its chain stopped (a
 * cron's call, a write's revival), which is one message with the chain's own where the chain runs, and the census now
 * where it stopped.
 */
export const censusRing = (
	millis: number
): Ring & { readonly wake: Extract<Wake, { readonly _tag: "Census" }> } => {
	const wake = censusOf(Math.floor(millis / periodMillis) * periodMillis)
	return { wake, delay: Duration.zero, cause: { _tag: "Census", at: wake.at } }
}

/**
 * What a ring of the census sent: the period its census wake names, by the instant the period starts, and the
 * idempotency key the ring was sent under, so a host's log of its cron shows one census a period, each by its key.
 */
export interface CensusRung {
	readonly at: CensusInstant
	readonly key: string
}

/**
 * Rings the census of the current period, by the host's clock, which names the period and judges nothing: what a cron
 * route runs, so a platform's cron is a doorbell of the census and its work runs where wakes are served. It answers
 * what it rang; a send that failed is logged by the transport, which never fails its caller.
 */
export const ringCensus: Effect.Effect<CensusRung, never, Transport> = Effect.gen(function* () {
	const transport = yield* Transport
	const millis = yield* Clock.currentTimeMillis
	const ring = censusRing(millis)
	yield* transport.send([ring])
	return { at: ring.wake.at, key: idempotencyKey(ring) }
})

/** What one period's census did: the wakes it found due in every flow, and the wake of the period after it. */
export interface Censused {
	readonly due: ReadonlyArray<Wake>
	readonly next: ReturnType<typeof nextCensus>
}

/**
 * One period's census, the work its wake rings: every flow's due wakes, each flow's ended graphs retired, and the next
 * period's census from a reading of the first flow's clock, the database's. A flow whose census fails rings nothing this
 * period, its failure in the span, and the next period's census is rung whatever failed, so the chain never stops on a
 * refusal.
 */
export const census = <R>(
	ledgers: Arr.NonEmptyReadonlyArray<Ledger<R>>
): Effect.Effect<Censused, Settled, Digest.Digest> =>
	Effect.gen(function* () {
		const due = yield* Effect.forEach(ledgers, (ledger) =>
			Effect.tap(dueOf(ledger), () => Effect.ignore(retire(ledger))).pipe(
				Effect.map((found) => found.wakes),
				Effect.tapError((error) => Effect.annotateCurrentSpan("den.census", error.message)),
				Effect.orElseSucceed((): ReadonlyArray<Wake> => [])
			)
		)
		const at = yield* Arr.headNonEmpty(ledgers).now
		return { due: Arr.flatten(due), next: nextCensus(Number(at)) }
	})
