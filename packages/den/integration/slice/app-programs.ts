import { denClock } from "@bjornpagen/den/algebra/kinds"
import { denInstantKey } from "@bjornpagen/den/lower/keys"
import * as g from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	AssignDecideReadNearest,
	AssignDecideReadNearestRow,
	AssignDecideOutput,
	AssignDecideOutputStageServe,
	AssignDecideOutputWeighed,
	AssignDecideReadSeen,
	AssignDecideReadSeenRow,
	AssignResult,
	AssignStep
} from "#integration/slice/generated/assign.fragment.ts"
import {
	ChainAdmitted,
	ChainChainRunInput,
	ChainClaim,
	ChainFinish,
	ChainNext,
	ChainOrderedInput,
	ChainPageInput,
	ChainPageInputAfter,
	ChainPageOutput,
	ChainPageOutputNext,
	ChainPageReadWeights,
	ChainPageReadEarlierRow,
	ChainPageReadTree,
	ChainPageReadTreeRecords,
	ChainPageReadTreeRow,
	chainGraph,
	ChainPageReadWeightsRow,
	ChainRequestedWith,
	ChainResult,
	ChainRoot,
	ChainStartStep,
	ChainStep
} from "#integration/slice/generated/chain.fragment.ts"
import { chainRequests } from "#integration/slice/generated/chain.programs.ts"
import {
	FanAdmitted,
	FanBatchInput,
	FanClaim,
	FanFanRunInput,
	FanFinish,
	FanResult,
	FanRoot,
	FanScope,
	FanSquareInput,
	FanSquareOutput,
	FanStartScope,
	FanStartStep,
	FanStep,
	FanWantedInput,
	FanWantedKey,
	FanWithin,
	fanGraph
} from "#integration/slice/generated/fan.fragment.ts"
import { fanRequests } from "#integration/slice/generated/fan.programs.ts"
import {
	RetryClaim,
	RetryExhausted,
	RetryResult,
	RetryStep
} from "#integration/slice/generated/retry.fragment.ts"
import {
	ReviewFinish,
	ReviewResult,
	ReviewStep,
	ReviewWithin,
	reviewGraph
} from "#integration/slice/generated/review.fragment.ts"
import {
	SyncAdmitted,
	SyncFinish,
	SyncResult,
	SyncScope,
	SyncSkipped
} from "#integration/slice/generated/sync.fragment.ts"
import {
	Assigned,
	Audit,
	Built,
	Chimed,
	Concluded,
	Copied,
	Cursor,
	Heard,
	Item,
	Order,
	Passage,
	Reviewed,
	Seen,
	Settled,
	Summary,
	Tally,
	Want,
	Weight
} from "#integration/slice/relations.ts"
import { Loader } from "#integration/slice/roles.ts"

/**
 * The app's own programs, apart from den's: its auditor role and its reads, and its writer role's own writes (an order
 * requesting a chain in its own transaction, a feed's weight, a batch's wanted sizes and the run they derive, a passage
 * and its embedding, a passage a learner saw). The certification suite certifies them alone, as an installation with no
 * den program would.
 */

/** A review claim's seats, the graph's own relation, which the fragment lists and does not name apart. */
const ReviewHold = reviewGraph.relations.ReviewHold

/** A fan claim's seats, the graph's own relation, which the fragment lists and does not name apart. */
const FanHold = fanGraph.relations.FanHold

/**
 * The app's own reading role: it reads den's facts beside its own items, cursors and tallies, joins them, and inserts
 * audits that reference den's results by foreign key. Its reads are what the suites hold den to, the differential
 * harness's trace among them.
 */
export const Auditor = g.role(
	App,
	"auditor",
	{
		Assigned,
		AssignDecideReadNearest,
		AssignDecideReadNearestRow,
		AssignDecideOutput,
		AssignDecideOutputStageServe,
		AssignDecideOutputWeighed,
		AssignDecideReadSeen,
		AssignDecideReadSeenRow,
		AssignResult,
		AssignStep,
		Audit,
		Built,
		Chimed,
		Concluded,
		...chainGraph.relations,
		Copied,
		Cursor,
		FanAdmitted,
		FanBatchInput,
		FanClaim,
		FanFanRunInput,
		FanFinish,
		FanHold,
		FanResult,
		FanRoot,
		FanScope,
		FanSquareInput,
		FanSquareOutput,
		FanStartScope,
		FanStartStep,
		FanStep,
		FanWantedInput,
		FanWantedKey,
		FanWithin,
		Heard,
		Item,
		Order,
		RetryClaim,
		RetryExhausted,
		RetryResult,
		RetryStep,
		ReviewFinish,
		ReviewHold,
		ReviewResult,
		ReviewStep,
		ReviewWithin,
		Reviewed,
		Settled,
		SyncAdmitted,
		SyncFinish,
		SyncResult,
		SyncScope,
		SyncSkipped,
		Summary,
		Tally,
		Want,
		Weight
	},
	{ insert: ["Audit"] }
)

/** Every page den read, as the typed row of its output, with the scope it ran in. */
const pages = g.query(Auditor).rule((r) => {
	const { step, scope } = g.v(ChainStep, "step")
	const { seq, items, earlier } = g.v(ChainPageOutput, "output")
	return r
		.match(ChainStep, { step, kind: "Page", scope })
		.match(ChainPageOutput, { step, seq, items, earlier })
		.match(ChainResult, { step, outcome: "done" })
		.find({ step, scope, seq, items, earlier })
})

/** The weight rows each page read before its body ran, recorded with its result: each reference with its row. */
const pageReads = g.query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = g.v(ChainPageReadWeights, "read")
	const { feed, factor } = g.v(ChainPageReadWeightsRow, "row")
	return r
		.match(ChainPageReadWeights, { step, ordinal, digest, root })
		.match(ChainPageReadWeightsRow, { digest, feed, factor })
		.find({ step, ordinal, feed, factor })
})

/** The items the chain's pages read of their feed before them, each recorded once, however many roots read it. */
const earlierRows = g.query(Auditor).rule((r) => {
	const { digest, feed, seq, n } = g.v(ChainPageReadEarlierRow, "row")
	return r.match(ChainPageReadEarlierRow, { digest, feed, seq, n }).find({ digest, feed, seq, n })
})

/** Each page's tree of its feed's weight, by its reference in its root: the row it found, by its digest. */
const treeReads = g.query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = g.v(ChainPageReadTree, "read")
	const { feed, factor } = g.v(ChainPageReadTreeRow, "row")
	return r
		.match(ChainPageReadTree, { step, ordinal, digest, root })
		.match(ChainPageReadTreeRow, { digest, feed, factor })
		.find({ step, ordinal, digest, root, feed, factor })
})

/** A recorded tree, read back by its digest: the rows of the read's query as it found them. */
const treeRecords = g.recordsQuery(chainGraph, ChainPageReadTreeRecords)

const weights = g.query(Auditor).rule((r) => {
	const { feed, factor } = g.v(Weight, "weight")
	return r.match(Weight, { feed, factor }).find({ feed, factor })
})

const items = g.query(Auditor).rule((r) => {
	const { feed, seq, n } = g.v(Item, "item")
	return r.match(Item, { feed, seq, n }).find({ feed, seq, n })
})

const cursors = g.query(Auditor).rule((r) => {
	const { feed, position } = g.v(Cursor, "cursor")
	return r.match(Cursor, { feed, position }).find({ feed, position })
})

const chainFinishes = g.query(Auditor).rule((r) => {
	const { scope, step } = g.v(ChainFinish, "finish")
	const { outcome } = g.v(ChainResult, "result")
	return r
		.match(ChainFinish, { scope, step })
		.match(ChainResult, { step, outcome })
		.find({ scope, step, outcome })
})

const chainClaims = g.query(Auditor).rule((r) => {
	const { step, attempt, until } = g.v(ChainClaim, "claim")
	return r.match(ChainClaim, { step, attempt, until }).find({ step, attempt, until })
})

const tallies = g.query(Auditor).rule((r) => {
	const { batch, count, total } = g.v(Tally, "tally")
	return r.match(Tally, { batch, count, total }).find({ batch, count, total })
})

const settled = g.query(Auditor).rule((r) => {
	const { batch } = g.v(Settled, "settled")
	return r.match(Settled, { batch }).find({ batch })
})

const fanFinishes = g.query(Auditor).rule((r) => {
	const { scope, step } = g.v(FanFinish, "finish")
	const { outcome } = g.v(FanResult, "result")
	return r
		.match(FanFinish, { scope, step })
		.match(FanResult, { step, outcome })
		.find({ scope, step, outcome })
})

/** Every fan claim: its step, its attempt, and how many seats it holds. */
const fanClaims = g.query(Auditor).rule((r) => {
	const { step, attempt, holds } = g.v(FanClaim, "claim")
	return r.match(FanClaim, { step, attempt, holds }).find({ step, attempt, holds })
})

/** Every seat a fan claim held, by its step and attempt. */
const fanHolds = g.query(Auditor).rule((r) => {
	const { step, attempt, resource, seat } = g.v(FanHold, "hold")
	return r.match(FanHold, { step, attempt, resource, seat }).find({ step, attempt, resource, seat })
})

/** Every hour the clock chimed. */
const chimes = g.query(Auditor).rule((r) => {
	const { hour, bell } = g.v(Chimed, "chimed")
	return r.match(Chimed, { hour, bell }).find({ hour, bell })
})

/** Each review's saved groups. */
const reviewed = g.query(Auditor).rule((r) => {
	const { review, group, count, total } = g.v(Reviewed, "reviewed")
	return r.match(Reviewed, { review, group, count, total }).find({ review, group, count, total })
})

/** Each review's summary. */
const summaries = g.query(Auditor).rule((r) => {
	const { review, groups, total } = g.v(Summary, "summary")
	return r.match(Summary, { review, groups, total }).find({ review, groups, total })
})

/** Every review step, its kind and the scope it lives in, with its outcome. */
const reviewSteps = g.query(Auditor).rule((r) => {
	const { step, kind, scope } = g.v(ReviewStep, "step")
	const { outcome } = g.v(ReviewResult, "result")
	return r
		.match(ReviewStep, { step, kind, scope })
		.match(ReviewResult, { step, outcome })
		.find({ step, kind, scope, outcome })
})

/** Every seat a review step's claim held, by its step and attempt, with the step's kind. */
const reviewHolds = g.query(Auditor).rule((r) => {
	const { step, attempt, resource, seat } = g.v(ReviewHold, "hold")
	const { kind } = g.v(ReviewStep, "step")
	return r
		.match(ReviewHold, { step, attempt, resource, seat })
		.match(ReviewStep, { step, kind })
		.find({ step, attempt, kind, resource, seat })
})

/** Every child scope of a review, its parent and its kind. */
const reviewWithins = g.query(Auditor).rule((r) => {
	const { scope, parent, kind } = g.v(ReviewWithin, "within")
	return r.match(ReviewWithin, { scope, parent, kind }).find({ scope, parent, kind })
})

/** Every review scope's finish and its outcome. */
const reviewFinishes = g.query(Auditor).rule((r) => {
	const { scope, step } = g.v(ReviewFinish, "finish")
	const { outcome } = g.v(ReviewResult, "result")
	return r
		.match(ReviewFinish, { scope, step })
		.match(ReviewResult, { step, outcome })
		.find({ scope, step, outcome })
})

const copied = g.query(Auditor).rule((r) => {
	const { relation, run } = g.v(Copied, "copied")
	return r.match(Copied, { relation, run }).find({ relation, run })
})

const built = g.query(Auditor).rule((r) => {
	const { build } = g.v(Built, "built")
	return r.match(Built, { build }).find({ build })
})

const syncAdmitted = g.query(Auditor).rule((r) => {
	const { scope } = g.v(SyncAdmitted, "admitted")
	return r.match(SyncAdmitted, { scope }).find({ scope })
})

const syncSkipped = g.query(Auditor).rule((r) => {
	const { scope, by } = g.v(SyncSkipped, "skipped")
	return r.match(SyncSkipped, { scope, by }).find({ scope, by })
})

const syncFinishes = g.query(Auditor).rule((r) => {
	const { scope, step } = g.v(SyncFinish, "finish")
	const { outcome } = g.v(SyncResult, "result")
	return r
		.match(SyncFinish, { scope, step })
		.match(SyncResult, { step, outcome })
		.find({ scope, step, outcome })
})

const retryResults = g.query(Auditor).rule((r) => {
	const { step, kind, scope } = g.v(RetryStep, "step")
	const { outcome } = g.v(RetryResult, "result")
	return r
		.match(RetryStep, { step, kind, scope })
		.match(RetryResult, { step, outcome })
		.find({ step, kind, scope, outcome })
})

const retryClaims = g.query(Auditor).rule((r) => {
	const { step, attempt } = g.v(RetryClaim, "claim")
	return r.match(RetryClaim, { step, attempt }).find({ step, attempt })
})

const retryExhausted = g.query(Auditor).rule((r) => {
	const { step } = g.v(RetryExhausted, "exhausted")
	return r.match(RetryExhausted, { step }).find({ step })
})

/** What each throttled call's run heard from its source. */
const heard = g.query(Auditor).rule((r) => {
	const { key, answered } = g.v(Heard, "heard")
	return r.match(Heard, { key, answered }).find({ key, answered })
})

/** Every assignment step's result, with its scope. */
const assignResults = g.query(Auditor).rule((r) => {
	const { step, kind, scope } = g.v(AssignStep, "step")
	const { outcome } = g.v(AssignResult, "result")
	return r
		.match(AssignStep, { step, kind, scope })
		.match(AssignResult, { step, outcome })
		.find({ step, kind, scope, outcome })
})

/** The passages each decision's nearest read found, recorded with its result: each one's ordinal and distance. */
const nearestReads = g.query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = g.v(AssignDecideReadNearest, "read")
	const { passage, topic, distance } = g.v(AssignDecideReadNearestRow, "row")
	return r
		.match(AssignDecideReadNearest, { step, ordinal, digest, root })
		.match(AssignDecideReadNearestRow, { digest, passage, topic, distance })
		.find({ step, ordinal, digest, root, passage, topic, distance })
})

/** Every passage row any decision's nearest read found, stored once by its digest however many roots found it. */
const nearestRows = g.query(Auditor).rule((r) => {
	const { digest, passage, topic, distance } = g.v(AssignDecideReadNearestRow, "row")
	return r
		.match(AssignDecideReadNearestRow, { digest, passage, topic, distance })
		.find({ digest, passage, topic, distance })
})

/** The seen passages each decision read, recorded with its result. */
const seenReads = g.query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = g.v(AssignDecideReadSeen, "read")
	const { learner, passage } = g.v(AssignDecideReadSeenRow, "row")
	return r
		.match(AssignDecideReadSeen, { step, ordinal, digest, root })
		.match(AssignDecideReadSeenRow, { digest, learner, passage })
		.find({ step, ordinal, digest, root, learner, passage })
})

/** Every seen row any decision read, stored once by its digest however many roots read it. */
const seenRows = g.query(Auditor).rule((r) => {
	const { digest, learner, passage } = g.v(AssignDecideReadSeenRow, "row")
	return r
		.match(AssignDecideReadSeenRow, { digest, learner, passage })
		.find({ digest, learner, passage })
})

/** Each decision as its output row holds it: its stage's tag and its confidence. */
const decisions = g.query(Auditor).rule((r) => {
	const { step, stage, confidence } = g.v(AssignDecideOutput, "decision")
	return r.match(AssignDecideOutput, { step, stage, confidence }).find({ step, stage, confidence })
})

/** The passage each decision that serves one serves, at its distance: its stage's variant. */
const servings = g.query(Auditor).rule((r) => {
	const { step, passage, distance } = g.v(AssignDecideOutputStageServe, "served")
	return r
		.match(AssignDecideOutputStageServe, { step, passage, distance })
		.find({ step, passage, distance })
})

/** The passages each decision weighed, its array as an ordered family. */
const weighings = g.query(Auditor).rule((r) => {
	const { step, ordinal, passage, distance, passed } = g.v(AssignDecideOutputWeighed, "weighed")
	return r
		.match(AssignDecideOutputWeighed, { step, ordinal, passage, distance, passed })
		.find({ step, ordinal, passage, distance, passed })
})

/** Each assignment's conclusion, which its finish wrote from the decision it read back. */
const concluded = g.query(Auditor).rule((r) => {
	const { learner, served, weighed } = g.v(Concluded, "concluded")
	return r.match(Concluded, { learner, served, weighed }).find({ learner, served, weighed })
})

const assigned = g.query(Auditor).rule((r) => {
	const { learner, passage } = g.v(Assigned, "assigned")
	return r.match(Assigned, { learner, passage }).find({ learner, passage })
})

/** Every row of the chain's graph that a step's key names, by its root: its steps, results and page inputs. */
const chainGraphRows = g
	.query(Auditor)
	.rule((r) => {
		const { step, root } = g.v(ChainStep, "step")
		return r.match(ChainStep, { step, root }).find({ step, root })
	})
	.rule((r) => {
		const { step, root } = g.v(ChainResult, "result")
		return r.match(ChainResult, { step, root }).find({ step, root })
	})
	.rule((r) => {
		const { step, root } = g.v(ChainPageInput, "input")
		return r.match(ChainPageInput, { step, root }).find({ step, root })
	})

/** What every chain root was requested with, by its root: its kind's input fingerprint, which a retirement keeps. */
const chainRequestedWith = g.query(Auditor).rule((r) => {
	const { root, fingerprint } = g.v(ChainRequestedWith, "requested")
	return r.match(ChainRequestedWith, { root, fingerprint }).find({ root, fingerprint })
})

/** Every order the app recorded, by its key: the app's own facts, which a write beside a root's request commits. */
const orders = g.query(Auditor).rule((r) => {
	const { order } = g.v(Order, "order")
	return r.match(Order, { order }).find({ order })
})

/**
 * Every Ordered root's input row, by its root, with its count of pages: a request's input, which a clearing of its
 * graph deletes.
 */
const chainOrderedInputs = g.query(Auditor).rule((r) => {
	const { root, pages: count } = g.v(ChainOrderedInput, "input")
	return r.match(ChainOrderedInput, { root, pages: count }).find({ root, pages: count })
})

/** Every chain root's scope, its record, which a clearing of its graph keeps. */
const chainHeaders = g.query(Auditor).rule((r) => {
	const { root: scope, key } = g.v(ChainRoot, "root")
	return r.match(ChainRoot, { root: scope, key }).find({ scope, key })
})

/** An audited result: the app joining den's facts with its own. */
const audited = g.query(Auditor).rule((r) => {
	const { step, root, note } = g.v(Audit, "audit")
	return r
		.match(Audit, { step, root, note })
		.match(ChainResult, { step, root, outcome: "done" })
		.find({ step, note })
})

/** The graph of a flow, read whole, for the differential harness: each relation's every row. */
const every = Object.freeze({
	chainAdmittedAll: g.query(Auditor).rule((r) => {
		const { scope } = g.v(ChainAdmitted, "s")
		return r.match(ChainAdmitted, { scope }).find({ scope })
	}),
	fanAdmittedAll: g.query(Auditor).rule((r) => {
		const { scope } = g.v(FanAdmitted, "s")
		return r.match(FanAdmitted, { scope }).find({ scope })
	}),
	chainRoots: g.query(Auditor).rule((r) => {
		const { root: scope, kind, key } = g.v(ChainRoot, "s")
		return r.match(ChainRoot, { root: scope, kind, key }).find({ scope, kind, key })
	}),
	chainStartSteps: g.query(Auditor).rule((r) => {
		const { scope, ordinal, step } = g.v(ChainStartStep, "s")
		return r.match(ChainStartStep, { scope, ordinal, step }).find({ scope, ordinal, step })
	}),
	chainSteps: g.query(Auditor).rule((r) => {
		const { step, kind, scope } = g.v(ChainStep, "s")
		return r.match(ChainStep, { step, kind, scope }).find({ step, kind, scope })
	}),
	chainFinishSteps: g.query(Auditor).rule((r) => {
		const { scope, step } = g.v(ChainFinish, "s")
		return r.match(ChainFinish, { scope, step }).find({ scope, step })
	}),
	chainResults: g.query(Auditor).rule((r) => {
		const { step, outcome } = g.v(ChainResult, "s")
		return r.match(ChainResult, { step, outcome }).find({ step, outcome })
	}),
	chainNexts: g.query(Auditor).rule((r) => {
		const { from, ordinal, to } = g.v(ChainNext, "s")
		return r.match(ChainNext, { from, ordinal, to }).find({ from, ordinal, to })
	}),
	chainPageInputs: g.query(Auditor).rule((r) => {
		const { step, feed, seq, pages: count } = g.v(ChainPageInput, "s")
		return r
			.match(ChainPageInput, { step, feed, seq, pages: count })
			.find({ step, feed, seq, pages: count })
	}),
	chainPageAfters: g.query(Auditor).rule((r) => {
		const { step, value } = g.v(ChainPageInputAfter, "s")
		return r.match(ChainPageInputAfter, { step, value }).find({ step, value })
	}),
	chainPageOutputs: g.query(Auditor).rule((r) => {
		const { step, seq, items: count } = g.v(ChainPageOutput, "s")
		return r.match(ChainPageOutput, { step, seq, items: count }).find({ step, seq, items: count })
	}),
	chainPageNexts: g.query(Auditor).rule((r) => {
		const { step, value } = g.v(ChainPageOutputNext, "s")
		return r.match(ChainPageOutputNext, { step, value }).find({ step, value })
	}),
	chainRunInputs: g.query(Auditor).rule((r) => {
		const { scope, feed, pages: count } = g.v(ChainChainRunInput, "s")
		return r
			.match(ChainChainRunInput, { scope, feed, pages: count })
			.find({ scope, feed, pages: count })
	}),
	fanRoots: g.query(Auditor).rule((r) => {
		const { root: scope, kind, key } = g.v(FanRoot, "s")
		return r.match(FanRoot, { root: scope, kind, key }).find({ scope, kind, key })
	}),
	fanWithins: g.query(Auditor).rule((r) => {
		const { scope, parent, kind } = g.v(FanWithin, "s")
		return r.match(FanWithin, { scope, parent, kind }).find({ scope, parent, kind })
	}),
	fanStartSteps: g.query(Auditor).rule((r) => {
		const { scope, ordinal, step } = g.v(FanStartStep, "s")
		return r.match(FanStartStep, { scope, ordinal, step }).find({ scope, ordinal, step })
	}),
	fanStartScopes: g.query(Auditor).rule((r) => {
		const { scope, ordinal, child } = g.v(FanStartScope, "s")
		return r.match(FanStartScope, { scope, ordinal, child }).find({ scope, ordinal, child })
	}),
	fanSteps: g.query(Auditor).rule((r) => {
		const { step, kind, scope } = g.v(FanStep, "s")
		return r.match(FanStep, { step, kind, scope }).find({ step, kind, scope })
	}),
	fanFinishSteps: g.query(Auditor).rule((r) => {
		const { scope, step } = g.v(FanFinish, "s")
		return r.match(FanFinish, { scope, step }).find({ scope, step })
	}),
	fanResults: g.query(Auditor).rule((r) => {
		const { step, outcome } = g.v(FanResult, "s")
		return r.match(FanResult, { step, outcome }).find({ step, outcome })
	}),
	fanSquareInputs: g.query(Auditor).rule((r) => {
		const { step, batch, n } = g.v(FanSquareInput, "s")
		return r.match(FanSquareInput, { step, batch, n }).find({ step, batch, n })
	}),
	fanSquareOutputs: g.query(Auditor).rule((r) => {
		const { step, square } = g.v(FanSquareOutput, "s")
		return r.match(FanSquareOutput, { step, square }).find({ step, square })
	}),
	fanBatchInputs: g.query(Auditor).rule((r) => {
		const { scope, batch, size } = g.v(FanBatchInput, "s")
		return r.match(FanBatchInput, { scope, batch, size }).find({ scope, batch, size })
	}),
	fanRunInputs: g.query(Auditor).rule((r) => {
		const { scope, batch, size } = g.v(FanFanRunInput, "s")
		return r.match(FanFanRunInput, { scope, batch, size }).find({ scope, batch, size })
	}),
	fanWantedInputs: g.query(Auditor).rule((r) => {
		const { scope, batch, size } = g.v(FanWantedInput, "s")
		return r.match(FanWantedInput, { scope, batch, size }).find({ scope, batch, size })
	}),
	fanWantedKeys: g.query(Auditor).rule((r) => {
		const { root, batch } = g.v(FanWantedKey, "s")
		return r.match(FanWantedKey, { root, batch }).find({ root, batch })
	})
})

export const auditWorkload = g.workload(Auditor, {
	audit: g.ChangeSet.empty(Auditor).insert(Audit, []),
	audited,
	pages,
	pageReads,
	earlierRows,
	treeReads,
	treeRecords,
	weights,
	items,
	cursors,
	chainFinishes,
	chainClaims,
	tallies,
	settled,
	fanFinishes,
	fanClaims,
	fanHolds,
	reviewed,
	summaries,
	reviewSteps,
	reviewWithins,
	reviewHolds,
	reviewFinishes,
	chimes,
	copied,
	built,
	syncAdmitted,
	syncSkipped,
	syncFinishes,
	retryResults,
	retryClaims,
	retryExhausted,
	heard,
	chainGraphRows,
	chainOrderedInputs,
	chainRequestedWith,
	orders,
	chainHeaders,
	assignResults,
	nearestReads,
	nearestRows,
	seenReads,
	seenRows,
	decisions,
	servings,
	weighings,
	concluded,
	assigned,
	...every
})

/**
 * The app's own writes: an order and the chain it requests, in one transaction, so the root exists exactly when the
 * order does and the relay rings what the commit made eligible; clocked, since the root's instant is the write's own
 * reading of the database's clock. And the sizes it wants a batch at, alone or beside its request of the batch's run,
 * sequenced after them, so the run's size derives from what the write wants too, as metis's ending of a sitting
 * sequences its essay's request after its grading.
 */
export const appWorkload = g.workload(Loader, {
	order: g.clocked(
		g.ChangeSet.union(g.ChangeSet.empty(Loader).insert(Order, []), chainRequests.Ordered),
		{
			[denClock]: "millis"
		},
		{ [denClock]: denInstantKey }
	),
	weigh: g.ChangeSet.empty(Loader).insert(App.relations.Weight, []),
	want: g.ChangeSet.empty(Loader).insert(Want, []),
	wantRun: g.clocked(
		g.ChangeSet.sequence(g.ChangeSet.empty(Loader).insert(Want, []), fanRequests.Wanted),
		{
			[denClock]: "millis"
		},
		{ [denClock]: denInstantKey }
	),
	hear: g.ChangeSet.empty(Loader).insert(Heard, []),
	place: g.ChangeSet.empty(Loader).insert(Passage, []),
	see: g.ChangeSet.empty(Loader).insert(Seen, [])
})

/**
 * The app's editor: it rewrites a passage in place and takes back a seen passage, the edits of a decision's sources
 * after it read them, which leave what it recorded as it found it (integration/records.test.ts).
 */
export const Editor = g.role(App, "editor", { Passage, Seen }, { write: ["Passage", "Seen"] })

/** The editor's edits: a passage put whole at its key, and seen passages deleted. */
export const editWorkload = g.workload(Editor, {
	replace: g.ChangeSet.empty(Editor).put(Passage, []),
	unsee: g.ChangeSet.empty(Editor).delete(Seen, [])
})
