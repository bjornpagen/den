import { reads } from "@bjornpagen/den/algebra/kinds"
import { Text } from "@bjornpagen/den/lower/keys"
import * as g from "@bjornpagen/grizzle"
import { SliceBase } from "#integration/slice/base.ts"
import {
	embeddingDimensions,
	Item,
	Passage,
	Seen,
	Want,
	Weight
} from "#integration/slice/relations.ts"

/**
 * The slice's declared reads, each a step's by the name `<Step>Reads`, and each a derived root's input (`<Root>Of`, its
 * kind's `derived`): queries over the slice's base level alone, never over a flow or its app role, so den's fragment
 * builds each read's records from them when it loads while the flow that names them is typed over the schema the
 * fragment is spread into (den generate holds each step's reads to this module's export of its name).
 */

/**
 * The clock's hour, derived from its schedule's key: the instant its cron matched, and the member of its roster, the
 * bell that chimes it. A read of no relation, its input derived from the key's values alone; written over the slice's
 * base, the narrowest level grizzle states, which den's clock role so holds whole, read-only (TODO.md).
 */
export const HourlyOf = g
	.query(SliceBase)
	.rule((r) => r.find({ hour: r.param("at", g.int8), bell: r.param("member", Text) }))

/**
 * A batch's run the app wants, derived from its key, the batch: the largest size it wants the batch at, and none where
 * it wants the batch at no size.
 */
export const WantedOf = g.query(SliceBase).rule((r) => {
	const { batch, size } = g.v(Want, "want")
	return r
		.match(Want, { batch, size })
		.where(r.eq(batch, r.param("batch", Text)))
		.find({ batch, size: r.max(size) })
})

/**
 * How many passages an assignment's nearest read finds at most, the suite's own size: within the topics' sizes the
 * suite draws, so a topic holds more passages than are found as often as fewer.
 */
export const assignedAmong = 3

/**
 * A page's reads: its feed's weight, the items its feed holds so far, and the weight once more as a tree, the items so
 * far attached under it and each item's page's first item under each, a relation of the records at each path, which den
 * names.
 */
export const PageReads = reads(
	SliceBase,
	{
		weights: g.query(SliceBase).rule((r) => {
			const { feed, factor } = g.v(Weight, "weight")
			return r
				.match(Weight, { feed, factor })
				.where(r.eq(feed, r.param("feed", Weight.fields.feed)))
				.find({ feed, factor })
		}),
		earlier: g.query(SliceBase).rule((r) => {
			const { feed, seq, n } = g.v(Item, "item")
			return r
				.match(Item, { feed, seq, n })
				.where(r.eq(feed, r.param("feed", Item.fields.feed)))
				.find({ feed, seq, n })
		}),
		tree: g
			.query(SliceBase)
			.rule((r) => {
				const { feed, factor } = g.v(Weight, "weight")
				return r
					.match(Weight, { feed, factor })
					.where(r.eq(feed, r.param("feed", Weight.fields.feed)))
					.find({ feed, factor })
			})
			.attach(
				"items",
				(weight) =>
					g
						.query(SliceBase)
						.rule((r) => {
							const { feed, seq, n } = g.v(Item, "item")
							return r
								.match(Item, { feed, seq, n })
								.where(r.eq(feed, weight.feed))
								.find({ feed, seq, n })
						})
						.attach(
							"first",
							(item) =>
								g
									.query(SliceBase)
									.rule((r) =>
										r.match(Item, { feed: item.feed, seq: item.seq, n: 0n }).find({ n: 0n })
									),
							"option"
						)
						.orderBy(["seq", "asc"], ["n", "asc"]),
				"array"
			)
	},
	(page: { readonly feed: "news" | "sport" }) => ({
		"weights.feed": page.feed,
		"earlier.feed": page.feed,
		"tree.feed": page.feed
	})
)

/** A decision's reads: the passages of its topic nearest its question's vector, and the passages its learner has seen. */
export const DecideReads = reads(
	SliceBase,
	{
		nearest: g
			.query(SliceBase)
			.rule((r) => {
				const { passage, topic, embedding } = g.v(Passage, "passage")
				return r
					.match(Passage, { passage, topic, embedding })
					.where(r.eq(topic, r.param("topic", Passage.fields.topic)))
					.find({
						passage,
						topic,
						distance: g.Distance.cosine(embedding, r.param("query", Passage.fields.embedding))
					})
			})
			.approximateNearest({ by: "distance", take: assignedAmong }),
		seen: g.query(SliceBase).rule((r) => {
			const { learner, passage } = g.v(Seen, "seen")
			return r
				.match(Seen, { learner, passage })
				.where(r.eq(learner, r.param("learner", Seen.fields.learner)))
				.find({ learner, passage })
		})
	},
	(question: {
		readonly vector: g.Vector<typeof embeddingDimensions>
		readonly topic: string
		readonly learner: string
	}) => ({
		"nearest.query": question.vector,
		"nearest.topic": question.topic,
		"seen.learner": question.learner
	})
)
