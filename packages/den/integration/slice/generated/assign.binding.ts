import {
	any,
	committedFacts,
	delayAfter,
	fresh,
	held,
	one,
	only,
	ordered,
	readingOf,
	rowsOf,
	signals
} from "@bjornpagen/den/runtime/bind"
import {
	edgeStep,
	atOnce,
	type Delay,
	finishStep,
	rootScope,
	rowDigest,
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
/** The ledger port of the flow Assign over its served programs; `den generate` writes it, and nothing edits it. */
import type { Addition } from "@bjornpagen/grizzle"
import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import { assign } from "#integration/slice/flows.ts"
import { AssignPausable } from "#integration/slice/generated/assign.fragment.ts"
import type {
	AssignScope,
	AssignAdmitted,
	AssignFinish,
	AssignStartStep,
	AssignEmbedInput,
	AssignEmbedInputNear,
	AssignEmbedInputExclude,
	AssignEmbedInputModeNearest,
	AssignEmbedInputModeWithin,
	AssignDecideInput,
	AssignDecideInputExclude,
	AssignDecideInputModeNearest,
	AssignDecideInputModeWithin,
	AssignAsked,
	AssignKind,
	AssignRootKind
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
	readonly AssignScope: ReadonlyArray<Addition<typeof AssignScope>>
	readonly AssignAdmitted: ReadonlyArray<Addition<typeof AssignAdmitted>>
	readonly AssignFinish: ReadonlyArray<Addition<typeof AssignFinish>>
	readonly AssignStartStep: ReadonlyArray<Addition<typeof AssignStartStep>>
	readonly AssignEmbedInput: ReadonlyArray<Addition<typeof AssignEmbedInput>>
	readonly AssignEmbedInputNear: ReadonlyArray<Addition<typeof AssignEmbedInputNear>>
	readonly AssignEmbedInputExclude: ReadonlyArray<Addition<typeof AssignEmbedInputExclude>>
	readonly AssignEmbedInputModeNearest: ReadonlyArray<Addition<typeof AssignEmbedInputModeNearest>>
	readonly AssignEmbedInputModeWithin: ReadonlyArray<Addition<typeof AssignEmbedInputModeWithin>>
	readonly AssignDecideInput: ReadonlyArray<Addition<typeof AssignDecideInput>>
	readonly AssignDecideInputExclude: ReadonlyArray<Addition<typeof AssignDecideInputExclude>>
	readonly AssignDecideInputModeNearest: ReadonlyArray<
		Addition<typeof AssignDecideInputModeNearest>
	>
	readonly AssignDecideInputModeWithin: ReadonlyArray<Addition<typeof AssignDecideInputModeWithin>>
	readonly AssignAsked: ReadonlyArray<Addition<typeof AssignAsked>>
}

/** A step a call spawns, as the call names it: the database writes its due instant, its delay after the call's reading. */
interface SpawnRow {
	readonly step: StepKey
	readonly kind: (typeof AssignKind)["handles"][number]
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
): Effect.Effect<(typeof AssignPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(AssignPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Assign"), target })
	)

/** The ledger of the flow Assign over its handles, with the requests of its roots. */
export const assignLedger = (h: AssignHandles) => {
	const noRows: Rows = {
		AssignScope: [],
		AssignAdmitted: [],
		AssignFinish: [],
		AssignStartStep: [],
		AssignEmbedInput: [],
		AssignEmbedInputNear: [],
		AssignEmbedInputExclude: [],
		AssignEmbedInputModeNearest: [],
		AssignEmbedInputModeWithin: [],
		AssignDecideInput: [],
		AssignDecideInputExclude: [],
		AssignDecideInputModeNearest: [],
		AssignDecideInputModeWithin: [],
		AssignAsked: []
	}
	const nothingGrown: Grown = { rows: noRows, steps: [], spawned: { steps: [], finishes: [] } }
	const hasChildren = (grown: Grown, scope: ScopeKey): boolean =>
		Arr.some(grown.rows.AssignStartStep, (s) => s.scope === scope)
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			AssignScope: [...a.rows.AssignScope, ...b.rows.AssignScope],
			AssignAdmitted: [...a.rows.AssignAdmitted, ...b.rows.AssignAdmitted],
			AssignFinish: [...a.rows.AssignFinish, ...b.rows.AssignFinish],
			AssignStartStep: [...a.rows.AssignStartStep, ...b.rows.AssignStartStep],
			AssignEmbedInput: [...a.rows.AssignEmbedInput, ...b.rows.AssignEmbedInput],
			AssignEmbedInputNear: [...a.rows.AssignEmbedInputNear, ...b.rows.AssignEmbedInputNear],
			AssignEmbedInputExclude: [
				...a.rows.AssignEmbedInputExclude,
				...b.rows.AssignEmbedInputExclude
			],
			AssignEmbedInputModeNearest: [
				...a.rows.AssignEmbedInputModeNearest,
				...b.rows.AssignEmbedInputModeNearest
			],
			AssignEmbedInputModeWithin: [
				...a.rows.AssignEmbedInputModeWithin,
				...b.rows.AssignEmbedInputModeWithin
			],
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
			],
			AssignAsked: [...a.rows.AssignAsked, ...b.rows.AssignAsked]
		},
		steps: [...a.steps, ...b.steps],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startAssignment = (
		root: ScopeKey,
		scope: ScopeKey,
		input: Parameters<(typeof assign.kinds)[2]["start"]>[0]
	): Effect.Effect<Grown, never, Digest.Digest> =>
		Effect.map(
			Effect.forEach(
				assign.kinds[2].start(input),
				(spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
					Effect.map(startedStep(scope, ordinal), (key): Grown => ({
						rows: {
							...noRows,
							AssignStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
							AssignEmbedInput: [
								{
									step: key,
									root: root,
									learner: spawn.input.learner,
									topic: spawn.input.topic,
									mode: spawn.input.mode._tag
								}
							],
							AssignEmbedInputNear: Arr.map(spawn.input.near, (element, index) => ({
								step: key,
								root: root,
								ordinal: BigInt(index),
								value: element
							})),
							AssignEmbedInputExclude: Arr.map(spawn.input.exclude, (element, index) => ({
								step: key,
								root: root,
								ordinal: BigInt(index),
								value: element
							})),
							AssignEmbedInputModeNearest: Arr.flatMap([spawn.input.mode], (variant) =>
								variant._tag === "Nearest" ? [{ step: key, root: root }] : []
							),
							AssignEmbedInputModeWithin: Arr.flatMap([spawn.input.mode], (variant) =>
								variant._tag === "Within" ? [{ step: key, root: root, radius: variant.radius }] : []
							)
						},
						steps: [
							{ step: key, kind: "Embed", scope: scope, delay: delayAfter(assign.kinds[0].due) }
						],
						spawned: {
							steps: [{ step: key, kind: "Embed", delay: delayAfter(assign.kinds[0].due) }],
							finishes: []
						}
					}))
			),
			(parts) => Arr.reduce(parts, nothingGrown, joined)
		)
	const readAssignEmbedInput = (step: StepKey) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.assignReadAssignEmbedInput.once({ params: { step: step }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(h.den.assignReadAssignEmbedInputNear.once({ params: { step }, facts: {} })),
				rowsOf
			)
			const family1 = yield* Effect.map(
				settled(h.den.assignReadAssignEmbedInputExclude.once({ params: { step }, facts: {} })),
				rowsOf
			)
			const variant0_0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignEmbedInputModeNearest.once({ params: { step: step }, facts: {} })
				),
				one
			)
			const variant0_1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignEmbedInputModeWithin.once({ params: { step: step }, facts: {} })
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
						near: Arr.map(ordered(family0), (e) => e.value),
						exclude: Arr.map(ordered(family1), (e) => e.value),
						mode: unions.mode
					})
				)
			)
		})
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
						vector: found.vector,
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
				settled(h.den.assignReadAssignAssignmentInputNear.once({ params: { scope }, facts: {} })),
				rowsOf
			)
			const family1 = yield* Effect.map(
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
						near: Arr.map(ordered(family0), (e) => e.value),
						exclude: Arr.map(ordered(family1), (e) => e.value),
						mode: unions.mode
					})
				)
			)
		})
	const pauseChains: PauseChains<(typeof AssignPausable)["handles"][number]> = {
		flow: FlowName.make("Assign"),
		turns: Effect.map(
			settled(h.coordinator.assignPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.assignPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.assignPause.once({ params: {}, facts: { insert: { AssignPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.assignResume.once({
						params: {},
						facts: { insert: { AssignResumed: [row] } }
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
		Assignment: (key: string, input: Parameters<(typeof assign.kinds)[2]["start"]>[0]) =>
			Effect.flatMap(rootScope("Assign", "Assignment", key), (scope) =>
				Effect.map(
					fresh(
						"Assign",
						settled(
							h.den.assignRequestAssignment.once({
								params: { assignAssignmentScope: scope, assignAssignmentKey: key },
								facts: {
									insert: {
										AssignScope: [{ scope, root: scope }],
										AssignAssignmentInput: [
											{
												scope: scope,
												root: scope,
												learner: input.learner,
												topic: input.topic,
												mode: input.mode._tag
											}
										],
										AssignAssignmentInputNear: Arr.map(input.near, (element, index) => ({
											scope: scope,
											root: scope,
											ordinal: BigInt(index),
											value: element
										})),
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
					(accepted) => ({ flow: FlowName.make("Assign"), scope, fresh: accepted })
				)
			)
	}
	const runners = {
		Embed: runnerOf(
			assign.kinds[0],
			{
				input: (step) => readAssignEmbedInput(step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.map(
							Effect.all([
								Effect.map(
									Effect.forEach(
										assign.edges[0].next(done.input, done.output),
										(input, ordinal): Effect.Effect<Grown, never, Digest.Digest> =>
											Effect.map(edgeStep(done.turn.step, "Asked", ordinal), (key): Grown => ({
												rows: {
													...noRows,
													AssignAsked: [
														{
															from: done.turn.step,
															ordinal: BigInt(ordinal),
															to: key,
															root: done.turn.root
														}
													],
													AssignDecideInput: [
														{
															step: key,
															root: done.turn.root,
															learner: input.learner,
															topic: input.topic,
															vector: input.vector,
															mode: input.mode._tag
														}
													],
													AssignDecideInputExclude: Arr.map(input.exclude, (element, index) => ({
														step: key,
														root: done.turn.root,
														ordinal: BigInt(index),
														value: element
													})),
													AssignDecideInputModeNearest: Arr.flatMap([input.mode], (variant) =>
														variant._tag === "Nearest" ? [{ step: key, root: done.turn.root }] : []
													),
													AssignDecideInputModeWithin: Arr.flatMap([input.mode], (variant) =>
														variant._tag === "Within"
															? [{ step: key, root: done.turn.root, radius: variant.radius }]
															: []
													)
												},
												steps: [
													{
														step: key,
														kind: "Decide",
														scope: done.turn.scope,
														delay: delayAfter(assign.kinds[1].due)
													}
												],
												spawned: {
													steps: [
														{ step: key, kind: "Decide", delay: delayAfter(assign.kinds[1].due) }
													],
													finishes: []
												}
											}))
									),
									(parts) => Arr.reduce(parts, nothingGrown, joined)
								)
							]),
							(parts) => Arr.reduce(parts, nothingGrown, joined)
						)
						const outcome = yield* settled(
							h.commits.assignCommitEmbed.once({
								params: { steps: grown.steps, root: done.turn.root },
								facts: {
									insert: {
										...grown.rows,
										AssignResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										AssignDone: [{ step: done.turn.step, root: done.turn.root }],
										AssignHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										AssignEmbedOutput: [
											{ step: done.turn.step, root: done.turn.root, vector: done.output.vector }
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
		Decide: runnerOf(
			assign.kinds[1],
			{
				input: (step) => readAssignDecideInput(step),
				read: (input) =>
					Effect.flatMap(
						settled(
							h.commits.assignReadDecide.once({
								params: assign.kinds[1].reads.params(input),
								facts: {}
							})
						),
						(rows) =>
							Effect.map(only(rows), (row) => ({
								nearest: Arr.map(row.nearest, (found) => ({
									passage: found.passage,
									topic: found.topic,
									distance: found.distance
								})),
								seen: Arr.map(row.seen, (found) => ({
									learner: found.learner,
									passage: found.passage
								}))
							}))
					),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const recordedNearest = yield* Effect.forEach(done.rows.nearest, (row) =>
							Effect.map(
								rowDigest("nearest", [
									["passage", row.passage],
									["topic", row.topic],
									["distance", row.distance]
								]),
								(digest) => ({ ...row, digest })
							)
						)
						const uniqueNearest = Arr.dedupeWith(recordedNearest, (a, b) => a.digest === b.digest)
						const recordedSeen = yield* Effect.forEach(done.rows.seen, (row) =>
							Effect.map(
								rowDigest("seen", [
									["learner", row.learner],
									["passage", row.passage]
								]),
								(digest) => ({ ...row, digest })
							)
						)
						const uniqueSeen = Arr.dedupeWith(recordedSeen, (a, b) => a.digest === b.digest)
						const outcome = yield* settled(
							h.commits.assignCommitDecide.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											AssignResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
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
											AssignDecideNearestRow: Arr.map(uniqueNearest, (row) => ({
												digest: row.digest,
												passage: row.passage,
												topic: row.topic,
												distance: row.distance,
												root: done.turn.root
											})),
											AssignDecideNearestRead: Arr.map(recordedNearest, (row, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: row.digest
											})),
											AssignDecideSeenRow: Arr.map(uniqueSeen, (row) => ({
												digest: row.digest,
												learner: row.learner,
												passage: row.passage,
												root: done.turn.root
											})),
											AssignDecideSeenRead: Arr.map(recordedSeen, (row, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: row.digest
											}))
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
		AssignmentFinish: runnerOf(
			{
				name: "AssignmentFinish",
				uses: assign.kinds[2].finish.uses,
				retry: assign.kinds[2].finish.retry,
				waits: assign.kinds[2].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof assign.kinds)[2]["start"]>[0]
					readonly endings: Parameters<(typeof assign.kinds)[2]["finish"]["body"]>[1]
				}) => assign.kinds[2].finish.body(read.input, read.endings)
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
						const outputDecideRows = yield* Effect.map(
							settled(h.den.assignOutputsAssignmentDecide.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const outputDecideFamily0 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideWeighed.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const outputDecideVariant0_0 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideStageServe.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const outputDecideVariant0_1 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideStageRest.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const inputDecideRows = yield* Effect.map(
							settled(h.den.assignInputsAssignmentDecide.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputDecideFamily0 = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecideExclude.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const inputDecideVariant0_0 = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecideModeNearest.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const inputDecideVariant0_1 = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecideModeWithin.once({ params: { scope }, facts: {} })
							),
							rowsOf
						)
						const failuresDecide = yield* Effect.map(
							settled(h.den.assignFailuresAssignmentDecide.once({ params: { scope }, facts: {} })),
							rowsOf
						)
						const inputDecide = (child: (typeof inputDecideRows)[number]["step"]) =>
							held(
								Option.flatMap(
									Arr.findFirst(inputDecideRows, (row) => row.step === child),
									(row) =>
										Option.map(
											Option.all({
												mode:
													row.mode === "Nearest"
														? Option.map(
																Arr.findFirst(inputDecideVariant0_0, (o) => o.step === row.step),
																() => ({ _tag: "Nearest" as const })
															)
														: Option.map(
																Arr.findFirst(inputDecideVariant0_1, (o) => o.step === row.step),
																(part) => ({ _tag: "Within" as const, radius: part.radius })
															)
											}),
											(unions) => ({
												learner: row.learner,
												topic: row.topic,
												vector: row.vector,
												exclude: Arr.map(
													ordered(Arr.filter(inputDecideFamily0, (o) => o.step === row.step)),
													(e) => e.value
												),
												mode: unions.mode
											})
										)
								)
							)
						const Decide = [
							...(yield* Effect.forEach(outputDecideRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputDecide(row.step),
										output: held(
											Option.map(
												Option.all({
													stage:
														row.stage === "Serve"
															? Option.map(
																	Arr.findFirst(outputDecideVariant0_0, (o) => o.step === row.step),
																	(part) => ({
																		_tag: "Serve" as const,
																		passage: part.passage,
																		distance: part.distance
																	})
																)
															: Option.map(
																	Arr.findFirst(outputDecideVariant0_1, (o) => o.step === row.step),
																	() => ({ _tag: "Rest" as const })
																)
												}),
												(unions) => ({
													confidence: row.confidence,
													weighed: Arr.map(
														ordered(Arr.filter(outputDecideFamily0, (o) => o.step === row.step)),
														(e) => ({ passage: e.passage, distance: e.distance, passed: e.passed })
													),
													stage: unions.stage
												})
											)
										)
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresDecide, (failed) =>
								Effect.map(inputDecide(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Decide } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = yield* Effect.succeed(nothingGrown)
						const outcome = yield* settled(
							h.commits.assignCommitAssignmentFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											AssignResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											AssignDone: [{ step: done.turn.step, root: done.turn.root }],
											AssignHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											AssignAssignmentFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("Assignment")
		)
	}
	const roots: { readonly [K in (typeof AssignRootKind)["handles"][number]]: RootRunner } = {
		Assignment: {
			window: assign.kinds[2].window,
			precondition: assign.kinds[2].precondition,
			admit: (scope: ScopeKey) =>
				Effect.gen(function* () {
					const input = yield* readAssignAssignmentInput(scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = yield* startAssignment(scope, scope, input.value)
					const finish = yield* finishStep(scope)
					const steps: ReadonlyArray<SpawnRow> = [
						...grown.steps,
						{ step: finish, kind: "AssignmentFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									AssignScope: grown.rows.AssignScope,
									AssignStartStep: grown.rows.AssignStartStep,
									AssignEmbedInput: grown.rows.AssignEmbedInput,
									AssignEmbedInputNear: grown.rows.AssignEmbedInputNear,
									AssignEmbedInputExclude: grown.rows.AssignEmbedInputExclude,
									AssignEmbedInputModeNearest: grown.rows.AssignEmbedInputModeNearest,
									AssignEmbedInputModeWithin: grown.rows.AssignEmbedInputModeWithin,
									AssignDecideInput: grown.rows.AssignDecideInput,
									AssignDecideInputExclude: grown.rows.AssignDecideInputExclude,
									AssignDecideInputModeNearest: grown.rows.AssignDecideInputModeNearest,
									AssignDecideInputModeWithin: grown.rows.AssignDecideInputModeWithin,
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
							finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])]
						}
					})
				})
		}
	}
	const ledger: Ledger<FlowNeeds<typeof assign>> = {
		flow: FlowName.make("Assign"),
		now: Effect.flatMap(settled(h.den.assignNow.once({ params: {}, facts: {} })), readingOf),
		authenticated: Effect.asVoid(
			settled(h.commits.assignAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (step) =>
			Effect.map(settled(h.den.assignStepOf.once({ params: { step }, facts: {} })), (rows) =>
				Option.map(one(rows), (row) => ({
					runner: runners[row.kind],
					scope: row.scope,
					root: row.root,
					due: row.due
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
		claimsOf: (step) =>
			Effect.map(settled(h.den.assignClaimsOf.once({ params: { step }, facts: {} })), rowsOf),
		retriesOf: (step) =>
			Effect.map(settled(h.den.assignRetriesOf.once({ params: { step }, facts: {} })), rowsOf),
		fencedOf: (step) =>
			Effect.map(settled(h.den.assignFencedOf.once({ params: { step }, facts: {} })), rowsOf),
		scopeOf: (scope) =>
			Effect.gen(function* () {
				const root = yield* Effect.map(
					settled(h.den.assignRootOf.once({ params: { scope: scope }, facts: {} })),
					one
				)
				if (Option.isNone(root)) {
					return Option.none()
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
					kind: root.value.kind,
					key: root.value.key,
					at: root.value.at,
					admission,
					exclusive: Option.none(),
					runner: roots[root.value.kind]
				})
			}),
		unended: (scope) =>
			h.den.assignUnendedSteps.once({ params: { scope }, facts: {} }).pipe(settled, any),
		finished: (scope) =>
			h.den.assignFinished.once({ params: { scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.assignClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: { AssignClaim: [{ step: row.step, root: row.root }], AssignEnded: row.lapsed }
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.assignRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { AssignEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.assignFence.once({
					params: {},
					facts: {
						insert: {
							AssignEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							AssignFenced: [row]
						}
					}
				})
			),
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
							AssignExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.assignFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
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
				signals(h.den.assignPending.watch({ params: {}, facts: {} })),
				signals(h.den.assignRequested.watch({ params: {}, facts: {} })),
				signals(h.den.assignRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.assignPausedAll.watch({ params: {}, facts: {} }))
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
