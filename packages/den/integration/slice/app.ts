import { contained, on, schema } from "@bjornpagen/grizzle"
import { assignCoordination, assignGraph } from "#integration/slice/generated/assign.fragment.ts"
import {
	ChainResult,
	chainCoordination,
	chainGraph
} from "#integration/slice/generated/chain.fragment.ts"
import { clockCoordination, clockGraph } from "#integration/slice/generated/clock.fragment.ts"
import {
	fanCoordination,
	fanGraph,
	fanSeatLevel
} from "#integration/slice/generated/fan.fragment.ts"
import { retryCoordination, retryGraph } from "#integration/slice/generated/retry.fragment.ts"
import {
	reviewCoordination,
	reviewGraph,
	reviewSeatLevel
} from "#integration/slice/generated/review.fragment.ts"
import { syncCoordination, syncGraph } from "#integration/slice/generated/sync.fragment.ts"
import {
	Assigned,
	Audit,
	Built,
	Chimed,
	Concluded,
	Copied,
	Cursor,
	Feed,
	Heard,
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

/** The toy app's own level, each of den's seven flows listed as its graph and its coordination fragments. */
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
		Heard,
		Chimed,
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
		reviewCoordination,
		clockGraph,
		clockCoordination
	],
	[contained(on(Audit, "step", "root"), on(ChainResult, "step", "root"))]
)

/**
 * The toy app's schema: its own level, and over it the fan-out's and the review's seat levels, their live holds checked below
 * their seat counts, which no fragment can state: one installation, one migrations chain.
 */
export const App = schema.extend(
	Listed,
	"SliceSeats",
	[...fanSeatLevel.relations, ...reviewSeatLevel.relations],
	[...fanSeatLevel.laws, ...reviewSeatLevel.laws]
)
