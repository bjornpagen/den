import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Assign to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import {
	ChangeSet,
	Num,
	Type,
	clocked,
	param,
	query,
	recordsFacts,
	role,
	v,
	workload
} from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { App } from "#integration/slice/app.ts"
import { assign as declaredFlow } from "#integration/slice/flows.ts"
import {
	AssignKind,
	AssignRootKind,
	AssignOutcome,
	AssignRetryWhy,
	AssignPausable,
	AssignEmbedInputMode,
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
	AssignEmbedInput,
	AssignEmbedInputNear,
	AssignEmbedInputExclude,
	AssignEmbedInputModeNearest,
	AssignEmbedInputModeWithin,
	AssignDecideInput,
	AssignDecideInputExclude,
	AssignDecideInputModeNearest,
	AssignDecideInputModeWithin,
	AssignAssignmentInput,
	AssignAssignmentInputNear,
	AssignAssignmentInputExclude,
	AssignAssignmentInputModeNearest,
	AssignAssignmentInputModeWithin,
	AssignEmbedOutput,
	AssignDecideOutput,
	AssignDecideOutputWeighed,
	AssignDecideOutputStageServe,
	AssignDecideOutputStageRest,
	AssignAssignmentFinishOutput,
	AssignAsked,
	AssignDecideReadNearest,
	AssignDecideReadSeen,
	AssignPaused,
	AssignResumed,
	AssignServed,
	AssignDecideReadNearestRecords,
	AssignDecideReadSeenRecords,
	assignGraph,
	assignCoordination
} from "#integration/slice/generated/assign.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Assign: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const AssignDen = role(
	App,
	"assign_den",
	{ ...assignGraph.relations, AssignPaused, AssignResumed, AssignServed },
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
			"AssignEmbedInput",
			"AssignEmbedInputNear",
			"AssignEmbedInputExclude",
			"AssignEmbedInputModeNearest",
			"AssignEmbedInputModeWithin",
			"AssignDecideInput",
			"AssignDecideInputExclude",
			"AssignDecideInputModeNearest",
			"AssignDecideInputModeWithin",
			"AssignAssignmentInput",
			"AssignAssignmentInputNear",
			"AssignAssignmentInputExclude",
			"AssignAssignmentInputModeNearest",
			"AssignAssignmentInputModeWithin",
			"AssignAssignmentFinishOutput",
			"AssignDecideReadNearest",
			"AssignDecideReadSeen",
			...Arr.map(AssignDecideReadNearestRecords.relations, (rel) => rel.name),
			...Arr.map(AssignDecideReadSeenRecords.relations, (rel) => rel.name)
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
		AssignRetryWhy,
		AssignPausable,
		AssignEmbedInputMode,
		AssignDecideInputMode,
		AssignAssignmentInputMode,
		AssignDecideOutputStage,
		AssignPaused,
		AssignResumed,
		AssignServed
	},
	{ insert: ["AssignPaused", "AssignResumed", "AssignServed"] }
)

const assignPendingRead = query(AssignDen).rule((r) => {
	const { step, kind, scope, due } = v(AssignStep, "step")
	return r
		.match(AssignStep, { step, kind, scope, due })
		.where(r.not(AssignResult, { step }))
		.find({ step, kind, scope, due })
})

const assignRequestedRead = query(AssignDen).rule((r) => {
	const { scope } = v(AssignScope, "scope")
	return r
		.match(AssignRoot, { root: scope })
		.match(AssignScope, { root: scope, scope })
		.where(r.not(AssignAdmitted, { scope }), r.not(AssignSkipped, { scope }))
		.find({ scope })
})

const assignRunningRead = query(AssignDen).rule((r) => {
	const { scope, step } = v(AssignFinish, "finish")
	return r.match(AssignFinish, { scope, step }).where(r.not(AssignResult, { step })).find({ scope })
})

const assignLatestServed = query(AssignDen).rule((r) => {
	const { environment, at } = v(AssignServed, "served")
	return r
		.match(AssignServed, { environment, at })
		.where(r.eq(environment, r.param("environment", AssignServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const assignDenPrograms = Object.freeze({
	assignNow: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	assignReading: clocked(
		query(AssignDen).reads({
			now: query(assignGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
			serving: query(AssignDen).rule((r) => {
				const { environment, at, deployment } = v(AssignServed, "served")
				return r
					.match(
						assignLatestServed.bind({
							environment: r.param("environment", AssignServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(AssignServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.now": "millis" }
	),
	assignClaim: clocked(
		ChangeSet.empty(assignGraph)
			.insertComputed(AssignClaim, [], {
				until: Type.cast(
					Num.add(Type.base(param("now", DenInstant)), Type.base(param("budget", DenDelay))),
					DenInstant
				)
			})
			.insert(AssignEnded, [])
			.read("held", (delta) =>
				query(assignGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(AssignClaim), "added")
					return r
						.match(delta.added(AssignClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ now: "millis" }
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
						at: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(r.param("delay", DenDelay))),
							DenInstant
						),
						why: r.param("why", AssignRetry.fields.why),
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
			.insert(AssignEmbedInput, [])
			.insert(AssignEmbedInputNear, [])
			.insert(AssignEmbedInputExclude, [])
			.insert(AssignEmbedInputModeNearest, [])
			.insert(AssignEmbedInputModeWithin, [])
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
						due: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(delay)),
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
		const { root, scope, by } = v(AssignSkipped, "assignSkipped")
		return r
			.match(AssignSkipped, { root, scope, by })
			.where(r.eq(scope, r.param("scope", AssignSkipped.fields.scope)))
			.find({ root, scope, by })
	}),
	assignStepOf: query(assignGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(AssignStep, "assignStep")
		return r
			.match(AssignStep, { root, step, kind, scope, due })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ root, step, kind, scope, due })
	}),
	assignResultOf: query(assignGraph).rule((r) => {
		const { root, step, outcome } = v(AssignResult, "assignResult")
		return r
			.match(AssignResult, { root, step, outcome })
			.where(r.eq(step, r.param("step", AssignResult.fields.step)))
			.find({ root, step, outcome })
	}),
	assignHeldOf: query(assignGraph).rule((r) => {
		const { root, step, attempt } = v(AssignHeld, "assignHeld")
		return r
			.match(AssignHeld, { root, step, attempt })
			.where(r.eq(step, r.param("step", AssignHeld.fields.step)))
			.find({ root, step, attempt })
	}),
	assignAdmittedOf: query(assignGraph).rule((r) => {
		const { root, scope } = v(AssignAdmitted, "assignAdmitted")
		return r
			.match(AssignAdmitted, { root, scope })
			.where(r.eq(scope, r.param("scope", AssignAdmitted.fields.scope)))
			.find({ root, scope })
	}),
	assignRootOf: query(assignGraph).rule((r) => {
		const { kind, key, at } = v(AssignRoot, "root")
		const { scope } = v(AssignScope, "scope")
		return r
			.match(AssignRoot, { root: scope, kind, key, at })
			.match(AssignScope, { root: scope, scope })
			.where(r.eq(scope, r.param("scope", AssignRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	assignFinishedRoots: query(assignGraph)
		.rule((r) => {
			const { scope, step } = v(AssignFinish, "finish")
			return r
				.match(AssignFinish, { root: scope, scope, step })
				.match(AssignResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(AssignSkipped, "skipped")
			return r.match(AssignSkipped, { root: scope, scope }).find({ scope })
		}),
	assignClaimsOf: query(assignGraph).rule((r) => {
		const { step, attempt, until } = v(AssignClaim, "claim")
		return r
			.match(AssignClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, attempt, until })
	}),
	assignRetriesOf: query(assignGraph).rule((r) => {
		const { step, attempt, at, why } = v(AssignRetry, "retry")
		return r
			.match(AssignRetry, { step, attempt, at, why })
			.where(r.eq(step, r.param("step", AssignStep.fields.step)))
			.find({ step, attempt, at, why })
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
	assignPending: assignPendingRead,
	assignRequested: assignRequestedRead,
	assignRunning: assignRunningRead,
	assignSnapshot: query(AssignDen).reads({
		steps: assignPendingRead,
		claims: query(AssignDen).rule((r) => {
			const { step, attempt, until } = v(AssignClaim, "claim")
			return r
				.match(AssignClaim, { step, attempt, until })
				.where(r.not(AssignResult, { step }))
				.find({ step, attempt, until })
		}),
		retries: query(AssignDen).rule((r) => {
			const { step, attempt, at, why } = v(AssignRetry, "retry")
			return r
				.match(AssignRetry, { step, attempt, at, why })
				.where(r.not(AssignResult, { step }))
				.find({ step, attempt, at, why })
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
			const { kind, key, at } = v(AssignRoot, "root")
			const { scope } = v(AssignScope, "scope")
			return r
				.match(AssignRoot, { root: scope, kind, key, at })
				.match(AssignScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: query(AssignDen).rule((r) => {
			const { target, turn } = v(AssignPaused, "assignPaused")
			return r
				.match(AssignPaused, { target, turn })
				.where(r.not(AssignResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	assignReadAssignEmbedInput: query(assignGraph).rule((r) => {
		const { root, step, learner, topic, mode } = v(AssignEmbedInput, "assignEmbedInput")
		return r
			.match(AssignEmbedInput, { root, step, learner, topic, mode })
			.where(r.eq(step, r.param("step", AssignEmbedInput.fields.step)))
			.find({ root, step, learner, topic, mode })
	}),
	assignReadAssignEmbedInputModeNearest: query(assignGraph).rule((r) => {
		const { root, step } = v(AssignEmbedInputModeNearest, "assignEmbedInputModeNearest")
		return r
			.match(AssignEmbedInputModeNearest, { root, step })
			.where(r.eq(step, r.param("step", AssignEmbedInputModeNearest.fields.step)))
			.find({ root, step })
	}),
	assignReadAssignEmbedInputModeWithin: query(assignGraph).rule((r) => {
		const { root, step, radius } = v(AssignEmbedInputModeWithin, "assignEmbedInputModeWithin")
		return r
			.match(AssignEmbedInputModeWithin, { root, step, radius })
			.where(r.eq(step, r.param("step", AssignEmbedInputModeWithin.fields.step)))
			.find({ root, step, radius })
	}),
	assignReadAssignEmbedInputNear: query(assignGraph).rule((r) => {
		const { step, ordinal, value } = v(AssignEmbedInputNear, "part")
		return r
			.match(AssignEmbedInputNear, { step, ordinal, value })
			.where(r.eq(step, r.param("step", AssignEmbedInputNear.fields.step)))
			.find({ step, ordinal, value })
	}),
	assignReadAssignEmbedInputExclude: query(assignGraph).rule((r) => {
		const { step, ordinal, value } = v(AssignEmbedInputExclude, "part")
		return r
			.match(AssignEmbedInputExclude, { step, ordinal, value })
			.where(r.eq(step, r.param("step", AssignEmbedInputExclude.fields.step)))
			.find({ step, ordinal, value })
	}),
	assignReadAssignDecideInput: query(assignGraph).rule((r) => {
		const { root, step, learner, topic, vector, mode } = v(AssignDecideInput, "assignDecideInput")
		return r
			.match(AssignDecideInput, { root, step, learner, topic, vector, mode })
			.where(r.eq(step, r.param("step", AssignDecideInput.fields.step)))
			.find({ root, step, learner, topic, vector, mode })
	}),
	assignReadAssignDecideInputModeNearest: query(assignGraph).rule((r) => {
		const { root, step } = v(AssignDecideInputModeNearest, "assignDecideInputModeNearest")
		return r
			.match(AssignDecideInputModeNearest, { root, step })
			.where(r.eq(step, r.param("step", AssignDecideInputModeNearest.fields.step)))
			.find({ root, step })
	}),
	assignReadAssignDecideInputModeWithin: query(assignGraph).rule((r) => {
		const { root, step, radius } = v(AssignDecideInputModeWithin, "assignDecideInputModeWithin")
		return r
			.match(AssignDecideInputModeWithin, { root, step, radius })
			.where(r.eq(step, r.param("step", AssignDecideInputModeWithin.fields.step)))
			.find({ root, step, radius })
	}),
	assignReadAssignDecideInputExclude: query(assignGraph).rule((r) => {
		const { step, ordinal, value } = v(AssignDecideInputExclude, "part")
		return r
			.match(AssignDecideInputExclude, { step, ordinal, value })
			.where(r.eq(step, r.param("step", AssignDecideInputExclude.fields.step)))
			.find({ step, ordinal, value })
	}),
	assignReadAssignAssignmentInput: query(assignGraph).rule((r) => {
		const { root, scope, learner, topic, mode } = v(AssignAssignmentInput, "assignAssignmentInput")
		return r
			.match(AssignAssignmentInput, { root, scope, learner, topic, mode })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInput.fields.scope)))
			.find({ root, scope, learner, topic, mode })
	}),
	assignReadAssignAssignmentInputModeNearest: query(assignGraph).rule((r) => {
		const { root, scope } = v(AssignAssignmentInputModeNearest, "assignAssignmentInputModeNearest")
		return r
			.match(AssignAssignmentInputModeNearest, { root, scope })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInputModeNearest.fields.scope)))
			.find({ root, scope })
	}),
	assignReadAssignAssignmentInputModeWithin: query(assignGraph).rule((r) => {
		const { root, scope, radius } = v(
			AssignAssignmentInputModeWithin,
			"assignAssignmentInputModeWithin"
		)
		return r
			.match(AssignAssignmentInputModeWithin, { root, scope, radius })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInputModeWithin.fields.scope)))
			.find({ root, scope, radius })
	}),
	assignReadAssignAssignmentInputNear: query(assignGraph).rule((r) => {
		const { scope, ordinal, value } = v(AssignAssignmentInputNear, "part")
		return r
			.match(AssignAssignmentInputNear, { scope, ordinal, value })
			.where(r.eq(scope, r.param("scope", AssignAssignmentInputNear.fields.scope)))
			.find({ scope, ordinal, value })
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
			.insert(AssignAssignmentInputNear, [])
			.insert(AssignAssignmentInputExclude, [])
			.insert(AssignAssignmentInputModeNearest, [])
			.insert(AssignAssignmentInputModeWithin, [])
			.insert(
				AssignRoot,
				query(assignGraph).rule((r) =>
					r.find({
						root: r.param("assignAssignmentScope", AssignRoot.fields.root),
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
	assignInputsAssignmentDecide: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { learner, topic, vector, mode } = v(AssignDecideInput, "input")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideInput, { step, learner, topic, vector, mode })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, learner, topic, vector, mode })
	}),
	assignInputsAssignmentDecideExclude: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { ordinal, value } = v(AssignDecideInputExclude, "part")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideInputExclude, { step, ordinal, value })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, ordinal, value })
	}),
	assignInputsAssignmentDecideModeNearest: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideInputModeNearest, { step })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step })
	}),
	assignInputsAssignmentDecideModeWithin: query(assignGraph).rule((r) => {
		const { step, scope } = v(AssignStep, "step")
		const { radius } = v(AssignDecideInputModeWithin, "part")
		return r
			.match(AssignStep, { step, kind: "Decide", scope })
			.match(AssignDecideInputModeWithin, { step, radius })
			.where(r.eq(scope, r.param("scope", AssignScope.fields.scope)))
			.find({ step, radius })
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
	assignPromote: clocked(
		ChangeSet.empty(assignCoordination).insert(
			AssignServed,
			query(assignCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", AssignServed.fields.environment),
					at: r.param("now", AssignServed.fields.at),
					deployment: r.param("deployment", AssignServed.fields.deployment)
				})
			)
		),
		{ now: "millis" }
	),
	assignPause: ChangeSet.empty(assignCoordination).insert(AssignPaused, []),
	assignResume: ChangeSet.empty(assignCoordination).insert(AssignResumed, []),
	assignPauseTurns: query(assignCoordination).rule((r) => {
		const { target, turn } = v(AssignPaused, "assignPaused")
		return r.match(AssignPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	assignPausedAll: query(assignCoordination).rule((r) => {
		const { target, turn } = v(AssignPaused, "assignPaused")
		return r
			.match(AssignPaused, { target, turn })
			.where(r.not(AssignResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const assignCoordinatorWorkload = workload(AssignCoordinator, assignCoordinatorPrograms)

/** den's retiring role for the flow Assign: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const AssignRetirer = role(
	App,
	"assign_retirer",
	{ ...assignGraph.relations },
	{
		write: [
			"AssignScope",
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
			"AssignEmbedInput",
			"AssignEmbedInputNear",
			"AssignEmbedInputExclude",
			"AssignEmbedInputModeNearest",
			"AssignEmbedInputModeWithin",
			"AssignDecideInput",
			"AssignDecideInputExclude",
			"AssignDecideInputModeNearest",
			"AssignDecideInputModeWithin",
			"AssignAssignmentInput",
			"AssignAssignmentInputNear",
			"AssignAssignmentInputExclude",
			"AssignAssignmentInputModeNearest",
			"AssignAssignmentInputModeWithin",
			"AssignEmbedOutput",
			"AssignDecideOutput",
			"AssignDecideOutputWeighed",
			"AssignDecideOutputStageServe",
			"AssignDecideOutputStageRest",
			"AssignAssignmentFinishOutput",
			"AssignAsked",
			"AssignDecideReadNearest",
			"AssignDecideReadSeen"
		]
	}
)

export const assignRetirerPrograms = Object.freeze({
	assignRetire: ChangeSet.empty(assignGraph).deleteWhere({
		AssignScope: { root: param("root", AssignRoot.fields.root) },
		AssignAdmitted: { root: param("root", AssignRoot.fields.root) },
		AssignSkipped: { root: param("root", AssignRoot.fields.root) },
		AssignStep: { root: param("root", AssignRoot.fields.root) },
		AssignStartStep: { root: param("root", AssignRoot.fields.root) },
		AssignFinish: { root: param("root", AssignRoot.fields.root) },
		AssignClaim: { root: param("root", AssignRoot.fields.root) },
		AssignEnded: { root: param("root", AssignRoot.fields.root) },
		AssignRetry: { root: param("root", AssignRoot.fields.root) },
		AssignFenced: { root: param("root", AssignRoot.fields.root) },
		AssignResult: { root: param("root", AssignRoot.fields.root) },
		AssignDone: { root: param("root", AssignRoot.fields.root) },
		AssignFailed: { root: param("root", AssignRoot.fields.root) },
		AssignHeld: { root: param("root", AssignRoot.fields.root) },
		AssignRefusal: { root: param("root", AssignRoot.fields.root) },
		AssignExhausted: { root: param("root", AssignRoot.fields.root) },
		AssignEmbedInput: { root: param("root", AssignRoot.fields.root) },
		AssignEmbedInputNear: { root: param("root", AssignRoot.fields.root) },
		AssignEmbedInputExclude: { root: param("root", AssignRoot.fields.root) },
		AssignEmbedInputModeNearest: { root: param("root", AssignRoot.fields.root) },
		AssignEmbedInputModeWithin: { root: param("root", AssignRoot.fields.root) },
		AssignDecideInput: { root: param("root", AssignRoot.fields.root) },
		AssignDecideInputExclude: { root: param("root", AssignRoot.fields.root) },
		AssignDecideInputModeNearest: { root: param("root", AssignRoot.fields.root) },
		AssignDecideInputModeWithin: { root: param("root", AssignRoot.fields.root) },
		AssignAssignmentInput: { root: param("root", AssignRoot.fields.root) },
		AssignAssignmentInputNear: { root: param("root", AssignRoot.fields.root) },
		AssignAssignmentInputExclude: { root: param("root", AssignRoot.fields.root) },
		AssignAssignmentInputModeNearest: { root: param("root", AssignRoot.fields.root) },
		AssignAssignmentInputModeWithin: { root: param("root", AssignRoot.fields.root) },
		AssignEmbedOutput: { root: param("root", AssignRoot.fields.root) },
		AssignDecideOutput: { root: param("root", AssignRoot.fields.root) },
		AssignDecideOutputWeighed: { root: param("root", AssignRoot.fields.root) },
		AssignDecideOutputStageServe: { root: param("root", AssignRoot.fields.root) },
		AssignDecideOutputStageRest: { root: param("root", AssignRoot.fields.root) },
		AssignAssignmentFinishOutput: { root: param("root", AssignRoot.fields.root) },
		AssignAsked: { root: param("root", AssignRoot.fields.root) },
		AssignDecideReadNearest: { root: param("root", AssignRoot.fields.root) },
		AssignDecideReadSeen: { root: param("root", AssignRoot.fields.root) }
	})
})

export const assignRetirerWorkload = workload(AssignRetirer, assignRetirerPrograms)

/** The commits and declared reads of the flow Assign, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const assignCommitPrograms = Object.freeze({
	assignAuthenticated: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	assignCommitEmbed: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(AssignEmbedOutput, [])
			.insert(AssignScope, [])
			.insert(AssignAdmitted, [])
			.insert(AssignFinish, [])
			.insert(AssignStartStep, [])
			.insert(AssignEmbedInput, [])
			.insert(AssignEmbedInputNear, [])
			.insert(AssignEmbedInputExclude, [])
			.insert(AssignEmbedInputModeNearest, [])
			.insert(AssignEmbedInputModeWithin, [])
			.insert(AssignDecideInput, [])
			.insert(AssignDecideInputExclude, [])
			.insert(AssignDecideInputModeNearest, [])
			.insert(AssignDecideInputModeWithin, [])
			.insert(AssignAsked, [])
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
						due: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(delay)),
							DenInstant
						),
						root: r.param("root", AssignStep.fields.root)
					})
				})
			),
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
			.insert(AssignDecideReadNearest, [])
			.insert(AssignDecideReadSeen, [])
			.insertAll(recordsFacts(assignGraph, AssignDecideReadNearestRecords)([]))
			.insertAll(recordsFacts(assignGraph, AssignDecideReadSeenRecords)([])),
		declaredFlow.kinds[1].writes.changes(Loader)
	),
	assignReadDecide: query(Loader).reads(declaredFlow.kinds[1].reads.named),
	assignCommitAssignmentFinish: ChangeSet.union(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(AssignAssignmentFinishOutput, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	)
})

export const assignCommits = workload(Loader, assignCommitPrograms)
