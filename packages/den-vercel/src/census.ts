import type { CensusRung } from "@bjornpagen/den/runtime/census"
import { Effect, Redacted } from "effect"
import type { Route } from "#consumer.ts"

/**
 * The census as Vercel Cron: once a minute, on the production deployment serving the domain, the route runs what the
 * host gives it, den's `ringCensus`, which rings the current period's census wake (runtime/census.ts); the consumer
 * serves it, ticking every flow and ringing the next period's, so the census runs wherever the queue delivers and the
 * cron is one of its doorbells. Its sends are pinned to that deployment, so the census is what moves work off an old
 * deployment's code. A missed or doubled run costs nothing: a period's census is one message by its key.
 */

/**
 * The census route: a request whose bearer is the project's cron secret, as Vercel Cron sends it, runs one `tick`, den's
 * `ringCensus`, logs what it rang (the census period's instant and the ring's idempotency key, one a minute) and answers
 * 200, or 500 when the tick failed (logged; the next minute's tick is the retry); any other request is refused with 401
 * and runs nothing, since the route has a public URL. A ring whose send failed is logged by the transport beside it.
 */
export const census = <E, R>(
	tick: Effect.Effect<CensusRung, E, R>,
	secret: Redacted.Redacted
): Effect.Effect<Route, never, R> =>
	Effect.gen(function* () {
		const context = yield* Effect.context<R>()
		const run = Effect.runPromiseWith(context)
		const ticked = tick.pipe(
			Effect.matchCauseEffect({
				onFailure: (cause) =>
					Effect.as(
						Effect.logError("den census tick failed", cause),
						new Response(null, { status: 500 })
					),
				onSuccess: (rung) =>
					Effect.as(
						Effect.logInfo("den census rung", { at: rung.at, key: rung.key }),
						new Response(null, { status: 200 })
					)
			})
		)
		return (request) =>
			request.headers.get("authorization") === `Bearer ${Redacted.value(secret)}`
				? run(ticked)
				: Promise.resolve(new Response(null, { status: 401 }))
	})
