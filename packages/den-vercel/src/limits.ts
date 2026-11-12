import {
	censusPeriodSeconds,
	derived,
	functionLifetimeSeconds,
	published
} from "@bjornpagen/den/limits"

/**
 * The numbers den's Vercel Queues transport bounds something by, minted by den's own mints: what Vercel Queues
 * publishes, and what follows from it and from den's limits.
 */

/**
 * How long a delivery's lease lasts after the client last renewed it: as long as the invocation it woke can live, so
 * a wake is delivered again only once the invocation that held it can no longer be running. The client renews the
 * lease while the handler runs, so this bounds how long a dead holder's wake stays hidden, never how long a turn runs.
 */
export const visibilityTimeoutSeconds = derived({
	owner: "den's Vercel Queues consumer",
	unit: "seconds",
	scope:
		"one delivery's lease, from the client's last renewal until the queue may deliver the wake again",
	from: [functionLifetimeSeconds],
	derivation:
		"a delivery's invocation lives at most functionLifetimeSeconds, so its lease lapses only once that invocation is certainly gone",
	compute: ([lifetime]) => lifetime.value
})

/**
 * How many deliveries Vercel Queues retries on the schedule a trigger configures; past them the queue applies a
 * backoff of its own, whose schedule it does not publish.
 */
export const configuredRetryDeliveries = published({
	value: 32,
	owner: "Vercel Queues, the queue/v2beta trigger's retries",
	unit: "deliveries",
	scope: "the deliveries of one message that Vercel retries at the trigger's configured delay",
	constraint: "protocol constant",
	source: "https://vercel.com/docs/queues/pricing",
	quote: "Retry behavior (first 32 attempts) | - | - | Configured delay",
	verified: "2026-11-11"
})

/**
 * The most deliveries of one wake. The consumer acknowledges every delivery it runs, so a wake comes again only when
 * its invocation died first (killed at its lifetime, crashed, or never started): a redelivery is the only prompt heal
 * of a wake whose invocation died before it claimed, and each one costs an invocation, which a deployment that cannot
 * finish one would otherwise spend until the message expires.
 */
export const maxDeliveries = derived({
	owner: "den's Vercel Queues trigger",
	unit: "deliveries",
	scope:
		"the deliveries of one wake message, after which the queue drops it and the census rings its step",
	from: [configuredRetryDeliveries],
	derivation:
		"every delivery the queue makes on the schedule the trigger configures, and none on the backoff Vercel does not publish, so a wake's last delivery comes at a time the docs state",
	compute: ([configured]) => configured.value
})

/** How many messages one batch send takes; a batch of none, or of more, throws before anything is sent. */
export const batchMessages = published({
	value: 100,
	owner: "@vercel/queue, sendBatch",
	unit: "messages",
	scope: "the messages of one sendBatch request",
	constraint: "hard quota",
	source: "https://vercel.com/docs/queues/sdk",
	quote: "Use `sendBatch` to publish 1 to 100 messages in a single request.",
	verified: "2026-11-11"
})

/**
 * How long a message lives when its send names no retention: its idempotency key deduplicates for as long, and no
 * delay may reach past it.
 */
export const retentionSeconds = published({
	value: 86_400,
	owner: "Vercel Queues, a message's retention",
	unit: "seconds",
	scope: "one message, from its send until the queue deletes it whatever its state",
	constraint: "configurable default",
	source: "https://vercel.com/docs/queues/pricing",
	quote: "Message retention (TTL) | 60 seconds | 7 days | 24 hours",
	verified: "2026-11-11"
})

/**
 * The longest a wake's delivery can be held back: what is left of its retention once every delivery it may need has its
 * lease, since a message delayed to its retention would expire the instant it became visible. A longer timer is not
 * sent; the census rings its step once it is due.
 */
export const maxDelaySeconds = derived({
	owner: "den's Vercel Queues transport",
	unit: "seconds",
	scope: "the delaySeconds of one wake sent with a delay",
	from: [retentionSeconds, maxDeliveries, visibilityTimeoutSeconds],
	derivation:
		"a message is consumed only while it is unexpired, so a delayed wake must still have room for maxDeliveries deliveries, each lapsing a visibility timeout after the last, before its retention ends",
	compute: ([retention, deliveries, visibility]) =>
		retention.value - deliveries.value * visibility.value
})

/** The longest idempotency key a send may carry; a longer one is refused with a 400. */
export const idempotencyKeyLength = published({
	value: 256,
	owner: "Vercel Queues, a send's idempotency key",
	unit: "characters",
	scope: "the idempotencyKey of one message",
	constraint: "hard quota",
	source: "https://vercel.com/docs/queues/sdk",
	quote:
		"Deduplication key for the message. The deduplication window is the message's retention period. Maximum 256 characters",
	verified: "2026-11-11"
})

/** The census cron's step, in the minutes a cron expression's minute field counts: one tick per census period. */
export const censusStepMinutes = derived({
	owner: "den's census cron",
	unit: "minutes",
	scope: "the step of the census cron's minute field, `*/n`",
	from: [censusPeriodSeconds],
	derivation:
		"the census ticks once per censusPeriodSeconds, which a minute field counts in minutes",
	compute: ([period]) => period.value / 60
})
