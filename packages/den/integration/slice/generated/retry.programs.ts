import { DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Retry to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, clocked, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	RetryKind,
	RetryJoin,
	RetryOutcome,
	RetryPausable,
	RetryScope,
	RetryRoot,
	RetryWithin,
	RetryAdmitted,
	RetrySkipped,
	RetryStep,
	RetryStartStep,
	RetryStartScope,
	RetryFinish,
	RetryDue,
	RetryClaim,
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

/** den's role for the flow Retry: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. */
export const RetryDen = role(
	App,
	"retry_den",
	{ ...retryGraph.relations },
	{
		insert: [
			"RetryScope",
			"RetryRoot",
			"RetryWithin",
			"RetryAdmitted",
			"RetrySkipped",
			"RetryStep",
			"RetryStartStep",
			"RetryStartScope",
			"RetryFinish",
			"RetryDue",
			"RetryClaim",
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
	{ RetryKind, RetryJoin, RetryOutcome, RetryPausable, RetryPaused, RetryResumed },
	{ insert: ["RetryPaused", "RetryResumed"] }
)

export const retryDenPrograms = Object.freeze({
	retryNow: clocked(
		query(retryGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	retryClaim: ChangeSet.empty(retryGraph)
		.insert(RetryClaim, [])
		.read("held", (delta) =>
			query(retryGraph)
				.rule((r) => {
					const { step, attempt, holder } = v(delta.added(RetryClaim), "added")
					return r
						.match(delta.added(RetryClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
				.rule((r) => {
					const { step, attempt, holder } = v(delta.met(RetryClaim), "met")
					return r
						.match(delta.met(RetryClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
		),
	retryRetry: ChangeSet.empty(retryGraph).insert(RetryRetry, []),
	retryFence: ChangeSet.empty(retryGraph).insert(RetryFenced, []),
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
	retryAdmit: ChangeSet.empty(retryGraph)
		.insert(RetryAdmitted, [])
		.insert(RetryFinish, [])
		.insert(RetryStartStep, [])
		.insert(RetryStartScope, [])
		.insert(RetryStep, [])
		.insert(RetryDue, [])
		.insert(RetryScope, [])
		.insert(RetryWithin, [])
		.insert(RetrySteadfastInput, [])
		.insert(RetryBrittleInput, []),
	retrySkip: ChangeSet.empty(retryGraph).insert(RetrySkipped, []),
	retrySkippedOf: query(retryGraph).rule((r) => {
		const { scope, by, root } = v(RetrySkipped, "retrySkipped")
		return r
			.match(RetrySkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", RetrySkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	retryStepOf: query(retryGraph).rule((r) => {
		const { step, kind, scope, root } = v(RetryStep, "retryStep")
		return r
			.match(RetryStep, { step, kind, scope, root })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, kind, scope, root })
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
	retryDueOf: query(retryGraph).rule((r) => {
		const { step, at, root } = v(RetryDue, "retryDue")
		return r
			.match(RetryDue, { step, at, root })
			.where(r.eq(step, r.param("step", RetryDue.fields.step)))
			.find({ step, at, root })
	}),
	retryScopeOf: query(retryGraph).rule((r) => {
		const { scope, kind, root } = v(RetryScope, "retryScope")
		return r
			.match(RetryScope, { scope, kind, root })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ scope, kind, root })
	}),
	retryWithinOf: query(retryGraph).rule((r) => {
		const { scope, parent, root } = v(RetryWithin, "retryWithin")
		return r
			.match(RetryWithin, { scope, parent, root })
			.where(r.eq(scope, r.param("scope", RetryWithin.fields.scope)))
			.find({ scope, parent, root })
	}),
	retryAdmittedOf: query(retryGraph).rule((r) => {
		const { scope, root } = v(RetryAdmitted, "retryAdmitted")
		return r
			.match(RetryAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", RetryAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	retryRootOf: query(retryGraph).rule((r) => {
		const { scope, key, at } = v(RetryRoot, "retryRoot")
		return r
			.match(RetryRoot, { scope, key, at })
			.where(r.eq(scope, r.param("scope", RetryRoot.fields.scope)))
			.find({ scope, key, at })
	}),
	retryFinishedRoots: deferrable(
		query(retryGraph)
			.rule((r) => {
				const { scope, key, at } = v(RetryRoot, "root")
				const { kind } = v(RetryScope, "scope")
				const { step } = v(RetryFinish, "finish")
				return r
					.match(RetryRoot, { scope, key, at })
					.match(RetryScope, { scope, kind })
					.match(RetryFinish, { scope, step })
					.match(RetryResult, { step })
					.find({ scope, kind, at })
			})
			.rule((r) => {
				const { scope, key, at } = v(RetryRoot, "root")
				const { kind } = v(RetryScope, "scope")
				return r
					.match(RetryRoot, { scope, key, at })
					.match(RetryScope, { scope, kind })
					.match(RetrySkipped, { scope })
					.find({ scope, kind, at })
			})
	),
	retryClaimsOf: query(retryGraph).rule((r) => {
		const { step, attempt, holder, until } = v(RetryClaim, "claim")
		return r
			.match(RetryClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, holder, until })
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
	retryOpenChildren: query(retryGraph)
		.rule((r) => {
			const { scope, parent } = v(RetryWithin, "within")
			return r
				.match(RetryWithin, { scope, parent })
				.where(
					r.eq(parent, r.param("scope", RetryScope.fields.scope)),
					r.not(RetryAdmitted, { scope })
				)
				.find({ child: scope })
		})
		.rule((r) => {
			const { scope, parent } = v(RetryWithin, "within")
			const { step } = v(RetryFinish, "finish")
			return r
				.match(RetryWithin, { scope, parent })
				.match(RetryFinish, { scope, step })
				.where(
					r.eq(parent, r.param("scope", RetryScope.fields.scope)),
					r.not(RetryResult, { step })
				)
				.find({ child: scope })
		}),
	retryFinished: query(retryGraph).rule((r) => {
		const { scope, step } = v(RetryFinish, "finish")
		return r
			.match(RetryFinish, { scope, step })
			.match(RetryResult, { step })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryPending: deferrable(
		query(retryGraph).rule((r) => {
			const { step, kind, scope } = v(RetryStep, "step")
			return r
				.match(RetryStep, { step, kind, scope })
				.where(r.not(RetryResult, { step }))
				.find({ step, kind, scope })
		})
	),
	retryPendingClaims: deferrable(
		query(retryGraph).rule((r) => {
			const { step, attempt, until } = v(RetryClaim, "claim")
			return r
				.match(RetryClaim, { step, attempt, until })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt, until })
		})
	),
	retryPendingRetries: deferrable(
		query(retryGraph).rule((r) => {
			const { step, attempt, at, spent } = v(RetryRetry, "retry")
			return r
				.match(RetryRetry, { step, attempt, at, spent })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	retryPendingFenced: deferrable(
		query(retryGraph).rule((r) => {
			const { step, attempt } = v(RetryFenced, "fenced")
			return r
				.match(RetryFenced, { step, attempt })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt })
		})
	),
	retryPendingDues: deferrable(
		query(retryGraph).rule((r) => {
			const { step, at } = v(RetryDue, "due")
			return r.match(RetryDue, { step, at }).where(r.not(RetryResult, { step })).find({ step, at })
		})
	),
	retryRequested: deferrable(
		query(retryGraph).rule((r) => {
			const { scope, kind } = v(RetryScope, "scope")
			return r
				.match(RetryScope, { scope, kind })
				.where(r.not(RetryAdmitted, { scope }), r.not(RetrySkipped, { scope }))
				.find({ scope, kind })
		})
	),
	retryRunning: deferrable(
		query(retryGraph).rule((r) => {
			const { scope, kind } = v(RetryScope, "scope")
			const { step } = v(RetryFinish, "finish")
			return r
				.match(RetryScope, { scope, kind })
				.match(RetryFinish, { scope, step })
				.where(r.not(RetryResult, { step }))
				.find({ scope, kind })
		})
	),
	retryWithins: deferrable(
		query(retryGraph).rule((r) => {
			const { scope, parent } = v(RetryWithin, "retryWithin")
			return r.match(RetryWithin, { scope, parent }).find({ scope, parent })
		})
	),
	retryRoots: deferrable(
		query(retryGraph).rule((r) => {
			const { scope, key, at } = v(RetryRoot, "retryRoot")
			return r.match(RetryRoot, { scope, key, at }).find({ scope, key, at })
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
	retryRequestLadders: ChangeSet.empty(retryGraph)
		.insert(RetryScope, [])
		.insert(RetryRoot, [])
		.insert(RetryLaddersInput, []),
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

/** den's retiring role for the flow Retry: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else, so every inserter of the graph stays READ COMMITTED. */
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
