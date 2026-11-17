/**
 * Timeback's report endpoint: a queue redelivery, a stretch's message and the report's redrive race to deliver the same
 * reports under drawn interleavings, while the endpoint is out until a drawn instant, refuses a malformed report, and
 * may answer a server error, refuse the credential or lose the transport. Each report is recorded once, at its first
 * acceptance, and only once the outage is over.
 *
 * Oracle (specification): a Caliper endpoint idempotent by report id: first acceptance kept, an outage until its
 * instant, a malformed report refused.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { interleave } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { HashMap, Option } from "effect"
import { driverOf, judged, type Race, raceGen, type Seen } from "#test/reports.fixtures.ts"

/**
 * Timeback's report endpoint: racing deliveries of a report record it once, at its first acceptance, and only once the
 * outage is over.
 *
 * Budget: its suite's count before the conversion (reports: racing deliveries: 300 independent cases and 200 steered,
 * Vitest at den dc5bd11).
 */
export const deliveries = property.explore(raceGen, {
	needs: {},
	situations: [
		"accepted",
		"accepted-again",
		"outage",
		"malformed",
		"server-error",
		"forbidden",
		"transport"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (_, c: Case<Seen>) => (race: Race) => {
		const { driver, log } = driverOf(race, c)
		return interleave(
			driver,
			{
				sessions: {
					redelivery: { moves: race.moves.redelivery, after: Option.none() },
					stretch: { moves: race.moves.stretch, after: Option.none() },
					redrive: { moves: race.moves.redrive, after: Option.none() }
				},
				exclusive: [],
				state: Option.some("accepted")
			},
			{ kind: "drawn", nature: c },
			(run) =>
				judged(
					race,
					Option.getOrElse(run.state, () => HashMap.empty<string, number>()),
					log,
					c
				)
		)
	},
	oracle: {
		kind: "specification",
		name: "a Caliper endpoint idempotent by report id: first acceptance kept, an outage until its instant, a malformed report refused"
	},
	budget: { runs: 300, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/reports.ts",
			original:
				'\t\t\t\t\tif (weather === "server-error") {\n\t\t\t\t\t\treturn { _tag: "Answered", status: 500 } satisfies Sent\n\t\t\t\t\t}',
			replacement: "\t\t\t\t\t{}",
			why: 'Operator mutant (guard) at packages/edullm/src/reports.ts:57 in makeReports: `if (weather === "server-error") { return { _tag: "Answered", status: 500 } satis` becomes `{}`; the property fails (lane CATCH, den 9cffaba).'
		}
	]
})
