import {
	any,
	committedFacts,
	dueOf,
	fresh,
	held,
	one,
	only,
	readingOf,
	recordText,
	rowsOf,
	signals,
	spawnedOf,
	type SpawnRows
} from "@bjornpagen/den/runtime/bind"
import {
	edgeStep,
	atOnce,
	finishStep,
	rootScope,
	rowDigest,
	startedStep
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
import { settled } from "@bjornpagen/den/runtime/settled"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Chain over its served programs; `den generate` writes it, and nothing edits it. */
import { type Addition, recordsFacts, Sha256 } from "@bjornpagen/grizzle"
import type { MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, pipe, Stream } from "effect"
import { chain } from "#integration/slice/flows.ts"
import {
	ChainPausable,
	ChainPageReadWeightsRecords,
	ChainPageReadEarlierRecords,
	ChainPageReadTreeRecords,
	chainGraph
} from "#integration/slice/generated/chain.fragment.ts"
import type {
	ChainScope,
	ChainAdmitted,
	ChainFinish,
	ChainStartStep,
	ChainPageInput,
	ChainPageInputAfter,
	ChainNext,
	ChainKind,
	ChainRootKind
} from "#integration/slice/generated/chain.fragment.ts"
import type {
	chainDenPrograms,
	chainCoordinatorPrograms,
	chainRetirerPrograms,
	chainCommitPrograms
} from "#integration/slice/generated/chain.programs.ts"

/** The text of a row step Page's read `weights` found, its digest's input. */
const ChainPageReadWeightsText = recordText(chain.kinds[0].reads.named.weights)
/** The text of a row step Page's read `earlier` found, its digest's input. */
const ChainPageReadEarlierText = recordText(chain.kinds[0].reads.named.earlier)
/** The text of a row step Page's read `tree` found, its digest's input. */
const ChainPageReadTreeText = recordText(chain.kinds[0].reads.named.tree)

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
	readonly ChainScope: ReadonlyArray<Addition<typeof ChainScope>>
	readonly ChainAdmitted: ReadonlyArray<Addition<typeof ChainAdmitted>>
	readonly ChainFinish: ReadonlyArray<Addition<typeof ChainFinish>>
	readonly ChainStartStep: ReadonlyArray<Addition<typeof ChainStartStep>>
	readonly ChainPageInput: ReadonlyArray<Addition<typeof ChainPageInput>>
	readonly ChainPageInputAfter: ReadonlyArray<Addition<typeof ChainPageInputAfter>>
	readonly ChainNext: ReadonlyArray<Addition<typeof ChainNext>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof ChainKind)["handles"][number]> {
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
		ChainScope: [],
		ChainAdmitted: [],
		ChainFinish: [],
		ChainStartStep: [],
		ChainPageInput: [],
		ChainPageInputAfter: [],
		ChainNext: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: Sha256): boolean =>
		Arr.some(grown.rows.ChainStartStep, (s) => Sha256.equals(s.scope, scope))
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ChainScope: [...a.rows.ChainScope, ...b.rows.ChainScope],
			ChainAdmitted: [...a.rows.ChainAdmitted, ...b.rows.ChainAdmitted],
			ChainFinish: [...a.rows.ChainFinish, ...b.rows.ChainFinish],
			ChainStartStep: [...a.rows.ChainStartStep, ...b.rows.ChainStartStep],
			ChainPageInput: [...a.rows.ChainPageInput, ...b.rows.ChainPageInput],
			ChainPageInputAfter: [...a.rows.ChainPageInputAfter, ...b.rows.ChainPageInputAfter],
			ChainNext: [...a.rows.ChainNext, ...b.rows.ChainNext]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startChainRun = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(chain.kinds[1].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
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
					...spawnedOf(
						{ step: key, kind: "Page", scope: scope },
						dueOf(chain.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const startOrdered = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof chain.kinds)[2]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(chain.kinds[2].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
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
					...spawnedOf(
						{ step: key, kind: "Page", scope: scope },
						dueOf(chain.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const readChainPageInput = (step: Sha256) =>
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
	const readChainChainRunInput = (scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.chainReadChainChainRunInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const readChainOrderedInput = (scope: Sha256) =>
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
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		paused: pauseChains.live,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),
		resume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))
	}
	const request = {
		ChainRun: (key: string, input: Parameters<(typeof chain.kinds)[1]["start"]>[0]) =>
			pipe(rootScope("Chain", "ChainRun", key), (scope) =>
				pipe(
					h.den.chainRequestChainRun.once({
						params: {
							chainChainRunScope: scope,
							chainChainRunKey: key,
							chainChainRunChainScope: [{ scope, root: scope }],
							chainChainRunChainChainRunInput: [
								{ scope: scope, root: scope, feed: input.feed, pages: input.pages }
							]
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Chain"), scope, fresh: accepted }))
				)
			)
	}
	const runners = {
		Page: runnerOf(
			chain.kinds[0],
			{
				input: (step) => readChainPageInput(step),
				read: (input) =>
					Effect.flatMap(
						settled(
							h.commits.chainReadPage.once({
								params: chain.kinds[0].reads.params(input),
								facts: {}
							})
						),
						only
					),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = Arr.reduce(
							[
								Arr.reduce(
									Arr.map(chain.edges[0].next(done.input, done.output), (input, ordinal): Grown =>
										pipe(edgeStep(done.turn.step, "Next", ordinal), (key): Grown => ({
											rows: {
												...noRows,
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
											...spawnedOf(
												{ step: key, kind: "Page", scope: done.turn.scope },
												dueOf(chain.kinds[0].due, input)
											)
										}))
									),
									nothingGrown,
									joined
								)
							],
							nothingGrown,
							joined
						)
						const recordedWeights = yield* Effect.forEach(done.rows.weights, (row) =>
							Effect.map(ChainPageReadWeightsText(row), (text) => ({
								row,
								digest: rowDigest("weights", text)
							}))
						)
						const uniqueWeights = Arr.dedupeWith(recordedWeights, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const recordedEarlier = yield* Effect.forEach(done.rows.earlier, (row) =>
							Effect.map(ChainPageReadEarlierText(row), (text) => ({
								row,
								digest: rowDigest("earlier", text)
							}))
						)
						const uniqueEarlier = Arr.dedupeWith(recordedEarlier, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const recordedTree = yield* Effect.forEach(done.rows.tree, (row) =>
							Effect.map(ChainPageReadTreeText(row), (text) => ({
								row,
								digest: rowDigest("tree", text)
							}))
						)
						const uniqueTree = Arr.dedupeWith(recordedTree, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const outcome = yield* settled(
							h.commits.chainCommitPage.once({
								params: { steps: grown.steps, root: done.turn.root, ...done.writes.params },
								facts: committedFacts(
									{
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
													items: done.output.items,
													earlier: done.output.earlier
												}
											],
											ChainPageOutputNext: Option.toArray(
												Option.map(done.output.next, (value) => ({
													step: done.turn.step,
													root: done.turn.root,
													value
												}))
											),
											...recordsFacts(
												chainGraph,
												ChainPageReadWeightsRecords
											)(
												Arr.map(
													uniqueWeights,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											ChainPageReadWeights: Arr.map(recordedWeights, (found, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: found.digest
											})),
											...recordsFacts(
												chainGraph,
												ChainPageReadEarlierRecords
											)(
												Arr.map(
													uniqueEarlier,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											ChainPageReadEarlier: Arr.map(recordedEarlier, (found, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: found.digest
											})),
											...recordsFacts(
												chainGraph,
												ChainPageReadTreeRecords
											)(
												Arr.map(
													uniqueTree,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											ChainPageReadTree: Arr.map(recordedTree, (found, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: found.digest
											}))
										}
									},
									done.writes.facts
								)
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
				uses: chain.kinds[1].finish.uses,
				retry: chain.kinds[1].finish.retry,
				waits: chain.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof chain.kinds)[1]["finish"]["body"]>[1]
				}) => chain.kinds[1].finish.body(read.input, read.endings)
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
						const outputPageRows = yield* Effect.map(
							settled(h.den.chainOutputsChainRunPage.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const outputPageSide0 = yield* Effect.map(
							settled(h.den.chainOutputsChainRunPageNext.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputPageRows = yield* Effect.map(
							settled(h.den.chainInputsChainRunPage.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputPageSide0 = yield* Effect.map(
							settled(h.den.chainInputsChainRunPageAfter.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresPage = yield* Effect.map(
							settled(h.den.chainFailuresChainRunPage.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputPage = (child: (typeof inputPageRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputPageRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({
										feed: row.feed,
										seq: row.seq,
										pages: row.pages,
										after: Option.map(
											Arr.findFirst(inputPageSide0, (o) => Sha256.equals(o.step, row.step)),
											(o) => o.value
										)
									})
								)
							)
						const Page = [
							...(yield* Effect.forEach(outputPageRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputPage(row.step),
										output: Effect.succeed({
											seq: row.seq,
											items: row.items,
											earlier: row.earlier,
											next: Option.map(
												Arr.findFirst(outputPageSide0, (o) => Sha256.equals(o.step, row.step)),
												(o) => o.value
											)
										})
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresPage, (failed) =>
								Effect.map(inputPage(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Page } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.chainCommitChainRunFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ChainResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ChainDone: [{ step: done.turn.step, root: done.turn.root }],
											ChainHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											ChainChainRunFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
										}
									},
									done.writes.facts
								)
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("ChainRun")
		),
		OrderedFinish: runnerOf(
			{
				name: "OrderedFinish",
				uses: chain.kinds[2].finish.uses,
				retry: chain.kinds[2].finish.retry,
				waits: chain.kinds[2].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof chain.kinds)[2]["start"]>[0]
					readonly endings: Parameters<(typeof chain.kinds)[2]["finish"]["body"]>[1]
				}) => chain.kinds[2].finish.body(read.input, read.endings)
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
						const outputPageRows = yield* Effect.map(
							settled(h.den.chainOutputsOrderedPage.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const outputPageSide0 = yield* Effect.map(
							settled(h.den.chainOutputsOrderedPageNext.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputPageRows = yield* Effect.map(
							settled(h.den.chainInputsOrderedPage.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputPageSide0 = yield* Effect.map(
							settled(h.den.chainInputsOrderedPageAfter.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresPage = yield* Effect.map(
							settled(h.den.chainFailuresOrderedPage.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputPage = (child: (typeof inputPageRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputPageRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({
										feed: row.feed,
										seq: row.seq,
										pages: row.pages,
										after: Option.map(
											Arr.findFirst(inputPageSide0, (o) => Sha256.equals(o.step, row.step)),
											(o) => o.value
										)
									})
								)
							)
						const Page = [
							...(yield* Effect.forEach(outputPageRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputPage(row.step),
										output: Effect.succeed({
											seq: row.seq,
											items: row.items,
											earlier: row.earlier,
											next: Option.map(
												Arr.findFirst(outputPageSide0, (o) => Sha256.equals(o.step, row.step)),
												(o) => o.value
											)
										})
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresPage, (failed) =>
								Effect.map(inputPage(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Page } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.chainCommitOrderedFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ChainResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ChainDone: [{ step: done.turn.step, root: done.turn.root }],
											ChainHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											ChainOrderedFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
										}
									},
									done.writes.facts
								)
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Ordered")
		)
	}
	const roots: { readonly [K in (typeof ChainRootKind)["handles"][number]]: RootRunner } = {
		ChainRun: {
			window: chain.kinds[1].window,
			precondition: chain.kinds[1].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readChainChainRunInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startChainRun(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "ChainRunFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									ChainScope: grown.rows.ChainScope,
									ChainStartStep: grown.rows.ChainStartStep,
									ChainPageInput: grown.rows.ChainPageInput,
									ChainPageInputAfter: grown.rows.ChainPageInputAfter,
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
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readChainOrderedInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startOrdered(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "OrderedFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									ChainScope: grown.rows.ChainScope,
									ChainStartStep: grown.rows.ChainStartStep,
									ChainPageInput: grown.rows.ChainPageInput,
									ChainPageInputAfter: grown.rows.ChainPageInputAfter,
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
		reading: (environment) =>
			Effect.flatMap(
				settled(
					h.den.chainReading.once({ params: { "serving.environment": environment }, facts: {} })
				),
				(rows) =>
					Effect.flatMap(only(rows), (row) =>
						Effect.map(readingOf(row.now), (now) => ({
							now,
							serving: Option.map(Arr.head(row.serving), (served) => served.deployment)
						}))
					)
			),
		promote: (host) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainPromote.once({
						params: { environment: host.environment, deployment: host.deployment },
						facts: {}
					})
				)
			),
		authenticated: Effect.asVoid(
			settled(h.commits.chainAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
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
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.chainClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: { ChainClaim: [{ step: row.step, root: row.root }], ChainEnded: row.lapsed }
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.chainRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { ChainEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.chainFence.once({
					params: {},
					facts: {
						insert: {
							ChainEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							ChainFenced: [row]
						}
					}
				})
			),
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
							ChainExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.chainFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) => settled(h.retirer.chainRetire.once({ params: { root }, facts: {} })),
		snapshot: Effect.flatMap(settled(h.den.chainSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof chain>> => {
				const view = (scope: Sha256, admission: Admission): ReadonlyArray<ScopeView> =>
					Option.match(
						Arr.findFirst(read.roots, (o) => Sha256.equals(o.scope, scope)),
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
					busy: [],
					awaiting: []
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
		appRequests: {
			Ordered: (key: string, input: Parameters<(typeof chain.kinds)[2]["start"]>[0]) =>
				pipe(rootScope("Chain", "Ordered", key), (scope) => ({
					flow: FlowName.make("Chain"),
					scope,
					params: {
						chainOrderedScope: scope,
						chainOrderedKey: key,
						chainOrderedChainScope: [{ scope, root: scope }],
						chainOrderedChainOrderedInput: [
							{ scope: scope, root: scope, feed: input.feed, pages: input.pages }
						]
					}
				}))
		}
	}
}
