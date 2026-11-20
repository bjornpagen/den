import { role } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { assignGraph, assignWriter } from "#integration/slice/generated/assign.fragment.ts"
import { chainGraph, chainWriter } from "#integration/slice/generated/chain.fragment.ts"
import { fanGraph, fanWriter } from "#integration/slice/generated/fan.fragment.ts"
import { retryGraph, retryWriter } from "#integration/slice/generated/retry.fragment.ts"
import { reviewGraph, reviewWriter } from "#integration/slice/generated/review.fragment.ts"
import { syncGraph, syncWriter } from "#integration/slice/generated/sync.fragment.ts"
import {
	Assigned,
	Built,
	Concluded,
	Copied,
	Cursor,
	Item,
	Missed,
	Order,
	Passage,
	Reviewed,
	Seen,
	Settled,
	Summary,
	Tally,
	Weight
} from "#integration/slice/relations.ts"

/**
 * The app's writer role: it inserts the app's items, cursors, orders, tallies, settled batches, copies, builds,
 * passages, missed questions, seen passages, assignments and their conclusions, reviews' saved groups and summaries, and reads the weights its pages read and the passages and seen passages its
 * decisions read. Every flow names it as the role its steps write under, so den adds its commits to
 * it: it holds each flow's graph whole, which serves den's commits, and inserts into what each flow's `Writer` lists.
 */
export const Loader = role(
	App,
	"loader",
	{
		Item,
		Weight,
		Cursor,
		Order,
		Tally,
		Settled,
		Copied,
		Built,
		Passage,
		Missed,
		Seen,
		Assigned,
		Concluded,
		Reviewed,
		Summary,
		...chainGraph.relations,
		...fanGraph.relations,
		...syncGraph.relations,
		...retryGraph.relations,
		...assignGraph.relations,
		...reviewGraph.relations
	},
	{
		insert: [
			"Item",
			"Weight",
			"Cursor",
			"Order",
			"Tally",
			"Settled",
			"Copied",
			"Built",
			"Passage",
			"Missed",
			"Seen",
			"Assigned",
			"Concluded",
			"Reviewed",
			"Summary",
			...chainWriter,
			...fanWriter,
			...syncWriter,
			...retryWriter,
			...assignWriter,
			...reviewWriter
		]
	}
)
