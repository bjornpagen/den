/** What the properties of alphatest.test.ts read: its spaces, models and helpers. */

import {
	array,
	constant,
	element,
	type Gen,
	int,
	option,
	production,
	weighted
} from "@bjornpagen/testing/gen"
import type { Case } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, HashMap, Option } from "effect"
import { listingPageRows, throttleRequestsMost } from "#alphatest.ts"
import {
	AlphaTestApi,
	classify,
	type Kind,
	KINDS,
	listingOf,
	type Logged,
	MEASURED_KNEES,
	type Request,
	targetOf,
	type Weather,
	type World
} from "#alphatest.ts"
import { law } from "#test/support/law.ts"

/** A world and a schedule of reads sent at increasing instants. */
export type Scenario = Readonly<{
	world: World
	reads: ReadonlyArray<Readonly<{ request: Request; gap: number }>>
}>

export type Seen =
	| "throttled"
	| "retry-after"
	| "not-found"
	| "redirect"
	| "forbidden"
	| "transient"
	| "transport"
	| "listing-partial"
	| "listing-past-end"
	| "listing-capped"

const weatherGen: Gen<Weather> = weighted<Weather>([
	[12, (source) => ({ _tag: "Clear", slowdown: source.draw(int(1, 3)) })],
	[
		1,
		(source) => ({
			_tag: "Transient",
			status: source.draw(element([500, 502, 503, 504, 408] as const))
		})
	],
	[1, constant({ _tag: "Transport" })]
])

const FINAL_STATUSES = [200, 301, 403, 404, 410, 400] as const

const requestGen = (targets: number): Gen<Request> =>
	weighted<Request>([
		[
			1,
			(source) => ({
				kind: "listing",
				page: source.draw(int(1, 6)),
				limit: source.draw(production(listingPageRows, [50, 250, 1000]))
			})
		],
		[
			4,
			(source) => ({
				kind: source.draw(
					element(["gap-by-report", "gap-by-assignment", "assignment-record", "review"] as const)
				),
				target: String(source.draw(int(1, targets)))
			})
		]
	])

export const scenarioGen: Gen<Scenario> = (source) => {
	const targets = source.draw(int(1, 6))
	const finals = Arr.flatMap(
		Array.from({ length: targets }, (_, at) => at + 1),
		(target) =>
			Arr.map(
				Arr.filter(KINDS, (kind): kind is Exclude<Kind, "listing"> => kind !== "listing"),
				(kind) => [`${kind}/${String(target)}`, source.draw(element(FINAL_STATUSES))] as const
			)
	)
	return {
		world: {
			knees: MEASURED_KNEES,
			throttle: {
				requests: source.draw(int(1, throttleRequestsMost)),
				windowMillis: source.draw(production(1000, [500, 2000])),
				retryAfter: source.draw(option(int(1, 30)))
			},
			gatewayMillis: source.draw(int(1, 50)),
			listingRows: source.draw(int(0, 1200)),
			finals: HashMap.fromIterable(finals),
			weather: weatherGen
		},
		reads: source.draw(
			array(
				(s) => ({
					request: s.draw(requestGen(targets)),
					gap: s.draw(
						weighted([
							[3, int(0, 5)],
							[1, int(0, 2000)]
						])
					)
				}),
				{
					min: 1,
					max: 80
				}
			)
		)
	}
}

/** Whether the gateway should have throttled a read: as many reads as its threshold in the trailing window before it. */
const throttledBySpec = (
	log: ReadonlyArray<Logged>,
	at: number,
	index: number,
	throttle: World["throttle"]
) =>
	Arr.filter(
		Arr.take(log, index),
		(earlier) => earlier.sentAt > at - throttle.windowMillis && earlier.sentAt <= at
	).length >= throttle.requests

export const judged = (scenario: Scenario, log: ReadonlyArray<Logged>, c: Case<Seen>) =>
	Effect.gen(function* () {
		const { world } = scenario
		for (const [index, read] of log.entries()) {
			const { response } = read.answered
			yield* law(
				"answers after it was asked",
				read.answered.at >= read.sentAt,
				() => "an answer completed before its request"
			)
			if (response._tag === "TransportFailed") {
				c.note("transport")
				continue
			}
			const throttled = throttledBySpec(log, read.sentAt, index, world.throttle)
			yield* law(
				"throttle",
				(response.status === 429) === throttled,
				() =>
					`read ${String(index)} answered ${String(response.status)}; the gateway's threshold says ${throttled ? "429" : "not 429"}`
			)
			if (response.status === 429) {
				c.note("throttled")
				if (Option.isSome(response.retryAfter)) {
					c.note("retry-after")
				}
				yield* law(
					"Retry-After only where the world sends one",
					Option.isSome(response.retryAfter) === Option.isSome(world.throttle.retryAfter),
					() => "a 429's Retry-After differs from the world's"
				)
				continue
			}
			const classified = classify(response.status)
			if (classified.finality === "unfinished") {
				c.note("transient")
				continue
			}
			if (read.request.kind === "listing") {
				const page = yield* listingOf(response.body)
				const size = Math.min(read.request.limit, listingPageRows)
				const first = (read.request.page - 1) * size
				const expected = Math.max(0, Math.min(size, world.listingRows - first))
				if (expected === 0) {
					c.note("listing-past-end")
				} else if (expected < size) {
					c.note("listing-partial")
				} else if (read.request.limit > listingPageRows) {
					c.note("listing-capped")
				}
				yield* law(
					"listing pages",
					page.total === world.listingRows &&
						page.rows.length === expected &&
						Arr.every(page.rows, (row, at) => Number(row) === first + at + 1),
					() =>
						`page ${String(read.request.kind === "listing" ? read.request.page : 0)} held ${String(page.rows.length)} rows`
				)
				continue
			}
			const status = Option.getOrElse(HashMap.get(world.finals, targetOf(read.request)), () => 200)
			if (
				classified.disposition === "not-found" ||
				classified.disposition === "redirect" ||
				classified.disposition === "forbidden"
			) {
				c.note(classified.disposition)
			}
			yield* law(
				"a final answer is final",
				response.status === status,
				() =>
					`${targetOf(read.request)} answered ${String(response.status)}, its resource ${String(status)}`
			)
		}
	})

/**
 * One kind read with a constant window: as many requests in flight as the window, one sent as each ends. Two hundred
 * rounds of the window put the steady half's endpoint error under one percent.
 */
export type Loop = Readonly<{
	kind: Exclude<Kind, "listing">
	window: number
	requests: number
	gateway: World["throttle"]
}>

export type LoopSeen = "below-knee" | "at-knee" | "above-knee"

/** The completion instants of a closed loop at its window, in order. */
export const closedLoop = (loop: Loop) =>
	Effect.gen(function* () {
		const api = yield* AlphaTestApi
		const pending: Array<number> = []
		const done: Array<number> = []
		let sent = 0
		while (sent < loop.requests || Arr.isReadonlyArrayNonEmpty(pending)) {
			const now = Option.getOrElse(Arr.last(done), () => 0)
			while (sent < loop.requests && pending.length < loop.window) {
				sent += 1
				const answered = yield* api.read({ kind: loop.kind, target: String(sent) }, now)
				pending.push(answered.at)
			}
			const next = Arr.reduce(pending, Number.POSITIVE_INFINITY, (least, at) => Math.min(least, at))
			pending.splice(pending.indexOf(next), 1)
			done.push(next)
		}
		return done
	})
