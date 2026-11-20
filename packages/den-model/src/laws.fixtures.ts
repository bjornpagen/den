/** What the properties of laws.test.ts read: its spaces, models and helpers. */

import type { Case } from "@bjornpagen/testing/property"
import { Effect } from "effect"
import { LAWS } from "#properties.ts"
import { natureOf, type Scenario } from "#scenarios.ts"
import { declares, evidenceOf, holds } from "#search.ts"
import { type Seen, simulate } from "#simulator.ts"
import { syntheticOf } from "#workloads/synthetic.ts"

/** What a generated case notices beyond the run's own situations: a program its declaration refused. */
export type Noticed = Seen | "refused-declaration"

/** A generated program run under its scenario's faults, every law checked over what it leaves. */
export const lawful = (scenario: Scenario, c: Case<Noticed>) =>
	Effect.gen(function* () {
		const { program, acts, horizon } = syntheticOf(scenario.shape)
		if (!declares(program, scenario.platform.census)) {
			c.note("refused-declaration")
			return
		}
		const run = simulate(
			{ program, acts, platform: scenario.platform, horizon },
			natureOf(c, scenario.faults)
		)
		c.noteAll(run.seen)
		yield* holds(LAWS, evidenceOf(run, program))
	})
