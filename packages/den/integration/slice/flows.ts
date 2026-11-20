import { flow } from "@bjornpagen/den/algebra/flow"
import {
	always,
	app,
	type Ending,
	atSpawn,
	attempts,
	awaitFact,
	edge,
	exclusiveBy,
	idle,
	never,
	noReads,
	operator,
	reads,
	resource,
	vectorOf,
	root,
	schedule,
	scope,
	shared,
	step,
	unconditional,
	writer,
	writes,
	writesNothing
} from "@bjornpagen/den/algebra/kinds"
import { laterOf } from "@bjornpagen/den/algebra/later"
import { Compute, query, v, Vector } from "@bjornpagen/grizzle"
import { Array as Arr, Context, Cron, Effect, Option, Order, Schema } from "effect"
import {
	Assigned,
	Built,
	Chimed,
	Concluded,
	Copied,
	Cursor,
	Delivered,
	embeddingDimensions,
	Heard,
	Item,
	Passage,
	Reviewed,
	Seen,
	Settled,
	Summary,
	Tally,
	Weight
} from "#integration/slice/relations.ts"
import type { Loader } from "#integration/slice/roles.ts"

/**
 * The slice's eight flows: a chain whose pages read a weight before their bodies run, started by an operator or by the
 * app's own write; a fan-out whose squares share a resource of two seats; a sync whose roots hold an exclusivity seat
 * per relation, beside a Gold build admitted only while the chain has nothing pending; two retry ladders, one that ends
 * and one that never does; and an assignment, the assignment engine's shape, whose one step reads the passages nearest
 * a missed question's stored embedding and the passages its learner has seen, in one snapshot; and a review, AlphaTest's
 * gap analysis's shape, whose first step's edge opens a child scope per group of questions, each group's finish a
 * cluster over its questions whose commit spawns the group's save in the review, its first step joined on the
 * gradebook's delivery of the attempt it reviews; a writeback, whose one step delivers it; and a clock, a root its schedule starts
 * each hour, which the census requests. Every flow writes the app's relations under its app role `loader`.
 */

const loader = writer<typeof Loader>("loader")

/** The output of a finish whose scope's parent reads nothing of it beyond its ending, and from which no edge leaves. */
const Finished = Schema.Struct({})

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

/**
 * What a page read: its position, how many items it held, how many of its feed's items the pages before it had, and the
 * cursor of the page after it, if any.
 */
const PageRead = Schema.Struct({
	seq: Seq,
	items: Schema.BigInt,
	earlier: Schema.BigInt,
	next: Schema.Option(Schema.String)
})

/**
 * Reads one page of a feed: a page holds its position plus one items for each unit of the feed's weight, which it reads
 * before its body runs (a feed with no weight counts as weight one), and every page but the feed's last names the
 * next. It reads its feed's items so far beside the weight, as each turn of a conversation reads its thread, and counts
 * them. Its items are the app's rows, committed with its result and the rows it read: each a reference to a row its
 * root records once, so the feed's items, which every later page reads again, are stored once each.
 */
const Page = step(
	"Page",
	{
		input: PageInput,
		output: PageRead,
		error: Schema.Never,
		reads: reads(
			(role: typeof Loader) =>
				query(role).reads({
					weights: query(role).rule((r) => {
						const { feed, factor } = v(Weight, "weight")
						return r
							.match(Weight, { feed, factor })
							.where(r.eq(feed, r.param("feed", Weight.fields.feed)))
							.find({ feed, factor })
					}),
					earlier: query(role).rule((r) => {
						const { feed, seq, n } = v(Item, "item")
						return r
							.match(Item, { feed, seq, n })
							.where(r.eq(feed, r.param("feed", Item.fields.feed)))
							.find({ feed, seq, n })
					})
				}),
			{
				weights: Schema.Struct({ feed: Feed, factor: Schema.BigInt }),
				earlier: Schema.Struct({ feed: Feed, seq: Schema.BigInt, n: Schema.BigInt })
			},
			(page: typeof PageInput.Type) => ({ "weights.feed": page.feed, "earlier.feed": page.feed })
		),
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writes({ insert: [Item], put: [], delete: [] })
	},
	(page, { weights, earlier }) => {
		const factor = Arr.reduce(weights, 0n, (sum, w) => sum + w.factor)
		const items = (page.seq + 1n) * (factor > 0n ? factor : 1n)
		return Effect.succeed({
			output: {
				seq: page.seq,
				items,
				earlier: BigInt(earlier.length),
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
	output: Finished,
	error: Schema.Never,
	uses: [],
	retry: attempts(3),
	waits: 0,
	writes: writes({ insert: [Cursor], put: [], delete: [] }),
	body: (
		run: typeof ChainInput.Type,
		endings: { readonly Page: ReadonlyArray<Ending<typeof PageRead.Type>> }
	) =>
		Effect.succeed({
			output: {},
			writes: {
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
			}
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

/** The fan flow's one resource, its Pool. */
export const pool = resource("Pool", poolSeats)

/** Squares one number of a batch, holding a seat of the Pool while it runs. */
const Square = step(
	"Square",
	{
		input: Schema.Struct({ batch: Schema.String, n: Schema.BigInt }),
		output: Schema.Struct({ square: Schema.BigInt }),
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [pool],
		retry: attempts(3),
		waits: 0,
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
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writes({ insert: [Tally], put: [], delete: [] }),
		body: (b, endings) =>
			Effect.succeed({
				output: {},
				writes: {
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
				}
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
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writes({ insert: [Settled], put: [], delete: [] }),
		body: (run) =>
			Effect.succeed({
				output: {},
				writes: { insert: { Settled: [{ batch: run.batch }] }, put: {}, delete: {} }
			})
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
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
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
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	}
})

/** One Gold build. */
const Build = step(
	"Build",
	{
		input: Schema.Struct({ build: Schema.BigInt }),
		output: Schema.Struct({ build: Schema.BigInt }),
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
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
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	}
})

export const sync = flow("Sync", { writes: loader, kinds: [Copy, SyncRun, Build, Gold], edges: [] })

/**
 * The faults the retry suites plant: how many more times each key's body dies before it succeeds, and the responses of
 * a source that refuses each key's calls for now, each naming when to call again in its headers, one a call while they
 * last.
 */
export class Faults extends Context.Service<
	Faults,
	{
		readonly dies: (key: string) => Effect.Effect<boolean>
		readonly refuses: (key: string) => Effect.Effect<Option.Option<Headers>>
	}
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
		reads: noReads,
		awaits: [],
		uses: [],
		retry: never,
		waits: 0,
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
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(2),
		waits: 0,
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
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	}
})

/**
 * How many times the polite step may wait on its source before its next refusal fails it: the suite's own count, below
 * the most refusals the suite plants, so a source that keeps refusing past it is drawn beside one that answers within it.
 */
export const politeWaits = 2

/**
 * A step whose source refuses its calls for now while its key's planted refusals last, each response naming when to
 * call again, and then answers: its body parses the delay the source named at the boundary and fails with it, `Later`.
 * Its ladder allows one attempt, so a refusal that spent an attempt would fail it, and it waits on its source at most
 * `politeWaits` times, so the refusal after them fails it.
 */
const Polite = step(
	"Polite",
	{
		input: Attempted,
		output: Attempted,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(1),
		waits: politeWaits,
		due: atSpawn,
		writes: writesNothing
	},
	(input) =>
		Effect.flatMap(Faults, (faults) => faults.refuses(input.key)).pipe(
			Effect.flatMap((refused) =>
				Option.match(refused, {
					onNone: () =>
						Effect.succeed({
							output: { key: input.key },
							writes: { insert: {}, put: {}, delete: {} }
						}),
					onSome: (headers) =>
						Option.match(laterOf(headers), {
							onNone: () => Effect.die(`a planted refusal of ${input.key} names no delay`),
							onSome: (later) => Effect.fail(later)
						})
				})
			)
		)
)

/** A run of the polite step, whose finish records what it heard: its source's answer, or a refusal past its waits. */
const Throttled = root("Throttled", {
	trigger: operator,
	input: Attempted,
	children: [Polite],
	start: (input) => [Polite.of(input)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Polite],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writes({ insert: [Heard], put: [], delete: [] }),
		body: (input, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					insert: {
						Heard: Arr.map(endings.Polite, (ending) => ({
							key: input.key,
							answered: ending._tag === "Done"
						}))
					},
					put: {},
					delete: {}
				}
			})
	}
})

export const retry = flow("Retry", {
	writes: loader,
	kinds: [Steadfast, Brittle, Ladders, Polite, Throttled],
	edges: []
})

/** How near a passage must be: the nearest one found, or one within a radius. */
const Mode = Schema.TaggedUnion({ Nearest: {}, Within: { radius: Schema.Finite } })

/**
 * An assignment's question: a learner, a topic, the question it missed as its embedding's components, which its first
 * step embeds, passages to pass over beside those the learner has seen, and how near a passage must be.
 */
const Probe = Schema.Struct({
	learner: Schema.String,
	topic: Schema.String,
	near: Schema.Array(Schema.Finite),
	exclude: Schema.Array(Schema.String),
	mode: Mode
})

/** A question embedded: the vector its passages are ranked by, which its embedding's step computed. */
const Embedded = Schema.Struct({ vector: vectorOf(embeddingDimensions) })

/** What a decision takes: the probe's learner, topic, passes and mode, and the query vector the step before it made. */
const Question = Schema.Struct({
	learner: Schema.String,
	topic: Schema.String,
	vector: vectorOf(embeddingDimensions),
	exclude: Schema.Array(Schema.String),
	mode: Mode
})

/**
 * Embeds an assignment's question, as a model's embedding call would: its body computes the query vector, which its
 * edge carries to the decision, whose search ranks by it.
 */
const Embed = step(
	"Embed",
	{
		input: Probe,
		output: Embedded,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writesNothing
	},
	(probe) =>
		Effect.succeed({
			output: { vector: Vector.make(Float32Array.from(probe.near), embeddingDimensions) },
			writes: { insert: {}, put: {}, delete: {} }
		})
)

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
		input: Question,
		output: Decision,
		error: Schema.Never,
		reads: reads(
			(role: typeof Loader) =>
				query(role).reads({
					nearest: query(role)
						.rule((r) => {
							const { passage, topic, embedding } = v(Passage, "passage")
							return r
								.match(Passage, { passage, topic, embedding })
								.where(r.eq(topic, r.param("topic", Passage.fields.topic)))
								.find({
									passage,
									topic,
									distance: Compute.cosineDistance(
										embedding,
										r.param("query", Passage.fields.embedding)
									)
								})
						})
						.approximateNearest({ by: "distance", take: assignedAmong }),
					seen: query(role).rule((r) => {
						const { learner, passage } = v(Seen, "seen")
						return r
							.match(Seen, { learner, passage })
							.where(r.eq(learner, r.param("learner", Seen.fields.learner)))
							.find({ learner, passage })
					})
				}),
			{
				nearest: Schema.Struct({
					passage: Schema.String,
					topic: Schema.String,
					distance: Schema.Finite
				}),
				seen: Schema.Struct({ learner: Schema.String, passage: Schema.String })
			},
			(question: typeof Question.Type) => ({
				"nearest.query": question.vector,
				"nearest.topic": question.topic,
				"seen.learner": question.learner
			})
		),
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writes({ insert: [Assigned], put: [], delete: [] })
	},
	(question, found) => {
		const decision = decide(
			question.mode,
			found.nearest,
			new Set([...Arr.map(found.seen, (row) => row.passage), ...question.exclude])
		)
		return Effect.succeed({
			output: decision,
			writes: {
				insert: {
					Assigned:
						decision.stage._tag === "Serve"
							? [{ learner: question.learner, passage: decision.stage.passage }]
							: []
				},
				put: {},
				delete: {}
			}
		})
	}
)

/** The decision after its question is embedded, from the probe and the query vector the embedding computed. */
const Asked = edge("Asked", Embed, Decide, (probe, embedded) => [
	{
		learner: probe.learner,
		topic: probe.topic,
		vector: embedded.vector,
		exclude: probe.exclude,
		mode: probe.mode
	}
])

/**
 * An operator's assignment of one learner: its question embedded, then the decision; its finish reads the decision
 * back from the graph and concludes the learner's assignment with what it served and how many passages it weighed.
 */
const Assignment = root("Assignment", {
	trigger: operator,
	input: Probe,
	children: [Embed],
	start: (probe) => [Embed.of(probe)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Decide],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writes({ insert: [Concluded], put: [], delete: [] }),
		body: (
			probe: typeof Probe.Type,
			endings: { readonly Decide: ReadonlyArray<Ending<typeof Decision.Type>> }
		) =>
			Effect.succeed({
				output: {},
				writes: {
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
				}
			})
	}
})

export const assign = flow("Assign", {
	writes: loader,
	kinds: [Embed, Decide, Assignment],
	edges: [Asked]
})

/**
 * The review flow's model calls' shared bottleneck, Anthropic's, at the slice's scale: two seats, the box of grizzle's
 * own work-queue law suite, in which two leases meet at a seat as often as they miss it.
 *
 * @limitKind published
 * @owner the slice's contention box, after grizzle's work-queue law suite
 * @unit seats
 * @scope every question's analysis and every group's cluster, across every review, holding a seat while it runs
 * @constraint compile-time constant
 * @source https://github.com/bjornpagen/grizzle/blob/a226cbac/test/support/laws/boxes.ts
 * @quote Two resources of two seats each: two leases meet at a seat as often as they miss it.
 * @verified 2026-11-11
 */
const anthropicSeats = 2

/** The review flow's one resource, Anthropic's model calls: every analysis and every cluster holds a seat. */
const anthropic = resource("Anthropic", anthropicSeats)

/** A review: its key, and how many questions each of its groups holds, in order. */
const ReviewInput = Schema.Struct({ review: Schema.String, sizes: Schema.Array(Schema.BigInt) })

/** One group of a review: the review, the group's place, and how many questions it holds. */
const GroupInput = Schema.Struct({
	review: Schema.String,
	group: Schema.BigInt,
	size: Schema.BigInt
})

/** One question of a group, by its place from 1. */
const QuestionInput = Schema.Struct({
	review: Schema.String,
	group: Schema.BigInt,
	question: Schema.BigInt
})

/** A group's cluster: how many of its questions were analysed, and their scores' total. */
const Clustered = Schema.Struct({ count: Schema.BigInt, total: Schema.BigInt })

/** Analyses one question of a group: its score, the square of its place. */
const Analyze = step(
	"Analyze",
	{
		input: QuestionInput,
		output: Schema.Struct({ score: Schema.BigInt }),
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [anthropic],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writesNothing
	},
	(question) =>
		Effect.succeed({
			output: { score: question.question * question.question },
			writes: { insert: {}, put: {}, delete: {} }
		})
)

/**
 * A group's questions, one Analyze each, and its finish, the cluster over every question's analysis, whose output is
 * the group's: AlphaTest's gap analysis's map and its reduce. The analyses and the cluster each make a model call, so
 * each holds a seat of Anthropic's while it runs, the finish as a step does.
 */
const Questions = scope("Questions", {
	input: GroupInput,
	children: [Analyze],
	start: (group) =>
		Arr.map(ordinals(Number(group.size)), (n) =>
			Analyze.of({ review: group.review, group: group.group, question: BigInt(n + 1) })
		),
	finish: {
		reads: [Analyze],
		output: Clustered,
		error: Schema.Never,
		uses: [anthropic],
		retry: attempts(3),
		waits: 0,
		writes: writesNothing,
		body: (_group, endings) =>
			Effect.succeed({
				output: {
					count: BigInt(endings.Analyze.length),
					total: Arr.reduce(endings.Analyze, 0n, (sum, e) =>
						e._tag === "Done" ? sum + e.output.score : sum
					)
				},
				writes: { insert: {}, put: {}, delete: {} }
			})
	}
})

/**
 * Gathers a review, once the gradebook delivered the attempt it reviews: it names its groups, which its edge opens as
 * child scopes. It is joined on its input and the attempt's Delivered, whichever comes first, so it never runs before
 * the delivery and is rung by the commit that completes the pair.
 */
const Gather = step(
	"Gather",
	{
		input: ReviewInput,
		output: Schema.Struct({ groups: Schema.BigInt }),
		error: Schema.Never,
		reads: noReads,
		awaits: [awaitFact(Delivered, { attempt: "review" })],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writesNothing
	},
	(review) =>
		Effect.succeed({
			output: { groups: BigInt(review.sizes.length) },
			writes: { insert: {}, put: {}, delete: {} }
		})
)

/** A review's groups, each a child scope of its questions, opened by the edge from Gather. */
const Split = edge("Split", Gather, Questions, (review) =>
	Arr.map(review.sizes, (size, group) => ({ review: review.review, group: BigInt(group), size }))
)

/** Saves one group once its questions' cluster has run: the group's row, from its input and its cluster. */
const Save = step(
	"Save",
	{
		input: Schema.Struct({
			review: Schema.String,
			group: Schema.BigInt,
			count: Schema.BigInt,
			total: Schema.BigInt
		}),
		output: Schema.Struct({ total: Schema.BigInt }),
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writes({ insert: [Reviewed], put: [], delete: [] })
	},
	(group) =>
		Effect.succeed({
			output: { total: group.total },
			writes: {
				insert: {
					Reviewed: [
						{ review: group.review, group: group.group, count: group.count, total: group.total }
					]
				},
				put: {},
				delete: {}
			}
		})
)

/** The next stage after a group's questions end: its save, spawned in the review by the cluster's commit. */
const Saved = edge("Saved", Questions, Save, (group, cluster) => [
	{ review: group.review, group: group.group, count: cluster.count, total: cluster.total }
])

/**
 * A review an operator starts: Gather, whose edge opens one Questions scope per group, each followed by its Save once
 * its cluster has run; its finish sums what every group's cluster gave and how many groups saved.
 */
const ReviewRun = root("ReviewRun", {
	trigger: operator,
	input: ReviewInput,
	children: [Gather],
	start: (review) => [Gather.of(review)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Questions, Save],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writes({ insert: [Summary], put: [], delete: [] }),
		body: (review, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					insert: {
						Summary: [
							{
								review: review.review,
								groups: BigInt(Arr.filter(endings.Save, (e) => e._tag === "Done").length),
								total: Arr.reduce(endings.Questions, 0n, (sum, e) =>
									e._tag === "Done" ? sum + e.output.total : sum
								)
							}
						]
					},
					put: {},
					delete: {}
				}
			})
	}
})

export const review = flow("Review", {
	writes: loader,
	kinds: [Analyze, Questions, Gather, Save, ReviewRun],
	edges: [Split, Saved]
})

/** A graded attempt whose result the gradebook takes. */
const Graded = Schema.Struct({ attempt: Schema.String })

/** Delivers an attempt's result to the gradebook: the app's Delivered, a fact other flows' steps await. */
const Deliver = step(
	"Deliver",
	{
		input: Graded,
		output: Graded,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writes({ insert: [Delivered], put: [], delete: [] })
	},
	(graded) =>
		Effect.succeed({
			output: graded,
			writes: { insert: { Delivered: [{ attempt: graded.attempt }] }, put: {}, delete: {} }
		})
)

/** An attempt's writeback, AlphaTest's at grading: its one step delivers the result to the gradebook. */
const Writeback = root("Writeback", {
	trigger: operator,
	input: Graded,
	children: [Deliver],
	start: (graded) => [Deliver.of(graded)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	}
})

export const writeback = flow("Writeback", {
	writes: loader,
	kinds: [Deliver, Writeback],
	edges: []
})

/** An hour of the clock, the instant its schedule named, and the bell that chimes it, a member of its roster. */
const Hour = Schema.Struct({ hour: Schema.BigInt, bell: Schema.Literals(["east", "west"]) })

/** Chimes one hour on one bell: the app's row of it. */
const Chime = step(
	"Chime",
	{
		input: Hour,
		output: Hour,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: attempts(3),
		waits: 0,
		due: atSpawn,
		writes: writes({ insert: [Chimed], put: [], delete: [] })
	},
	(hour) =>
		Effect.succeed({
			output: hour,
			writes: { insert: { Chimed: [{ hour: hour.hour, bell: hour.bell }] }, put: {}, delete: {} }
		})
)

/**
 * A root per bell its schedule starts at the top of every hour, each keyed by the instant its cron named and its bell,
 * which every census tick requests until the next hour's: its one step chimes that bell.
 */
const Hourly = root("Hourly", {
	trigger: schedule(Cron.parseUnsafe("0 * * * *"), ["east", "west"], (at, bell) => ({
		hour: at,
		bell
	})),
	input: Hour,
	children: [Chime],
	start: (hour) => [Chime.of(hour)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: attempts(3),
		waits: 0,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	}
})

export const clock = flow("Clock", { writes: loader, kinds: [Chime, Hourly], edges: [] })
