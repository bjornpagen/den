import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Chain to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	contract,
	fragment,
	key,
	mintOf,
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

const seqKey = Symbol("Seq")
const Seq = contract<typeof seqKey>()("Seq", pg.bigint)
/** The mint of Seq's host type, which the flow's binding writes a value of the brand Seq by. */
export const seqMint = mintOf(seqKey)

export const ChainKind = closed.unordered("ChainKind", ["Page", "ChainRunFinish", "OrderedFinish"])
export const ChainRootKind = closed.unordered("ChainRootKind", ["ChainRun", "Ordered"])
export const ChainOutcome = closed.unordered("ChainOutcome", ["done", "failed"])
export const ChainRetryWhy = closed.unordered("ChainRetryWhy", ["spent", "transient", "later"])
export const ChainPausable = closed.unordered("ChainPausable", ["ChainRun", "Ordered"])
export const chain_page_input_feed_nlhfmgjplihkf = closed.unordered(
	"chain_page_input_feed_nlhfmgjplihkf",
	["news", "sport"]
)
export const chain_chain_run_input_feed_dcnlhjpledlkf = closed.unordered(
	"chain_chain_run_input_feed_dcnlhjpledlkf",
	["news", "sport"]
)
export const chain_ordered_input_feed_hbpmfpphpfngm = closed.unordered(
	"chain_ordered_input_feed_hbpmfpphpfngm",
	["news", "sport"]
)

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
export const chain_page_input_jhliinhchcgno = relation(
	"chain_page_input_jhliinhchcgno",
	{
		root: sha256,
		step: sha256,
		feed: closedId(chain_page_input_feed_nlhfmgjplihkf),
		seq: Seq,
		pages: pg.bigint
	},
	["root", "step"]
)
export const chain_page_input_after_gdigbcabbnakb = relation(
	"chain_page_input_after_gdigbcabbnakb",
	{ root: sha256, step: sha256, value: Text },
	["root", "step"]
)
export const chain_chain_run_input_glnkafcnkbnnn = relation(
	"chain_chain_run_input_glnkafcnkbnnn",
	{
		root: sha256,
		scope: sha256,
		feed: closedId(chain_chain_run_input_feed_dcnlhjpledlkf),
		pages: pg.bigint
	},
	["root", "scope"]
)
export const chain_ordered_input_pbjpmafopnahk = relation(
	"chain_ordered_input_pbjpmafopnahk",
	{
		root: sha256,
		scope: sha256,
		feed: closedId(chain_ordered_input_feed_hbpmfpphpfngm),
		pages: pg.bigint
	},
	["root", "scope"]
)
export const chain_page_output_dniojohpmhcee = relation(
	"chain_page_output_dniojohpmhcee",
	{ root: sha256, step: sha256, seq: Seq, items: pg.bigint, earlier: pg.bigint },
	["root", "step"]
)
export const chain_page_output_next_pocjijjpkpono = relation(
	"chain_page_output_next_pocjijjpkpono",
	{ root: sha256, step: sha256, value: Text },
	["root", "step"]
)
export const chain_chain_run_finish_output_lhniobmdeemdb = relation(
	"chain_chain_run_finish_output_lhniobmdeemdb",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const chain_ordered_finish_output_nnemphmmfdblb = relation(
	"chain_ordered_finish_output_nnemphmmfdblb",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const chain_next_bbflpfpnlejpm = relation(
	"chain_next_bbflpfpnlejpm",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
export const chain_page_read_weights_agiabippcbobb = relation(
	"chain_page_read_weights_agiabippcbobb",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const chain_page_read_earlier_dgehlbgebidjc = relation(
	"chain_page_read_earlier_dgehlbgebidjc",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const chain_page_read_tree_lakencnpkciin = relation(
	"chain_page_read_tree_lakencnpkciin",
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

/** The records of the rows step Page's read `weights` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, named by den, keyed by a row's digest alone, so every root that found a row shares it. */
export const chain_page_read_weights_agiabippcbobbRecords = records(
	"chain_page_read_weights_agiabippcbobb",
	PageReads.named.weights,
	{ digest: sha256 },
	["digest"]
)
export const chain_page_read_weights_agiabippcbobbRow =
	chain_page_read_weights_agiabippcbobbRecords.row

/** The records of the rows step Page's read `earlier` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, named by den, keyed by a row's digest alone, so every root that found a row shares it. */
export const chain_page_read_earlier_dgehlbgebidjcRecords = records(
	"chain_page_read_earlier_dgehlbgebidjc",
	PageReads.named.earlier,
	{ digest: sha256 },
	["digest"]
)
export const chain_page_read_earlier_dgehlbgebidjcRow =
	chain_page_read_earlier_dgehlbgebidjcRecords.row

/** The records of the rows step Page's read `tree` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, named by den, keyed by a row's digest alone, so every root that found a row shares it. */
export const chain_page_read_tree_lakencnpkciinRecords = records(
	"chain_page_read_tree_lakencnpkciin",
	PageReads.named.tree,
	{ digest: sha256 },
	["digest"],
	{
		names: {
			items: "chain_page_read_tree_items_cokakfjlndgem",
			"items.first": "chain_page_read_tree_items_first_ocgolceclfbii"
		}
	}
)
export const chain_page_read_tree_lakencnpkciinRow = chain_page_read_tree_lakencnpkciinRecords.row

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const chainGraph = fragment(
	[
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
		...chain_page_read_weights_agiabippcbobbRecords.relations,
		...chain_page_read_earlier_dgehlbgebidjcRecords.relations,
		...chain_page_read_tree_lakencnpkciinRecords.relations
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
			on(chain_page_input_jhliinhchcgno, "root", "step"),
			on(
				select(ChainStep, (row) => row.eq(row.kind, "Page")),
				"root",
				"step"
			)
		),
		contained(
			on(chain_page_input_after_gdigbcabbnakb, "root", "step"),
			on(chain_page_input_jhliinhchcgno, "root", "step")
		),
		contained(
			on(chain_chain_run_input_glnkafcnkbnnn, "scope"),
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "ChainRun")),
				"root"
			)
		),
		contained(
			on(chain_ordered_input_pbjpmafopnahk, "scope"),
			on(
				select(ChainRoot, (row) => row.eq(row.kind, "Ordered")),
				"root"
			)
		),
		contained(
			on(chain_page_output_dniojohpmhcee, "root", "step"),
			on(chain_page_input_jhliinhchcgno, "root", "step")
		),
		contained(on(chain_page_output_dniojohpmhcee, "root", "step"), on(ChainDone, "root", "step")),
		contained(
			on(chain_page_output_next_pocjijjpkpono, "root", "step"),
			on(chain_page_output_dniojohpmhcee, "root", "step")
		),
		contained(
			on(chain_chain_run_finish_output_lhniobmdeemdb, "root", "step"),
			on(ChainDone, "root", "step")
		),
		contained(
			on(chain_ordered_finish_output_nnemphmmfdblb, "root", "step"),
			on(ChainDone, "root", "step")
		),
		contained(
			on(chain_next_bbflpfpnlejpm, "root", "from"),
			on(chain_page_output_dniojohpmhcee, "root", "step")
		),
		contained(
			on(chain_next_bbflpfpnlejpm, "root", "to"),
			on(chain_page_input_jhliinhchcgno, "root", "step")
		),
		key(on(chain_next_bbflpfpnlejpm, "root", "to")),
		contained(
			on(chain_page_read_weights_agiabippcbobb, "root", "step"),
			on(ChainResult, "root", "step")
		),
		contained(
			on(chain_page_read_weights_agiabippcbobb, "digest"),
			on(chain_page_read_weights_agiabippcbobbRow, "digest")
		),
		contained(
			on(chain_page_read_earlier_dgehlbgebidjc, "root", "step"),
			on(ChainResult, "root", "step")
		),
		contained(
			on(chain_page_read_earlier_dgehlbgebidjc, "digest"),
			on(chain_page_read_earlier_dgehlbgebidjcRow, "digest")
		),
		contained(
			on(chain_page_read_tree_lakencnpkciin, "root", "step"),
			on(ChainResult, "root", "step")
		),
		contained(
			on(chain_page_read_tree_lakencnpkciin, "digest"),
			on(chain_page_read_tree_lakencnpkciinRow, "digest")
		),
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
		contained(on(chain_page_input_jhliinhchcgno, "root", "step"), on(ChainStep, "root", "step")),
		mutable(chain_page_input_jhliinhchcgno),
		contained(
			on(chain_page_input_after_gdigbcabbnakb, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_page_input_after_gdigbcabbnakb),
		contained(
			on(chain_chain_run_input_glnkafcnkbnnn, "root", "scope"),
			on(ChainScope, "root", "scope")
		),
		mutable(chain_chain_run_input_glnkafcnkbnnn),
		contained(
			on(chain_ordered_input_pbjpmafopnahk, "root", "scope"),
			on(ChainScope, "root", "scope")
		),
		mutable(chain_ordered_input_pbjpmafopnahk),
		contained(on(chain_page_output_dniojohpmhcee, "root", "step"), on(ChainStep, "root", "step")),
		mutable(chain_page_output_dniojohpmhcee),
		contained(
			on(chain_page_output_next_pocjijjpkpono, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_page_output_next_pocjijjpkpono),
		contained(
			on(chain_chain_run_finish_output_lhniobmdeemdb, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_chain_run_finish_output_lhniobmdeemdb),
		contained(
			on(chain_ordered_finish_output_nnemphmmfdblb, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_ordered_finish_output_nnemphmmfdblb),
		contained(on(chain_next_bbflpfpnlejpm, "root", "from"), on(ChainStep, "root", "step")),
		mutable(chain_next_bbflpfpnlejpm),
		contained(
			on(chain_page_read_weights_agiabippcbobb, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_page_read_weights_agiabippcbobb),
		contained(
			on(chain_page_read_earlier_dgehlbgebidjc, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_page_read_earlier_dgehlbgebidjc),
		contained(
			on(chain_page_read_tree_lakencnpkciin, "root", "step"),
			on(ChainStep, "root", "step")
		),
		mutable(chain_page_read_tree_lakencnpkciin),
		...chain_page_read_weights_agiabippcbobbRecords.rules,
		...chain_page_read_earlier_dgehlbgebidjcRecords.rules,
		...chain_page_read_tree_lakencnpkciinRecords.rules
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
		chain_page_input_feed_nlhfmgjplihkf,
		chain_chain_run_input_feed_dcnlhjpledlkf,
		chain_ordered_input_feed_hbpmfpphpfngm,
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
	"chain_page_output_dniojohpmhcee",
	"chain_page_output_next_pocjijjpkpono",
	"chain_chain_run_finish_output_lhniobmdeemdb",
	"chain_ordered_finish_output_nnemphmmfdblb",
	"chain_page_read_weights_agiabippcbobb",
	"chain_page_read_earlier_dgehlbgebidjc",
	"chain_page_read_tree_lakencnpkciin",
	"ChainStep",
	"ChainScope",
	"ChainAdmitted",
	"ChainFinish",
	"ChainStartStep",
	"chain_page_input_jhliinhchcgno",
	"chain_page_input_after_gdigbcabbnakb",
	"chain_next_bbflpfpnlejpm",
	"chain_ordered_input_pbjpmafopnahk",
	"ChainRequestedWith",
	"ChainRoot",
	...Arr.map(chain_page_read_weights_agiabippcbobbRecords.relations, (rel) => rel.name),
	...Arr.map(chain_page_read_earlier_dgehlbgebidjcRecords.relations, (rel) => rel.name),
	...Arr.map(chain_page_read_tree_lakencnpkciinRecords.relations, (rel) => rel.name)
] as const
