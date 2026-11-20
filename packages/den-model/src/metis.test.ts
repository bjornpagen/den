import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Effect, Option } from "effect"
import { type MetisNoticed, metisLaws, metisLimitsGen, metisWorldGen } from "#metis.fixtures.ts"
import { LAWS } from "#properties.ts"
import { faultsGen, natureOf, platformGen } from "#scenarios.ts"
import { evidenceOf, holds } from "#search.ts"
import { simulate } from "#simulator.ts"
import { metisOf } from "#workloads/metis.ts"

/**
 * AlphaTest's background work as den programs, side by side on one ledger, under den's laws: the Timeback writeback
 * per graded attempt, a chain of calls holding Timeback's seats that waits out Timeback's throttles; the gap analysis
 * as a map and a reduce, one model call per wrong answer on Anthropic's seats, the cluster as the questions scope's
 * finish and the save, the stamp and the dispatch after it, and the plan (DCAN) as a chain of orchestrator turns whose
 * fan-out scope of subagents is followed by the next turn; one time-spent delivery per segment; and the history load
 * as parallel chains over an outside source. Each keeps every law and its own.
 *
 * Budget: provisional, edullm's workloads' (500 independent cases and 300 steered), over worlds of up to three
 * gradings, three segments and one load.
 */
export const alphatestsWorkKeepsEveryLawAndItsOwn = property.explore(
	(source) => ({
		limits: source.draw(metisLimitsGen),
		world: source.draw(metisWorldGen),
		platform: source.draw(platformGen),
		faults: source.draw(faultsGen([]))
	}),
	{
		needs: {},
		situations: [
			"claimed",
			"reclaimed",
			"full",
			"waited",
			"finished",
			"writeback-throttled",
			"written-back",
			"gap-contended",
			"gap-saved",
			"plan-fanned",
			"plan-resumed",
			"planned",
			"time-spent-delivered",
			"history-chains",
			"history-loaded"
		] satisfies ReadonlyArray<Reached<MetisNoticed>>,
		check: (_, c: Case<MetisNoticed>) => (scenario) =>
			Effect.gen(function* () {
				const { program, acts, horizon } = metisOf(scenario.limits, scenario.world)
				const run = simulate(
					{ program, acts, platform: scenario.platform, horizon },
					natureOf(c, scenario.faults)
				)
				c.noteAll(run.seen)
				yield* holds(LAWS, evidenceOf(run, program))
				const own = metisLaws(run.trace, scenario.world, run.end, (noticed) => c.note(noticed))
				if (Option.isSome(own)) {
					return yield* own.value
				}
			}),
		oracle: {
			kind: "specification",
			name: "den's laws, and each workload's own: written back only once every call landed, a report from every analysis, a turn hearing every subagent, every segment delivered, every row loaded"
		},
		budget: { runs: 500, steered: 300 },
		kept: [],
		kills: [
			{
				file: "packages/den-model/src/program.ts",
				original:
					"\t\t\tsettledOf(kind.finish.body(input, children, claimed), kind.finish, (output) =>\n\t\t\t\tnextOf(then(), input, output)\n\t\t\t)",
				replacement:
					"\t\t\tsettledOf(kind.finish.body(input, children, claimed), kind.finish, () => [])",
				why: "A scope's finish spawns nothing of the edges that follow it: the gap analysis never saves its report after its cluster, and the plan's turn after the subagents never runs."
			}
		]
	}
)
