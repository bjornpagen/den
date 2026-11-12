import { DenStep, Text } from "@bjornpagen/den/lower/keys"
import { closed, closedId, natural, pg, relation, str } from "@bjornpagen/grizzle"

/**
 * The toy app's own relations, which den's steps write and read and its finishes move forward: the items a feed's
 * pages hold, each feed's weight (which a page reads before its body runs), each feed's cursor as insert-only
 * position facts (the latest is the cursor), the orders the app writes beside a root it requests in its own
 * transaction, each batch's tally, the batches whose whole run finished, the relations a sync copied, the builds the
 * Gold step made, and an auditor's notes on den's results.
 */
export const Feed = closed("Feed", ["news", "sport"])

/** A batch's or a relation's name, bounded so it can key a row. */
const Name = str.regex("^[a-z0-9-]{1,64}$")

/** One item of a feed's page. */
export const Item = relation("Item", { feed: closedId(Feed), seq: pg.bigint, n: natural }, [
	"feed",
	"seq",
	"n"
])

/** A feed's weight: how many items each page of it holds per position, a fact the app states and a page reads. */
export const Weight = relation("Weight", { feed: closedId(Feed), factor: natural }, [
	"feed",
	"factor"
])

/** A feed's cursor moved to `position`: a fact per move, never updated. */
export const Cursor = relation("Cursor", { feed: closedId(Feed), position: pg.bigint }, [
	"feed",
	"position"
])

/** An order the app took, written in the same transaction as the root it requests. */
export const Order = relation("Order", { order: Name, feed: closedId(Feed) }, ["order"])

/** A batch's tally: how many squares it summed, and their total. */
export const Tally = relation("Tally", { batch: Name, count: natural, total: pg.bigint }, ["batch"])

/** A batch whose whole run, its tally included, finished. */
export const Settled = relation("Settled", { batch: Name }, ["batch"])

/** A relation one sync run copied, by the run. */
export const Copied = relation("Copied", { relation: Name, run: natural }, ["relation", "run"])

/** A build the Gold step made, by its number. */
export const Built = relation("Built", { build: natural }, ["build"])

/** An auditor's note on a step's result, which references den's Result relation. */
export const Audit = relation("Audit", { step: DenStep, note: Text }, ["step"])
