import type { Sha256 } from "@bjornpagen/grizzle"
import { Array as Arr, Clock, Duration, Effect } from "effect"
import { censusRing } from "#runtime/census.ts"
import { type FlowName, type Ring, Transport } from "#transport.ts"

/**
 * Ringing after a request: a root's graph starts at its admission, and nothing else rings an admission a write requested
 * but the census's next tick, up to a minute later, or a relay, which a serverless host has none of. So the write that
 * requests a root rings its admission itself, once it has committed, as a turn rings what its own commit spawned: the
 * app's own transaction that unions a root's request with its own write, and an operator's request through den's role.
 * The ledger stays the only authority: a ring a write sends for a root it did not commit finds no scope and is lost, and
 * a ring that is lost is healed by the census.
 */

/** A root a write requested: its flow and its scope, whose admission the write rings once it has committed. */
export interface Requested {
	readonly flow: FlowName
	readonly scope: Sha256
}

/**
 * The ring of a requested root's admission: due at once, caused by its request, so its idempotency key names the root
 * alone, and a root requested again, by a write run again or by another request of its key, which starts nothing, is
 * one message.
 */
export const admissionOf = (requested: Requested): Ring => ({
	wake: { _tag: "Admit", flow: requested.flow, scope: requested.scope },
	delay: Duration.zero,
	cause: { _tag: "Request" }
})

/**
 * Rings the admissions of roots a committed write requested, and the current period's census beside them, which
 * revives a census chain that stopped (runtime/census.ts) and is one message with the chain's own where it runs. Its
 * period is read off the host's clock: it names the census, and judges nothing.
 */
export const ringRequested = (
	requested: ReadonlyArray<Requested>
): Effect.Effect<void, never, Transport> =>
	Effect.gen(function* () {
		const transport = yield* Transport
		const millis = yield* Clock.currentTimeMillis
		yield* transport.send([...Arr.map(requested, admissionOf), censusRing(millis)])
	})

/**
 * Runs `write`, a write that requests roots (the app's own transaction that unions their requests with its own write, or
 * an operator's request through den's role), and once it has committed rings the admission of each root `requested`
 * names of what it answered, so its graph starts within one delivery. A write that fails committed nothing and rings
 * nothing; one whose commit's answer was lost rings nothing either, and the census starts what it committed.
 */
export const afterCommit = <A, E, R>(
	write: Effect.Effect<A, E, R>,
	requested: (committed: A) => ReadonlyArray<Requested>
): Effect.Effect<A, E, R | Transport> =>
	Effect.tap(write, (committed) => ringRequested(requested(committed)))
