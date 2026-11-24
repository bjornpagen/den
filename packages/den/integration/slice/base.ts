import { mutable, schema } from "@bjornpagen/grizzle"
import {
	Assigned,
	Bell,
	Built,
	Chimed,
	Concluded,
	Copied,
	Cursor,
	Delivered,
	Feed,
	Heard,
	Item,
	LearnerUnit,
	Order,
	Passage,
	PassageUnit,
	Reviewed,
	Seen,
	Settled,
	Summary,
	Tally,
	Weight
} from "#integration/slice/relations.ts"

/**
 * The slice's app relations, the level below den's fragments: what each flow's steps read (`reads(SliceBase, ...)`), so
 * the records grizzle makes of a read's query stand on a level over the query's, as metis's essay grading reads its
 * delivery level. The app role `loader` holds every relation of it, so its workload serves the reads over it. Every
 * relation is closed but a passage and a seen passage, which the editor rewrites and takes back, each open inside its
 * unit.
 */
export const SliceBase = schema(
	"Slice",
	[
		Feed,
		Bell,
		Item,
		Weight,
		Cursor,
		Order,
		Tally,
		Settled,
		Copied,
		Built,
		Passage,
		Seen,
		Assigned,
		Concluded,
		Reviewed,
		Summary,
		Delivered,
		Heard,
		Chimed
	],
	[PassageUnit, mutable(Passage), LearnerUnit, mutable(Seen)]
)
