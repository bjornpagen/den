import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Effect } from "effect"
import { ledgerOf, SOUND } from "#ledger.ts"
import { LAWS } from "#properties.ts"
import { natureOf, type Scenario, scenarioGen } from "#scenarios.ts"
import { evidenceOf, exploration, holds } from "#search.ts"
import { type Seen, simulate, SOUND_POLICY } from "#simulator.ts"
import { syntheticOf } from "#workloads/synthetic.ts"

/** A generated program run under its scenario's faults, every law checked over what it leaves. */
const lawful = (scenario: Scenario, c: Case<Seen>) =>
	Effect.gen(function* () {
		const { program, admissions } = syntheticOf(scenario.shape)
		const run = simulate(
			{
				program,
				admissions,
				ledger: ledgerOf(SOUND),
				policy: SOUND_POLICY,
				platform: scenario.platform
			},
			natureOf(c, scenario.faults)
		)
		c.noteAll(run.seen)
		yield* holds(LAWS, evidenceOf(run, program.lanes))
	})

describe("den's laws over generated programs", () => {
	it.effect(
		"every pending step ends, one result each, scopes finish once after their children, widths hold, re-runs change nothing, stale drains, nothing is fire-and-forget",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "laws: generated programs",
						draw: drawn(scenarioGen((shape) => shape, [])),
						coverage: required<Seen>(
							[
								"claimed",
								"reclaimed",
								"retried",
								"exhausted",
								"failed",
								"stale",
								"late-accepted",
								"late-lost",
								"rerun-commit",
								"stopped",
								"at-width",
								"completed",
								"timer",
								"joined",
								"finished",
								"retired",
								"handover",
								"redelivered",
								"deduplicated"
							],
							{ cases: 400, sense: notesOnly }
						),
						runs: 2000,
						shrink: 400,
						oracle: {
							kind: "specification",
							name: "den's laws (properties.ts), checked over the trace a simulated run commits"
						}
					}),
					lawful
				)
			)
	)
})
