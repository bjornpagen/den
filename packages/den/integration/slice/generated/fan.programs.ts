/** The programs den lowered the flow Fan to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
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
	FanPaused,
	fanGraph,
	fanCoordination
} from "#integration/slice/generated/fan.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Fan: claims, retries, failures, admissions, requests, and every read the scheduler makes. */
export const FanDen = role(
	App,
	"fan_den",
	{ ...fanGraph.relations },
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
	{ ...fanCoordination.relations },
	{ write: ["FanSeat", "FanHold", "FanPaused"] }
)

export const fanDenPrograms = Object.freeze({
	fanClaim: ChangeSet.empty(fanGraph)
		.insert(FanClaim, [])
		.read("held", (delta) =>
			query(fanGraph)
				.rule((r) => {
					const { step, attempt, holder } = v(delta.added(FanClaim), "added")
					return r
						.match(delta.added(FanClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
				.rule((r) => {
					const { step, attempt, holder } = v(delta.met(FanClaim), "met")
					return r
						.match(delta.met(FanClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
		),
	fanRetry: ChangeSet.empty(fanGraph).insert(FanRetry, []),
	fanRefuse: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanFailed, [])
		.insert(FanHeld, [])
		.insert(FanRefusal, []),
	fanExhaust: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanFailed, [])
		.insert(FanHeld, [])
		.insert(FanExhausted, []),
	fanAdmit: ChangeSet.empty(fanGraph)
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
	fanSkip: ChangeSet.empty(fanGraph).insert(FanSkipped, []),
	fanSkippedOf: FanSkipped,
	fanStepOf: FanStep,
	fanResultOf: FanResult,
	fanHeldOf: FanHeld,
	fanDueOf: FanDue,
	fanScopeOf: FanScope,
	fanWithinOf: FanWithin,
	fanAdmittedOf: FanAdmitted,
	fanRootOf: FanRoot,
	fanClaimsOf: query(fanGraph).rule((r) => {
		const { step, attempt, holder, until } = v(FanClaim, "claim")
		return r
			.match(FanClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", FanStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	fanRetriesOf: query(fanGraph).rule((r) => {
		const { step, attempt, at, spent } = v(FanRetry, "retry")
		return r
			.match(FanRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", FanStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	fanUnendedSteps: query(fanGraph).rule((r) => {
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
	fanOpenChildren: query(fanGraph)
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
	fanFinished: query(fanGraph).rule((r) => {
		const { scope, step } = v(FanFinish, "finish")
		return r
			.match(FanFinish, { scope, step })
			.match(FanResult, { step })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step })
	}),
	fanPending: deferrable(
		query(fanGraph).rule((r) => {
			const { step, kind, scope } = v(FanStep, "step")
			return r
				.match(FanStep, { step, kind, scope })
				.where(r.not(FanResult, { step }))
				.find({ step, kind, scope })
		})
	),
	fanPendingClaims: deferrable(
		query(fanGraph).rule((r) => {
			const { step, attempt, until } = v(FanClaim, "claim")
			return r
				.match(FanClaim, { step, attempt, until })
				.where(r.not(FanResult, { step }))
				.find({ step, attempt, until })
		})
	),
	fanPendingRetries: deferrable(
		query(fanGraph).rule((r) => {
			const { step, attempt, at, spent } = v(FanRetry, "retry")
			return r
				.match(FanRetry, { step, attempt, at, spent })
				.where(r.not(FanResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	fanPendingDues: deferrable(
		query(fanGraph).rule((r) => {
			const { step, at } = v(FanDue, "due")
			return r.match(FanDue, { step, at }).where(r.not(FanResult, { step })).find({ step, at })
		})
	),
	fanRequested: deferrable(
		query(fanGraph).rule((r) => {
			const { scope, kind } = v(FanScope, "scope")
			return r
				.match(FanScope, { scope, kind })
				.where(r.not(FanAdmitted, { scope }), r.not(FanSkipped, { scope }))
				.find({ scope, kind })
		})
	),
	fanRunning: deferrable(
		query(fanGraph).rule((r) => {
			const { scope, kind } = v(FanScope, "scope")
			const { step } = v(FanFinish, "finish")
			return r
				.match(FanScope, { scope, kind })
				.match(FanFinish, { scope, step })
				.where(r.not(FanResult, { step }))
				.find({ scope, kind })
		})
	),
	fanWithins: deferrable(
		query(fanGraph).rule((r) => {
			const { scope, parent } = v(FanWithin, "fanWithin")
			return r.match(FanWithin, { scope, parent }).find({ scope, parent })
		})
	),
	fanRoots: deferrable(
		query(fanGraph).rule((r) => {
			const { scope, key, at } = v(FanRoot, "fanRoot")
			return r.match(FanRoot, { scope, key, at }).find({ scope, key, at })
		})
	),
	fanReadFanSquareInput: FanSquareInput,
	fanReadFanBatchInput: FanBatchInput,
	fanOutputsBatchSquare: query(fanGraph).rule((r) => {
		const { step, scope } = v(FanStep, "step")
		const { square } = v(FanSquareOutput, "output")
		return r
			.match(FanStep, { step, kind: "Square", scope })
			.match(FanSquareOutput, { step, square })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step, square })
	}),
	fanFailuresBatchSquare: query(fanGraph).rule((r) => {
		const { step, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { step, kind: "Square", scope })
			.match(FanResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step })
	}),
	fanReadFanFanRunInput: FanFanRunInput,
	fanRequestFanRun: ChangeSet.empty(fanGraph)
		.insert(FanScope, [])
		.insert(FanRoot, [])
		.insert(FanFanRunInput, []),
	fanEndingsFanRunBatch: query(fanGraph).rule((r) => {
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
	fanProvision: ChangeSet.empty(fanCoordination).insert(FanSeat, []).delete(FanSeat, []),
	fanTake: ChangeSet.sequence(
		ChangeSet.empty(fanCoordination).delete(FanHold, []),
		ChangeSet.empty(fanCoordination).insert(FanHold, [])
	),
	fanGiveBack: ChangeSet.empty(fanCoordination).delete(FanHold, []),
	fanSeats: deferrable(
		query(fanCoordination).rule((r) => {
			const { resource, seat } = v(FanSeat, "fanSeat")
			return r.match(FanSeat, { resource, seat }).find({ resource, seat })
		})
	),
	fanHolds: deferrable(
		query(fanCoordination).rule((r) => {
			const { resource, seat, holder, until } = v(FanHold, "fanHold")
			return r
				.match(FanHold, { resource, seat, holder, until })
				.find({ resource, seat, holder, until })
		})
	),
	fanPause: ChangeSet.empty(fanCoordination).insert(FanPaused, []),
	fanResume: ChangeSet.empty(fanCoordination).delete(FanPaused, []),
	fanPausedAll: deferrable(
		query(fanCoordination).rule((r) => {
			const { target } = v(FanPaused, "fanPaused")
			return r.match(FanPaused, { target }).find({ target })
		})
	)
})

export const fanSeatsWorkload = workload(FanSeats, fanSeatsPrograms)

/** The commits and declared reads of the flow Fan, over its app role Loader. */
export const fanCommitPrograms = Object.freeze({
	fanCommitSquare: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(FanSquareOutput, []),
	fanCommitBatchFinish: ChangeSet.union(
		ChangeSet.empty(fanGraph).insert(FanResult, []).insert(FanDone, []).insert(FanHeld, []),
		ChangeSet.empty(Loader).insert(App.relations.Tally, [])
	),
	fanCommitFanRunFinish: ChangeSet.union(
		ChangeSet.empty(fanGraph).insert(FanResult, []).insert(FanDone, []).insert(FanHeld, []),
		ChangeSet.empty(Loader).insert(App.relations.Settled, [])
	)
})

export const fanCommits = workload(Loader, fanCommitPrograms)
