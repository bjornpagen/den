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
/** The ledger port of the flow Retry over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { retry } from "#integration/slice/flows.ts"
import { RetryPausable } from "#integration/slice/generated/retry.fragment.ts"
import type {
	RetryStep,
	RetryScope,
	RetryAdmitted,
	RetryFinish,
	RetryStartStep,
	RetrySteadfastInput,
	RetryBrittleInput,
	RetryRootKind
} from "#integration/slice/generated/retry.fragment.ts"
import type {
	retryDenPrograms,
	retryCoordinatorPrograms,
	retryRetirerPrograms,
	retryCommitPrograms
} from "#integration/slice/generated/retry.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface RetryHandles {
	readonly den: {
		readonly [K in keyof typeof retryDenPrograms]: MemberHandle<(typeof retryDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof retryCoordinatorPrograms]: MemberHandle<
			(typeof retryCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof retryRetirerPrograms]: MemberHandle<
			(typeof retryRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof retryCommitPrograms]: MemberHandle<(typeof retryCommitPrograms)[K]>
	}
}

interface Rows {
	readonly RetryStep: ReadonlyArray<Addition<typeof RetryStep>>
	readonly RetryScope: ReadonlyArray<Addition<typeof RetryScope>>
	readonly RetryAdmitted: ReadonlyArray<Addition<typeof RetryAdmitted>>
	readonly RetryFinish: ReadonlyArray<Addition<typeof RetryFinish>>
	readonly RetryStartStep: ReadonlyArray<Addition<typeof RetryStartStep>>
	readonly RetrySteadfastInput: ReadonlyArray<Addition<typeof RetrySteadfastInput>>
	readonly RetryBrittleInput: ReadonlyArray<Addition<typeof RetryBrittleInput>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof RetryPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(RetryPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Retry"), target })
	)

/** The ledger of the flow Retry over its handles, with the requests of its roots. */
export const retryLedger = (h: RetryHandles) => {
	const noRows: Rows = {
		RetryStep: [],
		RetryScope: [],
		RetryAdmitted: [],
		RetryFinish: [],
		RetryStartStep: [],
		RetrySteadfastInput: [],
		RetryBrittleInput: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.RetryStartStep, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			RetryStep: [...a.rows.RetryStep, ...b.rows.RetryStep],
			RetryScope: [...a.rows.RetryScope, ...b.rows.RetryScope],
			RetryAdmitted: [...a.rows.RetryAdmitted, ...b.rows.RetryAdmitted],
			RetryFinish: [...a.rows.RetryFinish, ...b.rows.RetryFinish],
			RetryStartStep: [...a.rows.RetryStartStep, ...b.rows.RetryStartStep],
			RetrySteadfastInput: [...a.rows.RetrySteadfastInput, ...b.rows.RetrySteadfastInput],
			RetryBrittleInput: [...a.rows.RetryBrittleInput, ...b.rows.RetryBrittleInput]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startLadders = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof retry.kinds)[2]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				retry.kinds[2].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> => {
					switch (spawn.kind) {
						case "Steadfast":
							return Effect.map(startedStep(scope, ordinal), (key): Grown => ({
								rows: {
									...noRows,
									RetryStep: [
										{
											step: key,
											kind: "Steadfast",
											scope: scope,
											due: dueAt(retry.kinds[0].due, at),
											root: root
										}
									],
									RetryStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
									RetrySteadfastInput: [{ step: key, root: root, key: spawn.input.key }]
								},
								spawned: {
									steps: [{ step: key, kind: "Steadfast", due: dueAt(retry.kinds[0].due, at) }],
									finishes: []
								}
							}))
						case "Brittle":
							return Effect.map(startedStep(scope, ordinal), (key): Grown => ({
								rows: {
									...noRows,
									RetryStep: [
										{
											step: key,
											kind: "Brittle",
											scope: scope,
											due: dueAt(retry.kinds[1].due, at),
											root: root
										}
									],
									RetryStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
									RetryBrittleInput: [{ step: key, root: root, key: spawn.input.key }]
								},
								spawned: {
									steps: [{ step: key, kind: "Brittle", due: dueAt(retry.kinds[1].due, at) }],
									finishes: []
								}
							}))
					}
				}
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readRetrySteadfastInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetrySteadfastInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryBrittleInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryBrittleInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryLaddersInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryLaddersInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ steadfast: found.steadfast, brittle: found.brittle }))
		})
	const pauseChains: PauseChains<(typeof RetryPausable)["handles"][number]> = {
		flow: FlowName.make("Retry"),
		turns: Effect.map(
			settled(h.coordinator.retryPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.retryPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.retryPause.once({ params: {}, facts: { insert: { RetryPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.retryResume.once({ params: {}, facts: { insert: { RetryResumed: [row] } } })
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
		Ladders: (key: string, at: Instant, input: Parameters<(typeof retry.kinds)[2]["start"]>[0]) =>
			Effect.flatMap(rootScope("Retry", "Ladders", key), (scope) =>
				Effect.map(
					fresh(
						"Retry",
						settled(
							h.den.retryRequestLadders.once({
								params: {},
								facts: {
									insert: {
										RetryScope: [{ scope, root: scope }],
										RetryRoot: [{ scope, kind: "Ladders" as const, key, at }],
										RetryLaddersInput: [
											{
												scope: scope,
												root: scope,
												steadfast: input.steadfast,
												brittle: input.brittle
											}
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
		Steadfast: runnerOf(
			retry.kinds[0],
			{
				input: (step) => readRetrySteadfastInput(step),
				read: () => Effect.succeed({}),
				commit: (done, _at) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.retryCommitSteadfast.once({
								params: {},
								facts: {
									insert: {
										RetryResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										RetryDone: [{ step: done.turn.step, root: done.turn.root }],
										RetryHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										RetrySteadfastOutput: [
											{ step: done.turn.step, root: done.turn.root, key: done.output.key }
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
		Brittle: runnerOf(
			retry.kinds[1],
			{
				input: (step) => readRetryBrittleInput(step),
				read: () => Effect.succeed({}),
				commit: (done, _at) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.retryCommitBrittle.once({
								params: {},
								facts: {
									insert: {
										RetryResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										RetryDone: [{ step: done.turn.step, root: done.turn.root }],
										RetryHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										RetryBrittleOutput: [
											{ step: done.turn.step, root: done.turn.root, key: done.output.key }
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
		LaddersFinish: runnerOf(
			{
				name: "LaddersFinish",
				uses: [],
				retry: retry.kinds[2].finish.retry,
				body: (read: {
					readonly input: Parameters<(typeof retry.kinds)[2]["start"]>[0]
					readonly endings: Parameters<(typeof retry.kinds)[2]["finish"]["body"]>[1]
				}) =>
					Effect.map(retry.kinds[2].finish.body(read.input, read.endings), (writes) => ({
						output: {},
						writes
					}))
			},
			{
				input: (step) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.retryStepOf.once({ params: { step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readRetryLaddersInput(scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const rowsSteadfast = yield* Effect.map(
							settled(h.den.retryOutputsLaddersSteadfast.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresSteadfast = yield* Effect.map(
							settled(h.den.retryFailuresLaddersSteadfast.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const Steadfast = [
							...Arr.map(rowsSteadfast, (row) => ({
								_tag: "Done" as const,
								output: { key: row.key }
							})),
							...Arr.map(failuresSteadfast, () => ({ _tag: "Failed" as const }))
						]
						const rowsBrittle = yield* Effect.map(
							settled(h.den.retryOutputsLaddersBrittle.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresBrittle = yield* Effect.map(
							settled(h.den.retryFailuresLaddersBrittle.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const Brittle = [
							...Arr.map(rowsBrittle, (row) => ({
								_tag: "Done" as const,
								output: { key: row.key }
							})),
							...Arr.map(failuresBrittle, () => ({ _tag: "Failed" as const }))
						]
						return Option.some({ input: input.value, endings: { Steadfast, Brittle } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.map(
						settled(
							h.commits.retryCommitLaddersFinish.once({
								params: {},
								facts: {
									insert: {
										RetryResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										RetryDone: [{ step: done.turn.step, root: done.turn.root }],
										RetryHeld: [
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
			Option.some("Ladders")
		)
	}
	const roots: { readonly [K in (typeof RetryRootKind)["handles"][number]]: RootRunner } = {
		Ladders: {
			window: retry.kinds[2].window,
			precondition: retry.kinds[2].precondition,
			admit: (scope: ScopeKey, at: Instant) =>
				Effect.gen(function* () {
					const input = yield* readRetryLaddersInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startLadders(scope, scope, input.value, at)
					const finish = yield* finishStep(scope)
					const steps: ReadonlyArray<Addition<typeof RetryStep>> = [
						...grown.rows.RetryStep,
						{ step: finish, kind: "LaddersFinish", scope, due: at, root: scope }
					]
					const admitted: ReadonlyArray<Addition<typeof RetryAdmitted>> = [
						...grown.rows.RetryAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof RetryFinish>> = [
						...grown.rows.RetryFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.retryAdmit.once({
							params: {},
							facts: {
								insert: {
									RetryScope: grown.rows.RetryScope,
									RetryStartStep: grown.rows.RetryStartStep,
									RetrySteadfastInput: grown.rows.RetrySteadfastInput,
									RetryBrittleInput: grown.rows.RetryBrittleInput,
									RetryStep: steps,
									RetryAdmitted: admitted,
									RetryFinish: finishes
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
	const ledger: Ledger<FlowNeeds<typeof retry>> = {
		flow: FlowName.make("Retry"),
		now: Effect.flatMap(settled(h.den.retryNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.retryAuthenticated.once({ params: {}, facts: {} }))
		),
		stepOf: (step) =>
			Effect.map(settled(h.den.retryStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.retryResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.retryHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.retryClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.retryRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.retryFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.retryRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.retryAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.retrySkippedOf.once({ params: { scope: scope }, facts: {} })),
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
			h.den.retryUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
		finished: (scope) =>
			h.den.retryFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		claim: (row) =>
			Effect.map(
				settled(h.den.retryClaim.once({ params: {}, facts: { insert: { RetryClaim: [row] } } })),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) =>
			settled(h.den.retryRetry.once({ params: {}, facts: { insert: { RetryRetry: [row] } } })),
		fence: (row) =>
			settled(h.den.retryFence.once({ params: {}, facts: { insert: { RetryFenced: [row] } } })),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.retryRefuse.once({
					params: {},
					facts: {
						insert: {
							RetryResult: [{ step, root, outcome: "failed" }],
							RetryFailed: [{ step, root }],
							RetryHeld: [{ step, root, attempt }],
							RetryRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.retrySkip.once({
					params: {},
					facts: { insert: { RetrySkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.retryExhaust.once({
					params: {},
					facts: {
						insert: {
							RetryResult: [{ step, root, outcome: "failed" }],
							RetryFailed: [{ step, root }],
							RetryHeld: [{ step, root, attempt }],
							RetryExhausted: [{ step, root, attempts: attempt }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.retryFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ scope: row.scope, kind: row.kind, at: row.at }))
		),
		retire: (root) =>
			settled(
				h.retirer.retryRetire.once({
					params: {},
					facts: { retire: { RetryRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.flatMap(settled(h.den.retrySnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof retry>> => {
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
				signals(h.den.retryPending.watch({ params: {}, facts: {} })),
				signals(h.den.retryRequested.watch({ params: {}, facts: {} })),
				signals(h.den.retryRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.retryPausedAll.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: [
			...Option.toArray(
				Option.map(scheduleOf(retry.kinds[2].trigger), (s) => ({
					kind: "Ladders",
					cron: s.cron,
					request: (at: Instant) => request.Ladders(String(at), at, s.input(at))
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
