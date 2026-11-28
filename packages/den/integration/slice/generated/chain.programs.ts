import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Chain to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import * as g from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { App } from "#integration/slice/app.ts"
import { chain as declaredFlow } from "#integration/slice/flows.ts"
import {
	ChainKind,
	ChainRootKind,
	ChainOutcome,
	ChainRetryWhy,
	ChainPausable,
	ChainPageInputFeed,
	ChainChainRunInputFeed,
	ChainOrderedInputFeed,
	ChainScope,
	ChainRoot,
	ChainRequestedWith,
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
	ChainPageOutput,
	ChainPageOutputNext,
	ChainChainRunFinishOutput,
	ChainOrderedFinishOutput,
	ChainNext,
	ChainPageReadWeights,
	ChainPageReadEarlier,
	ChainPageReadTree,
	ChainPaused,
	ChainResumed,
	ChainServed,
	ChainPageReadWeightsRecords,
	ChainPageReadEarlierRecords,
	ChainPageReadTreeRecords,
	chainGraph,
	chainCoordination
} from "#integration/slice/generated/chain.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Chain: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ChainDen = g.role(
	App,
	"chain_den",
	{ ...chainGraph.relations, ChainPaused, ChainResumed, ChainServed },
	{
		insert: [
			"ChainScope",
			"ChainRoot",
			"ChainRequestedWith",
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
			"ChainChainRunFinishOutput",
			"ChainOrderedFinishOutput",
			"ChainPageReadWeights",
			"ChainPageReadEarlier",
			"ChainPageReadTree",
			...Arr.map(ChainPageReadWeightsRecords.relations, (rel) => rel.name),
			...Arr.map(ChainPageReadEarlierRecords.relations, (rel) => rel.name),
			...Arr.map(ChainPageReadTreeRecords.relations, (rel) => rel.name)
		]
	}
)

/** den's coordinator role for the flow Chain: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const ChainCoordinator = g.role(
	App,
	"chain_coordinator",
	{
		ChainKind,
		ChainRootKind,
		ChainOutcome,
		ChainRetryWhy,
		ChainPausable,
		ChainPageInputFeed,
		ChainChainRunInputFeed,
		ChainOrderedInputFeed,
		ChainPaused,
		ChainResumed,
		ChainServed
	},
	{ insert: ["ChainPaused", "ChainResumed", "ChainServed"] }
)

const chainPendingRead = g.query(ChainDen).rule((r) => {
	const { root, step, kind, scope, due } = g.v(ChainStep, "step")
	return r
		.match(ChainStep, { root, step, kind, scope, due })
		.where(r.not(ChainResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const chainRequestedRead = g.query(ChainDen).rule((r) => {
	const { scope } = g.v(ChainScope, "scope")
	return r
		.match(ChainRoot, { root: scope })
		.match(ChainScope, { root: scope, scope })
		.where(
			r.not(ChainAdmitted, { root: scope, scope }),
			r.not(ChainSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const chainRunningRead = g.query(ChainDen).rule((r) => {
	const { root, scope, step } = g.v(ChainFinish, "finish")
	return r
		.match(ChainFinish, { root, scope, step })
		.where(r.not(ChainResult, { root, step }))
		.find({ scope })
})

const chainLatestServed = g.query(ChainDen).rule((r) => {
	const { environment, at } = g.v(ChainServed, "served")
	return r
		.match(ChainServed, { environment, at })
		.where(r.eq(environment, r.param("environment", ChainServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const chainDenPrograms = Object.freeze({
	chainNow: g.clocked(
		g.query(chainGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainReading: g.clocked(
		g.query(ChainDen).reads({
			now: g.query(chainGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: g.query(ChainDen).rule((r) => {
				const { environment, at, deployment } = g.v(ChainServed, "served")
				return r
					.match(
						chainLatestServed.bind({
							environment: r.param("environment", ChainServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(ChainServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	chainClaim: g.clocked(
		g.ChangeSet.empty(chainGraph)
			.insertAllComputed(
				{ ChainClaim: [] },
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
			.insert(ChainEnded, [])
			.read("held", (delta) =>
				g.query(chainGraph).rule((r) => {
					const { step, root, attempt } = g.v(delta.added(ChainClaim), "added")
					return r
						.match(delta.added(ChainClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainRetry: g.clocked(
		g.ChangeSet.empty(chainGraph)
			.insert(ChainEnded, [])
			.insert(
				ChainRetry,
				g.query(chainGraph).rule((r) =>
					r.find({
						step: r.param("step", ChainRetry.fields.step),
						attempt: r.param("attempt", ChainRetry.fields.attempt),
						at: g.Type.cast(
							g.Num.add(
								g.Type.base(r.param("denNow", DenInstant)),
								g.Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", ChainRetry.fields.why),
						root: r.param("root", ChainRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainFence: g.ChangeSet.empty(chainGraph).insert(ChainEnded, []).insert(ChainFenced, []),
	chainRefuse: g.ChangeSet.empty(chainGraph)
		.insert(ChainResult, [])
		.insert(ChainFailed, [])
		.insert(ChainHeld, [])
		.insert(ChainRefusal, []),
	chainExhaust: g.ChangeSet.empty(chainGraph)
		.insert(ChainResult, [])
		.insert(ChainFailed, [])
		.insert(ChainHeld, [])
		.insert(ChainExhausted, []),
	chainAdmit: g.clocked(
		g.ChangeSet.empty(chainGraph)
			.insert(ChainAdmitted, [])
			.insert(ChainFinish, [])
			.insert(ChainStartStep, [])
			.insert(ChainScope, [])
			.insert(ChainPageInput, [])
			.insert(ChainPageInputAfter, [])
			.insert(
				ChainStep,
				g.query(chainGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ChainStep.fields.step,
						kind: ChainStep.fields.kind,
						scope: ChainStep.fields.scope,
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
						root: r.param("root", ChainStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainSkip: g.ChangeSet.empty(chainGraph).insert(ChainSkipped, []),
	chainSkippedOf: g.query(chainGraph).rule((r) => {
		const { root, scope, by } = g.v(ChainSkipped, "chainSkipped")
		return r
			.match(ChainSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", ChainSkipped.fields.root)),
				r.eq(scope, r.param("scope", ChainSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	chainStepOf: g.query(chainGraph).rule((r) => {
		const { root, step, kind, scope, due } = g.v(ChainStep, "chainStep")
		return r
			.match(ChainStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", ChainStep.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	chainResultOf: g.query(chainGraph).rule((r) => {
		const { root, step, outcome } = g.v(ChainResult, "chainResult")
		return r
			.match(ChainResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", ChainResult.fields.root)),
				r.eq(step, r.param("step", ChainResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	chainHeldOf: g.query(chainGraph).rule((r) => {
		const { root, step, attempt } = g.v(ChainHeld, "chainHeld")
		return r
			.match(ChainHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ChainHeld.fields.root)),
				r.eq(step, r.param("step", ChainHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	chainAdmittedOf: g.query(chainGraph).rule((r) => {
		const { root, scope } = g.v(ChainAdmitted, "chainAdmitted")
		return r
			.match(ChainAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", ChainAdmitted.fields.root)),
				r.eq(scope, r.param("scope", ChainAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	chainRootOf: g.query(chainGraph).rule((r) => {
		const { kind, key, at } = g.v(ChainRoot, "root")
		const { scope } = g.v(ChainScope, "scope")
		return r
			.match(ChainRoot, { root: scope, kind, key, at })
			.match(ChainScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", ChainRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	chainFinishedRoots: g
		.query(chainGraph)
		.rule((r) => {
			const { scope, step } = g.v(ChainFinish, "finish")
			return r
				.match(ChainFinish, { root: scope, scope, step })
				.match(ChainResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = g.v(ChainSkipped, "skipped")
			return r.match(ChainSkipped, { root: scope, scope }).find({ scope })
		}),
	chainClaimsOf: g.query(chainGraph).rule((r) => {
		const { root, step, attempt, until } = g.v(ChainClaim, "claim")
		return r
			.match(ChainClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	chainRetriesOf: g.query(chainGraph).rule((r) => {
		const { root, step, attempt, at, why } = g.v(ChainRetry, "retry")
		return r
			.match(ChainRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	chainFencedOf: g.query(chainGraph).rule((r) => {
		const { root, step, attempt } = g.v(ChainFenced, "fenced")
		return r
			.match(ChainFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ step, attempt })
	}),
	chainUnendedSteps: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		return r
			.match(ChainStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope)),
				r.not(ChainResult, { root, step }),
				r.not(ChainFinish, { root, scope, step })
			)
			.find({ step })
	}),
	chainFinished: g.query(chainGraph).rule((r) => {
		const { root, scope, step } = g.v(ChainFinish, "finish")
		return r
			.match(ChainFinish, { root, scope, step })
			.match(ChainResult, { root, step })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step })
	}),
	chainPending: chainPendingRead,
	chainRequested: chainRequestedRead,
	chainRunning: chainRunningRead,
	chainSnapshot: g.query(ChainDen).reads({
		steps: chainPendingRead,
		claims: g.query(ChainDen).rule((r) => {
			const { root, step, attempt, until } = g.v(ChainClaim, "claim")
			return r
				.match(ChainClaim, { root, step, attempt, until })
				.where(r.not(ChainResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: g.query(ChainDen).rule((r) => {
			const { root, step, attempt, at, why } = g.v(ChainRetry, "retry")
			return r
				.match(ChainRetry, { root, step, attempt, at, why })
				.where(r.not(ChainResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: g.query(ChainDen).rule((r) => {
			const { root, step, attempt } = g.v(ChainFenced, "fenced")
			return r
				.match(ChainFenced, { root, step, attempt })
				.where(r.not(ChainResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: chainRequestedRead,
		running: chainRunningRead,
		roots: g.query(ChainDen).rule((r) => {
			const { kind, key, at } = g.v(ChainRoot, "root")
			const { scope } = g.v(ChainScope, "scope")
			return r
				.match(ChainRoot, { root: scope, kind, key, at })
				.match(ChainScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: g.query(ChainDen).rule((r) => {
			const { target, turn } = g.v(ChainPaused, "chainPaused")
			return r
				.match(ChainPaused, { target, turn })
				.where(r.not(ChainResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	chainReadChainPageInput: g.query(chainGraph).rule((r) => {
		const { root, step, feed, seq, pages } = g.v(ChainPageInput, "chainPageInput")
		return r
			.match(ChainPageInput, { root, step, feed, seq, pages })
			.where(
				r.eq(root, r.param("root", ChainPageInput.fields.root)),
				r.eq(step, r.param("step", ChainPageInput.fields.step))
			)
			.find({ root, step, feed, seq, pages })
	}),
	chainReadChainPageInputAfter: g.query(chainGraph).rule((r) => {
		const { root, step, value } = g.v(ChainPageInputAfter, "chainPageInputAfter")
		return r
			.match(ChainPageInputAfter, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainPageInputAfter.fields.root)),
				r.eq(step, r.param("step", ChainPageInputAfter.fields.step))
			)
			.find({ root, step, value })
	}),
	chainReadChainChainRunInput: g.query(chainGraph).rule((r) => {
		const { root, scope, feed, pages } = g.v(ChainChainRunInput, "chainChainRunInput")
		return r
			.match(ChainChainRunInput, { root, scope, feed, pages })
			.where(
				r.eq(root, r.param("root", ChainChainRunInput.fields.root)),
				r.eq(scope, r.param("scope", ChainChainRunInput.fields.scope))
			)
			.find({ root, scope, feed, pages })
	}),
	chainRequestChainRun: g.clocked(
		g.ChangeSet.empty(chainGraph)
			.insert(
				ChainScope,
				g.query(chainGraph).rule((r) => {
					const requested = r.relation("chainChainRunChainScope", {
						root: ChainScope.fields.root,
						scope: ChainScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(ChainRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				ChainChainRunInput,
				g.query(chainGraph).rule((r) => {
					const requested = r.relation("chainChainRunChainChainRunInput", {
						root: ChainChainRunInput.fields.root,
						scope: ChainChainRunInput.fields.scope,
						feed: ChainChainRunInput.fields.feed,
						pages: ChainChainRunInput.fields.pages
					})
					const { root, scope, feed, pages } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, feed, pages })
						.where(r.not(ChainRoot, { root }))
						.find({ root, scope, feed, pages })
				})
			)
			.insert(
				ChainRequestedWith,
				g
					.query(chainGraph)
					.rule((r) => {
						const requested = r.relation("chainChainRunChainRequestedWith", {
							root: ChainRequestedWith.fields.root,
							fingerprint: ChainRequestedWith.fields.fingerprint,
							input: ChainRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(ChainRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("chainChainRunChainRequestedWith", {
							root: ChainRequestedWith.fields.root,
							fingerprint: ChainRequestedWith.fields.fingerprint,
							input: ChainRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(ChainRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(ChainRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				ChainRoot,
				g.query(chainGraph).rule((r) => {
					const requested = r.relation("chainChainRunChainScope", {
						root: ChainScope.fields.root,
						scope: ChainScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("chainChainRunScope", ChainRoot.fields.root)),
							r.not(ChainRoot, { root })
						)
						.find({
							root,
							kind: ChainRootKind.handle("ChainRun"),
							key: r.param("chainChainRunKey", ChainRoot.fields.key),
							at: r.param("denNow", ChainRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainOutputsChainRunPage: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { seq, items, earlier } = g.v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageOutput, { root, step, seq, items, earlier })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, seq, items, earlier })
	}),
	chainOutputsChainRunPageNext: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { value } = g.v(ChainPageOutputNext, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageOutputNext, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainInputsChainRunPage: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { feed, seq, pages } = g.v(ChainPageInput, "input")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageInput, { root, step, feed, seq, pages })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, feed, seq, pages })
	}),
	chainInputsChainRunPageAfter: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { value } = g.v(ChainPageInputAfter, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageInputAfter, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainFailuresChainRunPage: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step })
	}),
	chainReadChainOrderedInput: g.query(chainGraph).rule((r) => {
		const { root, scope, feed, pages } = g.v(ChainOrderedInput, "chainOrderedInput")
		return r
			.match(ChainOrderedInput, { root, scope, feed, pages })
			.where(
				r.eq(root, r.param("root", ChainOrderedInput.fields.root)),
				r.eq(scope, r.param("scope", ChainOrderedInput.fields.scope))
			)
			.find({ root, scope, feed, pages })
	}),
	chainOutputsOrderedPage: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { seq, items, earlier } = g.v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageOutput, { root, step, seq, items, earlier })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, seq, items, earlier })
	}),
	chainOutputsOrderedPageNext: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { value } = g.v(ChainPageOutputNext, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageOutputNext, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainInputsOrderedPage: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { feed, seq, pages } = g.v(ChainPageInput, "input")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageInput, { root, step, feed, seq, pages })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, feed, seq, pages })
	}),
	chainInputsOrderedPageAfter: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		const { value } = g.v(ChainPageInputAfter, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainPageInputAfter, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainFailuresOrderedPage: g.query(chainGraph).rule((r) => {
		const { root, step, scope } = g.v(ChainStep, "step")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step })
	})
})

export const chainDenWorkload = g.workload(ChainDen, chainDenPrograms)

export const chainCoordinatorPrograms = Object.freeze({
	chainPromote: g.clocked(
		g.ChangeSet.empty(chainCoordination).insert(
			ChainServed,
			g.query(chainCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", ChainServed.fields.environment),
					at: r.param("denNow", ChainServed.fields.at),
					deployment: r.param("deployment", ChainServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainPause: g.ChangeSet.empty(chainCoordination).insert(ChainPaused, []),
	chainResume: g.ChangeSet.empty(chainCoordination).insert(ChainResumed, []),
	chainPauseTurns: g.query(chainCoordination).rule((r) => {
		const { target, turn } = g.v(ChainPaused, "chainPaused")
		return r.match(ChainPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	chainPausedAll: g.query(chainCoordination).rule((r) => {
		const { target, turn } = g.v(ChainPaused, "chainPaused")
		return r
			.match(ChainPaused, { target, turn })
			.where(r.not(ChainResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const chainCoordinatorWorkload = g.workload(ChainCoordinator, chainCoordinatorPrograms)

/** den's retiring role for the flow Chain: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const ChainRetirer = g.role(
	App,
	"chain_retirer",
	{ ...chainGraph.relations },
	{
		write: [
			"ChainScope",
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
			"ChainPageOutput",
			"ChainPageOutputNext",
			"ChainChainRunFinishOutput",
			"ChainOrderedFinishOutput",
			"ChainNext",
			"ChainPageReadWeights",
			"ChainPageReadEarlier",
			"ChainPageReadTree"
		]
	}
)

export const chainRetirerPrograms = Object.freeze({
	chainRetire: g.ChangeSet.empty(chainGraph).deleteWhere({
		ChainScope: { root: g.param("root", ChainRoot.fields.root) },
		ChainAdmitted: { root: g.param("root", ChainRoot.fields.root) },
		ChainSkipped: { root: g.param("root", ChainRoot.fields.root) },
		ChainStep: { root: g.param("root", ChainRoot.fields.root) },
		ChainStartStep: { root: g.param("root", ChainRoot.fields.root) },
		ChainFinish: { root: g.param("root", ChainRoot.fields.root) },
		ChainClaim: { root: g.param("root", ChainRoot.fields.root) },
		ChainEnded: { root: g.param("root", ChainRoot.fields.root) },
		ChainRetry: { root: g.param("root", ChainRoot.fields.root) },
		ChainFenced: { root: g.param("root", ChainRoot.fields.root) },
		ChainResult: { root: g.param("root", ChainRoot.fields.root) },
		ChainDone: { root: g.param("root", ChainRoot.fields.root) },
		ChainFailed: { root: g.param("root", ChainRoot.fields.root) },
		ChainHeld: { root: g.param("root", ChainRoot.fields.root) },
		ChainRefusal: { root: g.param("root", ChainRoot.fields.root) },
		ChainExhausted: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageInput: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageInputAfter: { root: g.param("root", ChainRoot.fields.root) },
		ChainChainRunInput: { root: g.param("root", ChainRoot.fields.root) },
		ChainOrderedInput: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageOutput: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageOutputNext: { root: g.param("root", ChainRoot.fields.root) },
		ChainChainRunFinishOutput: { root: g.param("root", ChainRoot.fields.root) },
		ChainOrderedFinishOutput: { root: g.param("root", ChainRoot.fields.root) },
		ChainNext: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageReadWeights: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageReadEarlier: { root: g.param("root", ChainRoot.fields.root) },
		ChainPageReadTree: { root: g.param("root", ChainRoot.fields.root) }
	})
})

export const chainRetirerWorkload = g.workload(ChainRetirer, chainRetirerPrograms)

/** The commits and declared reads of the flow Chain, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const chainCommitPrograms = Object.freeze({
	chainAuthenticated: g.clocked(
		g.query(chainGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainCommitPage: g.clocked(
		g.ChangeSet.union(
			g.ChangeSet.empty(chainGraph)
				.insert(ChainResult, [])
				.insert(ChainDone, [])
				.insert(ChainHeld, [])
				.insert(ChainPageOutput, [])
				.insert(ChainPageOutputNext, [])
				.insert(ChainPageReadWeights, [])
				.insert(ChainPageReadEarlier, [])
				.insert(ChainPageReadTree, [])
				.insert(ChainScope, [])
				.insert(ChainAdmitted, [])
				.insert(ChainFinish, [])
				.insert(ChainStartStep, [])
				.insert(ChainPageInput, [])
				.insert(ChainPageInputAfter, [])
				.insert(ChainNext, [])
				.insertAll(g.recordsFacts(chainGraph, ChainPageReadWeightsRecords)([]))
				.insertAll(g.recordsFacts(chainGraph, ChainPageReadEarlierRecords)([]))
				.insertAll(g.recordsFacts(chainGraph, ChainPageReadTreeRecords)([]))
				.insert(
					ChainStep,
					g.query(chainGraph).rule((r) => {
						const steps = r.relation("steps", {
							step: ChainStep.fields.step,
							kind: ChainStep.fields.kind,
							scope: ChainStep.fields.scope,
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
							root: r.param("root", ChainStep.fields.root)
						})
					})
				),
			declaredFlow.kinds[0].writes.changes(Loader)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainReadPage: g.query(Loader).reads(declaredFlow.kinds[0].reads.named),
	chainCommitChainRunFinish: g.ChangeSet.union(
		g.ChangeSet.empty(chainGraph)
			.insert(ChainResult, [])
			.insert(ChainDone, [])
			.insert(ChainHeld, [])
			.insert(ChainChainRunFinishOutput, []),
		declaredFlow.kinds[1].finish.writes.changes(Loader)
	),
	chainCommitOrderedFinish: g.ChangeSet.union(
		g.ChangeSet.empty(chainGraph)
			.insert(ChainResult, [])
			.insert(ChainDone, [])
			.insert(ChainHeld, [])
			.insert(ChainOrderedFinishOutput, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	)
})

export const chainCommits = g.workload(Loader, chainCommitPrograms)

/** The requests of the flow's roots the app's own write starts, each a ChangeSet the app's write commits beside its own: over the flow's graph, unioned with it, or, for a root whose input derives from its key, over the app's schema, sequenced after the strata whose facts it derives from. */
export const chainRequests = Object.freeze({
	Ordered: g.ChangeSet.empty(chainGraph)
		.insert(
			ChainScope,
			g.query(chainGraph).rule((r) => {
				const requested = r.relation("chainOrderedChainScope", {
					root: ChainScope.fields.root,
					scope: ChainScope.fields.scope
				})
				const { root, scope } = g.v(requested, "requested")
				return r
					.match(requested, { root, scope })
					.where(r.not(ChainRoot, { root }))
					.find({ root, scope })
			})
		)
		.insert(
			ChainOrderedInput,
			g.query(chainGraph).rule((r) => {
				const requested = r.relation("chainOrderedChainOrderedInput", {
					root: ChainOrderedInput.fields.root,
					scope: ChainOrderedInput.fields.scope,
					feed: ChainOrderedInput.fields.feed,
					pages: ChainOrderedInput.fields.pages
				})
				const { root, scope, feed, pages } = g.v(requested, "requested")
				return r
					.match(requested, { root, scope, feed, pages })
					.where(r.not(ChainRoot, { root }))
					.find({ root, scope, feed, pages })
			})
		)
		.insert(
			ChainRequestedWith,
			g
				.query(chainGraph)
				.rule((r) => {
					const requested = r.relation("chainOrderedChainRequestedWith", {
						root: ChainRequestedWith.fields.root,
						fingerprint: ChainRequestedWith.fields.fingerprint,
						input: ChainRequestedWith.fields.input
					})
					const { root, fingerprint, input } = g.v(requested, "requested")
					return r
						.match(requested, { root, fingerprint, input })
						.where(r.not(ChainRoot, { root }))
						.find({ root, fingerprint, input })
				})
				.rule((r) => {
					const requested = r.relation("chainOrderedChainRequestedWith", {
						root: ChainRequestedWith.fields.root,
						fingerprint: ChainRequestedWith.fields.fingerprint,
						input: ChainRequestedWith.fields.input
					})
					const { root, fingerprint, input } = g.v(requested, "requested")
					const { input: held } = g.v(ChainRequestedWith, "held")
					return r
						.match(requested, { root, fingerprint, input })
						.match(ChainRequestedWith, { root, fingerprint, input: held })
						.find({ root, fingerprint, input })
				})
		)
		.insert(
			ChainRoot,
			g.query(chainGraph).rule((r) => {
				const requested = r.relation("chainOrderedChainScope", {
					root: ChainScope.fields.root,
					scope: ChainScope.fields.scope
				})
				const { root, scope } = g.v(requested, "requested")
				return r
					.match(requested, { root, scope })
					.where(
						r.eq(scope, root),
						r.eq(root, r.param("chainOrderedScope", ChainRoot.fields.root)),
						r.not(ChainRoot, { root })
					)
					.find({
						root,
						kind: ChainRootKind.handle("Ordered"),
						key: r.param("chainOrderedKey", ChainRoot.fields.key),
						at: r.param("denNow", ChainRoot.fields.at)
					})
			})
		)
})

/** What each of the flow's requests inserts, by its root: a role whose write composes a request inserts these beside its write's own, and none of den's step commits; a role composing several of the flow's requests names each relation in its insert list once. */
export const chainRequestWrites = Object.freeze({
	Ordered: ["ChainScope", "ChainOrderedInput", "ChainRequestedWith", "ChainRoot"] as const
})
