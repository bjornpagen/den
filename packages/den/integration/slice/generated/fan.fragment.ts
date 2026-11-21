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
	sha256,
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

export const FanScope = relation("FanScope", { scope: sha256, root: sha256 }, ["scope", "root"])
export const FanRoot = relation(
	"FanRoot",
	{ scope: sha256, kind: closedId(FanRootKind), key: Text, at: DenInstant, retired: retirement },
	["scope"]
)
export const FanWithin = relation(
	"FanWithin",
	{ scope: sha256, parent: sha256, kind: closedId(FanChildKind), root: sha256 },
	["scope", "root"]
)
export const FanAdmitted = relation("FanAdmitted", { scope: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const FanSkipped = relation("FanSkipped", { scope: sha256, by: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const FanStep = relation(
	"FanStep",
	{ step: sha256, kind: closedId(FanKind), scope: sha256, due: DenInstant, root: sha256 },
	["step", "root"]
)
export const FanStartStep = relation(
	"FanStartStep",
	{ scope: sha256, ordinal: natural, step: sha256, root: sha256 },
	["scope", "ordinal", "root"]
)
export const FanStartScope = relation(
	"FanStartScope",
	{ scope: sha256, ordinal: natural, child: sha256, root: sha256 },
	["scope", "ordinal", "root"]
)
export const FanFinish = relation("FanFinish", { scope: sha256, step: sha256, root: sha256 }, [
	"scope",
	"root"
])
export const FanClaim = relation(
	"FanClaim",
	{ step: sha256, attempt: place, until: DenInstant, holds: drawn(natural), root: sha256 },
	["step", "root", "attempt"]
)
export const FanEnded = relation("FanEnded", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"attempt",
	"root"
])
export const FanRetry = relation(
	"FanRetry",
	{ step: sha256, attempt: natural, at: DenInstant, why: closedId(FanRetryWhy), root: sha256 },
	["step", "attempt", "root"]
)
export const FanFenced = relation("FanFenced", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"attempt",
	"root"
])
export const FanResult = relation(
	"FanResult",
	{ step: sha256, outcome: closedId(FanOutcome), root: sha256 },
	["step", "root"]
)
export const FanDone = relation("FanDone", { step: sha256, root: sha256 }, ["step", "root"])
export const FanFailed = relation("FanFailed", { step: sha256, root: sha256 }, ["step", "root"])
export const FanHeld = relation("FanHeld", { step: sha256, attempt: natural, root: sha256 }, [
	"step",
	"root"
])
export const FanRefusal = relation("FanRefusal", { step: sha256, law: Text, root: sha256 }, [
	"step",
	"root"
])
export const FanExhausted = relation("FanExhausted", { step: sha256, root: sha256 }, [
	"step",
	"root"
])
export const FanSquareInput = relation(
	"FanSquareInput",
	{ step: sha256, batch: Text, n: pg.bigint, root: sha256 },
	["step", "root"]
)
export const FanDustInput = relation("FanDustInput", { step: sha256, sweep: Text, root: sha256 }, [
	"step",
	"root"
])
export const FanMopInput = relation("FanMopInput", { step: sha256, sweep: Text, root: sha256 }, [
	"step",
	"root"
])
export const FanBatchInput = relation(
	"FanBatchInput",
	{ scope: sha256, batch: Text, size: pg.bigint, root: sha256 },
	["scope", "root"]
)
export const FanFanRunInput = relation(
	"FanFanRunInput",
	{ scope: sha256, batch: Text, size: pg.bigint, root: sha256 },
	["scope", "root"]
)
export const FanSweepInput = relation(
	"FanSweepInput",
	{ scope: sha256, sweep: Text, root: sha256 },
	["scope", "root"]
)
export const FanSquareOutput = relation(
	"FanSquareOutput",
	{ step: sha256, square: pg.bigint, root: sha256 },
	["step", "root"]
)
export const FanDustOutput = relation(
	"FanDustOutput",
	{ step: sha256, sweep: Text, root: sha256 },
	["step", "root"]
)
export const FanMopOutput = relation("FanMopOutput", { step: sha256, sweep: Text, root: sha256 }, [
	"step",
	"root"
])
export const FanBatchFinishOutput = relation(
	"FanBatchFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const FanFanRunFinishOutput = relation(
	"FanFanRunFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
export const FanSweepFinishOutput = relation(
	"FanSweepFinishOutput",
	{ step: sha256, root: sha256 },
	["step", "root"]
)
const FanHold = relation(
	"FanHold",
	{
		step: sha256,
		attempt: natural,
		at: drawn(natural),
		resource: closedId(FanResource),
		seat: natural,
		root: sha256
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
			on(FanDustInput, "step", "root"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Dust")),
				"step",
				"root"
			)
		),
		contained(
			on(FanMopInput, "step", "root"),
			on(
				select(FanStep, (row) => row.eq(row.kind, "Mop")),
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
		contained(
			on(FanSweepInput, "scope"),
			on(
				select(FanRoot, (row) => row.eq(row.kind, "Sweep")),
				"scope"
			)
		),
		contained(on(FanSquareOutput, "step", "root"), on(FanSquareInput, "step", "root")),
		contained(on(FanSquareOutput, "step", "root"), on(FanDone, "step", "root")),
		contained(on(FanDustOutput, "step", "root"), on(FanDustInput, "step", "root")),
		contained(on(FanDustOutput, "step", "root"), on(FanDone, "step", "root")),
		contained(on(FanMopOutput, "step", "root"), on(FanMopInput, "step", "root")),
		contained(on(FanMopOutput, "step", "root"), on(FanDone, "step", "root")),
		contained(on(FanBatchFinishOutput, "step", "root"), on(FanDone, "step", "root")),
		contained(on(FanFanRunFinishOutput, "step", "root"), on(FanDone, "step", "root")),
		contained(on(FanSweepFinishOutput, "step", "root"), on(FanDone, "step", "root")),
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
			on(FanDustInput, "root"),
			on(FanMopInput, "root"),
			on(FanBatchInput, "root"),
			on(FanFanRunInput, "root"),
			on(FanSweepInput, "root"),
			on(FanSquareOutput, "root"),
			on(FanDustOutput, "root"),
			on(FanMopOutput, "root"),
			on(FanBatchFinishOutput, "root"),
			on(FanFanRunFinishOutput, "root"),
			on(FanSweepFinishOutput, "root"),
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
