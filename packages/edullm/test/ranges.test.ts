/**
 * Block and bucket ranges: a relation's heap window, its blocks and the bytes a block holds drawn small, cut into root
 * pages under a drawn page budget, so a block alone may exceed it; and a range of up to 64 blocks halved at its
 * midpoint, then each half again, until no half splits. A window's root pages tile it, each as wide as the budget
 * allows and at least one block; a range's halves tile it, and halving ends at its single blocks within ⌈log2 width⌉
 * splits.
 *
 * Oracle (specification): a window's pages tile it, each as wide as the page budget allows and at least one block; a
 * split's halves tile their range, none is empty, and halving ends at single blocks within ⌈log2 width⌉ splits.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { halvesOf, type Range, rootPagesOf, tiles, widthOf } from "#ranges.ts"
import {
	type Cut,
	cutGen,
	type CutSeen,
	leavesOf,
	rangeGen,
	type SplitSeen
} from "#test/ranges.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * Block and bucket ranges: a window's root pages tile it within the page budget.
 *
 * Budget: its suite's count before the conversion (ranges: root pages: 400 independent cases and 150 steered, Vitest at
 * den dc5bd11).
 */
export const cuts = property.explore(cutGen, {
	needs: {},
	situations: [
		"empty",
		"one-page",
		"several-pages",
		"last-shorter",
		"block-over-budget"
	] satisfies ReadonlyArray<Reached<CutSeen>>,
	check:
		(_, c: Case<CutSeen>) =>
		({ window, pageBytes }: Cut) =>
			Effect.gen(function* () {
				const pages = rootPagesOf(window, pageBytes)
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
			}),
	oracle: {
		kind: "specification",
		name: "a window's pages tile it, each as wide as the page budget allows and at least one block"
	},
	budget: { runs: 400, steered: 150 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\tconst width = Math.max(1, Math.floor(pageBytes / window.bytesPerBlock))",
			replacement: "\tconst width = Math.max(1, Math.ceil(pageBytes / window.bytesPerBlock))",
			why: "Pages whose width is rounded up past the budget hold more bytes than a page may; the cuts property fails on a page budget no whole number of blocks fills."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\t\tpages.push({ lo, hi: Math.min(lo + width, window.blocks) })",
			replacement: "\t\tpages.push({ lo, hi: Math.min(lo + width, window.blocks - 1) })",
			why: "A cut that drops the window's last block leaves it unread; the cuts property fails on any window with a block."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\tfor (let lo = window.from; lo < window.blocks; lo += width) {",
			replacement: "\tfor (let lo = window.from; lo >= window.blocks; lo += width) {",
			why: "Operator mutant (comparison) at packages/edullm/src/ranges.ts:29 in rootPagesOf: `<` becomes `>=`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\t\tpages.push({ lo, hi: Math.min(lo + width, window.blocks) })",
			replacement: "\t\t{}",
			why: "Operator mutant (statement) at packages/edullm/src/ranges.ts:30 in rootPagesOf: `pages.push({ lo, hi: Math.min(lo + width, window.blocks) })` becomes `{}`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "export const widthOf = (range: Range): number => range.hi - range.lo",
			replacement: "export const widthOf = (range: Range): number => range.lo - range.hi",
			why: "Operator mutant (operand-swap) at packages/edullm/src/ranges.ts:13 in widthOf: `range.hi - range.lo` becomes `range.lo - range.hi`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})

/**
 * Block and bucket ranges: a range's halves tile it, down to single blocks.
 *
 * Budget: its suite's count before the conversion (ranges: halves: 400 independent cases and 100 steered, Vitest at den
 * dc5bd11).
 */
export const halves = property.explore(rangeGen, {
	needs: {},
	situations: ["unit", "even", "odd", "deep"] satisfies ReadonlyArray<Reached<SplitSeen>>,
	check: (_, c: Case<SplitSeen>) => (range: Range) =>
		Effect.gen(function* () {
			const width = widthOf(range)
			c.note(width === 1 ? "unit" : width % 2 === 0 ? "even" : "odd")
			const split = halvesOf(range)
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
			const { leaves, depth } = leavesOf(range, 0)
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
		}),
	oracle: {
		kind: "specification",
		name: "a split's halves tile their range, none is empty, and halving ends at single blocks within ⌈log2 width⌉ splits"
	},
	budget: { runs: 400, steered: 100 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\t\t{ lo: midpoint, hi: range.hi }",
			replacement: "\t\t{ lo: midpoint + 1, hi: range.hi }",
			why: "Halves with a block between them leave the block at the midpoint in neither; the halves property fails on any range wider than one."
		},
		{
			file: "packages/edullm/src/ranges.ts",
			original: "\tconst midpoint = range.lo + Math.floor(widthOf(range) / 2)",
			replacement: "\tconst midpoint = range.lo + Math.floor(widthOf(range) / 3)",
			why: "Operator mutant (bound) at packages/edullm/src/ranges.ts:44 in halvesOf: `2` becomes `3`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
