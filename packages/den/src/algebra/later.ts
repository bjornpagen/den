import { regex } from "arkregex"
import { Array as Arr, Data, DateTime, Option } from "effect"
import { type Delay, delayOf } from "#runtime/identity.ts"

/**
 * A source's "not now": a body whose outside source refused its call for now and named when to call again (an
 * Anthropic 429's `retry-after`, Timeback's `Retry-After`) fails with `Later`, beside its step's typed error. Its
 * attempt ends waiting, spends nothing on its ladder, as a transient refusal spends nothing, and its next attempt is
 * due `after` past the database's reading in the write that records it, so a rate limit's wait is the source's own and
 * never a sleep inside a turn or a rung of den's ladder. A source that names no delay (an Anthropic 529) states no
 * `Later`: its body's failure is a spent attempt, which the ladder backs off.
 */
export class Later extends Data.TaggedError("Later")<{ readonly after: Delay }> {}

/**
 * HTTP's `Retry-After` value, RFC 9110 section 10.2.3: delay-seconds, a run of digits, or an HTTP-date, which a sender
 * generates as an IMF-fixdate (section 5.6.7). The obsolete rfc850 and asctime dates, which no sender may generate,
 * parse as no stated delay.
 */
const DELAY_SECONDS = regex("^[0-9]+$")
const IMF_FIXDATE = regex(
	"^([A-Z][a-z]{2}), ([0-9]{2}) ([A-Z][a-z]{2}) ([0-9]{4}) ([0-9]{2}):([0-9]{2}):([0-9]{2}) GMT$"
)

/**
 * The days of the week and the months of an IMF-fixdate, each in its order: Sunday first, as a UTC date's day is
 * counted, and January first.
 *
 * @formatConstant RFC 9110 section 5.6.7's day and month names
 */
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

/**
 * Milliseconds in a second, the unit delay-seconds counts in.
 *
 * @formatConstant a second is 1000 milliseconds
 */
const MILLIS_PER_SECOND = 1000

/**
 * The instant an IMF-fixdate names, in milliseconds since the epoch: none for any other text, or for a date no
 * calendar holds or whose day of the week is not its own.
 */
const fixdate = (text: string): Option.Option<number> =>
	Option.flatMap(Option.fromNullishOr(IMF_FIXDATE.exec(text)), (m) => {
		const [, day, date, month, year, hour, minute, second] = m
		return Option.flatMap(
			Arr.findFirstIndex(MONTHS, (name) => name === month),
			(index) => {
				const stated = {
					year: Number(year),
					month: index + 1,
					day: Number(date),
					hour: Number(hour),
					minute: Number(minute),
					second: Number(second),
					millisecond: 0
				}
				return Option.flatMap(DateTime.make(stated), (named) => {
					const parts = DateTime.toPartsUtc(named)
					return DAYS[parts.weekDay] === day &&
						parts.year === stated.year &&
						parts.month === stated.month &&
						parts.day === stated.day &&
						parts.hour === stated.hour &&
						parts.minute === stated.minute &&
						parts.second === stated.second
						? Option.some(DateTime.toEpochMillis(named))
						: Option.none()
				})
			}
		)
	})

/**
 * The delay a source named in its response's headers, parsed at the boundary, the one reading of it: delay-seconds as
 * that many seconds; an HTTP-date as the time from the response's own `Date` to it, both on the source's clock, which
 * no other clock judges, and no delay once that date has passed; nothing where the source names no delay, names one no delay
 * holds (more milliseconds than a number holds exactly), or names a date with no `Date` to measure it from.
 */
export const laterOf = (headers: Headers): Option.Option<Later> =>
	Option.flatMap(
		Option.fromNullishOr(headers.get("retry-after")),
		(stated): Option.Option<Later> => {
			const millis: Option.Option<number> = DELAY_SECONDS.test(stated)
				? Option.some(Number(stated) * MILLIS_PER_SECOND)
				: Option.flatMap(
						Option.all([
							fixdate(stated),
							Option.flatMap(Option.fromNullishOr(headers.get("date")), fixdate)
						]),
						([until, sent]) => Option.some(Math.max(0, until - sent))
					)
			return Option.map(
				Option.filter(millis, Number.isSafeInteger),
				(after) => new Later({ after: delayOf(after) })
			)
		}
	)
