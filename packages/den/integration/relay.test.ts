import { drain } from "@bjornpagen/den/runtime/drive"
import { relay } from "@bjornpagen/den/runtime/relay"
import { type Ring, Transport } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Fiber, Formatter, Option, Queue, Stream } from "effect"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * The relay, the transactional outbox by log tailing: it watches the chain flow's served reads through grizzle's live
 * source on the installation's replication slot. The app's own write records an order and requests a chain root in one
 * transaction; no one rings it, and the relay, seeing the commit, rings the root's admission, keyed by the committed
 * state it rang for. Delivering that ring runs the chain to its end.
 *
 * Oracle (postgresql): the live source's decoding of the app's commit, which the relay turns into the admission's ring;
 * the chain's finish done and the order's row beside it, both from that one transaction.
 */

type Feature = "news" | "sport" | "a relay ring"

interface Run {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 2)),
	copy: source.draw(int(0, 99_999))
})

layer(sliceLayer, { excludeTestServices: true })("the relay", (it) => {
	it.effect("rings a root the app requested in its own transaction", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "relay",
					oracle: {
						kind: "postgresql",
						name: "the live source's decoding of the app's commit, rung as the root's admission"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(["news", "sport", "a relay ring"], {
						cases: 4,
						sense: notesOnly
					}),
					kept: [],
					runs: 4,
					shrink: boundedShrink(2),
					steerEvery: 2,
					caseHang: caseHangMillis
				},
				(run, c) =>
					Effect.gen(function* () {
						c.note(run.feed)
						const { chain, ledgers, loader } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const rung = yield* Queue.unbounded<Ring>()
						const relayed = yield* Effect.forkChild(
							relay(chain.ledger).pipe(
								Effect.provideService(Transport, {
									send: (rings) => Effect.asVoid(Queue.offerAll(rung, rings))
								})
							)
						)
						const order = `order-${yield* nonce}`
						const at = yield* chain.ledger.now
						const request = yield* chain.requestFacts.Ordered(order, at, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						yield* loader.workload.order.once({
							params: {},
							facts: { insert: { Order: [{ order, feed: run.feed }], ...request.facts } }
						})
						const admission = yield* Effect.raceFirst(
							Stream.fromQueue(rung).pipe(
								Stream.filter(
									(ring) => ring.wake._tag === "Admit" && ring.wake.scope === request.scope
								),
								Stream.runHead
							),
							Effect.flatMap(Fiber.join(relayed), (ended) =>
								Effect.die(`the relay ended before it rang: ${Formatter.format(ended)}`)
							)
						)
						yield* Fiber.interrupt(relayed)
						assert.strictEqual(admission._tag, "Some")
						if (Option.isSome(admission)) {
							assert.strictEqual(admission.value.cause._tag, "Relay")
							c.note("a relay ring")
							const transport = yield* Transport
							yield* transport.send([admission.value])
						}
						yield* drain(ledgers)
						const finishes = yield* rows(app.workload.chainFinishes.once({ params: {}, facts: {} }))
						assert.isTrue(
							Arr.some(finishes, (f) => f.scope === request.scope && f.outcome === "done")
						)
					})
			)
		)
	)
})
