import { drain } from "@bjornpagen/den/runtime/drive"
import { relay } from "@bjornpagen/den/runtime/relay"
import { type Ring, Transport } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Fiber, Formatter, Option, Queue, Stream } from "effect"
import { AppServed, openLedgers, rows, installedSliceCase } from "#integration/support/slice.ts"

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

/**
 * Rings a root the app requested in its own transaction.
 *
 * Budget: its suite's count before the conversion (relay: 4 independent cases and 4 steered, Vitest at den dc5bd11).
 */
export const theRelayRingsARootTheAppRequestedInItsOwnTransaction = property.explore(runs, {
	needs: { slice: installedSliceCase },
	situations: ["news", "sport", "a relay ring"] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
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
						const order = "order"
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
					}),
					services
				)
			),
	oracle: {
		kind: "postgresql",
		name: "the live source's decoding of the app's commit, rung as the root's admission"
	},
	budget: { runs: 4, steered: 4 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/eligible.ts",
			original: '\t\treturn !(\n\t\t\tprecondition.kind === "idle" &&\n',
			replacement: '\t\treturn (\n\t\t\tprecondition.kind === "idle" &&\n',
			why: "A root is admitted only while a flow its precondition names is busy, where it waits for them all idle (lane CATCH's negation of den 9cffaba, where eligible.ts reads a root's precondition off its runner)."
		}
	]
})
