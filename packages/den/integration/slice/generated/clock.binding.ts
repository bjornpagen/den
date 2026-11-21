import {
	any,
	committedFacts,
	dueOf,
	fresh,
	one,
	only,
	readingOf,
	rowsOf,
	scheduledKey,
	scheduleOf,
	signals,
	spawnedOf,
	type SpawnRows
} from "@bjornpagen/den/runtime/bind"
import {
	atOnce,
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
/** The ledger port of the flow Clock over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { clock } from "#integration/slice/flows.ts"
import { ClockPausable } from "#integration/slice/generated/clock.fragment.ts"
import type {
	ClockScope,
	ClockAdmitted,
	ClockFinish,
	ClockStartStep,
	ClockChimeInput,
	ClockCloseInput,
	ClockKind,
	ClockRootKind
} from "#integration/slice/generated/clock.fragment.ts"
import type {
	clockDenPrograms,
	clockCoordinatorPrograms,
	clockRetirerPrograms,
	clockCommitPrograms
} from "#integration/slice/generated/clock.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface ClockHandles {
	readonly den: {
		readonly [K in keyof typeof clockDenPrograms]: MemberHandle<(typeof clockDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof clockCoordinatorPrograms]: MemberHandle<
			(typeof clockCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof clockRetirerPrograms]: MemberHandle<
			(typeof clockRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof clockCommitPrograms]: MemberHandle<(typeof clockCommitPrograms)[K]>
	}
}

interface Rows {
	readonly ClockScope: ReadonlyArray<Addition<typeof ClockScope>>
	readonly ClockAdmitted: ReadonlyArray<Addition<typeof ClockAdmitted>>
	readonly ClockFinish: ReadonlyArray<Addition<typeof ClockFinish>>
	readonly ClockStartStep: ReadonlyArray<Addition<typeof ClockStartStep>>
	readonly ClockChimeInput: ReadonlyArray<Addition<typeof ClockChimeInput>>
	readonly ClockCloseInput: ReadonlyArray<Addition<typeof ClockCloseInput>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof ClockKind)["handles"][number]> {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof ClockPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(ClockPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Clock"), target })
	)

/** The ledger of the flow Clock over its handles, with the requests of its roots. */
export const clockLedger = (h: ClockHandles) => {
	const noRows: Rows = {
		ClockScope: [],
		ClockAdmitted: [],
		ClockFinish: [],
		ClockStartStep: [],
		ClockChimeInput: [],
		ClockCloseInput: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.ClockStartStep, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ClockScope: [...a.rows.ClockScope, ...b.rows.ClockScope],
			ClockAdmitted: [...a.rows.ClockAdmitted, ...b.rows.ClockAdmitted],
			ClockFinish: [...a.rows.ClockFinish, ...b.rows.ClockFinish],
			ClockStartStep: [...a.rows.ClockStartStep, ...b.rows.ClockStartStep],
			ClockChimeInput: [...a.rows.ClockChimeInput, ...b.rows.ClockChimeInput],
			ClockCloseInput: [...a.rows.ClockCloseInput, ...b.rows.ClockCloseInput]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startHourly = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof clock.kinds)[1]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				clock.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							ClockStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							ClockChimeInput: [
								{ step: key, root: root, hour: spawn.input.hour, bell: spawn.input.bell }
							]
						},
						...spawnedOf(
							{ step: key, kind: "Chime", scope: scope },
							dueOf(clock.kinds[0].due, spawn.input)
						)
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const startSitting = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof clock.kinds)[3]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				clock.kinds[3].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							ClockStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							ClockCloseInput: [
								{
									step: key,
									root: root,
									sitting: spawn.input.sitting,
									deadline: spawn.input.deadline
								}
							]
						},
						...spawnedOf(
							{ step: key, kind: "Close", scope: scope },
							dueOf(clock.kinds[2].due, spawn.input)
						)
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readClockChimeInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.clockReadClockChimeInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ hour: found.hour, bell: found.bell }))
		})
	const readClockCloseInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.clockReadClockCloseInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ sitting: found.sitting, deadline: found.deadline }))
		})
	const readClockHourlyInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.clockReadClockHourlyInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ hour: found.hour, bell: found.bell }))
		})
	const readClockSittingInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.clockReadClockSittingInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ sitting: found.sitting, deadline: found.deadline }))
		})
	const pauseChains: PauseChains<(typeof ClockPausable)["handles"][number]> = {
		flow: FlowName.make("Clock"),
		turns: Effect.map(
			settled(h.coordinator.clockPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.clockPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.clockPause.once({ params: {}, facts: { insert: { ClockPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.clockResume.once({ params: {}, facts: { insert: { ClockResumed: [row] } } })
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
		Hourly: (key: string, input: Parameters<(typeof clock.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Clock", "Hourly", key), (scope) =>
				Effect.map(
					fresh(
						"Clock",
						settled(
							h.den.clockRequestHourly.once({
								params: { clockHourlyScope: scope, clockHourlyKey: key },
								facts: {
									insert: {
										ClockScope: [{ scope, root: scope }],
										ClockHourlyInput: [
											{ scope: scope, root: scope, hour: input.hour, bell: input.bell }
										]
									}
								}
							})
						)
					),
					(accepted) => ({ flow: FlowName.make("Clock"), scope, fresh: accepted })
				)
			),
		Sitting: (key: string, input: Parameters<(typeof clock.kinds)[3]["start"]>[0]) =>
			Effect.flatMap(rootScope("Clock", "Sitting", key), (scope) =>
				Effect.map(
					fresh(
						"Clock",
						settled(
							h.den.clockRequestSitting.once({
								params: { clockSittingScope: scope, clockSittingKey: key },
								facts: {
									insert: {
										ClockScope: [{ scope, root: scope }],
										ClockSittingInput: [
											{
												scope: scope,
												root: scope,
												sitting: input.sitting,
												deadline: input.deadline
											}
										]
									}
								}
							})
						)
					),
					(accepted) => ({ flow: FlowName.make("Clock"), scope, fresh: accepted })
				)
			)
	}
	const runners = {
		Chime: runnerOf(
			clock.kinds[0],
			{
				input: (step) => readClockChimeInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.clockCommitChime.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ClockResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ClockDone: [{ step: done.turn.step, root: done.turn.root }],
											ClockHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											ClockChimeOutput: [
												{
													step: done.turn.step,
													root: done.turn.root,
													hour: done.output.hour,
													bell: done.output.bell
												}
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
		Close: runnerOf(
			clock.kinds[2],
			{
				input: (step) => readClockCloseInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.clockCommitClose.once({
								params: {},
								facts: {
									insert: {
										ClockResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										ClockDone: [{ step: done.turn.step, root: done.turn.root }],
										ClockHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										ClockCloseOutput: [
											{
												step: done.turn.step,
												root: done.turn.root,
												sitting: done.output.sitting,
												deadline: done.output.deadline
											}
										]
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
		HourlyFinish: runnerOf(
			{
				name: "HourlyFinish",
				uses: clock.kinds[1].finish.uses,
				retry: clock.kinds[1].finish.retry,
				waits: clock.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof clock.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof clock.kinds)[1]["finish"]["body"]>[1]
				}) => clock.kinds[1].finish.body(read.input, read.endings)
			},
			{
				input: (step) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.clockStepOf.once({ params: { step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readClockHourlyInput(scope)
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
							h.commits.clockCommitHourlyFinish.once({
								params: {},
								facts: {
									insert: {
										ClockResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										ClockDone: [{ step: done.turn.step, root: done.turn.root }],
										ClockHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										ClockHourlyFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
									}
								}
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Hourly")
		),
		SittingFinish: runnerOf(
			{
				name: "SittingFinish",
				uses: clock.kinds[3].finish.uses,
				retry: clock.kinds[3].finish.retry,
				waits: clock.kinds[3].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof clock.kinds)[3]["start"]>[0]
					readonly endings: Parameters<(typeof clock.kinds)[3]["finish"]["body"]>[1]
				}) => clock.kinds[3].finish.body(read.input, read.endings)
			},
			{
				input: (step) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.clockStepOf.once({ params: { step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readClockSittingInput(scope)
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
							h.commits.clockCommitSittingFinish.once({
								params: {},
								facts: {
									insert: {
										ClockResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										ClockDone: [{ step: done.turn.step, root: done.turn.root }],
										ClockHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										ClockSittingFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
									}
								}
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Sitting")
		)
	}
	const roots: { readonly [K in (typeof ClockRootKind)["handles"][number]]: RootRunner } = {
		Hourly: {
			window: clock.kinds[1].window,
			precondition: clock.kinds[1].precondition,
			admit: (scope: ScopeKey) =>
				Effect.gen(function* () {
					const input = yield* readClockHourlyInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startHourly(scope, scope, input.value)
					const finish = yield* finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "HourlyFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof ClockAdmitted>> = [
						...grown.rows.ClockAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof ClockFinish>> = [
						...grown.rows.ClockFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.clockAdmit.once({
							params: { steps, timed: grown.timed, root: scope },
							facts: {
								insert: {
									ClockScope: grown.rows.ClockScope,
									ClockStartStep: grown.rows.ClockStartStep,
									ClockChimeInput: grown.rows.ClockChimeInput,
									ClockCloseInput: grown.rows.ClockCloseInput,
									ClockAdmitted: admitted,
									ClockFinish: finishes
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
		Sitting: {
			window: clock.kinds[3].window,
			precondition: clock.kinds[3].precondition,
			admit: (scope: ScopeKey) =>
				Effect.gen(function* () {
					const input = yield* readClockSittingInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startSitting(scope, scope, input.value)
					const finish = yield* finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "SittingFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof ClockAdmitted>> = [
						...grown.rows.ClockAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof ClockFinish>> = [
						...grown.rows.ClockFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.clockAdmit.once({
							params: { steps, timed: grown.timed, root: scope },
							facts: {
								insert: {
									ClockScope: grown.rows.ClockScope,
									ClockStartStep: grown.rows.ClockStartStep,
									ClockChimeInput: grown.rows.ClockChimeInput,
									ClockCloseInput: grown.rows.ClockCloseInput,
									ClockAdmitted: admitted,
									ClockFinish: finishes
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
	const ledger: Ledger<FlowNeeds<typeof clock>> = {
		flow: FlowName.make("Clock"),
		now: Effect.flatMap(settled(h.den.clockNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.clockAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (step) =>
			Effect.map(settled(h.den.clockStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.clockResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.clockHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.clockClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.clockRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.clockFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.clockRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.clockAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.clockSkippedOf.once({ params: { scope: scope }, facts: {} })),
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
			h.den.clockUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
		finished: (scope) =>
			h.den.clockFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.clockClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: { ClockClaim: [{ step: row.step, root: row.root }], ClockEnded: row.lapsed }
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.clockRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { ClockEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.clockFence.once({
					params: {},
					facts: {
						insert: {
							ClockEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							ClockFenced: [row]
						}
					}
				})
			),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.clockRefuse.once({
					params: {},
					facts: {
						insert: {
							ClockResult: [{ step, root, outcome: "failed" }],
							ClockFailed: [{ step, root }],
							ClockHeld: [{ step, root, attempt }],
							ClockRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.clockSkip.once({
					params: {},
					facts: { insert: { ClockSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.clockExhaust.once({
					params: {},
					facts: {
						insert: {
							ClockResult: [{ step, root, outcome: "failed" }],
							ClockFailed: [{ step, root }],
							ClockHeld: [{ step, root, attempt }],
							ClockExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.clockFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) =>
			settled(
				h.retirer.clockRetire.once({
					params: {},
					facts: { retire: { ClockRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.flatMap(settled(h.den.clockSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof clock>> => {
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
					busy: [],
					awaiting: []
				}
			})
		),
		changes: Stream.mergeAll(
			[
				signals(h.den.clockPending.watch({ params: {}, facts: {} })),
				signals(h.den.clockRequested.watch({ params: {}, facts: {} })),
				signals(h.den.clockRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.clockPausedAll.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: [
			...Option.toArray(
				Option.map(scheduleOf(clock.kinds[1].trigger), (s) => ({
					kind: "Hourly",
					cron: s.cron,
					request: (at: Instant) =>
						Effect.forEach(s.roster(at), (root) =>
							request.Hourly(scheduledKey(at, root.member), root.input)
						)
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
