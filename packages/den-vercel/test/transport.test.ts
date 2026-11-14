import { censusPeriodSeconds, caseHang } from "@bjornpagen/den/limits"
import { idempotencyKey, type Ring, type Wake, WakeSchema } from "@bjornpagen/den/transport"
import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { constant, element, type Gen, int, oneOf, weighted } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, it } from "@effect/vitest"
import {
	Array as Arr,
	Duration,
	Effect,
	Equal,
	Formatter,
	Option,
	Order,
	Record as Rec,
	Schema
} from "effect"
import { consumer } from "#consumer.ts"
import {
	batchMessages,
	maxDelaySeconds,
	maxDeliveries,
	retentionSeconds,
	visibilityTimeoutSeconds
} from "#limits.ts"
import { TOPIC, VercelQueue, WakeJson } from "#queue.ts"
import { sender } from "#send.ts"
import { type Fake, type Fates, fake, faultless } from "#test/fake.ts"
import { type Encoded, encodedWake, wakes } from "#test/wakes.ts"

/**
 * The transport against a fake of Vercel Queues that drops, duplicates, delays and redelivers: every wake sent is
 * delivered at least once or healed by a census; keys never collide across distinct wakes, and repeat for a wake rung
 * twice; a timer is held for its delay and never less.
 */

const decoded = (encoded: ReadonlyArray<Encoded>) =>
	Effect.orDie(Effect.forEach(encoded, (wake) => Schema.decodeUnknownEffect(WakeSchema)(wake)))

/** den's transport and consumer over a fake whose consumer group reads `maxDeliveries` from its trigger. */
const harness = (queue: Fake) => ({
	send: (rings: ReadonlyArray<Ring>) =>
		Effect.flatMap(Effect.provideService(sender, VercelQueue, queue.queue), (transport) =>
			transport.send(rings)
		),
	route: <A>(serve: (wake: Wake) => Effect.Effect<A>) =>
		consumer(serve).pipe(Effect.provideService(VercelQueue, queue.queue))
})

type Healing =
	| "delivered at once"
	| "refused, then rung by the census"
	| "lost before acceptance, then rung by the census"
	| "lost after acceptance, the census's ring deduplicated"
	| "redelivered after a lapsed lease"
	| "dropped after its deliveries, then rung past its key's window"
	| "delivered twice"

/** A run of the transport: the wakes a commit sends, the faults the queue may still inflict, its trigger's ceiling. */
interface Run {
	readonly wakes: ReadonlyArray<Encoded>
	readonly faults: number
	readonly maxDeliveries: number
}

/** The fates of a queue that inflicts at most `budget` faults, each drawn from the case's tape. */
const faulty = (c: Case<Healing>, budget: number): Fates => {
	let left = budget
	const fault =
		<F extends string>(healthy: F, faults: readonly [F, ...Array<F>]) =>
		(): F => {
			if (left <= 0) {
				return healthy
			}
			const fate = c.draw(
				weighted<F>([
					[3, constant(healthy)],
					[2, element(faults)]
				])
			)
			if (fate !== healthy) {
				left -= 1
			}
			return fate
		}
	return {
		batch: fault("answered", ["lost unaccepted", "lost accepted"]),
		message: fault("accepted", ["refused"]),
		delivery: fault("runs", ["unreachable", "dies", "doubled"]),
		acknowledgement: fault("lands", ["lost"])
	}
}

const period = censusPeriodSeconds.value * 1000

const run: Gen<Run> = (source) => ({
	wakes: source.draw(wakes({ min: 1, max: 5 })),
	faults: source.draw(int(0, 6)),
	maxDeliveries: source.draw(oneOf([int(1, 2), constant(maxDeliveries.value)]))
})

it.effect("every wake sent is delivered at least once or healed by a census", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "delivered or healed",
				oracle: {
					kind: "specification",
					name: "every wake sent is heard by the runtime before the horizon its faults allow"
				},
				draw: drawn(run),
				literal: Formatter.format,
				coverage: required<Healing>(
					[
						"delivered at once",
						"refused, then rung by the census",
						"lost before acceptance, then rung by the census",
						"lost after acceptance, the census's ring deduplicated",
						"redelivered after a lapsed lease",
						"dropped after its deliveries, then rung past its key's window",
						"delivered twice"
					],
					{ cases: 200, sense: notesOnly }
				),
				kept: [],
				runs: 200,
				shrink: boundedShrink(40),
				concurrency: 1,
				steerEvery: 16,
				caseHang
			},
			(drawnRun, c) =>
				Effect.gen(function* () {
					const sent = yield* decoded(drawnRun.wakes)
					const queue = fake(
						{ topic: TOPIC, maxDeliveries: drawnRun.maxDeliveries },
						faulty(c, drawnRun.faults)
					)
					const { send, route: routeOf } = harness(queue)
					const heard = new Map<string, number>()
					const route = yield* routeOf((wake) =>
						Effect.sync(() => {
							const key = idempotencyKey(wake)
							heard.set(key, (heard.get(key) ?? 0) + 1)
						})
					)
					const keys = Arr.dedupe(Arr.map(sent, idempotencyKey))
					const unheard = () => Arr.filter(sent, (wake) => !heard.has(idempotencyKey(wake)))
					const lease = visibilityTimeoutSeconds.value * 1000
					const horizon =
						(drawnRun.faults + 1) *
						(retentionSeconds.value * 1000 + drawnRun.maxDeliveries * lease + 2 * period)
					yield* send(sent)
					while (Arr.isReadonlyArrayNonEmpty(unheard()) && queue.now() <= horizon) {
						yield* queue.deliverDue(route)
						const waiting = unheard()
						if (!Arr.isReadonlyArrayNonEmpty(waiting)) {
							break
						}
						const held = Arr.map(waiting, (wake) => queue.holdsKey(idempotencyKey(wake)))
						const windows = Arr.getSomes(held)
						const census =
							Arr.isReadonlyArrayNonEmpty(windows) && windows.length === held.length
								? Math.ceil(Arr.min(windows, Order.Number) / period) * period
								: (Math.floor(queue.now() / period) + 1) * period
						const delivery = Option.getOrElse(queue.nextDelivery(), () => census)
						queue.advance(Math.min(census, delivery))
						if (census <= delivery) {
							yield* send(waiting)
						}
					}
					assert.deepStrictEqual(
						Arr.map(unheard(), idempotencyKey),
						[],
						"a wake neither delivered nor healed before its horizon"
					)
					const submitted = queue.submitted()
					const delivered = queue.delivered()
					const later = (key: string, outcome: string) =>
						Arr.some(submitted, (s) => Option.contains(s.key, key) && s.outcome === outcome)
					if (
						Arr.some(
							delivered,
							(d) => d.count === 1 && d.fate === "runs" && d.status._tag === "Some"
						)
					) {
						c.note("delivered at once")
					}
					if (Arr.some(keys, (key) => later(key, "refused") && later(key, "accepted"))) {
						c.note("refused, then rung by the census")
					}
					if (
						Arr.some(
							keys,
							(key) =>
								Arr.some(submitted, (s) => Option.contains(s.key, key) && s.outcome === "lost") &&
								later(key, "accepted")
						)
					) {
						c.note("lost before acceptance, then rung by the census")
					}
					if (Arr.some(submitted, (s) => s.outcome === "deduplicated")) {
						c.note("lost after acceptance, the census's ring deduplicated")
					}
					if (Arr.some(delivered, (d) => d.count > 1)) {
						c.note("redelivered after a lapsed lease")
					}
					if (
						Arr.some(queue.dropped(), (key) =>
							Option.exists(
								key,
								(k) =>
									Arr.filter(
										submitted,
										(s) => Option.contains(s.key, k) && s.outcome === "accepted"
									).length > 1
							)
						)
					) {
						c.note("dropped after its deliveries, then rung past its key's window")
					}
					if (Arr.some(delivered, (d) => d.fate === "doubled")) {
						c.note("delivered twice")
					}
				})
		)
	)
)

type Keying = "a wake rung twice" | "distinct wakes" | "more wakes than one batch holds"

const many: Gen<ReadonlyArray<Encoded>> = oneOf([
	wakes({ min: 1, max: 8 }),
	wakes({ min: batchMessages.value + 1, max: 2 * batchMessages.value + 5 })
])

it.effect(
	"keys never collide across distinct wakes, and a wake rung twice is delivered once",
	(ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "keys",
					oracle: {
						kind: "universal",
						name: "key(a) = key(b) ⇔ a = b over every message sent, each payload the wake it keys"
					},
					draw: drawn(many),
					literal: Formatter.format,
					coverage: required<Keying>(
						["a wake rung twice", "distinct wakes", "more wakes than one batch holds"],
						{
							cases: 40,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 100,
					shrink: boundedShrink(40),
					concurrency: 1,
					steerEvery: 16,
					caseHang
				},
				(encoded, c) =>
					Effect.gen(function* () {
						const sent = yield* decoded(encoded)
						const queue = fake({ topic: TOPIC, maxDeliveries: maxDeliveries.value }, faultless)
						const { send, route: routeOf } = harness(queue)
						const heard = new Map<string, number>()
						const route = yield* routeOf((wake) =>
							Effect.sync(() => {
								heard.set(idempotencyKey(wake), (heard.get(idempotencyKey(wake)) ?? 0) + 1)
							})
						)
						yield* send(sent)
						yield* queue.deliverDue(route)
						const submitted = queue.submitted()
						assert.strictEqual(submitted.length, sent.length)
						assert.strictEqual(queue.batches(), Math.ceil(sent.length / batchMessages.value))
						const payloads = yield* Effect.orDie(
							Effect.forEach(submitted, (s) => Schema.decodeEffect(WakeJson)(s.payload))
						)
						assert.deepStrictEqual(payloads, sent)
						assert.deepStrictEqual(
							Arr.map(submitted, (s) => Option.getOrUndefined(s.key)),
							Arr.map(sent, idempotencyKey)
						)
						const byKey = Arr.groupBy(sent, idempotencyKey)
						Arr.forEach(Rec.values(byKey), (group) => {
							assert.isTrue(
								Arr.every(group, (wake) => Equal.equals(wake, group[0])),
								"one key, two wakes"
							)
						})
						const distinct = Arr.dedupeWith(sent, Equal.equals)
						assert.strictEqual(Rec.size(byKey), distinct.length, "two wakes, one key")
						if (distinct.length < sent.length) {
							c.note("a wake rung twice")
						}
						if (distinct.length > 1) {
							c.note("distinct wakes")
						}
						if (sent.length > batchMessages.value) {
							c.note("more wakes than one batch holds")
						}
						const keys = Arr.dedupe(Arr.map(sent, idempotencyKey))
						assert.strictEqual(heard.size, keys.length)
						assert.deepStrictEqual(
							Arr.map(keys, (key) => heard.get(key)),
							Arr.map(keys, () => 1)
						)
					})
			)
		)
)

type Timing = "at once" | "held back" | "past the longest delay"

interface Timer {
	readonly wake: Encoded
	readonly delayMillis: number
}

const timer: Gen<Timer> = (source) => ({
	wake: source.draw(encodedWake),
	delayMillis: source.draw(
		oneOf([
			constant(0),
			int(1, 5_000),
			int(maxDelaySeconds.value * 1000 - 2_000, maxDelaySeconds.value * 1000 + 2_000)
		])
	)
})

it.effect(
	"a timer is held for its delay and never less; one past the longest delay is left to the census",
	(ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "timers",
					oracle: {
						kind: "specification",
						name: "a ring is delivered at the first whole second at or after its delay, or not sent past the cap"
					},
					draw: drawn(timer),
					literal: Formatter.format,
					coverage: required<Timing>(["at once", "held back", "past the longest delay"], {
						cases: 40,
						sense: notesOnly
					}),
					kept: [],
					runs: 100,
					shrink: boundedShrink(40),
					concurrency: 1,
					steerEvery: 16,
					caseHang
				},
				(drawnTimer, c) =>
					Effect.gen(function* () {
						const wake = yield* Effect.orDie(
							Schema.decodeUnknownEffect(WakeSchema)(drawnTimer.wake)
						)
						const queue = fake({ topic: TOPIC, maxDeliveries: maxDeliveries.value }, faultless)
						const heard: Array<Wake> = []
						const route = yield* consumer((delivered: Wake) =>
							Effect.sync(() => heard.push(delivered))
						).pipe(Effect.provideService(VercelQueue, queue.queue))
						const { send } = yield* Effect.provideService(sender, VercelQueue, queue.queue)
						yield* send([{ wake, delay: Duration.millis(drawnTimer.delayMillis) }])
						const dueSeconds = Math.ceil(drawnTimer.delayMillis / 1000)
						const due = dueSeconds * 1000
						if (dueSeconds > maxDelaySeconds.value) {
							c.note("past the longest delay")
							assert.deepStrictEqual(queue.submitted(), [])
							return
						}
						c.note(due === 0 ? "at once" : "held back")
						queue.advance(due - 1)
						yield* queue.deliverDue(route)
						assert.deepStrictEqual(heard, due === 0 ? [wake] : [])
						queue.advance(due)
						yield* queue.deliverDue(route)
						assert.deepStrictEqual(heard, [wake])
						assert.isAtLeast(due, drawnTimer.delayMillis)
					})
			)
		)
)
