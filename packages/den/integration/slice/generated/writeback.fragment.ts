import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Writeback to; `den generate` writes it, and nothing edits it. */
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

export const WritebackKind = closed.unordered("WritebackKind", ["Deliver", "WritebackFinish"])
export const WritebackRootKind = closed.unordered("WritebackRootKind", ["Writeback"])
export const WritebackOutcome = closed.unordered("WritebackOutcome", ["done", "failed"])
export const WritebackRetryWhy = closed.unordered("WritebackRetryWhy", [
	"spent",
	"transient",
	"later"
])
export const WritebackPausable = closed.unordered("WritebackPausable", ["Writeback"])

export const WritebackScope = relation("WritebackScope", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const WritebackRoot = relation(
	"WritebackRoot",
	{ root: sha256, kind: closedId(WritebackRootKind), key: Text, at: DenInstant },
	["root"]
)
export const WritebackRequestedWith = relation(
	"WritebackRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
	["root"]
)
export const WritebackAdmitted = relation("WritebackAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const WritebackSkipped = relation(
	"WritebackSkipped",
	{ root: sha256, scope: sha256, by: sha256 },
	["root", "scope"]
)
export const WritebackStep = relation(
	"WritebackStep",
	{ root: sha256, step: sha256, kind: closedId(WritebackKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const WritebackStartStep = relation(
	"WritebackStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const WritebackFinish = relation(
	"WritebackFinish",
	{ root: sha256, scope: sha256, step: sha256 },
	["root", "scope"]
)
export const WritebackClaim = relation(
	"WritebackClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const WritebackEnded = relation(
	"WritebackEnded",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const WritebackRetry = relation(
	"WritebackRetry",
	{
		root: sha256,
		step: sha256,
		attempt: natural,
		at: DenInstant,
		why: closedId(WritebackRetryWhy)
	},
	["root", "step", "attempt"]
)
export const WritebackFenced = relation(
	"WritebackFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const WritebackResult = relation(
	"WritebackResult",
	{ root: sha256, step: sha256, outcome: closedId(WritebackOutcome) },
	["root", "step"]
)
export const WritebackDone = relation("WritebackDone", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const WritebackFailed = relation("WritebackFailed", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const WritebackHeld = relation(
	"WritebackHeld",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step"]
)
export const WritebackRefusal = relation(
	"WritebackRefusal",
	{ root: sha256, step: sha256, law: Text },
	["root", "step"]
)
export const WritebackExhausted = relation("WritebackExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const writeback_deliver_input_libhnkibecamc = relation(
	"writeback_deliver_input_libhnkibecamc",
	{ root: sha256, step: sha256, attempt: Text },
	["root", "step"]
)
export const writeback_writeback_input_ljafdhfgfeocc = relation(
	"writeback_writeback_input_ljafdhfgfeocc",
	{ root: sha256, scope: sha256, attempt: Text },
	["root", "scope"]
)
export const writeback_deliver_output_ppecogpmgbpek = relation(
	"writeback_deliver_output_ppecogpmgbpek",
	{ root: sha256, step: sha256, attempt: Text },
	["root", "step"]
)
export const writeback_writeback_finish_output_mhjodpondhejh = relation(
	"writeback_writeback_finish_output_mhjodpondhejh",
	{ root: sha256, step: sha256 },
	["root", "step"]
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
		writeback_deliver_input_libhnkibecamc,
		writeback_writeback_input_ljafdhfgfeocc,
		writeback_deliver_output_ppecogpmgbpek,
		writeback_writeback_finish_output_mhjodpondhejh
	],
	[
		unit("DenRoot", { root: sha256 }),
		key(on(WritebackScope, "scope")),
		key(on(WritebackStep, "step")),
		contained(on(WritebackAdmitted, "root", "scope"), on(WritebackScope, "root", "scope")),
		contained(on(WritebackSkipped, "scope"), on(WritebackRoot, "root")),
		contained(on(WritebackSkipped, "by"), on(WritebackRoot, "root")),
		contained(on(WritebackRequestedWith, "root"), on(WritebackRoot, "root")),
		contained(on(WritebackStep, "root", "scope"), on(WritebackAdmitted, "root", "scope")),
		contained(on(WritebackStartStep, "root", "scope"), on(WritebackAdmitted, "root", "scope")),
		contained(on(WritebackStartStep, "root", "step"), on(WritebackStep, "root", "step")),
		key(on(WritebackStartStep, "root", "step")),
		contained(on(WritebackFinish, "root", "scope"), on(WritebackAdmitted, "root", "scope")),
		contained(on(WritebackFinish, "root", "step"), on(WritebackStep, "root", "step")),
		key(on(WritebackFinish, "root", "step")),
		contained(on(WritebackClaim, "root", "step"), on(WritebackStep, "root", "step")),
		contained(
			on(WritebackEnded, "root", "step", "attempt"),
			on(WritebackClaim, "root", "step", "attempt")
		),
		contained(
			on(
				select(WritebackClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(WritebackEnded, "root", "step", "attempt")
		),
		contained(
			on(WritebackRetry, "root", "step", "attempt"),
			on(WritebackEnded, "root", "step", "attempt")
		),
		contained(
			on(WritebackFenced, "root", "step", "attempt"),
			on(WritebackEnded, "root", "step", "attempt")
		),
		contained(on(WritebackResult, "root", "step"), on(WritebackStep, "root", "step")),
		contained(
			on(WritebackHeld, "root", "step", "attempt"),
			on(WritebackClaim, "root", "step", "attempt")
		),
		contained(on(WritebackHeld, "root", "step"), on(WritebackResult, "root", "step")),
		contained(
			on(WritebackDone, "root", "step"),
			on(
				select(WritebackResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(WritebackFailed, "root", "step"),
			on(
				select(WritebackResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(WritebackRefusal, "root", "step"), on(WritebackFailed, "root", "step")),
		contained(on(WritebackExhausted, "root", "step"), on(WritebackFailed, "root", "step")),
		contained(
			on(
				select(WritebackRoot, (row) => row.eq(row.kind, "Writeback")),
				"root"
			),
			on(WritebackRequestedWith, "root")
		),
		contained(
			on(writeback_deliver_input_libhnkibecamc, "root", "step"),
			on(
				select(WritebackStep, (row) => row.eq(row.kind, "Deliver")),
				"root",
				"step"
			)
		),
		contained(
			on(writeback_writeback_input_ljafdhfgfeocc, "scope"),
			on(
				select(WritebackRoot, (row) => row.eq(row.kind, "Writeback")),
				"root"
			)
		),
		contained(
			on(writeback_deliver_output_ppecogpmgbpek, "root", "step"),
			on(writeback_deliver_input_libhnkibecamc, "root", "step")
		),
		contained(
			on(writeback_deliver_output_ppecogpmgbpek, "root", "step"),
			on(WritebackDone, "root", "step")
		),
		contained(
			on(writeback_writeback_finish_output_mhjodpondhejh, "root", "step"),
			on(WritebackDone, "root", "step")
		),
		contained(on(WritebackScope, "root"), on(WritebackRoot, "root")),
		mutable(WritebackScope),
		mutable(WritebackAdmitted),
		contained(on(WritebackSkipped, "root", "scope"), on(WritebackScope, "root", "scope")),
		mutable(WritebackSkipped),
		contained(on(WritebackStep, "root", "scope"), on(WritebackScope, "root", "scope")),
		mutable(WritebackStep),
		contained(on(WritebackStartStep, "root", "scope"), on(WritebackScope, "root", "scope")),
		mutable(WritebackStartStep),
		contained(on(WritebackFinish, "root", "scope"), on(WritebackScope, "root", "scope")),
		mutable(WritebackFinish),
		mutable(WritebackClaim),
		contained(on(WritebackEnded, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackEnded),
		contained(on(WritebackRetry, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackRetry),
		contained(on(WritebackFenced, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackFenced),
		mutable(WritebackResult),
		contained(on(WritebackDone, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackDone),
		contained(on(WritebackFailed, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackFailed),
		contained(on(WritebackHeld, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackHeld),
		contained(on(WritebackRefusal, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackRefusal),
		contained(on(WritebackExhausted, "root", "step"), on(WritebackStep, "root", "step")),
		mutable(WritebackExhausted),
		contained(
			on(writeback_deliver_input_libhnkibecamc, "root", "step"),
			on(WritebackStep, "root", "step")
		),
		mutable(writeback_deliver_input_libhnkibecamc),
		contained(
			on(writeback_writeback_input_ljafdhfgfeocc, "root", "scope"),
			on(WritebackScope, "root", "scope")
		),
		mutable(writeback_writeback_input_ljafdhfgfeocc),
		contained(
			on(writeback_deliver_output_ppecogpmgbpek, "root", "step"),
			on(WritebackStep, "root", "step")
		),
		mutable(writeback_deliver_output_ppecogpmgbpek),
		contained(
			on(writeback_writeback_finish_output_mhjodpondhejh, "root", "step"),
			on(WritebackStep, "root", "step")
		),
		mutable(writeback_writeback_finish_output_mhjodpondhejh)
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
	"writeback_deliver_output_ppecogpmgbpek",
	"writeback_writeback_finish_output_mhjodpondhejh"
] as const
