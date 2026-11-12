import type { Gen } from "@den/testing/gen"
import { Array as Arr, Context, Effect, HashMap, Layer, Option, Ref, Schema } from "effect"
import type { Nature } from "#nature.ts"

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
 * Each kind's knee as edullm's ramp probe measured it: the smallest window at the best rate, or the last before the
 * first 429. The fake serves a kind as a bottleneck of that rate whose latency at the knee is `window / rate`, so its
 * delivery rate grows with the window up to the knee and is flat above it.
 *
 * @limitKind measured
 * @owner AlphaTest's API, as edullm's acquisition met it
 * @unit requests in flight, and requests a second
 * @scope one request kind of the AlphaTest fake
 * @evidence edullm `packages/platform/pipeline/src/limits.ts` `ALPHATEST_KNEE` (read at edullm staging 903bad4ba), and
 * den's `docs/research/edullm-kernel.md` §3.2
 * @observed 2026-11-01 02:08–02:29Z
 * @environment the operator's VM, not iad1, against AlphaTest's production API Gateway
 * @workload a ramp probe of each kind alone, the window raised one step at a time
 * @result listing w 2 at 0.56 req/s (2,538 ms); gap-by-report w 4 at 20.684 (109 ms); gap-by-assignment w 9 at 45.344
 * (73 ms); assignment-record w 7 at 36.654 (78 ms); review w 9 at 45.885 (81 ms); 429s at about 59–68 req/s
 * @decision the window and the rate are kept; the latency the probe printed is not Little's law's window ÷ rate (2 ÷
 * 0.56 is 3.57 s, not 2.538 s), so the fake's latency at the knee is derived from the two it keeps
 * @revalidate a new ramp probe, a probe from iad1, or AlphaTest moving off API Gateway
 */
export const MEASURED_KNEES: Readonly<Record<Kind, Knee>> = {
	listing: { window: 2, rate: 0.56 },
	"gap-by-report": { window: 4, rate: 20.684 },
	"gap-by-assignment": { window: 9, rate: 45.344 },
	"assignment-record": { window: 7, rate: 36.654 },
	review: { window: 9, rate: 45.885 }
}

/**
 * How many rows a listing page holds at most, whatever `limit` asks for.
 *
 * @limitKind measured
 * @owner AlphaTest's listing endpoint (`/delivery/teacher/all-assignments`)
 * @unit rows a page
 * @scope one listing page of the AlphaTest fake
 * @evidence edullm `packages/platform/pipeline/src/limits.ts` `ALPHATEST_LISTING_PAGE_ROWS`, and den's
 * `docs/research/edullm-kernel.md` §3.2
 * @observed 2026-11-01, edullm's listing probe
 * @environment AlphaTest's production API Gateway
 * @workload the whole listing, every `limit` of at least 200
 * @result every limit ≥ 200 returned 200 rows; 254,249 rows in 1,272 pages; latency independent of size and depth
 * @decision the page holds `min(limit, 200)` rows
 * @revalidate a listing that answers more than 200 rows to a larger limit
 */
export const LISTING_PAGE_ROWS = 200

/**
 * The gateway's throttle: once `requests` requests arrived in the trailing `windowMillis` (a second, as measured) it
 * answers 429 with API Gateway's own body and, as measured, no Retry-After. `retryAfter` is the header the fake adds
 * when a simulation wants one.
 *
 * @limitKind measured
 * @owner AlphaTest's API Gateway stage
 * @unit requests in the trailing second, across every kind
 * @scope the AlphaTest fake's gateway
 * @evidence edullm `packages/data/alphatest-acquisition/src/answers.ts` (the 429's body and missing header) and
 * `packages/platform/pipeline/src/limits.ts` `ALPHATEST_KNEE`; den's `docs/research/edullm-kernel.md` §3.2 and §5
 * @observed 2026-10-09 06:14:37–06:15:29Z (991 429s), 2026-11-01 02:08–02:29Z (the ramp probe)
 * @environment Vercel iad1 (2026-10-09) and the operator's VM (2026-11-01) against AlphaTest's production gateway
 * @workload eight readers of every kind (2026-10-09); one kind at a time (2026-11-01)
 * @result 429s at 40–58 answers a second (2026-10-09) and at about 59–68 requests a second (2026-11-01)
 * @decision the threshold is drawn by the simulation from the measured range, 40 to 68, never fixed
 * @revalidate a 429 outside that range, or a Retry-After seen on one
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
		const size = Math.min(request.limit, LISTING_PAGE_ROWS)
		const first = (request.page - 1) * size
		const rows = Arr.map(
			Arr.filter(Arr.range(first + 1, first + size), (row) => row <= world.listingRows),
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
