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

export const AssignScope = relation("AssignScope", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const AssignRoot = relation(
	"AssignRoot",
	{ root: sha256, kind: closedId(AssignRootKind), key: Text, at: DenInstant },
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
export const AssignEmbedInput = relation(
	"AssignEmbedInput",
	{ root: sha256, step: sha256, learner: Text, topic: Text, mode: closedId(AssignEmbedInputMode) },
	["root", "step"]
)
export const AssignEmbedInputNear = relation(
	"AssignEmbedInputNear",
	{ root: sha256, step: sha256, ordinal: natural, value: pg["double precision"] },
	["root", "step", "ordinal"]
)
export const AssignEmbedInputExclude = relation(
	"AssignEmbedInputExclude",
	{ root: sha256, step: sha256, ordinal: natural, value: Text },
	["root", "step", "ordinal"]
)
export const AssignEmbedInputModeNearest = relation(
	"AssignEmbedInputModeNearest",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const AssignEmbedInputModeWithin = relation(
	"AssignEmbedInputModeWithin",
	{ root: sha256, step: sha256, radius: pg["double precision"] },
	["root", "step"]
)
export const AssignDecideInput = relation(
	"AssignDecideInput",
	{
		root: sha256,
		step: sha256,
		learner: Text,
		topic: Text,
		vector: pg.vector(4),
		mode: closedId(AssignDecideInputMode)
	},
	["root", "step"]
)
export const AssignDecideInputExclude = relation(
	"AssignDecideInputExclude",
	{ root: sha256, step: sha256, ordinal: natural, value: Text },
	["root", "step", "ordinal"]
)
export const AssignDecideInputModeNearest = relation(
	"AssignDecideInputModeNearest",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const AssignDecideInputModeWithin = relation(
	"AssignDecideInputModeWithin",
	{ root: sha256, step: sha256, radius: pg["double precision"] },
	["root", "step"]
)
export const AssignAssignmentInput = relation(
	"AssignAssignmentInput",
	{
		root: sha256,
		scope: sha256,
		learner: Text,
		topic: Text,
		mode: closedId(AssignAssignmentInputMode)
	},
	["root", "scope"]
)
export const AssignAssignmentInputNear = relation(
	"AssignAssignmentInputNear",
	{ root: sha256, scope: sha256, ordinal: natural, value: pg["double precision"] },
	["root", "scope", "ordinal"]
)
export const AssignAssignmentInputExclude = relation(
	"AssignAssignmentInputExclude",
	{ root: sha256, scope: sha256, ordinal: natural, value: Text },
	["root", "scope", "ordinal"]
)
export const AssignAssignmentInputModeNearest = relation(
	"AssignAssignmentInputModeNearest",
	{ root: sha256, scope: sha256 },
	["root", "scope"]
)
export const AssignAssignmentInputModeWithin = relation(
	"AssignAssignmentInputModeWithin",
	{ root: sha256, scope: sha256, radius: pg["double precision"] },
	["root", "scope"]
)
export const AssignEmbedOutput = relation(
	"AssignEmbedOutput",
	{ root: sha256, step: sha256, vector: pg.vector(4) },
	["root", "step"]
)
export const AssignDecideOutput = relation(
	"AssignDecideOutput",
	{
		root: sha256,
		step: sha256,
		confidence: pg["double precision"],
		stage: closedId(AssignDecideOutputStage)
	},
	["root", "step"]
)
export const AssignDecideOutputWeighed = relation(
	"AssignDecideOutputWeighed",
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
export const AssignDecideOutputStageServe = relation(
	"AssignDecideOutputStageServe",
	{ root: sha256, step: sha256, passage: Text, distance: pg["double precision"] },
	["root", "step"]
)
export const AssignDecideOutputStageRest = relation(
	"AssignDecideOutputStageRest",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const AssignAssignmentFinishOutput = relation(
	"AssignAssignmentFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const AssignAsked = relation(
	"AssignAsked",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
export const AssignDecideReadNearest = relation(
	"AssignDecideReadNearest",
	{ root: sha256, step: sha256, ordinal: natural, digest: sha256 },
	["root", "step", "ordinal"]
)
export const AssignDecideReadSeen = relation(
	"AssignDecideReadSeen",
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
		unit("DenRoot", { root: sha256 }),
		contained(on(AssignAdmitted, "root", "scope"), on(AssignScope, "root", "scope")),
		contained(on(AssignSkipped, "scope"), on(AssignRoot, "root")),
		contained(on(AssignSkipped, "by"), on(AssignRoot, "root")),
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
			on(AssignEmbedInput, "root", "step"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Embed")),
				"root",
				"step"
			)
		),
		contained(on(AssignEmbedInputNear, "root", "step"), on(AssignEmbedInput, "root", "step")),
		contained(
			on(
				select(AssignEmbedInputNear, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(AssignEmbedInputNear, "root", "step", "ordinal")
		),
		check("AssignEmbedInputNearValueFinite", AssignEmbedInputNear, (row) =>
			Num.isFinite(row.value)
		),
		contained(on(AssignEmbedInputExclude, "root", "step"), on(AssignEmbedInput, "root", "step")),
		contained(
			on(
				select(AssignEmbedInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(AssignEmbedInputExclude, "root", "step", "ordinal")
		),
		contained(
			on(AssignEmbedInputModeNearest, "root", "step"),
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			),
			on(AssignEmbedInputModeNearest, "root", "step")
		),
		contained(
			on(AssignEmbedInputModeWithin, "root", "step"),
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(AssignEmbedInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			),
			on(AssignEmbedInputModeWithin, "root", "step")
		),
		check("AssignEmbedInputModeWithinRadiusFinite", AssignEmbedInputModeWithin, (row) =>
			Num.isFinite(row.radius)
		),
		contained(
			on(AssignDecideInput, "root", "step"),
			on(
				select(AssignStep, (row) => row.eq(row.kind, "Decide")),
				"root",
				"step"
			)
		),
		contained(on(AssignDecideInputExclude, "root", "step"), on(AssignDecideInput, "root", "step")),
		contained(
			on(
				select(AssignDecideInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(AssignDecideInputExclude, "root", "step", "ordinal")
		),
		contained(
			on(AssignDecideInputModeNearest, "root", "step"),
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"step"
			),
			on(AssignDecideInputModeNearest, "root", "step")
		),
		contained(
			on(AssignDecideInputModeWithin, "root", "step"),
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"step"
			),
			on(AssignDecideInputModeWithin, "root", "step")
		),
		check("AssignDecideInputModeWithinRadiusFinite", AssignDecideInputModeWithin, (row) =>
			Num.isFinite(row.radius)
		),
		contained(
			on(AssignAssignmentInput, "scope"),
			on(
				select(AssignRoot, (row) => row.eq(row.kind, "Assignment")),
				"root"
			)
		),
		contained(
			on(AssignAssignmentInputNear, "root", "scope"),
			on(AssignAssignmentInput, "root", "scope")
		),
		contained(
			on(
				select(AssignAssignmentInputNear, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				pred("ordinal")
			),
			on(AssignAssignmentInputNear, "root", "scope", "ordinal")
		),
		check("AssignAssignmentInputNearValueFinite", AssignAssignmentInputNear, (row) =>
			Num.isFinite(row.value)
		),
		contained(
			on(AssignAssignmentInputExclude, "root", "scope"),
			on(AssignAssignmentInput, "root", "scope")
		),
		contained(
			on(
				select(AssignAssignmentInputExclude, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				pred("ordinal")
			),
			on(AssignAssignmentInputExclude, "root", "scope", "ordinal")
		),
		contained(
			on(AssignAssignmentInputModeNearest, "root", "scope"),
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"scope"
			)
		),
		contained(
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Nearest")),
				"root",
				"scope"
			),
			on(AssignAssignmentInputModeNearest, "root", "scope")
		),
		contained(
			on(AssignAssignmentInputModeWithin, "root", "scope"),
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"scope"
			)
		),
		contained(
			on(
				select(AssignAssignmentInput, (row) => row.eq(row.mode, "Within")),
				"root",
				"scope"
			),
			on(AssignAssignmentInputModeWithin, "root", "scope")
		),
		check("AssignAssignmentInputModeWithinRadiusFinite", AssignAssignmentInputModeWithin, (row) =>
			Num.isFinite(row.radius)
		),
		contained(on(AssignEmbedOutput, "root", "step"), on(AssignEmbedInput, "root", "step")),
		contained(on(AssignEmbedOutput, "root", "step"), on(AssignDone, "root", "step")),
		contained(on(AssignDecideOutput, "root", "step"), on(AssignDecideInput, "root", "step")),
		contained(on(AssignDecideOutput, "root", "step"), on(AssignDone, "root", "step")),
		check("AssignDecideOutputConfidenceFinite", AssignDecideOutput, (row) =>
			Num.isFinite(row.confidence)
		),
		contained(
			on(AssignDecideOutputWeighed, "root", "step"),
			on(AssignDecideOutput, "root", "step")
		),
		contained(
			on(
				select(AssignDecideOutputWeighed, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(AssignDecideOutputWeighed, "root", "step", "ordinal")
		),
		check("AssignDecideOutputWeighedDistanceFinite", AssignDecideOutputWeighed, (row) =>
			Num.isFinite(row.distance)
		),
		contained(
			on(AssignDecideOutputStageServe, "root", "step"),
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Serve")),
				"root",
				"step"
			),
			on(AssignDecideOutputStageServe, "root", "step")
		),
		check("AssignDecideOutputStageServeDistanceFinite", AssignDecideOutputStageServe, (row) =>
			Num.isFinite(row.distance)
		),
		contained(
			on(AssignDecideOutputStageRest, "root", "step"),
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"root",
				"step"
			)
		),
		contained(
			on(
				select(AssignDecideOutput, (row) => row.eq(row.stage, "Rest")),
				"root",
				"step"
			),
			on(AssignDecideOutputStageRest, "root", "step")
		),
		contained(on(AssignAssignmentFinishOutput, "root", "step"), on(AssignDone, "root", "step")),
		contained(on(AssignAsked, "root", "from"), on(AssignEmbedOutput, "root", "step")),
		contained(on(AssignAsked, "root", "to"), on(AssignDecideInput, "root", "step")),
		key(on(AssignAsked, "root", "to")),
		contained(on(AssignDecideReadNearest, "root", "step"), on(AssignResult, "root", "step")),
		contained(on(AssignDecideReadNearest, "digest"), on(AssignDecideReadNearestRow, "digest")),
		contained(on(AssignDecideReadSeen, "root", "step"), on(AssignResult, "root", "step")),
		contained(on(AssignDecideReadSeen, "digest"), on(AssignDecideReadSeenRow, "digest")),
		contained(on(AssignScope, "root"), on(AssignRoot, "root")),
		mutable(AssignScope),
		contained(on(AssignAdmitted, "root"), on(AssignRoot, "root")),
		mutable(AssignAdmitted),
		contained(on(AssignSkipped, "root"), on(AssignRoot, "root")),
		mutable(AssignSkipped),
		contained(on(AssignStep, "root"), on(AssignRoot, "root")),
		mutable(AssignStep),
		contained(on(AssignStartStep, "root"), on(AssignRoot, "root")),
		mutable(AssignStartStep),
		contained(on(AssignFinish, "root"), on(AssignRoot, "root")),
		mutable(AssignFinish),
		contained(on(AssignClaim, "root"), on(AssignRoot, "root")),
		mutable(AssignClaim),
		contained(on(AssignEnded, "root"), on(AssignRoot, "root")),
		mutable(AssignEnded),
		contained(on(AssignRetry, "root"), on(AssignRoot, "root")),
		mutable(AssignRetry),
		contained(on(AssignFenced, "root"), on(AssignRoot, "root")),
		mutable(AssignFenced),
		contained(on(AssignResult, "root"), on(AssignRoot, "root")),
		mutable(AssignResult),
		contained(on(AssignDone, "root"), on(AssignRoot, "root")),
		mutable(AssignDone),
		contained(on(AssignFailed, "root"), on(AssignRoot, "root")),
		mutable(AssignFailed),
		contained(on(AssignHeld, "root"), on(AssignRoot, "root")),
		mutable(AssignHeld),
		contained(on(AssignRefusal, "root"), on(AssignRoot, "root")),
		mutable(AssignRefusal),
		contained(on(AssignExhausted, "root"), on(AssignRoot, "root")),
		mutable(AssignExhausted),
		contained(on(AssignEmbedInput, "root"), on(AssignRoot, "root")),
		mutable(AssignEmbedInput),
		contained(on(AssignEmbedInputNear, "root"), on(AssignRoot, "root")),
		mutable(AssignEmbedInputNear),
		contained(on(AssignEmbedInputExclude, "root"), on(AssignRoot, "root")),
		mutable(AssignEmbedInputExclude),
		contained(on(AssignEmbedInputModeNearest, "root"), on(AssignRoot, "root")),
		mutable(AssignEmbedInputModeNearest),
		contained(on(AssignEmbedInputModeWithin, "root"), on(AssignRoot, "root")),
		mutable(AssignEmbedInputModeWithin),
		contained(on(AssignDecideInput, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideInput),
		contained(on(AssignDecideInputExclude, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideInputExclude),
		contained(on(AssignDecideInputModeNearest, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideInputModeNearest),
		contained(on(AssignDecideInputModeWithin, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideInputModeWithin),
		contained(on(AssignAssignmentInput, "root"), on(AssignRoot, "root")),
		mutable(AssignAssignmentInput),
		contained(on(AssignAssignmentInputNear, "root"), on(AssignRoot, "root")),
		mutable(AssignAssignmentInputNear),
		contained(on(AssignAssignmentInputExclude, "root"), on(AssignRoot, "root")),
		mutable(AssignAssignmentInputExclude),
		contained(on(AssignAssignmentInputModeNearest, "root"), on(AssignRoot, "root")),
		mutable(AssignAssignmentInputModeNearest),
		contained(on(AssignAssignmentInputModeWithin, "root"), on(AssignRoot, "root")),
		mutable(AssignAssignmentInputModeWithin),
		contained(on(AssignEmbedOutput, "root"), on(AssignRoot, "root")),
		mutable(AssignEmbedOutput),
		contained(on(AssignDecideOutput, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideOutput),
		contained(on(AssignDecideOutputWeighed, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideOutputWeighed),
		contained(on(AssignDecideOutputStageServe, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideOutputStageServe),
		contained(on(AssignDecideOutputStageRest, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideOutputStageRest),
		contained(on(AssignAssignmentFinishOutput, "root"), on(AssignRoot, "root")),
		mutable(AssignAssignmentFinishOutput),
		contained(on(AssignAsked, "root"), on(AssignRoot, "root")),
		mutable(AssignAsked),
		contained(on(AssignDecideReadNearest, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideReadNearest),
		contained(on(AssignDecideReadSeen, "root"), on(AssignRoot, "root")),
		mutable(AssignDecideReadSeen),
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
