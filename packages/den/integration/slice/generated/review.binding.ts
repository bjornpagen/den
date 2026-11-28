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
	rowsOf,
	signals,
	spawnedOf,
	type SpawnRows
} from "@bjornpagen/den/runtime/bind"
import {
	edgeScope,
	edgeStep,
	atOnce,
	finishStep,
	rootScope,
	codecTextsOf,
	inputDigest,
	inputFingerprint,
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
/** The ledger port of the flow Review over its served programs; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"
import * as gCompile from "@bjornpagen/grizzle/compile"
import type * as gRuntime from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, pipe, Result, Stream } from "effect"
import { review } from "#integration/slice/flows.ts"
import {
	ReviewPausable,
	ReviewResource,
	ReviewReviewRunInput,
	ReviewReviewRunInputSizes
} from "#integration/slice/generated/review.fragment.ts"
import type {
	ReviewScope,
	ReviewWithin,
	ReviewAdmitted,
	ReviewFinish,
	ReviewStartStep,
	ReviewStartScope,
	ReviewAnalyzeInput,
	ReviewGatherInput,
	ReviewGatherInputSizes,
	ReviewSaveInput,
	ReviewQuestionsInput,
	ReviewSplit,
	ReviewSaved,
	ReviewKind,
	ReviewRootKind
} from "#integration/slice/generated/review.fragment.ts"
import type {
	reviewDenPrograms,
	reviewCoordinatorPrograms,
	reviewRetirerPrograms,
	reviewCommitPrograms
} from "#integration/slice/generated/review.programs.ts"

/** The codec text of each declared field of ReviewReviewRunInput, a request's input row, bound once (grizzle's codecText). */
const reviewReviewRunInputTexts = Object.freeze({
	review: gCompile.codecText(ReviewReviewRunInput.fields.review)
})
/** The codec text of each declared field of ReviewReviewRunInputSizes, a request's input row, bound once (grizzle's codecText). */
const reviewReviewRunInputSizesTexts = Object.freeze({
	ordinal: gCompile.codecText(ReviewReviewRunInputSizes.fields.ordinal),
	value: gCompile.codecText(ReviewReviewRunInputSizes.fields.value)
})
/** The fingerprint of root kind ReviewRun's input heading, taken once. */
const reviewReviewRunHeading = inputFingerprint(
	'40:20:ReviewReviewRunInput14:6:review4:Text69:25:ReviewReviewRunInputSizes20:7:ordinal9:g.natural15:5:value6:g.int8481:6:digest469:[...pipe([{ scope: scope, root: scope, review: input.review }], Arr.flatMap((row) => [Result.succeed("ReviewReviewRunInput"), reviewReviewRunInputTexts.review(row.review)])), ...pipe(Arr.map(input.sizes, (element, index) => ({ scope: scope, root: scope, ordinal: BigInt(index), value: element })), Arr.flatMap((row) => [Result.succeed("ReviewReviewRunInputSizes"), reviewReviewRunInputSizesTexts.ordinal(row.ordinal), reviewReviewRunInputSizesTexts.value(row.value)]))]'
)

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface ReviewHandles {
	readonly den: {
		readonly [K in keyof typeof reviewDenPrograms]: gRuntime.MemberHandle<
			(typeof reviewDenPrograms)[K]
		>
	}
	readonly coordinator: {
		readonly [K in keyof typeof reviewCoordinatorPrograms]: gRuntime.MemberHandle<
			(typeof reviewCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof reviewRetirerPrograms]: gRuntime.MemberHandle<
			(typeof reviewRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof reviewCommitPrograms]: gRuntime.MemberHandle<
			(typeof reviewCommitPrograms)[K]
		>
	}
}

interface Rows {
	readonly ReviewScope: ReadonlyArray<g.Addition<typeof ReviewScope>>
	readonly ReviewWithin: ReadonlyArray<g.Addition<typeof ReviewWithin>>
	readonly ReviewAdmitted: ReadonlyArray<g.Addition<typeof ReviewAdmitted>>
	readonly ReviewFinish: ReadonlyArray<g.Addition<typeof ReviewFinish>>
	readonly ReviewStartStep: ReadonlyArray<g.Addition<typeof ReviewStartStep>>
	readonly ReviewStartScope: ReadonlyArray<g.Addition<typeof ReviewStartScope>>
	readonly ReviewAnalyzeInput: ReadonlyArray<g.Addition<typeof ReviewAnalyzeInput>>
	readonly ReviewGatherInput: ReadonlyArray<g.Addition<typeof ReviewGatherInput>>
	readonly ReviewGatherInputSizes: ReadonlyArray<g.Addition<typeof ReviewGatherInputSizes>>
	readonly ReviewSaveInput: ReadonlyArray<g.Addition<typeof ReviewSaveInput>>
	readonly ReviewQuestionsInput: ReadonlyArray<g.Addition<typeof ReviewQuestionsInput>>
	readonly ReviewSplit: ReadonlyArray<g.Addition<typeof ReviewSplit>>
	readonly ReviewSaved: ReadonlyArray<g.Addition<typeof ReviewSaved>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof ReviewKind)["handles"][number]> {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof ReviewPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(ReviewPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Review"), target })
	)
const resourceOf = (name: string): Option.Option<(typeof ReviewResource)["handles"][number]> =>
	Arr.findFirst(ReviewResource.handles, (handle) => handle === name)
const holdsOf = (seats: ReadonlyArray<SeatAt>) =>
	Arr.flatMap(seats, (taken) =>
		Option.toArray(
			Option.map(resourceOf(taken.resource), (resource) => ({ resource, seat: taken.seat }))
		)
	)

/** The ledger of the flow Review over its handles, with the requests of the roots den requests. */
export const reviewLedger = (h: ReviewHandles) => {
	const noRows: Rows = {
		ReviewScope: [],
		ReviewWithin: [],
		ReviewAdmitted: [],
		ReviewFinish: [],
		ReviewStartStep: [],
		ReviewStartScope: [],
		ReviewAnalyzeInput: [],
		ReviewGatherInput: [],
		ReviewGatherInputSizes: [],
		ReviewSaveInput: [],
		ReviewQuestionsInput: [],
		ReviewSplit: [],
		ReviewSaved: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: g.Sha256): boolean =>
		Arr.some(grown.rows.ReviewStartStep, (s) => g.Sha256.equals(s.scope, scope)) ||
		Arr.some(grown.rows.ReviewStartScope, (s) => g.Sha256.equals(s.scope, scope))
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ReviewScope: [...a.rows.ReviewScope, ...b.rows.ReviewScope],
			ReviewWithin: [...a.rows.ReviewWithin, ...b.rows.ReviewWithin],
			ReviewAdmitted: [...a.rows.ReviewAdmitted, ...b.rows.ReviewAdmitted],
			ReviewFinish: [...a.rows.ReviewFinish, ...b.rows.ReviewFinish],
			ReviewStartStep: [...a.rows.ReviewStartStep, ...b.rows.ReviewStartStep],
			ReviewStartScope: [...a.rows.ReviewStartScope, ...b.rows.ReviewStartScope],
			ReviewAnalyzeInput: [...a.rows.ReviewAnalyzeInput, ...b.rows.ReviewAnalyzeInput],
			ReviewGatherInput: [...a.rows.ReviewGatherInput, ...b.rows.ReviewGatherInput],
			ReviewGatherInputSizes: [...a.rows.ReviewGatherInputSizes, ...b.rows.ReviewGatherInputSizes],
			ReviewSaveInput: [...a.rows.ReviewSaveInput, ...b.rows.ReviewSaveInput],
			ReviewQuestionsInput: [...a.rows.ReviewQuestionsInput, ...b.rows.ReviewQuestionsInput],
			ReviewSplit: [...a.rows.ReviewSplit, ...b.rows.ReviewSplit],
			ReviewSaved: [...a.rows.ReviewSaved, ...b.rows.ReviewSaved]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startQuestions = (
		root: g.Sha256,
		scope: g.Sha256,
		input: Parameters<(typeof review.kinds)[1]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(review.kinds[1].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						ReviewStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						ReviewAnalyzeInput: [
							{
								step: key,
								root: root,
								review: spawn.input.review,
								group: spawn.input.group,
								question: spawn.input.question
							}
						]
					},
					...spawnedOf(
						{ step: key, kind: "Analyze", scope: scope },
						dueOf(review.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const startReviewRun = (
		root: g.Sha256,
		scope: g.Sha256,
		input: Parameters<(typeof review.kinds)[4]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(review.kinds[4].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						ReviewStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						ReviewGatherInput: [{ step: key, root: root, review: spawn.input.review }],
						ReviewGatherInputSizes: Arr.map(spawn.input.sizes, (element, index) => ({
							step: key,
							root: root,
							ordinal: BigInt(index),
							value: element
						}))
					},
					...spawnedOf(
						{ step: key, kind: "Gather", scope: scope },
						dueOf(review.kinds[2].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const readReviewAnalyzeInput = (root: g.Sha256, step: g.Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.reviewReadReviewAnalyzeInput.once({ params: { root, step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({
				review: found.review,
				group: found.group,
				question: found.question
			}))
		})
	const readReviewGatherInput = (root: g.Sha256, step: g.Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.reviewReadReviewGatherInput.once({ params: { root, step }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(h.den.reviewReadReviewGatherInputSizes.once({ params: { root, step }, facts: {} })),
				rowsOf
			)
			return Option.map(row, (found) => ({
				review: found.review,
				sizes: Arr.map(ordered(family0), (e) => e.value)
			}))
		})
	const readReviewSaveInput = (root: g.Sha256, step: g.Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.reviewReadReviewSaveInput.once({ params: { root, step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({
				review: found.review,
				group: found.group,
				count: found.count,
				total: found.total
			}))
		})
	const readReviewQuestionsInput = (root: g.Sha256, scope: g.Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.reviewReadReviewQuestionsInput.once({ params: { root, scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({
				review: found.review,
				group: found.group,
				size: found.size
			}))
		})
	const readReviewReviewRunInput = (root: g.Sha256, scope: g.Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.reviewReadReviewReviewRunInput.once({ params: { root, scope }, facts: {} })),
				one
			)
			const family0 = yield* Effect.map(
				settled(
					h.den.reviewReadReviewReviewRunInputSizes.once({ params: { root, scope }, facts: {} })
				),
				rowsOf
			)
			return Option.map(row, (found) => ({
				review: found.review,
				sizes: Arr.map(ordered(family0), (e) => e.value)
			}))
		})
	const pauseChains: PauseChains<(typeof ReviewPausable)["handles"][number]> = {
		flow: FlowName.make("Review"),
		turns: Effect.map(
			settled(h.coordinator.reviewPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.reviewPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.reviewPause.once({ params: {}, facts: { insert: { ReviewPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.reviewResume.once({
						params: {},
						facts: { insert: { ReviewResumed: [row] } }
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
		ReviewRun: (key: string, input: Parameters<(typeof review.kinds)[4]["start"]>[0]) =>
			pipe(rootScope("Review", "ReviewRun", key), (scope) =>
				pipe(
					h.den.reviewRequestReviewRun.once({
						params: {
							reviewReviewRunScope: scope,
							reviewReviewRunKey: key,
							reviewReviewRunReviewScope: [{ scope, root: scope }],
							reviewReviewRunReviewReviewRunInput: [
								{ scope: scope, root: scope, review: input.review }
							],
							reviewReviewRunReviewReviewRunInputSizes: Arr.map(input.sizes, (element, index) => ({
								scope: scope,
								root: scope,
								ordinal: BigInt(index),
								value: element
							})),
							reviewReviewRunReviewRequestedWith: Option.toArray(
								Option.map(
									codecTextsOf([
										...pipe(
											[{ scope: scope, root: scope, review: input.review }],
											Arr.flatMap((row) => [
												Result.succeed("ReviewReviewRunInput"),
												reviewReviewRunInputTexts.review(row.review)
											])
										),
										...pipe(
											Arr.map(input.sizes, (element, index) => ({
												scope: scope,
												root: scope,
												ordinal: BigInt(index),
												value: element
											})),
											Arr.flatMap((row) => [
												Result.succeed("ReviewReviewRunInputSizes"),
												reviewReviewRunInputSizesTexts.ordinal(row.ordinal),
												reviewReviewRunInputSizesTexts.value(row.value)
											])
										)
									]),
									(texts) => ({
										root: scope,
										fingerprint: reviewReviewRunHeading,
										input: inputDigest("Review", "ReviewRun", texts)
									})
								)
							)
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Review"), scope, fresh: accepted }))
				)
			)
	}
	const runners = {
		Analyze: runnerOf(
			review.kinds[0],
			{
				input: ({ root, step }) => readReviewAnalyzeInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.reviewCommitAnalyze.once({
								params: {},
								facts: {
									insert: {
										ReviewResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										ReviewDone: [{ step: done.turn.step, root: done.turn.root }],
										ReviewHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										ReviewAnalyzeOutput: [
											{ step: done.turn.step, root: done.turn.root, score: done.output.score }
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
		Gather: runnerOf(
			review.kinds[2],
			{
				input: ({ root, step }) => readReviewGatherInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = Arr.reduce(
							[
								Arr.reduce(
									Arr.map(review.edges[0].next(done.input, done.output), (input, ordinal): Grown =>
										pipe(edgeScope(done.turn.step, "Split", ordinal), (key): Grown =>
											pipe(startQuestions(done.turn.root, key, input), (inner): Grown =>
												pipe(finishStep(key), (finish): Grown =>
													joined(inner, {
														rows: {
															...noRows,
															ReviewScope: [{ scope: key, root: done.turn.root }],
															ReviewWithin: [
																{
																	scope: key,
																	parent: done.turn.scope,
																	kind: "Questions",
																	root: done.turn.root
																}
															],
															ReviewAdmitted: [{ scope: key, root: done.turn.root }],
															ReviewFinish: [{ scope: key, step: finish, root: done.turn.root }],
															ReviewSplit: [
																{
																	from: done.turn.step,
																	ordinal: BigInt(ordinal),
																	to: key,
																	root: done.turn.root
																}
															],
															ReviewQuestionsInput: [
																{
																	scope: key,
																	root: done.turn.root,
																	review: input.review,
																	group: input.group,
																	size: input.size
																}
															]
														},
														steps: [
															{ step: finish, kind: "QuestionsFinish", scope: key, delay: atOnce }
														],
														timed: [],
														spawned: {
															steps: [],
															finishes: hasChildren(inner, key) ? [] : [finish]
														}
													})
												)
											)
										)
									),
									nothingGrown,
									joined
								)
							],
							nothingGrown,
							joined
						)
						const outcome = yield* settled(
							h.commits.reviewCommitGather.once({
								params: { steps: grown.steps, root: done.turn.root },
								facts: {
									insert: {
										...grown.rows,
										ReviewResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										ReviewDone: [{ step: done.turn.step, root: done.turn.root }],
										ReviewHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										ReviewGatherOutput: [
											{ step: done.turn.step, root: done.turn.root, groups: done.output.groups }
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
		Save: runnerOf(
			review.kinds[3],
			{
				input: ({ root, step }) => readReviewSaveInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.reviewCommitSave.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ReviewResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ReviewDone: [{ step: done.turn.step, root: done.turn.root }],
											ReviewHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											ReviewSaveOutput: [
												{ step: done.turn.step, root: done.turn.root, total: done.output.total }
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
		QuestionsFinish: runnerOf(
			{
				name: "QuestionsFinish",
				uses: review.kinds[1].finish.uses,
				retry: review.kinds[1].finish.retry,
				waits: review.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof review.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof review.kinds)[1]["finish"]["body"]>[1]
					readonly parent: g.Sha256
				}) => review.kinds[1].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.reviewStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readReviewQuestionsInput(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const within = yield* Effect.map(
							settled(h.den.reviewWithinOf.once({ params: { root, scope }, facts: {} })),
							one
						)
						if (Option.isNone(within)) {
							return Option.none()
						}
						const outputAnalyzeRows = yield* Effect.map(
							settled(
								h.den.reviewOutputsQuestionsAnalyze.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputAnalyzeRows = yield* Effect.map(
							settled(
								h.den.reviewInputsQuestionsAnalyze.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresAnalyze = yield* Effect.map(
							settled(
								h.den.reviewFailuresQuestionsAnalyze.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputAnalyze = (child: (typeof inputAnalyzeRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputAnalyzeRows, (row) => g.Sha256.equals(row.step, child)),
									(row) => ({ review: row.review, group: row.group, question: row.question })
								)
							)
						const Analyze = [
							...(yield* Effect.forEach(outputAnalyzeRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputAnalyze(row.step),
										output: Effect.succeed({ score: row.score })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresAnalyze, (failed) =>
								Effect.map(inputAnalyze(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({
							input: input.value,
							endings: { Analyze },
							parent: within.value.parent
						})
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = Arr.reduce(
							[
								Arr.reduce(
									Arr.map(
										review.edges[1].next(done.input.input, done.output),
										(input, ordinal): Grown =>
											pipe(edgeStep(done.turn.step, "Saved", ordinal), (key): Grown => ({
												rows: {
													...noRows,
													ReviewSaved: [
														{
															from: done.turn.step,
															ordinal: BigInt(ordinal),
															to: key,
															root: done.turn.root
														}
													],
													ReviewSaveInput: [
														{
															step: key,
															root: done.turn.root,
															review: input.review,
															group: input.group,
															count: input.count,
															total: input.total
														}
													]
												},
												...spawnedOf(
													{ step: key, kind: "Save", scope: done.input.parent },
													dueOf(review.kinds[3].due, input)
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
							h.commits.reviewCommitQuestionsFinish.once({
								params: { steps: grown.steps, root: done.turn.root },
								facts: {
									insert: {
										...grown.rows,
										ReviewResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										ReviewDone: [{ step: done.turn.step, root: done.turn.root }],
										ReviewHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										ReviewQuestionsFinishOutput: [
											{
												step: done.turn.step,
												root: done.turn.root,
												count: done.output.count,
												total: done.output.total
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
			Option.some("Questions")
		),
		ReviewRunFinish: runnerOf(
			{
				name: "ReviewRunFinish",
				uses: review.kinds[4].finish.uses,
				retry: review.kinds[4].finish.retry,
				waits: review.kinds[4].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof review.kinds)[4]["start"]>[0]
					readonly endings: Parameters<(typeof review.kinds)[4]["finish"]["body"]>[1]
				}) => review.kinds[4].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.reviewStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readReviewReviewRunInput(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputQuestionsRows = yield* Effect.map(
							settled(
								h.den.reviewOutputsReviewRunQuestions.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputQuestionsRows = yield* Effect.map(
							settled(
								h.den.reviewInputsReviewRunQuestions.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresQuestions = yield* Effect.map(
							settled(
								h.den.reviewFailuresReviewRunQuestions.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputQuestions = (child: (typeof inputQuestionsRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputQuestionsRows, (row) => g.Sha256.equals(row.step, child)),
									(row) => ({ review: row.review, group: row.group, size: row.size })
								)
							)
						const Questions = [
							...(yield* Effect.forEach(outputQuestionsRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputQuestions(row.step),
										output: Effect.succeed({ count: row.count, total: row.total })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresQuestions, (failed) =>
								Effect.map(inputQuestions(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						const outputSaveRows = yield* Effect.map(
							settled(
								h.den.reviewOutputsReviewRunSave.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputSaveRows = yield* Effect.map(
							settled(h.den.reviewInputsReviewRunSave.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const failuresSave = yield* Effect.map(
							settled(
								h.den.reviewFailuresReviewRunSave.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputSave = (child: (typeof inputSaveRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputSaveRows, (row) => g.Sha256.equals(row.step, child)),
									(row) => ({
										review: row.review,
										group: row.group,
										count: row.count,
										total: row.total
									})
								)
							)
						const Save = [
							...(yield* Effect.forEach(outputSaveRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputSave(row.step),
										output: Effect.succeed({ total: row.total })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresSave, (failed) =>
								Effect.map(inputSave(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Questions, Save } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.reviewCommitReviewRunFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ReviewResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ReviewDone: [{ step: done.turn.step, root: done.turn.root }],
											ReviewHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											ReviewReviewRunFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("ReviewRun")
		)
	}
	const roots: { readonly [K in (typeof ReviewRootKind)["handles"][number]]: RootRunner } = {
		ReviewRun: {
			window: review.kinds[4].window,
			precondition: review.kinds[4].precondition,
			admit: (scope: g.Sha256) =>
				Effect.gen(function* () {
					const input = yield* readReviewReviewRunInput(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startReviewRun(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "ReviewRunFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<g.Addition<typeof ReviewAdmitted>> = [
						...grown.rows.ReviewAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<g.Addition<typeof ReviewFinish>> = [
						...grown.rows.ReviewFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.reviewAdmit.once({
							params: { steps, root: scope },
							facts: {
								insert: {
									ReviewScope: grown.rows.ReviewScope,
									ReviewWithin: grown.rows.ReviewWithin,
									ReviewStartStep: grown.rows.ReviewStartStep,
									ReviewStartScope: grown.rows.ReviewStartScope,
									ReviewAnalyzeInput: grown.rows.ReviewAnalyzeInput,
									ReviewGatherInput: grown.rows.ReviewGatherInput,
									ReviewGatherInputSizes: grown.rows.ReviewGatherInputSizes,
									ReviewSaveInput: grown.rows.ReviewSaveInput,
									ReviewQuestionsInput: grown.rows.ReviewQuestionsInput,
									ReviewAdmitted: admitted,
									ReviewFinish: finishes
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
	const ledger: Ledger<FlowNeeds<typeof review>> = {
		flow: FlowName.make("Review"),
		now: Effect.flatMap(settled(h.den.reviewNow.once({ params: {}, facts: {} })), readingOf),
		reading: (environment) =>
			Effect.flatMap(
				settled(
					h.den.reviewReading.once({
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
					h.coordinator.reviewPromote.once({
						params: { environment: mintEnvironment(host.environment), deployment: host.deployment },
						facts: {}
					})
				)
			),
		authenticated: Effect.asVoid(
			settled(h.commits.reviewAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.map(settled(h.den.reviewHolds.once({ params: {}, facts: {} })), rowsOf),
		stepOf: (at) =>
			Effect.map(
				settled(h.den.reviewStepOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) =>
					Option.map(one(rows), (row) => ({
						runner: runners[row.kind],
						scope: row.scope,
						due: row.due
					}))
			),
		resultOf: (at) =>
			Effect.map(
				settled(h.den.reviewResultOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (at) =>
			Effect.map(
				settled(h.den.reviewHeldOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (at) =>
			Effect.map(
				settled(h.den.reviewClaimsOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		retriesOf: (at) =>
			Effect.map(
				settled(
					h.den.reviewRetriesOf.once({ params: { root: at.root, step: at.step }, facts: {} })
				),
				rowsOf
			),
		fencedOf: (at) =>
			Effect.map(
				settled(h.den.reviewFencedOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		scopeOf: ({ root, scope }) =>
			Effect.gen(function* () {
				if (!g.Sha256.equals(root, scope)) {
					const within = yield* Effect.map(
						settled(h.den.reviewWithinOf.once({ params: { root, scope }, facts: {} })),
						one
					)
					return Option.map(within, (w): ScopeView => ({
						place: "child",
						scope,
						kind: w.kind,
						parent: w.parent
					}))
				}
				const standing = yield* Effect.map(
					settled(h.den.reviewRootOf.once({ params: { root }, facts: {} })),
					one
				)
				if (Option.isNone(standing)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.reviewAdmittedOf.once({ params: { root, scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.reviewSkippedOf.once({ params: { root, scope }, facts: {} })),
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
			Effect.flatMap(
				h.den.reviewUnendedSteps.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
				(steps) =>
					steps
						? Effect.succeed(true)
						: h.den.reviewOpenChildren
								.once({ params: { root, scope }, facts: {} })
								.pipe(settled, any)
			),
		finished: ({ root, scope }) =>
			h.den.reviewFinished.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		awaits: ["Delivered"],
		awaiting: ({ root, step }) =>
			h.den.reviewAwaitingOf.once({ params: { root, step }, facts: {} }).pipe(settled, any),
		ready: Effect.map(settled(h.den.reviewReady.once({ params: {}, facts: {} })), (rows) =>
			Arr.map(rowsOf(rows), (row) => ({ root: row.root, step: row.step }))
		),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.reviewClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: {
								ReviewClaim: [{ step: row.step, root: row.root, holds: holdsOf(row.seats) }],
								ReviewEnded: row.lapsed
							}
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.reviewRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { ReviewEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.reviewFence.once({
					params: {},
					facts: {
						insert: {
							ReviewEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							ReviewFenced: [row]
						}
					}
				})
			),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.reviewRefuse.once({
					params: {},
					facts: {
						insert: {
							ReviewResult: [{ step, root, outcome: "failed" }],
							ReviewFailed: [{ step, root }],
							ReviewHeld: [{ step, root, attempt }],
							ReviewRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.reviewSkip.once({
					params: {},
					facts: { insert: { ReviewSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.reviewExhaust.once({
					params: {},
					facts: {
						insert: {
							ReviewResult: [{ step, root, outcome: "failed" }],
							ReviewFailed: [{ step, root }],
							ReviewHeld: [{ step, root, attempt }],
							ReviewExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.reviewFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) => settled(h.retirer.reviewRetire.once({ params: { root }, facts: {} })),
		snapshot: Effect.flatMap(
			settled(h.den.reviewSnapshot.once({ params: {}, facts: {} })),
			(rows) =>
				Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof review>> => {
					const view = (scope: g.Sha256, admission: Admission): ReadonlyArray<ScopeView> =>
						Option.match(
							Arr.findFirst(read.roots, (o) => g.Sha256.equals(o.scope, scope)),
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
										Option.toArray(
											Arr.findFirst(read.withins, (w) => g.Sha256.equals(w.scope, scope))
										),
										(w): ScopeView => ({ place: "child", scope, kind: w.kind, parent: w.parent })
									)
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
						holds: read.holds,
						exclusives: [],
						paused: Arr.map(read.paused, (row) => row.target),
						busy: [],
						awaiting: Arr.map(read.awaiting, (row) => row.step)
					}
				})
		),
		changes: Stream.mergeAll(
			[
				signals(h.den.reviewPending.watch({ params: {}, facts: {} })),
				signals(h.den.reviewRequested.watch({ params: {}, facts: {} })),
				signals(h.den.reviewRunning.watch({ params: {}, facts: {} })),
				signals(h.den.reviewHolds.watch({ params: {}, facts: {} })),
				signals(h.coordinator.reviewPausedAll.watch({ params: {}, facts: {} })),
				signals(h.den.reviewReady.watch({ params: {}, facts: {} }))
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
