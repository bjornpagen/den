import type { Gen } from "@bjornpagen/testing/gen"
import { Array as Arr, Context, Effect, Layer, Option, Order, Ref, Schema } from "effect"
import type { Nature } from "#nature.ts"

/**
 * The most documents one page of a list may hold, on every list endpoint's `limit` parameter.
 *
 * @limitKind published
 * @owner the QTI REST API, the list endpoints' `limit` parameter
 * @unit documents a page
 * @scope one `after` page of one collection's list read
 * @constraint hard quota
 * @source https://qti.alpha-1edtech.ai/openapi.yaml
 * @quote name: limit schema: default: 10 description: Number of items per page [...] type: integer minimum: 1 maximum:
 *   1000
 * @verified 2026-11-16
 */
const qtiPageLimit = 1000

/**
 * The QTI REST API as edullm's W3 reads it: three collections, each listed by an `after` cursor chain over a frozen
 * `updatedAt` window. A page holds the next documents after the position in identifier order, and its `next` names the
 * position after it, or is null at the end of the list. The source keeps changing while a chain runs: a document
 * updated past the window's end leaves it, a new one may join it. The API is an Express service, not API Gateway: it
 * may answer 408, 429 or a 5xx with or without a Retry-After, and refuse a request outright.
 */

/** The collections the sync reads (edullm's `QTI_COLLECTIONS`, the three list endpoints of the QTI API). */
export const COLLECTIONS = ["assessment-items", "assessment-tests", "stimuli"] as const
export type Collection = (typeof COLLECTIONS)[number]

/** A document as the source holds it: its identifier and when it last changed. */
export type Document = Readonly<{ id: string; updatedAt: number }>

/** One job's frozen window: the documents whose `updatedAt` lies in `[since, upper)`. */
export type Window = Readonly<{ since: number; upper: number }>

/** One page request of one collection's chain: `after` is empty on the first page, then the previous page's `next`. */
export type PageRequest = Readonly<{
	collection: Collection
	window: Window
	after: string
	limit: number
}>

/** A page's body as the API writes it: its documents, and the position of the next page, null at the end. */
export const PageBody = Schema.fromJsonString(
	Schema.Struct({
		items: Schema.Array(Schema.Struct({ id: Schema.String, updatedAt: Schema.Finite })),
		next: Schema.NullOr(Schema.String)
	})
)
export type PageBody = typeof PageBody.Type

/** A page's body read back: the one decoder of its bytes. */
export const pageOf = (body: Uint8Array) =>
	Schema.decodeEffect(PageBody)(new TextDecoder().decode(body))

/** What a page read meets besides the list: nothing, an unfinished answer, a refusal, or the transport failing. */
export type Weather =
	| Readonly<{ _tag: "Clear" }>
	| Readonly<{
			_tag: "Unfinished"
			status: 408 | 429 | 500 | 503
			retryAfter: Option.Option<number>
	  }>
	| Readonly<{ _tag: "Refused"; status: 400 | 403 | 404 }>
	| Readonly<{ _tag: "Transport" }>

/** One QTI API as a simulation draws it: each collection's documents, and the weather each page read meets. */
export type World = Readonly<{
	documents: Readonly<Record<Collection, ReadonlyArray<Document>>>
	weather: Gen<Weather>
}>

/** An HTTP exchange's end: a status, the exact body and the Retry-After header, or no response. */
export type Response =
	| Readonly<{
			_tag: "Answered"
			status: number
			body: Uint8Array
			retryAfter: Option.Option<string>
	  }>
	| Readonly<{ _tag: "TransportFailed" }>

/** The fake QTI API: `page` answers one `after` page; `edit` is the source changing a document between pages. */
export class QtiApi extends Context.Service<
	QtiApi,
	{
		readonly page: (request: PageRequest) => Effect.Effect<Response>
		readonly edit: (collection: Collection, document: Document) => Effect.Effect<void>
	}
>()("@den/edullm/qti/QtiApi") {}

/** The documents of a page: the first `limit` after the position, in identifier order, whose clock is in the window. */
const listed = (documents: ReadonlyArray<Document>, request: PageRequest) =>
	Arr.filter(
		Arr.sort(
			documents,
			Order.mapInput(Order.String, (document: Document) => document.id)
		),
		(document) =>
			document.id > request.after &&
			document.updatedAt >= request.window.since &&
			document.updatedAt < request.window.upper
	)

/** The fake over one world, its weather drawn from `nature`. */
export const makeQti = (world: World, nature: Nature): Effect.Effect<QtiApi["Service"]> =>
	Effect.gen(function* () {
		const documents = yield* Ref.make(world.documents)
		return QtiApi.of({
			page: Effect.fnUntraced(function* (request: PageRequest) {
				const weather = nature.draw(world.weather)
				switch (weather._tag) {
					case "Transport":
						return { _tag: "TransportFailed" } satisfies Response
					case "Unfinished":
						return {
							_tag: "Answered",
							status: weather.status,
							body: new Uint8Array(),
							retryAfter: Option.map(weather.retryAfter, String)
						} satisfies Response
					case "Refused":
						return {
							_tag: "Answered",
							status: weather.status,
							body: new Uint8Array(),
							retryAfter: Option.none()
						} satisfies Response
					case "Clear":
						break
				}
				const held = yield* Ref.get(documents)
				const matching = listed(held[request.collection], request)
				const items = Arr.take(matching, Math.min(request.limit, qtiPageLimit))
				const next =
					matching.length > items.length
						? Option.map(Arr.last(items), (last) => last.id)
						: Option.none()
				const text = yield* Schema.encodeEffect(PageBody)({
					items,
					next: Option.getOrNull(next)
				}).pipe(Effect.orDie)
				return {
					_tag: "Answered",
					status: 200,
					body: new TextEncoder().encode(text),
					retryAfter: Option.none()
				} satisfies Response
			}),
			edit: (collection, document) =>
				Ref.update(documents, (held) => ({
					...held,
					[collection]: [
						...Arr.filter(held[collection], (other) => other.id !== document.id),
						document
					]
				}))
		})
	})

/** The fake as a layer. */
export const qtiLayer = (world: World, nature: Nature): Layer.Layer<QtiApi> =>
	Layer.effect(QtiApi, makeQti(world, nature))
