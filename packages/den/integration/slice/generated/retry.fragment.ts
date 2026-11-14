import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Retry to; `den generate` writes it, and nothing edits it. */
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

export const RetryKind = closed("RetryKind", ["Steadfast", "Brittle", "LaddersFinish"])
export const RetryJoin = closed("RetryJoin", ["Ladders"])
export const RetryOutcome = closed("RetryOutcome", ["done", "failed"])
export const RetryPausable = closed("RetryPausable", ["Ladders"])

export const RetryScope = relation("RetryScope", { scope: DenScope, kind: closedId(RetryJoin) }, [
	"scope"
])
export const RetryRoot = relation("RetryRoot", { scope: DenScope, key: Text, at: DenInstant }, [
	"scope"
])
export const RetryWithin = relation("RetryWithin", { scope: DenScope, parent: DenScope }, ["scope"])
export const RetryAdmitted = relation("RetryAdmitted", { scope: DenScope }, ["scope"])
export const RetrySkipped = relation("RetrySkipped", { scope: DenScope, by: DenScope }, ["scope"])
export const RetryStep = relation(
	"RetryStep",
	{ step: DenStep, kind: closedId(RetryKind), scope: DenScope },
	["step"]
)
export const RetryStartStep = relation(
	"RetryStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep },
	["scope", "ordinal"]
)
export const RetryStartScope = relation(
	"RetryStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope },
	["scope", "ordinal"]
)
export const RetryFinish = relation("RetryFinish", { scope: DenScope, step: DenStep }, ["scope"])
export const RetryDue = relation("RetryDue", { step: DenStep, at: DenInstant }, ["step"])
export const RetryClaim = relation(
	"RetryClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const RetryRetry = relation(
	"RetryRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean },
	["step", "attempt"]
)
export const RetryFenced = relation("RetryFenced", { step: DenStep, attempt: natural }, [
	"step",
	"attempt"
])
export const RetryResult = relation(
	"RetryResult",
	{ step: DenStep, outcome: closedId(RetryOutcome) },
	["step"]
)
export const RetryDone = relation("RetryDone", { step: DenStep }, ["step"])
export const RetryFailed = relation("RetryFailed", { step: DenStep }, ["step"])
export const RetryHeld = relation("RetryHeld", { step: DenStep, attempt: natural }, ["step"])
export const RetryRefusal = relation("RetryRefusal", { step: DenStep, law: Text }, ["step"])
export const RetryExhausted = relation("RetryExhausted", { step: DenStep, attempts: natural }, [
	"step"
])
export const RetrySteadfastInput = relation("RetrySteadfastInput", { step: DenStep, key: Text }, [
	"step"
])
export const RetryBrittleInput = relation("RetryBrittleInput", { step: DenStep, key: Text }, [
	"step"
])
export const RetryLaddersInput = relation(
	"RetryLaddersInput",
	{ scope: DenScope, steadfast: Text, brittle: Text },
	["scope"]
)
export const RetrySteadfastOutput = relation("RetrySteadfastOutput", { step: DenStep, key: Text }, [
	"step"
])
export const RetryBrittleOutput = relation("RetryBrittleOutput", { step: DenStep, key: Text }, [
	"step"
])
export const RetryPaused = relation(
	"RetryPaused",
	{ target: closedId(RetryPausable), turn: natural },
	["target", "turn"]
)
export const RetryResumed = relation(
	"RetryResumed",
	{ target: closedId(RetryPausable), turn: natural },
	["target", "turn"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const retryGraph = fragment(
	[
		RetryKind,
		RetryJoin,
		RetryOutcome,
		RetryPausable,
		RetryScope,
		RetryRoot,
		RetryWithin,
		RetryAdmitted,
		RetrySkipped,
		RetryStep,
		RetryStartStep,
		RetryStartScope,
		RetryFinish,
		RetryDue,
		RetryClaim,
		RetryRetry,
		RetryFenced,
		RetryResult,
		RetryDone,
		RetryFailed,
		RetryHeld,
		RetryRefusal,
		RetryExhausted,
		RetrySteadfastInput,
		RetryBrittleInput,
		RetryLaddersInput,
		RetrySteadfastOutput,
		RetryBrittleOutput
	],
	[
		contained(on(RetryRoot, "scope"), on(RetryScope, "scope")),
		contained(on(RetryWithin, "scope"), on(RetryScope, "scope")),
		contained(on(RetryWithin, "parent"), on(RetryScope, "scope")),
		contained(on(RetryAdmitted, "scope"), on(RetryScope, "scope")),
		contained(on(RetrySkipped, "scope"), on(RetryRoot, "scope")),
		contained(on(RetrySkipped, "by"), on(RetryAdmitted, "scope")),
		contained(on(RetryStep, "scope"), on(RetryAdmitted, "scope")),
		contained(on(RetryStartStep, "scope"), on(RetryAdmitted, "scope")),
		contained(on(RetryStartStep, "step"), on(RetryStep, "step")),
		key(on(RetryStartStep, "step")),
		contained(on(RetryStartScope, "scope"), on(RetryAdmitted, "scope")),
		contained(on(RetryStartScope, "child"), on(RetryScope, "scope")),
		key(on(RetryStartScope, "child")),
		contained(on(RetryFinish, "scope"), on(RetryAdmitted, "scope")),
		contained(on(RetryFinish, "step"), on(RetryStep, "step")),
		key(on(RetryFinish, "step")),
		contained(on(RetryDue, "step"), on(RetryStep, "step")),
		contained(on(RetryClaim, "step"), on(RetryStep, "step")),
		race(RetryClaim),
		check("AttemptFromOne", RetryClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(RetryClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(RetryClaim, "step", "attempt")
		),
		contained(on(RetryRetry, "step", "attempt"), on(RetryClaim, "step", "attempt")),
		contained(on(RetryFenced, "step", "attempt"), on(RetryClaim, "step", "attempt")),
		contained(on(RetryResult, "step"), on(RetryStep, "step")),
		contained(on(RetryHeld, "step", "attempt"), on(RetryClaim, "step", "attempt")),
		contained(on(RetryHeld, "step"), on(RetryResult, "step")),
		contained(
			on(RetryDone, "step"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(
			on(RetryFailed, "step"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(on(RetryRefusal, "step"), on(RetryFailed, "step")),
		contained(on(RetryExhausted, "step"), on(RetryFailed, "step")),
		contained(
			on(RetrySteadfastInput, "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Steadfast")),
				"step"
			)
		),
		contained(
			on(RetryBrittleInput, "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Brittle")),
				"step"
			)
		),
		contained(
			on(RetryLaddersInput, "scope"),
			on(
				select(RetryScope, (row) => row.eq(row.kind, "Ladders")),
				"scope"
			)
		),
		contained(on(RetrySteadfastOutput, "step"), on(RetrySteadfastInput, "step")),
		contained(on(RetrySteadfastOutput, "step"), on(RetryDone, "step")),
		contained(on(RetryBrittleOutput, "step"), on(RetryBrittleInput, "step")),
		contained(on(RetryBrittleOutput, "step"), on(RetryDone, "step"))
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */
export const retryCoordination = fragment(
	[RetryKind, RetryJoin, RetryOutcome, RetryPausable, RetryPaused, RetryResumed],
	[
		contained(on(RetryResumed, "target", "turn"), on(RetryPaused, "target", "turn")),
		contained(on(RetryPaused, "target", pred("turn")), on(RetryResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const retryWriter = [
	"RetryResult",
	"RetryDone",
	"RetryHeld",
	"RetrySteadfastOutput",
	"RetryBrittleOutput"
] as const
