/** The programs den lowered the flow Fan to, over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	FanKind,
	FanJoin,
	FanOutcome,
	FanPausable,
	FanResource,
	FanScope,
	FanRoot,
	FanWithin,
	FanAdmitted,
	FanSkipped,
	FanStep,
	FanStartStep,
	FanStartScope,
	FanFinish,
	FanDue,
	FanClaim,
	FanRetry,
	FanResult,
	FanDone,
	FanFailed,
	FanHeld,
	FanRefusal,
	FanExhausted,
	FanSquareInput,
	FanBatchInput,
	FanFanRunInput,
	FanSquareOutput,
	FanSeat,
	FanHold,
	FanPaused
} from "#integration/slice/generated/fan.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Fan: claims, retries, failures, admissions, requests, and every read the scheduler makes. */
export const FanDen = role(
	App,
	"fan_den",
	{
		FanKind,
		FanJoin,
		FanOutcome,
		FanPausable,
		FanResource,
		FanScope,
		FanRoot,
		FanWithin,
		FanAdmitted,
		FanSkipped,
		FanStep,
		FanStartStep,
		FanStartScope,
		FanFinish,
		FanDue,
		FanClaim,
		FanRetry,
		FanResult,
		FanDone,
		FanFailed,
		FanHeld,
		FanRefusal,
		FanExhausted,
		FanSquareInput,
		FanBatchInput,
		FanFanRunInput,
		FanSquareOutput
	},
	{
		insert: [
			"FanScope",
			"FanRoot",
			"FanWithin",
			"FanAdmitted",
			"FanSkipped",
			"FanStep",
			"FanStartStep",
			"FanStartScope",
			"FanFinish",
			"FanDue",
			"FanClaim",
			"FanRetry",
			"FanResult",
			"FanDone",
			"FanFailed",
			"FanHeld",
			"FanRefusal",
			"FanExhausted",
			"FanSquareInput",
			"FanBatchInput",
			"FanFanRunInput"
		]
	}
)

/** den's coordination role for the flow Fan: seats, holds, exclusivity seats and pauses, the seat module's (LEASE replaces it). */
export const FanSeats = role(
	App,
	"fan_seats",
	{ FanKind, FanJoin, FanOutcome, FanPausable, FanResource, FanSeat, FanHold, FanPaused },
	{ write: ["FanSeat", "FanHold", "FanPaused"] }
)

export const fanDenPrograms = Object.freeze({
	fanClaim: ChangeSet.empty(FanDen).insert(FanClaim, []),
	fanRetry: ChangeSet.empty(FanDen).insert(FanRetry, []),
	fanRefuse: ChangeSet.empty(FanDen)
		.insert(FanResult, [])
		.insert(FanFailed, [])
		.insert(FanHeld, [])
		.insert(FanRefusal, []),
	fanExhaust: ChangeSet.empty(FanDen)
		.insert(FanResult, [])
		.insert(FanFailed, [])
		.insert(FanHeld, [])
		.insert(FanExhausted, []),
	fanAdmit: ChangeSet.empty(FanDen)
		.insert(FanAdmitted, [])
		.insert(FanFinish, [])
		.insert(FanStartStep, [])
		.insert(FanStartScope, [])
		.insert(FanStep, [])
		.insert(FanDue, [])
		.insert(FanScope, [])
		.insert(FanWithin, [])
		.insert(FanSquareInput, [])
		.insert(FanBatchInput, []),
	fanSkip: ChangeSet.empty(FanDen).insert(FanSkipped, []),
	fanSkippedOf: FanSkipped,
	fanStepOf: FanStep,
	fanResultOf: FanResult,
	fanHeldOf: FanHeld,
	fanDueOf: FanDue,
	fanScopeOf: FanScope,
	fanWithinOf: FanWithin,
	fanAdmittedOf: FanAdmitted,
	fanRootOf: FanRoot,
	fanClaimsOf: query(FanDen).rule((r) => {
		const { step, attempt, holder, until } = v(FanClaim, "claim")
		return r
			.match(FanClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", FanStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	fanRetriesOf: query(FanDen).rule((r) => {
		const { step, attempt, at, spent } = v(FanRetry, "retry")
		return r
			.match(FanRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", FanStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	fanUnendedSteps: query(FanDen).rule((r) => {
		const { step, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", FanScope.fields.scope)),
				r.not(FanResult, { step }),
				r.not(FanFinish, { scope, step })
			)
			.find({ step })
	}),
	fanOpenChildren: query(FanDen)
		.rule((r) => {
			const { scope, parent } = v(FanWithin, "within")
			return r
				.match(FanWithin, { scope, parent })
				.where(r.eq(parent, r.param("scope", FanScope.fields.scope)), r.not(FanAdmitted, { scope }))
				.find({ child: scope })
		})
		.rule((r) => {
			const { scope, parent } = v(FanWithin, "within")
			const { step } = v(FanFinish, "finish")
			return r
				.match(FanWithin, { scope, parent })
				.match(FanFinish, { scope, step })
				.where(r.eq(parent, r.param("scope", FanScope.fields.scope)), r.not(FanResult, { step }))
				.find({ child: scope })
		}),
	fanFinished: query(FanDen).rule((r) => {
		const { scope, step } = v(FanFinish, "finish")
		return r
			.match(FanFinish, { scope, step })
			.match(FanResult, { step })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step })
	}),
	fanPending: query(FanDen).rule((r) => {
		const { step, kind, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { step, kind, scope })
			.where(r.not(FanResult, { step }))
			.find({ step, kind, scope })
	}),
	fanPendingClaims: query(FanDen).rule((r) => {
		const { step, attempt, until } = v(FanClaim, "claim")
		return r
			.match(FanClaim, { step, attempt, until })
			.where(r.not(FanResult, { step }))
			.find({ step, attempt, until })
	}),
	fanPendingRetries: query(FanDen).rule((r) => {
		const { step, attempt, at, spent } = v(FanRetry, "retry")
		return r
			.match(FanRetry, { step, attempt, at, spent })
			.where(r.not(FanResult, { step }))
			.find({ step, attempt, at, spent })
	}),
	fanPendingDues: query(FanDen).rule((r) => {
		const { step, at } = v(FanDue, "due")
		return r.match(FanDue, { step, at }).where(r.not(FanResult, { step })).find({ step, at })
	}),
	fanRequested: query(FanDen).rule((r) => {
		const { scope, kind } = v(FanScope, "scope")
		return r
			.match(FanScope, { scope, kind })
			.where(r.not(FanAdmitted, { scope }), r.not(FanSkipped, { scope }))
			.find({ scope, kind })
	}),
	fanRunning: query(FanDen).rule((r) => {
		const { scope, kind } = v(FanScope, "scope")
		const { step } = v(FanFinish, "finish")
		return r
			.match(FanScope, { scope, kind })
			.match(FanFinish, { scope, step })
			.where(r.not(FanResult, { step }))
			.find({ scope, kind })
	}),
	fanWithins: query(FanDen).rule((r) => {
		const { scope, parent } = v(FanWithin, "fanWithin")
		return r.match(FanWithin, { scope, parent }).find({ scope, parent })
	}),
	fanRoots: query(FanDen).rule((r) => {
		const { scope, key, at } = v(FanRoot, "fanRoot")
		return r.match(FanRoot, { scope, key, at }).find({ scope, key, at })
	}),
	fanReadFanSquareInput: FanSquareInput,
	fanReadFanBatchInput: FanBatchInput,
	fanOutputsBatchSquare: query(FanDen).rule((r) => {
		const { step, scope } = v(FanStep, "step")
		const { square } = v(FanSquareOutput, "output")
		return r
			.match(FanStep, { step, kind: "Square", scope })
			.match(FanSquareOutput, { step, square })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step, square })
	}),
	fanFailuresBatchSquare: query(FanDen).rule((r) => {
		const { step, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { step, kind: "Square", scope })
			.match(FanResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step })
	}),
	fanReadFanFanRunInput: FanFanRunInput,
	fanRequestFanRun: ChangeSet.empty(FanDen)
		.insert(FanScope, [])
		.insert(FanRoot, [])
		.insert(FanFanRunInput, []),
	fanEndingsFanRunBatch: query(FanDen).rule((r) => {
		const { scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		const { outcome } = v(FanResult, "result")
		return r
			.match(FanWithin, { scope, parent })
			.match(FanScope, { scope, kind: "Batch" })
			.match(FanFinish, { scope, step })
			.match(FanResult, { step, outcome })
			.where(r.eq(parent, r.param("scope", FanScope.fields.scope)))
			.find({ child: scope, outcome })
	})
})

export const fanDenWorkload = workload(FanDen, fanDenPrograms)

export const fanSeatsPrograms = Object.freeze({
	fanProvision: ChangeSet.empty(FanSeats).insert(FanSeat, []).delete(FanSeat, []),
	fanTake: ChangeSet.sequence(
		ChangeSet.empty(FanSeats).delete(FanHold, []),
		ChangeSet.empty(FanSeats).insert(FanHold, [])
	),
	fanGiveBack: ChangeSet.empty(FanSeats).delete(FanHold, []),
	fanSeats: query(FanSeats).rule((r) => {
		const { resource, seat } = v(FanSeat, "fanSeat")
		return r.match(FanSeat, { resource, seat }).find({ resource, seat })
	}),
	fanHolds: query(FanSeats).rule((r) => {
		const { resource, seat, holder, until } = v(FanHold, "fanHold")
		return r
			.match(FanHold, { resource, seat, holder, until })
			.find({ resource, seat, holder, until })
	}),
	fanPause: ChangeSet.empty(FanSeats).insert(FanPaused, []),
	fanResume: ChangeSet.empty(FanSeats).delete(FanPaused, []),
	fanPausedAll: query(FanSeats).rule((r) => {
		const { target } = v(FanPaused, "fanPaused")
		return r.match(FanPaused, { target }).find({ target })
	})
})

export const fanSeatsWorkload = workload(FanSeats, fanSeatsPrograms)

/** The commits and declared reads of the flow Fan, over its app role Loader. */
export const fanCommitPrograms = Object.freeze({
	fanCommitSquare: ChangeSet.empty(Loader)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(FanSquareOutput, []),
	fanCommitBatchFinish: ChangeSet.empty(Loader)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(App.relations.Tally, []),
	fanCommitFanRunFinish: ChangeSet.empty(Loader)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(App.relations.Settled, [])
})

export const fanCommits = workload(Loader, fanCommitPrograms)
