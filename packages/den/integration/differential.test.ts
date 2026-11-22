import { type Again, none as noRetry } from "@bjornpagen/den/algebra/kinds"
import { Sha256 } from "@bjornpagen/grizzle"
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
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
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
							const app = yield* openAuditor
							const key = "diff"
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
											const requested = yield* chainLedger.request.ChainRun(key, {
												feed: chosen.feed,
												pages: BigInt(chosen.pages)
											})
											const model = modelRun(
												admissionOf(ChainRun, key, { feed: chosen.feed, pages: chosen.pages }),
												factor > 0 ? Option.some({ feed: chosen.feed, factor }) : Option.none()
											)
											return {
												scope: requested.scope,
												flow: requested.flow,
												model,
												root: "ChainRun"
											}
										}
										case "fan": {
											c.note(chosen.size === 0 ? "an empty batch" : "a fan-out")
											if (chosen.size > poolSeats) {
												c.note("a contended pool")
											}
											const requested = yield* fanLedger.request.FanRun(key, {
												batch: key,
												size: BigInt(chosen.size)
											})
											const model = modelRun(
												admissionOf(FanRun, key, { batch: key, size: chosen.size }),
												Option.none()
											)
											return {
												scope: requested.scope,
												flow: requested.flow,
												model,
												root: "FanRun"
											}
										}
									}
								})
							const started = yield* begin(program)
							yield* ringAndDrain(ledgers, [started])
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
				file: "packages/den/src/runtime/turn.ts",
				original:
					"\t\t\t\tArr.isReadonlyArrayEmpty(spawned.steps) && Arr.isReadonlyArrayEmpty(spawned.finishes)\n",
				replacement: "\t\t\t\tfalse\n",
				why: "A step's end never rings its scope's finish, though it was the scope's last open child: a batch's and a feed's finish never run, where the model's do."
			}
		]
	}
)
