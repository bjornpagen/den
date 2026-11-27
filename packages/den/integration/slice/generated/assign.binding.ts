import { mintEnvironment } from "@bjornpagen/den/lower/keys"
import {
	any,
	committedFacts,
	dueOf,
	fresh,
	held,
	one,
	only,
	ordered,
	readingOf,
	recordText,
	rowsOf,
	signals,
	spawnedOf,
	type SpawnRows
} from "@bjornpagen/den/runtime/bind"
import {
	edgeStep,
	atOnce,
	finishStep,
	rootScope,
	codecTextsOf,
	inputDigest,
	inputFingerprint,
	rowDigest,
	startedStep
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
import { settled } from "@bjornpagen/den/runtime/settled"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Assign over its served programs; `den generate` writes it, and nothing edits it. */
import { type Addition, recordsFacts, Sha256 } from "@bjornpagen/grizzle"
import { codecText } from "@bjornpagen/grizzle/compile"
import type { MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, pipe, Result, Stream } from "effect"
import { assign } from "#integration/slice/flows.ts"
import {
	AssignPausable,
	AssignDecideReadNearestRecords,
	AssignDecideReadSeenRecords,
	assignGraph,
	AssignAssignmentInput,
	AssignAssignmentInputNear,
	AssignAssignmentInputExclude,
	AssignAssignmentInputModeWithin
} from "#integration/slice/generated/assign.fragment.ts"
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

/** The text of a row step Decide's read `nearest` found, its digest's input. */
const AssignDecideReadNearestText = recordText(assign.kinds[1].reads.named.nearest)
/** The text of a row step Decide's read `seen` found, its digest's input. */
const AssignDecideReadSeenText = recordText(assign.kinds[1].reads.named.seen)
/** The codec text of each declared field of AssignAssignmentInput, a request's input row, bound once (grizzle's codecText). */
const assignAssignmentInputTexts = Object.freeze({
	learner: codecText(AssignAssignmentInput.fields.learner),
	topic: codecText(AssignAssignmentInput.fields.topic),
	mode: codecText(AssignAssignmentInput.fields.mode)
})
/** The codec text of each declared field of AssignAssignmentInputNear, a request's input row, bound once (grizzle's codecText). */
const assignAssignmentInputNearTexts = Object.freeze({
	ordinal: codecText(AssignAssignmentInputNear.fields.ordinal),
	value: codecText(AssignAssignmentInputNear.fields.value)
})
/** The codec text of each declared field of AssignAssignmentInputExclude, a request's input row, bound once (grizzle's codecText). */
const assignAssignmentInputExcludeTexts = Object.freeze({
	ordinal: codecText(AssignAssignmentInputExclude.fields.ordinal),
	value: codecText(AssignAssignmentInputExclude.fields.value)
})
/** The codec text of each declared field of AssignAssignmentInputModeWithin, a request's input row, bound once (grizzle's codecText). */
const assignAssignmentInputModeWithinTexts = Object.freeze({
	radius: codecText(AssignAssignmentInputModeWithin.fields.radius)
})
/** The fingerprint of root kind Assignment's input heading, taken once. */
const assignAssignmentHeading = inputFingerprint(
	'125:21:AssignAssignmentInput15:7:learner4:Text13:5:topic4:Text64:4:mode55:8:closedId25:AssignAssignmentInputMode7:Nearest6:Within84:25:AssignAssignmentInputNear18:7:ordinal7:natural32:5:value22:pg["double precision"]68:28:AssignAssignmentInputExclude18:7:ordinal7:natural13:5:value4:Text35:32:AssignAssignmentInputModeNearest70:31:AssignAssignmentInputModeWithin33:6:radius22:pg["double precision"]1376:6:digest1363:[...pipe([{ scope: scope, root: scope, learner: input.learner, topic: input.topic, mode: input.mode._tag }], Arr.flatMap((row) => [Result.succeed("AssignAssignmentInput"), assignAssignmentInputTexts.learner(row.learner), assignAssignmentInputTexts.topic(row.topic), assignAssignmentInputTexts.mode(row.mode)])), ...pipe(Arr.map(input.near, (element, index) => ({ scope: scope, root: scope, ordinal: BigInt(index), value: element })), Arr.flatMap((row) => [Result.succeed("AssignAssignmentInputNear"), assignAssignmentInputNearTexts.ordinal(row.ordinal), assignAssignmentInputNearTexts.value(row.value)])), ...pipe(Arr.map(input.exclude, (element, index) => ({ scope: scope, root: scope, ordinal: BigInt(index), value: element })), Arr.flatMap((row) => [Result.succeed("AssignAssignmentInputExclude"), assignAssignmentInputExcludeTexts.ordinal(row.ordinal), assignAssignmentInputExcludeTexts.value(row.value)])), ...Arr.map(Arr.flatMap([input.mode], (variant) => (variant._tag === "Nearest" ? [{ scope: scope, root: scope }] : [])), () => Result.succeed("AssignAssignmentInputModeNearest")), ...pipe(Arr.flatMap([input.mode], (variant) => (variant._tag === "Within" ? [{ scope: scope, root: scope, radius: variant.radius }] : [])), Arr.flatMap((row) => [Result.succeed("AssignAssignmentInputModeWithin"), assignAssignmentInputModeWithinTexts.radius(row.radius)]))]'
)

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

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof AssignKind)["handles"][number]> {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof AssignPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(AssignPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Assign"), target })
	)

/** The ledger of the flow Assign over its handles, with the requests of the roots den requests. */
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
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: Sha256): boolean =>
		Arr.some(grown.rows.AssignStartStep, (s) => Sha256.equals(s.scope, scope))
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
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startAssignment = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof assign.kinds)[2]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(assign.kinds[2].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
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
					...spawnedOf(
						{ step: key, kind: "Embed", scope: scope },
						dueOf(assign.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const readAssignEmbedInput = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.assignReadAssignEmbedInput.once({ params: { root, step }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(h.den.assignReadAssignEmbedInputNear.once({ params: { root, step }, facts: {} })),
				rowsOf
			)
			const family1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignEmbedInputExclude.once({ params: { root, step }, facts: {} })
				),
				rowsOf
			)
			const variant0_0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignEmbedInputModeNearest.once({ params: { root, step }, facts: {} })
				),
				one
			)
			const variant0_1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignEmbedInputModeWithin.once({ params: { root, step }, facts: {} })
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
	const readAssignDecideInput = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.assignReadAssignDecideInput.once({ params: { root, step }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignDecideInputExclude.once({ params: { root, step }, facts: {} })
				),
				rowsOf
			)
			const variant0_0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignDecideInputModeNearest.once({ params: { root, step }, facts: {} })
				),
				one
			)
			const variant0_1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignDecideInputModeWithin.once({ params: { root, step }, facts: {} })
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
	const readAssignAssignmentInput = (root: Sha256, scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.assignReadAssignAssignmentInput.once({ params: { root, scope }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputNear.once({ params: { root, scope }, facts: {} })
				),
				rowsOf
			)
			const family1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputExclude.once({ params: { root, scope }, facts: {} })
				),
				rowsOf
			)
			const variant0_0 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputModeNearest.once({
						params: { root, scope },
						facts: {}
					})
				),
				one
			)
			const variant0_1 = yield* Effect.map(
				settled(
					h.den.assignReadAssignAssignmentInputModeWithin.once({
						params: { root, scope },
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
			pipe(rootScope("Assign", "Assignment", key), (scope) =>
				pipe(
					h.den.assignRequestAssignment.once({
						params: {
							assignAssignmentScope: scope,
							assignAssignmentKey: key,
							assignAssignmentAssignScope: [{ scope, root: scope }],
							assignAssignmentAssignAssignmentInput: [
								{
									scope: scope,
									root: scope,
									learner: input.learner,
									topic: input.topic,
									mode: input.mode._tag
								}
							],
							assignAssignmentAssignAssignmentInputNear: Arr.map(input.near, (element, index) => ({
								scope: scope,
								root: scope,
								ordinal: BigInt(index),
								value: element
							})),
							assignAssignmentAssignAssignmentInputExclude: Arr.map(
								input.exclude,
								(element, index) => ({
									scope: scope,
									root: scope,
									ordinal: BigInt(index),
									value: element
								})
							),
							assignAssignmentAssignAssignmentInputModeNearest: Arr.flatMap(
								[input.mode],
								(variant) => (variant._tag === "Nearest" ? [{ scope: scope, root: scope }] : [])
							),
							assignAssignmentAssignAssignmentInputModeWithin: Arr.flatMap(
								[input.mode],
								(variant) =>
									variant._tag === "Within"
										? [{ scope: scope, root: scope, radius: variant.radius }]
										: []
							),
							assignAssignmentAssignRequestedWith: Option.toArray(
								Option.map(
									codecTextsOf([
										...pipe(
											[
												{
													scope: scope,
													root: scope,
													learner: input.learner,
													topic: input.topic,
													mode: input.mode._tag
												}
											],
											Arr.flatMap((row) => [
												Result.succeed("AssignAssignmentInput"),
												assignAssignmentInputTexts.learner(row.learner),
												assignAssignmentInputTexts.topic(row.topic),
												assignAssignmentInputTexts.mode(row.mode)
											])
										),
										...pipe(
											Arr.map(input.near, (element, index) => ({
												scope: scope,
												root: scope,
												ordinal: BigInt(index),
												value: element
											})),
											Arr.flatMap((row) => [
												Result.succeed("AssignAssignmentInputNear"),
												assignAssignmentInputNearTexts.ordinal(row.ordinal),
												assignAssignmentInputNearTexts.value(row.value)
											])
										),
										...pipe(
											Arr.map(input.exclude, (element, index) => ({
												scope: scope,
												root: scope,
												ordinal: BigInt(index),
												value: element
											})),
											Arr.flatMap((row) => [
												Result.succeed("AssignAssignmentInputExclude"),
												assignAssignmentInputExcludeTexts.ordinal(row.ordinal),
												assignAssignmentInputExcludeTexts.value(row.value)
											])
										),
										...Arr.map(
											Arr.flatMap([input.mode], (variant) =>
												variant._tag === "Nearest" ? [{ scope: scope, root: scope }] : []
											),
											() => Result.succeed("AssignAssignmentInputModeNearest")
										),
										...pipe(
											Arr.flatMap([input.mode], (variant) =>
												variant._tag === "Within"
													? [{ scope: scope, root: scope, radius: variant.radius }]
													: []
											),
											Arr.flatMap((row) => [
												Result.succeed("AssignAssignmentInputModeWithin"),
												assignAssignmentInputModeWithinTexts.radius(row.radius)
											])
										)
									]),
									(texts) => ({
										root: scope,
										fingerprint: assignAssignmentHeading,
										input: inputDigest("Assign", "Assignment", texts)
									})
								)
							)
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Assign"), scope, fresh: accepted }))
				)
			)
	}
	const runners = {
		Embed: runnerOf(
			assign.kinds[0],
			{
				input: ({ root, step }) => readAssignEmbedInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = Arr.reduce(
							[
								Arr.reduce(
									Arr.map(assign.edges[0].next(done.input, done.output), (input, ordinal): Grown =>
										pipe(edgeStep(done.turn.step, "Asked", ordinal), (key): Grown => ({
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
											...spawnedOf(
												{ step: key, kind: "Decide", scope: done.turn.scope },
												dueOf(assign.kinds[1].due, input)
											)
										}))
									),
									nothingGrown,
									joined
								)
							],
							nothingGrown,
							joined
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
				input: ({ root, step }) => readAssignDecideInput(root, step),
				read: (input) =>
					Effect.flatMap(
						settled(
							h.commits.assignReadDecide.once({
								params: assign.kinds[1].reads.params(input),
								facts: {}
							})
						),
						only
					),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const recordedNearest = yield* Effect.forEach(done.rows.nearest, (row) =>
							Effect.map(AssignDecideReadNearestText(row), (text) => ({
								row,
								digest: rowDigest("nearest", text)
							}))
						)
						const uniqueNearest = Arr.dedupeWith(recordedNearest, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const recordedSeen = yield* Effect.forEach(done.rows.seen, (row) =>
							Effect.map(AssignDecideReadSeenText(row), (text) => ({
								row,
								digest: rowDigest("seen", text)
							}))
						)
						const uniqueSeen = Arr.dedupeWith(recordedSeen, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
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
											...recordsFacts(
												assignGraph,
												AssignDecideReadNearestRecords
											)(
												Arr.map(
													uniqueNearest,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											AssignDecideReadNearest: Arr.map(recordedNearest, (found, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: found.digest
											})),
											...recordsFacts(
												assignGraph,
												AssignDecideReadSeenRecords
											)(
												Arr.map(
													uniqueSeen,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											AssignDecideReadSeen: Arr.map(recordedSeen, (found, ordinal) => ({
												step: done.turn.step,
												root: done.turn.root,
												ordinal: BigInt(ordinal),
												digest: found.digest
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
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.assignStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readAssignAssignmentInput(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputDecideRows = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecide.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const outputDecideFamily0 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideWeighed.once({
									params: { root, scope },
									facts: {}
								})
							),
							rowsOf
						)
						const outputDecideVariant0_0 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideStageServe.once({
									params: { root, scope },
									facts: {}
								})
							),
							rowsOf
						)
						const outputDecideVariant0_1 = yield* Effect.map(
							settled(
								h.den.assignOutputsAssignmentDecideStageRest.once({
									params: { root, scope },
									facts: {}
								})
							),
							rowsOf
						)
						const inputDecideRows = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecide.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputDecideFamily0 = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecideExclude.once({
									params: { root, scope },
									facts: {}
								})
							),
							rowsOf
						)
						const inputDecideVariant0_0 = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecideModeNearest.once({
									params: { root, scope },
									facts: {}
								})
							),
							rowsOf
						)
						const inputDecideVariant0_1 = yield* Effect.map(
							settled(
								h.den.assignInputsAssignmentDecideModeWithin.once({
									params: { root, scope },
									facts: {}
								})
							),
							rowsOf
						)
						const failuresDecide = yield* Effect.map(
							settled(
								h.den.assignFailuresAssignmentDecide.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputDecide = (child: (typeof inputDecideRows)[number]["step"]) =>
							held(
								Option.flatMap(
									Arr.findFirst(inputDecideRows, (row) => Sha256.equals(row.step, child)),
									(row) =>
										Option.map(
											Option.all({
												mode:
													row.mode === "Nearest"
														? Option.map(
																Arr.findFirst(inputDecideVariant0_0, (o) =>
																	Sha256.equals(o.step, row.step)
																),
																() => ({ _tag: "Nearest" as const })
															)
														: Option.map(
																Arr.findFirst(inputDecideVariant0_1, (o) =>
																	Sha256.equals(o.step, row.step)
																),
																(part) => ({ _tag: "Within" as const, radius: part.radius })
															)
											}),
											(unions) => ({
												learner: row.learner,
												topic: row.topic,
												vector: row.vector,
												exclude: Arr.map(
													ordered(
														Arr.filter(inputDecideFamily0, (o) => Sha256.equals(o.step, row.step))
													),
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
																	Arr.findFirst(outputDecideVariant0_0, (o) =>
																		Sha256.equals(o.step, row.step)
																	),
																	(part) => ({
																		_tag: "Serve" as const,
																		passage: part.passage,
																		distance: part.distance
																	})
																)
															: Option.map(
																	Arr.findFirst(outputDecideVariant0_1, (o) =>
																		Sha256.equals(o.step, row.step)
																	),
																	() => ({ _tag: "Rest" as const })
																)
												}),
												(unions) => ({
													confidence: row.confidence,
													weighed: Arr.map(
														ordered(
															Arr.filter(outputDecideFamily0, (o) =>
																Sha256.equals(o.step, row.step)
															)
														),
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
						const grown = nothingGrown
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
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readAssignAssignmentInput(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startAssignment(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
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
		reading: (environment) =>
			Effect.flatMap(
				settled(
					h.den.assignReading.once({
						params: { "serving.environment": mintEnvironment(environment) },
						facts: {}
					})
				),
				(rows) =>
					Effect.flatMap(only(rows), (row) =>
						Effect.map(readingOf(row.now), (now) => ({
							now,
							serving: Option.map(Arr.head(row.serving), (served) => served.deployment)
						}))
					)
			),
		promote: (host) =>
			Effect.asVoid(
				settled(
					h.coordinator.assignPromote.once({
						params: { environment: mintEnvironment(host.environment), deployment: host.deployment },
						facts: {}
					})
				)
			),
		authenticated: Effect.asVoid(
			settled(h.commits.assignAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (at) =>
			Effect.map(
				settled(h.den.assignStepOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) =>
					Option.map(one(rows), (row) => ({
						runner: runners[row.kind],
						scope: row.scope,
						due: row.due
					}))
			),
		resultOf: (at) =>
			Effect.map(
				settled(h.den.assignResultOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (at) =>
			Effect.map(
				settled(h.den.assignHeldOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (at) =>
			Effect.map(
				settled(h.den.assignClaimsOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		retriesOf: (at) =>
			Effect.map(
				settled(
					h.den.assignRetriesOf.once({ params: { root: at.root, step: at.step }, facts: {} })
				),
				rowsOf
			),
		fencedOf: (at) =>
			Effect.map(
				settled(h.den.assignFencedOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		scopeOf: ({ root, scope }) =>
			Effect.gen(function* () {
				if (!Sha256.equals(root, scope)) {
					return Option.none()
				}
				const standing = yield* Effect.map(
					settled(h.den.assignRootOf.once({ params: { root }, facts: {} })),
					one
				)
				if (Option.isNone(standing)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.assignAdmittedOf.once({ params: { root, scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.assignSkippedOf.once({ params: { root, scope }, facts: {} })),
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
					kind: standing.value.kind,
					key: standing.value.key,
					at: standing.value.at,
					admission,
					exclusive: Option.none(),
					runner: roots[standing.value.kind]
				})
			}),
		unended: ({ root, scope }) =>
			h.den.assignUnendedSteps.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
		finished: ({ root, scope }) =>
			h.den.assignFinished.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
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
		retire: (root) => settled(h.retirer.assignRetire.once({ params: { root }, facts: {} })),
		snapshot: Effect.flatMap(
			settled(h.den.assignSnapshot.once({ params: {}, facts: {} })),
			(rows) =>
				Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof assign>> => {
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
								onNone: (): ReadonlyArray<ScopeView> => []
							}
						)
					return {
						steps: Arr.map(read.steps, (s) => ({
							step: s.step,
							root: s.root,
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
		request
	}
}
