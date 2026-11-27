import { mintEnvironment } from "@bjornpagen/den/lower/keys"
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
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"
import { type PauseChains, pauseIn, resumeIn } from "@bjornpagen/den/runtime/seats"
import { settled } from "@bjornpagen/den/runtime/settled"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Retry over its served programs; `den generate` writes it, and nothing edits it. */
import { type Addition, Sha256 } from "@bjornpagen/grizzle"
import { codecText } from "@bjornpagen/grizzle/compile"
import type { MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, pipe, Result, Stream } from "effect"
import { retry } from "#integration/slice/flows.ts"
import {
	RetryPausable,
	RetryLaddersInput,
	RetryThrottledInput,
	RetryUnhurriedInput
} from "#integration/slice/generated/retry.fragment.ts"
import type {
	RetryScope,
	RetryAdmitted,
	RetryFinish,
	RetryStartStep,
	RetrySteadfastInput,
	RetryBrittleInput,
	RetryPoliteInput,
	RetryPatientInput,
	RetryKind,
	RetryRootKind
} from "#integration/slice/generated/retry.fragment.ts"
import type {
	retryDenPrograms,
	retryCoordinatorPrograms,
	retryRetirerPrograms,
	retryCommitPrograms
} from "#integration/slice/generated/retry.programs.ts"

/** The codec text of each declared field of RetryLaddersInput, a request's input row, bound once (grizzle's codecText). */
const retryLaddersInputTexts = Object.freeze({
	steadfast: codecText(RetryLaddersInput.fields.steadfast),
	brittle: codecText(RetryLaddersInput.fields.brittle)
})
/** The codec text of each declared field of RetryThrottledInput, a request's input row, bound once (grizzle's codecText). */
const retryThrottledInputTexts = Object.freeze({ key: codecText(RetryThrottledInput.fields.key) })
/** The codec text of each declared field of RetryUnhurriedInput, a request's input row, bound once (grizzle's codecText). */
const retryUnhurriedInputTexts = Object.freeze({ key: codecText(RetryUnhurriedInput.fields.key) })
/** The fingerprint of root kind Ladders's input heading, taken once. */
const retryLaddersHeading = inputFingerprint(
	'58:17:RetryLaddersInput17:9:steadfast4:Text15:7:brittle4:Text261:6:digest249:[...pipe([{ scope: scope, root: scope, steadfast: input.steadfast, brittle: input.brittle }], Arr.flatMap((row) => [Result.succeed("RetryLaddersInput"), retryLaddersInputTexts.steadfast(row.steadfast), retryLaddersInputTexts.brittle(row.brittle)]))]'
)
/** The fingerprint of root kind Throttled's input heading, taken once. */
const retryThrottledHeading = inputFingerprint(
	'36:19:RetryThrottledInput11:3:key4:Text172:6:digest160:[...pipe([{ scope: scope, root: scope, key: input.key }], Arr.flatMap((row) => [Result.succeed("RetryThrottledInput"), retryThrottledInputTexts.key(row.key)]))]'
)
/** The fingerprint of root kind Unhurried's input heading, taken once. */
const retryUnhurriedHeading = inputFingerprint(
	'36:19:RetryUnhurriedInput11:3:key4:Text172:6:digest160:[...pipe([{ scope: scope, root: scope, key: input.key }], Arr.flatMap((row) => [Result.succeed("RetryUnhurriedInput"), retryUnhurriedInputTexts.key(row.key)]))]'
)

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
	readonly RetryScope: ReadonlyArray<Addition<typeof RetryScope>>
	readonly RetryAdmitted: ReadonlyArray<Addition<typeof RetryAdmitted>>
	readonly RetryFinish: ReadonlyArray<Addition<typeof RetryFinish>>
	readonly RetryStartStep: ReadonlyArray<Addition<typeof RetryStartStep>>
	readonly RetrySteadfastInput: ReadonlyArray<Addition<typeof RetrySteadfastInput>>
	readonly RetryBrittleInput: ReadonlyArray<Addition<typeof RetryBrittleInput>>
	readonly RetryPoliteInput: ReadonlyArray<Addition<typeof RetryPoliteInput>>
	readonly RetryPatientInput: ReadonlyArray<Addition<typeof RetryPatientInput>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof RetryKind)["handles"][number]> {
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

/** The ledger of the flow Retry over its handles, with the requests of the roots den requests. */
export const retryLedger = (h: RetryHandles) => {
	const noRows: Rows = {
		RetryScope: [],
		RetryAdmitted: [],
		RetryFinish: [],
		RetryStartStep: [],
		RetrySteadfastInput: [],
		RetryBrittleInput: [],
		RetryPoliteInput: [],
		RetryPatientInput: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: Sha256): boolean =>
		Arr.some(grown.rows.RetryStartStep, (s) => Sha256.equals(s.scope, scope))
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			RetryScope: [...a.rows.RetryScope, ...b.rows.RetryScope],
			RetryAdmitted: [...a.rows.RetryAdmitted, ...b.rows.RetryAdmitted],
			RetryFinish: [...a.rows.RetryFinish, ...b.rows.RetryFinish],
			RetryStartStep: [...a.rows.RetryStartStep, ...b.rows.RetryStartStep],
			RetrySteadfastInput: [...a.rows.RetrySteadfastInput, ...b.rows.RetrySteadfastInput],
			RetryBrittleInput: [...a.rows.RetryBrittleInput, ...b.rows.RetryBrittleInput],
			RetryPoliteInput: [...a.rows.RetryPoliteInput, ...b.rows.RetryPoliteInput],
			RetryPatientInput: [...a.rows.RetryPatientInput, ...b.rows.RetryPatientInput]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startLadders = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof retry.kinds)[2]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(retry.kinds[2].start(input), (spawn, ordinal): Grown => {
				switch (spawn.kind) {
					case "Steadfast":
						return pipe(startedStep(scope, ordinal), (key): Grown => ({
							rows: {
								...noRows,
								RetryStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
								RetrySteadfastInput: [{ step: key, root: root, key: spawn.input.key }]
							},
							...spawnedOf(
								{ step: key, kind: "Steadfast", scope: scope },
								dueOf(retry.kinds[0].due, spawn.input)
							)
						}))
					case "Brittle":
						return pipe(startedStep(scope, ordinal), (key): Grown => ({
							rows: {
								...noRows,
								RetryStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
								RetryBrittleInput: [{ step: key, root: root, key: spawn.input.key }]
							},
							...spawnedOf(
								{ step: key, kind: "Brittle", scope: scope },
								dueOf(retry.kinds[1].due, spawn.input)
							)
						}))
				}
			}),
			nothingGrown,
			joined
		)
	const startThrottled = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof retry.kinds)[4]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(retry.kinds[4].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						RetryStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						RetryPoliteInput: [{ step: key, root: root, key: spawn.input.key }]
					},
					...spawnedOf(
						{ step: key, kind: "Polite", scope: scope },
						dueOf(retry.kinds[3].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const startUnhurried = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof retry.kinds)[6]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(retry.kinds[6].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						RetryStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						RetryPatientInput: [{ step: key, root: root, key: spawn.input.key }]
					},
					...spawnedOf(
						{ step: key, kind: "Patient", scope: scope },
						dueOf(retry.kinds[5].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const readRetrySteadfastInput = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetrySteadfastInput.once({ params: { root, step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryBrittleInput = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryBrittleInput.once({ params: { root, step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryPoliteInput = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryPoliteInput.once({ params: { root, step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryPatientInput = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryPatientInput.once({ params: { root, step }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryLaddersInput = (root: Sha256, scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryLaddersInput.once({ params: { root, scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ steadfast: found.steadfast, brittle: found.brittle }))
		})
	const readRetryThrottledInput = (root: Sha256, scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryThrottledInput.once({ params: { root, scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
		})
	const readRetryUnhurriedInput = (root: Sha256, scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(h.den.retryReadRetryUnhurriedInput.once({ params: { root, scope }, facts: {} })),
				one
			)
			return Option.map(row, (found) => ({ key: found.key }))
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
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		paused: pauseChains.live,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),
		resume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))
	}
	const request = {
		Ladders: (key: string, input: Parameters<(typeof retry.kinds)[2]["start"]>[0]) =>
			pipe(rootScope("Retry", "Ladders", key), (scope) =>
				pipe(
					h.den.retryRequestLadders.once({
						params: {
							retryLaddersScope: scope,
							retryLaddersKey: key,
							retryLaddersRetryScope: [{ scope, root: scope }],
							retryLaddersRetryLaddersInput: [
								{ scope: scope, root: scope, steadfast: input.steadfast, brittle: input.brittle }
							],
							retryLaddersRetryRequestedWith: Option.toArray(
								Option.map(
									codecTextsOf([
										...pipe(
											[
												{
													scope: scope,
													root: scope,
													steadfast: input.steadfast,
													brittle: input.brittle
												}
											],
											Arr.flatMap((row) => [
												Result.succeed("RetryLaddersInput"),
												retryLaddersInputTexts.steadfast(row.steadfast),
												retryLaddersInputTexts.brittle(row.brittle)
											])
										)
									]),
									(texts) => ({
										root: scope,
										fingerprint: retryLaddersHeading,
										input: inputDigest("Retry", "Ladders", texts)
									})
								)
							)
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Retry"), scope, fresh: accepted }))
				)
			),
		Throttled: (key: string, input: Parameters<(typeof retry.kinds)[4]["start"]>[0]) =>
			pipe(rootScope("Retry", "Throttled", key), (scope) =>
				pipe(
					h.den.retryRequestThrottled.once({
						params: {
							retryThrottledScope: scope,
							retryThrottledKey: key,
							retryThrottledRetryScope: [{ scope, root: scope }],
							retryThrottledRetryThrottledInput: [{ scope: scope, root: scope, key: input.key }],
							retryThrottledRetryRequestedWith: Option.toArray(
								Option.map(
									codecTextsOf([
										...pipe(
											[{ scope: scope, root: scope, key: input.key }],
											Arr.flatMap((row) => [
												Result.succeed("RetryThrottledInput"),
												retryThrottledInputTexts.key(row.key)
											])
										)
									]),
									(texts) => ({
										root: scope,
										fingerprint: retryThrottledHeading,
										input: inputDigest("Retry", "Throttled", texts)
									})
								)
							)
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Retry"), scope, fresh: accepted }))
				)
			),
		Unhurried: (key: string, input: Parameters<(typeof retry.kinds)[6]["start"]>[0]) =>
			pipe(rootScope("Retry", "Unhurried", key), (scope) =>
				pipe(
					h.den.retryRequestUnhurried.once({
						params: {
							retryUnhurriedScope: scope,
							retryUnhurriedKey: key,
							retryUnhurriedRetryScope: [{ scope, root: scope }],
							retryUnhurriedRetryUnhurriedInput: [{ scope: scope, root: scope, key: input.key }],
							retryUnhurriedRetryRequestedWith: Option.toArray(
								Option.map(
									codecTextsOf([
										...pipe(
											[{ scope: scope, root: scope, key: input.key }],
											Arr.flatMap((row) => [
												Result.succeed("RetryUnhurriedInput"),
												retryUnhurriedInputTexts.key(row.key)
											])
										)
									]),
									(texts) => ({
										root: scope,
										fingerprint: retryUnhurriedHeading,
										input: inputDigest("Retry", "Unhurried", texts)
									})
								)
							)
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Retry"), scope, fresh: accepted }))
				)
			)
	}
	const runners = {
		Steadfast: runnerOf(
			retry.kinds[0],
			{
				input: ({ root, step }) => readRetrySteadfastInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
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
				input: ({ root, step }) => readRetryBrittleInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
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
		Polite: runnerOf(
			retry.kinds[3],
			{
				input: ({ root, step }) => readRetryPoliteInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.retryCommitPolite.once({
								params: {},
								facts: {
									insert: {
										RetryResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										RetryDone: [{ step: done.turn.step, root: done.turn.root }],
										RetryHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										RetryPoliteOutput: [
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
		Patient: runnerOf(
			retry.kinds[5],
			{
				input: ({ root, step }) => readRetryPatientInput(root, step),
				read: () => Effect.succeed({}),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.retryCommitPatient.once({
								params: {},
								facts: {
									insert: {
										RetryResult: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }],
										RetryDone: [{ step: done.turn.step, root: done.turn.root }],
										RetryHeld: [
											{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
										],
										RetryPatientOutput: [
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
				uses: retry.kinds[2].finish.uses,
				retry: retry.kinds[2].finish.retry,
				waits: retry.kinds[2].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof retry.kinds)[2]["start"]>[0]
					readonly endings: Parameters<(typeof retry.kinds)[2]["finish"]["body"]>[1]
				}) => retry.kinds[2].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.retryStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readRetryLaddersInput(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputSteadfastRows = yield* Effect.map(
							settled(
								h.den.retryOutputsLaddersSteadfast.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputSteadfastRows = yield* Effect.map(
							settled(
								h.den.retryInputsLaddersSteadfast.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresSteadfast = yield* Effect.map(
							settled(
								h.den.retryFailuresLaddersSteadfast.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputSteadfast = (child: (typeof inputSteadfastRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputSteadfastRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({ key: row.key })
								)
							)
						const Steadfast = [
							...(yield* Effect.forEach(outputSteadfastRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputSteadfast(row.step),
										output: Effect.succeed({ key: row.key })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresSteadfast, (failed) =>
								Effect.map(inputSteadfast(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						const outputBrittleRows = yield* Effect.map(
							settled(
								h.den.retryOutputsLaddersBrittle.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputBrittleRows = yield* Effect.map(
							settled(h.den.retryInputsLaddersBrittle.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const failuresBrittle = yield* Effect.map(
							settled(
								h.den.retryFailuresLaddersBrittle.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputBrittle = (child: (typeof inputBrittleRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputBrittleRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({ key: row.key })
								)
							)
						const Brittle = [
							...(yield* Effect.forEach(outputBrittleRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputBrittle(row.step),
										output: Effect.succeed({ key: row.key })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresBrittle, (failed) =>
								Effect.map(inputBrittle(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Steadfast, Brittle } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.retryCommitLaddersFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											RetryResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											RetryDone: [{ step: done.turn.step, root: done.turn.root }],
											RetryHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											RetryLaddersFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("Ladders")
		),
		ThrottledFinish: runnerOf(
			{
				name: "ThrottledFinish",
				uses: retry.kinds[4].finish.uses,
				retry: retry.kinds[4].finish.retry,
				waits: retry.kinds[4].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof retry.kinds)[4]["start"]>[0]
					readonly endings: Parameters<(typeof retry.kinds)[4]["finish"]["body"]>[1]
				}) => retry.kinds[4].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.retryStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readRetryThrottledInput(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputPoliteRows = yield* Effect.map(
							settled(
								h.den.retryOutputsThrottledPolite.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputPoliteRows = yield* Effect.map(
							settled(
								h.den.retryInputsThrottledPolite.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresPolite = yield* Effect.map(
							settled(
								h.den.retryFailuresThrottledPolite.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputPolite = (child: (typeof inputPoliteRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputPoliteRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({ key: row.key })
								)
							)
						const Polite = [
							...(yield* Effect.forEach(outputPoliteRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputPolite(row.step),
										output: Effect.succeed({ key: row.key })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresPolite, (failed) =>
								Effect.map(inputPolite(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Polite } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.retryCommitThrottledFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											RetryResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											RetryDone: [{ step: done.turn.step, root: done.turn.root }],
											RetryHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											RetryThrottledFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("Throttled")
		),
		UnhurriedFinish: runnerOf(
			{
				name: "UnhurriedFinish",
				uses: retry.kinds[6].finish.uses,
				retry: retry.kinds[6].finish.retry,
				waits: retry.kinds[6].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof retry.kinds)[6]["start"]>[0]
					readonly endings: Parameters<(typeof retry.kinds)[6]["finish"]["body"]>[1]
				}) => retry.kinds[6].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.retryStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readRetryUnhurriedInput(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputPatientRows = yield* Effect.map(
							settled(
								h.den.retryOutputsUnhurriedPatient.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputPatientRows = yield* Effect.map(
							settled(
								h.den.retryInputsUnhurriedPatient.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresPatient = yield* Effect.map(
							settled(
								h.den.retryFailuresUnhurriedPatient.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputPatient = (child: (typeof inputPatientRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputPatientRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({ key: row.key })
								)
							)
						const Patient = [
							...(yield* Effect.forEach(outputPatientRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputPatient(row.step),
										output: Effect.succeed({ key: row.key })
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresPatient, (failed) =>
								Effect.map(inputPatient(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Patient } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.retryCommitUnhurriedFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											RetryResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											RetryDone: [{ step: done.turn.step, root: done.turn.root }],
											RetryHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											RetryUnhurriedFinishOutput: [{ step: done.turn.step, root: done.turn.root }]
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
			Option.some("Unhurried")
		)
	}
	const roots: { readonly [K in (typeof RetryRootKind)["handles"][number]]: RootRunner } = {
		Ladders: {
			window: retry.kinds[2].window,
			precondition: retry.kinds[2].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readRetryLaddersInput(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startLadders(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "LaddersFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									RetryScope: grown.rows.RetryScope,
									RetryStartStep: grown.rows.RetryStartStep,
									RetrySteadfastInput: grown.rows.RetrySteadfastInput,
									RetryBrittleInput: grown.rows.RetryBrittleInput,
									RetryPoliteInput: grown.rows.RetryPoliteInput,
									RetryPatientInput: grown.rows.RetryPatientInput,
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
		},
		Throttled: {
			window: retry.kinds[4].window,
			precondition: retry.kinds[4].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readRetryThrottledInput(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startThrottled(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "ThrottledFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									RetryScope: grown.rows.RetryScope,
									RetryStartStep: grown.rows.RetryStartStep,
									RetrySteadfastInput: grown.rows.RetrySteadfastInput,
									RetryBrittleInput: grown.rows.RetryBrittleInput,
									RetryPoliteInput: grown.rows.RetryPoliteInput,
									RetryPatientInput: grown.rows.RetryPatientInput,
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
		},
		Unhurried: {
			window: retry.kinds[6].window,
			precondition: retry.kinds[6].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readRetryUnhurriedInput(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startUnhurried(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "UnhurriedFinish", scope, delay: atOnce }
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
							params: { steps, root: scope },
							facts: {
								insert: {
									RetryScope: grown.rows.RetryScope,
									RetryStartStep: grown.rows.RetryStartStep,
									RetrySteadfastInput: grown.rows.RetrySteadfastInput,
									RetryBrittleInput: grown.rows.RetryBrittleInput,
									RetryPoliteInput: grown.rows.RetryPoliteInput,
									RetryPatientInput: grown.rows.RetryPatientInput,
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
		reading: (environment) =>
			Effect.flatMap(
				settled(
					h.den.retryReading.once({
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
					h.coordinator.retryPromote.once({
						params: { environment: mintEnvironment(host.environment), deployment: host.deployment },
						facts: {}
					})
				)
			),
		authenticated: Effect.asVoid(
			settled(h.commits.retryAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (at) =>
			Effect.map(
				settled(h.den.retryStepOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) =>
					Option.map(one(rows), (row) => ({
						runner: runners[row.kind],
						scope: row.scope,
						due: row.due
					}))
			),
		resultOf: (at) =>
			Effect.map(
				settled(h.den.retryResultOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (at) =>
			Effect.map(
				settled(h.den.retryHeldOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (at) =>
			Effect.map(
				settled(h.den.retryClaimsOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		retriesOf: (at) =>
			Effect.map(
				settled(h.den.retryRetriesOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		fencedOf: (at) =>
			Effect.map(
				settled(h.den.retryFencedOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		scopeOf: ({ root, scope }) =>
			Effect.gen(function* () {
				if (!Sha256.equals(root, scope)) {
					return Option.none()
				}
				const standing = yield* Effect.map(
					settled(h.den.retryRootOf.once({ params: { root }, facts: {} })),
					one
				)
				if (Option.isNone(standing)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.retryAdmittedOf.once({ params: { root, scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.retrySkippedOf.once({ params: { root, scope }, facts: {} })),
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
			h.den.retryUnendedSteps.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
		finished: ({ root, scope }) =>
			h.den.retryFinished.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.retryClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: { RetryClaim: [{ step: row.step, root: row.root }], RetryEnded: row.lapsed }
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.retryRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { RetryEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.retryFence.once({
					params: {},
					facts: {
						insert: {
							RetryEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							RetryFenced: [row]
						}
					}
				})
			),
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
							RetryExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.retryFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) => settled(h.retirer.retryRetire.once({ params: { root }, facts: {} })),
		snapshot: Effect.flatMap(settled(h.den.retrySnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof retry>> => {
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
				signals(h.den.retryPending.watch({ params: {}, facts: {} })),
				signals(h.den.retryRequested.watch({ params: {}, facts: {} })),
				signals(h.den.retryRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.retryPausedAll.watch({ params: {}, facts: {} }))
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
