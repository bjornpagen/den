import { DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Retry to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	fragment,
	key,
	natural,
	on,
	place,
	pred,
	relation,
	retirable,
	retirement,
	select
} from "@bjornpagen/grizzle"

export const RetryKind = closed.unordered("RetryKind", [
	"Steadfast",
	"Brittle",
	"Polite",
	"LaddersFinish",
	"ThrottledFinish"
])
export const RetryRootKind = closed.unordered("RetryRootKind", ["Ladders", "Throttled"])
export const RetryOutcome = closed.unordered("RetryOutcome", ["done", "failed"])
export const RetryRetryWhy = closed.unordered("RetryRetryWhy", ["spent", "transient", "later"])
export const RetryPausable = closed.unordered("RetryPausable", ["Ladders", "Throttled"])

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
	{ step: DenStep, attempt: place, until: DenInstant, root: DenScope },
	["step", "root", "attempt"]
)
export const RetryEnded = relation(
	"RetryEnded",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const RetryRetry = relation(
	"RetryRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, why: closedId(RetryRetryWhy), root: DenScope },
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
export const RetryExhausted = relation("RetryExhausted", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
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
export const RetryPoliteInput = relation(
	"RetryPoliteInput",
	{ step: DenStep, key: Text, root: DenScope },
	["step", "root"]
)
export const RetryLaddersInput = relation(
	"RetryLaddersInput",
	{ scope: DenScope, steadfast: Text, brittle: Text, root: DenScope },
	["scope", "root"]
)
export const RetryThrottledInput = relation(
	"RetryThrottledInput",
	{ scope: DenScope, key: Text, root: DenScope },
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
export const RetryPoliteOutput = relation(
	"RetryPoliteOutput",
	{ step: DenStep, key: Text, root: DenScope },
	["step", "root"]
)
export const RetryLaddersFinishOutput = relation(
	"RetryLaddersFinishOutput",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const RetryThrottledFinishOutput = relation(
	"RetryThrottledFinishOutput",
	{ step: DenStep, root: DenScope },
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
		RetryRetryWhy,
		RetryPausable,
		RetryScope,
		RetryRoot,
		RetryAdmitted,
		RetrySkipped,
		RetryStep,
		RetryStartStep,
		RetryFinish,
		RetryClaim,
		RetryEnded,
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
		RetryPoliteInput,
		RetryLaddersInput,
		RetryThrottledInput,
		RetrySteadfastOutput,
		RetryBrittleOutput,
		RetryPoliteOutput,
		RetryLaddersFinishOutput,
		RetryThrottledFinishOutput
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
		contained(on(RetryEnded, "step", "attempt", "root"), on(RetryClaim, "step", "attempt", "root")),
		contained(
			on(
				select(RetryClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(RetryEnded, "step", "attempt", "root")
		),
		contained(on(RetryRetry, "step", "attempt", "root"), on(RetryEnded, "step", "attempt", "root")),
		contained(
			on(RetryFenced, "step", "attempt", "root"),
			on(RetryEnded, "step", "attempt", "root")
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
			on(RetryPoliteInput, "step", "root"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Polite")),
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
		contained(
			on(RetryThrottledInput, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"scope"
			)
		),
		contained(on(RetrySteadfastOutput, "step", "root"), on(RetrySteadfastInput, "step", "root")),
		contained(on(RetrySteadfastOutput, "step", "root"), on(RetryDone, "step", "root")),
		contained(on(RetryBrittleOutput, "step", "root"), on(RetryBrittleInput, "step", "root")),
		contained(on(RetryBrittleOutput, "step", "root"), on(RetryDone, "step", "root")),
		contained(on(RetryPoliteOutput, "step", "root"), on(RetryPoliteInput, "step", "root")),
		contained(on(RetryPoliteOutput, "step", "root"), on(RetryDone, "step", "root")),
		contained(on(RetryLaddersFinishOutput, "step", "root"), on(RetryDone, "step", "root")),
		contained(on(RetryThrottledFinishOutput, "step", "root"), on(RetryDone, "step", "root")),
		retirable(RetryRoot, [
			on(RetryScope, "root"),
			on(RetryAdmitted, "root"),
			on(RetrySkipped, "root"),
			on(RetryStep, "root"),
			on(RetryStartStep, "root"),
			on(RetryFinish, "root"),
			on(RetryClaim, "root"),
			on(RetryEnded, "root"),
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
			on(RetryPoliteInput, "root"),
			on(RetryLaddersInput, "root"),
			on(RetryThrottledInput, "root"),
			on(RetrySteadfastOutput, "root"),
			on(RetryBrittleOutput, "root"),
			on(RetryPoliteOutput, "root"),
			on(RetryLaddersFinishOutput, "root"),
			on(RetryThrottledFinishOutput, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const retryCoordination = fragment(
	[RetryKind, RetryRootKind, RetryOutcome, RetryRetryWhy, RetryPausable, RetryPaused, RetryResumed],
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
	"RetryBrittleOutput",
	"RetryPoliteOutput",
	"RetryLaddersFinishOutput",
	"RetryThrottledFinishOutput"
] as const
