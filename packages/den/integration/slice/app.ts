import { merge } from "@bjornpagen/den/lower/merge"
import { contained, on, schema } from "@bjornpagen/grizzle"
import { ChainResult, chainFragment } from "#integration/slice/generated/chain.fragment.ts"
import { fanFragment } from "#integration/slice/generated/fan.fragment.ts"
import { retryFragment } from "#integration/slice/generated/retry.fragment.ts"
import { syncFragment } from "#integration/slice/generated/sync.fragment.ts"
import {
	Audit,
	Built,
	Copied,
	Cursor,
	Feed,
	Item,
	Order,
	Settled,
	Tally,
	Weight
} from "#integration/slice/relations.ts"

/** The toy app's schema, den's four flows spread into it: one level, one installation, one migrations chain. */
export const App = schema(
	"Slice",
	merge({ Feed, Item, Weight, Cursor, Order, Tally, Settled, Copied, Built, Audit }, [
		chainFragment.relations,
		fanFragment.relations,
		syncFragment.relations,
		retryFragment.relations
	]),
	[
		contained(on(Audit, "step"), on(ChainResult, "step")),
		...chainFragment.laws,
		...fanFragment.laws,
		...syncFragment.laws,
		...retryFragment.laws
	]
)
