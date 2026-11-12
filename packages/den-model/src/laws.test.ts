import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Effect } from "effect"
import { ledgerOf, SOUND } from "#ledger.ts"
import { LAWS } from "#properties.ts"
import { natureOf, type Scenario, scenarioGen } from "#scenarios.ts"
import { declares, evidenceOf, exploration, holds } from "#search.ts"
import { type Seen, simulate, SOUND_POLICY } from "#simulator.ts"
import { syntheticOf } from "#workloads/synthetic.ts"

/** What a generated case notices beyond the run's own situations: a program its declaration refused. */
type Noticed = Seen | "refused-declaration"

/** A generated program run under its scenario's faults, every law checked over what it leaves. */
const lawful = (scenario: Scenario, c: Case<Noticed>) =>
	Effect.gen(function* () {
		const { program, acts, horizon } = syntheticOf(scenario.shape)
		if (!declares(SOUND, program, scenario.platform.census)) {
			c.note("refused-declaration")
			return
		}
		const run = simulate(
			{
				program,
				acts,
				ledger: ledgerOf(SOUND),
				policy: SOUND_POLICY,
				platform: scenario.platform,
				horizon
			},
			natureOf(c, scenario.faults)
		)
		c.noteAll(run.seen)
		yield* holds(LAWS, evidenceOf(run, program))
	})

describe("den's laws over generated programs", () => {
	it.effect(
		"pending steps move, one result each, scopes finish once after their children, seats are exact, exclusive runs never overlap, preconditions hold, re-runs change nothing, stale drains, nothing is fire-and-forget, windows hold census ticks",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "laws: generated programs",
						draw: drawn(scenarioGen((shape) => shape, [])),
						coverage: required<Noticed>(
							[
								"claimed",
								"reclaimed",
								"retried",
								"waited",
								"exhausted",
								"failed",
								"stale",
								"late-accepted",
								"late-lost",
								"rerun-commit",
								"full",
								"behind",
								"early",
								"closed",
								"paused",
								"read",
								"finished",
								"held",
								"blocked",
								"retired",
								"readmitted-retired",
								"continued",
								"rang",
								"relayed",
								"timer",
								"handover",
								"replayed",
								"redelivered",
								"deduplicated",
								"refused-declaration"
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
