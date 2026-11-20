import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Review to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
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
	ReviewKind,
	ReviewRootKind,
	ReviewChildKind,
	ReviewOutcome,
	ReviewPausable,
	ReviewScope,
	ReviewRoot,
	ReviewWithin,
	ReviewAdmitted,
	ReviewSkipped,
	ReviewStep,
	ReviewStartStep,
	ReviewStartScope,
	ReviewFinish,
	ReviewClaim,
	ReviewEnded,
	ReviewRetry,
	ReviewFenced,
	ReviewResult,
	ReviewDone,
	ReviewFailed,
	ReviewHeld,
	ReviewRefusal,
	ReviewExhausted,
	ReviewAnalyzeInput,
	ReviewGatherInput,
	ReviewGatherInputSizes,
	ReviewSaveInput,
	ReviewQuestionsInput,
	ReviewReviewRunInput,
	ReviewReviewRunInputSizes,
	ReviewAnalyzeOutput,
	ReviewGatherOutput,
	ReviewSaveOutput,
	ReviewQuestionsFinishOutput,
	ReviewReviewRunFinishOutput,
	ReviewSplit,
	ReviewSaved,
	ReviewPaused,
	ReviewResumed,
	reviewGraph,
	reviewCoordination
} from "#integration/slice/generated/review.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Review: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ReviewDen = role(
	App,
	"review_den",
	{ ...reviewGraph.relations, ReviewPaused, ReviewResumed },
	{
		insert: [
			"ReviewScope",
			"ReviewRoot",
			"ReviewWithin",
			"ReviewAdmitted",
			"ReviewSkipped",
			"ReviewStep",
			"ReviewStartStep",
			"ReviewStartScope",
			"ReviewFinish",
			"ReviewClaim",
			"ReviewEnded",
			"ReviewRetry",
			"ReviewFenced",
			"ReviewResult",
			"ReviewDone",
			"ReviewFailed",
			"ReviewHeld",
			"ReviewRefusal",
			"ReviewExhausted",
			"ReviewAnalyzeInput",
			"ReviewGatherInput",
			"ReviewGatherInputSizes",
			"ReviewSaveInput",
			"ReviewQuestionsInput",
			"ReviewReviewRunInput",
			"ReviewReviewRunInputSizes",
			"ReviewQuestionsFinishOutput",
			"ReviewReviewRunFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Review: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const ReviewCoordinator = role(
	App,
	"review_coordinator",
	{
		ReviewKind,
		ReviewRootKind,
		ReviewChildKind,
		ReviewOutcome,
		ReviewPausable,
		ReviewPaused,
		ReviewResumed
	},
	{ insert: ["ReviewPaused", "ReviewResumed"] }
)

const reviewPendingRead = query(ReviewDen).rule((r) => {
	const { step, kind, scope, due } = v(ReviewStep, "step")
	return r
		.match(ReviewStep, { step, kind, scope, due })
		.where(r.not(ReviewResult, { step }))
		.find({ step, kind, scope, due })
})

const reviewRequestedRead = query(ReviewDen).rule((r) => {
	const { scope } = v(ReviewRoot, "root")
	return r
		.match(ReviewRoot, { scope })
		.match(ReviewScope, { scope })
		.where(r.not(ReviewAdmitted, { scope }), r.not(ReviewSkipped, { scope }))
		.find({ scope })
})

const reviewRunningRead = query(ReviewDen).rule((r) => {
	const { scope, step } = v(ReviewFinish, "finish")
	return r.match(ReviewFinish, { scope, step }).where(r.not(ReviewResult, { step })).find({ scope })
})

export const reviewDenPrograms = Object.freeze({
	reviewNow: clocked(
		query(reviewGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	reviewClaim: clocked(
		ChangeSet.empty(reviewGraph)
			.insertComputed(ReviewClaim, [], {
				until: Compute.cast(
					Compute.add(
						Compute.base(param("now", DenInstant)),
						Compute.base(param("budget", DenDelay))
					),
					DenInstant
				)
			})
			.insert(ReviewEnded, [])
			.read("held", (delta) =>
				query(reviewGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(ReviewClaim), "added")
					return r
						.match(delta.added(ReviewClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ now: "millis" }
	),
	reviewRetry: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewEnded, [])
			.insert(
				ReviewRetry,
				query(reviewGraph).rule((r) =>
					r.find({
						step: r.param("step", ReviewRetry.fields.step),
						attempt: r.param("attempt", ReviewRetry.fields.attempt),
						at: Compute.cast(
							Compute.add(
								Compute.base(r.param("now", DenInstant)),
								Compute.base(r.param("delay", DenDelay))
							),
							DenInstant
						),
						spent: r.param("spent", ReviewRetry.fields.spent),
						root: r.param("root", ReviewRetry.fields.root)
					})
				)
			),
		{ now: "millis" }
	),
	reviewFence: ChangeSet.empty(reviewGraph).insert(ReviewEnded, []).insert(ReviewFenced, []),
	reviewRefuse: ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewFailed, [])
		.insert(ReviewHeld, [])
		.insert(ReviewRefusal, []),
	reviewExhaust: ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewFailed, [])
		.insert(ReviewHeld, [])
		.insert(ReviewExhausted, []),
	reviewAdmit: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewAdmitted, [])
			.insert(ReviewFinish, [])
			.insert(ReviewStartStep, [])
			.insert(ReviewScope, [])
			.insert(ReviewWithin, [])
			.insert(ReviewStartScope, [])
			.insert(ReviewAnalyzeInput, [])
			.insert(ReviewGatherInput, [])
			.insert(ReviewGatherInputSizes, [])
			.insert(ReviewSaveInput, [])
			.insert(ReviewQuestionsInput, [])
			.insert(
				ReviewStep,
				query(reviewGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ReviewStep.fields.step,
						kind: ReviewStep.fields.kind,
						scope: ReviewStep.fields.scope,
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
						root: r.param("root", ReviewStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	reviewSkip: ChangeSet.empty(reviewGraph).insert(ReviewSkipped, []),
	reviewSkippedOf: query(reviewGraph).rule((r) => {
		const { scope, by, root } = v(ReviewSkipped, "reviewSkipped")
		return r
			.match(ReviewSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", ReviewSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	reviewStepOf: query(reviewGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(ReviewStep, "reviewStep")
		return r
			.match(ReviewStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", ReviewStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	reviewResultOf: query(reviewGraph).rule((r) => {
		const { step, outcome, root } = v(ReviewResult, "reviewResult")
		return r
			.match(ReviewResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", ReviewResult.fields.step)))
			.find({ step, outcome, root })
	}),
	reviewHeldOf: query(reviewGraph).rule((r) => {
		const { step, attempt, root } = v(ReviewHeld, "reviewHeld")
		return r
			.match(ReviewHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", ReviewHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	reviewWithinOf: query(reviewGraph).rule((r) => {
		const { scope, parent, kind, root } = v(ReviewWithin, "reviewWithin")
		return r
			.match(ReviewWithin, { scope, parent, kind, root })
			.where(r.eq(scope, r.param("scope", ReviewWithin.fields.scope)))
			.find({ scope, parent, kind, root })
	}),
	reviewAdmittedOf: query(reviewGraph).rule((r) => {
		const { scope, root } = v(ReviewAdmitted, "reviewAdmitted")
		return r
			.match(ReviewAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", ReviewAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	reviewRootOf: query(reviewGraph).rule((r) => {
		const { scope, kind, key, at } = v(ReviewRoot, "reviewRoot")
		return r
			.match(ReviewRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", ReviewRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	reviewFinishedRoots: deferrable(
		query(reviewGraph)
			.rule((r) => {
				const { scope } = v(ReviewRoot, "root")
				const { step } = v(ReviewFinish, "finish")
				return r
					.match(ReviewRoot, { scope })
					.match(ReviewFinish, { scope, step })
					.match(ReviewResult, { step })
					.find({ scope })
			})
			.rule((r) => {
				const { scope } = v(ReviewRoot, "root")
				return r.match(ReviewRoot, { scope }).match(ReviewSkipped, { scope }).find({ scope })
			})
	),
	reviewClaimsOf: query(reviewGraph).rule((r) => {
		const { step, attempt, until } = v(ReviewClaim, "claim")
		return r
			.match(ReviewClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", ReviewStep.fields.step)))
			.find({ step, attempt, until })
	}),
	reviewRetriesOf: query(reviewGraph).rule((r) => {
		const { step, attempt, at, spent } = v(ReviewRetry, "retry")
		return r
			.match(ReviewRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", ReviewStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	reviewFencedOf: query(reviewGraph).rule((r) => {
		const { step, attempt } = v(ReviewFenced, "fenced")
		return r
			.match(ReviewFenced, { step, attempt })
			.where(r.eq(step, r.param("step", ReviewStep.fields.step)))
			.find({ step, attempt })
	}),
	reviewUnendedSteps: query(reviewGraph).rule((r) => {
		const { step, scope } = v(ReviewStep, "step")
		return r
			.match(ReviewStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", ReviewScope.fields.scope)),
				r.not(ReviewResult, { step }),
				r.not(ReviewFinish, { scope, step })
			)
			.find({ step })
	}),
	reviewOpenChildren: query(reviewGraph).rule((r) => {
		const { scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
		return r
			.match(ReviewWithin, { scope, parent })
			.match(ReviewFinish, { scope, step })
			.where(
				r.eq(parent, r.param("scope", ReviewScope.fields.scope)),
				r.not(ReviewResult, { step })
			)
			.find({ child: scope })
	}),
	reviewFinished: query(reviewGraph).rule((r) => {
		const { scope, step } = v(ReviewFinish, "finish")
		return r
			.match(ReviewFinish, { scope, step })
			.match(ReviewResult, { step })
			.where(r.eq(scope, r.param("scope", ReviewScope.fields.scope)))
			.find({ step })
	}),
	reviewPending: deferrable(reviewPendingRead),
	reviewRequested: deferrable(reviewRequestedRead),
	reviewRunning: deferrable(reviewRunningRead),
	reviewSnapshot: deferrable(
		query(ReviewDen).reads({
			steps: reviewPendingRead,
			claims: query(ReviewDen).rule((r) => {
				const { step, attempt, until } = v(ReviewClaim, "claim")
				return r
					.match(ReviewClaim, { step, attempt, until })
					.where(r.not(ReviewResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(ReviewDen).rule((r) => {
				const { step, attempt, at, spent } = v(ReviewRetry, "retry")
				return r
					.match(ReviewRetry, { step, attempt, at, spent })
					.where(r.not(ReviewResult, { step }))
					.find({ step, attempt, at, spent })
			}),
			fenced: query(ReviewDen).rule((r) => {
				const { step, attempt } = v(ReviewFenced, "fenced")
				return r
					.match(ReviewFenced, { step, attempt })
					.where(r.not(ReviewResult, { step }))
					.find({ step, attempt })
			}),
			requested: reviewRequestedRead,
			running: reviewRunningRead,
			withins: query(ReviewDen).rule((r) => {
				const { scope, parent, kind } = v(ReviewWithin, "reviewWithin")
				return r.match(ReviewWithin, { scope, parent, kind }).find({ scope, parent, kind })
			}),
			roots: query(ReviewDen).rule((r) => {
				const { scope, kind, key, at } = v(ReviewRoot, "reviewRoot")
				return r.match(ReviewRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			paused: query(ReviewDen).rule((r) => {
				const { target, turn } = v(ReviewPaused, "reviewPaused")
				return r
					.match(ReviewPaused, { target, turn })
					.where(r.not(ReviewResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	reviewReadReviewAnalyzeInput: query(reviewGraph).rule((r) => {
		const { step, review, group, question, root } = v(ReviewAnalyzeInput, "reviewAnalyzeInput")
		return r
			.match(ReviewAnalyzeInput, { step, review, group, question, root })
			.where(r.eq(step, r.param("step", ReviewAnalyzeInput.fields.step)))
			.find({ step, review, group, question, root })
	}),
	reviewReadReviewGatherInput: query(reviewGraph).rule((r) => {
		const { step, review, root } = v(ReviewGatherInput, "reviewGatherInput")
		return r
			.match(ReviewGatherInput, { step, review, root })
			.where(r.eq(step, r.param("step", ReviewGatherInput.fields.step)))
			.find({ step, review, root })
	}),
	reviewReadReviewGatherInputSizes: query(reviewGraph).rule((r) => {
		const { step, ordinal, value } = v(ReviewGatherInputSizes, "part")
		return r
			.match(ReviewGatherInputSizes, { step, ordinal, value })
			.where(r.eq(step, r.param("step", ReviewGatherInputSizes.fields.step)))
			.find({ step, ordinal, value })
	}),
	reviewReadReviewSaveInput: query(reviewGraph).rule((r) => {
		const { step, review, group, count, total, root } = v(ReviewSaveInput, "reviewSaveInput")
		return r
			.match(ReviewSaveInput, { step, review, group, count, total, root })
			.where(r.eq(step, r.param("step", ReviewSaveInput.fields.step)))
			.find({ step, review, group, count, total, root })
	}),
	reviewReadReviewQuestionsInput: query(reviewGraph).rule((r) => {
		const { scope, review, group, size, root } = v(ReviewQuestionsInput, "reviewQuestionsInput")
		return r
			.match(ReviewQuestionsInput, { scope, review, group, size, root })
			.where(r.eq(scope, r.param("scope", ReviewQuestionsInput.fields.scope)))
			.find({ scope, review, group, size, root })
	}),
	reviewOutputsQuestionsAnalyze: query(reviewGraph).rule((r) => {
		const { step, scope } = v(ReviewStep, "step")
		const { score } = v(ReviewAnalyzeOutput, "output")
		return r
			.match(ReviewStep, { step, kind: "Analyze", scope })
			.match(ReviewAnalyzeOutput, { step, score })
			.where(r.eq(scope, r.param("scope", ReviewScope.fields.scope)))
			.find({ step, score })
	}),
	reviewFailuresQuestionsAnalyze: query(reviewGraph).rule((r) => {
		const { step, scope } = v(ReviewStep, "step")
		return r
			.match(ReviewStep, { step, kind: "Analyze", scope })
			.match(ReviewResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", ReviewScope.fields.scope)))
			.find({ step })
	}),
	reviewReadReviewReviewRunInput: query(reviewGraph).rule((r) => {
		const { scope, review, root } = v(ReviewReviewRunInput, "reviewReviewRunInput")
		return r
			.match(ReviewReviewRunInput, { scope, review, root })
			.where(r.eq(scope, r.param("scope", ReviewReviewRunInput.fields.scope)))
			.find({ scope, review, root })
	}),
	reviewReadReviewReviewRunInputSizes: query(reviewGraph).rule((r) => {
		const { scope, ordinal, value } = v(ReviewReviewRunInputSizes, "part")
		return r
			.match(ReviewReviewRunInputSizes, { scope, ordinal, value })
			.where(r.eq(scope, r.param("scope", ReviewReviewRunInputSizes.fields.scope)))
			.find({ scope, ordinal, value })
	}),
	reviewRequestReviewRun: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewScope, [])
			.insert(ReviewReviewRunInput, [])
			.insert(ReviewReviewRunInputSizes, [])
			.insert(
				ReviewRoot,
				query(reviewGraph).rule((r) =>
					r.find({
						scope: r.param("reviewReviewRunScope", ReviewRoot.fields.scope),
						kind: ReviewRootKind.handle("ReviewRun"),
						key: r.param("reviewReviewRunKey", ReviewRoot.fields.key),
						at: r.param("now", ReviewRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	reviewOutputsReviewRunQuestions: query(reviewGraph).rule((r) => {
		const { scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
		const { count, total } = v(ReviewQuestionsFinishOutput, "output")
		return r
			.match(ReviewWithin, { scope, parent, kind: "Questions" })
			.match(ReviewFinish, { scope, step })
			.match(ReviewQuestionsFinishOutput, { step, count, total })
			.where(r.eq(parent, r.param("scope", ReviewScope.fields.scope)))
			.find({ step, count, total })
	}),
	reviewFailuresReviewRunQuestions: query(reviewGraph).rule((r) => {
		const { scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
		return r
			.match(ReviewWithin, { scope, parent, kind: "Questions" })
			.match(ReviewFinish, { scope, step })
			.match(ReviewResult, { step, outcome: "failed" })
			.where(r.eq(parent, r.param("scope", ReviewScope.fields.scope)))
			.find({ step })
	}),
	reviewOutputsReviewRunSave: query(reviewGraph).rule((r) => {
		const { step, scope } = v(ReviewStep, "step")
		const { total } = v(ReviewSaveOutput, "output")
		return r
			.match(ReviewStep, { step, kind: "Save", scope })
			.match(ReviewSaveOutput, { step, total })
			.where(r.eq(scope, r.param("scope", ReviewScope.fields.scope)))
			.find({ step, total })
	}),
	reviewFailuresReviewRunSave: query(reviewGraph).rule((r) => {
		const { step, scope } = v(ReviewStep, "step")
		return r
			.match(ReviewStep, { step, kind: "Save", scope })
			.match(ReviewResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", ReviewScope.fields.scope)))
			.find({ step })
	})
})

export const reviewDenWorkload = workload(ReviewDen, reviewDenPrograms)

export const reviewCoordinatorPrograms = Object.freeze({
	reviewPause: ChangeSet.empty(reviewCoordination).insert(ReviewPaused, []),
	reviewResume: ChangeSet.empty(reviewCoordination).insert(ReviewResumed, []),
	reviewPauseTurns: deferrable(
		query(reviewCoordination).rule((r) => {
			const { target, turn } = v(ReviewPaused, "reviewPaused")
			return r.match(ReviewPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	reviewPausedAll: deferrable(
		query(reviewCoordination).rule((r) => {
			const { target, turn } = v(ReviewPaused, "reviewPaused")
			return r
				.match(ReviewPaused, { target, turn })
				.where(r.not(ReviewResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const reviewCoordinatorWorkload = workload(ReviewCoordinator, reviewCoordinatorPrograms)

/** den's retiring role for the flow Review: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const ReviewRetirer = role(
	App,
	"review_retirer",
	{ ...reviewGraph.relations },
	{ retire: ["ReviewRoot"] }
)

export const reviewRetirerPrograms = Object.freeze({
	reviewRetire: ChangeSet.empty(reviewGraph).retire(ReviewRoot, [])
})

export const reviewRetirerWorkload = workload(ReviewRetirer, reviewRetirerPrograms)

/** The commits and declared reads of the flow Review, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const reviewCommitPrograms = Object.freeze({
	reviewAuthenticated: clocked(
		query(reviewGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	reviewCommitAnalyze: ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewDone, [])
		.insert(ReviewHeld, [])
		.insert(ReviewAnalyzeOutput, []),
	reviewCommitGather: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(ReviewGatherOutput, [])
			.insert(ReviewScope, [])
			.insert(ReviewWithin, [])
			.insert(ReviewAdmitted, [])
			.insert(ReviewFinish, [])
			.insert(ReviewStartStep, [])
			.insert(ReviewStartScope, [])
			.insert(ReviewAnalyzeInput, [])
			.insert(ReviewGatherInput, [])
			.insert(ReviewGatherInputSizes, [])
			.insert(ReviewSaveInput, [])
			.insert(ReviewQuestionsInput, [])
			.insert(ReviewSplit, [])
			.insert(ReviewSaved, [])
			.insert(
				ReviewStep,
				query(reviewGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ReviewStep.fields.step,
						kind: ReviewStep.fields.kind,
						scope: ReviewStep.fields.scope,
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
						root: r.param("root", ReviewStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	reviewCommitSave: ChangeSet.union(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(ReviewSaveOutput, []),
		ChangeSet.empty(Loader).insert(App.relations.Reviewed, [])
	),
	reviewCommitQuestionsFinish: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(ReviewQuestionsFinishOutput, [])
			.insert(ReviewScope, [])
			.insert(ReviewWithin, [])
			.insert(ReviewAdmitted, [])
			.insert(ReviewFinish, [])
			.insert(ReviewStartStep, [])
			.insert(ReviewStartScope, [])
			.insert(ReviewAnalyzeInput, [])
			.insert(ReviewGatherInput, [])
			.insert(ReviewGatherInputSizes, [])
			.insert(ReviewSaveInput, [])
			.insert(ReviewQuestionsInput, [])
			.insert(ReviewSplit, [])
			.insert(ReviewSaved, [])
			.insert(
				ReviewStep,
				query(reviewGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ReviewStep.fields.step,
						kind: ReviewStep.fields.kind,
						scope: ReviewStep.fields.scope,
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
						root: r.param("root", ReviewStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	reviewCommitReviewRunFinish: ChangeSet.union(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(ReviewReviewRunFinishOutput, []),
		ChangeSet.empty(Loader).insert(App.relations.Summary, [])
	)
})

export const reviewCommits = workload(Loader, reviewCommitPrograms)
