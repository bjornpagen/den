import { Effect, Redacted } from "effect"
import type { Route } from "#consumer.ts"

/**
 * The census as Vercel Cron: once a minute, on the production deployment serving the domain, a tick rings every step a
 * lost wake would have. Its sends are pinned to that deployment, so the census is what moves work off an old
 * deployment's code. A missed or doubled run costs nothing: a tick writes only key races.
 */

/**
 * The census route: a request whose bearer is the project's cron secret, as Vercel Cron sends it, runs one `tick` and
 * answers 200, or 500 when the tick failed (logged; the next minute's tick is the retry); any other request is refused
 * with 401 and runs nothing, since the route has a public URL.
 */
export const census = <A, E, R>(
	tick: Effect.Effect<A, E, R>,
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
				onSuccess: (result) =>
					Effect.as(Effect.logInfo("den census tick", result), new Response(null, { status: 200 }))
			})
		)
		return (request) =>
			request.headers.get("authorization") === `Bearer ${Redacted.value(secret)}`
				? run(ticked)
				: Promise.resolve(new Response(null, { status: 401 }))
	})
