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
	retirable,
	retirement,
	select
} from "@bjornpagen/grizzle"

export const RetryKind = closed.unordered("RetryKind", ["Steadfast", "Brittle", "LaddersFinish"])
export const RetryRootKind = closed.unordered("RetryRootKind", ["Ladders"])
export const RetryOutcome = closed.unordered("RetryOutcome", ["done", "failed"])
export const RetryPausable = closed.unordered("RetryPausable", ["Ladders"])

export const RetryScope = relation("RetryScope", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const RetryRoot = relation(
	"RetryRoot",
	{
		scope: DenScope,
		kind: closedId(RetryRootKind),
		key: Text,
		at: DenInstant,
		retired: retirement
	},
	["scope"]
)
export const RetryAdmitted = relation("RetryAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const RetrySkipped = relation(
	"RetrySkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const RetryStep = relation(
	"RetryStep",
	{ step: DenStep, kind: closedId(RetryKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const RetryStartStep = relation(
	"RetryStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const RetryFinish = relation(
	"RetryFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const RetryClaim = relation(
	"RetryClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant, root: DenScope },
	["step", "attempt", "root"]
)
export const RetryRetry = relation(
	"RetryRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean, root: DenScope },
	["step", "attempt", "root"]
)
export const RetryFenced = relation(
	"RetryFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const RetryResult = relation(
	"RetryResult",
	{ step: DenStep, outcome: closedId(RetryOutcome), root: DenScope },
	["step", "root"]
)
export const RetryDone = relation("RetryDone", { step: DenStep, root: DenScope }, ["step", "root"])
export const RetryFailed = relation("RetryFailed", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const RetryHeld = relation(
	"RetryHeld",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "root"]
)
export const RetryRefusal = relation("RetryRefusal", { step: DenStep, law: Text, root: DenScope }, [
	"step",
	"root"
])
export const RetryExhausted = relation(
	"RetryExhausted",
	{ step: DenStep, attempts: natural, root: DenScope },
	["step", "root"]
)
export const RetrySteadfastInput = relation(
	"RetrySteadfastInput",
	{ step: DenStep, key: Text, root: DenScope },
	["step", "root"]
)
export const RetryBrittleInput = relation(
	"RetryBrittleInput",
	{ step: DenStep, key: Text, root: DenScope },
	["step", "root"]
)
export const RetryLaddersInput = relation(
	"RetryLaddersInput",
	{ scope: DenScope, steadfast: Text, brittle: Text, root: DenScope },
	["scope", "root"]
)
export const RetrySteadfastOutput = relation(
	"RetrySteadfastOutput",
	{ step: DenStep, key: Text, root: DenScope },
	["step", "root"]
)
export const RetryBrittleOutput = relation(
	"RetryBrittleOutput",
	{ step: DenStep, key: Text, root: DenScope },
	["step", "root"]
)
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
		RetryRootKind,
		RetryOutcome,
		RetryPausable,
		RetryScope,
		RetryRoot,
		RetryAdmitted,
		RetrySkipped,
		RetryStep,
		RetryStartStep,
		RetryFinish,
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
		contained(on(RetryAdmitted, "scope", "root"), on(RetryScope, "scope", "root")),
		contained(on(RetrySkipped, "scope"), on(RetryRoot, "scope")),
		contained(on(RetrySkipped, "by"), on(RetryRoot, "scope")),
		contained(on(RetryStep, "scope", "root"), on(RetryAdmitted, "scope", "root")),
		contained(on(RetryStartStep, "scope", "root"), on(RetryAdmitted, "scope", "root")),
		contained(on(RetryStartStep, "step", "root"), on(RetryStep, "step", "root")),
		key(on(RetryStartStep, "step", "root")),
		contained(on(RetryFinish, "scope", "root"), on(RetryAdmitted, "scope", "root")),
		contained(on(RetryFinish, "step", "root"), on(RetryStep, "step", "root")),
		key(on(RetryFinish, "step", "root")),
		contained(on(RetryClaim, "step", "root"), on(RetryStep, "step", "root")),
		race(RetryClaim),
		check("AttemptFromOne", RetryClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(RetryClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(RetryClaim, "step", "attempt", "root")
		),
		contained(on(RetryRetry, "step", "attempt", "root"), on(RetryClaim, "step", "attempt", "root")),
		contained(
			on(RetryFenced, "step", "attempt", "root"),
			on(RetryClaim, "step", "attempt", "root")
		),
		contained(on(RetryResult, "step", "root"), on(RetryStep, "step", "root")),
		contained(on(RetryHeld, "step", "attempt", "root"), on(RetryClaim, "step", "attempt", "root")),
		contained(on(RetryHeld, "step", "root"), on(RetryResult, "step", "root")),
		contained(
			on(RetryDone, "step", "root"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(RetryFailed, "step", "root"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(RetryRefusal, "step", "root"), on(RetryFailed, "step", "root")),
		contained(on(RetryExhausted, "step", "root"), on(RetryFailed, "step", "root")),
		contained(
			on(RetrySteadfastInput, "step", "root"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Steadfast")),
				"step",
				"root"
			)
		),
		contained(
			on(RetryBrittleInput, "step", "root"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Brittle")),
				"step",
				"root"
			)
		),
		contained(
			on(RetryLaddersInput, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"scope"
			)
		),
		contained(on(RetrySteadfastOutput, "step", "root"), on(RetrySteadfastInput, "step", "root")),
		contained(on(RetrySteadfastOutput, "step", "root"), on(RetryDone, "step", "root")),
		contained(on(RetryBrittleOutput, "step", "root"), on(RetryBrittleInput, "step", "root")),
		contained(on(RetryBrittleOutput, "step", "root"), on(RetryDone, "step", "root")),
		retirable(RetryRoot, [
			on(RetryScope, "root"),
			on(RetryAdmitted, "root"),
			on(RetrySkipped, "root"),
			on(RetryStep, "root"),
			on(RetryStartStep, "root"),
			on(RetryFinish, "root"),
			on(RetryClaim, "root"),
			on(RetryRetry, "root"),
			on(RetryFenced, "root"),
			on(RetryResult, "root"),
			on(RetryDone, "root"),
			on(RetryFailed, "root"),
			on(RetryHeld, "root"),
			on(RetryRefusal, "root"),
			on(RetryExhausted, "root"),
			on(RetrySteadfastInput, "root"),
			on(RetryBrittleInput, "root"),
			on(RetryLaddersInput, "root"),
			on(RetrySteadfastOutput, "root"),
			on(RetryBrittleOutput, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */
export const retryCoordination = fragment(
	[RetryKind, RetryRootKind, RetryOutcome, RetryPausable, RetryPaused, RetryResumed],
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
