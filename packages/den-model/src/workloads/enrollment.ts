import { Array as Arr, Equal, Option } from "effect"
import type { Datum } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type Ladder,
	type Program,
	type RootKind,
	rootedOf,
	type Row,
	type Runs,
	type StepKind,
	stepOf,
	type Write
} from "#program.ts"

/** W7's limits, each the test's input: how a reconciliation pass runs. */
export type EnrollmentLimits = Readonly<{ lease: number; ladder: Ladder }>

/** The plan a pass makes from what it read: every intent the roster does not yet hold, as the write that makes it so. */
const planOf = (intents: ReadonlyArray<Row>, roster: ReadonlyArray<Row>): ReadonlyArray<Write> =>
	Arr.flatMap(intents, (intent) =>
		Arr.some(roster, (row) => row.key === intent.key && Equal.equals(row.value, intent.value))
			? []
			: [{ relation: "enrollment", key: intent.key, value: intent.value }]
	)

/**
 * W7, enrollment's reconciliation, as a den program: an hourly root, exclusive so one pass runs at a time, whose one
 * step reads the intent ledger and the roster as its declared reads and writes the pure plan between them.
 */
export const enrollmentOf = (
	limits: EnrollmentLimits
): Readonly<{ program: Program; hourly: (hour: number) => Admission }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Reconcile: StepKind<number, number, never> = {
		name: "Reconcile",
		runs,
		input: (hour): Datum => hour,
		output: (changed) => changed,
		error: () => 0,
		reads: () => [
			{
				name: "intents",
				query: { _tag: "Rows", relation: "enrollment_intent", key: Option.none() }
			},
			{ name: "roster", query: { _tag: "Rows", relation: "enrollment", key: Option.none() } }
		],
		body: (_hour, claimed) => {
			const plan = planOf(claimed.read("intents"), claimed.read("roster"))
			return { _tag: "Output", output: plan.length, writes: plan }
		},
		edges: () => []
	}

	const Hourly: RootKind<number, number, never> = {
		name: "EnrollmentSweep",
		trigger: { _tag: "Schedule", every: 1 },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.some(() => "enrollment"),
		scope: {
			name: "EnrollmentSweep",
			input: (hour): Datum => hour,
			start: (hour) => [stepOf(Reconcile, hour)],
			finish: {
				runs,
				output: (changed) => changed,
				error: () => 0,
				body: (_hour, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}

	return {
		program: { name: "enrollment", resources: [], roots: [rootedOf(Hourly)] },
		hourly: (hour) => admissionOf(Hourly, `${hour}`, hour)
	}
}
