import { ChangeSet, clocked, query, recordsQuery, role, v, workload } from "@bjornpagen/grizzle"
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
	FanWithin,
	fanGraph
} from "#integration/slice/generated/fan.fragment.ts"
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
	Weight
} from "#integration/slice/relations.ts"
import { Loader } from "#integration/slice/roles.ts"

/**
 * The app's own programs, apart from den's: its auditor role and its reads, and its writer role's own writes (an order
 * requesting a chain in its own transaction, a feed's weight, a passage and its embedding, a passage a learner saw). The certification suite certifies them alone, as an
 * installation with no den program would.
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
export const Auditor = role(
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
		Weight
	},
	{ insert: ["Audit"] }
)

/** Every page den read, as the typed row of its output, with the scope it ran in. */
const pages = query(Auditor).rule((r) => {
	const { step, scope } = v(ChainStep, "step")
	const { seq, items, earlier } = v(ChainPageOutput, "output")
	return r
		.match(ChainStep, { step, kind: "Page", scope })
		.match(ChainPageOutput, { step, seq, items, earlier })
		.match(ChainResult, { step, outcome: "done" })
		.find({ step, scope, seq, items, earlier })
})

/** The weight rows each page read before its body ran, recorded with its result: each reference with its row. */
const pageReads = query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = v(ChainPageReadWeights, "read")
	const { feed, factor } = v(ChainPageReadWeightsRow, "row")
	return r
		.match(ChainPageReadWeights, { step, ordinal, digest, root })
		.match(ChainPageReadWeightsRow, { digest, feed, factor })
		.find({ step, ordinal, feed, factor })
})

/** The items the chain's pages read of their feed before them, each recorded once, however many roots read it. */
const earlierRows = query(Auditor).rule((r) => {
	const { digest, feed, seq, n } = v(ChainPageReadEarlierRow, "row")
	return r.match(ChainPageReadEarlierRow, { digest, feed, seq, n }).find({ digest, feed, seq, n })
})

/** Each page's tree of its feed's weight, by its reference in its root: the row it found, by its digest. */
const treeReads = query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = v(ChainPageReadTree, "read")
	const { feed, factor } = v(ChainPageReadTreeRow, "row")
	return r
		.match(ChainPageReadTree, { step, ordinal, digest, root })
		.match(ChainPageReadTreeRow, { digest, feed, factor })
		.find({ step, ordinal, digest, root, feed, factor })
})

/** A recorded tree, read back by its digest: the rows of the read's query as it found them. */
const treeRecords = recordsQuery(chainGraph, ChainPageReadTreeRecords)

const weights = query(Auditor).rule((r) => {
	const { feed, factor } = v(Weight, "weight")
	return r.match(Weight, { feed, factor }).find({ feed, factor })
})

const items = query(Auditor).rule((r) => {
	const { feed, seq, n } = v(Item, "item")
	return r.match(Item, { feed, seq, n }).find({ feed, seq, n })
})

const cursors = query(Auditor).rule((r) => {
	const { feed, position } = v(Cursor, "cursor")
	return r.match(Cursor, { feed, position }).find({ feed, position })
})

const chainFinishes = query(Auditor).rule((r) => {
	const { scope, step } = v(ChainFinish, "finish")
	const { outcome } = v(ChainResult, "result")
	return r
		.match(ChainFinish, { scope, step })
		.match(ChainResult, { step, outcome })
		.find({ scope, step, outcome })
})

const chainClaims = query(Auditor).rule((r) => {
	const { step, attempt, until } = v(ChainClaim, "claim")
	return r.match(ChainClaim, { step, attempt, until }).find({ step, attempt, until })
})

const tallies = query(Auditor).rule((r) => {
	const { batch, count, total } = v(Tally, "tally")
	return r.match(Tally, { batch, count, total }).find({ batch, count, total })
})

const settled = query(Auditor).rule((r) => {
	const { batch } = v(Settled, "settled")
	return r.match(Settled, { batch }).find({ batch })
})

const fanFinishes = query(Auditor).rule((r) => {
	const { scope, step } = v(FanFinish, "finish")
	const { outcome } = v(FanResult, "result")
	return r
		.match(FanFinish, { scope, step })
		.match(FanResult, { step, outcome })
		.find({ scope, step, outcome })
})

/** Every fan claim: its step, its attempt, and how many seats it holds. */
const fanClaims = query(Auditor).rule((r) => {
	const { step, attempt, holds } = v(FanClaim, "claim")
	return r.match(FanClaim, { step, attempt, holds }).find({ step, attempt, holds })
})

/** Every seat a fan claim held, by its step and attempt. */
const fanHolds = query(Auditor).rule((r) => {
	const { step, attempt, resource, seat } = v(FanHold, "hold")
	return r.match(FanHold, { step, attempt, resource, seat }).find({ step, attempt, resource, seat })
})

/** Every hour the clock chimed. */
const chimes = query(Auditor).rule((r) => {
	const { hour, bell } = v(Chimed, "chimed")
	return r.match(Chimed, { hour, bell }).find({ hour, bell })
})

/** Each review's saved groups. */
const reviewed = query(Auditor).rule((r) => {
	const { review, group, count, total } = v(Reviewed, "reviewed")
	return r.match(Reviewed, { review, group, count, total }).find({ review, group, count, total })
})

/** Each review's summary. */
const summaries = query(Auditor).rule((r) => {
	const { review, groups, total } = v(Summary, "summary")
	return r.match(Summary, { review, groups, total }).find({ review, groups, total })
})

/** Every review step, its kind and the scope it lives in, with its outcome. */
const reviewSteps = query(Auditor).rule((r) => {
	const { step, kind, scope } = v(ReviewStep, "step")
	const { outcome } = v(ReviewResult, "result")
	return r
		.match(ReviewStep, { step, kind, scope })
		.match(ReviewResult, { step, outcome })
		.find({ step, kind, scope, outcome })
})

/** Every seat a review step's claim held, by its step and attempt, with the step's kind. */
const reviewHolds = query(Auditor).rule((r) => {
	const { step, attempt, resource, seat } = v(ReviewHold, "hold")
	const { kind } = v(ReviewStep, "step")
	return r
		.match(ReviewHold, { step, attempt, resource, seat })
		.match(ReviewStep, { step, kind })
		.find({ step, attempt, kind, resource, seat })
})

/** Every child scope of a review, its parent and its kind. */
const reviewWithins = query(Auditor).rule((r) => {
	const { scope, parent, kind } = v(ReviewWithin, "within")
	return r.match(ReviewWithin, { scope, parent, kind }).find({ scope, parent, kind })
})

/** Every review scope's finish and its outcome. */
const reviewFinishes = query(Auditor).rule((r) => {
	const { scope, step } = v(ReviewFinish, "finish")
	const { outcome } = v(ReviewResult, "result")
	return r
		.match(ReviewFinish, { scope, step })
		.match(ReviewResult, { step, outcome })
		.find({ scope, step, outcome })
})

const copied = query(Auditor).rule((r) => {
	const { relation, run } = v(Copied, "copied")
	return r.match(Copied, { relation, run }).find({ relation, run })
})

const built = query(Auditor).rule((r) => {
	const { build } = v(Built, "built")
	return r.match(Built, { build }).find({ build })
})

const syncAdmitted = query(Auditor).rule((r) => {
	const { scope } = v(SyncAdmitted, "admitted")
	return r.match(SyncAdmitted, { scope }).find({ scope })
})

const syncSkipped = query(Auditor).rule((r) => {
	const { scope, by } = v(SyncSkipped, "skipped")
	return r.match(SyncSkipped, { scope, by }).find({ scope, by })
})

const syncFinishes = query(Auditor).rule((r) => {
	const { scope, step } = v(SyncFinish, "finish")
	const { outcome } = v(SyncResult, "result")
	return r
		.match(SyncFinish, { scope, step })
		.match(SyncResult, { step, outcome })
		.find({ scope, step, outcome })
})

const retryResults = query(Auditor).rule((r) => {
	const { step, kind, scope } = v(RetryStep, "step")
	const { outcome } = v(RetryResult, "result")
	return r
		.match(RetryStep, { step, kind, scope })
		.match(RetryResult, { step, outcome })
		.find({ step, kind, scope, outcome })
})

const retryClaims = query(Auditor).rule((r) => {
	const { step, attempt } = v(RetryClaim, "claim")
	return r.match(RetryClaim, { step, attempt }).find({ step, attempt })
})

const retryExhausted = query(Auditor).rule((r) => {
	const { step } = v(RetryExhausted, "exhausted")
	return r.match(RetryExhausted, { step }).find({ step })
})

/** What each throttled call's run heard from its source. */
const heard = query(Auditor).rule((r) => {
	const { key, answered } = v(Heard, "heard")
	return r.match(Heard, { key, answered }).find({ key, answered })
})

/** Every assignment step's result, with its scope. */
const assignResults = query(Auditor).rule((r) => {
	const { step, kind, scope } = v(AssignStep, "step")
	const { outcome } = v(AssignResult, "result")
	return r
		.match(AssignStep, { step, kind, scope })
		.match(AssignResult, { step, outcome })
		.find({ step, kind, scope, outcome })
})

/** The passages each decision's nearest read found, recorded with its result: each one's ordinal and distance. */
const nearestReads = query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = v(AssignDecideReadNearest, "read")
	const { passage, topic, distance } = v(AssignDecideReadNearestRow, "row")
	return r
		.match(AssignDecideReadNearest, { step, ordinal, digest, root })
		.match(AssignDecideReadNearestRow, { digest, passage, topic, distance })
		.find({ step, ordinal, digest, root, passage, topic, distance })
})

/** Every passage row any decision's nearest read found, stored once by its digest however many roots found it. */
const nearestRows = query(Auditor).rule((r) => {
	const { digest, passage, topic, distance } = v(AssignDecideReadNearestRow, "row")
	return r
		.match(AssignDecideReadNearestRow, { digest, passage, topic, distance })
		.find({ digest, passage, topic, distance })
})

/** The seen passages each decision read, recorded with its result. */
const seenReads = query(Auditor).rule((r) => {
	const { step, ordinal, digest, root } = v(AssignDecideReadSeen, "read")
	const { learner, passage } = v(AssignDecideReadSeenRow, "row")
	return r
		.match(AssignDecideReadSeen, { step, ordinal, digest, root })
		.match(AssignDecideReadSeenRow, { digest, learner, passage })
		.find({ step, ordinal, digest, root, learner, passage })
})

/** Every seen row any decision read, stored once by its digest however many roots read it. */
const seenRows = query(Auditor).rule((r) => {
	const { digest, learner, passage } = v(AssignDecideReadSeenRow, "row")
	return r
		.match(AssignDecideReadSeenRow, { digest, learner, passage })
		.find({ digest, learner, passage })
})

/** Each decision as its output row holds it: its stage's tag and its confidence. */
const decisions = query(Auditor).rule((r) => {
	const { step, stage, confidence } = v(AssignDecideOutput, "decision")
	return r.match(AssignDecideOutput, { step, stage, confidence }).find({ step, stage, confidence })
})

/** The passage each decision that serves one serves, at its distance: its stage's variant. */
const servings = query(Auditor).rule((r) => {
	const { step, passage, distance } = v(AssignDecideOutputStageServe, "served")
	return r
		.match(AssignDecideOutputStageServe, { step, passage, distance })
		.find({ step, passage, distance })
})

/** The passages each decision weighed, its array as an ordered family. */
const weighings = query(Auditor).rule((r) => {
	const { step, ordinal, passage, distance, passed } = v(AssignDecideOutputWeighed, "weighed")
	return r
		.match(AssignDecideOutputWeighed, { step, ordinal, passage, distance, passed })
		.find({ step, ordinal, passage, distance, passed })
})

/** Each assignment's conclusion, which its finish wrote from the decision it read back. */
const concluded = query(Auditor).rule((r) => {
	const { learner, served, weighed } = v(Concluded, "concluded")
	return r.match(Concluded, { learner, served, weighed }).find({ learner, served, weighed })
})

const assigned = query(Auditor).rule((r) => {
	const { learner, passage } = v(Assigned, "assigned")
	return r.match(Assigned, { learner, passage }).find({ learner, passage })
})

/** Every row of the chain's graph that a step's key names, by its root: its steps, results and page inputs. */
const chainGraphRows = query(Auditor)
	.rule((r) => {
		const { step, root } = v(ChainStep, "step")
		return r.match(ChainStep, { step, root }).find({ step, root })
	})
	.rule((r) => {
		const { step, root } = v(ChainResult, "result")
		return r.match(ChainResult, { step, root }).find({ step, root })
	})
	.rule((r) => {
		const { step, root } = v(ChainPageInput, "input")
		return r.match(ChainPageInput, { step, root }).find({ step, root })
	})

/** Every chain root's scope, its record, which a clearing of its graph keeps. */
const chainHeaders = query(Auditor).rule((r) => {
	const { root: scope, key } = v(ChainRoot, "root")
	return r.match(ChainRoot, { root: scope, key }).find({ scope, key })
})

/** An audited result: the app joining den's facts with its own. */
const audited = query(Auditor).rule((r) => {
	const { step, root, note } = v(Audit, "audit")
	return r
		.match(Audit, { step, root, note })
		.match(ChainResult, { step, root, outcome: "done" })
		.find({ step, note })
})

/** The graph of a flow, read whole, for the differential harness: each relation's every row. */
const every = Object.freeze({
	chainAdmittedAll: query(Auditor).rule((r) => {
		const { scope } = v(ChainAdmitted, "s")
		return r.match(ChainAdmitted, { scope }).find({ scope })
	}),
	fanAdmittedAll: query(Auditor).rule((r) => {
		const { scope } = v(FanAdmitted, "s")
		return r.match(FanAdmitted, { scope }).find({ scope })
	}),
	chainRoots: query(Auditor).rule((r) => {
		const { root: scope, kind, key } = v(ChainRoot, "s")
		return r.match(ChainRoot, { root: scope, kind, key }).find({ scope, kind, key })
	}),
	chainStartSteps: query(Auditor).rule((r) => {
		const { scope, ordinal, step } = v(ChainStartStep, "s")
		return r.match(ChainStartStep, { scope, ordinal, step }).find({ scope, ordinal, step })
	}),
	chainSteps: query(Auditor).rule((r) => {
		const { step, kind, scope } = v(ChainStep, "s")
		return r.match(ChainStep, { step, kind, scope }).find({ step, kind, scope })
	}),
	chainFinishSteps: query(Auditor).rule((r) => {
		const { scope, step } = v(ChainFinish, "s")
		return r.match(ChainFinish, { scope, step }).find({ scope, step })
	}),
	chainResults: query(Auditor).rule((r) => {
		const { step, outcome } = v(ChainResult, "s")
		return r.match(ChainResult, { step, outcome }).find({ step, outcome })
	}),
	chainNexts: query(Auditor).rule((r) => {
		const { from, ordinal, to } = v(ChainNext, "s")
		return r.match(ChainNext, { from, ordinal, to }).find({ from, ordinal, to })
	}),
	chainPageInputs: query(Auditor).rule((r) => {
		const { step, feed, seq, pages: count } = v(ChainPageInput, "s")
		return r
			.match(ChainPageInput, { step, feed, seq, pages: count })
			.find({ step, feed, seq, pages: count })
	}),
	chainPageAfters: query(Auditor).rule((r) => {
		const { step, value } = v(ChainPageInputAfter, "s")
		return r.match(ChainPageInputAfter, { step, value }).find({ step, value })
	}),
	chainPageOutputs: query(Auditor).rule((r) => {
		const { step, seq, items: count } = v(ChainPageOutput, "s")
		return r.match(ChainPageOutput, { step, seq, items: count }).find({ step, seq, items: count })
	}),
	chainPageNexts: query(Auditor).rule((r) => {
		const { step, value } = v(ChainPageOutputNext, "s")
		return r.match(ChainPageOutputNext, { step, value }).find({ step, value })
	}),
	chainRunInputs: query(Auditor).rule((r) => {
		const { scope, feed, pages: count } = v(ChainChainRunInput, "s")
		return r
			.match(ChainChainRunInput, { scope, feed, pages: count })
			.find({ scope, feed, pages: count })
	}),
	fanRoots: query(Auditor).rule((r) => {
		const { root: scope, kind, key } = v(FanRoot, "s")
		return r.match(FanRoot, { root: scope, kind, key }).find({ scope, kind, key })
	}),
	fanWithins: query(Auditor).rule((r) => {
		const { scope, parent, kind } = v(FanWithin, "s")
		return r.match(FanWithin, { scope, parent, kind }).find({ scope, parent, kind })
	}),
	fanStartSteps: query(Auditor).rule((r) => {
		const { scope, ordinal, step } = v(FanStartStep, "s")
		return r.match(FanStartStep, { scope, ordinal, step }).find({ scope, ordinal, step })
	}),
	fanStartScopes: query(Auditor).rule((r) => {
		const { scope, ordinal, child } = v(FanStartScope, "s")
		return r.match(FanStartScope, { scope, ordinal, child }).find({ scope, ordinal, child })
	}),
	fanSteps: query(Auditor).rule((r) => {
		const { step, kind, scope } = v(FanStep, "s")
		return r.match(FanStep, { step, kind, scope }).find({ step, kind, scope })
	}),
	fanFinishSteps: query(Auditor).rule((r) => {
		const { scope, step } = v(FanFinish, "s")
		return r.match(FanFinish, { scope, step }).find({ scope, step })
	}),
	fanResults: query(Auditor).rule((r) => {
		const { step, outcome } = v(FanResult, "s")
		return r.match(FanResult, { step, outcome }).find({ step, outcome })
	}),
	fanSquareInputs: query(Auditor).rule((r) => {
		const { step, batch, n } = v(FanSquareInput, "s")
		return r.match(FanSquareInput, { step, batch, n }).find({ step, batch, n })
	}),
	fanSquareOutputs: query(Auditor).rule((r) => {
		const { step, square } = v(FanSquareOutput, "s")
		return r.match(FanSquareOutput, { step, square }).find({ step, square })
	}),
	fanBatchInputs: query(Auditor).rule((r) => {
		const { scope, batch, size } = v(FanBatchInput, "s")
		return r.match(FanBatchInput, { scope, batch, size }).find({ scope, batch, size })
	}),
	fanRunInputs: query(Auditor).rule((r) => {
		const { scope, batch, size } = v(FanFanRunInput, "s")
		return r.match(FanFanRunInput, { scope, batch, size }).find({ scope, batch, size })
	})
})

export const auditWorkload = workload(Auditor, {
	audit: ChangeSet.empty(Auditor).insert(Audit, []),
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
 * The app's own write: an order and the chain it requests, in one transaction, so the root exists exactly when the
 * order does and the relay rings what the commit made eligible; clocked, since the root's instant is the write's own
 * reading of the database's clock.
 */
export const appWorkload = workload(Loader, {
	order: clocked(
		ChangeSet.union(ChangeSet.empty(Loader).insert(Order, []), chainRequests.Ordered),
		{
			now: "millis"
		}
	),
	weigh: ChangeSet.empty(Loader).insert(App.relations.Weight, []),
	hear: ChangeSet.empty(Loader).insert(Heard, []),
	place: ChangeSet.empty(Loader).insert(Passage, []),
	see: ChangeSet.empty(Loader).insert(Seen, [])
})

/**
 * The app's editor: it rewrites a passage in place and takes back a seen passage, the edits of a decision's sources
 * after it read them, which leave what it recorded as it found it (integration/records.test.ts).
 */
export const Editor = role(App, "editor", { Passage, Seen }, { write: ["Passage", "Seen"] })

/** The editor's edits: a passage put whole at its key, and seen passages deleted. */
export const editWorkload = workload(Editor, {
	replace: ChangeSet.empty(Editor).put(Passage, []),
	unsee: ChangeSet.empty(Editor).delete(Seen, [])
})
