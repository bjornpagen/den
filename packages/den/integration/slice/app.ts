import { contained, on, schema } from "@bjornpagen/grizzle"
import {
	ChainResult,
	chainCoordination,
	chainGraph
} from "#integration/slice/generated/chain.fragment.ts"
import { fanCoordination, fanGraph } from "#integration/slice/generated/fan.fragment.ts"
import { retryCoordination, retryGraph } from "#integration/slice/generated/retry.fragment.ts"
import { syncCoordination, syncGraph } from "#integration/slice/generated/sync.fragment.ts"
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

/** The toy app's schema, each of den's four flows listed as its graph and its coordination fragments: one level, one installation, one migrations chain. */
export const App = schema(
	"Slice",
	[
		Feed,
		Item,
		Weight,
		Cursor,
		Order,
		Tally,
		Settled,
		Copied,
		Built,
		Audit,
		chainGraph,
		chainCoordination,
		fanGraph,
		fanCoordination,
		syncGraph,
		syncCoordination,
		retryGraph,
		retryCoordination
	],
	[contained(on(Audit, "step"), on(ChainResult, "step"))]
)
