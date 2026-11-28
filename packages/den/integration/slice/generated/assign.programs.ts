import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Assign to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import * as g from "@bjornpagen/grizzle"
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
	AssignRequestedWith,
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
export const AssignDen = g.role(
	App,
	"assign_den",
	{ ...assignGraph.relations, AssignPaused, AssignResumed, AssignServed },
	{
		insert: [
			"AssignScope",
			"AssignRoot",
			"AssignRequestedWith",
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

/** den's coordinator role for the flow Assign: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const AssignCoordinator = g.role(
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

const assignPendingRead = g.query(AssignDen).rule((r) => {
	const { root, step, kind, scope, due } = g.v(AssignStep, "step")
	return r
		.match(AssignStep, { root, step, kind, scope, due })
		.where(r.not(AssignResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const assignRequestedRead = g.query(AssignDen).rule((r) => {
	const { scope } = g.v(AssignScope, "scope")
	return r
		.match(AssignRoot, { root: scope })
		.match(AssignScope, { root: scope, scope })
		.where(
			r.not(AssignAdmitted, { root: scope, scope }),
			r.not(AssignSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const assignRunningRead = g.query(AssignDen).rule((r) => {
	const { root, scope, step } = g.v(AssignFinish, "finish")
	return r
		.match(AssignFinish, { root, scope, step })
		.where(r.not(AssignResult, { root, step }))
		.find({ scope })
})

const assignLatestServed = g.query(AssignDen).rule((r) => {
	const { environment, at } = g.v(AssignServed, "served")
	return r
		.match(AssignServed, { environment, at })
		.where(r.eq(environment, r.param("environment", AssignServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const assignDenPrograms = Object.freeze({
	assignNow: g.clocked(
		g.query(assignGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignReading: g.clocked(
		g.query(AssignDen).reads({
			now: g.query(assignGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: g.query(AssignDen).rule((r) => {
				const { environment, at, deployment } = g.v(AssignServed, "served")
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
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	assignClaim: g.clocked(
		g.ChangeSet.empty(assignGraph)
			.insertAllComputed(
				{ AssignClaim: [] },
				{
					until: g.Type.cast(
						g.Num.add(
							g.Type.base(g.param("denNow", DenInstant)),
							g.Type.base(g.param("budget", DenDelay))
						),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(AssignEnded, [])
			.read("held", (delta) =>
				g.query(assignGraph).rule((r) => {
					const { step, root, attempt } = g.v(delta.added(AssignClaim), "added")
					return r
						.match(delta.added(AssignClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignRetry: g.clocked(
		g.ChangeSet.empty(assignGraph)
			.insert(AssignEnded, [])
			.insert(
				AssignRetry,
				g.query(assignGraph).rule((r) =>
					r.find({
						step: r.param("step", AssignRetry.fields.step),
						attempt: r.param("attempt", AssignRetry.fields.attempt),
						at: g.Type.cast(
							g.Num.add(
								g.Type.base(r.param("denNow", DenInstant)),
								g.Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", AssignRetry.fields.why),
						root: r.param("root", AssignRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignFence: g.ChangeSet.empty(assignGraph).insert(AssignEnded, []).insert(AssignFenced, []),
	assignRefuse: g.ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignFailed, [])
		.insert(AssignHeld, [])
		.insert(AssignRefusal, []),
	assignExhaust: g.ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignFailed, [])
		.insert(AssignHeld, [])
		.insert(AssignExhausted, []),
	assignAdmit: g.clocked(
		g.ChangeSet.empty(assignGraph)
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
				g.query(assignGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: AssignStep.fields.step,
						kind: AssignStep.fields.kind,
						scope: AssignStep.fields.scope,
						delay: DenDelay
					})
					const { step, kind, scope, delay } = g.v(steps, "spawned")
					return r.match(steps, { step, kind, scope, delay }).find({
						step,
						kind,
						scope,
						due: g.Type.cast(
							g.Num.add(g.Type.base(r.param("denNow", DenInstant)), g.Type.base(delay)),
							DenInstant,
							denInstantKey
						),
						root: r.param("root", AssignStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignSkip: g.ChangeSet.empty(assignGraph).insert(AssignSkipped, []),
	assignSkippedOf: g.query(assignGraph).rule((r) => {
		const { root, scope, by } = g.v(AssignSkipped, "assignSkipped")
		return r
			.match(AssignSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", AssignSkipped.fields.root)),
				r.eq(scope, r.param("scope", AssignSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	assignStepOf: g.query(assignGraph).rule((r) => {
		const { root, step, kind, scope, due } = g.v(AssignStep, "assignStep")
		return r
			.match(AssignStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", AssignStep.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	assignResultOf: g.query(assignGraph).rule((r) => {
		const { root, step, outcome } = g.v(AssignResult, "assignResult")
		return r
			.match(AssignResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", AssignResult.fields.root)),
				r.eq(step, r.param("step", AssignResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	assignHeldOf: g.query(assignGraph).rule((r) => {
		const { root, step, attempt } = g.v(AssignHeld, "assignHeld")
		return r
			.match(AssignHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", AssignHeld.fields.root)),
				r.eq(step, r.param("step", AssignHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	assignAdmittedOf: g.query(assignGraph).rule((r) => {
		const { root, scope } = g.v(AssignAdmitted, "assignAdmitted")
		return r
			.match(AssignAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", AssignAdmitted.fields.root)),
				r.eq(scope, r.param("scope", AssignAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	assignRootOf: g.query(assignGraph).rule((r) => {
		const { kind, key, at } = g.v(AssignRoot, "root")
		const { scope } = g.v(AssignScope, "scope")
		return r
			.match(AssignRoot, { root: scope, kind, key, at })
			.match(AssignScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", AssignRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	assignFinishedRoots: g
		.query(assignGraph)
		.rule((r) => {
			const { scope, step } = g.v(AssignFinish, "finish")
			return r
				.match(AssignFinish, { root: scope, scope, step })
				.match(AssignResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = g.v(AssignSkipped, "skipped")
			return r.match(AssignSkipped, { root: scope, scope }).find({ scope })
		}),
	assignClaimsOf: g.query(assignGraph).rule((r) => {
		const { root, step, attempt, until } = g.v(AssignClaim, "claim")
		return r
			.match(AssignClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	assignRetriesOf: g.query(assignGraph).rule((r) => {
		const { root, step, attempt, at, why } = g.v(AssignRetry, "retry")
		return r
			.match(AssignRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	assignFencedOf: g.query(assignGraph).rule((r) => {
		const { root, step, attempt } = g.v(AssignFenced, "fenced")
		return r
			.match(AssignFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ step, attempt })
	}),
	assignUnendedSteps: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope)),
				r.not(AssignResult, { root, step }),
				r.not(AssignFinish, { root, scope, step })
			)
			.find({ step })
	}),
	assignFinished: g.query(assignGraph).rule((r) => {
		const { root, scope, step } = g.v(AssignFinish, "finish")
		return r
			.match(AssignFinish, { root, scope, step })
			.match(AssignResult, { root, step })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	}),
	assignPending: assignPendingRead,
	assignRequested: assignRequestedRead,
	assignRunning: assignRunningRead,
	assignSnapshot: g.query(AssignDen).reads({
		steps: assignPendingRead,
		claims: g.query(AssignDen).rule((r) => {
			const { root, step, attempt, until } = g.v(AssignClaim, "claim")
			return r
				.match(AssignClaim, { root, step, attempt, until })
				.where(r.not(AssignResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: g.query(AssignDen).rule((r) => {
			const { root, step, attempt, at, why } = g.v(AssignRetry, "retry")
			return r
				.match(AssignRetry, { root, step, attempt, at, why })
				.where(r.not(AssignResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: g.query(AssignDen).rule((r) => {
			const { root, step, attempt } = g.v(AssignFenced, "fenced")
			return r
				.match(AssignFenced, { root, step, attempt })
				.where(r.not(AssignResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: assignRequestedRead,
		running: assignRunningRead,
		roots: g.query(AssignDen).rule((r) => {
			const { kind, key, at } = g.v(AssignRoot, "root")
			const { scope } = g.v(AssignScope, "scope")
			return r
				.match(AssignRoot, { root: scope, kind, key, at })
				.match(AssignScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: g.query(AssignDen).rule((r) => {
			const { target, turn } = g.v(AssignPaused, "assignPaused")
			return r
				.match(AssignPaused, { target, turn })
				.where(r.not(AssignResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	assignReadAssignEmbedInput: g.query(assignGraph).rule((r) => {
		const { root, step, learner, topic, mode } = g.v(AssignEmbedInput, "assignEmbedInput")
		return r
			.match(AssignEmbedInput, { root, step, learner, topic, mode })
			.where(
				r.eq(root, r.param("root", AssignEmbedInput.fields.root)),
				r.eq(step, r.param("step", AssignEmbedInput.fields.step))
			)
			.find({ root, step, learner, topic, mode })
	}),
	assignReadAssignEmbedInputModeNearest: g.query(assignGraph).rule((r) => {
		const { root, step } = g.v(AssignEmbedInputModeNearest, "assignEmbedInputModeNearest")
		return r
			.match(AssignEmbedInputModeNearest, { root, step })
			.where(
				r.eq(root, r.param("root", AssignEmbedInputModeNearest.fields.root)),
				r.eq(step, r.param("step", AssignEmbedInputModeNearest.fields.step))
			)
			.find({ root, step })
	}),
	assignReadAssignEmbedInputModeWithin: g.query(assignGraph).rule((r) => {
		const { root, step, radius } = g.v(AssignEmbedInputModeWithin, "assignEmbedInputModeWithin")
		return r
			.match(AssignEmbedInputModeWithin, { root, step, radius })
			.where(
				r.eq(root, r.param("root", AssignEmbedInputModeWithin.fields.root)),
				r.eq(step, r.param("step", AssignEmbedInputModeWithin.fields.step))
			)
			.find({ root, step, radius })
	}),
	assignReadAssignEmbedInputNear: g.query(assignGraph).rule((r) => {
		const { root, step, ordinal, value } = g.v(AssignEmbedInputNear, "part")
		return r
			.match(AssignEmbedInputNear, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignEmbedInputNear.fields.root)),
				r.eq(step, r.param("step", AssignEmbedInputNear.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	assignReadAssignEmbedInputExclude: g.query(assignGraph).rule((r) => {
		const { root, step, ordinal, value } = g.v(AssignEmbedInputExclude, "part")
		return r
			.match(AssignEmbedInputExclude, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignEmbedInputExclude.fields.root)),
				r.eq(step, r.param("step", AssignEmbedInputExclude.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	assignReadAssignDecideInput: g.query(assignGraph).rule((r) => {
		const { root, step, learner, topic, vector, mode } = g.v(AssignDecideInput, "assignDecideInput")
		return r
			.match(AssignDecideInput, { root, step, learner, topic, vector, mode })
			.where(
				r.eq(root, r.param("root", AssignDecideInput.fields.root)),
				r.eq(step, r.param("step", AssignDecideInput.fields.step))
			)
			.find({ root, step, learner, topic, vector, mode })
	}),
	assignReadAssignDecideInputModeNearest: g.query(assignGraph).rule((r) => {
		const { root, step } = g.v(AssignDecideInputModeNearest, "assignDecideInputModeNearest")
		return r
			.match(AssignDecideInputModeNearest, { root, step })
			.where(
				r.eq(root, r.param("root", AssignDecideInputModeNearest.fields.root)),
				r.eq(step, r.param("step", AssignDecideInputModeNearest.fields.step))
			)
			.find({ root, step })
	}),
	assignReadAssignDecideInputModeWithin: g.query(assignGraph).rule((r) => {
		const { root, step, radius } = g.v(AssignDecideInputModeWithin, "assignDecideInputModeWithin")
		return r
			.match(AssignDecideInputModeWithin, { root, step, radius })
			.where(
				r.eq(root, r.param("root", AssignDecideInputModeWithin.fields.root)),
				r.eq(step, r.param("step", AssignDecideInputModeWithin.fields.step))
			)
			.find({ root, step, radius })
	}),
	assignReadAssignDecideInputExclude: g.query(assignGraph).rule((r) => {
		const { root, step, ordinal, value } = g.v(AssignDecideInputExclude, "part")
		return r
			.match(AssignDecideInputExclude, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignDecideInputExclude.fields.root)),
				r.eq(step, r.param("step", AssignDecideInputExclude.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	assignReadAssignAssignmentInput: g.query(assignGraph).rule((r) => {
		const { root, scope, learner, topic, mode } = g.v(
			AssignAssignmentInput,
			"assignAssignmentInput"
		)
		return r
			.match(AssignAssignmentInput, { root, scope, learner, topic, mode })
			.where(
				r.eq(root, r.param("root", AssignAssignmentInput.fields.root)),
				r.eq(scope, r.param("scope", AssignAssignmentInput.fields.scope))
			)
			.find({ root, scope, learner, topic, mode })
	}),
	assignReadAssignAssignmentInputModeNearest: g.query(assignGraph).rule((r) => {
		const { root, scope } = g.v(
			AssignAssignmentInputModeNearest,
			"assignAssignmentInputModeNearest"
		)
		return r
			.match(AssignAssignmentInputModeNearest, { root, scope })
			.where(
				r.eq(root, r.param("root", AssignAssignmentInputModeNearest.fields.root)),
				r.eq(scope, r.param("scope", AssignAssignmentInputModeNearest.fields.scope))
			)
			.find({ root, scope })
	}),
	assignReadAssignAssignmentInputModeWithin: g.query(assignGraph).rule((r) => {
		const { root, scope, radius } = g.v(
			AssignAssignmentInputModeWithin,
			"assignAssignmentInputModeWithin"
		)
		return r
			.match(AssignAssignmentInputModeWithin, { root, scope, radius })
			.where(
				r.eq(root, r.param("root", AssignAssignmentInputModeWithin.fields.root)),
				r.eq(scope, r.param("scope", AssignAssignmentInputModeWithin.fields.scope))
			)
			.find({ root, scope, radius })
	}),
	assignReadAssignAssignmentInputNear: g.query(assignGraph).rule((r) => {
		const { root, scope, ordinal, value } = g.v(AssignAssignmentInputNear, "part")
		return r
			.match(AssignAssignmentInputNear, { root, scope, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignAssignmentInputNear.fields.root)),
				r.eq(scope, r.param("scope", AssignAssignmentInputNear.fields.scope))
			)
			.find({ root, scope, ordinal, value })
	}),
	assignReadAssignAssignmentInputExclude: g.query(assignGraph).rule((r) => {
		const { root, scope, ordinal, value } = g.v(AssignAssignmentInputExclude, "part")
		return r
			.match(AssignAssignmentInputExclude, { root, scope, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignAssignmentInputExclude.fields.root)),
				r.eq(scope, r.param("scope", AssignAssignmentInputExclude.fields.scope))
			)
			.find({ root, scope, ordinal, value })
	}),
	assignRequestAssignment: g.clocked(
		g.ChangeSet.empty(assignGraph)
			.insert(
				AssignScope,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignScope", {
						root: AssignScope.fields.root,
						scope: AssignScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				AssignAssignmentInput,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignAssignmentInput", {
						root: AssignAssignmentInput.fields.root,
						scope: AssignAssignmentInput.fields.scope,
						learner: AssignAssignmentInput.fields.learner,
						topic: AssignAssignmentInput.fields.topic,
						mode: AssignAssignmentInput.fields.mode
					})
					const { root, scope, learner, topic, mode } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, learner, topic, mode })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, learner, topic, mode })
				})
			)
			.insert(
				AssignAssignmentInputNear,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignAssignmentInputNear", {
						root: AssignAssignmentInputNear.fields.root,
						scope: AssignAssignmentInputNear.fields.scope,
						ordinal: AssignAssignmentInputNear.fields.ordinal,
						value: AssignAssignmentInputNear.fields.value
					})
					const { root, scope, ordinal, value } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, ordinal, value })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, ordinal, value })
				})
			)
			.insert(
				AssignAssignmentInputExclude,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignAssignmentInputExclude", {
						root: AssignAssignmentInputExclude.fields.root,
						scope: AssignAssignmentInputExclude.fields.scope,
						ordinal: AssignAssignmentInputExclude.fields.ordinal,
						value: AssignAssignmentInputExclude.fields.value
					})
					const { root, scope, ordinal, value } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, ordinal, value })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, ordinal, value })
				})
			)
			.insert(
				AssignAssignmentInputModeNearest,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignAssignmentInputModeNearest", {
						root: AssignAssignmentInputModeNearest.fields.root,
						scope: AssignAssignmentInputModeNearest.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				AssignAssignmentInputModeWithin,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignAssignmentInputModeWithin", {
						root: AssignAssignmentInputModeWithin.fields.root,
						scope: AssignAssignmentInputModeWithin.fields.scope,
						radius: AssignAssignmentInputModeWithin.fields.radius
					})
					const { root, scope, radius } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, radius })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, radius })
				})
			)
			.insert(
				AssignRequestedWith,
				g
					.query(assignGraph)
					.rule((r) => {
						const requested = r.relation("assignAssignmentAssignRequestedWith", {
							root: AssignRequestedWith.fields.root,
							fingerprint: AssignRequestedWith.fields.fingerprint,
							input: AssignRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(AssignRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("assignAssignmentAssignRequestedWith", {
							root: AssignRequestedWith.fields.root,
							fingerprint: AssignRequestedWith.fields.fingerprint,
							input: AssignRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(AssignRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(AssignRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				AssignRoot,
				g.query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignScope", {
						root: AssignScope.fields.root,
						scope: AssignScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("assignAssignmentScope", AssignRoot.fields.root)),
							r.not(AssignRoot, { root })
						)
						.find({
							root,
							kind: AssignRootKind.handle("Assignment"),
							key: r.param("assignAssignmentKey", AssignRoot.fields.key),
							at: r.param("denNow", AssignRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignOutputsAssignmentDecide: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		const { confidence, stage } = g.v(AssignDecideOutput, "output")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideOutput, { root, step, confidence, stage })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, confidence, stage })
	}),
	assignOutputsAssignmentDecideWeighed: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		const { ordinal, passage, distance, passed } = g.v(AssignDecideOutputWeighed, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideOutputWeighed, { root, step, ordinal, passage, distance, passed })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, ordinal, passage, distance, passed })
	}),
	assignOutputsAssignmentDecideStageServe: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		const { passage, distance } = g.v(AssignDecideOutputStageServe, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideOutputStageServe, { root, step, passage, distance })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, passage, distance })
	}),
	assignOutputsAssignmentDecideStageRest: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideOutputStageRest, { root, step })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	}),
	assignInputsAssignmentDecide: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		const { learner, topic, vector, mode } = g.v(AssignDecideInput, "input")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideInput, { root, step, learner, topic, vector, mode })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, learner, topic, vector, mode })
	}),
	assignInputsAssignmentDecideExclude: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		const { ordinal, value } = g.v(AssignDecideInputExclude, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideInputExclude, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, ordinal, value })
	}),
	assignInputsAssignmentDecideModeNearest: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideInputModeNearest, { root, step })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	}),
	assignInputsAssignmentDecideModeWithin: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		const { radius } = g.v(AssignDecideInputModeWithin, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignDecideInputModeWithin, { root, step, radius })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, radius })
	}),
	assignFailuresAssignmentDecide: g.query(assignGraph).rule((r) => {
		const { root, step, scope } = g.v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	})
})

export const assignDenWorkload = g.workload(AssignDen, assignDenPrograms)

export const assignCoordinatorPrograms = Object.freeze({
	assignPromote: g.clocked(
		g.ChangeSet.empty(assignCoordination).insert(
			AssignServed,
			g.query(assignCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", AssignServed.fields.environment),
					at: r.param("denNow", AssignServed.fields.at),
					deployment: r.param("deployment", AssignServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignPause: g.ChangeSet.empty(assignCoordination).insert(AssignPaused, []),
	assignResume: g.ChangeSet.empty(assignCoordination).insert(AssignResumed, []),
	assignPauseTurns: g.query(assignCoordination).rule((r) => {
		const { target, turn } = g.v(AssignPaused, "assignPaused")
		return r.match(AssignPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	assignPausedAll: g.query(assignCoordination).rule((r) => {
		const { target, turn } = g.v(AssignPaused, "assignPaused")
		return r
			.match(AssignPaused, { target, turn })
			.where(r.not(AssignResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const assignCoordinatorWorkload = g.workload(AssignCoordinator, assignCoordinatorPrograms)

/** den's retiring role for the flow Assign: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const AssignRetirer = g.role(
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
	assignRetire: g.ChangeSet.empty(assignGraph).deleteWhere({
		AssignScope: { root: g.param("root", AssignRoot.fields.root) },
		AssignAdmitted: { root: g.param("root", AssignRoot.fields.root) },
		AssignSkipped: { root: g.param("root", AssignRoot.fields.root) },
		AssignStep: { root: g.param("root", AssignRoot.fields.root) },
		AssignStartStep: { root: g.param("root", AssignRoot.fields.root) },
		AssignFinish: { root: g.param("root", AssignRoot.fields.root) },
		AssignClaim: { root: g.param("root", AssignRoot.fields.root) },
		AssignEnded: { root: g.param("root", AssignRoot.fields.root) },
		AssignRetry: { root: g.param("root", AssignRoot.fields.root) },
		AssignFenced: { root: g.param("root", AssignRoot.fields.root) },
		AssignResult: { root: g.param("root", AssignRoot.fields.root) },
		AssignDone: { root: g.param("root", AssignRoot.fields.root) },
		AssignFailed: { root: g.param("root", AssignRoot.fields.root) },
		AssignHeld: { root: g.param("root", AssignRoot.fields.root) },
		AssignRefusal: { root: g.param("root", AssignRoot.fields.root) },
		AssignExhausted: { root: g.param("root", AssignRoot.fields.root) },
		AssignEmbedInput: { root: g.param("root", AssignRoot.fields.root) },
		AssignEmbedInputNear: { root: g.param("root", AssignRoot.fields.root) },
		AssignEmbedInputExclude: { root: g.param("root", AssignRoot.fields.root) },
		AssignEmbedInputModeNearest: { root: g.param("root", AssignRoot.fields.root) },
		AssignEmbedInputModeWithin: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideInput: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideInputExclude: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideInputModeNearest: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideInputModeWithin: { root: g.param("root", AssignRoot.fields.root) },
		AssignAssignmentInput: { root: g.param("root", AssignRoot.fields.root) },
		AssignAssignmentInputNear: { root: g.param("root", AssignRoot.fields.root) },
		AssignAssignmentInputExclude: { root: g.param("root", AssignRoot.fields.root) },
		AssignAssignmentInputModeNearest: { root: g.param("root", AssignRoot.fields.root) },
		AssignAssignmentInputModeWithin: { root: g.param("root", AssignRoot.fields.root) },
		AssignEmbedOutput: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideOutput: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideOutputWeighed: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideOutputStageServe: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideOutputStageRest: { root: g.param("root", AssignRoot.fields.root) },
		AssignAssignmentFinishOutput: { root: g.param("root", AssignRoot.fields.root) },
		AssignAsked: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideReadNearest: { root: g.param("root", AssignRoot.fields.root) },
		AssignDecideReadSeen: { root: g.param("root", AssignRoot.fields.root) }
	})
})

export const assignRetirerWorkload = g.workload(AssignRetirer, assignRetirerPrograms)

/** The commits and declared reads of the flow Assign, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const assignCommitPrograms = Object.freeze({
	assignAuthenticated: g.clocked(
		g.query(assignGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignCommitEmbed: g.clocked(
		g.ChangeSet.empty(assignGraph)
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
				g.query(assignGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: AssignStep.fields.step,
						kind: AssignStep.fields.kind,
						scope: AssignStep.fields.scope,
						delay: DenDelay
					})
					const { step, kind, scope, delay } = g.v(steps, "spawned")
					return r.match(steps, { step, kind, scope, delay }).find({
						step,
						kind,
						scope,
						due: g.Type.cast(
							g.Num.add(g.Type.base(r.param("denNow", DenInstant)), g.Type.base(delay)),
							DenInstant,
							denInstantKey
						),
						root: r.param("root", AssignStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignCommitDecide: g.ChangeSet.union(
		g.ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(AssignDecideOutput, [])
			.insert(AssignDecideOutputWeighed, [])
			.insert(AssignDecideOutputStageServe, [])
			.insert(AssignDecideOutputStageRest, [])
			.insert(AssignDecideReadNearest, [])
			.insert(AssignDecideReadSeen, [])
			.insertAll(g.recordsFacts(assignGraph, AssignDecideReadNearestRecords)([]))
			.insertAll(g.recordsFacts(assignGraph, AssignDecideReadSeenRecords)([])),
		declaredFlow.kinds[1].writes.changes(Loader)
	),
	assignReadDecide: g.query(Loader).reads(declaredFlow.kinds[1].reads.named),
	assignCommitAssignmentFinish: g.ChangeSet.union(
		g.ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(AssignAssignmentFinishOutput, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	)
})

export const assignCommits = g.workload(Loader, assignCommitPrograms)
