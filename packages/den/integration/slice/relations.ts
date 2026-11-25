import { Text } from "@bjornpagen/den/lower/keys"
import { closed, closedId, natural, pg, relation, sha256, str, unit } from "@bjornpagen/grizzle"

/**
 * The toy app's own relations, which den's steps write and read and its finishes move forward: the items a feed's pages
 * hold, each feed's weight (which a page reads before its body runs), each feed's cursor as insert-only position facts
 * (the latest is the cursor), the orders the app writes beside a root it requests in its own transaction, each batch's
 * tally, the sizes the app wants a batch at, the batches whose whole run finished, the relations a sync copied, the
 * builds the Gold step made, the attempts the gradebook delivered, each review's saved groups and its summary, what
 * each throttled call heard, the hours the clock chimed, an auditor's notes on den's results, and the assignment
 * engine's shape in miniature: passages and their embeddings, the passages a learner has seen, the passage each
 * assignment gave a learner, and each assignment's conclusion. Every relation is closed, its facts inserted and never
 * changed, but a passage and a seen passage, which the app's editor rewrites and takes back (app-programs.ts Editor),
 * each open inside its unit (PassageUnit, LearnerUnit; base.ts).
 */
export const Feed = closed.unordered("Feed", ["news", "sport"])

/** A batch's, a relation's or a bell's name, bounded so it can key a row. */
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

/**
 * A size the app wants a batch run at: the run the app's write requests of the batch (flows.ts Wanted) squares the
 * largest it wants when the request commits, and keeps it, whatever is wanted after.
 */
export const Want = relation("Want", { batch: Name, size: pg.bigint }, ["batch", "size"])

/** A batch whose whole run, its tally included, finished. */
export const Settled = relation("Settled", { batch: Name }, ["batch"])

/** A relation one sync run copied, by the run. */
export const Copied = relation("Copied", { relation: Name, run: natural }, ["relation", "run"])

/** An attempt whose result the gradebook delivered, the fact a review of it awaits. */
export const Delivered = relation("Delivered", { attempt: Name }, ["attempt"])

/** A group of a review its stage after the group's questions saved: how many questions it holds, and their scores' total. */
export const Reviewed = relation(
	"Reviewed",
	{ review: Name, group: natural, count: natural, total: pg.bigint },
	["review", "group"]
)

/** A review's whole run: how many groups it analysed, and the total of every group's scores. */
export const Summary = relation("Summary", { review: Name, groups: natural, total: pg.bigint }, [
	"review"
])

/** What a throttled call's run heard from its source, by its key: an answer, or a refusal past its step's waits. */
export const Heard = relation("Heard", { key: Name, answered: pg.boolean }, ["key"])

/** An hour a bell of the clock chimed, by the instant its schedule named and the bell, a member of its roster. */
export const Chimed = relation("Chimed", { hour: pg.bigint, bell: Name }, ["hour", "bell"])

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

/**
 * A passage's unit, its key: the editor rewrites a passage in place under its exclusive borrow, and nothing else is
 * keyed by a passage.
 */
export const PassageUnit = unit("Passage", { passage: Name })

/**
 * A learner's unit, its key: the passages it has seen, its assignment and its assignment's conclusion, each keyed by
 * the learner first, so the editor's taking back of a seen passage and an assignment's commit of its learner's rows
 * hold one lock.
 */
export const LearnerUnit = unit("Learner", { learner: Name })

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
export const Audit = relation("Audit", { step: sha256, root: sha256, note: Text }, ["step"])
