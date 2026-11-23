import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Sync to; `den generate` writes it, and nothing edits it. */
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

export const SyncScope = relation("SyncScope", { root: sha256, scope: sha256 }, ["root", "scope"])
export const SyncRoot = relation(
	"SyncRoot",
	{ root: sha256, kind: closedId(SyncRootKind), key: Text, at: DenInstant },
	["root"]
)
export const SyncExclusiveKey = relation(
	"SyncExclusiveKey",
	{ root: sha256, scope: sha256, key: Text, id: sha256 },
	["root", "scope"]
)
export const SyncAdmitted = relation("SyncAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const SyncSkipped = relation("SyncSkipped", { root: sha256, scope: sha256, by: sha256 }, [
	"root",
	"scope"
])
export const SyncStep = relation(
	"SyncStep",
	{ root: sha256, step: sha256, kind: closedId(SyncKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const SyncStartStep = relation(
	"SyncStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const SyncFinish = relation("SyncFinish", { root: sha256, scope: sha256, step: sha256 }, [
	"root",
	"scope"
])
export const SyncClaim = relation(
	"SyncClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const SyncEnded = relation("SyncEnded", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const SyncRetry = relation(
	"SyncRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(SyncRetryWhy) },
	["root", "step", "attempt"]
)
export const SyncFenced = relation("SyncFenced", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const SyncResult = relation(
	"SyncResult",
	{ root: sha256, step: sha256, outcome: closedId(SyncOutcome) },
	["root", "step"]
)
export const SyncDone = relation("SyncDone", { root: sha256, step: sha256 }, ["root", "step"])
export const SyncFailed = relation("SyncFailed", { root: sha256, step: sha256 }, ["root", "step"])
export const SyncHeld = relation("SyncHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const SyncRefusal = relation("SyncRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const SyncExhausted = relation("SyncExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const SyncCopyInput = relation(
	"SyncCopyInput",
	{ root: sha256, step: sha256, relation: Text, run: pg.bigint },
	["root", "step"]
)
export const SyncBuildInput = relation(
	"SyncBuildInput",
	{ root: sha256, step: sha256, build: pg.bigint },
	["root", "step"]
)
export const SyncSyncRunInput = relation(
	"SyncSyncRunInput",
	{ root: sha256, scope: sha256, relation: Text, run: pg.bigint },
	["root", "scope"]
)
export const SyncGoldInput = relation(
	"SyncGoldInput",
	{ root: sha256, scope: sha256, build: pg.bigint },
	["root", "scope"]
)
export const SyncCopyOutput = relation(
	"SyncCopyOutput",
	{ root: sha256, step: sha256, run: pg.bigint },
	["root", "step"]
)
export const SyncBuildOutput = relation(
	"SyncBuildOutput",
	{ root: sha256, step: sha256, build: pg.bigint },
	["root", "step"]
)
export const SyncSyncRunFinishOutput = relation(
	"SyncSyncRunFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const SyncGoldFinishOutput = relation(
	"SyncGoldFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const SyncExclusive = relation(
	"SyncExclusive",
	{ kind: closedId(SyncRootKind), key: sha256, turn: natural, scope: sha256 },
	["kind", "key", "turn"]
)
export const SyncReleased = relation(
	"SyncReleased",
	{ kind: closedId(SyncRootKind), key: sha256, turn: natural },
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
export const SyncServed = relation(
	"SyncServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
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
		unit("DenRoot", { root: sha256 }),
		contained(on(SyncExclusiveKey, "root", "scope"), on(SyncScope, "root", "scope")),
		contained(on(SyncAdmitted, "root", "scope"), on(SyncScope, "root", "scope")),
		contained(on(SyncSkipped, "scope"), on(SyncRoot, "root")),
		contained(on(SyncSkipped, "by"), on(SyncRoot, "root")),
		contained(on(SyncStep, "root", "scope"), on(SyncAdmitted, "root", "scope")),
		contained(on(SyncStartStep, "root", "scope"), on(SyncAdmitted, "root", "scope")),
		contained(on(SyncStartStep, "root", "step"), on(SyncStep, "root", "step")),
		key(on(SyncStartStep, "root", "step")),
		contained(on(SyncFinish, "root", "scope"), on(SyncAdmitted, "root", "scope")),
		contained(on(SyncFinish, "root", "step"), on(SyncStep, "root", "step")),
		key(on(SyncFinish, "root", "step")),
		contained(on(SyncClaim, "root", "step"), on(SyncStep, "root", "step")),
		contained(on(SyncEnded, "root", "step", "attempt"), on(SyncClaim, "root", "step", "attempt")),
		contained(
			on(
				select(SyncClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(SyncEnded, "root", "step", "attempt")
		),
		contained(on(SyncRetry, "root", "step", "attempt"), on(SyncEnded, "root", "step", "attempt")),
		contained(on(SyncFenced, "root", "step", "attempt"), on(SyncEnded, "root", "step", "attempt")),
		contained(on(SyncResult, "root", "step"), on(SyncStep, "root", "step")),
		contained(on(SyncHeld, "root", "step", "attempt"), on(SyncClaim, "root", "step", "attempt")),
		contained(on(SyncHeld, "root", "step"), on(SyncResult, "root", "step")),
		contained(
			on(SyncDone, "root", "step"),
			on(
				select(SyncResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(SyncFailed, "root", "step"),
			on(
				select(SyncResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(SyncRefusal, "root", "step"), on(SyncFailed, "root", "step")),
		contained(on(SyncExhausted, "root", "step"), on(SyncFailed, "root", "step")),
		contained(
			on(SyncCopyInput, "root", "step"),
			on(
				select(SyncStep, (row) => row.eq(row.kind, "Copy")),
				"root",
				"step"
			)
		),
		contained(
			on(SyncBuildInput, "root", "step"),
			on(
				select(SyncStep, (row) => row.eq(row.kind, "Build")),
				"root",
				"step"
			)
		),
		contained(
			on(SyncSyncRunInput, "scope"),
			on(
				select(SyncRoot, (row) => row.eq(row.kind, "SyncRun")),
				"root"
			)
		),
		contained(
			on(SyncGoldInput, "scope"),
			on(
				select(SyncRoot, (row) => row.eq(row.kind, "Gold")),
				"root"
			)
		),
		contained(on(SyncCopyOutput, "root", "step"), on(SyncCopyInput, "root", "step")),
		contained(on(SyncCopyOutput, "root", "step"), on(SyncDone, "root", "step")),
		contained(on(SyncBuildOutput, "root", "step"), on(SyncBuildInput, "root", "step")),
		contained(on(SyncBuildOutput, "root", "step"), on(SyncDone, "root", "step")),
		contained(on(SyncSyncRunFinishOutput, "root", "step"), on(SyncDone, "root", "step")),
		contained(on(SyncGoldFinishOutput, "root", "step"), on(SyncDone, "root", "step")),
		contained(on(SyncScope, "root"), on(SyncRoot, "root")),
		mutable(SyncScope),
		contained(on(SyncExclusiveKey, "root"), on(SyncRoot, "root")),
		mutable(SyncExclusiveKey),
		contained(on(SyncAdmitted, "root"), on(SyncRoot, "root")),
		mutable(SyncAdmitted),
		contained(on(SyncSkipped, "root"), on(SyncRoot, "root")),
		mutable(SyncSkipped),
		contained(on(SyncStep, "root"), on(SyncRoot, "root")),
		mutable(SyncStep),
		contained(on(SyncStartStep, "root"), on(SyncRoot, "root")),
		mutable(SyncStartStep),
		contained(on(SyncFinish, "root"), on(SyncRoot, "root")),
		mutable(SyncFinish),
		contained(on(SyncClaim, "root"), on(SyncRoot, "root")),
		mutable(SyncClaim),
		contained(on(SyncEnded, "root"), on(SyncRoot, "root")),
		mutable(SyncEnded),
		contained(on(SyncRetry, "root"), on(SyncRoot, "root")),
		mutable(SyncRetry),
		contained(on(SyncFenced, "root"), on(SyncRoot, "root")),
		mutable(SyncFenced),
		contained(on(SyncResult, "root"), on(SyncRoot, "root")),
		mutable(SyncResult),
		contained(on(SyncDone, "root"), on(SyncRoot, "root")),
		mutable(SyncDone),
		contained(on(SyncFailed, "root"), on(SyncRoot, "root")),
		mutable(SyncFailed),
		contained(on(SyncHeld, "root"), on(SyncRoot, "root")),
		mutable(SyncHeld),
		contained(on(SyncRefusal, "root"), on(SyncRoot, "root")),
		mutable(SyncRefusal),
		contained(on(SyncExhausted, "root"), on(SyncRoot, "root")),
		mutable(SyncExhausted),
		contained(on(SyncCopyInput, "root"), on(SyncRoot, "root")),
		mutable(SyncCopyInput),
		contained(on(SyncBuildInput, "root"), on(SyncRoot, "root")),
		mutable(SyncBuildInput),
		contained(on(SyncSyncRunInput, "root"), on(SyncRoot, "root")),
		mutable(SyncSyncRunInput),
		contained(on(SyncGoldInput, "root"), on(SyncRoot, "root")),
		mutable(SyncGoldInput),
		contained(on(SyncCopyOutput, "root"), on(SyncRoot, "root")),
		mutable(SyncCopyOutput),
		contained(on(SyncBuildOutput, "root"), on(SyncRoot, "root")),
		mutable(SyncBuildOutput),
		contained(on(SyncSyncRunFinishOutput, "root"), on(SyncRoot, "root")),
		mutable(SyncSyncRunFinishOutput),
		contained(on(SyncGoldFinishOutput, "root"), on(SyncRoot, "root")),
		mutable(SyncGoldFinishOutput)
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
		SyncResumed,
		SyncServed
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
