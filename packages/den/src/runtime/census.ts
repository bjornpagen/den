import type { CallError } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Cron, Duration, Effect } from "effect"
import type { Digest } from "effect/crypto"
import { eligible } from "#runtime/eligible.ts"
import { type Instant, instantOf } from "#runtime/identity.ts"
import type { Ledger } from "#runtime/ledger.ts"
import { provision, releaseExclusive } from "#runtime/seats.ts"
import { type Ring, Transport } from "#transport.ts"

/**
 * The census: a tick, about once a minute on Vercel Cron, that rings what time made eligible (due instants passed,
 * windows opened, leases lapsed) and heals every lost wake. At the tick's instant, the caller's clock as a parameter,
 * it makes the seat rows what the flow declares, requests each scheduled root's latest instant (its key, so a tick
 * repeated requests nothing), gives back the exclusivity seats of finished scopes, and rings every eligible wake. It
 * writes only key races and the coordination group.
 */

/** What a tick rang. */
export interface Tick {
	readonly rings: ReadonlyArray<Ring>
}

/** One census tick of one flow at `at`. */
export const tick = <R>(
	ledger: Ledger<R>,
	at: Instant
): Effect.Effect<Tick, CallError, Digest.Digest | Transport> =>
	Effect.gen(function* () {
		yield* provision(ledger)
		yield* Effect.forEach(ledger.scheduled, (s) =>
			s.request(instantOf(Cron.prev(s.cron, Number(at) + 1).getTime()))
		)
		const snapshot = yield* ledger.snapshot
		const found = eligible(ledger, snapshot, at)
		yield* releaseExclusive(ledger, found.release)
		const rings = Arr.map(found.wakes, (wake): Ring => ({
			wake,
			delay: Duration.zero,
			cause: { _tag: "Census", at: Number(at) }
		}))
		const transport = yield* Transport
		yield* transport.send(rings)
		return { rings }
	})

/** The census's rings of several flows at one instant, in their order. */
export const tickAll = <R>(
	ledgers: ReadonlyArray<Ledger<R>>,
	at: Instant
): Effect.Effect<ReadonlyArray<Ring>, CallError, Digest.Digest | Transport> =>
	Effect.map(
		Effect.forEach(ledgers, (ledger) => tick(ledger, at)),
		(ticks) => Arr.flatMap(ticks, (t) => t.rings)
	)
