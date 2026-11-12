/** The programs den lowered the flow Chain to, over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	ChainKind,
	ChainJoin,
	ChainOutcome,
	ChainPageInputFeed,
	ChainChainRunInputFeed,
	ChainScope,
	ChainRoot,
	ChainWithin,
	ChainStep,
	ChainStartStep,
	ChainStartScope,
	ChainFinish,
	ChainClaim,
	ChainResult,
	ChainHeld,
	ChainRefusal,
	ChainExhausted,
	ChainNext,
	ChainPageInput,
	ChainPageInputAfter,
	ChainPageOutput,
	ChainPageOutputNext,
	ChainChainRunInput
} from "#integration/slice/generated/chain.fragment.ts"

export const ChainWorker = role(
	App,
	"chain_worker",
	{
		ChainKind,
		ChainJoin,
		ChainOutcome,
		ChainPageInputFeed,
		ChainChainRunInputFeed,
		ChainScope,
		ChainRoot,
		ChainWithin,
		ChainStep,
		ChainStartStep,
		ChainStartScope,
		ChainFinish,
		ChainClaim,
		ChainResult,
		ChainHeld,
		ChainRefusal,
		ChainExhausted,
		ChainNext,
		ChainPageInput,
		ChainPageInputAfter,
		ChainPageOutput,
		ChainPageOutputNext,
		ChainChainRunInput,
		Item: App.relations.Item,
		Cursor: App.relations.Cursor
	},
	{
		insert: [
			"ChainScope",
			"ChainRoot",
			"ChainWithin",
			"ChainStep",
			"ChainStartStep",
			"ChainStartScope",
			"ChainFinish",
			"ChainClaim",
			"ChainResult",
			"ChainHeld",
			"ChainRefusal",
			"ChainExhausted",
			"ChainNext",
			"ChainPageInput",
			"ChainPageInputAfter",
			"ChainPageOutput",
			"ChainPageOutputNext",
			"ChainChainRunInput",
			"Item",
			"Cursor"
		]
	}
)

export const chainPrograms = Object.freeze({
	chainClaim: ChangeSet.empty(ChainWorker).insert(ChainClaim, []),
	chainRefuse: ChangeSet.empty(ChainWorker)
		.insert(ChainResult, [])
		.insert(ChainHeld, [])
		.insert(ChainRefusal, []),
	chainExhaust: ChangeSet.empty(ChainWorker)
		.insert(ChainResult, [])
		.insert(ChainHeld, [])
		.insert(ChainExhausted, []),
	chainFinish: ChangeSet.empty(ChainWorker).insert(ChainFinish, []).insert(ChainStep, []),
	chainStepOf: ChainStep,
	chainResultOf: ChainResult,
	chainHeldOf: ChainHeld,
	chainScopeOf: ChainScope,
	chainWithinOf: ChainWithin,
	chainPending: query(ChainWorker).rule((r) => {
		const { step, kind, scope } = v(ChainStep, "step")
		return r
			.match(ChainStep, { step, kind, scope })
			.where(r.not(ChainResult, { step }))
			.find({ step, kind, scope })
	}),
	chainPendingClaims: query(ChainWorker).rule((r) => {
		const { step, attempt, until } = v(ChainClaim, "claim")
		return r
			.match(ChainClaim, { step, attempt, until })
			.where(r.not(ChainResult, { step }))
			.find({ step, attempt, until })
	}),
	chainOpenScopes: query(ChainWorker).rule((r) => {
		const { scope } = v(ChainScope, "scope")
		return r.match(ChainScope, { scope }).where(r.not(ChainFinish, { scope })).find({ scope })
	}),
	chainStepsIn: query(ChainWorker)
		.rule((r) => {
			const { step, scope } = v(ChainStep, "step")
			return r
				.match(ChainStep, { step, scope })
				.match(ChainResult, { step })
				.where(
					r.eq(scope, r.param("scope", ChainScope.fields.scope)),
					r.not(ChainFinish, { scope, step })
				)
				.find({ step, done: true })
		})
		.rule((r) => {
			const { step, scope } = v(ChainStep, "step")
			return r
				.match(ChainStep, { step, scope })
				.where(
					r.eq(scope, r.param("scope", ChainScope.fields.scope)),
					r.not(ChainResult, { step }),
					r.not(ChainFinish, { scope, step })
				)
				.find({ step, done: false })
		}),
	chainScopesIn: query(ChainWorker)
		.rule((r) => {
			const { scope, parent } = v(ChainWithin, "within")
			const { step } = v(ChainFinish, "finish")
			return r
				.match(ChainWithin, { scope, parent })
				.match(ChainFinish, { scope, step })
				.match(ChainResult, { step })
				.where(r.eq(parent, r.param("scope", ChainScope.fields.scope)))
				.find({ child: scope, done: true })
		})
		.rule((r) => {
			const { scope, parent } = v(ChainWithin, "within")
			return r
				.match(ChainWithin, { scope, parent })
				.where(
					r.eq(parent, r.param("scope", ChainScope.fields.scope)),
					r.not(ChainFinish, { scope })
				)
				.find({ child: scope, done: false })
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
				.find({ child: scope, done: false })
		}),
	chainCommitPage: ChangeSet.empty(ChainWorker)
		.insert(ChainResult, [])
		.insert(ChainHeld, [])
		.insert(ChainPageOutput, [])
		.insert(ChainPageOutputNext, [])
		.insert(ChainStep, [])
		.insert(ChainScope, [])
		.insert(ChainWithin, [])
		.insert(ChainStartStep, [])
		.insert(ChainStartScope, [])
		.insert(ChainPageInput, [])
		.insert(ChainPageInputAfter, [])
		.insert(ChainNext, [])
		.insert(App.relations.Item, []),
	chainReadChainPageInput: ChainPageInput,
	chainReadChainPageInputAfter: ChainPageInputAfter,
	chainCommitChainRunFinish: ChangeSet.empty(ChainWorker)
		.insert(ChainResult, [])
		.insert(ChainHeld, [])
		.insert(App.relations.Cursor, []),
	chainStartChainRun: ChangeSet.empty(ChainWorker)
		.insert(ChainRoot, [])
		.insert(ChainChainRunInput, [])
		.insert(ChainStep, [])
		.insert(ChainScope, [])
		.insert(ChainWithin, [])
		.insert(ChainStartStep, [])
		.insert(ChainStartScope, [])
		.insert(ChainPageInput, [])
		.insert(ChainPageInputAfter, [])
		.insert(ChainNext, []),
	chainReadChainChainRunInput: ChainChainRunInput,
	chainOutputsChainRunPage: query(ChainWorker).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { seq, items } = v(ChainPageOutput, "output")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutput, { step, seq, items })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, seq, items })
	}),
	chainOutputsChainRunPageNext: query(ChainWorker).rule((r) => {
		const { step, scope } = v(ChainStep, "step")
		const { value } = v(ChainPageOutputNext, "value")
		return r
			.match(ChainStep, { step, kind: "Page", scope })
			.match(ChainPageOutputNext, { step, value })
			.where(r.eq(scope, r.param("scope", ChainScope.fields.scope)))
			.find({ step, value })
	})
})

export const chainWorkload = workload(ChainWorker, chainPrograms)
