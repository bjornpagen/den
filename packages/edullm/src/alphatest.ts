import type { Gen } from "@bjornpagen/testing/gen"
import {
	assignmentRecordKneeRate,
	assignmentRecordKneeWindow,
	gapByAssignmentKneeRate,
	gapByAssignmentKneeWindow,
	gapByReportKneeRate,
	gapByReportKneeWindow,
	listingKneeRate,
	listingKneeWindow,
	listingPageRows,
	reviewKneeRate,
	reviewKneeWindow
} from "@den/limits/alphatest"
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
 * Each kind's knee as edullm's ramp probe measured it (@den/limits/alphatest, with each record): the smallest window at
 * the best rate, or the last before the first 429. The fake serves a kind as a bottleneck of that rate whose latency at
 * the knee is `window / rate`, so its delivery rate grows with the window up to the knee and is flat above it.
 */
export const MEASURED_KNEES: Readonly<Record<Kind, Knee>> = {
	listing: { window: listingKneeWindow.value, rate: listingKneeRate.value },
	"gap-by-report": { window: gapByReportKneeWindow.value, rate: gapByReportKneeRate.value },
	"gap-by-assignment": {
		window: gapByAssignmentKneeWindow.value,
		rate: gapByAssignmentKneeRate.value
	},
	"assignment-record": {
		window: assignmentRecordKneeWindow.value,
		rate: assignmentRecordKneeRate.value
	},
	review: { window: reviewKneeWindow.value, rate: reviewKneeRate.value }
}

/**
 * The gateway's throttle: once `requests` requests arrived in the trailing `windowMillis` (a second, as measured) it
 * answers 429 with API Gateway's own body and, as measured, no Retry-After. `retryAfter` is the header the fake adds
 * when a simulation wants one. A simulation draws `requests` from the measured range, never fixed
 * (@den/limits/alphatest's throttleRequestsLeast and throttleRequestsMost).
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
		const size = Math.min(request.limit, listingPageRows.value)
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
