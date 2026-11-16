import {
	congestionDivisor,
	minLatencyFilterSeconds,
	probeDownGain,
	probeUpGain,
	probeWaitLeastSeconds,
	probeWaitSpreadSeconds
} from "@den/limits/flow-control"
import { Array as Arr, Option } from "effect"

/**
 * The AlphaTest flow controller, edullm's `alphatest-acquisition/src/fetch.ts` as a pure state machine: a sliding
 * window of requests in flight, discovered per request kind. A request starts whenever one finishes, up to the window,
 * with no barrier between rounds. The window halves at once on a congestion event (RFC 5681 §3.1), once per event
 * (RFC 6582 §3.2's recovery point). Otherwise it moves only by probes that alternate up and down by BBR's gains, each
 * measured against an equal-count reference round at the window and decided by the two rounds' combined standard
 * error: above the knee a smaller window costs nothing and is kept, below it a larger one gains and is kept. The max
 * delivery rate and the min latency are measured and reported, and steer nothing. Instants and latencies are
 * milliseconds of the caller's clock; rates are requests a second. Randomness enters only as the uniform draws the
 * caller passes, so a run is a function of its inputs.
 */

/** BBR's and TCP's constants, as `Rules` read them; each is a limit of @den/limits/flow-control, with its source. */
export type Constants = Readonly<{
	/** BBR's ProbeBW pacing gains: a probe moves the window up to `ceil(up × window)`, down to `max(1, floor(down ×
	 * window))`. */
	gain: Readonly<{ up: number; down: number }>
	/** How long the window cruises before it probes, in milliseconds: `least` plus a uniform share of `spread`. */
	probeWait: Readonly<{ least: number; spread: number }>
	/** How long a min-latency sample stands before any later sample replaces it, in milliseconds. */
	minLatencyFilter: number
	/** The share of the window a congestion event keeps, never below one request. */
	decrease: number
}>

const MILLIS_PER_SECOND = 1000

export const CONSTANTS: Constants = {
	gain: { up: probeUpGain.value, down: probeDownGain.value },
	probeWait: {
		least: probeWaitLeastSeconds.value * MILLIS_PER_SECOND,
		spread: probeWaitSpreadSeconds.value * MILLIS_PER_SECOND
	},
	minLatencyFilter: minLatencyFilterSeconds.value * MILLIS_PER_SECOND,
	decrease: 1 / congestionDivisor.value
}

/** A kind's discovered flow, carried from one batch to the next: the window, and the measured max rate and min latency. */
export type Flow = Readonly<{ window: number; maxRate: number; minLatency: number }>

/** A round's delivery rate with its standard error. */
export type Rate = Readonly<{ perSecond: number; standardError: number }>

/** Which way a probe moves the window. */
export type Direction = "up" | "down"

/**
 * A measuring round's own count: its ordinal, stamped on every request it sends; the requests of earlier rounds still
 * in flight at its start; its own full-window deliveries before its intervals start; and its intervals.
 */
type Measured = Readonly<{
	round: number
	earlier: number
	warm: number
	intervals: ReadonlyArray<number>
}>

/** Where the window is in its cycle: cruising until its probe wait elapses, measuring a reference round, or probing. */
export type Phase =
	| Readonly<{
			_tag: "Cruise"
			round: number
			nextProbe: Direction
			cycleAt: number
			probeWait: number
	  }>
	| (Readonly<{ _tag: "Reference"; direction: Direction; probe: number }> & Measured)
	| (Readonly<{
			_tag: "Probe"
			direction: Direction
			window: number
			reference: Rate
			count: number
	  }> &
			Measured)

/** BBR's per-request send state (§4.1.2.1.2), plus the round that sent it and the in-flight count it was sent at. */
export type Sent = Readonly<{
	seq: number
	round: number
	inFlight: number
	sentAt: number
	delivered: number
	deliveredAt: number
	firstSentAt: number
}>

/** What the controller knows: the window is the state; the rate and the latency are measurements it reports. */
export type Controller = Readonly<{
	window: number
	phase: Phase
	delivered: number
	deliveredAt: number
	firstSentAt: number
	rate: Readonly<{ current: number; previous: number }>
	minLatency: number
	minLatencyAt: number
	sent: number
	recoverFrom: number
}>

/**
 * The controller's decisions, each a rule of a published algorithm: whether a congestion signal halves the window (a
 * request sent before the last halving belongs to its event), what a halving leaves, and whether a probe's rate beats
 * its reference. A planted bug breaks one.
 */
export type Rules = Readonly<{
	constants: Constants
	halves: (sent: Sent, recoverFrom: number) => boolean
	decreased: (window: number, constants: Constants) => number
	kept: (direction: Direction, probed: Rate, reference: Rate) => boolean
}>

/**
 * The combined standard error of the two rounds decides: an up probe is kept only if its rate exceeds the reference by
 * more than it; a down probe is kept unless its rate falls below the reference by more than it, so a smaller window
 * that costs nothing measurable wins.
 */
const keptBySpread = (direction: Direction, probed: Rate, reference: Rate): boolean => {
	const uncertainty = Math.hypot(probed.standardError, reference.standardError)
	return direction === "up"
		? probed.perSecond - reference.perSecond > uncertainty
		: reference.perSecond - probed.perSecond <= uncertainty
}

/** edullm's controller: BBR's probes, TCP's halving once per event. */
export const BBR: Rules = {
	constants: CONSTANTS,
	halves: (sent, recoverFrom) => sent.seq >= recoverFrom,
	decreased: (window, constants) => Math.max(1, Math.floor(window * constants.decrease)),
	kept: keptBySpread
}

/** The window requests are sent up to: the probe window while probing, the window otherwise. */
export const windowOf = (controller: Controller): number =>
	controller.phase._tag === "Probe" ? controller.phase.window : controller.window

/** The flow a batch reports for the next: its window, the larger of the two cycles' max rates, the min latency. */
export const flowOf = (controller: Controller): Flow => ({
	window: controller.window,
	maxRate: Math.max(controller.rate.current, controller.rate.previous),
	minLatency: controller.minLatency
})

const opposite = (direction: Direction): Direction => (direction === "up" ? "down" : "up")

/**
 * A round's delivery rate from its inter-completion intervals: the reciprocal of their mean, with the standard error the
 * delta method gives it. A round whose completions all share one millisecond has no rate.
 */
const rateOf = (intervals: ReadonlyArray<number>): Option.Option<Rate> => {
	const count = intervals.length
	const mean = Arr.reduce(intervals, 0, (total, interval) => total + interval) / count
	const variance =
		Arr.reduce(intervals, 0, (total, interval) => total + (interval - mean) ** 2) / (count - 1)
	return mean > 0
		? Option.some({
				perSecond: MILLIS_PER_SECOND / mean,
				standardError: (MILLIS_PER_SECOND * Math.sqrt(variance)) / (mean * mean * Math.sqrt(count))
			})
		: Option.none()
}

/** A round resolves a probe once its standard error is at most the change the probe would make, over √2. */
const resolves = (rate: Rate, window: number, probe: number) =>
	rate.standardError * Math.SQRT2 <= Math.abs(probe / window - 1) * rate.perSecond

const measuredOf = (round: number, earlier: number): Measured => ({
	round,
	earlier,
	warm: 0,
	intervals: []
})

const countsIn = (round: Measured, window: number, sent: Sent) =>
	sent.round === round.round && sent.inFlight === window

const measuredAfter = <P extends Measured>(phase: P, window: number, gap: number): P =>
	phase.earlier > 0 || phase.warm < window
		? { ...phase, warm: phase.warm + 1 }
		: { ...phase, intervals: Arr.append(phase.intervals, gap) }

const nextProbeOf = (phase: Phase): Direction =>
	phase._tag === "Cruise" ? phase.nextProbe : phase.direction

/** One delivery as the cycle reads it: the gap since the delivery before it, and the requests still in flight after it. */
type Delivery = Readonly<{
	sent: Sent
	now: number
	gap: number
	uniform: number
	inFlight: number
}>

/** The controller of a rule set: its every transition, pure. */
export const controllerOf = (rules: Rules) => {
	const { constants } = rules
	const probeWindowOf = (window: number, direction: Direction) =>
		direction === "up"
			? Math.ceil(constants.gain.up * window)
			: Math.max(1, Math.floor(constants.gain.down * window))
	const cruiseOf = (round: number, nextProbe: Direction, now: number, uniform: number): Phase => ({
		_tag: "Cruise",
		round,
		nextProbe,
		cycleAt: now,
		probeWait: constants.probeWait.least + uniform * constants.probeWait.spread
	})

	/** A batch's controller at `now`, from the flow the kind carried. */
	const start = (flow: Flow, now: number, uniform: number): Controller => ({
		window: flow.window,
		phase: cruiseOf(0, "up", now, uniform),
		delivered: 0,
		deliveredAt: now,
		firstSentAt: now,
		rate: { current: flow.maxRate, previous: 0 },
		minLatency: flow.minLatency,
		minLatencyAt: now,
		sent: 0,
		recoverFrom: 0
	})

	/** A request sent at `now`, `inFlight` counting it. */
	const send = (
		controller: Controller,
		now: number,
		inFlight: number
	): readonly [Controller, Sent] => [
		{ ...controller, sent: controller.sent + 1 },
		{
			seq: controller.sent,
			round: controller.phase.round,
			inFlight,
			sentAt: now,
			delivered: controller.delivered,
			deliveredAt: controller.deliveredAt,
			firstSentAt: controller.firstSentAt
		}
	]

	/** A request that ended with no delivery and no congestion: a measuring round's warm-up waits for one fewer. */
	const settled = (controller: Controller, sent: Sent): Controller => {
		const { phase } = controller
		return phase._tag !== "Cruise" && sent.round < phase.round && phase.earlier > 0
			? { ...controller, phase: { ...phase, earlier: phase.earlier - 1 } }
			: controller
	}

	/** A congestion signal: the window halves at once, once per event, and the cycle restarts in cruise. */
	const congested = (
		controller: Controller,
		sent: Sent,
		now: number,
		uniform: number
	): Controller => {
		const halves = rules.halves(sent, controller.recoverFrom)
		return {
			...controller,
			phase: cruiseOf(controller.phase.round + 1, nextProbeOf(controller.phase), now, uniform),
			window: halves ? rules.decreased(windowOf(controller), constants) : controller.window,
			recoverFrom: halves ? controller.sent : controller.recoverFrom
		}
	}

	const phaseAfter = (controller: Controller, delivery: Delivery): Controller => {
		const { phase } = controller
		switch (phase._tag) {
			case "Cruise": {
				if (delivery.now - phase.cycleAt < phase.probeWait) {
					return controller
				}
				const direction =
					probeWindowOf(controller.window, phase.nextProbe) === controller.window
						? "up"
						: phase.nextProbe
				return {
					...controller,
					phase: {
						_tag: "Reference",
						direction,
						probe: probeWindowOf(controller.window, direction),
						...measuredOf(phase.round + 1, delivery.inFlight)
					}
				}
			}
			case "Reference": {
				if (!countsIn(phase, controller.window, delivery.sent)) {
					return controller
				}
				const measured = measuredAfter(phase, controller.window, delivery.gap)
				const reference = Option.filter(
					measured.intervals.length >= Math.max(controller.window, phase.probe)
						? rateOf(measured.intervals)
						: Option.none(),
					(rate) => resolves(rate, controller.window, phase.probe)
				)
				return Option.match(reference, {
					onNone: (): Controller => ({ ...controller, phase: measured }),
					onSome: (rate): Controller => ({
						...controller,
						phase: {
							_tag: "Probe",
							direction: phase.direction,
							window: phase.probe,
							reference: rate,
							count: measured.intervals.length,
							...measuredOf(phase.round + 1, delivery.inFlight)
						}
					})
				})
			}
			case "Probe": {
				if (!countsIn(phase, phase.window, delivery.sent)) {
					return controller
				}
				const measured = measuredAfter(phase, phase.window, delivery.gap)
				if (measured.intervals.length < phase.count) {
					return { ...controller, phase: measured }
				}
				return {
					...controller,
					phase: cruiseOf(
						phase.round + 1,
						opposite(phase.direction),
						delivery.now,
						delivery.uniform
					),
					window: Option.exists(rateOf(measured.intervals), (probed) =>
						rules.kept(phase.direction, probed, phase.reference)
					)
						? phase.window
						: controller.window,
					rate: { current: 0, previous: controller.rate.current }
				}
			}
		}
	}

	/**
	 * A final answer at `now`: its latency and rate samples (BBR §2.16.1, §4.1.2.3), then the cycle. The rate sample's
	 * interval is the longer of the request's send and delivery intervals, never shorter than its own latency.
	 */
	const delivered = (
		controller: Controller,
		sent: Sent,
		now: number,
		uniform: number,
		inFlight: number
	): Controller => {
		const count = controller.delivered + 1
		const latency = now - sent.sentAt
		const interval = Math.max(sent.sentAt - sent.firstSentAt, now - sent.deliveredAt)
		const sample = interval > 0 ? ((count - sent.delivered) * MILLIS_PER_SECOND) / interval : 0
		const latest =
			latency < controller.minLatency || now > controller.minLatencyAt + constants.minLatencyFilter
		return phaseAfter(
			settled(
				{
					...controller,
					delivered: count,
					deliveredAt: now,
					firstSentAt: sent.sentAt,
					rate: { ...controller.rate, current: Math.max(controller.rate.current, sample) },
					minLatency: latest ? latency : controller.minLatency,
					minLatencyAt: latest ? now : controller.minLatencyAt
				},
				sent
			),
			{ sent, now, gap: now - controller.deliveredAt, uniform, inFlight }
		)
	}

	return { start, send, settled, congested, delivered, probeWindowOf }
}
