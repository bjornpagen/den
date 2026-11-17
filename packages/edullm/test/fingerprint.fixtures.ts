/**
 * What the properties of fingerprint.test.ts read: its space, the whole prune a daily job runs, and the specification.
 */

import { alphabet, element, type Gen, int, oneOf, subarray } from "@bjornpagen/testing/gen"
import type { Case } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, HashMap, Option } from "effect"
import {
	absentOf,
	differingOf,
	EVERY_BUCKET,
	type Mark,
	PRINT_BUCKETS,
	printOf,
	type Settled,
	settledOf
} from "#fingerprint.ts"
import { type Range, widthOf } from "#ranges.ts"
import { law } from "#test/support/law.ts"

/** A key as both servers render it, and the mark its digest gives. */
type Key = Readonly<{ text: string; mark: Mark }>

/** Silver's keys, the replica's, and the most keys one prune task may fetch. */
export type Scenario = Readonly<{
	silver: ReadonlyArray<Key>
	source: ReadonlyArray<Key>
	fetchKeys: number
}>

export type Seen =
	| "deleted"
	| "split"
	| "untouched"
	| "replaced"
	| "collision-held"
	| "over-budget-bucket"

/**
 * Keys over a few buckets of the whole range, so buckets are shared, and fingerprints either from a handful of values,
 * so two key sets of one bucket can tally the same, or from all 2^24.
 */
export const scenarioGen: Gen<Scenario> = (source) => {
	const buckets = source.draw(
		alphabet(Arr.map(Arr.range(0, 5), () => source.draw(int(0, PRINT_BUCKETS - 1))))
	)
	const universe = Array.from({ length: source.draw(int(1, 12)) }, (_, at): Key => ({
		text: `k${String(at + 1)}`,
		mark: {
			bucket: source.draw(element(buckets)),
			fingerprint: source.draw(oneOf([int(0, 3), int(0, 2 ** 24 - 1)]))
		}
	}))
	return {
		silver: source.draw(subarray(universe)),
		source: source.draw(subarray(universe)),
		fetchKeys: source.draw(int(1, 6))
	}
}

const marksOf = (keys: ReadonlyArray<Key>) => Arr.map(keys, (key) => key.mark)

/** A whole prune, as a daily job's prune tasks run it: each range settled, a split's halves run as their own tasks. */
export const pruned = (scenario: Scenario, c: Case<Seen>) =>
	Effect.gen(function* () {
		let silver = scenario.silver
		let pending: ReadonlyArray<Range> = [EVERY_BUCKET]
		const sourcePrint = printOf(marksOf(scenario.source))
		while (Arr.isReadonlyArrayNonEmpty(pending)) {
			const range = Arr.headNonEmpty(pending)
			pending = Arr.tailNonEmpty(pending)
			const differing = differingOf(printOf(marksOf(silver)), sourcePrint, range)
			const settled: Settled = settledOf(differing, range, scenario.fetchKeys)
			switch (settled._tag) {
				case "Untouched":
					c.note("untouched")
					break
				case "Split":
					c.note("split")
					pending = [...settled.halves, ...pending]
					break
				case "Fetch": {
					const fetched = Arr.filter(scenario.source, (key) =>
						Arr.contains(settled.buckets, key.mark.bucket)
					)
					if (fetched.length > scenario.fetchKeys) {
						c.note("over-budget-bucket")
					}
					yield* law(
						"fetch within budget",
						fetched.length <= scenario.fetchKeys || widthOf(range) === 1,
						() =>
							`a range of ${String(widthOf(range))} buckets fetched ${String(fetched.length)} keys`
					)
					const absent = absentOf(silver, fetched, settled.buckets)
					if (Arr.isReadonlyArrayNonEmpty(absent)) {
						c.note("deleted")
					}
					const gone = new Set(Arr.map(absent, (key) => key.text))
					silver = Arr.filter(silver, (key) => !gone.has(key.text))
					break
				}
			}
		}
		return silver
	})

/**
 * The specification: Silver keeps every key the source holds, and loses exactly its absent keys in buckets whose
 * tallies differ.
 */
export const expectedOf = (scenario: Scenario, c: Case<Seen>): ReadonlySet<string> => {
	const held = new Set(Arr.map(scenario.source, (key) => key.text))
	const silverPrint = printOf(marksOf(scenario.silver))
	const sourcePrint = printOf(marksOf(scenario.source))
	const differs = (bucket: number) => {
		const ours = HashMap.get(silverPrint, bucket)
		const theirs = HashMap.get(sourcePrint, bucket)
		return !(
			Option.isSome(ours) &&
			Option.isSome(theirs) &&
			ours.value.keys === theirs.value.keys &&
			ours.value.sums === theirs.value.sums
		)
	}
	const kept = Arr.filter(scenario.silver, (key) => held.has(key.text) || !differs(key.mark.bucket))
	for (const key of Arr.filter(scenario.silver, (ours) => !held.has(ours.text))) {
		const bucketShares = Arr.some(
			scenario.source,
			(other) =>
				other.mark.bucket === key.mark.bucket &&
				!Arr.some(scenario.silver, (ours) => ours.text === other.text)
		)
		if (bucketShares) {
			c.note("replaced")
		}
		if (!differs(key.mark.bucket)) {
			c.note("collision-held")
		}
	}
	return new Set(Arr.map(kept, (key) => key.text))
}
