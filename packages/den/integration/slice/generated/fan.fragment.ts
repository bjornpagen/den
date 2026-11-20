import { DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
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
	natural,
	on,
	ordered,
	place,
	pg,
	pred,
	query,
	relation,
	retirable,
	retirement,
	select,
	v
} from "@bjornpagen/grizzle"

export const FanKind = closed.unordered("FanKind", ["Square", "BatchFinish", "FanRunFinish"])
export const FanRootKind = closed.unordered("FanRootKind", ["FanRun"])
export const FanChildKind = closed.unordered("FanChildKind", ["Batch"])
export const FanOutcome = closed.unordered("FanOutcome", ["done", "failed"])
export const FanPausable = closed.unordered("FanPausable", ["Pool", "FanRun"])
export const FanResource = closed.unordered("FanResource", ["Pool"])
const FanSeats = closed.relation(
	"FanSeats",
	{ resource: closedId(FanResource), seats: natural },
	["resource"],
	[{ resource: "Pool", seats: 2n }]
)

export const FanScope = relation("FanScope", { scope: DenScope, root: DenScope }, ["scope", "root"])
export const FanRoot = relation(
	"FanRoot",
	{ scope: DenScope, kind: closedId(FanRootKind), key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const FanWithin = relation(
	"FanWithin",
	{ scope: DenScope, parent: DenScope, kind: closedId(FanChildKind), root: DenScope },
	["scope", "root"]
)
export const FanAdmitted = relation("FanAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const FanSkipped = relation(
	"FanSkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const FanStep = relation(
	"FanStep",
	{ step: DenStep, kind: closedId(FanKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const FanStartStep = relation(
	"FanStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const FanStartScope = relation(
	"FanStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope, root: DenScope },
	["scope", "ordinal", "root"]
)
export const FanFinish = relation("FanFinish", { scope: DenScope, step: DenStep, root: DenScope }, [
	"scope",
	"root"
])
export const FanClaim = relation(
	"FanClaim",
	{ step: DenStep, attempt: place, until: DenInstant, holds: drawn(natural), root: DenScope },
	["step", "root", "attempt"]
)
export const FanEnded = relation("FanEnded", { step: DenStep, attempt: natural, root: DenScope }, [
	"step",
	"attempt",
	"root"
])
export const FanRetry = relation(
	"FanRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean, root: DenScope },
	["step", "attempt", "root"]
)
export const FanFenced = relation(
	"FanFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const FanResult = relation(
	"FanResult",
	{ step: DenStep, outcome: closedId(FanOutcome), root: DenScope },
	["step", "root"]
)
export const FanDone = relation("FanDone", { step: DenStep, root: DenScope }, ["step", "root"])
export const FanFailed = relation("FanFailed", { step: DenStep, root: DenScope }, ["step", "root"])
export const FanHeld = relation("FanHeld", { step: DenStep, attempt: natural, root: DenScope }, [
	"step",
	"root"
])
export const FanRefusal = relation("FanRefusal", { step: DenStep, law: Text, root: DenScope }, [
	"step",
	"root"
])
export const FanExhausted = relation("FanExhausted", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const FanSquareInput = relation(
	"FanSquareInput",
	{ step: DenStep, batch: Text, n: pg.bigint, root: DenScope },
	["step", "root"]
)
export const FanBatchInput = relation(
	"FanBatchInput",
	{ scope: DenScope, batch: Text, size: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const FanFanRunInput = relation(
	"FanFanRunInput",
	{ scope: DenScope, batch: Text, size: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const FanSquareOutput = relation(
	"FanSquareOutput",
	{ step: DenStep, square: pg.bigint, root: DenScope },
	["step", "root"]
)
const FanHold = relation(
	"FanHold",
	{
		step: DenStep,
		attempt: natural,
		at: drawn(natural),
		resource: closedId(FanResource),
		seat: natural,
		root: DenScope
	},
	["step", "root", "attempt", "at"]
)
export const FanPaused = relation("FanPaused", { target: closedId(FanPausable), turn: natural }, [
	"target",
	"turn"
])
export const FanResumed = relation("FanResumed", { target: closedId(FanPausable), turn: natural }, [
	"target",
	"turn"
])

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const fanGraph = fragment(
	[
		FanKind,
		FanRootKind,
		FanChildKind,
		FanOutcome,
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
		FanBatchInput,
		FanFanRunInput,
		FanSquareOutput,
		FanHold
	],
	[
		contained(on(FanWithin, "scope", "root"), on(FanScope, "scope", "root")),
		contained(on(FanWithin, "parent", "root"), on(FanScope, "scope", "root")),
		contained(on(FanStartScope, "scope", "root"), on(FanAdmitted, "scope", "root")),
		contained(on(FanStartScope, "child", "root"), on(FanScope, "scope", "root")),
		key(on(FanStartScope, "child", "root")),
		contained(on(FanAdmitted, "scope", "root"), on(FanScope, "scope", "root")),
		contained(on(FanSkipped, "scope"), on(FanRoot, "scope")),
		contained(on(FanSkipped, "by"), on(FanRoot, "scope")),
		contained(on(FanStep, "scope", "root"), on(FanAdmitted, "scope", "root")),
		contained(on(FanStartStep, "scope", "root"), on(FanAdmitted, "scope", "root")),
		contained(on(FanStartStep, "step", "root"), on(FanStep, "step", "root")),
		key(on(FanStartStep, "step", "root")),
		contained(on(FanFinish, "scope", "root"), on(FanAdmitted, "scope", "root")),
		contained(on(FanFinish, "step", "root"), on(FanStep, "step", "root")),
		key(on(FanFinish, "step", "root")),
		contained(on(FanClaim, "step", "root"), on(FanStep, "step", "root")),
		contained(on(FanEnded, "step", "attempt", "root"), on(FanClaim, "step", "attempt", "root")),
		contained(
			on(
				select(FanClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(FanEnded, "step", "attempt", "root")
		),
		contained(on(FanRetry, "step", "attempt", "root"), on(FanEnded, "step", "attempt", "root")),
		contained(on(FanFenced, "step", "attempt", "root"), on(FanEnded, "step", "attempt", "root")),
		contained(on(FanResult, "step", "root"), on(FanStep, "step", "root")),
		contained(on(FanHeld, "step", "attempt", "root"), on(FanClaim, "step", "attempt", "root")),
		contained(on(FanHeld, "step", "root"), on(FanResult, "step", "root")),
		contained(
			on(FanDone, "step", "root"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(FanFailed, "step", "root"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(FanRefusal, "step", "root"), on(FanFailed, "step", "root")),
		contained(on(FanExhausted, "step", "root"), on(FanFailed, "step", "root")),
		contained(
			on(FanSquareInput, "step", "root"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Square")),
				"step",
				"root"
			)
		),
		contained(
			on(FanBatchInput, "scope", "root"),
			on(
				select(FanWithin, (row) => row.eq(row.kind, "Batch")),
				"scope",
				"root"
			)
		),
		contained(
			on(FanFanRunInput, "scope"),
			on(
				select(FanRoot, (row) => row.eq(row.kind, "FanRun")),
				"scope"
			)
		),
		contained(on(FanSquareOutput, "step", "root"), on(FanSquareInput, "step", "root")),
		contained(on(FanSquareOutput, "step", "root"), on(FanDone, "step", "root")),
		ordered(on(FanHold, "step", "root", "attempt", "at"), fin(FanClaim, "holds")),
		retirable(FanRoot, [
			on(FanScope, "root"),
			on(FanWithin, "root"),
			on(FanAdmitted, "root"),
			on(FanSkipped, "root"),
			on(FanStep, "root"),
			on(FanStartStep, "root"),
			on(FanStartScope, "root"),
			on(FanFinish, "root"),
			on(FanClaim, "root"),
			on(FanEnded, "root"),
			on(FanRetry, "root"),
			on(FanFenced, "root"),
			on(FanResult, "root"),
			on(FanDone, "root"),
			on(FanFailed, "root"),
			on(FanHeld, "root"),
			on(FanRefusal, "root"),
			on(FanExhausted, "root"),
			on(FanSquareInput, "root"),
			on(FanBatchInput, "root"),
			on(FanFanRunInput, "root"),
			on(FanSquareOutput, "root"),
			on(FanHold, "root")
		])
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const fanCoordination = fragment(
	[
		FanKind,
		FanRootKind,
		FanChildKind,
		FanOutcome,
		FanPausable,
		FanResource,
		FanSeats,
		FanPaused,
		FanResumed
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

/** The flow's seat level: its live holds, at most one a seat, each held below its resource's count. A fragment declares no derived relation, so the schema that lists `fanGraph` states these on a level over itself, `schema.extend(listing, name, [...fanSeatLevel.relations], [...fanSeatLevel.laws])`. */
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
export const fanWriter = ["FanResult", "FanDone", "FanHeld", "FanSquareOutput"] as const
