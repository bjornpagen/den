import { flow } from "@bjornpagen/den/algebra/flow"
import {
	always,
	app,
	type Ending,
	atSpawn,
	attempts,
	anchor,
	edge,
	exclusiveBy,
	idle,
	nearest,
	never,
	operator,
	rows,
	resource,
	root,
	scope,
	shared,
	step,
	unconditional,
	writer,
	writes,
	writesNothing
} from "@bjornpagen/den/algebra/kinds"
import { Array as Arr, Context, Effect, Option, Order, Schema } from "effect"
import {
	Assigned,
	Built,
	Concluded,
	Copied,
	Cursor,
	Item,
	Missed,
	Passage,
	Seen,
	Settled,
	Tally,
	Weight
} from "#integration/slice/relations.ts"
import type { Loader } from "#integration/slice/roles.ts"

/**
 * The slice's five flows: a chain whose pages read a weight before their bodies run, started by an operator or by the
 * app's own write; a fan-out whose squares share a resource of two seats; a sync whose roots hold an exclusivity seat
 * per relation, beside a Gold build admitted only while the chain has nothing pending; two retry ladders, one that ends
 * and one that never does; and an assignment, the assignment engine's shape, whose one step reads the passages nearest
 * a missed question's stored embedding and the passages its learner has seen, in one snapshot. Every flow writes the app's relations under its app role
 * `loader`.
 */

const loader = writer<typeof Loader>("loader")

/** The ordinals `0 … count − 1`, none for a count of 0. */
const ordinals = (count: number): ReadonlyArray<number> =>
	Array.from({ length: count }, (_, at) => at)

/** A page's position in its feed. */
const Seq = Schema.BigInt.pipe(Schema.brand("Seq"))
const Feed = Schema.Literals(["news", "sport"])

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
 * Reads one page of a feed: a page holds its position plus one items for each unit of the feed's weight, which it reads
 * before its body runs (a feed with no weight counts as weight one), and every page but the feed's last names the
 * next. Its items are the app's rows, committed with its result and the weight rows it read.
 */
const Page = step(
	"Page",
	{
		input: PageInput,
		output: PageRead,
		error: Schema.Never,
		reads: {
			weights: rows(Weight, ["feed"], (page: typeof PageInput.Type) => ({ feed: page.feed }))
		},
		uses: [],
		retry: attempts(3),
		due: atSpawn,
		writes: writes({ insert: [Item], put: [], delete: [] })
	},
	(page, { weights }) => {
		const factor = Arr.reduce(weights, 0n, (sum, w) => sum + w.factor)
		const items = (page.seq + 1n) * (factor > 0n ? factor : 1n)
		return Effect.succeed({
			output: {
				seq: page.seq,
				items,
				next: page.seq + 1n < page.pages ? Option.some(`after-${page.seq}`) : Option.none<string>()
			},
			writes: {
				insert: {
					Item: Arr.map(ordinals(Number(items)), (n) => ({
						feed: page.feed,
						seq: page.seq,
						n: BigInt(n)
					}))
				},
				put: {},
				delete: {}
			}
		})
	}
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

/** A chain's input: the feed and how many pages it holds. */
const ChainInput = Schema.Struct({ feed: Feed, pages: Schema.BigInt })

/** A chain's finish: the feed's cursor moved to the furthest page read. */
const moveCursor = Object.freeze({
	reads: [Page],
	error: Schema.Never,
	retry: attempts(3),
	writes: writes({ insert: [Cursor], put: [], delete: [] }),
	body: (
		run: typeof ChainInput.Type,
		endings: { readonly Page: ReadonlyArray<Ending<typeof PageRead.Type>> }
	) =>
		Effect.succeed({
			insert: {
				Cursor: [
					{
						feed: run.feed,
						position: Arr.reduce(endings.Page, -1n, (last, ending) =>
							ending._tag === "Done" && ending.output.seq > last ? ending.output.seq : last
						)
					}
				]
			},
			put: {},
			delete: {}
		})
})

const firstPage = (run: typeof ChainInput.Type) => [
	Page.of({ feed: run.feed, seq: Seq.make(0n), pages: run.pages, after: Option.none() })
]

/** A feed's chain an operator starts: its first page, the chain its edges grow, and a finish moving its cursor. */
const ChainRun = root("ChainRun", {
	trigger: operator,
	input: ChainInput,
	children: [Page],
	start: firstPage,
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: moveCursor
})

/** The same chain, requested by the app's own write inside its own transaction, beside the order it records. */
const Ordered = root("Ordered", {
	trigger: app,
	input: ChainInput,
	children: [Page],
	start: firstPage,
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: moveCursor
})

export const chain = flow("Chain", {
	writes: loader,
	kinds: [Page, ChainRun, Ordered],
	edges: [Next]
})

/**
 * The fan-out's shared bottleneck: two seats, the box of grizzle's own work-queue law suite, in which two leases meet at
 * a seat as often as they miss it.
 *
 * @limitKind published
 * @owner the slice's contention box, after grizzle's work-queue law suite
 * @unit seats
 * @scope the squares of every batch, across every run, holding a seat of the Pool while they run
 * @constraint compile-time constant
 * @source https://github.com/bjornpagen/grizzle/blob/a226cbac/test/support/laws/boxes.ts
 * @quote Two resources of two seats each: two leases meet at a seat as often as they miss it.
 * @verified 2026-11-11
 */
export const poolSeats = 2

const pool = resource("Pool", poolSeats)

/** Squares one number of a batch, holding a seat of the Pool while it runs. */
const Square = step(
	"Square",
	{
		input: Schema.Struct({ batch: Schema.String, n: Schema.BigInt }),
		output: Schema.Struct({ square: Schema.BigInt }),
		error: Schema.Never,
		reads: {},
		uses: [pool],
		retry: attempts(3),
		due: atSpawn,
		writes: writesNothing
	},
	(task) =>
		Effect.succeed({
			output: { square: task.n * task.n },
			writes: { insert: {}, put: {}, delete: {} }
		})
)

/** A batch: one square per number from 1 to its size, and a finish that tallies them once all have ended. */
const Batch = scope("Batch", {
	input: Schema.Struct({ batch: Schema.String, size: Schema.BigInt }),
	children: [Square],
	start: (b) =>
		Arr.map(ordinals(Number(b.size)), (n) => Square.of({ batch: b.batch, n: BigInt(n + 1) })),
	finish: {
		reads: [Square],
		error: Schema.Never,
		retry: attempts(3),
		writes: writes({ insert: [Tally], put: [], delete: [] }),
		body: (b, endings) =>
			Effect.succeed({
				insert: {
					Tally: [
						{
							batch: b.batch,
							count: BigInt(endings.Square.length),
							total: Arr.reduce(endings.Square, 0n, (sum, e) =>
								e._tag === "Done" ? sum + e.output.square : sum
							)
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
	trigger: operator,
	input: Schema.Struct({ batch: Schema.String, size: Schema.BigInt }),
	children: [Batch],
	start: (run) => [Batch.of({ batch: run.batch, size: run.size })],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Batch],
		error: Schema.Never,
		retry: attempts(3),
		writes: writes({ insert: [Settled], put: [], delete: [] }),
		body: (run) =>
			Effect.succeed({ insert: { Settled: [{ batch: run.batch }] }, put: {}, delete: {} })
	}
})

export const fan = flow("Fan", { writes: loader, kinds: [Square, Batch, FanRun], edges: [] })

/** A relation one sync run copies. */
const SyncInput = Schema.Struct({ relation: Schema.String, run: Schema.BigInt })

/** Copies a relation for one run. */
const Copy = step(
	"Copy",
	{
		input: SyncInput,
		output: Schema.Struct({ run: Schema.BigInt }),
		error: Schema.Never,
		reads: {},
		uses: [],
		retry: attempts(3),
		due: atSpawn,
		writes: writes({ insert: [Copied], put: [], delete: [] })
	},
	(input) =>
		Effect.succeed({
			output: { run: input.run },
			writes: {
				insert: { Copied: [{ relation: input.relation, run: input.run }] },
				put: {},
				delete: {}
			}
		})
)

/** One live sync per relation: a second root for a relation whose sync is live is skipped, never admitted. */
const SyncRun = root("SyncRun", {
	trigger: operator,
	input: SyncInput,
	children: [Copy],
	start: (input) => [Copy.of(input)],
	exclusive: exclusiveBy((input: typeof SyncInput.Type) => input.relation),
	window: always,
	precondition: unconditional,
	finish: {
		reads: [],
		error: Schema.Never,
		retry: attempts(3),
		writes: writesNothing,
		body: () => Effect.succeed({ insert: {}, put: {}, delete: {} })
	}
})

/** One Gold build. */
const Build = step(
	"Build",
	{
		input: Schema.Struct({ build: Schema.BigInt }),
		output: Schema.Struct({ build: Schema.BigInt }),
		error: Schema.Never,
		reads: {},
		uses: [],
		retry: attempts(3),
		due: atSpawn,
		writes: writes({ insert: [Built], put: [], delete: [] })
	},
	(input) =>
		Effect.succeed({
			output: { build: input.build },
			writes: { insert: { Built: [{ build: input.build }] }, put: {}, delete: {} }
		})
)

/** The Gold build, admitted only while the chain has no step pending (W4: no Timeback or QTI step pending). */
const Gold = root("Gold", {
	trigger: operator,
	input: Schema.Struct({ build: Schema.BigInt }),
	children: [Build],
	start: (input) => [Build.of(input)],
	exclusive: shared,
	window: always,
	precondition: idle("Chain"),
	finish: {
		reads: [],
		error: Schema.Never,
		retry: attempts(3),
		writes: writesNothing,
		body: () => Effect.succeed({ insert: {}, put: {}, delete: {} })
	}
})

export const sync = flow("Sync", { writes: loader, kinds: [Copy, SyncRun, Build, Gold], edges: [] })

/** The faults the retry suite plants: how many more times each key's body dies before it succeeds. */
export class Faults extends Context.Service<
	Faults,
	{ readonly dies: (key: string) => Effect.Effect<boolean> }
>()("@bjornpagen/den/integration/slice/flows/Faults") {}

/** A step that dies while its key's planted faults last, then succeeds. */
const Attempted = Schema.Struct({ key: Schema.String })

const faulty = (input: typeof Attempted.Type) =>
	Effect.flatMap(Faults, (faults) => faults.dies(input.key)).pipe(
		Effect.flatMap((dies) =>
			dies
				? Effect.die(`a planted fault of ${input.key}`)
				: Effect.succeed({
						output: { key: input.key },
						writes: { insert: {}, put: {}, delete: {} }
					})
		)
	)

/** A step whose ladder never ends: it is due again after every spent attempt (W6's reports). */
const Steadfast = step(
	"Steadfast",
	{
		input: Attempted,
		output: Attempted,
		error: Schema.Never,
		reads: {},
		uses: [],
		retry: never,
		due: atSpawn,
		writes: writesNothing
	},
	faulty
)

/** A step whose ladder ends after two spent attempts. */
const Brittle = step(
	"Brittle",
	{
		input: Attempted,
		output: Attempted,
		error: Schema.Never,
		reads: {},
		uses: [],
		retry: attempts(2),
		due: atSpawn,
		writes: writesNothing
	},
	faulty
)

/** A run of both ladders, whose finish reads how each ended. */
const Ladders = root("Ladders", {
	trigger: operator,
	input: Schema.Struct({ steadfast: Schema.String, brittle: Schema.String }),
	children: [Steadfast, Brittle],
	start: (input) => [Steadfast.of({ key: input.steadfast }), Brittle.of({ key: input.brittle })],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Steadfast, Brittle],
		error: Schema.Never,
		retry: attempts(3),
		writes: writesNothing,
		body: () => Effect.succeed({ insert: {}, put: {}, delete: {} })
	}
})

export const retry = flow("Retry", {
	writes: loader,
	kinds: [Steadfast, Brittle, Ladders],
	edges: []
})

/**
 * An assignment's question: a learner, a topic, the question it missed, whose stored embedding its passages are ranked
 * by, passages to pass over beside those the learner has seen, and how near a passage must be: the nearest one found,
 * or one within a radius.
 */
const Probe = Schema.Struct({
	learner: Schema.String,
	topic: Schema.String,
	missed: Schema.String,
	exclude: Schema.Array(Schema.String),
	mode: Schema.TaggedUnion({ Nearest: {}, Within: { radius: Schema.Finite } })
})

/**
 * A decision, the shape of a model's structured answer: what it serves (a passage at its distance, or rest), every
 * passage it weighed in the order it weighed them, and how sure it is.
 */
const Decision = Schema.Struct({
	stage: Schema.TaggedUnion({
		Serve: { passage: Schema.String, distance: Schema.Finite },
		Rest: {}
	}),
	weighed: Schema.Array(
		Schema.Struct({ passage: Schema.String, distance: Schema.Finite, passed: Schema.Boolean })
	),
	confidence: Schema.Finite
})

/**
 * How many passages an assignment's nearest read finds at most, the suite's own size: within the topics' sizes the
 * suite draws, so a topic holds more passages than are found as often as fewer.
 */
export const assignedAmong = 3

/** What an assignment decides from the passages it found and those it passes over. */
const decide = (
	mode: typeof Probe.Type.mode,
	found: ReadonlyArray<{ readonly passage: string; readonly distance: number }>,
	passed: ReadonlySet<string>
): typeof Decision.Type => {
	const weighed = Arr.map(
		Arr.sort(
			found,
			Order.mapInput(Order.Number, (row: { readonly distance: number }) => row.distance)
		),
		(row) => ({ passage: row.passage, distance: row.distance, passed: passed.has(row.passage) })
	)
	const near = (distance: number) => mode._tag === "Nearest" || distance <= mode.radius
	return Option.match(
		Arr.findFirst(weighed, (row) => !row.passed && near(row.distance)),
		{
			onNone: () => ({ stage: { _tag: "Rest" as const }, weighed, confidence: 0 }),
			onSome: (row) => ({
				stage: { _tag: "Serve" as const, passage: row.passage, distance: row.distance },
				weighed,
				confidence: 1 - row.distance / 2
			})
		}
	)
}

/**
 * Decides an assignment, as a model would answer: of the passages of its topic nearest the question it missed, the nearest
 * its learner has neither seen nor been told to pass over, within its radius if it names one, or rest. Both reads are
 * recorded with its result, so the decision's whole context is a fact of the graph, and the decision itself is its
 * output, recorded once.
 */
const Decide = step(
	"Decide",
	{
		input: Probe,
		output: Decision,
		error: Schema.Never,
		reads: {
			nearest: nearest(
				Passage,
				"embedding",
				assignedAmong,
				["topic"],
				anchor(Missed, "embedding"),
				(probe: typeof Probe.Type) => ({
					topic: probe.topic,
					anchor: { question: probe.missed }
				})
			),
			seen: rows(Seen, ["learner"], (probe: typeof Probe.Type) => ({ learner: probe.learner }))
		},
		uses: [],
		retry: attempts(3),
		due: atSpawn,
		writes: writes({ insert: [Assigned], put: [], delete: [] })
	},
	(probe, found) => {
		const decision = decide(
			probe.mode,
			found.nearest,
			new Set([...Arr.map(found.seen, (row) => row.passage), ...probe.exclude])
		)
		return Effect.succeed({
			output: decision,
			writes: {
				insert: {
					Assigned:
						decision.stage._tag === "Serve"
							? [{ learner: probe.learner, passage: decision.stage.passage }]
							: []
				},
				put: {},
				delete: {}
			}
		})
	}
)

/**
 * An operator's assignment of one learner, its one step the decision; its finish reads the decision back from the
 * graph and concludes the learner's assignment with what it served and how many passages it weighed.
 */
const Assignment = root("Assignment", {
	trigger: operator,
	input: Probe,
	children: [Decide],
	start: (probe) => [Decide.of(probe)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Decide],
		error: Schema.Never,
		retry: attempts(3),
		writes: writes({ insert: [Concluded], put: [], delete: [] }),
		body: (
			probe: typeof Probe.Type,
			endings: { readonly Decide: ReadonlyArray<Ending<typeof Decision.Type>> }
		) =>
			Effect.succeed({
				insert: {
					Concluded: Arr.flatMap(endings.Decide, (ending) =>
						ending._tag === "Done"
							? [
									{
										learner: probe.learner,
										served:
											ending.output.stage._tag === "Serve" ? ending.output.stage.passage : "rest",
										weighed: BigInt(ending.output.weighed.length)
									}
								]
							: []
					)
				},
				put: {},
				delete: {}
			})
	}
})

export const assign = flow("Assign", {
	writes: loader,
	kinds: [Decide, Assignment],
	edges: []
})
