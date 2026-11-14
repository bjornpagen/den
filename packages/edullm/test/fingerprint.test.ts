import { type Case, drawn, explore, Run } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { alphabet, element, type Gen, int, oneOf, subarray } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { runOfTest } from "@bjornpagen/testing/vitest/run"
import { describe, it } from "@effect/vitest"
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
import { caught, exploration, law } from "#test/support/search.ts"

/** A key as both servers render it, and the mark its digest gives. */
type Key = Readonly<{ text: string; mark: Mark }>

/** The three decisions of a prune, so a planted bug can break one. */
type Prune = Readonly<{
	differing: typeof differingOf
	settled: typeof settledOf
	absent: typeof absentOf
}>

const SOUND: Prune = { differing: differingOf, settled: settledOf, absent: absentOf }

/** Silver's keys, the replica's, and the most keys one prune task may fetch. */
type Scenario = Readonly<{
	silver: ReadonlyArray<Key>
	source: ReadonlyArray<Key>
	fetchKeys: number
}>

type Seen = "deleted" | "split" | "untouched" | "replaced" | "collision-held" | "over-budget-bucket"

/**
 * Keys over a few buckets of the whole range, so buckets are shared, and fingerprints either from a handful of values,
 * so two key sets of one bucket can tally the same, or from all 2^24.
 */
const scenarioGen: Gen<Scenario> = (source) => {
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
const pruned = (prune: Prune, scenario: Scenario, c: Case<Seen>) =>
	Effect.gen(function* () {
		let silver = scenario.silver
		let pending: ReadonlyArray<Range> = [EVERY_BUCKET]
		const sourcePrint = printOf(marksOf(scenario.source))
		while (Arr.isReadonlyArrayNonEmpty(pending)) {
			const range = Arr.headNonEmpty(pending)
			pending = Arr.tailNonEmpty(pending)
			const differing = prune.differing(printOf(marksOf(silver)), sourcePrint, range)
			const settled: Settled = prune.settled(differing, range, scenario.fetchKeys)
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
					const absent = prune.absent(silver, fetched, settled.buckets)
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

/** The specification: Silver keeps every key the source holds, and loses exactly its absent keys in buckets whose tallies differ. */
const expectedOf = (scenario: Scenario, c: Case<Seen>): ReadonlySet<string> => {
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

const pruneSearch = (suite: string, prune: Prune, runs: number) =>
	explore(
		exploration({
			suite,
			draw: drawn(scenarioGen),
			coverage: required<Seen>(
				["deleted", "split", "untouched", "replaced", "collision-held", "over-budget-bucket"],
				{
					cases: 200,
					sense: notesOnly
				}
			),
			runs,
			shrink: 200,
			oracle: {
				kind: "specification",
				name: "a prune deletes exactly Silver's keys the source lacks in buckets whose tallies differ, and fetches within its budget"
			}
		}),
		(scenario: Scenario, c: Case<Seen>) =>
			Effect.gen(function* () {
				const after = yield* pruned(prune, scenario, c)
				const expected = expectedOf(scenario, c)
				const kept = new Set(Arr.map(after, (key) => key.text))
				yield* law(
					"prune",
					kept.size === expected.size &&
						Arr.every(Arr.fromIterable(kept), (text) => expected.has(text)),
					() => "the prune kept a key it should delete, or deleted one the source holds"
				)
			})
	)

const inTheirRun = (ctx: Parameters<Parameters<typeof it.effect>[1]>[0]) =>
	Effect.provideServiceEffect(Run, runOfTest(ctx))

/** A print with every bucket's sum forgotten: a comparison of key counts alone. */
const countsOnly = (print: ReturnType<typeof printOf>) =>
	HashMap.map(print, (tally) => ({ keys: tally.keys, sums: 0 }))

describe("the bucketed-fingerprint prune", () => {
	it.effect(
		"deletes exactly the keys the source lost, fetching only differing buckets within budget",
		(ctx) => searched(ctx, pruneSearch("prune: bucketed fingerprints", SOUND, 500))
	)

	it.effect("catches a comparison of key counts alone", (ctx) =>
		caught(
			pruneSearch(
				"prune planted: counts compared, sums ignored",
				{
					...SOUND,
					differing: (silver, source, range) =>
						differingOf(countsOnly(silver), countsOnly(source), range)
				},
				100
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches a comparison driven by the source's buckets", (ctx) =>
		caught(
			pruneSearch(
				"prune planted: the source's buckets drive",
				{ ...SOUND, differing: (silver, source, range) => differingOf(source, silver, range) },
				100
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches a fetch that deletes beyond the buckets it read", (ctx) =>
		caught(
			pruneSearch(
				"prune planted: deletes across the range",
				{
					...SOUND,
					absent: (silver, fetched) =>
						absentOf(
							silver,
							fetched,
							Arr.map(silver, (key) => key.mark.bucket)
						)
				},
				100
			)
		).pipe(inTheirRun(ctx))
	)
})
