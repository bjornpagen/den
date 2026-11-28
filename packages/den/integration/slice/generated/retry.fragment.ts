import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Retry to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"

export const RetryKind = g.closed.unordered("RetryKind", [
	"Steadfast",
	"Brittle",
	"Polite",
	"Patient",
	"LaddersFinish",
	"ThrottledFinish",
	"UnhurriedFinish"
])
export const RetryRootKind = g.closed.unordered("RetryRootKind", [
	"Ladders",
	"Throttled",
	"Unhurried"
])
export const RetryOutcome = g.closed.unordered("RetryOutcome", ["done", "failed"])
export const RetryRetryWhy = g.closed.unordered("RetryRetryWhy", ["spent", "transient", "later"])
export const RetryPausable = g.closed.unordered("RetryPausable", [
	"Ladders",
	"Throttled",
	"Unhurried"
])

export const RetryScope = g.relation("RetryScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const RetryRoot = g.relation(
	"RetryRoot",
	{ root: g.sha256, kind: g.closedId(RetryRootKind), key: Text, at: DenInstant },
	["root"]
)
export const RetryRequestedWith = g.relation(
	"RetryRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const RetryAdmitted = g.relation("RetryAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const RetrySkipped = g.relation(
	"RetrySkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const RetryStep = g.relation(
	"RetryStep",
	{ root: g.sha256, step: g.sha256, kind: g.closedId(RetryKind), scope: g.sha256, due: DenInstant },
	["root", "step"]
)
export const RetryStartStep = g.relation(
	"RetryStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const RetryFinish = g.relation(
	"RetryFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const RetryClaim = g.relation(
	"RetryClaim",
	{ root: g.sha256, step: g.sha256, attempt: g.place, until: DenInstant },
	["root", "step", "attempt"]
)
export const RetryEnded = g.relation(
	"RetryEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const RetryRetry = g.relation(
	"RetryRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(RetryRetryWhy)
	},
	["root", "step", "attempt"]
)
export const RetryFenced = g.relation(
	"RetryFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const RetryResult = g.relation(
	"RetryResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(RetryOutcome) },
	["root", "step"]
)
export const RetryDone = g.relation("RetryDone", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const RetryFailed = g.relation("RetryFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const RetryHeld = g.relation(
	"RetryHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const RetryRefusal = g.relation(
	"RetryRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const RetryExhausted = g.relation("RetryExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const RetrySteadfastInput = g
	.derivedName({ stem: "Retry", path: ["SteadfastInput"] })
	.relation("RetrySteadfastInput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryBrittleInput = g
	.derivedName({ stem: "Retry", path: ["BrittleInput"] })
	.relation("RetryBrittleInput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryPoliteInput = g
	.derivedName({ stem: "Retry", path: ["PoliteInput"] })
	.relation("RetryPoliteInput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryPatientInput = g
	.derivedName({ stem: "Retry", path: ["PatientInput"] })
	.relation("RetryPatientInput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryLaddersInput = g
	.derivedName({ stem: "Retry", path: ["LaddersInput"] })
	.relation(
		"RetryLaddersInput",
		{ root: g.sha256, scope: g.sha256, steadfast: Text, brittle: Text },
		["root", "scope"]
	)
export const RetryThrottledInput = g
	.derivedName({ stem: "Retry", path: ["ThrottledInput"] })
	.relation("RetryThrottledInput", { root: g.sha256, scope: g.sha256, key: Text }, [
		"root",
		"scope"
	])
export const RetryUnhurriedInput = g
	.derivedName({ stem: "Retry", path: ["UnhurriedInput"] })
	.relation("RetryUnhurriedInput", { root: g.sha256, scope: g.sha256, key: Text }, [
		"root",
		"scope"
	])
export const RetrySteadfastOutput = g
	.derivedName({ stem: "Retry", path: ["SteadfastOutput"] })
	.relation("RetrySteadfastOutput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryBrittleOutput = g
	.derivedName({ stem: "Retry", path: ["BrittleOutput"] })
	.relation("RetryBrittleOutput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryPoliteOutput = g
	.derivedName({ stem: "Retry", path: ["PoliteOutput"] })
	.relation("RetryPoliteOutput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryPatientOutput = g
	.derivedName({ stem: "Retry", path: ["PatientOutput"] })
	.relation("RetryPatientOutput", { root: g.sha256, step: g.sha256, key: Text }, ["root", "step"])
export const RetryLaddersFinishOutput = g
	.derivedName({ stem: "Retry", path: ["LaddersFinishOutput"] })
	.relation("RetryLaddersFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const RetryThrottledFinishOutput = g
	.derivedName({ stem: "Retry", path: ["ThrottledFinishOutput"] })
	.relation("RetryThrottledFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const RetryUnhurriedFinishOutput = g
	.derivedName({ stem: "Retry", path: ["UnhurriedFinishOutput"] })
	.relation("RetryUnhurriedFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const RetryPaused = g.relation(
	"RetryPaused",
	{ target: g.closedId(RetryPausable), turn: g.natural },
	["target", "turn"]
)
export const RetryResumed = g.relation(
	"RetryResumed",
	{ target: g.closedId(RetryPausable), turn: g.natural },
	["target", "turn"]
)
export const RetryServed = g.relation(
	"RetryServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const retryGraph = g.fragment(
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
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(RetryScope, "scope")),
		g.key(g.on(RetryStep, "step")),
		g.contained(g.on(RetryAdmitted, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.contained(g.on(RetrySkipped, "scope"), g.on(RetryRoot, "root")),
		g.contained(g.on(RetrySkipped, "by"), g.on(RetryRoot, "root")),
		g.contained(g.on(RetryRequestedWith, "root"), g.on(RetryRoot, "root")),
		g.contained(g.on(RetryStep, "root", "scope"), g.on(RetryAdmitted, "root", "scope")),
		g.contained(g.on(RetryStartStep, "root", "scope"), g.on(RetryAdmitted, "root", "scope")),
		g.contained(g.on(RetryStartStep, "root", "step"), g.on(RetryStep, "root", "step")),
		g.key(g.on(RetryStartStep, "root", "step")),
		g.contained(g.on(RetryFinish, "root", "scope"), g.on(RetryAdmitted, "root", "scope")),
		g.contained(g.on(RetryFinish, "root", "step"), g.on(RetryStep, "root", "step")),
		g.key(g.on(RetryFinish, "root", "step")),
		g.contained(g.on(RetryClaim, "root", "step"), g.on(RetryStep, "root", "step")),
		g.contained(
			g.on(RetryEnded, "root", "step", "attempt"),
			g.on(RetryClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(RetryClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(RetryEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(RetryRetry, "root", "step", "attempt"),
			g.on(RetryEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(RetryFenced, "root", "step", "attempt"),
			g.on(RetryEnded, "root", "step", "attempt")
		),
		g.contained(g.on(RetryResult, "root", "step"), g.on(RetryStep, "root", "step")),
		g.contained(
			g.on(RetryHeld, "root", "step", "attempt"),
			g.on(RetryClaim, "root", "step", "attempt")
		),
		g.contained(g.on(RetryHeld, "root", "step"), g.on(RetryResult, "root", "step")),
		g.contained(
			g.on(RetryDone, "root", "step"),
			g.on(
				g.select(RetryResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(RetryFailed, "root", "step"),
			g.on(
				g.select(RetryResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(RetryRefusal, "root", "step"), g.on(RetryFailed, "root", "step")),
		g.contained(g.on(RetryExhausted, "root", "step"), g.on(RetryFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"root"
			),
			g.on(RetryRequestedWith, "root")
		),
		g.contained(
			g.on(
				g.select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"root"
			),
			g.on(RetryRequestedWith, "root")
		),
		g.contained(
			g.on(
				g.select(RetryRoot, (row) => row.eq(row.kind, "Unhurried")),
				"root"
			),
			g.on(RetryRequestedWith, "root")
		),
		g.contained(
			g.on(RetrySteadfastInput, "root", "step"),
			g.on(
				g.select(RetryStep, (row) => row.eq(row.kind, "Steadfast")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(RetryBrittleInput, "root", "step"),
			g.on(
				g.select(RetryStep, (row) => row.eq(row.kind, "Brittle")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(RetryPoliteInput, "root", "step"),
			g.on(
				g.select(RetryStep, (row) => row.eq(row.kind, "Polite")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(RetryPatientInput, "root", "step"),
			g.on(
				g.select(RetryStep, (row) => row.eq(row.kind, "Patient")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(RetryLaddersInput, "scope"),
			g.on(
				g.select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"root"
			)
		),
		g.contained(
			g.on(RetryThrottledInput, "scope"),
			g.on(
				g.select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"root"
			)
		),
		g.contained(
			g.on(RetryUnhurriedInput, "scope"),
			g.on(
				g.select(RetryRoot, (row) => row.eq(row.kind, "Unhurried")),
				"root"
			)
		),
		g.contained(
			g.on(RetrySteadfastOutput, "root", "step"),
			g.on(RetrySteadfastInput, "root", "step")
		),
		g.contained(g.on(RetrySteadfastOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryBrittleOutput, "root", "step"), g.on(RetryBrittleInput, "root", "step")),
		g.contained(g.on(RetryBrittleOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryPoliteOutput, "root", "step"), g.on(RetryPoliteInput, "root", "step")),
		g.contained(g.on(RetryPoliteOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryPatientOutput, "root", "step"), g.on(RetryPatientInput, "root", "step")),
		g.contained(g.on(RetryPatientOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryLaddersFinishOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryThrottledFinishOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryUnhurriedFinishOutput, "root", "step"), g.on(RetryDone, "root", "step")),
		g.contained(g.on(RetryScope, "root"), g.on(RetryRoot, "root")),
		g.mutable(RetryScope),
		g.mutable(RetryAdmitted),
		g.contained(g.on(RetrySkipped, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetrySkipped),
		g.contained(g.on(RetryStep, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetryStep),
		g.contained(g.on(RetryStartStep, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetryStartStep),
		g.contained(g.on(RetryFinish, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetryFinish),
		g.mutable(RetryClaim),
		g.contained(g.on(RetryEnded, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryEnded),
		g.contained(g.on(RetryRetry, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryRetry),
		g.contained(g.on(RetryFenced, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryFenced),
		g.mutable(RetryResult),
		g.contained(g.on(RetryDone, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryDone),
		g.contained(g.on(RetryFailed, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryFailed),
		g.contained(g.on(RetryHeld, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryHeld),
		g.contained(g.on(RetryRefusal, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryRefusal),
		g.contained(g.on(RetryExhausted, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryExhausted),
		g.contained(g.on(RetrySteadfastInput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetrySteadfastInput),
		g.contained(g.on(RetryBrittleInput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryBrittleInput),
		g.contained(g.on(RetryPoliteInput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryPoliteInput),
		g.contained(g.on(RetryPatientInput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryPatientInput),
		g.contained(g.on(RetryLaddersInput, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetryLaddersInput),
		g.contained(g.on(RetryThrottledInput, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetryThrottledInput),
		g.contained(g.on(RetryUnhurriedInput, "root", "scope"), g.on(RetryScope, "root", "scope")),
		g.mutable(RetryUnhurriedInput),
		g.contained(g.on(RetrySteadfastOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetrySteadfastOutput),
		g.contained(g.on(RetryBrittleOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryBrittleOutput),
		g.contained(g.on(RetryPoliteOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryPoliteOutput),
		g.contained(g.on(RetryPatientOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryPatientOutput),
		g.contained(g.on(RetryLaddersFinishOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryLaddersFinishOutput),
		g.contained(g.on(RetryThrottledFinishOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryThrottledFinishOutput),
		g.contained(g.on(RetryUnhurriedFinishOutput, "root", "step"), g.on(RetryStep, "root", "step")),
		g.mutable(RetryUnhurriedFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const retryCoordination = g.fragment(
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
		g.contained(g.on(RetryResumed, "target", "turn"), g.on(RetryPaused, "target", "turn")),
		g.contained(g.on(RetryPaused, "target", g.pred("turn")), g.on(RetryResumed, "target", "turn"))
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
