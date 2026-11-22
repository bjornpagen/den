import { Sha256, Vector } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, element, type Gen, int, oneOf, subset } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order } from "effect"
import { assignedAmong } from "#integration/slice/reads.ts"
import { embeddingDimensions } from "#integration/slice/relations.ts"
import { ringAndDrain } from "#integration/support/run.ts"
import {
	openAuditor,
	openEditor,
	openLedgers,
	rows,
	sliceCase
} from "#integration/support/slice.ts"

/**
 * A read's records are content-addressed (lower/fragment.ts readsOf): each row any step of any root found is stored
 * once, under the digest of its text, and a root keeps only its step's references to them, by ordinal, so a row a
 * thousand roots found is one row and a thousand references, as git stores an object once however many trees name it.
 * The assignment flow's decisions, several roots at once over the same passages, some from the same query vector, read
 * the passages nearest their query and their learner's seen passages; between two batches of roots and after the last,
 * the app's editor rewrites a passage (a new embedding, or another topic) or takes back a seen passage.
 *
 * Oracle (differential): today's per-root copies, as a model of the passages and seen passages computes them: each
 * root's references, joined to the rows they name, are exactly the rows its decision found at its batch (the exact
 * cosine search over the passages as they stood then, the learner's seen passages then); a root's records read the same
 * after every later edit and every later root as they read when it ended; every row is stored once, under one digest
 * for one content and one content for one digest, however many roots found it; and once some of the roots are
 * retired, the rows left are exactly those a root not retired names (grizzle's `reachable`): retiring every root that
 * found a row releases it, and a row a retired root shared with a kept one stays.
 */

type Feature =
	| "a row two roots found, stored once"
	| "an edit between two roots' reads"
	| "an edit after every read"
	| "a row only retired roots named, released"
	| "a row a retired root shared with a kept root, kept"

/** The ratio a distance pgvector computes in binary32 may lie from the exact one, well above its rounding. */
const tolerance = 1e-5

const topics = ["near", "far"] as const
type Topic = (typeof topics)[number]

interface Placed {
	readonly topic: Topic
	readonly components: ReadonlyArray<number>
}

/** An edit of a decision's sources: a passage given a new embedding or moved to the other topic, or a seen passage taken back. */
type Edit =
	| { readonly _tag: "None" }
	| { readonly _tag: "Embed"; readonly at: number; readonly components: ReadonlyArray<number> }
	| { readonly _tag: "Move"; readonly at: number }
	| { readonly _tag: "Unsee"; readonly root: number; readonly at: number }

interface Run {
	readonly passages: ReadonlyArray<Placed>
	/** The query vectors the roots draw from: one or two, so roots share a query and find the same rows. */
	readonly queries: ReadonlyArray<ReadonlyArray<number>>
	/** Each root's query, by its place in `queries`: the first batch's, then the second's. */
	readonly first: ReadonlyArray<number>
	readonly second: ReadonlyArray<number>
	/** Each root's learner's seen passages, by their places, the first batch's roots then the second's. */
	readonly seen: ReadonlyArray<ReadonlyArray<number>>
	readonly between: Edit
	readonly after: Edit
	/** The roots retired once every check of their records is done, by their places. */
	readonly retired: ReadonlyArray<number>
}

/** Four small whole components, never all zero, so every vector has a cosine distance. */
const components: Gen<ReadonlyArray<number>> = (source) => {
	const drawn = source.draw(
		array(int(-3, 3), { min: embeddingDimensions, max: embeddingDimensions })
	)
	return Arr.every(drawn, (x) => x === 0) ? [1, ...Arr.drop(drawn, 1)] : drawn
}

const edits =
	(passages: number, roots: number): Gen<Edit> =>
	(source) =>
		source.draw(
			oneOf<Edit>([
				() => ({ _tag: "None" }),
				(s) => ({
					_tag: "Embed",
					at: s.draw(int(0, passages - 1)),
					components: s.draw(components)
				}),
				(s) => ({ _tag: "Move", at: s.draw(int(0, passages - 1)) }),
				(s) => ({
					_tag: "Unsee",
					root: s.draw(int(0, roots - 1)),
					at: s.draw(int(0, passages - 1))
				})
			])
		)

const runs: Gen<Run> = (source) => {
	const passages = source.draw(
		array((s): Placed => ({ topic: s.draw(element(topics)), components: s.draw(components) }), {
			min: 1,
			max: 6
		})
	)
	const queries = source.draw(array(components, { min: 1, max: 2 }))
	const query: Gen<number> = int(0, queries.length - 1)
	const first = source.draw(array(query, { min: 1, max: 3 }))
	const second = source.draw(array(query, { min: 0, max: 2 }))
	const ats = Arr.map(passages, (_, at) => at)
	return {
		passages,
		queries,
		first,
		second,
		seen: Arr.map([...first, ...second], () =>
			source.draw(subset(ats, { min: 0, max: passages.length }))
		),
		between: source.draw(edits(passages.length, first.length)),
		after: source.draw(edits(passages.length, first.length + second.length)),
		retired: source.draw(
			subset(
				Arr.map([...first, ...second], (_, at) => at),
				{ min: 0, max: first.length + second.length }
			)
		)
	}
}

const vectorOf = (values: ReadonlyArray<number>) =>
	Vector.make(Float32Array.from(values), embeddingDimensions)

/** The exact cosine distance of two vectors of whole components. */
const cosine = (a: ReadonlyArray<number>, b: ReadonlyArray<number>): number => {
	const dot = Arr.reduce(Arr.zip(a, b), 0, (sum, [x, y]) => sum + x * y)
	const norm = (v: ReadonlyArray<number>) => Math.sqrt(Arr.reduce(v, 0, (sum, x) => sum + x * x))
	return 1 - dot / (norm(a) * norm(b))
}

const close = (a: number, b: number): boolean => Math.abs(a - b) <= tolerance

const byOrdinal = Order.mapInput(Order.BigInt, (r: { readonly ordinal: bigint }) => r.ordinal)

const nameOf = (at: number) => `p-${at}`
const learnerOf = (root: number) => `l-${root}`
const otherTopic = (topic: Topic): Topic => (topic === "near" ? "far" : "near")

/** The sources as they stand: each passage's topic and embedding, and each root's learner's seen passages. */
interface Sources {
	readonly passages: ReadonlyArray<Placed>
	readonly seen: ReadonlyArray<ReadonlyArray<number>>
}

/** The sources after an edit. */
const edited = (sources: Sources, edit: Edit): Sources => {
	switch (edit._tag) {
		case "None":
			return sources
		case "Embed":
			return {
				...sources,
				passages: Arr.map(sources.passages, (p, at) =>
					at === edit.at ? { ...p, components: edit.components } : p
				)
			}
		case "Move":
			return {
				...sources,
				passages: Arr.map(sources.passages, (p, at) =>
					at === edit.at ? { ...p, topic: otherTopic(p.topic) } : p
				)
			}
		case "Unsee":
			return {
				...sources,
				seen: Arr.map(sources.seen, (seen, root) =>
					root === edit.root ? Arr.filter(seen, (at) => at !== edit.at) : seen
				)
			}
	}
}

/**
 * Keeps the per-root records content-addressed, against today's per-root copies, through edits of the sources a
 * decision read.
 */
export const aReadsRowsAreStoredOnceAndEachRootReadsBackWhatItFound = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"a row two roots found, stored once",
		"an edit between two roots' reads",
		"an edit after every read",
		"a row only retired roots named, released",
		"a row a retired root shared with a kept root, kept"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { assign, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						const editor = yield* openEditor
						yield* loader.workload.place.once({
							params: {},
							facts: {
								insert: {
									Passage: Arr.map(run.passages, (p, at) => ({
										passage: nameOf(at),
										topic: p.topic,
										embedding: vectorOf(p.components)
									}))
								}
							}
						})
						yield* loader.workload.see.once({
							params: {},
							facts: {
								insert: {
									Seen: Arr.flatMap(run.seen, (seen, root) =>
										Arr.map(seen, (at) => ({ learner: learnerOf(root), passage: nameOf(at) }))
									)
								}
							}
						})
						const apply = (sources: Sources, edit: Edit) =>
							Effect.gen(function* () {
								switch (edit._tag) {
									case "None":
										break
									case "Embed":
									case "Move": {
										const changed = Arr.getUnsafe(edited(sources, edit).passages, edit.at)
										yield* editor.workload.replace.once({
											params: {},
											facts: {
												put: {
													Passage: [
														{
															passage: nameOf(edit.at),
															topic: changed.topic,
															embedding: vectorOf(changed.components)
														}
													]
												}
											}
										})
										break
									}
									case "Unsee":
										yield* editor.workload.unsee.once({
											params: {},
											facts: {
												delete: {
													Seen: [{ learner: learnerOf(edit.root), passage: nameOf(edit.at) }]
												}
											}
										})
										break
								}
								return edited(sources, edit)
							})
						/** Requests a batch of roots, each its learner's, and drains them together. */
						const batch = (queries: ReadonlyArray<number>, from: number) =>
							Effect.gen(function* () {
								const requested = yield* Effect.forEach(queries, (query, at) =>
									assign.request.Assignment(`assignment-${from + at}`, {
										learner: learnerOf(from + at),
										topic: "near",
										near: Arr.getUnsafe(run.queries, query),
										exclude: [],
										mode: { _tag: "Nearest" }
									})
								)
								yield* ringAndDrain(ledgers, requested)
								return requested
							})
						/** What each root's decision recorded, read back through its references: its nearest rows and its seen rows. */
						const readBack = Effect.gen(function* () {
							const results = yield* rows(
								app.workload.assignResults.once({ params: {}, facts: {} })
							)
							const nearest = yield* rows(app.workload.nearestReads.once({ params: {}, facts: {} }))
							const seen = yield* rows(app.workload.seenReads.once({ params: {}, facts: {} }))
							return (scope: Sha256) => {
								const decided = Arr.filter(
									results,
									(r) => Sha256.equals(r.scope, scope) && r.kind === "Decide"
								)
								assert.deepEqual(
									Arr.map(decided, (r) => r.outcome),
									["done"]
								)
								const step = Arr.getUnsafe(decided, 0).step
								return {
									nearest: Arr.sort(
										Arr.filter(nearest, (r) => Sha256.equals(r.step, step)),
										byOrdinal
									),
									seen: Arr.sort(
										Arr.filter(seen, (r) => Sha256.equals(r.step, step)),
										byOrdinal
									)
								}
							}
						})

						const atFirst: Sources = { passages: run.passages, seen: run.seen }
						const firstRoots = yield* batch(run.first, 0)
						const early = yield* readBack
						const firstRead = Arr.map(firstRoots, (r) => early(r.scope))
						const atSecond = yield* apply(atFirst, run.between)
						const secondRoots = yield* batch(run.second, run.first.length)
						if (run.between._tag !== "None" && Arr.isReadonlyArrayNonEmpty(run.second)) {
							c.note("an edit between two roots' reads")
						}
						yield* apply(atSecond, run.after)
						if (run.after._tag !== "None") {
							c.note("an edit after every read")
						}
						const late = yield* readBack

						/** Each root, with the sources it read and its query. */
						const roots = [
							...Arr.map(firstRoots, (r, at) => ({
								scope: r.scope,
								root: at,
								sources: atFirst,
								query: Arr.getUnsafe(run.queries, Arr.getUnsafe(run.first, at))
							})),
							...Arr.map(secondRoots, (r, at) => ({
								scope: r.scope,
								root: run.first.length + at,
								sources: atSecond,
								query: Arr.getUnsafe(run.queries, Arr.getUnsafe(run.second, at))
							}))
						]
						Arr.forEach(roots, ({ scope, root, sources, query }) => {
							const read = late(scope)
							const ofTopic = Arr.filter(
								Arr.map(sources.passages, (p, at) => ({ ...p, passage: nameOf(at) })),
								(p) => p.topic === "near"
							)
							assert.equal(
								read.nearest.length,
								Math.min(assignedAmong, ofTopic.length),
								"a root's references name as many rows as its decision found"
							)
							const exact = new Map(
								Arr.map(ofTopic, (p) => [p.passage, cosine(p.components, query)] as const)
							)
							Arr.forEach(read.nearest, (r) => {
								assert.equal(r.topic, "near")
								const distance = exact.get(r.passage)
								assert.ok(
									distance !== undefined && close(r.distance, distance),
									"each row a root reads back is a passage of the topic as it stood, at its distance then"
								)
							})
							const smallest = Arr.take(
								Arr.sort(Array.from(exact.values()), Order.Number),
								read.nearest.length
							)
							assert.ok(
								Arr.every(
									Arr.zip(
										Arr.sort(
											Arr.map(read.nearest, (r) => r.distance),
											Order.Number
										),
										smallest
									),
									([a, b]) => close(a, b)
								),
								"a root's rows are the nearest of the passages as they stood"
							)
							assert.deepEqual(
								Arr.sort(
									Arr.map(read.seen, (r) => r.passage),
									Order.String
								),
								Arr.sort(Arr.map(Arr.getUnsafe(sources.seen, root), nameOf), Order.String),
								"a root's seen rows are its learner's seen passages as they stood"
							)
						})
						Arr.forEach(firstRoots, (r, at) =>
							assert.deepEqual(
								late(r.scope),
								Arr.getUnsafe(firstRead, at),
								"a root's records read after every later edit and root as they read when it ended"
							)
						)

						const references = Arr.flatMap(roots, ({ scope }) => late(scope).nearest)
						const stored = yield* rows(app.workload.nearestRows.once({ params: {}, facts: {} }))
						const contentOf = (r: {
							readonly passage: string
							readonly topic: string
							readonly distance: number
						}) => `${r.passage} ${r.topic} ${r.distance}`
						const digests = Arr.dedupeWith(
							Arr.map(references, (r) => r.digest),
							Sha256.equals
						)
						assert.equal(stored.length, digests.length, "every row any root found is stored once")
						assert.equal(
							Arr.dedupe(Arr.map(stored, contentOf)).length,
							stored.length,
							"one content is stored under one digest"
						)
						Arr.forEach(references, (r) => {
							const named = Arr.filter(stored, (row) => Sha256.equals(row.digest, r.digest))
							assert.deepEqual(
								Arr.map(named, contentOf),
								[contentOf(r)],
								"a reference's digest names its content alone"
							)
						})
						const scopes = Arr.map(roots, ({ scope }) => scope)
						const sharedBy = (digest: Sha256) =>
							Arr.filter(scopes, (scope) =>
								Arr.some(late(scope).nearest, (r) => Sha256.equals(r.digest, digest))
							).length
						if (Arr.some(digests, (digest) => sharedBy(digest) > 1)) {
							c.note("a row two roots found, stored once")
						}
						const seenStored = yield* rows(app.workload.seenRows.once({ params: {}, facts: {} }))
						assert.equal(
							seenStored.length,
							Arr.dedupeWith(
								Arr.map(
									Arr.flatMap(roots, ({ scope }) => late(scope).seen),
									(r) => r.digest
								),
								Sha256.equals
							).length,
							"every seen row any root read is stored once"
						)

						yield* Effect.forEach(run.retired, (at) =>
							assign.ledger.retire(Arr.getUnsafe(roots, at).scope)
						)
						const keptRoots = Arr.filter(roots, (_, at) => !Arr.contains(run.retired, at))
						const retiredRoots = Arr.filter(roots, (_, at) => Arr.contains(run.retired, at))
						const digestsOf = (
							of: ReadonlyArray<{ readonly scope: Sha256 }>,
							read: (scope: Sha256) => ReadonlyArray<{ readonly digest: Sha256 }>
						): ReadonlyArray<string> =>
							Arr.sort(
								Arr.dedupe(
									Arr.flatMap(of, ({ scope }) =>
										Arr.map(read(scope), (r) => Sha256.toHex(r.digest))
									)
								),
								Order.String
							)
						const keptNearest = digestsOf(keptRoots, (scope) => late(scope).nearest)
						const retiredNearest = digestsOf(retiredRoots, (scope) => late(scope).nearest)
						if (Arr.some(retiredNearest, (digest) => !Arr.contains(keptNearest, digest))) {
							c.note("a row only retired roots named, released")
						}
						if (Arr.some(retiredNearest, (digest) => Arr.contains(keptNearest, digest))) {
							c.note("a row a retired root shared with a kept root, kept")
						}
						const nearestLeft = yield* rows(
							app.workload.nearestRows.once({ params: {}, facts: {} })
						)
						assert.deepEqual<ReadonlyArray<string>>(
							Arr.sort(
								Arr.map(nearestLeft, (r) => Sha256.toHex(r.digest)),
								Order.String
							),
							keptNearest,
							"a row lives exactly while a root not retired names it: retiring every root that found it releases it"
						)
						const seenLeft = yield* rows(app.workload.seenRows.once({ params: {}, facts: {} }))
						assert.deepEqual<ReadonlyArray<string>>(
							Arr.sort(
								Arr.map(seenLeft, (r) => Sha256.toHex(r.digest)),
								Order.String
							),
							digestsOf(keptRoots, (scope) => late(scope).seen),
							"a seen row lives exactly while a root not retired names it"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "second-implementation",
		name: "today's per-root copies, as a model of the sources at each root's read computes them"
	},
	budget: { runs: 12, steered: 12 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/assign.binding.ts",
			original: 'digest: rowDigest("nearest", text)',
			replacement: "digest: rowDigest(Sha256.toHex(done.turn.root), text)",
			why: "each root stores its own copy of a row it found under a digest of its own, so a row two roots found is stored twice, as per-root copies were"
		}
	]
})
