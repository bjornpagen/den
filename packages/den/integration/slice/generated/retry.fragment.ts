import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Retry to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	fragment,
	key,
	mutable,
	natural,
	on,
	place,
	pred,
	relation,
	select,
	sha256,
	unit
} from "@bjornpagen/grizzle"

export const RetryKind = closed.unordered("RetryKind", [
	"Steadfast",
	"Brittle",
	"Polite",
	"Patient",
	"LaddersFinish",
	"ThrottledFinish",
	"UnhurriedFinish"
])
export const RetryRootKind = closed.unordered("RetryRootKind", [
	"Ladders",
	"Throttled",
	"Unhurried"
])
export const RetryOutcome = closed.unordered("RetryOutcome", ["done", "failed"])
export const RetryRetryWhy = closed.unordered("RetryRetryWhy", ["spent", "transient", "later"])
export const RetryPausable = closed.unordered("RetryPausable", [
	"Ladders",
	"Throttled",
	"Unhurried"
])

export const RetryScope = relation("RetryScope", { root: sha256, scope: sha256 }, ["root", "scope"])
export const RetryRoot = relation(
	"RetryRoot",
	{ root: sha256, kind: closedId(RetryRootKind), key: Text, at: DenInstant },
	["root"]
)
export const RetryRequestedWith = relation(
	"RetryRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
	["root"]
)
export const RetryAdmitted = relation("RetryAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const RetrySkipped = relation("RetrySkipped", { root: sha256, scope: sha256, by: sha256 }, [
	"root",
	"scope"
])
export const RetryStep = relation(
	"RetryStep",
	{ root: sha256, step: sha256, kind: closedId(RetryKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const RetryStartStep = relation(
	"RetryStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const RetryFinish = relation("RetryFinish", { root: sha256, scope: sha256, step: sha256 }, [
	"root",
	"scope"
])
export const RetryClaim = relation(
	"RetryClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const RetryEnded = relation("RetryEnded", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const RetryRetry = relation(
	"RetryRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(RetryRetryWhy) },
	["root", "step", "attempt"]
)
export const RetryFenced = relation(
	"RetryFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const RetryResult = relation(
	"RetryResult",
	{ root: sha256, step: sha256, outcome: closedId(RetryOutcome) },
	["root", "step"]
)
export const RetryDone = relation("RetryDone", { root: sha256, step: sha256 }, ["root", "step"])
export const RetryFailed = relation("RetryFailed", { root: sha256, step: sha256 }, ["root", "step"])
export const RetryHeld = relation("RetryHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const RetryRefusal = relation("RetryRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const RetryExhausted = relation("RetryExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const RetrySteadfastInput = relation(
	"RetrySteadfastInput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryBrittleInput = relation(
	"RetryBrittleInput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryPoliteInput = relation(
	"RetryPoliteInput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryPatientInput = relation(
	"RetryPatientInput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryLaddersInput = relation(
	"RetryLaddersInput",
	{ root: sha256, scope: sha256, steadfast: Text, brittle: Text },
	["root", "scope"]
)
export const RetryThrottledInput = relation(
	"RetryThrottledInput",
	{ root: sha256, scope: sha256, key: Text },
	["root", "scope"]
)
export const RetryUnhurriedInput = relation(
	"RetryUnhurriedInput",
	{ root: sha256, scope: sha256, key: Text },
	["root", "scope"]
)
export const RetrySteadfastOutput = relation(
	"RetrySteadfastOutput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryBrittleOutput = relation(
	"RetryBrittleOutput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryPoliteOutput = relation(
	"RetryPoliteOutput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryPatientOutput = relation(
	"RetryPatientOutput",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const RetryLaddersFinishOutput = relation(
	"RetryLaddersFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const RetryThrottledFinishOutput = relation(
	"RetryThrottledFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const RetryUnhurriedFinishOutput = relation(
	"RetryUnhurriedFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
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
export const RetryServed = relation(
	"RetryServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
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
		RetryRequestedWith,
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
		RetryPatientInput,
		RetryLaddersInput,
		RetryThrottledInput,
		RetryUnhurriedInput,
		RetrySteadfastOutput,
		RetryBrittleOutput,
		RetryPoliteOutput,
		RetryPatientOutput,
		RetryLaddersFinishOutput,
		RetryThrottledFinishOutput,
		RetryUnhurriedFinishOutput
	],
	[
		unit("DenRoot", { root: sha256 }),
		key(on(RetryScope, "scope")),
		key(on(RetryStep, "step")),
		contained(on(RetryAdmitted, "root", "scope"), on(RetryScope, "root", "scope")),
		contained(on(RetrySkipped, "scope"), on(RetryRoot, "root")),
		contained(on(RetrySkipped, "by"), on(RetryRoot, "root")),
		contained(on(RetryRequestedWith, "root"), on(RetryRoot, "root")),
		contained(on(RetryStep, "root", "scope"), on(RetryAdmitted, "root", "scope")),
		contained(on(RetryStartStep, "root", "scope"), on(RetryAdmitted, "root", "scope")),
		contained(on(RetryStartStep, "root", "step"), on(RetryStep, "root", "step")),
		key(on(RetryStartStep, "root", "step")),
		contained(on(RetryFinish, "root", "scope"), on(RetryAdmitted, "root", "scope")),
		contained(on(RetryFinish, "root", "step"), on(RetryStep, "root", "step")),
		key(on(RetryFinish, "root", "step")),
		contained(on(RetryClaim, "root", "step"), on(RetryStep, "root", "step")),
		contained(on(RetryEnded, "root", "step", "attempt"), on(RetryClaim, "root", "step", "attempt")),
		contained(
			on(
				select(RetryClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(RetryEnded, "root", "step", "attempt")
		),
		contained(on(RetryRetry, "root", "step", "attempt"), on(RetryEnded, "root", "step", "attempt")),
		contained(
			on(RetryFenced, "root", "step", "attempt"),
			on(RetryEnded, "root", "step", "attempt")
		),
		contained(on(RetryResult, "root", "step"), on(RetryStep, "root", "step")),
		contained(on(RetryHeld, "root", "step", "attempt"), on(RetryClaim, "root", "step", "attempt")),
		contained(on(RetryHeld, "root", "step"), on(RetryResult, "root", "step")),
		contained(
			on(RetryDone, "root", "step"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(RetryFailed, "root", "step"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(RetryRefusal, "root", "step"), on(RetryFailed, "root", "step")),
		contained(on(RetryExhausted, "root", "step"), on(RetryFailed, "root", "step")),
		contained(
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"root"
			),
			on(RetryRequestedWith, "root")
		),
		contained(
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"root"
			),
			on(RetryRequestedWith, "root")
		),
		contained(
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Unhurried")),
				"root"
			),
			on(RetryRequestedWith, "root")
		),
		contained(
			on(RetrySteadfastInput, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Steadfast")),
				"root",
				"step"
			)
		),
		contained(
			on(RetryBrittleInput, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Brittle")),
				"root",
				"step"
			)
		),
		contained(
			on(RetryPoliteInput, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Polite")),
				"root",
				"step"
			)
		),
		contained(
			on(RetryPatientInput, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Patient")),
				"root",
				"step"
			)
		),
		contained(
			on(RetryLaddersInput, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"root"
			)
		),
		contained(
			on(RetryThrottledInput, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"root"
			)
		),
		contained(
			on(RetryUnhurriedInput, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Unhurried")),
				"root"
			)
		),
		contained(on(RetrySteadfastOutput, "root", "step"), on(RetrySteadfastInput, "root", "step")),
		contained(on(RetrySteadfastOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryBrittleOutput, "root", "step"), on(RetryBrittleInput, "root", "step")),
		contained(on(RetryBrittleOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryPoliteOutput, "root", "step"), on(RetryPoliteInput, "root", "step")),
		contained(on(RetryPoliteOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryPatientOutput, "root", "step"), on(RetryPatientInput, "root", "step")),
		contained(on(RetryPatientOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryLaddersFinishOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryThrottledFinishOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryUnhurriedFinishOutput, "root", "step"), on(RetryDone, "root", "step")),
		contained(on(RetryScope, "root"), on(RetryRoot, "root")),
		mutable(RetryScope),
		mutable(RetryAdmitted),
		contained(on(RetrySkipped, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetrySkipped),
		contained(on(RetryStep, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryStep),
		contained(on(RetryStartStep, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryStartStep),
		contained(on(RetryFinish, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryFinish),
		mutable(RetryClaim),
		contained(on(RetryEnded, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryEnded),
		contained(on(RetryRetry, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryRetry),
		contained(on(RetryFenced, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryFenced),
		mutable(RetryResult),
		contained(on(RetryDone, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryDone),
		contained(on(RetryFailed, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryFailed),
		contained(on(RetryHeld, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryHeld),
		contained(on(RetryRefusal, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryRefusal),
		contained(on(RetryExhausted, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryExhausted),
		contained(on(RetrySteadfastInput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetrySteadfastInput),
		contained(on(RetryBrittleInput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryBrittleInput),
		contained(on(RetryPoliteInput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryPoliteInput),
		contained(on(RetryPatientInput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryPatientInput),
		contained(on(RetryLaddersInput, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryLaddersInput),
		contained(on(RetryThrottledInput, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryThrottledInput),
		contained(on(RetryUnhurriedInput, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryUnhurriedInput),
		contained(on(RetrySteadfastOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetrySteadfastOutput),
		contained(on(RetryBrittleOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryBrittleOutput),
		contained(on(RetryPoliteOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryPoliteOutput),
		contained(on(RetryPatientOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryPatientOutput),
		contained(on(RetryLaddersFinishOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryLaddersFinishOutput),
		contained(on(RetryThrottledFinishOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryThrottledFinishOutput),
		contained(on(RetryUnhurriedFinishOutput, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryUnhurriedFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const retryCoordination = fragment(
	[
		RetryKind,
		RetryRootKind,
		RetryOutcome,
		RetryRetryWhy,
		RetryPausable,
		RetryPaused,
		RetryResumed,
		RetryServed
	],
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
	"RetryPatientOutput",
	"RetryLaddersFinishOutput",
	"RetryThrottledFinishOutput",
	"RetryUnhurriedFinishOutput"
] as const
