import { role, wholeEntriesOf } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { assignWriter } from "#integration/slice/generated/assign.fragment.ts"
import { chainWriter } from "#integration/slice/generated/chain.fragment.ts"
import { clockWriter } from "#integration/slice/generated/clock.fragment.ts"
import { fanWriter } from "#integration/slice/generated/fan.fragment.ts"
import { retryWriter } from "#integration/slice/generated/retry.fragment.ts"
import { reviewWriter } from "#integration/slice/generated/review.fragment.ts"
import { syncWriter } from "#integration/slice/generated/sync.fragment.ts"
import { writebackWriter } from "#integration/slice/generated/writeback.fragment.ts"

/**
 * The app's writer role. It holds the app's schema whole (every flow's graph and coordination, Audit and the slice's
 * base; no role holds the seat levels' live holds), so every program over the schema runs on it, a derived app root's
 * request among them, composed into the app's writes. It inserts the app's items, weights, cursors, orders, tallies,
 * the sizes it wants batches at, settled batches, copies, builds, passages, seen passages, assignments and their
 * conclusions, reviews' saved groups and summaries, the attempts the gradebook delivered, what throttled calls heard
 * and the clock's chimes. Every flow names it as the role its steps write under, so den adds its commits to it: it
 * inserts into what each flow's `Writer` lists.
 */
export const Loader = role(App, "loader", wholeEntriesOf(App), {
	insert: [
		"Item",
		"Weight",
		"Cursor",
		"Order",
		"Tally",
		"Want",
		"Settled",
		"Copied",
		"Built",
		"Passage",
		"Seen",
		"Assigned",
		"Concluded",
		"Reviewed",
		"Summary",
		"Delivered",
		"Heard",
		"Chimed",
		...chainWriter,
		...fanWriter,
		...syncWriter,
		...retryWriter,
		...assignWriter,
		...reviewWriter,
		...writebackWriter,
		...clockWriter
	]
})
