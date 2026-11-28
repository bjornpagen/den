import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Sync to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"
import { BuildNumber } from "#integration/slice/relations.ts"

export const SyncKind = g.closed.unordered("SyncKind", [
	"Copy",
	"Build",
	"SyncRunFinish",
	"GoldFinish"
])
export const SyncRootKind = g.closed.unordered("SyncRootKind", ["SyncRun", "Gold"])
export const SyncOutcome = g.closed.unordered("SyncOutcome", ["done", "failed"])
export const SyncRetryWhy = g.closed.unordered("SyncRetryWhy", ["spent", "transient", "later"])
export const SyncPausable = g.closed.unordered("SyncPausable", ["SyncRun", "Gold"])

export const SyncScope = g.relation("SyncScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const SyncRoot = g.relation(
	"SyncRoot",
	{ root: g.sha256, kind: g.closedId(SyncRootKind), key: Text, at: DenInstant },
	["root"]
)
export const SyncRequestedWith = g.relation(
	"SyncRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const SyncExclusiveKey = g.relation(
	"SyncExclusiveKey",
	{ root: g.sha256, scope: g.sha256, key: Text, id: g.sha256 },
	["root", "scope"]
)
export const SyncAdmitted = g.relation("SyncAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const SyncSkipped = g.relation(
	"SyncSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const SyncStep = g.relation(
	"SyncStep",
	{ root: g.sha256, step: g.sha256, kind: g.closedId(SyncKind), scope: g.sha256, due: DenInstant },
	["root", "step"]
)
export const SyncStartStep = g.relation(
	"SyncStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const SyncFinish = g.relation(
	"SyncFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const SyncClaim = g.relation(
	"SyncClaim",
	{ root: g.sha256, step: g.sha256, attempt: g.place, until: DenInstant },
	["root", "step", "attempt"]
)
export const SyncEnded = g.relation(
	"SyncEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const SyncRetry = g.relation(
	"SyncRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(SyncRetryWhy)
	},
	["root", "step", "attempt"]
)
export const SyncFenced = g.relation(
	"SyncFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const SyncResult = g.relation(
	"SyncResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(SyncOutcome) },
	["root", "step"]
)
export const SyncDone = g.relation("SyncDone", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const SyncFailed = g.relation("SyncFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const SyncHeld = g.relation(
	"SyncHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const SyncRefusal = g.relation(
	"SyncRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const SyncExhausted = g.relation("SyncExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const SyncCopyInput = g
	.derivedName({ stem: "Sync", path: ["CopyInput"] })
	.relation("SyncCopyInput", { root: g.sha256, step: g.sha256, relation: Text, run: g.int8 }, [
		"root",
		"step"
	])
export const SyncBuildInput = g
	.derivedName({ stem: "Sync", path: ["BuildInput"] })
	.relation("SyncBuildInput", { root: g.sha256, step: g.sha256, build: BuildNumber }, [
		"root",
		"step"
	])
export const SyncSyncRunInput = g
	.derivedName({ stem: "Sync", path: ["SyncRunInput"] })
	.relation("SyncSyncRunInput", { root: g.sha256, scope: g.sha256, relation: Text, run: g.int8 }, [
		"root",
		"scope"
	])
export const SyncGoldInput = g
	.derivedName({ stem: "Sync", path: ["GoldInput"] })
	.relation("SyncGoldInput", { root: g.sha256, scope: g.sha256, build: BuildNumber }, [
		"root",
		"scope"
	])
export const SyncCopyOutput = g
	.derivedName({ stem: "Sync", path: ["CopyOutput"] })
	.relation("SyncCopyOutput", { root: g.sha256, step: g.sha256, run: g.int8 }, ["root", "step"])
export const SyncBuildOutput = g
	.derivedName({ stem: "Sync", path: ["BuildOutput"] })
	.relation("SyncBuildOutput", { root: g.sha256, step: g.sha256, build: BuildNumber }, [
		"root",
		"step"
	])
export const SyncSyncRunFinishOutput = g
	.derivedName({ stem: "Sync", path: ["SyncRunFinishOutput"] })
	.relation("SyncSyncRunFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const SyncGoldFinishOutput = g
	.derivedName({ stem: "Sync", path: ["GoldFinishOutput"] })
	.relation("SyncGoldFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const SyncExclusive = g.relation(
	"SyncExclusive",
	{ kind: g.closedId(SyncRootKind), key: g.sha256, turn: g.natural, scope: g.sha256 },
	["kind", "key", "turn"]
)
export const SyncReleased = g.relation(
	"SyncReleased",
	{ kind: g.closedId(SyncRootKind), key: g.sha256, turn: g.natural },
	["kind", "key", "turn"]
)
export const SyncPaused = g.relation(
	"SyncPaused",
	{ target: g.closedId(SyncPausable), turn: g.natural },
	["target", "turn"]
)
export const SyncResumed = g.relation(
	"SyncResumed",
	{ target: g.closedId(SyncPausable), turn: g.natural },
	["target", "turn"]
)
export const SyncServed = g.relation(
	"SyncServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const syncGraph = g.fragment(
	[
		SyncKind,
		SyncRootKind,
		SyncOutcome,
		SyncRetryWhy,
		SyncPausable,
		SyncScope,
		SyncRoot,
		SyncRequestedWith,
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
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(SyncScope, "scope")),
		g.key(g.on(SyncStep, "step")),
		g.contained(g.on(SyncExclusiveKey, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.contained(g.on(SyncAdmitted, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.contained(g.on(SyncSkipped, "scope"), g.on(SyncRoot, "root")),
		g.contained(g.on(SyncSkipped, "by"), g.on(SyncRoot, "root")),
		g.contained(g.on(SyncRequestedWith, "root"), g.on(SyncRoot, "root")),
		g.contained(g.on(SyncStep, "root", "scope"), g.on(SyncAdmitted, "root", "scope")),
		g.contained(g.on(SyncStartStep, "root", "scope"), g.on(SyncAdmitted, "root", "scope")),
		g.contained(g.on(SyncStartStep, "root", "step"), g.on(SyncStep, "root", "step")),
		g.key(g.on(SyncStartStep, "root", "step")),
		g.contained(g.on(SyncFinish, "root", "scope"), g.on(SyncAdmitted, "root", "scope")),
		g.contained(g.on(SyncFinish, "root", "step"), g.on(SyncStep, "root", "step")),
		g.key(g.on(SyncFinish, "root", "step")),
		g.contained(g.on(SyncClaim, "root", "step"), g.on(SyncStep, "root", "step")),
		g.contained(
			g.on(SyncEnded, "root", "step", "attempt"),
			g.on(SyncClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(SyncClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(SyncEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(SyncRetry, "root", "step", "attempt"),
			g.on(SyncEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(SyncFenced, "root", "step", "attempt"),
			g.on(SyncEnded, "root", "step", "attempt")
		),
		g.contained(g.on(SyncResult, "root", "step"), g.on(SyncStep, "root", "step")),
		g.contained(
			g.on(SyncHeld, "root", "step", "attempt"),
			g.on(SyncClaim, "root", "step", "attempt")
		),
		g.contained(g.on(SyncHeld, "root", "step"), g.on(SyncResult, "root", "step")),
		g.contained(
			g.on(SyncDone, "root", "step"),
			g.on(
				g.select(SyncResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(SyncFailed, "root", "step"),
			g.on(
				g.select(SyncResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(SyncRefusal, "root", "step"), g.on(SyncFailed, "root", "step")),
		g.contained(g.on(SyncExhausted, "root", "step"), g.on(SyncFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(SyncRoot, (row) => row.eq(row.kind, "SyncRun")),
				"root"
			),
			g.on(SyncRequestedWith, "root")
		),
		g.contained(
			g.on(
				g.select(SyncRoot, (row) => row.eq(row.kind, "Gold")),
				"root"
			),
			g.on(SyncRequestedWith, "root")
		),
		g.contained(
			g.on(SyncCopyInput, "root", "step"),
			g.on(
				g.select(SyncStep, (row) => row.eq(row.kind, "Copy")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(SyncBuildInput, "root", "step"),
			g.on(
				g.select(SyncStep, (row) => row.eq(row.kind, "Build")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(SyncSyncRunInput, "scope"),
			g.on(
				g.select(SyncRoot, (row) => row.eq(row.kind, "SyncRun")),
				"root"
			)
		),
		g.contained(
			g.on(SyncGoldInput, "scope"),
			g.on(
				g.select(SyncRoot, (row) => row.eq(row.kind, "Gold")),
				"root"
			)
		),
		g.contained(g.on(SyncCopyOutput, "root", "step"), g.on(SyncCopyInput, "root", "step")),
		g.contained(g.on(SyncCopyOutput, "root", "step"), g.on(SyncDone, "root", "step")),
		g.contained(g.on(SyncBuildOutput, "root", "step"), g.on(SyncBuildInput, "root", "step")),
		g.contained(g.on(SyncBuildOutput, "root", "step"), g.on(SyncDone, "root", "step")),
		g.contained(g.on(SyncSyncRunFinishOutput, "root", "step"), g.on(SyncDone, "root", "step")),
		g.contained(g.on(SyncGoldFinishOutput, "root", "step"), g.on(SyncDone, "root", "step")),
		g.contained(g.on(SyncScope, "root"), g.on(SyncRoot, "root")),
		g.mutable(SyncScope),
		g.mutable(SyncExclusiveKey),
		g.mutable(SyncAdmitted),
		g.contained(g.on(SyncSkipped, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.mutable(SyncSkipped),
		g.contained(g.on(SyncStep, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.mutable(SyncStep),
		g.contained(g.on(SyncStartStep, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.mutable(SyncStartStep),
		g.contained(g.on(SyncFinish, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.mutable(SyncFinish),
		g.mutable(SyncClaim),
		g.contained(g.on(SyncEnded, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncEnded),
		g.contained(g.on(SyncRetry, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncRetry),
		g.contained(g.on(SyncFenced, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncFenced),
		g.mutable(SyncResult),
		g.contained(g.on(SyncDone, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncDone),
		g.contained(g.on(SyncFailed, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncFailed),
		g.contained(g.on(SyncHeld, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncHeld),
		g.contained(g.on(SyncRefusal, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncRefusal),
		g.contained(g.on(SyncExhausted, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncExhausted),
		g.contained(g.on(SyncCopyInput, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncCopyInput),
		g.contained(g.on(SyncBuildInput, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncBuildInput),
		g.contained(g.on(SyncSyncRunInput, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.mutable(SyncSyncRunInput),
		g.contained(g.on(SyncGoldInput, "root", "scope"), g.on(SyncScope, "root", "scope")),
		g.mutable(SyncGoldInput),
		g.contained(g.on(SyncCopyOutput, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncCopyOutput),
		g.contained(g.on(SyncBuildOutput, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncBuildOutput),
		g.contained(g.on(SyncSyncRunFinishOutput, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncSyncRunFinishOutput),
		g.contained(g.on(SyncGoldFinishOutput, "root", "step"), g.on(SyncStep, "root", "step")),
		g.mutable(SyncGoldFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const syncCoordination = g.fragment(
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
		g.contained(
			g.on(SyncReleased, "kind", "key", "turn"),
			g.on(SyncExclusive, "kind", "key", "turn")
		),
		g.contained(
			g.on(SyncExclusive, "kind", "key", g.pred("turn")),
			g.on(SyncReleased, "kind", "key", "turn")
		),
		g.contained(g.on(SyncResumed, "target", "turn"), g.on(SyncPaused, "target", "turn")),
		g.contained(g.on(SyncPaused, "target", g.pred("turn")), g.on(SyncResumed, "target", "turn"))
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
