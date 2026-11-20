import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
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
	AssignRootKind,
	AssignOutcome,
	AssignPausable,
	AssignDecideInputMode,
	AssignAssignmentInputMode,
	AssignDecideOutputStage,
	AssignScope,
	AssignRoot,
	AssignAdmitted,
	AssignSkipped,
	AssignStep,
	AssignStartStep,
	AssignFinish,
	AssignClaim,
	AssignEnded,
	AssignRetry,
	AssignFenced,
	AssignResult,
	AssignDone,
	AssignFailed,
	AssignHeld,
	AssignRefusal,
	AssignExhausted,
	AssignDecideInput,
	AssignDecideInputExclude,
	AssignDecideInputModeNearest,
	AssignDecideInputModeWithin,
	AssignAssignmentInput,
	AssignAssignmentInputExclude,
	AssignAssignmentInputModeNearest,
	AssignAssignmentInputModeWithin,
	AssignDecideOutput,
	AssignDecideOutputWeighed,
	AssignDecideOutputStageServe,
	AssignDecideOutputStageRest,
	AssignDecideNearestRead,
	AssignDecideSeenRead,
	AssignPaused,
	AssignResumed,
	assignGraph,
	assignCoordination
} from "#integration/slice/generated/assign.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Assign: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const AssignDen = role(
	App,
	"assign_den",
	{ ...assignGraph.relations, AssignPaused, AssignResumed },
	{
		insert: [
			"AssignScope",
			"AssignRoot",
			"AssignAdmitted",
			"AssignSkipped",
			"AssignStep",
			"AssignStartStep",
			"AssignFinish",
			"AssignClaim",
			"AssignEnded",
			"AssignRetry",
			"AssignFenced",
			"AssignResult",
			"AssignDone",
			"AssignFailed",
			"AssignHeld",
			"AssignRefusal",
			"AssignExhausted",
			"AssignDecideInput",
			"AssignDecideInputExclude",
			"AssignDecideInputModeNearest",
			"AssignDecideInputModeWithin",
			"AssignAssignmentInput",
			"AssignAssignmentInputExclude",
			"AssignAssignmentInputModeNearest",
			"AssignAssignmentInputModeWithin",
			"AssignDecideNearestRead",
			"AssignDecideSeenRead"
		]
	}
)

/** den's coordinator role for the flow Assign: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const AssignCoordinator = role(
	App,
	"assign_coordinator",
	{
		AssignKind,
		AssignRootKind,
		AssignOutcome,
		AssignPausable,
		AssignDecideInputMode,
		AssignAssignmentInputMode,
		AssignDecideOutputStage,
		AssignPaused,
		AssignResumed
	},
	{ insert: ["AssignPaused", "AssignResumed"] }
)

const assignPendingRead = query(AssignDen).rule((r) => {
	const { step, kind, scope, due } = v(AssignStep, "step")
	return r
		.match(AssignStep, { step, kind, scope, due })
		.where(r.not(AssignResult, { step }))
		.find({ step, kind, scope, due })
})

const assignRequestedRead = query(AssignDen).rule((r) => {
	const { scope } = v(AssignRoot, "root")
	return r
		.match(AssignRoot, { scope })
		.where(r.not(AssignAdmitted, { scope }), r.not(AssignSkipped, { scope }))
		.find({ scope })
})

const assignRunningRead = query(AssignDen).rule((r) => {
	const { scope, step } = v(AssignFinish, "finish")
	return r.match(AssignFinish, { scope, step }).where(r.not(AssignResult, { step })).find({ scope })
})

export const assignDenPrograms = Object.freeze({
	assignNow: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	assignClaim: ChangeSet.empty(assignGraph)
		.insert(AssignClaim, [])
		.insert(AssignEnded, [])
		.read("held", (delta) =>
			query(assignGraph).rule((r) => {
				const { step, root, attempt } = v(delta.added(AssignClaim), "added")
				return r
					.match(delta.added(AssignClaim), { step, root, attempt })
					.find({ step, root, attempt })
			})
		),
	assignRetry: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignEnded, [])
			.insert(
				AssignRetry,
				query(assignGraph).rule((r) =>
					r.find({
						step: r.param("step", AssignRetry.fields.step),
						attempt: r.param("attempt", AssignRetry.fields.attempt),
						at: Compute.cast(
							Compute.add(
								Compute.base(r.param("now", DenInstant)),
								Compute.base(r.param("delay", DenDelay))
							),
							DenInstant
						),
						spent: r.param("spent", AssignRetry.fields.spent),
						root: r.param("root", AssignRetry.fields.root)
					})
				)
			),
		{ now: "millis" }
	),
	assignFence: ChangeSet.empty(assignGraph).insert(AssignEnded, []).insert(AssignFenced, []),
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
	assignAdmit: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignAdmitted, [])
			.insert(AssignFinish, [])
			.insert(AssignStartStep, [])
			.insert(AssignScope, [])
			.insert(AssignDecideInput, [])
			.insert(AssignDecideInputExclude, [])
			.insert(AssignDecideInputModeNearest, [])
			.insert(AssignDecideInputModeWithin, [])
			.insert(
				AssignStep,
				query(assignGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: AssignStep.fields.step,
						kind: AssignStep.fields.kind,
						scope: AssignStep.fields.scope,
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
						root: r.param("root", AssignStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	assignSkip: ChangeSet.empty(assignGraph).insert(AssignSkipped, []),
	assignSkippedOf: query(assignGraph).rule((r) => {
		const { scope, by, root } = v(AssignSkipped, "assignSkipped")
		return r
			.match(AssignSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", AssignSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	assignStepOf: query(assignGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(AssignStep, "assignStep")
		return r
			.match(AssignStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	assignResultOf: query(assignGraph).rule((r) => {
		const { step, outcome, root } = v(AssignResult, "assignResult")
		return r
			.match(AssignResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", AssignResult.fields.step)))
			.find({ step, outcome, root })
	}),
	assignHeldOf: query(assignGraph).rule((r) => {
		const { step, attempt, root } = v(AssignHeld, "assignHeld")
		return r
			.match(AssignHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", AssignHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	assignAdmittedOf: query(assignGraph).rule((r) => {
		const { scope, root } = v(AssignAdmitted, "assignAdmitted")
		return r
			.match(AssignAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", AssignAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	assignRootOf: query(assignGraph).rule((r) => {
		const { scope, kind, key, at } = v(AssignRoot, "assignRoot")
		return r
			.match(AssignRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", AssignRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	assignFinishedRoots: deferrable(
		query(assignGraph)
			.rule((r) => {
				const { scope, kind, at } = v(AssignRoot, "root")
				const { step } = v(AssignFinish, "finish")
				return r
					.match(AssignRoot, { scope, kind, at })
					.match(AssignFinish, { scope, step })
					.match(AssignResult, { step })
					.find({ scope, kind, at })
			})
			.rule((r) => {
				const { scope, kind, at } = v(AssignRoot, "root")
				return r
					.match(AssignRoot, { scope, kind, at })
					.match(AssignSkipped, { scope })
					.find({ scope, kind, at })
			})
	),
	assignClaimsOf: query(assignGraph).rule((r) => {
		const { step, attempt, until } = v(AssignClaim, "claim")
		return r
			.match(AssignClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, attempt, until })
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
	assignFinished: query(assignGraph).rule((r) => {
		const { scope, step } = v(AssignFinish, "finish")
		return r
			.match(AssignFinish, { scope, step })
			.match(AssignResult, { step })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step })
	}),
	assignPending: deferrable(assignPendingRead),
	assignRequested: deferrable(assignRequestedRead),
	assignRunning: deferrable(assignRunningRead),
	assignSnapshot: deferrable(
		query(AssignDen).reads({
			steps: assignPendingRead,
			claims: query(AssignDen).rule((r) => {
				const { step, attempt, until } = v(AssignClaim, "claim")
				return r
					.match(AssignClaim, { step, attempt, until })
					.where(r.not(AssignResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(AssignDen).rule((r) => {
				const { step, attempt, at, spent } = v(AssignRetry, "retry")
				return r
					.match(AssignRetry, { step, attempt, at, spent })
					.where(r.not(AssignResult, { step }))
					.find({ step, attempt, at, spent })
			}),
			fenced: query(AssignDen).rule((r) => {
				const { step, attempt } = v(AssignFenced, "fenced")
				return r
					.match(AssignFenced, { step, attempt })
					.where(r.not(AssignResult, { step }))
					.find({ step, attempt })
			}),
			requested: assignRequestedRead,
			running: assignRunningRead,
			roots: query(AssignDen).rule((r) => {
				const { scope, kind, key, at } = v(AssignRoot, "assignRoot")
				return r.match(AssignRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			paused: query(AssignDen).rule((r) => {
				const { target, turn } = v(AssignPaused, "assignPaused")
				return r
					.match(AssignPaused, { target, turn })
					.where(r.not(AssignResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	assignReadAssignDecideInput: query(assignGraph).rule((r) => {
		const { step, learner, topic, missed, mode, root } = v(AssignDecideInput, "assignDecideInput")
		return r
			.match(AssignDecideInput, { step, learner, topic, missed, mode, root })
			.where(r.eq(step, r.param("step", AssignDecideInput.fields.step)))
			.find({ step, learner, topic, missed, mode, root })
	}),
	assignReadAssignDecideInputModeNearest: query(assignGraph).rule((r) => {
		const { step, root } = v(AssignDecideInputModeNearest, "assignDecideInputModeNearest")
		return r
			.match(AssignDecideInputModeNearest, { step, root })
			.where(r.eq(step, r.param("step", AssignDecideInputModeNearest.fields.step)))
			.find({ step, root })
	}),
	assignReadAssignDecideInputModeWithin: query(assignGraph).rule((r) => {
		const { step, radius, root } = v(AssignDecideInputModeWithin, "assignDecideInputModeWithin")
		return r
			.match(AssignDecideInputModeWithin, { step, radius, root })
			.where(r.eq(step, r.param("step", AssignDecideInputModeWithin.fields.step)))
			.find({ step, radius, root })
	}),
	assignReadAssignDecideInputExclude: query(assignGraph).rule((r) => {
		const { step, ordinal, value } = v(AssignDecideInputExclude, "part")
		return r
			.match(AssignDecideInputExclude, { step, ordinal, value })
			.where(r.eq(step, r.param("step", AssignDecideInputExclude.fields.step)))
			.find({ step, ordinal, value })
	}),
	assignReadAssignAssignmentInput: query(assignGraph).rule((r) => {
		const { scope, learner, topic, missed, mode, root } = v(
			AssignAssignmentInput,
			"assignAssignmentInput"
		)
		return r
			.match(AssignAssignmentInput, { scope, learner, topic, missed, mode, root })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInput.fields.scope)))
			.find({ scope, learner, topic, missed, mode, root })
	}),
	assignReadAssignAssignmentInputModeNearest: query(assignGraph).rule((r) => {
		const { scope, root } = v(AssignAssignmentInputModeNearest, "assignAssignmentInputModeNearest")
		return r
			.match(AssignAssignmentInputModeNearest, { scope, root })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInputModeNearest.fields.scope)))
			.find({ scope, root })
	}),
	assignReadAssignAssignmentInputModeWithin: query(assignGraph).rule((r) => {
		const { scope, radius, root } = v(
			AssignAssignmentInputModeWithin,
			"assignAssignmentInputModeWithin"
		)
		return r
			.match(AssignAssignmentInputModeWithin, { scope, radius, root })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInputModeWithin.fields.scope)))
			.find({ scope, radius, root })
	}),
	assignReadAssignAssignmentInputExclude: query(assignGraph).rule((r) => {
		const { scope, ordinal, value } = v(AssignAssignmentInputExclude, "part")
		return r
			.match(AssignAssignmentInputExclude, { scope, ordinal, value })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInputExclude.fields.scope)))
			.find({ scope, ordinal, value })
	}),
	assignRequestAssignment: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignScope, [])
			.insert(AssignAssignmentInput, [])
			.insert(AssignAssignmentInputExclude, [])
			.insert(AssignAssignmentInputModeNearest, [])
			.insert(AssignAssignmentInputModeWithin, [])
			.insert(
				AssignRoot,
				query(assignGraph).rule((r) =>
					r.find({
						scope: r.param("assignAssignmentScope", AssignRoot.fields.scope),
						kind: AssignRootKind.handle("Assignment"),
						key: r.param("assignAssignmentKey", AssignRoot.fields.key),
						at: r.param("now", AssignRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	assignOutputsAssignmentDecide: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { confidence, stage } = v(AssignDecideOutput, "output")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideOutput, { step, confidence, stage })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, confidence, stage })
	}),
	assignOutputsAssignmentDecideWeighed: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { ordinal, passage, distance, passed } = v(AssignDecideOutputWeighed, "part")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideOutputWeighed, { step, ordinal, passage, distance, passed })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, ordinal, passage, distance, passed })
	}),
	assignOutputsAssignmentDecideStageServe: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { passage, distance } = v(AssignDecideOutputStageServe, "part")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideOutputStageServe, { step, passage, distance })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, passage, distance })
	}),
	assignOutputsAssignmentDecideStageRest: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideOutputStageRest, { step })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step })
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

/** den's retiring role for the flow Assign: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const AssignRetirer = role(
	App,
	"assign_retirer",
	{ ...assignGraph.relations },
	{ retire: ["AssignRoot"] }
)

export const assignRetirerPrograms = Object.freeze({
	assignRetire: ChangeSet.empty(assignGraph).retire(AssignRoot, [])
})

export const assignRetirerWorkload = workload(AssignRetirer, assignRetirerPrograms)

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
			.insert(AssignDecideOutputWeighed, [])
			.insert(AssignDecideOutputStageServe, [])
			.insert(AssignDecideOutputStageRest, [])
			.insert(AssignDecideNearestRead, [])
			.insert(AssignDecideSeenRead, []),
		ChangeSet.empty(Loader).insert(App.relations.Assigned, [])
	),
	assignReadDecide: deferrable(
		query(Loader).reads({
			nearest: query(Loader)
				.rule((r) => {
					const { passage, topic, embedding } = v(App.relations.Passage, "row")
					const anchor = v(App.relations.Missed, "anchor")
					return r
						.match(App.relations.Missed, { question: anchor.question, embedding: anchor.embedding })
						.match(App.relations.Passage, { passage, topic, embedding })
						.where(
							r.eq(
								anchor.question,
								r.param("anchor.question", App.relations.Missed.fields.question)
							),
							r.eq(topic, r.param("topic", App.relations.Passage.fields.topic))
						)
						.find({ passage, topic, distance: Compute.cosineDistance(embedding, anchor.embedding) })
				})
				.approximateNearest({ by: "distance", take: 3 }),
			seen: query(Loader).rule((r) => {
				const { learner, passage } = v(App.relations.Seen, "row")
				return r
					.match(App.relations.Seen, { learner, passage })
					.where(r.eq(learner, r.param("learner", App.relations.Seen.fields.learner)))
					.find({ learner, passage })
			})
		})
	),
	assignCommitAssignmentFinish: ChangeSet.union(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, []),
		ChangeSet.empty(Loader).insert(App.relations.Concluded, [])
	)
})

export const assignCommits = workload(Loader, assignCommitPrograms)
