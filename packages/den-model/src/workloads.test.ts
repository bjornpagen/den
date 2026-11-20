import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Effect, Option } from "effect"
import { LAWS } from "#properties.ts"
import { faultsGen, natureOf, platformGen } from "#scenarios.ts"
import { declares, evidenceOf, holds } from "#search.ts"
import { simulate } from "#simulator.ts"
import { limitsGen, type Noticed, ownLaws, worldGen } from "#workloads.fixtures.ts"
import { edullmOf } from "#workloads/edullm.ts"

/**
 * edullm's eight workloads as den programs, side by side on one ledger, under den's laws: Timeback, AlphaTest, QTI,
 * Gold, the takedowns, the reports, enrollment and the seed keep every law and their own.
 *
 * Budget: its suite's count before the conversion (workloads: 500 independent cases and 300 steered, Vitest at den
 * aa4e12b).
 */
export const edullmsWorkloadsKeepEveryLawAndTheirOwn = property.explore(
	(source) => ({
		limits: source.draw(limitsGen),
		world: source.draw(worldGen),
		platform: source.draw(platformGen),
		faults: source.draw(faultsGen([]))
	}),
	{
		needs: {},
		situations: [
			"claimed",
			"reclaimed",
			"full",
			"behind",
			"stale",
			"held",
			"blocked",
			"timer",
			"read",
			"retired",
			"w1-moved",
			"w1-split",
			"w2-moved",
			"w2-kinds",
			"w3-moved",
			"w3-held",
			"w4-swapped",
			"w4-blocked",
			"w4-stopped",
			"w5-rearmed",
			"w5-hung-up",
			"w6-retried",
			"w6-delivered",
			"w7-reconciled",
			"w8-seeded"
		] satisfies ReadonlyArray<Reached<Noticed>>,
		check: (_, c: Case<Noticed>) => (scenario) =>
			Effect.gen(function* () {
				const { program, acts, horizon } = edullmOf(scenario.limits, scenario.world)
				if (!declares(program, scenario.platform.census)) {
					return
				}
				const run = simulate(
					{ program, acts, platform: scenario.platform, horizon },
					natureOf(c, scenario.faults)
				)
				c.noteAll(run.seen)
				yield* holds(LAWS, evidenceOf(run, program))
				const own = ownLaws(run.trace, scenario.limits, scenario.world, run.end, (noticed) =>
					c.note(noticed)
				)
				if (Option.isSome(own)) {
					return yield* own.value
				}
			}),
		oracle: {
			kind: "specification",
			name: "den's laws, and each workload's own: cursors move only over work that landed, no present child is hung up, every report is delivered"
		},
		budget: { runs: 500, steered: 300 },
		kept: [],
		kills: [
			{
				file: "packages/den-model/src/ledger.ts",
				original: "startChildren(tx, scoped, at)",
				replacement: "{}",
				why: "Operator mutant 93a89d49a1 at packages/den-model/src/ledger.ts:1200 in admitInto: `startChildren(tx, scoped, at)` becomes `{}`; the property fails (the census, lane TESTPOLICY2)."
			}
		]
	}
)
