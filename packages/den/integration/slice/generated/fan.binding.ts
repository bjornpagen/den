import {
	any,
	committedFacts,
	dueOf,
	fresh,
	held,
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
	startedScope,
	startedStep
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
import { settled } from "@bjornpagen/den/runtime/settled"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Fan over its served programs; `den generate` writes it, and nothing edits it. */
import { type Addition, Sha256 } from "@bjornpagen/grizzle"
import type { MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, pipe, Stream } from "effect"
import { fan } from "#integration/slice/flows.ts"
import { FanPausable, FanResource } from "#integration/slice/generated/fan.fragment.ts"
import type {
	FanScope,
	FanWithin,
	FanAdmitted,
	FanFinish,
	FanStartStep,
	FanStartScope,
	FanSquareInput,
	FanDustInput,
	FanMopInput,
	FanBatchInput,
	FanKind,
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
	readonly FanScope: ReadonlyArray<Addition<typeof FanScope>>
	readonly FanWithin: ReadonlyArray<Addition<typeof FanWithin>>
	readonly FanAdmitted: ReadonlyArray<Addition<typeof FanAdmitted>>
	readonly FanFinish: ReadonlyArray<Addition<typeof FanFinish>>
	readonly FanStartStep: ReadonlyArray<Addition<typeof FanStartStep>>
	readonly FanStartScope: ReadonlyArray<Addition<typeof FanStartScope>>
	readonly FanSquareInput: ReadonlyArray<Addition<typeof FanSquareInput>>
	readonly FanDustInput: ReadonlyArray<Addition<typeof FanDustInput>>
	readonly FanMopInput: ReadonlyArray<Addition<typeof FanMopInput>>
	readonly FanBatchInput: ReadonlyArray<Addition<typeof FanBatchInput>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof FanKind)["handles"][number]> {
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
		FanScope: [],
		FanWithin: [],
		FanAdmitted: [],
		FanFinish: [],
		FanStartStep: [],
		FanStartScope: [],
		FanSquareInput: [],
		FanDustInput: [],
		FanMopInput: [],
		FanBatchInput: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: Sha256): boolean =>
		Arr.some(grown.rows.FanStartStep, (s) => Sha256.equals(s.scope, scope)) ||
		Arr.some(grown.rows.FanStartScope, (s) => Sha256.equals(s.scope, scope))
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			FanScope: [...a.rows.FanScope, ...b.rows.FanScope],
			FanWithin: [...a.rows.FanWithin, ...b.rows.FanWithin],
			FanAdmitted: [...a.rows.FanAdmitted, ...b.rows.FanAdmitted],
			FanFinish: [...a.rows.FanFinish, ...b.rows.FanFinish],
			FanStartStep: [...a.rows.FanStartStep, ...b.rows.FanStartStep],
			FanStartScope: [...a.rows.FanStartScope, ...b.rows.FanStartScope],
			FanSquareInput: [...a.rows.FanSquareInput, ...b.rows.FanSquareInput],
			FanDustInput: [...a.rows.FanDustInput, ...b.rows.FanDustInput],
			FanMopInput: [...a.rows.FanMopInput, ...b.rows.FanMopInput],
			FanBatchInput: [...a.rows.FanBatchInput, ...b.rows.FanBatchInput]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startBatch = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof fan.kinds)[1]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(fan.kinds[1].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						FanStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						FanSquareInput: [{ step: key, root: root, batch: spawn.input.batch, n: spawn.input.n }]
					},
					...spawnedOf(
						{ step: key, kind: "Square", scope: scope },
						dueOf(fan.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const startFanRun = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof fan.kinds)[2]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(fan.kinds[2].start(input), (spawn, ordinal): Grown =>
				pipe(startedScope(scope, ordinal), (key): Grown =>
					pipe(startBatch(root, key, spawn.input), (inner): Grown =>
						pipe(finishStep(key), (finish): Grown =>
							joined(inner, {
								rows: {
									...noRows,
									FanScope: [{ scope: key, root: root }],
									FanWithin: [{ scope: key, parent: scope, kind: "Batch", root: root }],
									FanAdmitted: [{ scope: key, root: root }],
									FanFinish: [{ scope: key, step: finish, root: root }],
									FanStartScope: [{ scope, ordinal: BigInt(ordinal), child: key, root }],
									FanBatchInput: [
										{ scope: key, root: root, batch: spawn.input.batch, size: spawn.input.size }
									]
								},
								steps: [{ step: finish, kind: "BatchFinish", scope: key, delay: atOnce }],
								timed: [],
								spawned: { steps: [], finishes: hasChildren(inner, key) ? [] : [finish] }
							})
						)
					)
				)
			),
			nothingGrown,
			joined
		)
	const startSweep = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof fan.kinds)[5]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(fan.kinds[5].start(input), (spawn, ordinal): Grown => {
				switch (spawn.kind) {
					case "Dust":
						return pipe(startedStep(scope, ordinal), (key): Grown => ({
							rows: {
								...noRows,
								FanStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
								FanDustInput: [{ step: key, root: root, sweep: spawn.input.sweep }]
							},
							...spawnedOf(
								{ step: key, kind: "Dust", scope: scope },
								dueOf(fan.kinds[3].due, spawn.input)
							)
						}))
					case "Mop":
						return pipe(startedStep(scope, ordinal), (key): Grown => ({
							rows: {
								...noRows,
								FanStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
								FanMopInput: [{ step: key, root: root, sweep: spawn.input.sweep }]
							},
							...spawnedOf(
								{ step: key, kind: "Mop", scope: scope },
								dueOf(fan.kinds[4].due, spawn.input)
							)
						}))
				}
			}),
			nothingGrown,
			joined
		)
	const readFanSquareInput = (step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanSquareInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, n: found.n }))
		})
	const readFanDustInput = (step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanDustInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ sweep: found.sweep }))
		})
	const readFanMopInput = (step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanMopInput.once({ params: { step: step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ sweep: found.sweep }))
		})
	const readFanBatchInput = (scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanBatchInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, size: found.size }))
		})
	const readFanFanRunInput = (scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanFanRunInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ batch: found.batch, size: found.size }))
		})
	const readFanSweepInput = (scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.fanReadFanSweepInput.once({ params: { scope: scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ sweep: found.sweep }))
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
			pipe(rootScope("Fan", "FanRun", key), (scope) =>
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
					(accepted) => ({ flow: FlowName.make("Fan"), scope, fresh: accepted })
				)
			),
		Sweep: (key: string, input: Parameters<(typeof fan.kinds)[5]["start"]>[0]) =>
			pipe(rootScope("Fan", "Sweep", key), (scope) =>
				Effect.map(
					fresh(
						"Fan",
						settled(
							h.den.fanRequestSweep.once({
								params: { fanSweepScope: scope, fanSweepKey: key },
								facts: {
									insert: {
										FanScope: [{ scope, root: scope }],
										FanSweepInput: [{ scope: scope, root: scope, sweep: input.sweep }]
									}
								}
							})
						)
					),
					(accepted) => ({ flow: FlowName.make("Fan"), scope, fresh: accepted })
				)
			)
	}
	const runners = {
		Square: runnerOf(
			fan.kinds[0],
			{
				input: (step) => readFanSquareInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
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
		Dust: runnerOf(
			fan.kinds[3],
			{
				input: (step) => readFanDustInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.fanCommitDust.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										FanDone: [{ step: done.turn.step, root: done.turn.root }],
										FanHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										FanDustOutput: [
											{ step: done.turn.step, root: done.turn.root, sweep: done.output.sweep }
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
		Mop: runnerOf(
			fan.kinds[4],
			{
				input: (step) => readFanMopInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.fanCommitMop.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										FanDone: [{ step: done.turn.step, root: done.turn.root }],
										FanHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										FanMopOutput: [
											{ step: done.turn.step, root: done.turn.root, sweep: done.output.sweep }
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
				uses: fan.kinds[1].finish.uses,
				retry: fan.kinds[1].finish.retry,
				waits: fan.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof fan.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof fan.kinds)[1]["finish"]["body"]>[1]
				}) => fan.kinds[1].finish.body(read.input, read.endings)
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
						const outputSquareRows = yield* Effect.map(
							settled(h.den.fanOutputsBatchSquare.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputSquareRows = yield* Effect.map(
							settled(h.den.fanInputsBatchSquare.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresSquare = yield* Effect.map(
							settled(h.den.fanFailuresBatchSquare.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputSquare = (child: (typeof inputSquareRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputSquareRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({ batch: row.batch, n: row.n })
								)
							)
						const Square = [
							...(yield* Effect.forEach(outputSquareRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputSquare(row.step),
										output: Effect.succeed({ square: row.square })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresSquare, (failed) =>
								Effect.map(inputSquare(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Square } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.fanCommitBatchFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
											FanDone: [{ step: done.turn.step, root: done.turn.root }],
											FanHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											FanBatchFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("Batch")
		),
		FanRunFinish: runnerOf(
			{
				name: "FanRunFinish",
				uses: fan.kinds[2].finish.uses,
				retry: fan.kinds[2].finish.retry,
				waits: fan.kinds[2].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof fan.kinds)[2]["start"]>[0]
					readonly endings: Parameters<(typeof fan.kinds)[2]["finish"]["body"]>[1]
				}) => fan.kinds[2].finish.body(read.input, read.endings)
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
						const outputBatchRows = yield* Effect.map(
							settled(h.den.fanOutputsFanRunBatch.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputBatchRows = yield* Effect.map(
							settled(h.den.fanInputsFanRunBatch.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const failuresBatch = yield* Effect.map(
							settled(h.den.fanFailuresFanRunBatch.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputBatch = (child: (typeof inputBatchRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputBatchRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({ batch: row.batch, size: row.size })
								)
							)
						const Batch = [
							...(yield* Effect.forEach(outputBatchRows, (row) =>
								Effect.map(
									Effect.all({ input: inputBatch(row.step), output: Effect.succeed({}) }),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresBatch, (failed) =>
								Effect.map(inputBatch(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Batch } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.fanCommitFanRunFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
											FanDone: [{ step: done.turn.step, root: done.turn.root }],
											FanHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											FanFanRunFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("FanRun")
		),
		SweepFinish: runnerOf(
			{
				name: "SweepFinish",
				uses: fan.kinds[5].finish.uses,
				retry: fan.kinds[5].finish.retry,
				waits: fan.kinds[5].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof fan.kinds)[5]["start"]>[0]
					readonly endings: Parameters<(typeof fan.kinds)[5]["finish"]["body"]>[1]
				}) => fan.kinds[5].finish.body(read.input, read.endings)
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
						const input = yield* readFanSweepInput(scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						return Option.some({ input: input.value, endings: {} })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.fanCommitSweepFinish.once({
								params: {},
								facts: {
									insert: {
										FanResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										FanDone: [{ step: done.turn.step, root: done.turn.root }],
										FanHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										FanSweepFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
									}
								}
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Sweep")
		)
	}
	const roots: { readonly [K in (typeof FanRootKind)["handles"][number]]: RootRunner } = {
		FanRun: {
			window: fan.kinds[2].window,
			precondition: fan.kinds[2].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readFanFanRunInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startFanRun(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "FanRunFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									FanScope: grown.rows.FanScope,
									FanWithin: grown.rows.FanWithin,
									FanStartStep: grown.rows.FanStartStep,
									FanStartScope: grown.rows.FanStartScope,
									FanSquareInput: grown.rows.FanSquareInput,
									FanDustInput: grown.rows.FanDustInput,
									FanMopInput: grown.rows.FanMopInput,
									FanBatchInput: grown.rows.FanBatchInput,
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
		},
		Sweep: {
			window: fan.kinds[5].window,
			precondition: fan.kinds[5].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readFanSweepInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startSweep(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "SweepFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									FanScope: grown.rows.FanScope,
									FanWithin: grown.rows.FanWithin,
									FanStartStep: grown.rows.FanStartStep,
									FanStartScope: grown.rows.FanStartScope,
									FanSquareInput: grown.rows.FanSquareInput,
									FanDustInput: grown.rows.FanDustInput,
									FanMopInput: grown.rows.FanMopInput,
									FanBatchInput: grown.rows.FanBatchInput,
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
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.fanClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: {
								FanClaim: [{ step: row.step, root: row.root, holds: holdsOf(row.seats) }],
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
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { FanEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
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
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) =>
			settled(
				h.retirer.fanRetire.once({ params: {}, facts: { retire: { FanRoot: [{ scope: root }] } } })
			),
		snapshot: Effect.flatMap(settled(h.den.fanSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof fan>> => {
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
							onNone: () =>
								Arr.map(
									Option.toArray(Arr.findFirst(read.withins, (w) => Sha256.equals(w.scope, scope))),
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
					busy: [],
					awaiting: []
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
