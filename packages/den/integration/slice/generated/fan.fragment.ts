import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Fan to; `den generate` writes it, and nothing edits it. */
import {
	check,
	closed,
	closedId,
	contained,
	derivedName,
	Crypto,
	derived,
	drawn,
	fin,
	fragment,
	generated,
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
	"SweepFinish",
	"WantedFinish"
])
export const FanRootKind = closed.unordered("FanRootKind", ["FanRun", "Sweep", "Wanted"])
export const FanChildKind = closed.unordered("FanChildKind", ["Batch"])
export const FanOutcome = closed.unordered("FanOutcome", ["done", "failed"])
export const FanRetryWhy = closed.unordered("FanRetryWhy", ["spent", "transient", "later"])
export const FanPausable = closed.unordered("FanPausable", [
	"Pool",
	"Vendor",
	"FanRun",
	"Sweep",
	"Wanted"
])
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
export const FanRequestedWith = relation(
	"FanRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
	["root"]
)
export const FanWithin = relation(
	"FanWithin",
	{ root: sha256, scope: sha256, parent: sha256, kind: closedId(FanChildKind) },
	["root", "scope"]
)
export const FanExclusiveKey = relation(
	"FanExclusiveKey",
	{ root: sha256, scope: sha256, key: Text, id: sha256 },
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
export const FanSquareInput = derivedName({ stem: "Fan", path: ["SquareInput"] }).relation(
	"FanSquareInput",
	{ root: sha256, step: sha256, batch: Text, n: pg.bigint },
	["root", "step"]
)
export const FanDustInput = derivedName({ stem: "Fan", path: ["DustInput"] }).relation(
	"FanDustInput",
	{ root: sha256, step: sha256, sweep: Text },
	["root", "step"]
)
export const FanMopInput = derivedName({ stem: "Fan", path: ["MopInput"] }).relation(
	"FanMopInput",
	{ root: sha256, step: sha256, sweep: Text },
	["root", "step"]
)
export const FanBatchInput = derivedName({ stem: "Fan", path: ["BatchInput"] }).relation(
	"FanBatchInput",
	{ root: sha256, scope: sha256, batch: Text, size: pg.bigint },
	["root", "scope"]
)
export const FanFanRunInput = derivedName({ stem: "Fan", path: ["FanRunInput"] }).relation(
	"FanFanRunInput",
	{ root: sha256, scope: sha256, batch: Text, size: pg.bigint },
	["root", "scope"]
)
export const FanSweepInput = derivedName({ stem: "Fan", path: ["SweepInput"] }).relation(
	"FanSweepInput",
	{ root: sha256, scope: sha256, sweep: Text },
	["root", "scope"]
)
export const FanWantedInput = derivedName({ stem: "Fan", path: ["WantedInput"] }).relation(
	"FanWantedInput",
	{ root: sha256, scope: sha256, batch: Text, size: pg.bigint },
	["root", "scope"]
)
export const FanWantedKey = derivedName({ stem: "Fan", path: ["WantedKey"] }).generated(
	"FanWantedKey",
	{ root: sha256, batch: Text },
	["root"],
	(row) => ({ batchDigest: generated(sha256, Crypto.sha256(row.batch)) })
)
export const FanSquareOutput = derivedName({ stem: "Fan", path: ["SquareOutput"] }).relation(
	"FanSquareOutput",
	{ root: sha256, step: sha256, square: pg.bigint },
	["root", "step"]
)
export const FanDustOutput = derivedName({ stem: "Fan", path: ["DustOutput"] }).relation(
	"FanDustOutput",
	{ root: sha256, step: sha256, sweep: Text },
	["root", "step"]
)
export const FanMopOutput = derivedName({ stem: "Fan", path: ["MopOutput"] }).relation(
	"FanMopOutput",
	{ root: sha256, step: sha256, sweep: Text },
	["root", "step"]
)
export const FanBatchFinishOutput = derivedName({
	stem: "Fan",
	path: ["BatchFinishOutput"]
}).relation("FanBatchFinishOutput", { root: sha256, step: sha256 }, ["root", "step"])
export const FanFanRunFinishOutput = derivedName({
	stem: "Fan",
	path: ["FanRunFinishOutput"]
}).relation("FanFanRunFinishOutput", { root: sha256, step: sha256 }, ["root", "step"])
export const FanSweepFinishOutput = derivedName({
	stem: "Fan",
	path: ["SweepFinishOutput"]
}).relation("FanSweepFinishOutput", { root: sha256, step: sha256 }, ["root", "step"])
export const FanWantedFinishOutput = derivedName({
	stem: "Fan",
	path: ["WantedFinishOutput"]
}).relation("FanWantedFinishOutput", { root: sha256, step: sha256 }, ["root", "step"])
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
export const FanExclusive = relation(
	"FanExclusive",
	{ kind: closedId(FanRootKind), key: sha256, turn: natural, scope: sha256 },
	["kind", "key", "turn"]
)
export const FanReleased = relation(
	"FanReleased",
	{ kind: closedId(FanRootKind), key: sha256, turn: natural },
	["kind", "key", "turn"]
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
		unit("DenRoot", { root: sha256 }),
		key(on(FanScope, "scope")),
		key(on(FanStep, "step")),
		contained(on(FanExclusiveKey, "root", "scope"), on(FanScope, "root", "scope")),
		contained(on(FanWithin, "root", "scope"), on(FanScope, "root", "scope")),
		contained(on(FanWithin, "root", "parent"), on(FanScope, "root", "scope")),
		contained(on(FanStartScope, "root", "scope"), on(FanAdmitted, "root", "scope")),
		contained(on(FanStartScope, "root", "child"), on(FanScope, "root", "scope")),
		key(on(FanStartScope, "root", "child")),
		contained(on(FanAdmitted, "root", "scope"), on(FanScope, "root", "scope")),
		contained(on(FanSkipped, "scope"), on(FanRoot, "root")),
		contained(on(FanSkipped, "by"), on(FanRoot, "root")),
		contained(on(FanRequestedWith, "root"), on(FanRoot, "root")),
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
			on(
				select(FanRoot, (row) => row.eq(row.kind, "FanRun")),
				"root"
			),
			on(FanRequestedWith, "root")
		),
		contained(
			on(
				select(FanRoot, (row) => row.eq(row.kind, "Sweep")),
				"root"
			),
			on(FanRequestedWith, "root")
		),
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
		contained(
			on(FanWantedInput, "scope"),
			on(
				select(FanRoot, (row) => row.eq(row.kind, "Wanted")),
				"root"
			)
		),
		key(on(FanWantedKey, "batchDigest")),
		contained(
			on(FanWantedKey, "root"),
			on(
				select(FanRoot, (row) => row.eq(row.kind, "Wanted")),
				"root"
			)
		),
		contained(
			on(
				select(FanRoot, (row) => row.eq(row.kind, "Wanted")),
				"root"
			),
			on(FanWantedKey, "root")
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
		contained(on(FanWantedFinishOutput, "root", "step"), on(FanDone, "root", "step")),
		unit("FanSeat", { resource: closedId(FanResource) }),
		ordered(on(FanHold, "root", "step", "attempt", "at"), fin(FanClaim, "holds")),
		mutable(FanHold),
		contained(on(FanScope, "root"), on(FanRoot, "root")),
		mutable(FanScope),
		mutable(FanWithin),
		mutable(FanExclusiveKey),
		mutable(FanAdmitted),
		contained(on(FanSkipped, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanSkipped),
		contained(on(FanStep, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanStep),
		contained(on(FanStartStep, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanStartStep),
		contained(on(FanStartScope, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanStartScope),
		contained(on(FanFinish, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanFinish),
		mutable(FanClaim),
		contained(on(FanEnded, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanEnded),
		contained(on(FanRetry, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanRetry),
		contained(on(FanFenced, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanFenced),
		mutable(FanResult),
		contained(on(FanDone, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanDone),
		contained(on(FanFailed, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanFailed),
		contained(on(FanHeld, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanHeld),
		contained(on(FanRefusal, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanRefusal),
		contained(on(FanExhausted, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanExhausted),
		contained(on(FanSquareInput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanSquareInput),
		contained(on(FanDustInput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanDustInput),
		contained(on(FanMopInput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanMopInput),
		contained(on(FanBatchInput, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanBatchInput),
		contained(on(FanFanRunInput, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanFanRunInput),
		contained(on(FanSweepInput, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanSweepInput),
		contained(on(FanWantedInput, "root", "scope"), on(FanScope, "root", "scope")),
		mutable(FanWantedInput),
		contained(on(FanSquareOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanSquareOutput),
		contained(on(FanDustOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanDustOutput),
		contained(on(FanMopOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanMopOutput),
		contained(on(FanBatchFinishOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanBatchFinishOutput),
		contained(on(FanFanRunFinishOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanFanRunFinishOutput),
		contained(on(FanSweepFinishOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanSweepFinishOutput),
		contained(on(FanWantedFinishOutput, "root", "step"), on(FanStep, "root", "step")),
		mutable(FanWantedFinishOutput)
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
		FanExclusive,
		FanReleased,
		FanPaused,
		FanResumed,
		FanServed
	],
	[
		contained(on(FanReleased, "kind", "key", "turn"), on(FanExclusive, "kind", "key", "turn")),
		contained(
			on(FanExclusive, "kind", "key", pred("turn")),
			on(FanReleased, "kind", "key", "turn")
		),
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
	"FanSweepFinishOutput",
	"FanWantedFinishOutput",
	"FanScope",
	"FanExclusiveKey",
	"FanWantedKey",
	"FanWantedInput",
	"FanRoot"
] as const
