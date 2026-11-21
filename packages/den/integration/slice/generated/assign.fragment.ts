import { DenInstant, DenRow, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Assign to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	fragment,
	key,
	natural,
	Num,
	on,
	place,
	pg,
	pred,
	relation,
	retirable,
	retirement,
	select
} from "@bjornpagen/grizzle"

export const AssignKind = closed.unordered("AssignKind", ["Embed", "Decide", "AssignmentFinish"])
export const AssignRootKind = closed.unordered("AssignRootKind", ["Assignment"])
export const AssignOutcome = closed.unordered("AssignOutcome", ["done", "failed"])
export const AssignRetryWhy = closed.unordered("AssignRetryWhy", ["spent", "transient", "later"])
export const AssignPausable = closed.unordered("AssignPausable", ["Assignment"])
export const AssignEmbedInputMode = closed.unordered("AssignEmbedInputMode", ["Nearest", "Within"])
export const AssignDecideInputMode = closed.unordered("AssignDecideInputMode", [
	"Nearest",
	"Within"
])
export const AssignAssignmentInputMode = closed.unordered("AssignAssignmentInputMode", [
	"Nearest",
	"Within"
])
export const AssignDecideOutputStage = closed.unordered("AssignDecideOutputStage", [
	"Serve",
	"Rest"
])

export const AssignScope = relation("AssignScope", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const AssignRoot = relation(
	"AssignRoot",
	{
		scope: DenScope,
		kind: closedId(AssignRootKind),
		key: Text,
		at: DenInstant,
		retired: retirement
	},
	["scope"]
)
export const AssignAdmitted = relation("AssignAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const AssignSkipped = relation(
	"AssignSkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const AssignStep = relation(
	"AssignStep",
	{ step: DenStep, kind: closedId(AssignKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const AssignStartStep = relation(
	"AssignStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const AssignFinish = relation(
	"AssignFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const AssignClaim = relation(
	"AssignClaim",
	{ step: DenStep, attempt: place, until: DenInstant, root: DenScope },
	["step", "root", "attempt"]
)
export const AssignEnded = relation(
	"AssignEnded",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const AssignRetry = relation(
	"AssignRetry",
	{
		step: DenStep,
		attempt: natural,
		at: DenInstant,
		why: closedId(AssignRetryWhy),
		root: DenScope
	},
	["step", "attempt", "root"]
)
export const AssignFenced = relation(
	"AssignFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const AssignResult = relation(
	"AssignResult",
	{ step: DenStep, outcome: closedId(AssignOutcome), root: DenScope },
	["step", "root"]
)
export const AssignDone = relation("AssignDone", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const AssignFailed = relation("AssignFailed", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const AssignHeld = relation(
	"AssignHeld",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "root"]
)
export const AssignRefusal = relation(
	"AssignRefusal",
	{ step: DenStep, law: Text, root: DenScope },
	["step", "root"]
)
export const AssignExhausted = relation("AssignExhausted", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const AssignEmbedInput = relation(
	"AssignEmbedInput",
	{
		step: DenStep,
		learner: Text,
		topic: Text,
		mode: closedId(AssignEmbedInputMode),
		root: DenScope
	},
	["step", "root"]
)
export const AssignEmbedInputNear = relation(
	"AssignEmbedInputNear",
	{ step: DenStep, ordinal: natural, value: pg["double precision"], root: DenScope },
	["step", "ordinal", "root"]
)
export const AssignEmbedInputExclude = relation(
	"AssignEmbedInputExclude",
	{ step: DenStep, ordinal: natural, value: Text, root: DenScope },
	["step", "ordinal", "root"]
)
export const AssignEmbedInputModeNearest = relation(
	"AssignEmbedInputModeNearest",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const AssignEmbedInputModeWithin = relation(
	"AssignEmbedInputModeWithin",
	{ step: DenStep, radius: pg["double precision"], root: DenScope },
	["step", "root"]
)
export const AssignDecideInput = relation(
	"AssignDecideInput",
	{
		step: DenStep,
		learner: Text,
		topic: Text,
		vector: pg.vector(4),
		mode: closedId(AssignDecideInputMode),
		root: DenScope
	},
	["step", "root"]
)
export const AssignDecideInputExclude = relation(
	"AssignDecideInputExclude",
	{ step: DenStep, ordinal: natural, value: Text, root: DenScope },
	["step", "ordinal", "root"]
)
export const AssignDecideInputModeNearest = relation(
	"AssignDecideInputModeNearest",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const AssignDecideInputModeWithin = relation(
	"AssignDecideInputModeWithin",
	{ step: DenStep, radius: pg["double precision"], root: DenScope },
	["step", "root"]
)
export const AssignAssignmentInput = relation(
	"AssignAssignmentInput",
	{
		scope: DenScope,
		learner: Text,
		topic: Text,
		mode: closedId(AssignAssignmentInputMode),
		root: DenScope
	},
	["scope", "root"]
)
export const AssignAssignmentInputNear = relation(
	"AssignAssignmentInputNear",
	{ scope: DenScope, ordinal: natural, value: pg["double precision"], root: DenScope },
	["scope", "ordinal", "root"]
)
export const AssignAssignmentInputExclude = relation(
	"AssignAssignmentInputExclude",
	{ scope: DenScope, ordinal: natural, value: Text, root: DenScope },
	["scope", "ordinal", "root"]
)
export const AssignAssignmentInputModeNearest = relation(
	"AssignAssignmentInputModeNearest",
	{ scope: DenScope, root: DenScope },
	["scope", "root"]
)
export const AssignAssignmentInputModeWithin = relation(
	"AssignAssignmentInputModeWithin",
	{ scope: DenScope, radius: pg["double precision"], root: DenScope },
	["scope", "root"]
)
export const AssignEmbedOutput = relation(
	"AssignEmbedOutput",
	{ step: DenStep, vector: pg.vector(4), root: DenScope },
	["step", "root"]
)
export const AssignDecideOutput = relation(
	"AssignDecideOutput",
	{
		step: DenStep,
		confidence: pg["double precision"],
		stage: closedId(AssignDecideOutputStage),
		root: DenScope
	},
	["step", "root"]
)
export const AssignDecideOutputWeighed = relation(
	"AssignDecideOutputWeighed",
	{
		step: DenStep,
		ordinal: natural,
		passage: Text,
		distance: pg["double precision"],
		passed: pg.boolean,
		root: DenScope
	},
	["step", "ordinal", "root"]
)
export const AssignDecideOutputStageServe = relation(
	"AssignDecideOutputStageServe",
	{ step: DenStep, passage: Text, distance: pg["double precision"], root: DenScope },
	["step", "root"]
)
export const AssignDecideOutputStageRest = relation(
	"AssignDecideOutputStageRest",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const AssignAssignmentFinishOutput = relation(
	"AssignAssignmentFinishOutput",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const AssignAsked = relation(
	"AssignAsked",
	{ from: DenStep, ordinal: natural, to: DenStep, root: DenScope },
	["from", "ordinal", "root"]
)
export const AssignDecideNearestRow = relation(
	"AssignDecideNearestRow",
	{ digest: DenRow, passage: Text, topic: Text, distance: pg["double precision"], root: DenScope },
	["digest", "root"]
)
export const AssignDecideNearestRead = relation(
	"AssignDecideNearestRead",
	{ step: DenStep, ordinal: natural, digest: DenRow, root: DenScope },
	["step", "ordinal", "root"]
)
export const AssignDecideSeenRow = relation(
	"AssignDecideSeenRow",
	{ digest: DenRow, learner: Text, passage: Text, root: DenScope },
	["digest", "root"]
)
export const AssignDecideSeenRead = relation(
	"AssignDecideSeenRead",
	{ step: DenStep, ordinal: natural, digest: DenRow, root: DenScope },
	["step", "ordinal", "root"]
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

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const assignGraph = fragment(
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
		AssignDecideNearestRow,
		AssignDecideNearestRead,
		AssignDecideSeenRow,
		AssignDecideSeenRead
	],
	[
		contained(on(AssignAdmitted, "scope", "root"), on(AssignScope, "scope", "root")),
		contained(on(AssignSkipped, "scope"), on(AssignRoot, "scope")),
		contained(on(AssignSkipped, "by"), on(AssignRoot, "scope")),
		contained(on(AssignStep, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignStartStep, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignStartStep, "step", "root"), on(AssignStep, "step", "root")),
		key(on(AssignStartStep, "step", "root")),
		contained(on(AssignFinish, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignFinish, "step", "root"), on(AssignStep, "step", "root")),
		key(on(AssignFinish, "step", "root")),
		contained(on(AssignClaim, "step", "root"), on(AssignStep, "step", "root")),
		contained(
			on(AssignEnded, "step", "attempt", "root"),
			on(AssignClaim, "step", "attempt", "root")
		),
		contained(
			on(
				select(AssignClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(AssignEnded, "step", "attempt", "root")
		),
		contained(
			on(AssignRetry, "step", "attempt", "root"),
			on(AssignEnded, "step", "attempt", "root")
		),
		contained(
			on(AssignFenced, "step", "attempt", "root"),
			on(AssignEnded, "step", "attempt", "root")
		),
		contained(on(AssignResult, "step", "root"), on(AssignStep, "step", "root")),
		contained(
			on(AssignHeld, "step", "attempt", "root"),
			on(AssignClaim, "step", "attempt", "root")
		),
		contained(on(AssignHeld, "step", "root"), on(AssignResult, "step", "root")),
		contained(
			on(AssignDone, "step", "root"),
			on(
				select(AssignResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(AssignFailed, "step", "root"),
			on(
				select(AssignResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(AssignRefusal, "step", "root"), on(AssignFailed, "step", "root")),
		contained(on(AssignExhausted, "step", "root"), on(AssignFailed, "step", "root")),
		contained(
			on(AssignEmbedInput, "step", "root"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Embed")),
				"step",
				"root"
			)
		),
		contained(on(AssignEmbedInputNear, "step", "root"), on(AssignEmbedInput, "step", "root")),
		contained(
			on(
				select(AssignEmbedInputNear, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal"),
				"root"
			),
			on(AssignEmbedInputNear, "step", "ordinal", "root")
		),
		check("AssignEmbedInputNearValueFinite", AssignEmbedInputNear, (row) =>
			Num.isFinite(row.value)
		),
		contained(on(AssignEmbedInputExclude, "step", "root"), on(AssignEmbedInput, "step", "root")),
		contained(
			on(
				select(AssignEmbedInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal"),
				"root"
			),
			on(AssignEmbedInputExclude, "step", "ordinal", "root")
		),
		contained(
			on(AssignEmbedInputModeNearest, "step", "root"),
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Nearest")),
				"step",
				"root"
			)
		),
		contained(
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Nearest")),
				"step",
				"root"
			),
			on(AssignEmbedInputModeNearest, "step", "root")
		),
		contained(
			on(AssignEmbedInputModeWithin, "step", "root"),
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Within")),
				"step",
				"root"
			)
		),
		contained(
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Within")),
				"step",
				"root"
			),
			on(AssignEmbedInputModeWithin, "step", "root")
		),
		check("AssignEmbedInputModeWithinRadiusFinite", AssignEmbedInputModeWithin, (row) =>
			Num.isFinite(row.radius)
		),
		contained(
			on(AssignDecideInput, "step", "root"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Decide")),
				"step",
				"root"
			)
		),
		contained(on(AssignDecideInputExclude, "step", "root"), on(AssignDecideInput, "step", "root")),
		contained(
			on(
				select(AssignDecideInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal"),
				"root"
			),
			on(AssignDecideInputExclude, "step", "ordinal", "root")
		),
		contained(
			on(AssignDecideInputModeNearest, "step", "root"),
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"step",
				"root"
			)
		),
		contained(
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"step",
				"root"
			),
			on(AssignDecideInputModeNearest, "step", "root")
		),
		contained(
			on(AssignDecideInputModeWithin, "step", "root"),
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"step",
				"root"
			)
		),
		contained(
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"step",
				"root"
			),
			on(AssignDecideInputModeWithin, "step", "root")
		),
		check("AssignDecideInputModeWithinRadiusFinite", AssignDecideInputModeWithin, (row) =>
			Num.isFinite(row.radius)
		),
		contained(
			on(AssignAssignmentInput, "scope"),
			on(
				select(AssignRoot, (row) => row.eq(row.kind, "Assignment")),
				"scope"
			)
		),
		contained(
			on(AssignAssignmentInputNear, "scope", "root"),
			on(AssignAssignmentInput, "scope", "root")
		),
		contained(
			on(
				select(AssignAssignmentInputNear, (row) => row.ge(row.ordinal, 1n)),
				"scope",
				pred("ordinal"),
				"root"
			),
			on(AssignAssignmentInputNear, "scope", "ordinal", "root")
		),
		check("AssignAssignmentInputNearValueFinite", AssignAssignmentInputNear, (row) =>
			Num.isFinite(row.value)
		),
		contained(
			on(AssignAssignmentInputExclude, "scope", "root"),
			on(AssignAssignmentInput, "scope", "root")
		),
		contained(
			on(
				select(AssignAssignmentInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"scope",
				pred("ordinal"),
				"root"
			),
			on(AssignAssignmentInputExclude, "scope", "ordinal", "root")
		),
		contained(
			on(AssignAssignmentInputModeNearest, "scope", "root"),
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"scope",
				"root"
			)
		),
		contained(
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"scope",
				"root"
			),
			on(AssignAssignmentInputModeNearest, "scope", "root")
		),
		contained(
			on(AssignAssignmentInputModeWithin, "scope", "root"),
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"scope",
				"root"
			)
		),
		contained(
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"scope",
				"root"
			),
			on(AssignAssignmentInputModeWithin, "scope", "root")
		),
		check("AssignAssignmentInputModeWithinRadiusFinite", AssignAssignmentInputModeWithin, (row) =>
			Num.isFinite(row.radius)
		),
		contained(on(AssignEmbedOutput, "step", "root"), on(AssignEmbedInput, "step", "root")),
		contained(on(AssignEmbedOutput, "step", "root"), on(AssignDone, "step", "root")),
		contained(on(AssignDecideOutput, "step", "root"), on(AssignDecideInput, "step", "root")),
		contained(on(AssignDecideOutput, "step", "root"), on(AssignDone, "step", "root")),
		check("AssignDecideOutputConfidenceFinite", AssignDecideOutput, (row) =>
			Num.isFinite(row.confidence)
		),
		contained(
			on(AssignDecideOutputWeighed, "step", "root"),
			on(AssignDecideOutput, "step", "root")
		),
		contained(
			on(
				select(AssignDecideOutputWeighed, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal"),
				"root"
			),
			on(AssignDecideOutputWeighed, "step", "ordinal", "root")
		),
		check("AssignDecideOutputWeighedDistanceFinite", AssignDecideOutputWeighed, (row) =>
			Num.isFinite(row.distance)
		),
		contained(
			on(AssignDecideOutputStageServe, "step", "root"),
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"step",
				"root"
			)
		),
		contained(
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"step",
				"root"
			),
			on(AssignDecideOutputStageServe, "step", "root")
		),
		check("AssignDecideOutputStageServeDistanceFinite", AssignDecideOutputStageServe, (row) =>
			Num.isFinite(row.distance)
		),
		contained(
			on(AssignDecideOutputStageRest, "step", "root"),
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"step",
				"root"
			)
		),
		contained(
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"step",
				"root"
			),
			on(AssignDecideOutputStageRest, "step", "root")
		),
		contained(on(AssignAssignmentFinishOutput, "step", "root"), on(AssignDone, "step", "root")),
		contained(on(AssignAsked, "from", "root"), on(AssignEmbedOutput, "step", "root")),
		contained(on(AssignAsked, "to", "root"), on(AssignDecideInput, "step", "root")),
		key(on(AssignAsked, "to", "root")),
		check("AssignDecideNearestRowDistanceFinite", AssignDecideNearestRow, (row) =>
			Num.isFinite(row.distance)
		),
		contained(on(AssignDecideNearestRead, "step", "root"), on(AssignResult, "step", "root")),
		contained(
			on(AssignDecideNearestRead, "digest", "root"),
			on(AssignDecideNearestRow, "digest", "root")
		),
		contained(on(AssignDecideSeenRead, "step", "root"), on(AssignResult, "step", "root")),
		contained(
			on(AssignDecideSeenRead, "digest", "root"),
			on(AssignDecideSeenRow, "digest", "root")
		),
		retirable(AssignRoot, [
			on(AssignScope, "root"),
			on(AssignAdmitted, "root"),
			on(AssignSkipped, "root"),
			on(AssignStep, "root"),
			on(AssignStartStep, "root"),
			on(AssignFinish, "root"),
			on(AssignClaim, "root"),
			on(AssignEnded, "root"),
			on(AssignRetry, "root"),
			on(AssignFenced, "root"),
			on(AssignResult, "root"),
			on(AssignDone, "root"),
			on(AssignFailed, "root"),
			on(AssignHeld, "root"),
			on(AssignRefusal, "root"),
			on(AssignExhausted, "root"),
			on(AssignEmbedInput, "root"),
			on(AssignEmbedInputNear, "root"),
			on(AssignEmbedInputExclude, "root"),
			on(AssignEmbedInputModeNearest, "root"),
			on(AssignEmbedInputModeWithin, "root"),
			on(AssignDecideInput, "root"),
			on(AssignDecideInputExclude, "root"),
			on(AssignDecideInputModeNearest, "root"),
			on(AssignDecideInputModeWithin, "root"),
			on(AssignAssignmentInput, "root"),
			on(AssignAssignmentInputNear, "root"),
			on(AssignAssignmentInputExclude, "root"),
			on(AssignAssignmentInputModeNearest, "root"),
			on(AssignAssignmentInputModeWithin, "root"),
			on(AssignEmbedOutput, "root"),
			on(AssignDecideOutput, "root"),
			on(AssignDecideOutputWeighed, "root"),
			on(AssignDecideOutputStageServe, "root"),
			on(AssignDecideOutputStageRest, "root"),
			on(AssignAssignmentFinishOutput, "root"),
			on(AssignAsked, "root"),
			on(AssignDecideNearestRow, "root"),
			on(AssignDecideNearestRead, "root"),
			on(AssignDecideSeenRow, "root"),
			on(AssignDecideSeenRead, "root")
		])
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
		AssignEmbedInputMode,
		AssignDecideInputMode,
		AssignAssignmentInputMode,
		AssignDecideOutputStage,
		AssignPaused,
		AssignResumed
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
	"AssignEmbedOutput",
	"AssignDecideOutput",
	"AssignDecideOutputWeighed",
	"AssignDecideOutputStageServe",
	"AssignDecideOutputStageRest",
	"AssignAssignmentFinishOutput",
	"AssignDecideNearestRow",
	"AssignDecideNearestRead",
	"AssignDecideSeenRow",
	"AssignDecideSeenRead",
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
	"AssignAsked"
] as const
