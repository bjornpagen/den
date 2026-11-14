import { role } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { chainGraph, chainWriter } from "#integration/slice/generated/chain.fragment.ts"
import { fanGraph, fanWriter } from "#integration/slice/generated/fan.fragment.ts"
import { retryGraph, retryWriter } from "#integration/slice/generated/retry.fragment.ts"
import { syncGraph, syncWriter } from "#integration/slice/generated/sync.fragment.ts"
import {
	Built,
	Copied,
	Cursor,
	Item,
	Order,
	Settled,
	Tally,
	Weight
} from "#integration/slice/relations.ts"

/**
 * The app's writer role: it inserts the app's items, cursors, orders, tallies, settled batches, copies and builds, and
 * reads the weights its pages read. Every flow names it as the role its steps write under, so den adds its commits to
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
		...chainGraph.relations,
		...fanGraph.relations,
		...syncGraph.relations,
		...retryGraph.relations
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
			...chainWriter,
			...fanWriter,
			...syncWriter,
			...retryWriter
		]
	}
)
