import { censusPeriodSeconds } from "@bjornpagen/den/algebra/kinds"
import { caseHangMillis } from "@bjornpagen/den/test/support/suites"
import {
	type Cause,
	idempotencyKey,
	type Ring,
	type Wake,
	WakeSchema,
	wakeText
} from "@bjornpagen/den/transport"
import { type Case, drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { constant, element, type Gen, int, oneOf, weighted } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, it } from "@effect/vitest"
import {
	Array as Arr,
	Duration,
	Effect,
	Equal,
	Formatter,
	Option,
	Record as Rec,
	Schema
} from "effect"
import { consumer } from "#consumer.ts"
import { TOPIC, VercelQueue, WakeJson } from "#queue.ts"
import { batchMessages, maxDelaySeconds, maxDeliveries, visibilityTimeoutSeconds } from "#send.ts"
import { sender } from "#send.ts"
import { type Fake, type Fates, fake, faultless, type Submitted } from "#test/fake.ts"
import {
	type Encoded,
	type EncodedCause,
	type EncodedRing,
	encodedWake,
	ringOf,
	rings
} from "#test/wakes.ts"

/**
 * The transport against a fake of Vercel Queues that drops, duplicates, delays and redelivers: every wake a ring sends
 * is delivered at least once or healed by a census; keys never collide across distinct rings, and repeat for a ring its
 * cause sends again, while a wake two causes ring is sent for each; a timer is held for its delay and never less.
 */

const wakeOf = (encoded: Encoded): Effect.Effect<Wake> =>
	Effect.orDie(Schema.decodeEffect(WakeSchema)(encoded))

const causeOf = (encoded: EncodedCause): Effect.Effect<Cause> => {
	switch (encoded._tag) {
		case "Turn":
			return Effect.map(wakeOf(encoded.by), (by): Cause => ({ _tag: "Turn", by, at: encoded.at }))
		case "Relay":
		case "Census":
		case "Request":
			return Effect.succeed(encoded)
	}
}

/** A drawn ring as the core rings it, held back for `delay`. */
const ringFrom = (encoded: EncodedRing, delay: Duration.Duration): Effect.Effect<Ring> =>
	Effect.zipWith(wakeOf(encoded.wake), causeOf(encoded.cause), (wake, cause) => ({
		wake,
		delay,
		cause
	}))

/** What a ring names, its wake and its cause, without its delay. */
const rang = (ring: Ring) => ({ wake: ring.wake, cause: ring.cause })

/** den's transport and consumer over a fake whose consumer group reads `maxDeliveries` from its trigger. */
const harness = (queue: Fake) => ({
	send: (sent: ReadonlyArray<Ring>) =>
		Effect.flatMap(Effect.provideService(sender, VercelQueue, queue.queue), (transport) =>
			transport.send(sent)
		),
	route: <A>(serve: (wake: Wake) => Effect.Effect<A>) =>
		consumer(serve).pipe(Effect.provideService(VercelQueue, queue.queue))
})

type Healing =
	| "delivered at once"
	| "refused, then rung by the census"
	| "lost before acceptance, then rung by the census"
	| "a ring its cause sent again, deduplicated"
	| "redelivered after a lapsed lease"
	| "dropped after its deliveries, then rung by the census"
	| "delivered twice"

/** A run of the transport: the rings the core sends, the faults the queue may still inflict, its trigger's ceiling. */
interface Run {
	readonly rings: ReadonlyArray<EncodedRing>
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

const period = censusPeriodSeconds * 1000

const run: Gen<Run> = (source) => ({
	rings: source.draw(rings({ min: 1, max: 5 })),
	faults: source.draw(int(0, 6)),
	maxDeliveries: source.draw(oneOf([int(1, 2), constant(maxDeliveries)]))
})

it.effect("every wake a ring sends is delivered at least once or healed by a census", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "delivered or healed",
				oracle: {
					kind: "specification",
					name: "every wake a ring sends is heard by the runtime before the horizon its faults allow"
				},
				draw: drawn(run),
				literal: Formatter.format,
				coverage: required<Healing>(
					[
						"delivered at once",
						"refused, then rung by the census",
						"lost before acceptance, then rung by the census",
						"a ring its cause sent again, deduplicated",
						"redelivered after a lapsed lease",
						"dropped after its deliveries, then rung by the census",
						"delivered twice"
					],
					{ cases: 200, sense: notesOnly }
				),
				kept: [],
				runs: 200,
				shrink: boundedShrink(40),
				steerEvery: 16,
				caseHang: caseHangMillis
			},
			(drawnRun, c) =>
				Effect.gen(function* () {
					const sent = yield* Effect.forEach(drawnRun.rings, (ring) =>
						ringFrom(ring, Duration.zero)
					)
					const queue = fake(
						{ topic: TOPIC, maxDeliveries: drawnRun.maxDeliveries },
						faulty(c, drawnRun.faults)
					)
					const { send, route: routeOf } = harness(queue)
					const heard = new Map<string, number>()
					const route = yield* routeOf((wake) =>
						Effect.sync(() => {
							const text = wakeText(wake)
							heard.set(text, (heard.get(text) ?? 0) + 1)
						})
					)
					const wakes = Arr.dedupeWith(
						Arr.map(sent, (ring) => ring.wake),
						Equal.equals
					)
					const unheard = () => Arr.filter(wakes, (wake) => !heard.has(wakeText(wake)))
					const lease = visibilityTimeoutSeconds * 1000
					const horizon = (drawnRun.faults + 1) * (drawnRun.maxDeliveries * lease + 2 * period)
					yield* send(sent)
					while (Arr.isReadonlyArrayNonEmpty(unheard()) && queue.now() <= horizon) {
						yield* queue.deliverDue(route)
						const waiting = unheard()
						if (!Arr.isReadonlyArrayNonEmpty(waiting)) {
							break
						}
						const census = (Math.floor(queue.now() / period) + 1) * period
						const delivery = Option.getOrElse(queue.nextDelivery(), () => census)
						queue.advance(Math.min(census, delivery))
						if (census <= delivery) {
							yield* send(
								Arr.map(waiting, (wake): Ring => ({
									wake,
									delay: Duration.zero,
									cause: { _tag: "Census", at: census }
								}))
							)
						}
					}
					assert.deepStrictEqual(
						Arr.map(unheard(), wakeText),
						[],
						"a wake neither delivered nor healed before its horizon"
					)
					const submitted = queue.submitted()
					const delivered = queue.delivered()
					const sentFirst = (outcome: Submitted["outcome"]) =>
						Arr.filter(submitted, (s) => s.at === 0 && s.outcome === outcome)
					const rungByCensus = (payload: string) =>
						Arr.some(
							submitted,
							(s) => s.at > 0 && s.payload === payload && s.outcome === "accepted"
						)
					if (
						Arr.some(
							delivered,
							(d) => d.count === 1 && d.fate === "runs" && d.status._tag === "Some"
						)
					) {
						c.note("delivered at once")
					}
					if (Arr.some(sentFirst("refused"), (s) => rungByCensus(s.payload))) {
						c.note("refused, then rung by the census")
					}
					if (Arr.some(sentFirst("lost"), (s) => rungByCensus(s.payload))) {
						c.note("lost before acceptance, then rung by the census")
					}
					if (Arr.isReadonlyArrayNonEmpty(sentFirst("deduplicated"))) {
						c.note("a ring its cause sent again, deduplicated")
					}
					if (Arr.some(delivered, (d) => d.count > 1)) {
						c.note("redelivered after a lapsed lease")
					}
					if (
						Arr.some(queue.dropped(), (key) =>
							Arr.some(
								submitted,
								(s) => Option.isSome(key) && Equal.equals(s.key, key) && rungByCensus(s.payload)
							)
						)
					) {
						c.note("dropped after its deliveries, then rung by the census")
					}
					if (Arr.some(delivered, (d) => d.fate === "doubled")) {
						c.note("delivered twice")
					}
				})
		)
	)
)

type Keying =
	| "a ring its cause sent again"
	| "a wake two causes rang"
	| "distinct wakes"
	| "more rings than one batch holds"

const many: Gen<ReadonlyArray<EncodedRing>> = oneOf([
	rings({ min: 1, max: 8 }),
	rings({ min: batchMessages + 1, max: 2 * batchMessages + 5 })
])

it.effect(
	"keys never collide across distinct rings, a ring its cause sends again is delivered once, and a wake is delivered once for each cause that rang it",
	(ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "keys",
					oracle: {
						kind: "universal",
						name: "key(a) = key(b) ⇔ a and b ring one wake for one cause, over every message sent, each payload the wake it keys"
					},
					draw: drawn(many),
					literal: Formatter.format,
					coverage: required<Keying>(
						[
							"a ring its cause sent again",
							"a wake two causes rang",
							"distinct wakes",
							"more rings than one batch holds"
						],
						{
							cases: 40,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 100,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				(encoded, c) =>
					Effect.gen(function* () {
						const sent = yield* Effect.forEach(encoded, (ring) => ringFrom(ring, Duration.zero))
						const queue = fake({ topic: TOPIC, maxDeliveries: maxDeliveries }, faultless)
						const { send, route: routeOf } = harness(queue)
						const heard = new Map<string, number>()
						const route = yield* routeOf((wake) =>
							Effect.sync(() => {
								heard.set(wakeText(wake), (heard.get(wakeText(wake)) ?? 0) + 1)
							})
						)
						yield* send(sent)
						yield* queue.deliverDue(route)
						const submitted = queue.submitted()
						assert.strictEqual(submitted.length, sent.length)
						assert.strictEqual(queue.batches(), Math.ceil(sent.length / batchMessages))
						const payloads = yield* Effect.orDie(
							Effect.forEach(submitted, (s) => Schema.decodeEffect(WakeJson)(s.payload))
						)
						assert.deepStrictEqual(
							payloads,
							Arr.map(sent, (ring) => ring.wake)
						)
						assert.deepStrictEqual(
							Arr.map(submitted, (s) => Option.getOrUndefined(s.key)),
							Arr.map(sent, idempotencyKey)
						)
						const byKey = Arr.groupBy(sent, idempotencyKey)
						Arr.forEach(Rec.values(byKey), (group) => {
							assert.isTrue(
								Arr.every(group, (ring) => Equal.equals(rang(ring), rang(group[0]))),
								"one key, two rings"
							)
						})
						const distinct = Arr.dedupeWith(Arr.map(sent, rang), Equal.equals)
						assert.strictEqual(Rec.size(byKey), distinct.length, "two rings, one key")
						const wakes = Arr.dedupeWith(
							Arr.map(sent, (ring) => ring.wake),
							Equal.equals
						)
						const causesOf = (wake: Wake) =>
							Arr.filter(distinct, (ring) => Equal.equals(ring.wake, wake)).length
						if (distinct.length < sent.length) {
							c.note("a ring its cause sent again")
						}
						if (Arr.some(wakes, (wake) => causesOf(wake) > 1)) {
							c.note("a wake two causes rang")
						}
						if (wakes.length > 1) {
							c.note("distinct wakes")
						}
						if (sent.length > batchMessages) {
							c.note("more rings than one batch holds")
						}
						assert.deepStrictEqual(
							Arr.map(wakes, (wake) => heard.get(wakeText(wake))),
							Arr.map(wakes, causesOf)
						)
					})
			)
		)
)

type Timing = "at once" | "held back" | "past the longest delay"

interface Timer {
	readonly ring: EncodedRing
	readonly delayMillis: number
}

const timer: Gen<Timer> = (source) => ({
	ring: source.draw(ringOf(encodedWake)),
	delayMillis: source.draw(
		oneOf([
			constant(0),
			int(1, 5_000),
			int(maxDelaySeconds * 1000 - 2_000, maxDelaySeconds * 1000 + 2_000)
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
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				(drawnTimer, c) =>
					Effect.gen(function* () {
						const ring = yield* ringFrom(drawnTimer.ring, Duration.millis(drawnTimer.delayMillis))
						const wake = ring.wake
						const queue = fake({ topic: TOPIC, maxDeliveries: maxDeliveries }, faultless)
						const heard: Array<Wake> = []
						const route = yield* consumer((delivered: Wake) =>
							Effect.sync(() => heard.push(delivered))
						).pipe(Effect.provideService(VercelQueue, queue.queue))
						const { send } = yield* Effect.provideService(sender, VercelQueue, queue.queue)
						yield* send([ring])
						const dueSeconds = Math.ceil(drawnTimer.delayMillis / 1000)
						const due = dueSeconds * 1000
						if (dueSeconds > maxDelaySeconds) {
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
