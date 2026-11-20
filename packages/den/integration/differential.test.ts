import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int, oneOf } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import type { Datum } from "@den/model/datum"
import type { Fact } from "@den/model/facts"
import { rootText } from "@den/model/identity"
import { emptyState, endingOf, ledger, type State } from "@den/model/ledger"
import {
	admissionOf,
	type Ladder,
	ordinals,
	type Resource,
	type RootKind,
	type Runs,
	type ScopeKind,
	scopeOf,
	spawn,
	type StepKind,
	stepOf
} from "@den/model/program"
import { Array as Arr, Effect, HashMap, Option, String as Str } from "effect"
import { chain, poolSeats } from "#integration/slice/flows.ts"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { agreed, factsOf, type Graph } from "#integration/support/trace.ts"
import { backoffFirstMillis, backoffLastMillis, longestLeaseMillis } from "#runtime/turn.ts"

/**
 * The differential harness: the engine's committed facts against the reference model's (`@den/model`) on generated
 * programs. A program is a root of the slice's chain flow (a feed of n pages, each reading the feed's stored weight) or
 * of its fan-out flow (a batch of n squares on the two-seat Pool), with its input drawn. The engine runs it end to end
 * on PostgreSQL 19; the model, given the same program as data (its kinds, edges, starts and bodies written apart from
 * the engine's, the same pure functions of their inputs), runs it in memory, every step claimed and committed until
 * none is pending. Each side's trace is reduced to the facts both agree on (`support/trace.ts`).
 *
 * Oracle (second implementation): the model's ledger, which shares no code with the engine.
 */

type Feature =
	| "a chain"
	| "a long chain"
	| "a weighted feed"
	| "a fan-out"
	| "an empty batch"
	| "a contended pool"

type Program =
	| {
			readonly kind: "chain"
			readonly feed: "news" | "sport"
			readonly pages: number
			readonly factor: number
	  }
	| { readonly kind: "fan"; readonly size: number }

const programs: Gen<Program> = oneOf<Program>([
	(source) => ({
		kind: "chain",
		feed: source.draw(element(["news", "sport"])),
		pages: source.draw(int(1, 4)),
		factor: source.draw(int(0, 2))
	}),
	(source) => ({ kind: "fan", size: source.draw(int(0, 4)) })
])

/** The model's ladder of a den ladder of n attempts, its rungs den's own. */
const ladderOf = (attempts: number): Ladder => ({
	_tag: "Attempts",
	attempts,
	first: backoffFirstMillis,
	last: backoffLastMillis
})

/** How the model runs a kind: den's longest lease, its resources, and its ladder. */
const runsOf = (holds: ReadonlyArray<Resource>, ladder: Ladder): Runs => ({
	lease: longestLeaseMillis,
	holds,
	ladder
})

const pageLadder = Option.match(
	Arr.findFirst(chain.kinds, (k) => k._tag === "Step"),
	{
		onNone: () => ladderOf(1),
		onSome: (s) => ladderOf(s.retry.kind === "attempts" ? s.retry.attempts : 1)
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

/**
 * The model's run of an admission: the app's weight written first, then the root admitted, then, pass after pass,
 * every pending step claimed and its report committed, until a pass changes nothing. Every instant is zero: the
 * programs wait on nothing but their parents and the Pool's seats.
 */
const modelRun = (
	admission: Parameters<(typeof ledger)["admit"]>[1],
	weight: Option.Option<{ readonly feed: string; readonly factor: number }>
): ReadonlyArray<Fact> => {
	const log: Array<ReadonlyArray<Fact>> = []
	const record = (state: State, entry: { readonly facts: ReadonlyArray<Fact> }): State => {
		log.push(entry.facts)
		return state
	}
	const written = ledger.write(
		emptyState,
		Option.toArray(
			Option.map(weight, (w) => ({ relation: "Weight", key: w.feed, value: w.factor }))
		),
		[],
		0
	)
	const admitted = ledger.admit(record(written.state, written.entry), admission, "operator", 0)
	const pass = (state: State, turn: number): State => {
		const pending = Arr.filter(HashMap.toValues(state.steps), (row) => Option.isNone(endingOf(row)))
		const after = Arr.reduce(pending, state, (current, row) => {
			const claimed = ledger.claim(
				current,
				row.id,
				`turn-${turn}-${row.text}`,
				current.deployment,
				0
			)
			const held = record(claimed.state, claimed.entry)
			return Option.match(claimed.lease, {
				onNone: () => held,
				onSome: (lease) => {
					const committed = ledger.commit(
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
					return record(committed.state, committed.entry)
				}
			})
		})
		return after === state ? state : pass(after, turn + 1)
	}
	pass(record(admitted.state, admitted.entry), 0)
	return Arr.flatten(log)
}

/**
 * Commits the facts the reference model commits, on generated programs.
 *
 * Budget: its suite's count before the conversion (differential: 12 independent cases and 12 steered, Vitest at den
 * dc5bd11).
 */
export const theDifferentialHarnessCommitsTheFactsTheReferenceModelCommits = property.explore(
	programs,
	{
		needs: { slice: sliceCase },
		situations: [
			"a chain",
			"a long chain",
			"a weighted feed",
			"a fan-out",
			"an empty batch",
			"a contended pool"
		] satisfies ReadonlyArray<Reached<Feature>>,
		check:
			({ slice }, c: Case<Feature>) =>
			(program) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							const { chain: chainLedger, fan: fanLedger, ledgers, loader } = yield* openLedgers
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const key = "diff"
							const at = yield* chainLedger.ledger.now
							const begin = (chosen: Program) =>
								Effect.gen(function* () {
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
											const requested = yield* chainLedger.request.ChainRun(key, at, {
												feed: chosen.feed,
												pages: BigInt(chosen.pages)
											})
											const model = modelRun(
												admissionOf(ChainRun, key, { feed: chosen.feed, pages: chosen.pages }),
												factor > 0 ? Option.some({ feed: chosen.feed, factor }) : Option.none()
											)
											return {
												scope: requested.scope,
												flow: FlowName.make("Chain"),
												model,
												root: "ChainRun"
											}
										}
										case "fan": {
											c.note(chosen.size === 0 ? "an empty batch" : "a fan-out")
											if (chosen.size > poolSeats) {
												c.note("a contended pool")
											}
											const requested = yield* fanLedger.request.FanRun(key, at, {
												batch: key,
												size: BigInt(chosen.size)
											})
											const model = modelRun(
												admissionOf(FanRun, key, { batch: key, size: chosen.size }),
												Option.none()
											)
											return {
												scope: requested.scope,
												flow: FlowName.make("Fan"),
												model,
												root: "FanRun"
											}
										}
									}
								})
							const started = yield* begin(program)
							yield* admitAndDrain(ledgers, started.flow, [started.scope])
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
								sidecar: ReadonlyArray<{ readonly step: string; readonly value: string }>,
								step: string
							) =>
								Arr.map(
									Arr.filter(sidecar, (o) => o.step === step),
									(o) => o.value
								)
							const nexts = yield* rows(w.chainNexts.once(none))
							const pageInputs = yield* rows(w.chainPageInputs.once(none))
							const squareInputs = yield* rows(w.fanSquareInputs.once(none))
							const pageOutputs = yield* rows(w.chainPageOutputs.once(none))
							const squareOutputs = yield* rows(w.fanSquareOutputs.once(none))
							const graph: Graph = {
								roots,
								admitted: Arr.map(admitted, (a): string => a.scope),
								withins,
								startSteps: [
									...(yield* rows(w.chainStartSteps.once(none))),
									...(yield* rows(w.fanStartSteps.once(none)))
								],
								startScopes: yield* rows(w.fanStartScopes.once(none)),
								edges: Arr.map(nexts, (e) => ({ edge: "Next", ...e, scope: false })),
								finishes: [
									...(yield* rows(w.chainFinishSteps.once(none))),
									...(yield* rows(w.fanFinishSteps.once(none)))
								],
								steps: [
									...(yield* rows(w.chainSteps.once(none))),
									...(yield* rows(w.fanSteps.once(none)))
								],
								inputs: new Map<string, Datum>([
									...Arr.map(
										pageInputs,
										(i) =>
											[
												i.step,
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
										(i) => [i.step, { batch: i.batch, n: Number(i.n) }] as const
									)
								]),
								results: [
									...(yield* rows(w.chainResults.once(none))),
									...(yield* rows(w.fanResults.once(none)))
								],
								outputs: new Map<string, Datum>([
									...Arr.map(
										pageOutputs,
										(o) =>
											[
												o.step,
												{
													seq: Number(o.seq),
													items: Number(o.items),
													next: optional(pageNexts, o.step)
												}
											] as const
									),
									...Arr.map(squareOutputs, (o) => [o.step, { square: Number(o.square) }] as const)
								])
							}
							const mine = (texts: ReadonlyArray<string>) =>
								Arr.filter(texts, Str.includes(rootText({ kind: started.root, key })))
							const engine = mine(agreed(factsOf(graph)))
							assert.deepEqual(engine, mine(agreed(started.model)))
							assert.ok(Arr.contains(engine, `admitted ${rootText({ kind: started.root, key })}`))
							assert.ok(Arr.some(engine, Str.startsWith("finished ")))
						}),
						services
					)
				),
		oracle: {
			kind: "second-implementation",
			name: "the reference model's ledger, sharing no code with den"
		},
		budget: { runs: 12, steered: 12 },
		kept: [],
		kills: [
			{
				file: "packages/den/src/transport.ts",
				original:
					"\t\t\t\t\t\tRef.update(held, (list) => [\n\t\t\t\t\t\t\t...list,\n\t\t\t\t\t\t\t...Arr.map(rings, (ring) => ({\n\t\t\t\t\t\t\t\twake: ring.wake,\n\t\t\t\t\t\t\t\tat: millis + Duration.toMillis(ring.delay)\n\t\t\t\t\t\t\t}))\n\t\t\t\t\t\t])",
				replacement:
					"\t\t\t\t\t\tRef.update(held, (list) => [...Arr.map(rings, (ring) => ({\n\t\t\t\t\t\t\t\twake: ring.wake,\n\t\t\t\t\t\t\t\tat: millis + Duration.toMillis(ring.delay)\n\t\t\t\t\t\t\t}))])",
				why: "Operator mutant (element) at packages/den/src/transport.ts:137 in <module>: `[ ...list, ...Arr.map(rings, (ring) => ({ wake: ring.wake, at: millis + Duration` becomes `[...Arr.map(rings, (ring) => ({ wake: ring.wake, at: millis + Duration.toMillis(`; the property fails (lane CATCH, den 9cffaba)."
			}
		]
	}
)
