import { type Ending, serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName } from "@bjornpagen/den/transport"
import { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option, Order } from "effect"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The chain flow end to end on PostgreSQL 19: an operator requests a root, its admission starts page 0 of a feed, each
 * page reads the feed's weight before its body runs, its edge spawns the next until a page names none, and the root's
 * finish moves the feed's cursor once every page has ended.
 *
 * Oracle (specification): a run of n pages leaves n done Page results whose outputs are typed rows; each page's read
 * is recorded with its result and is exactly the feed's weight rows when it ran (only added to, so the rows standing
 * after the run); page s holds (s + 1) × max(1, Σ factors) items, committed with its result, and reads every item of
 * the pages before it; the root stores each item a later page read once, Σ over s < n − 1 of page s's items, however
 * many pages read it (a work count: linear in the feed, where a copy per page is quadratic); each page's tree of the
 * feed's weight, read where the feed has one, is recorded as it found it, nested rows and all: the weight, the items of
 * the pages before it in their order, each with its page's first item; exactly one done finish of the run's scope; the feed's
 * cursor at n − 1; and requesting it again with the same key and instant, and ringing every page's first wake once
 * more, changes nothing.
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

/**
 * A record as grizzle's row decoders deliver it: an object with no prototype, so a field named like a member of
 * Object.prototype is an ordinary field; deepEqual compares prototypes, so a record read back is expected as one.
 */
const bareRecord = <T extends object>(fields: T): T => Object.assign({ __proto__: null }, fields)

/**
 * Runs a feed's pages to its cursor, each page's read recorded with its result.
 *
 * Budget: its suite's count before the conversion (chain flow: 12 independent cases and 12 steered, Vitest at den
 * dc5bd11).
 */
export const theChainFlowRunsAFeedsPagesToItsCursor = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"one page",
		"several pages",
		"a weight read",
		"no weight",
		"first request",
		"request again"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.pages === 1 ? "one page" : "several pages")
						const { chain, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						if (run.factor > 0) {
							yield* loader.workload.weigh.once({
								params: {},
								facts: { insert: { Weight: [{ feed: run.feed, factor: BigInt(run.factor) }] } }
							})
						}
						const key = `${run.feed}-${run.pages}-${run.factor}`
						const requested = yield* chain.request.ChainRun(key, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						assert.ok(requested.fresh)
						c.note("first request")
						yield* ringAndDrain(ledgers, [requested])
						const scope = requested.scope
						const read = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						const pages = Arr.filter(read, (page) => Sha256.equals(page.scope, scope))
						assert.deepEqual(
							Arr.sort(
								Arr.map(pages, (page): bigint => page.seq),
								Order.BigInt
							),
							Array.from({ length: run.pages }, (_, seq) => BigInt(seq))
						)
						const reads = yield* rows(app.workload.pageReads.once({ params: {}, facts: {} }))
						const items = yield* rows(app.workload.items.once({ params: {}, facts: {} }))
						Arr.forEach(pages, (page) => {
							const recorded = Arr.filter(reads, (r) => Sha256.equals(r.step, page.step))
							c.note(Arr.isReadonlyArrayEmpty(recorded) ? "no weight" : "a weight read")
							assert.ok(Arr.every(recorded, (r) => r.feed === run.feed))
							const factor = Arr.reduce(recorded, 0n, (sum, r) => sum + r.factor)
							assert.equal(page.items, (page.seq + 1n) * (factor > 0n ? factor : 1n))
							assert.ok(
								BigInt(
									Arr.filter(items, (item) => item.feed === run.feed && item.seq === page.seq)
										.length
								) >= page.items
							)
						})
						const itemsOf = (seq: bigint): bigint =>
							Arr.reduce(
								Arr.filter(pages, (page) => page.seq === seq),
								0n,
								(sum, page) => sum + page.items
							)
						const before = (seq: bigint): bigint =>
							Arr.reduce(
								Array.from({ length: Number(seq) }, (_, s) => itemsOf(BigInt(s))),
								0n,
								(sum, n) => sum + n
							)
						Arr.forEach(pages, (page) =>
							assert.equal(page.earlier, before(page.seq), "a page reads every item before it")
						)
						const stored = yield* rows(app.workload.earlierRows.once({ params: {}, facts: {} }))
						assert.equal(
							BigInt(stored.length),
							before(BigInt(run.pages - 1)),
							"each item a later page read is stored once, however many pages read it"
						)
						const trees = yield* rows(app.workload.treeReads.once({ params: {}, facts: {} }))
						yield* Effect.forEach(pages, (page) =>
							Effect.gen(function* () {
								const tree = Arr.filter(trees, (t) => Sha256.equals(t.step, page.step))
								assert.deepEqual(
									Arr.map(tree, (t) => [t.feed, t.factor]),
									run.factor > 0 ? [[run.feed, BigInt(run.factor)]] : [],
									"a page's tree is the feed's weight, where it has one"
								)
								const pagesBefore = Arr.sort(
									Arr.filter(pages, (p) => p.seq < page.seq),
									Order.mapInput(Order.BigInt, (p: (typeof pages)[number]) => p.seq)
								)
								const expected = Arr.flatMap(pagesBefore, (p) =>
									Array.from({ length: Number(p.items) }, (_, n) =>
										bareRecord({
											feed: run.feed,
											seq: p.seq,
											n: BigInt(n),
											first: Option.some(bareRecord({ n: 0n } as const))
										})
									)
								)
								yield* Effect.forEach(tree, (t) =>
									Effect.gen(function* () {
										const recorded = yield* rows(
											app.workload.treeRecords.once({
												params: { digest: t.digest },
												facts: {}
											})
										)
										assert.deepEqual(
											recorded,
											[bareRecord({ feed: run.feed, factor: BigInt(run.factor), items: expected })],
											"a recorded tree reads back as the page found it: the items before its page in order, each with its page's first item"
										)
									})
								)
							})
						)
						const finished = yield* rows(app.workload.chainFinishes.once({ params: {}, facts: {} }))
						const finishes = Arr.filter(finished, (finish) => Sha256.equals(finish.scope, scope))
						assert.deepEqual(
							Arr.map(finishes, (finish) => finish.outcome),
							["done"]
						)
						const cursors = yield* rows(app.workload.cursors.once({ params: {}, facts: {} }))
						assert.ok(
							Arr.some(
								cursors,
								(cursor) => cursor.feed === run.feed && cursor.position === BigInt(run.pages - 1)
							)
						)
						const again = yield* chain.request.ChainRun(key, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						assert.equal(again.fresh, false)
						c.note("request again")
						const ends = yield* chain.ledger.now
						const rerung: ReadonlyArray<Ending> = yield* Effect.forEach(pages, (page) =>
							Effect.map(
								serve(
									ledgers,
									{
										_tag: "Step",
										flow: FlowName.make("Chain"),
										step: page.step,
										attempt: AttemptNumber.make(0)
									},
									ends
								),
								(turn) => turn.ending
							)
						)
						assert.ok(Arr.every(rerung, (ending) => ending.kind === "lost"))
						const after = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						assert.equal(
							Arr.filter(after, (page) => Sha256.equals(page.scope, scope)).length,
							run.pages
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "n typed pages with their reads recorded, each read row stored once per root, their items, one finish, the cursor at n − 1, no change on a rerun"
	},
	budget: { runs: 12, steered: 12 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\tDuration.millis(Math.max(0, Number(until) - Number(at)))",
			replacement: "\tDuration.millis(Math.max(0, Number(at) - Number(until)))",
			why: "Operator mutant (operand-swap) at packages/den/src/runtime/turn.ts:235 in delayTo: `Number(until) - Number(at)` becomes `Number(at) - Number(until)`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/den/integration/slice/generated/chain.binding.ts",
			original: 'rowDigest("earlier", text)',
			replacement: "rowDigest(Sha256.toHex(done.turn.step), text)",
			why: "Each page stores its own copy of every item it read, keyed by its own step: a chain of n pages stores the items before each page again, quadratic in the feed where it was linear."
		},
		{
			file: "packages/den/src/runtime/identity.ts",
			original: 'derive(["row", read, text])',
			replacement: 'derive(["row", read])',
			why: "A row's digest leaves out the row: every tree a read found shares one digest, so a later page's items land under an earlier page's reference and the record is no longer what the earlier page saw."
		}
	]
})
