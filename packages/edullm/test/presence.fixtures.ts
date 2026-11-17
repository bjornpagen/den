/** What the properties of presence.test.ts read: its spaces, models and helpers. */

import { type Gen, int, production } from "@bjornpagen/testing/gen"
import { type Rules, type Timeline, timelineGen } from "#presence.ts"

export const ATTEMPT = "attempt"

export type Scenario = Readonly<{ rules: Rules; timeline: Timeline }>

export type Seen = "away-by-idle" | "away-by-silence" | "re-armed" | "never-shown" | "unadmitted"

/**
 * edullm's rules in force, a second, three minutes and fifteen; small ones a sixth of the time, so both thresholds bind.
 * The silence window is never the shorter: the first takedown waits one idle window from entry because of it.
 */
const rulesGen: Gen<Rules> = (source) =>
	source.draw(
		production({ beaconMillis: 1000, idleMillis: 180_000, silenceMillis: 900_000 }, [
			{ beaconMillis: 1000, idleMillis: 5000, silenceMillis: 20_000 },
			{ beaconMillis: 1000, idleMillis: 5000, silenceMillis: 5000 }
		])
	)

export const scenarioGen: Gen<Scenario> = (source) => {
	const rules = source.draw(rulesGen)
	return { rules, timeline: source.draw(timelineGen(rules, source.draw(int(0, 999)))) }
}

/** A queue's delay, as Vercel Queues take one: whole seconds, rounded up. */
export const delayOf = (millis: number) => Math.ceil(millis / 1000) * 1000
