import {
	DenExclusive,
	DenHolder,
	DenInstant,
	DenScope,
	DenStep,
	Text
} from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Sync to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	key,
	natural,
	on,
	pg,
	pred,
	race,
	relation,
	select
} from "@bjornpagen/grizzle"

export const SyncKind = closed("SyncKind", ["Copy", "Build", "SyncRunFinish", "GoldFinish"])
export const SyncJoin = closed("SyncJoin", ["SyncRun", "Gold"])
export const SyncOutcome = closed("SyncOutcome", ["done", "failed"])
export const SyncPausable = closed("SyncPausable", ["SyncRun", "Gold"])

export const SyncScope = relation("SyncScope", { scope: DenScope, kind: closedId(SyncJoin) }, [
	"scope"
])
export const SyncRoot = relation("SyncRoot", { scope: DenScope, key: Text, at: DenInstant }, [
	"scope"
])
export const SyncWithin = relation("SyncWithin", { scope: DenScope, parent: DenScope }, ["scope"])
export const SyncExclusiveKey = relation(
	"SyncExclusiveKey",
	{ scope: DenScope, key: Text, id: DenExclusive },
	["scope"]
)
export const SyncAdmitted = relation("SyncAdmitted", { scope: DenScope }, ["scope"])
export const SyncSkipped = relation("SyncSkipped", { scope: DenScope, by: DenScope }, ["scope"])
export const SyncStep = relation(
	"SyncStep",
	{ step: DenStep, kind: closedId(SyncKind), scope: DenScope },
	["step"]
)
export const SyncStartStep = relation(
	"SyncStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep },
	["scope", "ordinal"]
)
export const SyncStartScope = relation(
	"SyncStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope },
	["scope", "ordinal"]
)
export const SyncFinish = relation("SyncFinish", { scope: DenScope, step: DenStep }, ["scope"])
export const SyncDue = relation("SyncDue", { step: DenStep, at: DenInstant }, ["step"])
export const SyncClaim = relation(
	"SyncClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const SyncRetry = relation(
	"SyncRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean },
	["step", "attempt"]
)
export const SyncResult = relation(
	"SyncResult",
	{ step: DenStep, outcome: closedId(SyncOutcome) },
	["step"]
)
export const SyncDone = relation("SyncDone", { step: DenStep }, ["step"])
export const SyncFailed = relation("SyncFailed", { step: DenStep }, ["step"])
export const SyncHeld = relation("SyncHeld", { step: DenStep, attempt: natural }, ["step"])
export const SyncRefusal = relation("SyncRefusal", { step: DenStep, law: Text }, ["step"])
export const SyncExhausted = relation("SyncExhausted", { step: DenStep, attempts: natural }, [
	"step"
])
export const SyncCopyInput = relation(
	"SyncCopyInput",
	{ step: DenStep, relation: Text, run: pg.bigint },
	["step"]
)
export const SyncBuildInput = relation("SyncBuildInput", { step: DenStep, build: pg.bigint }, [
	"step"
])
export const SyncSyncRunInput = relation(
	"SyncSyncRunInput",
	{ scope: DenScope, relation: Text, run: pg.bigint },
	["scope"]
)
export const SyncGoldInput = relation("SyncGoldInput", { scope: DenScope, build: pg.bigint }, [
	"scope"
])
export const SyncCopyOutput = relation("SyncCopyOutput", { step: DenStep, run: pg.bigint }, [
	"step"
])
export const SyncBuildOutput = relation("SyncBuildOutput", { step: DenStep, build: pg.bigint }, [
	"step"
])
export const SyncExclusive = relation(
	"SyncExclusive",
	{ kind: closedId(SyncJoin), key: DenExclusive, scope: DenScope },
	["kind", "key"]
)
export const SyncPaused = relation("SyncPaused", { target: closedId(SyncPausable) }, ["target"])

/** The flow's declarations, in order, its laws, and the den relations its app role `loader` holds and inserts into. */
export const syncFragment = Object.freeze({
	relations: [
		SyncKind,
		SyncJoin,
		SyncOutcome,
		SyncPausable,
		SyncScope,
		SyncRoot,
		SyncWithin,
		SyncExclusiveKey,
		SyncAdmitted,
		SyncSkipped,
		SyncStep,
		SyncStartStep,
		SyncStartScope,
		SyncFinish,
		SyncDue,
		SyncClaim,
		SyncRetry,
		SyncResult,
		SyncDone,
		SyncFailed,
		SyncHeld,
		SyncRefusal,
		SyncExhausted,
		SyncCopyInput,
		SyncBuildInput,
		SyncSyncRunInput,
		SyncGoldInput,
		SyncCopyOutput,
		SyncBuildOutput,
		SyncExclusive,
		SyncPaused
	] as const,
	laws: Object.freeze([
		contained(on(SyncExclusiveKey, "scope"), on(SyncScope, "scope")),
		contained(on(SyncRoot, "scope"), on(SyncScope, "scope")),
		contained(on(SyncWithin, "scope"), on(SyncScope, "scope")),
		contained(on(SyncWithin, "parent"), on(SyncScope, "scope")),
		contained(on(SyncAdmitted, "scope"), on(SyncScope, "scope")),
		contained(on(SyncSkipped, "scope"), on(SyncRoot, "scope")),
		contained(on(SyncSkipped, "by"), on(SyncAdmitted, "scope")),
		contained(on(SyncStep, "scope"), on(SyncAdmitted, "scope")),
		contained(on(SyncStartStep, "scope"), on(SyncAdmitted, "scope")),
		contained(on(SyncStartStep, "step"), on(SyncStep, "step")),
		key(on(SyncStartStep, "step")),
		contained(on(SyncStartScope, "scope"), on(SyncAdmitted, "scope")),
		contained(on(SyncStartScope, "child"), on(SyncScope, "scope")),
		key(on(SyncStartScope, "child")),
		contained(on(SyncFinish, "scope"), on(SyncAdmitted, "scope")),
		contained(on(SyncFinish, "step"), on(SyncStep, "step")),
		key(on(SyncFinish, "step")),
		contained(on(SyncDue, "step"), on(SyncStep, "step")),
		contained(on(SyncClaim, "step"), on(SyncStep, "step")),
		race(SyncClaim),
		check("AttemptFromOne", SyncClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(SyncClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(SyncClaim, "step", "attempt")
		),
		contained(on(SyncRetry, "step", "attempt"), on(SyncClaim, "step", "attempt")),
		contained(on(SyncResult, "step"), on(SyncStep, "step")),
		contained(on(SyncHeld, "step", "attempt"), on(SyncClaim, "step", "attempt")),
		contained(on(SyncHeld, "step"), on(SyncResult, "step")),
		contained(
			on(SyncDone, "step"),
			on(
				select(SyncResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(
			on(SyncFailed, "step"),
			on(
				select(SyncResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(on(SyncRefusal, "step"), on(SyncFailed, "step")),
		contained(on(SyncExhausted, "step"), on(SyncFailed, "step")),
		contained(
			on(SyncCopyInput, "step"),
			on(
				select(SyncStep, (row) => row.eq(row.kind, "Copy")),
				"step"
			)
		),
		contained(
			on(SyncBuildInput, "step"),
			on(
				select(SyncStep, (row) => row.eq(row.kind, "Build")),
				"step"
			)
		),
		contained(
			on(SyncSyncRunInput, "scope"),
			on(
				select(SyncScope, (row) => row.eq(row.kind, "SyncRun")),
				"scope"
			)
		),
		contained(
			on(SyncGoldInput, "scope"),
			on(
				select(SyncScope, (row) => row.eq(row.kind, "Gold")),
				"scope"
			)
		),
		contained(on(SyncCopyOutput, "step"), on(SyncCopyInput, "step")),
		contained(on(SyncCopyOutput, "step"), on(SyncDone, "step")),
		contained(on(SyncBuildOutput, "step"), on(SyncBuildInput, "step")),
		contained(on(SyncBuildOutput, "step"), on(SyncDone, "step"))
	]),
	writer: Object.freeze({
		relations: Object.freeze({
			SyncKind,
			SyncJoin,
			SyncOutcome,
			SyncPausable,
			SyncResult,
			SyncDone,
			SyncHeld,
			SyncCopyOutput,
			SyncBuildOutput
		}),
		insert: ["SyncResult", "SyncDone", "SyncHeld", "SyncCopyOutput", "SyncBuildOutput"] as const
	})
})
