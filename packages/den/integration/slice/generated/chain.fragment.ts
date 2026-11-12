import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Chain to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	contract,
	key,
	natural,
	on,
	pg,
	pred,
	relation,
	select
} from "@bjornpagen/grizzle"

const Seq = contract("Seq", pg.bigint)

export const ChainKind = closed("ChainKind", ["Page", "ChainRunFinish"])
export const ChainJoin = closed("ChainJoin", ["ChainRun"])
export const ChainOutcome = closed("ChainOutcome", ["done", "failed"])
export const ChainPageInputFeed = closed("ChainPageInputFeed", ["news", "sport"])
export const ChainChainRunInputFeed = closed("ChainChainRunInputFeed", ["news", "sport"])

export const ChainScope = relation("ChainScope", { scope: DenScope, kind: closedId(ChainJoin) }, [
	"scope"
])
export const ChainRoot = relation("ChainRoot", { scope: DenScope, key: Text }, ["scope"])
export const ChainWithin = relation("ChainWithin", { scope: DenScope, parent: DenScope }, ["scope"])
export const ChainStep = relation(
	"ChainStep",
	{ step: DenStep, kind: closedId(ChainKind), scope: DenScope },
	["step"]
)
export const ChainStartStep = relation(
	"ChainStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep },
	["scope", "ordinal"]
)
export const ChainStartScope = relation(
	"ChainStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope },
	["scope", "ordinal"]
)
export const ChainFinish = relation("ChainFinish", { scope: DenScope, step: DenStep }, ["scope"])
export const ChainClaim = relation(
	"ChainClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const ChainResult = relation(
	"ChainResult",
	{ step: DenStep, outcome: closedId(ChainOutcome) },
	["step"]
)
export const ChainHeld = relation("ChainHeld", { step: DenStep, attempt: natural }, ["step"])
export const ChainRefusal = relation("ChainRefusal", { step: DenStep, law: Text }, ["step"])
export const ChainExhausted = relation("ChainExhausted", { step: DenStep, attempts: natural }, [
	"step"
])
export const ChainNext = relation("ChainNext", { from: DenStep, ordinal: natural, to: DenStep }, [
	"from",
	"ordinal"
])
export const ChainPageInput = relation(
	"ChainPageInput",
	{ step: DenStep, feed: closedId(ChainPageInputFeed), seq: Seq, pages: pg.bigint },
	["step"]
)
export const ChainPageInputAfter = relation("ChainPageInputAfter", { step: DenStep, value: Text }, [
	"step"
])
export const ChainPageOutput = relation(
	"ChainPageOutput",
	{ step: DenStep, seq: Seq, items: pg.bigint },
	["step"]
)
export const ChainPageOutputNext = relation("ChainPageOutputNext", { step: DenStep, value: Text }, [
	"step"
])
export const ChainChainRunInput = relation(
	"ChainChainRunInput",
	{ scope: DenScope, feed: closedId(ChainChainRunInputFeed), pages: pg.bigint },
	["scope"]
)

export const chainFragment = Object.freeze({
	relations: Object.freeze({
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
	}),
	laws: Object.freeze([
		contained(on(ChainRoot, "scope"), on(ChainScope, "scope")),
		contained(on(ChainWithin, "scope"), on(ChainScope, "scope")),
		contained(on(ChainWithin, "parent"), on(ChainScope, "scope")),
		contained(on(ChainStep, "scope"), on(ChainScope, "scope")),
		contained(on(ChainStartStep, "scope"), on(ChainScope, "scope")),
		contained(on(ChainStartStep, "step"), on(ChainStep, "step")),
		key(on(ChainStartStep, "step")),
		contained(on(ChainStartScope, "scope"), on(ChainScope, "scope")),
		contained(on(ChainStartScope, "child"), on(ChainScope, "scope")),
		key(on(ChainStartScope, "child")),
		contained(on(ChainFinish, "scope"), on(ChainScope, "scope")),
		contained(on(ChainFinish, "step"), on(ChainStep, "step")),
		key(on(ChainFinish, "step")),
		contained(on(ChainClaim, "step"), on(ChainStep, "step")),
		check("AttemptFromOne", ChainClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(ChainClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(ChainClaim, "step", "attempt")
		),
		contained(on(ChainResult, "step"), on(ChainStep, "step")),
		contained(on(ChainHeld, "step", "attempt"), on(ChainClaim, "step", "attempt")),
		contained(on(ChainHeld, "step"), on(ChainResult, "step")),
		contained(
			on(ChainRefusal, "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(
			on(ChainExhausted, "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(on(ChainNext, "from"), on(ChainPageInput, "step")),
		contained(on(ChainNext, "to"), on(ChainPageInput, "step")),
		key(on(ChainNext, "to")),
		contained(
			on(ChainPageInput, "step"),
			on(
				select(ChainStep, (row) => row.eq(row.kind, "Page")),
				"step"
			)
		),
		contained(on(ChainPageInputAfter, "step"), on(ChainPageInput, "step")),
		contained(on(ChainPageOutput, "step"), on(ChainPageInput, "step")),
		contained(
			on(ChainPageOutput, "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(on(ChainPageOutputNext, "step"), on(ChainPageOutput, "step")),
		contained(
			on(ChainChainRunInput, "scope"),
			on(
				select(ChainScope, (row) => row.eq(row.kind, "ChainRun")),
				"scope"
			)
		)
	])
})
