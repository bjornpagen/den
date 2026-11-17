/**
 * Enrollment reconciliation: a student's intents (the automatic enrollment's, an admin's enrolling or unenrolling one)
 * decided in a drawn order, and reconciliation passes run between them, as W7's sweep runs them, against a Timeback
 * roster that drifts on its own (another org enrolls or retires the student, a teacher retires our membership, the
 * account is deactivated or reactivated) and may refuse a read or a write. An admin's decision outranks the automatic
 * one, a pass applies an intent only where the roster agrees with it, and its mark lands only on the version it read.
 *
 * Oracle (specification): edullm's plan: Timeback's word on membership, admin over automatic, an applied version
 * settled.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { IntentLedger, makeIntentLedger, makeRoster, TimebackRoster } from "#enrollment.ts"
import {
	passOf,
	type Scenario,
	scenarioGen,
	type Seen,
	STUDENT
} from "#test/enrollment.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * Enrollment reconciliation passes against a drifting roster apply an intent only where Timeback agrees, fenced by its
 * version.
 *
 * Budget: its suite's count before the conversion (enrollment: reconciliation: 400 independent cases and 200 steered,
 * Vitest at den dc5bd11).
 */
export const reconciliation = property.explore(scenarioGen, {
	needs: {},
	situations: [
		"enrolled",
		"unenrolled",
		"blocked",
		"stale-mark",
		"refused",
		"already-applied",
		"admin-outranks",
		"drifted"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (_, c: Case<Seen>) => (scenario: Scenario) =>
		Effect.gen(function* () {
			const ledger = yield* IntentLedger
			const roster = yield* TimebackRoster
			for (const step of scenario.steps) {
				if (step._tag === "Pass") {
					yield* passOf(step.midPass, c)
					continue
				}
				const standing = yield* ledger.current(STUDENT)
				const decided = yield* ledger.decide(STUDENT, step.kind)
				const outranked =
					step.kind === "automatic-enrolled" &&
					Option.exists(standing, (intent) => intent.kind !== "automatic-enrolled")
				if (outranked) {
					c.note("admin-outranks")
				}
				yield* law(
					"an admin's decision outranks the automatic one",
					outranked
						? Option.exists(standing, (intent) => intent.version === decided.version)
						: decided.kind === step.kind && !decided.applied,
					() => `deciding ${step.kind} left ${decided.kind}`
				)
			}
			const drifts = yield* roster.drifts
			if (Arr.some(drifts, (drift) => drift._tag !== "Still")) {
				c.note("drifted")
			}
		}).pipe(
			Effect.provideServiceEffect(TimebackRoster, makeRoster(scenario.world, c)),
			Effect.provideServiceEffect(IntentLedger, makeIntentLedger)
		),
	oracle: {
		kind: "specification",
		name: "edullm's plan: Timeback's word on membership, admin over automatic, an applied version settled"
	},
	budget: { runs: 400, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/enrollment.ts",
			original:
				'\t\t\t\t\t(standing) => kind === "automatic-enrolled" && standing.kind !== "automatic-enrolled"',
			replacement:
				'\t\t\t\t\t(standing) => kind === "automatic-enrolled" && standing.kind === "automatic-enrolled"',
			why: "Operator mutant (comparison) at packages/edullm/src/enrollment.ts:258 in <module>: `!==` becomes `===`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
