import {
	any,
	dueAt,
	fresh,
	one,
	readingOf,
	rowsOf,
	scheduleOf,
	signals
} from "@bjornpagen/den/runtime/bind"
import {
	edgeStep,
	finishStep,
	type ExclusiveId,
	type Instant,
	rootScope,
	type ScopeKey,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type {
	FlowNeeds,
	Ledger,
	PauseRow,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Chain over its served programs; `den generate` writes it, and nothing edits it. */
import type { Written } from "@bjornpagen/grizzle"
import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { chain } from "#integration/slice/flows.ts"
import { ChainPausable } from "#integration/slice/generated/chain.fragment.ts"
import type {
	ChainStep,
	ChainDue,
	ChainScope,
	ChainWithin,
	ChainAdmitted,
	ChainFinish,
	ChainStartStep,
	ChainStartScope,
	ChainPageInput,
	ChainPageInputAfter,
	ChainNext
} from "#integration/slice/generated/chain.fragment.ts"
import type {
	chainDenPrograms,
	chainCoordinatorPrograms,
	chainCommitPrograms
} from "#integration/slice/generated/chain.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface ChainHandles {
	readonly den: {
		readonly [K in keyof typeof chainDenPrograms]: MemberHandle<(typeof chainDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof chainCoordinatorPrograms]: MemberHandle<
			(typeof chainCoordinatorPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof chainCommitPrograms]: MemberHandle<(typeof chainCommitPrograms)[K]>
	}
}

interface Rows {
	readonly ChainStep: ReadonlyArray<Written<typeof ChainStep>>
	readonly ChainDue: ReadonlyArray<Written<typeof ChainDue>>
	readonly ChainScope: ReadonlyArray<Written<typeof ChainScope>>
	readonly ChainWithin: ReadonlyArray<Written<typeof ChainWithin>>
	readonly ChainAdmitted: ReadonlyArray<Written<typeof ChainAdmitted>>
	readonly ChainFinish: ReadonlyArray<Written<typeof ChainFinish>>
	readonly ChainStartStep: ReadonlyArray<Written<typeof ChainStartStep>>
	readonly ChainStartScope: ReadonlyArray<Written<typeof ChainStartScope>>
	readonly ChainPageInput: ReadonlyArray<Written<typeof ChainPageInput>>
	readonly ChainPageInputAfter: ReadonlyArray<Written<typeof ChainPageInputAfter>>
	readonly ChainNext: ReadonlyArray<Written<typeof ChainNext>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (name: string): Option.Option<(typeof ChainPausable)["handles"][number]> =>
	Arr.findFirst(ChainPausable.handles, (handle) => handle === name)
const pausesOf = (rows: ReadonlyArray<PauseRow>) =>
	Arr.flatMap(rows, (row) =>
		Option.toArray(Option.map(pausableOf(row.target), (target) => ({ target, turn: row.turn })))
	)

/** The ledger of the flow Chain over its handles, with the requests of its roots. */
export const chainLedger = (h: ChainHandles) => {
	const noRows: Rows = {
		ChainStep: [],
		ChainDue: [],
		ChainScope: [],
		ChainWithin: [],
		ChainAdmitted: [],
		ChainFinish: [],
		ChainStartStep: [],
		ChainStartScope: [],
		ChainPageInput: [],
		ChainPageInputAfter: [],
		ChainNext: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.ChainStartStep, (s) => s.scope === scope) ||
		Arr.some(grown.rows.ChainStartScope, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ChainStep: [...a.rows.ChainStep, ...b.rows.ChainStep],
			ChainDue: [...a.rows.ChainDue, ...b.rows.ChainDue],
			ChainScope: [...a.rows.ChainScope, ...b.rows.ChainScope],
			ChainWithin: [...a.rows.ChainWithin, ...b.rows.ChainWithin],
			ChainAdmitted: [...a.rows.ChainAdmitted, ...b.rows.ChainAdmitted],
			ChainFinish: [...a.rows.ChainFinish, ...b.rows.ChainFinish],
			ChainStartStep: [...a.rows.ChainStartStep, ...b.rows.ChainStartStep],
			ChainStartScope: [...a.rows.ChainStartScope, ...b.rows.ChainStartScope],
			ChainPageInput: [...a.rows.ChainPageInput, ...b.rows.ChainPageInput],
			ChainPageInputAfter: [...a.rows.ChainPageInputAfter, ...b.rows.ChainPageInputAfter],
			ChainNext: [...a.rows.ChainNext, ...b.rows.ChainNext]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startChainRun = (
		scope: ScopeKey,
		input: Parameters<(typeof chain.kinds)[1]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				chain.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							ChainStep: [{ step: key, kind: "Page", scope: scope }],
							ChainDue: [{ step: key, at: dueAt(chain.kinds[0].due, at) }],
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
						spawned: {
							steps: [{ step: key, kind: "Page", due: dueAt(chain.kinds[0].due, at) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const startOrdered = (
		scope: ScopeKey,
		input: Parameters<(typeof chain.kinds)[2]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				chain.kinds[2].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							ChainStep: [{ step: key, kind: "Page", scope: scope }],
							ChainDue: [{ step: key, at: dueAt(chain.kinds[0].due, at) }],
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
						spawned: {
							steps: [{ step: key, kind: "Page", due: dueAt(chain.kinds[0].due, at) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readChainPageInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.chainReadChainPageInput.once({ params: { step: step }, facts: {} }),
				one
			)
			const side0 = yield* Effect.map(
				h.den.chainReadChainPageInputAfter.once({ params: { step: step }, facts: {} }),
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
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.chainReadChainChainRunInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const readChainOrderedInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.chainReadChainOrderedInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		pauseTurns: Effect.map(h.coordinator.chainPauseTurns.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		paused: Effect.map(h.coordinator.chainPausedAll.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		take: () => Effect.void,
		giveBack: () => Effect.void,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (row) =>
			Effect.asVoid(
				h.coordinator.chainPause.once({
					params: {},
					facts: { insert: { ChainPaused: pausesOf([row]) } }
				})
			),
		resume: (row) =>
			Effect.asVoid(
				h.coordinator.chainResume.once({
					params: {},
					facts: { insert: { ChainResumed: pausesOf([row]) } }
				})
			)
	}
	const busyOf = (flow: string): Effect.Effect<boolean, CallError> => {
		switch (flow) {
			default:
				return Effect.succeed(false)
		}
	}
	const request = {
		ChainRun: (key: string, at: Instant, input: Parameters<(typeof chain.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Chain", "ChainRun", key), (scope) =>
				Effect.map(
					fresh(
						"Chain",
						h.den.chainRequestChainRun.once({
							params: {},
							facts: {
								insert: {
									ChainScope: [{ scope, kind: "ChainRun" as const }],
									ChainRoot: [{ scope, key, at }],
									ChainChainRunInput: [{ scope: scope, feed: input.feed, pages: input.pages }]
								}
							}
						})
					),
					(accepted) => ({ scope, fresh: accepted })
				)
			)
	}
	const ledger: Ledger<FlowNeeds<typeof chain>> = {
		flow: FlowName.make("Chain"),
		now: Effect.flatMap(h.den.chainNow.once({ params: {}, facts: {} }), readingOf),
		authenticated: Effect.asVoid(h.commits.chainAuthenticated.once({ params: {}, facts: {} })),
		resources: [],
		steps: new Map([
			[
				"Page",
				runnerOf(
					chain.kinds[0],
					{
						input: (step) => readChainPageInput(step),
						read: (input) =>
							Effect.all(
								{
									weights: Effect.map(
										h.commits.chainReadPageWeights.once({
											params: chain.kinds[0].reads.weights.params(input),
											facts: {}
										}),
										rowsOf
									)
								},
								{ concurrency: "unbounded" }
							),
						commit: (done, at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.map(
									Effect.all([
										Effect.map(
											Effect.forEach(
												chain.edges[0].next(done.input, done.output),
												(input, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
													Effect.map(edgeStep(done.turn.step, "Next", ordinal), (key): Grown => ({
														rows: {
															...noRows,
															ChainStep: [{ step: key, kind: "Page", scope: done.turn.scope }],
															ChainDue: [{ step: key, at: dueAt(chain.kinds[0].due, at) }],
															ChainNext: [
																{ from: done.turn.step, ordinal: BigInt(ordinal), to: key }
															],
															ChainPageInput: [
																{ step: key, feed: input.feed, seq: input.seq, pages: input.pages }
															],
															ChainPageInputAfter: Option.toArray(
																Option.map(input.after, (value) => ({ step: key, value }))
															)
														},
														spawned: {
															steps: [
																{ step: key, kind: "Page", due: dueAt(chain.kinds[0].due, at) }
															],
															finishes: []
														}
													}))
											),
											(parts) => Arr.reduce(parts, nothingGrown, joined)
										)
									]),
									(parts) => Arr.reduce(parts, nothingGrown, joined)
								)
								const outcome = yield* h.commits.chainCommitPage.once({
									params: {},
									facts: {
										insert: {
											...grown.rows,
											ChainResult: [{ step: done.turn.step, outcome: "done" }],
											ChainDone: [{ step: done.turn.step }],
											ChainHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											ChainPageOutput: [
												{ step: done.turn.step, seq: done.output.seq, items: done.output.items }
											],
											ChainPageOutputNext: Option.toArray(
												Option.map(done.output.next, (value) => ({ step: done.turn.step, value }))
											),
											ChainPageWeightsRead: Arr.map(done.rows.weights, (row, ordinal) => ({
												...row,
												step: done.turn.step,
												ordinal: BigInt(ordinal)
											})),
											Item: done.writes.insert.Item
										}
									}
								})
								return { outcome, spawned: grown.spawned }
							}),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.none()
				)
			],
			[
				"ChainRunFinish",
				runnerOf(
					{
						name: "ChainRunFinish",
						uses: [],
						retry: chain.kinds[1].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
							readonly endings: Parameters<(typeof chain.kinds)[1]["finish"]["body"]>[1]
						}) =>
							Effect.map(chain.kinds[1].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (step) =>
							Effect.gen(function* () {
								const located = yield* Effect.map(
									h.den.chainStepOf.once({ params: { step }, facts: {} }),
									one
								)
								if (Option.isNone(located)) {
									return Option.none()
								}
								const scope = located.value.scope
								const input = yield* readChainChainRunInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const rowsPage = yield* Effect.map(
									h.den.chainOutputsChainRunPage.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const sidePage0 = yield* Effect.map(
									h.den.chainOutputsChainRunPageNext.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const failuresPage = yield* Effect.map(
									h.den.chainFailuresChainRunPage.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const Page = [
									...Arr.map(rowsPage, (row) => ({
										_tag: "Done" as const,
										output: {
											seq: row.seq,
											items: row.items,
											next: Option.map(
												Arr.findFirst(sidePage0, (o) => o.step === row.step),
												(o) => o.value
											)
										}
									})),
									...Arr.map(failuresPage, () => ({ _tag: "Failed" as const }))
								]
								return Option.some({ input: input.value, endings: { Page } })
							}),
						read: () => Effect.succeed([]),
						commit: (done) =>
							Effect.map(
								h.commits.chainCommitChainRunFinish.once({
									params: {},
									facts: {
										insert: {
											ChainResult: [{ step: done.turn.step, outcome: "done" }],
											ChainDone: [{ step: done.turn.step }],
											ChainHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											Cursor: done.writes.insert.Cursor
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("ChainRun")
				)
			],
			[
				"OrderedFinish",
				runnerOf(
					{
						name: "OrderedFinish",
						uses: [],
						retry: chain.kinds[2].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof chain.kinds)[2]["start"]>[0]
							readonly endings: Parameters<(typeof chain.kinds)[2]["finish"]["body"]>[1]
						}) =>
							Effect.map(chain.kinds[2].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (step) =>
							Effect.gen(function* () {
								const located = yield* Effect.map(
									h.den.chainStepOf.once({ params: { step }, facts: {} }),
									one
								)
								if (Option.isNone(located)) {
									return Option.none()
								}
								const scope = located.value.scope
								const input = yield* readChainOrderedInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const rowsPage = yield* Effect.map(
									h.den.chainOutputsOrderedPage.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const sidePage0 = yield* Effect.map(
									h.den.chainOutputsOrderedPageNext.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const failuresPage = yield* Effect.map(
									h.den.chainFailuresOrderedPage.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const Page = [
									...Arr.map(rowsPage, (row) => ({
										_tag: "Done" as const,
										output: {
											seq: row.seq,
											items: row.items,
											next: Option.map(
												Arr.findFirst(sidePage0, (o) => o.step === row.step),
												(o) => o.value
											)
										}
									})),
									...Arr.map(failuresPage, () => ({ _tag: "Failed" as const }))
								]
								return Option.some({ input: input.value, endings: { Page } })
							}),
						read: () => Effect.succeed([]),
						commit: (done) =>
							Effect.map(
								h.commits.chainCommitOrderedFinish.once({
									params: {},
									facts: {
										insert: {
											ChainResult: [{ step: done.turn.step, outcome: "done" }],
											ChainDone: [{ step: done.turn.step }],
											ChainHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											Cursor: done.writes.insert.Cursor
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("Ordered")
				)
			]
		]),
		roots: new Map([
			[
				"ChainRun",
				{
					kind: "ChainRun",
					exclusive: false,
					window: chain.kinds[1].window,
					precondition: chain.kinds[1].precondition,
					finish: "ChainRunFinish",
					admit: (scope: ScopeKey, at: Instant) =>
						Effect.gen(function* () {
							const input = yield* readChainChainRunInput(scope)
							if (Option.isNone(input)) {
								return Option.none()
							}
							const grown = yield* startChainRun(scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Written<typeof ChainStep>> = [
								...grown.rows.ChainStep,
								{ step: finish, kind: "ChainRunFinish", scope }
							]
							const dues: ReadonlyArray<Written<typeof ChainDue>> = [
								...grown.rows.ChainDue,
								{ step: finish, at }
							]
							const admitted: ReadonlyArray<Written<typeof ChainAdmitted>> = [
								...grown.rows.ChainAdmitted,
								{ scope }
							]
							const finishes: ReadonlyArray<Written<typeof ChainFinish>> = [
								...grown.rows.ChainFinish,
								{ scope, step: finish }
							]
							const outcome = yield* h.den.chainAdmit.once({
								params: {},
								facts: {
									insert: {
										ChainScope: grown.rows.ChainScope,
										ChainWithin: grown.rows.ChainWithin,
										ChainStartStep: grown.rows.ChainStartStep,
										ChainStartScope: grown.rows.ChainStartScope,
										ChainPageInput: grown.rows.ChainPageInput,
										ChainPageInputAfter: grown.rows.ChainPageInputAfter,
										ChainStep: steps,
										ChainDue: dues,
										ChainAdmitted: admitted,
										ChainFinish: finishes
									}
								}
							})
							return Option.some({
								outcome,
								spawned: {
									steps: grown.spawned.steps,
									finishes: [
										...grown.spawned.finishes,
										...(hasChildren(grown, scope) ? [] : [finish])
									]
								}
							})
						})
				}
			],
			[
				"Ordered",
				{
					kind: "Ordered",
					exclusive: false,
					window: chain.kinds[2].window,
					precondition: chain.kinds[2].precondition,
					finish: "OrderedFinish",
					admit: (scope: ScopeKey, at: Instant) =>
						Effect.gen(function* () {
							const input = yield* readChainOrderedInput(scope)
							if (Option.isNone(input)) {
								return Option.none()
							}
							const grown = yield* startOrdered(scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Written<typeof ChainStep>> = [
								...grown.rows.ChainStep,
								{ step: finish, kind: "OrderedFinish", scope }
							]
							const dues: ReadonlyArray<Written<typeof ChainDue>> = [
								...grown.rows.ChainDue,
								{ step: finish, at }
							]
							const admitted: ReadonlyArray<Written<typeof ChainAdmitted>> = [
								...grown.rows.ChainAdmitted,
								{ scope }
							]
							const finishes: ReadonlyArray<Written<typeof ChainFinish>> = [
								...grown.rows.ChainFinish,
								{ scope, step: finish }
							]
							const outcome = yield* h.den.chainAdmit.once({
								params: {},
								facts: {
									insert: {
										ChainScope: grown.rows.ChainScope,
										ChainWithin: grown.rows.ChainWithin,
										ChainStartStep: grown.rows.ChainStartStep,
										ChainStartScope: grown.rows.ChainStartScope,
										ChainPageInput: grown.rows.ChainPageInput,
										ChainPageInputAfter: grown.rows.ChainPageInputAfter,
										ChainStep: steps,
										ChainDue: dues,
										ChainAdmitted: admitted,
										ChainFinish: finishes
									}
								}
							})
							return Option.some({
								outcome,
								spawned: {
									steps: grown.spawned.steps,
									finishes: [
										...grown.spawned.finishes,
										...(hasChildren(grown, scope) ? [] : [finish])
									]
								}
							})
						})
				}
			]
		]),
		stepOf: (step) =>
			Effect.map(h.den.chainStepOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))
			),
		resultOf: (step) =>
			Effect.map(h.den.chainResultOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(h.den.chainHeldOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(h.den.chainDueOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) =>
			Effect.map(h.den.chainClaimsOf.once({ params: { step }, facts: {} }), rowsOf),
		retriesOf: (step) =>
			Effect.map(h.den.chainRetriesOf.once({ params: { step }, facts: {} }), rowsOf),
		fencedOf: (step) =>
			Effect.map(h.den.chainFencedOf.once({ params: { step }, facts: {} }), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					h.den.chainScopeOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const parent = yield* Effect.map(
					h.den.chainWithinOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const admitted = yield* Effect.map(
					h.den.chainAdmittedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const skipped = yield* Effect.map(
					h.den.chainSkippedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const key = Option.none<{ readonly id: ExclusiveId }>()
				const root = yield* Effect.map(
					h.den.chainRootOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				return Option.some({
					scope,
					kind: row.value.kind,
					parent: Option.map(parent, (w) => w.parent),
					admitted: Option.isSome(admitted),
					skipped: Option.isSome(skipped),
					key: Option.map(key, (k) => k.id),
					root: Option.map(root, (o) => ({ key: o.key, at: o.at }))
				})
			}),
		unended: (scope) =>
			Effect.flatMap(any(h.den.chainUnendedSteps.once({ params: { scope }, facts: {} })), (steps) =>
				steps
					? Effect.succeed(true)
					: any(h.den.chainOpenChildren.once({ params: { scope }, facts: {} }))
			),
		finished: (scope) => any(h.den.chainFinished.once({ params: { scope }, facts: {} })),
		busy: busyOf,
		claim: (row) =>
			Effect.map(
				h.den.chainClaim.once({ params: {}, facts: { insert: { ChainClaim: [row] } } }),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) => h.den.chainRetry.once({ params: {}, facts: { insert: { ChainRetry: [row] } } }),
		fence: (row) =>
			h.den.chainFence.once({ params: {}, facts: { insert: { ChainFenced: [row] } } }),
		refuse: (step, attempt, law) =>
			h.den.chainRefuse.once({
				params: {},
				facts: {
					insert: {
						ChainResult: [{ step, outcome: "failed" }],
						ChainFailed: [{ step }],
						ChainHeld: [{ step, attempt }],
						ChainRefusal: [{ step, law }]
					}
				}
			}),
		skip: (scope, by) =>
			h.den.chainSkip.once({ params: {}, facts: { insert: { ChainSkipped: [{ scope, by }] } } }),
		exhaust: (step, attempt) =>
			h.den.chainExhaust.once({
				params: {},
				facts: {
					insert: {
						ChainResult: [{ step, outcome: "failed" }],
						ChainFailed: [{ step }],
						ChainHeld: [{ step, attempt }],
						ChainExhausted: [{ step, attempts: attempt }]
					}
				}
			}),
		snapshot: Effect.gen(function* () {
			const steps = yield* Effect.map(h.den.chainPending.once({ params: {}, facts: {} }), rowsOf)
			const claims = yield* Effect.map(
				h.den.chainPendingClaims.once({ params: {}, facts: {} }),
				rowsOf
			)
			const retries = yield* Effect.map(
				h.den.chainPendingRetries.once({ params: {}, facts: {} }),
				rowsOf
			)
			const fenced = yield* Effect.map(
				h.den.chainPendingFenced.once({ params: {}, facts: {} }),
				rowsOf
			)
			const dues = yield* Effect.map(h.den.chainPendingDues.once({ params: {}, facts: {} }), rowsOf)
			const requested = yield* Effect.map(
				h.den.chainRequested.once({ params: {}, facts: {} }),
				rowsOf
			)
			const running = yield* Effect.map(h.den.chainRunning.once({ params: {}, facts: {} }), rowsOf)
			const withins = yield* Effect.map(h.den.chainWithins.once({ params: {}, facts: {} }), rowsOf)
			const roots = yield* Effect.map(h.den.chainRoots.once({ params: {}, facts: {} }), rowsOf)
			const keys: ReadonlyArray<{ readonly scope: ScopeKey; readonly id: ExclusiveId }> = []
			const holds = yield* coordination.holds
			const exclusives = yield* coordination.exclusives
			const paused = yield* Effect.map(
				coordination.paused,
				Arr.map((row) => row.target)
			)
			const busy = yield* Effect.filter([], (flow) => busyOf(flow))
			const view = (scope: ScopeKey, kind: string, admitted: boolean): ScopeView => ({
				scope,
				kind,
				parent: Option.map(
					Arr.findFirst(withins, (w) => w.scope === scope),
					(w) => w.parent
				),
				admitted,
				skipped: false,
				key: Option.map(
					Arr.findFirst(keys, (k) => k.scope === scope),
					(k) => k.id
				),
				root: Option.map(
					Arr.findFirst(roots, (o) => o.scope === scope),
					(o) => ({ key: o.key, at: o.at })
				)
			})
			return {
				steps,
				claims,
				retries,
				fenced,
				dues,
				scopes: [
					...Arr.map(requested, (s) => view(s.scope, s.kind, false)),
					...Arr.map(running, (s) => view(s.scope, s.kind, true))
				],
				holds,
				exclusives,
				paused,
				busy
			} satisfies Snapshot
		}),
		changes: Stream.mergeAll(
			[
				signals(h.den.chainPending.watch({ params: {}, facts: {} })),
				signals(h.den.chainRequested.watch({ params: {}, facts: {} })),
				signals(h.den.chainRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.chainPausedAll.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: [
			...Option.toArray(
				Option.map(scheduleOf(chain.kinds[1].trigger), (s) => ({
					kind: "ChainRun",
					cron: s.cron,
					request: (at: Instant) => request.ChainRun(String(at), at, s.input(at))
				}))
			)
		]
	}
	return {
		ledger,
		request,
		requestFacts: {
			Ordered: (key: string, at: Instant, input: Parameters<(typeof chain.kinds)[2]["start"]>[0]) =>
				Effect.map(rootScope("Chain", "Ordered", key), (scope) => ({
					scope,
					facts: {
						ChainScope: [{ scope, kind: "Ordered" as const }],
						ChainRoot: [{ scope, key, at }],
						ChainOrderedInput: [{ scope: scope, feed: input.feed, pages: input.pages }]
					}
				}))
		}
	}
}
