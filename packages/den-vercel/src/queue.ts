import { WakeSchema } from "@bjornpagen/den/transport"
import type {
	BatchSendMessage,
	BatchSendResult,
	MessageHandler,
	RetryHandler,
	Transport as Serializer
} from "@vercel/queue"
import { Context, Schema } from "effect"

/**
 * den on Vercel Queues: one topic carries every wake of every flow, and one push consumer takes them all, so every
 * function runs every step kind and a wake needs no route of its own.
 */

/** The topic every wake is sent to, and the one queue trigger consumes. */
export const TOPIC = "den-wakes"

/** A wake as a message's payload: its JSON text, encoded and decoded by the contract's own schema, once. */
export const WakeJson = Schema.fromJsonString(WakeSchema)

/**
 * The client's serializer for den's payloads: JSON text sent as its UTF-8 bytes, and read back as text, so the
 * consumer decodes every delivery itself, a body that is no JSON included, and acknowledges it. The client's default
 * parses JSON before the handler runs and answers a body it cannot parse with a 500 the queue redelivers.
 */
export const text = {
	contentType: "application/json",
	serialize: (payload: string): Buffer => Buffer.from(payload, "utf8"),
	deserialize: (stream: ReadableStream<Uint8Array>): Promise<string> => new Response(stream).text()
} as const satisfies Serializer<string>

/** How the consumer's route is built: its lease, and what the client does when the handler or its acknowledgement
 * failed. */
export interface CallbackOptions {
	readonly visibilityTimeoutSeconds: number
	readonly retry: RetryHandler
}

/**
 * What den asks of Vercel Queues' client, in its own terms: a batch send of text payloads, and a push consumer's route
 * over a handler of them. `@vercel/queue`'s QueueClient meets it with the `text` serializer; the suites' fake does too.
 */
export interface Queue {
	readonly sendBatch: (
		topic: string,
		messages: ReadonlyArray<BatchSendMessage<string>>
	) => Promise<ReadonlyArray<BatchSendResult>>
	readonly handleCallback: (
		handler: MessageHandler<string>,
		options: CallbackOptions
	) => (request: Request) => Promise<Response>
}

/** The Vercel Queues client the transport sends through and the consumer's route is built on. */
export class VercelQueue extends Context.Service<VercelQueue, Queue>()(
	"@bjornpagen/den-vercel/queue/VercelQueue"
) {}
