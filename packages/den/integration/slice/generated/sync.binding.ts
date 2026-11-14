import {
	any,
	dueAt,
	exclusiveRows,
	fresh,
	one,
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
import type { Written } from "@bjornpagen/grizzle"
import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"
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
	readonly commits: {
		readonly [K in keyof typeof syncCommitPrograms]: MemberHandle<(typeof syncCommitPrograms)[K]>
	}
}

interface Rows {
	readonly SyncStep: ReadonlyArray<Written<typeof SyncStep>>
	readonly SyncDue: ReadonlyArray<Written<typeof SyncDue>>
	readonly SyncScope: ReadonlyArray<Written<typeof SyncScope>>
	readonly SyncWithin: ReadonlyArray<Written<typeof SyncWithin>>
	readonly SyncAdmitted: ReadonlyArray<Written<typeof SyncAdmitted>>
	readonly SyncFinish: ReadonlyArray<Written<typeof SyncFinish>>
	readonly SyncStartStep: ReadonlyArray<Written<typeof SyncStartStep>>
	readonly SyncStartScope: ReadonlyArray<Written<typeof SyncStartScope>>
	readonly SyncCopyInput: ReadonlyArray<Written<typeof SyncCopyInput>>
	readonly SyncBuildInput: ReadonlyArray<Written<typeof SyncBuildInput>>
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
							SyncStep: [{ step: key, kind: "Copy", scope: scope }],
							SyncDue: [{ step: key, at: dueAt(sync.kinds[0].due, at) }],
							SyncStartStep: [{ scope, ordinal: BigInt(ordinal), step: key }],
							SyncCopyInput: [{ step: key, relation: spawn.input.relation, run: spawn.input.run }]
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
							SyncStep: [{ step: key, kind: "Build", scope: scope }],
							SyncDue: [{ step: key, at: dueAt(sync.kinds[2].due, at) }],
							SyncStartStep: [{ scope, ordinal: BigInt(ordinal), step: key }],
							SyncBuildInput: [{ step: key, build: spawn.input.build }]
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
				h.den.syncReadSyncCopyInput.once({ params: { step: step }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ relation: found.relation, run: found.run }))
		})
	const readSyncBuildInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.syncReadSyncBuildInput.once({ params: { step: step }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ build: found.build }))
		})
	const readSyncSyncRunInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.syncReadSyncSyncRunInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ relation: found.relation, run: found.run }))
		})
	const readSyncGoldInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.syncReadSyncGoldInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ build: found.build }))
		})
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
		exclusiveTurns: Effect.map(
			h.coordinator.syncExclusiveTurns.once({ params: {}, facts: {} }),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ kind: row.kind, key: row.key, turn: row.turn }))
		),
		exclusives: Effect.map(h.coordinator.syncExclusives.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({
				kind: row.kind,
				key: row.key,
				turn: row.turn,
				scope: row.scope
			}))
		),
		pauseTurns: Effect.map(h.coordinator.syncPauseTurns.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		paused: Effect.map(h.coordinator.syncPausedAll.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		take: () => Effect.void,
		giveBack: () => Effect.void,
		holdExclusive: (row) =>
			Effect.asVoid(
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
			),
		releaseExclusive: (rows) =>
			Effect.asVoid(
				h.coordinator.syncReleaseExclusive.once({
					params: {},
					facts: { insert: { SyncReleased: exclusiveTurnsOf(rows) } }
				})
			),
		pause: (row) =>
			Effect.asVoid(
				h.coordinator.syncPause.once({
					params: {},
					facts: { insert: { SyncPaused: pausesOf([row]) } }
				})
			),
		resume: (row) =>
			Effect.asVoid(
				h.coordinator.syncResume.once({
					params: {},
					facts: { insert: { SyncResumed: pausesOf([row]) } }
				})
			)
	}
	const busyOf = (flow: string): Effect.Effect<boolean, CallError> => {
		switch (flow) {
			case "Chain":
				return any(h.den.syncBusyChain.once({ params: {}, facts: {} }))
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
								h.den.syncRequestSyncRun.once({
									params: {},
									facts: {
										insert: {
											SyncScope: [{ scope, kind: "SyncRun" as const }],
											SyncRoot: [{ scope, key, at }],
											SyncExclusiveKey: keys,
											SyncSyncRunInput: [{ scope: scope, relation: input.relation, run: input.run }]
										}
									}
								})
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
						h.den.syncRequestGold.once({
							params: {},
							facts: {
								insert: {
									SyncScope: [{ scope, kind: "Gold" as const }],
									SyncRoot: [{ scope, key, at }],
									SyncGoldInput: [{ scope: scope, build: input.build }]
								}
							}
						})
					),
					(accepted) => ({ scope, fresh: accepted })
				)
			)
	}
	const ledger: Ledger<FlowNeeds<typeof sync>> = {
		flow: FlowName.make("Sync"),
		resources: [],
		steps: new Map([
			[
				"Copy",
				runnerOf(
					sync.kinds[0],
					{
						input: (step) => readSyncCopyInput(step),
						read: () => Effect.succeed([]),
						commit: (done, _at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.succeed(nothingGrown)
								const outcome = yield* h.commits.syncCommitCopy.once({
									params: {},
									facts: {
										insert: {
											SyncResult: [{ step: done.turn.step, outcome: "done" }],
											SyncDone: [{ step: done.turn.step }],
											SyncHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											SyncCopyOutput: [{ step: done.turn.step, run: done.output.run }],
											Copied: done.writes.insert.Copied
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
				"Build",
				runnerOf(
					sync.kinds[2],
					{
						input: (step) => readSyncBuildInput(step),
						read: () => Effect.succeed([]),
						commit: (done, _at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.succeed(nothingGrown)
								const outcome = yield* h.commits.syncCommitBuild.once({
									params: {},
									facts: {
										insert: {
											SyncResult: [{ step: done.turn.step, outcome: "done" }],
											SyncDone: [{ step: done.turn.step }],
											SyncHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											SyncBuildOutput: [{ step: done.turn.step, build: done.output.build }],
											Built: done.writes.insert.Built
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
									h.den.syncStepOf.once({ params: { step }, facts: {} }),
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
								h.commits.syncCommitSyncRunFinish.once({
									params: {},
									facts: {
										insert: {
											SyncResult: [{ step: done.turn.step, outcome: "done" }],
											SyncDone: [{ step: done.turn.step }],
											SyncHeld: [{ step: done.turn.step, attempt: done.turn.attempt }]
										}
									}
								}),
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
									h.den.syncStepOf.once({ params: { step }, facts: {} }),
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
								h.commits.syncCommitGoldFinish.once({
									params: {},
									facts: {
										insert: {
											SyncResult: [{ step: done.turn.step, outcome: "done" }],
											SyncDone: [{ step: done.turn.step }],
											SyncHeld: [{ step: done.turn.step, attempt: done.turn.attempt }]
										}
									}
								}),
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
							const grown = yield* startSyncRun(scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Written<typeof SyncStep>> = [
								...grown.rows.SyncStep,
								{ step: finish, kind: "SyncRunFinish", scope }
							]
							const dues: ReadonlyArray<Written<typeof SyncDue>> = [
								...grown.rows.SyncDue,
								{ step: finish, at }
							]
							const admitted: ReadonlyArray<Written<typeof SyncAdmitted>> = [
								...grown.rows.SyncAdmitted,
								{ scope }
							]
							const finishes: ReadonlyArray<Written<typeof SyncFinish>> = [
								...grown.rows.SyncFinish,
								{ scope, step: finish }
							]
							const outcome = yield* h.den.syncAdmit.once({
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
							const grown = yield* startGold(scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Written<typeof SyncStep>> = [
								...grown.rows.SyncStep,
								{ step: finish, kind: "GoldFinish", scope }
							]
							const dues: ReadonlyArray<Written<typeof SyncDue>> = [
								...grown.rows.SyncDue,
								{ step: finish, at }
							]
							const admitted: ReadonlyArray<Written<typeof SyncAdmitted>> = [
								...grown.rows.SyncAdmitted,
								{ scope }
							]
							const finishes: ReadonlyArray<Written<typeof SyncFinish>> = [
								...grown.rows.SyncFinish,
								{ scope, step: finish }
							]
							const outcome = yield* h.den.syncAdmit.once({
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
			Effect.map(h.den.syncStepOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))
			),
		resultOf: (step) =>
			Effect.map(h.den.syncResultOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(h.den.syncHeldOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(h.den.syncDueOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) =>
			Effect.map(h.den.syncClaimsOf.once({ params: { step }, facts: {} }), rowsOf),
		retriesOf: (step) =>
			Effect.map(h.den.syncRetriesOf.once({ params: { step }, facts: {} }), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					h.den.syncScopeOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const parent = yield* Effect.map(
					h.den.syncWithinOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const admitted = yield* Effect.map(
					h.den.syncAdmittedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const skipped = yield* Effect.map(
					h.den.syncSkippedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const key = yield* Effect.map(
					h.den.syncExclusiveKeyOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const root = yield* Effect.map(
					h.den.syncRootOf.once({ params: { scope: scope }, facts: {} }),
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
			Effect.flatMap(any(h.den.syncUnendedSteps.once({ params: { scope }, facts: {} })), (steps) =>
				steps
					? Effect.succeed(true)
					: any(h.den.syncOpenChildren.once({ params: { scope }, facts: {} }))
			),
		finished: (scope) => any(h.den.syncFinished.once({ params: { scope }, facts: {} })),
		busy: busyOf,
		claim: (row) =>
			Effect.map(
				h.den.syncClaim.once({ params: {}, facts: { insert: { SyncClaim: [row] } } }),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) => h.den.syncRetry.once({ params: {}, facts: { insert: { SyncRetry: [row] } } }),
		refuse: (step, attempt, law) =>
			h.den.syncRefuse.once({
				params: {},
				facts: {
					insert: {
						SyncResult: [{ step, outcome: "failed" }],
						SyncFailed: [{ step }],
						SyncHeld: [{ step, attempt }],
						SyncRefusal: [{ step, law }]
					}
				}
			}),
		skip: (scope, by) =>
			h.den.syncSkip.once({ params: {}, facts: { insert: { SyncSkipped: [{ scope, by }] } } }),
		exhaust: (step, attempt) =>
			h.den.syncExhaust.once({
				params: {},
				facts: {
					insert: {
						SyncResult: [{ step, outcome: "failed" }],
						SyncFailed: [{ step }],
						SyncHeld: [{ step, attempt }],
						SyncExhausted: [{ step, attempts: attempt }]
					}
				}
			}),
		snapshot: Effect.gen(function* () {
			const steps = yield* Effect.map(h.den.syncPending.once({ params: {}, facts: {} }), rowsOf)
			const claims = yield* Effect.map(
				h.den.syncPendingClaims.once({ params: {}, facts: {} }),
				rowsOf
			)
			const retries = yield* Effect.map(
				h.den.syncPendingRetries.once({ params: {}, facts: {} }),
				rowsOf
			)
			const dues = yield* Effect.map(h.den.syncPendingDues.once({ params: {}, facts: {} }), rowsOf)
			const requested = yield* Effect.map(
				h.den.syncRequested.once({ params: {}, facts: {} }),
				rowsOf
			)
			const running = yield* Effect.map(h.den.syncRunning.once({ params: {}, facts: {} }), rowsOf)
			const withins = yield* Effect.map(h.den.syncWithins.once({ params: {}, facts: {} }), rowsOf)
			const roots = yield* Effect.map(h.den.syncRoots.once({ params: {}, facts: {} }), rowsOf)
			const keys = yield* Effect.map(
				h.den.syncExclusiveKeys.once({ params: {}, facts: {} }),
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
