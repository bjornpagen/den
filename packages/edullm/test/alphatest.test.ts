/**
 * The AlphaTest fake: each kind's reads served by a bottleneck of its measured rate whose latency at its knee is window
 * ÷ rate, so a closed loop's delivery rate grows with its window up to the knee and is flat above it; behind API
 * Gateway's trailing-second throttle, each target answering its one final status and the listing its pages of rows,
 * whatever weather a read meets.
 *
 * Oracle (specification): a bottleneck of the measured rate, min(window, knee) ÷ knee of the rate; API Gateway's
 * trailing-second throttle, a listing of 200-row pages, each target's one final status.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { constant, element, int, production } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, HashMap, Option } from "effect"
import { AlphaTestApi, makeAlphaTest, MEASURED_KNEES } from "#alphatest.ts"
import {
	closedLoop,
	judged,
	type Loop,
	type LoopSeen,
	type Scenario,
	scenarioGen,
	type Seen
} from "#test/alphatest.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * The AlphaTest fake delivers each kind at a rate that grows with the window up to its knee and is flat above it.
 *
 * Budget: its suite's count before the conversion (alphatest: knees: 120 independent cases and 60 steered, Vitest at
 * den dc5bd11).
 */
export const knees = property.explore(
	(source): Loop => {
		const kind = source.draw(
			element(["gap-by-report", "gap-by-assignment", "assignment-record", "review"] as const)
		)
		const window = source.draw(int(1, 2 * MEASURED_KNEES[kind].window))
		return {
			kind,
			window,
			requests: 200 * window,
			gateway: {
				requests: Number.POSITIVE_INFINITY,
				windowMillis: source.draw(production(1000, [500])),
				retryAfter: Option.none()
			}
		}
	},
	{
		needs: {},
		situations: ["below-knee", "at-knee", "above-knee"] satisfies ReadonlyArray<Reached<LoopSeen>>,
		check: (_, c: Case<LoopSeen>) => (loop: Loop) =>
			Effect.gen(function* () {
				const knee = MEASURED_KNEES[loop.kind]
				c.note(
					loop.window < knee.window
						? "below-knee"
						: loop.window === knee.window
							? "at-knee"
							: "above-knee"
				)
				const done = yield* closedLoop(loop)
				const steady = Arr.drop(done, Math.floor(done.length / 2))
				const span =
					Arr.last(steady).pipe(Option.getOrElse(() => 0)) -
					Arr.head(steady).pipe(Option.getOrElse(() => 0))
				const rate = ((steady.length - 1) * 1000) / span
				const expected = (Math.min(loop.window, knee.window) / knee.window) * knee.rate
				yield* law(
					"knee",
					Math.abs(rate - expected) <= expected / 50,
					() =>
						`${loop.kind} at window ${String(loop.window)} delivered ${String(rate)} a second, its knee says ${String(expected)}`
				)
			}).pipe(
				Effect.provideServiceEffect(
					AlphaTestApi,
					makeAlphaTest(
						{
							knees: MEASURED_KNEES,
							throttle: loop.gateway,
							gatewayMillis: 1,
							listingRows: 0,
							finals: HashMap.empty(),
							weather: constant({ _tag: "Clear", slowdown: 1 })
						},
						c
					)
				)
			),
		oracle: {
			kind: "specification",
			name: "a bottleneck of the measured rate whose latency at the knee is window ÷ rate: min(window, knee) ÷ knee of the rate"
		},
		budget: { runs: 120, steered: 60 },
		kept: [],
		kills: [
			{
				file: "packages/edullm/src/alphatest.ts",
				original: "\t\t\tif (recent.length >= world.throttle.requests) {",
				replacement: "\t\t\tif (recent.length < world.throttle.requests) {",
				why: "Operator mutant (comparison) at packages/edullm/src/alphatest.ts:465 in answer: `>=` becomes `<`; the property fails (lane CATCH, den 9cffaba)."
			}
		]
	}
)

/**
 * The AlphaTest fake throttles past its threshold in the trailing second, and answers each resource's own final status.
 *
 * Budget: its suite's count before the conversion (alphatest: gateway and resources: 400 independent cases and 200
 * steered, Vitest at den dc5bd11).
 */
export const gateway = property.explore(scenarioGen, {
	needs: {},
	situations: [
		"throttled",
		"retry-after",
		"not-found",
		"redirect",
		"forbidden",
		"transient",
		"transport",
		"listing-partial",
		"listing-past-end",
		"listing-capped"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (_, c: Case<Seen>) => (scenario: Scenario) =>
		Effect.gen(function* () {
			const api = yield* AlphaTestApi
			let at = 0
			for (const read of scenario.reads) {
				at += read.gap
				yield* api.read(read.request, at)
			}
			const log = yield* api.log
			yield* judged(scenario, log, c)
		}).pipe(Effect.provideServiceEffect(AlphaTestApi, makeAlphaTest(scenario.world, c))),
	oracle: {
		kind: "specification",
		name: "API Gateway's trailing-second throttle, a listing of 200-row pages, each target's one final status"
	},
	budget: { runs: 400, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/alphatest.ts",
			original: "\t\t\t\t(row) => row <= world.listingRows",
			replacement: "\t\t\t\t(row) => row > world.listingRows",
			why: "Operator mutant (comparison) at packages/edullm/src/alphatest.ts:423 in resourceAnswer: `<=` becomes `>`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
