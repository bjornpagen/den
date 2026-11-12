import {
	edgeStep,
	rootScope,
	type ScopeKey,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type { Committed, FlowNeeds, Ledger } from "@bjornpagen/den/runtime/ledger"
import { runner } from "@bjornpagen/den/runtime/turn"
/** The ledger port of the flow Chain over its served programs; `den generate` writes it, and nothing edits it. */
import type { Written } from "@bjornpagen/grizzle"
import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option } from "effect"
import type { Digest } from "effect/crypto"
import { chain } from "#integration/slice/flows.ts"
import type {
	ChainJoin,
	ChainKind,
	ChainStep,
	ChainScope,
	ChainWithin,
	ChainStartStep,
	ChainStartScope,
	ChainPageInput,
	ChainPageInputAfter,
	ChainNext
} from "#integration/slice/generated/chain.fragment.ts"
import type { chainPrograms } from "#integration/slice/generated/chain.programs.ts"

/** The handles the ledger calls: each of the flow's programs, from whichever login serves them. */
export type ChainHandles = {
	readonly [K in keyof typeof chainPrograms]: MemberHandle<(typeof chainPrograms)[K]>
}

interface Rows {
	readonly ChainStep: ReadonlyArray<Written<typeof ChainStep>>
	readonly ChainScope: ReadonlyArray<Written<typeof ChainScope>>
	readonly ChainWithin: ReadonlyArray<Written<typeof ChainWithin>>
	readonly ChainStartStep: ReadonlyArray<Written<typeof ChainStartStep>>
	readonly ChainStartScope: ReadonlyArray<Written<typeof ChainStartScope>>
	readonly ChainPageInput: ReadonlyArray<Written<typeof ChainPageInput>>
	readonly ChainPageInputAfter: ReadonlyArray<Written<typeof ChainPageInputAfter>>
	readonly ChainNext: ReadonlyArray<Written<typeof ChainNext>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: {
		readonly steps: ReadonlyArray<{ readonly step: StepKey; readonly kind: string }>
		readonly scopes: ReadonlyArray<ScopeKey>
	}
}

const one = <A>(rows: Iterable<A>): Option.Option<A> => Arr.head(Arr.fromIterable(rows))

const finishOf = (
	_join: (typeof ChainJoin)["handles"][number]
): (typeof ChainKind)["handles"][number] => "ChainRunFinish"

/** The ledger of the flow Chain over its handles, with the starts of its roots and the completions of its awaits. */
export const chainLedger = (h: ChainHandles) => {
	const noRows: Rows = {
		ChainStep: [],
		ChainScope: [],
		ChainWithin: [],
		ChainStartStep: [],
		ChainStartScope: [],
		ChainPageInput: [],
		ChainPageInputAfter: [],
		ChainNext: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], scopes: [] } }
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ChainStep: [...a.rows.ChainStep, ...b.rows.ChainStep],
			ChainScope: [...a.rows.ChainScope, ...b.rows.ChainScope],
			ChainWithin: [...a.rows.ChainWithin, ...b.rows.ChainWithin],
			ChainStartStep: [...a.rows.ChainStartStep, ...b.rows.ChainStartStep],
			ChainStartScope: [...a.rows.ChainStartScope, ...b.rows.ChainStartScope],
			ChainPageInput: [...a.rows.ChainPageInput, ...b.rows.ChainPageInput],
			ChainPageInputAfter: [...a.rows.ChainPageInputAfter, ...b.rows.ChainPageInputAfter],
			ChainNext: [...a.rows.ChainNext, ...b.rows.ChainNext]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			scopes: [...a.spawned.scopes, ...b.spawned.scopes]
		}
	})
	const startChainRun = (
		scope: ScopeKey,
		input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				chain.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							ChainStep: [{ step: key, kind: "Page", scope }],
							ChainStartStep: [{ scope, ordinal: BigInt(ordinal), step: key }],
							ChainPageInput: [
								{
									step: key,
									feed: spawn.input.feed,
									seq: spawn.input.seq,
									pages: spawn.input.pages
								}
							],
							ChainPageInputAfter: Option.toArray(
								Option.map(spawn.input.after, (value) => ({ step: key, value }))
							)
						},
						spawned: { steps: [{ step: key, kind: "Page" }], scopes: [] }
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readChainPageInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.chainReadChainPageInput.once({ params: { step: step }, facts: {} }),
				one
			)
			const side0 = yield* Effect.map(
				h.chainReadChainPageInputAfter.once({ params: { step: step }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({
				feed: found.feed,
				seq: found.seq,
				pages: found.pages,
				after: Option.map(side0, (o) => o.value)
			}))
		})
	const readChainChainRunInput = (scope: ScopeKey) =>
		Effect.map(
			Effect.map(h.chainReadChainChainRunInput.once({ params: { scope: scope }, facts: {} }), one),
			Option.map((found) => ({ feed: found.feed, pages: found.pages }))
		)
	const ledger: Ledger<FlowNeeds<typeof chain>> = {
		prefix: "Chain",
		stepOf: (step) =>
			Effect.map(h.chainStepOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))
			),
		resultOf: (step) =>
			Effect.map(h.chainResultOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(h.chainHeldOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		joinOf: (scope) =>
			Effect.map(h.chainScopeOf.once({ params: { scope }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.kind)
			),
		parentOf: (scope) =>
			Effect.map(h.chainWithinOf.once({ params: { scope }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.parent)
			),
		claim: (claim) => h.chainClaim.once({ params: {}, facts: { insert: { ChainClaim: [claim] } } }),
		refuse: (step, attempt, law) =>
			h.chainRefuse.once({
				params: {},
				facts: {
					insert: {
						ChainResult: [{ step, outcome: "failed" }],
						ChainHeld: [{ step, attempt }],
						ChainRefusal: [{ step, law }]
					}
				}
			}),
		exhaust: (step, attempt) =>
			h.chainExhaust.once({
				params: {},
				facts: {
					insert: {
						ChainResult: [{ step, outcome: "failed" }],
						ChainHeld: [{ step, attempt }],
						ChainExhausted: [{ step, attempts: attempt }]
					}
				}
			}),
		pending: Effect.map(h.chainPending.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(Arr.fromIterable(rows), (row) => ({
				step: row.step,
				kind: row.kind,
				scope: row.scope
			}))
		),
		pendingClaims: Effect.map(
			h.chainPendingClaims.once({ params: {}, facts: {} }),
			Arr.fromIterable
		),
		openScopes: Effect.map(h.chainOpenScopes.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(Arr.fromIterable(rows), (row) => row.scope)
		),
		stepsIn: (scope) =>
			Effect.map(h.chainStepsIn.once({ params: { scope }, facts: {} }), (rows) =>
				Arr.map(Arr.fromIterable(rows), (row) => ({ key: row.step, done: row.done }))
			),
		scopesIn: (scope) =>
			Effect.map(h.chainScopesIn.once({ params: { scope }, facts: {} }), (rows) =>
				Arr.map(Arr.fromIterable(rows), (row) => ({ key: row.child, done: row.done }))
			),
		finish: (scope, step) =>
			Effect.flatMap(h.chainScopeOf.once({ params: { scope }, facts: {} }), (rows) =>
				Option.match(one(rows), {
					onNone: () => Effect.die("a scope finishes only once it is installed"),
					onSome: (row) =>
						h.chainFinish.once({
							params: {},
							facts: {
								insert: {
									ChainFinish: [{ scope, step }],
									ChainStep: [{ step, kind: finishOf(row.kind), scope }]
								}
							}
						})
				})
			),
		runners: new Map([
			[
				"Page",
				runner(chain.kinds[0], {
					input: (step) => readChainPageInput(step),
					commit: (done) =>
						Effect.gen(function* () {
							const grown = yield* Effect.map(
								Effect.all([
									Effect.map(
										Effect.forEach(chain.edges[0].next(done.input, done.output), (input, ordinal) =>
											Effect.map(edgeStep(done.step, "Next", ordinal), (key) => ({
												key,
												ordinal,
												input
											}))
										),
										(cs): Grown => ({
											rows: {
												...noRows,
												ChainStep: Arr.map(cs, (c) => ({
													step: c.key,
													kind: "Page",
													scope: done.scope
												})),
												ChainNext: Arr.map(cs, (c) => ({
													from: done.step,
													ordinal: BigInt(c.ordinal),
													to: c.key
												})),
												ChainPageInput: Arr.map(cs, (c) => ({
													step: c.key,
													feed: c.input.feed,
													seq: c.input.seq,
													pages: c.input.pages
												})),
												ChainPageInputAfter: Arr.flatMap(cs, (c) =>
													Option.toArray(
														Option.map(c.input.after, (value) => ({ step: c.key, value }))
													)
												)
											},
											spawned: {
												steps: Arr.map(cs, (c) => ({ step: c.key, kind: "Page" })),
												scopes: []
											}
										})
									)
								]),
								(parts) => Arr.reduce(parts, nothingGrown, joined)
							)
							const outcome = yield* h.chainCommitPage.once({
								params: {},
								facts: {
									insert: {
										...grown.rows,
										ChainResult: [{ step: done.step, outcome: "done" }],
										ChainHeld: [{ step: done.step, attempt: done.attempt }],
										ChainPageOutput: [
											{ step: done.step, seq: done.output.seq, items: done.output.items }
										],
										ChainPageOutputNext: Option.toArray(
											Option.map(done.output.next, (value) => ({ step: done.step, value }))
										),
										Item: done.writes.insert.Item
									}
								}
							})
							return { outcome, spawned: grown.spawned }
						}),
					fail: (failed) => Effect.die(failed.error)
				})
			],
			[
				"ChainRunFinish",
				runner(
					{
						name: "ChainRunFinish",
						lane: chain.kinds[1].finish.lane,
						body: (read: {
							readonly input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
							readonly results: Parameters<(typeof chain.kinds)[1]["finish"]["body"]>[1]
						}) =>
							Effect.map(chain.kinds[1].finish.body(read.input, read.results), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (_step, scope) =>
							Effect.gen(function* () {
								const input = yield* readChainChainRunInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const rowsPage = yield* Effect.map(
									h.chainOutputsChainRunPage.once({ params: { scope }, facts: {} }),
									Arr.fromIterable
								)
								const side0 = yield* Effect.map(
									h.chainOutputsChainRunPageNext.once({ params: { scope }, facts: {} }),
									Arr.fromIterable
								)
								const Page = Arr.map(rowsPage, (row) => ({
									seq: row.seq,
									items: row.items,
									next: Option.map(
										Arr.findFirst(side0, (o) => o.step === row.step),
										(o) => o.value
									)
								}))
								return Option.some({ input: input.value, results: { Page } })
							}),
						commit: (done) =>
							Effect.map(
								h.chainCommitChainRunFinish.once({
									params: {},
									facts: {
										insert: {
											ChainResult: [{ step: done.step, outcome: "done" }],
											ChainHeld: [{ step: done.step, attempt: done.attempt }],
											Cursor: done.writes.insert.Cursor
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], scopes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					}
				)
			]
		]),
		finishKinds: new Set(["ChainRunFinish"])
	}
	return {
		ledger,
		start: {
			ChainRun: (
				key: string,
				input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
			): Effect.Effect<Committed, CallError, Digest.Digest> =>
				Effect.gen(function* () {
					const scope = yield* rootScope("Chain", "ChainRun", key)
					const grown = yield* startChainRun(scope, input)
					const outcome = yield* h.chainStartChainRun.once({
						params: {},
						facts: {
							insert: {
								...grown.rows,
								ChainScope: [{ scope, kind: "ChainRun" }, ...grown.rows.ChainScope],
								ChainRoot: [{ scope, key }],
								ChainChainRunInput: [{ scope: scope, feed: input.feed, pages: input.pages }]
							}
						}
					})
					return {
						outcome,
						spawned: { steps: grown.spawned.steps, scopes: [scope, ...grown.spawned.scopes] }
					}
				})
		},
		complete: {}
	}
}
