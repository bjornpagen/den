import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Clock to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	fragment,
	key,
	natural,
	on,
	place,
	pg,
	pred,
	relation,
	retirable,
	retirement,
	select,
	sha256
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

export const ClockScope = relation("ClockScope", { scope: sha256, root: sha256 }, ["scope", "root"])
export const ClockRoot = relation(
	"ClockRoot",
	{ scope: sha256, kind: closedId(ClockRootKind), key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const ClockAdmitted = relation("ClockAdmitted", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const ClockSkipped = relation("ClockSkipped", { scope: sha256, by: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const ClockStep = relation(
	"ClockStep",
	{ step: sha256, kind: closedId(ClockKind), scope: sha256, due: DenInstant, root: sha256 },
	["step", "root"]
)
export const ClockStartStep = relation(
	"ClockStartStep",
	{ scope: sha256, ordinal: natural, step: sha256, root: sha256 },
	["scope", "ordinal", "root"]
)
export const ClockFinish = relation("ClockFinish", { scope: sha256, step: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const ClockClaim = relation(
	"ClockClaim",
	{ step: sha256, attempt: place, until: DenInstant, root: sha256 },
	["step", "root", "attempt"]
)
export const ClockEnded = relation("ClockEnded", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"attempt",
	"root"
])
export const ClockRetry = relation(
	"ClockRetry",
	{ step: sha256, attempt: natural, at: DenInstant, why: closedId(ClockRetryWhy), root: sha256 },
	["step", "attempt", "root"]
)
export const ClockFenced = relation(
	"ClockFenced",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "attempt", "root"]
)
export const ClockResult = relation(
	"ClockResult",
	{ step: sha256, outcome: closedId(ClockOutcome), root: sha256 },
	["step", "root"]
)
export const ClockDone = relation("ClockDone", { step: sha256, root: sha256 }, ["step", "root"])
export const ClockFailed = relation("ClockFailed", { step: sha256, root: sha256 }, ["step", "root"])
export const ClockHeld = relation("ClockHeld", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"root"
])
export const ClockRefusal = relation("ClockRefusal", { step: sha256, law: Text, root: sha256 }, [
	"step",
	"root"
])
export const ClockExhausted = relation("ClockExhausted", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const ClockChimeInput = relation(
	"ClockChimeInput",
	{ step: sha256, hour: pg.bigint, bell: closedId(ClockChimeInputBell), root: sha256 },
	["step", "root"]
)
export const ClockCloseInput = relation(
	"ClockCloseInput",
	{ step: sha256, sitting: Text, deadline: DenInstant, root: sha256 },
	["step", "root"]
)
export const ClockHourlyInput = relation(
	"ClockHourlyInput",
	{ scope: sha256, hour: pg.bigint, bell: closedId(ClockHourlyInputBell), root: sha256 },
	["scope", "root"]
)
export const ClockSittingInput = relation(
	"ClockSittingInput",
	{ scope: sha256, sitting: Text, deadline: DenInstant, root: sha256 },
	["scope", "root"]
)
export const ClockChimeOutput = relation(
	"ClockChimeOutput",
	{ step: sha256, hour: pg.bigint, bell: closedId(ClockChimeOutputBell), root: sha256 },
	["step", "root"]
)
export const ClockCloseOutput = relation(
	"ClockCloseOutput",
	{ step: sha256, sitting: Text, deadline: DenInstant, root: sha256 },
	["step", "root"]
)
export const ClockHourlyFinishOutput = relation(
	"ClockHourlyFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const ClockSittingFinishOutput = relation(
	"ClockSittingFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
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
		contained(on(ClockAdmitted, "scope", "root"), on(ClockScope, "scope", "root")),
		contained(on(ClockSkipped, "scope"), on(ClockRoot, "scope")),
		contained(on(ClockSkipped, "by"), on(ClockRoot, "scope")),
		contained(on(ClockStep, "scope", "root"), on(ClockAdmitted, "scope", "root")),
		contained(on(ClockStartStep, "scope", "root"), on(ClockAdmitted, "scope", "root")),
		contained(on(ClockStartStep, "step", "root"), on(ClockStep, "step", "root")),
		key(on(ClockStartStep, "step", "root")),
		contained(on(ClockFinish, "scope", "root"), on(ClockAdmitted, "scope", "root")),
		contained(on(ClockFinish, "step", "root"), on(ClockStep, "step", "root")),
		key(on(ClockFinish, "step", "root")),
		contained(on(ClockClaim, "step", "root"), on(ClockStep, "step", "root")),
		contained(on(ClockEnded, "step", "attempt", "root"), on(ClockClaim, "step", "attempt", "root")),
		contained(
			on(
				select(ClockClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(ClockEnded, "step", "attempt", "root")
		),
		contained(on(ClockRetry, "step", "attempt", "root"), on(ClockEnded, "step", "attempt", "root")),
		contained(
			on(ClockFenced, "step", "attempt", "root"),
			on(ClockEnded, "step", "attempt", "root")
		),
		contained(on(ClockResult, "step", "root"), on(ClockStep, "step", "root")),
		contained(on(ClockHeld, "step", "attempt", "root"), on(ClockClaim, "step", "attempt", "root")),
		contained(on(ClockHeld, "step", "root"), on(ClockResult, "step", "root")),
		contained(
			on(ClockDone, "step", "root"),
			on(
				select(ClockResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(ClockFailed, "step", "root"),
			on(
				select(ClockResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(ClockRefusal, "step", "root"), on(ClockFailed, "step", "root")),
		contained(on(ClockExhausted, "step", "root"), on(ClockFailed, "step", "root")),
		contained(
			on(ClockChimeInput, "step", "root"),
			on(
				select(ClockStep, (row) => row.eq(row.kind, "Chime")),
				"step",
				"root"
			)
		),
		contained(
			on(ClockCloseInput, "step", "root"),
			on(
				select(ClockStep, (row) => row.eq(row.kind, "Close")),
				"step",
				"root"
			)
		),
		contained(
			on(ClockHourlyInput, "scope"),
			on(
				select(ClockRoot, (row) => row.eq(row.kind, "Hourly")),
				"scope"
			)
		),
		contained(
			on(ClockSittingInput, "scope"),
			on(
				select(ClockRoot, (row) => row.eq(row.kind, "Sitting")),
				"scope"
			)
		),
		contained(on(ClockChimeOutput, "step", "root"), on(ClockChimeInput, "step", "root")),
		contained(on(ClockChimeOutput, "step", "root"), on(ClockDone, "step", "root")),
		contained(on(ClockCloseOutput, "step", "root"), on(ClockCloseInput, "step", "root")),
		contained(on(ClockCloseOutput, "step", "root"), on(ClockDone, "step", "root")),
		contained(on(ClockHourlyFinishOutput, "step", "root"), on(ClockDone, "step", "root")),
		contained(on(ClockSittingFinishOutput, "step", "root"), on(ClockDone, "step", "root")),
		retirable(ClockRoot, [
			on(ClockScope, "root"),
			on(ClockAdmitted, "root"),
			on(ClockSkipped, "root"),
			on(ClockStep, "root"),
			on(ClockStartStep, "root"),
			on(ClockFinish, "root"),
			on(ClockClaim, "root"),
			on(ClockEnded, "root"),
			on(ClockRetry, "root"),
			on(ClockFenced, "root"),
			on(ClockResult, "root"),
			on(ClockDone, "root"),
			on(ClockFailed, "root"),
			on(ClockHeld, "root"),
			on(ClockRefusal, "root"),
			on(ClockExhausted, "root"),
			on(ClockChimeInput, "root"),
			on(ClockCloseInput, "root"),
			on(ClockHourlyInput, "root"),
			on(ClockSittingInput, "root"),
			on(ClockChimeOutput, "root"),
			on(ClockCloseOutput, "root"),
			on(ClockHourlyFinishOutput, "root"),
			on(ClockSittingFinishOutput, "root")
		])
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
