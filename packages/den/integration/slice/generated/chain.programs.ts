import { DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Chain to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, clocked, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	ChainKind,
	ChainRootKind,
	ChainOutcome,
	ChainPausable,
	ChainPageInputFeed,
	ChainChainRunInputFeed,
	ChainOrderedInputFeed,
	ChainScope,
	ChainRoot,
	ChainAdmitted,
	ChainSkipped,
	ChainStep,
	ChainStartStep,
	ChainFinish,
	ChainClaim,
	ChainEnded,
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
	ChainPageWeightsRead,
	ChainPaused,
	ChainResumed,
	chainGraph,
	chainCoordination
} from "#integration/slice/generated/chain.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Chain: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ChainDen = role(
	App,
	"chain_den",
	{ ...chainGraph.relations, ChainPaused, ChainResumed },
	{
		insert: [
			"ChainScope",
			"ChainRoot",
			"ChainAdmitted",
			"ChainSkipped",
			"ChainStep",
			"ChainStartStep",
			"ChainFinish",
			"ChainClaim",
			"ChainEnded",
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
			"ChainPageWeightsRead"
		]
	}
)

/** den's coordinator role for the flow Chain: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const ChainCoordinator = role(
	App,
	"chain_coordinator",
	{
		ChainKind,
		ChainRootKind,
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

const chainPendingRead = query(ChainDen).rule((r) => {
	const { step, kind, scope, due } = v(ChainStep, "step")
	return r
		.match(ChainStep, { step, kind, scope, due })
		.where(r.not(ChainResult, { step }))
		.find({ step, kind, scope, due })
})

const chainRequestedRead = query(ChainDen).rule((r) => {
	const { scope } = v(ChainRoot, "root")
	return r
		.match(ChainRoot, { scope })
		.where(r.not(ChainAdmitted, { scope }), r.not(ChainSkipped, { scope }))
		.find({ scope })
})

const chainRunningRead = query(ChainDen).rule((r) => {
	const { scope, step } = v(ChainFinish, "finish")
	return r.match(ChainFinish, { scope, step }).where(r.not(ChainResult, { step })).find({ scope })
})

export const chainDenPrograms = Object.freeze({
	chainNow: clocked(
		query(chainGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	chainClaim: ChangeSet.empty(chainGraph)
		.insert(ChainClaim, [])
		.insert(ChainEnded, [])
		.read("held", (delta) =>
			query(chainGraph).rule((r) => {
				const { step, root, attempt } = v(delta.added(ChainClaim), "added")
				return r
					.match(delta.added(ChainClaim), { step, root, attempt })
					.find({ step, root, attempt })
			})
		),
	chainRetry: ChangeSet.empty(chainGraph).insert(ChainEnded, []).insert(ChainRetry, []),
	chainFence: ChangeSet.empty(chainGraph).insert(ChainEnded, []).insert(ChainFenced, []),
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
		.insert(ChainStep, [])
		.insert(ChainScope, [])
		.insert(ChainPageInput, [])
		.insert(ChainPageInputAfter, []),
	chainSkip: ChangeSet.empty(chainGraph).insert(ChainSkipped, []),
	chainSkippedOf: query(chainGraph).rule((r) => {
		const { scope, by, root } = v(ChainSkipped, "chainSkipped")
		return r
			.match(ChainSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", ChainSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	chainStepOf: query(chainGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(ChainStep, "chainStep")
		return r
			.match(ChainStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	chainResultOf: query(chainGraph).rule((r) => {
		const { step, outcome, root } = v(ChainResult, "chainResult")
		return r
			.match(ChainResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", ChainResult.fields.step)))
			.find({ step, outcome, root })
	}),
	chainHeldOf: query(chainGraph).rule((r) => {
		const { step, attempt, root } = v(ChainHeld, "chainHeld")
		return r
			.match(ChainHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", ChainHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	chainAdmittedOf: query(chainGraph).rule((r) => {
		const { scope, root } = v(ChainAdmitted, "chainAdmitted")
		return r
			.match(ChainAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", ChainAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	chainRootOf: query(chainGraph).rule((r) => {
		const { scope, kind, key, at } = v(ChainRoot, "chainRoot")
		return r
			.match(ChainRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", ChainRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	chainFinishedRoots: deferrable(
		query(chainGraph)
			.rule((r) => {
				const { scope, kind, at } = v(ChainRoot, "root")
				const { step } = v(ChainFinish, "finish")
				return r
					.match(ChainRoot, { scope, kind, at })
					.match(ChainFinish, { scope, step })
					.match(ChainResult, { step })
					.find({ scope, kind, at })
			})
			.rule((r) => {
				const { scope, kind, at } = v(ChainRoot, "root")
				return r
					.match(ChainRoot, { scope, kind, at })
					.match(ChainSkipped, { scope })
					.find({ scope, kind, at })
			})
	),
	chainClaimsOf: query(chainGraph).rule((r) => {
		const { step, attempt, until } = v(ChainClaim, "claim")
		return r
			.match(ChainClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", ChainStep.fields.step)))
			.find({ step, attempt, until })
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
	chainFinished: query(chainGraph).rule((r) => {
		const { scope, step } = v(ChainFinish, "finish")
		return r
			.match(ChainFinish, { scope, step })
			.match(ChainResult, { step })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step })
	}),
	chainPending: deferrable(chainPendingRead),
	chainRequested: deferrable(chainRequestedRead),
	chainRunning: deferrable(chainRunningRead),
	chainSnapshot: deferrable(
		query(ChainDen).reads({
			steps: chainPendingRead,
			claims: query(ChainDen).rule((r) => {
				const { step, attempt, until } = v(ChainClaim, "claim")
				return r
					.match(ChainClaim, { step, attempt, until })
					.where(r.not(ChainResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(ChainDen).rule((r) => {
				const { step, attempt, at, spent } = v(ChainRetry, "retry")
				return r
					.match(ChainRetry, { step, attempt, at, spent })
					.where(r.not(ChainResult, { step }))
					.find({ step, attempt, at, spent })
			}),
			fenced: query(ChainDen).rule((r) => {
				const { step, attempt } = v(ChainFenced, "fenced")
				return r
					.match(ChainFenced, { step, attempt })
					.where(r.not(ChainResult, { step }))
					.find({ step, attempt })
			}),
			requested: chainRequestedRead,
			running: chainRunningRead,
			roots: query(ChainDen).rule((r) => {
				const { scope, kind, key, at } = v(ChainRoot, "chainRoot")
				return r.match(ChainRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			paused: query(ChainDen).rule((r) => {
				const { target, turn } = v(ChainPaused, "chainPaused")
				return r
					.match(ChainPaused, { target, turn })
					.where(r.not(ChainResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	chainReadChainPageInput: query(chainGraph).rule((r) => {
		const { step, feed, seq, pages, root } = v(ChainPageInput, "chainPageInput")
		return r
			.match(ChainPageInput, { step, feed, seq, pages, root })
			.where(r.eq(step, r.param("step", ChainPageInput.fields.step)))
			.find({ step, feed, seq, pages, root })
	}),
	chainReadChainPageInputAfter: query(chainGraph).rule((r) => {
		const { step, value, root } = v(ChainPageInputAfter, "chainPageInputAfter")
		return r
			.match(ChainPageInputAfter, { step, value, root })
			.where(r.eq(step, r.param("step", ChainPageInputAfter.fields.step)))
			.find({ step, value, root })
	}),
	chainReadChainChainRunInput: query(chainGraph).rule((r) => {
		const { scope, feed, pages, root } = v(ChainChainRunInput, "chainChainRunInput")
		return r
			.match(ChainChainRunInput, { scope, feed, pages, root })
			.where(r.eq(scope, r.param("scope", ChainChainRunInput.fields.scope)))
			.find({ scope, feed, pages, root })
	}),
	chainRequestChainRun: clocked(
		ChangeSet.empty(chainGraph)
			.insert(ChainScope, [])
			.insert(ChainChainRunInput, [])
			.insert(
				ChainRoot,
				query(chainGraph).rule((r) =>
					r.find({
						scope: r.param("chainChainRunScope", ChainRoot.fields.scope),
						kind: ChainRootKind.handle("ChainRun"),
						key: r.param("chainChainRunKey", ChainRoot.fields.key),
						at: r.param("now", ChainRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
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
	chainReadChainOrderedInput: query(chainGraph).rule((r) => {
		const { scope, feed, pages, root } = v(ChainOrderedInput, "chainOrderedInput")
		return r
			.match(ChainOrderedInput, { scope, feed, pages, root })
			.where(r.eq(scope, r.param("scope", ChainOrderedInput.fields.scope)))
			.find({ scope, feed, pages, root })
	}),
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

/** den's retiring role for the flow Chain: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const ChainRetirer = role(
	App,
	"chain_retirer",
	{ ...chainGraph.relations },
	{ retire: ["ChainRoot"] }
)

export const chainRetirerPrograms = Object.freeze({
	chainRetire: ChangeSet.empty(chainGraph).retire(ChainRoot, [])
})

export const chainRetirerWorkload = workload(ChainRetirer, chainRetirerPrograms)

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
			.insert(ChainPageWeightsRead, [])
			.insert(ChainStep, [])
			.insert(ChainScope, [])
			.insert(ChainAdmitted, [])
			.insert(ChainFinish, [])
			.insert(ChainStartStep, [])
			.insert(ChainPageInput, [])
			.insert(ChainPageInputAfter, [])
			.insert(ChainNext, []),
		ChangeSet.empty(Loader).insert(App.relations.Item, [])
	),
	chainReadPage: deferrable(
		query(Loader).reads({
			weights: query(Loader).rule((r) => {
				const { feed, factor } = v(App.relations.Weight, "row")
				return r
					.match(App.relations.Weight, { feed, factor })
					.where(r.eq(feed, r.param("feed", App.relations.Weight.fields.feed)))
					.find({ feed, factor })
			})
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
		.insert(ChainOrderedInput, [])
		.insert(
			ChainRoot,
			query(chainGraph).rule((r) =>
				r.find({
					scope: r.param("chainOrderedScope", ChainRoot.fields.scope),
					kind: ChainRootKind.handle("Ordered"),
					key: r.param("chainOrderedKey", ChainRoot.fields.key),
					at: r.param("now", ChainRoot.fields.at)
				})
			)
		)
})
