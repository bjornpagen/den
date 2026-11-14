import { caseHang } from "@bjornpagen/den/limits"
import { now } from "@bjornpagen/den/runtime/clock"
import { type Ending, serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Order } from "effect"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"

/**
 * The chain flow end to end on PostgreSQL 19: an operator requests a root, its admission starts page 0 of a feed, each
 * page reads the feed's weight before its body runs, its edge spawns the next until a page names none, and the root's
 * finish moves the feed's cursor once every page has ended.
 *
 * Oracle (specification): a run of n pages leaves n done Page results whose outputs are typed rows; each page's read
 * is recorded with its result and is exactly the feed's weight rows when it ran (only added to, so the rows standing
 * after the run); page s holds (s + 1) × max(1, Σ factors) items, committed with its result; exactly one done finish
 * of the run's scope; the feed's cursor at n − 1; and requesting it again with the same key and instant, and ringing
 * every page's first wake once more, changes nothing.
 */

type Feature =
	| "one page"
	| "several pages"
	| "a weight read"
	| "no weight"
	| "first request"
	| "request again"

interface Run {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly factor: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 4)),
	factor: source.draw(int(0, 3)),
	copy: source.draw(int(0, 9))
})

layer(sliceLayer)("the chain flow", (it) => {
	it.effect("runs a feed's pages to its cursor, each page's read recorded with its result", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "chain flow",
					oracle: {
						kind: "specification",
						name: "n typed pages with their reads recorded, their items, one finish, the cursor at n − 1, no change on a rerun"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(
						[
							"one page",
							"several pages",
							"a weight read",
							"no weight",
							"first request",
							"request again"
						],
						{ cases: 12, sense: notesOnly }
					),
					kept: [],
					runs: 12,
					shrink: boundedShrink(8),
					concurrency: 1,
					steerEvery: 4,
					caseHang
				},
				(run, c) =>
					Effect.gen(function* () {
						c.note(run.pages === 1 ? "one page" : "several pages")
						const { chain, ledgers, loader } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						if (run.factor > 0) {
							yield* loader.workload.weigh.once({
								params: {},
								facts: { insert: { Weight: [{ feed: run.feed, factor: BigInt(run.factor) }] } }
							})
						}
						const key = `${run.feed}-${run.pages}-${run.factor}-${yield* nonce}`
						const at = yield* now
						const requested = yield* chain.request.ChainRun(key, at, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						assert.isTrue(requested.fresh)
						c.note("first request")
						yield* admitAndDrain(ledgers, FlowName.make("Chain"), [requested.scope])
						const scope = requested.scope
						const read = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						const pages = Arr.filter(read, (page) => page.scope === scope)
						assert.deepStrictEqual(
							Arr.sort(
								Arr.map(pages, (page): bigint => page.seq),
								Order.BigInt
							),
							Array.from({ length: run.pages }, (_, seq) => BigInt(seq))
						)
						const reads = yield* rows(app.workload.pageReads.once({ params: {}, facts: {} }))
						const items = yield* rows(app.workload.items.once({ params: {}, facts: {} }))
						Arr.forEach(pages, (page) => {
							const recorded = Arr.filter(reads, (r) => r.step === page.step)
							c.note(Arr.isReadonlyArrayEmpty(recorded) ? "no weight" : "a weight read")
							assert.isTrue(Arr.every(recorded, (r) => r.feed === run.feed))
							const factor = Arr.reduce(recorded, 0n, (sum, r) => sum + r.factor)
							assert.strictEqual(page.items, (page.seq + 1n) * (factor > 0n ? factor : 1n))
							assert.isTrue(
								BigInt(
									Arr.filter(items, (item) => item.feed === run.feed && item.seq === page.seq)
										.length
								) >= page.items
							)
						})
						const finished = yield* rows(app.workload.chainFinishes.once({ params: {}, facts: {} }))
						const finishes = Arr.filter(finished, (finish) => finish.scope === scope)
						assert.deepStrictEqual(
							Arr.map(finishes, (finish) => finish.outcome),
							["done"]
						)
						const cursors = yield* rows(app.workload.cursors.once({ params: {}, facts: {} }))
						assert.isTrue(
							Arr.some(
								cursors,
								(cursor) => cursor.feed === run.feed && cursor.position === BigInt(run.pages - 1)
							)
						)
						const again = yield* chain.request.ChainRun(key, at, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						assert.isFalse(again.fresh)
						c.note("request again")
						const ends = yield* now
						const rerung: ReadonlyArray<Ending> = yield* Effect.forEach(pages, (page) =>
							Effect.map(
								serve(
									ledgers,
									{
										_tag: "Step",
										flow: FlowName.make("Chain"),
										step: page.step,
										attempt: AttemptNumber.make(1)
									},
									ends
								),
								(turn) => turn.ending
							)
						)
						assert.isTrue(Arr.every(rerung, (ending) => ending.kind === "lost"))
						const after = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						assert.strictEqual(Arr.filter(after, (page) => page.scope === scope).length, run.pages)
					})
			)
		)
	)
})
