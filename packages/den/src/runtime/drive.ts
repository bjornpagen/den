import { Array as Arr, Duration, Effect, Option, Queue } from "effect"
import type { Digest } from "effect/crypto"
import { invocationBudgetMillis } from "#limits.ts"
import type { Ending, Ledger } from "#runtime/ledger.ts"
import { invoke } from "#runtime/turn.ts"
import { InProcess, type Transport } from "#transport.ts"

/**
 * The in-process driver: delivers every wake the in-process transport holds, one invocation each, until none is left,
 * so a flow runs to its end without Vercel. Each delivery is acknowledged whatever its ending.
 */
export const drain = <R>(
	ledger: Ledger<R>
): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport | InProcess> =>
	Effect.gen(function* () {
		const { queue } = yield* InProcess
		const budget = Duration.millis(invocationBudgetMillis.value)
		const deliver = (
			done: ReadonlyArray<Ending>
		): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport> =>
			Effect.flatMap(Queue.poll(queue), (next) =>
				Option.match(next, {
					onNone: () => Effect.succeed(done),
					onSome: (wake) =>
						Effect.flatMap(invoke(ledger, wake, budget), (endings) =>
							deliver(Arr.appendAll(done, endings))
						)
				})
			)
		return yield* deliver([])
	})
