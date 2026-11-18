import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Chain to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	contract,
	fragment,
	key,
	natural,
	on,
	pg,
	pred,
	race,
	relation,
	select
} from "@bjornpagen/grizzle"
import { Weight } from "#integration/slice/relations.ts"

const Seq = contract("Seq", pg.bigint)

export const ChainKind = closed("ChainKind", ["Page", "ChainRunFinish", "OrderedFinish"])
export const ChainJoin = closed("ChainJoin", ["ChainRun", "Ordered"])
export const ChainOutcome = closed("ChainOutcome", ["done", "failed"])
export const ChainPausable = closed("ChainPausable", ["ChainRun", "Ordered"])
export const ChainPageInputFeed = closed("ChainPageInputFeed", ["news", "sport"])
export const ChainChainRunInputFeed = closed("ChainChainRunInputFeed", ["news", "sport"])
export const ChainOrderedInputFeed = closed("ChainOrderedInputFeed", ["news", "sport"])

export const ChainScope = relation("ChainScope", { scope: DenScope, kind: closedId(ChainJoin) }, [
	"scope"
])
export const ChainRoot = relation("ChainRoot", { scope: DenScope, key: Text, at: DenInstant }, [
	"scope"
])
export const ChainWithin = relation("ChainWithin", { scope: DenScope, parent: DenScope }, ["scope"])
export const ChainAdmitted = relation("ChainAdmitted", { scope: DenScope }, ["scope"])
export const ChainSkipped = relation("ChainSkipped", { scope: DenScope, by: DenScope }, ["scope"])
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
export const ChainDue = relation("ChainDue", { step: DenStep, at: DenInstant }, ["step"])
export const ChainClaim = relation(
	"ChainClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const ChainRetry = relation(
	"ChainRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean },
	["step", "attempt"]
)
export const ChainFenced = relation("ChainFenced", { step: DenStep, attempt: natural }, [
	"step",
	"attempt"
])
export const ChainResult = relation(
	"ChainResult",
	{ step: DenStep, outcome: closedId(ChainOutcome) },
	["step"]
)
export const ChainDone = relation("ChainDone", { step: DenStep }, ["step"])
export const ChainFailed = relation("ChainFailed", { step: DenStep }, ["step"])
export const ChainHeld = relation("ChainHeld", { step: DenStep, attempt: natural }, ["step"])
export const ChainRefusal = relation("ChainRefusal", { step: DenStep, law: Text }, ["step"])
export const ChainExhausted = relation("ChainExhausted", { step: DenStep, attempts: natural }, [
	"step"
])
export const ChainPageInput = relation(
	"ChainPageInput",
	{ step: DenStep, feed: closedId(ChainPageInputFeed), seq: Seq, pages: pg.bigint },
	["step"]
)
export const ChainPageInputAfter = relation("ChainPageInputAfter", { step: DenStep, value: Text }, [
	"step"
])
export const ChainChainRunInput = relation(
	"ChainChainRunInput",
	{ scope: DenScope, feed: closedId(ChainChainRunInputFeed), pages: pg.bigint },
	["scope"]
)
export const ChainOrderedInput = relation(
	"ChainOrderedInput",
	{ scope: DenScope, feed: closedId(ChainOrderedInputFeed), pages: pg.bigint },
	["scope"]
)
export const ChainNext = relation("ChainNext", { from: DenStep, ordinal: natural, to: DenStep }, [
	"from",
	"ordinal"
])
export const ChainPageOutput = relation(
	"ChainPageOutput",
	{ step: DenStep, seq: Seq, items: pg.bigint },
	["step"]
)
export const ChainPageOutputNext = relation("ChainPageOutputNext", { step: DenStep, value: Text }, [
	"step"
])
export const ChainPageWeightsRead = relation(
	"ChainPageWeightsRead",
	{ step: DenStep, ordinal: natural, feed: Weight.fields.feed, factor: Weight.fields.factor },
	["step", "ordinal"]
)
export const ChainPaused = relation(
	"ChainPaused",
	{ target: closedId(ChainPausable), turn: natural },
	["target", "turn"]
)
export const ChainResumed = relation(
	"ChainResumed",
	{ target: closedId(ChainPausable), turn: natural },
	["target", "turn"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const chainGraph = fragment(
	[
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
		ChainPageWeightsRead
	],
	[
		contained(on(ChainRoot, "scope"), on(ChainScope, "scope")),
		contained(on(ChainWithin, "scope"), on(ChainScope, "scope")),
		contained(on(ChainWithin, "parent"), on(ChainScope, "scope")),
		contained(on(ChainAdmitted, "scope"), on(ChainScope, "scope")),
		contained(on(ChainSkipped, "scope"), on(ChainRoot, "scope")),
		contained(on(ChainSkipped, "by"), on(ChainAdmitted, "scope")),
		contained(on(ChainStep, "scope"), on(ChainAdmitted, "scope")),
		contained(on(ChainStartStep, "scope"), on(ChainAdmitted, "scope")),
		contained(on(ChainStartStep, "step"), on(ChainStep, "step")),
		key(on(ChainStartStep, "step")),
		contained(on(ChainStartScope, "scope"), on(ChainAdmitted, "scope")),
		contained(on(ChainStartScope, "child"), on(ChainScope, "scope")),
		key(on(ChainStartScope, "child")),
		contained(on(ChainFinish, "scope"), on(ChainAdmitted, "scope")),
		contained(on(ChainFinish, "step"), on(ChainStep, "step")),
		key(on(ChainFinish, "step")),
		contained(on(ChainDue, "step"), on(ChainStep, "step")),
		contained(on(ChainClaim, "step"), on(ChainStep, "step")),
		race(ChainClaim),
		check("AttemptFromOne", ChainClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(ChainClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(ChainClaim, "step", "attempt")
		),
		contained(on(ChainRetry, "step", "attempt"), on(ChainClaim, "step", "attempt")),
		contained(on(ChainFenced, "step", "attempt"), on(ChainClaim, "step", "attempt")),
		contained(on(ChainResult, "step"), on(ChainStep, "step")),
		contained(on(ChainHeld, "step", "attempt"), on(ChainClaim, "step", "attempt")),
		contained(on(ChainHeld, "step"), on(ChainResult, "step")),
		contained(
			on(ChainDone, "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(
			on(ChainFailed, "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(on(ChainRefusal, "step"), on(ChainFailed, "step")),
		contained(on(ChainExhausted, "step"), on(ChainFailed, "step")),
		contained(
			on(ChainPageInput, "step"),
			on(
				select(ChainStep, (row) => row.eq(row.kind, "Page")),
				"step"
			)
		),
		contained(on(ChainPageInputAfter, "step"), on(ChainPageInput, "step")),
		contained(
			on(ChainChainRunInput, "scope"),
			on(
				select(ChainScope, (row) => row.eq(row.kind, "ChainRun")),
				"scope"
			)
		),
		contained(
			on(ChainOrderedInput, "scope"),
			on(
				select(ChainScope, (row) => row.eq(row.kind, "Ordered")),
				"scope"
			)
		),
		contained(on(ChainNext, "from"), on(ChainPageInput, "step")),
		contained(on(ChainNext, "to"), on(ChainPageInput, "step")),
		key(on(ChainNext, "to")),
		contained(on(ChainPageOutput, "step"), on(ChainPageInput, "step")),
		contained(on(ChainPageOutput, "step"), on(ChainDone, "step")),
		contained(on(ChainPageOutputNext, "step"), on(ChainPageOutput, "step")),
		contained(on(ChainPageWeightsRead, "step"), on(ChainResult, "step"))
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */
export const chainCoordination = fragment(
	[
		ChainKind,
		ChainJoin,
		ChainOutcome,
		ChainPausable,
		ChainPageInputFeed,
		ChainChainRunInputFeed,
		ChainOrderedInputFeed,
		ChainPaused,
		ChainResumed
	],
	[
		contained(on(ChainResumed, "target", "turn"), on(ChainPaused, "target", "turn")),
		contained(on(ChainPaused, "target", pred("turn")), on(ChainResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const chainWriter = [
	"ChainResult",
	"ChainDone",
	"ChainHeld",
	"ChainPageOutput",
	"ChainPageOutputNext",
	"ChainPageWeightsRead",
	"ChainStep",
	"ChainDue",
	"ChainScope",
	"ChainWithin",
	"ChainAdmitted",
	"ChainFinish",
	"ChainStartStep",
	"ChainStartScope",
	"ChainPageInput",
	"ChainPageInputAfter",
	"ChainNext",
	"ChainRoot",
	"ChainOrderedInput"
] as const
