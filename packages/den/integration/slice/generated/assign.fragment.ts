import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
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
	records,
	relation,
	retirable,
	retirement,
	select,
	sha256
} from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { DecideReads } from "#integration/slice/reads.ts"

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

export const AssignScope = relation("AssignScope", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const AssignRoot = relation(
	"AssignRoot",
	{ scope: sha256, kind: closedId(AssignRootKind), key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const AssignAdmitted = relation("AssignAdmitted", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const AssignSkipped = relation(
	"AssignSkipped",
	{ scope: sha256, by: sha256, root: sha256 },
	["scope", "root"]
)
export const AssignStep = relation(
	"AssignStep",
	{ step: sha256, kind: closedId(AssignKind), scope: sha256, due: DenInstant, root: sha256 },
	["step", "root"]
)
export const AssignStartStep = relation(
	"AssignStartStep",
	{ scope: sha256, ordinal: natural, step: sha256, root: sha256 },
	["scope", "ordinal", "root"]
)
export const AssignFinish = relation(
	"AssignFinish",
	{ scope: sha256, step: sha256, root: sha256 },
	["scope", "root"]
)
export const AssignClaim = relation(
	"AssignClaim",
	{ step: sha256, attempt: place, until: DenInstant, root: sha256 },
	["step", "root", "attempt"]
)
export const AssignEnded = relation(
	"AssignEnded",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "attempt", "root"]
)
export const AssignRetry = relation(
	"AssignRetry",
	{ step: sha256, attempt: natural, at: DenInstant, why: closedId(AssignRetryWhy), root: sha256 },
	["step", "attempt", "root"]
)
export const AssignFenced = relation(
	"AssignFenced",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "attempt", "root"]
)
export const AssignResult = relation(
	"AssignResult",
	{ step: sha256, outcome: closedId(AssignOutcome), root: sha256 },
	["step", "root"]
)
export const AssignDone = relation("AssignDone", { step: sha256, root: sha256 }, ["step", "root"])
export const AssignFailed = relation("AssignFailed", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const AssignHeld = relation("AssignHeld", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"root"
])
export const AssignRefusal = relation("AssignRefusal", { step: sha256, law: Text, root: sha256 }, [
	"step",
	"root"
])
export const AssignExhausted = relation("AssignExhausted", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const AssignEmbedInput = relation(
	"AssignEmbedInput",
	{ step: sha256, learner: Text, topic: Text, mode: closedId(AssignEmbedInputMode), root: sha256 },
	["step", "root"]
)
export const AssignEmbedInputNear = relation(
	"AssignEmbedInputNear",
	{ step: sha256, ordinal: natural, value: pg["double precision"], root: sha256 },
	["step", "ordinal", "root"]
)
export const AssignEmbedInputExclude = relation(
	"AssignEmbedInputExclude",
	{ step: sha256, ordinal: natural, value: Text, root: sha256 },
	["step", "ordinal", "root"]
)
export const AssignEmbedInputModeNearest = relation(
	"AssignEmbedInputModeNearest",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const AssignEmbedInputModeWithin = relation(
	"AssignEmbedInputModeWithin",
	{ step: sha256, radius: pg["double precision"], root: sha256 },
	["step", "root"]
)
export const AssignDecideInput = relation(
	"AssignDecideInput",
	{
		step: sha256,
		learner: Text,
		topic: Text,
		vector: pg.vector(4),
		mode: closedId(AssignDecideInputMode),
		root: sha256
	},
	["step", "root"]
)
export const AssignDecideInputExclude = relation(
	"AssignDecideInputExclude",
	{ step: sha256, ordinal: natural, value: Text, root: sha256 },
	["step", "ordinal", "root"]
)
export const AssignDecideInputModeNearest = relation(
	"AssignDecideInputModeNearest",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const AssignDecideInputModeWithin = relation(
	"AssignDecideInputModeWithin",
	{ step: sha256, radius: pg["double precision"], root: sha256 },
	["step", "root"]
)
export const AssignAssignmentInput = relation(
	"AssignAssignmentInput",
	{
		scope: sha256,
		learner: Text,
		topic: Text,
		mode: closedId(AssignAssignmentInputMode),
		root: sha256
	},
	["scope", "root"]
)
export const AssignAssignmentInputNear = relation(
	"AssignAssignmentInputNear",
	{ scope: sha256, ordinal: natural, value: pg["double precision"], root: sha256 },
	["scope", "ordinal", "root"]
)
export const AssignAssignmentInputExclude = relation(
	"AssignAssignmentInputExclude",
	{ scope: sha256, ordinal: natural, value: Text, root: sha256 },
	["scope", "ordinal", "root"]
)
export const AssignAssignmentInputModeNearest = relation(
	"AssignAssignmentInputModeNearest",
	{ scope: sha256, root: sha256 },
	["scope", "root"]
)
export const AssignAssignmentInputModeWithin = relation(
	"AssignAssignmentInputModeWithin",
	{ scope: sha256, radius: pg["double precision"], root: sha256 },
	["scope", "root"]
)
export const AssignEmbedOutput = relation(
	"AssignEmbedOutput",
	{ step: sha256, vector: pg.vector(4), root: sha256 },
	["step", "root"]
)
export const AssignDecideOutput = relation(
	"AssignDecideOutput",
	{
		step: sha256,
		confidence: pg["double precision"],
		stage: closedId(AssignDecideOutputStage),
		root: sha256
	},
	["step", "root"]
)
export const AssignDecideOutputWeighed = relation(
	"AssignDecideOutputWeighed",
	{
		step: sha256,
		ordinal: natural,
		passage: Text,
		distance: pg["double precision"],
		passed: pg.boolean,
		root: sha256
	},
	["step", "ordinal", "root"]
)
export const AssignDecideOutputStageServe = relation(
	"AssignDecideOutputStageServe",
	{ step: sha256, passage: Text, distance: pg["double precision"], root: sha256 },
	["step", "root"]
)
export const AssignDecideOutputStageRest = relation(
	"AssignDecideOutputStageRest",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const AssignAssignmentFinishOutput = relation(
	"AssignAssignmentFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const AssignAsked = relation(
	"AssignAsked",
	{ from: sha256, ordinal: natural, to: sha256, root: sha256 },
	["from", "ordinal", "root"]
)
export const AssignDecideReadNearest = relation(
	"AssignDecideReadNearest",
	{ step: sha256, ordinal: natural, digest: sha256, root: sha256 },
	["step", "ordinal", "root"]
)
export const AssignDecideReadSeen = relation(
	"AssignDecideReadSeen",
	{ step: sha256, ordinal: natural, digest: sha256, root: sha256 },
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
export const AssignServed = relation(
	"AssignServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The records of the rows step Decide's read `nearest` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, keyed by a row's digest alone, so every root that found a row shares it. */
export const AssignDecideReadNearestRecords = records(
	"AssignDecideReadNearest",
	DecideReads.named.nearest,
	{ digest: sha256 },
	["digest"]
)
export const AssignDecideReadNearestRow = AssignDecideReadNearestRecords.row

/** The records of the rows step Decide's read `seen` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, keyed by a row's digest alone, so every root that found a row shares it. */
export const AssignDecideReadSeenRecords = records(
	"AssignDecideReadSeen",
	DecideReads.named.seen,
	{ digest: sha256 },
	["digest"]
)
export const AssignDecideReadSeenRow = AssignDecideReadSeenRecords.row

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
		AssignDecideReadNearest,
		AssignDecideReadSeen,
		...AssignDecideReadNearestRecords.relations,
		...AssignDecideReadSeenRecords.relations
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
		contained(on(AssignDecideReadNearest, "step", "root"), on(AssignResult, "step", "root")),
		contained(on(AssignDecideReadNearest, "digest"), on(AssignDecideReadNearestRow, "digest")),
		contained(on(AssignDecideReadSeen, "step", "root"), on(AssignResult, "step", "root")),
		contained(on(AssignDecideReadSeen, "digest"), on(AssignDecideReadSeenRow, "digest")),
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
			on(AssignDecideReadNearest, "root"),
			on(AssignDecideReadSeen, "root")
		]),
		...AssignDecideReadNearestRecords.rules,
		...AssignDecideReadSeenRecords.rules
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
