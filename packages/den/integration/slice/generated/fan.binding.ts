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
	finishStep,
	type Instant,
	rootScope,
	type ScopeKey,
	startedScope,
	startedStep,
	type StepKey
} from "@bjornpagen/den/runtime/identity"
import type {
	FlowNeeds,
	Admission,
	Ledger,
	RootRunner,
	ScopeView,
	SeatAt,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"
import { type PauseChains, pauseIn, resumeIn } from "@bjornpagen/den/runtime/seats"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Fan over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { fan } from "#integration/slice/flows.ts"
import { FanPausable, FanResource } from "#integration/slice/generated/fan.fragment.ts"
import type {
	FanStep,
	FanScope,
	FanWithin,
	FanAdmitted,
	FanFinish,
	FanStartStep,
	FanStartScope,
	FanSquareInput,
	FanBatchInput,
	FanRootKind
} from "#integration/slice/generated/fan.fragment.ts"
import type {
	fanDenPrograms,
	fanCoordinatorPrograms,
	fanRetirerPrograms,
	fanCommitPrograms
} from "#integration/slice/generated/fan.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface FanHandles {
	readonly den: {
		readonly [K in keyof typeof fanDenPrograms]: MemberHandle<(typeof fanDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof fanCoordinatorPrograms]: MemberHandle<
			(typeof fanCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof fanRetirerPrograms]: MemberHandle<(typeof fanRetirerPrograms)[K]>
	}
	readonly commits: {
		readonly [K in keyof typeof fanCommitPrograms]: MemberHandle<(typeof fanCommitPrograms)[K]>
	}
}

interface Rows {
	readonly FanStep: ReadonlyArray<Addition<typeof FanStep>>
	readonly FanScope: ReadonlyArray<Addition<typeof FanScope>>
	readonly FanWithin: ReadonlyArray<Addition<typeof FanWithin>>
	readonly FanAdmitted: ReadonlyArray<Addition<typeof FanAdmitted>>
	readonly FanFinish: ReadonlyArray<Addition<typeof FanFinish>>
	readonly FanStartStep: ReadonlyArray<Addition<typeof FanStartStep>>
	readonly FanStartScope: ReadonlyArray<Addition<typeof FanStartScope>>
	readonly FanSquareInput: ReadonlyArray<Addition<typeof FanSquareInput>>
	readonly FanBatchInput: ReadonlyArray<Addition<typeof FanBatchInput>>
}

interface Grown {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof FanPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(FanPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Fan"), target })
	)
const resourceOf = (name: string): Option.Option<(typeof FanResource)["handles"][number]> =>
	Arr.findFirst(FanResource.handles, (handle) => handle === name)
const holdsOf = (seats: ReadonlyArray<SeatAt>) =>
	Arr.flatMap(seats, (taken) =>
		Option.toArray(
			Option.map(resourceOf(taken.resource), (resource) => ({ resource, seat: taken.seat }))
		)
	)

/** The ledger of the flow Fan over its handles, with the requests of its roots. */
export const fanLedger = (h: FanHandles) => {
	const noRows: Rows = {
		FanStep: [],
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
		root: ScopeKey,
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
							FanStep: [
								{
									step: key,
									kind: "Square",
									scope: scope,
									due: dueAt(fan.kinds[0].due, at),
									root: root
								}
							],
							FanStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							FanSquareInput: [
								{ step: key, root: root, batch: spawn.input.batch, n: spawn.input.n }
							]
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
		root: ScopeKey,
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
							Effect.map(startBatch(root, key, spawn.input, at), (inner): Grown =>
								joined(inner, {
									rows: {
										...noRows,
										FanScope: [{ scope: key, root: root }],
										FanWithin: [{ scope: key, parent: scope, kind: "Batch", root: root }],
										FanAdmitted: [{ scope: key, root: root }],
										FanFinish: [{ scope: key, step: finish, root: root }],
										FanStep: [
											{ step: finish, kind: "BatchFinish", scope: key, due: at, root: root }
										],
										FanStartScope: [{ scope, ordinal: BigInt(ordinal), child: key, root }],
										FanBatchInput: [
											{ scope: key, root: root, batch: spawn.input.batch, size: spawn.input.size }
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
				settled(h.den.fanReadFanSquareInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, n: found.n }))
		})
	const readFanBatchInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanBatchInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, size: found.size }))
		})
	const readFanFanRunInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanFanRunInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, size: found.size }))
		})
	const pauseChains: PauseChains<(typeof FanPausable)["handles"][number]> = {
		flow: FlowName.make("Fan"),
		turns: Effect.map(
			settled(h.coordinator.fanPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(settled(h.coordinator.fanPausedAll.once({ params: {}, facts: {} })), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.fanPause.once({ params: {}, facts: { insert: { FanPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.fanResume.once({ params: {}, facts: { insert: { FanResumed: [row] } } })
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
		FanRun: (key: string, input: Parameters<(typeof fan.kinds)[2]["start"]>[0]) =>
			Effect.flatMap(rootScope("Fan", "FanRun", key), (scope) =>
				Effect.map(
					fresh(
						"Fan",
						settled(
							h.den.fanRequestFanRun.once({
								params: { fanFanRunScope: scope, fanFanRunKey: key },
								facts: {
									insert: {
										FanScope: [{ scope, root: scope }],
										FanFanRunInput: [
											{ scope: scope, root: scope, batch: input.batch, size: input.size }
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
		Square: runnerOf(
			fan.kinds[0],
			{
				input: (step) => readFanSquareInput(step),
				read: () => Effect.succeed({}),
				commit: (done, _at) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.fanCommitSquare.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										FanDone: [{ step: done.turn.step, root: done.turn.root }],
										FanHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										FanSquareOutput: [
											{ step: done.turn.step, root: done.turn.root, square: done.output.square }
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
		BatchFinish: runnerOf(
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
							settled(h.den.fanStepOf.once({ params: { step }, facts: {} })),
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
							settled(h.den.fanOutputsBatchSquare.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresSquare = yield* Effect.map(
							settled(h.den.fanFailuresBatchSquare.once({ params: { scope }, facts: {} })),
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
						settled(
							h.commits.fanCommitBatchFinish.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										FanDone: [{ step: done.turn.step, root: done.turn.root }],
										FanHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										Tally: done.writes.insert.Tally
									}
								}
							})
						),
						(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
					),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Batch")
		),
		FanRunFinish: runnerOf(
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
							settled(h.den.fanStepOf.once({ params: { step }, facts: {} })),
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
							settled(h.den.fanEndingsFanRunBatch.once({ params: { scope }, facts: {} })),
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
						settled(
							h.commits.fanCommitFanRunFinish.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										FanDone: [{ step: done.turn.step, root: done.turn.root }],
										FanHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										Settled: done.writes.insert.Settled
									}
								}
							})
						),
						(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
					),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("FanRun")
		)
	}
	const roots: { readonly [K in (typeof FanRootKind)["handles"][number]]: RootRunner } = {
		FanRun: {
			window: fan.kinds[2].window,
			precondition: fan.kinds[2].precondition,
			admit: (scope: ScopeKey, at: Instant) =>
				Effect.gen(function* () {
					const input = yield* readFanFanRunInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startFanRun(scope, scope, input.value, at)
					const finish = yield* finishStep(scope)
					const steps: ReadonlyArray<Addition<typeof FanStep>> = [
						...grown.rows.FanStep,
						{ step: finish, kind: "FanRunFinish", scope, due: at, root: scope }
					]
					const admitted: ReadonlyArray<Addition<typeof FanAdmitted>> = [
						...grown.rows.FanAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof FanFinish>> = [
						...grown.rows.FanFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.fanAdmit.once({
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
									FanAdmitted: admitted,
									FanFinish: finishes
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
	const ledger: Ledger<FlowNeeds<typeof fan>> = {
		flow: FlowName.make("Fan"),
		now: Effect.flatMap(settled(h.den.fanNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.fanAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.map(settled(h.den.fanHolds.once({ params: {}, facts: {} })), rowsOf),
		stepOf: (step) =>
			Effect.map(settled(h.den.fanStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.fanResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.fanHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.fanClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.fanRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.fanFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.fanRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					const within = yield* Effect.map(
						settled(h.den.fanWithinOf.once({ params: { scope: scope }, facts: {} })),
						one
					)
					return Option.map(within, (w): ScopeView => ({
						place: "child",
						scope,
						kind: w.kind,
						parent: w.parent
					}))
				}
				const admitted = yield* Effect.map(
					settled(h.den.fanAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.fanSkippedOf.once({ params: { scope: scope }, facts: {} })),
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
			Effect.flatMap(
				h.den.fanUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
				(steps) =>
					steps
						? Effect.succeed(true)
						: h.den.fanOpenChildren.once({ params: { scope }, facts: {} }).pipe(settled, any)
			),
		finished: (scope) =>
			h.den.fanFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.fanClaim.once({
						params: {},
						facts: {
							insert: {
								FanClaim: [
									{ step: row.step, root: row.root, until: row.until, holds: holdsOf(row.seats) }
								],
								FanEnded: row.lapsed
							}
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.fanRetry.once({
					params: {},
					facts: {
						insert: {
							FanEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							FanRetry: [row]
						}
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.fanFence.once({
					params: {},
					facts: {
						insert: {
							FanEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							FanFenced: [row]
						}
					}
				})
			),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.fanRefuse.once({
					params: {},
					facts: {
						insert: {
							FanResult: [{ step, root, outcome: "failed" }],
							FanFailed: [{ step, root }],
							FanHeld: [{ step, root, attempt }],
							FanRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.fanSkip.once({
					params: {},
					facts: { insert: { FanSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.fanExhaust.once({
					params: {},
					facts: {
						insert: {
							FanResult: [{ step, root, outcome: "failed" }],
							FanFailed: [{ step, root }],
							FanHeld: [{ step, root, attempt }],
							FanExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.fanFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ scope: row.scope, kind: row.kind, at: row.at }))
		),
		retire: (root) =>
			settled(
				h.retirer.fanRetire.once({ params: {}, facts: { retire: { FanRoot: [{ scope: root }] } } })
			),
		snapshot: Effect.flatMap(settled(h.den.fanSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof fan>> => {
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
							onNone: () =>
								Arr.map(
									Option.toArray(Arr.findFirst(read.withins, (w) => w.scope === scope)),
									(w): ScopeView => ({ place: "child", scope, kind: w.kind, parent: w.parent })
								)
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
					holds: read.holds,
					exclusives: [],
					paused: Arr.map(read.paused, (row) => row.target),
					busy: []
				}
			})
		),
		changes: Stream.mergeAll(
			[
				signals(h.den.fanPending.watch({ params: {}, facts: {} })),
				signals(h.den.fanRequested.watch({ params: {}, facts: {} })),
				signals(h.den.fanRunning.watch({ params: {}, facts: {} })),
				signals(h.den.fanHolds.watch({ params: {}, facts: {} })),
				signals(h.coordinator.fanPausedAll.watch({ params: {}, facts: {} }))
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
