import { array, type Gen, int, weighted } from "@den/testing/gen"
import { Array as Arr, Context, Effect, HashMap, Layer, Option } from "effect"

/**
 * The tutor's presence as edullm's W5 reads it. The browser sends a beacon once a period while the lesson's tab is on
 * screen; a hidden tab sends none, by design. An attempt is away once it has gone `idleMillis` without a beacon or
 * `silenceMillis` without the child heard, counting its entry as both; away is derived from what the ledger holds at
 * the instant asked, never stored, and an away attempt stays away. The takedown consumer reads one attempt's standing at
 * the instant its message arrives.
 */

/**
 * The owner's presence rules: a beacon each `beaconMillis` while on screen; away after `idleMillis` without one, or
 * `silenceMillis` without the child heard, which is never the shorter (edullm's takedown message waits one idle window
 * from entry because "the silence window is longer"). Each is an owner decision of edullm's (its `AGENTS.md`, "Presence is the
 * beacon": once a second, 3 minutes, 15 minutes; `ATTEMPT_IDLE_MILLISECONDS` in `beacon-period.ts`), the simulation's
 * input here.
 */
export type Rules = Readonly<{ beaconMillis: number; idleMillis: number; silenceMillis: number }>

/** What one attempt's browser and microphone recorded: its entry, its beacons and when the child was heard, in order. */
export type Timeline = Readonly<{
	enteredAt: number
	beacons: ReadonlyArray<number>
	heard: ReadonlyArray<number>
}>

/** An attempt's standing at an instant: present, with how long until it would be away, or away since an instant. */
export type Standing =
	| Readonly<{ _tag: "Present"; remainingMillis: number }>
	| Readonly<{ _tag: "Away"; since: number }>

/** The first instant a run of signals, entry first, leaves a gap of `limit` or longer: when it went quiet for good. */
const quietAt = (enteredAt: number, signals: ReadonlyArray<number>, limit: number): number => {
	let last = enteredAt
	for (const signal of signals) {
		if (signal - last >= limit) {
			return last + limit
		}
		last = Math.max(last, signal)
	}
	return last + limit
}

/** The instant an attempt became, or will become, away if nothing more arrives. */
export const awayAtOf = (rules: Rules, timeline: Timeline): number =>
	Math.min(
		quietAt(timeline.enteredAt, timeline.beacons, rules.idleMillis),
		quietAt(timeline.enteredAt, timeline.heard, rules.silenceMillis)
	)

/** An attempt's standing at `at`, from only what arrived by then. */
export const standingOf = (rules: Rules, timeline: Timeline, at: number): Standing => {
	const known: Timeline = {
		enteredAt: timeline.enteredAt,
		beacons: Arr.filter(timeline.beacons, (beacon) => beacon <= at),
		heard: Arr.filter(timeline.heard, (heard) => heard <= at)
	}
	const awayAt = awayAtOf(rules, known)
	return at < awayAt
		? { _tag: "Present", remainingMillis: awayAt - at }
		: { _tag: "Away", since: awayAt }
}

/** One stretch of a lesson: the tab on screen for some beacons, the child heard on some of them, or the tab hidden. */
type Stretch =
	| Readonly<{ _tag: "Shown"; beacons: number; heardEvery: number }>
	| Readonly<{ _tag: "Hidden"; periods: number }>

/**
 * A lesson's timeline as a child's browser makes one: stretches on screen and hidden, the child heard now and then
 * while on screen, from the entry on, in beacon periods.
 */
export const timelineGen =
	(rules: Rules, enteredAt: number): Gen<Timeline> =>
	(source) => {
		const stretches = source.draw(
			array(
				weighted<Stretch>([
					[
						3,
						(s) => ({
							_tag: "Shown",
							beacons: s.draw(int(1, 400)),
							heardEvery: s.draw(int(1, 1200))
						})
					],
					[1, (s) => ({ _tag: "Hidden", periods: s.draw(int(1, 400)) })]
				]),
				{ min: 0, max: 6 }
			)
		)
		const beacons: Array<number> = []
		const heard: Array<number> = []
		let at = enteredAt
		for (const stretch of stretches) {
			if (stretch._tag === "Hidden") {
				at += stretch.periods * rules.beaconMillis
				continue
			}
			for (let beacon = 1; beacon <= stretch.beacons; beacon += 1) {
				at += rules.beaconMillis
				beacons.push(at)
				if (beacon % stretch.heardEvery === 0) {
					heard.push(at)
				}
			}
		}
		return { enteredAt, beacons, heard }
	}

/** The fake: every attempt's timeline, and the standing the takedown consumer's one statement reads. */
export class TutorPresence extends Context.Service<
	TutorPresence,
	{ readonly standing: (attemptId: string, at: number) => Effect.Effect<Option.Option<Standing>> }
>()("@den/edullm/presence/TutorPresence") {}

/** The fake over attempts' timelines: an attempt it does not hold is no standing at all, as an unadmitted message is. */
export const makePresence = (
	rules: Rules,
	attempts: HashMap.HashMap<string, Timeline>
): TutorPresence["Service"] =>
	TutorPresence.of({
		standing: (attemptId, at) =>
			Effect.succeed(
				Option.map(HashMap.get(attempts, attemptId), (timeline) => standingOf(rules, timeline, at))
			)
	})

/** The fake as a layer. */
export const presenceLayer = (
	rules: Rules,
	attempts: HashMap.HashMap<string, Timeline>
): Layer.Layer<TutorPresence> => Layer.succeed(TutorPresence, makePresence(rules, attempts))
