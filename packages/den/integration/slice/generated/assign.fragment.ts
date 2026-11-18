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
	select
} from "@bjornpagen/grizzle"
import { Passage, Seen } from "#integration/slice/relations.ts"

export const AssignKind = closed("AssignKind", ["Decide", "AssignmentFinish"])
export const AssignJoin = closed("AssignJoin", ["Assignment"])
export const AssignOutcome = closed("AssignOutcome", ["done", "failed"])
export const AssignPausable = closed("AssignPausable", ["Assignment"])
export const AssignDecideInputMode = closed("AssignDecideInputMode", ["Nearest", "Within"])
export const AssignAssignmentInputMode = closed("AssignAssignmentInputMode", ["Nearest", "Within"])
export const AssignDecideOutputStage = closed("AssignDecideOutputStage", ["Serve", "Rest"])

export const AssignScope = relation(
	"AssignScope",
	{ scope: DenScope, kind: closedId(AssignJoin) },
	["scope"]
)
export const AssignRoot = relation("AssignRoot", { scope: DenScope, key: Text, at: DenInstant }, [
	"scope"
])
export const AssignWithin = relation("AssignWithin", { scope: DenScope, parent: DenScope }, [
	"scope"
])
export const AssignAdmitted = relation("AssignAdmitted", { scope: DenScope }, ["scope"])
export const AssignSkipped = relation("AssignSkipped", { scope: DenScope, by: DenScope }, ["scope"])
export const AssignStep = relation(
	"AssignStep",
	{ step: DenStep, kind: closedId(AssignKind), scope: DenScope },
	["step"]
)
export const AssignStartStep = relation(
	"AssignStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep },
	["scope", "ordinal"]
)
export const AssignStartScope = relation(
	"AssignStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope },
	["scope", "ordinal"]
)
export const AssignFinish = relation("AssignFinish", { scope: DenScope, step: DenStep }, ["scope"])
export const AssignDue = relation("AssignDue", { step: DenStep, at: DenInstant }, ["step"])
export const AssignClaim = relation(
	"AssignClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const AssignRetry = relation(
	"AssignRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean },
	["step", "attempt"]
)
export const AssignFenced = relation("AssignFenced", { step: DenStep, attempt: natural }, [
	"step",
	"attempt"
])
export const AssignResult = relation(
	"AssignResult",
	{ step: DenStep, outcome: closedId(AssignOutcome) },
	["step"]
)
export const AssignDone = relation("AssignDone", { step: DenStep }, ["step"])
export const AssignFailed = relation("AssignFailed", { step: DenStep }, ["step"])
export const AssignHeld = relation("AssignHeld", { step: DenStep, attempt: natural }, ["step"])
export const AssignRefusal = relation("AssignRefusal", { step: DenStep, law: Text }, ["step"])
export const AssignExhausted = relation("AssignExhausted", { step: DenStep, attempts: natural }, [
	"step"
])
export const AssignDecideInput = relation(
	"AssignDecideInput",
	{
		step: DenStep,
		learner: Text,
		topic: Text,
		near: pg.vector(4),
		mode: closedId(AssignDecideInputMode)
	},
	["step"]
)
export const AssignDecideInputExclude = relation(
	"AssignDecideInputExclude",
	{ step: DenStep, ordinal: natural, value: Text },
	["step", "ordinal"]
)
export const AssignDecideInputModeNearest = relation(
	"AssignDecideInputModeNearest",
	{ step: DenStep },
	["step"]
)
export const AssignDecideInputModeWithin = relation(
	"AssignDecideInputModeWithin",
	{ step: DenStep, radius: pg["double precision"] },
	["step"]
)
export const AssignAssignmentInput = relation(
	"AssignAssignmentInput",
	{
		scope: DenScope,
		learner: Text,
		topic: Text,
		near: pg.vector(4),
		mode: closedId(AssignAssignmentInputMode)
	},
	["scope"]
)
export const AssignAssignmentInputExclude = relation(
	"AssignAssignmentInputExclude",
	{ scope: DenScope, ordinal: natural, value: Text },
	["scope", "ordinal"]
)
export const AssignAssignmentInputModeNearest = relation(
	"AssignAssignmentInputModeNearest",
	{ scope: DenScope },
	["scope"]
)
export const AssignAssignmentInputModeWithin = relation(
	"AssignAssignmentInputModeWithin",
	{ scope: DenScope, radius: pg["double precision"] },
	["scope"]
)
export const AssignDecideOutput = relation(
	"AssignDecideOutput",
	{ step: DenStep, confidence: pg["double precision"], stage: closedId(AssignDecideOutputStage) },
	["step"]
)
export const AssignDecideOutputWeighed = relation(
	"AssignDecideOutputWeighed",
	{
		step: DenStep,
		ordinal: natural,
		passage: Text,
		distance: pg["double precision"],
		passed: pg.boolean
	},
	["step", "ordinal"]
)
export const AssignDecideOutputStageServe = relation(
	"AssignDecideOutputStageServe",
	{ step: DenStep, passage: Text, distance: pg["double precision"] },
	["step"]
)
export const AssignDecideOutputStageRest = relation(
	"AssignDecideOutputStageRest",
	{ step: DenStep },
	["step"]
)
export const AssignDecideNearestRead = relation(
	"AssignDecideNearestRead",
	{
		step: DenStep,
		ordinal: natural,
		passage: Passage.fields.passage,
		topic: Passage.fields.topic,
		distance: pg["double precision"]
	},
	["step", "ordinal"]
)
export const AssignDecideSeenRead = relation(
	"AssignDecideSeenRead",
	{ step: DenStep, ordinal: natural, learner: Seen.fields.learner, passage: Seen.fields.passage },
	["step", "ordinal"]
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
		AssignDue,
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
		contained(on(AssignRoot, "scope"), on(AssignScope, "scope")),
		contained(on(AssignWithin, "scope"), on(AssignScope, "scope")),
		contained(on(AssignWithin, "parent"), on(AssignScope, "scope")),
		contained(on(AssignAdmitted, "scope"), on(AssignScope, "scope")),
		contained(on(AssignSkipped, "scope"), on(AssignRoot, "scope")),
		contained(on(AssignSkipped, "by"), on(AssignAdmitted, "scope")),
		contained(on(AssignStep, "scope"), on(AssignAdmitted, "scope")),
		contained(on(AssignStartStep, "scope"), on(AssignAdmitted, "scope")),
		contained(on(AssignStartStep, "step"), on(AssignStep, "step")),
		key(on(AssignStartStep, "step")),
		contained(on(AssignStartScope, "scope"), on(AssignAdmitted, "scope")),
		contained(on(AssignStartScope, "child"), on(AssignScope, "scope")),
		key(on(AssignStartScope, "child")),
		contained(on(AssignFinish, "scope"), on(AssignAdmitted, "scope")),
		contained(on(AssignFinish, "step"), on(AssignStep, "step")),
		key(on(AssignFinish, "step")),
		contained(on(AssignDue, "step"), on(AssignStep, "step")),
		contained(on(AssignClaim, "step"), on(AssignStep, "step")),
		race(AssignClaim),
		check("AttemptFromOne", AssignClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(AssignClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(AssignClaim, "step", "attempt")
		),
		contained(on(AssignRetry, "step", "attempt"), on(AssignClaim, "step", "attempt")),
		contained(on(AssignFenced, "step", "attempt"), on(AssignClaim, "step", "attempt")),
		contained(on(AssignResult, "step"), on(AssignStep, "step")),
		contained(on(AssignHeld, "step", "attempt"), on(AssignClaim, "step", "attempt")),
		contained(on(AssignHeld, "step"), on(AssignResult, "step")),
		contained(
			on(AssignDone, "step"),
			on(
				select(AssignResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(
			on(AssignFailed, "step"),
			on(
				select(AssignResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(on(AssignRefusal, "step"), on(AssignFailed, "step")),
		contained(on(AssignExhausted, "step"), on(AssignFailed, "step")),
		contained(
			on(AssignDecideInput, "step"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Decide")),
				"step"
			)
		),
		contained(on(AssignDecideInputExclude, "step"), on(AssignDecideInput, "step")),
		contained(
			on(
				select(AssignDecideInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal")
			),
			on(AssignDecideInputExclude, "step", "ordinal")
		),
		contained(
			on(AssignDecideInputModeNearest, "step"),
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"step"
			),
			on(AssignDecideInputModeNearest, "step")
		),
		contained(
			on(AssignDecideInputModeWithin, "step"),
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"step"
			),
			on(AssignDecideInputModeWithin, "step")
		),
		check("AssignDecideInputModeWithinRadiusFinite", AssignDecideInputModeWithin, (row) =>
			Compute.isFinite(row.radius)
		),
		contained(
			on(AssignAssignmentInput, "scope"),
			on(
				select(AssignScope, (row) => row.eq(row.kind, "Assignment")),
				"scope"
			)
		),
		contained(on(AssignAssignmentInputExclude, "scope"), on(AssignAssignmentInput, "scope")),
		contained(
			on(
				select(AssignAssignmentInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"scope",
				pred("ordinal")
			),
			on(AssignAssignmentInputExclude, "scope", "ordinal")
		),
		contained(
			on(AssignAssignmentInputModeNearest, "scope"),
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"scope"
			)
		),
		contained(
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"scope"
			),
			on(AssignAssignmentInputModeNearest, "scope")
		),
		contained(
			on(AssignAssignmentInputModeWithin, "scope"),
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"scope"
			)
		),
		contained(
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"scope"
			),
			on(AssignAssignmentInputModeWithin, "scope")
		),
		check("AssignAssignmentInputModeWithinRadiusFinite", AssignAssignmentInputModeWithin, (row) =>
			Compute.isFinite(row.radius)
		),
		contained(on(AssignDecideOutput, "step"), on(AssignDecideInput, "step")),
		contained(on(AssignDecideOutput, "step"), on(AssignDone, "step")),
		check("AssignDecideOutputConfidenceFinite", AssignDecideOutput, (row) =>
			Compute.isFinite(row.confidence)
		),
		contained(on(AssignDecideOutputWeighed, "step"), on(AssignDecideOutput, "step")),
		contained(
			on(
				select(AssignDecideOutputWeighed, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal")
			),
			on(AssignDecideOutputWeighed, "step", "ordinal")
		),
		check("AssignDecideOutputWeighedDistanceFinite", AssignDecideOutputWeighed, (row) =>
			Compute.isFinite(row.distance)
		),
		contained(
			on(AssignDecideOutputStageServe, "step"),
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"step"
			),
			on(AssignDecideOutputStageServe, "step")
		),
		check("AssignDecideOutputStageServeDistanceFinite", AssignDecideOutputStageServe, (row) =>
			Compute.isFinite(row.distance)
		),
		contained(
			on(AssignDecideOutputStageRest, "step"),
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"step"
			),
			on(AssignDecideOutputStageRest, "step")
		),
		contained(on(AssignDecideNearestRead, "step"), on(AssignResult, "step")),
		contained(on(AssignDecideSeenRead, "step"), on(AssignResult, "step"))
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
