import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
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
	records,
	relation,
	retirable,
	retirement,
	select,
	sha256
} from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { PageReads } from "#integration/slice/reads.ts"

const Seq = contract("Seq", pg.bigint)

export const ChainKind = closed.unordered("ChainKind", ["Page", "ChainRunFinish", "OrderedFinish"])
export const ChainRootKind = closed.unordered("ChainRootKind", ["ChainRun", "Ordered"])
export const ChainOutcome = closed.unordered("ChainOutcome", ["done", "failed"])
export const ChainRetryWhy = closed.unordered("ChainRetryWhy", ["spent", "transient", "later"])
export const ChainPausable = closed.unordered("ChainPausable", ["ChainRun", "Ordered"])
export const ChainPageInputFeed = closed.unordered("ChainPageInputFeed", ["news", "sport"])
export const ChainChainRunInputFeed = closed.unordered("ChainChainRunInputFeed", ["news", "sport"])
export const ChainOrderedInputFeed = closed.unordered("ChainOrderedInputFeed", ["news", "sport"])

export const ChainScope = relation("ChainScope", { scope: sha256, root: sha256 }, ["scope", "root"])
export const ChainRoot = relation(
	"ChainRoot",
	{ scope: sha256, kind: closedId(ChainRootKind), key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const ChainAdmitted = relation("ChainAdmitted", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const ChainSkipped = relation("ChainSkipped", { scope: sha256, by: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const ChainStep = relation(
	"ChainStep",
	{ step: sha256, kind: closedId(ChainKind), scope: sha256, due: DenInstant, root: sha256 },
	["step", "root"]
)
export const ChainStartStep = relation(
	"ChainStartStep",
	{ scope: sha256, ordinal: natural, step: sha256, root: sha256 },
	["scope", "ordinal", "root"]
)
export const ChainFinish = relation("ChainFinish", { scope: sha256, step: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const ChainClaim = relation(
	"ChainClaim",
	{ step: sha256, attempt: place, until: DenInstant, root: sha256 },
	["step", "root", "attempt"]
)
export const ChainEnded = relation("ChainEnded", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"attempt",
	"root"
])
export const ChainRetry = relation(
	"ChainRetry",
	{ step: sha256, attempt: natural, at: DenInstant, why: closedId(ChainRetryWhy), root: sha256 },
	["step", "attempt", "root"]
)
export const ChainFenced = relation(
	"ChainFenced",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "attempt", "root"]
)
export const ChainResult = relation(
	"ChainResult",
	{ step: sha256, outcome: closedId(ChainOutcome), root: sha256 },
	["step", "root"]
)
export const ChainDone = relation("ChainDone", { step: sha256, root: sha256 }, ["step", "root"])
export const ChainFailed = relation("ChainFailed", { step: sha256, root: sha256 }, ["step", "root"])
export const ChainHeld = relation("ChainHeld", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"root"
])
export const ChainRefusal = relation("ChainRefusal", { step: sha256, law: Text, root: sha256 }, [
	"step",
	"root"
])
export const ChainExhausted = relation("ChainExhausted", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const ChainPageInput = relation(
	"ChainPageInput",
	{ step: sha256, feed: closedId(ChainPageInputFeed), seq: Seq, pages: pg.bigint, root: sha256 },
	["step", "root"]
)
export const ChainPageInputAfter = relation(
	"ChainPageInputAfter",
	{ step: sha256, value: Text, root: sha256 },
	["step", "root"]
)
export const ChainChainRunInput = relation(
	"ChainChainRunInput",
	{ scope: sha256, feed: closedId(ChainChainRunInputFeed), pages: pg.bigint, root: sha256 },
	["scope", "root"]
)
export const ChainOrderedInput = relation(
	"ChainOrderedInput",
	{ scope: sha256, feed: closedId(ChainOrderedInputFeed), pages: pg.bigint, root: sha256 },
	["scope", "root"]
)
export const ChainPageOutput = relation(
	"ChainPageOutput",
	{ step: sha256, seq: Seq, items: pg.bigint, earlier: pg.bigint, root: sha256 },
	["step", "root"]
)
export const ChainPageOutputNext = relation(
	"ChainPageOutputNext",
	{ step: sha256, value: Text, root: sha256 },
	["step", "root"]
)
export const ChainChainRunFinishOutput = relation(
	"ChainChainRunFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const ChainOrderedFinishOutput = relation(
	"ChainOrderedFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const ChainNext = relation(
	"ChainNext",
	{ from: sha256, ordinal: natural, to: sha256, root: sha256 },
	["from", "ordinal", "root"]
)
export const ChainPageReadWeights = relation(
	"ChainPageReadWeights",
	{ step: sha256, ordinal: natural, digest: sha256, root: sha256 },
	["step", "ordinal", "root"]
)
export const ChainPageReadEarlier = relation(
	"ChainPageReadEarlier",
	{ step: sha256, ordinal: natural, digest: sha256, root: sha256 },
	["step", "ordinal", "root"]
)
export const ChainPageReadTree = relation(
	"ChainPageReadTree",
	{ step: sha256, ordinal: natural, digest: sha256, root: sha256 },
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
export const ChainServed = relation(
	"ChainServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The records of the rows step Page's read `weights` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, keyed by a row's digest alone, so every root that found a row shares it. */
export const ChainPageReadWeightsRecords = records(
	"ChainPageReadWeights",
	PageReads.named.weights,
	{ digest: sha256 },
	["digest"]
)
export const ChainPageReadWeightsRow = ChainPageReadWeightsRecords.row

/** The records of the rows step Page's read `earlier` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, keyed by a row's digest alone, so every root that found a row shares it. */
export const ChainPageReadEarlierRecords = records(
	"ChainPageReadEarlier",
	PageReads.named.earlier,
	{ digest: sha256 },
	["digest"]
)
export const ChainPageReadEarlierRow = ChainPageReadEarlierRecords.row

/** The records of the rows step Page's read `tree` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, keyed by a row's digest alone, so every root that found a row shares it. */
export const ChainPageReadTreeRecords = records(
	"ChainPageReadTree",
	PageReads.named.tree,
	{ digest: sha256 },
	["digest"]
)
export const ChainPageReadTreeRow = ChainPageReadTreeRecords.row

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const chainGraph = fragment(
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
		contained(on(ChainPageOutput, "step", "root"), on(ChainPageInput, "step", "root")),
		contained(on(ChainPageOutput, "step", "root"), on(ChainDone, "step", "root")),
		contained(on(ChainPageOutputNext, "step", "root"), on(ChainPageOutput, "step", "root")),
		contained(on(ChainChainRunFinishOutput, "step", "root"), on(ChainDone, "step", "root")),
		contained(on(ChainOrderedFinishOutput, "step", "root"), on(ChainDone, "step", "root")),
		contained(on(ChainNext, "from", "root"), on(ChainPageOutput, "step", "root")),
		contained(on(ChainNext, "to", "root"), on(ChainPageInput, "step", "root")),
		key(on(ChainNext, "to", "root")),
		contained(on(ChainPageReadWeights, "step", "root"), on(ChainResult, "step", "root")),
		contained(on(ChainPageReadWeights, "digest"), on(ChainPageReadWeightsRow, "digest")),
		contained(on(ChainPageReadEarlier, "step", "root"), on(ChainResult, "step", "root")),
		contained(on(ChainPageReadEarlier, "digest"), on(ChainPageReadEarlierRow, "digest")),
		contained(on(ChainPageReadTree, "step", "root"), on(ChainResult, "step", "root")),
		contained(on(ChainPageReadTree, "digest"), on(ChainPageReadTreeRow, "digest")),
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
			on(ChainPageOutput, "root"),
			on(ChainPageOutputNext, "root"),
			on(ChainChainRunFinishOutput, "root"),
			on(ChainOrderedFinishOutput, "root"),
			on(ChainNext, "root"),
			on(ChainPageReadWeights, "root"),
			on(ChainPageReadEarlier, "root"),
			on(ChainPageReadTree, "root")
		]),
		...ChainPageReadWeightsRecords.rules,
		...ChainPageReadEarlierRecords.rules,
		...ChainPageReadTreeRecords.rules
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const chainCoordination = fragment(
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
	"ChainRoot",
	"ChainOrderedInput",
	...Arr.map(ChainPageReadWeightsRecords.relations, (rel) => rel.name),
	...Arr.map(ChainPageReadEarlierRecords.relations, (rel) => rel.name),
	...Arr.map(ChainPageReadTreeRecords.relations, (rel) => rel.name)
] as const
