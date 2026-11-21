import {
	any,
	committedFacts,
	dueOf,
	exclusiveRows,
	fresh,
	one,
	only,
	readingOf,
	rowsOf,
	signals,
	spawnedOf,
	type SpawnRows
} from "@bjornpagen/den/runtime/bind"
import {
	atOnce,
	finishStep,
	rootScope,
	type ScopeKey,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type {
	FlowNeeds,
	ExclusiveTurn,
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
/** The ledger port of the flow Sync over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import type { MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { sync } from "#integration/slice/flows.ts"
import { SyncRootKind, SyncPausable } from "#integration/slice/generated/sync.fragment.ts"
import type {
	SyncScope,
	SyncAdmitted,
	SyncFinish,
	SyncStartStep,
	SyncCopyInput,
	SyncBuildInput,
	SyncKind
} from "#integration/slice/generated/sync.fragment.ts"
import type {
	syncDenPrograms,
	syncCoordinatorPrograms,
	syncRetirerPrograms,
	syncCommitPrograms
} from "#integration/slice/generated/sync.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface SyncHandles {
	readonly den: {
		readonly [K in keyof typeof syncDenPrograms]: MemberHandle<(typeof syncDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof syncCoordinatorPrograms]: MemberHandle<
			(typeof syncCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof syncRetirerPrograms]: MemberHandle<(typeof syncRetirerPrograms)[K]>
	}
	readonly commits: {
		readonly [K in keyof typeof syncCommitPrograms]: MemberHandle<(typeof syncCommitPrograms)[K]>
	}
}

interface Rows {
	readonly SyncScope: ReadonlyArray<Addition<typeof SyncScope>>
	readonly SyncAdmitted: ReadonlyArray<Addition<typeof SyncAdmitted>>
	readonly SyncFinish: ReadonlyArray<Addition<typeof SyncFinish>>
	readonly SyncStartStep: ReadonlyArray<Addition<typeof SyncStartStep>>
	readonly SyncCopyInput: ReadonlyArray<Addition<typeof SyncCopyInput>>
	readonly SyncBuildInput: ReadonlyArray<Addition<typeof SyncBuildInput>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof SyncKind)["handles"][number]> {
	readonly rows: Rows
	readonly spawned: Spawned
}

const rootKindOf = (name: string): Option.Option<(typeof SyncRootKind)["handles"][number]> =>
	Arr.findFirst(SyncRootKind.handles, (handle) => handle === name)
const pausableOf = (
	target: string
): Effect.Effect<(typeof SyncPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(SyncPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Sync"), target })
	)
const exclusiveTurnsOf = (turns: ReadonlyArray<ExclusiveTurn>) =>
	Arr.flatMap(turns, (turn) =>
		Option.toArray(
			Option.map(rootKindOf(turn.kind), (kind) => ({ kind, key: turn.key, turn: turn.turn }))
		)
	)

/** The ledger of the flow Sync over its handles, with the requests of its roots. */
export const syncLedger = (h: SyncHandles) => {
	const noRows: Rows = {
		SyncScope: [],
		SyncAdmitted: [],
		SyncFinish: [],
		SyncStartStep: [],
		SyncCopyInput: [],
		SyncBuildInput: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.SyncStartStep, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			SyncScope: [...a.rows.SyncScope, ...b.rows.SyncScope],
			SyncAdmitted: [...a.rows.SyncAdmitted, ...b.rows.SyncAdmitted],
			SyncFinish: [...a.rows.SyncFinish, ...b.rows.SyncFinish],
			SyncStartStep: [...a.rows.SyncStartStep, ...b.rows.SyncStartStep],
			SyncCopyInput: [...a.rows.SyncCopyInput, ...b.rows.SyncCopyInput],
			SyncBuildInput: [...a.rows.SyncBuildInput, ...b.rows.SyncBuildInput]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startSyncRun = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof sync.kinds)[1]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				sync.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							SyncStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							SyncCopyInput: [
								{ step: key, root: root, relation: spawn.input.relation, run: spawn.input.run }
							]
						},
						...spawnedOf(
							{ step: key, kind: "Copy", scope: scope },
							dueOf(sync.kinds[0].due, spawn.input)
						)
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const startGold = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof sync.kinds)[3]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				sync.kinds[3].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							SyncStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							SyncBuildInput: [{ step: key, root: root, build: spawn.input.build }]
						},
						...spawnedOf(
							{ step: key, kind: "Build", scope: scope },
							dueOf(sync.kinds[2].due, spawn.input)
						)
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readSyncCopyInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.syncReadSyncCopyInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ relation: found.relation, run: found.run }))
		})
	const readSyncBuildInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.syncReadSyncBuildInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ build: found.build }))
		})
	const readSyncSyncRunInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.syncReadSyncSyncRunInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ relation: found.relation, run: found.run }))
		})
	const readSyncGoldInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.syncReadSyncGoldInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ build: found.build }))
		})
	const pauseChains: PauseChains<(typeof SyncPausable)["handles"][number]> = {
		flow: FlowName.make("Sync"),
		turns: Effect.map(
			settled(h.coordinator.syncPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(settled(h.coordinator.syncPausedAll.once({ params: {}, facts: {} })), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.syncPause.once({ params: {}, facts: { insert: { SyncPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.syncResume.once({ params: {}, facts: { insert: { SyncResumed: [row] } } })
				)
			)
	}
	const coordination: Ledger<never>["coordination"] = {
		exclusiveTurns: Effect.map(
			settled(h.coordinator.syncExclusiveTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ kind: row.kind, key: row.key, turn: row.turn }))
		),
		exclusives: Effect.map(
			settled(h.coordinator.syncExclusives.once({ params: {}, facts: {} })),
			(rows) =>
				Arr.map(rowsOf(rows), (row) => ({
					kind: row.kind,
					key: row.key,
					turn: row.turn,
					scope: row.scope
				}))
		),
		paused: pauseChains.live,
		holdExclusive: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.syncHoldExclusive.once({
						params: {},
						facts: {
							insert: {
								SyncExclusive: Arr.flatMap(exclusiveTurnsOf([row]), (turn) => [
									{ ...turn, scope: row.scope }
								])
							}
						}
					})
				)
			),
		releaseExclusive: (rows) =>
			Effect.asVoid(
				settled(
					h.coordinator.syncReleaseExclusive.once({
						params: {},
						facts: { insert: { SyncReleased: exclusiveTurnsOf(rows) } }
					})
				)
			),
		pause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),
		resume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))
	}
	const busyOf = (read: { readonly busyChain: ReadonlyArray<unknown> }): ReadonlyArray<string> =>
		Arr.filter(["Chain"] as const, (flow) => Arr.isReadonlyArrayNonEmpty(read[`busy${flow}`]))
	const request = {
		SyncRun: (key: string, input: Parameters<(typeof sync.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Sync", "SyncRun", key), (scope) =>
				Effect.flatMap(
					exclusiveRows("Sync", "SyncRun", sync.kinds[1].exclusive, input, scope),
					(keys) =>
						Effect.map(
							fresh(
								"Sync",
								settled(
									h.den.syncRequestSyncRun.once({
										params: { syncSyncRunScope: scope, syncSyncRunKey: key },
										facts: {
											insert: {
												SyncScope: [{ scope, root: scope }],
												SyncExclusiveKey: Arr.map(keys, (k) => ({ ...k, root: scope })),
												SyncSyncRunInput: [
													{ scope: scope, root: scope, relation: input.relation, run: input.run }
												]
											}
										}
									})
								)
							),
							(accepted) => ({ flow: FlowName.make("Sync"), scope, fresh: accepted })
						)
				)
			),
		Gold: (key: string, input: Parameters<(typeof sync.kinds)[3]["start"]>[0]) =>
			Effect.flatMap(rootScope("Sync", "Gold", key), (scope) =>
				Effect.map(
					fresh(
						"Sync",
						settled(
							h.den.syncRequestGold.once({
								params: { syncGoldScope: scope, syncGoldKey: key },
								facts: {
									insert: {
										SyncScope: [{ scope, root: scope }],
										SyncGoldInput: [{ scope: scope, root: scope, build: input.build }]
									}
								}
							})
						)
					),
					(accepted) => ({ flow: FlowName.make("Sync"), scope, fresh: accepted })
				)
			)
	}
	const runners = {
		Copy: runnerOf(
			sync.kinds[0],
			{
				input: (step) => readSyncCopyInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.syncCommitCopy.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											SyncResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
											SyncDone: [{ step: done.turn.step, root: done.turn.root }],
											SyncHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											SyncCopyOutput: [
												{ step: done.turn.step, root: done.turn.root, run: done.output.run }
											]
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
		Build: runnerOf(
			sync.kinds[2],
			{
				input: (step) => readSyncBuildInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.syncCommitBuild.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											SyncResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
											SyncDone: [{ step: done.turn.step, root: done.turn.root }],
											SyncHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											SyncBuildOutput: [
												{ step: done.turn.step, root: done.turn.root, build: done.output.build }
											]
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
		SyncRunFinish: runnerOf(
			{
				name: "SyncRunFinish",
				uses: sync.kinds[1].finish.uses,
				retry: sync.kinds[1].finish.retry,
				waits: sync.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof sync.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof sync.kinds)[1]["finish"]["body"]>[1]
				}) => sync.kinds[1].finish.body(read.input, read.endings)
			},
			{
				input: (step) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.syncStepOf.once({ params: { step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readSyncSyncRunInput(scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						return Option.some({ input: input.value, endings: {} })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.syncCommitSyncRunFinish.once({
								params: {},
								facts: {
									insert: {
										SyncResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										SyncDone: [{ step: done.turn.step, root: done.turn.root }],
										SyncHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										SyncSyncRunFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
									}
								}
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("SyncRun")
		),
		GoldFinish: runnerOf(
			{
				name: "GoldFinish",
				uses: sync.kinds[3].finish.uses,
				retry: sync.kinds[3].finish.retry,
				waits: sync.kinds[3].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof sync.kinds)[3]["start"]>[0]
					readonly endings: Parameters<(typeof sync.kinds)[3]["finish"]["body"]>[1]
				}) => sync.kinds[3].finish.body(read.input, read.endings)
			},
			{
				input: (step) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.syncStepOf.once({ params: { step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readSyncGoldInput(scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						return Option.some({ input: input.value, endings: {} })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.syncCommitGoldFinish.once({
								params: {},
								facts: {
									insert: {
										SyncResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										SyncDone: [{ step: done.turn.step, root: done.turn.root }],
										SyncHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										SyncGoldFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
									}
								}
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Gold")
		)
	}
	const roots: { readonly [K in (typeof SyncRootKind)["handles"][number]]: RootRunner } = {
		SyncRun: {
			window: sync.kinds[1].window,
			precondition: sync.kinds[1].precondition,
			admit: (scope: ScopeKey) =>
				Effect.gen(function* () {
					const input = yield* readSyncSyncRunInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startSyncRun(scope, scope, input.value)
					const finish = yield* finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "SyncRunFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof SyncAdmitted>> = [
						...grown.rows.SyncAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof SyncFinish>> = [
						...grown.rows.SyncFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.syncAdmit.once({
							params: { steps, root: scope },
							facts: {
								insert: {
									SyncScope: grown.rows.SyncScope,
									SyncStartStep: grown.rows.SyncStartStep,
									SyncCopyInput: grown.rows.SyncCopyInput,
									SyncBuildInput: grown.rows.SyncBuildInput,
									SyncAdmitted: admitted,
									SyncFinish: finishes
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
		Gold: {
			window: sync.kinds[3].window,
			precondition: sync.kinds[3].precondition,
			admit: (scope: ScopeKey) =>
				Effect.gen(function* () {
					const input = yield* readSyncGoldInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startGold(scope, scope, input.value)
					const finish = yield* finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "GoldFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof SyncAdmitted>> = [
						...grown.rows.SyncAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof SyncFinish>> = [
						...grown.rows.SyncFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.syncAdmit.once({
							params: { steps, root: scope },
							facts: {
								insert: {
									SyncScope: grown.rows.SyncScope,
									SyncStartStep: grown.rows.SyncStartStep,
									SyncCopyInput: grown.rows.SyncCopyInput,
									SyncBuildInput: grown.rows.SyncBuildInput,
									SyncAdmitted: admitted,
									SyncFinish: finishes
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
	const ledger: Ledger<FlowNeeds<typeof sync>> = {
		flow: FlowName.make("Sync"),
		now: Effect.flatMap(settled(h.den.syncNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.syncAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (step) =>
			Effect.map(settled(h.den.syncStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.syncResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.syncHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.syncClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.syncRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.syncFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.syncRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.syncAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.syncSkippedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const key = yield* Effect.map(
					settled(h.den.syncExclusiveKeyOf.once({ params: { scope: scope }, facts: {} })),
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
					exclusive: Option.map(key, (k) => k.id),
					runner: roots[root.value.kind]
				})
			}),
		unended: (scope) =>
			h.den.syncUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
		finished: (scope) =>
			h.den.syncFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.flatMap(settled(h.den.syncBusy.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), busyOf)
		),
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.syncClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: { SyncClaim: [{ step: row.step, root: row.root }], SyncEnded: row.lapsed }
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.syncRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { SyncEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.syncFence.once({
					params: {},
					facts: {
						insert: {
							SyncEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							SyncFenced: [row]
						}
					}
				})
			),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.syncRefuse.once({
					params: {},
					facts: {
						insert: {
							SyncResult: [{ step, root, outcome: "failed" }],
							SyncFailed: [{ step, root }],
							SyncHeld: [{ step, root, attempt }],
							SyncRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.syncSkip.once({
					params: {},
					facts: { insert: { SyncSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.syncExhaust.once({
					params: {},
					facts: {
						insert: {
							SyncResult: [{ step, root, outcome: "failed" }],
							SyncFailed: [{ step, root }],
							SyncHeld: [{ step, root, attempt }],
							SyncExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.syncFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) =>
			settled(
				h.retirer.syncRetire.once({
					params: {},
					facts: { retire: { SyncRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.flatMap(settled(h.den.syncSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof sync>> => {
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
									exclusive: Option.map(
										Arr.findFirst(read.keys, (k) => k.scope === scope),
										(k) => k.id
									),
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
					exclusives: read.exclusives,
					paused: Arr.map(read.paused, (row) => row.target),
					busy: busyOf(read),
					awaiting: []
				}
			})
		),
		changes: Stream.mergeAll(
			[
				signals(h.den.syncPending.watch({ params: {}, facts: {} })),
				signals(h.den.syncRequested.watch({ params: {}, facts: {} })),
				signals(h.den.syncRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.syncExclusives.watch({ params: {}, facts: {} })),
				signals(h.coordinator.syncPausedAll.watch({ params: {}, facts: {} })),
				signals(h.den.syncBusyChain.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: []
	}
	return {
		ledger,
		request,
		requestFacts: {}
	}
}
