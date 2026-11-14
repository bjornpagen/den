import type { Wake } from "@bjornpagen/den/transport"
import type { MessageMetadata, RetryHandler } from "@vercel/queue"
import { Effect, Schema } from "effect"
import { visibilityTimeoutSeconds } from "#limits.ts"
import { VercelQueue, WakeJson } from "#queue.ts"

/**
 * The push consumer: one route on the one topic, for every wake of every flow. It decodes a delivery once, hands the
 * wake to den's runtime, and acknowledges the delivery whatever happened, since a wake promises a turn and never a
 * task: the ledger decides what the turn does, and a claim's lease and the census are the retry, never a redelivery.
 */

/** A route handler, as Vercel runs a function's route: a request in, a response out. */
export type Route = (request: Request) => Promise<Response>

/** What a delivered wake is handed to: den's runtime, which serves it, never fails, and says how it ended. */
export type Serve<A, R> = (wake: Wake) => Effect.Effect<A, never, R>

/** One delivery served: decoded once, handed to the runtime, and logged, whatever it held. */
const delivered = <A, R>(
	serve: Serve<A, R>,
	payload: string,
	metadata: MessageMetadata
): Effect.Effect<void, never, R> =>
	Schema.decodeEffect(WakeJson)(payload).pipe(
		Effect.matchEffect({
			onFailure: (issue) =>
				Effect.logWarning("a delivery that is no den wake, acknowledged", {
					issue: issue.message
				}),
			onSuccess: (wake) =>
				Effect.flatMap(serve(wake), (ended) => Effect.logDebug("den wake served", { wake, ended }))
		}),
		Effect.catchCause((cause) =>
			Effect.logError(
				"den's runtime died serving a wake; acknowledged, the census rings its step",
				cause
			)
		),
		Effect.annotateLogs({
			messageId: metadata.messageId,
			deliveryCount: metadata.deliveryCount
		})
	)

/**
 * Whatever failed, the handler or the acknowledgement after it, acknowledge: the client then retries the
 * acknowledgement itself, on a network error or a 429 that says when.
 */
const acknowledge: RetryHandler = () => ({ acknowledge: true })

/**
 * The consumer's route: each delivery decoded once with the wake contract's schema and served by `serve`, then
 * acknowledged, a `fenced` ending (the deployment's fault, `stale` or `credentialRefused`) as much as any other. Its
 * lease is the function's lifetime, so the queue delivers a wake again only once the invocation that held it can no
 * longer be running.
 */
export const consumer = <A, R>(serve: Serve<A, R>): Effect.Effect<Route, never, R | VercelQueue> =>
	Effect.gen(function* () {
		const queue = yield* VercelQueue
		const context = yield* Effect.context<R>()
		const run = Effect.runPromiseWith(context)
		return queue.handleCallback((payload, metadata) => run(delivered(serve, payload, metadata)), {
			visibilityTimeoutSeconds: visibilityTimeoutSeconds.value,
			retry: acknowledge
		})
	})
