import type { CallError } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Clock, Effect, Option, Order } from "effect"
import type { Digest } from "effect/crypto"
import { instantOf, type StepKey } from "#runtime/identity.ts"
import type { Ledger, PendingClaim } from "#runtime/ledger.ts"
import { settle, wakeOf } from "#runtime/turn.ts"
import { Transport, type Wake } from "#transport.ts"

/**
 * The census: a tick, about once a minute on Vercel Cron, that heals every lost wake. It reads, by read-only queries
 * at the tick's instant, the pending steps whose claim is missing or has lapsed, and the open scopes whose children are
 * all done, and sends a wake for each step due, at most a lane's free width, and for each finish it inserts. It writes
 * only key races: a finish step, which two settlers win alike.
 */

/** A pending step's claims, latest first. */
const latest = (claims: ReadonlyArray<PendingClaim>): Option.Option<PendingClaim> =>
	Arr.head(
		Arr.sort(claims, Order.flip(Order.mapInput(Order.BigInt, (c: PendingClaim) => c.attempt)))
	)

/** What a tick found and did: the wakes it sent and the finishes it started. */
export interface Tick {
	readonly due: ReadonlyArray<Wake>
	readonly finishes: ReadonlyArray<Wake>
}

/** One census tick, at the runtime clock's instant. */
export const tick = <R>(
	ledger: Ledger<R>
): Effect.Effect<Tick, CallError, Digest.Digest | Transport> =>
	Effect.gen(function* () {
		const millis = yield* Clock.currentTimeMillis
		const now = instantOf(millis)
		const pending = yield* ledger.pending
		const claims = yield* ledger.pendingClaims
		const claimsOf = (step: StepKey) => Arr.filter(claims, (c) => c.step === step)
		const candidates = Arr.flatMap(pending, (p) => {
			const last = latest(claimsOf(p.step))
			if (Option.isSome(last) && last.value.until >= now) {
				return []
			}
			const attempt = Option.match(last, { onNone: () => 1, onSome: (c) => Number(c.attempt) + 1 })
			return Option.toArray(wakeOf(ledger, p.step, p.kind, attempt))
		})
		const running = Arr.filter(pending, (p) =>
			Option.exists(latest(claimsOf(p.step)), (c) => c.until >= now)
		)
		const lanes = Arr.dedupe(Arr.map(candidates, (w) => w.lane))
		const due = Arr.flatMap(lanes, (lane) => {
			const width = Option.match(
				Arr.findFirst([...ledger.runners.values()], (found) => found.lane.name === lane),
				{ onNone: () => 0, onSome: (r) => r.lane.width }
			)
			const busy = Arr.filter(running, (p) =>
				Option.exists(Option.fromNullishOr(ledger.runners.get(p.kind)), (r) => r.lane.name === lane)
			).length
			return Arr.take(
				Arr.filter(candidates, (w) => w.lane === lane),
				Math.max(0, width - busy)
			)
		})
		const open = yield* ledger.openScopes
		const settled = yield* Effect.forEach(open, (s) => settle(ledger, s))
		const finishes = Arr.flatMap(settled, Option.toArray)
		const transport = yield* Transport
		yield* transport.send([...due, ...finishes])
		return { due, finishes }
	})
