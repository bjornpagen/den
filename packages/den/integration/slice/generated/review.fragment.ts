import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Review to; `den generate` writes it, and nothing edits it. */
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
import { Delivered } from "#integration/slice/relations.ts"

export const ReviewKind = closed.unordered("ReviewKind", [
	"Analyze",
	"Gather",
	"Save",
	"QuestionsFinish",
	"ReviewRunFinish"
])
export const ReviewRootKind = closed.unordered("ReviewRootKind", ["ReviewRun"])
export const ReviewChildKind = closed.unordered("ReviewChildKind", ["Questions"])
export const ReviewOutcome = closed.unordered("ReviewOutcome", ["done", "failed"])
export const ReviewRetryWhy = closed.unordered("ReviewRetryWhy", ["spent", "transient", "later"])
export const ReviewPausable = closed.unordered("ReviewPausable", ["Anthropic", "ReviewRun"])
export const ReviewResource = closed.unordered("ReviewResource", ["Anthropic"])
const ReviewSeats = closed.relation(
	"ReviewSeats",
	{ resource: closedId(ReviewResource), seats: natural },
	["resource"],
	[{ resource: "Anthropic", seats: 2n }]
)

export const ReviewScope = relation("ReviewScope", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const ReviewRoot = relation(
	"ReviewRoot",
	{ root: sha256, kind: closedId(ReviewRootKind), key: Text, at: DenInstant },
	["root"]
)
export const ReviewWithin = relation(
	"ReviewWithin",
	{ root: sha256, scope: sha256, parent: sha256, kind: closedId(ReviewChildKind) },
	["root", "scope"]
)
export const ReviewAdmitted = relation("ReviewAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const ReviewSkipped = relation(
	"ReviewSkipped",
	{ root: sha256, scope: sha256, by: sha256 },
	["root", "scope"]
)
export const ReviewStep = relation(
	"ReviewStep",
	{ root: sha256, step: sha256, kind: closedId(ReviewKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const ReviewStartStep = relation(
	"ReviewStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const ReviewStartScope = relation(
	"ReviewStartScope",
	{ root: sha256, scope: sha256, ordinal: natural, child: sha256 },
	["root", "scope", "ordinal"]
)
export const ReviewFinish = relation(
	"ReviewFinish",
	{ root: sha256, scope: sha256, step: sha256 },
	["root", "scope"]
)
export const ReviewClaim = relation(
	"ReviewClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant, holds: drawn(natural) },
	["root", "step", "attempt"]
)
export const ReviewEnded = relation(
	"ReviewEnded",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const ReviewRetry = relation(
	"ReviewRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(ReviewRetryWhy) },
	["root", "step", "attempt"]
)
export const ReviewFenced = relation(
	"ReviewFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const ReviewResult = relation(
	"ReviewResult",
	{ root: sha256, step: sha256, outcome: closedId(ReviewOutcome) },
	["root", "step"]
)
export const ReviewDone = relation("ReviewDone", { root: sha256, step: sha256 }, ["root", "step"])
export const ReviewFailed = relation("ReviewFailed", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const ReviewHeld = relation("ReviewHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const ReviewRefusal = relation("ReviewRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const ReviewExhausted = relation("ReviewExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const ReviewAnalyzeInput = relation(
	"ReviewAnalyzeInput",
	{ root: sha256, step: sha256, review: Text, group: pg.bigint, question: pg.bigint },
	["root", "step"]
)
export const ReviewGatherInput = relation(
	"ReviewGatherInput",
	{ root: sha256, step: sha256, review: Delivered.fields.attempt },
	["root", "step"]
)
export const ReviewGatherInputSizes = relation(
	"ReviewGatherInputSizes",
	{ root: sha256, step: sha256, ordinal: natural, value: pg.bigint },
	["root", "step", "ordinal"]
)
export const ReviewSaveInput = relation(
	"ReviewSaveInput",
	{
		root: sha256,
		step: sha256,
		review: Text,
		group: pg.bigint,
		count: pg.bigint,
		total: pg.bigint
	},
	["root", "step"]
)
export const ReviewQuestionsInput = relation(
	"ReviewQuestionsInput",
	{ root: sha256, scope: sha256, review: Text, group: pg.bigint, size: pg.bigint },
	["root", "scope"]
)
export const ReviewReviewRunInput = relation(
	"ReviewReviewRunInput",
	{ root: sha256, scope: sha256, review: Text },
	["root", "scope"]
)
export const ReviewReviewRunInputSizes = relation(
	"ReviewReviewRunInputSizes",
	{ root: sha256, scope: sha256, ordinal: natural, value: pg.bigint },
	["root", "scope", "ordinal"]
)
export const ReviewAnalyzeOutput = relation(
	"ReviewAnalyzeOutput",
	{ root: sha256, step: sha256, score: pg.bigint },
	["root", "step"]
)
export const ReviewGatherOutput = relation(
	"ReviewGatherOutput",
	{ root: sha256, step: sha256, groups: pg.bigint },
	["root", "step"]
)
export const ReviewSaveOutput = relation(
	"ReviewSaveOutput",
	{ root: sha256, step: sha256, total: pg.bigint },
	["root", "step"]
)
export const ReviewQuestionsFinishOutput = relation(
	"ReviewQuestionsFinishOutput",
	{ root: sha256, step: sha256, count: pg.bigint, total: pg.bigint },
	["root", "step"]
)
export const ReviewReviewRunFinishOutput = relation(
	"ReviewReviewRunFinishOutput",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const ReviewSplit = relation(
	"ReviewSplit",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
export const ReviewSaved = relation(
	"ReviewSaved",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
const ReviewHold = relation(
	"ReviewHold",
	{
		resource: closedId(ReviewResource),
		root: sha256,
		step: sha256,
		attempt: natural,
		at: drawn(natural),
		seat: natural
	},
	["resource", "root", "step", "attempt"]
)
export const ReviewPaused = relation(
	"ReviewPaused",
	{ target: closedId(ReviewPausable), turn: natural },
	["target", "turn"]
)
export const ReviewResumed = relation(
	"ReviewResumed",
	{ target: closedId(ReviewPausable), turn: natural },
	["target", "turn"]
)
export const ReviewServed = relation(
	"ReviewServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const reviewGraph = fragment(
	[
		ReviewKind,
		ReviewRootKind,
		ReviewChildKind,
		ReviewOutcome,
		ReviewRetryWhy,
		ReviewPausable,
		ReviewResource,
		ReviewScope,
		ReviewRoot,
		ReviewWithin,
		ReviewAdmitted,
		ReviewSkipped,
		ReviewStep,
		ReviewStartStep,
		ReviewStartScope,
		ReviewFinish,
		ReviewClaim,
		ReviewEnded,
		ReviewRetry,
		ReviewFenced,
		ReviewResult,
		ReviewDone,
		ReviewFailed,
		ReviewHeld,
		ReviewRefusal,
		ReviewExhausted,
		ReviewAnalyzeInput,
		ReviewGatherInput,
		ReviewGatherInputSizes,
		ReviewSaveInput,
		ReviewQuestionsInput,
		ReviewReviewRunInput,
		ReviewReviewRunInputSizes,
		ReviewAnalyzeOutput,
		ReviewGatherOutput,
		ReviewSaveOutput,
		ReviewQuestionsFinishOutput,
		ReviewReviewRunFinishOutput,
		ReviewSplit,
		ReviewSaved,
		ReviewHold
	],
	[
		unit("DenRoot", { root: sha256 }),
		key(on(ReviewScope, "scope")),
		key(on(ReviewStep, "step")),
		contained(on(ReviewWithin, "root", "scope"), on(ReviewScope, "root", "scope")),
		contained(on(ReviewWithin, "root", "parent"), on(ReviewScope, "root", "scope")),
		contained(on(ReviewStartScope, "root", "scope"), on(ReviewAdmitted, "root", "scope")),
		contained(on(ReviewStartScope, "root", "child"), on(ReviewScope, "root", "scope")),
		key(on(ReviewStartScope, "root", "child")),
		contained(on(ReviewAdmitted, "root", "scope"), on(ReviewScope, "root", "scope")),
		contained(on(ReviewSkipped, "scope"), on(ReviewRoot, "root")),
		contained(on(ReviewSkipped, "by"), on(ReviewRoot, "root")),
		contained(on(ReviewStep, "root", "scope"), on(ReviewAdmitted, "root", "scope")),
		contained(on(ReviewStartStep, "root", "scope"), on(ReviewAdmitted, "root", "scope")),
		contained(on(ReviewStartStep, "root", "step"), on(ReviewStep, "root", "step")),
		key(on(ReviewStartStep, "root", "step")),
		contained(on(ReviewFinish, "root", "scope"), on(ReviewAdmitted, "root", "scope")),
		contained(on(ReviewFinish, "root", "step"), on(ReviewStep, "root", "step")),
		key(on(ReviewFinish, "root", "step")),
		contained(on(ReviewClaim, "root", "step"), on(ReviewStep, "root", "step")),
		contained(
			on(ReviewEnded, "root", "step", "attempt"),
			on(ReviewClaim, "root", "step", "attempt")
		),
		contained(
			on(
				select(ReviewClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(ReviewEnded, "root", "step", "attempt")
		),
		contained(
			on(ReviewRetry, "root", "step", "attempt"),
			on(ReviewEnded, "root", "step", "attempt")
		),
		contained(
			on(ReviewFenced, "root", "step", "attempt"),
			on(ReviewEnded, "root", "step", "attempt")
		),
		contained(on(ReviewResult, "root", "step"), on(ReviewStep, "root", "step")),
		contained(
			on(ReviewHeld, "root", "step", "attempt"),
			on(ReviewClaim, "root", "step", "attempt")
		),
		contained(on(ReviewHeld, "root", "step"), on(ReviewResult, "root", "step")),
		contained(
			on(ReviewDone, "root", "step"),
			on(
				select(ReviewResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(ReviewFailed, "root", "step"),
			on(
				select(ReviewResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(ReviewRefusal, "root", "step"), on(ReviewFailed, "root", "step")),
		contained(on(ReviewExhausted, "root", "step"), on(ReviewFailed, "root", "step")),
		contained(
			on(ReviewAnalyzeInput, "root", "step"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Analyze")),
				"root",
				"step"
			)
		),
		contained(
			on(ReviewGatherInput, "root", "step"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Gather")),
				"root",
				"step"
			)
		),
		contained(on(ReviewGatherInputSizes, "root", "step"), on(ReviewGatherInput, "root", "step")),
		contained(
			on(
				select(ReviewGatherInputSizes, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(ReviewGatherInputSizes, "root", "step", "ordinal")
		),
		contained(
			on(ReviewSaveInput, "root", "step"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Save")),
				"root",
				"step"
			)
		),
		contained(
			on(ReviewQuestionsInput, "root", "scope"),
			on(
				select(ReviewWithin, (row) => row.eq(row.kind, "Questions")),
				"root",
				"scope"
			)
		),
		contained(
			on(ReviewReviewRunInput, "scope"),
			on(
				select(ReviewRoot, (row) => row.eq(row.kind, "ReviewRun")),
				"root"
			)
		),
		contained(
			on(ReviewReviewRunInputSizes, "root", "scope"),
			on(ReviewReviewRunInput, "root", "scope")
		),
		contained(
			on(
				select(ReviewReviewRunInputSizes, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				pred("ordinal")
			),
			on(ReviewReviewRunInputSizes, "root", "scope", "ordinal")
		),
		contained(on(ReviewAnalyzeOutput, "root", "step"), on(ReviewAnalyzeInput, "root", "step")),
		contained(on(ReviewAnalyzeOutput, "root", "step"), on(ReviewDone, "root", "step")),
		contained(on(ReviewGatherOutput, "root", "step"), on(ReviewGatherInput, "root", "step")),
		contained(on(ReviewGatherOutput, "root", "step"), on(ReviewDone, "root", "step")),
		contained(on(ReviewSaveOutput, "root", "step"), on(ReviewSaveInput, "root", "step")),
		contained(on(ReviewSaveOutput, "root", "step"), on(ReviewDone, "root", "step")),
		contained(on(ReviewQuestionsFinishOutput, "root", "step"), on(ReviewDone, "root", "step")),
		contained(on(ReviewReviewRunFinishOutput, "root", "step"), on(ReviewDone, "root", "step")),
		contained(on(ReviewSplit, "root", "from"), on(ReviewGatherOutput, "root", "step")),
		contained(on(ReviewSplit, "root", "to"), on(ReviewQuestionsInput, "root", "scope")),
		key(on(ReviewSplit, "root", "to")),
		contained(on(ReviewSaved, "root", "from"), on(ReviewQuestionsFinishOutput, "root", "step")),
		contained(on(ReviewSaved, "root", "to"), on(ReviewSaveInput, "root", "step")),
		key(on(ReviewSaved, "root", "to")),
		unit("ReviewSeat", { resource: closedId(ReviewResource) }),
		ordered(on(ReviewHold, "root", "step", "attempt", "at"), fin(ReviewClaim, "holds")),
		mutable(ReviewHold),
		contained(on(ReviewScope, "root"), on(ReviewRoot, "root")),
		mutable(ReviewScope),
		mutable(ReviewWithin),
		mutable(ReviewAdmitted),
		contained(on(ReviewSkipped, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewSkipped),
		contained(on(ReviewStep, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewStep),
		contained(on(ReviewStartStep, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewStartStep),
		contained(on(ReviewStartScope, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewStartScope),
		contained(on(ReviewFinish, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewFinish),
		mutable(ReviewClaim),
		contained(on(ReviewEnded, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewEnded),
		contained(on(ReviewRetry, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewRetry),
		contained(on(ReviewFenced, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewFenced),
		mutable(ReviewResult),
		contained(on(ReviewDone, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewDone),
		contained(on(ReviewFailed, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewFailed),
		contained(on(ReviewHeld, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewHeld),
		contained(on(ReviewRefusal, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewRefusal),
		contained(on(ReviewExhausted, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewExhausted),
		contained(on(ReviewAnalyzeInput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewAnalyzeInput),
		contained(on(ReviewGatherInput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewGatherInput),
		contained(on(ReviewGatherInputSizes, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewGatherInputSizes),
		contained(on(ReviewSaveInput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewSaveInput),
		contained(on(ReviewQuestionsInput, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewQuestionsInput),
		contained(on(ReviewReviewRunInput, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewReviewRunInput),
		contained(on(ReviewReviewRunInputSizes, "root", "scope"), on(ReviewScope, "root", "scope")),
		mutable(ReviewReviewRunInputSizes),
		contained(on(ReviewAnalyzeOutput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewAnalyzeOutput),
		contained(on(ReviewGatherOutput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewGatherOutput),
		contained(on(ReviewSaveOutput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewSaveOutput),
		contained(on(ReviewQuestionsFinishOutput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewQuestionsFinishOutput),
		contained(on(ReviewReviewRunFinishOutput, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(ReviewReviewRunFinishOutput),
		contained(on(ReviewSplit, "root", "from"), on(ReviewStep, "root", "step")),
		mutable(ReviewSplit),
		contained(on(ReviewSaved, "root", "from"), on(ReviewStep, "root", "step")),
		mutable(ReviewSaved)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const reviewCoordination = fragment(
	[
		ReviewKind,
		ReviewRootKind,
		ReviewChildKind,
		ReviewOutcome,
		ReviewRetryWhy,
		ReviewPausable,
		ReviewResource,
		ReviewSeats,
		ReviewPaused,
		ReviewResumed,
		ReviewServed
	],
	[
		contained(on(ReviewResumed, "target", "turn"), on(ReviewPaused, "target", "turn")),
		contained(on(ReviewPaused, "target", pred("turn")), on(ReviewResumed, "target", "turn"))
	]
)

/** The flow's live holds: each hold whose claim's attempt has neither ended nor held its step's result, with its claim's lease, which den's role reads as the seats' holders. */
const ReviewLive = derived(
	"ReviewLive",
	query(reviewGraph).rule((r) => {
		const { step, root, attempt, resource, seat } = v(ReviewHold, "reviewHold")
		const { until } = v(ReviewClaim, "reviewClaim")
		return r
			.match(ReviewHold, { step, root, attempt, resource, seat })
			.match(ReviewClaim, { step, root, attempt, until })
			.where(
				r.not(ReviewEnded, { step, root, attempt }),
				r.not(ReviewHeld, { step, root, attempt })
			)
			.find({ resource, seat, step, root, attempt, until })
	})
)

/** The flow's seat level: its live holds, at most one a seat, each held below its resource's count. A fragment declares no derived relation, so the schema that lists `reviewGraph` states these on a level over itself, `schema.extend([listing], name, [...reviewSeatLevel.relations], [...reviewSeatLevel.laws])`. */
export const reviewSeatLevel = {
	relations: [ReviewLive],
	laws: [
		key(on(ReviewLive, "resource", "seat")),
		check("ReviewSeatBelowCount", ReviewLive, (row) =>
			row.lt(row.seat, ReviewSeats.at("seats", row.resource))
		)
	]
} as const

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const reviewWriter = [
	"ReviewResult",
	"ReviewDone",
	"ReviewHeld",
	"ReviewAnalyzeOutput",
	"ReviewGatherOutput",
	"ReviewSaveOutput",
	"ReviewQuestionsFinishOutput",
	"ReviewReviewRunFinishOutput",
	"ReviewStep",
	"ReviewScope",
	"ReviewWithin",
	"ReviewAdmitted",
	"ReviewFinish",
	"ReviewStartStep",
	"ReviewStartScope",
	"ReviewAnalyzeInput",
	"ReviewGatherInput",
	"ReviewGatherInputSizes",
	"ReviewSaveInput",
	"ReviewQuestionsInput",
	"ReviewSplit",
	"ReviewSaved"
] as const
