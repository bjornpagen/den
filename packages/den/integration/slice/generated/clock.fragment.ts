import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Clock to; `den generate` writes it, and nothing edits it. */
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
	pg,
	pred,
	relation,
	select,
	sha256,
	unit
} from "@bjornpagen/grizzle"

export const ClockKind = closed.unordered("ClockKind", [
	"Chime",
	"Close",
	"HourlyFinish",
	"SittingFinish"
])
export const ClockRootKind = closed.unordered("ClockRootKind", ["Hourly", "Sitting"])
export const ClockOutcome = closed.unordered("ClockOutcome", ["done", "failed"])
export const ClockRetryWhy = closed.unordered("ClockRetryWhy", ["spent", "transient", "later"])
export const ClockPausable = closed.unordered("ClockPausable", ["Hourly", "Sitting"])
export const ClockChimeInputBell = closed.unordered("ClockChimeInputBell", ["east", "west"])
export const ClockHourlyInputBell = closed.unordered("ClockHourlyInputBell", ["east", "west"])
export const ClockChimeOutputBell = closed.unordered("ClockChimeOutputBell", ["east", "west"])

export const ClockScope = relation("ClockScope", { root: sha256, scope: sha256 }, ["root", "scope"])
export const ClockRoot = relation(
	"ClockRoot",
	{ root: sha256, kind: closedId(ClockRootKind), key: Text, at: DenInstant },
	["root"]
)
export const ClockAdmitted = relation("ClockAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const ClockSkipped = relation("ClockSkipped", { root: sha256, scope: sha256, by: sha256 }, [
	"root",
	"scope"
])
export const ClockStep = relation(
	"ClockStep",
	{ root: sha256, step: sha256, kind: closedId(ClockKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const ClockStartStep = relation(
	"ClockStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const ClockFinish = relation("ClockFinish", { root: sha256, scope: sha256, step: sha256 }, [
	"root",
	"scope"
])
export const ClockClaim = relation(
	"ClockClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const ClockEnded = relation("ClockEnded", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const ClockRetry = relation(
	"ClockRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(ClockRetryWhy) },
	["root", "step", "attempt"]
)
export const ClockFenced = relation(
	"ClockFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const ClockResult = relation(
	"ClockResult",
	{ root: sha256, step: sha256, outcome: closedId(ClockOutcome) },
	["root", "step"]
)
export const ClockDone = relation("ClockDone", { root: sha256, step: sha256 }, ["root", "step"])
export const ClockFailed = relation("ClockFailed", { root: sha256, step: sha256 }, ["root", "step"])
export const ClockHeld = relation("ClockHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const ClockRefusal = relation("ClockRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const ClockExhausted = relation("ClockExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const ClockChimeInput = relation(
	"ClockChimeInput",
	{ root: sha256, step: sha256, hour: pg.bigint, bell: closedId(ClockChimeInputBell) },
	["root", "step"]
)
export const ClockCloseInput = relation(
	"ClockCloseInput",
	{ root: sha256, step: sha256, sitting: Text, deadline: DenInstant },
	["root", "step"]
)
export const ClockHourlyInput = relation(
	"ClockHourlyInput",
	{ root: sha256, scope: sha256, hour: pg.bigint, bell: closedId(ClockHourlyInputBell) },
	["root", "scope"]
)
export const ClockSittingInput = relation(
	"ClockSittingInput",
	{ root: sha256, scope: sha256, sitting: Text, deadline: DenInstant },
	["root", "scope"]
)
export const ClockChimeOutput = relation(
	"ClockChimeOutput",
	{ root: sha256, step: sha256, hour: pg.bigint, bell: closedId(ClockChimeOutputBell) },
	["root", "step"]
)
export const ClockCloseOutput = relation(
	"ClockCloseOutput",
	{ root: sha256, step: sha256, sitting: Text, deadline: DenInstant },
	["root", "step"]
)
export const ClockHourlyFinishOutput = relation(
	"ClockHourlyFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const ClockSittingFinishOutput = relation(
	"ClockSittingFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const ClockPaused = relation(
	"ClockPaused",
	{ target: closedId(ClockPausable), turn: natural },
	["target", "turn"]
)
export const ClockResumed = relation(
	"ClockResumed",
	{ target: closedId(ClockPausable), turn: natural },
	["target", "turn"]
)
export const ClockServed = relation(
	"ClockServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const clockGraph = fragment(
	[
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockRetryWhy,
		ClockPausable,
		ClockChimeInputBell,
		ClockHourlyInputBell,
		ClockChimeOutputBell,
		ClockScope,
		ClockRoot,
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
		ClockChimeOutput,
		ClockCloseOutput,
		ClockHourlyFinishOutput,
		ClockSittingFinishOutput
	],
	[
		unit("DenRoot", { root: sha256 }),
		contained(on(ClockAdmitted, "root", "scope"), on(ClockScope, "root", "scope")),
		contained(on(ClockSkipped, "scope"), on(ClockRoot, "root")),
		contained(on(ClockSkipped, "by"), on(ClockRoot, "root")),
		contained(on(ClockStep, "root", "scope"), on(ClockAdmitted, "root", "scope")),
		contained(on(ClockStartStep, "root", "scope"), on(ClockAdmitted, "root", "scope")),
		contained(on(ClockStartStep, "root", "step"), on(ClockStep, "root", "step")),
		key(on(ClockStartStep, "root", "step")),
		contained(on(ClockFinish, "root", "scope"), on(ClockAdmitted, "root", "scope")),
		contained(on(ClockFinish, "root", "step"), on(ClockStep, "root", "step")),
		key(on(ClockFinish, "root", "step")),
		contained(on(ClockClaim, "root", "step"), on(ClockStep, "root", "step")),
		contained(on(ClockEnded, "root", "step", "attempt"), on(ClockClaim, "root", "step", "attempt")),
		contained(
			on(
				select(ClockClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(ClockEnded, "root", "step", "attempt")
		),
		contained(on(ClockRetry, "root", "step", "attempt"), on(ClockEnded, "root", "step", "attempt")),
		contained(
			on(ClockFenced, "root", "step", "attempt"),
			on(ClockEnded, "root", "step", "attempt")
		),
		contained(on(ClockResult, "root", "step"), on(ClockStep, "root", "step")),
		contained(on(ClockHeld, "root", "step", "attempt"), on(ClockClaim, "root", "step", "attempt")),
		contained(on(ClockHeld, "root", "step"), on(ClockResult, "root", "step")),
		contained(
			on(ClockDone, "root", "step"),
			on(
				select(ClockResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(ClockFailed, "root", "step"),
			on(
				select(ClockResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(ClockRefusal, "root", "step"), on(ClockFailed, "root", "step")),
		contained(on(ClockExhausted, "root", "step"), on(ClockFailed, "root", "step")),
		contained(
			on(ClockChimeInput, "root", "step"),
			on(
				select(ClockStep, (row) => row.eq(row.kind, "Chime")),
				"root",
				"step"
			)
		),
		contained(
			on(ClockCloseInput, "root", "step"),
			on(
				select(ClockStep, (row) => row.eq(row.kind, "Close")),
				"root",
				"step"
			)
		),
		contained(
			on(ClockHourlyInput, "scope"),
			on(
				select(ClockRoot, (row) => row.eq(row.kind, "Hourly")),
				"root"
			)
		),
		contained(
			on(ClockSittingInput, "scope"),
			on(
				select(ClockRoot, (row) => row.eq(row.kind, "Sitting")),
				"root"
			)
		),
		contained(on(ClockChimeOutput, "root", "step"), on(ClockChimeInput, "root", "step")),
		contained(on(ClockChimeOutput, "root", "step"), on(ClockDone, "root", "step")),
		contained(on(ClockCloseOutput, "root", "step"), on(ClockCloseInput, "root", "step")),
		contained(on(ClockCloseOutput, "root", "step"), on(ClockDone, "root", "step")),
		contained(on(ClockHourlyFinishOutput, "root", "step"), on(ClockDone, "root", "step")),
		contained(on(ClockSittingFinishOutput, "root", "step"), on(ClockDone, "root", "step")),
		contained(on(ClockScope, "root"), on(ClockRoot, "root")),
		mutable(ClockScope),
		contained(on(ClockAdmitted, "root"), on(ClockRoot, "root")),
		mutable(ClockAdmitted),
		contained(on(ClockSkipped, "root"), on(ClockRoot, "root")),
		mutable(ClockSkipped),
		contained(on(ClockStep, "root"), on(ClockRoot, "root")),
		mutable(ClockStep),
		contained(on(ClockStartStep, "root"), on(ClockRoot, "root")),
		mutable(ClockStartStep),
		contained(on(ClockFinish, "root"), on(ClockRoot, "root")),
		mutable(ClockFinish),
		contained(on(ClockClaim, "root"), on(ClockRoot, "root")),
		mutable(ClockClaim),
		contained(on(ClockEnded, "root"), on(ClockRoot, "root")),
		mutable(ClockEnded),
		contained(on(ClockRetry, "root"), on(ClockRoot, "root")),
		mutable(ClockRetry),
		contained(on(ClockFenced, "root"), on(ClockRoot, "root")),
		mutable(ClockFenced),
		contained(on(ClockResult, "root"), on(ClockRoot, "root")),
		mutable(ClockResult),
		contained(on(ClockDone, "root"), on(ClockRoot, "root")),
		mutable(ClockDone),
		contained(on(ClockFailed, "root"), on(ClockRoot, "root")),
		mutable(ClockFailed),
		contained(on(ClockHeld, "root"), on(ClockRoot, "root")),
		mutable(ClockHeld),
		contained(on(ClockRefusal, "root"), on(ClockRoot, "root")),
		mutable(ClockRefusal),
		contained(on(ClockExhausted, "root"), on(ClockRoot, "root")),
		mutable(ClockExhausted),
		contained(on(ClockChimeInput, "root"), on(ClockRoot, "root")),
		mutable(ClockChimeInput),
		contained(on(ClockCloseInput, "root"), on(ClockRoot, "root")),
		mutable(ClockCloseInput),
		contained(on(ClockHourlyInput, "root"), on(ClockRoot, "root")),
		mutable(ClockHourlyInput),
		contained(on(ClockSittingInput, "root"), on(ClockRoot, "root")),
		mutable(ClockSittingInput),
		contained(on(ClockChimeOutput, "root"), on(ClockRoot, "root")),
		mutable(ClockChimeOutput),
		contained(on(ClockCloseOutput, "root"), on(ClockRoot, "root")),
		mutable(ClockCloseOutput),
		contained(on(ClockHourlyFinishOutput, "root"), on(ClockRoot, "root")),
		mutable(ClockHourlyFinishOutput),
		contained(on(ClockSittingFinishOutput, "root"), on(ClockRoot, "root")),
		mutable(ClockSittingFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const clockCoordination = fragment(
	[
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockRetryWhy,
		ClockPausable,
		ClockChimeInputBell,
		ClockHourlyInputBell,
		ClockChimeOutputBell,
		ClockPaused,
		ClockResumed,
		ClockServed
	],
	[
		contained(on(ClockResumed, "target", "turn"), on(ClockPaused, "target", "turn")),
		contained(on(ClockPaused, "target", pred("turn")), on(ClockResumed, "target", "turn"))
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
