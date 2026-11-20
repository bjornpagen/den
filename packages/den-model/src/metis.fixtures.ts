/** What the property of metis.test.ts reads: AlphaTest's limits and world, and each workload's own law. */

import { type Gen, int, production } from "@bjornpagen/testing/gen"
import { Array as Arr, Option } from "effect"
import { type Datum, textOf } from "#datum.ts"
import type { Fact, Trace } from "#facts.ts"
import { rootOfStep, rootText } from "#identity.ts"
import { ordinals } from "#program.ts"
import type { FairEnd, Seen } from "#simulator.ts"
import {
	deliveredAll,
	firstOf,
	ladderGen,
	leaseGen,
	someOf,
	writesByRoot
} from "#workloads.fixtures.ts"
import type { MetisLimits, MetisWorld } from "#workloads/metis.ts"
import { TIME_SPENT } from "#workloads/reports.ts"

/** What a run of AlphaTest's work notices beyond the simulator's situations. */
export type MetisNoticed =
	| Seen
	| "writeback-throttled"
	| "written-back"
	| "gap-contended"
	| "gap-saved"
	| "plan-fanned"
	| "plan-resumed"
	| "planned"
	| "time-spent-delivered"
	| "history-chains"
	| "history-loaded"

/** A few seats, one often, so a fan-out on a resource is contended as often as not. */
const seatsGen: Gen<number> = production(3, [1, 2])

export const metisLimitsGen: Gen<MetisLimits> = (source) => ({
	anthropic: source.draw(seatsGen),
	timeback: source.draw(seatsGen),
	writeback: {
		lease: source.draw(leaseGen),
		ladder: source.draw(ladderGen),
		batch: source.draw(production(20, [1, 2, 3])),
		retryAfter: source.draw(int(1, 2))
	},
	gap: {
		lease: source.draw(leaseGen),
		ladder: source.draw(ladderGen),
		retryAfter: source.draw(int(1, 2))
	},
	timeSpent: {
		delay: 0,
		lease: source.draw(leaseGen),
		first: 1,
		last: source.draw(production(5, [1, 2]))
	},
	history: { lease: source.draw(leaseGen), ladder: source.draw(ladderGen) }
})

export const metisWorldGen: Gen<MetisWorld> = (source) => ({
	gradings: source.draw(
		someOf(3, (index) => (inner) => {
			const attempt = `attempt${index}`
			const throttles = inner.draw(int(0, 3))
			const turns = inner.draw(int(1, 4))
			return {
				at: inner.draw(int(0, 20)),
				what: {
					graded: { attempt, questions: inner.draw(int(0, 8)), throttles },
					analysis: {
						gap: `gap${index}`,
						wrong: inner.draw(int(0, 6)),
						throttles,
						groups: inner.draw(int(0, 3)),
						turns,
						fanAt: inner.draw(int(0, turns))
					}
				}
			}
		})
	),
	segments: source.draw(
		someOf(3, (index) => (inner) => ({
			id: `segment${index}`,
			written: inner.draw(int(0, 20)),
			stretch: false,
			heals: inner.draw(int(0, 30))
		}))
	),
	loads: source.draw(
		someOf(1, (index) => (inner) => ({
			at: inner.draw(int(0, 10)),
			what: {
				key: `load${index}`,
				rows: inner.draw(int(0, 12)),
				chains: inner.draw(int(1, 3)),
				chunk: inner.draw(int(1, 4))
			}
		}))
	)
})

/** Whether a fact is a step of the root `kind` under `key` failing, and how. */
const failedUnder = (fact: Fact, kind: string, key: string): boolean =>
	fact._tag === "Failed" && rootText(rootOfStep(fact.step)) === rootText({ kind, key })

/**
 * Each of AlphaTest's workloads' own law over one run. The writeback marks an attempt written back only once its line
 * item, parent result, Caliper event and every question's result landed, its throttles waited out. The gap analysis saves a report only from a cluster that
 * read every question's analysis that landed, and the orchestrator's turn after the subagents hears every subagent that
 * reported. Every time segment is delivered and none fails. A history load counts exactly the source's rows once every
 * chain ran. What must happen is checked only when the run ended quiescent and the root's steps did not fail.
 */
export const metisLaws = (
	trace: Trace,
	world: MetisWorld,
	end: FairEnd,
	note: (noticed: MetisNoticed) => void
) => {
	const writes = writesByRoot(trace)
	const of = (kind: string, key: string): ReadonlyMap<string, Datum> =>
		Option.getOrElse(
			Option.fromNullishOr(writes.get(rootText({ kind, key }))),
			() => new Map<string, Datum>()
		)
	const quiet = end._tag === "Quiescent"
	const facts = Arr.flatMap(trace, (entry) => entry.facts)
	const failed = (kind: string, key: string) =>
		Arr.some(facts, (fact) => failedUnder(fact, kind, key))

	const writeback = Arr.flatMap(world.gradings, ({ what: { graded } }) => {
		const landed = of("Writeback", graded.attempt)
		if (
			Arr.some(
				facts,
				(fact) =>
					fact._tag === "Retried" &&
					fact.counts === "wait" &&
					rootOfStep(fact.step).kind === "Writeback"
			)
		) {
			note("writeback-throttled")
		}
		const every =
			landed.has(`timeback_line_item/${graded.attempt}`) &&
			landed.has(`timeback_parent/${graded.attempt}`) &&
			landed.has(`caliper_xp/${graded.attempt}`) &&
			Arr.every(ordinals(graded.questions), (question) =>
				landed.has(`timeback_result/${graded.attempt}:${question}`)
			)
		if (landed.has(`written_back/${graded.attempt}`)) {
			note("written-back")
			return every ? [] : [`writeback: ${graded.attempt} marked written back with a call missing`]
		}
		return quiet && !failed("Writeback", graded.attempt)
			? [`writeback: ${graded.attempt} ended unwritten with no call failed`]
			: []
	})

	const gap = Arr.flatMap(world.gradings, ({ what: { analysis } }) => {
		const landed = of("GapAnalysis", analysis.gap)
		if (analysis.wrong > 1) {
			note("gap-contended")
		}
		const analysed = Arr.filter(ordinals(analysis.wrong), (question) =>
			landed.has(`gap_question/${analysis.gap}:${question}`)
		).length
		const reported = landed.get(`gap_report/${analysis.gap}`)
		if (reported !== undefined) {
			note("gap-saved")
		}
		const saved =
			reported === undefined || reported === analysed
				? []
				: [`gap: ${analysis.gap}'s report clustered ${textOf(reported)} of ${analysed} analyses`]
		const fanned = analysis.fanAt < analysis.turns
		const subagents = Arr.filter(ordinals(analysis.groups), (group) =>
			landed.has(`dcan_subagent/${analysis.gap}:${group}`)
		).length
		if (fanned && subagents > 0) {
			note("plan-fanned")
		}
		const heard = landed.get(`dcan_message/${analysis.gap}:${analysis.fanAt + 1}`)
		if (fanned && heard !== undefined) {
			note("plan-resumed")
		}
		const resumed =
			!fanned || heard === undefined || heard === subagents
				? []
				: [
						`plan: ${analysis.gap}'s turn ${analysis.fanAt + 1} heard ${textOf(heard)} of ${subagents} subagents`
					]
		const planned = landed.get(`plan/${analysis.gap}`)
		if (planned !== undefined) {
			note("planned")
		}
		const whole =
			quiet &&
			!failed("GapAnalysis", analysis.gap) &&
			!(
				landed.has(`gap_done/${analysis.gap}`) &&
				reported === analysis.wrong &&
				landed.has(`timeback_stamp/${analysis.gap}`) &&
				landed.has(`dispatched/${analysis.gap}`) &&
				planned === analysis.turns &&
				(!fanned || subagents === analysis.groups)
			)
				? [`gap: ${analysis.gap} ended with a stage missing and no step failed`]
				: []
		return [...saved, ...resumed, ...whole]
	})

	const history = Arr.flatMap(world.loads, ({ what: load }) => {
		const landed = of("HistoryLoad", load.key)
		if (load.chains > 1 && load.rows > load.chunk) {
			note("history-chains")
		}
		const loaded = landed.get(`history_loaded/${load.key}`)
		const every = Arr.every(ordinals(load.rows), (row) => landed.has(`history/${load.key}:${row}`))
		if (loaded !== undefined) {
			note("history-loaded")
		}
		return loaded === undefined
			? quiet && !failed("HistoryLoad", load.key)
				? [`history: ${load.key} ended unloaded with no chunk failed`]
				: []
			: (loaded === load.rows && every) || failed("HistoryLoad", load.key)
				? []
				: [`history: ${load.key} counted ${textOf(loaded)} of ${load.rows} rows`]
	})

	return firstOf([
		...writeback,
		...gap,
		...deliveredAll(TIME_SPENT, trace, world.segments, quiet, () => note("time-spent-delivered")),
		...history
	])
}
