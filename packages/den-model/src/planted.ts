import { Array as Arr, HashMap, Option } from "effect"
import { type Rules, SOUND } from "#ledger.ts"
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
 * The census counts only steps that are due by their own instant and forgets a claim whose lease ran out: a holder that
 * died after its claim leaves its step held, and nothing rings for it again.
 */
export const censusBlindToExpiry: Planted = inPlatform("no-stall", {
	counts: (row) => row.phase._tag === "Due"
})

/** The ceilings never end a step: one that retries every time retries for ever. */
export const ceilingsIgnored: Planted = inLedger("no-stall", { exhausted: () => false })

/**
 * The commit is fenced on its claim alone and blind to a result already there: a step its scope's stop ended, or one a
 * commit already landed, takes another result.
 */
export const fenceBlindToResult: Planted = inLedger("one-result", {
	fence: (row, claim, reported) =>
		row.phase._tag === "Ended" ? "open" : SOUND.fence(row, claim, reported)
})

/** A lost commit still lands its writes, as a loader transaction outside the fence would. */
export const lostWritesLand: Planted = inLedger("one-result", {
	lostWrites: (reported) => (reported._tag === "Output" ? reported.writes : [])
})

/** A scope counts only its steps as children, so it finishes while a child scope still runs. */
export const finishBlindToScopes: Planted = inLedger("scope-once", {
	complete: (scope, state) =>
		Arr.every(
			scope.children,
			(child) =>
				child._tag === "Scope" ||
				Option.exists(HashMap.get(state.steps, child.text), (row) =>
					row._tag === "Body" ? row.phase._tag === "Ended" : Option.isSome(row.ending)
				)
		)
})

/** A scope's finish is no key race: each time the scope is seen complete it gets another finish. */
export const finishWithoutKey: Planted = inLedger("scope-once", {
	finish: (scope) =>
		Option.some({
			_tag: "JoinStep",
			scope: scope.id,
			feed: "finish",
			key: `${scope.finishes.length}`
		})
})

/** The claim's width check is off by one: a lane takes one claim more than its width. */
export const widthOffByOne: Planted = inLedger("width", { room: (live, width) => live <= width })

/**
 * A child's ordinal is the ledger's count of steps, not its position in its edge's output: its identity is not
 * derived, so a commit made again lands its children again under new keys.
 */
export const ordinalNotDerived: Planted = inLedger("rerun", {
	ordinal: (ordinal, state) => ordinal + HashMap.size(state.steps)
})

/**
 * The commit is fenced on the claim's number, the attempt, not on a token minted once: after a root retires and its key
 * is admitted again, its steps have the same keys and their claims count from 0 again, so a holder from the retired
 * graph passes for the new graph's claim of the same number, and its report lands there.
 */
export const fenceOnAttempt: Planted = inLedger("fenced", {
	fence: (row, claim, reported) =>
		row.phase._tag === "Held" && row.phase.hold.claim === claim.claim
			? "open"
			: SOUND.fence(row, claim, reported)
})

/** The ledger serves every deployment: an old deployment keeps claiming and committing after a new one is current. */
export const servesOldDeployments: Planted = inLedger("stale-drains", { serves: () => true })

/**
 * A worker answered `stale` rings on before it exits, pinned to its own deployment: the old deployment keeps waking
 * itself and never drains.
 */
export const staleRingsOn: Planted = inPlatform("stale-drains", {
	afterStale: (lane, deployment, worker) => [{ key: `stale:${worker}`, lane, deployment }]
})

/**
 * A stop fences a step's result but not its spawns: a holder's commit after its scope was stopped lands its children
 * in the stopped scope, which nothing will ever wait for.
 */
export const stopBlindToSpawns: Planted = inLedger("owned", {
	fence: (row, claim, reported) =>
		row.phase._tag === "Ended" && row.phase.ending._tag === "Stopped"
			? "rerun"
			: SOUND.fence(row, claim, reported)
})
