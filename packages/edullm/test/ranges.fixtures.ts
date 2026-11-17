/** What the properties of ranges.test.ts read: their spaces, and every leaf of repeated halving. */

import { type Gen, int } from "@bjornpagen/testing/gen"
import { Option } from "effect"
import { halvesOf, type HeapWindow, type Range } from "#ranges.ts"

export type Cut = Readonly<{ window: HeapWindow; pageBytes: number }>

export type CutSeen = "empty" | "one-page" | "several-pages" | "last-shorter" | "block-over-budget"

export const cutGen: Gen<Cut> = (source) => {
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

export type SplitSeen = "unit" | "even" | "odd" | "deep"

export const rangeGen: Gen<Range> = (source) => {
	const lo = source.draw(int(0, 1000))
	return { lo, hi: lo + source.draw(int(1, 64)) }
}

/** Every leaf of a range halved until no half splits, and the depth it took. */
export const leavesOf = (
	range: Range,
	depth: number
): Readonly<{ leaves: ReadonlyArray<Range>; depth: number }> =>
	Option.match(halvesOf(range), {
		onNone: () => ({ leaves: [range], depth }),
		onSome: ([low, high]) => {
			const left = leavesOf(low, depth + 1)
			const right = leavesOf(high, depth + 1)
			return { leaves: [...left.leaves, ...right.leaves], depth: Math.max(left.depth, right.depth) }
		}
	})
