/** What the properties of flow-control.test.ts read: its space, the fake's world, and the window's legal moves. */

import { constant, type Gen, int, weighted } from "@bjornpagen/testing/gen"
import type { Case } from "@bjornpagen/testing/property"
import { HashMap, Option } from "effect"
import { throttleRequestsLeast, throttleRequestsMost } from "#alphatest.ts"
import type { Knee, Request, Weather, World } from "#alphatest.ts"
import { CONSTANTS, windowOf } from "#flow-control.ts"
import type { Transition } from "#test/support/batch.ts"

/**
 * One batch of one kind: its knee, a whole-millisecond service time so a saturated kind's completions are evenly
 * spaced, the flow it starts from, how many requests it holds, and whether the gateway and the weather can congest it.
 */
export type Scenario = Readonly<{
	knee: Knee
	start: number
	requests: number
	congestion: Option.Option<Readonly<{ requests: number; weather: Gen<Weather> }>>
}>

export type Seen =
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

export const scenarioGen: Gen<Scenario> = (source) => {
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

export const worldOf = (scenario: Scenario): World => ({
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

export const itemsOf = (scenario: Scenario): ReadonlyArray<Request> =>
	Array.from({ length: scenario.requests }, (_, at): Request => ({
		kind: "review",
		target: String(at + 1)
	}))

/**
 * The legal moves of the window at one transition: a delivery leaves it, or ends a probe round at the probe window; a
 * congestion signal halves the window in force once per event (a request sent at or after the last halving's recovery
 * point) and otherwise leaves it; a settled read leaves it.
 */
export const legal = (transition: Transition): boolean => {
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

export const noteOf = (transition: Transition, knee: Knee, c: Case<Seen>) => {
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
