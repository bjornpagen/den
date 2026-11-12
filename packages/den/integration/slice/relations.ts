import { DenStep, Text } from "@bjornpagen/den/lower/keys"
import { closed, closedId, natural, pg, relation, str } from "@bjornpagen/grizzle"

/**
 * The toy app's own relations, which den's steps write and its finishes move forward: the items a feed's pages hold,
 * each feed's cursor as insert-only position facts (the latest is the cursor), each batch's tally, the batches whose
 * whole run finished, and an auditor's notes on den's results.
 */
export const Feed = closed("Feed", ["news", "sport"])

/** A batch's name, bounded so it can key a row. */
const BatchName = str.regex("^[a-z0-9-]{1,64}$")

/** One item of a feed's page. */
export const Item = relation("Item", { feed: closedId(Feed), seq: pg.bigint, n: natural }, [
	"feed",
	"seq",
	"n"
])

/** A feed's cursor moved to `position`: a fact per move, never updated. */
export const Cursor = relation("Cursor", { feed: closedId(Feed), position: pg.bigint }, [
	"feed",
	"position"
])

/** A batch's tally: how many squares it summed, and their total. */
export const Tally = relation("Tally", { batch: BatchName, count: natural, total: pg.bigint }, [
	"batch"
])

/** A batch whose whole run, its tally included, finished. */
export const Settled = relation("Settled", { batch: BatchName }, ["batch"])

/** An auditor's note on a step's result, which references den's Result relation. */
export const Audit = relation("Audit", { step: DenStep, note: Text }, ["step"])
