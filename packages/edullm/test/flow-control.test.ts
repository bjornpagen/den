/**
 * The AlphaTest flow controller: one batch of one kind through the AlphaTest fake, its knee and service time drawn,
 * started from a drawn window, with or without a gateway throttle and weather that can congest it. Its window moves
 * only by kept probes (an up probe kept only past its reference's spread, a down probe unless it costs more than that)
 * and by halvings once per congestion event, never below one request, and on a kind that never congests it never
 * ratchets past the knee.
 *
 * Oracle (specification): BBR's probe rule and TCP's once-per-event halving (RFC 5681 §3.1, RFC 6582 §3.2), against a
 * bottleneck flat above its knee.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { AlphaTestApi, makeAlphaTest } from "#alphatest.ts"
import { bbr } from "#flow-control.ts"
import {
	itemsOf,
	legal,
	noteOf,
	type Scenario,
	scenarioGen,
	type Seen,
	worldOf
} from "#test/flow-control.fixtures.ts"
import { batchOf } from "#test/support/batch.ts"
import { law } from "#test/support/law.ts"

/**
 * The AlphaTest flow controller moves its window only by kept probes and once-per-event halvings, and never ratchets
 * past the knee.
 *
 * Budget: its suite's count before the conversion (flow-control: windows: 300 independent cases and 200 steered, Vitest
 * at den dc5bd11).
 */
export const controller = property.explore(scenarioGen, {
	needs: {},
	situations: [
		"up-kept",
		"down-kept",
		"probe-dropped",
		"halved",
		"recovery-held",
		"above-knee",
		"below-knee",
		"congested"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (_, c: Case<Seen>) => (scenario: Scenario) =>
		Effect.gen(function* () {
			const flow = {
				window: scenario.start,
				maxRate: 0,
				minLatency: (scenario.knee.window / scenario.knee.rate) * 1000
			}
			const batch = yield* batchOf(itemsOf(scenario), flow, 0, c).pipe(
				Effect.provideServiceEffect(AlphaTestApi, makeAlphaTest(worldOf(scenario), c))
			)
			for (const transition of batch.transitions) {
				noteOf(transition, scenario.knee, c)
				yield* law(
					"window at least one",
					transition.after.window >= 1,
					() => `the window fell to ${String(transition.after.window)}`
				)
				yield* law(
					"legal moves",
					legal(transition),
					() =>
						`a ${transition.event} moved the window from ${String(transition.before.window)} to ${String(transition.after.window)}`
				)
			}
			yield* law(
				"every request answered",
				batch.finals + batch.unfinished === scenario.requests,
				() =>
					`${String(scenario.requests - batch.finals - batch.unfinished)} requests never started`
			)
			if (Option.isNone(scenario.congestion)) {
				const ceiling = Math.max(scenario.start, bbr.probeWindowOf(scenario.knee.window, "up"))
				yield* law(
					"no ratchet above the knee",
					Arr.every(batch.transitions, (transition) => transition.after.window <= ceiling),
					() =>
						`the window passed ${String(ceiling)} on a kind whose knee is ${String(scenario.knee.window)}`
				)
			}
		}),
	oracle: {
		kind: "specification",
		name: "BBR's probe rule and TCP's once-per-event halving, against a bottleneck flat above its knee"
	},
	budget: { runs: 300, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/flow-control.ts",
			original:
				"const halvedBy = (sent: Sent, recoverFrom: number): boolean => sent.seq >= recoverFrom\n",
			replacement: "const halvedBy = (sent: Sent, recoverFrom: number): boolean => true\n",
			why: "A halving on every congestion signal of one event, with no recovery point, halves the window again for a request sent before the last halving; the controller property fails on a congested batch."
		},
		{
			file: "packages/edullm/src/flow-control.ts",
			original: "keptBySpread(phase.direction, probed, phase.reference)",
			replacement:
				'(phase.direction === "up" ? probed.perSecond >= phase.reference.perSecond : keptBySpread(phase.direction, probed, phase.reference))',
			why: "An up probe kept on a tie keeps a larger window that measures no faster, so the window ratchets past the knee; the controller property fails on a batch that never congests."
		},
		{
			file: "packages/edullm/src/flow-control.ts",
			original:
				"const halvedOf = (window: number): number => Math.max(1, Math.floor(window * CONSTANTS.decrease))\n",
			replacement:
				"const halvedOf = (window: number): number => Math.floor(window * CONSTANTS.decrease)\n",
			why: "A halving with no floor of one request halves a window of one to none; the controller property fails on a congested batch at a window of one."
		},
		{
			file: "packages/edullm/src/flow-control.ts",
			original: "\t\t\tif (measured.intervals.length < phase.count) {",
			replacement: "\t\t\tif (measured.intervals.length >= phase.count) {",
			why: "Operator mutant (comparison) at packages/edullm/src/flow-control.ts:406 in phaseAfter: `<` becomes `>=`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
