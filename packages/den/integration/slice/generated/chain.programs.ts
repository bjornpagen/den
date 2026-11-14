/** The programs den lowered the flow Chain to, over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
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
	ChainPaused
} from "#integration/slice/generated/chain.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Chain: claims, retries, failures, admissions, requests, and every read the scheduler makes. */
export const ChainDen = role(
	App,
	"chain_den",
	{
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
		ChainPageRead
	},
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

/** den's coordination role for the flow Chain: seats, holds, exclusivity seats and pauses, the seat module's (LEASE replaces it). */
export const ChainSeats = role(
	App,
	"chain_seats",
	{
		ChainKind,
		ChainJoin,
		ChainOutcome,
		ChainPausable,
		ChainPageInputFeed,
		ChainChainRunInputFeed,
		ChainOrderedInputFeed,
		ChainPaused
	},
	{ write: ["ChainPaused"] }
)

export const chainDenPrograms = Object.freeze({
	chainClaim: ChangeSet.empty(ChainDen).insert(ChainClaim, []),
	chainRetry: ChangeSet.empty(ChainDen).insert(ChainRetry, []),
	chainRefuse: ChangeSet.empty(ChainDen)
		.insert(ChainResult, [])
		.insert(ChainFailed, [])
		.insert(ChainHeld, [])
		.insert(ChainRefusal, []),
	chainExhaust: ChangeSet.empty(ChainDen)
		.insert(ChainResult, [])
		.insert(ChainFailed, [])
		.insert(ChainHeld, [])
		.insert(ChainExhausted, []),
	chainAdmit: ChangeSet.empty(ChainDen)
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
	chainSkip: ChangeSet.empty(ChainDen).insert(ChainSkipped, []),
	chainSkippedOf: ChainSkipped,
	chainStepOf: ChainStep,
	chainResultOf: ChainResult,
	chainHeldOf: ChainHeld,
	chainDueOf: ChainDue,
	chainScopeOf: ChainScope,
	chainWithinOf: ChainWithin,
	chainAdmittedOf: ChainAdmitted,
	chainRootOf: ChainRoot,
	chainClaimsOf: query(ChainDen).rule((r) => {
		const { step, attempt, holder, until } = v(ChainClaim, "claim")
		return r
			.match(ChainClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	chainRetriesOf: query(ChainDen).rule((r) => {
		const { step, attempt, at, spent } = v(ChainRetry, "retry")
		return r
			.match(ChainRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	chainUnendedSteps: query(ChainDen).rule((r) => {
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
	chainOpenChildren: query(ChainDen)
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
	chainFinished: query(ChainDen).rule((r) => {
		const { scope, step } = v(ChainFinish, "finish")
		return r
			.match(ChainFinish, { scope, step })
			.match(ChainResult, { step })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	}),
	chainPending: deferrable(
		query(ChainDen).rule((r) => {
			const { step, kind, scope } = v(ChainStep, "step")
			return r
				.match(ChainStep, { step, kind, scope })
				.where(r.not(ChainResult, { step }))
				.find({ step, kind, scope })
		})
	),
	chainPendingClaims: deferrable(
		query(ChainDen).rule((r) => {
			const { step, attempt, until } = v(ChainClaim, "claim")
			return r
				.match(ChainClaim, { step, attempt, until })
				.where(r.not(ChainResult, { step }))
				.find({ step, attempt, until })
		})
	),
	chainPendingRetries: deferrable(
		query(ChainDen).rule((r) => {
			const { step, attempt, at, spent } = v(ChainRetry, "retry")
			return r
				.match(ChainRetry, { step, attempt, at, spent })
				.where(r.not(ChainResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	chainPendingDues: deferrable(
		query(ChainDen).rule((r) => {
			const { step, at } = v(ChainDue, "due")
			return r.match(ChainDue, { step, at }).where(r.not(ChainResult, { step })).find({ step, at })
		})
	),
	chainRequested: deferrable(
		query(ChainDen).rule((r) => {
			const { scope, kind } = v(ChainScope, "scope")
			return r
				.match(ChainScope, { scope, kind })
				.where(r.not(ChainAdmitted, { scope }), r.not(ChainSkipped, { scope }))
				.find({ scope, kind })
		})
	),
	chainRunning: deferrable(
		query(ChainDen).rule((r) => {
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
		query(ChainDen).rule((r) => {
			const { scope, parent } = v(ChainWithin, "chainWithin")
			return r.match(ChainWithin, { scope, parent }).find({ scope, parent })
		})
	),
	chainRoots: deferrable(
		query(ChainDen).rule((r) => {
			const { scope, key, at } = v(ChainRoot, "chainRoot")
			return r.match(ChainRoot, { scope, key, at }).find({ scope, key, at })
		})
	),
	chainReadChainPageInput: ChainPageInput,
	chainReadChainPageInputAfter: ChainPageInputAfter,
	chainReadChainChainRunInput: ChainChainRunInput,
	chainRequestChainRun: ChangeSet.empty(ChainDen)
		.insert(ChainScope, [])
		.insert(ChainRoot, [])
		.insert(ChainChainRunInput, []),
	chainOutputsChainRunPage: query(ChainDen).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { seq, items } = v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutput, { step, seq, items })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, seq, items })
	}),
	chainOutputsChainRunPageNext: query(ChainDen).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { value } = v(ChainPageOutputNext, "value")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutputNext, { step, value })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, value })
	}),
	chainFailuresChainRunPage: query(ChainDen).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	}),
	chainReadChainOrderedInput: ChainOrderedInput,
	chainOutputsOrderedPage: query(ChainDen).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { seq, items } = v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutput, { step, seq, items })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, seq, items })
	}),
	chainOutputsOrderedPageNext: query(ChainDen).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { value } = v(ChainPageOutputNext, "value")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutputNext, { step, value })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, value })
	}),
	chainFailuresOrderedPage: query(ChainDen).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainResult, { step, outcome: "failed" })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	})
})

export const chainDenWorkload = workload(ChainDen, chainDenPrograms)

export const chainSeatsPrograms = Object.freeze({
	chainPause: ChangeSet.empty(ChainSeats).insert(ChainPaused, []),
	chainResume: ChangeSet.empty(ChainSeats).delete(ChainPaused, []),
	chainPausedAll: deferrable(
		query(ChainSeats).rule((r) => {
			const { target } = v(ChainPaused, "chainPaused")
			return r.match(ChainPaused, { target }).find({ target })
		})
	)
})

export const chainSeatsWorkload = workload(ChainSeats, chainSeatsPrograms)

/** The commits and declared reads of the flow Chain, over its app role Loader. */
export const chainCommitPrograms = Object.freeze({
	chainCommitPage: ChangeSet.empty(Loader)
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
		.insert(ChainNext, [])
		.insert(App.relations.Item, []),
	chainReadPage: deferrable(
		query(Loader).rule((r) => {
			const { feed, factor } = v(App.relations.Weight, "row")
			return r
				.match(App.relations.Weight, { feed, factor })
				.where(r.eq(feed, r.param("feed", App.relations.Weight.fields.feed)))
				.find({ feed, factor })
		})
	),
	chainCommitChainRunFinish: ChangeSet.empty(Loader)
		.insert(ChainResult, [])
		.insert(ChainDone, [])
		.insert(ChainHeld, [])
		.insert(App.relations.Cursor, []),
	chainCommitOrderedFinish: ChangeSet.empty(Loader)
		.insert(ChainResult, [])
		.insert(ChainDone, [])
		.insert(ChainHeld, [])
		.insert(App.relations.Cursor, [])
})

export const chainCommits = workload(Loader, chainCommitPrograms)

/** The requests of the flow's roots the app's own write starts, each a ChangeSet over Loader the app unions with its own. */
export const chainRequests = Object.freeze({
	Ordered: ChangeSet.empty(Loader)
		.insert(ChainScope, [])
		.insert(ChainRoot, [])
		.insert(ChainOrderedInput, [])
})
