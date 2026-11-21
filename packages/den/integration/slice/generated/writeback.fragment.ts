import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Writeback to; `den generate` writes it, and nothing edits it. */
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
	select,
	sha256
} from "@bjornpagen/grizzle"

export const WritebackKind = closed.unordered("WritebackKind", ["Deliver", "WritebackFinish"])
export const WritebackRootKind = closed.unordered("WritebackRootKind", ["Writeback"])
export const WritebackOutcome = closed.unordered("WritebackOutcome", ["done", "failed"])
export const WritebackRetryWhy = closed.unordered("WritebackRetryWhy", [
	"spent",
	"transient",
	"later"
])
export const WritebackPausable = closed.unordered("WritebackPausable", ["Writeback"])

export const WritebackScope = relation("WritebackScope", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const WritebackRoot = relation(
	"WritebackRoot",
	{
		scope: sha256,
		kind: closedId(WritebackRootKind),
		key: Text,
		at: DenInstant,
		retired: retirement
	},
	["scope"]
)
export const WritebackAdmitted = relation("WritebackAdmitted", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const WritebackSkipped = relation(
	"WritebackSkipped",
	{ scope: sha256, by: sha256, root: sha256 },
	["scope", "root"]
)
export const WritebackStep = relation(
	"WritebackStep",
	{ step: sha256, kind: closedId(WritebackKind), scope: sha256, due: DenInstant, root: sha256 },
	["step", "root"]
)
export const WritebackStartStep = relation(
	"WritebackStartStep",
	{ scope: sha256, ordinal: natural, step: sha256, root: sha256 },
	["scope", "ordinal", "root"]
)
export const WritebackFinish = relation(
	"WritebackFinish",
	{ scope: sha256, step: sha256, root: sha256 },
	["scope", "root"]
)
export const WritebackClaim = relation(
	"WritebackClaim",
	{ step: sha256, attempt: place, until: DenInstant, root: sha256 },
	["step", "root", "attempt"]
)
export const WritebackEnded = relation(
	"WritebackEnded",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "attempt", "root"]
)
export const WritebackRetry = relation(
	"WritebackRetry",
	{
		step: sha256,
		attempt: natural,
		at: DenInstant,
		why: closedId(WritebackRetryWhy),
		root: sha256
	},
	["step", "attempt", "root"]
)
export const WritebackFenced = relation(
	"WritebackFenced",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "attempt", "root"]
)
export const WritebackResult = relation(
	"WritebackResult",
	{ step: sha256, outcome: closedId(WritebackOutcome), root: sha256 },
	["step", "root"]
)
export const WritebackDone = relation("WritebackDone", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const WritebackFailed = relation("WritebackFailed", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const WritebackHeld = relation(
	"WritebackHeld",
	{ step: sha256, attempt: natural, root: sha256 },
	["step", "root"]
)
export const WritebackRefusal = relation(
	"WritebackRefusal",
	{ step: sha256, law: Text, root: sha256 },
	["step", "root"]
)
export const WritebackExhausted = relation("WritebackExhausted", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const WritebackDeliverInput = relation(
	"WritebackDeliverInput",
	{ step: sha256, attempt: Text, root: sha256 },
	["step", "root"]
)
export const WritebackWritebackInput = relation(
	"WritebackWritebackInput",
	{ scope: sha256, attempt: Text, root: sha256 },
	["scope", "root"]
)
export const WritebackDeliverOutput = relation(
	"WritebackDeliverOutput",
	{ step: sha256, attempt: Text, root: sha256 },
	["step", "root"]
)
export const WritebackWritebackFinishOutput = relation(
	"WritebackWritebackFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const WritebackPaused = relation(
	"WritebackPaused",
	{ target: closedId(WritebackPausable), turn: natural },
	["target", "turn"]
)
export const WritebackResumed = relation(
	"WritebackResumed",
	{ target: closedId(WritebackPausable), turn: natural },
	["target", "turn"]
)
export const WritebackServed = relation(
	"WritebackServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const writebackGraph = fragment(
	[
		WritebackKind,
		WritebackRootKind,
		WritebackOutcome,
		WritebackRetryWhy,
		WritebackPausable,
		WritebackScope,
		WritebackRoot,
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
		contained(on(WritebackAdmitted, "scope", "root"), on(WritebackScope, "scope", "root")),
		contained(on(WritebackSkipped, "scope"), on(WritebackRoot, "scope")),
		contained(on(WritebackSkipped, "by"), on(WritebackRoot, "scope")),
		contained(on(WritebackStep, "scope", "root"), on(WritebackAdmitted, "scope", "root")),
		contained(on(WritebackStartStep, "scope", "root"), on(WritebackAdmitted, "scope", "root")),
		contained(on(WritebackStartStep, "step", "root"), on(WritebackStep, "step", "root")),
		key(on(WritebackStartStep, "step", "root")),
		contained(on(WritebackFinish, "scope", "root"), on(WritebackAdmitted, "scope", "root")),
		contained(on(WritebackFinish, "step", "root"), on(WritebackStep, "step", "root")),
		key(on(WritebackFinish, "step", "root")),
		contained(on(WritebackClaim, "step", "root"), on(WritebackStep, "step", "root")),
		contained(
			on(WritebackEnded, "step", "attempt", "root"),
			on(WritebackClaim, "step", "attempt", "root")
		),
		contained(
			on(
				select(WritebackClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(WritebackEnded, "step", "attempt", "root")
		),
		contained(
			on(WritebackRetry, "step", "attempt", "root"),
			on(WritebackEnded, "step", "attempt", "root")
		),
		contained(
			on(WritebackFenced, "step", "attempt", "root"),
			on(WritebackEnded, "step", "attempt", "root")
		),
		contained(on(WritebackResult, "step", "root"), on(WritebackStep, "step", "root")),
		contained(
			on(WritebackHeld, "step", "attempt", "root"),
			on(WritebackClaim, "step", "attempt", "root")
		),
		contained(on(WritebackHeld, "step", "root"), on(WritebackResult, "step", "root")),
		contained(
			on(WritebackDone, "step", "root"),
			on(
				select(WritebackResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(WritebackFailed, "step", "root"),
			on(
				select(WritebackResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(WritebackRefusal, "step", "root"), on(WritebackFailed, "step", "root")),
		contained(on(WritebackExhausted, "step", "root"), on(WritebackFailed, "step", "root")),
		contained(
			on(WritebackDeliverInput, "step", "root"),
			on(
				select(WritebackStep, (row) => row.eq(row.kind, "Deliver")),
				"step",
				"root"
			)
		),
		contained(
			on(WritebackWritebackInput, "scope"),
			on(
				select(WritebackRoot, (row) => row.eq(row.kind, "Writeback")),
				"scope"
			)
		),
		contained(
			on(WritebackDeliverOutput, "step", "root"),
			on(WritebackDeliverInput, "step", "root")
		),
		contained(on(WritebackDeliverOutput, "step", "root"), on(WritebackDone, "step", "root")),
		contained(
			on(WritebackWritebackFinishOutput, "step", "root"),
			on(WritebackDone, "step", "root")
		),
		retirable(WritebackRoot, [
			on(WritebackScope, "root"),
			on(WritebackAdmitted, "root"),
			on(WritebackSkipped, "root"),
			on(WritebackStep, "root"),
			on(WritebackStartStep, "root"),
			on(WritebackFinish, "root"),
			on(WritebackClaim, "root"),
			on(WritebackEnded, "root"),
			on(WritebackRetry, "root"),
			on(WritebackFenced, "root"),
			on(WritebackResult, "root"),
			on(WritebackDone, "root"),
			on(WritebackFailed, "root"),
			on(WritebackHeld, "root"),
			on(WritebackRefusal, "root"),
			on(WritebackExhausted, "root"),
			on(WritebackDeliverInput, "root"),
			on(WritebackWritebackInput, "root"),
			on(WritebackDeliverOutput, "root"),
			on(WritebackWritebackFinishOutput, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const writebackCoordination = fragment(
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
		contained(on(WritebackResumed, "target", "turn"), on(WritebackPaused, "target", "turn")),
		contained(on(WritebackPaused, "target", pred("turn")), on(WritebackResumed, "target", "turn"))
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
