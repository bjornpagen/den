import { now } from "@bjornpagen/den/runtime/clock"
import { drain } from "@bjornpagen/den/runtime/drive"
import type { ScopeKey } from "@bjornpagen/den/runtime/identity"
import type { Ledgers, Served } from "@bjornpagen/den/runtime/turn"
import { type FlowName, Transport } from "@bjornpagen/den/transport"
import type { InProcess } from "@bjornpagen/den/transport"
import { Array as Arr, Duration, Effect } from "effect"
import type { Digest } from "effect/crypto"

/**
 * How a suite runs what it requested: it rings the scopes' admissions at once, as an operator's start does, and drains
 * the in-process transport until no wake is due.
 */
export const admitAndDrain = <R>(
	ledgers: Ledgers<R>,
	flow: FlowName,
	scopes: ReadonlyArray<ScopeKey>
) =>
	Effect.gen(function* () {
		const transport = yield* Transport
		const at = yield* now
		yield* transport.send(
			Arr.map(scopes, (scope) => ({
				wake: { _tag: "Admit", flow, scope } as const,
				delay: Duration.zero,
				cause: { _tag: "Start", at: Number(at) } as const
			}))
		)
		return yield* drain(ledgers)
	}) satisfies Effect.Effect<unknown, never, R | Digest.Digest | Transport | InProcess>

/** Rings what a turn served by hand would have rung on, as its own continuation would, then drains. */
export const ringOnAndDrain = <R>(ledgers: Ledgers<R>, served: Served) =>
	Effect.gen(function* () {
		const transport = yield* Transport
		const at = yield* now
		yield* transport.send(
			Arr.map(served.onward, (o) => ({
				...o,
				cause: { _tag: "Turn", by: served.ending.wake, at: Number(at) } as const
			}))
		)
		return yield* drain(ledgers)
	}) satisfies Effect.Effect<unknown, never, R | Digest.Digest | Transport | InProcess>
