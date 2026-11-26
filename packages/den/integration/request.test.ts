import { drain } from "@bjornpagen/den/runtime/drive"
import { inputDigest, inputFingerprint } from "@bjornpagen/den/runtime/identity"
import { refusedOnKey } from "@bjornpagen/den/runtime/ledger"
import { afterCommit } from "@bjornpagen/den/runtime/request"
import { retire } from "@bjornpagen/den/runtime/retire"
import { settled } from "@bjornpagen/den/runtime/settled"
import { InProcess } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { aimed, array, boolean, element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order, Ref } from "effect"
import { chainAppRequests } from "#integration/slice/generated/chain.binding.ts"
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
							const earlier = chainAppRequests.Ordered("earlier", input)
							yield* loader.workload.order.once({
								params: earlier.params,
								facts: { insert: { Order: [{ order, feed: run.feed }] } }
							})
						}
						const request = chainAppRequests.Ordered("later", input)
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
							const scope = yield* chain.ledger.scopeOf({
								root: request.scope,
								scope: request.scope
							})
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
 * When an app's write requests a root again: while its graph stands, after it ran and was retired, issued at once with
 * the first request, or of another input, which differs in its pages or its feed and comes while the first's graph
 * stands or after it was retired.
 */
type Repeat =
	| Readonly<{ kind: "standing" }>
	| Readonly<{ kind: "retired" }>
	| Readonly<{ kind: "concurrent" }>
	| Readonly<{ kind: "differing"; field: "pages" | "feed"; retiredFirst: boolean }>

type RepeatFeature =
	| "a repeat while the graph stands"
	| "a repeat after retirement"
	| "two first requests issued at once"
	| "a request of another input refused"
	| "another input refused after retirement"
	| "another feed refused"

interface Repeated {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly repeat: Repeat
}

/** Every repeat, each of another input's four its own arm, so each is drawn as often as a repeat of the same input. */
const repeatOf: Gen<Repeat> = element([
	{ kind: "standing" },
	{ kind: "retired" },
	{ kind: "concurrent" },
	{ kind: "differing", field: "pages", retiredFirst: false },
	{ kind: "differing", field: "feed", retiredFirst: false },
	{ kind: "differing", field: "pages", retiredFirst: true },
	{ kind: "differing", field: "feed", retiredFirst: true }
] as const)

/** A repeat first, the choice each case's situation turns on, then the chain it requests. */
const repeats: Gen<Repeated> = (source) => {
	const repeat = source.draw(repeatOf)
	return {
		repeat,
		feed: source.draw(element(["news", "sport"])),
		pages: source.draw(int(1, 3))
	}
}

/**
 * A root's request is one fact, identified by its root: two app writes, each recording an order of its own and each
 * requesting one chain root under one key, both commit, their own orders included, whether the second comes while the
 * root's graph stands, after it ran to its finish and was retired, or issued at once with the first; the root is
 * requested once, its record stands once, its graph runs once, and no row of a retired graph comes back, its input's
 * included. A request of another input under the key, another feed or other pages, its graph standing or retired, is
 * refused on the root's record of what it was requested with, committing nothing of its own, and the root keeps its
 * first input while its graph stands and its record after. Whether the two writes issued at once overlap in the
 * database is left to the runtime: where they do, the second's serializable read of the Root's absence is refused
 * transient and `settled` runs it again.
 *
 * Oracle (specification): a root's request is a fact identified by its root, so a repeat adds no fact and refuses no
 * app write (lower/print.ts requestOfRoot), and retirement keeps the Root (lower/fragment.ts `cleared`), so a retired
 * graph's rows never come back.
 *
 * Budget: provisional, twice the retry ladders' (16 independent cases and 16 steered), over both feeds and every
 * repeat, another input's four among them.
 */
export const aRepeatedRequestIsTheSameFact = property.explore(repeats, {
	needs: { slice: sliceCase },
	situations: [
		"a repeat while the graph stands",
		"a repeat after retirement",
		"two first requests issued at once",
		"a request of another input refused",
		"another input refused after retirement",
		"another feed refused"
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
						const request = chainAppRequests.Ordered("repeated", input)
						const orderedOf = (order: string, named: typeof input) => {
							const asked = chainAppRequests.Ordered("repeated", named)
							return afterCommit(
								settled(
									loader.workload.order.once({
										params: asked.params,
										facts: { insert: { Order: [{ order, feed: run.feed }] } }
									})
								),
								() => [asked]
							)
						}
						const ordered = (order: string) => orderedOf(order, input)
						if (run.repeat.kind === "differing") {
							const differing = run.repeat
							yield* ordered("first")
							if (differing.retiredFirst) {
								c.note("another input refused after retirement")
								yield* Effect.andThen(drain(ledgers), retire(chain.ledger))
							}
							if (differing.field === "feed") {
								c.note("another feed refused")
							}
							const refused = yield* Effect.flip(
								orderedOf(
									"second",
									differing.field === "feed"
										? { feed: run.feed === "news" ? "sport" : "news", pages: input.pages }
										: { feed: run.feed, pages: input.pages + 1n }
								)
							)
							assert.equal(
								refusedOnKey(refused, ["ChainRequestedWith"]),
								true,
								"a request of another input under the key is refused on the root's input"
							)
							c.note("a request of another input refused")
							const kept = yield* rows(app.workload.orders.once({ params: {}, facts: {} }))
							assert.deepEqual(
								Arr.map(kept, (row) => row.order),
								["first"],
								"the refused write commits nothing of its own"
							)
							const stored = yield* rows(
								app.workload.chainOrderedInputs.once({ params: {}, facts: {} })
							)
							assert.deepEqual(
								Arr.map(stored, (row) => row.pages),
								differing.retiredFirst ? [] : [input.pages],
								"the root keeps its first input while its graph stands, and none comes back after"
							)
							const recorded = yield* rows(
								app.workload.chainRequestedWith.once({ params: {}, facts: {} })
							)
							assert.equal(recorded.length, 1, "the root's record stands, retired or not")
							return
						}
						const retiring =
							run.repeat.kind === "retired"
								? Effect.andThen(
										Effect.andThen(drain(ledgers), retire(chain.ledger)),
										Effect.map(
											Effect.all([
												chain.ledger.finishedRoots,
												chain.ledger.scopeOf({ root: request.scope, scope: request.scope })
											]),
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
							concurrency: run.repeat.kind === "concurrent" ? "unbounded" : 1
						})
						c.note(
							run.repeat.kind === "concurrent"
								? "two first requests issued at once"
								: run.repeat.kind === "retired"
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
						if (run.repeat.kind === "retired") {
							yield* drain(ledgers)
							const graph = yield* rows(app.workload.chainGraphRows.once({ params: {}, facts: {} }))
							assert.deepEqual(graph, [], "no row of the retired graph comes back")
							const inputs = yield* rows(
								app.workload.chainOrderedInputs.once({ params: {}, facts: {} })
							)
							assert.deepEqual(inputs, [], "nor its input")
							const cleared = yield* chain.ledger.scopeOf({
								root: request.scope,
								scope: request.scope
							})
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
	budget: { runs: 16, steered: 16 },
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
		},
		{
			file: "packages/den/integration/slice/generated/chain.programs.ts",
			original:
				'r.relation("chainOrderedChainRequestedWith", {\n\t\t\t\t\t\troot: ChainRequestedWith.fields.root,\n\t\t\t\t\t\tfingerprint: ChainRequestedWith.fields.fingerprint,\n\t\t\t\t\t\tinput: ChainRequestedWith.fields.input\n\t\t\t\t\t})\n\t\t\t\t\tconst { root, fingerprint, input } = v(requested, "requested")\n\t\t\t\t\tconst { input: held } = v(ChainRequestedWith, "held")\n\t\t\t\t\treturn r\n\t\t\t\t\t\t.match(requested, { root, fingerprint, input })\n\t\t\t\t\t\t.match(ChainRequestedWith, { root, fingerprint, input: held })\n',
			replacement:
				'r.relation("chainOrderedChainRequestedWith", {\n\t\t\t\t\t\troot: ChainRequestedWith.fields.root,\n\t\t\t\t\t\tfingerprint: ChainRequestedWith.fields.fingerprint,\n\t\t\t\t\t\tinput: ChainRequestedWith.fields.input\n\t\t\t\t\t})\n\t\t\t\t\tconst { root, fingerprint, input } = v(requested, "requested")\n\t\t\t\t\tconst { input: held } = v(ChainRequestedWith, "held")\n\t\t\t\t\treturn r\n\t\t\t\t\t\t.match(requested, { root, fingerprint, input })\n\t\t\t\t\t\t.match(ChainRequestedWith, { root, fingerprint, input })\n',
			why: "A request of another input under a held key meets no record and inserts nothing, answered as already requested: the caller's input is lost without a word."
		}
	]
})

/**
 * What happens next to a held key: a deploy that changes the kinds' input headings, the app's request of it again, or
 * the census's tick that requests the schedule's key again.
 */
type Deployed = "deploy" | "redeliver" | "tick"

/**
 * What a sequence of deploys reached: a redelivery under its first deployment or another, and a census's tick of a
 * schedule's key under another deployment, which names its key alone whatever the deployment (its input derived from
 * it), so a deploy that changes the kinds' input headings leaves it already requested.
 */
type DeployedFeature =
	| "a redelivery under the first deployment"
	| "a redelivery under another deployment"
	| "a tick under another deployment"

/** Where a sequence of deploys stands: its deployment, and the orders its redeliveries committed. */
interface Deploying {
	readonly deployment: number
	readonly orders: ReadonlyArray<string>
}

const deployments: Gen<ReadonlyArray<Deployed>> = array(
	element(["deploy", "redeliver", "tick"] as const),
	{
		min: 1,
		max: 6
	}
)

/**
 * A key requested again across deploys of its kind's input heading is the same keyed act: over drawn sequences of
 * deploys, redeliveries of an app's request and ticks of a schedule's, each app write commits its own order, the
 * root's record keeps the fingerprint of its first request, and each scheduled request again answers that its root was
 * already requested. A later deployment's request names another fingerprint and another input's digest, as a deploy
 * that changed the kind's input would print them, and is never compared with the first's; a scheduled root's request
 * names its key alone, its input derived from it, and records nothing, so no deploy can stop its census.
 *
 * Oracle (specification): docs/decisions.md, a root's request is one fact identified by its root, and its key names one
 * input (grizzle main's ruling, 2026-11-25).
 *
 * Budget: provisional, the retry ladders' (8 independent cases and 8 steered).
 */
export const aKeyRequestedAgainAcrossDeploysIsTheSameAct = property.explore(deployments, {
	needs: { slice: sliceCase },
	situations: [
		"a redelivery under the first deployment",
		"a redelivery under another deployment",
		"a tick under another deployment"
	] satisfies ReadonlyArray<Reached<DeployedFeature>>,
	check:
		({ slice }, c: Case<DeployedFeature>) =>
		(drawn) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { clock, loader } = yield* openLedgers
						const app = yield* openAuditor
						const orderedUnder = (deployment: number, order: string) => {
							const asked = chainAppRequests.Ordered("deployed", {
								feed: "news",
								pages: BigInt(1 + deployment)
							})
							const params =
								deployment === 0
									? asked.params
									: {
											...asked.params,
											chainOrderedChainRequestedWith: [
												{
													root: asked.scope,
													fingerprint: inputFingerprint(`deployment ${String(deployment)}`),
													input: inputDigest("Chain", "Ordered", [String(deployment)])
												}
											]
										}
							return afterCommit(
								settled(
									loader.workload.order.once({
										params,
										facts: { insert: { Order: [{ order, feed: "news" }] } }
									})
								),
								() => [asked]
							)
						}
						/**
						 * The census's request of the schedule's key, which names the key alone, its input derived from
						 * it.
						 */
						const tick = clock.request.Hourly({ at: 0n, member: "east" })
						const first = chainAppRequests.Ordered("deployed", { feed: "news", pages: 1n })
						yield* orderedUnder(0, "order-0")
						const ticked = yield* tick
						assert.equal(ticked.fresh, true, "the schedule's first request starts its root")
						const outcome = yield* Effect.reduce(
							drawn,
							(): Deploying => ({ deployment: 0, orders: ["order-0"] }),
							(state: Deploying, event, index) => {
								if (event === "deploy") {
									return Effect.succeed({ ...state, deployment: state.deployment + 1 })
								}
								if (event === "redeliver") {
									c.note(
										state.deployment === 0
											? "a redelivery under the first deployment"
											: "a redelivery under another deployment"
									)
									const order = `order-${String(index + 1)}`
									return Effect.as(orderedUnder(state.deployment, order), {
										...state,
										orders: [...state.orders, order]
									})
								}
								if (state.deployment > 0) {
									c.note("a tick under another deployment")
								}
								return Effect.map(tick, (again) => {
									assert.equal(
										again.fresh,
										false,
										"a tick requests its key again and starts nothing"
									)
									return state
								})
							}
						)
						const committed = yield* rows(app.workload.orders.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.sort(
								Arr.map(committed, (row) => row.order),
								Order.String
							),
							Arr.sort(outcome.orders, Order.String),
							"every redelivery's own order committed"
						)
						const recorded = yield* rows(
							app.workload.chainRequestedWith.once({ params: {}, facts: {} })
						)
						assert.deepEqual(
							Arr.map(recorded, (row) => row.fingerprint),
							Arr.map(first.params.chainOrderedChainRequestedWith, (row) => row.fingerprint),
							"the root keeps its first request's fingerprint"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a key names one input within one input heading; across a deploy that changed it, a request again is the same keyed act, and a schedule's key records no input"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/chain.programs.ts",
			original:
				'r.relation("chainOrderedChainRequestedWith", {\n\t\t\t\t\t\troot: ChainRequestedWith.fields.root,\n\t\t\t\t\t\tfingerprint: ChainRequestedWith.fields.fingerprint,\n\t\t\t\t\t\tinput: ChainRequestedWith.fields.input\n\t\t\t\t\t})\n\t\t\t\t\tconst { root, fingerprint, input } = v(requested, "requested")\n\t\t\t\t\tconst { input: held } = v(ChainRequestedWith, "held")\n\t\t\t\t\treturn r\n\t\t\t\t\t\t.match(requested, { root, fingerprint, input })\n\t\t\t\t\t\t.match(ChainRequestedWith, { root, fingerprint, input: held })\n',
			replacement:
				'r.relation("chainOrderedChainRequestedWith", {\n\t\t\t\t\t\troot: ChainRequestedWith.fields.root,\n\t\t\t\t\t\tfingerprint: ChainRequestedWith.fields.fingerprint,\n\t\t\t\t\t\tinput: ChainRequestedWith.fields.input\n\t\t\t\t\t})\n\t\t\t\t\tconst { root, fingerprint, input } = v(requested, "requested")\n\t\t\t\t\tconst { input: held } = v(ChainRequestedWith, "held")\n\t\t\t\t\treturn r\n\t\t\t\t\t\t.match(requested, { root, fingerprint, input })\n\t\t\t\t\t\t.match(ChainRequestedWith, { root, input: held })\n',
			why: "A request under another fingerprint is held to the first's digest: a webhook redelivered after a deploy that changed its input's shape is refused for ever."
		}
	]
})

/**
 * Where a request again's input differs from the first's: nowhere, in one part of it a value relation holds, or in a
 * value its field's type does not admit though its schema does.
 */
const PARTS = [
	"nowhere",
	"an element of near",
	"near's order",
	"an excluded passage",
	"mode's variant",
	"mode's radius",
	"a learner holding NUL"
] as const

type Part = (typeof PARTS)[number]

/** An assignment's probe, a request's input: its learner, its passages near and excluded, and its mode. */
interface Probe {
	readonly learner: string
	readonly near: ReadonlyArray<number>
	readonly exclude: ReadonlyArray<string>
	readonly mode: { readonly _tag: "Nearest" } | { readonly _tag: "Within"; readonly radius: number }
}

/** A part `parts` draws, then a probe it can change: a radius changes on Within. */
const probesOf =
	(parts: Gen<Part>): Gen<readonly [Probe, Part]> =>
	(source) => {
		const part = source.draw(parts)
		const within = part === "mode's radius" || source.draw(boolean)
		return [
			{
				learner: "learner",
				near: [source.draw(element([0.25, 0.5])), source.draw(element([0.75, 1]))],
				exclude: source.draw(array(element(["p1", "p2"] as const), { min: 1, max: 2 })),
				mode: within
					? { _tag: "Within", radius: source.draw(element([1, 2])) }
					: { _tag: "Nearest" }
			},
			part
		]
	}

/** Every part, and for each, while it is pending, the probes that change exactly it. */
const probes = aimed(
	probesOf(element(PARTS)),
	Arr.map(PARTS, (part) => [part, probesOf(() => part)] as const)
)

/** The probe `probe` with its `part` changed, the rest as it is. */
const changedIn = (probe: Probe, part: Part): Probe => {
	switch (part) {
		case "nowhere":
			return probe
		case "an element of near":
			return { ...probe, near: Arr.map(probe.near, (n, at) => (at === 0 ? n + 1 : n)) }
		case "near's order":
			return { ...probe, near: Arr.reverse(probe.near) }
		case "an excluded passage":
			return {
				...probe,
				exclude: Arr.map(probe.exclude, (passage, at) =>
					at === 0 ? (passage === "p1" ? "p2" : "p1") : passage
				)
			}
		case "mode's variant":
			return {
				...probe,
				mode: probe.mode._tag === "Nearest" ? { _tag: "Within", radius: 1 } : { _tag: "Nearest" }
			}
		case "mode's radius":
			return {
				...probe,
				mode:
					probe.mode._tag === "Within"
						? { _tag: "Within", radius: probe.mode.radius + 1 }
						: probe.mode
			}
		case "a learner holding NUL":
			return { ...probe, learner: "learner\u0000" }
	}
}

/** How a request again ended: started, already requested, refused on the root's record, or refused as its input. */
const answerOf = (part: Part) =>
	part === "nowhere" ? "already requested" : part === "a learner holding NUL" ? "input" : "refused"

/**
 * A key names its whole input: an operator's request again of an assignment, its input a probe whose passages near,
 * passages excluded and mode its value relations hold (ordered families and a variant), is the same fact where the
 * input is the same, and is refused on the root's record where any part of it differs, an element, the elements'
 * order, an element's value, a variant or a variant's field, the digest reading every row of every relation the input
 * lowers to; and one holding a value its field's type does not admit, though its schema does, is refused typed by
 * grizzle, an input refusal, never a defect of its digest.
 *
 * Oracle (specification): docs/decisions.md, a key names one input: its digest is each input row's every declared
 * field's codec text, a value relation's rows among them; grizzle's codec admits no NUL in a text.
 *
 * Budget: provisional, the retry ladders' 8 independent cases, and 24 steered, enough to reach each of its seven parts.
 */
export const aKeyNamesItsWholeInput = property.explore(probes, {
	needs: { slice: sliceCase },
	situations: PARTS satisfies ReadonlyArray<Reached<Part>>,
	check:
		({ slice }, c: Case<Part>) =>
		([probe, part]) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { assign } = yield* openLedgers
						c.note(part)
						const named = (p: Probe) => ({
							learner: p.learner,
							topic: "topic",
							near: p.near,
							exclude: p.exclude,
							mode: p.mode
						})
						const first = yield* assign.request.Assignment("probe", named(probe))
						assert.equal(first.fresh, true, "the first request starts its root")
						const again = yield* Effect.result(
							assign.request.Assignment("probe", named(changedIn(probe, part)))
						)
						assert.equal(
							again._tag === "Success"
								? again.success.fresh
									? "started"
									: "already requested"
								: refusedOnKey(again.failure, ["AssignRequestedWith"])
									? "refused"
									: again.failure.kind,
							answerOf(part),
							`a request again changed ${part}`
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a key names one input: every row of every relation its input lowers to is read into its digest, and a value its type does not admit is refused typed"
	},
	budget: { runs: 8, steered: 24 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/assign.binding.ts",
			original: "assignAssignmentInputExcludeTexts.value(row.value)\n",
			replacement: 'Result.succeed("excluded")\n',
			why: "A digest blind to an ordered family's values: a request again excluding another passage is answered as already requested, its input lost."
		},
		{
			file: "packages/den/integration/slice/generated/assign.binding.ts",
			original: "assignAssignmentInputModeWithinTexts.radius(row.radius)\n",
			replacement: 'Result.succeed("radius")\n',
			why: "A digest blind to a variant's field: a request again within another radius is answered as already requested."
		},
		{
			file: "packages/den/src/runtime/identity.ts",
			original: "Result.getSuccess(Result.all(texts))",
			replacement: "Option.some(Arr.map(texts, (text) => Result.getOrThrow(text)))",
			why: "A digest that throws on a value its type does not admit: a request whose schema admits it dies, a defect, where grizzle refuses it typed."
		}
	]
})
