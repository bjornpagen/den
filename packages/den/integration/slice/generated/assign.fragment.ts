import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Assign to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { DecideReads } from "#integration/slice/reads.ts"

export const AssignKind = g.closed.unordered("AssignKind", ["Embed", "Decide", "AssignmentFinish"])
export const AssignRootKind = g.closed.unordered("AssignRootKind", ["Assignment"])
export const AssignOutcome = g.closed.unordered("AssignOutcome", ["done", "failed"])
export const AssignRetryWhy = g.closed.unordered("AssignRetryWhy", ["spent", "transient", "later"])
export const AssignPausable = g.closed.unordered("AssignPausable", ["Assignment"])
export const AssignEmbedInputMode = g
	.derivedName({ stem: "Assign", path: ["EmbedInputMode"] })
	.unordered("AssignEmbedInputMode", ["Nearest", "Within"])
export const AssignDecideInputMode = g
	.derivedName({ stem: "Assign", path: ["DecideInputMode"] })
	.unordered("AssignDecideInputMode", ["Nearest", "Within"])
export const AssignAssignmentInputMode = g
	.derivedName({ stem: "Assign", path: ["AssignmentInputMode"] })
	.unordered("AssignAssignmentInputMode", ["Nearest", "Within"])
export const AssignDecideOutputStage = g
	.derivedName({ stem: "Assign", path: ["DecideOutputStage"] })
	.unordered("AssignDecideOutputStage", ["Serve", "Rest"])

export const AssignScope = g.relation("AssignScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const AssignRoot = g.relation(
	"AssignRoot",
	{ root: g.sha256, kind: g.closedId(AssignRootKind), key: Text, at: DenInstant },
	["root"]
)
export const AssignRequestedWith = g.relation(
	"AssignRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const AssignAdmitted = g.relation("AssignAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const AssignSkipped = g.relation(
	"AssignSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const AssignStep = g.relation(
	"AssignStep",
	{
		root: g.sha256,
		step: g.sha256,
		kind: g.closedId(AssignKind),
		scope: g.sha256,
		due: DenInstant
	},
	["root", "step"]
)
export const AssignStartStep = g.relation(
	"AssignStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const AssignFinish = g.relation(
	"AssignFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const AssignClaim = g.relation(
	"AssignClaim",
	{ root: g.sha256, step: g.sha256, attempt: g.place, until: DenInstant },
	["root", "step", "attempt"]
)
export const AssignEnded = g.relation(
	"AssignEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const AssignRetry = g.relation(
	"AssignRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(AssignRetryWhy)
	},
	["root", "step", "attempt"]
)
export const AssignFenced = g.relation(
	"AssignFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const AssignResult = g.relation(
	"AssignResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(AssignOutcome) },
	["root", "step"]
)
export const AssignDone = g.relation("AssignDone", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const AssignFailed = g.relation("AssignFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const AssignHeld = g.relation(
	"AssignHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const AssignRefusal = g.relation(
	"AssignRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const AssignExhausted = g.relation("AssignExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const AssignEmbedInput = g.derivedName({ stem: "Assign", path: ["EmbedInput"] }).relation(
	"AssignEmbedInput",
	{
		root: g.sha256,
		step: g.sha256,
		learner: Text,
		topic: Text,
		mode: g.closedId(AssignEmbedInputMode)
	},
	["root", "step"]
)
export const AssignEmbedInputNear = g
	.derivedName({ stem: "Assign", path: ["EmbedInputNear"] })
	.relation(
		"AssignEmbedInputNear",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, value: g.float8 },
		["root", "step", "ordinal"]
	)
export const AssignEmbedInputExclude = g
	.derivedName({ stem: "Assign", path: ["EmbedInputExclude"] })
	.relation(
		"AssignEmbedInputExclude",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, value: Text },
		["root", "step", "ordinal"]
	)
export const AssignEmbedInputModeNearest = g
	.derivedName({ stem: "Assign", path: ["EmbedInputModeNearest"] })
	.relation("AssignEmbedInputModeNearest", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const AssignEmbedInputModeWithin = g
	.derivedName({ stem: "Assign", path: ["EmbedInputModeWithin"] })
	.relation("AssignEmbedInputModeWithin", { root: g.sha256, step: g.sha256, radius: g.float8 }, [
		"root",
		"step"
	])
export const AssignDecideInput = g.derivedName({ stem: "Assign", path: ["DecideInput"] }).relation(
	"AssignDecideInput",
	{
		root: g.sha256,
		step: g.sha256,
		learner: Text,
		topic: Text,
		vector: g.vector(4),
		mode: g.closedId(AssignDecideInputMode)
	},
	["root", "step"]
)
export const AssignDecideInputExclude = g
	.derivedName({ stem: "Assign", path: ["DecideInputExclude"] })
	.relation(
		"AssignDecideInputExclude",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, value: Text },
		["root", "step", "ordinal"]
	)
export const AssignDecideInputModeNearest = g
	.derivedName({ stem: "Assign", path: ["DecideInputModeNearest"] })
	.relation("AssignDecideInputModeNearest", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const AssignDecideInputModeWithin = g
	.derivedName({ stem: "Assign", path: ["DecideInputModeWithin"] })
	.relation("AssignDecideInputModeWithin", { root: g.sha256, step: g.sha256, radius: g.float8 }, [
		"root",
		"step"
	])
export const AssignAssignmentInput = g
	.derivedName({ stem: "Assign", path: ["AssignmentInput"] })
	.relation(
		"AssignAssignmentInput",
		{
			root: g.sha256,
			scope: g.sha256,
			learner: Text,
			topic: Text,
			mode: g.closedId(AssignAssignmentInputMode)
		},
		["root", "scope"]
	)
export const AssignAssignmentInputNear = g
	.derivedName({ stem: "Assign", path: ["AssignmentInputNear"] })
	.relation(
		"AssignAssignmentInputNear",
		{ root: g.sha256, scope: g.sha256, ordinal: g.natural, value: g.float8 },
		["root", "scope", "ordinal"]
	)
export const AssignAssignmentInputExclude = g
	.derivedName({ stem: "Assign", path: ["AssignmentInputExclude"] })
	.relation(
		"AssignAssignmentInputExclude",
		{ root: g.sha256, scope: g.sha256, ordinal: g.natural, value: Text },
		["root", "scope", "ordinal"]
	)
export const AssignAssignmentInputModeNearest = g
	.derivedName({ stem: "Assign", path: ["AssignmentInputModeNearest"] })
	.relation("AssignAssignmentInputModeNearest", { root: g.sha256, scope: g.sha256 }, [
		"root",
		"scope"
	])
export const AssignAssignmentInputModeWithin = g
	.derivedName({ stem: "Assign", path: ["AssignmentInputModeWithin"] })
	.relation(
		"AssignAssignmentInputModeWithin",
		{ root: g.sha256, scope: g.sha256, radius: g.float8 },
		["root", "scope"]
	)
export const AssignEmbedOutput = g
	.derivedName({ stem: "Assign", path: ["EmbedOutput"] })
	.relation("AssignEmbedOutput", { root: g.sha256, step: g.sha256, vector: g.vector(4) }, [
		"root",
		"step"
	])
export const AssignDecideOutput = g
	.derivedName({ stem: "Assign", path: ["DecideOutput"] })
	.relation(
		"AssignDecideOutput",
		{
			root: g.sha256,
			step: g.sha256,
			confidence: g.float8,
			stage: g.closedId(AssignDecideOutputStage)
		},
		["root", "step"]
	)
export const AssignDecideOutputWeighed = g
	.derivedName({ stem: "Assign", path: ["DecideOutputWeighed"] })
	.relation(
		"AssignDecideOutputWeighed",
		{
			root: g.sha256,
			step: g.sha256,
			ordinal: g.natural,
			passage: Text,
			distance: g.float8,
			passed: g.bool
		},
		["root", "step", "ordinal"]
	)
export const AssignDecideOutputStageServe = g
	.derivedName({ stem: "Assign", path: ["DecideOutputStageServe"] })
	.relation(
		"AssignDecideOutputStageServe",
		{ root: g.sha256, step: g.sha256, passage: Text, distance: g.float8 },
		["root", "step"]
	)
export const AssignDecideOutputStageRest = g
	.derivedName({ stem: "Assign", path: ["DecideOutputStageRest"] })
	.relation("AssignDecideOutputStageRest", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const AssignAssignmentFinishOutput = g
	.derivedName({ stem: "Assign", path: ["AssignmentFinishOutput"] })
	.relation("AssignAssignmentFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const AssignAsked = g
	.derivedName({ stem: "Assign", path: ["Asked"] })
	.relation("AssignAsked", { root: g.sha256, from: g.sha256, ordinal: g.natural, to: g.sha256 }, [
		"root",
		"from",
		"ordinal"
	])
export const AssignDecideReadNearest = g
	.derivedName({ stem: "Assign", path: ["DecideReadNearest"] })
	.relation(
		"AssignDecideReadNearest",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, digest: g.sha256 },
		["root", "step", "ordinal"]
	)
export const AssignDecideReadSeen = g
	.derivedName({ stem: "Assign", path: ["DecideReadSeen"] })
	.relation(
		"AssignDecideReadSeen",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, digest: g.sha256 },
		["root", "step", "ordinal"]
	)
export const AssignPaused = g.relation(
	"AssignPaused",
	{ target: g.closedId(AssignPausable), turn: g.natural },
	["target", "turn"]
)
export const AssignResumed = g.relation(
	"AssignResumed",
	{ target: g.closedId(AssignPausable), turn: g.natural },
	["target", "turn"]
)
export const AssignServed = g.relation(
	"AssignServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The records of the rows step Decide's read `nearest` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, its name grizzle's, keyed by a row's digest alone, so every root that found a row shares it. */
export const AssignDecideReadNearestRecords = g.records(
	"AssignDecideReadNearest",
	DecideReads.named.nearest,
	{ digest: g.sha256 },
	["digest"]
)
export const AssignDecideReadNearestRow = AssignDecideReadNearestRecords.row

/** The records of the rows step Decide's read `seen` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, its name grizzle's, keyed by a row's digest alone, so every root that found a row shares it. */
export const AssignDecideReadSeenRecords = g.records(
	"AssignDecideReadSeen",
	DecideReads.named.seen,
	{ digest: g.sha256 },
	["digest"]
)
export const AssignDecideReadSeenRow = AssignDecideReadSeenRecords.row

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const assignGraph = g.fragment(
	[
		AssignKind,
		AssignRootKind,
		AssignOutcome,
		AssignRetryWhy,
		AssignPausable,
		AssignEmbedInputMode,
		AssignDecideInputMode,
		AssignAssignmentInputMode,
		AssignDecideOutputStage,
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
		AssignEmbedInput,
		AssignEmbedInputNear,
		AssignEmbedInputExclude,
		AssignEmbedInputModeNearest,
		AssignEmbedInputModeWithin,
		AssignDecideInput,
		AssignDecideInputExclude,
		AssignDecideInputModeNearest,
		AssignDecideInputModeWithin,
		AssignAssignmentInput,
		AssignAssignmentInputNear,
		AssignAssignmentInputExclude,
		AssignAssignmentInputModeNearest,
		AssignAssignmentInputModeWithin,
		AssignEmbedOutput,
		AssignDecideOutput,
		AssignDecideOutputWeighed,
		AssignDecideOutputStageServe,
		AssignDecideOutputStageRest,
		AssignAssignmentFinishOutput,
		AssignAsked,
		AssignDecideReadNearest,
		AssignDecideReadSeen,
		...AssignDecideReadNearestRecords.relations,
		...AssignDecideReadSeenRecords.relations
	],
	[
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(AssignScope, "scope")),
		g.key(g.on(AssignStep, "step")),
		g.contained(g.on(AssignAdmitted, "root", "scope"), g.on(AssignScope, "root", "scope")),
		g.contained(g.on(AssignSkipped, "scope"), g.on(AssignRoot, "root")),
		g.contained(g.on(AssignSkipped, "by"), g.on(AssignRoot, "root")),
		g.contained(g.on(AssignRequestedWith, "root"), g.on(AssignRoot, "root")),
		g.contained(g.on(AssignStep, "root", "scope"), g.on(AssignAdmitted, "root", "scope")),
		g.contained(g.on(AssignStartStep, "root", "scope"), g.on(AssignAdmitted, "root", "scope")),
		g.contained(g.on(AssignStartStep, "root", "step"), g.on(AssignStep, "root", "step")),
		g.key(g.on(AssignStartStep, "root", "step")),
		g.contained(g.on(AssignFinish, "root", "scope"), g.on(AssignAdmitted, "root", "scope")),
		g.contained(g.on(AssignFinish, "root", "step"), g.on(AssignStep, "root", "step")),
		g.key(g.on(AssignFinish, "root", "step")),
		g.contained(g.on(AssignClaim, "root", "step"), g.on(AssignStep, "root", "step")),
		g.contained(
			g.on(AssignEnded, "root", "step", "attempt"),
			g.on(AssignClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(AssignClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(AssignEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(AssignRetry, "root", "step", "attempt"),
			g.on(AssignEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(AssignFenced, "root", "step", "attempt"),
			g.on(AssignEnded, "root", "step", "attempt")
		),
		g.contained(g.on(AssignResult, "root", "step"), g.on(AssignStep, "root", "step")),
		g.contained(
			g.on(AssignHeld, "root", "step", "attempt"),
			g.on(AssignClaim, "root", "step", "attempt")
		),
		g.contained(g.on(AssignHeld, "root", "step"), g.on(AssignResult, "root", "step")),
		g.contained(
			g.on(AssignDone, "root", "step"),
			g.on(
				g.select(AssignResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(AssignFailed, "root", "step"),
			g.on(
				g.select(AssignResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(AssignRefusal, "root", "step"), g.on(AssignFailed, "root", "step")),
		g.contained(g.on(AssignExhausted, "root", "step"), g.on(AssignFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(AssignRoot, (row) => row.eq(row.kind, "Assignment")),
				"root"
			),
			g.on(AssignRequestedWith, "root")
		),
		g.contained(
			g.on(AssignEmbedInput, "root", "step"),
			g.on(
				g.select(AssignStep, (row) => row.eq(row.kind, "Embed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(AssignEmbedInputNear, "root", "step"), g.on(AssignEmbedInput, "root", "step")),
		g.contained(
			g.on(
				g.select(AssignEmbedInputNear, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				g.pred("ordinal")
			),
			g.on(AssignEmbedInputNear, "root", "step", "ordinal")
		),
		g.check("valueFinite", AssignEmbedInputNear, (row) => g.Num.isFinite(row.value)),
		g.contained(
			g.on(AssignEmbedInputExclude, "root", "step"),
			g.on(AssignEmbedInput, "root", "step")
		),
		g.contained(
			g.on(
				g.select(AssignEmbedInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				g.pred("ordinal")
			),
			g.on(AssignEmbedInputExclude, "root", "step", "ordinal")
		),
		g.contained(
			g.on(AssignEmbedInputModeNearest, "root", "step"),
			g.on(
				g.select(AssignEmbedInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(
				g.select(AssignEmbedInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			),
			g.on(AssignEmbedInputModeNearest, "root", "step")
		),
		g.contained(
			g.on(AssignEmbedInputModeWithin, "root", "step"),
			g.on(
				g.select(AssignEmbedInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(
				g.select(AssignEmbedInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			),
			g.on(AssignEmbedInputModeWithin, "root", "step")
		),
		g.check("radiusFinite", AssignEmbedInputModeWithin, (row) => g.Num.isFinite(row.radius)),
		g.contained(
			g.on(AssignDecideInput, "root", "step"),
			g.on(
				g.select(AssignStep, (row) => row.eq(row.kind, "Decide")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(AssignDecideInputExclude, "root", "step"),
			g.on(AssignDecideInput, "root", "step")
		),
		g.contained(
			g.on(
				g.select(AssignDecideInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				g.pred("ordinal")
			),
			g.on(AssignDecideInputExclude, "root", "step", "ordinal")
		),
		g.contained(
			g.on(AssignDecideInputModeNearest, "root", "step"),
			g.on(
				g.select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(
				g.select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			),
			g.on(AssignDecideInputModeNearest, "root", "step")
		),
		g.contained(
			g.on(AssignDecideInputModeWithin, "root", "step"),
			g.on(
				g.select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(
				g.select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			),
			g.on(AssignDecideInputModeWithin, "root", "step")
		),
		g.check("radiusFinite", AssignDecideInputModeWithin, (row) => g.Num.isFinite(row.radius)),
		g.contained(
			g.on(AssignAssignmentInput, "scope"),
			g.on(
				g.select(AssignRoot, (row) => row.eq(row.kind, "Assignment")),
				"root"
			)
		),
		g.contained(
			g.on(AssignAssignmentInputNear, "root", "scope"),
			g.on(AssignAssignmentInput, "root", "scope")
		),
		g.contained(
			g.on(
				g.select(AssignAssignmentInputNear, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				g.pred("ordinal")
			),
			g.on(AssignAssignmentInputNear, "root", "scope", "ordinal")
		),
		g.check("valueFinite", AssignAssignmentInputNear, (row) => g.Num.isFinite(row.value)),
		g.contained(
			g.on(AssignAssignmentInputExclude, "root", "scope"),
			g.on(AssignAssignmentInput, "root", "scope")
		),
		g.contained(
			g.on(
				g.select(AssignAssignmentInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				g.pred("ordinal")
			),
			g.on(AssignAssignmentInputExclude, "root", "scope", "ordinal")
		),
		g.contained(
			g.on(AssignAssignmentInputModeNearest, "root", "scope"),
			g.on(
				g.select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"scope"
			)
		),
		g.contained(
			g.on(
				g.select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"scope"
			),
			g.on(AssignAssignmentInputModeNearest, "root", "scope")
		),
		g.contained(
			g.on(AssignAssignmentInputModeWithin, "root", "scope"),
			g.on(
				g.select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"scope"
			)
		),
		g.contained(
			g.on(
				g.select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"scope"
			),
			g.on(AssignAssignmentInputModeWithin, "root", "scope")
		),
		g.check("radiusFinite", AssignAssignmentInputModeWithin, (row) => g.Num.isFinite(row.radius)),
		g.contained(g.on(AssignEmbedOutput, "root", "step"), g.on(AssignEmbedInput, "root", "step")),
		g.contained(g.on(AssignEmbedOutput, "root", "step"), g.on(AssignDone, "root", "step")),
		g.contained(g.on(AssignDecideOutput, "root", "step"), g.on(AssignDecideInput, "root", "step")),
		g.contained(g.on(AssignDecideOutput, "root", "step"), g.on(AssignDone, "root", "step")),
		g.check("confidenceFinite", AssignDecideOutput, (row) => g.Num.isFinite(row.confidence)),
		g.contained(
			g.on(AssignDecideOutputWeighed, "root", "step"),
			g.on(AssignDecideOutput, "root", "step")
		),
		g.contained(
			g.on(
				g.select(AssignDecideOutputWeighed, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				g.pred("ordinal")
			),
			g.on(AssignDecideOutputWeighed, "root", "step", "ordinal")
		),
		g.check("distanceFinite", AssignDecideOutputWeighed, (row) => g.Num.isFinite(row.distance)),
		g.contained(
			g.on(AssignDecideOutputStageServe, "root", "step"),
			g.on(
				g.select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(
				g.select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"root",
				"step"
			),
			g.on(AssignDecideOutputStageServe, "root", "step")
		),
		g.check("distanceFinite", AssignDecideOutputStageServe, (row) => g.Num.isFinite(row.distance)),
		g.contained(
			g.on(AssignDecideOutputStageRest, "root", "step"),
			g.on(
				g.select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(
				g.select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"root",
				"step"
			),
			g.on(AssignDecideOutputStageRest, "root", "step")
		),
		g.contained(
			g.on(AssignAssignmentFinishOutput, "root", "step"),
			g.on(AssignDone, "root", "step")
		),
		g.contained(g.on(AssignAsked, "root", "from"), g.on(AssignEmbedOutput, "root", "step")),
		g.contained(g.on(AssignAsked, "root", "to"), g.on(AssignDecideInput, "root", "step")),
		g.key(g.on(AssignAsked, "root", "to")),
		g.contained(g.on(AssignDecideReadNearest, "root", "step"), g.on(AssignResult, "root", "step")),
		g.contained(
			g.on(AssignDecideReadNearest, "digest"),
			g.on(AssignDecideReadNearestRow, "digest")
		),
		g.contained(g.on(AssignDecideReadSeen, "root", "step"), g.on(AssignResult, "root", "step")),
		g.contained(g.on(AssignDecideReadSeen, "digest"), g.on(AssignDecideReadSeenRow, "digest")),
		g.contained(g.on(AssignScope, "root"), g.on(AssignRoot, "root")),
		g.mutable(AssignScope),
		g.mutable(AssignAdmitted),
		g.contained(g.on(AssignSkipped, "root", "scope"), g.on(AssignScope, "root", "scope")),
		g.mutable(AssignSkipped),
		g.contained(g.on(AssignStep, "root", "scope"), g.on(AssignScope, "root", "scope")),
		g.mutable(AssignStep),
		g.contained(g.on(AssignStartStep, "root", "scope"), g.on(AssignScope, "root", "scope")),
		g.mutable(AssignStartStep),
		g.contained(g.on(AssignFinish, "root", "scope"), g.on(AssignScope, "root", "scope")),
		g.mutable(AssignFinish),
		g.mutable(AssignClaim),
		g.contained(g.on(AssignEnded, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignEnded),
		g.contained(g.on(AssignRetry, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignRetry),
		g.contained(g.on(AssignFenced, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignFenced),
		g.mutable(AssignResult),
		g.contained(g.on(AssignDone, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDone),
		g.contained(g.on(AssignFailed, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignFailed),
		g.contained(g.on(AssignHeld, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignHeld),
		g.contained(g.on(AssignRefusal, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignRefusal),
		g.contained(g.on(AssignExhausted, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignExhausted),
		g.contained(g.on(AssignEmbedInput, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignEmbedInput),
		g.contained(g.on(AssignEmbedInputNear, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignEmbedInputNear),
		g.contained(g.on(AssignEmbedInputExclude, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignEmbedInputExclude),
		g.contained(
			g.on(AssignEmbedInputModeNearest, "root", "step"),
			g.on(AssignStep, "root", "step")
		),
		g.mutable(AssignEmbedInputModeNearest),
		g.contained(g.on(AssignEmbedInputModeWithin, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignEmbedInputModeWithin),
		g.contained(g.on(AssignDecideInput, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDecideInput),
		g.contained(g.on(AssignDecideInputExclude, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDecideInputExclude),
		g.contained(
			g.on(AssignDecideInputModeNearest, "root", "step"),
			g.on(AssignStep, "root", "step")
		),
		g.mutable(AssignDecideInputModeNearest),
		g.contained(
			g.on(AssignDecideInputModeWithin, "root", "step"),
			g.on(AssignStep, "root", "step")
		),
		g.mutable(AssignDecideInputModeWithin),
		g.contained(g.on(AssignAssignmentInput, "root", "scope"), g.on(AssignScope, "root", "scope")),
		g.mutable(AssignAssignmentInput),
		g.contained(
			g.on(AssignAssignmentInputNear, "root", "scope"),
			g.on(AssignScope, "root", "scope")
		),
		g.mutable(AssignAssignmentInputNear),
		g.contained(
			g.on(AssignAssignmentInputExclude, "root", "scope"),
			g.on(AssignScope, "root", "scope")
		),
		g.mutable(AssignAssignmentInputExclude),
		g.contained(
			g.on(AssignAssignmentInputModeNearest, "root", "scope"),
			g.on(AssignScope, "root", "scope")
		),
		g.mutable(AssignAssignmentInputModeNearest),
		g.contained(
			g.on(AssignAssignmentInputModeWithin, "root", "scope"),
			g.on(AssignScope, "root", "scope")
		),
		g.mutable(AssignAssignmentInputModeWithin),
		g.contained(g.on(AssignEmbedOutput, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignEmbedOutput),
		g.contained(g.on(AssignDecideOutput, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDecideOutput),
		g.contained(g.on(AssignDecideOutputWeighed, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDecideOutputWeighed),
		g.contained(
			g.on(AssignDecideOutputStageServe, "root", "step"),
			g.on(AssignStep, "root", "step")
		),
		g.mutable(AssignDecideOutputStageServe),
		g.contained(
			g.on(AssignDecideOutputStageRest, "root", "step"),
			g.on(AssignStep, "root", "step")
		),
		g.mutable(AssignDecideOutputStageRest),
		g.contained(
			g.on(AssignAssignmentFinishOutput, "root", "step"),
			g.on(AssignStep, "root", "step")
		),
		g.mutable(AssignAssignmentFinishOutput),
		g.contained(g.on(AssignAsked, "root", "from"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignAsked),
		g.contained(g.on(AssignDecideReadNearest, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDecideReadNearest),
		g.contained(g.on(AssignDecideReadSeen, "root", "step"), g.on(AssignStep, "root", "step")),
		g.mutable(AssignDecideReadSeen),
		...AssignDecideReadNearestRecords.rules,
		...AssignDecideReadSeenRecords.rules
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const assignCoordination = g.fragment(
	[
		AssignKind,
		AssignRootKind,
		AssignOutcome,
		AssignRetryWhy,
		AssignPausable,
		AssignEmbedInputMode,
		AssignDecideInputMode,
		AssignAssignmentInputMode,
		AssignDecideOutputStage,
		AssignPaused,
		AssignResumed,
		AssignServed
	],
	[
		g.contained(g.on(AssignResumed, "target", "turn"), g.on(AssignPaused, "target", "turn")),
		g.contained(g.on(AssignPaused, "target", g.pred("turn")), g.on(AssignResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const assignWriter = [
	"AssignResult",
	"AssignDone",
	"AssignHeld",
	"AssignEmbedOutput",
	"AssignDecideOutput",
	"AssignDecideOutputWeighed",
	"AssignDecideOutputStageServe",
	"AssignDecideOutputStageRest",
	"AssignAssignmentFinishOutput",
	"AssignDecideReadNearest",
	"AssignDecideReadSeen",
	"AssignStep",
	"AssignScope",
	"AssignAdmitted",
	"AssignFinish",
	"AssignStartStep",
	"AssignEmbedInput",
	"AssignEmbedInputNear",
	"AssignEmbedInputExclude",
	"AssignEmbedInputModeNearest",
	"AssignEmbedInputModeWithin",
	"AssignDecideInput",
	"AssignDecideInputExclude",
	"AssignDecideInputModeNearest",
	"AssignDecideInputModeWithin",
	"AssignAsked",
	...Arr.map(AssignDecideReadNearestRecords.relations, (rel) => rel.name),
	...Arr.map(AssignDecideReadSeenRecords.relations, (rel) => rel.name)
] as const
