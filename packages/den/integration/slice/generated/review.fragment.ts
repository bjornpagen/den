import { DenInstant, DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
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

export const ReviewScope = relation("ReviewScope", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const ReviewRoot = relation(
	"ReviewRoot",
	{
		scope: DenScope,
		kind: closedId(ReviewRootKind),
		key: Text,
		at: DenInstant,
		retired: retirement
	},
	["scope"]
)
export const ReviewWithin = relation(
	"ReviewWithin",
	{ scope: DenScope, parent: DenScope, kind: closedId(ReviewChildKind), root: DenScope },
	["scope", "root"]
)
export const ReviewAdmitted = relation("ReviewAdmitted", { scope: DenScope, root: DenScope }, [
	"scope",
	"root"
])
export const ReviewSkipped = relation(
	"ReviewSkipped",
	{ scope: DenScope, by: DenScope, root: DenScope },
	["scope", "root"]
)
export const ReviewStep = relation(
	"ReviewStep",
	{ step: DenStep, kind: closedId(ReviewKind), scope: DenScope, due: DenInstant, root: DenScope },
	["step", "root"]
)
export const ReviewStartStep = relation(
	"ReviewStartStep",
	{ scope: DenScope, ordinal: natural, step: DenStep, root: DenScope },
	["scope", "ordinal", "root"]
)
export const ReviewStartScope = relation(
	"ReviewStartScope",
	{ scope: DenScope, ordinal: natural, child: DenScope, root: DenScope },
	["scope", "ordinal", "root"]
)
export const ReviewFinish = relation(
	"ReviewFinish",
	{ scope: DenScope, step: DenStep, root: DenScope },
	["scope", "root"]
)
export const ReviewClaim = relation(
	"ReviewClaim",
	{ step: DenStep, attempt: place, until: DenInstant, holds: drawn(natural), root: DenScope },
	["step", "root", "attempt"]
)
export const ReviewEnded = relation(
	"ReviewEnded",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const ReviewRetry = relation(
	"ReviewRetry",
	{
		step: DenStep,
		attempt: natural,
		at: DenInstant,
		why: closedId(ReviewRetryWhy),
		root: DenScope
	},
	["step", "attempt", "root"]
)
export const ReviewFenced = relation(
	"ReviewFenced",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "attempt", "root"]
)
export const ReviewResult = relation(
	"ReviewResult",
	{ step: DenStep, outcome: closedId(ReviewOutcome), root: DenScope },
	["step", "root"]
)
export const ReviewDone = relation("ReviewDone", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const ReviewFailed = relation("ReviewFailed", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const ReviewHeld = relation(
	"ReviewHeld",
	{ step: DenStep, attempt: natural, root: DenScope },
	["step", "root"]
)
export const ReviewRefusal = relation(
	"ReviewRefusal",
	{ step: DenStep, law: Text, root: DenScope },
	["step", "root"]
)
export const ReviewExhausted = relation("ReviewExhausted", { step: DenStep, root: DenScope }, [
	"step",
	"root"
])
export const ReviewAnalyzeInput = relation(
	"ReviewAnalyzeInput",
	{ step: DenStep, review: Text, group: pg.bigint, question: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ReviewGatherInput = relation(
	"ReviewGatherInput",
	{ step: DenStep, review: Delivered.fields.attempt, root: DenScope },
	["step", "root"]
)
export const ReviewGatherInputSizes = relation(
	"ReviewGatherInputSizes",
	{ step: DenStep, ordinal: natural, value: pg.bigint, root: DenScope },
	["step", "ordinal", "root"]
)
export const ReviewSaveInput = relation(
	"ReviewSaveInput",
	{
		step: DenStep,
		review: Text,
		group: pg.bigint,
		count: pg.bigint,
		total: pg.bigint,
		root: DenScope
	},
	["step", "root"]
)
export const ReviewQuestionsInput = relation(
	"ReviewQuestionsInput",
	{ scope: DenScope, review: Text, group: pg.bigint, size: pg.bigint, root: DenScope },
	["scope", "root"]
)
export const ReviewReviewRunInput = relation(
	"ReviewReviewRunInput",
	{ scope: DenScope, review: Text, root: DenScope },
	["scope", "root"]
)
export const ReviewReviewRunInputSizes = relation(
	"ReviewReviewRunInputSizes",
	{ scope: DenScope, ordinal: natural, value: pg.bigint, root: DenScope },
	["scope", "ordinal", "root"]
)
export const ReviewAnalyzeOutput = relation(
	"ReviewAnalyzeOutput",
	{ step: DenStep, score: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ReviewGatherOutput = relation(
	"ReviewGatherOutput",
	{ step: DenStep, groups: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ReviewSaveOutput = relation(
	"ReviewSaveOutput",
	{ step: DenStep, total: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ReviewQuestionsFinishOutput = relation(
	"ReviewQuestionsFinishOutput",
	{ step: DenStep, count: pg.bigint, total: pg.bigint, root: DenScope },
	["step", "root"]
)
export const ReviewReviewRunFinishOutput = relation(
	"ReviewReviewRunFinishOutput",
	{ step: DenStep, root: DenScope },
	["step", "root"]
)
export const ReviewSplit = relation(
	"ReviewSplit",
	{ from: DenStep, ordinal: natural, to: DenScope, root: DenScope },
	["from", "ordinal", "root"]
)
export const ReviewSaved = relation(
	"ReviewSaved",
	{ from: DenStep, ordinal: natural, to: DenStep, root: DenScope },
	["from", "ordinal", "root"]
)
const ReviewHold = relation(
	"ReviewHold",
	{
		step: DenStep,
		attempt: natural,
		at: drawn(natural),
		resource: closedId(ReviewResource),
		seat: natural,
		root: DenScope
	},
	["step", "root", "attempt", "at"]
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
		contained(on(ReviewWithin, "scope", "root"), on(ReviewScope, "scope", "root")),
		contained(on(ReviewWithin, "parent", "root"), on(ReviewScope, "scope", "root")),
		contained(on(ReviewStartScope, "scope", "root"), on(ReviewAdmitted, "scope", "root")),
		contained(on(ReviewStartScope, "child", "root"), on(ReviewScope, "scope", "root")),
		key(on(ReviewStartScope, "child", "root")),
		contained(on(ReviewAdmitted, "scope", "root"), on(ReviewScope, "scope", "root")),
		contained(on(ReviewSkipped, "scope"), on(ReviewRoot, "scope")),
		contained(on(ReviewSkipped, "by"), on(ReviewRoot, "scope")),
		contained(on(ReviewStep, "scope", "root"), on(ReviewAdmitted, "scope", "root")),
		contained(on(ReviewStartStep, "scope", "root"), on(ReviewAdmitted, "scope", "root")),
		contained(on(ReviewStartStep, "step", "root"), on(ReviewStep, "step", "root")),
		key(on(ReviewStartStep, "step", "root")),
		contained(on(ReviewFinish, "scope", "root"), on(ReviewAdmitted, "scope", "root")),
		contained(on(ReviewFinish, "step", "root"), on(ReviewStep, "step", "root")),
		key(on(ReviewFinish, "step", "root")),
		contained(on(ReviewClaim, "step", "root"), on(ReviewStep, "step", "root")),
		contained(
			on(ReviewEnded, "step", "attempt", "root"),
			on(ReviewClaim, "step", "attempt", "root")
		),
		contained(
			on(
				select(ReviewClaim, (row) => row.ge(row.attempt, 1n)),
				"step",
				pred("attempt"),
				"root"
			),
			on(ReviewEnded, "step", "attempt", "root")
		),
		contained(
			on(ReviewRetry, "step", "attempt", "root"),
			on(ReviewEnded, "step", "attempt", "root")
		),
		contained(
			on(ReviewFenced, "step", "attempt", "root"),
			on(ReviewEnded, "step", "attempt", "root")
		),
		contained(on(ReviewResult, "step", "root"), on(ReviewStep, "step", "root")),
		contained(
			on(ReviewHeld, "step", "attempt", "root"),
			on(ReviewClaim, "step", "attempt", "root")
		),
		contained(on(ReviewHeld, "step", "root"), on(ReviewResult, "step", "root")),
		contained(
			on(ReviewDone, "step", "root"),
			on(
				select(ReviewResult, (row) => row.eq(row.outcome, "done")),
				"step",
				"root"
			)
		),
		contained(
			on(ReviewFailed, "step", "root"),
			on(
				select(ReviewResult, (row) => row.eq(row.outcome, "failed")),
				"step",
				"root"
			)
		),
		contained(on(ReviewRefusal, "step", "root"), on(ReviewFailed, "step", "root")),
		contained(on(ReviewExhausted, "step", "root"), on(ReviewFailed, "step", "root")),
		contained(
			on(ReviewAnalyzeInput, "step", "root"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Analyze")),
				"step",
				"root"
			)
		),
		contained(
			on(ReviewGatherInput, "step", "root"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Gather")),
				"step",
				"root"
			)
		),
		contained(on(ReviewGatherInputSizes, "step", "root"), on(ReviewGatherInput, "step", "root")),
		contained(
			on(
				select(ReviewGatherInputSizes, (row) => row.ge(row.ordinal, 1n)),
				"step",
				pred("ordinal"),
				"root"
			),
			on(ReviewGatherInputSizes, "step", "ordinal", "root")
		),
		contained(
			on(ReviewSaveInput, "step", "root"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Save")),
				"step",
				"root"
			)
		),
		contained(
			on(ReviewQuestionsInput, "scope", "root"),
			on(
				select(ReviewWithin, (row) => row.eq(row.kind, "Questions")),
				"scope",
				"root"
			)
		),
		contained(
			on(ReviewReviewRunInput, "scope"),
			on(
				select(ReviewRoot, (row) => row.eq(row.kind, "ReviewRun")),
				"scope"
			)
		),
		contained(
			on(ReviewReviewRunInputSizes, "scope", "root"),
			on(ReviewReviewRunInput, "scope", "root")
		),
		contained(
			on(
				select(ReviewReviewRunInputSizes, (row) => row.ge(row.ordinal, 1n)),
				"scope",
				pred("ordinal"),
				"root"
			),
			on(ReviewReviewRunInputSizes, "scope", "ordinal", "root")
		),
		contained(on(ReviewAnalyzeOutput, "step", "root"), on(ReviewAnalyzeInput, "step", "root")),
		contained(on(ReviewAnalyzeOutput, "step", "root"), on(ReviewDone, "step", "root")),
		contained(on(ReviewGatherOutput, "step", "root"), on(ReviewGatherInput, "step", "root")),
		contained(on(ReviewGatherOutput, "step", "root"), on(ReviewDone, "step", "root")),
		contained(on(ReviewSaveOutput, "step", "root"), on(ReviewSaveInput, "step", "root")),
		contained(on(ReviewSaveOutput, "step", "root"), on(ReviewDone, "step", "root")),
		contained(on(ReviewQuestionsFinishOutput, "step", "root"), on(ReviewDone, "step", "root")),
		contained(on(ReviewReviewRunFinishOutput, "step", "root"), on(ReviewDone, "step", "root")),
		contained(on(ReviewSplit, "from", "root"), on(ReviewGatherOutput, "step", "root")),
		contained(on(ReviewSplit, "to", "root"), on(ReviewQuestionsInput, "scope", "root")),
		key(on(ReviewSplit, "to", "root")),
		contained(on(ReviewSaved, "from", "root"), on(ReviewQuestionsFinishOutput, "step", "root")),
		contained(on(ReviewSaved, "to", "root"), on(ReviewSaveInput, "step", "root")),
		key(on(ReviewSaved, "to", "root")),
		ordered(on(ReviewHold, "step", "root", "attempt", "at"), fin(ReviewClaim, "holds")),
		retirable(ReviewRoot, [
			on(ReviewScope, "root"),
			on(ReviewWithin, "root"),
			on(ReviewAdmitted, "root"),
			on(ReviewSkipped, "root"),
			on(ReviewStep, "root"),
			on(ReviewStartStep, "root"),
			on(ReviewStartScope, "root"),
			on(ReviewFinish, "root"),
			on(ReviewClaim, "root"),
			on(ReviewEnded, "root"),
			on(ReviewRetry, "root"),
			on(ReviewFenced, "root"),
			on(ReviewResult, "root"),
			on(ReviewDone, "root"),
			on(ReviewFailed, "root"),
			on(ReviewHeld, "root"),
			on(ReviewRefusal, "root"),
			on(ReviewExhausted, "root"),
			on(ReviewAnalyzeInput, "root"),
			on(ReviewGatherInput, "root"),
			on(ReviewGatherInputSizes, "root"),
			on(ReviewSaveInput, "root"),
			on(ReviewQuestionsInput, "root"),
			on(ReviewReviewRunInput, "root"),
			on(ReviewReviewRunInputSizes, "root"),
			on(ReviewAnalyzeOutput, "root"),
			on(ReviewGatherOutput, "root"),
			on(ReviewSaveOutput, "root"),
			on(ReviewQuestionsFinishOutput, "root"),
			on(ReviewReviewRunFinishOutput, "root"),
			on(ReviewSplit, "root"),
			on(ReviewSaved, "root"),
			on(ReviewHold, "root")
		])
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
		ReviewResumed
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

/** The flow's seat level: its live holds, at most one a seat, each held below its resource's count. A fragment declares no derived relation, so the schema that lists `reviewGraph` states these on a level over itself, `schema.extend(listing, name, [...reviewSeatLevel.relations], [...reviewSeatLevel.laws])`. */
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
