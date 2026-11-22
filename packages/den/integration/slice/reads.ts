import { reads } from "@bjornpagen/den/algebra/kinds"
import { Distance, query, v, type Vector } from "@bjornpagen/grizzle"
import { SliceBase } from "#integration/slice/base.ts"
import { embeddingDimensions, Item, Passage, Seen, Weight } from "#integration/slice/relations.ts"

/**
 * The slice's declared reads, each a step's by the name `<Step>Reads`: named queries over the slice's base level alone,
 * never over a flow or its app role, so den's fragment builds each read's records from them when it loads while the flow
 * that names them is typed over the schema the fragment is spread into (den generate holds each step's reads to this
 * module's export of its name).
 */

/**
 * How many passages an assignment's nearest read finds at most, the suite's own size: within the topics' sizes the
 * suite draws, so a topic holds more passages than are found as often as fewer.
 */
export const assignedAmong = 3

/**
 * A page's reads: its feed's weight, the items its feed holds so far, and the weight once more as a tree, the items so
 * far attached under it and each item's page's first item under each, whose records' relation the reads name
 * themselves (`ChainPageTreeFirst`, in place of the derived `ChainPageReadTreeItemsFirst`).
 */
export const PageReads = reads(
	SliceBase,
	{
		weights: query(SliceBase).rule((r) => {
			const { feed, factor } = v(Weight, "weight")
			return r
				.match(Weight, { feed, factor })
				.where(r.eq(feed, r.param("feed", Weight.fields.feed)))
				.find({ feed, factor })
		}),
		earlier: query(SliceBase).rule((r) => {
			const { feed, seq, n } = v(Item, "item")
			return r
				.match(Item, { feed, seq, n })
				.where(r.eq(feed, r.param("feed", Item.fields.feed)))
				.find({ feed, seq, n })
		}),
		tree: query(SliceBase)
			.rule((r) => {
				const { feed, factor } = v(Weight, "weight")
				return r
					.match(Weight, { feed, factor })
					.where(r.eq(feed, r.param("feed", Weight.fields.feed)))
					.find({ feed, factor })
			})
			.attach(
				"items",
				(weight) =>
					query(SliceBase)
						.rule((r) => {
							const { feed, seq, n } = v(Item, "item")
							return r
								.match(Item, { feed, seq, n })
								.where(r.eq(feed, weight.feed))
								.find({ feed, seq, n })
						})
						.attach(
							"first",
							(item) =>
								query(SliceBase).rule((r) =>
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
	}),
	{ names: { tree: { "items.first": "ChainPageTreeFirst" } } }
)

/** A decision's reads: the passages of its topic nearest its question's vector, and the passages its learner has seen. */
export const DecideReads = reads(
	SliceBase,
	{
		nearest: query(SliceBase)
			.rule((r) => {
				const { passage, topic, embedding } = v(Passage, "passage")
				return r
					.match(Passage, { passage, topic, embedding })
					.where(r.eq(topic, r.param("topic", Passage.fields.topic)))
					.find({
						passage,
						topic,
						distance: Distance.cosine(embedding, r.param("query", Passage.fields.embedding))
					})
			})
			.approximateNearest({ by: "distance", take: assignedAmong }),
		seen: query(SliceBase).rule((r) => {
			const { learner, passage } = v(Seen, "seen")
			return r
				.match(Seen, { learner, passage })
				.where(r.eq(learner, r.param("learner", Seen.fields.learner)))
				.find({ learner, passage })
		})
	},
	(question: {
		readonly vector: Vector<typeof embeddingDimensions>
		readonly topic: string
		readonly learner: string
	}) => ({
		"nearest.query": question.vector,
		"nearest.topic": question.topic,
		"seen.learner": question.learner
	})
)
