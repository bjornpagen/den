import { published } from "@bjornpagen/limit"

/**
 * The AlphaTest flow controller's constants (packages/edullm/src/flow-control.ts, edullm's acquisition fetch as a pure
 * state machine): BBR's ProbeBW gains, its probe wait and its min-latency filter, and TCP's congestion halving;
 * the limits skill, .agents/skills/limits; this package's README.
 */

/** BBR draft 06, the revision every BBR constant here is read from. */
const bbr = "https://datatracker.ietf.org/doc/html/draft-ietf-ccwg-bbr-06"

/** The gain an upward probe moves the window by: up to `ceil(gain × window)`. */
export const probeUpGain = published({
	value: 1.25,
	owner: "BBR (draft-ietf-ccwg-bbr-06), ProbeBW_UP's pacing gain",
	unit: "multiples of the window",
	scope: "one upward probe of one batch of the AlphaTest flow controller",
	constraint: "protocol constant",
	source: `${bbr}#section-5.3.3.5`,
	quote:
		"ProbeBW_UP probes for possible increases in available bandwidth by raising the sending rate, using a BBR.pacing_gain of 1.25",
	verified: "2026-11-16"
})

/** The gain a downward probe moves the window by: down to `max(1, floor(gain × window))`. */
export const probeDownGain = published({
	value: 0.9,
	owner: "BBR (draft-ietf-ccwg-bbr-06), ProbeBW_DOWN's pacing gain",
	unit: "multiples of the window",
	scope: "one downward probe of one batch of the AlphaTest flow controller",
	constraint: "protocol constant",
	source: `${bbr}#section-5.3.3.1`,
	quote: "It does this by switching to a BBR.pacing_gain of 0.90, sending at 90% of BBR.bw.",
	verified: "2026-11-16"
})

/** BBR's wall-clock wait before it probes for bandwidth, as PickProbeWait draws it. */
const probeWaitQuote = "BBR.bw_probe_wait = 2 + random_float_between(0.0, 1.0) /* 0..1 sec */"

/** The least the window cruises before it probes: the fixed part of BBR's probe wait. */
export const probeWaitLeastSeconds = published({
	value: 2,
	owner: "BBR (draft-ietf-ccwg-bbr-06), PickProbeWait",
	unit: "seconds",
	scope: "the cruise of one cycle of one batch of the AlphaTest flow controller, at its shortest",
	constraint: "protocol constant",
	source: `${bbr}#section-5.3.3.8.3`,
	quote: probeWaitQuote,
	verified: "2026-11-16"
})

/** How much longer than the least a cruise may last: the uniform part of BBR's probe wait. */
export const probeWaitSpreadSeconds = published({
	value: 1,
	owner: "BBR (draft-ietf-ccwg-bbr-06), PickProbeWait",
	unit: "seconds",
	scope: "the cruise of one cycle of one batch of the AlphaTest flow controller, past its least",
	constraint: "protocol constant",
	source: `${bbr}#section-5.3.3.8.3`,
	quote: probeWaitQuote,
	verified: "2026-11-16"
})

/** How long a min-latency sample stands before any later sample replaces it. */
export const minLatencyFilterSeconds = published({
	value: 10,
	owner: "BBR (draft-ietf-ccwg-bbr-06), BBR.MinRTTFilterLen",
	unit: "seconds",
	scope: "the min-latency measurement of one batch of the AlphaTest flow controller",
	constraint: "protocol constant",
	source: `${bbr}#section-2.16.1`,
	quote:
		"BBR.MinRTTFilterLen: A constant specifying the length of the BBR.min_rtt min filter window, BBR.MinRTTFilterLen is 10 secs.",
	verified: "2026-11-16"
})

/** What a congestion event divides the window by: it keeps `max(1, floor(window / divisor))`. */
export const congestionDivisor = published({
	value: 2,
	owner: "TCP congestion control (RFC 5681), ssthresh on loss",
	unit: "parts the window is divided into",
	scope: "one congestion event of one batch of the AlphaTest flow controller",
	constraint: "protocol constant",
	source: "https://www.rfc-editor.org/rfc/rfc5681#section-3.1",
	quote: "ssthresh = max (FlightSize / 2, 2*SMSS)",
	verified: "2026-11-16"
})
