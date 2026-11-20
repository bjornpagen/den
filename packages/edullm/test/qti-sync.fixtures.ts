/** What the properties of qti-sync.test.ts read: its spaces, models and helpers. */

import { array, constant, element, type Gen, int, option, weighted } from "@bjornpagen/testing/gen"
import { Array as Arr } from "effect"
import {
	type Collection,
	COLLECTIONS,
	type Document,
	type Weather,
	type Window,
	type World
} from "#qti-sync.ts"

/** A chain's collection, window and page size, and the edits the source makes before each page. */
export type Scenario = Readonly<{
	world: World
	collection: Collection
	window: Window
	limit: number
	edits: ReadonlyArray<ReadonlyArray<Document>>
}>

export type Seen =
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

export const scenarioGen: Gen<Scenario> = (source) => {
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

export const inWindow = (window: Window) => (document: Document) =>
	document.updatedAt >= window.since && document.updatedAt < window.upper
