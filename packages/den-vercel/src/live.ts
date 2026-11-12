import { QueueClient } from "@vercel/queue"
import { Layer } from "effect"
import { text, VercelQueue } from "#queue.ts"

/**
 * Vercel Queues' own client, in the deployment it runs in: the region, the credentials (OIDC) and the deployment a
 * send is pinned to are the client's defaults, read from the function's environment.
 */
export const live: Layer.Layer<VercelQueue> = Layer.sync(VercelQueue, () => {
	const client = new QueueClient({ transport: text })
	return {
		sendBatch: (topic, messages) => client.sendBatch(topic, messages),
		handleCallback: (handler, options) => client.handleCallback(handler, options)
	}
})
