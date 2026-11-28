import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Clock to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"

export const ClockKind = g.closed.unordered("ClockKind", [
	"Chime",
	"Close",
	"HourlyFinish",
	"SittingFinish"
])
export const ClockRootKind = g.closed.unordered("ClockRootKind", ["Hourly", "Sitting"])
export const ClockOutcome = g.closed.unordered("ClockOutcome", ["done", "failed"])
export const ClockRetryWhy = g.closed.unordered("ClockRetryWhy", ["spent", "transient", "later"])
export const ClockPausable = g.closed.unordered("ClockPausable", ["Hourly", "Sitting"])

export const ClockScope = g.relation("ClockScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const ClockRoot = g.relation(
	"ClockRoot",
	{ root: g.sha256, kind: g.closedId(ClockRootKind), key: Text, at: DenInstant },
	["root"]
)
export const ClockRequestedWith = g.relation(
	"ClockRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const ClockAdmitted = g.relation("ClockAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const ClockSkipped = g.relation(
	"ClockSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const ClockStep = g.relation(
	"ClockStep",
	{ root: g.sha256, step: g.sha256, kind: g.closedId(ClockKind), scope: g.sha256, due: DenInstant },
	["root", "step"]
)
export const ClockStartStep = g.relation(
	"ClockStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const ClockFinish = g.relation(
	"ClockFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const ClockClaim = g.relation(
	"ClockClaim",
	{ root: g.sha256, step: g.sha256, attempt: g.place, until: DenInstant },
	["root", "step", "attempt"]
)
export const ClockEnded = g.relation(
	"ClockEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const ClockRetry = g.relation(
	"ClockRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(ClockRetryWhy)
	},
	["root", "step", "attempt"]
)
export const ClockFenced = g.relation(
	"ClockFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const ClockResult = g.relation(
	"ClockResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(ClockOutcome) },
	["root", "step"]
)
export const ClockDone = g.relation("ClockDone", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ClockFailed = g.relation("ClockFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ClockHeld = g.relation(
	"ClockHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const ClockRefusal = g.relation(
	"ClockRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const ClockExhausted = g.relation("ClockExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ClockChimeInput = g
	.derivedName({ stem: "Clock", path: ["ChimeInput"] })
	.relation("ClockChimeInput", { root: g.sha256, step: g.sha256, hour: g.int8, bell: Text }, [
		"root",
		"step"
	])
export const ClockCloseInput = g
	.derivedName({ stem: "Clock", path: ["CloseInput"] })
	.relation(
		"ClockCloseInput",
		{ root: g.sha256, step: g.sha256, sitting: Text, deadline: DenInstant },
		["root", "step"]
	)
export const ClockHourlyInput = g
	.derivedName({ stem: "Clock", path: ["HourlyInput"] })
	.relation("ClockHourlyInput", { root: g.sha256, scope: g.sha256, hour: g.int8, bell: Text }, [
		"root",
		"scope"
	])
export const ClockSittingInput = g
	.derivedName({ stem: "Clock", path: ["SittingInput"] })
	.relation(
		"ClockSittingInput",
		{ root: g.sha256, scope: g.sha256, sitting: Text, deadline: DenInstant },
		["root", "scope"]
	)
export const ClockHourlyKey = g
	.derivedName({ stem: "Clock", path: ["HourlyKey"] })
	.generated("ClockHourlyKey", { root: g.sha256, at: g.int8, member: Text }, ["root"], (row) => ({
		memberDigest: g.generated(g.sha256, g.Crypto.sha256(row.member))
	}))
export const ClockChimeOutput = g
	.derivedName({ stem: "Clock", path: ["ChimeOutput"] })
	.relation("ClockChimeOutput", { root: g.sha256, step: g.sha256, hour: g.int8, bell: Text }, [
		"root",
		"step"
	])
export const ClockCloseOutput = g
	.derivedName({ stem: "Clock", path: ["CloseOutput"] })
	.relation(
		"ClockCloseOutput",
		{ root: g.sha256, step: g.sha256, sitting: Text, deadline: DenInstant },
		["root", "step"]
	)
export const ClockHourlyFinishOutput = g
	.derivedName({ stem: "Clock", path: ["HourlyFinishOutput"] })
	.relation("ClockHourlyFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const ClockSittingFinishOutput = g
	.derivedName({ stem: "Clock", path: ["SittingFinishOutput"] })
	.relation("ClockSittingFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const ClockPaused = g.relation(
	"ClockPaused",
	{ target: g.closedId(ClockPausable), turn: g.natural },
	["target", "turn"]
)
export const ClockResumed = g.relation(
	"ClockResumed",
	{ target: g.closedId(ClockPausable), turn: g.natural },
	["target", "turn"]
)
export const ClockServed = g.relation(
	"ClockServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const clockGraph = g.fragment(
	[
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockRetryWhy,
		ClockPausable,
		ClockScope,
		ClockRoot,
		ClockRequestedWith,
		ClockAdmitted,
		ClockSkipped,
		ClockStep,
		ClockStartStep,
		ClockFinish,
		ClockClaim,
		ClockEnded,
		ClockRetry,
		ClockFenced,
		ClockResult,
		ClockDone,
		ClockFailed,
		ClockHeld,
		ClockRefusal,
		ClockExhausted,
		ClockChimeInput,
		ClockCloseInput,
		ClockHourlyInput,
		ClockSittingInput,
		ClockHourlyKey,
		ClockChimeOutput,
		ClockCloseOutput,
		ClockHourlyFinishOutput,
		ClockSittingFinishOutput
	],
	[
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(ClockScope, "scope")),
		g.key(g.on(ClockStep, "step")),
		g.contained(g.on(ClockAdmitted, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.contained(g.on(ClockSkipped, "scope"), g.on(ClockRoot, "root")),
		g.contained(g.on(ClockSkipped, "by"), g.on(ClockRoot, "root")),
		g.contained(g.on(ClockRequestedWith, "root"), g.on(ClockRoot, "root")),
		g.contained(g.on(ClockStep, "root", "scope"), g.on(ClockAdmitted, "root", "scope")),
		g.contained(g.on(ClockStartStep, "root", "scope"), g.on(ClockAdmitted, "root", "scope")),
		g.contained(g.on(ClockStartStep, "root", "step"), g.on(ClockStep, "root", "step")),
		g.key(g.on(ClockStartStep, "root", "step")),
		g.contained(g.on(ClockFinish, "root", "scope"), g.on(ClockAdmitted, "root", "scope")),
		g.contained(g.on(ClockFinish, "root", "step"), g.on(ClockStep, "root", "step")),
		g.key(g.on(ClockFinish, "root", "step")),
		g.contained(g.on(ClockClaim, "root", "step"), g.on(ClockStep, "root", "step")),
		g.contained(
			g.on(ClockEnded, "root", "step", "attempt"),
			g.on(ClockClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(ClockClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(ClockEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(ClockRetry, "root", "step", "attempt"),
			g.on(ClockEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(ClockFenced, "root", "step", "attempt"),
			g.on(ClockEnded, "root", "step", "attempt")
		),
		g.contained(g.on(ClockResult, "root", "step"), g.on(ClockStep, "root", "step")),
		g.contained(
			g.on(ClockHeld, "root", "step", "attempt"),
			g.on(ClockClaim, "root", "step", "attempt")
		),
		g.contained(g.on(ClockHeld, "root", "step"), g.on(ClockResult, "root", "step")),
		g.contained(
			g.on(ClockDone, "root", "step"),
			g.on(
				g.select(ClockResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ClockFailed, "root", "step"),
			g.on(
				g.select(ClockResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(ClockRefusal, "root", "step"), g.on(ClockFailed, "root", "step")),
		g.contained(g.on(ClockExhausted, "root", "step"), g.on(ClockFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(ClockRoot, (row) => row.eq(row.kind, "Sitting")),
				"root"
			),
			g.on(ClockRequestedWith, "root")
		),
		g.contained(
			g.on(ClockChimeInput, "root", "step"),
			g.on(
				g.select(ClockStep, (row) => row.eq(row.kind, "Chime")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ClockCloseInput, "root", "step"),
			g.on(
				g.select(ClockStep, (row) => row.eq(row.kind, "Close")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ClockHourlyInput, "scope"),
			g.on(
				g.select(ClockRoot, (row) => row.eq(row.kind, "Hourly")),
				"root"
			)
		),
		g.contained(
			g.on(ClockSittingInput, "scope"),
			g.on(
				g.select(ClockRoot, (row) => row.eq(row.kind, "Sitting")),
				"root"
			)
		),
		g.key(g.on(ClockHourlyKey, "at", "memberDigest")),
		g.contained(
			g.on(ClockHourlyKey, "root"),
			g.on(
				g.select(ClockRoot, (row) => row.eq(row.kind, "Hourly")),
				"root"
			)
		),
		g.contained(
			g.on(
				g.select(ClockRoot, (row) => row.eq(row.kind, "Hourly")),
				"root"
			),
			g.on(ClockHourlyKey, "root")
		),
		g.contained(g.on(ClockChimeOutput, "root", "step"), g.on(ClockChimeInput, "root", "step")),
		g.contained(g.on(ClockChimeOutput, "root", "step"), g.on(ClockDone, "root", "step")),
		g.contained(g.on(ClockCloseOutput, "root", "step"), g.on(ClockCloseInput, "root", "step")),
		g.contained(g.on(ClockCloseOutput, "root", "step"), g.on(ClockDone, "root", "step")),
		g.contained(g.on(ClockHourlyFinishOutput, "root", "step"), g.on(ClockDone, "root", "step")),
		g.contained(g.on(ClockSittingFinishOutput, "root", "step"), g.on(ClockDone, "root", "step")),
		g.contained(g.on(ClockScope, "root"), g.on(ClockRoot, "root")),
		g.mutable(ClockScope),
		g.mutable(ClockAdmitted),
		g.contained(g.on(ClockSkipped, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.mutable(ClockSkipped),
		g.contained(g.on(ClockStep, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.mutable(ClockStep),
		g.contained(g.on(ClockStartStep, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.mutable(ClockStartStep),
		g.contained(g.on(ClockFinish, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.mutable(ClockFinish),
		g.mutable(ClockClaim),
		g.contained(g.on(ClockEnded, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockEnded),
		g.contained(g.on(ClockRetry, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockRetry),
		g.contained(g.on(ClockFenced, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockFenced),
		g.mutable(ClockResult),
		g.contained(g.on(ClockDone, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockDone),
		g.contained(g.on(ClockFailed, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockFailed),
		g.contained(g.on(ClockHeld, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockHeld),
		g.contained(g.on(ClockRefusal, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockRefusal),
		g.contained(g.on(ClockExhausted, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockExhausted),
		g.contained(g.on(ClockChimeInput, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockChimeInput),
		g.contained(g.on(ClockCloseInput, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockCloseInput),
		g.contained(g.on(ClockHourlyInput, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.mutable(ClockHourlyInput),
		g.contained(g.on(ClockSittingInput, "root", "scope"), g.on(ClockScope, "root", "scope")),
		g.mutable(ClockSittingInput),
		g.contained(g.on(ClockChimeOutput, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockChimeOutput),
		g.contained(g.on(ClockCloseOutput, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockCloseOutput),
		g.contained(g.on(ClockHourlyFinishOutput, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockHourlyFinishOutput),
		g.contained(g.on(ClockSittingFinishOutput, "root", "step"), g.on(ClockStep, "root", "step")),
		g.mutable(ClockSittingFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const clockCoordination = g.fragment(
	[
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockRetryWhy,
		ClockPausable,
		ClockPaused,
		ClockResumed,
		ClockServed
	],
	[
		g.contained(g.on(ClockResumed, "target", "turn"), g.on(ClockPaused, "target", "turn")),
		g.contained(g.on(ClockPaused, "target", g.pred("turn")), g.on(ClockResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const clockWriter = [
	"ClockResult",
	"ClockDone",
	"ClockHeld",
	"ClockChimeOutput",
	"ClockCloseOutput",
	"ClockHourlyFinishOutput",
	"ClockSittingFinishOutput"
] as const
