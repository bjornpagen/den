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
 * W6, the Timeback reports, as a den program: the app's own write of a report row admits its root in the same
 * transaction, whose one delivery is due at once, or after the delay for a stretch; a delivery Timeback refuses is
 * retried on a ladder that never ends, until Timeback takes it.
 */
export const reportsOf = (
	limits: ReportLimits
): Readonly<{ program: Program; write: (report: Report) => Admission }> => {
	const runs: Runs = {
		lease: limits.lease,
		holds: [],
		ladder: { _tag: "Never", first: limits.first, last: limits.last }
	}

	const Deliver: StepKind<Report, boolean, never> = {
		name: "ReportDelivery",
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
						writes: [{ relation: "report_delivered", key: report.id, value: claimed.at }]
					},
		edges: () => []
	}

	const ReportRoot: RootKind<Report, number, never> = {
		name: "TimebackReport",
		trigger: { _tag: "App" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "TimebackReport",
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
		program: { name: "reports", resources: [], roots: [rootedOf(ReportRoot)] },
		write: (report) => admissionOf(ReportRoot, report.id, report)
	}
}
