import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Retry to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, Num, Type, clocked, param, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { retry as declaredFlow } from "#integration/slice/flows.ts"
import {
	RetryKind,
	RetryRootKind,
	RetryOutcome,
	RetryRetryWhy,
	RetryPausable,
	RetryScope,
	RetryRoot,
	RetryAdmitted,
	RetrySkipped,
	RetryStep,
	RetryStartStep,
	RetryFinish,
	RetryClaim,
	RetryEnded,
	RetryRetry,
	RetryFenced,
	RetryResult,
	RetryDone,
	RetryFailed,
	RetryHeld,
	RetryRefusal,
	RetryExhausted,
	RetrySteadfastInput,
	RetryBrittleInput,
	RetryPoliteInput,
	RetryPatientInput,
	RetryLaddersInput,
	RetryThrottledInput,
	RetryUnhurriedInput,
	RetrySteadfastOutput,
	RetryBrittleOutput,
	RetryPoliteOutput,
	RetryPatientOutput,
	RetryLaddersFinishOutput,
	RetryThrottledFinishOutput,
	RetryUnhurriedFinishOutput,
	RetryPaused,
	RetryResumed,
	RetryServed,
	retryGraph,
	retryCoordination
} from "#integration/slice/generated/retry.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Retry: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const RetryDen = role(
	App,
	"retry_den",
	{ ...retryGraph.relations, RetryPaused, RetryResumed, RetryServed },
	{
		insert: [
			"RetryScope",
			"RetryRoot",
			"RetryAdmitted",
			"RetrySkipped",
			"RetryStep",
			"RetryStartStep",
			"RetryFinish",
			"RetryClaim",
			"RetryEnded",
			"RetryRetry",
			"RetryFenced",
			"RetryResult",
			"RetryDone",
			"RetryFailed",
			"RetryHeld",
			"RetryRefusal",
			"RetryExhausted",
			"RetrySteadfastInput",
			"RetryBrittleInput",
			"RetryPoliteInput",
			"RetryPatientInput",
			"RetryLaddersInput",
			"RetryThrottledInput",
			"RetryUnhurriedInput",
			"RetryLaddersFinishOutput",
			"RetryThrottledFinishOutput",
			"RetryUnhurriedFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Retry: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const RetryCoordinator = role(
	App,
	"retry_coordinator",
	{
		RetryKind,
		RetryRootKind,
		RetryOutcome,
		RetryRetryWhy,
		RetryPausable,
		RetryPaused,
		RetryResumed,
		RetryServed
	},
	{ insert: ["RetryPaused", "RetryResumed", "RetryServed"] }
)

const retryPendingRead = query(RetryDen).rule((r) => {
	const { step, kind, scope, due } = v(RetryStep, "step")
	return r
		.match(RetryStep, { step, kind, scope, due })
		.where(r.not(RetryResult, { step }))
		.find({ step, kind, scope, due })
})

const retryRequestedRead = query(RetryDen).rule((r) => {
	const { scope } = v(RetryScope, "scope")
	return r
		.match(RetryRoot, { root: scope })
		.match(RetryScope, { root: scope, scope })
		.where(r.not(RetryAdmitted, { scope }), r.not(RetrySkipped, { scope }))
		.find({ scope })
})

const retryRunningRead = query(RetryDen).rule((r) => {
	const { scope, step } = v(RetryFinish, "finish")
	return r.match(RetryFinish, { scope, step }).where(r.not(RetryResult, { step })).find({ scope })
})

const retryLatestServed = query(RetryDen).rule((r) => {
	const { environment, at } = v(RetryServed, "served")
	return r
		.match(RetryServed, { environment, at })
		.where(r.eq(environment, r.param("environment", RetryServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const retryDenPrograms = Object.freeze({
	retryNow: clocked(
		query(retryGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	retryReading: clocked(
		query(RetryDen).reads({
			now: query(retryGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
			serving: query(RetryDen).rule((r) => {
				const { environment, at, deployment } = v(RetryServed, "served")
				return r
					.match(
						retryLatestServed.bind({
							environment: r.param("environment", RetryServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(RetryServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.now": "millis" }
	),
	retryClaim: clocked(
		ChangeSet.empty(retryGraph)
			.insertAllComputed(
				{ RetryClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("now", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant
					)
				}
			)
			.insert(RetryEnded, [])
			.read("held", (delta) =>
				query(retryGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(RetryClaim), "added")
					return r
						.match(delta.added(RetryClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ now: "millis" }
	),
	retryRetry: clocked(
		ChangeSet.empty(retryGraph)
			.insert(RetryEnded, [])
			.insert(
				RetryRetry,
				query(retryGraph).rule((r) =>
					r.find({
						step: r.param("step", RetryRetry.fields.step),
						attempt: r.param("attempt", RetryRetry.fields.attempt),
						at: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(r.param("delay", DenDelay))),
							DenInstant
						),
						why: r.param("why", RetryRetry.fields.why),
						root: r.param("root", RetryRetry.fields.root)
					})
				)
			),
		{ now: "millis" }
	),
	retryFence: ChangeSet.empty(retryGraph).insert(RetryEnded, []).insert(RetryFenced, []),
	retryRefuse: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryFailed, [])
		.insert(RetryHeld, [])
		.insert(RetryRefusal, []),
	retryExhaust: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryFailed, [])
		.insert(RetryHeld, [])
		.insert(RetryExhausted, []),
	retryAdmit: clocked(
		ChangeSet.empty(retryGraph)
			.insert(RetryAdmitted, [])
			.insert(RetryFinish, [])
			.insert(RetryStartStep, [])
			.insert(RetryScope, [])
			.insert(RetrySteadfastInput, [])
			.insert(RetryBrittleInput, [])
			.insert(RetryPoliteInput, [])
			.insert(RetryPatientInput, [])
			.insert(
				RetryStep,
				query(retryGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: RetryStep.fields.step,
						kind: RetryStep.fields.kind,
						scope: RetryStep.fields.scope,
						delay: DenDelay
					})
					const { step, kind, scope, delay } = v(steps, "spawned")
					return r.match(steps, { step, kind, scope, delay }).find({
						step,
						kind,
						scope,
						due: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(delay)),
							DenInstant
						),
						root: r.param("root", RetryStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	retrySkip: ChangeSet.empty(retryGraph).insert(RetrySkipped, []),
	retrySkippedOf: query(retryGraph).rule((r) => {
		const { root, scope, by } = v(RetrySkipped, "retrySkipped")
		return r
			.match(RetrySkipped, { root, scope, by })
			.where(r.eq(scope, r.param("scope", RetrySkipped.fields.scope)))
			.find({ root, scope, by })
	}),
	retryStepOf: query(retryGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(RetryStep, "retryStep")
		return r
			.match(RetryStep, { root, step, kind, scope, due })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ root, step, kind, scope, due })
	}),
	retryResultOf: query(retryGraph).rule((r) => {
		const { root, step, outcome } = v(RetryResult, "retryResult")
		return r
			.match(RetryResult, { root, step, outcome })
			.where(r.eq(step, r.param("step", RetryResult.fields.step)))
			.find({ root, step, outcome })
	}),
	retryHeldOf: query(retryGraph).rule((r) => {
		const { root, step, attempt } = v(RetryHeld, "retryHeld")
		return r
			.match(RetryHeld, { root, step, attempt })
			.where(r.eq(step, r.param("step", RetryHeld.fields.step)))
			.find({ root, step, attempt })
	}),
	retryAdmittedOf: query(retryGraph).rule((r) => {
		const { root, scope } = v(RetryAdmitted, "retryAdmitted")
		return r
			.match(RetryAdmitted, { root, scope })
			.where(r.eq(scope, r.param("scope", RetryAdmitted.fields.scope)))
			.find({ root, scope })
	}),
	retryRootOf: query(retryGraph).rule((r) => {
		const { kind, key, at } = v(RetryRoot, "root")
		const { scope } = v(RetryScope, "scope")
		return r
			.match(RetryRoot, { root: scope, kind, key, at })
			.match(RetryScope, { root: scope, scope })
			.where(r.eq(scope, r.param("scope", RetryRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	retryFinishedRoots: query(retryGraph)
		.rule((r) => {
			const { scope, step } = v(RetryFinish, "finish")
			return r
				.match(RetryFinish, { root: scope, scope, step })
				.match(RetryResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(RetrySkipped, "skipped")
			return r.match(RetrySkipped, { root: scope, scope }).find({ scope })
		}),
	retryClaimsOf: query(retryGraph).rule((r) => {
		const { step, attempt, until } = v(RetryClaim, "claim")
		return r
			.match(RetryClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, until })
	}),
	retryRetriesOf: query(retryGraph).rule((r) => {
		const { step, attempt, at, why } = v(RetryRetry, "retry")
		return r
			.match(RetryRetry, { step, attempt, at, why })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, at, why })
	}),
	retryFencedOf: query(retryGraph).rule((r) => {
		const { step, attempt } = v(RetryFenced, "fenced")
		return r
			.match(RetryFenced, { step, attempt })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt })
	}),
	retryUnendedSteps: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", RetryScope.fields.scope)),
				r.not(RetryResult, { step }),
				r.not(RetryFinish, { scope, step })
			)
			.find({ step })
	}),
	retryFinished: query(retryGraph).rule((r) => {
		const { scope, step } = v(RetryFinish, "finish")
		return r
			.match(RetryFinish, { scope, step })
			.match(RetryResult, { step })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryPending: retryPendingRead,
	retryRequested: retryRequestedRead,
	retryRunning: retryRunningRead,
	retrySnapshot: query(RetryDen).reads({
		steps: retryPendingRead,
		claims: query(RetryDen).rule((r) => {
			const { step, attempt, until } = v(RetryClaim, "claim")
			return r
				.match(RetryClaim, { step, attempt, until })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt, until })
		}),
		retries: query(RetryDen).rule((r) => {
			const { step, attempt, at, why } = v(RetryRetry, "retry")
			return r
				.match(RetryRetry, { step, attempt, at, why })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt, at, why })
		}),
		fenced: query(RetryDen).rule((r) => {
			const { step, attempt } = v(RetryFenced, "fenced")
			return r
				.match(RetryFenced, { step, attempt })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt })
		}),
		requested: retryRequestedRead,
		running: retryRunningRead,
		roots: query(RetryDen).rule((r) => {
			const { kind, key, at } = v(RetryRoot, "root")
			const { scope } = v(RetryScope, "scope")
			return r
				.match(RetryRoot, { root: scope, kind, key, at })
				.match(RetryScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: query(RetryDen).rule((r) => {
			const { target, turn } = v(RetryPaused, "retryPaused")
			return r
				.match(RetryPaused, { target, turn })
				.where(r.not(RetryResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	retryReadRetrySteadfastInput: query(retryGraph).rule((r) => {
		const { root, step, key } = v(RetrySteadfastInput, "retrySteadfastInput")
		return r
			.match(RetrySteadfastInput, { root, step, key })
			.where(r.eq(step, r.param("step", RetrySteadfastInput.fields.step)))
			.find({ root, step, key })
	}),
	retryReadRetryBrittleInput: query(retryGraph).rule((r) => {
		const { root, step, key } = v(RetryBrittleInput, "retryBrittleInput")
		return r
			.match(RetryBrittleInput, { root, step, key })
			.where(r.eq(step, r.param("step", RetryBrittleInput.fields.step)))
			.find({ root, step, key })
	}),
	retryReadRetryPoliteInput: query(retryGraph).rule((r) => {
		const { root, step, key } = v(RetryPoliteInput, "retryPoliteInput")
		return r
			.match(RetryPoliteInput, { root, step, key })
			.where(r.eq(step, r.param("step", RetryPoliteInput.fields.step)))
			.find({ root, step, key })
	}),
	retryReadRetryPatientInput: query(retryGraph).rule((r) => {
		const { root, step, key } = v(RetryPatientInput, "retryPatientInput")
		return r
			.match(RetryPatientInput, { root, step, key })
			.where(r.eq(step, r.param("step", RetryPatientInput.fields.step)))
			.find({ root, step, key })
	}),
	retryReadRetryLaddersInput: query(retryGraph).rule((r) => {
		const { root, scope, steadfast, brittle } = v(RetryLaddersInput, "retryLaddersInput")
		return r
			.match(RetryLaddersInput, { root, scope, steadfast, brittle })
			.where(r.eq(scope, r.param("scope", RetryLaddersInput.fields.scope)))
			.find({ root, scope, steadfast, brittle })
	}),
	retryRequestLadders: clocked(
		ChangeSet.empty(retryGraph)
			.insert(RetryScope, [])
			.insert(RetryLaddersInput, [])
			.insert(
				RetryRoot,
				query(retryGraph).rule((r) =>
					r.find({
						root: r.param("retryLaddersScope", RetryRoot.fields.root),
						kind: RetryRootKind.handle("Ladders"),
						key: r.param("retryLaddersKey", RetryRoot.fields.key),
						at: r.param("now", RetryRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	retryOutputsLaddersSteadfast: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetrySteadfastOutput, "output")
		return r
			.match(RetryStep, { step, kind: "Steadfast", scope })
			.match(RetrySteadfastOutput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryInputsLaddersSteadfast: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetrySteadfastInput, "input")
		return r
			.match(RetryStep, { step, kind: "Steadfast", scope })
			.match(RetrySteadfastInput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryFailuresLaddersSteadfast: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Steadfast", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryOutputsLaddersBrittle: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryBrittleOutput, "output")
		return r
			.match(RetryStep, { step, kind: "Brittle", scope })
			.match(RetryBrittleOutput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryInputsLaddersBrittle: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryBrittleInput, "input")
		return r
			.match(RetryStep, { step, kind: "Brittle", scope })
			.match(RetryBrittleInput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryFailuresLaddersBrittle: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Brittle", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryReadRetryThrottledInput: query(retryGraph).rule((r) => {
		const { root, scope, key } = v(RetryThrottledInput, "retryThrottledInput")
		return r
			.match(RetryThrottledInput, { root, scope, key })
			.where(r.eq(scope, r.param("scope", RetryThrottledInput.fields.scope)))
			.find({ root, scope, key })
	}),
	retryRequestThrottled: clocked(
		ChangeSet.empty(retryGraph)
			.insert(RetryScope, [])
			.insert(RetryThrottledInput, [])
			.insert(
				RetryRoot,
				query(retryGraph).rule((r) =>
					r.find({
						root: r.param("retryThrottledScope", RetryRoot.fields.root),
						kind: RetryRootKind.handle("Throttled"),
						key: r.param("retryThrottledKey", RetryRoot.fields.key),
						at: r.param("now", RetryRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	retryOutputsThrottledPolite: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryPoliteOutput, "output")
		return r
			.match(RetryStep, { step, kind: "Polite", scope })
			.match(RetryPoliteOutput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryInputsThrottledPolite: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryPoliteInput, "input")
		return r
			.match(RetryStep, { step, kind: "Polite", scope })
			.match(RetryPoliteInput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryFailuresThrottledPolite: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Polite", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryReadRetryUnhurriedInput: query(retryGraph).rule((r) => {
		const { root, scope, key } = v(RetryUnhurriedInput, "retryUnhurriedInput")
		return r
			.match(RetryUnhurriedInput, { root, scope, key })
			.where(r.eq(scope, r.param("scope", RetryUnhurriedInput.fields.scope)))
			.find({ root, scope, key })
	}),
	retryRequestUnhurried: clocked(
		ChangeSet.empty(retryGraph)
			.insert(RetryScope, [])
			.insert(RetryUnhurriedInput, [])
			.insert(
				RetryRoot,
				query(retryGraph).rule((r) =>
					r.find({
						root: r.param("retryUnhurriedScope", RetryRoot.fields.root),
						kind: RetryRootKind.handle("Unhurried"),
						key: r.param("retryUnhurriedKey", RetryRoot.fields.key),
						at: r.param("now", RetryRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	retryOutputsUnhurriedPatient: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryPatientOutput, "output")
		return r
			.match(RetryStep, { step, kind: "Patient", scope })
			.match(RetryPatientOutput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryInputsUnhurriedPatient: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryPatientInput, "input")
		return r
			.match(RetryStep, { step, kind: "Patient", scope })
			.match(RetryPatientInput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryFailuresUnhurriedPatient: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Patient", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	})
})

export const retryDenWorkload = workload(RetryDen, retryDenPrograms)

export const retryCoordinatorPrograms = Object.freeze({
	retryPromote: clocked(
		ChangeSet.empty(retryCoordination).insert(
			RetryServed,
			query(retryCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", RetryServed.fields.environment),
					at: r.param("now", RetryServed.fields.at),
					deployment: r.param("deployment", RetryServed.fields.deployment)
				})
			)
		),
		{ now: "millis" }
	),
	retryPause: ChangeSet.empty(retryCoordination).insert(RetryPaused, []),
	retryResume: ChangeSet.empty(retryCoordination).insert(RetryResumed, []),
	retryPauseTurns: query(retryCoordination).rule((r) => {
		const { target, turn } = v(RetryPaused, "retryPaused")
		return r.match(RetryPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	retryPausedAll: query(retryCoordination).rule((r) => {
		const { target, turn } = v(RetryPaused, "retryPaused")
		return r
			.match(RetryPaused, { target, turn })
			.where(r.not(RetryResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const retryCoordinatorWorkload = workload(RetryCoordinator, retryCoordinatorPrograms)

/** den's retiring role for the flow Retry: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const RetryRetirer = role(
	App,
	"retry_retirer",
	{ ...retryGraph.relations },
	{
		write: [
			"RetryScope",
			"RetryAdmitted",
			"RetrySkipped",
			"RetryStep",
			"RetryStartStep",
			"RetryFinish",
			"RetryClaim",
			"RetryEnded",
			"RetryRetry",
			"RetryFenced",
			"RetryResult",
			"RetryDone",
			"RetryFailed",
			"RetryHeld",
			"RetryRefusal",
			"RetryExhausted",
			"RetrySteadfastInput",
			"RetryBrittleInput",
			"RetryPoliteInput",
			"RetryPatientInput",
			"RetryLaddersInput",
			"RetryThrottledInput",
			"RetryUnhurriedInput",
			"RetrySteadfastOutput",
			"RetryBrittleOutput",
			"RetryPoliteOutput",
			"RetryPatientOutput",
			"RetryLaddersFinishOutput",
			"RetryThrottledFinishOutput",
			"RetryUnhurriedFinishOutput"
		]
	}
)

export const retryRetirerPrograms = Object.freeze({
	retryRetire: ChangeSet.empty(retryGraph).deleteWhere({
		RetryScope: { root: param("root", RetryRoot.fields.root) },
		RetryAdmitted: { root: param("root", RetryRoot.fields.root) },
		RetrySkipped: { root: param("root", RetryRoot.fields.root) },
		RetryStep: { root: param("root", RetryRoot.fields.root) },
		RetryStartStep: { root: param("root", RetryRoot.fields.root) },
		RetryFinish: { root: param("root", RetryRoot.fields.root) },
		RetryClaim: { root: param("root", RetryRoot.fields.root) },
		RetryEnded: { root: param("root", RetryRoot.fields.root) },
		RetryRetry: { root: param("root", RetryRoot.fields.root) },
		RetryFenced: { root: param("root", RetryRoot.fields.root) },
		RetryResult: { root: param("root", RetryRoot.fields.root) },
		RetryDone: { root: param("root", RetryRoot.fields.root) },
		RetryFailed: { root: param("root", RetryRoot.fields.root) },
		RetryHeld: { root: param("root", RetryRoot.fields.root) },
		RetryRefusal: { root: param("root", RetryRoot.fields.root) },
		RetryExhausted: { root: param("root", RetryRoot.fields.root) },
		RetrySteadfastInput: { root: param("root", RetryRoot.fields.root) },
		RetryBrittleInput: { root: param("root", RetryRoot.fields.root) },
		RetryPoliteInput: { root: param("root", RetryRoot.fields.root) },
		RetryPatientInput: { root: param("root", RetryRoot.fields.root) },
		RetryLaddersInput: { root: param("root", RetryRoot.fields.root) },
		RetryThrottledInput: { root: param("root", RetryRoot.fields.root) },
		RetryUnhurriedInput: { root: param("root", RetryRoot.fields.root) },
		RetrySteadfastOutput: { root: param("root", RetryRoot.fields.root) },
		RetryBrittleOutput: { root: param("root", RetryRoot.fields.root) },
		RetryPoliteOutput: { root: param("root", RetryRoot.fields.root) },
		RetryPatientOutput: { root: param("root", RetryRoot.fields.root) },
		RetryLaddersFinishOutput: { root: param("root", RetryRoot.fields.root) },
		RetryThrottledFinishOutput: { root: param("root", RetryRoot.fields.root) },
		RetryUnhurriedFinishOutput: { root: param("root", RetryRoot.fields.root) }
	})
})

export const retryRetirerWorkload = workload(RetryRetirer, retryRetirerPrograms)

/** The commits and declared reads of the flow Retry, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const retryCommitPrograms = Object.freeze({
	retryAuthenticated: clocked(
		query(retryGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	retryCommitSteadfast: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetrySteadfastOutput, []),
	retryCommitBrittle: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryBrittleOutput, []),
	retryCommitPolite: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryPoliteOutput, []),
	retryCommitPatient: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryPatientOutput, []),
	retryCommitLaddersFinish: ChangeSet.union(
		ChangeSet.empty(retryGraph)
			.insert(RetryResult, [])
			.insert(RetryDone, [])
			.insert(RetryHeld, [])
			.insert(RetryLaddersFinishOutput, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	),
	retryCommitThrottledFinish: ChangeSet.union(
		ChangeSet.empty(retryGraph)
			.insert(RetryResult, [])
			.insert(RetryDone, [])
			.insert(RetryHeld, [])
			.insert(RetryThrottledFinishOutput, []),
		declaredFlow.kinds[4].finish.writes.changes(Loader)
	),
	retryCommitUnhurriedFinish: ChangeSet.union(
		ChangeSet.empty(retryGraph)
			.insert(RetryResult, [])
			.insert(RetryDone, [])
			.insert(RetryHeld, [])
			.insert(RetryUnhurriedFinishOutput, []),
		declaredFlow.kinds[6].finish.writes.changes(Loader)
	)
})

export const retryCommits = workload(Loader, retryCommitPrograms)
