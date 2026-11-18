import { DenScope, DenStep, Text } from "@bjornpagen/den/lower/keys"
import { closed, closedId, natural, pg, relation, str } from "@bjornpagen/grizzle"

/**
 * The toy app's own relations, which den's steps write and read and its finishes move forward: the items a feed's
 * pages hold, each feed's weight (which a page reads before its body runs), each feed's cursor as insert-only
 * position facts (the latest is the cursor), the orders the app writes beside a root it requests in its own
 * transaction, each batch's tally, the batches whose whole run finished, the relations a sync copied, the builds the
 * Gold step made, an auditor's notes on den's results, and the assignment engine's shape in miniature: passages and their
 * embeddings, the passages a learner has seen, the passage each assignment gave a learner, and each assignment's
 * conclusion.
 */
export const Feed = closed.unordered("Feed", ["news", "sport"])

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

/**
 * The dimensions of a passage's embedding, the suite's own width: four, where a production embedding (Gemini Embedding
 * 2) has 1536, so the suite's vectors stay small; nothing in den depends on the count.
 */
export const embeddingDimensions = 4

/** A passage of a topic and its embedding, which a nearest read ranks by. */
export const Passage = relation(
	"Passage",
	{ passage: Name, topic: Name, embedding: pg.vector(embeddingDimensions) },
	["passage"]
)

/** A passage a learner has seen. */
export const Seen = relation("Seen", { learner: Name, passage: Name }, ["learner", "passage"])

/** The passage an assignment gave a learner. */
export const Assigned = relation("Assigned", { learner: Name, passage: Name }, ["learner"])

/** An assignment's conclusion, which its finish reads back from the graph: what it served, and how many it weighed. */
export const Concluded = relation("Concluded", { learner: Name, served: Name, weighed: natural }, [
	"learner"
])

/**
 * An auditor's note on a step's result, which references den's Result relation by its key, the step and its root, and
 * so keeps the step's graph from retiring while it stands.
 */
export const Audit = relation("Audit", { step: DenStep, root: DenScope, note: Text }, ["step"])
