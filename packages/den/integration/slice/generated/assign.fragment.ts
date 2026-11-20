import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Assign to; `den generate` writes it, and nothing edits it. */
import {
	Compute,
	check,
	closed,
	closedId,
	contained,
	fragment,
	key,
	natural,
	on,
	pg,
	pred,
	race,
	relation,
	retirable,
	retirement,
	select
} from "@bjornpagen/grizzle"
import { Passage, Seen } from "#integration/slice/relations.ts"

export const AssignKind = closed.unordered("AssignKind", ["Decide", "AssignmentFinish"])
export const AssignJoin = closed.unordered("AssignJoin", ["Assignment"])
export const AssignOutcome = closed.unordered("AssignOutcome", ["done", "failed"])
export const AssignPausable = closed.unordered("AssignPausable", ["Assignment"])
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

export const AssignScope = relation(
	"AssignScope",
	{ scope: DenScope, kind: closedId(AssignJoin), root: DenScope },
	["scope", "root"]
)
export const AssignRoot = relation(
	"AssignRoot",
	{ scope: DenScope, key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const AssignWithin = relation(
	"AssignWithin",
	{ scope: DenScope, parent: DenScope, root: DenScope },
	["scope", "root"]
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
export const AssignStartScope = relation(
	"AssignStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope, root: DenScope },
	["scope", "ordinal", "root"]
)
export const AssignFinish = relation(
	"AssignFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const AssignClaim = relation(
	"AssignClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant, root: DenScope },
	["step", "attempt", "root"]
)
export const AssignRetry = relation(
	"AssignRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean, root: DenScope },
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
export const AssignExhausted = relation(
	"AssignExhausted",
	{ step: DenStep, attempts: natural, root: DenScope },
	["step", "root"]
)
export const AssignDecideInput = relation(
	"AssignDecideInput",
	{
		step: DenStep,
		learner: Text,
		topic: Text,
		missed: Text,
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
		missed: Text,
		mode: closedId(AssignAssignmentInputMode),
		root: DenScope
	},
	["scope", "root"]
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
export const AssignDecideNearestRead = relation(
	"AssignDecideNearestRead",
	{
		step: DenStep,
		ordinal: natural,
		passage: Passage.fields.passage,
		topic: Passage.fields.topic,
		distance: pg["double precision"],
		root: DenScope
	},
	["step", "ordinal", "root"]
)
export const AssignDecideSeenRead = relation(
	"AssignDecideSeenRead",
	{
		step: DenStep,
		ordinal: natural,
		learner: Seen.fields.learner,
		passage: Seen.fields.passage,
		root: DenScope
	},
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
		AssignJoin,
		AssignOutcome,
		AssignPausable,
		AssignDecideInputMode,
		AssignAssignmentInputMode,
		AssignDecideOutputStage,
		AssignScope,
		AssignRoot,
		AssignWithin,
		AssignAdmitted,
		AssignSkipped,
		AssignStep,
		AssignStartStep,
		AssignStartScope,
		AssignFinish,
		AssignClaim,
		AssignRetry,
		AssignFenced,
		AssignResult,
		AssignDone,
		AssignFailed,
		AssignHeld,
		AssignRefusal,
		AssignExhausted,
		AssignDecideInput,
		AssignDecideInputExclude,
		AssignDecideInputModeNearest,
		AssignDecideInputModeWithin,
		AssignAssignmentInput,
		AssignAssignmentInputExclude,
		AssignAssignmentInputModeNearest,
		AssignAssignmentInputModeWithin,
		AssignDecideOutput,
		AssignDecideOutputWeighed,
		AssignDecideOutputStageServe,
		AssignDecideOutputStageRest,
		AssignDecideNearestRead,
		AssignDecideSeenRead
	],
	[
		contained(on(AssignWithin, "scope", "root"), on(AssignScope, "scope", "root")),
		contained(on(AssignWithin, "parent", "root"), on(AssignScope, "scope", "root")),
		contained(on(AssignAdmitted, "scope", "root"), on(AssignScope, "scope", "root")),
		contained(on(AssignSkipped, "scope"), on(AssignRoot, "scope")),
		contained(on(AssignSkipped, "by"), on(AssignRoot, "scope")),
		contained(on(AssignStep, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignStartStep, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignStartStep, "step", "root"), on(AssignStep, "step", "root")),
		key(on(AssignStartStep, "step", "root")),
		contained(on(AssignStartScope, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignStartScope, "child", "root"), on(AssignScope, "scope", "root")),
		key(on(AssignStartScope, "child", "root")),
		contained(on(AssignFinish, "scope", "root"), on(AssignAdmitted, "scope", "root")),
		contained(on(AssignFinish, "step", "root"), on(AssignStep, "step", "root")),
		key(on(AssignFinish, "step", "root")),
		contained(on(AssignClaim, "step", "root"), on(AssignStep, "step", "root")),
		race(AssignClaim),
		check("AttemptFromOne", AssignClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(AssignClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(AssignClaim, "step", "attempt", "root")
		),
		contained(
			on(AssignRetry, "step", "attempt", "root"),
			on(AssignClaim, "step", "attempt", "root")
		),
		contained(
			on(AssignFenced, "step", "attempt", "root"),
			on(AssignClaim, "step", "attempt", "root")
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
			Compute.isFinite(row.radius)
		),
		contained(
			on(AssignAssignmentInput, "scope", "root"),
			on(
				select(AssignScope, (row) => row.eq(row.kind, "Assignment")),
				"scope",
				"root"
			)
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
			Compute.isFinite(row.radius)
		),
		contained(on(AssignDecideOutput, "step", "root"), on(AssignDecideInput, "step", "root")),
		contained(on(AssignDecideOutput, "step", "root"), on(AssignDone, "step", "root")),
		check("AssignDecideOutputConfidenceFinite", AssignDecideOutput, (row) =>
			Compute.isFinite(row.confidence)
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
			Compute.isFinite(row.distance)
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
			Compute.isFinite(row.distance)
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
		contained(on(AssignDecideNearestRead, "step", "root"), on(AssignResult, "step", "root")),
		contained(on(AssignDecideSeenRead, "step", "root"), on(AssignResult, "step", "root")),
		retirable(AssignRoot, [
			on(AssignScope, "root"),
			on(AssignWithin, "root"),
			on(AssignAdmitted, "root"),
			on(AssignSkipped, "root"),
			on(AssignStep, "root"),
			on(AssignStartStep, "root"),
			on(AssignStartScope, "root"),
			on(AssignFinish, "root"),
			on(AssignClaim, "root"),
			on(AssignRetry, "root"),
			on(AssignFenced, "root"),
			on(AssignResult, "root"),
			on(AssignDone, "root"),
			on(AssignFailed, "root"),
			on(AssignHeld, "root"),
			on(AssignRefusal, "root"),
			on(AssignExhausted, "root"),
			on(AssignDecideInput, "root"),
			on(AssignDecideInputExclude, "root"),
			on(AssignDecideInputModeNearest, "root"),
			on(AssignDecideInputModeWithin, "root"),
			on(AssignAssignmentInput, "root"),
			on(AssignAssignmentInputExclude, "root"),
			on(AssignAssignmentInputModeNearest, "root"),
			on(AssignAssignmentInputModeWithin, "root"),
			on(AssignDecideOutput, "root"),
			on(AssignDecideOutputWeighed, "root"),
			on(AssignDecideOutputStageServe, "root"),
			on(AssignDecideOutputStageRest, "root"),
			on(AssignDecideNearestRead, "root"),
			on(AssignDecideSeenRead, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */
export const assignCoordination = fragment(
	[
		AssignKind,
		AssignJoin,
		AssignOutcome,
		AssignPausable,
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
	"AssignDecideOutput",
	"AssignDecideOutputWeighed",
	"AssignDecideOutputStageServe",
	"AssignDecideOutputStageRest",
	"AssignDecideNearestRead",
	"AssignDecideSeenRead"
] as const
