import {
	any,
	committedFacts,
	delayAfter,
	fresh,
	one,
	only,
	readingOf,
	rowsOf,
	signals
} from "@bjornpagen/den/runtime/bind"
import {
	atOnce,
	type Delay,
	finishStep,
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
/** The ledger port of the flow Writeback over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { writeback } from "#integration/slice/flows.ts"
import { WritebackPausable } from "#integration/slice/generated/writeback.fragment.ts"
import type {
	WritebackScope,
	WritebackAdmitted,
	WritebackFinish,
	WritebackStartStep,
	WritebackDeliverInput,
	WritebackKind,
	WritebackRootKind
} from "#integration/slice/generated/writeback.fragment.ts"
import type {
	writebackDenPrograms,
	writebackCoordinatorPrograms,
	writebackRetirerPrograms,
	writebackCommitPrograms
} from "#integration/slice/generated/writeback.programs.ts"

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface WritebackHandles {
	readonly den: {
		readonly [K in keyof typeof writebackDenPrograms]: MemberHandle<
			(typeof writebackDenPrograms)[K]
		>
	}
	readonly coordinator: {
		readonly [K in keyof typeof writebackCoordinatorPrograms]: MemberHandle<
			(typeof writebackCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof writebackRetirerPrograms]: MemberHandle<
			(typeof writebackRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof writebackCommitPrograms]: MemberHandle<
			(typeof writebackCommitPrograms)[K]
		>
	}
}

interface Rows {
	readonly WritebackScope: ReadonlyArray<Addition<typeof WritebackScope>>
	readonly WritebackAdmitted: ReadonlyArray<Addition<typeof WritebackAdmitted>>
	readonly WritebackFinish: ReadonlyArray<Addition<typeof WritebackFinish>>
	readonly WritebackStartStep: ReadonlyArray<Addition<typeof WritebackStartStep>>
	readonly WritebackDeliverInput: ReadonlyArray<Addition<typeof WritebackDeliverInput>>
}

/** A step a call spawns, as the call names it: the database writes its due instant, its delay after the call's reading. */
interface SpawnRow {
	readonly step: StepKey
	readonly kind: (typeof WritebackKind)["handles"][number]
	readonly scope: ScopeKey
	readonly delay: Delay
}

interface Grown {
	readonly rows: Rows
	readonly steps: ReadonlyArray<SpawnRow>
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof WritebackPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(WritebackPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Writeback"), target })
	)

/** The ledger of the flow Writeback over its handles, with the requests of its roots. */
export const writebackLedger = (h: WritebackHandles) => {
	const noRows: Rows = {
		WritebackScope: [],
		WritebackAdmitted: [],
		WritebackFinish: [],
		WritebackStartStep: [],
		WritebackDeliverInput: []
	}
	const nothingGrown: Grown = { rows: noRows, steps: [], spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.WritebackStartStep, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			WritebackScope: [...a.rows.WritebackScope, ...b.rows.WritebackScope],
			WritebackAdmitted: [...a.rows.WritebackAdmitted, ...b.rows.WritebackAdmitted],
			WritebackFinish: [...a.rows.WritebackFinish, ...b.rows.WritebackFinish],
			WritebackStartStep: [...a.rows.WritebackStartStep, ...b.rows.WritebackStartStep],
			WritebackDeliverInput: [...a.rows.WritebackDeliverInput, ...b.rows.WritebackDeliverInput]
		},
		steps: [...a.steps, ...b.steps],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startWriteback = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof writeback.kinds)[1]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				writeback.kinds[1].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							WritebackStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							WritebackDeliverInput: [{ step: key, root: root, attempt: spawn.input.attempt }]
						},
						steps: [
							{
								step: key,
								kind: "Deliver",
								scope: scope,
								delay: delayAfter(writeback.kinds[0].due)
							}
						],
						spawned: {
							steps: [{ step: key, kind: "Deliver", delay: delayAfter(writeback.kinds[0].due) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readWritebackDeliverInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(
					h.den.writebackReadWritebackDeliverInput.once({ params: { step: step }, facts: {} })
				),
				one
			)
			return Option.map(row, (found) => ({ attempt: found.attempt }))
		})
	const readWritebackWritebackInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(
					h.den.writebackReadWritebackWritebackInput.once({ params: { scope: scope }, facts: {} })
				),
				one
			)
			return Option.map(row, (found) => ({ attempt: found.attempt }))
		})
	const pauseChains: PauseChains<(typeof WritebackPausable)["handles"][number]> = {
		flow: FlowName.make("Writeback"),
		turns: Effect.map(
			settled(h.coordinator.writebackPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.writebackPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.writebackPause.once({
						params: {},
						facts: { insert: { WritebackPaused: [row] } }
					})
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.writebackResume.once({
						params: {},
						facts: { insert: { WritebackResumed: [row] } }
					})
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
		Writeback: (key: string, input: Parameters<(typeof writeback.kinds)[1]["start"]>[0]) =>
			Effect.flatMap(rootScope("Writeback", "Writeback", key), (scope) =>
				Effect.map(
					fresh(
						"Writeback",
						settled(
							h.den.writebackRequestWriteback.once({
								params: { writebackWritebackScope: scope, writebackWritebackKey: key },
								facts: {
									insert: {
										WritebackScope: [{ scope, root: scope }],
										WritebackWritebackInput: [{ scope: scope, root: scope, attempt: input.attempt }]
									}
								}
							})
						)
					),
					(accepted) => ({ flow: FlowName.make("Writeback"), scope, fresh: accepted })
				)
			)
	}
	const runners = {
		Deliver: runnerOf(
			writeback.kinds[0],
			{
				input: (step) => readWritebackDeliverInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.writebackCommitDeliver.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											WritebackResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											WritebackDone: [{ step: done.turn.step, root: done.turn.root }],
											WritebackHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											WritebackDeliverOutput: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.output.attempt }
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
		WritebackFinish: runnerOf(
			{
				name: "WritebackFinish",
				uses: writeback.kinds[1].finish.uses,
				retry: writeback.kinds[1].finish.retry,
				waits: writeback.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof writeback.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof writeback.kinds)[1]["finish"]["body"]>[1]
				}) => writeback.kinds[1].finish.body(read.input, read.endings)
			},
			{
				input: (step) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.writebackStepOf.once({ params: { step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readWritebackWritebackInput(scope)
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
							h.commits.writebackCommitWritebackFinish.once({
								params: {},
								facts: {
									insert: {
										WritebackResult: [
											{ step: done.turn.step, root: done.turn.root, outcome: "done" }
										],
										WritebackDone: [{ step: done.turn.step, root: done.turn.root }],
										WritebackHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										WritebackWritebackFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
									}
								}
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Writeback")
		)
	}
	const roots: { readonly [K in (typeof WritebackRootKind)["handles"][number]]: RootRunner } = {
		Writeback: {
			window: writeback.kinds[1].window,
			precondition: writeback.kinds[1].precondition,
			admit: (scope: ScopeKey) =>
				Effect.gen(function* () {
					const input = yield* readWritebackWritebackInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startWriteback(scope, scope, input.value)
					const finish = yield* finishStep(scope)
					const steps: ReadonlyArray<SpawnRow> = [
						...grown.steps,
						{ step: finish, kind: "WritebackFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof WritebackAdmitted>> = [
						...grown.rows.WritebackAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof WritebackFinish>> = [
						...grown.rows.WritebackFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.writebackAdmit.once({
							params: { steps, root: scope },
							facts: {
								insert: {
									WritebackScope: grown.rows.WritebackScope,
									WritebackStartStep: grown.rows.WritebackStartStep,
									WritebackDeliverInput: grown.rows.WritebackDeliverInput,
									WritebackAdmitted: admitted,
									WritebackFinish: finishes
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
	const ledger: Ledger<FlowNeeds<typeof writeback>> = {
		flow: FlowName.make("Writeback"),
		now: Effect.flatMap(settled(h.den.writebackNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.writebackAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (step) =>
			Effect.map(settled(h.den.writebackStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.writebackResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.writebackHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.writebackClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.writebackRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.writebackFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.writebackRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.writebackAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.writebackSkippedOf.once({ params: { scope: scope }, facts: {} })),
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
			h.den.writebackUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
		finished: (scope) =>
			h.den.writebackFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.writebackClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: {
								WritebackClaim: [{ step: row.step, root: row.root }],
								WritebackEnded: row.lapsed
							}
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.writebackRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { WritebackEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.writebackFence.once({
					params: {},
					facts: {
						insert: {
							WritebackEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							WritebackFenced: [row]
						}
					}
				})
			),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.writebackRefuse.once({
					params: {},
					facts: {
						insert: {
							WritebackResult: [{ step, root, outcome: "failed" }],
							WritebackFailed: [{ step, root }],
							WritebackHeld: [{ step, root, attempt }],
							WritebackRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.writebackSkip.once({
					params: {},
					facts: { insert: { WritebackSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.writebackExhaust.once({
					params: {},
					facts: {
						insert: {
							WritebackResult: [{ step, root, outcome: "failed" }],
							WritebackFailed: [{ step, root }],
							WritebackHeld: [{ step, root, attempt }],
							WritebackExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.writebackFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) =>
			settled(
				h.retirer.writebackRetire.once({
					params: {},
					facts: { retire: { WritebackRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.flatMap(
			settled(h.den.writebackSnapshot.once({ params: {}, facts: {} })),
			(rows) =>
				Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof writeback>> => {
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
				signals(h.den.writebackPending.watch({ params: {}, facts: {} })),
				signals(h.den.writebackRequested.watch({ params: {}, facts: {} })),
				signals(h.den.writebackRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.writebackPausedAll.watch({ params: {}, facts: {} }))
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
