import { functionLifetimeSeconds } from "@bjornpagen/den/runtime/turn"
import { idempotencyKey, type Ring, Transport } from "@bjornpagen/den/transport"
import type { BatchSendMessage } from "@vercel/queue"
import { Array as Arr, Duration, Effect, Layer, Option, Schema } from "effect"
import { type Queue, TOPIC, VercelQueue, WakeJson } from "#queue.ts"

/**
 * How long a delivery's lease lasts after the client last renewed it: as long as the invocation it woke can live, so
 * a wake is delivered again only once the invocation that held it can no longer be running. The client renews the
 * lease while the handler runs, so this bounds how long a dead holder's wake stays hidden, never how long a turn runs.
 *
 * @limitKind derived
 * @owner den's Vercel Queues consumer (packages/den-vercel/src/consumer.ts)
 * @unit seconds
 * @scope one delivery's lease, from the client's last renewal until the queue may deliver the wake again
 * @derivation a delivery's invocation lives at most functionLifetimeSeconds, so its lease lapses only once that
 *   invocation is certainly gone
 * @from {@link functionLifetimeSeconds}
 */
export const visibilityTimeoutSeconds = functionLifetimeSeconds

/**
 * How many deliveries Vercel Queues retries on the schedule a trigger configures; past them the queue applies a
 * backoff of its own, whose schedule it does not publish.
 *
 * @limitKind published
 * @owner Vercel Queues, the queue/v2beta trigger's retries
 * @unit deliveries
 * @scope the deliveries of one message that Vercel retries at the trigger's configured delay
 * @constraint protocol constant
 * @source https://vercel.com/docs/queues/pricing
 * @quote Retry behavior (first 32 attempts) | - | - | Configured delay
 * @verified 2026-11-16
 */
const configuredRetryDeliveries = 32

/**
 * The most deliveries of one wake. The consumer acknowledges every delivery it runs, so a wake comes again only when
 * its invocation died first (killed at its lifetime, crashed, or never started): a redelivery is the only prompt heal
 * of a wake whose invocation died before it claimed, and each one costs an invocation, which a deployment that cannot
 * finish one would otherwise spend until the message expires.
 *
 * @limitKind derived
 * @owner den's Vercel Queues trigger (packages/den-vercel/src/config.ts)
 * @unit deliveries
 * @scope the deliveries of one wake message, after which the queue drops it and the census rings its step
 * @derivation every delivery the queue makes on the schedule the trigger configures, and none on the backoff Vercel
 *   does not publish, so a wake's last delivery comes at a time the docs state
 * @from {@link configuredRetryDeliveries}
 */
export const maxDeliveries = configuredRetryDeliveries

/**
 * How many messages one batch send takes; a batch of none, or of more, throws before anything is sent.
 *
 * @limitKind published
 * @owner @vercel/queue, sendBatch
 * @unit messages
 * @scope the messages of one sendBatch request
 * @constraint hard quota
 * @source https://vercel.com/docs/queues/sdk
 * @quote Use `sendBatch` to publish 1 to 100 messages in a single request.
 * @verified 2026-11-16
 */
export const batchMessages = 100

/**
 * How long a message lives when its send names no retention, as every den send does: its idempotency key
 * deduplicates for its whole retention, and no delay may reach past it.
 *
 * @limitKind published
 * @owner Vercel Queues, a message's retention
 * @unit seconds
 * @scope one message, from its send until the queue deletes it whatever its state
 * @constraint configurable default
 * @source https://vercel.com/docs/queues/pricing
 * @quote Message retention (TTL) | 60 seconds | 7 days | 24 hours
 * @verified 2026-11-16
 */
export const retentionSeconds = 86_400

/**
 * The longest a wake's delivery can be held back: what is left of its retention once every delivery it may need has its
 * lease, since a message delayed to its retention would expire the instant it became visible. A longer timer is not
 * sent; the census rings its step once it is due.
 *
 * @limitKind derived
 * @owner den's Vercel Queues transport (packages/den-vercel/src/send.ts)
 * @unit seconds
 * @scope the delaySeconds of one wake sent with a delay
 * @derivation a message is consumed only while it is unexpired, so a delayed wake must still have room for
 *   maxDeliveries deliveries, each lapsing a visibility timeout after the last, before its retention ends
 * @from {@link retentionSeconds}, {@link maxDeliveries}, {@link visibilityTimeoutSeconds}
 */
export const maxDelaySeconds = retentionSeconds - maxDeliveries * visibilityTimeoutSeconds

/**
 * Sending rings. Each is one message on the one topic, keyed by the contract's idempotency key, its wake and the cause
 * that rang it, so a ring sent again by its cause is delivered once, while a wake another cause rings (a later tick,
 * another commit) is sent anew, whatever became of the first; an exact timer is the message's delay. A send that fails
 * is logged and never fails its caller: the relay or the census rings again every step a lost wake would have.
 */

/** A batch send that threw: no message of it is known to have been accepted, though some may have been. */
class SendFailed extends Schema.TaggedError<SendFailed, { readonly brand: unique symbol }>()(
	"SendFailed",
	{ cause: Schema.Defect() }
) {}

/**
 * The message a ring is sent as: its wake's JSON under the ring's key, held back for its delay in whole seconds, rounded
 * up so a timer never rings early. A ring held longer than a message may be delayed is not sent: the census rings its
 * step once it is due.
 */
export const messageOf = (ring: Ring): Effect.Effect<Option.Option<BatchSendMessage<string>>> =>
	Effect.map(Effect.orDie(Schema.encodeEffect(WakeJson)(ring.wake)), (payload) => {
		const key = idempotencyKey(ring)
		const delaySeconds = Math.ceil(Duration.toSeconds(ring.delay))
		if (delaySeconds > maxDelaySeconds) {
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
			Arr.chunksOf(Arr.getSomes(messages), batchMessages),
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
