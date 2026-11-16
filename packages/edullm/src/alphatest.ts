import type { Gen } from "@bjornpagen/testing/gen"
import { Array as Arr, Context, Effect, HashMap, Layer, Option, Ref, Schema } from "effect"
import type { Nature } from "#nature.ts"

/**
 * @limitKind measured
 * @owner AlphaTest's listing endpoint (/delivery/teacher/all-assignments), as edullm's acquisition met it
 * @unit requests in flight
 * @scope the listing kind's knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.listing, from the ramp probe's
 *   results/p14-ramp.json (phases.ramps.listing)
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 261 pages at limit 200, no 429, 5xx or timeout: 0.355 ± 0.005 pages a second at 1 in flight, 0.560 ± 0.047
 *   at 2, 0.593 ± 0.041 at 3, a gain within the combined error, so the ramp stopped
 * @decision 2, the smallest window at the best rate: the fake serves the kind as a bottleneck whose delivery rate
 *   grows with the window up to this one and is flat above it; no headroom is taken, since the controller under test
 *   moves its window itself
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const listingKneeWindow = 2

/**
 * @limitKind measured
 * @owner AlphaTest's listing endpoint (/delivery/teacher/all-assignments), as edullm's acquisition met it
 * @unit requests a second
 * @scope the listing kind's delivery rate at its knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.listing (maxRate), from the ramp
 *   probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 0.560 ± 0.047 pages a second at 2 in flight (n 71), latency min 2,538 ms, p50 3,082, p95 5,704
 * @decision 0.56, the rate at the knee window: the fake serves the kind at this rate from its knee window up, its
 *   latency at the knee the window over the rate; the latency the probe printed is not Little's law's window over
 *   rate, so the fake derives it from the two it keeps
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const listingKneeRate = 0.56

/**
 * @limitKind measured
 * @owner AlphaTest's gap analysis by report (/reporting/gap-analysis?reportId=…), as edullm's acquisition met it
 * @unit requests in flight
 * @scope the gap-by-report kind's knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-report"], from the ramp
 *   probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 1,346 reads, all 200: 4.91 ± 0.45 a second at 1, 11.74 ± 0.83 at 2, 17.98 ± 1.41 at 3, 20.68 ± 1.23 at 4,
 *   then 11.37 ± 0.68 at 5, a fall of 9.31 against a combined error of 1.41
 * @decision 4, the smallest window at the best rate, past which the rate collapses: the fake serves the kind as a
 *   bottleneck whose delivery rate grows with the window up to this one and is flat above it; no headroom is taken,
 *   since the controller under test moves its window itself
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const gapByReportKneeWindow = 4

/**
 * @limitKind measured
 * @owner AlphaTest's gap analysis by report (/reporting/gap-analysis?reportId=…), as edullm's acquisition met it
 * @unit requests a second
 * @scope the gap-by-report kind's delivery rate at its knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-report"] (maxRate), from
 *   the ramp probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 20.68 ± 1.23 a second at 4 in flight (n 452), latency min 111 ms, p50 139, p95 408
 * @decision 20.684, the rate at the knee window: the fake serves the kind at this rate from its knee window up, its
 *   latency at the knee the window over the rate; the latency the probe printed is not Little's law's window over
 *   rate, so the fake derives it from the two it keeps
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const gapByReportKneeRate = 20.684

/**
 * @limitKind measured
 * @owner AlphaTest's gap analysis by assignment (/reporting/gap-analysis?assignmentId=…), as edullm's acquisition met
 *   it
 * @unit requests in flight
 * @scope the gap-by-assignment kind's knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-assignment"], from the
 *   ramp probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 4,663 requests (2,680 × 200, 1,981 × 404, 2 × 429 without Retry-After 11 s into the 12-in-flight step at
 *   about 68 a second): 45.34 ± 3.09 a second at 9, each step to it a gain beyond the combined error
 * @decision 9, the last window before the first 429 and the best rate: the fake serves the kind as a bottleneck whose
 *   delivery rate grows with the window up to this one and is flat above it; no headroom is taken, since the
 *   controller under test moves its window itself
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const gapByAssignmentKneeWindow = 9

/**
 * @limitKind measured
 * @owner AlphaTest's gap analysis by assignment (/reporting/gap-analysis?assignmentId=…), as edullm's acquisition met
 *   it
 * @unit requests a second
 * @scope the gap-by-assignment kind's delivery rate at its knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["gap-by-assignment"] (maxRate),
 *   from the ramp probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 45.34 ± 3.09 a second at 9 in flight (n 868), latency min 73 ms, p50 119, p95 727
 * @decision 45.344, the rate at the knee window: the fake serves the kind at this rate from its knee window up, its
 *   latency at the knee the window over the rate; the latency the probe printed is not Little's law's window over
 *   rate, so the fake derives it from the two it keeps
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const gapByAssignmentKneeRate = 45.344

/**
 * @limitKind measured
 * @owner AlphaTest's assignment records (/delivery/assignments/{id}), as edullm's acquisition met it
 * @unit requests in flight
 * @scope the assignment-record kind's knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["assignment-record"], from the
 *   ramp probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 4,916 reads, all 200: 36.65 ± 3.20 a second at 7, then 32.58 ± 2.77 at 9, a change of −4.08 against a
 *   combined error of 4.23, so the ramp stopped
 * @decision 7, the smallest window at the best rate: the fake serves the kind as a bottleneck whose delivery rate
 *   grows with the window up to this one and is flat above it; no headroom is taken, since the controller under test
 *   moves its window itself
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const assignmentRecordKneeWindow = 7

/**
 * @limitKind measured
 * @owner AlphaTest's assignment records (/delivery/assignments/{id}), as edullm's acquisition met it
 * @unit requests a second
 * @scope the assignment-record kind's delivery rate at its knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE["assignment-record"] (maxRate),
 *   from the ramp probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 36.65 ± 3.20 a second at 7 in flight (n 1,004), latency min 78 ms, p50 122, p95 817
 * @decision 36.654, the rate at the knee window: the fake serves the kind at this rate from its knee window up, its
 *   latency at the knee the window over the rate; the latency the probe printed is not Little's law's window over
 *   rate, so the fake derives it from the two it keeps
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const assignmentRecordKneeRate = 36.654

/**
 * @limitKind measured
 * @owner AlphaTest's assignment reviews (/delivery/teacher/assignment/{id}/review), as edullm's acquisition met it
 * @unit requests in flight
 * @scope the review kind's knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.review, from the ramp probe's
 *   results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 5,305 requests (5,278 × 200, 26 × 404, one 429 without Retry-After 11 s into the 12-in-flight step at about
 *   59 a second): 45.89 ± 3.97 a second at 9, each step to it a gain beyond the combined error
 * @decision 9, the last window before the first 429 and the best rate: the fake serves the kind as a bottleneck whose
 *   delivery rate grows with the window up to this one and is flat above it; no headroom is taken, since the
 *   controller under test moves its window itself
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const reviewKneeWindow = 9

/**
 * @limitKind measured
 * @owner AlphaTest's assignment reviews (/delivery/teacher/assignment/{id}/review), as edullm's acquisition met it
 * @unit requests a second
 * @scope the review kind's delivery rate at its knee in the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE.review (maxRate), from the ramp
 *   probe's results/p14-ramp.json
 * @observed 2026-11-01 02:08–02:29Z, one kind at a time
 * @environment AlphaTest's production API Gateway (l407b3xadi, us-east-1) with edullm's machine credentials, read by
 *   Node 24 fetch from the operator's macOS VM, not from Vercel iad1, outside school hours and the pipeline's window
 * @workload one reader of one kind, read-only, one sliding window raised one step at a time (ceil(1.25 × w)) until a
 *   step's rate gained nothing beyond the combined standard error or a 429 came
 * @result 45.89 ± 3.97 a second at 9 in flight (n 1,004), latency min 81 ms, p50 127, p95 760
 * @decision 45.885, the rate at the knee window: the fake serves the kind at this rate from its knee window up, its
 *   latency at the knee the window over the rate; the latency the probe printed is not Little's law's window over
 *   rate, so the fake derives it from the two it keeps
 * @revalidate a new ramp probe; a probe from iad1; a change of AlphaTest host or auth; AlphaTest moving off API
 *   Gateway; a 429 or 503 on a link of the kind
 */
const reviewKneeRate = 45.885

/**
 * How many rows a listing page holds at most, whatever its `limit` asks for.
 *
 * @limitKind measured
 * @owner AlphaTest's listing endpoint (/delivery/teacher/all-assignments)
 * @unit rows a page
 * @scope one listing page of the AlphaTest fake
 * @evidence edullm 28ddb047f packages/platform/pipeline/src/limits.ts ALPHATEST_LISTING_PAGE_ROWS, from the probe's
 *   REPORT.md §2, results/p3-page-size.json and results/p4-cap-and-depth.json
 * @observed 2026-10-31 21:30:41Z and 21:30:55Z
 * @environment AlphaTest's production API Gateway with edullm's machine credentials, read from the operator's machine
 * @workload single listing reads at limits 50, 100, 200, 201, 250, 500, 1,000 and 5,000, and at limit 200 from pages 2
 *   to 1,273
 * @result every limit of 200 or more returned 200 rows and reported limit 200; 50 and 100 returned what they asked;
 *   254,249 rows in 1,272 pages; latency independent of page size and depth
 * @decision the fake's page holds min(limit, 200) rows, as the source's does
 * @revalidate a listing that answers more than 200 rows to a larger limit; a change of AlphaTest host
 */
export const listingPageRows = 200

/**
 * The fewest requests in the trailing second at which a simulated gateway throttles.
 *
 * @limitKind measured
 * @owner AlphaTest's API Gateway stage, its throttle across every kind
 * @unit requests in the trailing second
 * @scope the throttle threshold an AlphaTest simulation draws, at its least
 * @evidence edullm 28ddb047f packages/data/alphatest-acquisition/src/answers.ts (the 429's body and missing
 *   Retry-After) and packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE (the ramp probe's 429s)
 * @observed 2026-10-09 06:14:37–06:15:29Z (991 429s), and 2026-11-01 02:08–02:29Z (the ramp probe)
 * @environment Vercel iad1 (2026-10-09) and the operator's VM (2026-11-01), against AlphaTest's production gateway
 * @workload eight readers of every kind (2026-10-09); one kind at a time (2026-11-01)
 * @result 429s at 40–58 answers a second (2026-10-09) and at about 59–68 requests a second (2026-11-01), never with a
 *   Retry-After
 * @decision a simulation draws the threshold from the measured range, never fixed; this is the lowest rate a 429 was
 *   seen at
 * @revalidate a 429 outside 40 to 68 requests a second, or a Retry-After seen on one
 */
export const throttleRequestsLeast = 40

/**
 * The most requests in the trailing second at which a simulated gateway throttles.
 *
 * @limitKind measured
 * @owner AlphaTest's API Gateway stage, its throttle across every kind
 * @unit requests in the trailing second
 * @scope the throttle threshold an AlphaTest simulation draws, at its most
 * @evidence edullm 28ddb047f packages/data/alphatest-acquisition/src/answers.ts (the 429's body and missing
 *   Retry-After) and packages/platform/pipeline/src/limits.ts ALPHATEST_KNEE (the ramp probe's 429s)
 * @observed 2026-10-09 06:14:37–06:15:29Z (991 429s), and 2026-11-01 02:08–02:29Z (the ramp probe)
 * @environment Vercel iad1 (2026-10-09) and the operator's VM (2026-11-01), against AlphaTest's production gateway
 * @workload eight readers of every kind (2026-10-09); one kind at a time (2026-11-01)
 * @result 429s at 40–58 answers a second (2026-10-09) and at about 59–68 requests a second (2026-11-01), never with a
 *   Retry-After
 * @decision a simulation draws the threshold from the measured range, never fixed; this is the highest rate a 429 was
 *   seen at
 * @revalidate a 429 outside 40 to 68 requests a second, or a Retry-After seen on one
 */
export const throttleRequestsMost = 68

/**
 * The AlphaTest API as edullm meets it: an Amazon API Gateway (`execute-api`) in front of five read operations, each a
 * request kind with its own knee, a gateway throttle shared by every kind, final answers that are the resource's own
 * (200, a redirect left unfollowed, 403, 404, 410), and transient failures that are not. The fake speaks HTTP: a status,
 * the exact body bytes, and the Retry-After header when there is one; classifying it is edullm's one table, `classify`.
 * Every call takes the instant it was sent at and answers the instant it completed, so the caller's simulation owns
 * the clock.
 */

/** The request kinds, one per target shape the source serves (edullm's `ALPHATEST_KINDS`). */
export const KINDS = [
	"listing",
	"gap-by-report",
	"gap-by-assignment",
	"assignment-record",
	"review"
] as const
export type Kind = (typeof KINDS)[number]

/** A request: a listing page, or one document of a kind by its target id. */
export type Request =
	| Readonly<{ kind: "listing"; page: number; limit: number }>
	| Readonly<{ kind: Exclude<Kind, "listing">; target: string }>

/** A request's canonical target text, its identity in the source and in Bronze. */
export const targetOf = (request: Request): string =>
	request.kind === "listing"
		? `listing?page=${String(request.page)}&limit=${String(request.limit)}`
		: `${request.kind}/${request.target}`

/** A kind's service at its knee: the smallest window at the best rate, and that rate in requests a second. */
export type Knee = Readonly<{ window: number; rate: number }>

/**
 * Each kind's knee as edullm's ramp probe measured it (with each record): the smallest window at
 * the best rate, or the last before the first 429. The fake serves a kind as a bottleneck of that rate whose latency at
 * the knee is `window / rate`, so its delivery rate grows with the window up to the knee and is flat above it.
 */
export const MEASURED_KNEES: Readonly<Record<Kind, Knee>> = {
	listing: { window: listingKneeWindow, rate: listingKneeRate },
	"gap-by-report": { window: gapByReportKneeWindow, rate: gapByReportKneeRate },
	"gap-by-assignment": {
		window: gapByAssignmentKneeWindow,
		rate: gapByAssignmentKneeRate
	},
	"assignment-record": {
		window: assignmentRecordKneeWindow,
		rate: assignmentRecordKneeRate
	},
	review: { window: reviewKneeWindow, rate: reviewKneeRate }
}

/**
 * The gateway's throttle: once `requests` requests arrived in the trailing `windowMillis` (a second, as measured) it
 * answers 429 with API Gateway's own body and, as measured, no Retry-After. `retryAfter` is the header the fake adds
 * when a simulation wants one. A simulation draws `requests` from the measured range, never fixed
 * (throttleRequestsLeast and throttleRequestsMost).
 */
export type Throttle = Readonly<{
	requests: number
	windowMillis: number
	retryAfter: Option.Option<number>
}>

/** What a request meets besides its resource's answer: nothing, a transient status, or the transport failing. */
export type Weather =
	| Readonly<{ _tag: "Clear"; slowdown: number }>
	| Readonly<{ _tag: "Transient"; status: 408 | 500 | 502 | 503 | 504 }>
	| Readonly<{ _tag: "Transport" }>

/**
 * One AlphaTest as a simulation draws it: each kind's knee, the gateway's throttle and latency, the listing's rows,
 * each target's final status (a target not named answers 200), and the weather each request meets, drawn from the
 * nature at every read.
 */
export type World = Readonly<{
	knees: Readonly<Record<Kind, Knee>>
	throttle: Throttle
	gatewayMillis: number
	listingRows: number
	finals: HashMap.HashMap<string, number>
	weather: Gen<Weather>
}>

/** An HTTP exchange's end: the source's status, its exact bytes and its Retry-After header, or no response at all. */
export type Response =
	| Readonly<{
			_tag: "Answered"
			status: number
			body: Uint8Array
			retryAfter: Option.Option<string>
	  }>
	| Readonly<{ _tag: "TransportFailed" }>

/** A read's end and the instant it completed. */
export type Answered = Readonly<{ response: Response; at: number }>

/** One read as the fake's log holds it: what was asked, when, and how it ended. */
export type Logged = Readonly<{ request: Request; sentAt: number; answered: Answered }>

/** The fake AlphaTest: `read` answers a request sent at an instant; `log` is every read it answered, in order. */
export class AlphaTestApi extends Context.Service<
	AlphaTestApi,
	{
		readonly read: (request: Request, at: number) => Effect.Effect<Answered>
		readonly log: Effect.Effect<ReadonlyArray<Logged>>
	}
>()("@den/edullm/alphatest/AlphaTestApi") {}

/** What API Gateway's throttle answers with (edullm's `answers.ts`). */
const THROTTLED_TEXT = `{"message":"Too Many Requests"}`

/** A listing page's body: the listing's total, and the page's assignment ids, counted from 1. */
export const ListingBody = Schema.fromJsonString(
	Schema.Struct({ total: Schema.Int, rows: Schema.Array(Schema.String) })
)
export type ListingBody = typeof ListingBody.Type

/** A listing page's body read back: the one decoder of its bytes. */
export const listingOf = (body: Uint8Array) =>
	Schema.decodeEffect(ListingBody)(new TextDecoder().decode(body))

/** A document's body: its target and the world's one version of it. */
const documentBody = (request: Request) => new TextEncoder().encode(`${targetOf(request)} v1`)

const MILLIS_PER_SECOND = 1000

type State = Readonly<{
	arrivals: ReadonlyArray<number>
	freeAt: Readonly<Record<Kind, number>>
	log: ReadonlyArray<Logged>
}>

/** The resource's own answer to a request: its final status, and its body. */
const resourceAnswer = Effect.fnUntraced(function* (world: World, request: Request) {
	if (request.kind === "listing") {
		const size = Math.min(request.limit, listingPageRows)
		const first = (request.page - 1) * size
		const rows = Arr.map(
			Arr.filter(
				Array.from({ length: size }, (_, at) => first + 1 + at),
				(row) => row <= world.listingRows
			),
			(row) => String(row)
		)
		const text = yield* Schema.encodeEffect(ListingBody)({ total: world.listingRows, rows }).pipe(
			Effect.orDie
		)
		return { status: 200, body: new TextEncoder().encode(text) }
	}
	const status = Option.getOrElse(HashMap.get(world.finals, targetOf(request)), () => 200)
	return { status, body: status === 200 ? documentBody(request) : new Uint8Array() }
})

/** The fake over one world, its weather drawn from `nature`. */
export const makeAlphaTest = (
	world: World,
	nature: Nature
): Effect.Effect<AlphaTestApi["Service"]> =>
	Effect.gen(function* () {
		const state = yield* Ref.make<State>({
			arrivals: [],
			freeAt: {
				listing: 0,
				"gap-by-report": 0,
				"gap-by-assignment": 0,
				"assignment-record": 0,
				review: 0
			},
			log: []
		})
		const answer = (
			current: State,
			request: Request,
			at: number,
			resource: Readonly<{ status: number; body: Uint8Array }>,
			weather: Weather
		): readonly [Answered, State] => {
			const recent = Arr.filter(
				current.arrivals,
				(arrival) => arrival > at - world.throttle.windowMillis && arrival <= at
			)
			const arrivals = [...recent, at]
			if (recent.length >= world.throttle.requests) {
				return [
					{
						response: {
							_tag: "Answered",
							status: 429,
							body: new TextEncoder().encode(THROTTLED_TEXT),
							retryAfter: Option.map(world.throttle.retryAfter, String)
						},
						at: Math.round(at + world.gatewayMillis)
					},
					{ ...current, arrivals }
				]
			}
			const knee = world.knees[request.kind]
			const latency = (knee.window / knee.rate) * MILLIS_PER_SECOND
			switch (weather._tag) {
				case "Transport":
					return [
						{ response: { _tag: "TransportFailed" }, at: Math.round(at + latency) },
						{ ...current, arrivals }
					]
				case "Transient":
					return [
						{
							response: {
								_tag: "Answered",
								status: weather.status,
								body: new Uint8Array(),
								retryAfter: Option.none()
							},
							at: Math.round(at + latency)
						},
						{ ...current, arrivals }
					]
				case "Clear": {
					const done = Math.round(
						Math.max(
							at + latency * weather.slowdown,
							current.freeAt[request.kind] + MILLIS_PER_SECOND / knee.rate
						)
					)
					const { status, body } = resource
					return [
						{ response: { _tag: "Answered", status, body, retryAfter: Option.none() }, at: done },
						{ ...current, arrivals, freeAt: { ...current.freeAt, [request.kind]: done } }
					]
				}
			}
		}
		return {
			read: Effect.fnUntraced(function* (request: Request, at: number) {
				const resource = yield* resourceAnswer(world, request)
				const weather = nature.draw(world.weather)
				return yield* Ref.modify(state, (current) => {
					const [answered, next] = answer(current, request, at, resource, weather)
					return [answered, { ...next, log: [...next.log, { request, sentAt: at, answered }] }]
				})
			}),
			log: Effect.map(Ref.get(state), (current) => current.log)
		}
	})

/** The fake as a layer. */
export const alphaTestLayer = (world: World, nature: Nature): Layer.Layer<AlphaTestApi> =>
	Layer.effect(AlphaTestApi, makeAlphaTest(world, nature))

/** What one AlphaTest status makes of its read (edullm's `answers.ts`, the one home of the classification). */
export type Classified =
	| Readonly<{
			finality: "final"
			disposition: "success" | "redirect" | "forbidden" | "not-found" | "rejected"
	  }>
	| Readonly<{ finality: "unfinished"; cause: "credential" | "transient" | "throttled" }>

/**
 * Every status by its interval: a 2xx succeeds, a redirect is never followed, a 403, 404 or 410 is the resource's
 * answer; a 401 refuses our credential; a 408 or a 5xx is transient; a 429 is the throttle; any other status is a final
 * refusal.
 */
export const classify = (status: number): Classified => {
	if (status >= 200 && status <= 299) {
		return { finality: "final", disposition: "success" }
	}
	if (status >= 300 && status <= 399) {
		return { finality: "final", disposition: "redirect" }
	}
	if (status === 403) {
		return { finality: "final", disposition: "forbidden" }
	}
	if (status === 404 || status === 410) {
		return { finality: "final", disposition: "not-found" }
	}
	if (status === 401) {
		return { finality: "unfinished", cause: "credential" }
	}
	if (status === 429) {
		return { finality: "unfinished", cause: "throttled" }
	}
	return status === 408 || (status >= 500 && status <= 599)
		? { finality: "unfinished", cause: "transient" }
		: { finality: "final", disposition: "rejected" }
}
