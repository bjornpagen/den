import { Array as Arr, Option } from "effect"
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
	spawnAt,
	stepAt
} from "#program.ts"

/**
 * W5's limits, each the test's input: how long an attempt may go without a beacon before it is away (edullm's
 * `ATTEMPT_IDLE_MILLISECONDS`, 180 s), and how the takedown runs.
 */
export type TakedownLimits = Readonly<{ idle: number; lease: number; ladder: Ladder }>

/** One lesson attempt: its id and the instant the child entered it. */
export type Attempt = Readonly<{ id: string; entered: number }>

/** One takedown timer: its attempt, due at the instant the attempt would be away were no beacon to come. */
type Timer = Readonly<{ attempt: Attempt }>

/** What a timer found: the attempt present, re-armed for the instant its last beacon makes away, or away. */
type Found = Readonly<{ _tag: "Present"; rearm: number }> | Readonly<{ _tag: "Away" }>

/** The instant of an attempt's last beacon, as its declared read returns it, or its entry when it has none. */
const lastBeacon = (attempt: Attempt, rows: ReadonlyArray<Row>): number =>
	Arr.reduce(rows, attempt.entered, (latest, row) =>
		typeof row.value === "number" ? Math.max(latest, row.value) : latest
	)

/**
 * W5, the tutor's takedown, as a den program: the app's own write of an attempt's entry admits its root in the same
 * transaction, whose one timer is due `idle` after the entry; the timer reads the attempt's presence (its last beacon,
 * which the browser writes once a tick while the lesson is on screen) and re-arms itself for the instant that beacon
 * makes the attempt away, or, once it is away, hangs up.
 */
export const takedownOf = (
	limits: TakedownLimits
): Readonly<{ program: Program; enter: (attempt: Attempt) => Admission }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Takedown: StepKind<Timer, Found, never> = {
		name: "Takedown",
		runs,
		input: (timer) => ({ attempt: timer.attempt.id }),
		output: (found) => (found._tag === "Present" ? { rearm: found.rearm } : { away: true }),
		error: () => 0,
		reads: (timer) => [
			{
				name: "presence",
				query: { _tag: "Rows", relation: "beacon", key: Option.some(timer.attempt.id) }
			}
		],
		body: (timer, claimed) => {
			const away = lastBeacon(timer.attempt, claimed.read("presence")) + limits.idle
			return away > claimed.at
				? { _tag: "Output", output: { _tag: "Present", rearm: away }, writes: [] }
				: {
						_tag: "Output",
						output: { _tag: "Away" },
						writes: [{ relation: "hangup", key: timer.attempt.id, value: claimed.at }]
					}
		},
		edges: () => [
			spawnAt("rearm", Takedown, (timer: Timer, found: Found) =>
				found._tag === "Present" ? [{ input: timer, at: found.rearm }] : []
			)
		]
	}

	const AttemptRoot: RootKind<Attempt, number, never> = {
		name: "TutorAttempt",
		trigger: { _tag: "App" },
		from: { _tag: "Given", heading: "TutorAttemptInput" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "TutorAttempt",
			input: (attempt) => ({ attempt: attempt.id, entered: attempt.entered }),
			start: (attempt) => [stepAt(Takedown, { attempt }, attempt.entered + limits.idle)],
			finish: {
				runs,
				output: (timers) => timers,
				error: () => 0,
				body: (_attempt, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}

	return {
		program: { name: "takedown", resources: [], roots: [rootedOf(AttemptRoot)] },
		enter: (attempt) => admissionOf(AttemptRoot, attempt.id, attempt)
	}
}
