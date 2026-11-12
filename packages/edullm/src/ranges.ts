import { Array as Arr, Option } from "effect"

/**
 * A half-open range `[lo, hi)` of whole numbers, never empty: a page's heap blocks, or a prune's key buckets. Its width
 * is at least one, so "a page of no blocks" is no value of the type.
 */
export type Range = Readonly<{ lo: number; hi: number }>

/** A range, when `lo < hi`. */
export const rangeOf = (lo: number, hi: number): Option.Option<Range> =>
	lo < hi ? Option.some({ lo, hi }) : Option.none()

export const widthOf = (range: Range): number => range.hi - range.lo

/**
 * What a window of a relation's heap is cut by: its blocks `[from, blocks)` (`from` is the relation's cursor, 0 for a
 * daily read) and the bytes a block holds, measured on the replica at admission.
 */
export type HeapWindow = Readonly<{ from: number; blocks: number; bytesPerBlock: number }>

/**
 * A window's root pages: each spans `max(1, floor(pageBytes / bytesPerBlock))` blocks, the last cut at the window's
 * end, so every page's bytes stay within `pageBytes` unless one block alone exceeds it. A window with no block left is
 * no page at all, where edullm wrote a witness page `[0, 1)` for an empty heap: the empty read is the empty list.
 */
export const rootPagesOf = (window: HeapWindow, pageBytes: number): ReadonlyArray<Range> => {
	const width = Math.max(1, Math.floor(pageBytes / window.bytesPerBlock))
	const pages: Array<Range> = []
	for (let lo = window.from; lo < window.blocks; lo += width) {
		pages.push({ lo, hi: Math.min(lo + width, window.blocks) })
	}
	return pages
}

/**
 * A range's two halves, split at its midpoint, or none when it is one wide: the remedy for a page or prune the replica
 * could not answer in one statement. The first half takes the smaller share, so `[lo, lo + 2)` splits into two ranges
 * of one.
 */
export const halvesOf = (range: Range): Option.Option<readonly [Range, Range]> => {
	if (widthOf(range) < 2) {
		return Option.none()
	}
	const midpoint = range.lo + Math.floor(widthOf(range) / 2)
	return Option.some([
		{ lo: range.lo, hi: midpoint },
		{ lo: midpoint, hi: range.hi }
	])
}

/** Whether `ranges`, in order, tile `[lo, hi)`: each starts where the one before it ended, the first at `lo`. */
export const tiles = (ranges: ReadonlyArray<Range>, lo: number, hi: number): boolean =>
	Arr.match(ranges, {
		onEmpty: () => lo === hi,
		onNonEmpty: (all) =>
			Arr.headNonEmpty(all).lo === lo &&
			Arr.lastNonEmpty(all).hi === hi &&
			Arr.every(Arr.zip(all, Arr.drop(all, 1)), ([before, after]) => before.hi === after.lo) &&
			Arr.every(all, (range) => range.lo < range.hi)
	})
