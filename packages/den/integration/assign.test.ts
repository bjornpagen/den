import { FlowName } from "@bjornpagen/den/transport"
import { Vector } from "@bjornpagen/grizzle"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, element, type Gen, int, subset } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option, Order } from "effect"
import { assignedAmong } from "#integration/slice/flows.ts"
import { embeddingDimensions } from "#integration/slice/relations.ts"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The assignment flow end to end on PostgreSQL 19 with pgvector: an operator requests an assignment of a learner with a
 * topic and a query vector, and its one step reads, before its body runs, the passages of the topic nearest the query
 * vector (a nearest read, grizzle's `approximateNearest` over the passages' HNSW index) and the passages the learner has
 * seen (a rows read), then assigns the nearest it has not seen.
 *
 * Oracle (second implementation): the exact search, computed here from the same vectors. The nearest read's record holds as
 * many passages as the topic holds, up to the bound, each of the topic, each at its exact cosine distance, and their
 * distances are the topic's smallest; the seen read's record is exactly the learner's seen passages; and the chosen
 * passage, its output and the app's Assigned row agree with what the body computes from the two records, so the
 * records are what the body saw.
 */

type Feature =
	| "more passages of the topic than are found"
	| "no more passages of the topic than are found"
	| "a seen passage among the nearest"
	| "a passage assigned"
	| "every passage found seen"

/** The ratio a distance pgvector computes in binary32 may lie from the exact one, well above its rounding. */
const tolerance = 1e-5

const topics = ["near", "far"] as const

interface Placed {
	readonly topic: (typeof topics)[number]
	readonly components: ReadonlyArray<number>
}

interface Run {
	readonly passages: ReadonlyArray<Placed>
	readonly seen: ReadonlyArray<number>
	readonly near: ReadonlyArray<number>
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
	return {
		passages,
		seen: source.draw(
			subset(
				Arr.map(passages, (_, at) => at),
				{ min: 0, max: passages.length }
			)
		),
		near: source.draw(components)
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

/**
 * Assigns a learner the nearest passage of a topic it has not seen, its nearest and its seen reads recorded with its
 * result.
 */
export const anAssignmentReadsThePassagesNearestItsQueryAndRecordsThem = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"more passages of the topic than are found",
		"no more passages of the topic than are found",
		"a seen passage among the nearest",
		"a passage assigned",
		"every passage found seen"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { assign, ledgers, loader } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const learner = "learner"
						const named = Arr.map(run.passages, (placed, at) => ({ ...placed, passage: `p-${at}` }))
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
						const seenNames = Arr.map(run.seen, (at) => `p-${at}`)
						yield* loader.workload.see.once({
							params: {},
							facts: { insert: { Seen: Arr.map(seenNames, (passage) => ({ learner, passage })) } }
						})
						const at = yield* assign.ledger.now
						const requested = yield* assign.request.Assignment("assignment", at, {
							learner,
							topic: "near",
							near: vectorOf(run.near)
						})
						assert.isTrue(requested.fresh)
						yield* admitAndDrain(ledgers, FlowName.make("Assign"), [requested.scope])

						const results = yield* rows(app.workload.assignResults.once({ params: {}, facts: {} }))
						const decided = Arr.filter(
							results,
							(r) => r.scope === requested.scope && r.kind === "Decide"
						)
						assert.deepStrictEqual(
							Arr.map(decided, (r) => r.outcome),
							["done"]
						)
						const step = Arr.getUnsafe(decided, 0).step
						const recordedNearest = yield* rows(
							app.workload.nearestReads.once({ params: {}, facts: {} })
						)
						const recordedSeen = yield* rows(app.workload.seenReads.once({ params: {}, facts: {} }))
						const recordedChosen = yield* rows(app.workload.chosen.once({ params: {}, facts: {} }))
						const ofTopic = Arr.filter(named, (p) => p.topic === "near")
						c.note(
							ofTopic.length > assignedAmong
								? "more passages of the topic than are found"
								: "no more passages of the topic than are found"
						)
						const nearest = Arr.sort(
							Arr.filter(recordedNearest, (r) => r.step === step),
							Order.mapInput(Order.BigInt, (r: { readonly ordinal: bigint }) => r.ordinal)
						)
						assert.deepStrictEqual(
							Arr.map(nearest, (r) => r.ordinal),
							Array.from({ length: nearest.length }, (_, ordinal) => BigInt(ordinal))
						)
						assert.strictEqual(nearest.length, Math.min(assignedAmong, ofTopic.length))
						const exact = new Map(
							Arr.map(ofTopic, (p) => [p.passage, cosine(p.components, run.near)] as const)
						)
						Arr.forEach(nearest, (r) => {
							assert.strictEqual(r.topic, "near")
							const distance = exact.get(r.passage)
							assert.isTrue(distance !== undefined && close(r.distance, distance))
						})
						const smallest = Arr.take(
							Arr.sort(Array.from(exact.values()), Order.Number),
							nearest.length
						)
						const found = Arr.sort(
							Arr.map(nearest, (r) => r.distance),
							Order.Number
						)
						assert.isTrue(Arr.every(Arr.zip(found, smallest), ([a, b]) => close(a, b)))

						const seen = Arr.filter(recordedSeen, (r) => r.step === step)
						assert.deepStrictEqual(
							Arr.sort(
								Arr.map(seen, (r) => r.passage),
								Order.String
							),
							Arr.sort(seenNames, Order.String)
						)
						const seenSet = new Set(seenNames)
						if (Arr.some(nearest, (r) => seenSet.has(r.passage))) {
							c.note("a seen passage among the nearest")
						}
						const expected = Option.map(
							Arr.findFirst(
								Arr.sort(
									nearest,
									Order.mapInput(Order.Number, (r: { readonly distance: number }) => r.distance)
								),
								(r) => !seenSet.has(r.passage)
							),
							(r) => r.passage
						)
						c.note(Option.isSome(expected) ? "a passage assigned" : "every passage found seen")
						const chosen = Arr.filter(recordedChosen, (r) => r.step === step)
						assert.deepStrictEqual(
							Arr.map(chosen, (r) => r.value),
							Option.toArray(expected)
						)
						const assigned = yield* rows(app.workload.assigned.once({ params: {}, facts: {} }))
						assert.deepStrictEqual(
							Arr.map(assigned, (r) => r.passage),
							Option.toArray(expected)
						)
					}),
					services
				)
			),
	oracle: {
		kind: "second-implementation",
		name: "the exact cosine search over the same vectors, and the body's choice recomputed from the two records"
	},
	budget: { runs: 12, steered: 12 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/assign.binding.ts",
			original: "AssignDecideNearestRead: Arr.map(done.rows.nearest, (row, ordinal) => ({",
			replacement:
				"AssignDecideNearestRead: Arr.map(Arr.take(done.rows.nearest, 1), (row, ordinal) => ({",
			why: "the binding records only the first passage the nearest read found, so the record is no longer what the body saw"
		}
	]
})
