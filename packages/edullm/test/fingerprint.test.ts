/**
 * The bucketed-fingerprint prune: Silver's keys and the replica's, drawn over a few buckets of the whole range so
 * buckets are shared, with fingerprints from a handful of values, so two key sets of one bucket can tally the same, or
 * from all 2^24; pruned as a daily job's prune tasks run it, from every bucket, each range settled untouched, split at
 * its midpoint or fetched, a split's halves run as their own tasks. It deletes exactly the keys the source lost in
 * buckets whose tallies differ, fetching only differing buckets, within its budget unless one bucket alone exceeds it.
 *
 * Oracle (specification): a prune deletes exactly Silver's keys the source lacks in buckets whose tallies differ, and
 * fetches within its budget.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect } from "effect"
import {
	expectedOf,
	pruned,
	type Scenario,
	scenarioGen,
	type Seen
} from "#test/fingerprint.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * The bucketed-fingerprint prune deletes exactly the keys the source lost, fetching only differing buckets within
 * budget.
 *
 * Budget: its suite's count before the conversion (prune: bucketed fingerprints: 500 independent cases and 200 steered,
 * Vitest at den dc5bd11).
 */
export const prune = property.explore(scenarioGen, {
	needs: {},
	situations: [
		"deleted",
		"split",
		"untouched",
		"replaced",
		"collision-held",
		"over-budget-bucket"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (_, c: Case<Seen>) => (scenario: Scenario) =>
		Effect.gen(function* () {
			const after = yield* pruned(scenario, c)
			const expected = expectedOf(scenario, c)
			const kept = new Set(Arr.map(after, (key) => key.text))
			yield* law(
				"prune",
				kept.size === expected.size &&
					Arr.every(Arr.fromIterable(kept), (text) => expected.has(text)),
				() => "the prune kept a key it should delete, or deleted one the source holds"
			)
		}),
	oracle: {
		kind: "specification",
		name: "a prune deletes exactly Silver's keys the source lacks in buckets whose tallies differ, and fetches within its budget"
	},
	budget: { runs: 500, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/fingerprint.ts",
			original: "(tally) => tally.keys === ours.keys && tally.sums === ours.sums",
			replacement: "(tally) => tally.keys === ours.keys",
			why: "A comparison of key counts alone takes a bucket whose keys were replaced by as many others for an unchanged one, so the replaced keys are never deleted; the prune property fails."
		},
		{
			file: "packages/edullm/src/fingerprint.ts",
			original:
				"\t\tArr.filterMap(Arr.fromIterable(silver), ([bucket, ours]): Result.Result<Differing, void> => {\n\t\t\tconst theirs = HashMap.get(source, bucket)",
			replacement:
				"\t\tArr.filterMap(Arr.fromIterable(source), ([bucket, ours]): Result.Result<Differing, void> => {\n\t\t\tconst theirs = HashMap.get(silver, bucket)",
			why: "A comparison driven by the source's buckets never visits a bucket the source emptied, so Silver keeps every key of it; the prune property fails."
		},
		{
			file: "packages/edullm/src/fingerprint.ts",
			original: "(key) => Arr.contains(buckets, key.mark.bucket) && !present.has(key.text)",
			replacement: "(key) => !present.has(key.text)",
			why: "A fetch that deletes beyond the buckets it read deletes Silver's keys of every other bucket, which the source still holds; the prune property fails."
		},
		{
			file: "packages/edullm/src/fingerprint.ts",
			original:
				"const inRange = (range: Range) => (bucket: number) => bucket >= range.lo && bucket < range.hi",
			replacement:
				"const inRange = (range: Range) => (bucket: number) => bucket < range.lo && bucket < range.hi",
			why: "Operator mutant (comparison) at packages/edullm/src/fingerprint.ts:67 in inRange: `>=` becomes `<`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\tif (widthOf(range) < 2) {\n\t\treturn Option.none()\n\t}",
			replacement: "\t{}",
			why: "Operator mutant (guard) at packages/edullm/src/ranges.ts:41 in halvesOf: `if (widthOf(range) < 2) { return Option.none() }` becomes `{}`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\tconst midpoint = range.lo + Math.floor(widthOf(range) / 2)",
			replacement: "\tconst midpoint = range.lo + Math.floor(widthOf(range) / 1)",
			why: "Operator mutant (bound) at packages/edullm/src/ranges.ts:44 in halvesOf: `2` becomes `1`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
