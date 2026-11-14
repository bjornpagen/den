import type { CallError } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Cron, Duration, Effect } from "effect"
import type { Digest } from "effect/crypto"
import { eligible } from "#runtime/eligible.ts"
import { instantOf } from "#runtime/identity.ts"
import type { Ledger } from "#runtime/ledger.ts"
import { releaseExclusive } from "#runtime/seats.ts"
import { type Ring, Transport } from "#transport.ts"

/**
 * The census: a tick, about once a minute on Vercel Cron, that rings what time made eligible (due instants passed,
 * windows opened, leases lapsed) and heals every lost wake. At the tick's instant, one reading of the database's clock,
 * it requests each scheduled root's latest instant (its key, so a tick repeated requests nothing), releases the
 * exclusivity seats of finished scopes, and rings every eligible wake. It writes only key races and the coordination
 * group's turns.
 */

/** What a tick rang. */
export interface Tick {
	readonly rings: ReadonlyArray<Ring>
}

/** One census tick of one flow, at a reading of the database's instant. */
export const tick = <R>(
	ledger: Ledger<R>
): Effect.Effect<Tick, CallError, Digest.Digest | Transport> =>
	Effect.gen(function* () {
		const at = yield* ledger.now
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

/** The census's rings of several flows, each ticked at a reading of its own, in their order. */
export const tickAll = <R>(
	ledgers: ReadonlyArray<Ledger<R>>
): Effect.Effect<ReadonlyArray<Ring>, CallError, Digest.Digest | Transport> =>
	Effect.map(
		Effect.forEach(ledgers, (ledger) => tick(ledger)),
		(ticks) => Arr.flatMap(ticks, (t) => t.rings)
	)
