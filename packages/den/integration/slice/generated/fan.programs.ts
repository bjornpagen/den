/** The programs den lowered the flow Fan to, over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	FanKind,
	FanJoin,
	FanOutcome,
	FanScope,
	FanRoot,
	FanWithin,
	FanStep,
	FanStartStep,
	FanStartScope,
	FanFinish,
	FanClaim,
	FanResult,
	FanHeld,
	FanRefusal,
	FanExhausted,
	FanSquareInput,
	FanSquareOutput,
	FanBatchInput,
	FanFanRunInput
} from "#integration/slice/generated/fan.fragment.ts"

export const FanWorker = role(
	App,
	"fan_worker",
	{
		FanKind,
		FanJoin,
		FanOutcome,
		FanScope,
		FanRoot,
		FanWithin,
		FanStep,
		FanStartStep,
		FanStartScope,
		FanFinish,
		FanClaim,
		FanResult,
		FanHeld,
		FanRefusal,
		FanExhausted,
		FanSquareInput,
		FanSquareOutput,
		FanBatchInput,
		FanFanRunInput,
		Tally: App.relations.Tally,
		Settled: App.relations.Settled
	},
	{
		insert: [
			"FanScope",
			"FanRoot",
			"FanWithin",
			"FanStep",
			"FanStartStep",
			"FanStartScope",
			"FanFinish",
			"FanClaim",
			"FanResult",
			"FanHeld",
			"FanRefusal",
			"FanExhausted",
			"FanSquareInput",
			"FanSquareOutput",
			"FanBatchInput",
			"FanFanRunInput",
			"Tally",
			"Settled"
		]
	}
)

export const fanPrograms = Object.freeze({
	fanClaim: ChangeSet.empty(FanWorker).insert(FanClaim, []),
	fanRefuse: ChangeSet.empty(FanWorker)
		.insert(FanResult, [])
		.insert(FanHeld, [])
		.insert(FanRefusal, []),
	fanExhaust: ChangeSet.empty(FanWorker)
		.insert(FanResult, [])
		.insert(FanHeld, [])
		.insert(FanExhausted, []),
	fanFinish: ChangeSet.empty(FanWorker).insert(FanFinish, []).insert(FanStep, []),
	fanStepOf: FanStep,
	fanResultOf: FanResult,
	fanHeldOf: FanHeld,
	fanScopeOf: FanScope,
	fanWithinOf: FanWithin,
	fanPending: query(FanWorker).rule((r) => {
		const { step, kind, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { step, kind, scope })
			.where(r.not(FanResult, { step }))
			.find({ step, kind, scope })
	}),
	fanPendingClaims: query(FanWorker).rule((r) => {
		const { step, attempt, until } = v(FanClaim, "claim")
		return r
			.match(FanClaim, { step, attempt, until })
			.where(r.not(FanResult, { step }))
			.find({ step, attempt, until })
	}),
	fanOpenScopes: query(FanWorker).rule((r) => {
		const { scope } = v(FanScope, "scope")
		return r.match(FanScope, { scope }).where(r.not(FanFinish, { scope })).find({ scope })
	}),
	fanStepsIn: query(FanWorker)
		.rule((r) => {
			const { step, scope } = v(FanStep, "step")
			return r
				.match(FanStep, { step, scope })
				.match(FanResult, { step })
				.where(
					r.eq(scope, r.param("scope", FanScope.fields.scope)),
					r.not(FanFinish, { scope, step })
				)
				.find({ step, done: true })
		})
		.rule((r) => {
			const { step, scope } = v(FanStep, "step")
			return r
				.match(FanStep, { step, scope })
				.where(
					r.eq(scope, r.param("scope", FanScope.fields.scope)),
					r.not(FanResult, { step }),
					r.not(FanFinish, { scope, step })
				)
				.find({ step, done: false })
		}),
	fanScopesIn: query(FanWorker)
		.rule((r) => {
			const { scope, parent } = v(FanWithin, "within")
			const { step } = v(FanFinish, "finish")
			return r
				.match(FanWithin, { scope, parent })
				.match(FanFinish, { scope, step })
				.match(FanResult, { step })
				.where(r.eq(parent, r.param("scope", FanScope.fields.scope)))
				.find({ child: scope, done: true })
		})
		.rule((r) => {
			const { scope, parent } = v(FanWithin, "within")
			return r
				.match(FanWithin, { scope, parent })
				.where(r.eq(parent, r.param("scope", FanScope.fields.scope)), r.not(FanFinish, { scope }))
				.find({ child: scope, done: false })
		})
		.rule((r) => {
			const { scope, parent } = v(FanWithin, "within")
			const { step } = v(FanFinish, "finish")
			return r
				.match(FanWithin, { scope, parent })
				.match(FanFinish, { scope, step })
				.where(r.eq(parent, r.param("scope", FanScope.fields.scope)), r.not(FanResult, { step }))
				.find({ child: scope, done: false })
		}),
	fanCommitSquare: ChangeSet.empty(FanWorker)
		.insert(FanResult, [])
		.insert(FanHeld, [])
		.insert(FanSquareOutput, []),
	fanReadFanSquareInput: FanSquareInput,
	fanCommitBatchFinish: ChangeSet.empty(FanWorker)
		.insert(FanResult, [])
		.insert(FanHeld, [])
		.insert(App.relations.Tally, []),
	fanReadFanBatchInput: FanBatchInput,
	fanOutputsBatchSquare: query(FanWorker).rule((r) => {
		const { step, scope } = v(FanStep, "step")
		const { square } = v(FanSquareOutput, "output")
		return r
			.match(FanStep, { step, kind: "Square", scope })
			.match(FanSquareOutput, { step, square })
			.where(r.eq(scope, r.param("scope", FanScope.fields.scope)))
			.find({ step, square })
	}),
	fanCommitFanRunFinish: ChangeSet.empty(FanWorker)
		.insert(FanResult, [])
		.insert(FanHeld, [])
		.insert(App.relations.Settled, []),
	fanStartFanRun: ChangeSet.empty(FanWorker)
		.insert(FanRoot, [])
		.insert(FanFanRunInput, [])
		.insert(FanStep, [])
		.insert(FanScope, [])
		.insert(FanWithin, [])
		.insert(FanStartStep, [])
		.insert(FanStartScope, [])
		.insert(FanSquareInput, [])
		.insert(FanBatchInput, []),
	fanReadFanFanRunInput: FanFanRunInput
})

export const fanWorkload = workload(FanWorker, fanPrograms)
