import { Array as Arr, Order } from "effect"
import type { By } from "#facts.ts"
import { type Admission, type Program, together } from "#program.ts"
import type { Act } from "#simulator.ts"
import {
	type AlphaTestLimits,
	alphatestOf,
	type Night as AlphaTestNight
} from "#workloads/alphatest.ts"
import { type EnrollmentLimits, enrollmentOf } from "#workloads/enrollment.ts"
import { type GoldLimits, goldOf, type Refresh } from "#workloads/gold.ts"
import { type Night as QtiNight, type QtiLimits, qtiOf } from "#workloads/qti.ts"
import { type Report, type ReportLimits, reportsOf, TIMEBACK_REPORTS } from "#workloads/reports.ts"
import { type SeedLimits, type Seeding, seedOf } from "#workloads/seed.ts"
import { type Attempt, type TakedownLimits, takedownOf } from "#workloads/takedown.ts"
import { type Daily, type TimebackLimits, timebackOf } from "#workloads/timeback.ts"

/** The limits of the eight workloads, each its own. */
export type Limits = Readonly<{
	timeback: TimebackLimits
	alphatest: AlphaTestLimits
	qti: QtiLimits
	gold: GoldLimits
	takedown: TakedownLimits
	reports: ReportLimits
	enrollment: EnrollmentLimits
	seed: SeedLimits
}>

/** Something the world does at an instant. */
type At<A> = Readonly<{ at: number; what: A }>

/**
 * What edullm's world does to den over a run, workload by workload: W1's nightly admissions per relation, W2's and
 * W3's nights, W4's refreshes (a schedule's or the button's), W5's lesson attempts (each entered, beaconing once a tick
 * until the child leaves), W6's report rows, W7's hourly passes and the intents the app writes, and W8's seed runs.
 */
export type World = Readonly<{
	timeback: ReadonlyArray<At<Daily>>
	alphatest: ReadonlyArray<At<AlphaTestNight>>
	qti: ReadonlyArray<At<QtiNight>>
	gold: ReadonlyArray<At<Readonly<{ refresh: Refresh; by: By }>>>
	attempts: ReadonlyArray<Readonly<{ attempt: Attempt; leaves: number }>>
	reports: ReadonlyArray<Report>
	hours: ReadonlyArray<number>
	intents: ReadonlyArray<At<Readonly<{ key: string; value: number }>>>
	seeds: ReadonlyArray<At<Seeding>>
}>

const ACT_ORDER = Order.mapInput(Order.Number, (act: Act) => act.at)

/**
 * edullm's eight workloads side by side in one app, as one program over one ledger, and every act its world makes, in
 * order, with the horizon: the latest instant the world names.
 */
export const edullmOf = (
	limits: Limits,
	world: World
): Readonly<{ program: Program; acts: ReadonlyArray<Act>; horizon: number }> => {
	const timeback = timebackOf(limits.timeback)
	const alphatest = alphatestOf(limits.alphatest)
	const qti = qtiOf(limits.qti)
	const gold = goldOf(limits.gold)
	const takedown = takedownOf(limits.takedown)
	const reports = reportsOf(TIMEBACK_REPORTS, limits.reports)
	const enrollment = enrollmentOf(limits.enrollment)
	const seed = seedOf(limits.seed)
	const admit = (at: number, by: By, admission: Admission): Act => ({
		_tag: "Admit",
		at,
		admission,
		by
	})
	const acts: ReadonlyArray<Act> = [
		...Arr.map(world.timeback, (act) => admit(act.at, "schedule", timeback.admit(act.what))),
		...Arr.map(world.alphatest, (act) => admit(act.at, "schedule", alphatest.admit(act.what))),
		...Arr.flatMap(world.qti, (act) =>
			Arr.map(qti.admit(act.what), (admission) => admit(act.at, "schedule", admission))
		),
		...Arr.map(world.gold, (act) => admit(act.at, act.what.by, gold.admit(act.what.refresh))),
		...Arr.flatMap(world.attempts, ({ attempt, leaves }): ReadonlyArray<Act> => [
			{
				_tag: "Write",
				at: attempt.entered,
				writes: [{ relation: "attempt", key: attempt.id, value: attempt.entered }],
				admits: [takedown.enter(attempt)]
			},
			...Arr.map(
				Array.from(
					{ length: Math.max(0, leaves - attempt.entered) },
					(_, after) => attempt.entered + after
				),
				(at): Act => ({
					_tag: "Write",
					at,
					writes: [{ relation: "beacon", key: attempt.id, value: at }],
					admits: []
				})
			)
		]),
		...Arr.map(world.reports, (report): Act => ({
			_tag: "Write",
			at: report.written,
			writes: [{ relation: "report", key: report.id, value: report.written }],
			admits: [reports.write(report)]
		})),
		...Arr.map(world.hours, (hour) => admit(hour, "schedule", enrollment.hourly(hour))),
		...Arr.map(world.intents, (intent): Act => ({
			_tag: "Write",
			at: intent.at,
			writes: [{ relation: "enrollment_intent", key: intent.what.key, value: intent.what.value }],
			admits: []
		})),
		...Arr.map(world.seeds, (act) => admit(act.at, "operator", seed.start(act.what)))
	]
	const sorted = Arr.sort(acts, ACT_ORDER)
	const horizon = Arr.reduce(
		[
			...Arr.map(sorted, (act) => act.at),
			...Arr.map(world.reports, (report) => report.heals),
			...Arr.map(world.attempts, ({ leaves }) => leaves + limits.takedown.idle)
		],
		0,
		Math.max
	)
	return {
		program: together("edullm", [
			timeback.program,
			alphatest.program,
			qti.program,
			gold.program,
			takedown.program,
			reports.program,
			enrollment.program,
			seed.program
		]),
		acts: sorted,
		horizon
	}
}
