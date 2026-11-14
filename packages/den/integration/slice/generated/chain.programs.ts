import { DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Chain to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, clocked, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	ChainKind,
	ChainJoin,
	ChainOutcome,
	ChainPausable,
	ChainPageInputFeed,
	ChainChainRunInputFeed,
	ChainOrderedInputFeed,
	ChainScope,
	ChainRoot,
	ChainWithin,
	ChainAdmitted,
	ChainSkipped,
	ChainStep,
	ChainStartStep,
	ChainStartScope,
	ChainFinish,
	ChainDue,
	ChainClaim,
	ChainRetry,
	ChainFenced,
	ChainResult,
	ChainDone,
	ChainFailed,
	ChainHeld,
	ChainRefusal,
	ChainExhausted,
	ChainPageInput,
	ChainPageInputAfter,
	ChainChainRunInput,
	ChainOrderedInput,
	ChainNext,
	ChainPageOutput,
	ChainPageOutputNext,
	ChainPageRead,
	ChainPaused,
	ChainResumed,
	chainGraph,
	chainCoordination
} from "#integration/slice/generated/chain.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Chain: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. */
export const ChainDen = role(
	App,
	"chain_den",
	{ ...chainGraph.relations },
	{
		insert: [
			"ChainScope",
			"ChainRoot",
			"ChainWithin",
			"ChainAdmitted",
			"ChainSkipped",
			"ChainStep",
			"ChainStartStep",
			"ChainStartScope",
			"ChainFinish",
			"ChainDue",
			"ChainClaim",
			"ChainRetry",
			"ChainFenced",
			"ChainResult",
			"ChainDone",
			"ChainFailed",
			"ChainHeld",
			"ChainRefusal",
			"ChainExhausted",
			"ChainPageInput",
			"ChainPageInputAfter",
			"ChainChainRunInput",
			"ChainOrderedInput",
			"ChainPageRead"
		]
	}
)

/** den's coordinator role for the flow Chain: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const ChainCoordinator = role(
	App,
	"chain_coordinator",
	{
		ChainKind,
		ChainJoin,
		ChainOutcome,
		ChainPausable,
		ChainPageInputFeed,
		ChainChainRunInputFeed,
		ChainOrderedInputFeed,
		ChainPaused,
		ChainResumed
	},
	{ insert: ["ChainPaused", "ChainResumed"] }
)

export const chainDenPrograms = Object.freeze({
	chainNow: clocked(
		query(chainGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	chainClaim: ChangeSet.empty(chainGraph)
		.insert(ChainClaim, [])
		.read("held", (delta) =>
			query(chainGraph)
				.rule((r) => {
					const { step, attempt, holder } = v(delta.added(ChainClaim), "added")
					return r
						.match(delta.added(ChainClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
				.rule((r) => {
					const { step, attempt, holder } = v(delta.met(ChainClaim), "met")
					return r
						.match(delta.met(ChainClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
		),
	chainRetry: ChangeSet.empty(chainGraph).insert(ChainRetry, []),
	chainFence: ChangeSet.empty(chainGraph).insert(ChainFenced, []),
	chainRefuse: ChangeSet.empty(chainGraph)
		.insert(ChainResult, [])
		.insert(ChainFailed, [])
		.insert(ChainHeld, [])
		.insert(ChainRefusal, []),
	chainExhaust: ChangeSet.empty(chainGraph)
		.insert(ChainResult, [])
		.insert(ChainFailed, [])
		.insert(ChainHeld, [])
		.insert(ChainExhausted, []),
	chainAdmit: ChangeSet.empty(chainGraph)
		.insert(ChainAdmitted, [])
		.insert(ChainFinish, [])
		.insert(ChainStartStep, [])
		.insert(ChainStartScope, [])
		.insert(ChainStep, [])
		.insert(ChainDue, [])
		.insert(ChainScope, [])
		.insert(ChainWithin, [])
		.insert(ChainPageInput, [])
		.insert(ChainPageInputAfter, []),
	chainSkip: ChangeSet.empty(chainGraph).insert(ChainSkipped, []),
	chainSkippedOf: ChainSkipped,
	chainStepOf: ChainStep,
	chainResultOf: ChainResult,
	chainHeldOf: ChainHeld,
	chainDueOf: ChainDue,
	chainScopeOf: ChainScope,
	chainWithinOf: ChainWithin,
	chainAdmittedOf: ChainAdmitted,
	chainRootOf: ChainRoot,
	chainClaimsOf: query(chainGraph).rule((r) => {
		const { step, attempt, holder, until } = v(ChainClaim, "claim")
		return r
			.match(ChainClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	chainRetriesOf: query(chainGraph).rule((r) => {
		const { step, attempt, at, spent } = v(ChainRetry, "retry")
		return r
			.match(ChainRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	chainFencedOf: query(chainGraph).rule((r) => {
		const { step, attempt } = v(ChainFenced, "fenced")
		return r
			.match(ChainFenced, { step, attempt })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, attempt })
	}),
	chainUnendedSteps: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", ChainScope.fields.scope)),
				r.not(ChainResult, { step }),
				r.not(ChainFinish, { scope, step })
			)
			.find({ step })
	}),
	chainOpenChildren: query(chainGraph)
		.rule((r) => {
			const { scope, parent } = v(ChainWithin, "within")
			return r
				.match(ChainWithin, { scope, parent })
				.where(
					r.eq(parent, r.param("scope", ChainScope.fields.scope)),
					r.not(ChainAdmitted, { scope })
				)
				.find({ child: scope })
		})
		.rule((r) => {
			const { scope, parent } = v(ChainWithin, "within")
			const { step } = v(ChainFinish, "finish")
			return r
				.match(ChainWithin, { scope, parent })
				.match(ChainFinish, { scope, step })
				.where(
					r.eq(parent, r.param("scope", ChainScope.fields.scope)),
					r.not(ChainResult, { step })
				)
				.find({ child: scope })
		}),
	chainFinished: query(chainGraph).rule((r) => {
		const { scope, step } = v(ChainFinish, "finish")
		return r
			.match(ChainFinish, { scope, step })
			.match(ChainResult, { step })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	}),
	chainPending: deferrable(
		query(chainGraph).rule((r) => {
			const { step, kind, scope } = v(ChainStep, "step")
			return r
				.match(ChainStep, { step, kind, scope })
				.where(r.not(ChainResult, { step }))
				.find({ step, kind, scope })
		})
	),
	chainPendingClaims: deferrable(
		query(chainGraph).rule((r) => {
			const { step, attempt, until } = v(ChainClaim, "claim")
			return r
				.match(ChainClaim, { step, attempt, until })
				.where(r.not(ChainResult, { step }))
				.find({ step, attempt, until })
		})
	),
	chainPendingRetries: deferrable(
		query(chainGraph).rule((r) => {
			const { step, attempt, at, spent } = v(ChainRetry, "retry")
			return r
				.match(ChainRetry, { step, attempt, at, spent })
				.where(r.not(ChainResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	chainPendingFenced: deferrable(
		query(chainGraph).rule((r) => {
			const { step, attempt } = v(ChainFenced, "fenced")
			return r
				.match(ChainFenced, { step, attempt })
				.where(r.not(ChainResult, { step }))
				.find({ step, attempt })
		})
	),
	chainPendingDues: deferrable(
		query(chainGraph).rule((r) => {
			const { step, at } = v(ChainDue, "due")
			return r.match(ChainDue, { step, at }).where(r.not(ChainResult, { step })).find({ step, at })
		})
	),
	chainRequested: deferrable(
		query(chainGraph).rule((r) => {
			const { scope, kind } = v(ChainScope, "scope")
			return r
				.match(ChainScope, { scope, kind })
				.where(r.not(ChainAdmitted, { scope }), r.not(ChainSkipped, { scope }))
				.find({ scope, kind })
		})
	),
	chainRunning: deferrable(
		query(chainGraph).rule((r) => {
			const { scope, kind } = v(ChainScope, "scope")
			const { step } = v(ChainFinish, "finish")
			return r
				.match(ChainScope, { scope, kind })
				.match(ChainFinish, { scope, step })
				.where(r.not(ChainResult, { step }))
				.find({ scope, kind })
		})
	),
	chainWithins: deferrable(
		query(chainGraph).rule((r) => {
			const { scope, parent } = v(ChainWithin, "chainWithin")
			return r.match(ChainWithin, { scope, parent }).find({ scope, parent })
		})
	),
	chainRoots: deferrable(
		query(chainGraph).rule((r) => {
			const { scope, key, at } = v(ChainRoot, "chainRoot")
			return r.match(ChainRoot, { scope, key, at }).find({ scope, key, at })
		})
	),
	chainReadChainPageInput: ChainPageInput,
	chainReadChainPageInputAfter: ChainPageInputAfter,
	chainReadChainChainRunInput: ChainChainRunInput,
	chainRequestChainRun: ChangeSet.empty(chainGraph)
		.insert(ChainScope, [])
		.insert(ChainRoot, [])
		.insert(ChainChainRunInput, []),
	chainOutputsChainRunPage: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { seq, items } = v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutput, { step, seq, items })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, seq, items })
	}),
	chainOutputsChainRunPageNext: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { value } = v(ChainPageOutputNext, "value")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutputNext, { step, value })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, value })
	}),
	chainFailuresChainRunPage: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	}),
	chainReadChainOrderedInput: ChainOrderedInput,
	chainOutputsOrderedPage: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { seq, items } = v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutput, { step, seq, items })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, seq, items })
	}),
	chainOutputsOrderedPageNext: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { value } = v(ChainPageOutputNext, "value")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutputNext, { step, value })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, value })
	}),
	chainFailuresOrderedPage: query(chainGraph).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	})
})

export const chainDenWorkload = workload(ChainDen, chainDenPrograms)

export const chainCoordinatorPrograms = Object.freeze({
	chainPause: ChangeSet.empty(chainCoordination).insert(ChainPaused, []),
	chainResume: ChangeSet.empty(chainCoordination).insert(ChainResumed, []),
	chainPauseTurns: deferrable(
		query(chainCoordination).rule((r) => {
			const { target, turn } = v(ChainPaused, "chainPaused")
			return r.match(ChainPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	chainPausedAll: deferrable(
		query(chainCoordination).rule((r) => {
			const { target, turn } = v(ChainPaused, "chainPaused")
			return r
				.match(ChainPaused, { target, turn })
				.where(r.not(ChainResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const chainCoordinatorWorkload = workload(ChainCoordinator, chainCoordinatorPrograms)

/** The commits and declared reads of the flow Chain, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const chainCommitPrograms = Object.freeze({
	chainAuthenticated: clocked(
		query(chainGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	chainCommitPage: ChangeSet.union(
		ChangeSet.empty(chainGraph)
			.insert(ChainResult, [])
			.insert(ChainDone, [])
			.insert(ChainHeld, [])
			.insert(ChainPageOutput, [])
			.insert(ChainPageOutputNext, [])
			.insert(ChainPageRead, [])
			.insert(ChainStep, [])
			.insert(ChainDue, [])
			.insert(ChainScope, [])
			.insert(ChainWithin, [])
			.insert(ChainAdmitted, [])
			.insert(ChainFinish, [])
			.insert(ChainStartStep, [])
			.insert(ChainStartScope, [])
			.insert(ChainPageInput, [])
			.insert(ChainPageInputAfter, [])
			.insert(ChainNext, []),
		ChangeSet.empty(Loader).insert(App.relations.Item, [])
	),
	chainReadPage: deferrable(
		query(Loader).rule((r) => {
			const { feed, factor } = v(App.relations.Weight, "row")
			return r
				.match(App.relations.Weight, { feed, factor })
				.where(r.eq(feed, r.param("feed", App.relations.Weight.fields.feed)))
				.find({ feed, factor })
		})
	),
	chainCommitChainRunFinish: ChangeSet.union(
		ChangeSet.empty(chainGraph).insert(ChainResult, []).insert(ChainDone, []).insert(ChainHeld, []),
		ChangeSet.empty(Loader).insert(App.relations.Cursor, [])
	),
	chainCommitOrderedFinish: ChangeSet.union(
		ChangeSet.empty(chainGraph).insert(ChainResult, []).insert(ChainDone, []).insert(ChainHeld, []),
		ChangeSet.empty(Loader).insert(App.relations.Cursor, [])
	)
})

export const chainCommits = workload(Loader, chainCommitPrograms)

/** The requests of the flow's roots the app's own write starts, each a ChangeSet over the flow's graph the app unions with its own. */
export const chainRequests = Object.freeze({
	Ordered: ChangeSet.empty(chainGraph)
		.insert(ChainScope, [])
		.insert(ChainRoot, [])
		.insert(ChainOrderedInput, [])
})
