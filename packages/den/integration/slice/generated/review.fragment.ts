import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Review to; `den generate` writes it, and nothing edits it. */
import * as g from "@bjornpagen/grizzle"
import { Delivered } from "#integration/slice/relations.ts"

export const ReviewKind = g.closed.unordered("ReviewKind", [
	"Analyze",
	"Gather",
	"Save",
	"QuestionsFinish",
	"ReviewRunFinish"
])
export const ReviewRootKind = g.closed.unordered("ReviewRootKind", ["ReviewRun"])
export const ReviewChildKind = g.closed.unordered("ReviewChildKind", ["Questions"])
export const ReviewOutcome = g.closed.unordered("ReviewOutcome", ["done", "failed"])
export const ReviewRetryWhy = g.closed.unordered("ReviewRetryWhy", ["spent", "transient", "later"])
export const ReviewPausable = g.closed.unordered("ReviewPausable", ["Anthropic", "ReviewRun"])
export const ReviewResource = g.closed.unordered("ReviewResource", ["Anthropic"])
const ReviewSeats = g.closed.relation(
	"ReviewSeats",
	{ resource: g.closedId(ReviewResource), seats: g.natural },
	["resource"],
	[{ resource: "Anthropic", seats: 2n }]
)

export const ReviewScope = g.relation("ReviewScope", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const ReviewRoot = g.relation(
	"ReviewRoot",
	{ root: g.sha256, kind: g.closedId(ReviewRootKind), key: Text, at: DenInstant },
	["root"]
)
export const ReviewRequestedWith = g.relation(
	"ReviewRequestedWith",
	{ root: g.sha256, fingerprint: g.sha256, input: g.sha256 },
	["root"]
)
export const ReviewWithin = g.relation(
	"ReviewWithin",
	{ root: g.sha256, scope: g.sha256, parent: g.sha256, kind: g.closedId(ReviewChildKind) },
	["root", "scope"]
)
export const ReviewAdmitted = g.relation("ReviewAdmitted", { root: g.sha256, scope: g.sha256 }, [
	"root",
	"scope"
])
export const ReviewSkipped = g.relation(
	"ReviewSkipped",
	{ root: g.sha256, scope: g.sha256, by: g.sha256 },
	["root", "scope"]
)
export const ReviewStep = g.relation(
	"ReviewStep",
	{
		root: g.sha256,
		step: g.sha256,
		kind: g.closedId(ReviewKind),
		scope: g.sha256,
		due: DenInstant
	},
	["root", "step"]
)
export const ReviewStartStep = g.relation(
	"ReviewStartStep",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, step: g.sha256 },
	["root", "scope", "ordinal"]
)
export const ReviewStartScope = g.relation(
	"ReviewStartScope",
	{ root: g.sha256, scope: g.sha256, ordinal: g.natural, child: g.sha256 },
	["root", "scope", "ordinal"]
)
export const ReviewFinish = g.relation(
	"ReviewFinish",
	{ root: g.sha256, scope: g.sha256, step: g.sha256 },
	["root", "scope"]
)
export const ReviewClaim = g.relation(
	"ReviewClaim",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.place,
		until: DenInstant,
		holds: g.drawn(g.natural)
	},
	["root", "step", "attempt"]
)
export const ReviewEnded = g.relation(
	"ReviewEnded",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const ReviewRetry = g.relation(
	"ReviewRetry",
	{
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: DenInstant,
		why: g.closedId(ReviewRetryWhy)
	},
	["root", "step", "attempt"]
)
export const ReviewFenced = g.relation(
	"ReviewFenced",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step", "attempt"]
)
export const ReviewResult = g.relation(
	"ReviewResult",
	{ root: g.sha256, step: g.sha256, outcome: g.closedId(ReviewOutcome) },
	["root", "step"]
)
export const ReviewDone = g.relation("ReviewDone", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ReviewFailed = g.relation("ReviewFailed", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ReviewHeld = g.relation(
	"ReviewHeld",
	{ root: g.sha256, step: g.sha256, attempt: g.natural },
	["root", "step"]
)
export const ReviewRefusal = g.relation(
	"ReviewRefusal",
	{ root: g.sha256, step: g.sha256, law: Text },
	["root", "step"]
)
export const ReviewExhausted = g.relation("ReviewExhausted", { root: g.sha256, step: g.sha256 }, [
	"root",
	"step"
])
export const ReviewAnalyzeInput = g
	.derivedName({ stem: "Review", path: ["AnalyzeInput"] })
	.relation(
		"ReviewAnalyzeInput",
		{ root: g.sha256, step: g.sha256, review: Text, group: g.int8, question: g.int8 },
		["root", "step"]
	)
export const ReviewGatherInput = g
	.derivedName({ stem: "Review", path: ["GatherInput"] })
	.relation(
		"ReviewGatherInput",
		{ root: g.sha256, step: g.sha256, review: Delivered.fields.attempt },
		["root", "step"]
	)
export const ReviewGatherInputSizes = g
	.derivedName({ stem: "Review", path: ["GatherInputSizes"] })
	.relation(
		"ReviewGatherInputSizes",
		{ root: g.sha256, step: g.sha256, ordinal: g.natural, value: g.int8 },
		["root", "step", "ordinal"]
	)
export const ReviewSaveInput = g
	.derivedName({ stem: "Review", path: ["SaveInput"] })
	.relation(
		"ReviewSaveInput",
		{ root: g.sha256, step: g.sha256, review: Text, group: g.int8, count: g.int8, total: g.int8 },
		["root", "step"]
	)
export const ReviewQuestionsInput = g
	.derivedName({ stem: "Review", path: ["QuestionsInput"] })
	.relation(
		"ReviewQuestionsInput",
		{ root: g.sha256, scope: g.sha256, review: Text, group: g.int8, size: g.int8 },
		["root", "scope"]
	)
export const ReviewReviewRunInput = g
	.derivedName({ stem: "Review", path: ["ReviewRunInput"] })
	.relation("ReviewReviewRunInput", { root: g.sha256, scope: g.sha256, review: Text }, [
		"root",
		"scope"
	])
export const ReviewReviewRunInputSizes = g
	.derivedName({ stem: "Review", path: ["ReviewRunInputSizes"] })
	.relation(
		"ReviewReviewRunInputSizes",
		{ root: g.sha256, scope: g.sha256, ordinal: g.natural, value: g.int8 },
		["root", "scope", "ordinal"]
	)
export const ReviewAnalyzeOutput = g
	.derivedName({ stem: "Review", path: ["AnalyzeOutput"] })
	.relation("ReviewAnalyzeOutput", { root: g.sha256, step: g.sha256, score: g.int8 }, [
		"root",
		"step"
	])
export const ReviewGatherOutput = g
	.derivedName({ stem: "Review", path: ["GatherOutput"] })
	.relation("ReviewGatherOutput", { root: g.sha256, step: g.sha256, groups: g.int8 }, [
		"root",
		"step"
	])
export const ReviewSaveOutput = g
	.derivedName({ stem: "Review", path: ["SaveOutput"] })
	.relation("ReviewSaveOutput", { root: g.sha256, step: g.sha256, total: g.int8 }, ["root", "step"])
export const ReviewQuestionsFinishOutput = g
	.derivedName({ stem: "Review", path: ["QuestionsFinishOutput"] })
	.relation(
		"ReviewQuestionsFinishOutput",
		{ root: g.sha256, step: g.sha256, count: g.int8, total: g.int8 },
		["root", "step"]
	)
export const ReviewReviewRunFinishOutput = g
	.derivedName({ stem: "Review", path: ["ReviewRunFinishOutput"] })
	.relation("ReviewReviewRunFinishOutput", { root: g.sha256, step: g.sha256 }, ["root", "step"])
export const ReviewSplit = g
	.derivedName({ stem: "Review", path: ["Split"] })
	.relation("ReviewSplit", { root: g.sha256, from: g.sha256, ordinal: g.natural, to: g.sha256 }, [
		"root",
		"from",
		"ordinal"
	])
export const ReviewSaved = g
	.derivedName({ stem: "Review", path: ["Saved"] })
	.relation("ReviewSaved", { root: g.sha256, from: g.sha256, ordinal: g.natural, to: g.sha256 }, [
		"root",
		"from",
		"ordinal"
	])
const ReviewHold = g.relation(
	"ReviewHold",
	{
		resource: g.closedId(ReviewResource),
		root: g.sha256,
		step: g.sha256,
		attempt: g.natural,
		at: g.drawn(g.natural),
		seat: g.natural
	},
	["resource", "root", "step", "attempt"]
)
export const ReviewPaused = g.relation(
	"ReviewPaused",
	{ target: g.closedId(ReviewPausable), turn: g.natural },
	["target", "turn"]
)
export const ReviewResumed = g.relation(
	"ReviewResumed",
	{ target: g.closedId(ReviewPausable), turn: g.natural },
	["target", "turn"]
)
export const ReviewServed = g.relation(
	"ReviewServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const reviewGraph = g.fragment(
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
		ReviewRequestedWith,
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
		g.unit("DenRoot", { root: g.sha256 }),
		g.key(g.on(ReviewScope, "scope")),
		g.key(g.on(ReviewStep, "step")),
		g.contained(g.on(ReviewWithin, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.contained(g.on(ReviewWithin, "root", "parent"), g.on(ReviewScope, "root", "scope")),
		g.contained(g.on(ReviewStartScope, "root", "scope"), g.on(ReviewAdmitted, "root", "scope")),
		g.contained(g.on(ReviewStartScope, "root", "child"), g.on(ReviewScope, "root", "scope")),
		g.key(g.on(ReviewStartScope, "root", "child")),
		g.contained(g.on(ReviewAdmitted, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.contained(g.on(ReviewSkipped, "scope"), g.on(ReviewRoot, "root")),
		g.contained(g.on(ReviewSkipped, "by"), g.on(ReviewRoot, "root")),
		g.contained(g.on(ReviewRequestedWith, "root"), g.on(ReviewRoot, "root")),
		g.contained(g.on(ReviewStep, "root", "scope"), g.on(ReviewAdmitted, "root", "scope")),
		g.contained(g.on(ReviewStartStep, "root", "scope"), g.on(ReviewAdmitted, "root", "scope")),
		g.contained(g.on(ReviewStartStep, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.key(g.on(ReviewStartStep, "root", "step")),
		g.contained(g.on(ReviewFinish, "root", "scope"), g.on(ReviewAdmitted, "root", "scope")),
		g.contained(g.on(ReviewFinish, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.key(g.on(ReviewFinish, "root", "step")),
		g.contained(g.on(ReviewClaim, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.contained(
			g.on(ReviewEnded, "root", "step", "attempt"),
			g.on(ReviewClaim, "root", "step", "attempt")
		),
		g.contained(
			g.on(
				g.select(ReviewClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				g.pred("attempt")
			),
			g.on(ReviewEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(ReviewRetry, "root", "step", "attempt"),
			g.on(ReviewEnded, "root", "step", "attempt")
		),
		g.contained(
			g.on(ReviewFenced, "root", "step", "attempt"),
			g.on(ReviewEnded, "root", "step", "attempt")
		),
		g.contained(g.on(ReviewResult, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.contained(
			g.on(ReviewHeld, "root", "step", "attempt"),
			g.on(ReviewClaim, "root", "step", "attempt")
		),
		g.contained(g.on(ReviewHeld, "root", "step"), g.on(ReviewResult, "root", "step")),
		g.contained(
			g.on(ReviewDone, "root", "step"),
			g.on(
				g.select(ReviewResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ReviewFailed, "root", "step"),
			g.on(
				g.select(ReviewResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		g.contained(g.on(ReviewRefusal, "root", "step"), g.on(ReviewFailed, "root", "step")),
		g.contained(g.on(ReviewExhausted, "root", "step"), g.on(ReviewFailed, "root", "step")),
		g.contained(
			g.on(
				g.select(ReviewRoot, (row) => row.eq(row.kind, "ReviewRun")),
				"root"
			),
			g.on(ReviewRequestedWith, "root")
		),
		g.contained(
			g.on(ReviewAnalyzeInput, "root", "step"),
			g.on(
				g.select(ReviewStep, (row) => row.eq(row.kind, "Analyze")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ReviewGatherInput, "root", "step"),
			g.on(
				g.select(ReviewStep, (row) => row.eq(row.kind, "Gather")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ReviewGatherInputSizes, "root", "step"),
			g.on(ReviewGatherInput, "root", "step")
		),
		g.contained(
			g.on(
				g.select(ReviewGatherInputSizes, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				g.pred("ordinal")
			),
			g.on(ReviewGatherInputSizes, "root", "step", "ordinal")
		),
		g.contained(
			g.on(ReviewSaveInput, "root", "step"),
			g.on(
				g.select(ReviewStep, (row) => row.eq(row.kind, "Save")),
				"root",
				"step"
			)
		),
		g.contained(
			g.on(ReviewQuestionsInput, "root", "scope"),
			g.on(
				g.select(ReviewWithin, (row) => row.eq(row.kind, "Questions")),
				"root",
				"scope"
			)
		),
		g.contained(
			g.on(ReviewReviewRunInput, "scope"),
			g.on(
				g.select(ReviewRoot, (row) => row.eq(row.kind, "ReviewRun")),
				"root"
			)
		),
		g.contained(
			g.on(ReviewReviewRunInputSizes, "root", "scope"),
			g.on(ReviewReviewRunInput, "root", "scope")
		),
		g.contained(
			g.on(
				g.select(ReviewReviewRunInputSizes, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				g.pred("ordinal")
			),
			g.on(ReviewReviewRunInputSizes, "root", "scope", "ordinal")
		),
		g.contained(
			g.on(ReviewAnalyzeOutput, "root", "step"),
			g.on(ReviewAnalyzeInput, "root", "step")
		),
		g.contained(g.on(ReviewAnalyzeOutput, "root", "step"), g.on(ReviewDone, "root", "step")),
		g.contained(g.on(ReviewGatherOutput, "root", "step"), g.on(ReviewGatherInput, "root", "step")),
		g.contained(g.on(ReviewGatherOutput, "root", "step"), g.on(ReviewDone, "root", "step")),
		g.contained(g.on(ReviewSaveOutput, "root", "step"), g.on(ReviewSaveInput, "root", "step")),
		g.contained(g.on(ReviewSaveOutput, "root", "step"), g.on(ReviewDone, "root", "step")),
		g.contained(
			g.on(ReviewQuestionsFinishOutput, "root", "step"),
			g.on(ReviewDone, "root", "step")
		),
		g.contained(
			g.on(ReviewReviewRunFinishOutput, "root", "step"),
			g.on(ReviewDone, "root", "step")
		),
		g.contained(g.on(ReviewSplit, "root", "from"), g.on(ReviewGatherOutput, "root", "step")),
		g.contained(g.on(ReviewSplit, "root", "to"), g.on(ReviewQuestionsInput, "root", "scope")),
		g.key(g.on(ReviewSplit, "root", "to")),
		g.contained(
			g.on(ReviewSaved, "root", "from"),
			g.on(ReviewQuestionsFinishOutput, "root", "step")
		),
		g.contained(g.on(ReviewSaved, "root", "to"), g.on(ReviewSaveInput, "root", "step")),
		g.key(g.on(ReviewSaved, "root", "to")),
		g.unit("ReviewSeat", { resource: g.closedId(ReviewResource) }),
		g.ordered(g.on(ReviewHold, "root", "step", "attempt", "at"), g.fin(ReviewClaim, "holds")),
		g.mutable(ReviewHold),
		g.contained(g.on(ReviewScope, "root"), g.on(ReviewRoot, "root")),
		g.mutable(ReviewScope),
		g.mutable(ReviewWithin),
		g.mutable(ReviewAdmitted),
		g.contained(g.on(ReviewSkipped, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewSkipped),
		g.contained(g.on(ReviewStep, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewStep),
		g.contained(g.on(ReviewStartStep, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewStartStep),
		g.contained(g.on(ReviewStartScope, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewStartScope),
		g.contained(g.on(ReviewFinish, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewFinish),
		g.mutable(ReviewClaim),
		g.contained(g.on(ReviewEnded, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewEnded),
		g.contained(g.on(ReviewRetry, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewRetry),
		g.contained(g.on(ReviewFenced, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewFenced),
		g.mutable(ReviewResult),
		g.contained(g.on(ReviewDone, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewDone),
		g.contained(g.on(ReviewFailed, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewFailed),
		g.contained(g.on(ReviewHeld, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewHeld),
		g.contained(g.on(ReviewRefusal, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewRefusal),
		g.contained(g.on(ReviewExhausted, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewExhausted),
		g.contained(g.on(ReviewAnalyzeInput, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewAnalyzeInput),
		g.contained(g.on(ReviewGatherInput, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewGatherInput),
		g.contained(g.on(ReviewGatherInputSizes, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewGatherInputSizes),
		g.contained(g.on(ReviewSaveInput, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewSaveInput),
		g.contained(g.on(ReviewQuestionsInput, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewQuestionsInput),
		g.contained(g.on(ReviewReviewRunInput, "root", "scope"), g.on(ReviewScope, "root", "scope")),
		g.mutable(ReviewReviewRunInput),
		g.contained(
			g.on(ReviewReviewRunInputSizes, "root", "scope"),
			g.on(ReviewScope, "root", "scope")
		),
		g.mutable(ReviewReviewRunInputSizes),
		g.contained(g.on(ReviewAnalyzeOutput, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewAnalyzeOutput),
		g.contained(g.on(ReviewGatherOutput, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewGatherOutput),
		g.contained(g.on(ReviewSaveOutput, "root", "step"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewSaveOutput),
		g.contained(
			g.on(ReviewQuestionsFinishOutput, "root", "step"),
			g.on(ReviewStep, "root", "step")
		),
		g.mutable(ReviewQuestionsFinishOutput),
		g.contained(
			g.on(ReviewReviewRunFinishOutput, "root", "step"),
			g.on(ReviewStep, "root", "step")
		),
		g.mutable(ReviewReviewRunFinishOutput),
		g.contained(g.on(ReviewSplit, "root", "from"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewSplit),
		g.contained(g.on(ReviewSaved, "root", "from"), g.on(ReviewStep, "root", "step")),
		g.mutable(ReviewSaved)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const reviewCoordination = g.fragment(
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
		g.contained(g.on(ReviewResumed, "target", "turn"), g.on(ReviewPaused, "target", "turn")),
		g.contained(g.on(ReviewPaused, "target", g.pred("turn")), g.on(ReviewResumed, "target", "turn"))
	]
)

/** The flow's live holds: each hold whose claim's attempt has neither ended nor held its step's result, with its claim's lease, which den's role reads as the seats' holders. */
const ReviewLive = g.derived(
	"ReviewLive",
	g.query(reviewGraph).rule((r) => {
		const { step, root, attempt, resource, seat } = g.v(ReviewHold, "reviewHold")
		const { until } = g.v(ReviewClaim, "reviewClaim")
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
		g.key(g.on(ReviewLive, "resource", "seat")),
		g.check("ReviewSeatBelowCount", ReviewLive, (row) =>
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
