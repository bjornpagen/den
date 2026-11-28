import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Chain to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { PageReads } from "#integration/slice/reads.ts"

const seqKey = Symbol("Seq")
const Seq = g.domain<typeof seqKey>()("Seq", g.int8)
/** The mint of Seq's host type, which the flow's binding writes a value of the brand Seq by. */
export const seqMint = g.mintOf(seqKey)

export const ChainKind = g.closed.unordered("ChainKind", [
	"Page",
	"ChainRunFinish",
	"OrderedFinish"
])
export const ChainRootKind = g.closed.unordered("ChainRootKind", ["ChainRun", "Ordered"])
export const ChainOutcome = g.closed.unordered("ChainOutcome", ["done", "failed"])
export const ChainRetryWhy = g.closed.unordered("ChainRetryWhy", ["spent", "transient", "later"])
export const ChainPausable = g.closed.unordered("ChainPausable", ["ChainRun", "Ordered"])
export const ChainPageInputFeed = g
	.derivedName({ stem: "Chain", path: ["PageInputFeed"] })
	.unordered("ChainPageInputFeed", ["news", "sport"])
export const ChainChainRunInputFeed = g
	.derivedName({ stem: "Chain", path: ["ChainRunInputFeed"] })
	.unordered("ChainChainRunInputFeed", ["news", "sport"])
export const ChainOrderedInputFeed = g
	.derivedName({ stem: "Chain", path: ["OrderedInputFeed"] })
	.unordered("ChainOrderedInputFeed", ["news", "sport"])

export const ChainScope = g.relation("ChainScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const ChainRoot = g.relation(
	"ChainRoot",
	{ root: g.sha256, kind: g.closedId(ChainRootKind), key: Text, at: DenInstant },
	["root"]
)
export const ChainRequestedWith = g.relation(
	"ChainRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const ChainAdmitted = g.relation("ChainAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const ChainSkipped = g.relation(
	"ChainSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const ChainStep = g.relation(
	"ChainStep",
	{ root: g.sha256, step: g.sha256, kind: g.closedId(ChainKind), scope: g.sha256, due: DenInstant },
	["root", "step"]
)
export const ChainStartStep = g.relation(
	"ChainStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const ChainFinish = g.relation(
	"ChainFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const ChainClaim = g.relation(
	"ChainClaim",
	{ root: g.sha256, step: g.sha256, attempt: g.place, until: DenInstant },
	["root", "step", "attempt"]
)
export const ChainEnded = g.relation(
	"ChainEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const ChainRetry = g.relation(
	"ChainRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(ChainRetryWhy)
	},
	["root", "step", "attempt"]
)
export const ChainFenced = g.relation(
	"ChainFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const ChainResult = g.relation(
	"ChainResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(ChainOutcome) },
	["root", "step"]
)
export const ChainDone = g.relation("ChainDone", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ChainFailed = g.relation("ChainFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ChainHeld = g.relation(
	"ChainHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const ChainRefusal = g.relation(
	"ChainRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const ChainExhausted = g.relation("ChainExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ChainPageInput = g.derivedName({ stem: "Chain", path: ["PageInput"] }).relation(
	"ChainPageInput",
	{
		root: g.sha256,
		step: g.sha256,
		feed: g.closedId(ChainPageInputFeed),
		seq: Seq,
		pages: g.int8
	},
	["root", "step"]
)
export const ChainPageInputAfter = g
	.derivedName({ stem: "Chain", path: ["PageInputAfter"] })
	.relation("ChainPageInputAfter", { root: g.sha256, step: g.sha256, value: Text }, [
		"root",
		"step"
	])
export const ChainChainRunInput = g
	.derivedName({ stem: "Chain", path: ["ChainRunInput"] })
	.relation(
		"ChainChainRunInput",
		{ root: g.sha256, scope: g.sha256, feed: g.closedId(ChainChainRunInputFeed), pages: g.int8 },
		["root", "scope"]
	)
export const ChainOrderedInput = g
	.derivedName({ stem: "Chain", path: ["OrderedInput"] })
	.relation(
		"ChainOrderedInput",
		{ root: g.sha256, scope: g.sha256, feed: g.closedId(ChainOrderedInputFeed), pages: g.int8 },
		["root", "scope"]
	)
export const ChainPageOutput = g
	.derivedName({ stem: "Chain", path: ["PageOutput"] })
	.relation(
		"ChainPageOutput",
		{ root: g.sha256, step: g.sha256, seq: Seq, items: g.int8, earlier: g.int8 },
		["root", "step"]
	)
export const ChainPageOutputNext = g
	.derivedName({ stem: "Chain", path: ["PageOutputNext"] })
	.relation("ChainPageOutputNext", { root: g.sha256, step: g.sha256, value: Text }, [
		"root",
		"step"
	])
export const ChainChainRunFinishOutput = g
	.derivedName({ stem: "Chain", path: ["ChainRunFinishOutput"] })
	.relation("ChainChainRunFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const ChainOrderedFinishOutput = g
	.derivedName({ stem: "Chain", path: ["OrderedFinishOutput"] })
	.relation("ChainOrderedFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const ChainNext = g
	.derivedName({ stem: "Chain", path: ["Next"] })
	.relation("ChainNext", { root: g.sha256, from: g.sha256, ordinal: g.natural, to: g.sha256 }, [
		"root",
		"from",
		"ordinal"
	])
export const ChainPageReadWeights = g
	.derivedName({ stem: "Chain", path: ["PageReadWeights"] })
	.relation(
		"ChainPageReadWeights",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, digest: g.sha256 },
		["root", "step", "ordinal"]
	)
export const ChainPageReadEarlier = g
	.derivedName({ stem: "Chain", path: ["PageReadEarlier"] })
	.relation(
		"ChainPageReadEarlier",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, digest: g.sha256 },
		["root", "step", "ordinal"]
	)
export const ChainPageReadTree = g
	.derivedName({ stem: "Chain", path: ["PageReadTree"] })
	.relation(
		"ChainPageReadTree",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, digest: g.sha256 },
		["root", "step", "ordinal"]
	)
export const ChainPaused = g.relation(
	"ChainPaused",
	{ target: g.closedId(ChainPausable), turn: g.natural },
	["target", "turn"]
)
export const ChainResumed = g.relation(
	"ChainResumed",
	{ target: g.closedId(ChainPausable), turn: g.natural },
	["target", "turn"]
)
export const ChainServed = g.relation(
	"ChainServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The records of the rows step Page's read `weights` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, its name grizzle's, keyed by a row's digest alone, so every root that found a row shares it. */
export const ChainPageReadWeightsRecords = g.records(
	"ChainPageReadWeights",
	PageReads.named.weights,
	{ digest: g.sha256 },
	["digest"]
)
export const ChainPageReadWeightsRow = ChainPageReadWeightsRecords.row

/** The records of the rows step Page's read `earlier` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, its name grizzle's, keyed by a row's digest alone, so every root that found a row shares it. */
export const ChainPageReadEarlierRecords = g.records(
	"ChainPageReadEarlier",
	PageReads.named.earlier,
	{ digest: g.sha256 },
	["digest"]
)
export const ChainPageReadEarlierRow = ChainPageReadEarlierRecords.row

/** The records of the rows step Page's read `tree` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, its name grizzle's, keyed by a row's digest alone, so every root that found a row shares it. */
export const ChainPageReadTreeRecords = g.records(
	"ChainPageReadTree",
	PageReads.named.tree,
	{ digest: g.sha256 },
	["digest"]
)
export const ChainPageReadTreeRow = ChainPageReadTreeRecords.row

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const chainGraph = g.fragment(
	[
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
		...ChainPageReadWeightsRecords.relations,
		...ChainPageReadEarlierRecords.relations,
		...ChainPageReadTreeRecords.relations
	],
	[
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(ChainScope, "scope")),
		g.key(g.on(ChainStep, "step")),
		g.contained(g.on(ChainAdmitted, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.contained(g.on(ChainSkipped, "scope"), g.on(ChainRoot, "root")),
		g.contained(g.on(ChainSkipped, "by"), g.on(ChainRoot, "root")),
		g.contained(g.on(ChainRequestedWith, "root"), g.on(ChainRoot, "root")),
		g.contained(g.on(ChainStep, "root", "scope"), g.on(ChainAdmitted, "root", "scope")),
		g.contained(g.on(ChainStartStep, "root", "scope"), g.on(ChainAdmitted, "root", "scope")),
		g.contained(g.on(ChainStartStep, "root", "step"), g.on(ChainStep, "root", "step")),
		g.key(g.on(ChainStartStep, "root", "step")),
		g.contained(g.on(ChainFinish, "root", "scope"), g.on(ChainAdmitted, "root", "scope")),
		g.contained(g.on(ChainFinish, "root", "step"), g.on(ChainStep, "root", "step")),
		g.key(g.on(ChainFinish, "root", "step")),
		g.contained(g.on(ChainClaim, "root", "step"), g.on(ChainStep, "root", "step")),
		g.contained(
			g.on(ChainEnded, "root", "step", "attempt"),
			g.on(ChainClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(ChainClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(ChainEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(ChainRetry, "root", "step", "attempt"),
			g.on(ChainEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(ChainFenced, "root", "step", "attempt"),
			g.on(ChainEnded, "root", "step", "attempt")
		),
		g.contained(g.on(ChainResult, "root", "step"), g.on(ChainStep, "root", "step")),
		g.contained(
			g.on(ChainHeld, "root", "step", "attempt"),
			g.on(ChainClaim, "root", "step", "attempt")
		),
		g.contained(g.on(ChainHeld, "root", "step"), g.on(ChainResult, "root", "step")),
		g.contained(
			g.on(ChainDone, "root", "step"),
			g.on(
				g.select(ChainResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ChainFailed, "root", "step"),
			g.on(
				g.select(ChainResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(ChainRefusal, "root", "step"), g.on(ChainFailed, "root", "step")),
		g.contained(g.on(ChainExhausted, "root", "step"), g.on(ChainFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(ChainRoot, (row) => row.eq(row.kind, "ChainRun")),
				"root"
			),
			g.on(ChainRequestedWith, "root")
		),
		g.contained(
			g.on(
				g.select(ChainRoot, (row) => row.eq(row.kind, "Ordered")),
				"root"
			),
			g.on(ChainRequestedWith, "root")
		),
		g.contained(
			g.on(ChainPageInput, "root", "step"),
			g.on(
				g.select(ChainStep, (row) => row.eq(row.kind, "Page")),
				"root",
				"step"
			)
		),
		g.contained(g.on(ChainPageInputAfter, "root", "step"), g.on(ChainPageInput, "root", "step")),
		g.contained(
			g.on(ChainChainRunInput, "scope"),
			g.on(
				g.select(ChainRoot, (row) => row.eq(row.kind, "ChainRun")),
				"root"
			)
		),
		g.contained(
			g.on(ChainOrderedInput, "scope"),
			g.on(
				g.select(ChainRoot, (row) => row.eq(row.kind, "Ordered")),
				"root"
			)
		),
		g.contained(g.on(ChainPageOutput, "root", "step"), g.on(ChainPageInput, "root", "step")),
		g.contained(g.on(ChainPageOutput, "root", "step"), g.on(ChainDone, "root", "step")),
		g.contained(g.on(ChainPageOutputNext, "root", "step"), g.on(ChainPageOutput, "root", "step")),
		g.contained(g.on(ChainChainRunFinishOutput, "root", "step"), g.on(ChainDone, "root", "step")),
		g.contained(g.on(ChainOrderedFinishOutput, "root", "step"), g.on(ChainDone, "root", "step")),
		g.contained(g.on(ChainNext, "root", "from"), g.on(ChainPageOutput, "root", "step")),
		g.contained(g.on(ChainNext, "root", "to"), g.on(ChainPageInput, "root", "step")),
		g.key(g.on(ChainNext, "root", "to")),
		g.contained(g.on(ChainPageReadWeights, "root", "step"), g.on(ChainResult, "root", "step")),
		g.contained(g.on(ChainPageReadWeights, "digest"), g.on(ChainPageReadWeightsRow, "digest")),
		g.contained(g.on(ChainPageReadEarlier, "root", "step"), g.on(ChainResult, "root", "step")),
		g.contained(g.on(ChainPageReadEarlier, "digest"), g.on(ChainPageReadEarlierRow, "digest")),
		g.contained(g.on(ChainPageReadTree, "root", "step"), g.on(ChainResult, "root", "step")),
		g.contained(g.on(ChainPageReadTree, "digest"), g.on(ChainPageReadTreeRow, "digest")),
		g.contained(g.on(ChainScope, "root"), g.on(ChainRoot, "root")),
		g.mutable(ChainScope),
		g.mutable(ChainAdmitted),
		g.contained(g.on(ChainSkipped, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.mutable(ChainSkipped),
		g.contained(g.on(ChainStep, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.mutable(ChainStep),
		g.contained(g.on(ChainStartStep, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.mutable(ChainStartStep),
		g.contained(g.on(ChainFinish, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.mutable(ChainFinish),
		g.mutable(ChainClaim),
		g.contained(g.on(ChainEnded, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainEnded),
		g.contained(g.on(ChainRetry, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainRetry),
		g.contained(g.on(ChainFenced, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainFenced),
		g.mutable(ChainResult),
		g.contained(g.on(ChainDone, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainDone),
		g.contained(g.on(ChainFailed, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainFailed),
		g.contained(g.on(ChainHeld, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainHeld),
		g.contained(g.on(ChainRefusal, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainRefusal),
		g.contained(g.on(ChainExhausted, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainExhausted),
		g.contained(g.on(ChainPageInput, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageInput),
		g.contained(g.on(ChainPageInputAfter, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageInputAfter),
		g.contained(g.on(ChainChainRunInput, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.mutable(ChainChainRunInput),
		g.contained(g.on(ChainOrderedInput, "root", "scope"), g.on(ChainScope, "root", "scope")),
		g.mutable(ChainOrderedInput),
		g.contained(g.on(ChainPageOutput, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageOutput),
		g.contained(g.on(ChainPageOutputNext, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageOutputNext),
		g.contained(g.on(ChainChainRunFinishOutput, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainChainRunFinishOutput),
		g.contained(g.on(ChainOrderedFinishOutput, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainOrderedFinishOutput),
		g.contained(g.on(ChainNext, "root", "from"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainNext),
		g.contained(g.on(ChainPageReadWeights, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageReadWeights),
		g.contained(g.on(ChainPageReadEarlier, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageReadEarlier),
		g.contained(g.on(ChainPageReadTree, "root", "step"), g.on(ChainStep, "root", "step")),
		g.mutable(ChainPageReadTree),
		...ChainPageReadWeightsRecords.rules,
		...ChainPageReadEarlierRecords.rules,
		...ChainPageReadTreeRecords.rules
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const chainCoordination = g.fragment(
	[
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
	],
	[
		g.contained(g.on(ChainResumed, "target", "turn"), g.on(ChainPaused, "target", "turn")),
		g.contained(g.on(ChainPaused, "target", g.pred("turn")), g.on(ChainResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const chainWriter = [
	"ChainResult",
	"ChainDone",
	"ChainHeld",
	"ChainPageOutput",
	"ChainPageOutputNext",
	"ChainChainRunFinishOutput",
	"ChainOrderedFinishOutput",
	"ChainPageReadWeights",
	"ChainPageReadEarlier",
	"ChainPageReadTree",
	"ChainStep",
	"ChainScope",
	"ChainAdmitted",
	"ChainFinish",
	"ChainStartStep",
	"ChainPageInput",
	"ChainPageInputAfter",
	"ChainNext",
	"ChainOrderedInput",
	"ChainRequestedWith",
	"ChainRoot",
	...Arr.map(ChainPageReadWeightsRecords.relations, (rel) => rel.name),
	...Arr.map(ChainPageReadEarlierRecords.relations, (rel) => rel.name),
	...Arr.map(ChainPageReadTreeRecords.relations, (rel) => rel.name)
] as const
