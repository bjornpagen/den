import { Array as Arr, Option } from "effect"
import type { Datum } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type Ladder,
	open,
	ordinals,
	type Program,
	type Resource,
	type RootKind,
	rootedOf,
	type Runs,
	type ScopeKind,
	type StepKind,
	spawn,
	stepOf,
	type Window
} from "#program.ts"

/**
 * W1's limits, each the test's input: the replica's seats (edullm's measured 8 on the bastion), the window the daily
 * job claims in, how a part runs (its lease and its ladder, five attempts), and the most bytes one page may copy
 * (`COPY_PAGE_BYTES`).
 */
export type TimebackLimits = Readonly<{
	seats: number
	window: Option.Option<Window>
	lease: number
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

const showDaily = (daily: Daily): Datum => ({ relation: daily.relation.name, night: daily.night })

/** The root kind of W1, by name, for the precondition of W4. */
export const TIMEBACK_DAILY = "TimebackDaily"

/**
 * W1, edullm's Timeback daily job, as a den program: a root per relation and night, exclusive per relation and inside
 * its window, starts a print of the relation's key fingerprint; the print's edge opens a pages scope, one page per
 * block range admission cut, a page too large for one copy splitting in two and a one-block page too large refused;
 * the pages scope's finish starts the prune in the root, which reads the print's fingerprint as its declared read; the
 * root's finish moves the relation's cursor to the night, or holds it where any part failed. Every part holds a seat
 * of the replica while it runs.
 */
export const timebackOf = (
	limits: TimebackLimits
): Readonly<{ program: Program; admit: (daily: Daily) => Admission }> => {
	const replica: Resource = { name: "replica", seats: limits.seats }
	const runs: Runs = { lease: limits.lease, holds: [replica], ladder: limits.ladder }
	const free: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Page: StepKind<PageInput, PageCopy, number> = {
		name: "TimebackPage",
		runs,
		input: (page) => ({ relation: page.daily.relation.name, range: showRange(page.range) }),
		output: (copy) => (copy._tag === "Copied" ? { rows: copy.rows } : { split: true }),
		error: (bytes) => ({ tooLarge: bytes }),
		reads: () => [],
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

	/** The prune compares Silver with the print its declared read returns, and prunes against that night's print. */
	const Prune: StepKind<Daily, number, never> = {
		name: "TimebackPrune",
		runs,
		input: showDaily,
		output: (deleted) => deleted,
		error: () => 0,
		reads: (daily) => [
			{
				name: "print",
				query: { _tag: "Rows", relation: "timeback_print", key: Option.some(daily.relation.name) }
			}
		],
		body: (daily, claimed) => ({
			_tag: "Output",
			output: 0,
			writes: Arr.map(claimed.read("print"), (print) => ({
				relation: "pruned",
				key: daily.relation.name,
				value: print.value
			}))
		}),
		edges: () => []
	}

	const Pages: ScopeKind<Daily, boolean, never> = {
		name: "TimebackPages",
		input: showDaily,
		start: (daily) =>
			Arr.map(cut(daily.relation, limits.pageBytes), (range) => stepOf(Page, { daily, range })),
		finish: {
			runs: free,
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
		input: showDaily,
		output: (blocks) => blocks,
		error: () => 0,
		reads: () => [],
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
		name: TIMEBACK_DAILY,
		trigger: { _tag: "Schedule", every: 1 },
		from: { _tag: "Derived" },
		precondition: Option.none(),
		window: limits.window,
		exclusive: Option.some((daily) => daily.relation.name),
		scope: {
			name: TIMEBACK_DAILY,
			input: showDaily,
			start: (daily) => [stepOf(Print, daily)],
			finish: {
				runs: free,
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
		program: {
			name: "timeback",
			resources: [replica],
			roots: [rootedOf(TimebackDaily)]
		},
		admit: (daily) => admissionOf(TimebackDaily, `${daily.relation.name}:${daily.night}`, daily)
	}
}
