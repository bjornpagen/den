import { drain } from "@bjornpagen/den/runtime/drive"
import { afterCommit } from "@bjornpagen/den/runtime/request"
import { InProcess } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Ref } from "effect"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The write that requests a root rings its admission once it has committed (runtime/request.ts): the app's own
 * transaction records an order and requests a chain root, run through `afterCommit` on the in-process transport, and
 * the transport is drained with no census and no relay. A write the database refuses, an order whose key an earlier
 * order (written with a request of its own, rung by no one) already holds, commits nothing and rings nothing.
 *
 * Oracle (specification): a committed write rings exactly its root's admission, caused by its request, and the
 * current period's census beside it, and the chain runs to its finish, the order's row beside it; a refused write
 * leaves no ring, no root and no graph.
 */

type Feature = "news" | "sport" | "a committed request" | "a refused request"

interface Run {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly refused: boolean
}

const runs: Gen<Run> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 3)),
	refused: source.draw(boolean)
})

/**
 * Starts the root an app's committed write requested from the ring that write sent, and rings nothing for a refused
 * one.
 *
 * Budget: provisional, the relay's (4 independent cases and 4 steered), which rings the same request from the log.
 */
export const aCommittedRequestRingsItsRootsAdmission = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: ["news", "sport", "a committed request", "a refused request"] satisfies ReadonlyArray<
		Reached<Feature>
	>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.feed)
						const { chain, ledgers, loader } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const { held } = yield* InProcess
						const order = "order"
						const input = { feed: run.feed, pages: BigInt(run.pages) }
						if (run.refused) {
							const earlier = yield* chain.requestFacts.Ordered("earlier", input)
							yield* loader.workload.order.once({
								params: earlier.params,
								facts: { insert: { Order: [{ order, feed: run.feed }], ...earlier.facts } }
							})
						}
						const request = yield* chain.requestFacts.Ordered("later", input)
						const written = yield* Effect.result(
							afterCommit(
								loader.workload.order.once({
									params: request.params,
									facts: { insert: { Order: [{ order, feed: run.feed }], ...request.facts } }
								}),
								() => [request]
							)
						)
						const rung = yield* Ref.get(held)
						if (run.refused) {
							c.note("a refused request")
							assert.equal(written._tag, "Failure")
							assert.deepEqual(rung, [])
							const scope = yield* chain.ledger.scopeOf(request.scope)
							assert.equal(scope._tag, "None")
							return
						}
						c.note("a committed request")
						assert.equal(written._tag, "Success")
						assert.deepEqual(
							Arr.filter(
								Arr.map(rung, (ring) => ring.wake),
								(wake) => wake._tag !== "Census"
							),
							[{ _tag: "Admit", flow: request.flow, scope: request.scope }]
						)
						assert.equal(
							Arr.filter(rung, (ring) => ring.wake._tag === "Census").length,
							1,
							"the write rings the current period's census beside its admissions"
						)
						yield* drain(ledgers)
						const finishes = yield* rows(app.workload.chainFinishes.once({ params: {}, facts: {} }))
						assert.ok(Arr.some(finishes, (f) => f.scope === request.scope && f.outcome === "done"))
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a committed request's one admission ring, which alone runs its chain to the finish; none for a refused one"
	},
	budget: { runs: 4, steered: 4 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/request.ts",
			original: "\tEffect.tap(write, (committed) => ringRequested(requested(committed)))",
			replacement: "\tEffect.tap(write, () => ringRequested([]))",
			why: "A committed request rings no admission: its chain waits for the census, and with no tick it never starts."
		}
	]
})
