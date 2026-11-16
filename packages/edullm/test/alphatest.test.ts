import { type Case, drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
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
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, HashMap, Option } from "effect"
import { listingPageRows, throttleRequestsMost } from "#alphatest.ts"
import {
	AlphaTestApi,
	classify,
	KINDS,
	type Kind,
	listingOf,
	type Logged,
	makeAlphaTest,
	MEASURED_KNEES,
	type Request,
	targetOf,
	type Weather,
	type World
} from "#alphatest.ts"
import { exploration, law } from "#test/support/search.ts"

/** A world and a schedule of reads sent at increasing instants. */
type Scenario = Readonly<{
	world: World
	reads: ReadonlyArray<Readonly<{ request: Request; gap: number }>>
}>

type Seen =
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

const scenarioGen: Gen<Scenario> = (source) => {
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

const judged = (scenario: Scenario, log: ReadonlyArray<Logged>, c: Case<Seen>) =>
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
type Loop = Readonly<{
	kind: Exclude<Kind, "listing">
	window: number
	requests: number
	gateway: World["throttle"]
}>

type LoopSeen = "below-knee" | "at-knee" | "above-knee"

/** The completion instants of a closed loop at its window, in order. */
const closedLoop = (loop: Loop) =>
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

describe("the AlphaTest fake", () => {
	it.effect(
		"delivers each kind at a rate that grows with the window up to its knee and is flat above it",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "alphatest: knees",
						draw: drawn((source): Loop => {
							const kind = source.draw(
								element([
									"gap-by-report",
									"gap-by-assignment",
									"assignment-record",
									"review"
								] as const)
							)
							const window = source.draw(int(1, 2 * MEASURED_KNEES[kind].window))
							return {
								kind,
								window,
								requests: 200 * window,
								gateway: {
									requests: Number.POSITIVE_INFINITY,
									windowMillis: source.draw(production(1000, [500])),
									retryAfter: Option.none()
								}
							}
						}),
						coverage: required<LoopSeen>(["below-knee", "at-knee", "above-knee"], {
							cases: 60,
							sense: notesOnly
						}),
						runs: 120,
						shrink: 60,
						oracle: {
							kind: "specification",
							name: "a bottleneck of the measured rate whose latency at the knee is window ÷ rate: min(window, knee) ÷ knee of the rate"
						}
					}),
					(loop: Loop, c: Case<LoopSeen>) =>
						Effect.gen(function* () {
							const knee = MEASURED_KNEES[loop.kind]
							c.note(
								loop.window < knee.window
									? "below-knee"
									: loop.window === knee.window
										? "at-knee"
										: "above-knee"
							)
							const done = yield* closedLoop(loop)
							const steady = Arr.drop(done, Math.floor(done.length / 2))
							const span =
								Arr.last(steady).pipe(Option.getOrElse(() => 0)) -
								Arr.head(steady).pipe(Option.getOrElse(() => 0))
							const rate = ((steady.length - 1) * 1000) / span
							const expected = (Math.min(loop.window, knee.window) / knee.window) * knee.rate
							yield* law(
								"knee",
								Math.abs(rate - expected) <= expected / 50,
								() =>
									`${loop.kind} at window ${String(loop.window)} delivered ${String(rate)} a second, its knee says ${String(expected)}`
							)
						}).pipe(
							Effect.provideServiceEffect(
								AlphaTestApi,
								makeAlphaTest(
									{
										knees: MEASURED_KNEES,
										throttle: loop.gateway,
										gatewayMillis: 1,
										listingRows: 0,
										finals: HashMap.empty(),
										weather: constant({ _tag: "Clear", slowdown: 1 })
									},
									c
								)
							)
						)
				)
			)
	)

	it.effect(
		"throttles past its threshold in the trailing second, and answers each resource's own final status",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "alphatest: gateway and resources",
						draw: drawn(scenarioGen),
						coverage: required<Seen>(
							[
								"throttled",
								"retry-after",
								"not-found",
								"redirect",
								"forbidden",
								"transient",
								"transport",
								"listing-partial",
								"listing-past-end",
								"listing-capped"
							],
							{ cases: 200, sense: notesOnly }
						),
						runs: 400,
						shrink: 200,
						oracle: {
							kind: "specification",
							name: "API Gateway's trailing-second throttle, a listing of 200-row pages, each target's one final status"
						}
					}),
					(scenario: Scenario, c: Case<Seen>) =>
						Effect.gen(function* () {
							const api = yield* AlphaTestApi
							let at = 0
							for (const read of scenario.reads) {
								at += read.gap
								yield* api.read(read.request, at)
							}
							const log = yield* api.log
							yield* judged(scenario, log, c)
						}).pipe(Effect.provideServiceEffect(AlphaTestApi, makeAlphaTest(scenario.world, c)))
				)
			)
	)
})
