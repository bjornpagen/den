import { ChangeSet, login, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	ChainClaim,
	ChainFinish,
	ChainPageOutput,
	ChainResult,
	ChainStep
} from "#integration/slice/generated/chain.fragment.ts"
import { ChainWorker, chainWorkload } from "#integration/slice/generated/chain.programs.ts"
import { FanFinish, FanResult, FanSquareOutput } from "#integration/slice/generated/fan.fragment.ts"
import { FanWorker, fanWorkload } from "#integration/slice/generated/fan.programs.ts"
import { Audit, Cursor, Item, Settled, Tally } from "#integration/slice/relations.ts"

/**
 * The app's own role: it reads den's facts beside its own items, cursors and tallies, joins them, and inserts audits
 * that reference den's results by foreign key. It is certified as it would be with no den writer beside it.
 */
const Auditor = role(
	App,
	"auditor",
	{
		Audit,
		ChainClaim,
		ChainFinish,
		ChainPageOutput,
		ChainResult,
		ChainStep,
		Cursor,
		FanFinish,
		FanResult,
		FanSquareOutput,
		Item,
		Settled,
		Tally
	},
	{ insert: ["Audit"] }
)

/** Every page den read, as the typed row of its output, with the scope it ran in. */
const pages = query(Auditor).rule((r) => {
	const { step, scope } = v(ChainStep, "step")
	const { seq, items } = v(ChainPageOutput, "output")
	return r
		.match(ChainStep, { step, kind: "Page", scope })
		.match(ChainPageOutput, { step, seq, items })
		.match(ChainResult, { step, outcome: "done" })
		.find({ step, scope, seq, items })
})

const items = query(Auditor).rule((r) => {
	const { feed, seq, n } = v(Item, "item")
	return r.match(Item, { feed, seq, n }).find({ feed, seq, n })
})

const cursors = query(Auditor).rule((r) => {
	const { feed, position } = v(Cursor, "cursor")
	return r.match(Cursor, { feed, position }).find({ feed, position })
})

const chainResults = query(Auditor).rule((r) => {
	const { step, outcome } = v(ChainResult, "result")
	return r.match(ChainResult, { step, outcome }).find({ step, outcome })
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

const squares = query(Auditor).rule((r) => {
	const { step, square } = v(FanSquareOutput, "output")
	return r.match(FanSquareOutput, { step, square }).find({ step, square })
})

/** An audited result: the app joining den's facts with its own. */
const audited = query(Auditor).rule((r) => {
	const { step, note } = v(Audit, "audit")
	return r
		.match(Audit, { step, note })
		.match(ChainResult, { step, outcome: "done" })
		.find({ step, note })
})

const auditWorkload = workload(Auditor, {
	audit: ChangeSet.empty(Auditor).insert(Audit, []),
	audited,
	pages,
	items,
	cursors,
	chainResults,
	chainFinishes,
	chainClaims,
	tallies,
	settled,
	fanFinishes,
	squares
})

/** den's runtime login: both flows' workers. */
export const Worker = login(App, "worker", [ChainWorker, FanWorker], {
	workload: [chainWorkload, fanWorkload]
})

/** The app's login. */
export const AppLogin = login(App, "app", [Auditor], { workload: [auditWorkload] })
