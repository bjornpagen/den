import { DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Assign to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import {
	ChangeSet,
	Compute,
	clocked,
	deferrable,
	query,
	role,
	v,
	workload
} from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	AssignKind,
	AssignJoin,
	AssignOutcome,
	AssignPausable,
	AssignScope,
	AssignRoot,
	AssignWithin,
	AssignAdmitted,
	AssignSkipped,
	AssignStep,
	AssignStartStep,
	AssignStartScope,
	AssignFinish,
	AssignDue,
	AssignClaim,
	AssignRetry,
	AssignFenced,
	AssignResult,
	AssignDone,
	AssignFailed,
	AssignHeld,
	AssignRefusal,
	AssignExhausted,
	AssignDecideInput,
	AssignAssignmentInput,
	AssignDecideOutput,
	AssignDecideOutputChosen,
	AssignDecideNearestRead,
	AssignDecideSeenRead,
	AssignPaused,
	AssignResumed,
	assignGraph,
	assignCoordination
} from "#integration/slice/generated/assign.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Assign: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. */
export const AssignDen = role(
	App,
	"assign_den",
	{ ...assignGraph.relations },
	{
		insert: [
			"AssignScope",
			"AssignRoot",
			"AssignWithin",
			"AssignAdmitted",
			"AssignSkipped",
			"AssignStep",
			"AssignStartStep",
			"AssignStartScope",
			"AssignFinish",
			"AssignDue",
			"AssignClaim",
			"AssignRetry",
			"AssignFenced",
			"AssignResult",
			"AssignDone",
			"AssignFailed",
			"AssignHeld",
			"AssignRefusal",
			"AssignExhausted",
			"AssignDecideInput",
			"AssignAssignmentInput",
			"AssignDecideNearestRead",
			"AssignDecideSeenRead"
		]
	}
)

/** den's coordinator role for the flow Assign: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const AssignCoordinator = role(
	App,
	"assign_coordinator",
	{ AssignKind, AssignJoin, AssignOutcome, AssignPausable, AssignPaused, AssignResumed },
	{ insert: ["AssignPaused", "AssignResumed"] }
)

export const assignDenPrograms = Object.freeze({
	assignNow: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	assignClaim: ChangeSet.empty(assignGraph)
		.insert(AssignClaim, [])
		.read("held", (delta) =>
			query(assignGraph)
				.rule((r) => {
					const { step, attempt, holder } = v(delta.added(AssignClaim), "added")
					return r
						.match(delta.added(AssignClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
				.rule((r) => {
					const { step, attempt, holder } = v(delta.met(AssignClaim), "met")
					return r
						.match(delta.met(AssignClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
		),
	assignRetry: ChangeSet.empty(assignGraph).insert(AssignRetry, []),
	assignFence: ChangeSet.empty(assignGraph).insert(AssignFenced, []),
	assignRefuse: ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignFailed, [])
		.insert(AssignHeld, [])
		.insert(AssignRefusal, []),
	assignExhaust: ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignFailed, [])
		.insert(AssignHeld, [])
		.insert(AssignExhausted, []),
	assignAdmit: ChangeSet.empty(assignGraph)
		.insert(AssignAdmitted, [])
		.insert(AssignFinish, [])
		.insert(AssignStartStep, [])
		.insert(AssignStartScope, [])
		.insert(AssignStep, [])
		.insert(AssignDue, [])
		.insert(AssignScope, [])
		.insert(AssignWithin, [])
		.insert(AssignDecideInput, []),
	assignSkip: ChangeSet.empty(assignGraph).insert(AssignSkipped, []),
	assignSkippedOf: AssignSkipped,
	assignStepOf: AssignStep,
	assignResultOf: AssignResult,
	assignHeldOf: AssignHeld,
	assignDueOf: AssignDue,
	assignScopeOf: AssignScope,
	assignWithinOf: AssignWithin,
	assignAdmittedOf: AssignAdmitted,
	assignRootOf: AssignRoot,
	assignClaimsOf: query(assignGraph).rule((r) => {
		const { step, attempt, holder, until } = v(AssignClaim, "claim")
		return r
			.match(AssignClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	assignRetriesOf: query(assignGraph).rule((r) => {
		const { step, attempt, at, spent } = v(AssignRetry, "retry")
		return r
			.match(AssignRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	assignFencedOf: query(assignGraph).rule((r) => {
		const { step, attempt } = v(AssignFenced, "fenced")
		return r
			.match(AssignFenced, { step, attempt })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, attempt })
	}),
	assignUnendedSteps: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", AssignScope.fields.scope)),
				r.not(AssignResult, { step }),
				r.not(AssignFinish, { scope, step })
			)
			.find({ step })
	}),
	assignOpenChildren: query(assignGraph)
		.rule((r) => {
			const { scope, parent } = v(AssignWithin, "within")
			return r
				.match(AssignWithin, { scope, parent })
				.where(
					r.eq(parent, r.param("scope", AssignScope.fields.scope)),
					r.not(AssignAdmitted, { scope })
				)
				.find({ child: scope })
		})
		.rule((r) => {
			const { scope, parent } = v(AssignWithin, "within")
			const { step } = v(AssignFinish, "finish")
			return r
				.match(AssignWithin, { scope, parent })
				.match(AssignFinish, { scope, step })
				.where(
					r.eq(parent, r.param("scope", AssignScope.fields.scope)),
					r.not(AssignResult, { step })
				)
				.find({ child: scope })
		}),
	assignFinished: query(assignGraph).rule((r) => {
		const { scope, step } = v(AssignFinish, "finish")
		return r
			.match(AssignFinish, { scope, step })
			.match(AssignResult, { step })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step })
	}),
	assignPending: deferrable(
		query(assignGraph).rule((r) => {
			const { step, kind, scope } = v(AssignStep, "step")
			return r
				.match(AssignStep, { step, kind, scope })
				.where(r.not(AssignResult, { step }))
				.find({ step, kind, scope })
		})
	),
	assignPendingClaims: deferrable(
		query(assignGraph).rule((r) => {
			const { step, attempt, until } = v(AssignClaim, "claim")
			return r
				.match(AssignClaim, { step, attempt, until })
				.where(r.not(AssignResult, { step }))
				.find({ step, attempt, until })
		})
	),
	assignPendingRetries: deferrable(
		query(assignGraph).rule((r) => {
			const { step, attempt, at, spent } = v(AssignRetry, "retry")
			return r
				.match(AssignRetry, { step, attempt, at, spent })
				.where(r.not(AssignResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	assignPendingFenced: deferrable(
		query(assignGraph).rule((r) => {
			const { step, attempt } = v(AssignFenced, "fenced")
			return r
				.match(AssignFenced, { step, attempt })
				.where(r.not(AssignResult, { step }))
				.find({ step, attempt })
		})
	),
	assignPendingDues: deferrable(
		query(assignGraph).rule((r) => {
			const { step, at } = v(AssignDue, "due")
			return r
				.match(AssignDue, { step, at })
				.where(r.not(AssignResult, { step }))
				.find({ step, at })
		})
	),
	assignRequested: deferrable(
		query(assignGraph).rule((r) => {
			const { scope, kind } = v(AssignScope, "scope")
			return r
				.match(AssignScope, { scope, kind })
				.where(r.not(AssignAdmitted, { scope }), r.not(AssignSkipped, { scope }))
				.find({ scope, kind })
		})
	),
	assignRunning: deferrable(
		query(assignGraph).rule((r) => {
			const { scope, kind } = v(AssignScope, "scope")
			const { step } = v(AssignFinish, "finish")
			return r
				.match(AssignScope, { scope, kind })
				.match(AssignFinish, { scope, step })
				.where(r.not(AssignResult, { step }))
				.find({ scope, kind })
		})
	),
	assignWithins: deferrable(
		query(assignGraph).rule((r) => {
			const { scope, parent } = v(AssignWithin, "assignWithin")
			return r.match(AssignWithin, { scope, parent }).find({ scope, parent })
		})
	),
	assignRoots: deferrable(
		query(assignGraph).rule((r) => {
			const { scope, key, at } = v(AssignRoot, "assignRoot")
			return r.match(AssignRoot, { scope, key, at }).find({ scope, key, at })
		})
	),
	assignReadAssignDecideInput: AssignDecideInput,
	assignReadAssignAssignmentInput: AssignAssignmentInput,
	assignRequestAssignment: ChangeSet.empty(assignGraph)
		.insert(AssignScope, [])
		.insert(AssignRoot, [])
		.insert(AssignAssignmentInput, []),
	assignOutputsAssignmentDecide: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideOutput, { step })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step })
	}),
	assignOutputsAssignmentDecideChosen: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { value } = v(AssignDecideOutputChosen, "value")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideOutputChosen, { step, value })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, value })
	}),
	assignFailuresAssignmentDecide: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step })
	})
})

export const assignDenWorkload = workload(AssignDen, assignDenPrograms)

export const assignCoordinatorPrograms = Object.freeze({
	assignPause: ChangeSet.empty(assignCoordination).insert(AssignPaused, []),
	assignResume: ChangeSet.empty(assignCoordination).insert(AssignResumed, []),
	assignPauseTurns: deferrable(
		query(assignCoordination).rule((r) => {
			const { target, turn } = v(AssignPaused, "assignPaused")
			return r.match(AssignPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	assignPausedAll: deferrable(
		query(assignCoordination).rule((r) => {
			const { target, turn } = v(AssignPaused, "assignPaused")
			return r
				.match(AssignPaused, { target, turn })
				.where(r.not(AssignResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const assignCoordinatorWorkload = workload(AssignCoordinator, assignCoordinatorPrograms)

/** The commits and declared reads of the flow Assign, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const assignCommitPrograms = Object.freeze({
	assignAuthenticated: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	assignCommitDecide: ChangeSet.union(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(AssignDecideOutput, [])
			.insert(AssignDecideOutputChosen, [])
			.insert(AssignDecideNearestRead, [])
			.insert(AssignDecideSeenRead, []),
		ChangeSet.empty(Loader).insert(App.relations.Assigned, [])
	),
	assignReadDecideNearest: deferrable(
		query(Loader)
			.rule((r) => {
				const { passage, topic, embedding } = v(App.relations.Passage, "row")
				return r
					.match(App.relations.Passage, { passage, topic, embedding })
					.where(r.eq(topic, r.param("topic", App.relations.Passage.fields.topic)))
					.find({
						passage,
						topic,
						distance: Compute.cosineDistance(
							embedding,
							r.param("embedding", App.relations.Passage.fields.embedding)
						)
					})
			})
			.approximateNearest({ by: "distance", take: 3 })
	),
	assignReadDecideSeen: deferrable(
		query(Loader).rule((r) => {
			const { learner, passage } = v(App.relations.Seen, "row")
			return r
				.match(App.relations.Seen, { learner, passage })
				.where(r.eq(learner, r.param("learner", App.relations.Seen.fields.learner)))
				.find({ learner, passage })
		})
	),
	assignCommitAssignmentFinish: ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignDone, [])
		.insert(AssignHeld, [])
})

export const assignCommits = workload(Loader, assignCommitPrograms)
