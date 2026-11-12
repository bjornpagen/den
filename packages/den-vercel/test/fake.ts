import type {
	BatchSendMessage,
	BatchSendResult,
	MessageHandler,
	MessageMetadata
} from "@vercel/queue"
import { Array as Arr, DateTime, Effect, Option, Order, Schema } from "effect"
import { batchMessages, idempotencyKeyLength, retentionSeconds } from "#limits.ts"
import { type CallbackOptions, type Queue, text } from "#queue.ts"

/**
 * A fake of `@vercel/queue`'s client, over a broker of its own with a clock the suite moves: it keeps what Vercel Queues
 * documents (an idempotency key drops a later send for its message's retention, a message lives for its retention, a
 * delay holds it back, a lease that lapses unacknowledged delivers it again, at most `maxDeliveries` times, and the
 * client serializes with den's `text`), and it drops, duplicates, delays and redelivers wherever the suite's fates say.
 */

/** What befalls one batch request: answered, or lost on the network before or after the queue accepted it. */
export type BatchFate = "answered" | "lost unaccepted" | "lost accepted"

/** What befalls one message of an answered batch: accepted, or refused with a retryable 503. */
export type MessageFate = "accepted" | "refused"

/**
 * What befalls one delivery: the route runs; the function is never reached; the invocation dies after its handler ran
 * and before it acknowledged; or the route runs and the infrastructure delivers the message once more afterwards.
 */
export type DeliveryFate = "runs" | "unreachable" | "dies" | "doubled"

/** What befalls one acknowledgement the client sends: it lands, or the network loses it. */
export type AcknowledgementFate = "lands" | "lost"

/** The faults the suite chooses, one decision at a time. */
export interface Fates {
	readonly batch: () => BatchFate
	readonly message: () => MessageFate
	readonly delivery: () => DeliveryFate
	readonly acknowledgement: () => AcknowledgementFate
}

/** The fates of a queue that fails nowhere. */
export const faultless: Fates = {
	batch: () => "answered",
	message: () => "accepted",
	delivery: () => "runs",
	acknowledgement: () => "lands"
}

/** One message a sender asked the queue to send, and what became of it. */
export interface Submitted {
	readonly topic: string
	readonly at: number
	readonly payload: string
	readonly key: Option.Option<string>
	readonly delaySeconds: Option.Option<number>
	readonly outcome: "accepted" | "deduplicated" | "refused" | "lost" | "invalid"
}

/**
 * How one delivery that reached the route ended: acknowledged; acknowledged by the retry hook's directive once the
 * handler threw or the first acknowledgement was lost; acknowledged by the consumer but lost on the network both times
 * the client sent it; handed back for a delay; left to lapse because the handler threw with no directive; or cut short
 * when the invocation died.
 */
export type Settled =
	| "acknowledged"
	| "acknowledged by the retry hook"
	| "acknowledgement lost"
	| "rescheduled"
	| "failed"
	| "died"

/** One delivery, as the broker made it. */
export interface Delivered {
	readonly message: string
	readonly key: Option.Option<string>
	readonly count: number
	readonly fate: DeliveryFate
	readonly settled: Option.Option<Settled>
	readonly status: Option.Option<number>
}

/** A message the queue holds. */
interface Held {
	readonly id: string
	readonly topic: string
	readonly key: Option.Option<string>
	readonly body: Uint8Array<ArrayBuffer>
	readonly acceptedAt: number
	readonly expiresAt: number
	readonly visibleAt: number
	readonly deliveries: number
	readonly settled: "pending" | "acknowledged" | "dropped"
	readonly doubled: boolean
}

/** The trigger the fake's one consumer group is configured by, as `vercel.json` holds it. */
export interface Trigger {
	readonly topic: string
	readonly maxDeliveries: number
}

/** A route, as the consumer returns it. */
type Route = (request: Request) => Promise<Response>

/** The fake client and the broker behind it. */
export interface Fake {
	readonly queue: Queue
	readonly now: () => number
	readonly advance: (instant: number) => void
	readonly submitted: () => ReadonlyArray<Submitted>
	readonly delivered: () => ReadonlyArray<Delivered>
	readonly batches: () => number
	readonly nextDelivery: () => Option.Option<number>
	readonly holdsKey: (key: string) => Option.Option<number>
	readonly dropped: () => ReadonlyArray<Option.Option<string>>
	readonly deliverDue: (route: Route) => Effect.Effect<void>
}

/** The header the fake's callback request names its message by. */
const MESSAGE = "x-fake-message"

/** The handler a callback ran threw, or returned a promise that rejected. */
class HandlerThrew extends Schema.TaggedError<HandlerThrew, { readonly brand: unique symbol }>()(
	"HandlerThrew",
	{ cause: Schema.Defect() }
) {}

const dateOf = (millis: number): Date => DateTime.toDateUtc(DateTime.makeUnsafe(millis))

/** A fake of the client whose consumer group reads `trigger`, under the suite's `fates`, its clock at 0. */
export const fake = (trigger: Trigger, fates: Fates): Fake => {
	let now = 0
	let minted = 0
	let batches = 0
	let options = Option.none<CallbackOptions>()
	let handler = Option.none<MessageHandler<string>>()
	const held = new Map<string, Held>()
	const windows = new Map<string, number>()
	const submitted: Array<Submitted> = []
	const delivered: Array<Delivered> = []
	const fateOf = new Map<string, DeliveryFate>()
	const settledOf = new Map<string, Settled>()

	const visibilityMillis = (): number =>
		Option.match(options, {
			onNone: () => 0,
			onSome: (registered) => registered.visibilityTimeoutSeconds * 1000
		})

	/** A lease lapsed: the message comes back after the lease, or is dropped once its deliveries are spent. */
	const lapse = (message: Held, after: number): void => {
		held.set(message.id, {
			...message,
			visibleAt: now + after,
			settled: message.deliveries >= trigger.maxDeliveries ? "dropped" : "pending"
		})
	}

	const accept = (topic: string, message: BatchSendMessage<string>): BatchSendResult => {
		const key = Option.fromNullishOr(message.idempotencyKey)
		const delaySeconds = Option.fromNullishOr(message.delaySeconds)
		const record = (outcome: Submitted["outcome"]): void => {
			submitted.push({ topic, at: now, payload: message.payload, key, delaySeconds, outcome })
		}
		const invalid =
			Option.exists(key, (k) => k.length > idempotencyKeyLength.value) ||
			Option.exists(delaySeconds, (delay) => delay > retentionSeconds.value)
		if (invalid) {
			record("invalid")
			return { status: "failed", statusCode: 400, error: "invalid message", retryable: false }
		}
		if (
			Option.exists(key, (k) =>
				Option.exists(Option.fromNullishOr(windows.get(k)), (end) => end > now)
			)
		) {
			record("deduplicated")
			minted += 1
			return { status: "sent", messageId: `duplicate-${minted}` }
		}
		minted += 1
		const id = `message-${minted}`
		const expiresAt = now + retentionSeconds.value * 1000
		held.set(id, {
			id,
			topic,
			key,
			body: Uint8Array.from(text.serialize(message.payload)),
			acceptedAt: now,
			expiresAt,
			visibleAt: now + Option.getOrElse(delaySeconds, () => 0) * 1000,
			deliveries: 0,
			settled: "pending",
			doubled: false
		})
		Option.map(key, (k) => windows.set(k, expiresAt))
		record("accepted")
		return { status: "sent", messageId: id }
	}

	const sendBatch: Queue["sendBatch"] = (topic, messages) => {
		if (messages.length < 1 || messages.length > batchMessages.value) {
			return Promise.reject(new RangeError("Batch size must be between 1 and 100 messages"))
		}
		batches += 1
		const fate = fates.batch()
		if (fate === "lost unaccepted") {
			Arr.forEach(messages, (message) => {
				submitted.push({
					topic,
					at: now,
					payload: message.payload,
					key: Option.fromNullishOr(message.idempotencyKey),
					delaySeconds: Option.fromNullishOr(message.delaySeconds),
					outcome: "lost"
				})
			})
			return Promise.reject(new TypeError("fetch failed"))
		}
		const results = Arr.map(messages, (message): BatchSendResult => {
			if (fate === "answered" && fates.message() === "refused") {
				submitted.push({
					topic,
					at: now,
					payload: message.payload,
					key: Option.fromNullishOr(message.idempotencyKey),
					delaySeconds: Option.fromNullishOr(message.delaySeconds),
					outcome: "refused"
				})
				return { status: "failed", statusCode: 503, error: "unavailable", retryable: true }
			}
			return accept(topic, message)
		})
		return fate === "lost accepted"
			? Promise.reject(new TypeError("fetch failed"))
			: Promise.resolve(results)
	}

	const metadataOf = (message: Held): MessageMetadata => ({
		messageId: message.id,
		deliveryCount: message.deliveries,
		createdAt: dateOf(message.acceptedAt),
		expiresAt: dateOf(message.expiresAt),
		topicName: message.topic,
		consumerGroup: "den",
		region: "iad1"
	})

	/** One acknowledgement the client sends, landed or lost. */
	const acknowledged = (message: Held): boolean => {
		if (fates.acknowledgement() === "lost") {
			return false
		}
		held.set(message.id, { ...message, settled: "acknowledged" })
		return true
	}

	/** What the client does once the handler threw or its acknowledgement failed: it asks the consumer's retry hook. */
	const retried = (message: Held, registered: CallbackOptions, error: unknown): Settled => {
		const directive = registered.retry(error, metadataOf(message))
		if (directive === undefined) {
			lapse(message, visibilityMillis())
			return "failed"
		}
		if ("acknowledge" in directive) {
			if (acknowledged(message)) {
				return "acknowledged by the retry hook"
			}
			lapse(message, visibilityMillis())
			return "acknowledgement lost"
		}
		lapse(message, directive.afterSeconds * 1000)
		return "rescheduled"
	}

	/** The callback the client's route runs for one delivery, as `handleCallback`'s route does. */
	const callback = (request: Request): Effect.Effect<Response> =>
		Effect.gen(function* () {
			const id = request.headers.get(MESSAGE) ?? ""
			const message = yield* Effect.orDie(Effect.fromNullishOr(held.get(id)))
			const registered = yield* Effect.orDie(Effect.fromOption(options))
			const run = yield* Effect.orDie(Effect.fromOption(handler))
			const payload = yield* Effect.promise(() =>
				text.deserialize(new Blob([message.body]).stream())
			)
			const ran = yield* Effect.exit(
				Effect.tryPromise({
					try: () => Promise.resolve(run(payload, metadataOf(message))),
					catch: (cause) => HandlerThrew.make({ cause })
				})
			)
			if (fateOf.get(id) === "dies") {
				lapse(message, visibilityMillis())
				settledOf.set(id, "died")
				return new Response(null, { status: 502 })
			}
			const settled =
				ran._tag === "Success"
					? acknowledged(message)
						? "acknowledged"
						: retried(message, registered, new TypeError("fetch failed"))
					: retried(message, registered, ran.cause)
			settledOf.set(id, settled)
			return settled === "failed"
				? Response.json({ error: "Failed to process queue message" }, { status: 500 })
				: Response.json({ status: "success" })
		})

	const handleCallback: Queue["handleCallback"] = (run, registered) => {
		handler = Option.some(run)
		options = Option.some(registered)
		return (request) => Effect.runPromise(callback(request))
	}

	const deliverable = (message: Held): boolean =>
		message.topic === trigger.topic &&
		message.settled === "pending" &&
		message.visibleAt <= now &&
		now < message.expiresAt

	/** One delivery of `message` through the consumer's route. */
	const deliver = (route: Route, message: Held): Effect.Effect<void> =>
		Effect.gen(function* () {
			const fate = fates.delivery()
			const counted: Held = { ...message, deliveries: message.deliveries + 1 }
			held.set(message.id, counted)
			fateOf.set(message.id, fate)
			settledOf.delete(message.id)
			if (fate === "unreachable") {
				lapse(counted, visibilityMillis())
				delivered.push({
					message: message.id,
					key: message.key,
					count: counted.deliveries,
					fate,
					settled: Option.none(),
					status: Option.none()
				})
				return
			}
			const response = yield* Effect.promise(() =>
				route(
					new Request("https://queue.invalid/den", {
						method: "POST",
						headers: { [MESSAGE]: message.id }
					})
				)
			)
			delivered.push({
				message: message.id,
				key: message.key,
				count: counted.deliveries,
				fate,
				settled: Option.fromNullishOr(settledOf.get(message.id)),
				status: Option.some(response.status)
			})
			const after = held.get(message.id)
			if (fate === "doubled" && after?.settled === "acknowledged" && !after.doubled) {
				held.set(message.id, { ...after, settled: "pending", visibleAt: now, doubled: true })
			}
		})

	const deliverDue = (route: Route): Effect.Effect<void> =>
		Effect.suspend(() =>
			Option.match(Arr.findFirst([...held.values()], deliverable), {
				onNone: () => Effect.void,
				onSome: (message) => Effect.andThen(deliver(route, message), deliverDue(route))
			})
		)

	return {
		queue: { sendBatch, handleCallback },
		now: () => now,
		advance: (instant) => {
			now = Math.max(now, instant)
		},
		submitted: () => submitted,
		delivered: () => delivered,
		batches: () => batches,
		nextDelivery: () =>
			Arr.match(
				Arr.filter(
					[...held.values()],
					(message) =>
						message.topic === trigger.topic &&
						message.settled === "pending" &&
						message.visibleAt < message.expiresAt
				),
				{
					onEmpty: () => Option.none(),
					onNonEmpty: (pending) =>
						Option.some(
							Math.max(
								now,
								Arr.min(
									Arr.map(pending, (message) => message.visibleAt),
									Order.Number
								)
							)
						)
				}
			),
		holdsKey: (key) => Option.filter(Option.fromNullishOr(windows.get(key)), (end) => end > now),
		dropped: () =>
			Arr.map(
				Arr.filter([...held.values()], (message) => message.settled === "dropped"),
				(message) => message.key
			),
		deliverDue
	}
}
