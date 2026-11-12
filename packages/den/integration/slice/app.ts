import { merge } from "@bjornpagen/den/lower/merge"
import { contained, on, schema } from "@bjornpagen/grizzle"
import { chainFragment } from "#integration/slice/generated/chain.fragment.ts"
import { fanFragment } from "#integration/slice/generated/fan.fragment.ts"
import { Audit, Cursor, Feed, Item, Settled, Tally } from "#integration/slice/relations.ts"

/** The toy app's schema, den's two flows spread into it: one level, one installation, one migrations chain. */
export const App = schema(
	"Slice",
	merge(
		merge({ Feed, Item, Cursor, Tally, Settled, Audit }, chainFragment.relations),
		fanFragment.relations
	),
	[
		contained(on(Audit, "step"), on(chainFragment.relations.ChainResult, "step")),
		...chainFragment.laws,
		...fanFragment.laws
	]
)
