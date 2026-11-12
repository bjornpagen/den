import { role } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { chainFragment } from "#integration/slice/generated/chain.fragment.ts"
import { fanFragment } from "#integration/slice/generated/fan.fragment.ts"
import { retryFragment } from "#integration/slice/generated/retry.fragment.ts"
import { syncFragment } from "#integration/slice/generated/sync.fragment.ts"
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
 * it, and the den relations those commits insert into are what each fragment's `writer` lists, spread in here.
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
		...chainFragment.writer.relations,
		...fanFragment.writer.relations,
		...syncFragment.writer.relations,
		...retryFragment.writer.relations
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
			...chainFragment.writer.insert,
			...fanFragment.writer.insert,
			...syncFragment.writer.insert,
			...retryFragment.writer.insert
		]
	}
)
