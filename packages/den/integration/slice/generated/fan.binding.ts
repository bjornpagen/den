import {
	rootScope,
	type ScopeKey,
	startedScope,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type { Committed, FlowNeeds, Ledger } from "@bjornpagen/den/runtime/ledger"
import { runner } from "@bjornpagen/den/runtime/turn"
/** The ledger port of the flow Fan over its served programs; `den generate` writes it, and nothing edits it. */
import type { Written } from "@bjornpagen/grizzle"
import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option } from "effect"
import type { Digest } from "effect/crypto"
import { fan } from "#integration/slice/flows.ts"
import type {
	FanJoin,
	FanKind,
	FanStep,
	FanScope,
	FanWithin,
	FanStartStep,
	FanStartScope,
	FanSquareInput,
	FanBatchInput
} from "#integration/slice/generated/fan.fragment.ts"
import type { fanPrograms } from "#integration/slice/generated/fan.programs.ts"

/** The handles the ledger calls: each of the flow's programs, from whichever login serves them. */
export type FanHandles = {
	readonly [K in keyof typeof fanPrograms]: MemberHandle<(typeof fanPrograms)[K]>
}

interface Rows {
	readonly FanStep: ReadonlyArray<Written<typeof FanStep>>
	readonly FanScope: ReadonlyArray<Written<typeof FanScope>>
	readonly FanWithin: ReadonlyArray<Written<typeof FanWithin>>
	readonly FanStartStep: ReadonlyArray<Written<typeof FanStartStep>>
	readonly FanStartScope: ReadonlyArray<Written<typeof FanStartScope>>
	readonly FanSquareInput: ReadonlyArray<Written<typeof FanSquareInput>>
	readonly FanBatchInput: ReadonlyArray<Written<typeof FanBatchInput>>
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
	join: (typeof FanJoin)["handles"][number]
): (typeof FanKind)["handles"][number] => {
	switch (join) {
		case "Batch":
			return "BatchFinish"
		case "FanRun":
			return "FanRunFinish"
	}
}

/** The ledger of the flow Fan over its handles, with the starts of its roots and the completions of its awaits. */
export const fanLedger = (h: FanHandles) => {
	const noRows: Rows = {
		FanStep: [],
		FanScope: [],
		FanWithin: [],
		FanStartStep: [],
		FanStartScope: [],
		FanSquareInput: [],
		FanBatchInput: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], scopes: [] } }
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			FanStep: [...a.rows.FanStep, ...b.rows.FanStep],
			FanScope: [...a.rows.FanScope, ...b.rows.FanScope],
			FanWithin: [...a.rows.FanWithin, ...b.rows.FanWithin],
			FanStartStep: [...a.rows.FanStartStep, ...b.rows.FanStartStep],
			FanStartScope: [...a.rows.FanStartScope, ...b.rows.FanStartScope],
			FanSquareInput: [...a.rows.FanSquareInput, ...b.rows.FanSquareInput],
			FanBatchInput: [...a.rows.FanBatchInput, ...b.rows.FanBatchInput]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			scopes: [...a.spawned.scopes, ...b.spawned.scopes]
		}
	})
	const startBatch = (
		scope: ScopeKey,
		input: Parameters<(typeof fan.kinds)[1]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				fan.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							FanStep: [{ step: key, kind: "Square", scope }],
							FanStartStep: [{ scope, ordinal: BigInt(ordinal), step: key }],
							FanSquareInput: [{ step: key, batch: spawn.input.batch, n: spawn.input.n }]
						},
						spawned: { steps: [{ step: key, kind: "Square" }], scopes: [] }
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const startFanRun = (
		scope: ScopeKey,
		input: Parameters<(typeof fan.kinds)[2]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				fan.kinds[2].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.flatMap(startedScope(scope, ordinal), (key) =>
						Effect.map(startBatch(key, spawn.input), (inner) =>
							joined(inner, {
								rows: {
									...noRows,
									FanScope: [{ scope: key, kind: "Batch" }],
									FanWithin: [{ scope: key, parent: scope }],
									FanStartScope: [{ scope, ordinal: BigInt(ordinal), child: key }],
									FanBatchInput: [{ scope: key, batch: spawn.input.batch, size: spawn.input.size }]
								},
								spawned: { steps: [], scopes: [key] }
							})
						)
					)
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readFanSquareInput = (step: StepKey) =>
		Effect.map(
			Effect.map(h.fanReadFanSquareInput.once({ params: { step: step }, facts: {} }), one),
			Option.map((found) => ({ batch: found.batch, n: found.n }))
		)
	const readFanBatchInput = (scope: ScopeKey) =>
		Effect.map(
			Effect.map(h.fanReadFanBatchInput.once({ params: { scope: scope }, facts: {} }), one),
			Option.map((found) => ({ batch: found.batch, size: found.size }))
		)
	const readFanFanRunInput = (scope: ScopeKey) =>
		Effect.map(
			Effect.map(h.fanReadFanFanRunInput.once({ params: { scope: scope }, facts: {} }), one),
			Option.map((found) => ({ batch: found.batch, size: found.size }))
		)
	const ledger: Ledger<FlowNeeds<typeof fan>> = {
		prefix: "Fan",
		stepOf: (step) =>
			Effect.map(h.fanStepOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))
			),
		resultOf: (step) =>
			Effect.map(h.fanResultOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(h.fanHeldOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		joinOf: (scope) =>
			Effect.map(h.fanScopeOf.once({ params: { scope }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.kind)
			),
		parentOf: (scope) =>
			Effect.map(h.fanWithinOf.once({ params: { scope }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.parent)
			),
		claim: (claim) => h.fanClaim.once({ params: {}, facts: { insert: { FanClaim: [claim] } } }),
		refuse: (step, attempt, law) =>
			h.fanRefuse.once({
				params: {},
				facts: {
					insert: {
						FanResult: [{ step, outcome: "failed" }],
						FanHeld: [{ step, attempt }],
						FanRefusal: [{ step, law }]
					}
				}
			}),
		exhaust: (step, attempt) =>
			h.fanExhaust.once({
				params: {},
				facts: {
					insert: {
						FanResult: [{ step, outcome: "failed" }],
						FanHeld: [{ step, attempt }],
						FanExhausted: [{ step, attempts: attempt }]
					}
				}
			}),
		pending: Effect.map(h.fanPending.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(Arr.fromIterable(rows), (row) => ({
				step: row.step,
				kind: row.kind,
				scope: row.scope
			}))
		),
		pendingClaims: Effect.map(h.fanPendingClaims.once({ params: {}, facts: {} }), Arr.fromIterable),
		openScopes: Effect.map(h.fanOpenScopes.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(Arr.fromIterable(rows), (row) => row.scope)
		),
		stepsIn: (scope) =>
			Effect.map(h.fanStepsIn.once({ params: { scope }, facts: {} }), (rows) =>
				Arr.map(Arr.fromIterable(rows), (row) => ({ key: row.step, done: row.done }))
			),
		scopesIn: (scope) =>
			Effect.map(h.fanScopesIn.once({ params: { scope }, facts: {} }), (rows) =>
				Arr.map(Arr.fromIterable(rows), (row) => ({ key: row.child, done: row.done }))
			),
		finish: (scope, step) =>
			Effect.flatMap(h.fanScopeOf.once({ params: { scope }, facts: {} }), (rows) =>
				Option.match(one(rows), {
					onNone: () => Effect.die("a scope finishes only once it is installed"),
					onSome: (row) =>
						h.fanFinish.once({
							params: {},
							facts: {
								insert: {
									FanFinish: [{ scope, step }],
									FanStep: [{ step, kind: finishOf(row.kind), scope }]
								}
							}
						})
				})
			),
		runners: new Map([
			[
				"Square",
				runner(fan.kinds[0], {
					input: (step) => readFanSquareInput(step),
					commit: (done) =>
						Effect.gen(function* () {
							const grown = yield* Effect.succeed(nothingGrown)
							const outcome = yield* h.fanCommitSquare.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.step, outcome: "done" }],
										FanHeld: [{ step: done.step, attempt: done.attempt }],
										FanSquareOutput: [{ step: done.step, square: done.output.square }]
									}
								}
							})
							return { outcome, spawned: grown.spawned }
						}),
					fail: (failed) => Effect.die(failed.error)
				})
			],
			[
				"BatchFinish",
				runner(
					{
						name: "BatchFinish",
						lane: fan.kinds[1].finish.lane,
						body: (read: {
							readonly input: Parameters<(typeof fan.kinds)[1]["start"]>[0]
							readonly results: Parameters<(typeof fan.kinds)[1]["finish"]["body"]>[1]
						}) =>
							Effect.map(fan.kinds[1].finish.body(read.input, read.results), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (_step, scope) =>
							Effect.gen(function* () {
								const input = yield* readFanBatchInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const rowsSquare = yield* Effect.map(
									h.fanOutputsBatchSquare.once({ params: { scope }, facts: {} }),
									Arr.fromIterable
								)
								const Square = Arr.map(rowsSquare, (row) => ({ square: row.square }))
								return Option.some({ input: input.value, results: { Square } })
							}),
						commit: (done) =>
							Effect.map(
								h.fanCommitBatchFinish.once({
									params: {},
									facts: {
										insert: {
											FanResult: [{ step: done.step, outcome: "done" }],
											FanHeld: [{ step: done.step, attempt: done.attempt }],
											Tally: done.writes.insert.Tally
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], scopes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					}
				)
			],
			[
				"FanRunFinish",
				runner(
					{
						name: "FanRunFinish",
						lane: fan.kinds[2].finish.lane,
						body: (read: {
							readonly input: Parameters<(typeof fan.kinds)[2]["start"]>[0]
							readonly results: Parameters<(typeof fan.kinds)[2]["finish"]["body"]>[1]
						}) =>
							Effect.map(fan.kinds[2].finish.body(read.input, read.results), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (_step, scope) =>
							Effect.gen(function* () {
								const input = yield* readFanFanRunInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								return Option.some({ input: input.value, results: {} })
							}),
						commit: (done) =>
							Effect.map(
								h.fanCommitFanRunFinish.once({
									params: {},
									facts: {
										insert: {
											FanResult: [{ step: done.step, outcome: "done" }],
											FanHeld: [{ step: done.step, attempt: done.attempt }],
											Settled: done.writes.insert.Settled
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
		finishKinds: new Set(["BatchFinish", "FanRunFinish"])
	}
	return {
		ledger,
		start: {
			FanRun: (
				key: string,
				input: Parameters<(typeof fan.kinds)[2]["start"]>[0]
			): Effect.Effect<Committed, CallError, Digest.Digest> =>
				Effect.gen(function* () {
					const scope = yield* rootScope("Fan", "FanRun", key)
					const grown = yield* startFanRun(scope, input)
					const outcome = yield* h.fanStartFanRun.once({
						params: {},
						facts: {
							insert: {
								...grown.rows,
								FanScope: [{ scope, kind: "FanRun" }, ...grown.rows.FanScope],
								FanRoot: [{ scope, key }],
								FanFanRunInput: [{ scope: scope, batch: input.batch, size: input.size }]
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
