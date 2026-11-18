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
/** The ledger port of the flow Assign over its served programs; `den generate` writes it, and nothing edits it. */
import type { Written } from "@bjornpagen/grizzle"
import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { assign } from "#integration/slice/flows.ts"
import { AssignPausable } from "#integration/slice/generated/assign.fragment.ts"
import type {
	AssignStep,
	AssignDue,
	AssignScope,
	AssignWithin,
	AssignAdmitted,
	AssignFinish,
	AssignStartStep,
	AssignStartScope,
	AssignDecideInput
} from "#integration/slice/generated/assign.fragment.ts"
import type {
	assignDenPrograms,
	assignCoordinatorPrograms,
	assignCommitPrograms
} from "#integration/slice/generated/assign.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface AssignHandles {
	readonly den: {
		readonly [K in keyof typeof assignDenPrograms]: MemberHandle<(typeof assignDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof assignCoordinatorPrograms]: MemberHandle<
			(typeof assignCoordinatorPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof assignCommitPrograms]: MemberHandle<
			(typeof assignCommitPrograms)[K]
		>
	}
}

interface Rows {
	readonly AssignStep: ReadonlyArray<Written<typeof AssignStep>>
	readonly AssignDue: ReadonlyArray<Written<typeof AssignDue>>
	readonly AssignScope: ReadonlyArray<Written<typeof AssignScope>>
	readonly AssignWithin: ReadonlyArray<Written<typeof AssignWithin>>
	readonly AssignAdmitted: ReadonlyArray<Written<typeof AssignAdmitted>>
	readonly AssignFinish: ReadonlyArray<Written<typeof AssignFinish>>
	readonly AssignStartStep: ReadonlyArray<Written<typeof AssignStartStep>>
	readonly AssignStartScope: ReadonlyArray<Written<typeof AssignStartScope>>
	readonly AssignDecideInput: ReadonlyArray<Written<typeof AssignDecideInput>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (name: string): Option.Option<(typeof AssignPausable)["handles"][number]> =>
	Arr.findFirst(AssignPausable.handles, (handle) => handle === name)
const pausesOf = (rows: ReadonlyArray<PauseRow>) =>
	Arr.flatMap(rows, (row) =>
		Option.toArray(Option.map(pausableOf(row.target), (target) => ({ target, turn: row.turn })))
	)

/** The ledger of the flow Assign over its handles, with the requests of its roots. */
export const assignLedger = (h: AssignHandles) => {
	const noRows: Rows = {
		AssignStep: [],
		AssignDue: [],
		AssignScope: [],
		AssignWithin: [],
		AssignAdmitted: [],
		AssignFinish: [],
		AssignStartStep: [],
		AssignStartScope: [],
		AssignDecideInput: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.AssignStartStep, (s) => s.scope === scope) ||
		Arr.some(grown.rows.AssignStartScope, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			AssignStep: [...a.rows.AssignStep, ...b.rows.AssignStep],
			AssignDue: [...a.rows.AssignDue, ...b.rows.AssignDue],
			AssignScope: [...a.rows.AssignScope, ...b.rows.AssignScope],
			AssignWithin: [...a.rows.AssignWithin, ...b.rows.AssignWithin],
			AssignAdmitted: [...a.rows.AssignAdmitted, ...b.rows.AssignAdmitted],
			AssignFinish: [...a.rows.AssignFinish, ...b.rows.AssignFinish],
			AssignStartStep: [...a.rows.AssignStartStep, ...b.rows.AssignStartStep],
			AssignStartScope: [...a.rows.AssignStartScope, ...b.rows.AssignStartScope],
			AssignDecideInput: [...a.rows.AssignDecideInput, ...b.rows.AssignDecideInput]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startAssignment = (
		scope: ScopeKey,
		input: Parameters<(typeof assign.kinds)[1]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				assign.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							AssignStep: [{ step: key, kind: "Decide", scope: scope }],
							AssignDue: [{ step: key, at: dueAt(assign.kinds[0].due, at) }],
							AssignStartStep: [{ scope, ordinal: BigInt(ordinal), step: key }],
							AssignDecideInput: [
								{
									step: key,
									learner: spawn.input.learner,
									topic: spawn.input.topic,
									near: spawn.input.near
								}
							]
						},
						spawned: {
							steps: [{ step: key, kind: "Decide", due: dueAt(assign.kinds[0].due, at) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readAssignDecideInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.assignReadAssignDecideInput.once({ params: { step: step }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({
				learner: found.learner,
				topic: found.topic,
				near: found.near
			}))
		})
	const readAssignAssignmentInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.assignReadAssignAssignmentInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({
				learner: found.learner,
				topic: found.topic,
				near: found.near
			}))
		})
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		pauseTurns: Effect.map(h.coordinator.assignPauseTurns.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		paused: Effect.map(h.coordinator.assignPausedAll.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		take: () => Effect.void,
		giveBack: () => Effect.void,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (row) =>
			Effect.asVoid(
				h.coordinator.assignPause.once({
					params: {},
					facts: { insert: { AssignPaused: pausesOf([row]) } }
				})
			),
		resume: (row) =>
			Effect.asVoid(
				h.coordinator.assignResume.once({
					params: {},
					facts: { insert: { AssignResumed: pausesOf([row]) } }
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
		Assignment: (
			key: string,
			at: Instant,
			input: Parameters<(typeof assign.kinds)[1]["start"]>[0]
		) =>
			Effect.flatMap(rootScope("Assign", "Assignment", key), (scope) =>
				Effect.map(
					fresh(
						"Assign",
						h.den.assignRequestAssignment.once({
							params: {},
							facts: {
								insert: {
									AssignScope: [{ scope, kind: "Assignment" as const }],
									AssignRoot: [{ scope, key, at }],
									AssignAssignmentInput: [
										{ scope: scope, learner: input.learner, topic: input.topic, near: input.near }
									]
								}
							}
						})
					),
					(accepted) => ({ scope, fresh: accepted })
				)
			)
	}
	const ledger: Ledger<FlowNeeds<typeof assign>> = {
		flow: FlowName.make("Assign"),
		now: Effect.flatMap(h.den.assignNow.once({ params: {}, facts: {} }), readingOf),
		authenticated: Effect.asVoid(h.commits.assignAuthenticated.once({ params: {}, facts: {} })),
		resources: [],
		steps: new Map([
			[
				"Decide",
				runnerOf(
					assign.kinds[0],
					{
						input: (step) => readAssignDecideInput(step),
						read: (input) =>
							Effect.all(
								{
									nearest: Effect.map(
										h.commits.assignReadDecideNearest.once({
											params: assign.kinds[0].reads.nearest.params(input),
											facts: {}
										}),
										rowsOf
									),
									seen: Effect.map(
										h.commits.assignReadDecideSeen.once({
											params: assign.kinds[0].reads.seen.params(input),
											facts: {}
										}),
										rowsOf
									)
								},
								{ concurrency: "unbounded" }
							),
						commit: (done, _at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.succeed(nothingGrown)
								const outcome = yield* h.commits.assignCommitDecide.once({
									params: {},
									facts: {
										insert: {
											AssignResult: [{ step: done.turn.step, outcome: "done" }],
											AssignDone: [{ step: done.turn.step }],
											AssignHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											AssignDecideOutput: [{ step: done.turn.step }],
											AssignDecideOutputChosen: Option.toArray(
												Option.map(done.output.chosen, (value) => ({ step: done.turn.step, value }))
											),
											AssignDecideNearestRead: Arr.map(done.rows.nearest, (row, ordinal) => ({
												...row,
												step: done.turn.step,
												ordinal: BigInt(ordinal)
											})),
											AssignDecideSeenRead: Arr.map(done.rows.seen, (row, ordinal) => ({
												...row,
												step: done.turn.step,
												ordinal: BigInt(ordinal)
											})),
											Assigned: done.writes.insert.Assigned
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
				"AssignmentFinish",
				runnerOf(
					{
						name: "AssignmentFinish",
						uses: [],
						retry: assign.kinds[1].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof assign.kinds)[1]["start"]>[0]
							readonly endings: Parameters<(typeof assign.kinds)[1]["finish"]["body"]>[1]
						}) =>
							Effect.map(assign.kinds[1].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (step) =>
							Effect.gen(function* () {
								const located = yield* Effect.map(
									h.den.assignStepOf.once({ params: { step }, facts: {} }),
									one
								)
								if (Option.isNone(located)) {
									return Option.none()
								}
								const scope = located.value.scope
								const input = yield* readAssignAssignmentInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const rowsDecide = yield* Effect.map(
									h.den.assignOutputsAssignmentDecide.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const sideDecide0 = yield* Effect.map(
									h.den.assignOutputsAssignmentDecideChosen.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const failuresDecide = yield* Effect.map(
									h.den.assignFailuresAssignmentDecide.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const Decide = [
									...Arr.map(rowsDecide, (row) => ({
										_tag: "Done" as const,
										output: {
											chosen: Option.map(
												Arr.findFirst(sideDecide0, (o) => o.step === row.step),
												(o) => o.value
											)
										}
									})),
									...Arr.map(failuresDecide, () => ({ _tag: "Failed" as const }))
								]
								return Option.some({ input: input.value, endings: { Decide } })
							}),
						read: () => Effect.succeed([]),
						commit: (done) =>
							Effect.map(
								h.commits.assignCommitAssignmentFinish.once({
									params: {},
									facts: {
										insert: {
											AssignResult: [{ step: done.turn.step, outcome: "done" }],
											AssignDone: [{ step: done.turn.step }],
											AssignHeld: [{ step: done.turn.step, attempt: done.turn.attempt }]
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("Assignment")
				)
			]
		]),
		roots: new Map([
			[
				"Assignment",
				{
					kind: "Assignment",
					exclusive: false,
					window: assign.kinds[1].window,
					precondition: assign.kinds[1].precondition,
					finish: "AssignmentFinish",
					admit: (scope: ScopeKey, at: Instant) =>
						Effect.gen(function* () {
							const input = yield* readAssignAssignmentInput(scope)
							if (Option.isNone(input)) {
								return Option.none()
							}
							const grown = yield* startAssignment(scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Written<typeof AssignStep>> = [
								...grown.rows.AssignStep,
								{ step: finish, kind: "AssignmentFinish", scope }
							]
							const dues: ReadonlyArray<Written<typeof AssignDue>> = [
								...grown.rows.AssignDue,
								{ step: finish, at }
							]
							const admitted: ReadonlyArray<Written<typeof AssignAdmitted>> = [
								...grown.rows.AssignAdmitted,
								{ scope }
							]
							const finishes: ReadonlyArray<Written<typeof AssignFinish>> = [
								...grown.rows.AssignFinish,
								{ scope, step: finish }
							]
							const outcome = yield* h.den.assignAdmit.once({
								params: {},
								facts: {
									insert: {
										AssignScope: grown.rows.AssignScope,
										AssignWithin: grown.rows.AssignWithin,
										AssignStartStep: grown.rows.AssignStartStep,
										AssignStartScope: grown.rows.AssignStartScope,
										AssignDecideInput: grown.rows.AssignDecideInput,
										AssignStep: steps,
										AssignDue: dues,
										AssignAdmitted: admitted,
										AssignFinish: finishes
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
			Effect.map(h.den.assignStepOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))
			),
		resultOf: (step) =>
			Effect.map(h.den.assignResultOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(h.den.assignHeldOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(h.den.assignDueOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) =>
			Effect.map(h.den.assignClaimsOf.once({ params: { step }, facts: {} }), rowsOf),
		retriesOf: (step) =>
			Effect.map(h.den.assignRetriesOf.once({ params: { step }, facts: {} }), rowsOf),
		fencedOf: (step) =>
			Effect.map(h.den.assignFencedOf.once({ params: { step }, facts: {} }), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					h.den.assignScopeOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const parent = yield* Effect.map(
					h.den.assignWithinOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const admitted = yield* Effect.map(
					h.den.assignAdmittedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const skipped = yield* Effect.map(
					h.den.assignSkippedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const key = Option.none<{ readonly id: ExclusiveId }>()
				const root = yield* Effect.map(
					h.den.assignRootOf.once({ params: { scope: scope }, facts: {} }),
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
				any(h.den.assignUnendedSteps.once({ params: { scope }, facts: {} })),
				(steps) =>
					steps
						? Effect.succeed(true)
						: any(h.den.assignOpenChildren.once({ params: { scope }, facts: {} }))
			),
		finished: (scope) => any(h.den.assignFinished.once({ params: { scope }, facts: {} })),
		busy: busyOf,
		claim: (row) =>
			Effect.map(
				h.den.assignClaim.once({ params: {}, facts: { insert: { AssignClaim: [row] } } }),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) =>
			h.den.assignRetry.once({ params: {}, facts: { insert: { AssignRetry: [row] } } }),
		fence: (row) =>
			h.den.assignFence.once({ params: {}, facts: { insert: { AssignFenced: [row] } } }),
		refuse: (step, attempt, law) =>
			h.den.assignRefuse.once({
				params: {},
				facts: {
					insert: {
						AssignResult: [{ step, outcome: "failed" }],
						AssignFailed: [{ step }],
						AssignHeld: [{ step, attempt }],
						AssignRefusal: [{ step, law }]
					}
				}
			}),
		skip: (scope, by) =>
			h.den.assignSkip.once({ params: {}, facts: { insert: { AssignSkipped: [{ scope, by }] } } }),
		exhaust: (step, attempt) =>
			h.den.assignExhaust.once({
				params: {},
				facts: {
					insert: {
						AssignResult: [{ step, outcome: "failed" }],
						AssignFailed: [{ step }],
						AssignHeld: [{ step, attempt }],
						AssignExhausted: [{ step, attempts: attempt }]
					}
				}
			}),
		snapshot: Effect.gen(function* () {
			const steps = yield* Effect.map(h.den.assignPending.once({ params: {}, facts: {} }), rowsOf)
			const claims = yield* Effect.map(
				h.den.assignPendingClaims.once({ params: {}, facts: {} }),
				rowsOf
			)
			const retries = yield* Effect.map(
				h.den.assignPendingRetries.once({ params: {}, facts: {} }),
				rowsOf
			)
			const fenced = yield* Effect.map(
				h.den.assignPendingFenced.once({ params: {}, facts: {} }),
				rowsOf
			)
			const dues = yield* Effect.map(
				h.den.assignPendingDues.once({ params: {}, facts: {} }),
				rowsOf
			)
			const requested = yield* Effect.map(
				h.den.assignRequested.once({ params: {}, facts: {} }),
				rowsOf
			)
			const running = yield* Effect.map(h.den.assignRunning.once({ params: {}, facts: {} }), rowsOf)
			const withins = yield* Effect.map(h.den.assignWithins.once({ params: {}, facts: {} }), rowsOf)
			const roots = yield* Effect.map(h.den.assignRoots.once({ params: {}, facts: {} }), rowsOf)
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
				signals(h.den.assignPending.watch({ params: {}, facts: {} })),
				signals(h.den.assignRequested.watch({ params: {}, facts: {} })),
				signals(h.den.assignRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.assignPausedAll.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: [
			...Option.toArray(
				Option.map(scheduleOf(assign.kinds[1].trigger), (s) => ({
					kind: "Assignment",
					cron: s.cron,
					request: (at: Instant) => request.Assignment(String(at), at, s.input(at))
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
