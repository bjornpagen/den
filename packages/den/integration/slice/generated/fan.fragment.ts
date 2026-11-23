import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Fan to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	derived,
	drawn,
	fin,
	fragment,
	key,
	mutable,
	natural,
	on,
	ordered,
	place,
	pg,
	pred,
	query,
	relation,
	select,
	sha256,
	unit,
	v
} from "@bjornpagen/grizzle"

export const FanKind = closed.unordered("FanKind", [
	"Square",
	"Dust",
	"Mop",
	"BatchFinish",
	"FanRunFinish",
	"SweepFinish"
])
export const FanRootKind = closed.unordered("FanRootKind", ["FanRun", "Sweep"])
export const FanChildKind = closed.unordered("FanChildKind", ["Batch"])
export const FanOutcome = closed.unordered("FanOutcome", ["done", "failed"])
export const FanRetryWhy = closed.unordered("FanRetryWhy", ["spent", "transient", "later"])
export const FanPausable = closed.unordered("FanPausable", ["Pool", "Vendor", "FanRun", "Sweep"])
export const FanResource = closed.unordered("FanResource", ["Pool"])
const FanSeats = closed.relation(
	"FanSeats",
	{ resource: closedId(FanResource), seats: natural },
	["resource"],
	[{ resource: "Pool", seats: 2n }]
)

export const FanScope = relation("FanScope", { root: sha256, scope: sha256 }, ["root", "scope"])
export const FanRoot = relation(
	"FanRoot",
	{ root: sha256, kind: closedId(FanRootKind), key: Text, at: DenInstant },
	["root"]
)
export const FanWithin = relation(
	"FanWithin",
	{ root: sha256, scope: sha256, parent: sha256, kind: closedId(FanChildKind) },
	["root", "scope"]
)
export const FanAdmitted = relation("FanAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const FanSkipped = relation("FanSkipped", { root: sha256, scope: sha256, by: sha256 }, [
	"root",
	"scope"
])
export const FanStep = relation(
	"FanStep",
	{ root: sha256, step: sha256, kind: closedId(FanKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const FanStartStep = relation(
	"FanStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const FanStartScope = relation(
	"FanStartScope",
	{ root: sha256, scope: sha256, ordinal: natural, child: sha256 },
	["root", "scope", "ordinal"]
)
export const FanFinish = relation("FanFinish", { root: sha256, scope: sha256, step: sha256 }, [
	"root",
	"scope"
])
export const FanClaim = relation(
	"FanClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant, holds: drawn(natural) },
	["root", "step", "attempt"]
)
export const FanEnded = relation("FanEnded", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const FanRetry = relation(
	"FanRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(FanRetryWhy) },
	["root", "step", "attempt"]
)
export const FanFenced = relation("FanFenced", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const FanResult = relation(
	"FanResult",
	{ root: sha256, step: sha256, outcome: closedId(FanOutcome) },
	["root", "step"]
)
export const FanDone = relation("FanDone", { root: sha256, step: sha256 }, ["root", "step"])
export const FanFailed = relation("FanFailed", { root: sha256, step: sha256 }, ["root", "step"])
export const FanHeld = relation("FanHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const FanRefusal = relation("FanRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const FanExhausted = relation("FanExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const FanSquareInput = relation(
	"FanSquareInput",
	{ root: sha256, step: sha256, batch: Text, n: pg.bigint },
	["root", "step"]
)
export const FanDustInput = relation("FanDustInput", { root: sha256, step: sha256, sweep: Text }, [
	"root",
	"step"
])
export const FanMopInput = relation("FanMopInput", { root: sha256, step: sha256, sweep: Text }, [
	"root",
	"step"
])
export const FanBatchInput = relation(
	"FanBatchInput",
	{ root: sha256, scope: sha256, batch: Text, size: pg.bigint },
	["root", "scope"]
)
export const FanFanRunInput = relation(
	"FanFanRunInput",
	{ root: sha256, scope: sha256, batch: Text, size: pg.bigint },
	["root", "scope"]
)
export const FanSweepInput = relation(
	"FanSweepInput",
	{ root: sha256, scope: sha256, sweep: Text },
	["root", "scope"]
)
export const FanSquareOutput = relation(
	"FanSquareOutput",
	{ root: sha256, step: sha256, square: pg.bigint },
	["root", "step"]
)
export const FanDustOutput = relation(
	"FanDustOutput",
	{ root: sha256, step: sha256, sweep: Text },
	["root", "step"]
)
export const FanMopOutput = relation("FanMopOutput", { root: sha256, step: sha256, sweep: Text }, [
	"root",
	"step"
])
export const FanBatchFinishOutput = relation(
	"FanBatchFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const FanFanRunFinishOutput = relation(
	"FanFanRunFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const FanSweepFinishOutput = relation(
	"FanSweepFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
const FanHold = relation(
	"FanHold",
	{
		resource: closedId(FanResource),
		root: sha256,
		step: sha256,
		attempt: natural,
		at: drawn(natural),
		seat: natural
	},
	["resource", "root", "step", "attempt"]
)
export const FanPaused = relation("FanPaused", { target: closedId(FanPausable), turn: natural }, [
	"target",
	"turn"
])
export const FanResumed = relation("FanResumed", { target: closedId(FanPausable), turn: natural }, [
	"target",
	"turn"
])
export const FanServed = relation(
	"FanServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const fanGraph = fragment(
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
		FanWithin,
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
		FanSquareOutput,
		FanDustOutput,
		FanMopOutput,
		FanBatchFinishOutput,
		FanFanRunFinishOutput,
		FanSweepFinishOutput,
		FanHold
	],
	[
		unit("DenRoot", { root: sha256 }),
		contained(on(FanWithin, "root", "scope"), on(FanScope, "root", "scope")),
		contained(on(FanWithin, "root", "parent"), on(FanScope, "root", "scope")),
		contained(on(FanStartScope, "root", "scope"), on(FanAdmitted, "root", "scope")),
		contained(on(FanStartScope, "root", "child"), on(FanScope, "root", "scope")),
		key(on(FanStartScope, "root", "child")),
		contained(on(FanAdmitted, "root", "scope"), on(FanScope, "root", "scope")),
		contained(on(FanSkipped, "scope"), on(FanRoot, "root")),
		contained(on(FanSkipped, "by"), on(FanRoot, "root")),
		contained(on(FanStep, "root", "scope"), on(FanAdmitted, "root", "scope")),
		contained(on(FanStartStep, "root", "scope"), on(FanAdmitted, "root", "scope")),
		contained(on(FanStartStep, "root", "step"), on(FanStep, "root", "step")),
		key(on(FanStartStep, "root", "step")),
		contained(on(FanFinish, "root", "scope"), on(FanAdmitted, "root", "scope")),
		contained(on(FanFinish, "root", "step"), on(FanStep, "root", "step")),
		key(on(FanFinish, "root", "step")),
		contained(on(FanClaim, "root", "step"), on(FanStep, "root", "step")),
		contained(on(FanEnded, "root", "step", "attempt"), on(FanClaim, "root", "step", "attempt")),
		contained(
			on(
				select(FanClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(FanEnded, "root", "step", "attempt")
		),
		contained(on(FanRetry, "root", "step", "attempt"), on(FanEnded, "root", "step", "attempt")),
		contained(on(FanFenced, "root", "step", "attempt"), on(FanEnded, "root", "step", "attempt")),
		contained(on(FanResult, "root", "step"), on(FanStep, "root", "step")),
		contained(on(FanHeld, "root", "step", "attempt"), on(FanClaim, "root", "step", "attempt")),
		contained(on(FanHeld, "root", "step"), on(FanResult, "root", "step")),
		contained(
			on(FanDone, "root", "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(FanFailed, "root", "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(FanRefusal, "root", "step"), on(FanFailed, "root", "step")),
		contained(on(FanExhausted, "root", "step"), on(FanFailed, "root", "step")),
		contained(
			on(FanSquareInput, "root", "step"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Square")),
				"root",
				"step"
			)
		),
		contained(
			on(FanDustInput, "root", "step"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Dust")),
				"root",
				"step"
			)
		),
		contained(
			on(FanMopInput, "root", "step"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Mop")),
				"root",
				"step"
			)
		),
		contained(
			on(FanBatchInput, "root", "scope"),
			on(
				select(FanWithin, (row) => row.eq(row.kind, "Batch")),
				"root",
				"scope"
			)
		),
		contained(
			on(FanFanRunInput, "scope"),
			on(
				select(FanRoot, (row) => row.eq(row.kind, "FanRun")),
				"root"
			)
		),
		contained(
			on(FanSweepInput, "scope"),
			on(
				select(FanRoot, (row) => row.eq(row.kind, "Sweep")),
				"root"
			)
		),
		contained(on(FanSquareOutput, "root", "step"), on(FanSquareInput, "root", "step")),
		contained(on(FanSquareOutput, "root", "step"), on(FanDone, "root", "step")),
		contained(on(FanDustOutput, "root", "step"), on(FanDustInput, "root", "step")),
		contained(on(FanDustOutput, "root", "step"), on(FanDone, "root", "step")),
		contained(on(FanMopOutput, "root", "step"), on(FanMopInput, "root", "step")),
		contained(on(FanMopOutput, "root", "step"), on(FanDone, "root", "step")),
		contained(on(FanBatchFinishOutput, "root", "step"), on(FanDone, "root", "step")),
		contained(on(FanFanRunFinishOutput, "root", "step"), on(FanDone, "root", "step")),
		contained(on(FanSweepFinishOutput, "root", "step"), on(FanDone, "root", "step")),
		unit("FanSeat", { resource: closedId(FanResource) }),
		ordered(on(FanHold, "root", "step", "attempt", "at"), fin(FanClaim, "holds")),
		mutable(FanHold),
		contained(on(FanScope, "root"), on(FanRoot, "root")),
		mutable(FanScope),
		contained(on(FanWithin, "root"), on(FanRoot, "root")),
		mutable(FanWithin),
		contained(on(FanAdmitted, "root"), on(FanRoot, "root")),
		mutable(FanAdmitted),
		contained(on(FanSkipped, "root"), on(FanRoot, "root")),
		mutable(FanSkipped),
		contained(on(FanStep, "root"), on(FanRoot, "root")),
		mutable(FanStep),
		contained(on(FanStartStep, "root"), on(FanRoot, "root")),
		mutable(FanStartStep),
		contained(on(FanStartScope, "root"), on(FanRoot, "root")),
		mutable(FanStartScope),
		contained(on(FanFinish, "root"), on(FanRoot, "root")),
		mutable(FanFinish),
		contained(on(FanClaim, "root"), on(FanRoot, "root")),
		mutable(FanClaim),
		contained(on(FanEnded, "root"), on(FanRoot, "root")),
		mutable(FanEnded),
		contained(on(FanRetry, "root"), on(FanRoot, "root")),
		mutable(FanRetry),
		contained(on(FanFenced, "root"), on(FanRoot, "root")),
		mutable(FanFenced),
		contained(on(FanResult, "root"), on(FanRoot, "root")),
		mutable(FanResult),
		contained(on(FanDone, "root"), on(FanRoot, "root")),
		mutable(FanDone),
		contained(on(FanFailed, "root"), on(FanRoot, "root")),
		mutable(FanFailed),
		contained(on(FanHeld, "root"), on(FanRoot, "root")),
		mutable(FanHeld),
		contained(on(FanRefusal, "root"), on(FanRoot, "root")),
		mutable(FanRefusal),
		contained(on(FanExhausted, "root"), on(FanRoot, "root")),
		mutable(FanExhausted),
		contained(on(FanSquareInput, "root"), on(FanRoot, "root")),
		mutable(FanSquareInput),
		contained(on(FanDustInput, "root"), on(FanRoot, "root")),
		mutable(FanDustInput),
		contained(on(FanMopInput, "root"), on(FanRoot, "root")),
		mutable(FanMopInput),
		contained(on(FanBatchInput, "root"), on(FanRoot, "root")),
		mutable(FanBatchInput),
		contained(on(FanFanRunInput, "root"), on(FanRoot, "root")),
		mutable(FanFanRunInput),
		contained(on(FanSweepInput, "root"), on(FanRoot, "root")),
		mutable(FanSweepInput),
		contained(on(FanSquareOutput, "root"), on(FanRoot, "root")),
		mutable(FanSquareOutput),
		contained(on(FanDustOutput, "root"), on(FanRoot, "root")),
		mutable(FanDustOutput),
		contained(on(FanMopOutput, "root"), on(FanRoot, "root")),
		mutable(FanMopOutput),
		contained(on(FanBatchFinishOutput, "root"), on(FanRoot, "root")),
		mutable(FanBatchFinishOutput),
		contained(on(FanFanRunFinishOutput, "root"), on(FanRoot, "root")),
		mutable(FanFanRunFinishOutput),
		contained(on(FanSweepFinishOutput, "root"), on(FanRoot, "root")),
		mutable(FanSweepFinishOutput)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const fanCoordination = fragment(
	[
		FanKind,
		FanRootKind,
		FanChildKind,
		FanOutcome,
		FanRetryWhy,
		FanPausable,
		FanResource,
		FanSeats,
		FanPaused,
		FanResumed,
		FanServed
	],
	[
		contained(on(FanResumed, "target", "turn"), on(FanPaused, "target", "turn")),
		contained(on(FanPaused, "target", pred("turn")), on(FanResumed, "target", "turn"))
	]
)

/** The flow's live holds: each hold whose claim's attempt has neither ended nor held its step's result, with its claim's lease, which den's role reads as the seats' holders. */
const FanLive = derived(
	"FanLive",
	query(fanGraph).rule((r) => {
		const { step, root, attempt, resource, seat } = v(FanHold, "fanHold")
		const { until } = v(FanClaim, "fanClaim")
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
		key(on(FanLive, "resource", "seat")),
		check("FanSeatBelowCount", FanLive, (row) =>
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
	"FanSweepFinishOutput"
] as const
