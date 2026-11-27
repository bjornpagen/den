import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Review to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, Num, Type, clocked, param, query, role, v, workload } from "@bjornpagen/grizzle"
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
	review_analyze_input_aobppbhebnkae,
	review_gather_input_eiadkjkkdoiel,
	review_gather_input_sizes_ifjkkjdhlfbgp,
	review_save_input_njbdjgekhblef,
	review_questions_input_jigaomgjefjfk,
	review_review_run_input_hpdfjnehnkdig,
	review_review_run_input_sizes_fmllfmbfdoojd,
	review_analyze_output_fhhkmphnmpkdm,
	review_gather_output_cgnhmechbiddp,
	review_save_output_falmopiohdlkl,
	review_questions_finish_output_kddidbknbjeof,
	review_review_run_finish_output_fbgeikbjoigci,
	review_split_fnhnebdnlfmck,
	review_saved_bppbpjmhcjbaa,
	ReviewPaused,
	ReviewResumed,
	ReviewServed,
	reviewGraph,
	reviewCoordination
} from "#integration/slice/generated/review.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Review: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains, live holds and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ReviewDen = role(
	App,
	"review_den",
	{
		...reviewGraph.relations,
		ReviewPaused,
		ReviewResumed,
		ReviewServed,
		ReviewLive: query(App).rule((r) => {
			const { resource, seat, step, root, attempt, until } = v(App.relations.ReviewLive, "live")
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
			"review_analyze_input_aobppbhebnkae",
			"review_gather_input_eiadkjkkdoiel",
			"review_gather_input_sizes_ifjkkjdhlfbgp",
			"review_save_input_njbdjgekhblef",
			"review_questions_input_jigaomgjefjfk",
			"review_review_run_input_hpdfjnehnkdig",
			"review_review_run_input_sizes_fmllfmbfdoojd",
			"review_questions_finish_output_kddidbknbjeof",
			"review_review_run_finish_output_fbgeikbjoigci",
			"ReviewHold"
		]
	}
)

/** den's coordinator role for the flow Review: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const ReviewCoordinator = role(
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

const reviewPendingRead = query(ReviewDen).rule((r) => {
	const { root, step, kind, scope, due } = v(ReviewStep, "step")
	return r
		.match(ReviewStep, { root, step, kind, scope, due })
		.where(r.not(ReviewResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const reviewRequestedRead = query(ReviewDen).rule((r) => {
	const { scope } = v(ReviewScope, "scope")
	return r
		.match(ReviewRoot, { root: scope })
		.match(ReviewScope, { root: scope, scope })
		.where(
			r.not(ReviewAdmitted, { root: scope, scope }),
			r.not(ReviewSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const reviewRunningRead = query(ReviewDen).rule((r) => {
	const { root, scope, step } = v(ReviewFinish, "finish")
	return r
		.match(ReviewFinish, { root, scope, step })
		.where(r.not(ReviewResult, { root, step }))
		.find({ scope })
})

const reviewLatestServed = query(ReviewDen).rule((r) => {
	const { environment, at } = v(ReviewServed, "served")
	return r
		.match(ReviewServed, { environment, at })
		.where(r.eq(environment, r.param("environment", ReviewServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const reviewDenPrograms = Object.freeze({
	reviewNow: clocked(
		query(reviewGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewReading: clocked(
		query(ReviewDen).reads({
			now: query(reviewGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: query(ReviewDen).rule((r) => {
				const { environment, at, deployment } = v(ReviewServed, "served")
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
	reviewClaim: clocked(
		ChangeSet.empty(reviewGraph)
			.insertAllComputed(
				{ ReviewClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("denNow", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(ReviewEnded, [])
			.read("held", (delta) =>
				query(reviewGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(ReviewClaim), "added")
					return r
						.match(delta.added(ReviewClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
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
						at: Type.cast(
							Num.add(
								Type.base(r.param("denNow", DenInstant)),
								Type.base(r.param("delay", DenDelay))
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
	reviewFence: ChangeSet.empty(reviewGraph).insert(ReviewEnded, []).insert(ReviewFenced, []),
	reviewHolds: query(ReviewDen).rule((r) => {
		const { resource, seat, step, root, attempt, until } = v(ReviewDen.relations.ReviewLive, "live")
		return r
			.match(ReviewDen.relations.ReviewLive, { resource, seat, step, root, attempt, until })
			.find({ resource, seat, step, root, attempt, until })
	}),
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
			.insert(review_analyze_input_aobppbhebnkae, [])
			.insert(review_gather_input_eiadkjkkdoiel, [])
			.insert(review_gather_input_sizes_ifjkkjdhlfbgp, [])
			.insert(review_save_input_njbdjgekhblef, [])
			.insert(review_questions_input_jigaomgjefjfk, [])
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
						due: Type.cast(
							Num.add(Type.base(r.param("denNow", DenInstant)), Type.base(delay)),
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
	reviewSkip: ChangeSet.empty(reviewGraph).insert(ReviewSkipped, []),
	reviewSkippedOf: query(reviewGraph).rule((r) => {
		const { root, scope, by } = v(ReviewSkipped, "reviewSkipped")
		return r
			.match(ReviewSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", ReviewSkipped.fields.root)),
				r.eq(scope, r.param("scope", ReviewSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	reviewStepOf: query(reviewGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(ReviewStep, "reviewStep")
		return r
			.match(ReviewStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", ReviewStep.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	reviewResultOf: query(reviewGraph).rule((r) => {
		const { root, step, outcome } = v(ReviewResult, "reviewResult")
		return r
			.match(ReviewResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", ReviewResult.fields.root)),
				r.eq(step, r.param("step", ReviewResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	reviewHeldOf: query(reviewGraph).rule((r) => {
		const { root, step, attempt } = v(ReviewHeld, "reviewHeld")
		return r
			.match(ReviewHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ReviewHeld.fields.root)),
				r.eq(step, r.param("step", ReviewHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	reviewWithinOf: query(reviewGraph).rule((r) => {
		const { root, scope, parent, kind } = v(ReviewWithin, "reviewWithin")
		return r
			.match(ReviewWithin, { root, scope, parent, kind })
			.where(
				r.eq(root, r.param("root", ReviewWithin.fields.root)),
				r.eq(scope, r.param("scope", ReviewWithin.fields.scope))
			)
			.find({ root, scope, parent, kind })
	}),
	reviewAdmittedOf: query(reviewGraph).rule((r) => {
		const { root, scope } = v(ReviewAdmitted, "reviewAdmitted")
		return r
			.match(ReviewAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", ReviewAdmitted.fields.root)),
				r.eq(scope, r.param("scope", ReviewAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	reviewRootOf: query(reviewGraph).rule((r) => {
		const { kind, key, at } = v(ReviewRoot, "root")
		const { scope } = v(ReviewScope, "scope")
		return r
			.match(ReviewRoot, { root: scope, kind, key, at })
			.match(ReviewScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", ReviewRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	reviewFinishedRoots: query(reviewGraph)
		.rule((r) => {
			const { scope, step } = v(ReviewFinish, "finish")
			return r
				.match(ReviewFinish, { root: scope, scope, step })
				.match(ReviewResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(ReviewSkipped, "skipped")
			return r.match(ReviewSkipped, { root: scope, scope }).find({ scope })
		}),
	reviewClaimsOf: query(reviewGraph).rule((r) => {
		const { root, step, attempt, until } = v(ReviewClaim, "claim")
		return r
			.match(ReviewClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	reviewRetriesOf: query(reviewGraph).rule((r) => {
		const { root, step, attempt, at, why } = v(ReviewRetry, "retry")
		return r
			.match(ReviewRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	reviewFencedOf: query(reviewGraph).rule((r) => {
		const { root, step, attempt } = v(ReviewFenced, "fenced")
		return r
			.match(ReviewFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step))
			)
			.find({ step, attempt })
	}),
	reviewUnendedSteps: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
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
	reviewOpenChildren: query(reviewGraph).rule((r) => {
		const { root, scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
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
	reviewFinished: query(reviewGraph).rule((r) => {
		const { root, scope, step } = v(ReviewFinish, "finish")
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
	reviewSnapshot: query(ReviewDen).reads({
		steps: reviewPendingRead,
		claims: query(ReviewDen).rule((r) => {
			const { root, step, attempt, until } = v(ReviewClaim, "claim")
			return r
				.match(ReviewClaim, { root, step, attempt, until })
				.where(r.not(ReviewResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: query(ReviewDen).rule((r) => {
			const { root, step, attempt, at, why } = v(ReviewRetry, "retry")
			return r
				.match(ReviewRetry, { root, step, attempt, at, why })
				.where(r.not(ReviewResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: query(ReviewDen).rule((r) => {
			const { root, step, attempt } = v(ReviewFenced, "fenced")
			return r
				.match(ReviewFenced, { root, step, attempt })
				.where(r.not(ReviewResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: reviewRequestedRead,
		running: reviewRunningRead,
		withins: query(ReviewDen).rule((r) => {
			const { scope, parent, kind } = v(ReviewWithin, "reviewWithin")
			return r.match(ReviewWithin, { scope, parent, kind }).find({ scope, parent, kind })
		}),
		roots: query(ReviewDen).rule((r) => {
			const { kind, key, at } = v(ReviewRoot, "root")
			const { scope } = v(ReviewScope, "scope")
			return r
				.match(ReviewRoot, { root: scope, kind, key, at })
				.match(ReviewScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		holds: query(ReviewDen).rule((r) => {
			const { resource, seat, step, root, attempt, until } = v(
				ReviewDen.relations.ReviewLive,
				"live"
			)
			return r
				.match(ReviewDen.relations.ReviewLive, { resource, seat, step, root, attempt, until })
				.find({ resource, seat, step, root, attempt, until })
		}),
		paused: query(ReviewDen).rule((r) => {
			const { target, turn } = v(ReviewPaused, "reviewPaused")
			return r
				.match(ReviewPaused, { target, turn })
				.where(r.not(ReviewResumed, { target, turn }))
				.find({ target, turn })
		}),
		awaiting: query(ReviewDen).rule((r) => {
			const { root, step, review } = v(review_gather_input_eiadkjkkdoiel, "input")
			return r
				.match(review_gather_input_eiadkjkkdoiel, { root, step, review })
				.where(
					r.not(ReviewResult, { root, step }),
					r.not(App.relations.Delivered, { attempt: review })
				)
				.find({ root, step })
		})
	}),
	reviewAwaitingOf: query(ReviewDen).rule((r) => {
		const { root, step, review } = v(review_gather_input_eiadkjkkdoiel, "input")
		return r
			.match(review_gather_input_eiadkjkkdoiel, { root, step, review })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(step, r.param("step", ReviewStep.fields.step)),
				r.not(ReviewResult, { root, step }),
				r.not(App.relations.Delivered, { attempt: review })
			)
			.find({ root, step })
	}),
	reviewReady: query(ReviewDen).rule((r) => {
		const { root, step, review } = v(review_gather_input_eiadkjkkdoiel, "input")
		return r
			.match(review_gather_input_eiadkjkkdoiel, { root, step, review })
			.match(App.relations.Delivered, { attempt: review })
			.where(r.not(ReviewResult, { root, step }), r.not(ReviewClaim, { root, step }))
			.find({ root, step })
	}),
	reviewReadreview_analyze_input_aobppbhebnkae: query(reviewGraph).rule((r) => {
		const { root, step, review, group, question } = v(
			review_analyze_input_aobppbhebnkae,
			"review_analyze_input_aobppbhebnkae"
		)
		return r
			.match(review_analyze_input_aobppbhebnkae, { root, step, review, group, question })
			.where(
				r.eq(root, r.param("root", review_analyze_input_aobppbhebnkae.fields.root)),
				r.eq(step, r.param("step", review_analyze_input_aobppbhebnkae.fields.step))
			)
			.find({ root, step, review, group, question })
	}),
	reviewReadreview_gather_input_eiadkjkkdoiel: query(reviewGraph).rule((r) => {
		const { root, step, review } = v(
			review_gather_input_eiadkjkkdoiel,
			"review_gather_input_eiadkjkkdoiel"
		)
		return r
			.match(review_gather_input_eiadkjkkdoiel, { root, step, review })
			.where(
				r.eq(root, r.param("root", review_gather_input_eiadkjkkdoiel.fields.root)),
				r.eq(step, r.param("step", review_gather_input_eiadkjkkdoiel.fields.step))
			)
			.find({ root, step, review })
	}),
	reviewReadreview_gather_input_sizes_ifjkkjdhlfbgp: query(reviewGraph).rule((r) => {
		const { root, step, ordinal, value } = v(review_gather_input_sizes_ifjkkjdhlfbgp, "part")
		return r
			.match(review_gather_input_sizes_ifjkkjdhlfbgp, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", review_gather_input_sizes_ifjkkjdhlfbgp.fields.root)),
				r.eq(step, r.param("step", review_gather_input_sizes_ifjkkjdhlfbgp.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	reviewReadreview_save_input_njbdjgekhblef: query(reviewGraph).rule((r) => {
		const { root, step, review, group, count, total } = v(
			review_save_input_njbdjgekhblef,
			"review_save_input_njbdjgekhblef"
		)
		return r
			.match(review_save_input_njbdjgekhblef, { root, step, review, group, count, total })
			.where(
				r.eq(root, r.param("root", review_save_input_njbdjgekhblef.fields.root)),
				r.eq(step, r.param("step", review_save_input_njbdjgekhblef.fields.step))
			)
			.find({ root, step, review, group, count, total })
	}),
	reviewReadreview_questions_input_jigaomgjefjfk: query(reviewGraph).rule((r) => {
		const { root, scope, review, group, size } = v(
			review_questions_input_jigaomgjefjfk,
			"review_questions_input_jigaomgjefjfk"
		)
		return r
			.match(review_questions_input_jigaomgjefjfk, { root, scope, review, group, size })
			.where(
				r.eq(root, r.param("root", review_questions_input_jigaomgjefjfk.fields.root)),
				r.eq(scope, r.param("scope", review_questions_input_jigaomgjefjfk.fields.scope))
			)
			.find({ root, scope, review, group, size })
	}),
	reviewOutputsQuestionsAnalyze: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
		const { score } = v(review_analyze_output_fhhkmphnmpkdm, "output")
		return r
			.match(ReviewStep, { root, step, kind: "Analyze", scope })
			.match(review_analyze_output_fhhkmphnmpkdm, { root, step, score })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, score })
	}),
	reviewInputsQuestionsAnalyze: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
		const { review, group, question } = v(review_analyze_input_aobppbhebnkae, "input")
		return r
			.match(ReviewStep, { root, step, kind: "Analyze", scope })
			.match(review_analyze_input_aobppbhebnkae, { root, step, review, group, question })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, review, group, question })
	}),
	reviewFailuresQuestionsAnalyze: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
		return r
			.match(ReviewStep, { root, step, kind: "Analyze", scope })
			.match(ReviewResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step })
	}),
	reviewReadreview_review_run_input_hpdfjnehnkdig: query(reviewGraph).rule((r) => {
		const { root, scope, review } = v(
			review_review_run_input_hpdfjnehnkdig,
			"review_review_run_input_hpdfjnehnkdig"
		)
		return r
			.match(review_review_run_input_hpdfjnehnkdig, { root, scope, review })
			.where(
				r.eq(root, r.param("root", review_review_run_input_hpdfjnehnkdig.fields.root)),
				r.eq(scope, r.param("scope", review_review_run_input_hpdfjnehnkdig.fields.scope))
			)
			.find({ root, scope, review })
	}),
	reviewReadreview_review_run_input_sizes_fmllfmbfdoojd: query(reviewGraph).rule((r) => {
		const { root, scope, ordinal, value } = v(review_review_run_input_sizes_fmllfmbfdoojd, "part")
		return r
			.match(review_review_run_input_sizes_fmllfmbfdoojd, { root, scope, ordinal, value })
			.where(
				r.eq(root, r.param("root", review_review_run_input_sizes_fmllfmbfdoojd.fields.root)),
				r.eq(scope, r.param("scope", review_review_run_input_sizes_fmllfmbfdoojd.fields.scope))
			)
			.find({ root, scope, ordinal, value })
	}),
	reviewRequestReviewRun: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(
				ReviewScope,
				query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunReviewScope", {
						root: ReviewScope.fields.root,
						scope: ReviewScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(ReviewRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				review_review_run_input_hpdfjnehnkdig,
				query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunreview_review_run_input_hpdfjnehnkdig", {
						root: review_review_run_input_hpdfjnehnkdig.fields.root,
						scope: review_review_run_input_hpdfjnehnkdig.fields.scope,
						review: review_review_run_input_hpdfjnehnkdig.fields.review
					})
					const { root, scope, review } = v(requested, "requested")
					return r
						.match(requested, { root, scope, review })
						.where(r.not(ReviewRoot, { root }))
						.find({ root, scope, review })
				})
			)
			.insert(
				review_review_run_input_sizes_fmllfmbfdoojd,
				query(reviewGraph).rule((r) => {
					const requested = r.relation(
						"reviewReviewRunreview_review_run_input_sizes_fmllfmbfdoojd",
						{
							root: review_review_run_input_sizes_fmllfmbfdoojd.fields.root,
							scope: review_review_run_input_sizes_fmllfmbfdoojd.fields.scope,
							ordinal: review_review_run_input_sizes_fmllfmbfdoojd.fields.ordinal,
							value: review_review_run_input_sizes_fmllfmbfdoojd.fields.value
						}
					)
					const { root, scope, ordinal, value } = v(requested, "requested")
					return r
						.match(requested, { root, scope, ordinal, value })
						.where(r.not(ReviewRoot, { root }))
						.find({ root, scope, ordinal, value })
				})
			)
			.insert(
				ReviewRequestedWith,
				query(reviewGraph)
					.rule((r) => {
						const requested = r.relation("reviewReviewRunReviewRequestedWith", {
							root: ReviewRequestedWith.fields.root,
							fingerprint: ReviewRequestedWith.fields.fingerprint,
							input: ReviewRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
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
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(ReviewRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(ReviewRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				ReviewRoot,
				query(reviewGraph).rule((r) => {
					const requested = r.relation("reviewReviewRunReviewScope", {
						root: ReviewScope.fields.root,
						scope: ReviewScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
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
	reviewOutputsReviewRunQuestions: query(reviewGraph).rule((r) => {
		const { root, scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
		const { count, total } = v(review_questions_finish_output_kddidbknbjeof, "output")
		return r
			.match(ReviewWithin, { root, scope, parent, kind: "Questions" })
			.match(ReviewFinish, { root, scope, step })
			.match(review_questions_finish_output_kddidbknbjeof, { root, step, count, total })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(parent, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, count, total })
	}),
	reviewInputsReviewRunQuestions: query(reviewGraph).rule((r) => {
		const { root, scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
		const { review, group, size } = v(review_questions_input_jigaomgjefjfk, "input")
		return r
			.match(ReviewWithin, { root, scope, parent, kind: "Questions" })
			.match(ReviewFinish, { root, scope, step })
			.match(review_questions_input_jigaomgjefjfk, { root, scope, review, group, size })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(parent, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, review, group, size })
	}),
	reviewFailuresReviewRunQuestions: query(reviewGraph).rule((r) => {
		const { root, scope, parent } = v(ReviewWithin, "within")
		const { step } = v(ReviewFinish, "finish")
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
	reviewOutputsReviewRunSave: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
		const { total } = v(review_save_output_falmopiohdlkl, "output")
		return r
			.match(ReviewStep, { root, step, kind: "Save", scope })
			.match(review_save_output_falmopiohdlkl, { root, step, total })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, total })
	}),
	reviewInputsReviewRunSave: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
		const { review, group, count, total } = v(review_save_input_njbdjgekhblef, "input")
		return r
			.match(ReviewStep, { root, step, kind: "Save", scope })
			.match(review_save_input_njbdjgekhblef, { root, step, review, group, count, total })
			.where(
				r.eq(root, r.param("root", ReviewScope.fields.root)),
				r.eq(scope, r.param("scope", ReviewScope.fields.scope))
			)
			.find({ step, review, group, count, total })
	}),
	reviewFailuresReviewRunSave: query(reviewGraph).rule((r) => {
		const { root, step, scope } = v(ReviewStep, "step")
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

export const reviewDenWorkload = workload(ReviewDen, reviewDenPrograms)

export const reviewCoordinatorPrograms = Object.freeze({
	reviewPromote: clocked(
		ChangeSet.empty(reviewCoordination).insert(
			ReviewServed,
			query(reviewCoordination).rule((r) =>
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
	reviewPause: ChangeSet.empty(reviewCoordination).insert(ReviewPaused, []),
	reviewResume: ChangeSet.empty(reviewCoordination).insert(ReviewResumed, []),
	reviewPauseTurns: query(reviewCoordination).rule((r) => {
		const { target, turn } = v(ReviewPaused, "reviewPaused")
		return r.match(ReviewPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	reviewPausedAll: query(reviewCoordination).rule((r) => {
		const { target, turn } = v(ReviewPaused, "reviewPaused")
		return r
			.match(ReviewPaused, { target, turn })
			.where(r.not(ReviewResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const reviewCoordinatorWorkload = workload(ReviewCoordinator, reviewCoordinatorPrograms)

/** den's retiring role for the flow Review: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const ReviewRetirer = role(
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
			"review_analyze_input_aobppbhebnkae",
			"review_gather_input_eiadkjkkdoiel",
			"review_gather_input_sizes_ifjkkjdhlfbgp",
			"review_save_input_njbdjgekhblef",
			"review_questions_input_jigaomgjefjfk",
			"review_review_run_input_hpdfjnehnkdig",
			"review_review_run_input_sizes_fmllfmbfdoojd",
			"review_analyze_output_fhhkmphnmpkdm",
			"review_gather_output_cgnhmechbiddp",
			"review_save_output_falmopiohdlkl",
			"review_questions_finish_output_kddidbknbjeof",
			"review_review_run_finish_output_fbgeikbjoigci",
			"review_split_fnhnebdnlfmck",
			"review_saved_bppbpjmhcjbaa",
			"ReviewHold"
		]
	}
)

export const reviewRetirerPrograms = Object.freeze({
	reviewRetire: ChangeSet.empty(reviewGraph).deleteWhere({
		ReviewScope: { root: param("root", ReviewRoot.fields.root) },
		ReviewWithin: { root: param("root", ReviewRoot.fields.root) },
		ReviewAdmitted: { root: param("root", ReviewRoot.fields.root) },
		ReviewSkipped: { root: param("root", ReviewRoot.fields.root) },
		ReviewStep: { root: param("root", ReviewRoot.fields.root) },
		ReviewStartStep: { root: param("root", ReviewRoot.fields.root) },
		ReviewStartScope: { root: param("root", ReviewRoot.fields.root) },
		ReviewFinish: { root: param("root", ReviewRoot.fields.root) },
		ReviewClaim: { root: param("root", ReviewRoot.fields.root) },
		ReviewEnded: { root: param("root", ReviewRoot.fields.root) },
		ReviewRetry: { root: param("root", ReviewRoot.fields.root) },
		ReviewFenced: { root: param("root", ReviewRoot.fields.root) },
		ReviewResult: { root: param("root", ReviewRoot.fields.root) },
		ReviewDone: { root: param("root", ReviewRoot.fields.root) },
		ReviewFailed: { root: param("root", ReviewRoot.fields.root) },
		ReviewHeld: { root: param("root", ReviewRoot.fields.root) },
		ReviewRefusal: { root: param("root", ReviewRoot.fields.root) },
		ReviewExhausted: { root: param("root", ReviewRoot.fields.root) },
		review_analyze_input_aobppbhebnkae: { root: param("root", ReviewRoot.fields.root) },
		review_gather_input_eiadkjkkdoiel: { root: param("root", ReviewRoot.fields.root) },
		review_gather_input_sizes_ifjkkjdhlfbgp: { root: param("root", ReviewRoot.fields.root) },
		review_save_input_njbdjgekhblef: { root: param("root", ReviewRoot.fields.root) },
		review_questions_input_jigaomgjefjfk: { root: param("root", ReviewRoot.fields.root) },
		review_review_run_input_hpdfjnehnkdig: { root: param("root", ReviewRoot.fields.root) },
		review_review_run_input_sizes_fmllfmbfdoojd: { root: param("root", ReviewRoot.fields.root) },
		review_analyze_output_fhhkmphnmpkdm: { root: param("root", ReviewRoot.fields.root) },
		review_gather_output_cgnhmechbiddp: { root: param("root", ReviewRoot.fields.root) },
		review_save_output_falmopiohdlkl: { root: param("root", ReviewRoot.fields.root) },
		review_questions_finish_output_kddidbknbjeof: { root: param("root", ReviewRoot.fields.root) },
		review_review_run_finish_output_fbgeikbjoigci: { root: param("root", ReviewRoot.fields.root) },
		review_split_fnhnebdnlfmck: { root: param("root", ReviewRoot.fields.root) },
		review_saved_bppbpjmhcjbaa: { root: param("root", ReviewRoot.fields.root) }
	})
})

export const reviewRetirerWorkload = workload(ReviewRetirer, reviewRetirerPrograms)

/** The commits and declared reads of the flow Review, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const reviewCommitPrograms = Object.freeze({
	reviewAuthenticated: clocked(
		query(reviewGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	reviewCommitAnalyze: ChangeSet.empty(reviewGraph)
		.insert(ReviewResult, [])
		.insert(ReviewDone, [])
		.insert(ReviewHeld, [])
		.insert(review_analyze_output_fhhkmphnmpkdm, []),
	reviewCommitGather: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(review_gather_output_cgnhmechbiddp, [])
			.insert(ReviewScope, [])
			.insert(ReviewWithin, [])
			.insert(ReviewAdmitted, [])
			.insert(ReviewFinish, [])
			.insert(ReviewStartStep, [])
			.insert(ReviewStartScope, [])
			.insert(review_analyze_input_aobppbhebnkae, [])
			.insert(review_gather_input_eiadkjkkdoiel, [])
			.insert(review_gather_input_sizes_ifjkkjdhlfbgp, [])
			.insert(review_save_input_njbdjgekhblef, [])
			.insert(review_questions_input_jigaomgjefjfk, [])
			.insert(review_split_fnhnebdnlfmck, [])
			.insert(review_saved_bppbpjmhcjbaa, [])
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
						due: Type.cast(
							Num.add(Type.base(r.param("denNow", DenInstant)), Type.base(delay)),
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
	reviewCommitSave: ChangeSet.union(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(review_save_output_falmopiohdlkl, []),
		declaredFlow.kinds[3].writes.changes(Loader)
	),
	reviewCommitQuestionsFinish: clocked(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(review_questions_finish_output_kddidbknbjeof, [])
			.insert(ReviewScope, [])
			.insert(ReviewWithin, [])
			.insert(ReviewAdmitted, [])
			.insert(ReviewFinish, [])
			.insert(ReviewStartStep, [])
			.insert(ReviewStartScope, [])
			.insert(review_analyze_input_aobppbhebnkae, [])
			.insert(review_gather_input_eiadkjkkdoiel, [])
			.insert(review_gather_input_sizes_ifjkkjdhlfbgp, [])
			.insert(review_save_input_njbdjgekhblef, [])
			.insert(review_questions_input_jigaomgjefjfk, [])
			.insert(review_split_fnhnebdnlfmck, [])
			.insert(review_saved_bppbpjmhcjbaa, [])
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
						due: Type.cast(
							Num.add(Type.base(r.param("denNow", DenInstant)), Type.base(delay)),
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
	reviewCommitReviewRunFinish: ChangeSet.union(
		ChangeSet.empty(reviewGraph)
			.insert(ReviewResult, [])
			.insert(ReviewDone, [])
			.insert(ReviewHeld, [])
			.insert(review_review_run_finish_output_fbgeikbjoigci, []),
		declaredFlow.kinds[4].finish.writes.changes(Loader)
	)
})

export const reviewCommits = workload(Loader, reviewCommitPrograms)
