import { caseHang } from "@bjornpagen/den/limits"
import { idempotencyKey, type Wake, WakeSchema } from "@bjornpagen/den/transport"
import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import {
	array,
	characterOf,
	constant,
	element,
	type Gen,
	int,
	oneOf,
	string,
	weighted
} from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option, Schema } from "effect"
import { consumer } from "#consumer.ts"
import { maxDeliveries } from "#limits.ts"
import { TOPIC, VercelQueue, WakeJson } from "#queue.ts"
import { type Fates, fake } from "#test/fake.ts"
import { type Encoded, encodedWake } from "#test/wakes.ts"

/**
 * The consumer acknowledges every delivery: a wake whatever its turn ended in (the deploy fence's `fenced` included),
 * a runtime that died or was interrupted, a body that is no JSON or JSON that is no wake, and an acknowledgement the
 * network lost, which the retry hook acknowledges again. No delivery is ever handed back for a delay or left to fail,
 * and only a body that decodes as a wake reaches the runtime, once per delivery, as it was sent.
 */

/** How den's runtime ends the turn a wake rings: one of its endings, or a death or an interruption of its own. */
type Outcome = "done" | "failed" | "retry" | "lost" | "fenced" | "dies" | "interrupted"

/** What a delivery carries: a wake and how its turn ends, or text from some other sender. */
type Body =
	| Readonly<{ kind: "wake"; wake: Encoded; outcome: Outcome }>
	| Readonly<{ kind: "text"; text: string }>

/** The deliveries of one case, and how many acknowledgements the network may lose. */
interface Deliveries {
	readonly bodies: ReadonlyArray<Body>
	readonly losses: number
}

const OUTCOMES: readonly [Outcome, ...Array<Outcome>] = [
	"done",
	"failed",
	"retry",
	"lost",
	"fenced",
	"dies",
	"interrupted"
]

const body: Gen<Body> = oneOf<Body>([
	(source) => ({
		kind: "wake",
		wake: source.draw(encodedWake),
		outcome: source.draw(element(OUTCOMES))
	}),
	(source) => ({
		kind: "text",
		text: source.draw(
			string(characterOf(["{", "}", '"', ":", "_", "a", "1", "["]), { min: 0, max: 10 })
		)
	})
])

const deliveries: Gen<Deliveries> = (source) => ({
	bodies: source.draw(array(body, { min: 1, max: 8 })),
	losses: source.draw(int(0, 3))
})

type Acknowledging =
	| "fenced"
	| "the runtime died"
	| "the runtime was interrupted"
	| "no JSON"
	| "JSON that is no wake"
	| "an acknowledgement lost, acknowledged by the retry hook"
	| "both acknowledgements lost, delivered again"

/** The fates of a queue that loses at most `losses` acknowledgements and fails nowhere else. */
const losing = (c: Case<Acknowledging>, losses: number): Fates => {
	let left = losses
	return {
		batch: () => "answered",
		message: () => "accepted",
		delivery: () => "runs",
		acknowledgement: () => {
			if (left <= 0) {
				return "lands"
			}
			const fate = c.draw(
				weighted<"lands" | "lost">([
					[1, constant("lands")],
					[1, constant("lost")]
				])
			)
			if (fate === "lost") {
				left -= 1
			}
			return fate
		}
	}
}

it.effect("the consumer acknowledges every delivery, a stale ending included", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "always acknowledged",
				oracle: {
					kind: "specification",
					name: "every delivery the route runs ends acknowledged, and only decoded wakes reach the runtime"
				},
				draw: drawn(deliveries),
				literal: Formatter.format,
				coverage: required<Acknowledging>(
					[
						"fenced",
						"the runtime died",
						"the runtime was interrupted",
						"no JSON",
						"JSON that is no wake",
						"an acknowledgement lost, acknowledged by the retry hook",
						"both acknowledgements lost, delivered again"
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
			(drawnDeliveries, c) =>
				Effect.gen(function* () {
					const queue = fake(
						{ topic: TOPIC, maxDeliveries: maxDeliveries.value },
						losing(c, drawnDeliveries.losses)
					)
					const bodies = yield* Effect.forEach(drawnDeliveries.bodies, (b) =>
						b.kind === "wake"
							? Effect.map(
									Effect.orDie(Schema.decodeUnknownEffect(WakeSchema)(b.wake)),
									(wake) => ({
										wake: Option.some({ wake, outcome: b.outcome }),
										payload: Effect.orDie(Schema.encodeEffect(WakeJson)(wake))
									})
								)
							: Effect.succeed({ wake: Option.none(), payload: Effect.succeed(b.text) })
					)
					const outcomes = new Map(
						Arr.flatMap(bodies, (b) =>
							Option.toArray(
								Option.map(b.wake, (w) => [idempotencyKey(w.wake), w.outcome] as const)
							)
						)
					)
					const served: Array<Wake> = []
					const route = yield* consumer((wake: Wake) =>
						Effect.suspend(() => {
							served.push(wake)
							const outcome = outcomes.get(idempotencyKey(wake)) ?? "done"
							return outcome === "dies"
								? Effect.die("the runtime died")
								: outcome === "interrupted"
									? Effect.interrupt
									: Effect.succeed(outcome)
						})
					).pipe(Effect.provideService(VercelQueue, queue.queue))
					const payloads = yield* Effect.forEach(bodies, (b) => b.payload)
					yield* Effect.promise(() =>
						queue.queue.sendBatch(
							TOPIC,
							Arr.map(payloads, (payload, at) => ({ payload, idempotencyKey: `delivery-${at}` }))
						)
					)
					yield* queue.deliverDue(route)
					for (let next = queue.nextDelivery(); Option.isSome(next); next = queue.nextDelivery()) {
						queue.advance(next.value)
						yield* queue.deliverDue(route)
					}
					const delivered = queue.delivered()
					Arr.forEach(delivered, (d) => {
						assert.deepStrictEqual(d.status, Option.some(200))
						assert.isTrue(
							Option.exists(
								d.settled,
								(s) =>
									s === "acknowledged" ||
									s === "acknowledged by the retry hook" ||
									s === "acknowledgement lost"
							),
							"a delivery the consumer did not acknowledge"
						)
					})
					assert.strictEqual(
						Arr.filter(delivered, (d) =>
							Option.exists(
								d.settled,
								(s) => s === "acknowledged" || s === "acknowledged by the retry hook"
							)
						).length,
						bodies.length,
						"a delivery never acknowledged"
					)
					const bodyOf = new Map<string, (typeof bodies)[number]>(
						Arr.map(bodies, (b, at) => [`delivery-${at}`, b] as const)
					)
					const wakesDelivered = Arr.flatMap(delivered, (d) =>
						Option.toArray(
							Option.flatMap(
								Option.flatMap(d.key, (key) => Option.fromNullishOr(bodyOf.get(key))),
								(b) => Option.map(b.wake, (w) => w.wake)
							)
						)
					)
					assert.deepStrictEqual(served, wakesDelivered)
					const outcomesServed = Arr.flatMap(bodies, (b) =>
						Option.toArray(Option.map(b.wake, (w) => w.outcome))
					)
					if (Arr.contains(outcomesServed, "fenced")) {
						c.note("fenced")
					}
					if (Arr.contains(outcomesServed, "dies")) {
						c.note("the runtime died")
					}
					if (Arr.contains(outcomesServed, "interrupted")) {
						c.note("the runtime was interrupted")
					}
					yield* Effect.forEach(
						Arr.filter(drawnDeliveries.bodies, (b) => b.kind === "text"),
						(b) =>
							Effect.match(Schema.decodeEffect(Schema.fromJsonString(Schema.Unknown))(b.text), {
								onFailure: () => c.note("no JSON"),
								onSuccess: () => c.note("JSON that is no wake")
							})
					)
					if (
						Arr.some(delivered, (d) => Option.contains(d.settled, "acknowledged by the retry hook"))
					) {
						c.note("an acknowledgement lost, acknowledged by the retry hook")
					}
					if (Arr.some(delivered, (d) => Option.contains(d.settled, "acknowledgement lost"))) {
						c.note("both acknowledgements lost, delivered again")
					}
				})
		)
	)
)
