import { type Again, none as noRetry } from "@bjornpagen/den/algebra/kinds"
import { inputDigest, inputFingerprint } from "@bjornpagen/den/runtime/identity"
import { refusedOnKey } from "@bjornpagen/den/runtime/ledger"
import { type Settled, settled } from "@bjornpagen/den/runtime/settled"
import { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { aimed, array, element, type Gen, int, oneOf } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import type { Datum } from "@den/model/datum"
import type { Fact } from "@den/model/facts"
import { rootText } from "@den/model/identity"
import { type Answered, emptyState, endingOf, ledger, type State } from "@den/model/ledger"
import {
	type Admission,
	admissionOf,
	derivedAdmissionOf,
	type Ladder,
	ordinals,
	type Resource,
	type RootKind,
	type Runs,
	type ScopeKind,
	scopeOf,
	spawn,
	type StepKind,
	stepOf,
	type Write
} from "@den/model/program"
import {
	Array as Arr,
	Effect,
	HashMap,
	Number as Num,
	Option,
	Order,
	Result,
	String as Str
} from "effect"
import { chain, poolSeats } from "#integration/slice/flows.ts"
import { chainAppRequests } from "#integration/slice/generated/chain.binding.ts"
import { fanAppRequests } from "#integration/slice/generated/fan.binding.ts"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { agreed, factsOf, type Graph } from "#integration/support/trace.ts"
import { backoffFirstMillis, backoffLastMillis, longestLeaseMillis } from "#runtime/turn.ts"

/**
 * The differential harness: the engine's committed facts against the reference model's (`@den/model`) on generated
 * programs. A program is a root of the slice's chain flow (a feed of n pages, each reading the feed's stored weight),
 * requested by the operator or by the app's write of an order beside it, or of its fan-out flow (a batch of n squares
 * on the two-seat Pool), with its input drawn, and then perhaps requested again: of the same input, of another under
 * its kind's input heading, or, for the app's, of another after a deploy that changed the heading. Or it is the fan's
 * run whose input derives from its key (Wanted), the app's write requesting it by its batch alone, its size the largest
 * the app wanted before the request and beside it, and perhaps requested again beside more it wants then. The engine
 * runs it end to end on PostgreSQL 19; the model, given the same program as data (its kinds, edges, starts and bodies
 * written apart from the engine's, the same pure functions of their inputs), runs it in memory, every step claimed and
 * committed until none is pending. Each side's trace is reduced to the facts both agree on (`support/trace.ts`), and
 * each side's request again to whether it was refused and the orders the app committed. The harness rings each root's
 * admission itself, the app's as the operator's, and not the census an app's write rings beside it (`afterCommit`,
 * request.test's), whose retirement would clear the finished graph before it is read.
 *
 * Oracle (second implementation): the model's ledger, which shares no code with the engine.
 */

type Feature =
	| "a chain"
	| "a long chain"
	| "a weighted feed"
	| "a chain the app's write requests"
	| "a fan-out"
	| "an empty batch"
	| "a contended pool"
	| "a request again of its input"
	| "a request again of another input"
	| "a request again across a deploy"
	| "the app's write of another input"
	| "a run its key derives"
	| "a key that derives no run"
	| "a key requested again after the app wanted more"

/**
 * What follows a program's run: nothing, or its request again of the same input, or of another under its kind's input
 * heading.
 */
type Asked = "none" | "same" | "other"

/**
 * What follows an app's request: an operator's repeats, or one of another input after a deploy that changed its kind's
 * input heading, which only the app's request, whose parameters its binding hands out, can name.
 */
type Repeat = Asked | "redeployed"

type Program =
	| {
			readonly kind: "chain"
			readonly via: "operator"
			readonly feed: "news" | "sport"
			readonly pages: number
			readonly factor: number
			readonly repeat: Asked
	  }
	| {
			readonly kind: "chain"
			readonly via: "app"
			readonly feed: "news" | "sport"
			readonly pages: number
			readonly factor: number
			readonly repeat: Repeat
	  }
	| { readonly kind: "fan"; readonly size: number; readonly repeat: Asked }
	| {
			readonly kind: "wanted"
			readonly before: ReadonlyArray<number>
			readonly beside: ReadonlyArray<number>
			readonly again: Option.Option<ReadonlyArray<number>>
	  }

const askedAgain: Gen<Asked> = element(["none", "same", "other"] as const)

/** The app's chain, requested again as `repeat` says. */
const appChain =
	(repeat: Repeat): Gen<Program> =>
	(source) => ({
		kind: "chain",
		via: "app",
		feed: source.draw(element(["news", "sport"])),
		pages: source.draw(int(1, 4)),
		factor: source.draw(int(0, 2)),
		repeat
	})

/**
 * A chain: requested by the operator, or by the app's write, then again of the same input, of another, or of another
 * after a deploy, each of the app's own arm.
 */
const chains: Gen<Program> = oneOf<Program>([
	(source) => ({
		kind: "chain",
		via: "operator",
		feed: source.draw(element(["news", "sport"])),
		pages: source.draw(int(1, 4)),
		factor: source.draw(int(0, 2)),
		repeat: source.draw(askedAgain)
	}),
	(source) => source.draw(appChain(source.draw(element(["none", "same"] as const)))),
	appChain("other"),
	appChain("redeployed")
])

/** A fan-out's batch: empty, within the Pool's seats, or past them, each as often as the others. */
const sizes: Gen<number> = oneOf<number>([
	() => 0,
	int(1, poolSeats),
	int(poolSeats + 1, poolSeats + 2)
])

/** A fan-out of a batch `sizes` draws. */
const fanOf =
	(batch: Gen<number>): Gen<Program> =>
	(source) => ({ kind: "fan", size: source.draw(batch), repeat: source.draw(askedAgain) })

/** Up to `most` sizes the app wants a batch at, each empty to past the Pool's seats. */
const wantedSizes = (most: number): Gen<ReadonlyArray<number>> =>
	array(int(0, poolSeats + 1), { min: 0, max: most })

/**
 * A run of a batch the app's write requests by the batch alone, its size derived from the sizes the app wanted before
 * it and beside it, then perhaps requested again, beside sizes it wants then.
 */
const wantedRuns: Gen<Program> = (source) => ({
	kind: "wanted",
	before: source.draw(wantedSizes(2)),
	beside: source.draw(wantedSizes(1)),
	again: source.draw(
		oneOf([() => Option.none(), (again) => Option.some(again.draw(wantedSizes(1)))])
	)
})

/**
 * A program: a chain, a fan-out or a derived run, each as often as the others; while a situation only one arm reaches
 * is pending, that arm.
 */
const programs = aimed(
	oneOf<Program>([(source) => source.draw(chains), fanOf(sizes), wantedRuns]),
	[
		["the app's write of another input", appChain("other")],
		["a request again across a deploy", appChain("redeployed")],
		["an empty batch", fanOf(() => 0)],
		["a contended pool", fanOf(int(poolSeats + 1, poolSeats + 2))],
		[
			"a key requested again after the app wanted more",
			(): Program => ({
				kind: "wanted",
				before: [1],
				beside: [],
				again: Option.some([poolSeats + 1])
			})
		]
	]
)

/** The model's ladder of a den step's retry: no end until it settles, or its first attempt alone; den's rungs. */
const ladderOf = (retry: Again): Ladder => {
	switch (retry.kind) {
		case "untilSettled":
			return { _tag: "Never", first: backoffFirstMillis, last: backoffLastMillis }
		case "none":
			return { _tag: "Attempts", attempts: 1, first: backoffFirstMillis, last: backoffLastMillis }
	}
}

/** How the model runs a kind: den's longest lease, its resources, and its ladder. */
const runsOf = (holds: ReadonlyArray<Resource>, ladder: Ladder): Runs => ({
	lease: longestLeaseMillis,
	holds,
	ladder
})

const pageLadder = Option.match(
	Arr.findFirst(chain.kinds, (k) => k._tag === "Step"),
	{
		onNone: () => ladderOf(noRetry),
		onSome: (s) => ladderOf(s.retry)
	}
)

interface PageIn {
	readonly feed: string
	readonly seq: number
	readonly pages: number
	readonly after: ReadonlyArray<string>
}

interface PageOut {
	readonly seq: number
	readonly items: number
	readonly next: ReadonlyArray<string>
}

/** The chain's page, written apart from the slice's: (s + 1) × max(1, the feed's weight) items, naming the next. */
const Page: StepKind<PageIn, PageOut, never> = {
	name: "Page",
	runs: runsOf([], pageLadder),
	input: (page) => ({ feed: page.feed, seq: page.seq, pages: page.pages, after: page.after }),
	output: (read) => ({ seq: read.seq, items: read.items, next: read.next }),
	error: () => ({}),
	reads: (page) => [
		{ name: "weight", query: { _tag: "Rows", relation: "Weight", key: Option.some(page.feed) } }
	],
	body: (page, claimed) => {
		const factor = Arr.reduce(claimed.read("weight"), 0, (sum, row) =>
			typeof row.value === "number" ? sum + row.value : sum
		)
		return {
			_tag: "Output",
			output: {
				seq: page.seq,
				items: (page.seq + 1) * (factor > 0 ? factor : 1),
				next: page.seq + 1 < page.pages ? [`after-${page.seq}`] : []
			},
			writes: []
		}
	},
	edges: () => [
		spawn("Next", Page, (page: PageIn, read: PageOut) =>
			Arr.map(read.next, (after) => ({
				feed: page.feed,
				seq: page.seq + 1,
				pages: page.pages,
				after: [after]
			}))
		)
	]
}

interface ChainIn {
	readonly feed: string
	readonly pages: number
}

const noOutput: Datum = {}

/** A finish that reads its children's endings and outputs nothing the comparison reads. */
const finishing = (ladder: Ladder) => ({
	runs: runsOf([], ladder),
	output: () => noOutput,
	error: () => noOutput,
	body: () => ({ _tag: "Output", output: {}, writes: [] }) as const
})

const ChainRun: RootKind<ChainIn, Datum, never> = {
	name: "ChainRun",
	trigger: { _tag: "Operator" },
	from: { _tag: "Given", heading: "ChainRunInput" },
	precondition: Option.none(),
	exclusive: Option.none(),
	window: Option.none(),
	scope: {
		name: "ChainRun",
		input: (run) => ({ feed: run.feed, pages: run.pages }),
		start: (run) => [stepOf(Page, { feed: run.feed, seq: 0, pages: run.pages, after: [] })],
		finish: finishing(pageLadder)
	}
}

const pool: Resource = { name: "Pool", seats: poolSeats }

interface SquareIn {
	readonly batch: string
	readonly n: number
}

const Square: StepKind<SquareIn, { readonly square: number }, never> = {
	name: "Square",
	runs: runsOf([pool], pageLadder),
	input: (task) => ({ batch: task.batch, n: task.n }),
	output: (out) => ({ square: out.square }),
	error: () => ({}),
	reads: () => [],
	body: (task) => ({ _tag: "Output", output: { square: task.n * task.n }, writes: [] }),
	edges: () => []
}

interface BatchIn {
	readonly batch: string
	readonly size: number
}

const Batch: ScopeKind<BatchIn, Datum, never> = {
	name: "Batch",
	input: (b) => ({ batch: b.batch, size: b.size }),
	start: (b) => Arr.map(ordinals(b.size), (n) => stepOf(Square, { batch: b.batch, n: n + 1 })),
	finish: finishing(pageLadder)
}

const FanRun: RootKind<BatchIn, Datum, never> = {
	name: "FanRun",
	trigger: { _tag: "Operator" },
	from: { _tag: "Given", heading: "FanRunInput" },
	precondition: Option.none(),
	exclusive: Option.none(),
	window: Option.none(),
	scope: {
		name: "FanRun",
		input: (run) => ({ batch: run.batch, size: run.size }),
		start: (run) => [scopeOf(Batch, run, () => [])],
		finish: finishing(pageLadder)
	}
}

/** The same chain, requested by the app's own write beside the order it records. */
const Ordered: RootKind<ChainIn, Datum, never> = {
	...ChainRun,
	name: "Ordered",
	trigger: { _tag: "App" },
	from: { _tag: "Given", heading: "OrderedInput" },
	scope: { ...ChainRun.scope, name: "Ordered" }
}

/** Ordered as a deploy that changed its input's heading declares it. */
const OrderedRedeployed: RootKind<ChainIn, Datum, never> = {
	...Ordered,
	from: { _tag: "Given", heading: "OrderedInput, deployed again" }
}

/**
 * The same run, requested by the app's write by its batch alone, its size derived from what the app wants: the largest
 * size it wants the batch at, read when the request commits, kept since; one live run per batch, seated by its key.
 */
const Wanted: RootKind<BatchIn, Datum, never, { readonly batch: string }> = {
	...FanRun,
	name: "Wanted",
	trigger: { _tag: "App" },
	from: { _tag: "Derived" },
	exclusive: Option.some((key) => key.batch),
	scope: { ...FanRun.scope, name: "Wanted" }
}

/** The app's want of `batch` at `size`, as the model's app relation holds it, one row per size. */
const wantOf = (batch: string, size: number): Write => ({
	relation: "Want",
	key: `${batch}/${String(size)}`,
	value: size
})

/**
 * Wanted's admission under `key`: its batch's run, at the largest size the app wants it at, none where it wants none.
 */
const wantedAdmissionOf = (key: string, batch: string): Admission =>
	derivedAdmissionOf(
		Wanted,
		key,
		{ batch },
		{ _tag: "Rows", relation: "Want", key: Option.none() },
		(found) => {
			const wanted = Arr.filterMap(found, (row) =>
				Str.startsWith(`${batch}/`)(row.key) && typeof row.value === "number"
					? Result.succeed(row.value)
					: Result.failVoid
			)
			return Arr.isReadonlyArrayNonEmpty(wanted)
				? Option.some({ batch, size: Arr.max(wanted, Num.Order) })
				: Option.none()
		}
	)

/** A request as the model makes it: the operator's admission, or the app's write of its own facts that admits it. */
type Asking = Readonly<{
	admission: Admission
	by: Readonly<{ _tag: "Operator" }> | Readonly<{ _tag: "App"; writes: ReadonlyArray<Write> }>
}>

const askedOf = (state: State, asking: Asking): Answered =>
	asking.by._tag === "Operator"
		? ledger.admit(state, asking.admission, "operator", 0)
		: ledger.write(state, asking.by.writes, [asking.admission], 0)

/** An operator's request. */
const byOperator: Asking["by"] = { _tag: "Operator" }

/** The app's write of `writes` beside its request. */
const byApp = (writes: ReadonlyArray<Write>): Asking["by"] => ({ _tag: "App", writes })

/** The app's write of an order beside its request. */
const ordering = (order: string, feed: string): Asking["by"] =>
	byApp([{ relation: "Order", key: order, value: feed }])

/** What the model's run committed: its facts, whether its request again was refused, and the app's orders. */
type ModelRun = Readonly<{
	facts: ReadonlyArray<Fact>
	refused: Option.Option<boolean>
	orders: ReadonlyArray<string>
}>

/**
 * The model's run of a request: the app's facts before it written first (a feed's weight, a batch's wants), then the
 * root requested, then, pass after pass, every pending step claimed and its report committed, until a pass changes
 * nothing; then its request again, if any, and its passes. Every instant is zero: the programs wait on nothing but
 * their parents and the Pool's seats.
 */
const modelRun = (
	first: Asking,
	again: Option.Option<Asking>,
	before: ReadonlyArray<Write>
): ModelRun => {
	const log: Array<ReadonlyArray<Fact>> = []
	const record = (entered: Answered): State => {
		log.push(entered.entry.facts)
		return entered.state
	}
	const written = record(ledger.write(emptyState, before, [], 0))
	const pass = (state: State, phase: string, turn: number): State => {
		const pending = Arr.filter(HashMap.toValues(state.steps), (row) => Option.isNone(endingOf(row)))
		const after = Arr.reduce(pending, state, (current, row) => {
			const claimed = ledger.claim(
				current,
				row.id,
				`turn-${phase}-${turn}-${row.text}`,
				current.deployment,
				0
			)
			const held = record(claimed)
			return Option.match(claimed.lease, {
				onNone: () => held,
				onSome: (lease) =>
					record(
						ledger.commit(
							held,
							{
								step: lease.step,
								attempt: lease.attempt,
								turn: lease.turn,
								settled: lease.run(lease.claimed),
								reads: lease.taken,
								deployment: held.deployment
							},
							0
						)
					)
			})
		})
		return after === state ? state : pass(after, phase, turn + 1)
	}
	const ran = pass(record(askedOf(written, first)), "first", 0)
	const repeated = Option.map(again, (asking) => askedOf(ran, asking))
	const after = Option.match(repeated, {
		onNone: () => ran,
		onSome: (answered) => pass(record(answered), "again", 0)
	})
	return {
		facts: Arr.flatten(log),
		refused: Option.map(repeated, (answered) => answered.answer === "differs"),
		orders: Option.match(HashMap.get(after.app, "Order"), {
			onNone: () => [],
			onSome: (orders) => Arr.sort(HashMap.keys(orders), Order.String)
		})
	}
}

/** A request again: the input it names, and whether a deploy that changed its kind's heading came before it. */
type AskedAgain<I> = Readonly<{ input: I; deployed: boolean }>

const againOf = <I>(repeat: Repeat, input: I, other: I): Option.Option<AskedAgain<I>> => {
	switch (repeat) {
		case "none":
			return Option.none()
		case "same":
			return Option.some({ input, deployed: false })
		case "other":
			return Option.some({ input: other, deployed: false })
		case "redeployed":
			return Option.some({ input: other, deployed: true })
	}
}

const repeatFeatures = {
	same: "a request again of its input",
	other: "a request again of another input",
	redeployed: "a request again across a deploy"
} as const satisfies Record<Exclude<Repeat, "none">, Feature>

/**
 * Whether the engine refused a request again on its root's record of what it was requested with (`<P>RequestedWith`'s
 * key); any other failure is the harness's defect.
 */
const refusedOf = <A, E extends Settled, R>(request: Effect.Effect<A, E, R>, recorded: string) =>
	request.pipe(
		Effect.as(false),
		Effect.catch((error) =>
			refusedOnKey(error, [recorded]) ? Effect.succeed(true) : Effect.die(error)
		)
	)

/**
 * Commits the facts the reference model commits, on generated programs, and refuses a request again exactly where the
 * model does: a key names one input under its kind's input heading, so a request again of another input is refused,
 * the app's write beside it committing nothing, while one of the same input, or of another after a deploy that changed
 * the heading, is the same keyed act, the app's write committing its own order and the root starting nothing. A
 * derived run starts where both sides' reads derive its size at its request's commit, at the size they derive, and a
 * request again of its key starts nothing, whatever the app wanted since.
 *
 * Budget: its suite's count before the conversion (differential: 12 independent cases and 12 steered, Vitest at den
 * dc5bd11), and 12 steered more for its requests again, each by the operator's, the app's and a fan-out's arm.
 */
export const theDifferentialHarnessCommitsTheFactsTheReferenceModelCommits = property.explore(
	programs,
	{
		needs: { slice: sliceCase },
		situations: [
			"a chain",
			"a long chain",
			"a weighted feed",
			"a chain the app's write requests",
			"a fan-out",
			"an empty batch",
			"a contended pool",
			"a request again of its input",
			"a request again of another input",
			"a request again across a deploy",
			"the app's write of another input",
			"a run its key derives",
			"a key that derives no run",
			"a key requested again after the app wanted more"
		] satisfies ReadonlyArray<Reached<Feature>>,
		check:
			({ slice }, c: Case<Feature>) =>
			(program) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							const { chain: chainLedger, fan: fanLedger, ledgers, loader } = yield* openLedgers
							const app = yield* openAuditor
							const key = "diff"
							const begin = (chosen: Program) =>
								Effect.gen(function* () {
									if (chosen.kind !== "wanted" && chosen.repeat !== "none") {
										c.note(repeatFeatures[chosen.repeat])
									}
									switch (chosen.kind) {
										case "chain": {
											c.note(chosen.pages > 2 ? "a long chain" : "a chain")
											if (chosen.factor > 0) {
												c.note("a weighted feed")
												yield* loader.workload.weigh.once({
													params: {},
													facts: {
														insert: {
															Weight: [{ feed: chosen.feed, factor: BigInt(chosen.factor) }]
														}
													}
												})
											}
											const stored = yield* rows(
												app.workload.weights.once({ params: {}, facts: {} })
											)
											const factor = Arr.reduce(
												Arr.filter(stored, (w) => w.feed === chosen.feed),
												0,
												(sum, w) => sum + Number(w.factor)
											)
											const weight: ReadonlyArray<Write> =
												factor > 0 ? [{ relation: "Weight", key: chosen.feed, value: factor }] : []
											const input: ChainIn = { feed: chosen.feed, pages: chosen.pages }
											const other: ChainIn = { feed: chosen.feed, pages: chosen.pages + 1 }
											/** A chain's input as the engine's request takes it: the drawn feed, which another input keeps. */
											const named = (run: ChainIn) => ({
												feed: chosen.feed,
												pages: BigInt(run.pages)
											})
											if (chosen.via === "operator") {
												const requested = yield* chainLedger.request.ChainRun(key, named(input))
												const again = againOf(chosen.repeat, input, other)
												return {
													scope: requested.scope,
													flow: requested.flow,
													key,
													admits: true,
													model: modelRun(
														{ admission: admissionOf(ChainRun, key, input), by: byOperator },
														Option.map(again, (run) => ({
															admission: admissionOf(ChainRun, key, run.input),
															by: byOperator
														})),
														weight
													),
													root: "ChainRun",
													again: Option.map(again, (run) =>
														refusedOf(
															chainLedger.request.ChainRun(key, named(run.input)),
															"ChainRequestedWith"
														)
													)
												}
											}
											c.note("a chain the app's write requests")
											if (chosen.repeat === "other") {
												c.note("the app's write of another input")
											}
											const orderedOf = (order: string, run: AskedAgain<ChainIn>) => {
												const asked = chainAppRequests.Ordered(key, named(run.input))
												const params = run.deployed
													? {
															...asked.params,
															chainOrderedChainRequestedWith: [
																{
																	root: asked.scope,
																	fingerprint: inputFingerprint("Ordered's input, deployed again"),
																	input: inputDigest("Chain", "Ordered", [String(run.input.pages)])
																}
															]
														}
													: asked.params
												return {
													asked,
													write: settled(
														loader.workload.order.once({
															params,
															facts: { insert: { Order: [{ order, feed: chosen.feed }] } }
														})
													)
												}
											}
											const first = orderedOf("first", { input, deployed: false })
											yield* first.write
											const again = againOf(chosen.repeat, input, other)
											return {
												scope: first.asked.scope,
												flow: first.asked.flow,
												key,
												admits: true,
												model: modelRun(
													{
														admission: admissionOf(Ordered, key, input),
														by: ordering("first", chosen.feed)
													},
													Option.map(again, (run) => ({
														admission: admissionOf(
															run.deployed ? OrderedRedeployed : Ordered,
															key,
															run.input
														),
														by: ordering("again", chosen.feed)
													})),
													weight
												),
												root: "Ordered",
												again: Option.map(again, (run) =>
													refusedOf(orderedOf("again", run).write, "ChainRequestedWith")
												)
											}
										}
										case "fan": {
											c.note(chosen.size === 0 ? "an empty batch" : "a fan-out")
											if (chosen.size > poolSeats) {
												c.note("a contended pool")
											}
											const input: BatchIn = { batch: key, size: chosen.size }
											const other: BatchIn = { batch: key, size: chosen.size + 1 }
											const named = (run: BatchIn) => ({ batch: run.batch, size: BigInt(run.size) })
											const requested = yield* fanLedger.request.FanRun(key, named(input))
											const again = againOf(chosen.repeat, input, other)
											return {
												scope: requested.scope,
												flow: requested.flow,
												key,
												admits: true,
												model: modelRun(
													{ admission: admissionOf(FanRun, key, input), by: byOperator },
													Option.map(again, (run) => ({
														admission: admissionOf(FanRun, key, run.input),
														by: byOperator
													})),
													[]
												),
												root: "FanRun",
												again: Option.map(again, (run) =>
													refusedOf(
														fanLedger.request.FanRun(key, named(run.input)),
														"FanRequestedWith"
													)
												)
											}
										}
										case "wanted": {
											const asked = fanAppRequests.Wanted({ batch: key })
											const derived = asked.params.fanWantedKey
											const wants = (wanted: ReadonlyArray<number>) =>
												Arr.map(wanted, (size) => ({ batch: key, size: BigInt(size) }))
											const writes = (wanted: ReadonlyArray<number>) =>
												Arr.map(wanted, (size) => wantOf(key, size))
											/** The app's write of the sizes `wanted` beside its request of the run. */
											const wantedBeside = (wanted: ReadonlyArray<number>) =>
												settled(
													loader.workload.wantRun.once({
														params: asked.params,
														facts: { insert: { Want: wants(wanted) } }
													})
												)
											const first = [...chosen.before, ...chosen.beside]
											const largestOf = (wanted: ReadonlyArray<number>) =>
												Arr.isReadonlyArrayNonEmpty(wanted)
													? Option.some(Arr.max(wanted, Num.Order))
													: Option.none()
											const derivedFirst = largestOf(first)
											const derivedAgain = largestOf([
												...first,
												...Option.getOrElse(chosen.again, () => [])
											])
											c.note(
												Option.isSome(derivedFirst)
													? "a run its key derives"
													: "a key that derives no run"
											)
											if (
												Option.isSome(chosen.again) &&
												Option.isSome(derivedFirst) &&
												Option.exists(derivedAgain, (size) => size > derivedFirst.value)
											) {
												c.note("a key requested again after the app wanted more")
											}
											yield* settled(
												loader.workload.want.once({
													params: {},
													facts: { insert: { Want: wants(chosen.before) } }
												})
											)
											yield* wantedBeside(chosen.beside)
											const again = chosen.again
											return {
												scope: asked.scope,
												flow: asked.flow,
												key: derived,
												admits:
													Option.isSome(derivedFirst) ||
													(Option.isSome(again) && Option.isSome(derivedAgain)),
												model: modelRun(
													{
														admission: wantedAdmissionOf(derived, key),
														by: byApp(writes(chosen.beside))
													},
													Option.map(again, (wanted) => ({
														admission: wantedAdmissionOf(derived, key),
														by: byApp(writes(wanted))
													})),
													writes(chosen.before)
												),
												root: "Wanted",
												again: Option.map(again, (wanted) => Effect.as(wantedBeside(wanted), false))
											}
										}
									}
								})
							const started = yield* begin(program)
							yield* ringAndDrain(ledgers, [started])
							const refused = yield* Option.match(started.again, {
								onNone: () => Effect.succeed(Option.none<boolean>()),
								onSome: Effect.asSome
							})
							yield* ringAndDrain(ledgers, [started])
							assert.deepEqual(
								refused,
								started.model.refused,
								"a request again is refused exactly where the model refuses it"
							)
							const orders = yield* rows(app.workload.orders.once({ params: {}, facts: {} }))
							assert.deepEqual<ReadonlyArray<string>>(
								Arr.sort(
									Arr.map(orders, (row) => row.order),
									Order.String
								),
								started.model.orders,
								"the app commits the orders the model commits"
							)
							const w = app.workload
							const none = { params: {}, facts: {} } as const
							const roots = [
								...(yield* rows(w.chainRoots.once(none))),
								...(yield* rows(w.fanRoots.once(none)))
							]
							const admitted = [
								...(yield* rows(w.chainAdmittedAll.once(none))),
								...(yield* rows(w.fanAdmittedAll.once(none)))
							]
							const withins = yield* rows(w.fanWithins.once(none))
							const pageAfters = yield* rows(w.chainPageAfters.once(none))
							const pageNexts = yield* rows(w.chainPageNexts.once(none))
							const optional = (
								sidecar: ReadonlyArray<{ readonly step: Sha256; readonly value: string }>,
								step: Sha256
							) =>
								Arr.map(
									Arr.filter(sidecar, (o) => Sha256.equals(o.step, step)),
									(o) => o.value
								)
							const nexts = yield* rows(w.chainNexts.once(none))
							const pageInputs = yield* rows(w.chainPageInputs.once(none))
							const squareInputs = yield* rows(w.fanSquareInputs.once(none))
							const pageOutputs = yield* rows(w.chainPageOutputs.once(none))
							const squareOutputs = yield* rows(w.fanSquareOutputs.once(none))
							const startSteps = [
								...(yield* rows(w.chainStartSteps.once(none))),
								...(yield* rows(w.fanStartSteps.once(none)))
							]
							const startScopes = yield* rows(w.fanStartScopes.once(none))
							const finishSteps = [
								...(yield* rows(w.chainFinishSteps.once(none))),
								...(yield* rows(w.fanFinishSteps.once(none)))
							]
							const steps = [
								...(yield* rows(w.chainSteps.once(none))),
								...(yield* rows(w.fanSteps.once(none)))
							]
							const results = [
								...(yield* rows(w.chainResults.once(none))),
								...(yield* rows(w.fanResults.once(none)))
							]
							/** A key as the graph holds it: its digest's hex (Sha256.toHex). */
							const hex = Sha256.toHex
							const graph: Graph = {
								roots: Arr.map(roots, (r) => ({ ...r, scope: hex(r.scope) })),
								admitted: Arr.map(admitted, (a): string => hex(a.scope)),
								withins: Arr.map(withins, (s) => ({
									...s,
									scope: hex(s.scope),
									parent: hex(s.parent)
								})),
								startSteps: Arr.map(startSteps, (s) => ({
									...s,
									scope: hex(s.scope),
									step: hex(s.step)
								})),
								startScopes: Arr.map(startScopes, (s) => ({
									...s,
									scope: hex(s.scope),
									child: hex(s.child)
								})),
								edges: Arr.map(nexts, (e) => ({
									edge: "Next",
									...e,
									from: hex(e.from),
									to: hex(e.to),
									scope: false
								})),
								finishes: Arr.map(finishSteps, (f) => ({
									...f,
									scope: hex(f.scope),
									step: hex(f.step)
								})),
								steps: Arr.map(steps, (s) => ({ ...s, step: hex(s.step), scope: hex(s.scope) })),
								inputs: new Map<string, Datum>([
									...Arr.map(
										pageInputs,
										(i) =>
											[
												hex(i.step),
												{
													feed: i.feed,
													seq: Number(i.seq),
													pages: Number(i.pages),
													after: optional(pageAfters, i.step)
												}
											] as const
									),
									...Arr.map(
										squareInputs,
										(i) => [hex(i.step), { batch: i.batch, n: Number(i.n) }] as const
									)
								]),
								results: Arr.map(results, (r) => ({ ...r, step: hex(r.step) })),
								outputs: new Map<string, Datum>([
									...Arr.map(
										pageOutputs,
										(o) =>
											[
												hex(o.step),
												{
													seq: Number(o.seq),
													items: Number(o.items),
													next: optional(pageNexts, o.step)
												}
											] as const
									),
									...Arr.map(
										squareOutputs,
										(o) => [hex(o.step), { square: Number(o.square) }] as const
									)
								])
							}
							const rooted = rootText({ kind: started.root, key: started.key })
							const mine = (texts: ReadonlyArray<string>) => Arr.filter(texts, Str.includes(rooted))
							const engine = mine(agreed(factsOf(graph)))
							assert.deepEqual(engine, mine(agreed(started.model.facts)))
							if (started.admits) {
								assert.ok(Arr.contains(engine, `admitted ${rooted}`))
								assert.ok(Arr.some(engine, Str.startsWith("finished ")))
							} else {
								assert.deepEqual(engine, [], "a key whose read derives nothing starts no root")
							}
						}),
						services
					)
				),
		oracle: {
			kind: "second-implementation",
			name: "the reference model's ledger, sharing no code with den"
		},
		budget: { runs: 12, steered: 24 },
		kept: [],
		kills: [
			{
				file: "packages/den/src/runtime/turn.ts",
				original:
					"\t\t\t\tArr.isReadonlyArrayEmpty(spawned.steps) && Arr.isReadonlyArrayEmpty(spawned.finishes)\n",
				replacement: "\t\t\t\tfalse\n",
				why: "A step's end never rings its scope's finish, though it was the scope's last open child: a batch's and a feed's finish never run, where the model's do."
			},
			{
				file: "packages/den/integration/slice/generated/chain.programs.ts",
				original:
					'r.relation("chainOrderedChainRequestedWith", {\n\t\t\t\t\t\troot: ChainRequestedWith.fields.root,\n\t\t\t\t\t\tfingerprint: ChainRequestedWith.fields.fingerprint,\n\t\t\t\t\t\tinput: ChainRequestedWith.fields.input\n\t\t\t\t\t})\n\t\t\t\t\tconst { root, fingerprint, input } = v(requested, "requested")\n\t\t\t\t\tconst { input: held } = v(ChainRequestedWith, "held")\n\t\t\t\t\treturn r\n\t\t\t\t\t\t.match(requested, { root, fingerprint, input })\n\t\t\t\t\t\t.match(ChainRequestedWith, { root, fingerprint, input: held })\n',
				replacement:
					'r.relation("chainOrderedChainRequestedWith", {\n\t\t\t\t\t\troot: ChainRequestedWith.fields.root,\n\t\t\t\t\t\tfingerprint: ChainRequestedWith.fields.fingerprint,\n\t\t\t\t\t\tinput: ChainRequestedWith.fields.input\n\t\t\t\t\t})\n\t\t\t\t\tconst { root, fingerprint, input } = v(requested, "requested")\n\t\t\t\t\tconst { input: held } = v(ChainRequestedWith, "held")\n\t\t\t\t\treturn r\n\t\t\t\t\t\t.match(requested, { root, fingerprint, input })\n\t\t\t\t\t\t.match(ChainRequestedWith, { root, input: held })\n',
				why: "den compares a request again across a deploy that changed its kind's heading with the first's digest, and refuses the app's redelivery the model commits."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original:
					"\t\t\t(held) => held.heading === source.heading && held.input !== textOf(source.admits.input)\n",
				replacement: "\t\t\t(held) => held.input !== textOf(source.admits.input)\n",
				why: "The model compares a request again across a deploy that changed its kind's heading with the first's input, and refuses the app's redelivery the engine commits."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: '\t\treturn Arr.contains(answers, "differs")\n',
				replacement: '\t\treturn Arr.contains(answers, "blocked")\n',
				why: "The model's write lands beside an admission of another input, committing the order the engine's refusal of the whole write commits nothing of."
			}
		]
	}
)
