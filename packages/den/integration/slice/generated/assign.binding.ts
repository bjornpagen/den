import {
	any,
	dueAt,
	fresh,
	held,
	one,
	only,
	ordered,
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
	PauseRow,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Assign over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
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
	AssignDecideInput,
	AssignDecideInputExclude,
	AssignDecideInputModeNearest,
	AssignDecideInputModeWithin
} from "#integration/slice/generated/assign.fragment.ts"
import type {
	assignDenPrograms,
	assignCoordinatorPrograms,
	assignRetirerPrograms,
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
	readonly retirer: {
		readonly [K in keyof typeof assignRetirerPrograms]: MemberHandle<
			(typeof assignRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof assignCommitPrograms]: MemberHandle<
			(typeof assignCommitPrograms)[K]
		>
	}
}

interface Rows {
	readonly AssignStep: ReadonlyArray<Addition<typeof AssignStep>>
	readonly AssignDue: ReadonlyArray<Addition<typeof AssignDue>>
	readonly AssignScope: ReadonlyArray<Addition<typeof AssignScope>>
	readonly AssignWithin: ReadonlyArray<Addition<typeof AssignWithin>>
	readonly AssignAdmitted: ReadonlyArray<Addition<typeof AssignAdmitted>>
	readonly AssignFinish: ReadonlyArray<Addition<typeof AssignFinish>>
	readonly AssignStartStep: ReadonlyArray<Addition<typeof AssignStartStep>>
	readonly AssignStartScope: ReadonlyArray<Addition<typeof AssignStartScope>>
	readonly AssignDecideInput: ReadonlyArray<Addition<typeof AssignDecideInput>>
	readonly AssignDecideInputExclude: ReadonlyArray<Addition<typeof AssignDecideInputExclude>>
	readonly AssignDecideInputModeNearest: ReadonlyArray<
		Addition<typeof AssignDecideInputModeNearest>
	>
	readonly AssignDecideInputModeWithin: ReadonlyArray<Addition<typeof AssignDecideInputModeWithin>>
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
		AssignDecideInput: [],
		AssignDecideInputExclude: [],
		AssignDecideInputModeNearest: [],
		AssignDecideInputModeWithin: []
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
			AssignDecideInput: [...a.rows.AssignDecideInput, ...b.rows.AssignDecideInput],
			AssignDecideInputExclude: [
				...a.rows.AssignDecideInputExclude,
				...b.rows.AssignDecideInputExclude
			],
			AssignDecideInputModeNearest: [
				...a.rows.AssignDecideInputModeNearest,
				...b.rows.AssignDecideInputModeNearest
			],
			AssignDecideInputModeWithin: [
				...a.rows.AssignDecideInputModeWithin,
				...b.rows.AssignDecideInputModeWithin
			]
		},
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startAssignment = (
		root: ScopeKey,
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
							AssignStep: [{ step: key, kind: "Decide", scope: scope, root: root }],
							AssignDue: [{ step: key, at: dueAt(assign.kinds[0].due, at), root: root }],
							AssignStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							AssignDecideInput: [
								{
									step: key,
									root: root,
									learner: spawn.input.learner,
									topic: spawn.input.topic,
									missed: spawn.input.missed,
									mode: spawn.input.mode._tag
								}
							],
							AssignDecideInputExclude: Arr.map(spawn.input.exclude, (element, index) => ({
								step: key,
								root: root,
								ordinal: BigInt(index),
								value: element
							})),
							AssignDecideInputModeNearest: Arr.flatMap([spawn.input.mode], (variant) =>
								variant._tag === "Nearest" ? [{ step: key, root: root }] : []
							),
							AssignDecideInputModeWithin: Arr.flatMap([spawn.input.mode], (variant) =>
								variant._tag === "Within" ? [{ step: key, root: root, radius: variant.radius }] : []
							)
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
				settled(h.den.assignReadAssignDecideInput.once({ params: { step: step }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(h.den.assignReadAssignDecideInputExclude.once({ params: { step }, facts: {} })),
				rowsOf
			)
			const variant0_0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignDecideInputModeNearest.once({ params: { step: step }, facts: {} })
				),
				one
			)
			const variant0_1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignDecideInputModeWithin.once({ params: { step: step }, facts: {} })
				),
				one
			)
			return Option.flatMap(row, (found) =>
				Option.map(
					Option.all({
						mode:
							found.mode === "Nearest"
								? Option.map(variant0_0, () => ({ _tag: "Nearest" as const }))
								: Option.map(variant0_1, (part) => ({
										_tag: "Within" as const,
										radius: part.radius
									}))
					}),
					(unions) => ({
						learner: found.learner,
						topic: found.topic,
						missed: found.missed,
						exclude: Arr.map(ordered(family0), (e) => e.value),
						mode: unions.mode
					})
				)
			)
		})
	const readAssignAssignmentInput = (scope: ScopeKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInput.once({ params: { scope: scope }, facts: {} })
				),
				one
			)
			const family0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputExclude.once({ params: { scope }, facts: {} })
				),
				rowsOf
			)
			const variant0_0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputModeNearest.once({
						params: { scope: scope },
						facts: {}
					})
				),
				one
			)
			const variant0_1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputModeWithin.once({
						params: { scope: scope },
						facts: {}
					})
				),
				one
			)
			return Option.flatMap(row, (found) =>
				Option.map(
					Option.all({
						mode:
							found.mode === "Nearest"
								? Option.map(variant0_0, () => ({ _tag: "Nearest" as const }))
								: Option.map(variant0_1, (part) => ({
										_tag: "Within" as const,
										radius: part.radius
									}))
					}),
					(unions) => ({
						learner: found.learner,
						topic: found.topic,
						missed: found.missed,
						exclude: Arr.map(ordered(family0), (e) => e.value),
						mode: unions.mode
					})
				)
			)
		})
	const coordination: Ledger<never>["coordination"] = {
		seatTurns: Effect.succeed([]),
		holds: Effect.succeed([]),
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		pauseTurns: Effect.map(
			settled(h.coordinator.assignPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		paused: Effect.map(
			settled(h.coordinator.assignPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		take: () => Effect.void,
		giveBack: () => Effect.void,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.assignPause.once({
						params: {},
						facts: { insert: { AssignPaused: pausesOf([row]) } }
					})
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.assignResume.once({
						params: {},
						facts: { insert: { AssignResumed: pausesOf([row]) } }
					})
				)
			)
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
						settled(
							h.den.assignRequestAssignment.once({
								params: {},
								facts: {
									insert: {
										AssignScope: [{ scope, kind: "Assignment" as const, root: scope }],
										AssignRoot: [{ scope, key, at }],
										AssignAssignmentInput: [
											{
												scope: scope,
												root: scope,
												learner: input.learner,
												topic: input.topic,
												missed: input.missed,
												mode: input.mode._tag
											}
										],
										AssignAssignmentInputExclude: Arr.map(input.exclude, (element, index) => ({
											scope: scope,
											root: scope,
											ordinal: BigInt(index),
											value: element
										})),
										AssignAssignmentInputModeNearest: Arr.flatMap([input.mode], (variant) =>
											variant._tag === "Nearest" ? [{ scope: scope, root: scope }] : []
										),
										AssignAssignmentInputModeWithin: Arr.flatMap([input.mode], (variant) =>
											variant._tag === "Within"
												? [{ scope: scope, root: scope, radius: variant.radius }]
												: []
										)
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
		Decide: runnerOf(
			assign.kinds[0],
			{
				input: (step) => readAssignDecideInput(step),
				read: (input) => {
					const nearest = assign.kinds[0].reads.nearest.params(input)
					const seen = assign.kinds[0].reads.seen.params(input)
					return Effect.flatMap(
						settled(
							h.commits.assignReadDecide.once({
								params: {
									"nearest.topic": nearest.topic,
									"nearest.anchor.question": nearest.anchor.question,
									"seen.learner": seen.learner
								},
								facts: {}
							})
						),
						(rows) => Effect.map(only(rows), (row) => ({ nearest: row.nearest, seen: row.seen }))
					)
				},
				commit: (done, _at) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.assignCommitDecide.once({
								params: {},
								facts: {
									insert: {
										AssignResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										AssignDone: [{ step: done.turn.step, root: done.turn.root }],
										AssignHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										AssignDecideOutput: [
											{
												step: done.turn.step,
												root: done.turn.root,
												confidence: done.output.confidence,
												stage: done.output.stage._tag
											}
										],
										AssignDecideOutputWeighed: Arr.map(done.output.weighed, (element, index) => ({
											step: done.turn.step,
											root: done.turn.root,
											ordinal: BigInt(index),
											passage: element.passage,
											distance: element.distance,
											passed: element.passed
										})),
										AssignDecideOutputStageServe: Arr.flatMap([done.output.stage], (variant) =>
											variant._tag === "Serve"
												? [
														{
															step: done.turn.step,
															root: done.turn.root,
															passage: variant.passage,
															distance: variant.distance
														}
													]
												: []
										),
										AssignDecideOutputStageRest: Arr.flatMap([done.output.stage], (variant) =>
											variant._tag === "Rest"
												? [{ step: done.turn.step, root: done.turn.root }]
												: []
										),
										AssignDecideNearestRead: Arr.map(done.rows.nearest, (row, ordinal) => ({
											...row,
											step: done.turn.step,
											root: done.turn.root,
											ordinal: BigInt(ordinal)
										})),
										AssignDecideSeenRead: Arr.map(done.rows.seen, (row, ordinal) => ({
											...row,
											step: done.turn.step,
											root: done.turn.root,
											ordinal: BigInt(ordinal)
										})),
										Assigned: done.writes.insert.Assigned
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
		AssignmentFinish: runnerOf(
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
							settled(h.den.assignStepOf.once({ params: { step }, facts: {} })),
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
							settled(h.den.assignOutputsAssignmentDecide.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const familyDecide0 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideWeighed.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const variantDecide0_0 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideStageServe.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const variantDecide0_1 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideStageRest.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const failuresDecide = yield* Effect.map(
							settled(h.den.assignFailuresAssignmentDecide.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const Decide = [
							...(yield* Effect.forEach(rowsDecide, (row) =>
								Effect.map(
									held(
										Option.map(
											Option.all({
												stage:
													row.stage === "Serve"
														? Option.map(
																Arr.findFirst(variantDecide0_0, (o) => o.step === row.step),
																(part) => ({
																	_tag: "Serve" as const,
																	passage: part.passage,
																	distance: part.distance
																})
															)
														: Option.map(
																Arr.findFirst(variantDecide0_1, (o) => o.step === row.step),
																() => ({ _tag: "Rest" as const })
															)
											}),
											(unions) => ({
												confidence: row.confidence,
												weighed: Arr.map(
													ordered(Arr.filter(familyDecide0, (o) => o.step === row.step)),
													(e) => ({ passage: e.passage, distance: e.distance, passed: e.passed })
												),
												stage: unions.stage
											})
										)
									),
									(output) => ({ _tag: "Done" as const, output })
								)
							)),
							...Arr.map(failuresDecide, () => ({ _tag: "Failed" as const }))
						]
						return Option.some({ input: input.value, endings: { Decide } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.map(
						settled(
							h.commits.assignCommitAssignmentFinish.once({
								params: {},
								facts: {
									insert: {
										AssignResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										AssignDone: [{ step: done.turn.step, root: done.turn.root }],
										AssignHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										Concluded: done.writes.insert.Concluded
									}
								}
							})
						),
						(outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })
					),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Assignment")
		)
	}
	const ledger: Ledger<FlowNeeds<typeof assign>> = {
		flow: FlowName.make("Assign"),
		now: Effect.flatMap(settled(h.den.assignNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.assignAuthenticated.once({ params: {}, facts: {} }))
		),
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
							const grown = yield* startAssignment(scope, scope, input.value, at)
							const finish = yield* finishStep(scope)
							const steps: ReadonlyArray<Addition<typeof AssignStep>> = [
								...grown.rows.AssignStep,
								{ step: finish, kind: "AssignmentFinish", scope, root: scope }
							]
							const dues: ReadonlyArray<Addition<typeof AssignDue>> = [
								...grown.rows.AssignDue,
								{ step: finish, at, root: scope }
							]
							const admitted: ReadonlyArray<Addition<typeof AssignAdmitted>> = [
								...grown.rows.AssignAdmitted,
								{ scope, root: scope }
							]
							const finishes: ReadonlyArray<Addition<typeof AssignFinish>> = [
								...grown.rows.AssignFinish,
								{ scope, step: finish, root: scope }
							]
							const outcome = yield* settled(
								h.den.assignAdmit.once({
									params: {},
									facts: {
										insert: {
											AssignScope: grown.rows.AssignScope,
											AssignWithin: grown.rows.AssignWithin,
											AssignStartStep: grown.rows.AssignStartStep,
											AssignStartScope: grown.rows.AssignStartScope,
											AssignDecideInput: grown.rows.AssignDecideInput,
											AssignDecideInputExclude: grown.rows.AssignDecideInputExclude,
											AssignDecideInputModeNearest: grown.rows.AssignDecideInputModeNearest,
											AssignDecideInputModeWithin: grown.rows.AssignDecideInputModeWithin,
											AssignStep: steps,
											AssignDue: dues,
											AssignAdmitted: admitted,
											AssignFinish: finishes
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
			Effect.map(settled(h.den.assignStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root
				}))
			),
		resultOf: (step) =>
			Effect.map(settled(h.den.assignResultOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (step) =>
			Effect.map(settled(h.den.assignHeldOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.attempt)
			),
		dueOf: (step) =>
			Effect.map(settled(h.den.assignDueOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => row.at)
			),
		claimsOf: (step) =>
			Effect.map(settled(h.den.assignClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.assignRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.assignFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const row = yield* Effect.map(
					settled(h.den.assignScopeOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(row)) {
					return Option.none()
				}
				const root = yield* Effect.map(
					settled(h.den.assignRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					const within = yield* Effect.map(
						settled(h.den.assignWithinOf.once({ params: { scope: scope }, facts: {} })),
						one
					)
					return Option.map(within, (w): ScopeView => ({
						place: "child",
						scope,
						kind: row.value.kind,
						parent: w.parent
					}))
				}
				const admitted = yield* Effect.map(
					settled(h.den.assignAdmittedOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.assignSkippedOf.once({ params: { scope: scope }, facts: {} })),
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
					kind: row.value.kind,
					key: root.value.key,
					at: root.value.at,
					admission,
					exclusive: Option.none()
				})
			}),
		unended: (scope) =>
			Effect.flatMap(
				h.den.assignUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
				(steps) =>
					steps
						? Effect.succeed(true)
						: h.den.assignOpenChildren.once({ params: { scope }, facts: {} }).pipe(settled, any)
			),
		finished: (scope) =>
			h.den.assignFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		claim: (row) =>
			Effect.map(
				settled(h.den.assignClaim.once({ params: {}, facts: { insert: { AssignClaim: [row] } } })),
				(outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)
			),
		retry: (row) =>
			settled(h.den.assignRetry.once({ params: {}, facts: { insert: { AssignRetry: [row] } } })),
		fence: (row) =>
			settled(h.den.assignFence.once({ params: {}, facts: { insert: { AssignFenced: [row] } } })),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.assignRefuse.once({
					params: {},
					facts: {
						insert: {
							AssignResult: [{ step, root, outcome: "failed" }],
							AssignFailed: [{ step, root }],
							AssignHeld: [{ step, root, attempt }],
							AssignRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.assignSkip.once({
					params: {},
					facts: { insert: { AssignSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.assignExhaust.once({
					params: {},
					facts: {
						insert: {
							AssignResult: [{ step, root, outcome: "failed" }],
							AssignFailed: [{ step, root }],
							AssignHeld: [{ step, root, attempt }],
							AssignExhausted: [{ step, root, attempts: attempt }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.assignFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ scope: row.scope, kind: row.kind, at: row.at }))
		),
		retire: (root) =>
			settled(
				h.retirer.assignRetire.once({
					params: {},
					facts: { retire: { AssignRoot: [{ scope: root }] } }
				})
			),
		snapshot: Effect.flatMap(
			settled(h.den.assignSnapshot.once({ params: {}, facts: {} })),
			(rows) =>
				Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof assign>> => {
					const view = (
						scope: ScopeKey,
						kind: string,
						admission: Admission
					): ReadonlyArray<ScopeView> =>
						Option.match(
							Arr.findFirst(read.roots, (o) => o.scope === scope),
							{
								onSome: (o): ReadonlyArray<ScopeView> => [
									{
										place: "root",
										scope,
										kind,
										key: o.key,
										at: o.at,
										admission,
										exclusive: Option.none()
									}
								],
								onNone: () =>
									Arr.map(
										Option.toArray(Arr.findFirst(read.withins, (w) => w.scope === scope)),
										(w): ScopeView => ({ place: "child", scope, kind, parent: w.parent })
									)
							}
						)
					return {
						steps: Arr.map(read.steps, (s) => ({
							step: s.step,
							runner: runners[s.kind],
							scope: s.scope
						})),
						claims: read.claims,
						retries: read.retries,
						fenced: read.fenced,
						dues: read.dues,
						scopes: [
							...Arr.flatMap(read.requested, (s) => view(s.scope, s.kind, "requested")),
							...Arr.flatMap(read.running, (s) => view(s.scope, s.kind, "admitted"))
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
