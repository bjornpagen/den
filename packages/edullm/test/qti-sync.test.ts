/**
 * The QTI fake: an after chain over one collection's documents in a drawn window, read a page at a time while documents
 * are edited into or out of the window between pages, through weather that throttles, fails transiently or refuses.
 * The chain returns each document of its window once, in identifier order, every document in the window for the whole
 * read among them, and ends with no next.
 *
 * Oracle (specification): the QTI after contract: every document matching the window for the whole read, once, in
 * identifier byte order.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { type Document, makeQti, pageOf, QtiApi } from "#qti-sync.ts"
import { inWindow, type Scenario, scenarioGen, type Seen } from "#test/qti-sync.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * The QTI fake: an after chain returns each document of its window once, in identifier order, and ends with no next.
 *
 * Budget: its suite's count before the conversion (qti: after chains: 400 independent cases and 200 steered, Vitest at
 * den dc5bd11).
 */
export const afterChain = property.explore(scenarioGen, {
	needs: {},
	situations: [
		"multi-page",
		"empty",
		"left-window",
		"joined",
		"refused",
		"retried",
		"retry-after"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (_, c: Case<Seen>) => (scenario: Scenario) =>
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
					c.note(Arr.some(start, (old) => old.id === document.id) ? "left-window" : "joined")
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
				Arr.every(Arr.zip(read, Arr.drop(read, 1)), ([before, next]) => before.id < next.id),
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
		}).pipe(Effect.provideServiceEffect(QtiApi, makeQti(scenario.world, c))),
	oracle: {
		kind: "specification",
		name: "the QTI after contract: every document matching the window for the whole read, once, in identifier byte order"
	},
	budget: { runs: 400, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/qti-sync.ts",
			original: "\t\t\t\t\t\t...Arr.filter(held[collection], (other) => other.id !== document.id),",
			replacement: "\t\t\t\t\t\t...Arr.filter(held[collection], (other) => true),",
			why: "Operator mutant (boolean-return) at packages/edullm/src/qti-sync.ts:157 in makeQti: `other.id !== document.id` becomes `true`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
