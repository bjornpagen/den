import { derived } from "@bjornpagen/limit"
import { authenticationTimeoutSeconds } from "#postgres.ts"
import { censusPeriodSeconds } from "#vercel-cron.ts"
import { invocationBudgetMillis } from "#vercel-functions.ts"

/**
 * den's claim protocol and retry ladder: a claim's lease, when a step may be claimed again, and the rungs between (the limits skill, .agents/skills/limits; this package's README).
 */

/**
 * How far a claim's lease outlasts its turn's deadline. After its deadline a holder's last acts are its commit and the
 * giving back of its seats, each a call whose session a server at its default lets take at most this long to
 * authenticate, so a lease this much past the deadline still holds while its holder can be committing. Seats are exact
 * while the clocks of two holders differ by less than this margin, which DBCLOCK removes by taking the database's
 * instant.
 */
export const leaseMarginMillis = derived({
	owner: "den's claim protocol (packages/den/src/runtime/turn.ts)",
	unit: "milliseconds",
	scope: "the interval from a turn's deadline to its claim's and its seats' `until`",
	from: [authenticationTimeoutSeconds],
	derivation:
		"the commit and the seats' give-back after the deadline each open a session, which the server closes once authentication_timeout passes",
	compute: ([authentication]) => authentication.value * 1000
})

/**
 * The longest a claim's lease can be: a turn's deadline is what its invocation has left less the margin, so its lease
 * ends no later than the invocation that took it can live.
 */
export const longestLeaseMillis = derived({
	owner: "den's claim protocol (packages/den/src/runtime/turn.ts)",
	unit: "milliseconds",
	scope: "the interval from a claim's instant to its `until`, at its longest",
	from: [invocationBudgetMillis],
	derivation:
		"deadline plus margin is at most the invocation's remaining budget, which is at most its whole budget",
	compute: ([budget]) => budget.value
})

/**
 * The first instant after the longest lease at which its step may be claimed again: a lease holds through its `until`,
 * and the caller's clock reads whole milliseconds, so the next instant it can read is one millisecond later.
 */
export const reclaimableAfterMillis = derived({
	owner: "den's claim protocol",
	unit: "milliseconds",
	scope:
		"the interval from a claim's instant to the first instant the census rings its step's next attempt, at the longest",
	from: [longestLeaseMillis],
	derivation:
		"a claim stands while `until >= now`, and the clock's resolution is one millisecond, so one past the lease is the first instant it no longer stands",
	compute: ([lease]) => lease.value + 1
})

/**
 * The first rung of every retry ladder: one census period, the soonest the census rings a step again if the wake its
 * failed turn sent with a delay is lost.
 */
export const backoffFirstMillis = derived({
	owner: "den's retry ladder (packages/den/src/runtime/turn.ts)",
	unit: "milliseconds",
	scope: "the wait from a spent attempt's end to the next attempt's due instant, at the first rung",
	from: [censusPeriodSeconds],
	derivation: "the census's period, so a lost delayed wake costs at most one more rung",
	compute: ([period]) => period.value * 1000
})

/**
 * The last rung of every retry ladder: the longest lease, so a step is never due again later than a dead holder's step
 * would be reclaimed.
 */
export const backoffLastMillis = derived({
	owner: "den's retry ladder (packages/den/src/runtime/turn.ts)",
	unit: "milliseconds",
	scope: "the wait from a spent attempt's end to the next attempt's due instant, at its longest",
	from: [longestLeaseMillis],
	derivation:
		"rungs double from the first until they reach the longest lease, which a reclaim waits at most",
	compute: ([lease]) => lease.value
})
