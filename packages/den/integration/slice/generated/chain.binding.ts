import {
	any,
	dueAt,
	fresh,
	one,
	only,
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
	Admission,
	Ledger,
	PauseRow,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Chain over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, type Settled, settled } from "@bjornpagen/grizzle/runtime"
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
	chainRetirerPrograms,
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
	readonly retirer: {
		readonly [K in keyof typeof chainRetirerPrograms]: MemberHandle<
			(typeof chainRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof chainCommitPrograms]: MemberHandle<(typeof chainCommitPrograms)[K]>
	}
}

interface Rows {
	readonly ChainStep: ReadonlyArray<Addition<typeof ChainStep>>
	readonly ChainDue: ReadonlyArray<Addition<typeof ChainDue>>
	readonly ChainScope: ReadonlyArray<Addition<typeof ChainScope>>
	readonly ChainWithin: ReadonlyArray<Addition<typeof ChainWithin>>
	readonly ChainAdmitted: ReadonlyArray<Addition<typeof ChainAdmitted>>
	readonly ChainFinish: ReadonlyArray<Addition<typeof ChainFinish>>
	readonly ChainStartStep: ReadonlyArray<Addition<typeof ChainStartStep>>
	readonly ChainStartScope: ReadonlyArray<Addition<typeof ChainStartScope>>
	readonly ChainPageInput: ReadonlyArray<Addition<typeof ChainPageInput>>
	readonly ChainPageInputAfter: ReadonlyArray<Addition<typeof ChainPageInputAfter>>
	readonly ChainNext: ReadonlyArray<Addition<typeof ChainNext>>
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
		root: ScopeKey,
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
							ChainStep: [{ step: key, kind: "Page", scope: scope, root: root }],
							ChainDue: [{ step: key, at: dueAt(chain.kinds[0].due, at), root: root }],
							ChainStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							ChainPageInput: [
								{
									step: key,
									root: root,
									feed: spawn.input.feed,
									seq: spawn.input.seq,
									pages: spawn.input.pages
								}
							],
							ChainPageInputAfter: Option.toArray(
								Option.map(spawn.input.after, (value) => ({ step: key, root: root, value }))
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
		root: ScopeKey,
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
							ChainStep: [{ step: key, kind: "Page", scope: scope, root: root }],
							ChainDue: [{ step: key, at: dueAt(chain.kinds[0].due, at), root: root }],
							ChainStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							ChainPageInput: [
								{
									step: key,
									root: root,
									feed: spawn.input.feed,
									seq: spawn.input.seq,
									pages: spawn.input.pages
								}
							],
							ChainPageInputAfter: Option.toArray(
								Option.map(spawn.input.after, (value) => ({ step: key, root: root, value }))
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
				settled(h.den.chainReadChainPageInput.once({ params: { step: step }, facts: {} })),
				one
			)
			const side0 = yield* Effect.map(
				settled(h.den.chainReadChainPageInputAfter.once({ params: { step: step }, facts: {} })),
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
				settled(h.den.chainReadChainChainRunInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const readChainOrderedInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.chainReadChainOrderedInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		pauseTurns: Effect.map(
			settled(h.coordinator.chainPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		paused: Effect.map(
			settled(h.coordinator.chainPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		take: () => Effect.void,
		giveBack: () => Effect.void,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainPause.once({
						params: {},
						facts: { insert: { ChainPaused: pausesOf([row]) } }
					})
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainResume.once({
						params: {},
						facts: { insert: { ChainResumed: pausesOf([row]) } }
					})
				)
			)
	}
	const busyFlows: Effect.Effect<ReadonlyArray<string>, Settled> = Effect.succeed([])
	const request = {
		ChainRun: (key: string, at: Instant, input: Parameters<(typeof chain.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Chain", "ChainRun", key), (scope) =>
				Effect.map(
					fresh(
						"Chain",
						settled(
							h.den.chainRequestChainRun.once({
								params: {},
								facts: {
									insert: {
										ChainScope: [{ scope, kind: "ChainRun" as const, root: scope }],
										ChainRoot: [{ scope, key, at }],
										ChainChainRunInput: [
											{ scope: scope, root: scope, feed: input.feed, pages: input.pages }
										]
									}
								}
							})
						)
					),
					(accepted) => ({ scope, fresh: accepted })
				)
			)
	}
	const ledger: Ledger<FlowNeeds<typeof chain>> = {
		flow: FlowName.make("Chain"),
		now: Effect.flatMap(settled(h.den.chainNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.chainAuthenticated.once({ params: {}, facts: {} }))
		),
		steps: new Map([
			[
				"Page",
				runnerOf(
					chain.kinds[0],
					{
						input: (step) => readChainPageInput(step),
						read: (input) => {
							const weights = chain.kinds[0].reads.weights.params(input)
							return Effect.flatMap(
								settled(
									h.commits.chainReadPage.once({
										params: { "weights.feed": weights.feed },
										facts: {}
									})
								),
								(rows) => Effect.map(only(rows), (row) => ({ weights: row.weights }))
							)
						},
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
															ChainStep: [
																{
																	step: key,
																	kind: "Page",
																	scope: done.turn.scope,
																	root: done.turn.root
																}
															],
															ChainDue: [
																{
																	step: key,
																	at: dueAt(chain.kinds[0].due, at),
																	root: done.turn.root
																}
															],
															ChainNext: [
																{
																	from: done.turn.step,
																	ordinal: BigInt(ordinal),
																	to: key,
																	root: done.turn.root
																}
															],
															ChainPageInput: [
																{
																	step: key,
																	root: done.turn.root,
																	feed: input.feed,
																	seq: input.seq,
																	pages: input.pages
																}
															],
															ChainPageInputAfter: Option.toArray(
																Option.map(input.after, (value) => ({
																	step: key,
																	root: done.turn.root,
																	value
																}))
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
								const outcome = yield* settled(
									h.commits.chainCommitPage.once({
										params: {},
										facts: {
											insert: {
												...grown.rows,
												ChainResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												ChainDone: [{ step: done.turn.step, root: done.turn.root }],
												ChainHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												],
												ChainPageOutput: [
													{
														step: done.turn.step,
														root: done.turn.root,
														seq: done.output.seq,
														items: done.output.items
													}
												],
												ChainPageOutputNext: Option.toArray(
													Option.map(done.output.next, (value) => ({
														step: done.turn.step,
														root: done.turn.root,
														value
													}))
												),
												ChainPageWeightsRead: Arr.map(done.rows.weights, (row, ordinal) => ({
													...row,
													step: done.turn.step,
													root: done.turn.root,
													ordinal: BigInt(ordinal)
												})),
												Item: done.writes.insert.Item
											}
										}
									})
								)
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
									settled(h.den.chainStepOf.once({ params: { step }, facts: {} })),
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
									settled(h.den.chainOutputsChainRunPage.once({ params: { scope }, facts: {} })),
									rowsOf
								)
								const sidePage0 = yield* Effect.map(
									settled(
										h.den.chainOutputsChainRunPageNext.once({ params: { scope }, facts: {} })
									),
									rowsOf
								)
								const failuresPage = yield* Effect.map(
									settled(h.den.chainFailuresChainRunPage.once({ params: { scope }, facts: {} })),
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
								settled(
									h.commits.chainCommitChainRunFinish.once({
										params: {},
										facts: {
											insert: {
												ChainResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												ChainDone: [{ step: done.turn.step, root: done.turn.root }],
												ChainHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												],
												Cursor: done.writes.insert.Cursor
											}
										}
									})
								),
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
									settled(h.den.chainStepOf.once({ params: { step }, facts: {} })),
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
									settled(h.den.chainOutputsOrderedPage.once({ params: { scope }, facts: {} })),
									rowsOf
								)
								const sidePage0 = yield* Effect.map(
									settled(h.den.chainOutputsOrderedPageNext.once({ params: { scope }, facts: {} })),
									rowsOf
								)
								const failuresPage = yield* Effect.map(
									settled(h.den.chainFailuresOrderedPage.once({ params: { scope }, facts: {} })),
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
								settled(
									h.commits.chainCommitOrderedFinish.once({
										params: {},
										facts: {
											insert: {
												ChainResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												ChainDone: [{ step: done.turn.step, root: done.turn.root }],
												ChainHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												],
												Cursor: done.writes.insert.Cursor
											}
										}
									})
								),
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
							const grown = yield* startChainRun(scope, scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Addition<typeof ChainStep>> = [
								...grown.rows.ChainStep,
								{ step: finish, kind: "ChainRunFinish", scope, root: scope }
							]
							const dues: ReadonlyArray<Addition<typeof ChainDue>> = [
								...grown.rows.ChainDue,
								{ step: finish, at, root: scope }
							]
							const admitted: ReadonlyArray<Addition<typeof ChainAdmitted>> = [
								...grown.rows.ChainAdmitted,
								{ scope, root: scope }
							]
							const finishes: ReadonlyArray<Addition<typeof ChainFinish>> = [
								...grown.rows.ChainFinish,
								{ scope, step: finish, root: scope }
							]
							const outcome = yield* settled(
								h.den.chainAdmit.once({
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
							)
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
							const grown = yield* startOrdered(scope, scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Addition<typeof ChainStep>> = [
								...grown.rows.ChainStep,
								{ step: finish, kind: "OrderedFinish", scope, root: scope }
							]
							const dues: ReadonlyArray<Addition<typeof ChainDue>> = [
								...grown.rows.ChainDue,
								{ step: finish, at, root: scope }
							]
							const admitted: ReadonlyArray<Addition<typeof ChainAdmitted>> = [
								...grown.rows.ChainAdmitted,
								{ scope, root: scope }
							]
							const finishes: ReadonlyArray<Addition<typeof ChainFinish>> = [
								...grown.rows.ChainFinish,
								{ scope, step: finish, root: scope }
							]
							const outcome = yield* settled(
								h.den.chainAdmit.once({
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
							)
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
			Effect.map(settled(h.den.chainStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope, root: row.root }))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.chainResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.chainHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(settled(h.den.chainDueOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.chainClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.chainRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.chainFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					settled(h.den.chainScopeOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const root = yield* Effect.map(
					settled(h.den.chainRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					const within = yield* Effect.map(
						settled(h.den.chainWithinOf.once({ params: { scope: scope }, facts: {} })),
						one
					)
					return Option.map(within, (w): ScopeView => ({
						place: "child",
						scope,
						kind: row.value.kind,
						parent: w.parent
					}))
				}
				const admitted = yield* Effect.map(
					settled(h.den.chainAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.chainSkippedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const key = Option.none<{ readonly id: ExclusiveId }>()
				const admission: Admission = Option.isSome(admitted)
					? "admitted"
					: Option.isSome(skipped)
						? "skipped"
						: "requested"
				return Option.some<ScopeView>({
					place: "root",
					scope,
					kind: row.value.kind,
					key: root.value.key,
					at: root.value.at,
					admission,
					exclusive: Option.map(key, (k) => k.id)
				})
			}),
		unended: (scope) =>
			Effect.flatMap(
				h.den.chainUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
				(steps) =>
					steps
						? Effect.succeed(true)
						: h.den.chainOpenChildren.once({ params: { scope }, facts: {} }).pipe(settled, any)
			),
		finished: (scope) =>
			h.den.chainFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: busyFlows,
		claim: (row) =>
			Effect.map(
				settled(h.den.chainClaim.once({ params: {}, facts: { insert: { ChainClaim: [row] } } })),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) =>
			settled(h.den.chainRetry.once({ params: {}, facts: { insert: { ChainRetry: [row] } } })),
		fence: (row) =>
			settled(h.den.chainFence.once({ params: {}, facts: { insert: { ChainFenced: [row] } } })),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.chainRefuse.once({
					params: {},
					facts: {
						insert: {
							ChainResult: [{ step, root, outcome: "failed" }],
							ChainFailed: [{ step, root }],
							ChainHeld: [{ step, root, attempt }],
							ChainRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.chainSkip.once({
					params: {},
					facts: { insert: { ChainSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.chainExhaust.once({
					params: {},
					facts: {
						insert: {
							ChainResult: [{ step, root, outcome: "failed" }],
							ChainFailed: [{ step, root }],
							ChainHeld: [{ step, root, attempt }],
							ChainExhausted: [{ step, root, attempts: attempt }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.chainFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ scope: row.scope, kind: row.kind, at: row.at }))
		),
		retire: (root) =>
			settled(
				h.retirer.chainRetire.once({
					params: {},
					facts: { retire: { ChainRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.gen(function* () {
			const steps = yield* Effect.map(
				settled(h.den.chainPending.once({ params: {}, facts: {} })),
				rowsOf
			)
			const claims = yield* Effect.map(
				settled(h.den.chainPendingClaims.once({ params: {}, facts: {} })),
				rowsOf
			)
			const retries = yield* Effect.map(
				settled(h.den.chainPendingRetries.once({ params: {}, facts: {} })),
				rowsOf
			)
			const fenced = yield* Effect.map(
				settled(h.den.chainPendingFenced.once({ params: {}, facts: {} })),
				rowsOf
			)
			const dues = yield* Effect.map(
				settled(h.den.chainPendingDues.once({ params: {}, facts: {} })),
				rowsOf
			)
			const requested = yield* Effect.map(
				settled(h.den.chainRequested.once({ params: {}, facts: {} })),
				rowsOf
			)
			const running = yield* Effect.map(
				settled(h.den.chainRunning.once({ params: {}, facts: {} })),
				rowsOf
			)
			const withins = yield* Effect.map(
				settled(h.den.chainWithins.once({ params: {}, facts: {} })),
				rowsOf
			)
			const roots = yield* Effect.map(
				settled(h.den.chainRoots.once({ params: {}, facts: {} })),
				rowsOf
			)
			const keys: ReadonlyArray<{ readonly scope: ScopeKey; readonly id: ExclusiveId }> = []
			const holds = yield* coordination.holds
			const exclusives = yield* coordination.exclusives
			const paused = yield* Effect.map(
				coordination.paused,
				Arr.map((row) => row.target)
			)
			const busy = yield* busyFlows
			const view = (
				scope: ScopeKey,
				kind: string,
				admission: Admission
			): ReadonlyArray<ScopeView> =>
				Option.match(
					Arr.findFirst(roots, (o) => o.scope === scope),
					{
						onSome: (o): ReadonlyArray<ScopeView> => [
							{
								place: "root",
								scope,
								kind,
								key: o.key,
								at: o.at,
								admission,
								exclusive: Option.map(
									Arr.findFirst(keys, (k) => k.scope === scope),
									(k) => k.id
								)
							}
						],
						onNone: () =>
							Arr.map(
								Option.toArray(Arr.findFirst(withins, (w) => w.scope === scope)),
								(w): ScopeView => ({ place: "child", scope, kind, parent: w.parent })
							)
					}
				)
			return {
				steps,
				claims,
				retries,
				fenced,
				dues,
				scopes: [
					...Arr.flatMap(requested, (s) => view(s.scope, s.kind, "requested")),
					...Arr.flatMap(running, (s) => view(s.scope, s.kind, "admitted"))
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
						ChainScope: [{ scope, kind: "Ordered" as const, root: scope }],
						ChainRoot: [{ scope, key, at }],
						ChainOrderedInput: [{ scope: scope, root: scope, feed: input.feed, pages: input.pages }]
					}
				}))
		}
	}
}
