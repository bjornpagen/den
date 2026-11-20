import { now } from "@bjornpagen/den/runtime/clock"
import { drain } from "@bjornpagen/den/runtime/drive"
import { type Requested, ringRequested } from "@bjornpagen/den/runtime/request"
import type { Ledgers, Served } from "@bjornpagen/den/runtime/turn"
import { Transport } from "@bjornpagen/den/transport"
import type { InProcess } from "@bjornpagen/den/transport"
import { Array as Arr, Effect } from "effect"
import type { Digest } from "effect/crypto"

/**
 * How a suite runs what it requested: it rings the roots' admissions as the write that requested them does once it has
 * committed (runtime/request.ts), and drains the in-process transport until no wake is due.
 */
export const ringAndDrain = <R>(ledgers: Ledgers<R>, requested: ReadonlyArray<Requested>) =>
	Effect.andThen(ringRequested(requested), drain(ledgers)) satisfies Effect.Effect<
		unknown,
		never,
		R | Digest.Digest | Transport | InProcess
	>

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
