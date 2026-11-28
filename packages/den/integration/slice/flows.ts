import { flow } from "@bjornpagen/den/algebra/flow"
import {
	always,
	app,
	type Ending,
	atSpawn,
	awaitFact,
	domainInput,
	derived,
	dueAt,
	edge,
	exclusiveBy,
	given,
	idle,
	instant,
	none,
	noReads,
	operator,
	pauseHandle,
	resource,
	vectorOf,
	root,
	schedule,
	scheduleKey,
	scope,
	shared,
	step,
	unconditional,
	untilSettled,
	through,
	writer,
	writesNothing
} from "@bjornpagen/den/algebra/kinds"
import { laterOf } from "@bjornpagen/den/algebra/later"
import * as g from "@bjornpagen/grizzle"
import { Array as Arr, Context, Cron, Effect, Option, Order, Schema } from "effect"
import { SliceBase } from "#integration/slice/base.ts"
import { buildNumberParser } from "#integration/slice/contracts.ts"
import { DecideReads, HourlyOf, PageReads, WantedOf } from "#integration/slice/reads.ts"
import {
	Assigned,
	Built,
	builtAtKey,
	Chimed,
	Concluded,
	Copied,
	Cursor,
	Delivered,
	embeddingDimensions,
	Heard,
	Item,
	Reviewed,
	Settled,
	Summary,
	Tally
} from "#integration/slice/relations.ts"
import type { Loader } from "#integration/slice/roles.ts"

/**
 * The slice's eight flows: a chain whose pages read a weight before their bodies run, started by an operator or by the
 * app's own write; a fan-out whose squares share a resource of two seats, beside sweeps that call an outside system
 * the operator pauses by a pause handle, one of them on a seat of the same resource; a sync whose roots hold an exclusivity seat
 * per relation, beside a Gold build admitted only while the chain has nothing pending; two retry ladders, one that ends
 * and one that never does; and an assignment, the assignment engine's shape, whose one step reads the passages nearest
 * a missed question's stored embedding and the passages its learner has seen, in one snapshot; and a review, AlphaTest's
 * gap analysis's shape, whose first step's edge opens a child scope per group of questions, each group's finish a
 * cluster over its questions whose commit spawns the group's save in the review, its first step joined on the
 * gradebook's delivery of the attempt it reviews; a writeback, whose one step delivers it; and a clock, a root its schedule starts
 * each hour, which the census requests, beside a timed sitting whose close is due at the deadline its input holds. Every flow writes the app's relations under its app role `loader`.
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
 * root records once, so the feed's items, which every later page reads again, are stored once each. It reads the
 * weight once more as a tree, the items so far attached under it and each item's page's first item under each, so each
 * page's tree is a row of its own, recorded with every row its attachments delivered.
 */
const Page = step(
	"Page",
	{
		input: PageInput,
		output: PageRead,
		error: Schema.Never,
		reads: PageReads,
		awaits: [],
		uses: [],
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Item, []), {})
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
				params: {},
				facts: {
					insert: {
						Item: Arr.map(ordinals(Number(items)), (n) => ({
							feed: page.feed,
							seq: page.seq,
							n: BigInt(n)
						}))
					}
				}
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
	retry: untilSettled,
	waits: none,
	writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Cursor, []), {}),
	body: (
		run: typeof ChainInput.Type,
		endings: { readonly Page: ReadonlyArray<Ending<typeof PageInput.Type, typeof PageRead.Type>> }
	) =>
		Effect.succeed({
			output: {},
			writes: {
				params: {},
				facts: {
					insert: {
						Cursor: [
							{
								feed: run.feed,
								position: Arr.reduce(endings.Page, -1n, (last, ending) =>
									ending._tag === "Done" && ending.output.seq > last ? ending.output.seq : last
								)
							}
						]
					}
				}
			}
		})
})

const firstPage = (run: typeof ChainInput.Type) => [
	Page.of({ feed: run.feed, seq: Seq.make(0n), pages: run.pages, after: Option.none() })
]

/** A feed's chain an operator starts: its first page, the chain its edges grow, and a finish moving its cursor. */
const ChainRun = root("ChainRun", {
	trigger: operator,
	from: given,
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
	from: given,
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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(task) =>
		Effect.succeed({
			output: { square: task.n * task.n }
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
		retry: untilSettled,
		waits: none,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Tally, []), {}),
		body: (b, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					params: {},
					facts: {
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
						}
					}
				}
			})
	}
})

/** A fan-out run's batch and its size. */
const FanInput = Schema.Struct({ batch: Schema.String, size: Schema.BigInt })

/** A fan-out run's finish, once its batch's has run: the batch settled. */
const settle = Object.freeze({
	reads: [Batch],
	output: Finished,
	error: Schema.Never,
	uses: [],
	retry: untilSettled,
	waits: none,
	writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Settled, []), {}),
	body: (run: typeof FanInput.Type) =>
		Effect.succeed({
			output: {},
			writes: { params: {}, facts: { insert: { Settled: [{ batch: run.batch }] } } }
		})
})

/** A fan-out run: one batch, whose finish runs once after all its squares, and a root finish after the batch's. */
const FanRun = root("FanRun", {
	trigger: operator,
	from: given,
	input: FanInput,
	children: [Batch],
	start: (run) => [Batch.of({ batch: run.batch, size: run.size })],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: settle
})

/**
 * The same run of a batch the app's write requests by the batch alone, its size derived from what the app wants
 * (reads.ts WantedOf) when the request commits: the largest size wanted, kept whatever is wanted after; and no run
 * where none is wanted.
 */
const Wanted = root("Wanted", {
	trigger: app,
	from: derived(Schema.Struct({ batch: Schema.String }), SliceBase, WantedOf),
	input: FanInput,
	children: [Batch],
	start: (run) => [Batch.of({ batch: run.batch, size: run.size })],
	exclusive: exclusiveBy((key: { readonly batch: string }) => key.batch),
	window: always,
	precondition: unconditional,
	finish: settle
})

/**
 * The outside system the fan's sweeps call, which no limit bounds: a pause handle, with no seats, that the operator
 * pauses to hold every step that calls it, as metis's switch holds every Timeback write and Anthropic call at its
 * cutover.
 */
const vendor = pauseHandle("Vendor")

/** A sweep, by its key. */
const SweepInput = Schema.Struct({ sweep: Schema.String })

/** Dusts once for a sweep, calling the Vendor alone: it holds no seat, and a pause of the Vendor holds it. */
const Dust = step(
	"Dust",
	{
		input: SweepInput,
		output: SweepInput,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [vendor],
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(sweep) => Effect.succeed({ output: sweep })
)

/**
 * Mops once for a sweep, calling the Vendor on a seat of the Pool: it holds a Pool seat while it runs, and a pause of
 * either holds it.
 */
const Mop = step(
	"Mop",
	{
		input: SweepInput,
		output: SweepInput,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [pool, vendor],
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(sweep) => Effect.succeed({ output: sweep })
)

/** A sweep: one Dust and one Mop, and a finish that reads neither. */
const Sweep = root("Sweep", {
	trigger: operator,
	from: given,
	input: SweepInput,
	children: [Dust, Mop],
	start: (sweep) => [Dust.of(sweep), Mop.of(sweep)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {} })
	}
})

export const fan = flow("Fan", {
	writes: loader,
	kinds: [Square, Batch, FanRun, Dust, Mop, Sweep, Wanted],
	edges: []
})

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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Copied, []), {})
	},
	(input) =>
		Effect.succeed({
			output: { run: input.run },
			writes: {
				params: {},
				facts: { insert: { Copied: [{ relation: input.relation, run: input.run }] } }
			}
		})
)

/** One live sync per relation: a second root for a relation whose sync is live is skipped, never admitted. */
const SyncRun = root("SyncRun", {
	trigger: operator,
	from: given,
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
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {} })
	}
})

/** A Gold build's number, BuildNumber's, decoded through its checked mint: den's column of it is BuildNumber itself. */
const BuildInput = Schema.Struct({ build: domainInput(buildNumberParser, Schema.BigInt) })

/** One Gold build. */
const Build = step(
	"Build",
	{
		input: BuildInput,
		output: BuildInput,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through(
			(role: typeof Loader) =>
				g.ChangeSet.empty(role).insert(
					Built,
					g.query(role).rule((r) =>
						r.find({
							build: r.param("build", Built.fields.build),
							at: r.param("builtAt", Built.fields.at)
						})
					)
				),
			{ builtAt: "millis" },
			{ builtAt: builtAtKey }
		)
	},
	(input) =>
		Effect.succeed({
			output: { build: input.build },
			writes: { params: { build: input.build }, facts: {} }
		})
)

/** The Gold build, admitted only while the chain has no step pending (W4: no Timeback or QTI step pending). */
const Gold = root("Gold", {
	trigger: operator,
	from: given,
	input: BuildInput,
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
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {} })
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
						output: { key: input.key }
					})
		)
	)

/** A step tried again until it succeeds: it is due again after every spent attempt (W6's reports). */
const Steadfast = step(
	"Steadfast",
	{
		input: Attempted,
		output: Attempted,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	faulty
)

/** A step never tried again: its first spent attempt fails it. */
const Brittle = step(
	"Brittle",
	{
		input: Attempted,
		output: Attempted,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: none,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	faulty
)

/**
 * A run of both ladders, whose finish records what it heard of each, by the key of the input its ending carries:
 * answered where the step was done, and not where its ladder failed it.
 */
const Ladders = root("Ladders", {
	trigger: operator,
	from: given,
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
		retry: untilSettled,
		waits: none,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Heard, []), {}),
		body: (_, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					params: {},
					facts: {
						insert: {
							Heard: Arr.map([...endings.Steadfast, ...endings.Brittle], (ending) => ({
								key: ending.input.key,
								answered: ending._tag === "Done"
							}))
						}
					}
				}
			})
	}
})

/**
 * Calls a source that refuses its calls for now while its key's planted refusals last, each response naming when to
 * call again, and then answers: it parses the delay the source named at the boundary and fails with it, `Later`.
 */
const asksSource = (input: typeof Attempted.Type) =>
	Effect.flatMap(Faults, (faults) => faults.refuses(input.key)).pipe(
		Effect.flatMap((refused) =>
			Option.match(refused, {
				onNone: () =>
					Effect.succeed({
						output: { key: input.key }
					}),
				onSome: (headers) =>
					Option.match(laterOf(headers), {
						onNone: () => Effect.die(`a planted refusal of ${input.key} names no delay`),
						onSome: (later) => Effect.fail(later)
					})
			})
		)
	)

/**
 * A step whose source refuses its calls for now while its key's planted refusals last, each response naming when to
 * call again, and then answers: its body parses the delay the source named at the boundary and fails with it, `Later`.
 * It is never tried again, so a refusal that spent an attempt would fail it, and it does not wait on its source, so
 * its source's first refusal fails it.
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
		retry: none,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	asksSource
)

/** A run of the polite step, whose finish records what it heard: its source's answer, or a refusal. */
const Throttled = root("Throttled", {
	trigger: operator,
	from: given,
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
		retry: untilSettled,
		waits: none,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Heard, []), {}),
		body: (input, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					params: {},
					facts: {
						insert: {
							Heard: Arr.map(endings.Polite, (ending) => ({
								key: input.key,
								answered: ending._tag === "Done"
							}))
						}
					}
				}
			})
	}
})

/**
 * A step whose source refuses its calls for now while its key's planted refusals last, as the polite step's does, and
 * which waits on it until it answers: however often it refuses, each refusal is a wait due at the instant it named, and
 * only the source's answer ends the step (metis's Timeback writes). It is never tried again, so a refusal that spent an
 * attempt would fail it.
 */
const Patient = step(
	"Patient",
	{
		input: Attempted,
		output: Attempted,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: none,
		waits: untilSettled,
		due: atSpawn,
		writes: writesNothing
	},
	asksSource
)

/** A run of the patient step, whose finish records what it heard: its source's answer, however late. */
const Unhurried = root("Unhurried", {
	trigger: operator,
	from: given,
	input: Attempted,
	children: [Patient],
	start: (input) => [Patient.of(input)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [Patient],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: untilSettled,
		waits: none,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Heard, []), {}),
		body: (input, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					params: {},
					facts: {
						insert: {
							Heard: Arr.map(endings.Patient, (ending) => ({
								key: input.key,
								answered: ending._tag === "Done"
							}))
						}
					}
				}
			})
	}
})

export const retry = flow("Retry", {
	writes: loader,
	kinds: [Steadfast, Brittle, Ladders, Polite, Throttled, Patient, Unhurried],
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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(probe) =>
		Effect.succeed({
			output: { vector: g.Vector.make(Float32Array.from(probe.near), embeddingDimensions) }
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
		reads: DecideReads,
		awaits: [],
		uses: [],
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Assigned, []), {})
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
				params: {},
				facts: {
					insert: {
						Assigned:
							decision.stage._tag === "Serve"
								? [{ learner: question.learner, passage: decision.stage.passage }]
								: []
					}
				}
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
	from: given,
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
		retry: untilSettled,
		waits: none,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Concluded, []), {}),
		body: (
			probe: typeof Probe.Type,
			endings: {
				readonly Decide: ReadonlyArray<Ending<typeof Question.Type, typeof Decision.Type>>
			}
		) =>
			Effect.succeed({
				output: {},
				writes: {
					params: {},
					facts: {
						insert: {
							Concluded: Arr.flatMap(endings.Decide, (ending) =>
								ending._tag === "Done"
									? [
											{
												learner: probe.learner,
												served:
													ending.output.stage._tag === "Serve"
														? ending.output.stage.passage
														: "rest",
												weighed: BigInt(ending.output.weighed.length)
											}
										]
									: []
							)
						}
					}
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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(question) =>
		Effect.succeed({
			output: { score: question.question * question.question }
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
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: (_group, endings) =>
			Effect.succeed({
				output: {
					count: BigInt(endings.Analyze.length),
					total: Arr.reduce(endings.Analyze, 0n, (sum, e) =>
						e._tag === "Done" ? sum + e.output.score : sum
					)
				}
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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(review) =>
		Effect.succeed({
			output: { groups: BigInt(review.sizes.length) }
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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Reviewed, []), {})
	},
	(group) =>
		Effect.succeed({
			output: { total: group.total },
			writes: {
				params: {},
				facts: {
					insert: {
						Reviewed: [
							{ review: group.review, group: group.group, count: group.count, total: group.total }
						]
					}
				}
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
	from: given,
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
		retry: untilSettled,
		waits: none,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Summary, []), {}),
		body: (review, endings) =>
			Effect.succeed({
				output: {},
				writes: {
					params: {},
					facts: {
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
						}
					}
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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Delivered, []), {})
	},
	(graded) =>
		Effect.succeed({
			output: graded,
			writes: { params: {}, facts: { insert: { Delivered: [{ attempt: graded.attempt }] } } }
		})
)

/** An attempt's writeback, AlphaTest's at grading: its one step delivers the result to the gradebook. */
const Writeback = root("Writeback", {
	trigger: operator,
	from: given,
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
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {} })
	}
})

export const writeback = flow("Writeback", {
	writes: loader,
	kinds: [Deliver, Writeback],
	edges: []
})

/** An hour of the clock, the instant its schedule named, and the bell that chimes it, a member of its roster. */
const Hour = Schema.Struct({ hour: Schema.BigInt, bell: Schema.String })

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
		retry: untilSettled,
		waits: none,
		due: atSpawn,
		writes: through((role: typeof Loader) => g.ChangeSet.empty(role).insert(Chimed, []), {})
	},
	(hour) =>
		Effect.succeed({
			output: hour,
			writes: { params: {}, facts: { insert: { Chimed: [{ hour: hour.hour, bell: hour.bell }] } } }
		})
)

/**
 * A root per bell its schedule starts at the top of every hour, each keyed by the instant its cron named and its bell,
 * which every census tick requests until the next hour's, its hour derived from that key (reads.ts HourlyOf): its one
 * step chimes that bell.
 */
const Hourly = root("Hourly", {
	trigger: schedule(Cron.parseUnsafe("0 * * * *"), ["east", "west"]),
	from: derived(scheduleKey, SliceBase, HourlyOf),
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
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {} })
	}
})

/** A timed sitting: its key, and the instant it closes at, which the write that started it computed on the database's clock. */
const Timed = Schema.Struct({ sitting: Schema.String, deadline: instant })

/** Closes a timed sitting at its own deadline, the instant its input holds: never before it, and at it. */
const Close = step(
	"Close",
	{
		input: Timed,
		output: Timed,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: untilSettled,
		waits: none,
		due: dueAt("deadline"),
		writes: writesNothing
	},
	(timed) => Effect.succeed({ output: timed })
)

/** A timed sitting, its one step its close at its deadline. */
const Sitting = root("Sitting", {
	trigger: operator,
	from: given,
	input: Timed,
	children: [Close],
	start: (timed) => [Close.of(timed)],
	exclusive: shared,
	window: always,
	precondition: unconditional,
	finish: {
		reads: [],
		output: Finished,
		error: Schema.Never,
		uses: [],
		retry: untilSettled,
		waits: none,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {} })
	}
})

export const clock = flow("Clock", {
	writes: loader,
	kinds: [Chime, Hourly, Close, Sitting],
	edges: []
})
