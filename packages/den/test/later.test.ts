import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { element, type Gen, int, oneOf } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, describe, it } from "@effect/vitest"
import { DateTime, Effect, Formatter, Option, String as Str } from "effect"
import { laterOf } from "#algebra/later.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * A source's named delay, parsed at the boundary: a `Retry-After` of delay-seconds is that many seconds; one of an
 * IMF-fixdate is the time from the response's `Date` to it, none once it has passed; and a response that names no
 * delay, names it in a form no sender may generate (rfc850, asctime), names a day no calendar holds or a weekday not
 * the date's own, or dates its delay with no `Date`, states no `Later`.
 *
 * Oracle (second implementation): each header written here from the delay drawn, every date spelled from its parts by
 * RFC 9110's grammar, and the delay it states computed from the draw.
 */

type Feature = "delay-seconds" | "an HTTP-date" | "a date passed" | "no stated delay"

/** A response's headers as the case writes them, and the delay in milliseconds they state, if they state one. */
interface Response {
	readonly headers: Readonly<Record<string, string>>
	readonly stated: Option.Option<number>
	readonly feature: Feature
}

const DAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"] as const
const MONTHS = [
	"Jan",
	"Feb",
	"Mar",
	"Apr",
	"May",
	"Jun",
	"Jul",
	"Aug",
	"Sep",
	"Oct",
	"Nov",
	"Dec"
] as const

const two = (n: number): string => Str.padStart(2, "0")(String(n))

/** An instant's IMF-fixdate, spelled from its UTC parts: `Sun, 06 Nov 1994 08:49:37 GMT`. */
const imf = (seconds: number): string => {
	const p = DateTime.toPartsUtc(DateTime.makeUnsafe(seconds * 1000))
	return `${DAYS[p.weekDay]}, ${two(p.day)} ${MONTHS[p.month - 1]} ${String(p.year)} ${two(p.hour)}:${two(p.minute)}:${two(p.second)} GMT`
}

/** An instant a response is sent at, in seconds since the epoch: 1970 to 2096. */
const sentAt: Gen<number> = int(0, 4_000_000_000)

const responses: Gen<Response> = oneOf<Response>([
	(source) => {
		const seconds = source.draw(int(0, 1_000_000))
		return {
			headers: { "retry-after": String(seconds) },
			stated: Option.some(seconds * 1000),
			feature: "delay-seconds"
		}
	},
	(source) => {
		const sent = source.draw(sentAt)
		const later = source.draw(int(-3600, 100_000))
		return {
			headers: { "retry-after": imf(sent + later), date: imf(sent) },
			stated: Option.some(Math.max(0, later) * 1000),
			feature: later < 0 ? "a date passed" : "an HTTP-date"
		}
	},
	(source) => {
		const sent = source.draw(sentAt)
		const headers = source.draw(
			element<Readonly<Record<string, string>>>([
				{},
				{ "retry-after": "" },
				{ "retry-after": "soon" },
				{ "retry-after": "-5" },
				{ "retry-after": "1.5" },
				{ "retry-after": imf(sent + 60) },
				{ "retry-after": "Sunday, 06-Nov-94 08:49:37 GMT", date: imf(sent) },
				{ "retry-after": "Sun Nov  6 08:49:37 1994", date: imf(sent) },
				{ "retry-after": "Sun, 31 Feb 2026 00:00:00 GMT", date: imf(sent) },
				{ "retry-after": "Mon, 06 Nov 1994 08:49:37 GMT", date: imf(sent) },
				{ "retry-after": "Sun, 06 Nov 1994 08:49:37 GMT", date: "yesterday" }
			])
		)
		return { headers, stated: Option.none(), feature: "no stated delay" }
	}
])

describe("a source's named delay", () => {
	it.effect("parses Retry-After's delay-seconds and IMF-fixdate, and states nothing else", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "a source's named delay",
					oracle: {
						kind: "second-implementation",
						name: "headers written from the drawn delay by RFC 9110's grammar"
					},
					draw: drawn(responses),
					literal: Formatter.format,
					coverage: required<Feature>(
						["delay-seconds", "an HTTP-date", "a date passed", "no stated delay"],
						{ cases: 80, sense: notesOnly }
					),
					kept: [],
					runs: 200,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				(response, c) =>
					Effect.sync(() => {
						c.note(response.feature)
						assert.deepStrictEqual(
							Option.map(laterOf(new Headers(response.headers)), (later) => Number(later.after)),
							response.stated
						)
					})
			)
		)
	)
})
