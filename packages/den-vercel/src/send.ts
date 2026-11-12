import { idempotencyKey, type Ring, Transport } from "@bjornpagen/den/transport"
import type { BatchSendMessage } from "@vercel/queue"
import { Array as Arr, Duration, Effect, Layer, Option, Schema } from "effect"
import { batchMessages, maxDelaySeconds } from "#limits.ts"
import { type Queue, TOPIC, VercelQueue, WakeJson } from "#queue.ts"

/**
 * Sending wakes. Each is one message on the one topic, keyed by the contract's idempotency key, one per step attempt
 * and one per admission, so a send retried or rung twice for one of them is delivered once; an exact timer is the
 * message's delay. A send that fails is logged and never fails its caller: the relay or the census rings again every
 * step a lost wake would have.
 */

/** A batch send that threw: no message of it is known to have been accepted, though some may have been. */
class SendFailed extends Schema.TaggedError<SendFailed, { readonly brand: unique symbol }>()(
	"SendFailed",
	{ cause: Schema.Defect() }
) {}

/**
 * The message a ring is sent as: its wake's JSON under the wake's key, held back for its delay in whole seconds, rounded
 * up so a timer never rings early. A ring held longer than a message may be delayed is not sent: the census rings its
 * step once it is due.
 */
export const messageOf = (ring: Ring): Effect.Effect<Option.Option<BatchSendMessage<string>>> =>
	Effect.map(Effect.orDie(Schema.encodeEffect(WakeJson)(ring.wake)), (payload) => {
		const key = idempotencyKey(ring.wake)
		const delaySeconds = Math.ceil(Duration.toMillis(ring.delay) / 1000)
		if (delaySeconds > maxDelaySeconds.value) {
			return Option.none()
		}
		return Option.some(
			delaySeconds > 0
				? { payload, idempotencyKey: key, delaySeconds }
				: { payload, idempotencyKey: key }
		)
	})

/** One batch sent, every message it failed to send logged. */
const sent = (queue: Queue, batch: ReadonlyArray<BatchSendMessage<string>>): Effect.Effect<void> =>
	Effect.tryPromise({
		try: () => queue.sendBatch(TOPIC, batch),
		catch: (cause) => SendFailed.make({ cause })
	}).pipe(
		Effect.flatMap((results) =>
			Effect.forEach(
				Arr.zip(batch, results),
				([message, result]) =>
					result.status === "failed"
						? Effect.logWarning("den wake not sent; the census rings its step", {
								key: message.idempotencyKey,
								status: result.statusCode,
								error: result.error,
								retryable: result.retryable
							})
						: Effect.void,
				{ discard: true }
			)
		),
		Effect.catch((failed) =>
			Effect.logWarning("den wakes not known to be sent; the census rings their steps", {
				keys: Arr.map(batch, (message) => message.idempotencyKey),
				cause: failed.cause
			})
		)
	)

/** Rings wakes through `queue`, in batches of as many messages as one request takes, and never fails. */
const ringOn = (queue: Queue, rings: ReadonlyArray<Ring>): Effect.Effect<void> =>
	Effect.gen(function* () {
		const messages = yield* Effect.forEach(rings, messageOf)
		yield* Effect.forEach(
			Arr.chunksOf(Arr.getSomes(messages), batchMessages.value),
			(batch) => sent(queue, batch),
			{ discard: true }
		)
	})

/** den's transport over the Vercel Queues client the context holds. */
export const sender: Effect.Effect<Transport["Service"], never, VercelQueue> = Effect.map(
	VercelQueue,
	(queue) => Transport.of({ send: (rings) => ringOn(queue, rings) })
)

/** den's transport on Vercel Queues. */
export const transport: Layer.Layer<Transport, never, VercelQueue> = Layer.effect(Transport, sender)
