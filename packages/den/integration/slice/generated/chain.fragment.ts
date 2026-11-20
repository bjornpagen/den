import { DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Chain to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	contract,
	fragment,
	key,
	natural,
	on,
	place,
	pg,
	pred,
	relation,
	retirable,
	retirement,
	select
} from "@bjornpagen/grizzle"
import { Weight } from "#integration/slice/relations.ts"

const Seq = contract("Seq", pg.bigint)

export const ChainKind = closed.unordered("ChainKind", ["Page", "ChainRunFinish", "OrderedFinish"])
export const ChainRootKind = closed.unordered("ChainRootKind", ["ChainRun", "Ordered"])
export const ChainOutcome = closed.unordered("ChainOutcome", ["done", "failed"])
export const ChainPausable = closed.unordered("ChainPausable", ["ChainRun", "Ordered"])
export const ChainPageInputFeed = closed.unordered("ChainPageInputFeed", ["news", "sport"])
export const ChainChainRunInputFeed = closed.unordered("ChainChainRunInputFeed", ["news", "sport"])
export const ChainOrderedInputFeed = closed.unordered("ChainOrderedInputFeed", ["news", "sport"])

export const ChainScope = relation("ChainScope", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const ChainRoot = relation(
	"ChainRoot",
	{
		scope: DenScope,
		kind: closedId(ChainRootKind),
		key: Text,
		at: DenInstant,
		retired: retirement
	},
	["scope"]
)
export const ChainAdmitted = relation("ChainAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const ChainSkipped = relation(
	"ChainSkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const ChainStep = relation(
	"ChainStep",
	{ step: DenStep, kind: closedId(ChainKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const ChainStartStep = relation(
	"ChainStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const ChainFinish = relation(
	"ChainFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const ChainClaim = relation(
	"ChainClaim",
	{ step: DenStep, attempt: place, until: DenInstant, root: DenScope },
	["step", "root", "attempt"]
)
export const ChainEnded = relation(
	"ChainEnded",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const ChainRetry = relation(
	"ChainRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean, root: DenScope },
	["step", "attempt", "root"]
)
export const ChainFenced = relation(
	"ChainFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const ChainResult = relation(
	"ChainResult",
	{ step: DenStep, outcome: closedId(ChainOutcome), root: DenScope },
	["step", "root"]
)
export const ChainDone = relation("ChainDone", { step: DenStep, root: DenScope }, ["step", "root"])
export const ChainFailed = relation("ChainFailed", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const ChainHeld = relation(
	"ChainHeld",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "root"]
)
export const ChainRefusal = relation("ChainRefusal", { step: DenStep, law: Text, root: DenScope }, [
	"step",
	"root"
])
export const ChainExhausted = relation(
	"ChainExhausted",
	{ step: DenStep, attempts: natural, root: DenScope },
	["step", "root"]
)
export const ChainPageInput = relation(
	"ChainPageInput",
	{ step: DenStep, feed: closedId(ChainPageInputFeed), seq: Seq, pages: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ChainPageInputAfter = relation(
	"ChainPageInputAfter",
	{ step: DenStep, value: Text, root: DenScope },
	["step", "root"]
)
export const ChainChainRunInput = relation(
	"ChainChainRunInput",
	{ scope: DenScope, feed: closedId(ChainChainRunInputFeed), pages: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const ChainOrderedInput = relation(
	"ChainOrderedInput",
	{ scope: DenScope, feed: closedId(ChainOrderedInputFeed), pages: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const ChainNext = relation(
	"ChainNext",
	{ from: DenStep, ordinal: natural, to: DenStep, root: DenScope },
	["from", "ordinal", "root"]
)
export const ChainPageOutput = relation(
	"ChainPageOutput",
	{ step: DenStep, seq: Seq, items: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ChainPageOutputNext = relation(
	"ChainPageOutputNext",
	{ step: DenStep, value: Text, root: DenScope },
	["step", "root"]
)
export const ChainPageWeightsRead = relation(
	"ChainPageWeightsRead",
	{
		step: DenStep,
		ordinal: natural,
		feed: Weight.fields.feed,
		factor: Weight.fields.factor,
		root: DenScope
	},
	["step", "ordinal", "root"]
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
		ChainPageWeightsRead
	],
	[
		contained(on(ChainAdmitted, "scope", "root"), on(ChainScope, "scope", "root")),
		contained(on(ChainSkipped, "scope"), on(ChainRoot, "scope")),
		contained(on(ChainSkipped, "by"), on(ChainRoot, "scope")),
		contained(on(ChainStep, "scope", "root"), on(ChainAdmitted, "scope", "root")),
		contained(on(ChainStartStep, "scope", "root"), on(ChainAdmitted, "scope", "root")),
		contained(on(ChainStartStep, "step", "root"), on(ChainStep, "step", "root")),
		key(on(ChainStartStep, "step", "root")),
		contained(on(ChainFinish, "scope", "root"), on(ChainAdmitted, "scope", "root")),
		contained(on(ChainFinish, "step", "root"), on(ChainStep, "step", "root")),
		key(on(ChainFinish, "step", "root")),
		contained(on(ChainClaim, "step", "root"), on(ChainStep, "step", "root")),
		contained(on(ChainEnded, "step", "attempt", "root"), on(ChainClaim, "step", "attempt", "root")),
		contained(
			on(
				select(ChainClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(ChainEnded, "step", "attempt", "root")
		),
		contained(on(ChainRetry, "step", "attempt", "root"), on(ChainEnded, "step", "attempt", "root")),
		contained(
			on(ChainFenced, "step", "attempt", "root"),
			on(ChainEnded, "step", "attempt", "root")
		),
		contained(on(ChainResult, "step", "root"), on(ChainStep, "step", "root")),
		contained(on(ChainHeld, "step", "attempt", "root"), on(ChainClaim, "step", "attempt", "root")),
		contained(on(ChainHeld, "step", "root"), on(ChainResult, "step", "root")),
		contained(
			on(ChainDone, "step", "root"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(ChainFailed, "step", "root"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(ChainRefusal, "step", "root"), on(ChainFailed, "step", "root")),
		contained(on(ChainExhausted, "step", "root"), on(ChainFailed, "step", "root")),
		contained(
			on(ChainPageInput, "step", "root"),
			on(
				select(ChainStep, (row) => row.eq(row.kind, "Page")),
				"step",
				"root"
			)
		),
		contained(on(ChainPageInputAfter, "step", "root"), on(ChainPageInput, "step", "root")),
		contained(
			on(ChainChainRunInput, "scope"),
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "ChainRun")),
				"scope"
			)
		),
		contained(
			on(ChainOrderedInput, "scope"),
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "Ordered")),
				"scope"
			)
		),
		contained(on(ChainNext, "from", "root"), on(ChainPageInput, "step", "root")),
		contained(on(ChainNext, "to", "root"), on(ChainPageInput, "step", "root")),
		key(on(ChainNext, "to", "root")),
		contained(on(ChainPageOutput, "step", "root"), on(ChainPageInput, "step", "root")),
		contained(on(ChainPageOutput, "step", "root"), on(ChainDone, "step", "root")),
		contained(on(ChainPageOutputNext, "step", "root"), on(ChainPageOutput, "step", "root")),
		contained(on(ChainPageWeightsRead, "step", "root"), on(ChainResult, "step", "root")),
		retirable(ChainRoot, [
			on(ChainScope, "root"),
			on(ChainAdmitted, "root"),
			on(ChainSkipped, "root"),
			on(ChainStep, "root"),
			on(ChainStartStep, "root"),
			on(ChainFinish, "root"),
			on(ChainClaim, "root"),
			on(ChainEnded, "root"),
			on(ChainRetry, "root"),
			on(ChainFenced, "root"),
			on(ChainResult, "root"),
			on(ChainDone, "root"),
			on(ChainFailed, "root"),
			on(ChainHeld, "root"),
			on(ChainRefusal, "root"),
			on(ChainExhausted, "root"),
			on(ChainPageInput, "root"),
			on(ChainPageInputAfter, "root"),
			on(ChainChainRunInput, "root"),
			on(ChainOrderedInput, "root"),
			on(ChainNext, "root"),
			on(ChainPageOutput, "root"),
			on(ChainPageOutputNext, "root"),
			on(ChainPageWeightsRead, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const chainCoordination = fragment(
	[
		ChainKind,
		ChainRootKind,
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
	"ChainScope",
	"ChainAdmitted",
	"ChainFinish",
	"ChainStartStep",
	"ChainPageInput",
	"ChainPageInputAfter",
	"ChainNext",
	"ChainRoot",
	"ChainOrderedInput"
] as const
