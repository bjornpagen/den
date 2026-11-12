import { Array as Arr, HashMap, Option } from "effect"
import { stepText } from "#identity.ts"
import { endingOf, type Rules, SOUND } from "#ledger.ts"
import type { Law } from "#properties.ts"
import { type Policy, SOUND_POLICY } from "#simulator.ts"

/**
 * A planted bug: the sound ledger and platform with one decision broken the way a real slip would break it, and the law
 * that must catch it. Each is the evidence that its law's check can fail: a check no planted bug fails proves nothing.
 */
export type Planted = Readonly<{ law: Law; rules: Rules; policy: Policy }>

/** The ledger's rules with one replaced, under the sound platform. */
const inLedger = (law: Law, broken: Partial<Rules>): Planted => ({
	law,
	rules: { ...SOUND, ...broken },
	policy: SOUND_POLICY
})

/** The platform's policy with one decision replaced, over the sound ledger. */
const inPlatform = (law: Law, broken: Partial<Policy>): Planted => ({
	law,
	rules: SOUND,
	policy: { ...SOUND_POLICY, ...broken }
})

/**
 * The census rings only steps due by their own instant and forgets a claim whose lease ran out: a holder that died
 * after its claim leaves its step held, and nothing rings for it again.
 */
export const censusBlindToExpiry: Planted = inPlatform("no-stall", {
	rings: (row) => row.phase._tag === "Due"
})

/** The ladder never ends a step: one that retries every time retries for ever. */
export const ladderIgnored: Planted = inLedger("no-stall", { exhausted: () => false })

/**
 * The commit is fenced on its claim alone and blind to a result already there: a step a commit already ended takes a
 * second result from a holder whose answer was lost.
 */
export const fenceBlindToResult: Planted = inLedger("one-result", {
	fence: (row, attempt, reported) =>
		row.phase._tag === "Ended" ? "open" : SOUND.fence(row, attempt, reported)
})

/** A lost commit still lands its writes, as a loader transaction outside the fence would. */
export const lostWritesLand: Planted = inLedger("one-result", {
	lostWrites: (reported) => (reported._tag === "Output" ? reported.writes : [])
})

/**
 * Retired keys recur: the admission forgets the keys it retired, so a root admitted again under one starts a new graph
 * under the same derived keys, whose claims count from 0 again. The fence on the claim's key `(step, attempt)` is then
 * the hole wave 1 found: a holder of the retired graph passes for the new graph's claim of the same number, and its
 * report lands there. grizzle's RETIRE, under which retired keys never recur, is what makes that fence sound.
 */
export const retiredKeysRecur: Planted = inLedger("one-result", { retired: () => false })

/** A scope counts only its steps as children, so it finishes while a child scope still runs. */
export const finishBlindToScopes: Planted = inLedger("scope-once", {
	complete: (scope, state) =>
		Arr.every(
			scope.children,
			(child) =>
				child._tag === "Scope" ||
				Option.exists(HashMap.get(state.steps, child.text), (row) => Option.isSome(endingOf(row)))
		)
})

/** A scope's finish is no key race: each time the scope is seen complete it gets another finish. */
export const finishWithoutKey: Planted = inLedger("scope-once", {
	finish: (scope) =>
		Option.some({
			_tag: "EdgeStep",
			by: { _tag: "FinishStep", scope: scope.id },
			edge: "again",
			ordinal: scope.finishes.length
		})
})

/**
 * A claim's lease counts as run out one tick before its end, so its seats are free while its holder may still run up
 * to its deadline: another claim takes the seat from a live holder.
 */
export const lapseEarly: Planted = inLedger("seats", { lapsed: (until, at) => until <= at + 1 })

/**
 * A scope gives back its exclusivity seat once its finish is spawned, not once it finishes: the next run of its key is
 * admitted while the finish, which moves the cursor, still runs.
 */
export const exclusiveReleasedEarly: Planted = inLedger("exclusive", {
	releases: (at) => at === "finish-spawned"
})

/**
 * A `Pending` read counts only the steps due and forgets those a claim holds: Gold is admitted while a Timeback or QTI
 * step runs.
 */
export const preconditionBlindToHeld: Planted = inLedger("precondition", {
	read: (state, query) =>
		query._tag === "Pending"
			? Arr.filter(SOUND.read(state, query), (row) =>
					Option.exists(HashMap.get(state.steps, row.key), (step) => step.phase._tag === "Due")
				)
			: SOUND.read(state, query)
})

/**
 * A keyed read ignores its key and returns its whole relation: W5's takedown reads every attempt's beacons as its
 * own, and keeps a lesson up its child left.
 */
export const readIgnoresKey: Planted = inLedger("reads", {
	read: (state, query) =>
		SOUND.read(state, query._tag === "Rows" ? { ...query, key: Option.none() } : query)
})

/**
 * A child's ordinal is the ledger's count of steps, not its position in its edge's output: its identity is not
 * derived, so a commit made again lands its children again under new keys.
 */
export const ordinalNotDerived: Planted = inLedger("rerun", {
	ordinal: (ordinal, state) => ordinal + HashMap.size(state.steps)
})

/** The ledger serves every deployment: an old deployment keeps claiming and committing after a new one is current. */
export const servesOldDeployments: Planted = inLedger("stale-drains", { serves: () => true })

/**
 * A worker answered `stale` rings on before it exits, pinned to its own deployment: the old deployment keeps waking
 * itself and never drains.
 */
export const staleRingsOn: Planted = inPlatform("stale-drains", {
	afterStale: (step, deployment, worker) => [
		{ step, attempt: 0, cause: { _tag: "Stale", worker }, deployment, deliverAt: 0 }
	]
})

/**
 * Every ring is keyed by its step and attempt, not its cause: a delivery that ends without claiming (a seat held, a
 * window closed, a stale deployment) spent the key, and every later ring of that attempt, the census's included, is
 * dropped as a duplicate for the transport's whole window, so the step waits on it (Vercel Queues: up to 24 h).
 */
export const keyPerAttempt: Planted = inPlatform("rewake", {
	keyOf: (send) => `${stepText(send.step)}:${send.attempt}`
})

/**
 * A root is retired once every child of its scope ended, before its finish ran: the finish runs with no graph to join
 * it, fire-and-forget.
 */
export const retireBeforeFinish: Planted = inLedger("owned", {
	retirable: (scope, state) => SOUND.complete(scope, state)
})

/**
 * The declaration check of a window is off by one: a window open one tick shorter than the census's period is
 * admitted, and some of its spans fall between two ticks.
 */
export const windowCheckOffByOne: Planted = inLedger("window-tick", {
	windowHolds: (window, census) => window.closes - window.opens >= census - 1
})
