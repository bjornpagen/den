import { Sha256, Vector } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, element, type Gen, int, subset } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option, Order } from "effect"
import { assignedAmong } from "#integration/slice/flows.ts"
import { embeddingDimensions } from "#integration/slice/relations.ts"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The assignment flow end to end on PostgreSQL 19 with pgvector, the assignment engine's shape: an operator requests an
 * assignment of a learner with a topic, a question it missed, passages to pass over and a mode (the nearest passage
 * found, or one within a radius). Its first step embeds the question, its body computing the query vector, which its
 * edge carries to the decision; the decision reads, before its body runs and in one grizzle query, one statement, the
 * passages of the topic nearest that vector (grizzle's `approximateNearest` over the passages' HNSW index, its query
 * vector a parameter its input gives) and the passages the learner has seen, and answers a decision of a model's shape: a tagged union of what it serves, an array of structs of what
 * it weighed, and a finite confidence. The root's finish reads the decision back from the graph and concludes it.
 *
 * Oracle (second implementation): the exact cosine search over the same vectors, and the decision recomputed here from
 * the two records. The nearest read's record holds as many passages as the topic holds, up to the bound, each of the
 * topic at its exact cosine distance, their distances the topic's smallest; the seen read's record is the learner's
 * seen passages; the decision's tag, its variant's row, its weighed family (gap-free from 0, in order) and its
 * confidence are what the records and the input's array and union give; the finish's conclusion, from the decision it
 * read back, agrees; and the app's Assigned row is the served passage's.
 */

type Feature =
	| "more passages of the topic than are found"
	| "no more passages of the topic than are found"
	| "a passed passage among the nearest"
	| "within a radius"
	| "served"
	| "rest"

/** The ratio a distance pgvector computes in binary32 may lie from the exact one, well above its rounding. */
const tolerance = 1e-5

const topics = ["near", "far"] as const

/** The modes the suite draws: the nearest passage, or one within a radius of the query. */
const modes = [
	{ _tag: "Nearest" },
	{ _tag: "Within", radius: 0.25 },
	{ _tag: "Within", radius: 0.75 },
	{ _tag: "Within", radius: 1.5 }
] as const

interface Placed {
	readonly topic: (typeof topics)[number]
	readonly components: ReadonlyArray<number>
}

interface Run {
	readonly passages: ReadonlyArray<Placed>
	readonly seen: ReadonlyArray<number>
	readonly exclude: ReadonlyArray<number>
	readonly near: ReadonlyArray<number>
	readonly mode: (typeof modes)[number]
}

/** Four small whole components, never all zero, so every vector has a cosine distance. */
const components: Gen<ReadonlyArray<number>> = (source) => {
	const drawn = source.draw(
		array(int(-3, 3), { min: embeddingDimensions, max: embeddingDimensions })
	)
	return Arr.every(drawn, (x) => x === 0) ? [1, ...Arr.drop(drawn, 1)] : drawn
}

const runs: Gen<Run> = (source) => {
	const passages = source.draw(
		array((s): Placed => ({ topic: s.draw(element(topics)), components: s.draw(components) }), {
			min: 1,
			max: 8
		})
	)
	const ats = Arr.map(passages, (_, at) => at)
	return {
		passages,
		seen: source.draw(subset(ats, { min: 0, max: passages.length })),
		exclude: source.draw(subset(ats, { min: 0, max: passages.length })),
		near: source.draw(components),
		mode: source.draw(element(modes))
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
const byDistance = Order.mapInput(Order.Number, (r: { readonly distance: number }) => r.distance)

/** The ordinals `0 … count − 1` as a family's rows hold them, none for a count of 0. */
const ordinals = (count: number): ReadonlyArray<bigint> =>
	Array.from({ length: count }, (_, ordinal) => BigInt(ordinal))

/**
 * Decides a learner's assignment from the passages nearest its query and those it has seen, as a model would answer:
 * the decision is recorded once with both reads, and its finish reads it back whole.
 */
export const anAssignmentDecidesFromTheNearestPassagesAndRecordsItsAnswer = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"more passages of the topic than are found",
		"no more passages of the topic than are found",
		"a passed passage among the nearest",
		"within a radius",
		"served",
		"rest"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { assign, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						const learner = "learner"
						const nameOf = (at: number) => `p-${at}`
						const named = Arr.map(run.passages, (placed, at) => ({
							...placed,
							passage: nameOf(at)
						}))
						yield* loader.workload.place.once({
							params: {},
							facts: {
								insert: {
									Passage: Arr.map(named, (p) => ({
										passage: p.passage,
										topic: p.topic,
										embedding: vectorOf(p.components)
									}))
								}
							}
						})
						const seenNames = Arr.map(run.seen, nameOf)
						yield* loader.workload.see.once({
							params: {},
							facts: { insert: { Seen: Arr.map(seenNames, (passage) => ({ learner, passage })) } }
						})
						const excluded = Arr.map(run.exclude, nameOf)
						const requested = yield* assign.request.Assignment("assignment", {
							learner,
							topic: "near",
							near: run.near,
							exclude: excluded,
							mode: run.mode
						})
						assert.ok(requested.fresh)
						yield* ringAndDrain(ledgers, [requested])

						const results = yield* rows(app.workload.assignResults.once({ params: {}, facts: {} }))
						const mine = Arr.filter(results, (r) => Sha256.equals(r.scope, requested.scope))
						const decided = Arr.filter(mine, (r) => r.kind === "Decide")
						assert.deepEqual(
							Arr.map(decided, (r) => r.outcome),
							["done"]
						)
						assert.deepEqual(
							Arr.map(
								Arr.filter(mine, (r) => r.kind === "AssignmentFinish"),
								(r) => r.outcome
							),
							["done"]
						)
						const step = Arr.getUnsafe(decided, 0).step
						const recordedNearest = yield* rows(
							app.workload.nearestReads.once({ params: {}, facts: {} })
						)
						const recordedSeen = yield* rows(app.workload.seenReads.once({ params: {}, facts: {} }))
						const decisions = yield* rows(app.workload.decisions.once({ params: {}, facts: {} }))
						const served = yield* rows(app.workload.servings.once({ params: {}, facts: {} }))
						const weighed = yield* rows(app.workload.weighings.once({ params: {}, facts: {} }))
						const concluded = yield* rows(app.workload.concluded.once({ params: {}, facts: {} }))
						const assigned = yield* rows(app.workload.assigned.once({ params: {}, facts: {} }))

						const ofTopic = Arr.filter(named, (p) => p.topic === "near")
						c.note(
							ofTopic.length > assignedAmong
								? "more passages of the topic than are found"
								: "no more passages of the topic than are found"
						)
						const nearest = Arr.sort(
							Arr.filter(recordedNearest, (r) => Sha256.equals(r.step, step)),
							byOrdinal
						)
						assert.deepEqual<ReadonlyArray<bigint>>(
							Arr.map(nearest, (r) => r.ordinal),
							ordinals(nearest.length)
						)
						assert.equal(nearest.length, Math.min(assignedAmong, ofTopic.length))
						const exact = new Map(
							Arr.map(ofTopic, (p) => [p.passage, cosine(p.components, run.near)] as const)
						)
						Arr.forEach(nearest, (r) => {
							assert.equal(r.topic, "near")
							const distance = exact.get(r.passage)
							assert.ok(distance !== undefined && close(r.distance, distance))
						})
						const smallest = Arr.take(
							Arr.sort(Array.from(exact.values()), Order.Number),
							nearest.length
						)
						const found = Arr.sort(
							Arr.map(nearest, (r) => r.distance),
							Order.Number
						)
						assert.ok(Arr.every(Arr.zip(found, smallest), ([a, b]) => close(a, b)))
						assert.deepEqual(
							Arr.sort(
								Arr.map(
									Arr.filter(recordedSeen, (r) => Sha256.equals(r.step, step)),
									(r) => r.passage
								),
								Order.String
							),
							Arr.sort(seenNames, Order.String)
						)

						const passed = new Set([...seenNames, ...excluded])
						const expectedWeighed = Arr.map(Arr.sort(nearest, byDistance), (r) => ({
							passage: r.passage,
							distance: r.distance,
							passed: passed.has(r.passage)
						}))
						if (Arr.some(expectedWeighed, (r) => r.passed)) {
							c.note("a passed passage among the nearest")
						}
						const mode = run.mode
						if (mode._tag === "Within") {
							c.note("within a radius")
						}
						const chosen = Arr.findFirst(
							expectedWeighed,
							(r) => !r.passed && (mode._tag === "Nearest" || r.distance <= mode.radius)
						)
						c.note(Option.isSome(chosen) ? "served" : "rest")
						const family = Arr.sort(
							Arr.filter(weighed, (r) => Sha256.equals(r.step, step)),
							byOrdinal
						)
						assert.deepEqual<ReadonlyArray<bigint>>(
							Arr.map(family, (r) => r.ordinal),
							ordinals(family.length)
						)
						assert.deepEqual(
							Arr.map(family, (r) => ({
								passage: r.passage,
								distance: r.distance,
								passed: r.passed
							})),
							expectedWeighed
						)
						assert.deepEqual(
							Arr.map(
								Arr.filter(decisions, (r) => Sha256.equals(r.step, step)),
								(r) => ({ stage: r.stage, confidence: r.confidence })
							),
							[
								Option.match(chosen, {
									onNone: () => ({ stage: "Rest" as const, confidence: 0 }),
									onSome: (r) => ({ stage: "Serve" as const, confidence: 1 - r.distance / 2 })
								})
							]
						)
						assert.deepEqual(
							Arr.map(
								Arr.filter(served, (r) => Sha256.equals(r.step, step)),
								(r) => ({ passage: r.passage, distance: r.distance })
							),
							Option.toArray(
								Option.map(chosen, (r) => ({ passage: r.passage, distance: r.distance }))
							)
						)
						assert.deepEqual(
							Arr.map(concluded, (r) => ({
								learner: r.learner,
								served: r.served,
								weighed: r.weighed
							})),
							[
								{
									learner,
									served: Option.match(chosen, { onNone: () => "rest", onSome: (r) => r.passage }),
									weighed: BigInt(expectedWeighed.length)
								}
							]
						)
						assert.deepEqual(
							Arr.map(assigned, (r) => r.passage),
							Option.toArray(Option.map(chosen, (r) => r.passage))
						)
					}),
					services
				)
			),
	oracle: {
		kind: "second-implementation",
		name: "the exact cosine search over the same vectors, and the decision recomputed from the two records"
	},
	budget: { runs: 12, steered: 12 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/assign.binding.ts",
			original: "AssignDecideNearestRead: Arr.map(recordedNearest, (row, ordinal) => ({",
			replacement:
				"AssignDecideNearestRead: Arr.map(Arr.take(recordedNearest, 1), (row, ordinal) => ({",
			why: "the binding records only the first passage the nearest read found, so the record is no longer what the body saw"
		}
	]
})
