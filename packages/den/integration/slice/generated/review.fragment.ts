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
export const ReviewRequestedWith = relation(
	"ReviewRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
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
export const review_analyze_input_aobppbhebnkae = relation(
	"review_analyze_input_aobppbhebnkae",
	{ root: sha256, step: sha256, review: Text, group: pg.bigint, question: pg.bigint },
	["root", "step"]
)
export const review_gather_input_eiadkjkkdoiel = relation(
	"review_gather_input_eiadkjkkdoiel",
	{ root: sha256, step: sha256, review: Delivered.fields.attempt },
	["root", "step"]
)
export const review_gather_input_sizes_ifjkkjdhlfbgp = relation(
	"review_gather_input_sizes_ifjkkjdhlfbgp",
	{ root: sha256, step: sha256, ordinal: natural, value: pg.bigint },
	["root", "step", "ordinal"]
)
export const review_save_input_njbdjgekhblef = relation(
	"review_save_input_njbdjgekhblef",
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
export const review_questions_input_jigaomgjefjfk = relation(
	"review_questions_input_jigaomgjefjfk",
	{ root: sha256, scope: sha256, review: Text, group: pg.bigint, size: pg.bigint },
	["root", "scope"]
)
export const review_review_run_input_hpdfjnehnkdig = relation(
	"review_review_run_input_hpdfjnehnkdig",
	{ root: sha256, scope: sha256, review: Text },
	["root", "scope"]
)
export const review_review_run_input_sizes_fmllfmbfdoojd = relation(
	"review_review_run_input_sizes_fmllfmbfdoojd",
	{ root: sha256, scope: sha256, ordinal: natural, value: pg.bigint },
	["root", "scope", "ordinal"]
)
export const review_analyze_output_fhhkmphnmpkdm = relation(
	"review_analyze_output_fhhkmphnmpkdm",
	{ root: sha256, step: sha256, score: pg.bigint },
	["root", "step"]
)
export const review_gather_output_cgnhmechbiddp = relation(
	"review_gather_output_cgnhmechbiddp",
	{ root: sha256, step: sha256, groups: pg.bigint },
	["root", "step"]
)
export const review_save_output_falmopiohdlkl = relation(
	"review_save_output_falmopiohdlkl",
	{ root: sha256, step: sha256, total: pg.bigint },
	["root", "step"]
)
export const review_questions_finish_output_kddidbknbjeof = relation(
	"review_questions_finish_output_kddidbknbjeof",
	{ root: sha256, step: sha256, count: pg.bigint, total: pg.bigint },
	["root", "step"]
)
export const review_review_run_finish_output_fbgeikbjoigci = relation(
	"review_review_run_finish_output_fbgeikbjoigci",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const review_split_fnhnebdnlfmck = relation(
	"review_split_fnhnebdnlfmck",
	{ root: sha256, from: sha256, ordinal: natural, to: sha256 },
	["root", "from", "ordinal"]
)
export const review_saved_bppbpjmhcjbaa = relation(
	"review_saved_bppbpjmhcjbaa",
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
		review_analyze_input_aobppbhebnkae,
		review_gather_input_eiadkjkkdoiel,
		review_gather_input_sizes_ifjkkjdhlfbgp,
		review_save_input_njbdjgekhblef,
		review_questions_input_jigaomgjefjfk,
		review_review_run_input_hpdfjnehnkdig,
		review_review_run_input_sizes_fmllfmbfdoojd,
		review_analyze_output_fhhkmphnmpkdm,
		review_gather_output_cgnhmechbiddp,
		review_save_output_falmopiohdlkl,
		review_questions_finish_output_kddidbknbjeof,
		review_review_run_finish_output_fbgeikbjoigci,
		review_split_fnhnebdnlfmck,
		review_saved_bppbpjmhcjbaa,
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
		contained(on(ReviewRequestedWith, "root"), on(ReviewRoot, "root")),
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
			on(
				select(ReviewRoot, (row) => row.eq(row.kind, "ReviewRun")),
				"root"
			),
			on(ReviewRequestedWith, "root")
		),
		contained(
			on(review_analyze_input_aobppbhebnkae, "root", "step"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Analyze")),
				"root",
				"step"
			)
		),
		contained(
			on(review_gather_input_eiadkjkkdoiel, "root", "step"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Gather")),
				"root",
				"step"
			)
		),
		contained(
			on(review_gather_input_sizes_ifjkkjdhlfbgp, "root", "step"),
			on(review_gather_input_eiadkjkkdoiel, "root", "step")
		),
		contained(
			on(
				select(review_gather_input_sizes_ifjkkjdhlfbgp, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"step",
				pred("ordinal")
			),
			on(review_gather_input_sizes_ifjkkjdhlfbgp, "root", "step", "ordinal")
		),
		contained(
			on(review_save_input_njbdjgekhblef, "root", "step"),
			on(
				select(ReviewStep, (row) => row.eq(row.kind, "Save")),
				"root",
				"step"
			)
		),
		contained(
			on(review_questions_input_jigaomgjefjfk, "root", "scope"),
			on(
				select(ReviewWithin, (row) => row.eq(row.kind, "Questions")),
				"root",
				"scope"
			)
		),
		contained(
			on(review_review_run_input_hpdfjnehnkdig, "scope"),
			on(
				select(ReviewRoot, (row) => row.eq(row.kind, "ReviewRun")),
				"root"
			)
		),
		contained(
			on(review_review_run_input_sizes_fmllfmbfdoojd, "root", "scope"),
			on(review_review_run_input_hpdfjnehnkdig, "root", "scope")
		),
		contained(
			on(
				select(review_review_run_input_sizes_fmllfmbfdoojd, (row) => row.ge(row.ordinal, 1n)),
				"root",
				"scope",
				pred("ordinal")
			),
			on(review_review_run_input_sizes_fmllfmbfdoojd, "root", "scope", "ordinal")
		),
		contained(
			on(review_analyze_output_fhhkmphnmpkdm, "root", "step"),
			on(review_analyze_input_aobppbhebnkae, "root", "step")
		),
		contained(
			on(review_analyze_output_fhhkmphnmpkdm, "root", "step"),
			on(ReviewDone, "root", "step")
		),
		contained(
			on(review_gather_output_cgnhmechbiddp, "root", "step"),
			on(review_gather_input_eiadkjkkdoiel, "root", "step")
		),
		contained(
			on(review_gather_output_cgnhmechbiddp, "root", "step"),
			on(ReviewDone, "root", "step")
		),
		contained(
			on(review_save_output_falmopiohdlkl, "root", "step"),
			on(review_save_input_njbdjgekhblef, "root", "step")
		),
		contained(on(review_save_output_falmopiohdlkl, "root", "step"), on(ReviewDone, "root", "step")),
		contained(
			on(review_questions_finish_output_kddidbknbjeof, "root", "step"),
			on(ReviewDone, "root", "step")
		),
		contained(
			on(review_review_run_finish_output_fbgeikbjoigci, "root", "step"),
			on(ReviewDone, "root", "step")
		),
		contained(
			on(review_split_fnhnebdnlfmck, "root", "from"),
			on(review_gather_output_cgnhmechbiddp, "root", "step")
		),
		contained(
			on(review_split_fnhnebdnlfmck, "root", "to"),
			on(review_questions_input_jigaomgjefjfk, "root", "scope")
		),
		key(on(review_split_fnhnebdnlfmck, "root", "to")),
		contained(
			on(review_saved_bppbpjmhcjbaa, "root", "from"),
			on(review_questions_finish_output_kddidbknbjeof, "root", "step")
		),
		contained(
			on(review_saved_bppbpjmhcjbaa, "root", "to"),
			on(review_save_input_njbdjgekhblef, "root", "step")
		),
		key(on(review_saved_bppbpjmhcjbaa, "root", "to")),
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
		contained(
			on(review_analyze_input_aobppbhebnkae, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_analyze_input_aobppbhebnkae),
		contained(
			on(review_gather_input_eiadkjkkdoiel, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_gather_input_eiadkjkkdoiel),
		contained(
			on(review_gather_input_sizes_ifjkkjdhlfbgp, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_gather_input_sizes_ifjkkjdhlfbgp),
		contained(on(review_save_input_njbdjgekhblef, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(review_save_input_njbdjgekhblef),
		contained(
			on(review_questions_input_jigaomgjefjfk, "root", "scope"),
			on(ReviewScope, "root", "scope")
		),
		mutable(review_questions_input_jigaomgjefjfk),
		contained(
			on(review_review_run_input_hpdfjnehnkdig, "root", "scope"),
			on(ReviewScope, "root", "scope")
		),
		mutable(review_review_run_input_hpdfjnehnkdig),
		contained(
			on(review_review_run_input_sizes_fmllfmbfdoojd, "root", "scope"),
			on(ReviewScope, "root", "scope")
		),
		mutable(review_review_run_input_sizes_fmllfmbfdoojd),
		contained(
			on(review_analyze_output_fhhkmphnmpkdm, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_analyze_output_fhhkmphnmpkdm),
		contained(
			on(review_gather_output_cgnhmechbiddp, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_gather_output_cgnhmechbiddp),
		contained(on(review_save_output_falmopiohdlkl, "root", "step"), on(ReviewStep, "root", "step")),
		mutable(review_save_output_falmopiohdlkl),
		contained(
			on(review_questions_finish_output_kddidbknbjeof, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_questions_finish_output_kddidbknbjeof),
		contained(
			on(review_review_run_finish_output_fbgeikbjoigci, "root", "step"),
			on(ReviewStep, "root", "step")
		),
		mutable(review_review_run_finish_output_fbgeikbjoigci),
		contained(on(review_split_fnhnebdnlfmck, "root", "from"), on(ReviewStep, "root", "step")),
		mutable(review_split_fnhnebdnlfmck),
		contained(on(review_saved_bppbpjmhcjbaa, "root", "from"), on(ReviewStep, "root", "step")),
		mutable(review_saved_bppbpjmhcjbaa)
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
	"review_analyze_output_fhhkmphnmpkdm",
	"review_gather_output_cgnhmechbiddp",
	"review_save_output_falmopiohdlkl",
	"review_questions_finish_output_kddidbknbjeof",
	"review_review_run_finish_output_fbgeikbjoigci",
	"ReviewStep",
	"ReviewScope",
	"ReviewWithin",
	"ReviewAdmitted",
	"ReviewFinish",
	"ReviewStartStep",
	"ReviewStartScope",
	"review_analyze_input_aobppbhebnkae",
	"review_gather_input_eiadkjkkdoiel",
	"review_gather_input_sizes_ifjkkjdhlfbgp",
	"review_save_input_njbdjgekhblef",
	"review_questions_input_jigaomgjefjfk",
	"review_split_fnhnebdnlfmck",
	"review_saved_bppbpjmhcjbaa"
] as const
