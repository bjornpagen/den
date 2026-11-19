import {
	any,
	dueAt,
	exclusiveRows,
	fresh,
	one,
	readingOf,
	rowsOf,
	scheduleOf,
	signals
} from "@bjornpagen/den/runtime/bind"
import {
	finishStep,
	type Instant,
	rootScope,
	type ScopeKey,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type {
	FlowNeeds,
	ExclusiveTurn,
	Ledger,
	PauseRow,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Sync over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, type Settled, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { sync } from "#integration/slice/flows.ts"
import { SyncJoin, SyncPausable } from "#integration/slice/generated/sync.fragment.ts"
import type {
	SyncStep,
	SyncDue,
	SyncScope,
	SyncWithin,
	SyncAdmitted,
	SyncFinish,
	SyncStartStep,
	SyncStartScope,
	SyncCopyInput,
	SyncBuildInput
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
	readonly SyncStep: ReadonlyArray<Addition<typeof SyncStep>>
	readonly SyncDue: ReadonlyArray<Addition<typeof SyncDue>>
	readonly SyncScope: ReadonlyArray<Addition<typeof SyncScope>>
	readonly SyncWithin: ReadonlyArray<Addition<typeof SyncWithin>>
	readonly SyncAdmitted: ReadonlyArray<Addition<typeof SyncAdmitted>>
	readonly SyncFinish: ReadonlyArray<Addition<typeof SyncFinish>>
	readonly SyncStartStep: ReadonlyArray<Addition<typeof SyncStartStep>>
	readonly SyncStartScope: ReadonlyArray<Addition<typeof SyncStartScope>>
	readonly SyncCopyInput: ReadonlyArray<Addition<typeof SyncCopyInput>>
	readonly SyncBuildInput: ReadonlyArray<Addition<typeof SyncBuildInput>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const joinOf = (name: string): Option.Option<(typeof SyncJoin)["handles"][number]> =>
	Arr.findFirst(SyncJoin.handles, (handle) => handle === name)
const pausableOf = (name: string): Option.Option<(typeof SyncPausable)["handles"][number]> =>
	Arr.findFirst(SyncPausable.handles, (handle) => handle === name)
const exclusiveTurnsOf = (turns: ReadonlyArray<ExclusiveTurn>) =>
	Arr.flatMap(turns, (turn) =>
		Option.toArray(
			Option.map(joinOf(turn.kind), (kind) => ({ kind, key: turn.key, turn: turn.turn }))
		)
	)
const pausesOf = (rows: ReadonlyArray<PauseRow>) =>
	Arr.flatMap(rows, (row) =>
		Option.toArray(Option.map(pausableOf(row.target), (target) => ({ target, turn: row.turn })))
	)

/** The ledger of the flow Sync over its handles, with the requests of its roots. */
export const syncLedger = (h: SyncHandles) => {
	const noRows: Rows = {
		SyncStep: [],
		SyncDue: [],
		SyncScope: [],
		SyncWithin: [],
		SyncAdmitted: [],
		SyncFinish: [],
		SyncStartStep: [],
		SyncStartScope: [],
		SyncCopyInput: [],
		SyncBuildInput: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.SyncStartStep, (s) => s.scope === scope) ||
		Arr.some(grown.rows.SyncStartScope, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			SyncStep: [...a.rows.SyncStep, ...b.rows.SyncStep],
			SyncDue: [...a.rows.SyncDue, ...b.rows.SyncDue],
			SyncScope: [...a.rows.SyncScope, ...b.rows.SyncScope],
			SyncWithin: [...a.rows.SyncWithin, ...b.rows.SyncWithin],
			SyncAdmitted: [...a.rows.SyncAdmitted, ...b.rows.SyncAdmitted],
			SyncFinish: [...a.rows.SyncFinish, ...b.rows.SyncFinish],
			SyncStartStep: [...a.rows.SyncStartStep, ...b.rows.SyncStartStep],
			SyncStartScope: [...a.rows.SyncStartScope, ...b.rows.SyncStartScope],
			SyncCopyInput: [...a.rows.SyncCopyInput, ...b.rows.SyncCopyInput],
			SyncBuildInput: [...a.rows.SyncBuildInput, ...b.rows.SyncBuildInput]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startSyncRun = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof sync.kinds)[1]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				sync.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							SyncStep: [{ step: key, kind: "Copy", scope: scope, root: root }],
							SyncDue: [{ step: key, at: dueAt(sync.kinds[0].due, at), root: root }],
							SyncStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							SyncCopyInput: [
								{ step: key, root: root, relation: spawn.input.relation, run: spawn.input.run }
							]
						},
						spawned: {
							steps: [{ step: key, kind: "Copy", due: dueAt(sync.kinds[0].due, at) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const startGold = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof sync.kinds)[3]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				sync.kinds[3].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							SyncStep: [{ step: key, kind: "Build", scope: scope, root: root }],
							SyncDue: [{ step: key, at: dueAt(sync.kinds[2].due, at), root: root }],
							SyncStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							SyncBuildInput: [{ step: key, root: root, build: spawn.input.build }]
						},
						spawned: {
							steps: [{ step: key, kind: "Build", due: dueAt(sync.kinds[2].due, at) }],
							finishes: []
						}
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
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
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
		pauseTurns: Effect.map(
			settled(h.coordinator.syncPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		paused: Effect.map(
			settled(h.coordinator.syncPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		take: () => Effect.void,
		giveBack: () => Effect.void,
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
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.syncPause.once({
						params: {},
						facts: { insert: { SyncPaused: pausesOf([row]) } }
					})
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.syncResume.once({
						params: {},
						facts: { insert: { SyncResumed: pausesOf([row]) } }
					})
				)
			)
	}
	const busyOf = (flow: string): Effect.Effect<boolean, Settled> => {
		switch (flow) {
			case "Chain":
				return h.den.syncBusyChain.once({ params: {}, facts: {} }).pipe(settled, any)
			default:
				return Effect.succeed(false)
		}
	}
	const request = {
		SyncRun: (key: string, at: Instant, input: Parameters<(typeof sync.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Sync", "SyncRun", key), (scope) =>
				Effect.flatMap(
					exclusiveRows("Sync", "SyncRun", sync.kinds[1].exclusive, input, scope),
					(keys) =>
						Effect.map(
							fresh(
								"Sync",
								settled(
									h.den.syncRequestSyncRun.once({
										params: {},
										facts: {
											insert: {
												SyncScope: [{ scope, kind: "SyncRun" as const, root: scope }],
												SyncRoot: [{ scope, key, at }],
												SyncExclusiveKey: Arr.map(keys, (k) => ({ ...k, root: scope })),
												SyncSyncRunInput: [
													{ scope: scope, root: scope, relation: input.relation, run: input.run }
												]
											}
										}
									})
								)
							),
							(accepted) => ({ scope, fresh: accepted })
						)
				)
			),
		Gold: (key: string, at: Instant, input: Parameters<(typeof sync.kinds)[3]["start"]>[0]) =>
			Effect.flatMap(rootScope("Sync", "Gold", key), (scope) =>
				Effect.map(
					fresh(
						"Sync",
						settled(
							h.den.syncRequestGold.once({
								params: {},
								facts: {
									insert: {
										SyncScope: [{ scope, kind: "Gold" as const, root: scope }],
										SyncRoot: [{ scope, key, at }],
										SyncGoldInput: [{ scope: scope, root: scope, build: input.build }]
									}
								}
							})
						)
					),
					(accepted) => ({ scope, fresh: accepted })
				)
			)
	}
	const ledger: Ledger<FlowNeeds<typeof sync>> = {
		flow: FlowName.make("Sync"),
		now: Effect.flatMap(settled(h.den.syncNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.syncAuthenticated.once({ params: {}, facts: {} }))
		),
		resources: [],
		steps: new Map([
			[
				"Copy",
				runnerOf(
					sync.kinds[0],
					{
						input: (step) => readSyncCopyInput(step),
						read: () => Effect.succeed({}),
						commit: (done, _at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.succeed(nothingGrown)
								const outcome = yield* settled(
									h.commits.syncCommitCopy.once({
										params: {},
										facts: {
											insert: {
												SyncResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												SyncDone: [{ step: done.turn.step, root: done.turn.root }],
												SyncHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												],
												SyncCopyOutput: [
													{ step: done.turn.step, root: done.turn.root, run: done.output.run }
												],
												Copied: done.writes.insert.Copied
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
				"Build",
				runnerOf(
					sync.kinds[2],
					{
						input: (step) => readSyncBuildInput(step),
						read: () => Effect.succeed({}),
						commit: (done, _at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.succeed(nothingGrown)
								const outcome = yield* settled(
									h.commits.syncCommitBuild.once({
										params: {},
										facts: {
											insert: {
												SyncResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												SyncDone: [{ step: done.turn.step, root: done.turn.root }],
												SyncHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												],
												SyncBuildOutput: [
													{ step: done.turn.step, root: done.turn.root, build: done.output.build }
												],
												Built: done.writes.insert.Built
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
				"SyncRunFinish",
				runnerOf(
					{
						name: "SyncRunFinish",
						uses: [],
						retry: sync.kinds[1].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof sync.kinds)[1]["start"]>[0]
							readonly endings: Parameters<(typeof sync.kinds)[1]["finish"]["body"]>[1]
						}) =>
							Effect.map(sync.kinds[1].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
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
							Effect.map(
								settled(
									h.commits.syncCommitSyncRunFinish.once({
										params: {},
										facts: {
											insert: {
												SyncResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												SyncDone: [{ step: done.turn.step, root: done.turn.root }],
												SyncHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												]
											}
										}
									})
								),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("SyncRun")
				)
			],
			[
				"GoldFinish",
				runnerOf(
					{
						name: "GoldFinish",
						uses: [],
						retry: sync.kinds[3].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof sync.kinds)[3]["start"]>[0]
							readonly endings: Parameters<(typeof sync.kinds)[3]["finish"]["body"]>[1]
						}) =>
							Effect.map(sync.kinds[3].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
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
							Effect.map(
								settled(
									h.commits.syncCommitGoldFinish.once({
										params: {},
										facts: {
											insert: {
												SyncResult: [
													{ step: done.turn.step, root: done.turn.root, outcome: "done" }
												],
												SyncDone: [{ step: done.turn.step, root: done.turn.root }],
												SyncHeld: [
													{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
												]
											}
										}
									})
								),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("Gold")
				)
			]
		]),
		roots: new Map([
			[
				"SyncRun",
				{
					kind: "SyncRun",
					exclusive: true,
					window: sync.kinds[1].window,
					precondition: sync.kinds[1].precondition,
					finish: "SyncRunFinish",
					admit: (scope: ScopeKey, at: Instant) =>
						Effect.gen(function* () {
							const input = yield* readSyncSyncRunInput(scope)
							if (Option.isNone(input)) {
								return Option.none()
							}
							const grown = yield* startSyncRun(scope, scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Addition<typeof SyncStep>> = [
								...grown.rows.SyncStep,
								{ step: finish, kind: "SyncRunFinish", scope, root: scope }
							]
							const dues: ReadonlyArray<Addition<typeof SyncDue>> = [
								...grown.rows.SyncDue,
								{ step: finish, at, root: scope }
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
									params: {},
									facts: {
										insert: {
											SyncScope: grown.rows.SyncScope,
											SyncWithin: grown.rows.SyncWithin,
											SyncStartStep: grown.rows.SyncStartStep,
											SyncStartScope: grown.rows.SyncStartScope,
											SyncCopyInput: grown.rows.SyncCopyInput,
											SyncBuildInput: grown.rows.SyncBuildInput,
											SyncStep: steps,
											SyncDue: dues,
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
				"Gold",
				{
					kind: "Gold",
					exclusive: false,
					window: sync.kinds[3].window,
					precondition: sync.kinds[3].precondition,
					finish: "GoldFinish",
					admit: (scope: ScopeKey, at: Instant) =>
						Effect.gen(function* () {
							const input = yield* readSyncGoldInput(scope)
							if (Option.isNone(input)) {
								return Option.none()
							}
							const grown = yield* startGold(scope, scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Addition<typeof SyncStep>> = [
								...grown.rows.SyncStep,
								{ step: finish, kind: "GoldFinish", scope, root: scope }
							]
							const dues: ReadonlyArray<Addition<typeof SyncDue>> = [
								...grown.rows.SyncDue,
								{ step: finish, at, root: scope }
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
									params: {},
									facts: {
										insert: {
											SyncScope: grown.rows.SyncScope,
											SyncWithin: grown.rows.SyncWithin,
											SyncStartStep: grown.rows.SyncStartStep,
											SyncStartScope: grown.rows.SyncStartScope,
											SyncCopyInput: grown.rows.SyncCopyInput,
											SyncBuildInput: grown.rows.SyncBuildInput,
											SyncStep: steps,
											SyncDue: dues,
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
			Effect.map(settled(h.den.syncStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope, root: row.root }))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.syncResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.syncHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(settled(h.den.syncDueOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.syncClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.syncRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.syncFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					settled(h.den.syncScopeOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const parent = yield* Effect.map(
					settled(h.den.syncWithinOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
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
				const root = yield* Effect.map(
					settled(h.den.syncRootOf.once({ params: { scope: scope }, facts: {} })),
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
			Effect.flatMap(
				h.den.syncUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
				(steps) =>
					steps
						? Effect.succeed(true)
						: h.den.syncOpenChildren.once({ params: { scope }, facts: {} }).pipe(settled, any)
			),
		finished: (scope) =>
			h.den.syncFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: busyOf,
		claim: (row) =>
			Effect.map(
				settled(h.den.syncClaim.once({ params: {}, facts: { insert: { SyncClaim: [row] } } })),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) =>
			settled(h.den.syncRetry.once({ params: {}, facts: { insert: { SyncRetry: [row] } } })),
		fence: (row) =>
			settled(h.den.syncFence.once({ params: {}, facts: { insert: { SyncFenced: [row] } } })),
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
							SyncExhausted: [{ step, root, attempts: attempt }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.syncFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ scope: row.scope, kind: row.kind, at: row.at }))
		),
		retire: (root) =>
			settled(
				h.retirer.syncRetire.once({
					params: {},
					facts: { retire: { SyncRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.gen(function* () {
			const steps = yield* Effect.map(
				settled(h.den.syncPending.once({ params: {}, facts: {} })),
				rowsOf
			)
			const claims = yield* Effect.map(
				settled(h.den.syncPendingClaims.once({ params: {}, facts: {} })),
				rowsOf
			)
			const retries = yield* Effect.map(
				settled(h.den.syncPendingRetries.once({ params: {}, facts: {} })),
				rowsOf
			)
			const fenced = yield* Effect.map(
				settled(h.den.syncPendingFenced.once({ params: {}, facts: {} })),
				rowsOf
			)
			const dues = yield* Effect.map(
				settled(h.den.syncPendingDues.once({ params: {}, facts: {} })),
				rowsOf
			)
			const requested = yield* Effect.map(
				settled(h.den.syncRequested.once({ params: {}, facts: {} })),
				rowsOf
			)
			const running = yield* Effect.map(
				settled(h.den.syncRunning.once({ params: {}, facts: {} })),
				rowsOf
			)
			const withins = yield* Effect.map(
				settled(h.den.syncWithins.once({ params: {}, facts: {} })),
				rowsOf
			)
			const roots = yield* Effect.map(
				settled(h.den.syncRoots.once({ params: {}, facts: {} })),
				rowsOf
			)
			const keys = yield* Effect.map(
				settled(h.den.syncExclusiveKeys.once({ params: {}, facts: {} })),
				rowsOf
			)
			const holds = yield* coordination.holds
			const exclusives = yield* coordination.exclusives
			const paused = yield* Effect.map(
				coordination.paused,
				Arr.map((row) => row.target)
			)
			const busy = yield* Effect.filter(["Chain"], (flow) => busyOf(flow))
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
		scheduled: [
			...Option.toArray(
				Option.map(scheduleOf(sync.kinds[1].trigger), (s) => ({
					kind: "SyncRun",
					cron: s.cron,
					request: (at: Instant) => request.SyncRun(String(at), at, s.input(at))
				}))
			),
			...Option.toArray(
				Option.map(scheduleOf(sync.kinds[3].trigger), (s) => ({
					kind: "Gold",
					cron: s.cron,
					request: (at: Instant) => request.Gold(String(at), at, s.input(at))
				}))
			)
		]
	}
	return {
		ledger,
		request,
		requestFacts: {}
	}
}
