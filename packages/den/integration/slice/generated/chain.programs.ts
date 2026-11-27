import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Chain to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
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
import { chain as declaredFlow } from "#integration/slice/flows.ts"
import {
	ChainKind,
	ChainRootKind,
	ChainOutcome,
	ChainRetryWhy,
	ChainPausable,
	chain_page_input_feed_nlhfmgjplihkf,
	chain_chain_run_input_feed_dcnlhjpledlkf,
	chain_ordered_input_feed_hbpmfpphpfngm,
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
	chain_page_input_jhliinhchcgno,
	chain_page_input_after_gdigbcabbnakb,
	chain_chain_run_input_glnkafcnkbnnn,
	chain_ordered_input_pbjpmafopnahk,
	chain_page_output_dniojohpmhcee,
	chain_page_output_next_pocjijjpkpono,
	chain_chain_run_finish_output_lhniobmdeemdb,
	chain_ordered_finish_output_nnemphmmfdblb,
	chain_next_bbflpfpnlejpm,
	chain_page_read_weights_agiabippcbobb,
	chain_page_read_earlier_dgehlbgebidjc,
	chain_page_read_tree_lakencnpkciin,
	ChainPaused,
	ChainResumed,
	ChainServed,
	chain_page_read_weights_agiabippcbobbRecords,
	chain_page_read_earlier_dgehlbgebidjcRecords,
	chain_page_read_tree_lakencnpkciinRecords,
	chainGraph,
	chainCoordination
} from "#integration/slice/generated/chain.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Chain: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ChainDen = role(
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
			"chain_page_input_jhliinhchcgno",
			"chain_page_input_after_gdigbcabbnakb",
			"chain_chain_run_input_glnkafcnkbnnn",
			"chain_ordered_input_pbjpmafopnahk",
			"chain_chain_run_finish_output_lhniobmdeemdb",
			"chain_ordered_finish_output_nnemphmmfdblb",
			"chain_page_read_weights_agiabippcbobb",
			"chain_page_read_earlier_dgehlbgebidjc",
			"chain_page_read_tree_lakencnpkciin",
			...Arr.map(chain_page_read_weights_agiabippcbobbRecords.relations, (rel) => rel.name),
			...Arr.map(chain_page_read_earlier_dgehlbgebidjcRecords.relations, (rel) => rel.name),
			...Arr.map(chain_page_read_tree_lakencnpkciinRecords.relations, (rel) => rel.name)
		]
	}
)

/** den's coordinator role for the flow Chain: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const ChainCoordinator = role(
	App,
	"chain_coordinator",
	{
		ChainKind,
		ChainRootKind,
		ChainOutcome,
		ChainRetryWhy,
		ChainPausable,
		chain_page_input_feed_nlhfmgjplihkf,
		chain_chain_run_input_feed_dcnlhjpledlkf,
		chain_ordered_input_feed_hbpmfpphpfngm,
		ChainPaused,
		ChainResumed,
		ChainServed
	},
	{ insert: ["ChainPaused", "ChainResumed", "ChainServed"] }
)

const chainPendingRead = query(ChainDen).rule((r) => {
	const { root, step, kind, scope, due } = v(ChainStep, "step")
	return r
		.match(ChainStep, { root, step, kind, scope, due })
		.where(r.not(ChainResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const chainRequestedRead = query(ChainDen).rule((r) => {
	const { scope } = v(ChainScope, "scope")
	return r
		.match(ChainRoot, { root: scope })
		.match(ChainScope, { root: scope, scope })
		.where(
			r.not(ChainAdmitted, { root: scope, scope }),
			r.not(ChainSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const chainRunningRead = query(ChainDen).rule((r) => {
	const { root, scope, step } = v(ChainFinish, "finish")
	return r
		.match(ChainFinish, { root, scope, step })
		.where(r.not(ChainResult, { root, step }))
		.find({ scope })
})

const chainLatestServed = query(ChainDen).rule((r) => {
	const { environment, at } = v(ChainServed, "served")
	return r
		.match(ChainServed, { environment, at })
		.where(r.eq(environment, r.param("environment", ChainServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const chainDenPrograms = Object.freeze({
	chainNow: clocked(
		query(chainGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainReading: clocked(
		query(ChainDen).reads({
			now: query(chainGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: query(ChainDen).rule((r) => {
				const { environment, at, deployment } = v(ChainServed, "served")
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
	chainClaim: clocked(
		ChangeSet.empty(chainGraph)
			.insertAllComputed(
				{ ChainClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("denNow", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(ChainEnded, [])
			.read("held", (delta) =>
				query(chainGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(ChainClaim), "added")
					return r
						.match(delta.added(ChainClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainRetry: clocked(
		ChangeSet.empty(chainGraph)
			.insert(ChainEnded, [])
			.insert(
				ChainRetry,
				query(chainGraph).rule((r) =>
					r.find({
						step: r.param("step", ChainRetry.fields.step),
						attempt: r.param("attempt", ChainRetry.fields.attempt),
						at: Type.cast(
							Num.add(
								Type.base(r.param("denNow", DenInstant)),
								Type.base(r.param("delay", DenDelay))
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
	chainAdmit: clocked(
		ChangeSet.empty(chainGraph)
			.insert(ChainAdmitted, [])
			.insert(ChainFinish, [])
			.insert(ChainStartStep, [])
			.insert(ChainScope, [])
			.insert(chain_page_input_jhliinhchcgno, [])
			.insert(chain_page_input_after_gdigbcabbnakb, [])
			.insert(
				ChainStep,
				query(chainGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: ChainStep.fields.step,
						kind: ChainStep.fields.kind,
						scope: ChainStep.fields.scope,
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
						root: r.param("root", ChainStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainSkip: ChangeSet.empty(chainGraph).insert(ChainSkipped, []),
	chainSkippedOf: query(chainGraph).rule((r) => {
		const { root, scope, by } = v(ChainSkipped, "chainSkipped")
		return r
			.match(ChainSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", ChainSkipped.fields.root)),
				r.eq(scope, r.param("scope", ChainSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	chainStepOf: query(chainGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(ChainStep, "chainStep")
		return r
			.match(ChainStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", ChainStep.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	chainResultOf: query(chainGraph).rule((r) => {
		const { root, step, outcome } = v(ChainResult, "chainResult")
		return r
			.match(ChainResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", ChainResult.fields.root)),
				r.eq(step, r.param("step", ChainResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	chainHeldOf: query(chainGraph).rule((r) => {
		const { root, step, attempt } = v(ChainHeld, "chainHeld")
		return r
			.match(ChainHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ChainHeld.fields.root)),
				r.eq(step, r.param("step", ChainHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	chainAdmittedOf: query(chainGraph).rule((r) => {
		const { root, scope } = v(ChainAdmitted, "chainAdmitted")
		return r
			.match(ChainAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", ChainAdmitted.fields.root)),
				r.eq(scope, r.param("scope", ChainAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	chainRootOf: query(chainGraph).rule((r) => {
		const { kind, key, at } = v(ChainRoot, "root")
		const { scope } = v(ChainScope, "scope")
		return r
			.match(ChainRoot, { root: scope, kind, key, at })
			.match(ChainScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", ChainRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	chainFinishedRoots: query(chainGraph)
		.rule((r) => {
			const { scope, step } = v(ChainFinish, "finish")
			return r
				.match(ChainFinish, { root: scope, scope, step })
				.match(ChainResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(ChainSkipped, "skipped")
			return r.match(ChainSkipped, { root: scope, scope }).find({ scope })
		}),
	chainClaimsOf: query(chainGraph).rule((r) => {
		const { root, step, attempt, until } = v(ChainClaim, "claim")
		return r
			.match(ChainClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	chainRetriesOf: query(chainGraph).rule((r) => {
		const { root, step, attempt, at, why } = v(ChainRetry, "retry")
		return r
			.match(ChainRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	chainFencedOf: query(chainGraph).rule((r) => {
		const { root, step, attempt } = v(ChainFenced, "fenced")
		return r
			.match(ChainFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(step, r.param("step", ChainStep.fields.step))
			)
			.find({ step, attempt })
	}),
	chainUnendedSteps: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
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
	chainFinished: query(chainGraph).rule((r) => {
		const { root, scope, step } = v(ChainFinish, "finish")
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
	chainSnapshot: query(ChainDen).reads({
		steps: chainPendingRead,
		claims: query(ChainDen).rule((r) => {
			const { root, step, attempt, until } = v(ChainClaim, "claim")
			return r
				.match(ChainClaim, { root, step, attempt, until })
				.where(r.not(ChainResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: query(ChainDen).rule((r) => {
			const { root, step, attempt, at, why } = v(ChainRetry, "retry")
			return r
				.match(ChainRetry, { root, step, attempt, at, why })
				.where(r.not(ChainResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: query(ChainDen).rule((r) => {
			const { root, step, attempt } = v(ChainFenced, "fenced")
			return r
				.match(ChainFenced, { root, step, attempt })
				.where(r.not(ChainResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: chainRequestedRead,
		running: chainRunningRead,
		roots: query(ChainDen).rule((r) => {
			const { kind, key, at } = v(ChainRoot, "root")
			const { scope } = v(ChainScope, "scope")
			return r
				.match(ChainRoot, { root: scope, kind, key, at })
				.match(ChainScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: query(ChainDen).rule((r) => {
			const { target, turn } = v(ChainPaused, "chainPaused")
			return r
				.match(ChainPaused, { target, turn })
				.where(r.not(ChainResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	chainReadchain_page_input_jhliinhchcgno: query(chainGraph).rule((r) => {
		const { root, step, feed, seq, pages } = v(
			chain_page_input_jhliinhchcgno,
			"chain_page_input_jhliinhchcgno"
		)
		return r
			.match(chain_page_input_jhliinhchcgno, { root, step, feed, seq, pages })
			.where(
				r.eq(root, r.param("root", chain_page_input_jhliinhchcgno.fields.root)),
				r.eq(step, r.param("step", chain_page_input_jhliinhchcgno.fields.step))
			)
			.find({ root, step, feed, seq, pages })
	}),
	chainReadchain_page_input_after_gdigbcabbnakb: query(chainGraph).rule((r) => {
		const { root, step, value } = v(
			chain_page_input_after_gdigbcabbnakb,
			"chain_page_input_after_gdigbcabbnakb"
		)
		return r
			.match(chain_page_input_after_gdigbcabbnakb, { root, step, value })
			.where(
				r.eq(root, r.param("root", chain_page_input_after_gdigbcabbnakb.fields.root)),
				r.eq(step, r.param("step", chain_page_input_after_gdigbcabbnakb.fields.step))
			)
			.find({ root, step, value })
	}),
	chainReadchain_chain_run_input_glnkafcnkbnnn: query(chainGraph).rule((r) => {
		const { root, scope, feed, pages } = v(
			chain_chain_run_input_glnkafcnkbnnn,
			"chain_chain_run_input_glnkafcnkbnnn"
		)
		return r
			.match(chain_chain_run_input_glnkafcnkbnnn, { root, scope, feed, pages })
			.where(
				r.eq(root, r.param("root", chain_chain_run_input_glnkafcnkbnnn.fields.root)),
				r.eq(scope, r.param("scope", chain_chain_run_input_glnkafcnkbnnn.fields.scope))
			)
			.find({ root, scope, feed, pages })
	}),
	chainRequestChainRun: clocked(
		ChangeSet.empty(chainGraph)
			.insert(
				ChainScope,
				query(chainGraph).rule((r) => {
					const requested = r.relation("chainChainRunChainScope", {
						root: ChainScope.fields.root,
						scope: ChainScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(ChainRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				chain_chain_run_input_glnkafcnkbnnn,
				query(chainGraph).rule((r) => {
					const requested = r.relation("chainChainRunchain_chain_run_input_glnkafcnkbnnn", {
						root: chain_chain_run_input_glnkafcnkbnnn.fields.root,
						scope: chain_chain_run_input_glnkafcnkbnnn.fields.scope,
						feed: chain_chain_run_input_glnkafcnkbnnn.fields.feed,
						pages: chain_chain_run_input_glnkafcnkbnnn.fields.pages
					})
					const { root, scope, feed, pages } = v(requested, "requested")
					return r
						.match(requested, { root, scope, feed, pages })
						.where(r.not(ChainRoot, { root }))
						.find({ root, scope, feed, pages })
				})
			)
			.insert(
				ChainRequestedWith,
				query(chainGraph)
					.rule((r) => {
						const requested = r.relation("chainChainRunChainRequestedWith", {
							root: ChainRequestedWith.fields.root,
							fingerprint: ChainRequestedWith.fields.fingerprint,
							input: ChainRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
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
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(ChainRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(ChainRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				ChainRoot,
				query(chainGraph).rule((r) => {
					const requested = r.relation("chainChainRunChainScope", {
						root: ChainScope.fields.root,
						scope: ChainScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
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
	chainOutputsChainRunPage: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { seq, items, earlier } = v(chain_page_output_dniojohpmhcee, "output")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_output_dniojohpmhcee, { root, step, seq, items, earlier })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, seq, items, earlier })
	}),
	chainOutputsChainRunPageNext: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { value } = v(chain_page_output_next_pocjijjpkpono, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_output_next_pocjijjpkpono, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainInputsChainRunPage: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { feed, seq, pages } = v(chain_page_input_jhliinhchcgno, "input")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_input_jhliinhchcgno, { root, step, feed, seq, pages })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, feed, seq, pages })
	}),
	chainInputsChainRunPageAfter: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { value } = v(chain_page_input_after_gdigbcabbnakb, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_input_after_gdigbcabbnakb, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainFailuresChainRunPage: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(ChainResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step })
	}),
	chainReadchain_ordered_input_pbjpmafopnahk: query(chainGraph).rule((r) => {
		const { root, scope, feed, pages } = v(
			chain_ordered_input_pbjpmafopnahk,
			"chain_ordered_input_pbjpmafopnahk"
		)
		return r
			.match(chain_ordered_input_pbjpmafopnahk, { root, scope, feed, pages })
			.where(
				r.eq(root, r.param("root", chain_ordered_input_pbjpmafopnahk.fields.root)),
				r.eq(scope, r.param("scope", chain_ordered_input_pbjpmafopnahk.fields.scope))
			)
			.find({ root, scope, feed, pages })
	}),
	chainOutputsOrderedPage: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { seq, items, earlier } = v(chain_page_output_dniojohpmhcee, "output")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_output_dniojohpmhcee, { root, step, seq, items, earlier })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, seq, items, earlier })
	}),
	chainOutputsOrderedPageNext: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { value } = v(chain_page_output_next_pocjijjpkpono, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_output_next_pocjijjpkpono, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainInputsOrderedPage: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { feed, seq, pages } = v(chain_page_input_jhliinhchcgno, "input")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_input_jhliinhchcgno, { root, step, feed, seq, pages })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, feed, seq, pages })
	}),
	chainInputsOrderedPageAfter: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
		const { value } = v(chain_page_input_after_gdigbcabbnakb, "part")
		return r
			.match(ChainStep, { root, step, kind: "Page", scope })
			.match(chain_page_input_after_gdigbcabbnakb, { root, step, value })
			.where(
				r.eq(root, r.param("root", ChainScope.fields.root)),
				r.eq(scope, r.param("scope", ChainScope.fields.scope))
			)
			.find({ step, value })
	}),
	chainFailuresOrderedPage: query(chainGraph).rule((r) => {
		const { root, step, scope } = v(ChainStep, "step")
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

export const chainDenWorkload = workload(ChainDen, chainDenPrograms)

export const chainCoordinatorPrograms = Object.freeze({
	chainPromote: clocked(
		ChangeSet.empty(chainCoordination).insert(
			ChainServed,
			query(chainCoordination).rule((r) =>
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
	chainPause: ChangeSet.empty(chainCoordination).insert(ChainPaused, []),
	chainResume: ChangeSet.empty(chainCoordination).insert(ChainResumed, []),
	chainPauseTurns: query(chainCoordination).rule((r) => {
		const { target, turn } = v(ChainPaused, "chainPaused")
		return r.match(ChainPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	chainPausedAll: query(chainCoordination).rule((r) => {
		const { target, turn } = v(ChainPaused, "chainPaused")
		return r
			.match(ChainPaused, { target, turn })
			.where(r.not(ChainResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const chainCoordinatorWorkload = workload(ChainCoordinator, chainCoordinatorPrograms)

/** den's retiring role for the flow Chain: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const ChainRetirer = role(
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
			"chain_page_input_jhliinhchcgno",
			"chain_page_input_after_gdigbcabbnakb",
			"chain_chain_run_input_glnkafcnkbnnn",
			"chain_ordered_input_pbjpmafopnahk",
			"chain_page_output_dniojohpmhcee",
			"chain_page_output_next_pocjijjpkpono",
			"chain_chain_run_finish_output_lhniobmdeemdb",
			"chain_ordered_finish_output_nnemphmmfdblb",
			"chain_next_bbflpfpnlejpm",
			"chain_page_read_weights_agiabippcbobb",
			"chain_page_read_earlier_dgehlbgebidjc",
			"chain_page_read_tree_lakencnpkciin"
		]
	}
)

export const chainRetirerPrograms = Object.freeze({
	chainRetire: ChangeSet.empty(chainGraph).deleteWhere({
		ChainScope: { root: param("root", ChainRoot.fields.root) },
		ChainAdmitted: { root: param("root", ChainRoot.fields.root) },
		ChainSkipped: { root: param("root", ChainRoot.fields.root) },
		ChainStep: { root: param("root", ChainRoot.fields.root) },
		ChainStartStep: { root: param("root", ChainRoot.fields.root) },
		ChainFinish: { root: param("root", ChainRoot.fields.root) },
		ChainClaim: { root: param("root", ChainRoot.fields.root) },
		ChainEnded: { root: param("root", ChainRoot.fields.root) },
		ChainRetry: { root: param("root", ChainRoot.fields.root) },
		ChainFenced: { root: param("root", ChainRoot.fields.root) },
		ChainResult: { root: param("root", ChainRoot.fields.root) },
		ChainDone: { root: param("root", ChainRoot.fields.root) },
		ChainFailed: { root: param("root", ChainRoot.fields.root) },
		ChainHeld: { root: param("root", ChainRoot.fields.root) },
		ChainRefusal: { root: param("root", ChainRoot.fields.root) },
		ChainExhausted: { root: param("root", ChainRoot.fields.root) },
		chain_page_input_jhliinhchcgno: { root: param("root", ChainRoot.fields.root) },
		chain_page_input_after_gdigbcabbnakb: { root: param("root", ChainRoot.fields.root) },
		chain_chain_run_input_glnkafcnkbnnn: { root: param("root", ChainRoot.fields.root) },
		chain_ordered_input_pbjpmafopnahk: { root: param("root", ChainRoot.fields.root) },
		chain_page_output_dniojohpmhcee: { root: param("root", ChainRoot.fields.root) },
		chain_page_output_next_pocjijjpkpono: { root: param("root", ChainRoot.fields.root) },
		chain_chain_run_finish_output_lhniobmdeemdb: { root: param("root", ChainRoot.fields.root) },
		chain_ordered_finish_output_nnemphmmfdblb: { root: param("root", ChainRoot.fields.root) },
		chain_next_bbflpfpnlejpm: { root: param("root", ChainRoot.fields.root) },
		chain_page_read_weights_agiabippcbobb: { root: param("root", ChainRoot.fields.root) },
		chain_page_read_earlier_dgehlbgebidjc: { root: param("root", ChainRoot.fields.root) },
		chain_page_read_tree_lakencnpkciin: { root: param("root", ChainRoot.fields.root) }
	})
})

export const chainRetirerWorkload = workload(ChainRetirer, chainRetirerPrograms)

/** The commits and declared reads of the flow Chain, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const chainCommitPrograms = Object.freeze({
	chainAuthenticated: clocked(
		query(chainGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainCommitPage: clocked(
		ChangeSet.union(
			ChangeSet.empty(chainGraph)
				.insert(ChainResult, [])
				.insert(ChainDone, [])
				.insert(ChainHeld, [])
				.insert(chain_page_output_dniojohpmhcee, [])
				.insert(chain_page_output_next_pocjijjpkpono, [])
				.insert(chain_page_read_weights_agiabippcbobb, [])
				.insert(chain_page_read_earlier_dgehlbgebidjc, [])
				.insert(chain_page_read_tree_lakencnpkciin, [])
				.insert(ChainScope, [])
				.insert(ChainAdmitted, [])
				.insert(ChainFinish, [])
				.insert(ChainStartStep, [])
				.insert(chain_page_input_jhliinhchcgno, [])
				.insert(chain_page_input_after_gdigbcabbnakb, [])
				.insert(chain_next_bbflpfpnlejpm, [])
				.insertAll(recordsFacts(chainGraph, chain_page_read_weights_agiabippcbobbRecords)([]))
				.insertAll(recordsFacts(chainGraph, chain_page_read_earlier_dgehlbgebidjcRecords)([]))
				.insertAll(recordsFacts(chainGraph, chain_page_read_tree_lakencnpkciinRecords)([]))
				.insert(
					ChainStep,
					query(chainGraph).rule((r) => {
						const steps = r.relation("steps", {
							step: ChainStep.fields.step,
							kind: ChainStep.fields.kind,
							scope: ChainStep.fields.scope,
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
							root: r.param("root", ChainStep.fields.root)
						})
					})
				),
			declaredFlow.kinds[0].writes.changes(Loader)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	chainReadPage: query(Loader).reads(declaredFlow.kinds[0].reads.named),
	chainCommitChainRunFinish: ChangeSet.union(
		ChangeSet.empty(chainGraph)
			.insert(ChainResult, [])
			.insert(ChainDone, [])
			.insert(ChainHeld, [])
			.insert(chain_chain_run_finish_output_lhniobmdeemdb, []),
		declaredFlow.kinds[1].finish.writes.changes(Loader)
	),
	chainCommitOrderedFinish: ChangeSet.union(
		ChangeSet.empty(chainGraph)
			.insert(ChainResult, [])
			.insert(ChainDone, [])
			.insert(ChainHeld, [])
			.insert(chain_ordered_finish_output_nnemphmmfdblb, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	)
})

export const chainCommits = workload(Loader, chainCommitPrograms)

/** The requests of the flow's roots the app's own write starts, each a ChangeSet the app's write commits beside its own: over the flow's graph, unioned with it, or, for a root whose input derives from its key, over the app's schema, sequenced after the strata whose facts it derives from. */
export const chainRequests = Object.freeze({
	Ordered: ChangeSet.empty(chainGraph)
		.insert(
			ChainScope,
			query(chainGraph).rule((r) => {
				const requested = r.relation("chainOrderedChainScope", {
					root: ChainScope.fields.root,
					scope: ChainScope.fields.scope
				})
				const { root, scope } = v(requested, "requested")
				return r
					.match(requested, { root, scope })
					.where(r.not(ChainRoot, { root }))
					.find({ root, scope })
			})
		)
		.insert(
			chain_ordered_input_pbjpmafopnahk,
			query(chainGraph).rule((r) => {
				const requested = r.relation("chainOrderedchain_ordered_input_pbjpmafopnahk", {
					root: chain_ordered_input_pbjpmafopnahk.fields.root,
					scope: chain_ordered_input_pbjpmafopnahk.fields.scope,
					feed: chain_ordered_input_pbjpmafopnahk.fields.feed,
					pages: chain_ordered_input_pbjpmafopnahk.fields.pages
				})
				const { root, scope, feed, pages } = v(requested, "requested")
				return r
					.match(requested, { root, scope, feed, pages })
					.where(r.not(ChainRoot, { root }))
					.find({ root, scope, feed, pages })
			})
		)
		.insert(
			ChainRequestedWith,
			query(chainGraph)
				.rule((r) => {
					const requested = r.relation("chainOrderedChainRequestedWith", {
						root: ChainRequestedWith.fields.root,
						fingerprint: ChainRequestedWith.fields.fingerprint,
						input: ChainRequestedWith.fields.input
					})
					const { root, fingerprint, input } = v(requested, "requested")
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
					const { root, fingerprint, input } = v(requested, "requested")
					const { input: held } = v(ChainRequestedWith, "held")
					return r
						.match(requested, { root, fingerprint, input })
						.match(ChainRequestedWith, { root, fingerprint, input: held })
						.find({ root, fingerprint, input })
				})
		)
		.insert(
			ChainRoot,
			query(chainGraph).rule((r) => {
				const requested = r.relation("chainOrderedChainScope", {
					root: ChainScope.fields.root,
					scope: ChainScope.fields.scope
				})
				const { root, scope } = v(requested, "requested")
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
	Ordered: [
		"ChainScope",
		"chain_ordered_input_pbjpmafopnahk",
		"ChainRequestedWith",
		"ChainRoot"
	] as const
})
