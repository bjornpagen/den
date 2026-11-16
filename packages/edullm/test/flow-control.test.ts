import { type Case, drawn, explore, Run } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { constant, type Gen, int, weighted } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { runOfTest } from "@bjornpagen/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, HashMap, Option } from "effect"
import { throttleRequestsLeast, throttleRequestsMost } from "#alphatest.ts"
import {
	AlphaTestApi,
	type Knee,
	makeAlphaTest,
	type Request,
	type Weather,
	type World
} from "#alphatest.ts"
import { BBR, CONSTANTS, controllerOf, type Rules, windowOf } from "#flow-control.ts"
import { batchOf, type Transition } from "#test/support/batch.ts"
import { caught, exploration, law } from "#test/support/search.ts"

/**
 * One batch of one kind: its knee, a whole-millisecond service time so a saturated kind's completions are evenly
 * spaced, the flow it starts from, how many requests it holds, and whether the gateway and the weather can congest it.
 */
type Scenario = Readonly<{
	knee: Knee
	start: number
	requests: number
	congestion: Option.Option<Readonly<{ requests: number; weather: Gen<Weather> }>>
}>

type Seen =
	| "up-kept"
	| "down-kept"
	| "probe-dropped"
	| "halved"
	| "recovery-held"
	| "above-knee"
	| "below-knee"
	| "congested"

const clear: Gen<Weather> = constant({ _tag: "Clear", slowdown: 1 })

const stormy: Gen<Weather> = weighted<Weather>([
	[20, clear],
	[
		2,
		(source) => ({
			_tag: "Transient",
			status: source.draw(
				weighted([
					[1, constant(503 as const)],
					[1, constant(408 as const)]
				])
			)
		})
	],
	[1, constant({ _tag: "Transport" })]
])

const scenarioGen: Gen<Scenario> = (source) => {
	const window = source.draw(int(1, 10))
	const serviceMillis = source.draw(int(5, 50))
	return {
		knee: { window, rate: 1000 / serviceMillis },
		start: source.draw(int(1, 3 * window)),
		requests: source.draw(int(50, 600)),
		congestion: source.draw(
			weighted([
				[1, constant(Option.none())],
				[
					1,
					(s) =>
						Option.some({
							requests: s.draw(int(throttleRequestsLeast, throttleRequestsMost)),
							weather: stormy
						})
				]
			])
		)
	}
}

const worldOf = (scenario: Scenario): World => ({
	knees: {
		listing: scenario.knee,
		"gap-by-report": scenario.knee,
		"gap-by-assignment": scenario.knee,
		"assignment-record": scenario.knee,
		review: scenario.knee
	},
	throttle: {
		requests: Option.match(scenario.congestion, {
			onNone: () => Number.POSITIVE_INFINITY,
			onSome: (c) => c.requests
		}),
		windowMillis: 1000,
		retryAfter: Option.none()
	},
	gatewayMillis: 1,
	listingRows: 0,
	finals: HashMap.empty(),
	weather: Option.match(scenario.congestion, { onNone: () => clear, onSome: (c) => c.weather })
})

const itemsOf = (scenario: Scenario): ReadonlyArray<Request> =>
	Array.from({ length: scenario.requests }, (_, at): Request => ({
		kind: "review",
		target: String(at + 1)
	}))

/**
 * The legal moves of the window at one transition: a delivery leaves it, or ends a probe round at the probe window; a
 * congestion signal halves the window in force once per event (a request sent at or after the last halving's recovery
 * point) and otherwise leaves it; a settled read leaves it.
 */
const legal = (transition: Transition): boolean => {
	const { before, after, event, sent } = transition
	switch (event) {
		case "settled":
			return after.window === before.window
		case "delivered":
			return (
				after.window === before.window ||
				(before.phase._tag === "Probe" && after.window === before.phase.window)
			)
		case "congested":
			return sent.seq >= before.recoverFrom
				? after.window === Math.max(1, Math.floor(windowOf(before) * CONSTANTS.decrease))
				: after.window === before.window
	}
}

const noteOf = (transition: Transition, knee: Knee, c: Case<Seen>) => {
	const { before, after, event, sent } = transition
	if (event === "congested") {
		c.note("congested")
		c.note(sent.seq >= before.recoverFrom ? "halved" : "recovery-held")
	}
	if (event === "delivered" && before.phase._tag === "Probe" && after.phase._tag === "Cruise") {
		c.note(
			after.window === before.window
				? "probe-dropped"
				: before.phase.direction === "up"
					? "up-kept"
					: "down-kept"
		)
	}
	c.note(windowOf(before) >= knee.window ? "above-knee" : "below-knee")
}

const controlSearch = (suite: string, rules: Rules, runs: number) =>
	explore(
		exploration({
			suite,
			draw: drawn(scenarioGen),
			coverage: required<Seen>(
				[
					"up-kept",
					"down-kept",
					"probe-dropped",
					"halved",
					"recovery-held",
					"above-knee",
					"below-knee",
					"congested"
				],
				{ cases: 200, sense: notesOnly }
			),
			runs,
			shrink: 100,
			oracle: {
				kind: "specification",
				name: "BBR's probe rule and TCP's once-per-event halving, against a bottleneck flat above its knee"
			}
		}),
		(scenario: Scenario, c: Case<Seen>) =>
			Effect.gen(function* () {
				const flow = {
					window: scenario.start,
					maxRate: 0,
					minLatency: (scenario.knee.window / scenario.knee.rate) * 1000
				}
				const batch = yield* batchOf(rules, itemsOf(scenario), flow, 0, c).pipe(
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
					const ceiling = Math.max(
						scenario.start,
						controllerOf(rules).probeWindowOf(scenario.knee.window, "up")
					)
					yield* law(
						"no ratchet above the knee",
						Arr.every(batch.transitions, (transition) => transition.after.window <= ceiling),
						() =>
							`the window passed ${String(ceiling)} on a kind whose knee is ${String(scenario.knee.window)}`
					)
				}
			})
	)

const inTheirRun = (ctx: Parameters<Parameters<typeof it.effect>[1]>[0]) =>
	Effect.provideServiceEffect(Run, runOfTest(ctx))

describe("the AlphaTest flow controller", () => {
	it.effect(
		"moves its window only by kept probes and once-per-event halvings, and never ratchets past the knee",
		(ctx) => searched(ctx, controlSearch("flow-control: windows", BBR, 300))
	)

	it.effect("catches a halving on every congestion signal of one event", (ctx) =>
		caught(
			controlSearch("flow-control planted: no recovery point", { ...BBR, halves: () => true }, 80)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches an up probe kept on a tie", (ctx) =>
		caught(
			controlSearch(
				"flow-control planted: up probe kept on a tie",
				{
					...BBR,
					kept: (direction, probed, reference) =>
						direction === "up"
							? probed.perSecond >= reference.perSecond
							: BBR.kept(direction, probed, reference)
				},
				80
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches a halving with no floor of one request", (ctx) =>
		caught(
			controlSearch(
				"flow-control planted: halving to zero",
				{ ...BBR, decreased: (window, constants) => Math.floor(window * constants.decrease) },
				80
			)
		).pipe(inTheirRun(ctx))
	)
})
