import { DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Fan to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, clocked, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
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
	FanClaim,
	FanRetry,
	FanFenced,
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
	FanHold,
	FanFreed,
	FanPaused,
	FanResumed,
	fanGraph,
	fanCoordination
} from "#integration/slice/generated/fan.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Fan: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and live holds and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const FanDen = role(
	App,
	"fan_den",
	{
		...fanGraph.relations,
		FanHold,
		FanFreed,
		FanPaused,
		FanResumed,
		FanLive: query(App).rule((r) => {
			const { resource, seat, turn, holder, until } = v(App.relations.FanLive, "live")
			return r
				.match(App.relations.FanLive, { resource, seat, turn, holder, until })
				.find({ resource, seat, turn, holder, until })
		})
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
			"FanClaim",
			"FanRetry",
			"FanFenced",
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

/** den's coordinator role for the flow Fan: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and reads its seats' live holds through the seat level the app's schema states, so a schema without it fails to typecheck. */
export const FanCoordinator = role(
	App,
	"fan_coordinator",
	{
		FanKind,
		FanJoin,
		FanOutcome,
		FanPausable,
		FanResource,
		FanHold,
		FanFreed,
		FanPaused,
		FanResumed,
		FanLive: query(App).rule((r) => {
			const { resource, seat, turn, holder, until } = v(App.relations.FanLive, "live")
			return r
				.match(App.relations.FanLive, { resource, seat, turn, holder, until })
				.find({ resource, seat, turn, holder, until })
		})
	},
	{ insert: ["FanHold", "FanFreed", "FanPaused", "FanResumed"] }
)

const fanPendingRead = query(FanDen).rule((r) => {
	const { step, kind, scope, due } = v(FanStep, "step")
	return r
		.match(FanStep, { step, kind, scope, due })
		.where(r.not(FanResult, { step }))
		.find({ step, kind, scope, due })
})

const fanRequestedRead = query(FanDen).rule((r) => {
	const { scope, kind } = v(FanScope, "scope")
	return r
		.match(FanScope, { scope, kind })
		.where(r.not(FanAdmitted, { scope }), r.not(FanSkipped, { scope }))
		.find({ scope, kind })
})

const fanRunningRead = query(FanDen).rule((r) => {
	const { scope, kind } = v(FanScope, "scope")
	const { step } = v(FanFinish, "finish")
	return r
		.match(FanScope, { scope, kind })
		.match(FanFinish, { scope, step })
		.where(r.not(FanResult, { step }))
		.find({ scope, kind })
})

export const fanDenPrograms = Object.freeze({
	fanNow: clocked(
		query(fanGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
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
	fanFence: ChangeSet.empty(fanGraph).insert(FanFenced, []),
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
		.insert(FanScope, [])
		.insert(FanWithin, [])
		.insert(FanSquareInput, [])
		.insert(FanBatchInput, []),
	fanSkip: ChangeSet.empty(fanGraph).insert(FanSkipped, []),
	fanSkippedOf: query(fanGraph).rule((r) => {
		const { scope, by, root } = v(FanSkipped, "fanSkipped")
		return r
			.match(FanSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", FanSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	fanStepOf: query(fanGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(FanStep, "fanStep")
		return r
			.match(FanStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", FanStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	fanResultOf: query(fanGraph).rule((r) => {
		const { step, outcome, root } = v(FanResult, "fanResult")
		return r
			.match(FanResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", FanResult.fields.step)))
			.find({ step, outcome, root })
	}),
	fanHeldOf: query(fanGraph).rule((r) => {
		const { step, attempt, root } = v(FanHeld, "fanHeld")
		return r
			.match(FanHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", FanHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	fanScopeOf: query(fanGraph).rule((r) => {
		const { scope, kind, root } = v(FanScope, "fanScope")
		return r
			.match(FanScope, { scope, kind, root })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ scope, kind, root })
	}),
	fanWithinOf: query(fanGraph).rule((r) => {
		const { scope, parent, root } = v(FanWithin, "fanWithin")
		return r
			.match(FanWithin, { scope, parent, root })
			.where(r.eq(scope, r.param("scope", FanWithin.fields.scope)))
			.find({ scope, parent, root })
	}),
	fanAdmittedOf: query(fanGraph).rule((r) => {
		const { scope, root } = v(FanAdmitted, "fanAdmitted")
		return r
			.match(FanAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", FanAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	fanRootOf: query(fanGraph).rule((r) => {
		const { scope, key, at } = v(FanRoot, "fanRoot")
		return r
			.match(FanRoot, { scope, key, at })
			.where(r.eq(scope, r.param("scope", FanRoot.fields.scope)))
			.find({ scope, key, at })
	}),
	fanFinishedRoots: deferrable(
		query(fanGraph)
			.rule((r) => {
				const { scope, key, at } = v(FanRoot, "root")
				const { kind } = v(FanScope, "scope")
				const { step } = v(FanFinish, "finish")
				return r
					.match(FanRoot, { scope, key, at })
					.match(FanScope, { scope, kind })
					.match(FanFinish, { scope, step })
					.match(FanResult, { step })
					.find({ scope, kind, at })
			})
			.rule((r) => {
				const { scope, key, at } = v(FanRoot, "root")
				const { kind } = v(FanScope, "scope")
				return r
					.match(FanRoot, { scope, key, at })
					.match(FanScope, { scope, kind })
					.match(FanSkipped, { scope })
					.find({ scope, kind, at })
			})
	),
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
	fanFencedOf: query(fanGraph).rule((r) => {
		const { step, attempt } = v(FanFenced, "fenced")
		return r
			.match(FanFenced, { step, attempt })
			.where(r.eq(step, r.param("step", FanStep.fields.step)))
			.find({ step, attempt })
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
	fanPending: deferrable(fanPendingRead),
	fanRequested: deferrable(fanRequestedRead),
	fanRunning: deferrable(fanRunningRead),
	fanSnapshot: deferrable(
		query(FanDen).reads({
			steps: fanPendingRead,
			claims: query(FanDen).rule((r) => {
				const { step, attempt, until } = v(FanClaim, "claim")
				return r
					.match(FanClaim, { step, attempt, until })
					.where(r.not(FanResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(FanDen).rule((r) => {
				const { step, attempt, at, spent } = v(FanRetry, "retry")
				return r
					.match(FanRetry, { step, attempt, at, spent })
					.where(r.not(FanResult, { step }))
					.find({ step, attempt, at, spent })
			}),
			fenced: query(FanDen).rule((r) => {
				const { step, attempt } = v(FanFenced, "fenced")
				return r
					.match(FanFenced, { step, attempt })
					.where(r.not(FanResult, { step }))
					.find({ step, attempt })
			}),
			requested: fanRequestedRead,
			running: fanRunningRead,
			withins: query(FanDen).rule((r) => {
				const { scope, parent } = v(FanWithin, "fanWithin")
				return r.match(FanWithin, { scope, parent }).find({ scope, parent })
			}),
			roots: query(FanDen).rule((r) => {
				const { scope, key, at } = v(FanRoot, "fanRoot")
				return r.match(FanRoot, { scope, key, at }).find({ scope, key, at })
			}),
			holds: query(FanDen).rule((r) => {
				const { resource, seat, turn, holder, until } = v(FanDen.relations.FanLive, "live")
				return r
					.match(FanDen.relations.FanLive, { resource, seat, turn, holder, until })
					.find({ resource, seat, turn, holder, until })
			}),
			paused: query(FanDen).rule((r) => {
				const { target, turn } = v(FanPaused, "fanPaused")
				return r
					.match(FanPaused, { target, turn })
					.where(r.not(FanResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	fanReadFanSquareInput: query(fanGraph).rule((r) => {
		const { step, batch, n, root } = v(FanSquareInput, "fanSquareInput")
		return r
			.match(FanSquareInput, { step, batch, n, root })
			.where(r.eq(step, r.param("step", FanSquareInput.fields.step)))
			.find({ step, batch, n, root })
	}),
	fanReadFanBatchInput: query(fanGraph).rule((r) => {
		const { scope, batch, size, root } = v(FanBatchInput, "fanBatchInput")
		return r
			.match(FanBatchInput, { scope, batch, size, root })
			.where(r.eq(scope, r.param("scope", FanBatchInput.fields.scope)))
			.find({ scope, batch, size, root })
	}),
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
	fanReadFanFanRunInput: query(fanGraph).rule((r) => {
		const { scope, batch, size, root } = v(FanFanRunInput, "fanFanRunInput")
		return r
			.match(FanFanRunInput, { scope, batch, size, root })
			.where(r.eq(scope, r.param("scope", FanFanRunInput.fields.scope)))
			.find({ scope, batch, size, root })
	}),
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

export const fanCoordinatorPrograms = Object.freeze({
	fanTake: ChangeSet.empty(fanCoordination).insert(FanFreed, []).insert(FanHold, []),
	fanGiveBack: ChangeSet.empty(fanCoordination).insert(FanFreed, []),
	fanSeatTurns: deferrable(
		query(fanCoordination).rule((r) => {
			const { resource, seat, turn } = v(FanHold, "fanHold")
			return r.match(FanHold, { resource, seat, turn }).find({ resource, seat, turn: r.max(turn) })
		})
	),
	fanHolds: deferrable(
		query(FanCoordinator).rule((r) => {
			const { resource, seat, turn, holder, until } = v(FanCoordinator.relations.FanLive, "live")
			return r
				.match(FanCoordinator.relations.FanLive, { resource, seat, turn, holder, until })
				.find({ resource, seat, turn, holder, until })
		})
	),
	fanPause: ChangeSet.empty(fanCoordination).insert(FanPaused, []),
	fanResume: ChangeSet.empty(fanCoordination).insert(FanResumed, []),
	fanPauseTurns: deferrable(
		query(fanCoordination).rule((r) => {
			const { target, turn } = v(FanPaused, "fanPaused")
			return r.match(FanPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	fanPausedAll: deferrable(
		query(fanCoordination).rule((r) => {
			const { target, turn } = v(FanPaused, "fanPaused")
			return r
				.match(FanPaused, { target, turn })
				.where(r.not(FanResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const fanCoordinatorWorkload = workload(FanCoordinator, fanCoordinatorPrograms)

/** den's retiring role for the flow Fan: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const FanRetirer = role(
	App,
	"fan_retirer",
	{ ...fanGraph.relations },
	{ retire: ["FanRoot"] }
)

export const fanRetirerPrograms = Object.freeze({
	fanRetire: ChangeSet.empty(fanGraph).retire(FanRoot, [])
})

export const fanRetirerWorkload = workload(FanRetirer, fanRetirerPrograms)

/** The commits and declared reads of the flow Fan, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const fanCommitPrograms = Object.freeze({
	fanAuthenticated: clocked(
		query(fanGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
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
