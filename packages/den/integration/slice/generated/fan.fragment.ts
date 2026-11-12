import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Fan to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	key,
	natural,
	on,
	pg,
	pred,
	relation,
	select
} from "@bjornpagen/grizzle"

export const FanKind = closed("FanKind", ["Square", "BatchFinish", "FanRunFinish"])
export const FanJoin = closed("FanJoin", ["Batch", "FanRun"])
export const FanOutcome = closed("FanOutcome", ["done", "failed"])

export const FanScope = relation("FanScope", { scope: DenScope, kind: closedId(FanJoin) }, [
	"scope"
])
export const FanRoot = relation("FanRoot", { scope: DenScope, key: Text }, ["scope"])
export const FanWithin = relation("FanWithin", { scope: DenScope, parent: DenScope }, ["scope"])
export const FanStep = relation(
	"FanStep",
	{ step: DenStep, kind: closedId(FanKind), scope: DenScope },
	["step"]
)
export const FanStartStep = relation(
	"FanStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep },
	["scope", "ordinal"]
)
export const FanStartScope = relation(
	"FanStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope },
	["scope", "ordinal"]
)
export const FanFinish = relation("FanFinish", { scope: DenScope, step: DenStep }, ["scope"])
export const FanClaim = relation(
	"FanClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const FanResult = relation("FanResult", { step: DenStep, outcome: closedId(FanOutcome) }, [
	"step"
])
export const FanHeld = relation("FanHeld", { step: DenStep, attempt: natural }, ["step"])
export const FanRefusal = relation("FanRefusal", { step: DenStep, law: Text }, ["step"])
export const FanExhausted = relation("FanExhausted", { step: DenStep, attempts: natural }, ["step"])
export const FanSquareInput = relation(
	"FanSquareInput",
	{ step: DenStep, batch: Text, n: pg.bigint },
	["step"]
)
export const FanSquareOutput = relation("FanSquareOutput", { step: DenStep, square: pg.bigint }, [
	"step"
])
export const FanBatchInput = relation(
	"FanBatchInput",
	{ scope: DenScope, batch: Text, size: pg.bigint },
	["scope"]
)
export const FanFanRunInput = relation(
	"FanFanRunInput",
	{ scope: DenScope, batch: Text, size: pg.bigint },
	["scope"]
)

export const fanFragment = Object.freeze({
	relations: Object.freeze({
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
	}),
	laws: Object.freeze([
		contained(on(FanRoot, "scope"), on(FanScope, "scope")),
		contained(on(FanWithin, "scope"), on(FanScope, "scope")),
		contained(on(FanWithin, "parent"), on(FanScope, "scope")),
		contained(on(FanStep, "scope"), on(FanScope, "scope")),
		contained(on(FanStartStep, "scope"), on(FanScope, "scope")),
		contained(on(FanStartStep, "step"), on(FanStep, "step")),
		key(on(FanStartStep, "step")),
		contained(on(FanStartScope, "scope"), on(FanScope, "scope")),
		contained(on(FanStartScope, "child"), on(FanScope, "scope")),
		key(on(FanStartScope, "child")),
		contained(on(FanFinish, "scope"), on(FanScope, "scope")),
		contained(on(FanFinish, "step"), on(FanStep, "step")),
		key(on(FanFinish, "step")),
		contained(on(FanClaim, "step"), on(FanStep, "step")),
		check("AttemptFromOne", FanClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(FanClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(FanClaim, "step", "attempt")
		),
		contained(on(FanResult, "step"), on(FanStep, "step")),
		contained(on(FanHeld, "step", "attempt"), on(FanClaim, "step", "attempt")),
		contained(on(FanHeld, "step"), on(FanResult, "step")),
		contained(
			on(FanRefusal, "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(
			on(FanExhausted, "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(
			on(FanSquareInput, "step"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Square")),
				"step"
			)
		),
		contained(on(FanSquareOutput, "step"), on(FanSquareInput, "step")),
		contained(
			on(FanSquareOutput, "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(
			on(FanBatchInput, "scope"),
			on(
				select(FanScope, (row) => row.eq(row.kind, "Batch")),
				"scope"
			)
		),
		contained(
			on(FanFanRunInput, "scope"),
			on(
				select(FanScope, (row) => row.eq(row.kind, "FanRun")),
				"scope"
			)
		)
	])
})
