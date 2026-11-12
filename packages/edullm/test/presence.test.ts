import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { type Gen, int, production } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Effect, HashMap, Option } from "effect"
import {
	awayAtOf,
	makePresence,
	type Rules,
	type Timeline,
	timelineGen,
	TutorPresence
} from "#presence.ts"
import { exploration, law } from "#test/support/search.ts"

const ATTEMPT = "attempt"

type Scenario = Readonly<{ rules: Rules; timeline: Timeline }>

type Seen = "away-by-idle" | "away-by-silence" | "re-armed" | "never-shown" | "unadmitted"

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

const scenarioGen: Gen<Scenario> = (source) => {
	const rules = source.draw(rulesGen)
	return { rules, timeline: source.draw(timelineGen(rules, source.draw(int(0, 999)))) }
}

/** A queue's delay, as Vercel Queues take one: whole seconds, rounded up. */
const delayOf = (millis: number) => Math.ceil(millis / 1000) * 1000

describe("tutor presence", () => {
	it.effect(
		"the takedown timer, re-armed for exactly the remainder, takes an attempt down within a second of its going away and never while present",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "presence: the takedown timer",
						draw: drawn(scenarioGen),
						coverage: required<Seen>(
							["away-by-idle", "away-by-silence", "re-armed", "never-shown", "unadmitted"],
							{
								cases: 200,
								sense: notesOnly
							}
						),
						runs: 400,
						shrink: 200,
						oracle: {
							kind: "specification",
							name: "away is the first gap of idleMillis without a beacon or silenceMillis without the child, derived and permanent"
						}
					}),
					({ rules, timeline }: Scenario, c: Case<Seen>) =>
						Effect.gen(function* () {
							const presence = makePresence(rules, HashMap.make([ATTEMPT, timeline]))
							const unadmitted = yield* presence.standing("another attempt", timeline.enteredAt)
							if (Option.isNone(unadmitted)) {
								c.note("unadmitted")
							}
							if (timeline.beacons.length === 0) {
								c.note("never-shown")
							}
							const awayAt = awayAtOf(rules, timeline)
							const idleAt = awayAtOf(
								{ ...rules, silenceMillis: Number.POSITIVE_INFINITY },
								timeline
							)
							c.note(idleAt === awayAt ? "away-by-idle" : "away-by-silence")
							let at = timeline.enteredAt + delayOf(rules.idleMillis)
							for (;;) {
								const standing = yield* presence.standing(ATTEMPT, at)
								if (Option.isNone(standing)) {
									return yield* law(
										"an admitted attempt has a standing",
										false,
										() => "the attempt had none"
									)
								}
								if (standing.value._tag === "Away") {
									yield* law(
										"taken down only once away",
										at >= awayAt,
										() => `taken down at ${String(at)}, away at ${String(awayAt)}`
									)
									yield* law(
										"taken down within a second",
										at - awayAt < 1000,
										() => `taken down ${String(at - awayAt)} ms after it went away`
									)
									return
								}
								yield* law(
									"present only before it is away",
									at < awayAt,
									() => `present at ${String(at)}, away since ${String(awayAt)}`
								)
								c.note("re-armed")
								at += delayOf(standing.value.remainingMillis)
							}
						}).pipe(
							Effect.provideService(
								TutorPresence,
								makePresence(rules, HashMap.make([ATTEMPT, timeline]))
							)
						)
				)
			)
	)
})
