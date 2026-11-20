import { contained, on, schema } from "@bjornpagen/grizzle"
import { assignCoordination, assignGraph } from "#integration/slice/generated/assign.fragment.ts"
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
import { reviewCoordination, reviewGraph } from "#integration/slice/generated/review.fragment.ts"
import { syncCoordination, syncGraph } from "#integration/slice/generated/sync.fragment.ts"
import {
	Assigned,
	Audit,
	Built,
	Concluded,
	Copied,
	Cursor,
	Feed,
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

/** The toy app's own level, each of den's six flows listed as its graph and its coordination fragments. */
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
		Passage,
		Missed,
		Seen,
		Assigned,
		Concluded,
		Reviewed,
		Summary,
		chainGraph,
		chainCoordination,
		fanGraph,
		fanCoordination,
		syncGraph,
		syncCoordination,
		retryGraph,
		retryCoordination,
		assignGraph,
		assignCoordination,
		reviewGraph,
		reviewCoordination
	],
	[contained(on(Audit, "step", "root"), on(ChainResult, "step", "root"))]
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
