import { DenExclusive, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Sync to; `den generate` writes it, and nothing edits it. */
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

export const SyncKind = closed.unordered("SyncKind", [
	"Copy",
	"Build",
	"SyncRunFinish",
	"GoldFinish"
])
export const SyncRootKind = closed.unordered("SyncRootKind", ["SyncRun", "Gold"])
export const SyncOutcome = closed.unordered("SyncOutcome", ["done", "failed"])
export const SyncRetryWhy = closed.unordered("SyncRetryWhy", ["spent", "transient", "later"])
export const SyncPausable = closed.unordered("SyncPausable", ["SyncRun", "Gold"])

export const SyncScope = relation("SyncScope", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const SyncRoot = relation(
	"SyncRoot",
	{ scope: DenScope, kind: closedId(SyncRootKind), key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const SyncExclusiveKey = relation(
	"SyncExclusiveKey",
	{ scope: DenScope, key: Text, id: DenExclusive, root: DenScope },
	["scope", "root"]
)
export const SyncAdmitted = relation("SyncAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const SyncSkipped = relation(
	"SyncSkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const SyncStep = relation(
	"SyncStep",
	{ step: DenStep, kind: closedId(SyncKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const SyncStartStep = relation(
	"SyncStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const SyncFinish = relation(
	"SyncFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const SyncClaim = relation(
	"SyncClaim",
	{ step: DenStep, attempt: place, until: DenInstant, root: DenScope },
	["step", "root", "attempt"]
)
export const SyncEnded = relation(
	"SyncEnded",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const SyncRetry = relation(
	"SyncRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, why: closedId(SyncRetryWhy), root: DenScope },
	["step", "attempt", "root"]
)
export const SyncFenced = relation(
	"SyncFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const SyncResult = relation(
	"SyncResult",
	{ step: DenStep, outcome: closedId(SyncOutcome), root: DenScope },
	["step", "root"]
)
export const SyncDone = relation("SyncDone", { step: DenStep, root: DenScope }, ["step", "root"])
export const SyncFailed = relation("SyncFailed", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const SyncHeld = relation("SyncHeld", { step: DenStep, attempt: natural, root: DenScope }, [
	"step",
	"root"
])
export const SyncRefusal = relation("SyncRefusal", { step: DenStep, law: Text, root: DenScope }, [
	"step",
	"root"
])
export const SyncExhausted = relation("SyncExhausted", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const SyncCopyInput = relation(
	"SyncCopyInput",
	{ step: DenStep, relation: Text, run: pg.bigint, root: DenScope },
	["step", "root"]
)
export const SyncBuildInput = relation(
	"SyncBuildInput",
	{ step: DenStep, build: pg.bigint, root: DenScope },
	["step", "root"]
)
export const SyncSyncRunInput = relation(
	"SyncSyncRunInput",
	{ scope: DenScope, relation: Text, run: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const SyncGoldInput = relation(
	"SyncGoldInput",
	{ scope: DenScope, build: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const SyncCopyOutput = relation(
	"SyncCopyOutput",
	{ step: DenStep, run: pg.bigint, root: DenScope },
	["step", "root"]
)
export const SyncBuildOutput = relation(
	"SyncBuildOutput",
	{ step: DenStep, build: pg.bigint, root: DenScope },
	["step", "root"]
)
export const SyncSyncRunFinishOutput = relation(
	"SyncSyncRunFinishOutput",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const SyncGoldFinishOutput = relation(
	"SyncGoldFinishOutput",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const SyncExclusive = relation(
	"SyncExclusive",
	{ kind: closedId(SyncRootKind), key: DenExclusive, turn: natural, scope: DenScope },
	["kind", "key", "turn"]
)
export const SyncReleased = relation(
	"SyncReleased",
	{ kind: closedId(SyncRootKind), key: DenExclusive, turn: natural },
	["kind", "key", "turn"]
)
export const SyncPaused = relation(
	"SyncPaused",
	{ target: closedId(SyncPausable), turn: natural },
	["target", "turn"]
)
export const SyncResumed = relation(
	"SyncResumed",
	{ target: closedId(SyncPausable), turn: natural },
	["target", "turn"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const syncGraph = fragment(
	[
		SyncKind,
		SyncRootKind,
		SyncOutcome,
		SyncRetryWhy,
		SyncPausable,
		SyncScope,
		SyncRoot,
		SyncExclusiveKey,
		SyncAdmitted,
		SyncSkipped,
		SyncStep,
		SyncStartStep,
		SyncFinish,
		SyncClaim,
		SyncEnded,
		SyncRetry,
		SyncFenced,
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
		SyncSyncRunFinishOutput,
		SyncGoldFinishOutput
	],
	[
		contained(on(SyncExclusiveKey, "scope", "root"), on(SyncScope, "scope", "root")),
		contained(on(SyncAdmitted, "scope", "root"), on(SyncScope, "scope", "root")),
		contained(on(SyncSkipped, "scope"), on(SyncRoot, "scope")),
		contained(on(SyncSkipped, "by"), on(SyncRoot, "scope")),
		contained(on(SyncStep, "scope", "root"), on(SyncAdmitted, "scope", "root")),
		contained(on(SyncStartStep, "scope", "root"), on(SyncAdmitted, "scope", "root")),
		contained(on(SyncStartStep, "step", "root"), on(SyncStep, "step", "root")),
		key(on(SyncStartStep, "step", "root")),
		contained(on(SyncFinish, "scope", "root"), on(SyncAdmitted, "scope", "root")),
		contained(on(SyncFinish, "step", "root"), on(SyncStep, "step", "root")),
		key(on(SyncFinish, "step", "root")),
		contained(on(SyncClaim, "step", "root"), on(SyncStep, "step", "root")),
		contained(on(SyncEnded, "step", "attempt", "root"), on(SyncClaim, "step", "attempt", "root")),
		contained(
			on(
				select(SyncClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(SyncEnded, "step", "attempt", "root")
		),
		contained(on(SyncRetry, "step", "attempt", "root"), on(SyncEnded, "step", "attempt", "root")),
		contained(on(SyncFenced, "step", "attempt", "root"), on(SyncEnded, "step", "attempt", "root")),
		contained(on(SyncResult, "step", "root"), on(SyncStep, "step", "root")),
		contained(on(SyncHeld, "step", "attempt", "root"), on(SyncClaim, "step", "attempt", "root")),
		contained(on(SyncHeld, "step", "root"), on(SyncResult, "step", "root")),
		contained(
			on(SyncDone, "step", "root"),
			on(
				select(SyncResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(SyncFailed, "step", "root"),
			on(
				select(SyncResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(SyncRefusal, "step", "root"), on(SyncFailed, "step", "root")),
		contained(on(SyncExhausted, "step", "root"), on(SyncFailed, "step", "root")),
		contained(
			on(SyncCopyInput, "step", "root"),
			on(
				select(SyncStep, (row) => row.eq(row.kind, "Copy")),
				"step",
				"root"
			)
		),
		contained(
			on(SyncBuildInput, "step", "root"),
			on(
				select(SyncStep, (row) => row.eq(row.kind, "Build")),
				"step",
				"root"
			)
		),
		contained(
			on(SyncSyncRunInput, "scope"),
			on(
				select(SyncRoot, (row) => row.eq(row.kind, "SyncRun")),
				"scope"
			)
		),
		contained(
			on(SyncGoldInput, "scope"),
			on(
				select(SyncRoot, (row) => row.eq(row.kind, "Gold")),
				"scope"
			)
		),
		contained(on(SyncCopyOutput, "step", "root"), on(SyncCopyInput, "step", "root")),
		contained(on(SyncCopyOutput, "step", "root"), on(SyncDone, "step", "root")),
		contained(on(SyncBuildOutput, "step", "root"), on(SyncBuildInput, "step", "root")),
		contained(on(SyncBuildOutput, "step", "root"), on(SyncDone, "step", "root")),
		contained(on(SyncSyncRunFinishOutput, "step", "root"), on(SyncDone, "step", "root")),
		contained(on(SyncGoldFinishOutput, "step", "root"), on(SyncDone, "step", "root")),
		retirable(SyncRoot, [
			on(SyncScope, "root"),
			on(SyncExclusiveKey, "root"),
			on(SyncAdmitted, "root"),
			on(SyncSkipped, "root"),
			on(SyncStep, "root"),
			on(SyncStartStep, "root"),
			on(SyncFinish, "root"),
			on(SyncClaim, "root"),
			on(SyncEnded, "root"),
			on(SyncRetry, "root"),
			on(SyncFenced, "root"),
			on(SyncResult, "root"),
			on(SyncDone, "root"),
			on(SyncFailed, "root"),
			on(SyncHeld, "root"),
			on(SyncRefusal, "root"),
			on(SyncExhausted, "root"),
			on(SyncCopyInput, "root"),
			on(SyncBuildInput, "root"),
			on(SyncSyncRunInput, "root"),
			on(SyncGoldInput, "root"),
			on(SyncCopyOutput, "root"),
			on(SyncBuildOutput, "root"),
			on(SyncSyncRunFinishOutput, "root"),
			on(SyncGoldFinishOutput, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const syncCoordination = fragment(
	[
		SyncKind,
		SyncRootKind,
		SyncOutcome,
		SyncRetryWhy,
		SyncPausable,
		SyncExclusive,
		SyncReleased,
		SyncPaused,
		SyncResumed
	],
	[
		contained(on(SyncReleased, "kind", "key", "turn"), on(SyncExclusive, "kind", "key", "turn")),
		contained(
			on(SyncExclusive, "kind", "key", pred("turn")),
			on(SyncReleased, "kind", "key", "turn")
		),
		contained(on(SyncResumed, "target", "turn"), on(SyncPaused, "target", "turn")),
		contained(on(SyncPaused, "target", pred("turn")), on(SyncResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const syncWriter = [
	"SyncResult",
	"SyncDone",
	"SyncHeld",
	"SyncCopyOutput",
	"SyncBuildOutput",
	"SyncSyncRunFinishOutput",
	"SyncGoldFinishOutput"
] as const
