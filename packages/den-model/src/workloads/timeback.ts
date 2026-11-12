import { Array as Arr } from "effect"
import type { Datum } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type Ceilings,
	type Ladder,
	type Lane,
	open,
	ordinals,
	type Program,
	type RootKind,
	type Runs,
	type ScopeKind,
	type StepKind,
	spawn,
	stepOf
} from "#program.ts"

/**
 * The Timeback workload's limits, each the test's input: the lane's width (edullm's `LANE_WIDTHS.timeback`, measured on
 * the bastion), how a part runs, and the most bytes one page may copy (`COPY_PAGE_BYTES`).
 */
export type TimebackLimits = Readonly<{
	width: number
	lease: number
	ceilings: Ceilings
	ladder: Ladder
	pageBytes: number
}>

/**
 * A replica relation as one night finds it: its heap blocks, the bytes a block holds as admission estimates it, and a
 * run of hot blocks, `[hotFrom, hotTo)`, that hold four times as many, which the estimate does not know.
 */
export type Relation = Readonly<{
	name: string
	blocks: number
	blockBytes: number
	hotFrom: number
	hotTo: number
}>

/** One night of one relation: the night's instant and the relation. */
export type Daily = Readonly<{ night: number; relation: Relation }>

/** A range of heap blocks, `[from, to)`. */
type Range = Readonly<{ from: number; to: number }>

/** A page: one range of one relation's blocks, cut at admission or split since. */
type PageInput = Readonly<{ daily: Daily; range: Range }>

/** What a page copied: the rows it loaded, or that it was too large and split in two. */
type PageCopy = Readonly<{ _tag: "Copied"; rows: number }> | Readonly<{ _tag: "Split" }>

/** The blocks of a range, in order. */
const blocksOf = (range: Range): ReadonlyArray<number> =>
	Arr.map(ordinals(range.to - range.from), (offset) => range.from + offset)

/** The bytes a range of a relation holds. */
const bytesOf = (relation: Relation, range: Range): number =>
	Arr.reduce(
		blocksOf(range),
		0,
		(sum, block) =>
			sum + (block >= relation.hotFrom && block < relation.hotTo ? 4 : 1) * relation.blockBytes
	)

/** The ranges admission cuts a relation's blocks into, each within the page bytes by the estimate. */
const cut = (relation: Relation, pageBytes: number): ReadonlyArray<Range> => {
	const per = Math.max(1, Math.floor(pageBytes / relation.blockBytes))
	return Arr.map(ordinals(Math.ceil(relation.blocks / per)), (page) => ({
		from: page * per,
		to: Math.min(relation.blocks, (page + 1) * per)
	}))
}

const showRange = (range: Range): Datum => ({ from: range.from, to: range.to })

/**
 * edullm's Timeback daily job as a den program: the root starts a print of the relation's key fingerprint; the print's
 * edge opens a pages scope, one page per block range admission cut, a page too large for one copy splitting in two
 * and a one-block page too large refused; the pages scope's finish starts the prune in the root; the root's finish
 * moves the relation's cursor to the night, or holds it where any part failed. Every part runs on one lane, under its
 * width.
 */
export const timebackOf = (
	limits: TimebackLimits
): Readonly<{ program: Program; admit: (daily: Daily) => Admission }> => {
	const timeback: Lane = { name: "timeback", width: limits.width, window: { _tag: "Always" } }
	const runs: Runs = {
		lane: timeback,
		lease: limits.lease,
		ceilings: limits.ceilings,
		ladder: limits.ladder
	}

	const Page: StepKind<PageInput, PageCopy, number> = {
		name: "TimebackPage",
		runs,
		input: (page) => ({ relation: page.daily.relation.name, range: showRange(page.range) }),
		output: (copy) => (copy._tag === "Copied" ? { rows: copy.rows } : { split: true }),
		error: (bytes) => ({ tooLarge: bytes }),
		body: (page) => {
			const bytes = bytesOf(page.daily.relation, page.range)
			if (bytes <= limits.pageBytes) {
				return {
					_tag: "Output",
					output: { _tag: "Copied", rows: page.range.to - page.range.from },
					writes: Arr.map(blocksOf(page.range), (block) => ({
						relation: "silver",
						key: `${page.daily.relation.name}:${block}`,
						value: page.daily.night
					}))
				}
			}
			return page.range.to - page.range.from > 1
				? { _tag: "Output", output: { _tag: "Split" }, writes: [] }
				: { _tag: "Failure", error: bytes }
		},
		edges: () => [
			spawn("split", Page, (page: PageInput, copy: PageCopy) => {
				if (copy._tag === "Copied") {
					return []
				}
				const middle = Math.floor((page.range.from + page.range.to) / 2)
				return [
					{ daily: page.daily, range: { from: page.range.from, to: middle } },
					{ daily: page.daily, range: { from: middle, to: page.range.to } }
				]
			})
		]
	}

	const Prune: StepKind<Daily, number, never> = {
		name: "TimebackPrune",
		runs,
		input: (daily) => ({ relation: daily.relation.name, night: daily.night }),
		output: (deleted) => deleted,
		error: () => 0,
		body: (daily) => ({
			_tag: "Output",
			output: 0,
			writes: [{ relation: "pruned", key: daily.relation.name, value: daily.night }]
		}),
		edges: () => []
	}

	const Pages: ScopeKind<Daily, boolean, never> = {
		name: "TimebackPages",
		input: (daily) => ({ relation: daily.relation.name, night: daily.night }),
		start: (daily) =>
			Arr.map(cut(daily.relation, limits.pageBytes), (range) => stepOf(Page, { daily, range })),
		finish: {
			runs,
			output: (complete) => complete,
			error: () => false,
			body: (_daily, children) => ({
				_tag: "Output",
				output: Arr.every(children, (child) => child._tag === "Done"),
				writes: []
			})
		}
	}

	const Print: StepKind<Daily, number, never> = {
		name: "TimebackPrint",
		runs,
		input: (daily) => ({ relation: daily.relation.name, night: daily.night }),
		output: (blocks) => blocks,
		error: () => 0,
		body: (daily) => ({
			_tag: "Output",
			output: daily.relation.blocks,
			writes: [{ relation: "timeback_print", key: daily.relation.name, value: daily.night }]
		}),
		edges: () => [
			open(
				"pages",
				Pages,
				(daily: Daily) => [daily],
				() => [spawn("prune", Prune, (daily: Daily) => [daily])]
			)
		]
	}

	const TimebackDaily: RootKind<Daily, boolean, never> = {
		name: "TimebackDaily",
		trigger: { _tag: "Schedule", every: 1 },
		scope: {
			name: "TimebackDaily",
			input: (daily) => ({ relation: daily.relation.name, night: daily.night }),
			start: (daily) => [stepOf(Print, daily)],
			finish: {
				runs,
				output: (moved) => moved,
				error: () => false,
				body: (daily, children) => {
					const moved = Arr.every(
						children,
						(child) =>
							child._tag === "Done" && (child.kind !== "TimebackPages" || child.output === true)
					)
					return {
						_tag: "Output",
						output: moved,
						writes: moved
							? [{ relation: "timeback_cursor", key: daily.relation.name, value: daily.night }]
							: []
					}
				}
			}
		}
	}

	return {
		program: { name: "timeback", lanes: [timeback] },
		admit: (daily) => admissionOf(TimebackDaily, `${daily.relation.name}:${daily.night}`, daily)
	}
}
