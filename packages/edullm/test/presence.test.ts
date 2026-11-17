/**
 * Tutor presence: an attempt's drawn timeline of beacons and the child's activity, under edullm's rules in force or
 * small ones that put both thresholds within a case, read by the takedown timer as Vercel Queues run it, each delay
 * whole seconds rounded up and re-armed for exactly the remainder. The timer takes the attempt down within a second of
 * its going away, and never while it is present.
 *
 * Oracle (specification): away is the first gap of idleMillis without a beacon or silenceMillis without the child,
 * derived and permanent.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Effect, HashMap, Option } from "effect"
import { awayAtOf, makePresence, TutorPresence } from "#presence.ts"
import { ATTEMPT, delayOf, type Scenario, scenarioGen, type Seen } from "#test/presence.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * Tutor presence: the takedown timer, re-armed for exactly the remainder, takes an attempt down within a second of its
 * going away and never while present.
 *
 * Budget: its suite's count before the conversion (presence: the takedown timer: 400 independent cases and 200 steered,
 * Vitest at den dc5bd11).
 */
export const takedown = property.explore(scenarioGen, {
	needs: {},
	situations: [
		"away-by-idle",
		"away-by-silence",
		"re-armed",
		"never-shown",
		"unadmitted"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check:
		(_, c: Case<Seen>) =>
		({ rules, timeline }: Scenario) =>
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
				const idleAt = awayAtOf({ ...rules, silenceMillis: Number.POSITIVE_INFINITY }, timeline)
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
				Effect.provideService(TutorPresence, makePresence(rules, HashMap.make([ATTEMPT, timeline])))
			),
	oracle: {
		kind: "specification",
		name: "away is the first gap of idleMillis without a beacon or silenceMillis without the child, derived and permanent"
	},
	budget: { runs: 400, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/presence.ts",
			original: "\t\tbeacons: Arr.filter(timeline.beacons, (beacon) => beacon <= at),",
			replacement: "\t\tbeacons: Arr.filter(timeline.beacons, (beacon) => beacon > at),",
			why: "Operator mutant (comparison) at packages/edullm/src/presence.ts:56 in standingOf: `<=` becomes `>`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/presence.ts",
			original: "\t\tbeacons: Arr.filter(timeline.beacons, (beacon) => beacon <= at),",
			replacement: "\t\tbeacons: Arr.filter(timeline.beacons, (beacon) => false),",
			why: "Operator mutant (boolean-return) at packages/edullm/src/presence.ts:56 in standingOf: `beacon <= at` becomes `false`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/presence.ts",
			original: "\t\tif (signal - last >= limit) {",
			replacement: "\t\tif (signal - last < limit) {",
			why: "Operator mutant (comparison) at packages/edullm/src/presence.ts:37 in quietAt: `>=` becomes `<`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/presence.ts",
			original: "\t\tlast = Math.max(last, signal)",
			replacement: "\t\t{}",
			why: "Operator mutant (statement) at packages/edullm/src/presence.ts:40 in quietAt: `last = Math.max(last, signal)` becomes `{}`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
