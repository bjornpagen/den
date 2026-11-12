import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { array, constant, element, type Gen, int, option, weighted } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option } from "effect"
import {
	COLLECTIONS,
	type Collection,
	type Document,
	makeQti,
	pageOf,
	QtiApi,
	type Weather,
	type Window,
	type World
} from "#qti.ts"
import { exploration, law } from "#test/support/search.ts"

/** A chain's collection, window and page size, and the edits the source makes before each page. */
type Scenario = Readonly<{
	world: World
	collection: Collection
	window: Window
	limit: number
	edits: ReadonlyArray<ReadonlyArray<Document>>
}>

type Seen =
	| "multi-page"
	| "empty"
	| "left-window"
	| "joined"
	| "refused"
	| "retried"
	| "retry-after"

const documentGen =
	(ids: number): Gen<Document> =>
	(source) => ({
		id: `item-${String(source.draw(int(1, ids)))}`,
		updatedAt: source.draw(int(0, 100))
	})

const weatherGen: Gen<Weather> = weighted<Weather>([
	[16, constant({ _tag: "Clear" })],
	[
		2,
		(source) => ({
			_tag: "Unfinished",
			status: source.draw(element([429, 503, 408, 500] as const)),
			retryAfter: source.draw(option(int(1, 60)))
		})
	],
	[1, (source) => ({ _tag: "Refused", status: source.draw(element([403, 400, 404] as const)) })],
	[1, constant({ _tag: "Transport" })]
])

const scenarioGen: Gen<Scenario> = (source) => {
	const ids = source.draw(int(1, 12))
	const collection = source.draw(element(COLLECTIONS))
	const since = source.draw(int(0, 60))
	const documents = Arr.dedupeWith(
		source.draw(array(documentGen(ids), { min: 0, max: 12 })),
		(left, right) => left.id === right.id
	)
	return {
		world: {
			documents: {
				"assessment-items": [],
				"assessment-tests": [],
				stimuli: [],
				[collection]: documents
			},
			weather: weatherGen
		},
		collection,
		window: { since, upper: since + source.draw(int(0, 60)) },
		limit: source.draw(int(1, 5)),
		edits: source.draw(
			array((s) => s.draw(array(documentGen(ids + 3), { min: 0, max: 2 })), { min: 0, max: 6 })
		)
	}
}

const inWindow = (window: Window) => (document: Document) =>
	document.updatedAt >= window.since && document.updatedAt < window.upper

describe("the QTI fake", () => {
	it.effect(
		"an after chain returns each document of its window once, in identifier order, and ends with no next",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "qti: after chains",
						draw: drawn(scenarioGen),
						coverage: required<Seen>(
							["multi-page", "empty", "left-window", "joined", "refused", "retried", "retry-after"],
							{
								cases: 200,
								sense: notesOnly
							}
						),
						runs: 400,
						shrink: 200,
						oracle: {
							kind: "specification",
							name: "the QTI after contract: every document matching the window for the whole read, once, in identifier byte order"
						}
					}),
					(scenario: Scenario, c: Case<Seen>) =>
						Effect.gen(function* () {
							const api = yield* QtiApi
							const start = scenario.world.documents[scenario.collection]
							const edited = new Set<string>()
							const read: Array<Document> = []
							let after = ""
							let pages = 0
							for (;;) {
								for (const document of Arr.getUnsafe(
									[...scenario.edits, []],
									Math.min(pages, scenario.edits.length)
								)) {
									edited.add(document.id)
									c.note(
										Arr.some(start, (old) => old.id === document.id) ? "left-window" : "joined"
									)
									yield* api.edit(scenario.collection, document)
								}
								const response = yield* api.page({
									collection: scenario.collection,
									window: scenario.window,
									after,
									limit: scenario.limit
								})
								if (
									response._tag === "TransportFailed" ||
									response.status === 408 ||
									response.status === 429 ||
									response.status >= 500
								) {
									c.note("retried")
									if (response._tag === "Answered" && Option.isSome(response.retryAfter)) {
										c.note("retry-after")
									}
									continue
								}
								if (response.status !== 200) {
									c.note("refused")
									return
								}
								const page = yield* pageOf(response.body)
								pages += 1
								yield* law(
									"a page within its limit",
									page.items.length <= scenario.limit,
									() => `a page held ${String(page.items.length)} documents`
								)
								yield* law(
									"only the window",
									Arr.every(page.items, inWindow(scenario.window)),
									() => "a page held a document outside its window"
								)
								for (const item of page.items) {
									read.push(item)
								}
								if (page.next === null) {
									break
								}
								after = page.next
							}
							if (pages > 1) {
								c.note("multi-page")
							}
							if (read.length === 0) {
								c.note("empty")
							}
							yield* law(
								"once, in identifier order",
								Arr.every(
									Arr.zip(read, Arr.drop(read, 1)),
									([before, next]) => before.id < next.id
								),
								() => "the chain returned a document twice or out of order"
							)
							const stable = Arr.filter(
								start,
								(document) => inWindow(scenario.window)(document) && !edited.has(document.id)
							)
							yield* law(
								"every stable document read",
								Arr.every(stable, (document) => Arr.some(read, (got) => got.id === document.id)),
								() => "a document in the window for the whole read was never returned"
							)
						}).pipe(Effect.provideServiceEffect(QtiApi, makeQti(scenario.world, c)))
				)
			)
	)
})
