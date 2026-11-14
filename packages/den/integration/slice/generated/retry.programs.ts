/** The programs den lowered the flow Retry to, over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
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
	RetryPaused
} from "#integration/slice/generated/retry.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Retry: claims, retries, failures, admissions, requests, and every read the scheduler makes. */
export const RetryDen = role(
	App,
	"retry_den",
	{
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
		RetryBrittleOutput
	},
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

/** den's coordination role for the flow Retry: seats, holds, exclusivity seats and pauses, the seat module's (LEASE replaces it). */
export const RetrySeats = role(
	App,
	"retry_seats",
	{ RetryKind, RetryJoin, RetryOutcome, RetryPausable, RetryPaused },
	{ write: ["RetryPaused"] }
)

export const retryDenPrograms = Object.freeze({
	retryClaim: ChangeSet.empty(RetryDen)
		.insert(RetryClaim, [])
		.read("held", (delta) =>
			query(RetryDen)
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
	retryRetry: ChangeSet.empty(RetryDen).insert(RetryRetry, []),
	retryRefuse: ChangeSet.empty(RetryDen)
		.insert(RetryResult, [])
		.insert(RetryFailed, [])
		.insert(RetryHeld, [])
		.insert(RetryRefusal, []),
	retryExhaust: ChangeSet.empty(RetryDen)
		.insert(RetryResult, [])
		.insert(RetryFailed, [])
		.insert(RetryHeld, [])
		.insert(RetryExhausted, []),
	retryAdmit: ChangeSet.empty(RetryDen)
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
	retrySkip: ChangeSet.empty(RetryDen).insert(RetrySkipped, []),
	retrySkippedOf: RetrySkipped,
	retryStepOf: RetryStep,
	retryResultOf: RetryResult,
	retryHeldOf: RetryHeld,
	retryDueOf: RetryDue,
	retryScopeOf: RetryScope,
	retryWithinOf: RetryWithin,
	retryAdmittedOf: RetryAdmitted,
	retryRootOf: RetryRoot,
	retryClaimsOf: query(RetryDen).rule((r) => {
		const { step, attempt, holder, until } = v(RetryClaim, "claim")
		return r
			.match(RetryClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	retryRetriesOf: query(RetryDen).rule((r) => {
		const { step, attempt, at, spent } = v(RetryRetry, "retry")
		return r
			.match(RetryRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", RetryStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	retryUnendedSteps: query(RetryDen).rule((r) => {
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
	retryOpenChildren: query(RetryDen)
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
	retryFinished: query(RetryDen).rule((r) => {
		const { scope, step } = v(RetryFinish, "finish")
		return r
			.match(RetryFinish, { scope, step })
			.match(RetryResult, { step })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryPending: deferrable(
		query(RetryDen).rule((r) => {
			const { step, kind, scope } = v(RetryStep, "step")
			return r
				.match(RetryStep, { step, kind, scope })
				.where(r.not(RetryResult, { step }))
				.find({ step, kind, scope })
		})
	),
	retryPendingClaims: deferrable(
		query(RetryDen).rule((r) => {
			const { step, attempt, until } = v(RetryClaim, "claim")
			return r
				.match(RetryClaim, { step, attempt, until })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt, until })
		})
	),
	retryPendingRetries: deferrable(
		query(RetryDen).rule((r) => {
			const { step, attempt, at, spent } = v(RetryRetry, "retry")
			return r
				.match(RetryRetry, { step, attempt, at, spent })
				.where(r.not(RetryResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	retryPendingDues: deferrable(
		query(RetryDen).rule((r) => {
			const { step, at } = v(RetryDue, "due")
			return r.match(RetryDue, { step, at }).where(r.not(RetryResult, { step })).find({ step, at })
		})
	),
	retryRequested: deferrable(
		query(RetryDen).rule((r) => {
			const { scope, kind } = v(RetryScope, "scope")
			return r
				.match(RetryScope, { scope, kind })
				.where(r.not(RetryAdmitted, { scope }), r.not(RetrySkipped, { scope }))
				.find({ scope, kind })
		})
	),
	retryRunning: deferrable(
		query(RetryDen).rule((r) => {
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
		query(RetryDen).rule((r) => {
			const { scope, parent } = v(RetryWithin, "retryWithin")
			return r.match(RetryWithin, { scope, parent }).find({ scope, parent })
		})
	),
	retryRoots: deferrable(
		query(RetryDen).rule((r) => {
			const { scope, key, at } = v(RetryRoot, "retryRoot")
			return r.match(RetryRoot, { scope, key, at }).find({ scope, key, at })
		})
	),
	retryReadRetrySteadfastInput: RetrySteadfastInput,
	retryReadRetryBrittleInput: RetryBrittleInput,
	retryReadRetryLaddersInput: RetryLaddersInput,
	retryRequestLadders: ChangeSet.empty(RetryDen)
		.insert(RetryScope, [])
		.insert(RetryRoot, [])
		.insert(RetryLaddersInput, []),
	retryOutputsLaddersSteadfast: query(RetryDen).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetrySteadfastOutput, "output")
		return r
			.match(RetryStep, { step, kind: "Steadfast", scope })
			.match(RetrySteadfastOutput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryFailuresLaddersSteadfast: query(RetryDen).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Steadfast", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	}),
	retryOutputsLaddersBrittle: query(RetryDen).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		const { key } = v(RetryBrittleOutput, "output")
		return r
			.match(RetryStep, { step, kind: "Brittle", scope })
			.match(RetryBrittleOutput, { step, key })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step, key })
	}),
	retryFailuresLaddersBrittle: query(RetryDen).rule((r) => {
		const { step, scope } = v(RetryStep, "step")
		return r
			.match(RetryStep, { step, kind: "Brittle", scope })
			.match(RetryResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", RetryScope.fields.scope)))
			.find({ step })
	})
})

export const retryDenWorkload = workload(RetryDen, retryDenPrograms)

export const retrySeatsPrograms = Object.freeze({
	retryPause: ChangeSet.empty(RetrySeats).insert(RetryPaused, []),
	retryResume: ChangeSet.empty(RetrySeats).delete(RetryPaused, []),
	retryPausedAll: deferrable(
		query(RetrySeats).rule((r) => {
			const { target } = v(RetryPaused, "retryPaused")
			return r.match(RetryPaused, { target }).find({ target })
		})
	)
})

export const retrySeatsWorkload = workload(RetrySeats, retrySeatsPrograms)

/** The commits and declared reads of the flow Retry, over its app role Loader. */
export const retryCommitPrograms = Object.freeze({
	retryCommitSteadfast: ChangeSet.empty(Loader)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetrySteadfastOutput, []),
	retryCommitBrittle: ChangeSet.empty(Loader)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryBrittleOutput, []),
	retryCommitLaddersFinish: ChangeSet.empty(Loader)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
})

export const retryCommits = workload(Loader, retryCommitPrograms)
