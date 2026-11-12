import { caseHang } from "@bjornpagen/den/limits"
import { drain } from "@bjornpagen/den/runtime/drive"
import { rootScope } from "@bjornpagen/den/runtime/identity"
import { type Ending } from "@bjornpagen/den/runtime/ledger"
import { begin, serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, LaneName, WakeSchema } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { element, type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { layer } from "@effect/vitest"
import { assert } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Order } from "effect"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { AppServed, sliceLayer, WorkerServed } from "#integration/support/slice.ts"

/**
 * The chain flow end to end on PostgreSQL 19: a root starts page 0 of a feed, each page's edge spawns the next until a
 * page names none, and the root's finish moves the feed's cursor once every page has its result.
 *
 * Oracle (specification): a run of n pages leaves n done Page results whose outputs are typed rows (each page's
 * position and item count), the items each page wrote committed with its result (page s holds s + 1 items), exactly
 * one done finish of the run's scope, and the feed's cursor at n − 1; and running it again, by starting it with the same
 * key and ringing every page's first wake once more, changes nothing.
 */

type Feature = "one page" | "several pages" | "first start" | "start again"

interface Run {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 4)),
	copy: source.draw(int(0, 2))
})

const keyOf = (run: Run) => `${run.feed}-${run.pages}-${run.copy}`

layer(sliceLayer)("the chain flow", (it) => {
	it.effect("runs a feed's pages to its cursor, and a second run changes nothing", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "chain flow",
					oracle: {
						kind: "specification",
						name: "n typed page results, their items, one finish, the cursor at n − 1, and no change on a rerun"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(["one page", "several pages", "first start", "start again"], {
						cases: 12,
						sense: notesOnly
					}),
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
						const worker = yield* Db.open(WorkerServed.roles.chain_worker, {})
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const chain = chainLedger(worker.workload)
						const key = keyOf(run)
						const started = yield* chain.start.ChainRun(key, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						c.note(started.outcome.kind === "accepted" ? "first start" : "start again")
						yield* begin(chain.ledger, started.spawned)
						yield* drain(chain.ledger)
						const scope = yield* rootScope("Chain", "ChainRun", key)
						const read = yield* app.workload.pages.once({ params: {}, facts: {} })
						const pages = Arr.filter(Arr.fromIterable(read), (page) => page.scope === scope)
						const seqs: ReadonlyArray<bigint> = Arr.map(pages, (page) => page.seq)
						assert.deepStrictEqual(
							Arr.sort(seqs, Order.BigInt),
							Arr.map(Arr.range(0, run.pages - 1), BigInt)
						)
						const stored = yield* app.workload.items.once({ params: {}, facts: {} })
						const items = Arr.fromIterable(stored)
						Arr.forEach(pages, (page) => {
							assert.strictEqual(page.items, page.seq + 1n)
							assert.strictEqual(
								BigInt(
									Arr.filter(items, (item) => item.feed === run.feed && item.seq === page.seq)
										.length
								),
								page.items
							)
						})
						const finished = yield* app.workload.chainFinishes.once({ params: {}, facts: {} })
						const finishes = Arr.filter(
							Arr.fromIterable(finished),
							(finish) => finish.scope === scope
						)
						assert.deepStrictEqual(
							Arr.map(finishes, (finish) => finish.outcome),
							["done"]
						)
						const moved = yield* app.workload.cursors.once({ params: {}, facts: {} })
						const cursors = Arr.fromIterable(moved)
						assert.isTrue(
							Arr.some(
								cursors,
								(cursor) => cursor.feed === run.feed && cursor.position === BigInt(run.pages - 1)
							)
						)
						const again = yield* chain.start.ChainRun(key, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						assert.strictEqual(again.outcome.kind, "unchanged")
						const rerung: ReadonlyArray<Ending> = yield* Effect.forEach(pages, (page) =>
							Effect.map(
								serve(
									chain.ledger,
									WakeSchema.make({
										lane: LaneName.make("Pages"),
										step: page.step,
										attempt: AttemptNumber.make(1)
									})
								),
								(turn) => turn.ending
							)
						)
						assert.isTrue(Arr.every(rerung, (ending) => ending.kind === "lost"))
						const after = yield* app.workload.pages.once({ params: {}, facts: {} })
						assert.strictEqual(
							Arr.filter(Arr.fromIterable(after), (page) => page.scope === scope).length,
							run.pages
						)
					})
			)
		)
	)
})
