import { type Case, drawn, explore, Run } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { runOfTest } from "@bjornpagen/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option } from "effect"
import { halvesOf, type HeapWindow, type Range, rootPagesOf, tiles, widthOf } from "#ranges.ts"
import { caught, exploration, law } from "#test/support/search.ts"

type Pages = (window: HeapWindow, pageBytes: number) => ReadonlyArray<Range>
type Halves = (range: Range) => Option.Option<readonly [Range, Range]>

type Cut = Readonly<{ window: HeapWindow; pageBytes: number }>

type CutSeen = "empty" | "one-page" | "several-pages" | "last-shorter" | "block-over-budget"

const cutGen: Gen<Cut> = (source) => {
	const from = source.draw(int(0, 20))
	return {
		window: {
			from,
			blocks: from + source.draw(int(0, 40)),
			bytesPerBlock: source.draw(int(1, 50))
		},
		pageBytes: source.draw(int(1, 200))
	}
}

const cutSearch = (suite: string, pagesOf: Pages, runs: number) =>
	explore(
		exploration({
			suite,
			draw: drawn(cutGen),
			coverage: required<CutSeen>(
				["empty", "one-page", "several-pages", "last-shorter", "block-over-budget"],
				{
					cases: 150,
					sense: notesOnly
				}
			),
			runs,
			shrink: 200,
			oracle: {
				kind: "specification",
				name: "a window's pages tile it, each as wide as the page budget allows and at least one block"
			}
		}),
		({ window, pageBytes }: Cut, c: Case<CutSeen>) =>
			Effect.gen(function* () {
				const pages = pagesOf(window, pageBytes)
				const width = Math.max(1, Math.floor(pageBytes / window.bytesPerBlock))
				c.note(pages.length === 0 ? "empty" : pages.length === 1 ? "one-page" : "several-pages")
				if (window.bytesPerBlock > pageBytes) {
					c.note("block-over-budget")
				}
				if (Option.exists(Arr.last(pages), (last) => pages.length > 1 && widthOf(last) < width)) {
					c.note("last-shorter")
				}
				yield* law(
					"tiled",
					tiles(pages, window.from, window.blocks),
					() => `pages ${String(pages.length)} do not tile the window`
				)
				yield* law(
					"within budget",
					Arr.every(
						pages,
						(page) => widthOf(page) === 1 || widthOf(page) * window.bytesPerBlock <= pageBytes
					),
					() => "a page of several blocks exceeds the page budget"
				)
				yield* law(
					"as wide as allowed",
					Arr.every(Arr.dropRight(pages, 1), (page) => widthOf(page) === width),
					() => "a page before the last is narrower than the budget allows"
				)
			})
	)

type SplitSeen = "unit" | "even" | "odd" | "deep"

/** Every leaf of a range halved until no half splits, and the depth it took. */
const leavesOf = (
	halves: Halves,
	range: Range,
	depth: number
): Readonly<{ leaves: ReadonlyArray<Range>; depth: number }> =>
	Option.match(halves(range), {
		onNone: () => ({ leaves: [range], depth }),
		onSome: ([low, high]) => {
			const left = leavesOf(halves, low, depth + 1)
			const right = leavesOf(halves, high, depth + 1)
			return { leaves: [...left.leaves, ...right.leaves], depth: Math.max(left.depth, right.depth) }
		}
	})

const splitSearch = (suite: string, halves: Halves, runs: number) =>
	explore(
		exploration({
			suite,
			draw: drawn((source): Range => {
				const lo = source.draw(int(0, 1000))
				return { lo, hi: lo + source.draw(int(1, 64)) }
			}),
			coverage: required<SplitSeen>(["unit", "even", "odd", "deep"], {
				cases: 100,
				sense: notesOnly
			}),
			runs,
			shrink: 200,
			oracle: {
				kind: "specification",
				name: "a split's halves tile their range, none is empty, and halving ends at single blocks within ⌈log2 width⌉ splits"
			}
		}),
		(range: Range, c: Case<SplitSeen>) =>
			Effect.gen(function* () {
				const width = widthOf(range)
				c.note(width === 1 ? "unit" : width % 2 === 0 ? "even" : "odd")
				const split = halves(range)
				yield* law(
					"unit ranges never split",
					width > 1 || Option.isNone(split),
					() => "a one-wide range split"
				)
				yield* Option.match(split, {
					onNone: () => Effect.void,
					onSome: ([low, high]) =>
						law(
							"halves tile",
							tiles([low, high], range.lo, range.hi),
							() => "the halves do not tile their range"
						)
				})
				const { leaves, depth } = leavesOf(halves, range, 0)
				if (depth >= 4) {
					c.note("deep")
				}
				yield* law(
					"halving ends at single blocks",
					tiles(leaves, range.lo, range.hi) && Arr.every(leaves, (leaf) => widthOf(leaf) === 1),
					() => "the leaves of repeated halving are not the range's single blocks"
				)
				yield* law(
					"logarithmic depth",
					2 ** depth < 2 * width,
					() => `halving took ${String(depth)} splits for a width of ${String(width)}`
				)
			})
	)

const inTheirRun = (ctx: Parameters<Parameters<typeof it.effect>[1]>[0]) =>
	Effect.provideServiceEffect(Run, runOfTest(ctx))

describe("block and bucket ranges", () => {
	it.effect("a window's root pages tile it within the page budget", (ctx) =>
		searched(ctx, cutSearch("ranges: root pages", rootPagesOf, 400))
	)

	it.effect("a range's halves tile it, down to single blocks", (ctx) =>
		searched(ctx, splitSearch("ranges: halves", halvesOf, 400))
	)

	it.effect("catches pages whose width is rounded up past the budget", (ctx) =>
		caught(
			cutSearch(
				"ranges planted: page width rounded up",
				(window, pageBytes) => rootPagesOf(window, pageBytes + window.bytesPerBlock - 1),
				100
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches a cut that drops the window's last block", (ctx) =>
		caught(
			cutSearch(
				"ranges planted: last block dropped",
				(window, pageBytes) =>
					Arr.map(rootPagesOf(window, pageBytes), (page) =>
						page.hi === window.blocks ? { lo: page.lo, hi: page.hi - 1 } : page
					),
				100
			)
		).pipe(inTheirRun(ctx))
	)
})
