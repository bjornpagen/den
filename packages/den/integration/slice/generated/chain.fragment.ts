import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Chain to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	contract,
	fragment,
	key,
	mutable,
	natural,
	on,
	place,
	pg,
	pred,
	records,
	relation,
	select,
	sha256,
	unit
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

export const ChainScope = relation("ChainScope", { root: sha256, scope: sha256 }, ["root", "scope"])
export const ChainRoot = relation(
	"ChainRoot",
	{ root: sha256, kind: closedId(ChainRootKind), key: Text, at: DenInstant },
	["root"]
)
export const ChainRequestedWith = relation(
	"ChainRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
	["root"]
)
export const ChainAdmitted = relation("ChainAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const ChainSkipped = relation("ChainSkipped", { root: sha256, scope: sha256, by: sha256 }, [
	"root",
	"scope"
])
export const ChainStep = relation(
	"ChainStep",
	{ root: sha256, step: sha256, kind: closedId(ChainKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const ChainStartStep = relation(
	"ChainStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const ChainFinish = relation("ChainFinish", { root: sha256, scope: sha256, step: sha256 }, [
	"root",
	"scope"
])
export const ChainClaim = relation(
	"ChainClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const ChainEnded = relation("ChainEnded", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const ChainRetry = relation(
	"ChainRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(ChainRetryWhy) },
	["root", "step", "attempt"]
)
export const ChainFenced = relation(
	"ChainFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const ChainResult = relation(
	"ChainResult",
	{ root: sha256, step: sha256, outcome: closedId(ChainOutcome) },
	["root", "step"]
)
export const ChainDone = relation("ChainDone", { root: sha256, step: sha256 }, ["root", "step"])
export const ChainFailed = relation("ChainFailed", { root: sha256, step: sha256 }, ["root", "step"])
export const ChainHeld = relation("ChainHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const ChainRefusal = relation("ChainRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const ChainExhausted = relation("ChainExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const ChainPageInput = relation(
	"ChainPageInput",
	{ root: sha256, step: sha256, feed: closedId(ChainPageInputFeed), seq: Seq, pages: pg.bigint },
	["root", "step"]
)
export const ChainPageInputAfter = relation(
	"ChainPageInputAfter",
	{ root: sha256, step: sha256, value: Text },
	["root", "step"]
)
export const ChainChainRunInput = relation(
	"ChainChainRunInput",
	{ root: sha256, scope: sha256, feed: closedId(ChainChainRunInputFeed), pages: pg.bigint },
	["root", "scope"]
)
export const ChainOrderedInput = relation(
	"ChainOrderedInput",
	{ root: sha256, scope: sha256, feed: closedId(ChainOrderedInputFeed), pages: pg.bigint },
	["root", "scope"]
)
export const ChainPageOutput = relation(
	"ChainPageOutput",
	{ root: sha256, step: sha256, seq: Seq, items: pg.bigint, earlier: pg.bigint },
	["root", "step"]
)
export const ChainPageOutputNext = relation(
	"ChainPageOutputNext",
	{ root: sha256, step: sha256, value: Text },
	["root", "step"]
)
export const ChainChainRunFinishOutput = relation(
	"ChainChainRunFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const ChainOrderedFinishOutput = relation(
	"ChainOrderedFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const ChainNext = relation(
	"ChainNext",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
export const ChainPageReadWeights = relation(
	"ChainPageReadWeights",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const ChainPageReadEarlier = relation(
	"ChainPageReadEarlier",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const ChainPageReadTree = relation(
	"ChainPageReadTree",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
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
	["digest"],
	{ names: PageReads.options[0].names.tree }
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
		unit("DenRoot", { root: sha256 }),
		key(on(ChainScope, "scope")),
		key(on(ChainStep, "step")),
		contained(on(ChainAdmitted, "root", "scope"), on(ChainScope, "root", "scope")),
		contained(on(ChainSkipped, "scope"), on(ChainRoot, "root")),
		contained(on(ChainSkipped, "by"), on(ChainRoot, "root")),
		contained(on(ChainRequestedWith, "root"), on(ChainRoot, "root")),
		contained(on(ChainStep, "root", "scope"), on(ChainAdmitted, "root", "scope")),
		contained(on(ChainStartStep, "root", "scope"), on(ChainAdmitted, "root", "scope")),
		contained(on(ChainStartStep, "root", "step"), on(ChainStep, "root", "step")),
		key(on(ChainStartStep, "root", "step")),
		contained(on(ChainFinish, "root", "scope"), on(ChainAdmitted, "root", "scope")),
		contained(on(ChainFinish, "root", "step"), on(ChainStep, "root", "step")),
		key(on(ChainFinish, "root", "step")),
		contained(on(ChainClaim, "root", "step"), on(ChainStep, "root", "step")),
		contained(on(ChainEnded, "root", "step", "attempt"), on(ChainClaim, "root", "step", "attempt")),
		contained(
			on(
				select(ChainClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(ChainEnded, "root", "step", "attempt")
		),
		contained(on(ChainRetry, "root", "step", "attempt"), on(ChainEnded, "root", "step", "attempt")),
		contained(
			on(ChainFenced, "root", "step", "attempt"),
			on(ChainEnded, "root", "step", "attempt")
		),
		contained(on(ChainResult, "root", "step"), on(ChainStep, "root", "step")),
		contained(on(ChainHeld, "root", "step", "attempt"), on(ChainClaim, "root", "step", "attempt")),
		contained(on(ChainHeld, "root", "step"), on(ChainResult, "root", "step")),
		contained(
			on(ChainDone, "root", "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(ChainFailed, "root", "step"),
			on(
				select(ChainResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(ChainRefusal, "root", "step"), on(ChainFailed, "root", "step")),
		contained(on(ChainExhausted, "root", "step"), on(ChainFailed, "root", "step")),
		contained(
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "ChainRun")),
				"root"
			),
			on(ChainRequestedWith, "root")
		),
		contained(
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "Ordered")),
				"root"
			),
			on(ChainRequestedWith, "root")
		),
		contained(
			on(ChainPageInput, "root", "step"),
			on(
				select(ChainStep, (row) => row.eq(row.kind, "Page")),
				"root",
				"step"
			)
		),
		contained(on(ChainPageInputAfter, "root", "step"), on(ChainPageInput, "root", "step")),
		contained(
			on(ChainChainRunInput, "scope"),
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "ChainRun")),
				"root"
			)
		),
		contained(
			on(ChainOrderedInput, "scope"),
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "Ordered")),
				"root"
			)
		),
		contained(on(ChainPageOutput, "root", "step"), on(ChainPageInput, "root", "step")),
		contained(on(ChainPageOutput, "root", "step"), on(ChainDone, "root", "step")),
		contained(on(ChainPageOutputNext, "root", "step"), on(ChainPageOutput, "root", "step")),
		contained(on(ChainChainRunFinishOutput, "root", "step"), on(ChainDone, "root", "step")),
		contained(on(ChainOrderedFinishOutput, "root", "step"), on(ChainDone, "root", "step")),
		contained(on(ChainNext, "root", "from"), on(ChainPageOutput, "root", "step")),
		contained(on(ChainNext, "root", "to"), on(ChainPageInput, "root", "step")),
		key(on(ChainNext, "root", "to")),
		contained(on(ChainPageReadWeights, "root", "step"), on(ChainResult, "root", "step")),
		contained(on(ChainPageReadWeights, "digest"), on(ChainPageReadWeightsRow, "digest")),
		contained(on(ChainPageReadEarlier, "root", "step"), on(ChainResult, "root", "step")),
		contained(on(ChainPageReadEarlier, "digest"), on(ChainPageReadEarlierRow, "digest")),
		contained(on(ChainPageReadTree, "root", "step"), on(ChainResult, "root", "step")),
		contained(on(ChainPageReadTree, "digest"), on(ChainPageReadTreeRow, "digest")),
		contained(on(ChainScope, "root"), on(ChainRoot, "root")),
		mutable(ChainScope),
		mutable(ChainAdmitted),
		contained(on(ChainSkipped, "root", "scope"), on(ChainScope, "root", "scope")),
		mutable(ChainSkipped),
		contained(on(ChainStep, "root", "scope"), on(ChainScope, "root", "scope")),
		mutable(ChainStep),
		contained(on(ChainStartStep, "root", "scope"), on(ChainScope, "root", "scope")),
		mutable(ChainStartStep),
		contained(on(ChainFinish, "root", "scope"), on(ChainScope, "root", "scope")),
		mutable(ChainFinish),
		mutable(ChainClaim),
		contained(on(ChainEnded, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainEnded),
		contained(on(ChainRetry, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainRetry),
		contained(on(ChainFenced, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainFenced),
		mutable(ChainResult),
		contained(on(ChainDone, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainDone),
		contained(on(ChainFailed, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainFailed),
		contained(on(ChainHeld, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainHeld),
		contained(on(ChainRefusal, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainRefusal),
		contained(on(ChainExhausted, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainExhausted),
		contained(on(ChainPageInput, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageInput),
		contained(on(ChainPageInputAfter, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageInputAfter),
		contained(on(ChainChainRunInput, "root", "scope"), on(ChainScope, "root", "scope")),
		mutable(ChainChainRunInput),
		contained(on(ChainOrderedInput, "root", "scope"), on(ChainScope, "root", "scope")),
		mutable(ChainOrderedInput),
		contained(on(ChainPageOutput, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageOutput),
		contained(on(ChainPageOutputNext, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageOutputNext),
		contained(on(ChainChainRunFinishOutput, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainChainRunFinishOutput),
		contained(on(ChainOrderedFinishOutput, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainOrderedFinishOutput),
		contained(on(ChainNext, "root", "from"), on(ChainStep, "root", "step")),
		mutable(ChainNext),
		contained(on(ChainPageReadWeights, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageReadWeights),
		contained(on(ChainPageReadEarlier, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageReadEarlier),
		contained(on(ChainPageReadTree, "root", "step"), on(ChainStep, "root", "step")),
		mutable(ChainPageReadTree),
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
	"ChainOrderedInput",
	"ChainRequestedWith",
	"ChainRoot",
	...Arr.map(ChainPageReadWeightsRecords.relations, (rel) => rel.name),
	...Arr.map(ChainPageReadEarlierRecords.relations, (rel) => rel.name),
	...Arr.map(ChainPageReadTreeRecords.relations, (rel) => rel.name)
] as const
