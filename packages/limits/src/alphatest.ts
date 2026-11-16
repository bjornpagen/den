import { measured } from "@bjornpagen/limit"

/**
 * AlphaTest's API as edullm's acquisition measured it (the fake in packages/edullm/src/alphatest.ts): each request
 * kind's knee, the listing's page, and the gateway's throttle. The records are edullm's, at 28ddb047f, in
 * packages/platform/pipeline/src/limits.ts and packages/data/alphatest-acquisition/src/answers.ts; the
 * the limits skill, .agents/skills/limits; this package's README.
 */

/** What every knee's measurement shares: edullm's ramp probe of 2026-11-01. */
const ramp = {
	observed: "2026-11-01 02:08–02:29Z, one kind at a time",
	environment:
		"AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window",
	workload:
		"one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a step's rate gained nothing beyond the combined standard error or a 429 came",
	revalidate:
		"a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API Gateway; a 429 or 503 on a link of the kind"
} as const

/** A kind's knee window: the smallest window at the best rate, or the last before the first 429. */
const windowDecision =
	"the fake serves the kind as a bottleneck whose delivery rate grows with the window up to this one and is flat above it; no headroom is taken, since the controller under test moves its window itself"

/** A kind's knee rate: the delivery rate at its knee window. */
const rateDecision =
	"the fake serves the kind at this rate from its knee window up, its latency at the knee the window over the rate; the latency the probe printed is not Little's law's window over rate, so the fake derives it from the two it keeps"

export const listingKneeWindow = measured({
	...ramp,
	value: 2,
	owner:
		"AlphaTest's listing endpoint (/delivery/teacher/all-assignments), as edullm's acquisition met it",
	unit: "requests in flight",
	scope: "the listing kind's knee in the AlphaTest fake",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.listing, from the ramp probe's results/p14-ramp.json (phases.ramps.listing)",
	result:
		"261 pages at limit 200, no 429, 5xx or timeout: 0.355 ± 0.005 pages a second at 1 in flight, 0.560 ± 0.047 at 2, 0.593 ± 0.041 at 3, a gain within the combined error, so the ramp stopped",
	decision: `2, the smallest window at the best rate: ${windowDecision}`
})

export const listingKneeRate = measured({
	...ramp,
	value: 0.56,
	owner:
		"AlphaTest's listing endpoint (/delivery/teacher/all-assignments), as edullm's acquisition met it",
	unit: "requests a second",
	scope: "the listing kind's delivery rate at its knee in the AlphaTest fake",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.listing (maxRate), from the ramp probe's results/p14-ramp.json",
	result:
		"0.560 ± 0.047 pages a second at 2 in flight (n 71), latency min 2,538 ms, p50 3,082, p95 5,704",
	decision: `0.56, the rate at the knee window: ${rateDecision}`
})

export const gapByReportKneeWindow = measured({
	...ramp,
	value: 4,
	owner:
		"AlphaTest's gap analysis by report (/reporting/gap-analysis?reportId=…), as edullm's acquisition met it",
	unit: "requests in flight",
	scope: "the gap-by-report kind's knee in the AlphaTest fake",
	evidence:
		'edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-report"], from the ramp probe\'s results/p14-ramp.json',
	result:
		"1,346 reads, all 200: 4.91 ± 0.45 a second at 1, 11.74 ± 0.83 at 2, 17.98 ± 1.41 at 3, 20.68 ± 1.23 at 4, then 11.37 ± 0.68 at 5, a fall of 9.31 against a combined error of 1.41",
	decision: `4, the smallest window at the best rate, past which the rate collapses: ${windowDecision}`
})

export const gapByReportKneeRate = measured({
	...ramp,
	value: 20.684,
	owner:
		"AlphaTest's gap analysis by report (/reporting/gap-analysis?reportId=…), as edullm's acquisition met it",
	unit: "requests a second",
	scope: "the gap-by-report kind's delivery rate at its knee in the AlphaTest fake",
	evidence:
		'edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-report"] (maxRate), from the ramp probe\'s results/p14-ramp.json',
	result: "20.68 ± 1.23 a second at 4 in flight (n 452), latency min 111 ms, p50 139, p95 408",
	decision: `20.684, the rate at the knee window: ${rateDecision}`
})

export const gapByAssignmentKneeWindow = measured({
	...ramp,
	value: 9,
	owner:
		"AlphaTest's gap analysis by assignment (/reporting/gap-analysis?assignmentId=…), as edullm's acquisition met it",
	unit: "requests in flight",
	scope: "the gap-by-assignment kind's knee in the AlphaTest fake",
	evidence:
		'edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-assignment"], from the ramp probe\'s results/p14-ramp.json',
	result:
		"4,663 requests (2,680 × 200, 1,981 × 404, 2 × 429 without Retry-After 11 s into the 12-in-flight step at about 68 a second): 45.34 ± 3.09 a second at 9, each step to it a gain beyond the combined error",
	decision: `9, the last window before the first 429 and the best rate: ${windowDecision}`
})

export const gapByAssignmentKneeRate = measured({
	...ramp,
	value: 45.344,
	owner:
		"AlphaTest's gap analysis by assignment (/reporting/gap-analysis?assignmentId=…), as edullm's acquisition met it",
	unit: "requests a second",
	scope: "the gap-by-assignment kind's delivery rate at its knee in the AlphaTest fake",
	evidence:
		'edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-assignment"] (maxRate), from the ramp probe\'s results/p14-ramp.json',
	result: "45.34 ± 3.09 a second at 9 in flight (n 868), latency min 73 ms, p50 119, p95 727",
	decision: `45.344, the rate at the knee window: ${rateDecision}`
})

export const assignmentRecordKneeWindow = measured({
	...ramp,
	value: 7,
	owner:
		"AlphaTest's assignment records (/delivery/assignments/{id}), as edullm's acquisition met it",
	unit: "requests in flight",
	scope: "the assignment-record kind's knee in the AlphaTest fake",
	evidence:
		'edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["assignment-record"], from the ramp probe\'s results/p14-ramp.json',
	result:
		"4,916 reads, all 200: 36.65 ± 3.20 a second at 7, then 32.58 ± 2.77 at 9, a change of −4.08 against a combined error of 4.23, so the ramp stopped",
	decision: `7, the smallest window at the best rate: ${windowDecision}`
})

export const assignmentRecordKneeRate = measured({
	...ramp,
	value: 36.654,
	owner:
		"AlphaTest's assignment records (/delivery/assignments/{id}), as edullm's acquisition met it",
	unit: "requests a second",
	scope: "the assignment-record kind's delivery rate at its knee in the AlphaTest fake",
	evidence:
		'edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["assignment-record"] (maxRate), from the ramp probe\'s results/p14-ramp.json',
	result: "36.65 ± 3.20 a second at 7 in flight (n 1,004), latency min 78 ms, p50 122, p95 817",
	decision: `36.654, the rate at the knee window: ${rateDecision}`
})

export const reviewKneeWindow = measured({
	...ramp,
	value: 9,
	owner:
		"AlphaTest's assignment reviews (/delivery/teacher/assignment/{id}/review), as edullm's acquisition met it",
	unit: "requests in flight",
	scope: "the review kind's knee in the AlphaTest fake",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.review, from the ramp probe's results/p14-ramp.json",
	result:
		"5,305 requests (5,278 × 200, 26 × 404, one 429 without Retry-After 11 s into the 12-in-flight step at about 59 a second): 45.89 ± 3.97 a second at 9, each step to it a gain beyond the combined error",
	decision: `9, the last window before the first 429 and the best rate: ${windowDecision}`
})

export const reviewKneeRate = measured({
	...ramp,
	value: 45.885,
	owner:
		"AlphaTest's assignment reviews (/delivery/teacher/assignment/{id}/review), as edullm's acquisition met it",
	unit: "requests a second",
	scope: "the review kind's delivery rate at its knee in the AlphaTest fake",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.review (maxRate), from the ramp probe's results/p14-ramp.json",
	result: "45.89 ± 3.97 a second at 9 in flight (n 1,004), latency min 81 ms, p50 127, p95 760",
	decision: `45.885, the rate at the knee window: ${rateDecision}`
})

/** How many rows a listing page holds at most, whatever its `limit` asks for. */
export const listingPageRows = measured({
	value: 200,
	owner: "AlphaTest's listing endpoint (/delivery/teacher/all-assignments)",
	unit: "rows a page",
	scope: "one listing page of the AlphaTest fake",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_LISTING_PAGE_ROWS, from the probe's REPORT.md §2, results/p3-page-size.json and results/p4-cap-and-depth.json",
	observed: "2026-10-31 21:30:41Z and 21:30:55Z",
	environment:
		"AlphaTest's production API Gateway with edullm's machine credentials, read from the operator's machine",
	workload:
		"single listing reads at limits 50, 100, 200, 201, 250, 500, 1,000 and 5,000, and at limit 200 from pages 2 to 1,273",
	result:
		"every limit of 200 or more returned 200 rows and reported limit 200; 50 and 100 returned what they asked; 254,249 rows in 1,272 pages; latency independent of page size and depth",
	decision: "the fake's page holds min(limit, 200) rows, as the source's does",
	revalidate:
		"a listing that answers more than 200 rows to a larger limit; a change of AlphaTest host"
})

/** What both ends of the gateway's throttle range share: the two observations of its 429s. */
const throttle = {
	owner: "AlphaTest's API Gateway stage, its throttle across every kind",
	unit: "requests in the trailing second",
	evidence:
		"edullm 28ddb047f packages/data/alphatest-acquisition/src/answers.ts (the 429's body and missing Retry-After) and packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE (the ramp probe's 429s)",
	observed:
		"2026-10-09 06:14:37–06:15:29Z (991 429s), and 2026-11-01 02:08–02:29Z (the ramp probe)",
	environment:
		"Vercel iad1 (2026-10-09) and the operator's VM (2026-11-01), against AlphaTest's production gateway",
	workload: "eight readers of every kind (2026-10-09); one kind at a time (2026-11-01)",
	result:
		"429s at 40–58 answers a second (2026-10-09) and at about 59–68 requests a second (2026-11-01), never with a Retry-After",
	revalidate: "a 429 outside 40 to 68 requests a second, or a Retry-After seen on one"
} as const

/** The fewest requests in the trailing second at which a simulated gateway throttles. */
export const throttleRequestsLeast = measured({
	...throttle,
	value: 40,
	scope: "the throttle threshold an AlphaTest simulation draws, at its least",
	decision:
		"a simulation draws the threshold from the measured range, never fixed; this is the lowest rate a 429 was seen at"
})

/** The most requests in the trailing second at which a simulated gateway throttles. */
export const throttleRequestsMost = measured({
	...throttle,
	value: 68,
	scope: "the throttle threshold an AlphaTest simulation draws, at its most",
	decision:
		"a simulation draws the threshold from the measured range, never fixed; this is the highest rate a 429 was seen at"
})
