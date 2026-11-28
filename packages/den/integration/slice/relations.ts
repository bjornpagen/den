import { Text } from "@bjornpagen/den/lower/keys"
import * as g from "@bjornpagen/grizzle"

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
export const Feed = g.closed.unordered("Feed", ["news", "sport"])

/** A batch's, a relation's or a bell's name, bounded so it can key a row. */
const Name = g.str.regex("^[a-z0-9-]{1,64}$")

/** One item of a feed's page. */
export const Item = g.relation("Item", { feed: g.closedId(Feed), seq: g.int8, n: g.natural }, [
	"feed",
	"seq",
	"n"
])

/** A feed's weight: how many items each page of it holds per position, a fact the app states and a page reads. */
export const Weight = g.relation("Weight", { feed: g.closedId(Feed), factor: g.natural }, [
	"feed",
	"factor"
])

/** A feed's cursor moved to `position`: a fact per move, never updated. */
export const Cursor = g.relation("Cursor", { feed: g.closedId(Feed), position: g.int8 }, [
	"feed",
	"position"
])

/** An order the app took, written in the same transaction as the root it requests. */
export const Order = g.relation("Order", { order: Name, feed: g.closedId(Feed) }, ["order"])

/** A batch's tally: how many squares it summed, and their total. */
export const Tally = g.relation("Tally", { batch: Name, count: g.natural, total: g.int8 }, [
	"batch"
])

/**
 * A size the app wants a batch run at: the run the app's write requests of the batch (flows.ts Wanted) squares the
 * largest it wants when the request commits, and keeps it, whatever is wanted after.
 */
export const Want = g.relation("Want", { batch: Name, size: g.int8 }, ["batch", "size"])

/** A batch whose whole run, its tally included, finished. */
export const Settled = g.relation("Settled", { batch: Name }, ["batch"])

/** A relation one sync run copied, by the run. */
export const Copied = g.relation("Copied", { relation: Name, run: g.natural }, ["relation", "run"])

/** An attempt whose result the gradebook delivered, the fact a review of it awaits. */
export const Delivered = g.relation("Delivered", { attempt: Name }, ["attempt"])

/** A group of a review its stage after the group's questions saved: how many questions it holds, and their scores' total. */
export const Reviewed = g.relation(
	"Reviewed",
	{ review: Name, group: g.natural, count: g.natural, total: g.int8 },
	["review", "group"]
)

/** A review's whole run: how many groups it analysed, and the total of every group's scores. */
export const Summary = g.relation("Summary", { review: Name, groups: g.natural, total: g.int8 }, [
	"review"
])

/** What a throttled call's run heard from its source, by its key: an answer, or a refusal past its step's waits. */
export const Heard = g.relation("Heard", { key: Name, answered: g.bool }, ["key"])

/** An hour a bell of the clock chimed, by the instant its schedule named and the bell, a member of its roster. */
export const Chimed = g.relation("Chimed", { hour: g.int8, bell: Name }, ["hour", "bell"])

/** BuiltAt's key: the app's capability to mint the instant of a build, which a clocked parameter binds under it. */
export const builtAtKey = Symbol("BuiltAt")

/** The instant the Gold step recorded a build, the database's reading in milliseconds: a contract of the app's own. */
const BuiltAt = g.domain<typeof builtAtKey>()("BuiltAt", g.int8)

/**
 * BuildNumber's key: the app's capability to mint a build's number, which this module and its checked mint's
 * (contracts.ts) hold.
 */
export const buildNumberKey = Symbol("BuildNumber")

/**
 * A build's number: any nonnegative int8, a contract of the app's own, as qti-pie's SittingKey is metis's: the Gold
 * root's and its Build step's input hold one, so den's column of it is the contract itself (domainInput).
 */
export const BuildNumber = g.domain<typeof buildNumberKey>()("BuildNumber", g.int8, (n) =>
	g.Num.within(n, 0n, 2n ** 63n - 1n)
)

/**
 * BuildNumber's unchecked mint: a suite writes a number outside the contract through den by it, which PostgreSQL's
 * domain of the contract refuses.
 */
export const toBuildNumber = g.mintOf(buildNumberKey)

/** A build the Gold step made, by its number, at the instant its commit read the database's clock. */
export const Built = g.relation("Built", { build: BuildNumber, at: BuiltAt }, ["build"])

/**
 * The dimensions of a passage's embedding, the suite's own width: four, where a production embedding (Gemini Embedding
 * 2) has 1536, so the suite's vectors stay small; nothing in den depends on the count.
 */
export const embeddingDimensions = 4

/** A passage of a topic and its embedding, which a nearest read ranks by. */
export const Passage = g.relation(
	"Passage",
	{ passage: Name, topic: Name, embedding: g.vector(embeddingDimensions) },
	["passage"]
)

/** A passage a learner has seen. */
export const Seen = g.relation("Seen", { learner: Name, passage: Name }, ["learner", "passage"])

/**
 * A passage's unit, its key: the editor rewrites a passage in place under its exclusive borrow, and nothing else is
 * keyed by a passage.
 */
export const PassageUnit = g.unit("Passage", { passage: Name })

/**
 * A learner's unit, its key: the passages it has seen, its assignment and its assignment's conclusion, each keyed by
 * the learner first, so the editor's taking back of a seen passage and an assignment's commit of its learner's rows
 * hold one lock.
 */
export const LearnerUnit = g.unit("Learner", { learner: Name })

/** The passage an assignment gave a learner. */
export const Assigned = g.relation("Assigned", { learner: Name, passage: Name }, ["learner"])

/** An assignment's conclusion, which its finish reads back from the graph: what it served, and how many it weighed. */
export const Concluded = g.relation(
	"Concluded",
	{ learner: Name, served: Name, weighed: g.natural },
	["learner"]
)

/**
 * An auditor's note on a step's result, which references den's Result relation by its key, the step and its root, and
 * so keeps the step's graph from retiring while it stands.
 */
export const Audit = g.relation("Audit", { step: g.sha256, root: g.sha256, note: Text }, ["step"])
