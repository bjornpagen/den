import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Assign to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	fragment,
	key,
	mutable,
	natural,
	Num,
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
import { DecideReads } from "#integration/slice/reads.ts"

export const AssignKind = closed.unordered("AssignKind", ["Embed", "Decide", "AssignmentFinish"])
export const AssignRootKind = closed.unordered("AssignRootKind", ["Assignment"])
export const AssignOutcome = closed.unordered("AssignOutcome", ["done", "failed"])
export const AssignRetryWhy = closed.unordered("AssignRetryWhy", ["spent", "transient", "later"])
export const AssignPausable = closed.unordered("AssignPausable", ["Assignment"])
export const assign_embed_input_mode_pblkjdhncepei = closed.unordered(
	"assign_embed_input_mode_pblkjdhncepei",
	["Nearest", "Within"]
)
export const assign_decide_input_mode_beoibaghjodnf = closed.unordered(
	"assign_decide_input_mode_beoibaghjodnf",
	["Nearest", "Within"]
)
export const assign_assignment_input_mode_pgalmghonldnf = closed.unordered(
	"assign_assignment_input_mode_pgalmghonldnf",
	["Nearest", "Within"]
)
export const assign_decide_output_stage_bjoijbfcegdbp = closed.unordered(
	"assign_decide_output_stage_bjoijbfcegdbp",
	["Serve", "Rest"]
)

export const AssignScope = relation("AssignScope", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const AssignRoot = relation(
	"AssignRoot",
	{ root: sha256, kind: closedId(AssignRootKind), key: Text, at: DenInstant },
	["root"]
)
export const AssignRequestedWith = relation(
	"AssignRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
	["root"]
)
export const AssignAdmitted = relation("AssignAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const AssignSkipped = relation(
	"AssignSkipped",
	{ root: sha256, scope: sha256, by: sha256 },
	["root", "scope"]
)
export const AssignStep = relation(
	"AssignStep",
	{ root: sha256, step: sha256, kind: closedId(AssignKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const AssignStartStep = relation(
	"AssignStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const AssignFinish = relation(
	"AssignFinish",
	{ root: sha256, scope: sha256, step: sha256 },
	["root", "scope"]
)
export const AssignClaim = relation(
	"AssignClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const AssignEnded = relation(
	"AssignEnded",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const AssignRetry = relation(
	"AssignRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(AssignRetryWhy) },
	["root", "step", "attempt"]
)
export const AssignFenced = relation(
	"AssignFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const AssignResult = relation(
	"AssignResult",
	{ root: sha256, step: sha256, outcome: closedId(AssignOutcome) },
	["root", "step"]
)
export const AssignDone = relation("AssignDone", { root: sha256, step: sha256 }, ["root", "step"])
export const AssignFailed = relation("AssignFailed", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const AssignHeld = relation("AssignHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const AssignRefusal = relation("AssignRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const AssignExhausted = relation("AssignExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const assign_embed_input_kmlepfpdepkmo = relation(
	"assign_embed_input_kmlepfpdepkmo",
	{
		root: sha256,
		step: sha256,
		learner: Text,
		topic: Text,
		mode: closedId(assign_embed_input_mode_pblkjdhncepei)
	},
	["root", "step"]
)
export const assign_embed_input_near_dhffcaodkgemm = relation(
	"assign_embed_input_near_dhffcaodkgemm",
	{ root: sha256, step: sha256, ordinal: natural, value: pg["double precision"] },
	["root", "step", "ordinal"]
)
export const assign_embed_input_exclude_gcjikbkjkcefj = relation(
	"assign_embed_input_exclude_gcjikbkjkcefj",
	{ root: sha256, step: sha256, ordinal: natural, value: Text },
	["root", "step", "ordinal"]
)
export const assign_embed_input_mode_nearest_bdiihcbmhfojp = relation(
	"assign_embed_input_mode_nearest_bdiihcbmhfojp",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const assign_embed_input_mode_within_oiehjhalkkkfi = relation(
	"assign_embed_input_mode_within_oiehjhalkkkfi",
	{ root: sha256, step: sha256, radius: pg["double precision"] },
	["root", "step"]
)
export const assign_decide_input_ffhdojphbdjfc = relation(
	"assign_decide_input_ffhdojphbdjfc",
	{
		root: sha256,
		step: sha256,
		learner: Text,
		topic: Text,
		vector: pg.vector(4),
		mode: closedId(assign_decide_input_mode_beoibaghjodnf)
	},
	["root", "step"]
)
export const assign_decide_input_exclude_bpjgmijefddch = relation(
	"assign_decide_input_exclude_bpjgmijefddch",
	{ root: sha256, step: sha256, ordinal: natural, value: Text },
	["root", "step", "ordinal"]
)
export const assign_decide_input_mode_nearest_ijgbegdphofca = relation(
	"assign_decide_input_mode_nearest_ijgbegdphofca",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const assign_decide_input_mode_within_fgbilcoafbdcg = relation(
	"assign_decide_input_mode_within_fgbilcoafbdcg",
	{ root: sha256, step: sha256, radius: pg["double precision"] },
	["root", "step"]
)
export const assign_assignment_input_kijoknpmnpomn = relation(
	"assign_assignment_input_kijoknpmnpomn",
	{
		root: sha256,
		scope: sha256,
		learner: Text,
		topic: Text,
		mode: closedId(assign_assignment_input_mode_pgalmghonldnf)
	},
	["root", "scope"]
)
export const assign_assignment_input_near_acilimddcfjog = relation(
	"assign_assignment_input_near_acilimddcfjog",
	{ root: sha256, scope: sha256, ordinal: natural, value: pg["double precision"] },
	["root", "scope", "ordinal"]
)
export const assign_assignment_input_exclude_paaebdpkimebl = relation(
	"assign_assignment_input_exclude_paaebdpkimebl",
	{ root: sha256, scope: sha256, ordinal: natural, value: Text },
	["root", "scope", "ordinal"]
)
export const assign_assignment_input_mode_nearest_jdmfgbfmpepjd = relation(
	"assign_assignment_input_mode_nearest_jdmfgbfmpepjd",
	{ root: sha256, scope: sha256 },
	["root", "scope"]
)
export const assign_assignment_input_mode_within_iahlinklmdadj = relation(
	"assign_assignment_input_mode_within_iahlinklmdadj",
	{ root: sha256, scope: sha256, radius: pg["double precision"] },
	["root", "scope"]
)
export const assign_embed_output_ghdpbieopfmkd = relation(
	"assign_embed_output_ghdpbieopfmkd",
	{ root: sha256, step: sha256, vector: pg.vector(4) },
	["root", "step"]
)
export const assign_decide_output_fkgbaoobeoima = relation(
	"assign_decide_output_fkgbaoobeoima",
	{
		root: sha256,
		step: sha256,
		confidence: pg["double precision"],
		stage: closedId(assign_decide_output_stage_bjoijbfcegdbp)
	},
	["root", "step"]
)
export const assign_decide_output_weighed_gpdibcghlfbhb = relation(
	"assign_decide_output_weighed_gpdibcghlfbhb",
	{
		root: sha256,
		step: sha256,
		ordinal: natural,
		passage: Text,
		distance: pg["double precision"],
		passed: pg.boolean
	},
	["root", "step", "ordinal"]
)
export const assign_decide_output_stage_serve_chfjeagmkjoef = relation(
	"assign_decide_output_stage_serve_chfjeagmkjoef",
	{ root: sha256, step: sha256, passage: Text, distance: pg["double precision"] },
	["root", "step"]
)
export const assign_decide_output_stage_rest_gohjkdlkfnkca = relation(
	"assign_decide_output_stage_rest_gohjkdlkfnkca",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const assign_assignment_finish_output_dehjnhpeahpgb = relation(
	"assign_assignment_finish_output_dehjnhpeahpgb",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const assign_asked_fobgfofknpfgd = relation(
	"assign_asked_fobgfofknpfgd",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
export const assign_decide_read_nearest_mlemoegfgpbbi = relation(
	"assign_decide_read_nearest_mlemoegfgpbbi",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const assign_decide_read_seen_oahojgbpphboo = relation(
	"assign_decide_read_seen_oahojgbpphboo",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const AssignPaused = relation(
	"AssignPaused",
	{ target: closedId(AssignPausable), turn: natural },
	["target", "turn"]
)
export const AssignResumed = relation(
	"AssignResumed",
	{ target: closedId(AssignPausable), turn: natural },
	["target", "turn"]
)
export const AssignServed = relation(
	"AssignServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The records of the rows step Decide's read `nearest` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, named by den, keyed by a row's digest alone, so every root that found a row shares it. */
export const assign_decide_read_nearest_mlemoegfgpbbiRecords = records(
	"assign_decide_read_nearest_mlemoegfgpbbi",
	DecideReads.named.nearest,
	{ digest: sha256 },
	["digest"]
)
export const assign_decide_read_nearest_mlemoegfgpbbiRow =
	assign_decide_read_nearest_mlemoegfgpbbiRecords.row

/** The records of the rows step Decide's read `seen` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, named by den, keyed by a row's digest alone, so every root that found a row shares it. */
export const assign_decide_read_seen_oahojgbpphbooRecords = records(
	"assign_decide_read_seen_oahojgbpphboo",
	DecideReads.named.seen,
	{ digest: sha256 },
	["digest"]
)
export const assign_decide_read_seen_oahojgbpphbooRow =
	assign_decide_read_seen_oahojgbpphbooRecords.row

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const assignGraph = fragment(
	[
		AssignKind,
		AssignRootKind,
		AssignOutcome,
		AssignRetryWhy,
		AssignPausable,
		assign_embed_input_mode_pblkjdhncepei,
		assign_decide_input_mode_beoibaghjodnf,
		assign_assignment_input_mode_pgalmghonldnf,
		assign_decide_output_stage_bjoijbfcegdbp,
		AssignScope,
		AssignRoot,
		AssignRequestedWith,
		AssignAdmitted,
		AssignSkipped,
		AssignStep,
		AssignStartStep,
		AssignFinish,
		AssignClaim,
		AssignEnded,
		AssignRetry,
		AssignFenced,
		AssignResult,
		AssignDone,
		AssignFailed,
		AssignHeld,
		AssignRefusal,
		AssignExhausted,
		assign_embed_input_kmlepfpdepkmo,
		assign_embed_input_near_dhffcaodkgemm,
		assign_embed_input_exclude_gcjikbkjkcefj,
		assign_embed_input_mode_nearest_bdiihcbmhfojp,
		assign_embed_input_mode_within_oiehjhalkkkfi,
		assign_decide_input_ffhdojphbdjfc,
		assign_decide_input_exclude_bpjgmijefddch,
		assign_decide_input_mode_nearest_ijgbegdphofca,
		assign_decide_input_mode_within_fgbilcoafbdcg,
		assign_assignment_input_kijoknpmnpomn,
		assign_assignment_input_near_acilimddcfjog,
		assign_assignment_input_exclude_paaebdpkimebl,
		assign_assignment_input_mode_nearest_jdmfgbfmpepjd,
		assign_assignment_input_mode_within_iahlinklmdadj,
		assign_embed_output_ghdpbieopfmkd,
		assign_decide_output_fkgbaoobeoima,
		assign_decide_output_weighed_gpdibcghlfbhb,
		assign_decide_output_stage_serve_chfjeagmkjoef,
		assign_decide_output_stage_rest_gohjkdlkfnkca,
		assign_assignment_finish_output_dehjnhpeahpgb,
		assign_asked_fobgfofknpfgd,
		assign_decide_read_nearest_mlemoegfgpbbi,
		assign_decide_read_seen_oahojgbpphboo,
		...assign_decide_read_nearest_mlemoegfgpbbiRecords.relations,
		...assign_decide_read_seen_oahojgbpphbooRecords.relations
	],
	[
		unit("DenRoot", { root: sha256 }),
		key(on(AssignScope, "scope")),
		key(on(AssignStep, "step")),
		contained(on(AssignAdmitted, "root", "scope"), on(AssignScope, "root", "scope")),
		contained(on(AssignSkipped, "scope"), on(AssignRoot, "root")),
		contained(on(AssignSkipped, "by"), on(AssignRoot, "root")),
		contained(on(AssignRequestedWith, "root"), on(AssignRoot, "root")),
		contained(on(AssignStep, "root", "scope"), on(AssignAdmitted, "root", "scope")),
		contained(on(AssignStartStep, "root", "scope"), on(AssignAdmitted, "root", "scope")),
		contained(on(AssignStartStep, "root", "step"), on(AssignStep, "root", "step")),
		key(on(AssignStartStep, "root", "step")),
		contained(on(AssignFinish, "root", "scope"), on(AssignAdmitted, "root", "scope")),
		contained(on(AssignFinish, "root", "step"), on(AssignStep, "root", "step")),
		key(on(AssignFinish, "root", "step")),
		contained(on(AssignClaim, "root", "step"), on(AssignStep, "root", "step")),
		contained(
			on(AssignEnded, "root", "step", "attempt"),
			on(AssignClaim, "root", "step", "attempt")
		),
		contained(
			on(
				select(AssignClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(AssignEnded, "root", "step", "attempt")
		),
		contained(
			on(AssignRetry, "root", "step", "attempt"),
			on(AssignEnded, "root", "step", "attempt")
		),
		contained(
			on(AssignFenced, "root", "step", "attempt"),
			on(AssignEnded, "root", "step", "attempt")
		),
		contained(on(AssignResult, "root", "step"), on(AssignStep, "root", "step")),
		contained(
			on(AssignHeld, "root", "step", "attempt"),
			on(AssignClaim, "root", "step", "attempt")
		),
		contained(on(AssignHeld, "root", "step"), on(AssignResult, "root", "step")),
		contained(
			on(AssignDone, "root", "step"),
			on(
				select(AssignResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(AssignFailed, "root", "step"),
			on(
				select(AssignResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(AssignRefusal, "root", "step"), on(AssignFailed, "root", "step")),
		contained(on(AssignExhausted, "root", "step"), on(AssignFailed, "root", "step")),
		contained(
			on(
				select(AssignRoot, (row) => row.eq(row.kind, "Assignment")),
				"root"
			),
			on(AssignRequestedWith, "root")
		),
		contained(
			on(assign_embed_input_kmlepfpdepkmo, "root", "step"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Embed")),
				"root",
				"step"
			)
		),
		contained(
			on(assign_embed_input_near_dhffcaodkgemm, "root", "step"),
			on(assign_embed_input_kmlepfpdepkmo, "root", "step")
		),
		contained(
			on(
				select(assign_embed_input_near_dhffcaodkgemm, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(assign_embed_input_near_dhffcaodkgemm, "root", "step", "ordinal")
		),
		check(
			"assign_embed_input_near_value_finite_ahmgcoehfjngc",
			assign_embed_input_near_dhffcaodkgemm,
			(row) => Num.isFinite(row.value)
		),
		contained(
			on(assign_embed_input_exclude_gcjikbkjkcefj, "root", "step"),
			on(assign_embed_input_kmlepfpdepkmo, "root", "step")
		),
		contained(
			on(
				select(assign_embed_input_exclude_gcjikbkjkcefj, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(assign_embed_input_exclude_gcjikbkjkcefj, "root", "step", "ordinal")
		),
		contained(
			on(assign_embed_input_mode_nearest_bdiihcbmhfojp, "root", "step"),
			on(
				select(assign_embed_input_kmlepfpdepkmo, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(assign_embed_input_kmlepfpdepkmo, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			),
			on(assign_embed_input_mode_nearest_bdiihcbmhfojp, "root", "step")
		),
		contained(
			on(assign_embed_input_mode_within_oiehjhalkkkfi, "root", "step"),
			on(
				select(assign_embed_input_kmlepfpdepkmo, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(assign_embed_input_kmlepfpdepkmo, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			),
			on(assign_embed_input_mode_within_oiehjhalkkkfi, "root", "step")
		),
		check(
			"assign_embed_input_mode_within_radius_finite_lgaddooipdeme",
			assign_embed_input_mode_within_oiehjhalkkkfi,
			(row) => Num.isFinite(row.radius)
		),
		contained(
			on(assign_decide_input_ffhdojphbdjfc, "root", "step"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Decide")),
				"root",
				"step"
			)
		),
		contained(
			on(assign_decide_input_exclude_bpjgmijefddch, "root", "step"),
			on(assign_decide_input_ffhdojphbdjfc, "root", "step")
		),
		contained(
			on(
				select(assign_decide_input_exclude_bpjgmijefddch, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(assign_decide_input_exclude_bpjgmijefddch, "root", "step", "ordinal")
		),
		contained(
			on(assign_decide_input_mode_nearest_ijgbegdphofca, "root", "step"),
			on(
				select(assign_decide_input_ffhdojphbdjfc, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(assign_decide_input_ffhdojphbdjfc, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			),
			on(assign_decide_input_mode_nearest_ijgbegdphofca, "root", "step")
		),
		contained(
			on(assign_decide_input_mode_within_fgbilcoafbdcg, "root", "step"),
			on(
				select(assign_decide_input_ffhdojphbdjfc, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(assign_decide_input_ffhdojphbdjfc, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			),
			on(assign_decide_input_mode_within_fgbilcoafbdcg, "root", "step")
		),
		check(
			"assign_decide_input_mode_within_radius_finite_mliibcfoddjpg",
			assign_decide_input_mode_within_fgbilcoafbdcg,
			(row) => Num.isFinite(row.radius)
		),
		contained(
			on(assign_assignment_input_kijoknpmnpomn, "scope"),
			on(
				select(AssignRoot, (row) => row.eq(row.kind, "Assignment")),
				"root"
			)
		),
		contained(
			on(assign_assignment_input_near_acilimddcfjog, "root", "scope"),
			on(assign_assignment_input_kijoknpmnpomn, "root", "scope")
		),
		contained(
			on(
				select(assign_assignment_input_near_acilimddcfjog, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				pred("ordinal")
			),
			on(assign_assignment_input_near_acilimddcfjog, "root", "scope", "ordinal")
		),
		check(
			"assign_assignment_input_near_value_finite_kpcjlfeibffeg",
			assign_assignment_input_near_acilimddcfjog,
			(row) => Num.isFinite(row.value)
		),
		contained(
			on(assign_assignment_input_exclude_paaebdpkimebl, "root", "scope"),
			on(assign_assignment_input_kijoknpmnpomn, "root", "scope")
		),
		contained(
			on(
				select(assign_assignment_input_exclude_paaebdpkimebl, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				pred("ordinal")
			),
			on(assign_assignment_input_exclude_paaebdpkimebl, "root", "scope", "ordinal")
		),
		contained(
			on(assign_assignment_input_mode_nearest_jdmfgbfmpepjd, "root", "scope"),
			on(
				select(assign_assignment_input_kijoknpmnpomn, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"scope"
			)
		),
		contained(
			on(
				select(assign_assignment_input_kijoknpmnpomn, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"scope"
			),
			on(assign_assignment_input_mode_nearest_jdmfgbfmpepjd, "root", "scope")
		),
		contained(
			on(assign_assignment_input_mode_within_iahlinklmdadj, "root", "scope"),
			on(
				select(assign_assignment_input_kijoknpmnpomn, (row) => row.eq(row.mode, "Within")),
				"root",
				"scope"
			)
		),
		contained(
			on(
				select(assign_assignment_input_kijoknpmnpomn, (row) => row.eq(row.mode, "Within")),
				"root",
				"scope"
			),
			on(assign_assignment_input_mode_within_iahlinklmdadj, "root", "scope")
		),
		check(
			"assign_assignment_input_mode_within_radius_njplimeeipeph",
			assign_assignment_input_mode_within_iahlinklmdadj,
			(row) => Num.isFinite(row.radius)
		),
		contained(
			on(assign_embed_output_ghdpbieopfmkd, "root", "step"),
			on(assign_embed_input_kmlepfpdepkmo, "root", "step")
		),
		contained(
			on(assign_embed_output_ghdpbieopfmkd, "root", "step"),
			on(AssignDone, "root", "step")
		),
		contained(
			on(assign_decide_output_fkgbaoobeoima, "root", "step"),
			on(assign_decide_input_ffhdojphbdjfc, "root", "step")
		),
		contained(
			on(assign_decide_output_fkgbaoobeoima, "root", "step"),
			on(AssignDone, "root", "step")
		),
		check(
			"assign_decide_output_confidence_finite_jkfldpdgbfbba",
			assign_decide_output_fkgbaoobeoima,
			(row) => Num.isFinite(row.confidence)
		),
		contained(
			on(assign_decide_output_weighed_gpdibcghlfbhb, "root", "step"),
			on(assign_decide_output_fkgbaoobeoima, "root", "step")
		),
		contained(
			on(
				select(assign_decide_output_weighed_gpdibcghlfbhb, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(assign_decide_output_weighed_gpdibcghlfbhb, "root", "step", "ordinal")
		),
		check(
			"assign_decide_output_weighed_distance_finite_icehkmadhmajc",
			assign_decide_output_weighed_gpdibcghlfbhb,
			(row) => Num.isFinite(row.distance)
		),
		contained(
			on(assign_decide_output_stage_serve_chfjeagmkjoef, "root", "step"),
			on(
				select(assign_decide_output_fkgbaoobeoima, (row) => row.eq(row.stage, "Serve")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(assign_decide_output_fkgbaoobeoima, (row) => row.eq(row.stage, "Serve")),
				"root",
				"step"
			),
			on(assign_decide_output_stage_serve_chfjeagmkjoef, "root", "step")
		),
		check(
			"assign_decide_output_stage_serve_distance_gcbpokkoipkec",
			assign_decide_output_stage_serve_chfjeagmkjoef,
			(row) => Num.isFinite(row.distance)
		),
		contained(
			on(assign_decide_output_stage_rest_gohjkdlkfnkca, "root", "step"),
			on(
				select(assign_decide_output_fkgbaoobeoima, (row) => row.eq(row.stage, "Rest")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(assign_decide_output_fkgbaoobeoima, (row) => row.eq(row.stage, "Rest")),
				"root",
				"step"
			),
			on(assign_decide_output_stage_rest_gohjkdlkfnkca, "root", "step")
		),
		contained(
			on(assign_assignment_finish_output_dehjnhpeahpgb, "root", "step"),
			on(AssignDone, "root", "step")
		),
		contained(
			on(assign_asked_fobgfofknpfgd, "root", "from"),
			on(assign_embed_output_ghdpbieopfmkd, "root", "step")
		),
		contained(
			on(assign_asked_fobgfofknpfgd, "root", "to"),
			on(assign_decide_input_ffhdojphbdjfc, "root", "step")
		),
		key(on(assign_asked_fobgfofknpfgd, "root", "to")),
		contained(
			on(assign_decide_read_nearest_mlemoegfgpbbi, "root", "step"),
			on(AssignResult, "root", "step")
		),
		contained(
			on(assign_decide_read_nearest_mlemoegfgpbbi, "digest"),
			on(assign_decide_read_nearest_mlemoegfgpbbiRow, "digest")
		),
		contained(
			on(assign_decide_read_seen_oahojgbpphboo, "root", "step"),
			on(AssignResult, "root", "step")
		),
		contained(
			on(assign_decide_read_seen_oahojgbpphboo, "digest"),
			on(assign_decide_read_seen_oahojgbpphbooRow, "digest")
		),
		contained(on(AssignScope, "root"), on(AssignRoot, "root")),
		mutable(AssignScope),
		mutable(AssignAdmitted),
		contained(on(AssignSkipped, "root", "scope"), on(AssignScope, "root", "scope")),
		mutable(AssignSkipped),
		contained(on(AssignStep, "root", "scope"), on(AssignScope, "root", "scope")),
		mutable(AssignStep),
		contained(on(AssignStartStep, "root", "scope"), on(AssignScope, "root", "scope")),
		mutable(AssignStartStep),
		contained(on(AssignFinish, "root", "scope"), on(AssignScope, "root", "scope")),
		mutable(AssignFinish),
		mutable(AssignClaim),
		contained(on(AssignEnded, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignEnded),
		contained(on(AssignRetry, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignRetry),
		contained(on(AssignFenced, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignFenced),
		mutable(AssignResult),
		contained(on(AssignDone, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignDone),
		contained(on(AssignFailed, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignFailed),
		contained(on(AssignHeld, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignHeld),
		contained(on(AssignRefusal, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignRefusal),
		contained(on(AssignExhausted, "root", "step"), on(AssignStep, "root", "step")),
		mutable(AssignExhausted),
		contained(on(assign_embed_input_kmlepfpdepkmo, "root", "step"), on(AssignStep, "root", "step")),
		mutable(assign_embed_input_kmlepfpdepkmo),
		contained(
			on(assign_embed_input_near_dhffcaodkgemm, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_embed_input_near_dhffcaodkgemm),
		contained(
			on(assign_embed_input_exclude_gcjikbkjkcefj, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_embed_input_exclude_gcjikbkjkcefj),
		contained(
			on(assign_embed_input_mode_nearest_bdiihcbmhfojp, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_embed_input_mode_nearest_bdiihcbmhfojp),
		contained(
			on(assign_embed_input_mode_within_oiehjhalkkkfi, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_embed_input_mode_within_oiehjhalkkkfi),
		contained(
			on(assign_decide_input_ffhdojphbdjfc, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_input_ffhdojphbdjfc),
		contained(
			on(assign_decide_input_exclude_bpjgmijefddch, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_input_exclude_bpjgmijefddch),
		contained(
			on(assign_decide_input_mode_nearest_ijgbegdphofca, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_input_mode_nearest_ijgbegdphofca),
		contained(
			on(assign_decide_input_mode_within_fgbilcoafbdcg, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_input_mode_within_fgbilcoafbdcg),
		contained(
			on(assign_assignment_input_kijoknpmnpomn, "root", "scope"),
			on(AssignScope, "root", "scope")
		),
		mutable(assign_assignment_input_kijoknpmnpomn),
		contained(
			on(assign_assignment_input_near_acilimddcfjog, "root", "scope"),
			on(AssignScope, "root", "scope")
		),
		mutable(assign_assignment_input_near_acilimddcfjog),
		contained(
			on(assign_assignment_input_exclude_paaebdpkimebl, "root", "scope"),
			on(AssignScope, "root", "scope")
		),
		mutable(assign_assignment_input_exclude_paaebdpkimebl),
		contained(
			on(assign_assignment_input_mode_nearest_jdmfgbfmpepjd, "root", "scope"),
			on(AssignScope, "root", "scope")
		),
		mutable(assign_assignment_input_mode_nearest_jdmfgbfmpepjd),
		contained(
			on(assign_assignment_input_mode_within_iahlinklmdadj, "root", "scope"),
			on(AssignScope, "root", "scope")
		),
		mutable(assign_assignment_input_mode_within_iahlinklmdadj),
		contained(
			on(assign_embed_output_ghdpbieopfmkd, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_embed_output_ghdpbieopfmkd),
		contained(
			on(assign_decide_output_fkgbaoobeoima, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_output_fkgbaoobeoima),
		contained(
			on(assign_decide_output_weighed_gpdibcghlfbhb, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_output_weighed_gpdibcghlfbhb),
		contained(
			on(assign_decide_output_stage_serve_chfjeagmkjoef, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_output_stage_serve_chfjeagmkjoef),
		contained(
			on(assign_decide_output_stage_rest_gohjkdlkfnkca, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_output_stage_rest_gohjkdlkfnkca),
		contained(
			on(assign_assignment_finish_output_dehjnhpeahpgb, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_assignment_finish_output_dehjnhpeahpgb),
		contained(on(assign_asked_fobgfofknpfgd, "root", "from"), on(AssignStep, "root", "step")),
		mutable(assign_asked_fobgfofknpfgd),
		contained(
			on(assign_decide_read_nearest_mlemoegfgpbbi, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_read_nearest_mlemoegfgpbbi),
		contained(
			on(assign_decide_read_seen_oahojgbpphboo, "root", "step"),
			on(AssignStep, "root", "step")
		),
		mutable(assign_decide_read_seen_oahojgbpphboo),
		...assign_decide_read_nearest_mlemoegfgpbbiRecords.rules,
		...assign_decide_read_seen_oahojgbpphbooRecords.rules
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const assignCoordination = fragment(
	[
		AssignKind,
		AssignRootKind,
		AssignOutcome,
		AssignRetryWhy,
		AssignPausable,
		assign_embed_input_mode_pblkjdhncepei,
		assign_decide_input_mode_beoibaghjodnf,
		assign_assignment_input_mode_pgalmghonldnf,
		assign_decide_output_stage_bjoijbfcegdbp,
		AssignPaused,
		AssignResumed,
		AssignServed
	],
	[
		contained(on(AssignResumed, "target", "turn"), on(AssignPaused, "target", "turn")),
		contained(on(AssignPaused, "target", pred("turn")), on(AssignResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const assignWriter = [
	"AssignResult",
	"AssignDone",
	"AssignHeld",
	"assign_embed_output_ghdpbieopfmkd",
	"assign_decide_output_fkgbaoobeoima",
	"assign_decide_output_weighed_gpdibcghlfbhb",
	"assign_decide_output_stage_serve_chfjeagmkjoef",
	"assign_decide_output_stage_rest_gohjkdlkfnkca",
	"assign_assignment_finish_output_dehjnhpeahpgb",
	"assign_decide_read_nearest_mlemoegfgpbbi",
	"assign_decide_read_seen_oahojgbpphboo",
	"AssignStep",
	"AssignScope",
	"AssignAdmitted",
	"AssignFinish",
	"AssignStartStep",
	"assign_embed_input_kmlepfpdepkmo",
	"assign_embed_input_near_dhffcaodkgemm",
	"assign_embed_input_exclude_gcjikbkjkcefj",
	"assign_embed_input_mode_nearest_bdiihcbmhfojp",
	"assign_embed_input_mode_within_oiehjhalkkkfi",
	"assign_decide_input_ffhdojphbdjfc",
	"assign_decide_input_exclude_bpjgmijefddch",
	"assign_decide_input_mode_nearest_ijgbegdphofca",
	"assign_decide_input_mode_within_fgbilcoafbdcg",
	"assign_asked_fobgfofknpfgd",
	...Arr.map(assign_decide_read_nearest_mlemoegfgpbbiRecords.relations, (rel) => rel.name),
	...Arr.map(assign_decide_read_seen_oahojgbpphbooRecords.relations, (rel) => rel.name)
] as const
