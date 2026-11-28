import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Review to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import * as g from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { review as declaredFlow } from "#integration/slice/flows.ts"
import {
	ReviewKind,
	ReviewRootKind,
	ReviewChildKind,
	ReviewOutcome,
	ReviewRetryWhy,
	ReviewPausable,
	ReviewResource,
	ReviewScope,
	ReviewRoot,
	ReviewRequestedWith,
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
	ReviewServed,
	reviewGraph,
	reviewCoordination
} from "#integration/slice/generated/review.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Review: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains, live holds and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ReviewDen = g.role(
	App,
	"review_den",
	{
		...reviewGraph.relations,
		ReviewPaused,
		ReviewResumed,
		ReviewServed,
		ReviewLive: g.query(App).rule((r) => {
			const { resource, seat, step, root, attempt, until } = g.v(App.relations.ReviewLive, "live")
			return r
				.match(App.relations.ReviewLive, { resource, seat, step, root, attempt, until })
				.find({ resource, seat, step, root, attempt, until })
		}),
		Delivered: App.relations.Delivered
	},
	{
		insert: [
			"ReviewScope",
			"ReviewRoot",
			"ReviewRequestedWith",
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
			"ReviewReviewRunFinishOutput",
			"ReviewHold"
		]
	}
)

/** den's coordinator role for the flow Review: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const ReviewCoordinator = g.role(
	App,
	"review_coordinator",
	{
		ReviewKind,
		ReviewRootKind,
		ReviewChildKind,
		ReviewOutcome,
		ReviewRetryWhy,
		ReviewPausable,
		ReviewResource,
		ReviewPaused,
		ReviewResumed,
		ReviewServed
	},
	{ insert: ["ReviewPaused", "ReviewResumed", "ReviewServed"] }
)

const reviewPendingRead = g.query(ReviewDen).rule((r) => {
	const { root, step, kind, scope, due } = g.v(ReviewStep, "step")
	return r
		.match(ReviewStep, { root, step, kind, scope, due })
		.where(r.not(ReviewResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const reviewRequestedRead = g.query(ReviewDen).rule((r) => {
	const { scope } = g.v(ReviewScope, "scope")
	return r
		.match(ReviewRoot, { root: scope })
		.match(ReviewScope, { root: scope, scope })
		.where(
			r.not(ReviewAdmitted, { root: scope, scope }),
			r.not(ReviewSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const reviewRunningRead = g.query(ReviewDen).rule((r) => {
	const { root, scope, step } = g.v(ReviewFinish, "finish")
	return r
		.match(ReviewFinish, { root, scope, step })
		.where(r.not(ReviewResult, { root, step }))
		.find({ scope })
})

const reviewLatestServed = g.query(ReviewDen).rule((r) => {
	const { environment, at } = g.v(ReviewServed, "served")
	return r
		.match(ReviewServed, { environment, at })
		.where(r.eq(environment, r.param("environment", ReviewServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const reviewDenPrograms = Object.freeze({
	reviewNow: g.clocked(
		g.query(reviewGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewReading: g.clocked(
		g.query(ReviewDen).reads({
			now: g.query(reviewGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: g.query(ReviewDen).rule((r) => {
				const { environment, at, deployment } = g.v(ReviewServed, "served")
				return r
					.match(
						reviewLatestServed.bind({
							environment: r.param("environment", ReviewServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(ReviewServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	reviewClaim: g.clocked(
		g.ChangeSet.empty(reviewGraph)
			.insertAllComputed(
				{ ReviewClaim: [] },
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
			.insert(ReviewEnded, [])
			.read("held", (delta) =>
				g.query(reviewGraph).rule((r) => {
					const { step, root, attempt } = g.v(delta.added(ReviewClaim), "added")
					return r
						.match(delta.added(ReviewClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewRetry: g.clocked(
		g.ChangeSet.empty(reviewGraph)
			.insert(ReviewEnded, [])
			.insert(
				ReviewRetry,
				g.query(reviewGraph).rule((r) =>
					r.find({
						step: r.param("step", ReviewRetry.fields.step),
						attempt: r.param("attempt", ReviewRetry.fields.attempt),
						at: g.Type.cast(
							g.Num.add(
								g.Type.base(r.param("denNow", DenInstant)),
								g.Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", ReviewRetry.fields.why),
						root: r.param("root", ReviewRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewFence: g.ChangeSet.empty(reviewGraph).insert(ReviewEnded, []).insert(ReviewFenced, []),
	reviewHolds: g.query(ReviewDen).rule((r) => {
		const { resource, seat, step, root, attempt, until } = g.v(
			ReviewDen.relations.ReviewLive,
			"live"
		)
		return r
			.match(ReviewDen.relations.ReviewLive, { resource, seat, step, root, attempt, until })
			.find({ resource, seat, step, root, attempt, until })
	}),
	reviewRefuse: g.ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewFailed, [])
		.insert(ReviewHeld, [])
		.insert(ReviewRefusal, []),
	reviewExhaust: g.ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewFailed, [])
		.insert(ReviewHeld, [])
		.insert(ReviewExhausted, []),
	reviewAdmit: g.clocked(
		g.ChangeSet.empty(reviewGraph)
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
				g.query(reviewGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ReviewStep.fields.step,
						kind: ReviewStep.fields.kind,
						scope: ReviewStep.fields.scope,
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
						root: r.param("root", ReviewStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewSkip: g.ChangeSet.empty(reviewGraph).insert(ReviewSkipped, []),
	reviewSkippedOf: g.query(reviewGraph).rule((r) => {
		const { root, scope, by } = g.v(ReviewSkipped, "reviewSkipped")
		return r
			.match(ReviewSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", ReviewSkipped.fields.root)),
				r.eq(scope, r.param("scope", ReviewSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	reviewStepOf: g.query(reviewGraph).rule((r) => {
		const { root, step, kind, scope, due } = g.v(ReviewStep, "reviewStep")
		return r
			.match(ReviewStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", ReviewStep.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	reviewResultOf: g.query(reviewGraph).rule((r) => {
		const { root, step, outcome } = g.v(ReviewResult, "reviewResult")
		return r
			.match(ReviewResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", ReviewResult.fields.root)),
				r.eq(step, r.param("step", ReviewResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	reviewHeldOf: g.query(reviewGraph).rule((r) => {
		const { root, step, attempt } = g.v(ReviewHeld, "reviewHeld")
		return r
			.match(ReviewHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ReviewHeld.fields.root)),
				r.eq(step, r.param("step", ReviewHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	reviewWithinOf: g.query(reviewGraph).rule((r) => {
		const { root, scope, parent, kind } = g.v(ReviewWithin, "reviewWithin")
		return r
			.match(ReviewWithin, { root, scope, parent, kind })
			.where(
				r.eq(root, r.param("root", ReviewWithin.fields.root)),
				r.eq(scope, r.param("scope", ReviewWithin.fields.scope))
			)
			.find({ root, scope, parent, kind })
	}),
	reviewAdmittedOf: g.query(reviewGraph).rule((r) => {
		const { root, scope } = g.v(ReviewAdmitted, "reviewAdmitted")
		return r
			.match(ReviewAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", ReviewAdmitted.fields.root)),
				r.eq(scope, r.param("scope", ReviewAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	reviewRootOf: g.query(reviewGraph).rule((r) => {
		const { kind, key, at } = g.v(ReviewRoot, "root")
		const { scope } = g.v(ReviewScope, "scope")
		return r
			.match(ReviewRoot, { root: scope, kind, key, at })
			.match(ReviewScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", ReviewRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	reviewFinishedRoots: g
		.query(reviewGraph)
		.rule((r) => {
			const { scope, step } = g.v(ReviewFinish, "finish")
			return r
				.match(ReviewFinish, { root: scope, scope, step })
				.match(ReviewResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = g.v(ReviewSkipped, "skipped")
			return r.match(ReviewSkipped, { root: scope, scope }).find({ scope })
		}),
	reviewClaimsOf: g.query(reviewGraph).rule((r) => {
		const { root, step, attempt, until } = g.v(ReviewClaim, "claim")
		return r
			.match(ReviewClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	reviewRetriesOf: g.query(reviewGraph).rule((r) => {
		const { root, step, attempt, at, why } = g.v(ReviewRetry, "retry")
		return r
			.match(ReviewRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	reviewFencedOf: g.query(reviewGraph).rule((r) => {
		const { root, step, attempt } = g.v(ReviewFenced, "fenced")
		return r
			.match(ReviewFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ step, attempt })
	}),
	reviewUnendedSteps: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		return r
			.match(ReviewStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope)),
				r.not(ReviewResult, { root, step }),
				r.not(ReviewFinish, { root, scope, step })
			)
			.find({ step })
	}),
	reviewOpenChildren: g.query(reviewGraph).rule((r) => {
		const { root, scope, parent } = g.v(ReviewWithin, "within")
		const { step } = g.v(ReviewFinish, "finish")
		return r
			.match(ReviewWithin, { root, scope, parent })
			.match(ReviewFinish, { root, scope, step })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(parent, r.param("scope", ReviewScope.fields.scope)),
				r.not(ReviewResult, { root, step })
			)
			.find({ child: scope })
	}),
	reviewFinished: g.query(reviewGraph).rule((r) => {
		const { root, scope, step } = g.v(ReviewFinish, "finish")
		return r
			.match(ReviewFinish, { root, scope, step })
			.match(ReviewResult, { root, step })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step })
	}),
	reviewPending: reviewPendingRead,
	reviewRequested: reviewRequestedRead,
	reviewRunning: reviewRunningRead,
	reviewSnapshot: g.query(ReviewDen).reads({
		steps: reviewPendingRead,
		claims: g.query(ReviewDen).rule((r) => {
			const { root, step, attempt, until } = g.v(ReviewClaim, "claim")
			return r
				.match(ReviewClaim, { root, step, attempt, until })
				.where(r.not(ReviewResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: g.query(ReviewDen).rule((r) => {
			const { root, step, attempt, at, why } = g.v(ReviewRetry, "retry")
			return r
				.match(ReviewRetry, { root, step, attempt, at, why })
				.where(r.not(ReviewResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: g.query(ReviewDen).rule((r) => {
			const { root, step, attempt } = g.v(ReviewFenced, "fenced")
			return r
				.match(ReviewFenced, { root, step, attempt })
				.where(r.not(ReviewResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: reviewRequestedRead,
		running: reviewRunningRead,
		withins: g.query(ReviewDen).rule((r) => {
			const { scope, parent, kind } = g.v(ReviewWithin, "reviewWithin")
			return r.match(ReviewWithin, { scope, parent, kind }).find({ scope, parent, kind })
		}),
		roots: g.query(ReviewDen).rule((r) => {
			const { kind, key, at } = g.v(ReviewRoot, "root")
			const { scope } = g.v(ReviewScope, "scope")
			return r
				.match(ReviewRoot, { root: scope, kind, key, at })
				.match(ReviewScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		holds: g.query(ReviewDen).rule((r) => {
			const { resource, seat, step, root, attempt, until } = g.v(
				ReviewDen.relations.ReviewLive,
				"live"
			)
			return r
				.match(ReviewDen.relations.ReviewLive, { resource, seat, step, root, attempt, until })
				.find({ resource, seat, step, root, attempt, until })
		}),
		paused: g.query(ReviewDen).rule((r) => {
			const { target, turn } = g.v(ReviewPaused, "reviewPaused")
			return r
				.match(ReviewPaused, { target, turn })
				.where(r.not(ReviewResumed, { target, turn }))
				.find({ target, turn })
		}),
		awaiting: g.query(ReviewDen).rule((r) => {
			const { root, step, review } = g.v(ReviewGatherInput, "input")
			return r
				.match(ReviewGatherInput, { root, step, review })
				.where(
					r.not(ReviewResult, { root, step }),
					r.not(App.relations.Delivered, { attempt: review })
				)
				.find({ root, step })
		})
	}),
	reviewAwaitingOf: g.query(ReviewDen).rule((r) => {
		const { root, step, review } = g.v(ReviewGatherInput, "input")
		return r
			.match(ReviewGatherInput, { root, step, review })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step)),
				r.not(ReviewResult, { root, step }),
				r.not(App.relations.Delivered, { attempt: review })
			)
			.find({ root, step })
	}),
	reviewReady: g.query(ReviewDen).rule((r) => {
		const { root, step, review } = g.v(ReviewGatherInput, "input")
		return r
			.match(ReviewGatherInput, { root, step, review })
			.match(App.relations.Delivered, { attempt: review })
			.where(r.not(ReviewResult, { root, step }), r.not(ReviewClaim, { root, step }))
			.find({ root, step })
	}),
	reviewReadReviewAnalyzeInput: g.query(reviewGraph).rule((r) => {
		const { root, step, review, group, question } = g.v(ReviewAnalyzeInput, "reviewAnalyzeInput")
		return r
			.match(ReviewAnalyzeInput, { root, step, review, group, question })
			.where(
				r.eq(root, r.param("root", ReviewAnalyzeInput.fields.root)),
				r.eq(step, r.param("step", ReviewAnalyzeInput.fields.step))
			)
			.find({ root, step, review, group, question })
	}),
	reviewReadReviewGatherInput: g.query(reviewGraph).rule((r) => {
		const { root, step, review } = g.v(ReviewGatherInput, "reviewGatherInput")
		return r
			.match(ReviewGatherInput, { root, step, review })
			.where(
				r.eq(root, r.param("root", ReviewGatherInput.fields.root)),
				r.eq(step, r.param("step", ReviewGatherInput.fields.step))
			)
			.find({ root, step, review })
	}),
	reviewReadReviewGatherInputSizes: g.query(reviewGraph).rule((r) => {
		const { root, step, ordinal, value } = g.v(ReviewGatherInputSizes, "part")
		return r
			.match(ReviewGatherInputSizes, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", ReviewGatherInputSizes.fields.root)),
				r.eq(step, r.param("step", ReviewGatherInputSizes.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	reviewReadReviewSaveInput: g.query(reviewGraph).rule((r) => {
		const { root, step, review, group, count, total } = g.v(ReviewSaveInput, "reviewSaveInput")
		return r
			.match(ReviewSaveInput, { root, step, review, group, count, total })
			.where(
				r.eq(root, r.param("root", ReviewSaveInput.fields.root)),
				r.eq(step, r.param("step", ReviewSaveInput.fields.step))
			)
			.find({ root, step, review, group, count, total })
	}),
	reviewReadReviewQuestionsInput: g.query(reviewGraph).rule((r) => {
		const { root, scope, review, group, size } = g.v(ReviewQuestionsInput, "reviewQuestionsInput")
		return r
			.match(ReviewQuestionsInput, { root, scope, review, group, size })
			.where(
				r.eq(root, r.param("root", ReviewQuestionsInput.fields.root)),
				r.eq(scope, r.param("scope", ReviewQuestionsInput.fields.scope))
			)
			.find({ root, scope, review, group, size })
	}),
	reviewOutputsQuestionsAnalyze: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		const { score } = g.v(ReviewAnalyzeOutput, "output")
		return r
			.match(ReviewStep, { root, step, kind: "Analyze", scope })
			.match(ReviewAnalyzeOutput, { root, step, score })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, score })
	}),
	reviewInputsQuestionsAnalyze: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		const { review, group, question } = g.v(ReviewAnalyzeInput, "input")
		return r
			.match(ReviewStep, { root, step, kind: "Analyze", scope })
			.match(ReviewAnalyzeInput, { root, step, review, group, question })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, review, group, question })
	}),
	reviewFailuresQuestionsAnalyze: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		return r
			.match(ReviewStep, { root, step, kind: "Analyze", scope })
			.match(ReviewResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step })
	}),
	reviewReadReviewReviewRunInput: g.query(reviewGraph).rule((r) => {
		const { root, scope, review } = g.v(ReviewReviewRunInput, "reviewReviewRunInput")
		return r
			.match(ReviewReviewRunInput, { root, scope, review })
			.where(
				r.eq(root, r.param("root", ReviewReviewRunInput.fields.root)),
				r.eq(scope, r.param("scope", ReviewReviewRunInput.fields.scope))
			)
			.find({ root, scope, review })
	}),
	reviewReadReviewReviewRunInputSizes: g.query(reviewGraph).rule((r) => {
		const { root, scope, ordinal, value } = g.v(ReviewReviewRunInputSizes, "part")
		return r
			.match(ReviewReviewRunInputSizes, { root, scope, ordinal, value })
			.where(
				r.eq(root, r.param("root", ReviewReviewRunInputSizes.fields.root)),
				r.eq(scope, r.param("scope", ReviewReviewRunInputSizes.fields.scope))
			)
			.find({ root, scope, ordinal, value })
	}),
	reviewRequestReviewRun: g.clocked(
		g.ChangeSet.empty(reviewGraph)
			.insert(
				ReviewScope,
				g.query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunReviewScope", {
						root: ReviewScope.fields.root,
						scope: ReviewScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(ReviewRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				ReviewReviewRunInput,
				g.query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunReviewReviewRunInput", {
						root: ReviewReviewRunInput.fields.root,
						scope: ReviewReviewRunInput.fields.scope,
						review: ReviewReviewRunInput.fields.review
					})
					const { root, scope, review } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, review })
						.where(r.not(ReviewRoot, { root }))
						.find({ root, scope, review })
				})
			)
			.insert(
				ReviewReviewRunInputSizes,
				g.query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunReviewReviewRunInputSizes", {
						root: ReviewReviewRunInputSizes.fields.root,
						scope: ReviewReviewRunInputSizes.fields.scope,
						ordinal: ReviewReviewRunInputSizes.fields.ordinal,
						value: ReviewReviewRunInputSizes.fields.value
					})
					const { root, scope, ordinal, value } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, ordinal, value })
						.where(r.not(ReviewRoot, { root }))
						.find({ root, scope, ordinal, value })
				})
			)
			.insert(
				ReviewRequestedWith,
				g
					.query(reviewGraph)
					.rule((r) => {
						const requested = r.relation("reviewReviewRunReviewRequestedWith", {
							root: ReviewRequestedWith.fields.root,
							fingerprint: ReviewRequestedWith.fields.fingerprint,
							input: ReviewRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(ReviewRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("reviewReviewRunReviewRequestedWith", {
							root: ReviewRequestedWith.fields.root,
							fingerprint: ReviewRequestedWith.fields.fingerprint,
							input: ReviewRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(ReviewRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(ReviewRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				ReviewRoot,
				g.query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunReviewScope", {
						root: ReviewScope.fields.root,
						scope: ReviewScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("reviewReviewRunScope", ReviewRoot.fields.root)),
							r.not(ReviewRoot, { root })
						)
						.find({
							root,
							kind: ReviewRootKind.handle("ReviewRun"),
							key: r.param("reviewReviewRunKey", ReviewRoot.fields.key),
							at: r.param("denNow", ReviewRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewOutputsReviewRunQuestions: g.query(reviewGraph).rule((r) => {
		const { root, scope, parent } = g.v(ReviewWithin, "within")
		const { step } = g.v(ReviewFinish, "finish")
		const { count, total } = g.v(ReviewQuestionsFinishOutput, "output")
		return r
			.match(ReviewWithin, { root, scope, parent, kind: "Questions" })
			.match(ReviewFinish, { root, scope, step })
			.match(ReviewQuestionsFinishOutput, { root, step, count, total })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(parent, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, count, total })
	}),
	reviewInputsReviewRunQuestions: g.query(reviewGraph).rule((r) => {
		const { root, scope, parent } = g.v(ReviewWithin, "within")
		const { step } = g.v(ReviewFinish, "finish")
		const { review, group, size } = g.v(ReviewQuestionsInput, "input")
		return r
			.match(ReviewWithin, { root, scope, parent, kind: "Questions" })
			.match(ReviewFinish, { root, scope, step })
			.match(ReviewQuestionsInput, { root, scope, review, group, size })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(parent, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, review, group, size })
	}),
	reviewFailuresReviewRunQuestions: g.query(reviewGraph).rule((r) => {
		const { root, scope, parent } = g.v(ReviewWithin, "within")
		const { step } = g.v(ReviewFinish, "finish")
		return r
			.match(ReviewWithin, { root, scope, parent, kind: "Questions" })
			.match(ReviewFinish, { root, scope, step })
			.match(ReviewResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(parent, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step })
	}),
	reviewOutputsReviewRunSave: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		const { total } = g.v(ReviewSaveOutput, "output")
		return r
			.match(ReviewStep, { root, step, kind: "Save", scope })
			.match(ReviewSaveOutput, { root, step, total })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, total })
	}),
	reviewInputsReviewRunSave: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		const { review, group, count, total } = g.v(ReviewSaveInput, "input")
		return r
			.match(ReviewStep, { root, step, kind: "Save", scope })
			.match(ReviewSaveInput, { root, step, review, group, count, total })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, review, group, count, total })
	}),
	reviewFailuresReviewRunSave: g.query(reviewGraph).rule((r) => {
		const { root, step, scope } = g.v(ReviewStep, "step")
		return r
			.match(ReviewStep, { root, step, kind: "Save", scope })
			.match(ReviewResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step })
	})
})

export const reviewDenWorkload = g.workload(ReviewDen, reviewDenPrograms)

export const reviewCoordinatorPrograms = Object.freeze({
	reviewPromote: g.clocked(
		g.ChangeSet.empty(reviewCoordination).insert(
			ReviewServed,
			g.query(reviewCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", ReviewServed.fields.environment),
					at: r.param("denNow", ReviewServed.fields.at),
					deployment: r.param("deployment", ReviewServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewPause: g.ChangeSet.empty(reviewCoordination).insert(ReviewPaused, []),
	reviewResume: g.ChangeSet.empty(reviewCoordination).insert(ReviewResumed, []),
	reviewPauseTurns: g.query(reviewCoordination).rule((r) => {
		const { target, turn } = g.v(ReviewPaused, "reviewPaused")
		return r.match(ReviewPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	reviewPausedAll: g.query(reviewCoordination).rule((r) => {
		const { target, turn } = g.v(ReviewPaused, "reviewPaused")
		return r
			.match(ReviewPaused, { target, turn })
			.where(r.not(ReviewResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const reviewCoordinatorWorkload = g.workload(ReviewCoordinator, reviewCoordinatorPrograms)

/** den's retiring role for the flow Review: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const ReviewRetirer = g.role(
	App,
	"review_retirer",
	{ ...reviewGraph.relations },
	{
		write: [
			"ReviewScope",
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
			"ReviewAnalyzeOutput",
			"ReviewGatherOutput",
			"ReviewSaveOutput",
			"ReviewQuestionsFinishOutput",
			"ReviewReviewRunFinishOutput",
			"ReviewSplit",
			"ReviewSaved",
			"ReviewHold"
		]
	}
)

export const reviewRetirerPrograms = Object.freeze({
	reviewRetire: g.ChangeSet.empty(reviewGraph).deleteWhere({
		ReviewScope: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewWithin: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewAdmitted: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewSkipped: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewStep: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewStartStep: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewStartScope: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewFinish: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewClaim: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewEnded: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewRetry: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewFenced: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewResult: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewDone: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewFailed: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewHeld: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewRefusal: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewExhausted: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewAnalyzeInput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewGatherInput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewGatherInputSizes: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewSaveInput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewQuestionsInput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewReviewRunInput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewReviewRunInputSizes: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewAnalyzeOutput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewGatherOutput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewSaveOutput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewQuestionsFinishOutput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewReviewRunFinishOutput: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewSplit: { root: g.param("root", ReviewRoot.fields.root) },
		ReviewSaved: { root: g.param("root", ReviewRoot.fields.root) }
	})
})

export const reviewRetirerWorkload = g.workload(ReviewRetirer, reviewRetirerPrograms)

/** The commits and declared reads of the flow Review, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const reviewCommitPrograms = Object.freeze({
	reviewAuthenticated: g.clocked(
		g.query(reviewGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewCommitAnalyze: g.ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewDone, [])
		.insert(ReviewHeld, [])
		.insert(ReviewAnalyzeOutput, []),
	reviewCommitGather: g.clocked(
		g.ChangeSet.empty(reviewGraph)
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
				g.query(reviewGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ReviewStep.fields.step,
						kind: ReviewStep.fields.kind,
						scope: ReviewStep.fields.scope,
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
						root: r.param("root", ReviewStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewCommitSave: g.ChangeSet.union(
		g.ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(ReviewSaveOutput, []),
		declaredFlow.kinds[3].writes.changes(Loader)
	),
	reviewCommitQuestionsFinish: g.clocked(
		g.ChangeSet.empty(reviewGraph)
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
				g.query(reviewGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ReviewStep.fields.step,
						kind: ReviewStep.fields.kind,
						scope: ReviewStep.fields.scope,
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
						root: r.param("root", ReviewStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewCommitReviewRunFinish: g.ChangeSet.union(
		g.ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(ReviewReviewRunFinishOutput, []),
		declaredFlow.kinds[4].finish.writes.changes(Loader)
	)
})

export const reviewCommits = g.workload(Loader, reviewCommitPrograms)
