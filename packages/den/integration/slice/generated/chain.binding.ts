import {
	any,
	dueAt,
	fresh,
	one,
	only,
	readingOf,
	rowsOf,
	signals
} from "@bjornpagen/den/runtime/bind"
import {
	edgeStep,
	finishStep,
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
	RootRunner,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"
import { type PauseChains, pauseIn, resumeIn } from "@bjornpagen/den/runtime/seats"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Chain over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { chain } from "#integration/slice/flows.ts"
import { ChainPausable } from "#integration/slice/generated/chain.fragment.ts"
import type {
	ChainStep,
	ChainScope,
	ChainAdmitted,
	ChainFinish,
	ChainStartStep,
	ChainPageInput,
	ChainPageInputAfter,
	ChainNext,
	ChainRootKind
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
	readonly ChainScope: ReadonlyArray<Addition<typeof ChainScope>>
	readonly ChainAdmitted: ReadonlyArray<Addition<typeof ChainAdmitted>>
	readonly ChainFinish: ReadonlyArray<Addition<typeof ChainFinish>>
	readonly ChainStartStep: ReadonlyArray<Addition<typeof ChainStartStep>>
	readonly ChainPageInput: ReadonlyArray<Addition<typeof ChainPageInput>>
	readonly ChainPageInputAfter: ReadonlyArray<Addition<typeof ChainPageInputAfter>>
	readonly ChainNext: ReadonlyArray<Addition<typeof ChainNext>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof ChainPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(ChainPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Chain"), target })
	)

/** The ledger of the flow Chain over its handles, with the requests of its roots. */
export const chainLedger = (h: ChainHandles) => {
	const noRows: Rows = {
		ChainStep: [],
		ChainScope: [],
		ChainAdmitted: [],
		ChainFinish: [],
		ChainStartStep: [],
		ChainPageInput: [],
		ChainPageInputAfter: [],
		ChainNext: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.ChainStartStep, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ChainStep: [...a.rows.ChainStep, ...b.rows.ChainStep],
			ChainScope: [...a.rows.ChainScope, ...b.rows.ChainScope],
			ChainAdmitted: [...a.rows.ChainAdmitted, ...b.rows.ChainAdmitted],
			ChainFinish: [...a.rows.ChainFinish, ...b.rows.ChainFinish],
			ChainStartStep: [...a.rows.ChainStartStep, ...b.rows.ChainStartStep],
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
							ChainStep: [
								{
									step: key,
									kind: "Page",
									scope: scope,
									due: dueAt(chain.kinds[0].due, at),
									root: root
								}
							],
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
							ChainStep: [
								{
									step: key,
									kind: "Page",
									scope: scope,
									due: dueAt(chain.kinds[0].due, at),
									root: root
								}
							],
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
	const pauseChains: PauseChains<(typeof ChainPausable)["handles"][number]> = {
		flow: FlowName.make("Chain"),
		turns: Effect.map(
			settled(h.coordinator.chainPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.chainPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainPause.once({ params: {}, facts: { insert: { ChainPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainResume.once({ params: {}, facts: { insert: { ChainResumed: [row] } } })
				)
			)
	}
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		paused: pauseChains.live,
		take: () => Effect.void,
		giveBack: () => Effect.void,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),
		resume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))
	}
	const request = {
		ChainRun: (key: string, input: Parameters<(typeof chain.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Chain", "ChainRun", key), (scope) =>
				Effect.map(
					fresh(
						"Chain",
						settled(
							h.den.chainRequestChainRun.once({
								params: { chainChainRunScope: scope, chainChainRunKey: key },
								facts: {
									insert: {
										ChainScope: [{ scope, root: scope }],
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
	const runners = {
		Page: runnerOf(
			chain.kinds[0],
			{
				input: (step) => readChainPageInput(step),
				read: (input) => {
					const weights = chain.kinds[0].reads.weights.params(input)
					return Effect.flatMap(
						settled(
							h.commits.chainReadPage.once({ params: { "weights.feed": weights.feed }, facts: {} })
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
															due: dueAt(chain.kinds[0].due, at),
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
													steps: [{ step: key, kind: "Page", due: dueAt(chain.kinds[0].due, at) }],
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
										ChainResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
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
		),
		ChainRunFinish: runnerOf(
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
							settled(h.den.chainOutputsChainRunPageNext.once({ params: { scope }, facts: {} })),
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
										ChainResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
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
		),
		OrderedFinish: runnerOf(
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
										ChainResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
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
	}
	const roots: { readonly [K in (typeof ChainRootKind)["handles"][number]]: RootRunner } = {
		ChainRun: {
			window: chain.kinds[1].window,
			precondition: chain.kinds[1].precondition,
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
						{ step: finish, kind: "ChainRunFinish", scope, due: at, root: scope }
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
									ChainStartStep: grown.rows.ChainStartStep,
									ChainPageInput: grown.rows.ChainPageInput,
									ChainPageInputAfter: grown.rows.ChainPageInputAfter,
									ChainStep: steps,
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
							finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])]
						}
					})
				})
		},
		Ordered: {
			window: chain.kinds[2].window,
			precondition: chain.kinds[2].precondition,
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
						{ step: finish, kind: "OrderedFinish", scope, due: at, root: scope }
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
									ChainStartStep: grown.rows.ChainStartStep,
									ChainPageInput: grown.rows.ChainPageInput,
									ChainPageInputAfter: grown.rows.ChainPageInputAfter,
									ChainStep: steps,
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
							finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])]
						}
					})
				})
		}
	}
	const ledger: Ledger<FlowNeeds<typeof chain>> = {
		flow: FlowName.make("Chain"),
		now: Effect.flatMap(settled(h.den.chainNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.chainAuthenticated.once({ params: {}, facts: {} }))
		),
		stepOf: (step) =>
			Effect.map(settled(h.den.chainStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.chainResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.chainHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.chainClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.chainRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.chainFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.chainRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.chainAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.chainSkippedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const admission: Admission = Option.isSome(admitted)
					? "admitted"
					: Option.isSome(skipped)
						? "skipped"
						: "requested"
				return Option.some<ScopeView>({
					place: "root",
					scope,
					kind: root.value.kind,
					key: root.value.key,
					at: root.value.at,
					admission,
					exclusive: Option.none(),
					runner: roots[root.value.kind]
				})
			}),
		unended: (scope) =>
			h.den.chainUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
		finished: (scope) =>
			h.den.chainFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
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
		snapshot: Effect.flatMap(settled(h.den.chainSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof chain>> => {
				const view = (scope: ScopeKey, admission: Admission): ReadonlyArray<ScopeView> =>
					Option.match(
						Arr.findFirst(read.roots, (o) => o.scope === scope),
						{
							onSome: (o): ReadonlyArray<ScopeView> => [
								{
									place: "root",
									scope,
									kind: o.kind,
									key: o.key,
									at: o.at,
									admission,
									exclusive: Option.none(),
									runner: roots[o.kind]
								}
							],
							onNone: (): ReadonlyArray<ScopeView> => []
						}
					)
				return {
					steps: Arr.map(read.steps, (s) => ({
						step: s.step,
						runner: runners[s.kind],
						scope: s.scope,
						due: s.due
					})),
					claims: read.claims,
					retries: read.retries,
					fenced: read.fenced,
					scopes: [
						...Arr.flatMap(read.requested, (s) => view(s.scope, "requested")),
						...Arr.flatMap(read.running, (s) => view(s.scope, "admitted"))
					],
					holds: [],
					exclusives: [],
					paused: Arr.map(read.paused, (row) => row.target),
					busy: []
				}
			})
		),
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
		scheduled: []
	}
	return {
		ledger,
		request,
		requestFacts: {
			Ordered: (key: string, input: Parameters<(typeof chain.kinds)[2]["start"]>[0]) =>
				Effect.map(rootScope("Chain", "Ordered", key), (scope) => ({
					scope,
					params: { chainOrderedScope: scope, chainOrderedKey: key },
					facts: {
						ChainScope: [{ scope, root: scope }],
						ChainOrderedInput: [{ scope: scope, root: scope, feed: input.feed, pages: input.pages }]
					}
				}))
		}
	}
}
