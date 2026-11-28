import { Array as Arr, Order } from "effect"
import { type Admission, type Program, together } from "#program.ts"
import type { Act } from "#simulator.ts"
import { type Analysis, type GapLimits, gapOf } from "#workloads/gap.ts"
import { type HistoryLimits, historyOf, type Load } from "#workloads/history.ts"
import { type Report, type ReportLimits, reportsOf, TIME_SPENT } from "#workloads/reports.ts"
import { type Graded, type WritebackLimits, writebackOf } from "#workloads/writeback.ts"

/**
 * The limits of AlphaTest's background work, each its own, and the seats of its two shared bottlenecks: Anthropic's,
 * which every model call of every analysis and plan holds, and Timeback's, which every writeback call and stamp holds.
 */
export type MetisLimits = Readonly<{
	anthropic: number
	timeback: number
	writeback: Omit<WritebackLimits, "seats">
	gap: Omit<GapLimits, "anthropic" | "timeback">
	timeSpent: ReportLimits
	history: HistoryLimits
}>

/** Something the world does at an instant. */
type At<A> = Readonly<{ at: number; what: A }>

/**
 * One grading as AlphaTest's app commits it: the attempt the writeback sends, and the analysis its gap analysis runs,
 * both requested by grading's own commit.
 */
export type Grading = Readonly<{ graded: Graded; analysis: Analysis }>

/**
 * What AlphaTest's world does to den over a run: its gradings, each writing its grade and requesting its writeback and
 * its gap analysis in the same transaction; its time segments, each written with the request of its Caliper delivery;
 * and the operator's history loads.
 */
export type MetisWorld = Readonly<{
	gradings: ReadonlyArray<At<Grading>>
	segments: ReadonlyArray<Report>
	loads: ReadonlyArray<At<Load>>
}>

const ACT_ORDER = Order.mapInput(Order.Number, (act: Act) => act.at)

/**
 * AlphaTest's background work side by side in one app, as one program over one ledger: the Timeback writeback, the
 * gap analysis with its plan, the time-spent deliveries and the history load; with every act its world makes, in
 * order, and the horizon, the latest instant the world names.
 */
export const metisOf = (
	limits: MetisLimits,
	world: MetisWorld
): Readonly<{ program: Program; acts: ReadonlyArray<Act>; horizon: number }> => {
	const writeback = writebackOf({ ...limits.writeback, seats: limits.timeback })
	const gap = gapOf({ ...limits.gap, anthropic: limits.anthropic, timeback: limits.timeback })
	const timeSpent = reportsOf(TIME_SPENT, limits.timeSpent)
	const history = historyOf(limits.history)
	const write = (
		at: number,
		writes: Extract<Act, { readonly _tag: "Write" }>["writes"],
		admits: ReadonlyArray<Admission>
	): Act => ({ _tag: "Write", at, writes, admits })
	const acts: ReadonlyArray<Act> = [
		...Arr.map(world.gradings, ({ at, what }) =>
			write(
				at,
				[{ relation: "grade", key: what.graded.attempt, value: what.graded.questions }],
				[writeback.request(what.graded), gap.request(what.analysis)]
			)
		),
		...Arr.map(world.segments, (segment) =>
			write(
				segment.written,
				[{ relation: TIME_SPENT.row, key: segment.id, value: segment.written }],
				[timeSpent.write(segment)]
			)
		),
		...Arr.map(world.loads, ({ at, what }): Act => ({
			_tag: "Admit",
			at,
			admission: history.start(what),
			by: "operator"
		}))
	]
	const sorted = Arr.sort(acts, ACT_ORDER)
	const horizon = Arr.reduce(
		[...Arr.map(sorted, (act) => act.at), ...Arr.map(world.segments, (segment) => segment.heals)],
		0,
		(latest, at) => Math.max(latest, at)
	)
	return {
		program: together("metis", [
			writeback.program,
			gap.program,
			timeSpent.program,
			history.program
		]),
		acts: sorted,
		horizon
	}
}
