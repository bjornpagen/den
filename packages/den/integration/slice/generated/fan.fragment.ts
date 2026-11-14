import { DenHolder, DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Fan to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	derived,
	fragment,
	key,
	natural,
	on,
	pg,
	pred,
	query,
	race,
	relation,
	select,
	v
} from "@bjornpagen/grizzle"

export const FanKind = closed("FanKind", ["Square", "BatchFinish", "FanRunFinish"])
export const FanJoin = closed("FanJoin", ["Batch", "FanRun"])
export const FanOutcome = closed("FanOutcome", ["done", "failed"])
export const FanPausable = closed("FanPausable", ["Pool", "FanRun"])
export const FanResource = closed("FanResource", ["Pool"])
const FanSeats = closed.relation(
	"FanSeats",
	{ resource: closedId(FanResource), seats: natural },
	["resource"],
	[{ resource: "Pool", seats: 2n }]
)

export const FanScope = relation("FanScope", { scope: DenScope, kind: closedId(FanJoin) }, [
	"scope"
])
export const FanRoot = relation("FanRoot", { scope: DenScope, key: Text, at: DenInstant }, [
	"scope"
])
export const FanWithin = relation("FanWithin", { scope: DenScope, parent: DenScope }, ["scope"])
export const FanAdmitted = relation("FanAdmitted", { scope: DenScope }, ["scope"])
export const FanSkipped = relation("FanSkipped", { scope: DenScope, by: DenScope }, ["scope"])
export const FanStep = relation(
	"FanStep",
	{ step: DenStep, kind: closedId(FanKind), scope: DenScope },
	["step"]
)
export const FanStartStep = relation(
	"FanStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep },
	["scope", "ordinal"]
)
export const FanStartScope = relation(
	"FanStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope },
	["scope", "ordinal"]
)
export const FanFinish = relation("FanFinish", { scope: DenScope, step: DenStep }, ["scope"])
export const FanDue = relation("FanDue", { step: DenStep, at: DenInstant }, ["step"])
export const FanClaim = relation(
	"FanClaim",
	{ step: DenStep, attempt: natural, holder: DenHolder, until: DenInstant },
	["step", "attempt"]
)
export const FanRetry = relation(
	"FanRetry",
	{ step: DenStep, attempt: natural, at: DenInstant, spent: pg.boolean },
	["step", "attempt"]
)
export const FanFenced = relation("FanFenced", { step: DenStep, attempt: natural }, [
	"step",
	"attempt"
])
export const FanResult = relation("FanResult", { step: DenStep, outcome: closedId(FanOutcome) }, [
	"step"
])
export const FanDone = relation("FanDone", { step: DenStep }, ["step"])
export const FanFailed = relation("FanFailed", { step: DenStep }, ["step"])
export const FanHeld = relation("FanHeld", { step: DenStep, attempt: natural }, ["step"])
export const FanRefusal = relation("FanRefusal", { step: DenStep, law: Text }, ["step"])
export const FanExhausted = relation("FanExhausted", { step: DenStep, attempts: natural }, ["step"])
export const FanSquareInput = relation(
	"FanSquareInput",
	{ step: DenStep, batch: Text, n: pg.bigint },
	["step"]
)
export const FanBatchInput = relation(
	"FanBatchInput",
	{ scope: DenScope, batch: Text, size: pg.bigint },
	["scope"]
)
export const FanFanRunInput = relation(
	"FanFanRunInput",
	{ scope: DenScope, batch: Text, size: pg.bigint },
	["scope"]
)
export const FanSquareOutput = relation("FanSquareOutput", { step: DenStep, square: pg.bigint }, [
	"step"
])
export const FanHold = relation(
	"FanHold",
	{
		resource: closedId(FanResource),
		seat: natural,
		turn: natural,
		holder: DenHolder,
		until: DenInstant
	},
	["resource", "seat", "turn"]
)
export const FanFreed = relation(
	"FanFreed",
	{ resource: closedId(FanResource), seat: natural, turn: natural },
	["resource", "seat", "turn"]
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
		FanJoin,
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
		FanDue,
		FanClaim,
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
		FanSquareOutput
	],
	[
		contained(on(FanRoot, "scope"), on(FanScope, "scope")),
		contained(on(FanWithin, "scope"), on(FanScope, "scope")),
		contained(on(FanWithin, "parent"), on(FanScope, "scope")),
		contained(on(FanAdmitted, "scope"), on(FanScope, "scope")),
		contained(on(FanSkipped, "scope"), on(FanRoot, "scope")),
		contained(on(FanSkipped, "by"), on(FanAdmitted, "scope")),
		contained(on(FanStep, "scope"), on(FanAdmitted, "scope")),
		contained(on(FanStartStep, "scope"), on(FanAdmitted, "scope")),
		contained(on(FanStartStep, "step"), on(FanStep, "step")),
		key(on(FanStartStep, "step")),
		contained(on(FanStartScope, "scope"), on(FanAdmitted, "scope")),
		contained(on(FanStartScope, "child"), on(FanScope, "scope")),
		key(on(FanStartScope, "child")),
		contained(on(FanFinish, "scope"), on(FanAdmitted, "scope")),
		contained(on(FanFinish, "step"), on(FanStep, "step")),
		key(on(FanFinish, "step")),
		contained(on(FanDue, "step"), on(FanStep, "step")),
		contained(on(FanClaim, "step"), on(FanStep, "step")),
		race(FanClaim),
		check("AttemptFromOne", FanClaim, (row) => row.ge(row.attempt, 1n)),
		contained(
			on(
				select(FanClaim, (row) => row.ge(row.attempt, 2n)),
				"step",
				pred("attempt")
			),
			on(FanClaim, "step", "attempt")
		),
		contained(on(FanRetry, "step", "attempt"), on(FanClaim, "step", "attempt")),
		contained(on(FanFenced, "step", "attempt"), on(FanClaim, "step", "attempt")),
		contained(on(FanResult, "step"), on(FanStep, "step")),
		contained(on(FanHeld, "step", "attempt"), on(FanClaim, "step", "attempt")),
		contained(on(FanHeld, "step"), on(FanResult, "step")),
		contained(
			on(FanDone, "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "done")),
				"step"
			)
		),
		contained(
			on(FanFailed, "step"),
			on(
				select(FanResult, (row) => row.eq(row.outcome, "failed")),
				"step"
			)
		),
		contained(on(FanRefusal, "step"), on(FanFailed, "step")),
		contained(on(FanExhausted, "step"), on(FanFailed, "step")),
		contained(
			on(FanSquareInput, "step"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Square")),
				"step"
			)
		),
		contained(
			on(FanBatchInput, "scope"),
			on(
				select(FanScope, (row) => row.eq(row.kind, "Batch")),
				"scope"
			)
		),
		contained(
			on(FanFanRunInput, "scope"),
			on(
				select(FanScope, (row) => row.eq(row.kind, "FanRun")),
				"scope"
			)
		),
		contained(on(FanSquareOutput, "step"), on(FanSquareInput, "step")),
		contained(on(FanSquareOutput, "step"), on(FanDone, "step"))
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */
export const fanCoordination = fragment(
	[
		FanKind,
		FanJoin,
		FanOutcome,
		FanPausable,
		FanResource,
		FanSeats,
		FanHold,
		FanFreed,
		FanPaused,
		FanResumed
	],
	[
		contained(on(FanFreed, "resource", "seat", "turn"), on(FanHold, "resource", "seat", "turn")),
		contained(
			on(FanHold, "resource", "seat", pred("turn")),
			on(FanFreed, "resource", "seat", "turn")
		),
		contained(on(FanResumed, "target", "turn"), on(FanPaused, "target", "turn")),
		contained(on(FanPaused, "target", pred("turn")), on(FanResumed, "target", "turn"))
	]
)

/** The flow's live holds: each hold whose turn no free ended, which the coordinator role reads as the seats' holders. */
const FanLive = derived(
	"FanLive",
	query(fanCoordination).rule((r) => {
		const { resource, seat, turn, holder, until } = v(FanHold, "fanHold")
		return r
			.match(FanHold, { resource, seat, turn, holder, until })
			.where(r.not(FanFreed, { resource, seat, turn }))
			.find({ resource, seat, turn, holder, until })
	})
)

/** The flow's seat level: its live holds, each held below its resource's count. A fragment declares no derived relation, so the schema that lists `fanCoordination` states these on a level over itself, `schema.extend(listing, name, [...fanSeatLevel.relations], [...fanSeatLevel.laws])`. */
export const fanSeatLevel = {
	relations: [FanLive],
	laws: [
		check("FanSeatBelowCount", FanLive, (row) =>
			row.lt(row.seat, FanSeats.at("seats", row.resource))
		)
	]
} as const

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const fanWriter = ["FanResult", "FanDone", "FanHeld", "FanSquareOutput"] as const
