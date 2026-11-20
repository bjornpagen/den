import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Retry to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import {
	ChangeSet,
	Compute,
	clocked,
	deferrable,
	param,
	query,
	role,
	v,
	workload
} from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	RetryKind,
	RetryRootKind,
	RetryOutcome,
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
	RetryLaddersInput,
	RetrySteadfastOutput,
	RetryBrittleOutput,
	RetryPaused,
	RetryResumed,
	retryGraph,
	retryCoordination
} from "#integration/slice/generated/retry.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Retry: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const RetryDen = role(
	App,
	"retry_den",
	{ ...retryGraph.relations, RetryPaused, RetryResumed },
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
			"RetryLaddersInput"
		]
	}
)

/** den's coordinator role for the flow Retry: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const RetryCoordinator = role(
	App,
	"retry_coordinator",
	{ RetryKind, RetryRootKind, RetryOutcome, RetryPausable, RetryPaused, RetryResumed },
	{ insert: ["RetryPaused", "RetryResumed"] }
)

const retryPendingRead = query(RetryDen).rule((r) => {
	const { step, kind, scope, due } = v(RetryStep, "step")
	return r
		.match(RetryStep, { step, kind, scope, due })
		.where(r.not(RetryResult, { step }))
		.find({ step, kind, scope, due })
})

const retryRequestedRead = query(RetryDen).rule((r) => {
	const { scope } = v(RetryRoot, "root")
	return r
		.match(RetryRoot, { scope })
		.where(r.not(RetryAdmitted, { scope }), r.not(RetrySkipped, { scope }))
		.find({ scope })
})

const retryRunningRead = query(RetryDen).rule((r) => {
	const { scope, step } = v(RetryFinish, "finish")
	return r.match(RetryFinish, { scope, step }).where(r.not(RetryResult, { step })).find({ scope })
})

export const retryDenPrograms = Object.freeze({
	retryNow: clocked(
		query(retryGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	retryClaim: clocked(
		ChangeSet.empty(retryGraph)
			.insertComputed(RetryClaim, [], {
				until: Compute.cast(
					Compute.add(
						Compute.base(param("now", DenInstant)),
						Compute.base(param("budget", DenDelay))
					),
					DenInstant
				)
			})
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
						at: Compute.cast(
							Compute.add(
								Compute.base(r.param("now", DenInstant)),
								Compute.base(r.param("delay", DenDelay))
							),
							DenInstant
						),
						spent: r.param("spent", RetryRetry.fields.spent),
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
						due: Compute.cast(
							Compute.add(Compute.base(r.param("now", DenInstant)), Compute.base(delay)),
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
		const { scope, by, root } = v(RetrySkipped, "retrySkipped")
		return r
			.match(RetrySkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", RetrySkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	retryStepOf: query(retryGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(RetryStep, "retryStep")
		return r
			.match(RetryStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	retryResultOf: query(retryGraph).rule((r) => {
		const { step, outcome, root } = v(RetryResult, "retryResult")
		return r
			.match(RetryResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", RetryResult.fields.step)))
			.find({ step, outcome, root })
	}),
	retryHeldOf: query(retryGraph).rule((r) => {
		const { step, attempt, root } = v(RetryHeld, "retryHeld")
		return r
			.match(RetryHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", RetryHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	retryAdmittedOf: query(retryGraph).rule((r) => {
		const { scope, root } = v(RetryAdmitted, "retryAdmitted")
		return r
			.match(RetryAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", RetryAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	retryRootOf: query(retryGraph).rule((r) => {
		const { scope, kind, key, at } = v(RetryRoot, "retryRoot")
		return r
			.match(RetryRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", RetryRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	retryFinishedRoots: deferrable(
		query(retryGraph)
			.rule((r) => {
				const { scope, kind, at } = v(RetryRoot, "root")
				const { step } = v(RetryFinish, "finish")
				return r
					.match(RetryRoot, { scope, kind, at })
					.match(RetryFinish, { scope, step })
					.match(RetryResult, { step })
					.find({ scope, kind, at })
			})
			.rule((r) => {
				const { scope, kind, at } = v(RetryRoot, "root")
				return r
					.match(RetryRoot, { scope, kind, at })
					.match(RetrySkipped, { scope })
					.find({ scope, kind, at })
			})
	),
	retryClaimsOf: query(retryGraph).rule((r) => {
		const { step, attempt, until } = v(RetryClaim, "claim")
		return r
			.match(RetryClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, until })
	}),
	retryRetriesOf: query(retryGraph).rule((r) => {
		const { step, attempt, at, spent } = v(RetryRetry, "retry")
		return r
			.match(RetryRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, at, spent })
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
	retryPending: deferrable(retryPendingRead),
	retryRequested: deferrable(retryRequestedRead),
	retryRunning: deferrable(retryRunningRead),
	retrySnapshot: deferrable(
		query(RetryDen).reads({
			steps: retryPendingRead,
			claims: query(RetryDen).rule((r) => {
				const { step, attempt, until } = v(RetryClaim, "claim")
				return r
					.match(RetryClaim, { step, attempt, until })
					.where(r.not(RetryResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(RetryDen).rule((r) => {
				const { step, attempt, at, spent } = v(RetryRetry, "retry")
				return r
					.match(RetryRetry, { step, attempt, at, spent })
					.where(r.not(RetryResult, { step }))
					.find({ step, attempt, at, spent })
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
				const { scope, kind, key, at } = v(RetryRoot, "retryRoot")
				return r.match(RetryRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			paused: query(RetryDen).rule((r) => {
				const { target, turn } = v(RetryPaused, "retryPaused")
				return r
					.match(RetryPaused, { target, turn })
					.where(r.not(RetryResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	retryReadRetrySteadfastInput: query(retryGraph).rule((r) => {
		const { step, key, root } = v(RetrySteadfastInput, "retrySteadfastInput")
		return r
			.match(RetrySteadfastInput, { step, key, root })
			.where(r.eq(step, r.param("step", RetrySteadfastInput.fields.step)))
			.find({ step, key, root })
	}),
	retryReadRetryBrittleInput: query(retryGraph).rule((r) => {
		const { step, key, root } = v(RetryBrittleInput, "retryBrittleInput")
		return r
			.match(RetryBrittleInput, { step, key, root })
			.where(r.eq(step, r.param("step", RetryBrittleInput.fields.step)))
			.find({ step, key, root })
	}),
	retryReadRetryLaddersInput: query(retryGraph).rule((r) => {
		const { scope, steadfast, brittle, root } = v(RetryLaddersInput, "retryLaddersInput")
		return r
			.match(RetryLaddersInput, { scope, steadfast, brittle, root })
			.where(r.eq(scope, r.param("scope", RetryLaddersInput.fields.scope)))
			.find({ scope, steadfast, brittle, root })
	}),
	retryRequestLadders: clocked(
		ChangeSet.empty(retryGraph)
			.insert(RetryScope, [])
			.insert(RetryLaddersInput, [])
			.insert(
				RetryRoot,
				query(retryGraph).rule((r) =>
					r.find({
						scope: r.param("retryLaddersScope", RetryRoot.fields.scope),
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
	retryFailuresLaddersBrittle: query(retryGraph).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Brittle", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	})
})

export const retryDenWorkload = workload(RetryDen, retryDenPrograms)

export const retryCoordinatorPrograms = Object.freeze({
	retryPause: ChangeSet.empty(retryCoordination).insert(RetryPaused, []),
	retryResume: ChangeSet.empty(retryCoordination).insert(RetryResumed, []),
	retryPauseTurns: deferrable(
		query(retryCoordination).rule((r) => {
			const { target, turn } = v(RetryPaused, "retryPaused")
			return r.match(RetryPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	retryPausedAll: deferrable(
		query(retryCoordination).rule((r) => {
			const { target, turn } = v(RetryPaused, "retryPaused")
			return r
				.match(RetryPaused, { target, turn })
				.where(r.not(RetryResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const retryCoordinatorWorkload = workload(RetryCoordinator, retryCoordinatorPrograms)

/** den's retiring role for the flow Retry: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const RetryRetirer = role(
	App,
	"retry_retirer",
	{ ...retryGraph.relations },
	{ retire: ["RetryRoot"] }
)

export const retryRetirerPrograms = Object.freeze({
	retryRetire: ChangeSet.empty(retryGraph).retire(RetryRoot, [])
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
	retryCommitLaddersFinish: ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
})

export const retryCommits = workload(Loader, retryCommitPrograms)
