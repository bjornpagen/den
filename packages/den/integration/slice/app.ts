import { contained, on, schema } from "@bjornpagen/grizzle"
import {
	ChainResult,
	chainCoordination,
	chainGraph
} from "#integration/slice/generated/chain.fragment.ts"
import {
	fanCoordination,
	fanGraph,
	fanSeatLevel
} from "#integration/slice/generated/fan.fragment.ts"
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

/** The toy app's own level, each of den's four flows listed as its graph and its coordination fragments. */
const Listed = schema(
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

/**
 * The toy app's schema: its own level, and over it the fan-out's seat level, its live holds checked below its seat
 * counts, which no fragment can state: one installation, one migrations chain.
 */
export const App = schema.extend(
	Listed,
	"SliceSeats",
	[...fanSeatLevel.relations],
	[...fanSeatLevel.laws]
)
