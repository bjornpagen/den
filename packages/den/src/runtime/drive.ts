import { Array as Arr, Duration, Effect, Option, Ref } from "effect"
import type { Digest } from "effect/crypto"
import { invocationBudgetMillis } from "#limits.ts"
import { now } from "#runtime/clock.ts"
import { type Ending, invoke, type Ledgers } from "#runtime/turn.ts"
import { InProcess, type Transport } from "#transport.ts"

/**
 * The in-process driver: delivers every wake the in-process transport holds whose delay has passed on the caller's
 * clock, one invocation each, until none is left that is due, so a flow runs to its end without Vercel. A wake held for
 * later stays held until the clock reaches it. Each delivery is acknowledged whatever its ending.
 */
export const drain = <R>(
	ledgers: Ledgers<R>
): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport | InProcess> =>
	Effect.gen(function* () {
		const { held } = yield* InProcess
		const budget = Duration.millis(invocationBudgetMillis.value)
		const deliver = (
			done: ReadonlyArray<Ending>
		): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport | InProcess> =>
			Effect.gen(function* () {
				const at = yield* now
				const list = yield* Ref.get(held)
				const due = Arr.findFirst(
					Arr.map(list, (h, index) => ({ h, index })),
					({ h }) => h.at <= Number(at)
				)
				if (Option.isNone(due)) {
					return done
				}
				const wake = due.value.h.wake
				yield* Ref.set(held, Arr.remove(list, due.value.index))
				const endings = yield* invoke(ledgers, wake, budget)
				return yield* deliver([...done, ...endings])
			})
		return yield* deliver([])
	})
