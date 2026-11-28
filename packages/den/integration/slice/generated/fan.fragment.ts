import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Fan to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"

export const FanKind = g.closed.unordered("FanKind", [
	"Square",
	"Dust",
	"Mop",
	"BatchFinish",
	"FanRunFinish",
	"SweepFinish",
	"WantedFinish"
])
export const FanRootKind = g.closed.unordered("FanRootKind", ["FanRun", "Sweep", "Wanted"])
export const FanChildKind = g.closed.unordered("FanChildKind", ["Batch"])
export const FanOutcome = g.closed.unordered("FanOutcome", ["done", "failed"])
export const FanRetryWhy = g.closed.unordered("FanRetryWhy", ["spent", "transient", "later"])
export const FanPausable = g.closed.unordered("FanPausable", [
	"Pool",
	"Vendor",
	"FanRun",
	"Sweep",
	"Wanted"
])
export const FanResource = g.closed.unordered("FanResource", ["Pool"])
const FanSeats = g.closed.relation(
	"FanSeats",
	{ resource: g.closedId(FanResource), seats: g.natural },
	["resource"],
	[{ resource: "Pool", seats: 2n }]
)

export const FanScope = g.relation("FanScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const FanRoot = g.relation(
	"FanRoot",
	{ root: g.sha256, kind: g.closedId(FanRootKind), key: Text, at: DenInstant },
	["root"]
)
export const FanRequestedWith = g.relation(
	"FanRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const FanWithin = g.relation(
	"FanWithin",
	{ root: g.sha256, scope: g.sha256, parent: g.sha256, kind: g.closedId(FanChildKind) },
	["root", "scope"]
)
export const FanExclusiveKey = g.relation(
	"FanExclusiveKey",
	{ root: g.sha256, scope: g.sha256, key: Text, id: g.sha256 },
	["root", "scope"]
)
export const FanAdmitted = g.relation("FanAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const FanSkipped = g.relation(
	"FanSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const FanStep = g.relation(
	"FanStep",
	{ root: g.sha256, step: g.sha256, kind: g.closedId(FanKind), scope: g.sha256, due: DenInstant },
	["root", "step"]
)
export const FanStartStep = g.relation(
	"FanStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const FanStartScope = g.relation(
	"FanStartScope",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, child: g.sha256 },
	["root", "scope", "ordinal"]
)
export const FanFinish = g.relation(
	"FanFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const FanClaim = g.relation(
	"FanClaim",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.place,
		until: DenInstant,
		holds: g.drawn(g.natural)
	},
	["root", "step", "attempt"]
)
export const FanEnded = g.relation(
	"FanEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const FanRetry = g.relation(
	"FanRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(FanRetryWhy)
	},
	["root", "step", "attempt"]
)
export const FanFenced = g.relation(
	"FanFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const FanResult = g.relation(
	"FanResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(FanOutcome) },
	["root", "step"]
)
export const FanDone = g.relation("FanDone", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const FanFailed = g.relation("FanFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const FanHeld = g.relation(
	"FanHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const FanRefusal = g.relation("FanRefusal", { root: g.sha256, step: g.sha256, law: Text }, [
	"root",
	"step"
])
export const FanExhausted = g.relation("FanExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const FanSquareInput = g
	.derivedName({ stem: "Fan", path: ["SquareInput"] })
	.relation("FanSquareInput", { root: g.sha256, step: g.sha256, batch: Text, n: g.int8 }, [
		"root",
		"step"
	])
export const FanDustInput = g
	.derivedName({ stem: "Fan", path: ["DustInput"] })
	.relation("FanDustInput", { root: g.sha256, step: g.sha256, sweep: Text }, ["root", "step"])
export const FanMopInput = g
	.derivedName({ stem: "Fan", path: ["MopInput"] })
	.relation("FanMopInput", { root: g.sha256, step: g.sha256, sweep: Text }, ["root", "step"])
export const FanBatchInput = g
	.derivedName({ stem: "Fan", path: ["BatchInput"] })
	.relation("FanBatchInput", { root: g.sha256, scope: g.sha256, batch: Text, size: g.int8 }, [
		"root",
		"scope"
	])
export const FanFanRunInput = g
	.derivedName({ stem: "Fan", path: ["FanRunInput"] })
	.relation("FanFanRunInput", { root: g.sha256, scope: g.sha256, batch: Text, size: g.int8 }, [
		"root",
		"scope"
	])
export const FanSweepInput = g
	.derivedName({ stem: "Fan", path: ["SweepInput"] })
	.relation("FanSweepInput", { root: g.sha256, scope: g.sha256, sweep: Text }, ["root", "scope"])
export const FanWantedInput = g
	.derivedName({ stem: "Fan", path: ["WantedInput"] })
	.relation("FanWantedInput", { root: g.sha256, scope: g.sha256, batch: Text, size: g.int8 }, [
		"root",
		"scope"
	])
export const FanWantedKey = g
	.derivedName({ stem: "Fan", path: ["WantedKey"] })
	.generated("FanWantedKey", { root: g.sha256, batch: Text }, ["root"], (row) => ({
		batchDigest: g.generated(g.sha256, g.Crypto.sha256(row.batch))
	}))
export const FanSquareOutput = g
	.derivedName({ stem: "Fan", path: ["SquareOutput"] })
	.relation("FanSquareOutput", { root: g.sha256, step: g.sha256, square: g.int8 }, ["root", "step"])
export const FanDustOutput = g
	.derivedName({ stem: "Fan", path: ["DustOutput"] })
	.relation("FanDustOutput", { root: g.sha256, step: g.sha256, sweep: Text }, ["root", "step"])
export const FanMopOutput = g
	.derivedName({ stem: "Fan", path: ["MopOutput"] })
	.relation("FanMopOutput", { root: g.sha256, step: g.sha256, sweep: Text }, ["root", "step"])
export const FanBatchFinishOutput = g
	.derivedName({ stem: "Fan", path: ["BatchFinishOutput"] })
	.relation("FanBatchFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const FanFanRunFinishOutput = g
	.derivedName({ stem: "Fan", path: ["FanRunFinishOutput"] })
	.relation("FanFanRunFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const FanSweepFinishOutput = g
	.derivedName({ stem: "Fan", path: ["SweepFinishOutput"] })
	.relation("FanSweepFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const FanWantedFinishOutput = g
	.derivedName({ stem: "Fan", path: ["WantedFinishOutput"] })
	.relation("FanWantedFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
const FanHold = g.relation(
	"FanHold",
	{
		resource: g.closedId(FanResource),
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: g.drawn(g.natural),
		seat: g.natural
	},
	["resource", "root", "step", "attempt"]
)
export const FanExclusive = g.relation(
	"FanExclusive",
	{ kind: g.closedId(FanRootKind), key: g.sha256, turn: g.natural, scope: g.sha256 },
	["kind", "key", "turn"]
)
export const FanReleased = g.relation(
	"FanReleased",
	{ kind: g.closedId(FanRootKind), key: g.sha256, turn: g.natural },
	["kind", "key", "turn"]
)
export const FanPaused = g.relation(
	"FanPaused",
	{ target: g.closedId(FanPausable), turn: g.natural },
	["target", "turn"]
)
export const FanResumed = g.relation(
	"FanResumed",
	{ target: g.closedId(FanPausable), turn: g.natural },
	["target", "turn"]
)
export const FanServed = g.relation(
	"FanServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const fanGraph = g.fragment(
	[
		FanKind,
		FanRootKind,
		FanChildKind,
		FanOutcome,
		FanRetryWhy,
		FanPausable,
		FanResource,
		FanScope,
		FanRoot,
		FanRequestedWith,
		FanWithin,
		FanExclusiveKey,
		FanAdmitted,
		FanSkipped,
		FanStep,
		FanStartStep,
		FanStartScope,
		FanFinish,
		FanClaim,
		FanEnded,
		FanRetry,
		FanFenced,
		FanResult,
		FanDone,
		FanFailed,
		FanHeld,
		FanRefusal,
		FanExhausted,
		FanSquareInput,
		FanDustInput,
		FanMopInput,
		FanBatchInput,
		FanFanRunInput,
		FanSweepInput,
		FanWantedInput,
		FanWantedKey,
		FanSquareOutput,
		FanDustOutput,
		FanMopOutput,
		FanBatchFinishOutput,
		FanFanRunFinishOutput,
		FanSweepFinishOutput,
		FanWantedFinishOutput,
		FanHold
	],
	[
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(FanScope, "scope")),
		g.key(g.on(FanStep, "step")),
		g.contained(g.on(FanExclusiveKey, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.contained(g.on(FanWithin, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.contained(g.on(FanWithin, "root", "parent"), g.on(FanScope, "root", "scope")),
		g.contained(g.on(FanStartScope, "root", "scope"), g.on(FanAdmitted, "root", "scope")),
		g.contained(g.on(FanStartScope, "root", "child"), g.on(FanScope, "root", "scope")),
		g.key(g.on(FanStartScope, "root", "child")),
		g.contained(g.on(FanAdmitted, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.contained(g.on(FanSkipped, "scope"), g.on(FanRoot, "root")),
		g.contained(g.on(FanSkipped, "by"), g.on(FanRoot, "root")),
		g.contained(g.on(FanRequestedWith, "root"), g.on(FanRoot, "root")),
		g.contained(g.on(FanStep, "root", "scope"), g.on(FanAdmitted, "root", "scope")),
		g.contained(g.on(FanStartStep, "root", "scope"), g.on(FanAdmitted, "root", "scope")),
		g.contained(g.on(FanStartStep, "root", "step"), g.on(FanStep, "root", "step")),
		g.key(g.on(FanStartStep, "root", "step")),
		g.contained(g.on(FanFinish, "root", "scope"), g.on(FanAdmitted, "root", "scope")),
		g.contained(g.on(FanFinish, "root", "step"), g.on(FanStep, "root", "step")),
		g.key(g.on(FanFinish, "root", "step")),
		g.contained(g.on(FanClaim, "root", "step"), g.on(FanStep, "root", "step")),
		g.contained(
			g.on(FanEnded, "root", "step", "attempt"),
			g.on(FanClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(FanClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(FanEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(FanRetry, "root", "step", "attempt"),
			g.on(FanEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(FanFenced, "root", "step", "attempt"),
			g.on(FanEnded, "root", "step", "attempt")
		),
		g.contained(g.on(FanResult, "root", "step"), g.on(FanStep, "root", "step")),
		g.contained(
			g.on(FanHeld, "root", "step", "attempt"),
			g.on(FanClaim, "root", "step", "attempt")
		),
		g.contained(g.on(FanHeld, "root", "step"), g.on(FanResult, "root", "step")),
		g.contained(
			g.on(FanDone, "root", "step"),
			g.on(
				g.select(FanResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(FanFailed, "root", "step"),
			g.on(
				g.select(FanResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(FanRefusal, "root", "step"), g.on(FanFailed, "root", "step")),
		g.contained(g.on(FanExhausted, "root", "step"), g.on(FanFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "FanRun")),
				"root"
			),
			g.on(FanRequestedWith, "root")
		),
		g.contained(
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "Sweep")),
				"root"
			),
			g.on(FanRequestedWith, "root")
		),
		g.contained(
			g.on(FanSquareInput, "root", "step"),
			g.on(
				g.select(FanStep, (row) => row.eq(row.kind, "Square")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(FanDustInput, "root", "step"),
			g.on(
				g.select(FanStep, (row) => row.eq(row.kind, "Dust")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(FanMopInput, "root", "step"),
			g.on(
				g.select(FanStep, (row) => row.eq(row.kind, "Mop")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(FanBatchInput, "root", "scope"),
			g.on(
				g.select(FanWithin, (row) => row.eq(row.kind, "Batch")),
				"root",
				"scope"
			)
		),
		g.contained(
			g.on(FanFanRunInput, "scope"),
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "FanRun")),
				"root"
			)
		),
		g.contained(
			g.on(FanSweepInput, "scope"),
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "Sweep")),
				"root"
			)
		),
		g.contained(
			g.on(FanWantedInput, "scope"),
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "Wanted")),
				"root"
			)
		),
		g.key(g.on(FanWantedKey, "batchDigest")),
		g.contained(
			g.on(FanWantedKey, "root"),
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "Wanted")),
				"root"
			)
		),
		g.contained(
			g.on(
				g.select(FanRoot, (row) => row.eq(row.kind, "Wanted")),
				"root"
			),
			g.on(FanWantedKey, "root")
		),
		g.contained(g.on(FanSquareOutput, "root", "step"), g.on(FanSquareInput, "root", "step")),
		g.contained(g.on(FanSquareOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.contained(g.on(FanDustOutput, "root", "step"), g.on(FanDustInput, "root", "step")),
		g.contained(g.on(FanDustOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.contained(g.on(FanMopOutput, "root", "step"), g.on(FanMopInput, "root", "step")),
		g.contained(g.on(FanMopOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.contained(g.on(FanBatchFinishOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.contained(g.on(FanFanRunFinishOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.contained(g.on(FanSweepFinishOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.contained(g.on(FanWantedFinishOutput, "root", "step"), g.on(FanDone, "root", "step")),
		g.unit("FanSeat", { resource: g.closedId(FanResource) }),
		g.ordered(g.on(FanHold, "root", "step", "attempt", "at"), g.fin(FanClaim, "holds")),
		g.mutable(FanHold),
		g.contained(g.on(FanScope, "root"), g.on(FanRoot, "root")),
		g.mutable(FanScope),
		g.mutable(FanWithin),
		g.mutable(FanExclusiveKey),
		g.mutable(FanAdmitted),
		g.contained(g.on(FanSkipped, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanSkipped),
		g.contained(g.on(FanStep, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanStep),
		g.contained(g.on(FanStartStep, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanStartStep),
		g.contained(g.on(FanStartScope, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanStartScope),
		g.contained(g.on(FanFinish, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanFinish),
		g.mutable(FanClaim),
		g.contained(g.on(FanEnded, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanEnded),
		g.contained(g.on(FanRetry, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanRetry),
		g.contained(g.on(FanFenced, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanFenced),
		g.mutable(FanResult),
		g.contained(g.on(FanDone, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanDone),
		g.contained(g.on(FanFailed, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanFailed),
		g.contained(g.on(FanHeld, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanHeld),
		g.contained(g.on(FanRefusal, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanRefusal),
		g.contained(g.on(FanExhausted, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanExhausted),
		g.contained(g.on(FanSquareInput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanSquareInput),
		g.contained(g.on(FanDustInput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanDustInput),
		g.contained(g.on(FanMopInput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanMopInput),
		g.contained(g.on(FanBatchInput, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanBatchInput),
		g.contained(g.on(FanFanRunInput, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanFanRunInput),
		g.contained(g.on(FanSweepInput, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanSweepInput),
		g.contained(g.on(FanWantedInput, "root", "scope"), g.on(FanScope, "root", "scope")),
		g.mutable(FanWantedInput),
		g.contained(g.on(FanSquareOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanSquareOutput),
		g.contained(g.on(FanDustOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanDustOutput),
		g.contained(g.on(FanMopOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanMopOutput),
		g.contained(g.on(FanBatchFinishOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanBatchFinishOutput),
		g.contained(g.on(FanFanRunFinishOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanFanRunFinishOutput),
		g.contained(g.on(FanSweepFinishOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanSweepFinishOutput),
		g.contained(g.on(FanWantedFinishOutput, "root", "step"), g.on(FanStep, "root", "step")),
		g.mutable(FanWantedFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const fanCoordination = g.fragment(
	[
		FanKind,
		FanRootKind,
		FanChildKind,
		FanOutcome,
		FanRetryWhy,
		FanPausable,
		FanResource,
		FanSeats,
		FanExclusive,
		FanReleased,
		FanPaused,
		FanResumed,
		FanServed
	],
	[
		g.contained(
			g.on(FanReleased, "kind", "key", "turn"),
			g.on(FanExclusive, "kind", "key", "turn")
		),
		g.contained(
			g.on(FanExclusive, "kind", "key", g.pred("turn")),
			g.on(FanReleased, "kind", "key", "turn")
		),
		g.contained(g.on(FanResumed, "target", "turn"), g.on(FanPaused, "target", "turn")),
		g.contained(g.on(FanPaused, "target", g.pred("turn")), g.on(FanResumed, "target", "turn"))
	]
)

/** The flow's live holds: each hold whose claim's attempt has neither ended nor held its step's result, with its claim's lease, which den's role reads as the seats' holders. */
const FanLive = g.derived(
	"FanLive",
	g.query(fanGraph).rule((r) => {
		const { step, root, attempt, resource, seat } = g.v(FanHold, "fanHold")
		const { until } = g.v(FanClaim, "fanClaim")
		return r
			.match(FanHold, { step, root, attempt, resource, seat })
			.match(FanClaim, { step, root, attempt, until })
			.where(r.not(FanEnded, { step, root, attempt }), r.not(FanHeld, { step, root, attempt }))
			.find({ resource, seat, step, root, attempt, until })
	})
)

/** The flow's seat level: its live holds, at most one a seat, each held below its resource's count. A fragment declares no derived relation, so the schema that lists `fanGraph` states these on a level over itself, `schema.extend([listing], name, [...fanSeatLevel.relations], [...fanSeatLevel.laws])`. */
export const fanSeatLevel = {
	relations: [FanLive],
	laws: [
		g.key(g.on(FanLive, "resource", "seat")),
		g.check("FanSeatBelowCount", FanLive, (row) =>
			row.lt(row.seat, FanSeats.at("seats", row.resource))
		)
	]
} as const

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const fanWriter = [
	"FanResult",
	"FanDone",
	"FanHeld",
	"FanSquareOutput",
	"FanDustOutput",
	"FanMopOutput",
	"FanBatchFinishOutput",
	"FanFanRunFinishOutput",
	"FanSweepFinishOutput",
	"FanWantedFinishOutput",
	"FanScope",
	"FanExclusiveKey",
	"FanWantedKey",
	"FanWantedInput",
	"FanRoot"
] as const
