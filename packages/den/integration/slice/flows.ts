import { flow } from "@bjornpagen/den/algebra/flow"
import { edge, lane, root, scope, step, writes, writesNothing } from "@bjornpagen/den/algebra/kinds"
import { Array as Arr, Effect, Option, Schema } from "effect"
import { Cursor, Item, Settled, Tally } from "#integration/slice/relations.ts"

/** A page's position in its feed. */
const Seq = Schema.BigInt.pipe(Schema.brand("Seq"))
const Feed = Schema.Literals(["news", "sport"])

const pages = lane("Pages", {
	width: 2,
	window: { kind: "always" },
	pause: "running",
	attempts: 3
})

/** A page to read: its feed, its position, how many pages the feed holds, and the cursor it reads after. */
const PageInput = Schema.Struct({
	feed: Feed,
	seq: Seq,
	pages: Schema.BigInt,
	after: Schema.Option(Schema.String)
})

/** What a page read: its position, how many items it held, and the cursor of the page after it, if any. */
const PageRead = Schema.Struct({
	seq: Seq,
	items: Schema.BigInt,
	next: Schema.Option(Schema.String)
})

/**
 * Reads one page of a feed: a page holds its position plus one items, and every page but the feed's last names the
 * next. Its items are the app's rows, committed with its result.
 */
const Page = step(
	pages,
	"Page",
	{
		input: PageInput,
		output: PageRead,
		error: Schema.Never,
		writes: writes({ insert: [Item], put: [], delete: [] })
	},
	(page) =>
		Effect.succeed({
			output: {
				seq: page.seq,
				items: page.seq + 1n,
				next: page.seq + 1n < page.pages ? Option.some(`after-${page.seq}`) : Option.none<string>()
			},
			writes: {
				insert: {
					Item: Arr.map(Arr.range(0, Number(page.seq)), (n) => ({
						feed: page.feed,
						seq: page.seq,
						n: BigInt(n)
					}))
				},
				put: {},
				delete: {}
			}
		})
)

/** Page n's next is page n + 1, while the page names one. */
const Next = edge("Next", Page, Page, (page, read) =>
	Option.match(read.next, {
		onNone: () => [],
		onSome: (after) => [
			{
				feed: page.feed,
				seq: Seq.make(page.seq + 1n),
				pages: page.pages,
				after: Option.some(after)
			}
		]
	})
)

/** A feed's chain: its first page, the chain its edges grow, and a finish that moves the feed's cursor. */
const ChainRun = root("ChainRun", {
	trigger: { kind: "command" },
	input: Schema.Struct({ feed: Feed, pages: Schema.BigInt }),
	children: [Page],
	start: (run) => [
		Page.of({ feed: run.feed, seq: Seq.make(0n), pages: run.pages, after: Option.none() })
	],
	finish: {
		lane: pages,
		reads: [Page],
		error: Schema.Never,
		writes: writes({ insert: [Cursor], put: [], delete: [] }),
		body: (run, results) =>
			Effect.succeed({
				insert: {
					Cursor: [
						{
							feed: run.feed,
							position: Arr.reduce(results.Page, -1n, (last, read) =>
								read.seq > last ? read.seq : last
							)
						}
					]
				},
				put: {},
				delete: {}
			})
	}
})

export const chain = flow("Chain", { lanes: [pages], kinds: [Page, ChainRun], edges: [Next] })

const work = lane("Work", { width: 4, window: { kind: "always" }, pause: "running", attempts: 3 })

/** Squares one number of a batch. */
const Square = step(
	work,
	"Square",
	{
		input: Schema.Struct({ batch: Schema.String, n: Schema.BigInt }),
		output: Schema.Struct({ square: Schema.BigInt }),
		error: Schema.Never,
		writes: writesNothing
	},
	(task) =>
		Effect.succeed({
			output: { square: task.n * task.n },
			writes: { insert: {}, put: {}, delete: {} }
		})
)

/** A batch: one square per number below its size, and a finish that tallies them once all are done. */
const Batch = scope("Batch", {
	input: Schema.Struct({ batch: Schema.String, size: Schema.BigInt }),
	children: [Square],
	start: (b) =>
		Arr.map(
			Arr.filter(Arr.range(1, Number(b.size)), (n) => n <= b.size),
			(n) => Square.of({ batch: b.batch, n: BigInt(n) })
		),
	finish: {
		lane: work,
		reads: [Square],
		error: Schema.Never,
		writes: writes({ insert: [Tally], put: [], delete: [] }),
		body: (b, results) =>
			Effect.succeed({
				insert: {
					Tally: [
						{
							batch: b.batch,
							count: BigInt(results.Square.length),
							total: Arr.reduce(results.Square, 0n, (sum, s) => sum + s.square)
						}
					]
				},
				put: {},
				delete: {}
			})
	}
})

/** A fan-out run: one batch, whose finish runs once after all its squares, and a root finish after the batch's. */
const FanRun = root("FanRun", {
	trigger: { kind: "command" },
	input: Schema.Struct({ batch: Schema.String, size: Schema.BigInt }),
	children: [Batch],
	start: (run) => [Batch.of({ batch: run.batch, size: run.size })],
	finish: {
		lane: work,
		reads: [],
		error: Schema.Never,
		writes: writes({ insert: [Settled], put: [], delete: [] }),
		body: (run) =>
			Effect.succeed({ insert: { Settled: [{ batch: run.batch }] }, put: {}, delete: {} })
	}
})

export const fan = flow("Fan", { lanes: [work], kinds: [Square, Batch, FanRun], edges: [] })
