import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Assign to; `den generate` writes it, and nothing edits it. */
import {
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
	{ step: DenStep, learner: Text, topic: Text, near: pg.vector(4) },
	["step"]
)
export const AssignAssignmentInput = relation(
	"AssignAssignmentInput",
	{ scope: DenScope, learner: Text, topic: Text, near: pg.vector(4) },
	["scope"]
)
export const AssignDecideOutput = relation("AssignDecideOutput", { step: DenStep }, ["step"])
export const AssignDecideOutputChosen = relation(
	"AssignDecideOutputChosen",
	{ step: DenStep, value: Text },
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
		AssignAssignmentInput,
		AssignDecideOutput,
		AssignDecideOutputChosen,
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
		contained(
			on(AssignAssignmentInput, "scope"),
			on(
				select(AssignScope, (row) => row.eq(row.kind, "Assignment")),
				"scope"
			)
		),
		contained(on(AssignDecideOutput, "step"), on(AssignDecideInput, "step")),
		contained(on(AssignDecideOutput, "step"), on(AssignDone, "step")),
		contained(on(AssignDecideOutputChosen, "step"), on(AssignDecideOutput, "step")),
		contained(on(AssignDecideNearestRead, "step"), on(AssignResult, "step")),
		contained(on(AssignDecideSeenRead, "step"), on(AssignResult, "step"))
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */
export const assignCoordination = fragment(
	[AssignKind, AssignJoin, AssignOutcome, AssignPausable, AssignPaused, AssignResumed],
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
	"AssignDecideOutputChosen",
	"AssignDecideNearestRead",
	"AssignDecideSeenRead"
] as const
