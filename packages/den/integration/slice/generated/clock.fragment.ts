import { DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
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
	select
} from "@bjornpagen/grizzle"

export const ClockKind = closed.unordered("ClockKind", ["Chime", "HourlyFinish"])
export const ClockRootKind = closed.unordered("ClockRootKind", ["Hourly"])
export const ClockOutcome = closed.unordered("ClockOutcome", ["done", "failed"])
export const ClockPausable = closed.unordered("ClockPausable", ["Hourly"])

export const ClockScope = relation("ClockScope", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const ClockRoot = relation(
	"ClockRoot",
	{
		scope: DenScope,
		kind: closedId(ClockRootKind),
		key: Text,
		at: DenInstant,
		retired: retirement
	},
	["scope"]
)
export const ClockAdmitted = relation("ClockAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const ClockSkipped = relation(
	"ClockSkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const ClockStep = relation(
	"ClockStep",
	{ step: DenStep, kind: closedId(ClockKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const ClockStartStep = relation(
	"ClockStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const ClockFinish = relation(
	"ClockFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const ClockClaim = relation(
	"ClockClaim",
	{ step: DenStep, attempt: place, until: DenInstant, root: DenScope },
	["step", "root", "attempt"]
)
export const ClockEnded = relation(
	"ClockEnded",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const ClockRetry = relation(
	"ClockRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean, root: DenScope },
	["step", "attempt", "root"]
)
export const ClockFenced = relation(
	"ClockFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const ClockResult = relation(
	"ClockResult",
	{ step: DenStep, outcome: closedId(ClockOutcome), root: DenScope },
	["step", "root"]
)
export const ClockDone = relation("ClockDone", { step: DenStep, root: DenScope }, ["step", "root"])
export const ClockFailed = relation("ClockFailed", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const ClockHeld = relation(
	"ClockHeld",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "root"]
)
export const ClockRefusal = relation("ClockRefusal", { step: DenStep, law: Text, root: DenScope }, [
	"step",
	"root"
])
export const ClockExhausted = relation("ClockExhausted", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const ClockChimeInput = relation(
	"ClockChimeInput",
	{ step: DenStep, hour: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ClockHourlyInput = relation(
	"ClockHourlyInput",
	{ scope: DenScope, hour: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const ClockChimeOutput = relation(
	"ClockChimeOutput",
	{ step: DenStep, hour: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ClockHourlyFinishOutput = relation(
	"ClockHourlyFinishOutput",
	{ step: DenStep, root: DenScope },
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

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const clockGraph = fragment(
	[
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockPausable,
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
		ClockHourlyInput,
		ClockChimeOutput,
		ClockHourlyFinishOutput
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
			on(ClockHourlyInput, "scope"),
			on(
				select(ClockRoot, (row) => row.eq(row.kind, "Hourly")),
				"scope"
			)
		),
		contained(on(ClockChimeOutput, "step", "root"), on(ClockChimeInput, "step", "root")),
		contained(on(ClockChimeOutput, "step", "root"), on(ClockDone, "step", "root")),
		contained(on(ClockHourlyFinishOutput, "step", "root"), on(ClockDone, "step", "root")),
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
			on(ClockHourlyInput, "root"),
			on(ClockChimeOutput, "root"),
			on(ClockHourlyFinishOutput, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const clockCoordination = fragment(
	[ClockKind, ClockRootKind, ClockOutcome, ClockPausable, ClockPaused, ClockResumed],
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
	"ClockHourlyFinishOutput"
] as const
