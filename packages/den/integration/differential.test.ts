import {
	backoffFirstMillis,
	backoffLastMillis,
	caseHang,
	longestLeaseMillis
} from "@bjornpagen/den/limits"
import { now } from "@bjornpagen/den/runtime/clock"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import type { Datum } from "@den/model/datum"
import type { Fact } from "@den/model/facts"
import { rootText } from "@den/model/identity"
import { emptyState, endingOf, ledgerOf, SOUND, type State } from "@den/model/ledger"
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
import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { element, type Gen, int, oneOf } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, HashMap, Option, String as Str } from "effect"
import { chain, poolSeats } from "#integration/slice/flows.ts"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"
import { agreed, factsOf, type Graph } from "#integration/support/trace.ts"

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
	first: backoffFirstMillis.value,
	last: backoffLastMillis.value
})

/** How the model runs a kind: den's longest lease, its resources, and its ladder. */
const runsOf = (holds: ReadonlyArray<Resource>, ladder: Ladder): Runs => ({
	lease: longestLeaseMillis.value,
	holds,
	ladder
})

const steps = Arr.filter(chain.kinds, (k) => k._tag === "Step")
const pageLadder = Option.match(Arr.head(steps), {
	onNone: () => ladderOf(1),
	onSome: (s) => ladderOf(s.retry.kind === "attempts" ? s.retry.attempts : 1)
})

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
const finishing = <I>(ladder: Ladder) => ({
	runs: runsOf([], ladder),
	output: () => noOutput,
	error: () => noOutput,
	body: (_input: I) => ({ _tag: "Output", output: {}, writes: [] }) as const
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
		finish: finishing<ChainIn>(pageLadder)
	}
}

const pool: Resource = { name: "Pool", seats: poolSeats.value }

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
	finish: finishing<BatchIn>(pageLadder)
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
		finish: finishing<BatchIn>(pageLadder)
	}
}

/**
 * The model's run of an admission: the app's weight written first, then the root admitted, then, pass after pass,
 * every pending step claimed and its report committed, until a pass changes nothing. Every instant is zero: the
 * programs wait on nothing but their parents and the Pool's seats.
 */
const modelRun = (
	admission: Parameters<ReturnType<typeof ledgerOf>["admit"]>[1],
	weight: Option.Option<{ readonly feed: string; readonly factor: number }>
): ReadonlyArray<Fact> => {
	const ledger = ledgerOf(SOUND)
	const facts: Array<Fact> = []
	const record = (state: State, entry: { readonly facts: ReadonlyArray<Fact> }): State => {
		facts.push(...entry.facts)
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
	return facts
}

layer(sliceLayer)("the differential harness", (it) => {
	it.effect("commits the facts the reference model commits, on generated programs", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "differential",
					oracle: {
						kind: "second-implementation",
						name: "the reference model's ledger, sharing no code with den"
					},
					draw: drawn(programs),
					literal: Formatter.format,
					coverage: required<Feature>(
						[
							"a chain",
							"a long chain",
							"a weighted feed",
							"a fan-out",
							"an empty batch",
							"a contended pool"
						],
						{ cases: 12, sense: notesOnly }
					),
					kept: [],
					runs: 12,
					shrink: boundedShrink(6),
					concurrency: 1,
					steerEvery: 4,
					caseHang
				},
				(program, c) =>
					Effect.gen(function* () {
						const { chain: chainLedger, fan: fanLedger, ledgers, loader } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const key = `diff-${yield* nonce}`
						const at = yield* now
						const begin = (drawn: Program) =>
							Effect.gen(function* () {
								switch (drawn.kind) {
									case "chain": {
										c.note(drawn.pages > 2 ? "a long chain" : "a chain")
										if (drawn.factor > 0) {
											c.note("a weighted feed")
											yield* loader.workload.weigh.once({
												params: {},
												facts: {
													insert: { Weight: [{ feed: drawn.feed, factor: BigInt(drawn.factor) }] }
												}
											})
										}
										const stored = yield* rows(app.workload.weights.once({ params: {}, facts: {} }))
										const factor = Arr.reduce(
											Arr.filter(stored, (w) => w.feed === drawn.feed),
											0,
											(sum, w) => sum + Number(w.factor)
										)
										const requested = yield* chainLedger.request.ChainRun(key, at, {
											feed: drawn.feed,
											pages: BigInt(drawn.pages)
										})
										const model = modelRun(
											admissionOf(ChainRun, key, { feed: drawn.feed, pages: drawn.pages }),
											factor > 0 ? Option.some({ feed: drawn.feed, factor }) : Option.none()
										)
										return {
											scope: requested.scope,
											flow: FlowName.make("Chain"),
											model,
											root: "ChainRun"
										}
									}
									case "fan": {
										c.note(drawn.size === 0 ? "an empty batch" : "a fan-out")
										if (drawn.size > poolSeats.value) {
											c.note("a contended pool")
										}
										const requested = yield* fanLedger.request.FanRun(key, at, {
											batch: key,
											size: BigInt(drawn.size)
										})
										const model = modelRun(
											admissionOf(FanRun, key, { batch: key, size: drawn.size }),
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
						const scopes = [
							...(yield* rows(w.chainScopes.once(none))),
							...(yield* rows(w.fanScopes.once(none)))
						]
						const kindOf = (scope: string) =>
							Option.getOrElse(
								Option.map(
									Arr.findFirst(scopes, (s) => s.scope === scope),
									(s): string => s.kind
								),
								() => ""
							)
						const roots = [
							...(yield* rows(w.chainRoots.once(none))),
							...(yield* rows(w.fanRoots.once(none)))
						]
						const admitted = [
							...(yield* rows(w.chainAdmittedAll.once(none))),
							...(yield* rows(w.fanAdmittedAll.once(none)))
						]
						const withins = [
							...(yield* rows(w.chainWithins.once(none))),
							...(yield* rows(w.fanWithins.once(none)))
						]
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
							roots: Arr.map(roots, (r) => ({ scope: r.scope, kind: kindOf(r.scope), key: r.key })),
							admitted: Arr.map(admitted, (a): string => a.scope),
							withins: Arr.map(withins, (x) => ({
								scope: x.scope,
								parent: x.parent,
								kind: kindOf(x.scope)
							})),
							startSteps: [
								...(yield* rows(w.chainStartSteps.once(none))),
								...(yield* rows(w.fanStartSteps.once(none)))
							],
							startScopes: [
								...(yield* rows(w.chainStartScopes.once(none))),
								...(yield* rows(w.fanStartScopes.once(none)))
							],
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
						assert.deepStrictEqual(engine, mine(agreed(started.model)))
						assert.isTrue(Arr.contains(engine, `admitted ${rootText({ kind: started.root, key })}`))
						assert.isTrue(Arr.some(engine, Str.startsWith("finished ")))
					})
			)
		)
	)
})
