import { any, dueAt, fresh, one, rowsOf, scheduleOf, signals } from "@bjornpagen/den/runtime/bind"
import {
	finishStep,
	type ExclusiveId,
	type Instant,
	rootScope,
	type ScopeKey,
	startedScope,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type {
	FlowNeeds,
	HoldRow,
	Ledger,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Fan over its served programs; `den generate` writes it, and nothing edits it. */
import type { Written } from "@bjornpagen/grizzle"
import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { fan } from "#integration/slice/flows.ts"
import { FanPausable, FanResource } from "#integration/slice/generated/fan.fragment.ts"
import type {
	FanStep,
	FanDue,
	FanScope,
	FanWithin,
	FanAdmitted,
	FanFinish,
	FanStartStep,
	FanStartScope,
	FanSquareInput,
	FanBatchInput
} from "#integration/slice/generated/fan.fragment.ts"
import type {
	fanDenPrograms,
	fanSeatsPrograms,
	fanCommitPrograms
} from "#integration/slice/generated/fan.programs.ts"

/** The handles the ledger calls: den's role's, its coordination role's, and the app role's commits, from whichever logins serve them. */
export interface FanHandles {
	readonly den: {
		readonly [K in keyof typeof fanDenPrograms]: MemberHandle<(typeof fanDenPrograms)[K]>
	}
	readonly seats: {
		readonly [K in keyof typeof fanSeatsPrograms]: MemberHandle<(typeof fanSeatsPrograms)[K]>
	}
	readonly commits: {
		readonly [K in keyof typeof fanCommitPrograms]: MemberHandle<(typeof fanCommitPrograms)[K]>
	}
}

interface Rows {
	readonly FanStep: ReadonlyArray<Written<typeof FanStep>>
	readonly FanDue: ReadonlyArray<Written<typeof FanDue>>
	readonly FanScope: ReadonlyArray<Written<typeof FanScope>>
	readonly FanWithin: ReadonlyArray<Written<typeof FanWithin>>
	readonly FanAdmitted: ReadonlyArray<Written<typeof FanAdmitted>>
	readonly FanFinish: ReadonlyArray<Written<typeof FanFinish>>
	readonly FanStartStep: ReadonlyArray<Written<typeof FanStartStep>>
	readonly FanStartScope: ReadonlyArray<Written<typeof FanStartScope>>
	readonly FanSquareInput: ReadonlyArray<Written<typeof FanSquareInput>>
	readonly FanBatchInput: ReadonlyArray<Written<typeof FanBatchInput>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (name: string): Option.Option<(typeof FanPausable)["handles"][number]> =>
	Arr.findFirst(FanPausable.handles, (handle) => handle === name)
const resourceOf = (name: string): Option.Option<(typeof FanResource)["handles"][number]> =>
	Arr.findFirst(FanResource.handles, (handle) => handle === name)
const holdsOf = (holds: ReadonlyArray<HoldRow>) =>
	Arr.flatMap(holds, (hold) =>
		Option.toArray(
			Option.map(resourceOf(hold.resource), (resource) => ({
				resource,
				seat: hold.seat,
				holder: hold.holder,
				until: hold.until
			}))
		)
	)

/** The ledger of the flow Fan over its handles, with the requests of its roots. */
export const fanLedger = (h: FanHandles) => {
	const noRows: Rows = {
		FanStep: [],
		FanDue: [],
		FanScope: [],
		FanWithin: [],
		FanAdmitted: [],
		FanFinish: [],
		FanStartStep: [],
		FanStartScope: [],
		FanSquareInput: [],
		FanBatchInput: []
	}
	const nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.FanStartStep, (s) => s.scope === scope) ||
		Arr.some(grown.rows.FanStartScope, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			FanStep: [...a.rows.FanStep, ...b.rows.FanStep],
			FanDue: [...a.rows.FanDue, ...b.rows.FanDue],
			FanScope: [...a.rows.FanScope, ...b.rows.FanScope],
			FanWithin: [...a.rows.FanWithin, ...b.rows.FanWithin],
			FanAdmitted: [...a.rows.FanAdmitted, ...b.rows.FanAdmitted],
			FanFinish: [...a.rows.FanFinish, ...b.rows.FanFinish],
			FanStartStep: [...a.rows.FanStartStep, ...b.rows.FanStartStep],
			FanStartScope: [...a.rows.FanStartScope, ...b.rows.FanStartScope],
			FanSquareInput: [...a.rows.FanSquareInput, ...b.rows.FanSquareInput],
			FanBatchInput: [...a.rows.FanBatchInput, ...b.rows.FanBatchInput]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startBatch = (
		scope: ScopeKey,
		input: Parameters<(typeof fan.kinds)[1]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				fan.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							FanStep: [{ step: key, kind: "Square", scope: scope }],
							FanDue: [{ step: key, at: dueAt(fan.kinds[0].due, at) }],
							FanStartStep: [{ scope, ordinal: BigInt(ordinal), step: key }],
							FanSquareInput: [{ step: key, batch: spawn.input.batch, n: spawn.input.n }]
						},
						spawned: {
							steps: [{ step: key, kind: "Square", due: dueAt(fan.kinds[0].due, at) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const startFanRun = (
		scope: ScopeKey,
		input: Parameters<(typeof fan.kinds)[2]["start"]>[0],
		at: Instant
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				fan.kinds[2].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.flatMap(startedScope(scope, ordinal), (key) =>
						Effect.flatMap(finishStep(key), (finish) =>
							Effect.map(startBatch(key, spawn.input, at), (inner): Grown =>
								joined(inner, {
									rows: {
										...noRows,
										FanScope: [{ scope: key, kind: "Batch" }],
										FanWithin: [{ scope: key, parent: scope }],
										FanAdmitted: [{ scope: key }],
										FanFinish: [{ scope: key, step: finish }],
										FanStep: [{ step: finish, kind: "BatchFinish", scope: key }],
										FanDue: [{ step: finish, at }],
										FanStartScope: [{ scope, ordinal: BigInt(ordinal), child: key }],
										FanBatchInput: [
											{ scope: key, batch: spawn.input.batch, size: spawn.input.size }
										]
									},
									spawned: { steps: [], finishes: hasChildren(inner, key) ? [] : [finish] }
								})
							)
						)
					)
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readFanSquareInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.fanReadFanSquareInput.once({ params: { step: step }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, n: found.n }))
		})
	const readFanBatchInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.fanReadFanBatchInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, size: found.size }))
		})
	const readFanFanRunInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				h.den.fanReadFanFanRunInput.once({ params: { scope: scope }, facts: {} }),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, size: found.size }))
		})
	const coordination: Ledger<never>["coordination"] = {
		seats: Effect.map(h.seats.fanSeats.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ resource: row.resource, seat: row.seat }))
		),
		holds: Effect.map(h.seats.fanHolds.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({
				resource: row.resource,
				seat: row.seat,
				holder: row.holder,
				until: row.until
			}))
		),
		exclusives: Effect.succeed([]),
		paused: Effect.map(h.seats.fanPausedAll.once({ params: {}, facts: {} }), (rows) =>
			Arr.map(rowsOf(rows), (row) => row.target)
		),
		provision: (add, remove) =>
			Effect.asVoid(
				h.seats.fanProvision.once({
					params: {},
					facts: {
						insert: {
							FanSeat: Arr.flatMap(add, (s) =>
								Option.toArray(
									Option.map(resourceOf(s.resource), (resource) => ({ resource, seat: s.seat }))
								)
							)
						},
						delete: {
							FanSeat: Arr.flatMap(remove, (s) =>
								Option.toArray(
									Option.map(resourceOf(s.resource), (resource) => ({ resource, seat: s.seat }))
								)
							)
						}
					}
				})
			),
		take: (lapsed, taken) =>
			Effect.asVoid(
				h.seats.fanTake.once({
					params: {},
					facts: { delete: { FanHold: holdsOf(lapsed) }, insert: { FanHold: holdsOf(taken) } }
				})
			),
		giveBack: (holds) =>
			Effect.asVoid(
				h.seats.fanGiveBack.once({ params: {}, facts: { delete: { FanHold: holdsOf(holds) } } })
			),
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (target) =>
			Effect.asVoid(
				h.seats.fanPause.once({
					params: {},
					facts: {
						insert: {
							FanPaused: Arr.map(Option.toArray(pausableOf(target)), (id) => ({ target: id }))
						}
					}
				})
			),
		resume: (target) =>
			Effect.asVoid(
				h.seats.fanResume.once({
					params: {},
					facts: {
						delete: {
							FanPaused: Arr.map(Option.toArray(pausableOf(target)), (id) => ({ target: id }))
						}
					}
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
		FanRun: (key: string, at: Instant, input: Parameters<(typeof fan.kinds)[2]["start"]>[0]) =>
			Effect.flatMap(rootScope("Fan", "FanRun", key), (scope) =>
				Effect.map(
					fresh(
						"Fan",
						h.den.fanRequestFanRun.once({
							params: {},
							facts: {
								insert: {
									FanScope: [{ scope, kind: "FanRun" as const }],
									FanRoot: [{ scope, key, at }],
									FanFanRunInput: [{ scope: scope, batch: input.batch, size: input.size }]
								}
							}
						})
					),
					(accepted) => ({ scope, fresh: accepted })
				)
			)
	}
	const ledger: Ledger<FlowNeeds<typeof fan>> = {
		flow: FlowName.make("Fan"),
		resources: [{ name: "Pool", seats: 2 }],
		steps: new Map([
			[
				"Square",
				runnerOf(
					fan.kinds[0],
					{
						input: (step) => readFanSquareInput(step),
						read: () => Effect.succeed([]),
						commit: (done, _at) =>
							Effect.gen(function* () {
								const grown = yield* Effect.succeed(nothingGrown)
								const outcome = yield* h.commits.fanCommitSquare.once({
									params: {},
									facts: {
										insert: {
											FanResult: [{ step: done.turn.step, outcome: "done" }],
											FanDone: [{ step: done.turn.step }],
											FanHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											FanSquareOutput: [{ step: done.turn.step, square: done.output.square }]
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
				"BatchFinish",
				runnerOf(
					{
						name: "BatchFinish",
						uses: [],
						retry: fan.kinds[1].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof fan.kinds)[1]["start"]>[0]
							readonly endings: Parameters<(typeof fan.kinds)[1]["finish"]["body"]>[1]
						}) =>
							Effect.map(fan.kinds[1].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (step) =>
							Effect.gen(function* () {
								const located = yield* Effect.map(
									h.den.fanStepOf.once({ params: { step }, facts: {} }),
									one
								)
								if (Option.isNone(located)) {
									return Option.none()
								}
								const scope = located.value.scope
								const input = yield* readFanBatchInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const rowsSquare = yield* Effect.map(
									h.den.fanOutputsBatchSquare.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const failuresSquare = yield* Effect.map(
									h.den.fanFailuresBatchSquare.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const Square = [
									...Arr.map(rowsSquare, (row) => ({
										_tag: "Done" as const,
										output: { square: row.square }
									})),
									...Arr.map(failuresSquare, () => ({ _tag: "Failed" as const }))
								]
								return Option.some({ input: input.value, endings: { Square } })
							}),
						read: () => Effect.succeed([]),
						commit: (done) =>
							Effect.map(
								h.commits.fanCommitBatchFinish.once({
									params: {},
									facts: {
										insert: {
											FanResult: [{ step: done.turn.step, outcome: "done" }],
											FanDone: [{ step: done.turn.step }],
											FanHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											Tally: done.writes.insert.Tally
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("Batch")
				)
			],
			[
				"FanRunFinish",
				runnerOf(
					{
						name: "FanRunFinish",
						uses: [],
						retry: fan.kinds[2].finish.retry,
						body: (read: {
							readonly input: Parameters<(typeof fan.kinds)[2]["start"]>[0]
							readonly endings: Parameters<(typeof fan.kinds)[2]["finish"]["body"]>[1]
						}) =>
							Effect.map(fan.kinds[2].finish.body(read.input, read.endings), (writes) => ({
								output: {},
								writes
							}))
					},
					{
						input: (step) =>
							Effect.gen(function* () {
								const located = yield* Effect.map(
									h.den.fanStepOf.once({ params: { step }, facts: {} }),
									one
								)
								if (Option.isNone(located)) {
									return Option.none()
								}
								const scope = located.value.scope
								const input = yield* readFanFanRunInput(scope)
								if (Option.isNone(input)) {
									return Option.none()
								}
								const endingsBatch = yield* Effect.map(
									h.den.fanEndingsFanRunBatch.once({ params: { scope }, facts: {} }),
									rowsOf
								)
								const Batch = Arr.map(endingsBatch, (row) =>
									row.outcome === "done" ? { _tag: "Done" as const } : { _tag: "Failed" as const }
								)
								return Option.some({ input: input.value, endings: { Batch } })
							}),
						read: () => Effect.succeed([]),
						commit: (done) =>
							Effect.map(
								h.commits.fanCommitFanRunFinish.once({
									params: {},
									facts: {
										insert: {
											FanResult: [{ step: done.turn.step, outcome: "done" }],
											FanDone: [{ step: done.turn.step }],
											FanHeld: [{ step: done.turn.step, attempt: done.turn.attempt }],
											Settled: done.writes.insert.Settled
										}
									}
								}),
								(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
							),
						fail: (failed) => Effect.die(failed.error)
					},
					Option.some("FanRun")
				)
			]
		]),
		roots: new Map([
			[
				"FanRun",
				{
					kind: "FanRun",
					exclusive: false,
					window: fan.kinds[2].window,
					precondition: fan.kinds[2].precondition,
					finish: "FanRunFinish",
					admit: (scope: ScopeKey, at: Instant) =>
						Effect.gen(function* () {
							const input = yield* readFanFanRunInput(scope)
							if (Option.isNone(input)) {
								return Option.none()
							}
							const grown = yield* startFanRun(scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Written<typeof FanStep>> = [
								...grown.rows.FanStep,
								{ step: finish, kind: "FanRunFinish", scope }
							]
							const dues: ReadonlyArray<Written<typeof FanDue>> = [
								...grown.rows.FanDue,
								{ step: finish, at }
							]
							const admitted: ReadonlyArray<Written<typeof FanAdmitted>> = [
								...grown.rows.FanAdmitted,
								{ scope }
							]
							const finishes: ReadonlyArray<Written<typeof FanFinish>> = [
								...grown.rows.FanFinish,
								{ scope, step: finish }
							]
							const outcome = yield* h.den.fanAdmit.once({
								params: {},
								facts: {
									insert: {
										FanScope: grown.rows.FanScope,
										FanWithin: grown.rows.FanWithin,
										FanStartStep: grown.rows.FanStartStep,
										FanStartScope: grown.rows.FanStartScope,
										FanSquareInput: grown.rows.FanSquareInput,
										FanBatchInput: grown.rows.FanBatchInput,
										FanStep: steps,
										FanDue: dues,
										FanAdmitted: admitted,
										FanFinish: finishes
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
			Effect.map(h.den.fanStepOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))
			),
		resultOf: (step) =>
			Effect.map(h.den.fanResultOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(h.den.fanHeldOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(h.den.fanDueOf.once({ params: { step }, facts: {} }), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) => Effect.map(h.den.fanClaimsOf.once({ params: { step }, facts: {} }), rowsOf),
		retriesOf: (step) =>
			Effect.map(h.den.fanRetriesOf.once({ params: { step }, facts: {} }), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					h.den.fanScopeOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const parent = yield* Effect.map(
					h.den.fanWithinOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const admitted = yield* Effect.map(
					h.den.fanAdmittedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const skipped = yield* Effect.map(
					h.den.fanSkippedOf.once({ params: { scope: scope }, facts: {} }),
					one
				)
				const key = Option.none<{ readonly id: ExclusiveId }>()
				const root = yield* Effect.map(
					h.den.fanRootOf.once({ params: { scope: scope }, facts: {} }),
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
			Effect.flatMap(any(h.den.fanUnendedSteps.once({ params: { scope }, facts: {} })), (steps) =>
				steps
					? Effect.succeed(true)
					: any(h.den.fanOpenChildren.once({ params: { scope }, facts: {} }))
			),
		finished: (scope) => any(h.den.fanFinished.once({ params: { scope }, facts: {} })),
		busy: busyOf,
		claim: (row) =>
			Effect.map(
				h.den.fanClaim.once({ params: {}, facts: { insert: { FanClaim: [row] } } }),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) => h.den.fanRetry.once({ params: {}, facts: { insert: { FanRetry: [row] } } }),
		refuse: (step, attempt, law) =>
			h.den.fanRefuse.once({
				params: {},
				facts: {
					insert: {
						FanResult: [{ step, outcome: "failed" }],
						FanFailed: [{ step }],
						FanHeld: [{ step, attempt }],
						FanRefusal: [{ step, law }]
					}
				}
			}),
		skip: (scope, by) =>
			h.den.fanSkip.once({ params: {}, facts: { insert: { FanSkipped: [{ scope, by }] } } }),
		exhaust: (step, attempt) =>
			h.den.fanExhaust.once({
				params: {},
				facts: {
					insert: {
						FanResult: [{ step, outcome: "failed" }],
						FanFailed: [{ step }],
						FanHeld: [{ step, attempt }],
						FanExhausted: [{ step, attempts: attempt }]
					}
				}
			}),
		snapshot: Effect.gen(function* () {
			const steps = yield* Effect.map(h.den.fanPending.once({ params: {}, facts: {} }), rowsOf)
			const claims = yield* Effect.map(
				h.den.fanPendingClaims.once({ params: {}, facts: {} }),
				rowsOf
			)
			const retries = yield* Effect.map(
				h.den.fanPendingRetries.once({ params: {}, facts: {} }),
				rowsOf
			)
			const dues = yield* Effect.map(h.den.fanPendingDues.once({ params: {}, facts: {} }), rowsOf)
			const requested = yield* Effect.map(
				h.den.fanRequested.once({ params: {}, facts: {} }),
				rowsOf
			)
			const running = yield* Effect.map(h.den.fanRunning.once({ params: {}, facts: {} }), rowsOf)
			const withins = yield* Effect.map(h.den.fanWithins.once({ params: {}, facts: {} }), rowsOf)
			const roots = yield* Effect.map(h.den.fanRoots.once({ params: {}, facts: {} }), rowsOf)
			const keys: ReadonlyArray<{ readonly scope: ScopeKey; readonly id: ExclusiveId }> = []
			const seats = yield* coordination.seats
			const holds = yield* coordination.holds
			const exclusives = yield* coordination.exclusives
			const paused = yield* coordination.paused
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
				dues,
				scopes: [
					...Arr.map(requested, (s) => view(s.scope, s.kind, false)),
					...Arr.map(running, (s) => view(s.scope, s.kind, true))
				],
				seats,
				holds,
				exclusives,
				paused,
				busy
			} satisfies Snapshot
		}),
		changes: Stream.mergeAll(
			[
				signals(h.den.fanPending.watch({ params: {}, facts: {} })),
				signals(h.den.fanRequested.watch({ params: {}, facts: {} })),
				signals(h.den.fanRunning.watch({ params: {}, facts: {} })),
				signals(h.seats.fanHolds.watch({ params: {}, facts: {} })),
				signals(h.seats.fanPausedAll.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: [
			...Option.toArray(
				Option.map(scheduleOf(fan.kinds[2].trigger), (s) => ({
					kind: "FanRun",
					cron: s.cron,
					request: (at: Instant) => request.FanRun(String(at), at, s.input(at))
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
