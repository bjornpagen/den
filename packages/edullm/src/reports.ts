import type { Gen } from "@den/testing/gen"
import { Context, Effect, HashMap, HashSet, Layer, Option, Ref } from "effect"
import type { Nature } from "#nature.ts"

/**
 * Timeback's Caliper endpoint as edullm's W6 meets it: a report is sent as one event under its report's id, and
 * Timeback keeps the first it accepts, so a delivery made again (a queue redelivery, a stretch's message and its
 * report's redrive overlapping) records nothing new and is answered as accepted. The endpoint is down for a while (its
 * outage ends at an instant the world names), fails on its own now and then, and refuses a report built wrong every
 * time. Every call takes the instant it was sent at.
 */

/** What one send meets on its own, besides the outage: an answer, a server error, a 403, or the transport failing. */
export type Weather = "answered" | "server-error" | "forbidden" | "transport"

/**
 * One Timeback endpoint as a simulation draws it: the instant its outage ends (every send before it answers 503), the
 * reports it refuses as built (400 on every send), and each send's weather.
 */
export type World = Readonly<{
	outageEndsAt: number
	malformed: HashSet.HashSet<string>
	weather: Gen<Weather>
}>

/** A send's end: the status Timeback answered, or no response. */
export type Sent =
	| Readonly<{ _tag: "Answered"; status: 200 | 400 | 403 | 500 | 503 }>
	| Readonly<{ _tag: "TransportFailed" }>

/** The fake endpoint: `send` delivers a report's event; `accepted` is every report Timeback holds, with its first acceptance. */
export class TimebackReports extends Context.Service<
	TimebackReports,
	{
		readonly send: (reportId: string, at: number) => Effect.Effect<Sent>
		readonly accepted: Effect.Effect<HashMap.HashMap<string, number>>
	}
>()("@den/edullm/reports/TimebackReports") {}

/** The fake over one world, each send's weather drawn from `nature`. */
export const makeReports = (
	world: World,
	nature: Nature
): Effect.Effect<TimebackReports["Service"]> =>
	Effect.gen(function* () {
		const accepted = yield* Ref.make(HashMap.empty<string, number>())
		return TimebackReports.of({
			send: (reportId, at) =>
				Effect.gen(function* () {
					const weather = nature.draw(world.weather)
					if (weather === "transport") {
						return { _tag: "TransportFailed" } satisfies Sent
					}
					if (at < world.outageEndsAt) {
						return { _tag: "Answered", status: 503 } satisfies Sent
					}
					if (weather === "server-error") {
						return { _tag: "Answered", status: 500 } satisfies Sent
					}
					if (weather === "forbidden") {
						return { _tag: "Answered", status: 403 } satisfies Sent
					}
					if (HashSet.has(world.malformed, reportId)) {
						return { _tag: "Answered", status: 400 } satisfies Sent
					}
					yield* Ref.update(accepted, (held) =>
						Option.isSome(HashMap.get(held, reportId)) ? held : HashMap.set(held, reportId, at)
					)
					return { _tag: "Answered", status: 200 } satisfies Sent
				}),
			accepted: Ref.get(accepted)
		})
	})

/** The fake as a layer. */
export const reportsLayer = (world: World, nature: Nature): Layer.Layer<TimebackReports> =>
	Layer.effect(TimebackReports, makeReports(world, nature))
