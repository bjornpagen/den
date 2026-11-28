import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Writeback to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"

export const WritebackKind = g.closed.unordered("WritebackKind", ["Deliver", "WritebackFinish"])
export const WritebackRootKind = g.closed.unordered("WritebackRootKind", ["Writeback"])
export const WritebackOutcome = g.closed.unordered("WritebackOutcome", ["done", "failed"])
export const WritebackRetryWhy = g.closed.unordered("WritebackRetryWhy", [
	"spent",
	"transient",
	"later"
])
export const WritebackPausable = g.closed.unordered("WritebackPausable", ["Writeback"])

export const WritebackScope = g.relation("WritebackScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const WritebackRoot = g.relation(
	"WritebackRoot",
	{ root: g.sha256, kind: g.closedId(WritebackRootKind), key: Text, at: DenInstant },
	["root"]
)
export const WritebackRequestedWith = g.relation(
	"WritebackRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const WritebackAdmitted = g.relation(
	"WritebackAdmitted",
	{ root: g.sha256, scope: g.sha256 },
	["root", "scope"]
)
export const WritebackSkipped = g.relation(
	"WritebackSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const WritebackStep = g.relation(
	"WritebackStep",
	{
		root: g.sha256,
		step: g.sha256,
		kind: g.closedId(WritebackKind),
		scope: g.sha256,
		due: DenInstant
	},
	["root", "step"]
)
export const WritebackStartStep = g.relation(
	"WritebackStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const WritebackFinish = g.relation(
	"WritebackFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const WritebackClaim = g.relation(
	"WritebackClaim",
	{ root: g.sha256, step: g.sha256, attempt: g.place, until: DenInstant },
	["root", "step", "attempt"]
)
export const WritebackEnded = g.relation(
	"WritebackEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const WritebackRetry = g.relation(
	"WritebackRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(WritebackRetryWhy)
	},
	["root", "step", "attempt"]
)
export const WritebackFenced = g.relation(
	"WritebackFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const WritebackResult = g.relation(
	"WritebackResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(WritebackOutcome) },
	["root", "step"]
)
export const WritebackDone = g.relation("WritebackDone", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const WritebackFailed = g.relation("WritebackFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const WritebackHeld = g.relation(
	"WritebackHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const WritebackRefusal = g.relation(
	"WritebackRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const WritebackExhausted = g.relation(
	"WritebackExhausted",
	{ root: g.sha256, step: g.sha256 },
	["root", "step"]
)
export const WritebackDeliverInput = g
	.derivedName({ stem: "Writeback", path: ["DeliverInput"] })
	.relation("WritebackDeliverInput", { root: g.sha256, step: g.sha256, attempt: Text }, [
		"root",
		"step"
	])
export const WritebackWritebackInput = g
	.derivedName({ stem: "Writeback", path: ["WritebackInput"] })
	.relation("WritebackWritebackInput", { root: g.sha256, scope: g.sha256, attempt: Text }, [
		"root",
		"scope"
	])
export const WritebackDeliverOutput = g
	.derivedName({ stem: "Writeback", path: ["DeliverOutput"] })
	.relation("WritebackDeliverOutput", { root: g.sha256, step: g.sha256, attempt: Text }, [
		"root",
		"step"
	])
export const WritebackWritebackFinishOutput = g
	.derivedName({ stem: "Writeback", path: ["WritebackFinishOutput"] })
	.relation("WritebackWritebackFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const WritebackPaused = g.relation(
	"WritebackPaused",
	{ target: g.closedId(WritebackPausable), turn: g.natural },
	["target", "turn"]
)
export const WritebackResumed = g.relation(
	"WritebackResumed",
	{ target: g.closedId(WritebackPausable), turn: g.natural },
	["target", "turn"]
)
export const WritebackServed = g.relation(
	"WritebackServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const writebackGraph = g.fragment(
	[
		WritebackKind,
		WritebackRootKind,
		WritebackOutcome,
		WritebackRetryWhy,
		WritebackPausable,
		WritebackScope,
		WritebackRoot,
		WritebackRequestedWith,
		WritebackAdmitted,
		WritebackSkipped,
		WritebackStep,
		WritebackStartStep,
		WritebackFinish,
		WritebackClaim,
		WritebackEnded,
		WritebackRetry,
		WritebackFenced,
		WritebackResult,
		WritebackDone,
		WritebackFailed,
		WritebackHeld,
		WritebackRefusal,
		WritebackExhausted,
		WritebackDeliverInput,
		WritebackWritebackInput,
		WritebackDeliverOutput,
		WritebackWritebackFinishOutput
	],
	[
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(WritebackScope, "scope")),
		g.key(g.on(WritebackStep, "step")),
		g.contained(g.on(WritebackAdmitted, "root", "scope"), g.on(WritebackScope, "root", "scope")),
		g.contained(g.on(WritebackSkipped, "scope"), g.on(WritebackRoot, "root")),
		g.contained(g.on(WritebackSkipped, "by"), g.on(WritebackRoot, "root")),
		g.contained(g.on(WritebackRequestedWith, "root"), g.on(WritebackRoot, "root")),
		g.contained(g.on(WritebackStep, "root", "scope"), g.on(WritebackAdmitted, "root", "scope")),
		g.contained(
			g.on(WritebackStartStep, "root", "scope"),
			g.on(WritebackAdmitted, "root", "scope")
		),
		g.contained(g.on(WritebackStartStep, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.key(g.on(WritebackStartStep, "root", "step")),
		g.contained(g.on(WritebackFinish, "root", "scope"), g.on(WritebackAdmitted, "root", "scope")),
		g.contained(g.on(WritebackFinish, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.key(g.on(WritebackFinish, "root", "step")),
		g.contained(g.on(WritebackClaim, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.contained(
			g.on(WritebackEnded, "root", "step", "attempt"),
			g.on(WritebackClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(WritebackClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(WritebackEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(WritebackRetry, "root", "step", "attempt"),
			g.on(WritebackEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(WritebackFenced, "root", "step", "attempt"),
			g.on(WritebackEnded, "root", "step", "attempt")
		),
		g.contained(g.on(WritebackResult, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.contained(
			g.on(WritebackHeld, "root", "step", "attempt"),
			g.on(WritebackClaim, "root", "step", "attempt")
		),
		g.contained(g.on(WritebackHeld, "root", "step"), g.on(WritebackResult, "root", "step")),
		g.contained(
			g.on(WritebackDone, "root", "step"),
			g.on(
				g.select(WritebackResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(WritebackFailed, "root", "step"),
			g.on(
				g.select(WritebackResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(WritebackRefusal, "root", "step"), g.on(WritebackFailed, "root", "step")),
		g.contained(g.on(WritebackExhausted, "root", "step"), g.on(WritebackFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(WritebackRoot, (row) => row.eq(row.kind, "Writeback")),
				"root"
			),
			g.on(WritebackRequestedWith, "root")
		),
		g.contained(
			g.on(WritebackDeliverInput, "root", "step"),
			g.on(
				g.select(WritebackStep, (row) => row.eq(row.kind, "Deliver")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(WritebackWritebackInput, "scope"),
			g.on(
				g.select(WritebackRoot, (row) => row.eq(row.kind, "Writeback")),
				"root"
			)
		),
		g.contained(
			g.on(WritebackDeliverOutput, "root", "step"),
			g.on(WritebackDeliverInput, "root", "step")
		),
		g.contained(g.on(WritebackDeliverOutput, "root", "step"), g.on(WritebackDone, "root", "step")),
		g.contained(
			g.on(WritebackWritebackFinishOutput, "root", "step"),
			g.on(WritebackDone, "root", "step")
		),
		g.contained(g.on(WritebackScope, "root"), g.on(WritebackRoot, "root")),
		g.mutable(WritebackScope),
		g.mutable(WritebackAdmitted),
		g.contained(g.on(WritebackSkipped, "root", "scope"), g.on(WritebackScope, "root", "scope")),
		g.mutable(WritebackSkipped),
		g.contained(g.on(WritebackStep, "root", "scope"), g.on(WritebackScope, "root", "scope")),
		g.mutable(WritebackStep),
		g.contained(g.on(WritebackStartStep, "root", "scope"), g.on(WritebackScope, "root", "scope")),
		g.mutable(WritebackStartStep),
		g.contained(g.on(WritebackFinish, "root", "scope"), g.on(WritebackScope, "root", "scope")),
		g.mutable(WritebackFinish),
		g.mutable(WritebackClaim),
		g.contained(g.on(WritebackEnded, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackEnded),
		g.contained(g.on(WritebackRetry, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackRetry),
		g.contained(g.on(WritebackFenced, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackFenced),
		g.mutable(WritebackResult),
		g.contained(g.on(WritebackDone, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackDone),
		g.contained(g.on(WritebackFailed, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackFailed),
		g.contained(g.on(WritebackHeld, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackHeld),
		g.contained(g.on(WritebackRefusal, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackRefusal),
		g.contained(g.on(WritebackExhausted, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackExhausted),
		g.contained(g.on(WritebackDeliverInput, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackDeliverInput),
		g.contained(
			g.on(WritebackWritebackInput, "root", "scope"),
			g.on(WritebackScope, "root", "scope")
		),
		g.mutable(WritebackWritebackInput),
		g.contained(g.on(WritebackDeliverOutput, "root", "step"), g.on(WritebackStep, "root", "step")),
		g.mutable(WritebackDeliverOutput),
		g.contained(
			g.on(WritebackWritebackFinishOutput, "root", "step"),
			g.on(WritebackStep, "root", "step")
		),
		g.mutable(WritebackWritebackFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const writebackCoordination = g.fragment(
	[
		WritebackKind,
		WritebackRootKind,
		WritebackOutcome,
		WritebackRetryWhy,
		WritebackPausable,
		WritebackPaused,
		WritebackResumed,
		WritebackServed
	],
	[
		g.contained(g.on(WritebackResumed, "target", "turn"), g.on(WritebackPaused, "target", "turn")),
		g.contained(
			g.on(WritebackPaused, "target", g.pred("turn")),
			g.on(WritebackResumed, "target", "turn")
		)
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const writebackWriter = [
	"WritebackResult",
	"WritebackDone",
	"WritebackHeld",
	"WritebackDeliverOutput",
	"WritebackWritebackFinishOutput"
] as const
