import { drain } from "@bjornpagen/den/runtime/drive"
import { afterCommit } from "@bjornpagen/den/runtime/request"
import { retire } from "@bjornpagen/den/runtime/retire"
import { settled } from "@bjornpagen/den/runtime/settled"
import { InProcess } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order, Ref } from "effect"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The write that requests a root rings its admission once it has committed (runtime/request.ts): the app's own
 * transaction records an order and requests a chain root, run through `afterCommit` on the in-process transport, and
 * the transport is drained with no relay. A write the database refuses, an order whose key an earlier order of another
 * feed (written with a request of its own, rung by no one) already holds, commits nothing and rings nothing.
 *
 * Oracle (specification): a committed write rings exactly its root's admission, caused by its request, and the
 * current period's census beside it, and the chain runs to its finish, the order's row beside it; a refused write
 * leaves no ring, no root and no graph.
 */

type Feature = "a committed request" | "a refused request"

interface Run {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly refused: boolean
}

/** The feed beside `feed`: an order of the same key and another feed is no repeat of it, which its key refuses. */
const otherFeed = (feed: "news" | "sport"): "news" | "sport" => (feed === "news" ? "sport" : "news")

const runs: Gen<Run> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 3)),
	refused: source.draw(boolean)
})

/**
 * Starts the root an app's committed write requested from the ring that write sent, and rings nothing for a refused
 * one.
 *
 * Budget: provisional, the retry ladders' (8 independent cases and 8 steered), over both feeds and a committed and a
 * refused write.
 */
export const aCommittedRequestRingsItsRootsAdmission = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: ["a committed request", "a refused request"] satisfies ReadonlyArray<
		Reached<Feature>
	>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { chain, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						const { held } = yield* InProcess
						const order = "order"
						const input = { feed: run.feed, pages: BigInt(run.pages) }
						if (run.refused) {
							const earlier = chain.appRequests.Ordered("earlier", input)
							yield* loader.workload.order.once({
								params: earlier.params,
								facts: { insert: { Order: [{ order, feed: run.feed }] } }
							})
						}
						const request = chain.appRequests.Ordered("later", input)
						const written = yield* Effect.result(
							afterCommit(
								loader.workload.order.once({
									params: request.params,
									facts: {
										insert: {
											Order: [{ order, feed: run.refused ? otherFeed(run.feed) : run.feed }]
										}
									}
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
						const cursors = yield* rows(app.workload.cursors.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(
								Arr.filter(cursors, (cursor) => cursor.feed === run.feed),
								(cursor) => cursor.position
							),
							[BigInt(run.pages - 1)],
							"the chain ran to its finish, which moved the feed's cursor: an app row, which the census's retirement of the finished graph keeps"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a committed request's one admission ring, which alone runs its chain to the finish; none for a refused one"
	},
	budget: { runs: 8, steered: 8 },
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

/**
 * When an app's write requests a root again: while its graph stands, after it ran and was retired, or issued at once
 * with the first request.
 */
type Repeat = "standing" | "retired" | "concurrent"

type RepeatFeature =
	| "a repeat while the graph stands"
	| "a repeat after retirement"
	| "two first requests issued at once"

interface Repeated {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly repeat: Repeat
}

const repeats: Gen<Repeated> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 3)),
	repeat: source.draw(element(["standing", "retired", "concurrent"] as const))
})

/**
 * A root's request is one fact, identified by its root: two app writes, each recording an order of its own and each
 * requesting one chain root under one key, both commit, their own orders included, whether the second comes while the
 * root's graph stands, after it ran to its finish and was retired, or issued at once with the first; the root is
 * requested once, its record stands once, its graph runs once, and no row of a retired graph comes back, its input's
 * included. Whether the two writes issued at once overlap in the database is left to the runtime: where they do, the
 * second's serializable read of the Root's absence is refused transient and `settled` runs it again.
 *
 * Oracle (specification): a root's request is a fact identified by its root, so a repeat adds no fact and refuses no
 * app write (lower/print.ts requestOfRoot), and retirement keeps the Root (lower/fragment.ts `cleared`), so a retired
 * graph's rows never come back.
 *
 * Budget: provisional, the retry ladders' (8 independent cases and 8 steered), over both feeds and every repeat.
 */
export const aRepeatedRequestIsTheSameFact = property.explore(repeats, {
	needs: { slice: sliceCase },
	situations: [
		"a repeat while the graph stands",
		"a repeat after retirement",
		"two first requests issued at once"
	] satisfies ReadonlyArray<Reached<RepeatFeature>>,
	check:
		({ slice }, c: Case<RepeatFeature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { chain, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						const input = { feed: run.feed, pages: BigInt(run.pages) }
						const request = chain.appRequests.Ordered("repeated", input)
						const ordered = (order: string) =>
							afterCommit(
								settled(
									loader.workload.order.once({
										params: request.params,
										facts: { insert: { Order: [{ order, feed: run.feed }] } }
									})
								),
								() => [request]
							)
						const retiring =
							run.repeat === "retired"
								? Effect.andThen(
										Effect.andThen(drain(ledgers), retire(chain.ledger)),
										Effect.map(
											Effect.all([chain.ledger.finishedRoots, chain.ledger.scopeOf(request.scope)]),
											([left, cleared]) => {
												assert.deepEqual(
													left,
													[],
													"the finished root is retired, by the census or after it"
												)
												assert.equal(cleared._tag, "None", "its graph is cleared before the repeat")
											}
										)
									)
								: Effect.void
						yield* Effect.all([ordered("first"), Effect.andThen(retiring, ordered("second"))], {
							concurrency: run.repeat === "concurrent" ? "unbounded" : 1
						})
						c.note(
							run.repeat === "concurrent"
								? "two first requests issued at once"
								: run.repeat === "retired"
									? "a repeat after retirement"
									: "a repeat while the graph stands"
						)
						const committed = yield* rows(app.workload.orders.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.sort(
								Arr.map(committed, (row) => row.order),
								Order.String
							),
							["first", "second"],
							"each write's own order committed"
						)
						const headers = yield* rows(app.workload.chainHeaders.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(headers, (header) => header.key),
							["repeated"],
							"the root is requested once"
						)
						if (run.repeat === "retired") {
							yield* drain(ledgers)
							const graph = yield* rows(app.workload.chainGraphRows.once({ params: {}, facts: {} }))
							assert.deepEqual(graph, [], "no row of the retired graph comes back")
							const inputs = yield* rows(
								app.workload.chainOrderedInputs.once({ params: {}, facts: {} })
							)
							assert.deepEqual(inputs, [], "nor its input")
							const cleared = yield* chain.ledger.scopeOf(request.scope)
							assert.equal(cleared._tag, "None", "the retired root's scope stays cleared")
							return
						}
						yield* drain(ledgers)
						const cursors = yield* rows(app.workload.cursors.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(
								Arr.filter(cursors, (cursor) => cursor.feed === run.feed),
								(cursor) => cursor.position
							),
							[BigInt(run.pages - 1)],
							"the chain ran to its finish"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a root's request is a fact identified by its root: a repeat adds no fact and refuses no app write, and retirement keeps the Root, so a retired graph never returns"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/chain.programs.ts",
			original:
				'\t\t\t\t\t\tr.eq(root, r.param("chainOrderedScope", ChainRoot.fields.root)),\n\t\t\t\t\t\tr.not(ChainRoot, { root })\n',
			replacement: '\t\t\t\t\t\tr.eq(root, r.param("chainOrderedScope", ChainRoot.fields.root))\n',
			why: "A repeat's Root, at its own instant, meets the held Root's key and refuses the app's whole write: a webhook redelivered, or a page's double tap, fails for ever."
		},
		{
			file: "packages/den/integration/slice/generated/chain.programs.ts",
			original:
				"\t\t\t\treturn r\n\t\t\t\t\t.match(requested, { root, scope })\n\t\t\t\t\t.where(r.not(ChainRoot, { root }))\n",
			replacement: "\t\t\t\treturn r\n\t\t\t\t\t.match(requested, { root, scope })\n",
			why: "A repeat of a retired root inserts its scope again: a cleared graph's scope comes back under its kept Root."
		},
		{
			file: "packages/den/integration/slice/generated/chain.programs.ts",
			original:
				"\t\t\t\treturn r\n\t\t\t\t\t.match(requested, { root, scope, feed, pages })\n\t\t\t\t\t.where(r.not(ChainRoot, { root }))\n",
			replacement: "\t\t\t\treturn r\n\t\t\t\t\t.match(requested, { root, scope, feed, pages })\n",
			why: "A repeat of a retired root inserts its input again: a cleared graph's input comes back under its kept Root."
		}
	]
})
