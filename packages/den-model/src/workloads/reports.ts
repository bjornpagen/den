import { Option } from "effect"
import {
	type Admission,
	admissionOf,
	type Program,
	type RootKind,
	rootedOf,
	type Runs,
	type StepKind,
	stepAt
} from "#program.ts"

/**
 * W6's limits, each the test's input: the delay a stretch report waits before it is sent (edullm's 3 s), and how a
 * delivery runs: its lease and the rungs of its ladder, which never ends (full-jitter backoff capped at 300 s, at the
 * model's scale and without the jitter).
 */
export type ReportLimits = Readonly<{ delay: number; lease: number; first: number; last: number }>

/**
 * One report as Timeback will take it: its id, the instant the app wrote it, whether it is a stretch (sent after the
 * delay), and the instant Timeback's outage ends, before which every delivery is refused and retried.
 */
export type Report = Readonly<{ id: string; written: number; stretch: boolean; heals: number }>

/**
 * The names of a delivery program: its root kind, its one step kind, the app relation whose row requests it, and the
 * relation its delivery writes once the outside system took it. One shape serves two workloads, so each is these
 * names over it.
 */
export type Delivery = Readonly<{ root: string; step: string; row: string; delivered: string }>

/** W6, the Timeback reports. */
export const TIMEBACK_REPORTS: Delivery = {
	root: "TimebackReport",
	step: "ReportDelivery",
	row: "report",
	delivered: "report_delivered"
}

/** AlphaTest's time-spent Caliper events, one root per segment the app writes, keyed by the segment's event id. */
export const TIME_SPENT: Delivery = {
	root: "TimeSpent",
	step: "CaliperDelivery",
	row: "time_segment",
	delivered: "caliper_accepted"
}

/**
 * A delivery program (W6, the Timeback reports; AlphaTest's time-spent events): the app's own write of a row admits
 * its root in the same transaction, whose one delivery is due at once, or after the delay for a stretch; a delivery
 * the outside system refuses is retried on a ladder that never ends, until it takes it.
 */
export const reportsOf = (
	names: Delivery,
	limits: ReportLimits
): Readonly<{ program: Program; write: (report: Report) => Admission }> => {
	const runs: Runs = {
		lease: limits.lease,
		holds: [],
		ladder: { _tag: "Never", first: limits.first, last: limits.last }
	}

	const Deliver: StepKind<Report, boolean, never> = {
		name: names.step,
		runs,
		input: (report) => ({ id: report.id, stretch: report.stretch }),
		output: (taken) => taken,
		error: () => false,
		reads: () => [],
		body: (report, claimed) =>
			claimed.at < report.heals
				? {
						_tag: "Retry",
						at: claimed.at + Math.min(limits.first * 2 ** claimed.attempts, limits.last),
						counts: "attempt"
					}
				: {
						_tag: "Output",
						output: true,
						writes: [{ relation: names.delivered, key: report.id, value: claimed.at }]
					},
		edges: () => []
	}

	const ReportRoot: RootKind<Report, number, never> = {
		name: names.root,
		trigger: { _tag: "App" },
		from: { _tag: "Given", heading: `${names.root}Input` },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: names.root,
			input: (report) => ({ id: report.id }),
			start: (report) => [
				stepAt(Deliver, report, report.written + (report.stretch ? limits.delay : 0))
			],
			finish: {
				runs,
				output: (delivered) => delivered,
				error: () => 0,
				body: (_report, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}

	return {
		program: { name: names.root, resources: [], roots: [rootedOf(ReportRoot)] },
		write: (report) => admissionOf(ReportRoot, report.id, report)
	}
}
