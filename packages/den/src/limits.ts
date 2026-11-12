import { type Brand, Duration } from "effect"

/**
 * Limits: every number den bounds something by, as a value that carries its evidence (the indefensible-numbers skill).
 * A limit is one of three kinds, and nothing else:
 *
 * - published: a number a source states, with the exact source, a quote of it, what kind of constraint it is, and the
 *   day it was opened and checked;
 * - measured: an operating value a measurement supports, with the record of that measurement, what it observed and
 *   under which environment and workload, how the value follows from it, and what invalidates it;
 * - derived: a value computed from other limits by the arithmetic its `compute` states, never a second spelling of
 *   their numbers.
 *
 * A limit is minted only here, so every bound a comparison, a loop, a size or a timeout reads is a Limit or a caller's
 * input, never a bare number. den chooses no number on its caller's behalf: what is a choice (a lane's width, its
 * ceiling on attempts) is the flow's declaration, and what is not is one of these.
 */

/** The day a published source was opened and its number checked, as YYYY-MM-DD. */
export type VerifiedDate = `${number}-${number}-${number}`

/**
 * What a published number really is. A vendor default is not a maximum, and an example or an advisory in a vendor's
 * guide is an advisory threshold, not a quota.
 */
export type Constraint =
	| "hard quota"
	| "protocol constant"
	| "compile-time constant"
	| "configurable default"
	| "advisory threshold"

/** What every limit states: its number, who sets it, its unit, and exactly what it bounds. */
interface Stated<N extends number | bigint> {
	readonly value: N
	readonly owner: string
	readonly unit: string
	readonly scope: string
}

/** A published limit's evidence: the exact source stating the number, quoted, and when it was verified. */
export interface PublishedEvidence {
	readonly kind: "published"
	readonly constraint: Constraint
	readonly source: `https://${string}`
	readonly quote: string
	readonly verified: VerifiedDate
}

/**
 * A measured limit's evidence: a resolvable record of the measurement, the interval observed, the environment and the
 * workload, the result, how the value follows from it, and what invalidates it.
 */
export interface MeasuredEvidence {
	readonly kind: "measured"
	readonly evidence: string
	readonly observed: string
	readonly environment: string
	readonly workload: string
	readonly result: string
	readonly decision: string
	readonly revalidate: string
}

/** A derived limit's evidence: the limits it is computed from, and why the arithmetic bounds what it bounds. */
export interface DerivedEvidence {
	readonly kind: "derived"
	readonly from: readonly [AnyLimit, ...Array<AnyLimit>]
	readonly derivation: string
}

/** A limit with its evidence: published, measured or derived, branded so only this module's mints make one. */
export type Limit<N extends number | bigint = number> = Stated<N> &
	(PublishedEvidence | MeasuredEvidence | DerivedEvidence) &
	Brand.Brand<"den/Limit">

/** A limit of either carrier, as a derived limit's inputs are. */
export type AnyLimit = Limit | Limit<bigint>

type Evidenced<N extends number | bigint> = Readonly<
	Stated<N> & (PublishedEvidence | MeasuredEvidence | DerivedEvidence)
>

/** The claim behind the mint, unchecked: a frozen statement with its evidence is a limit. */
const claimed: <N extends number | bigint>(
	limit: Evidenced<N>
) => asserts limit is Evidenced<N> & Limit<N> = () => undefined

/** The one mint of a Limit: a limit with its evidence, frozen by the constructor that built it, branded. */
const mint = <N extends number | bigint>(limit: Evidenced<N>): Limit<N> => {
	claimed(limit)
	return limit
}

/** A limit a source states. */
export const published = <N extends number | bigint>(
	limit: Stated<N> & Omit<PublishedEvidence, "kind">
): Limit<N> => mint(Object.freeze({ ...limit, kind: "published" }))

/** An operating limit a measurement supports. */
export const measured = <N extends number | bigint>(
	limit: Stated<N> & Omit<MeasuredEvidence, "kind">
): Limit<N> => mint(Object.freeze({ ...limit, kind: "measured" }))

/**
 * A limit computed from other limits: `compute` reads their values, so the derived number is never a second spelling
 * of theirs, and `derivation` says why the arithmetic bounds the resource.
 */
export const derived = <
	const From extends readonly [AnyLimit, ...Array<AnyLimit>],
	N extends number | bigint
>(limit: {
	readonly owner: string
	readonly unit: string
	readonly scope: string
	readonly from: From
	readonly derivation: string
	readonly compute: (from: From) => N
}): Limit<N> =>
	mint(
		Object.freeze({
			value: limit.compute(limit.from),
			owner: limit.owner,
			unit: limit.unit,
			scope: limit.scope,
			kind: "derived",
			from: limit.from,
			derivation: limit.derivation
		})
	)

/**
 * The longest a Vercel function invocation lives, Fluid compute on the Pro and Enterprise plans: past it Vercel
 * terminates the invocation. Every unit of den's work fits one invocation (the proposal's ninth principle).
 */
export const functionLifetimeSeconds = published({
	value: 800,
	owner: "Vercel Functions, Fluid compute, Pro and Enterprise plans",
	unit: "seconds",
	scope: "one function invocation, from its start until Vercel terminates it",
	constraint: "hard quota",
	source: "https://vercel.com/docs/functions/configuring-functions/duration",
	quote: "The 800 second maximum is generally available for Pro and Enterprise teams.",
	verified: "2026-11-11"
})

/**
 * How long a claim holds its step: as long as the one invocation that claimed it can live, so a claim outlives no
 * holder that is still running, and a holder that died is reclaimed once its invocation can no longer be alive. A
 * lease is judged by the caller's clock, which grizzle takes as a parameter (DBCLOCK replaces it).
 */
export const leaseMillis = derived({
	owner: "den's claim protocol",
	unit: "milliseconds",
	scope:
		"the interval from a claim's instant to its `until`, the instant after which its step may be claimed again",
	from: [functionLifetimeSeconds],
	derivation:
		"a function invocation lives at most functionLifetimeSeconds, so a holder is certainly gone once that much time has passed since it claimed",
	compute: ([lifetime]) => lifetime.value * 1000
})

/**
 * The most milliseconds one invocation spends taking turns: its whole lifetime. A turn starts only if its step's
 * deadline ends inside the invocation's budget.
 */
export const invocationBudgetMillis = derived({
	owner: "den's runtime",
	unit: "milliseconds",
	scope: "one invocation's turns, from the instant it was woken",
	from: [functionLifetimeSeconds],
	derivation: "an invocation takes turns only while the platform keeps it alive",
	compute: ([lifetime]) => lifetime.value * 1000
})

/**
 * The first instant after a claim's lease at which its step may be claimed again: a lease holds through its `until`,
 * and the caller's clock reads whole milliseconds, so the next instant it can read is one millisecond later.
 */
export const reclaimableAfterMillis = derived({
	owner: "den's claim protocol",
	unit: "milliseconds",
	scope:
		"the interval from a claim's instant to the first instant the census rings its step's next attempt",
	from: [leaseMillis],
	derivation:
		"a claim stands while `until >= now`, and the clock's resolution is one millisecond, so one past the lease is the first instant it no longer stands",
	compute: ([lease]) => lease.value + 1
})

/**
 * How long a PostgreSQL server lets a client take to authenticate before it closes the connection, by default: no
 * connection attempt to a server at its default can usefully take longer.
 */
export const authenticationTimeoutSeconds = published({
	value: 60,
	owner: "PostgreSQL, the authentication_timeout setting",
	unit: "seconds",
	scope:
		"one client's authentication on one connection, from its start until the server closes the connection",
	constraint: "configurable default",
	source: "https://www.postgresql.org/docs/current/runtime-config-connection.html",
	quote:
		"Maximum amount of time allowed to complete client authentication. [...] The default is one minute (1m).",
	verified: "2026-11-11"
})

/** How long one connection attempt to den's cluster may take: as long as the server lets it authenticate. */
export const connectTimeoutMillis = derived({
	owner: "den's suites on its own cluster (scripts/pg.sh)",
	unit: "milliseconds",
	scope:
		"one connection attempt of a suite's DbLayer, and the CancelRequest an interrupted statement sends",
	from: [authenticationTimeoutSeconds],
	derivation:
		"the cluster runs at PostgreSQL's default authentication_timeout, past which it closes the connection itself",
	compute: ([authentication]) => authentication.value * 1000
})

/**
 * How long one case of den's suites, or one shrink candidate, may run before it is stopped and reported as hung. A
 * case runs inside its file, so it can never usefully run past the slowest file's whole run; the guard stops a case
 * that never ends, and decides no verdict of a case that does.
 */
export const caseHangMillis = measured({
	value: 600_000,
	owner: "den's suites (packages/den/test, packages/den/integration)",
	unit: "milliseconds",
	scope: "one case or shrink candidate of one search of den's suites",
	evidence:
		"packages/den/node_modules/.vite/vitest/da39a3ee5e6b4b0d3255bfef95601890afd80709/results.json, Vitest's own record of each test file's last run, SHA-256 9ca3877ea2e0f27eef1d0db06aa82bc0db75d2d7762c7462d7404bcffbefd228 when read on 2026-11-11",
	observed: "each file's last run between 2026-11-11 17:31 and 17:42 CST",
	environment:
		"macOS (Darwin 27.0.0, arm64) on 10 cores, Node 26.13.0, Vitest 5.1.0, den's PostgreSQL 19rc1 cluster (scripts/pg.sh), one fork per file",
	workload:
		"five PostgreSQL suites (the chain, fan-out, stale claimer, census and certification suites) and four unit suites, each file alone",
	result:
		"every file passed; the slowest, integration/census.test.ts, in 38,896 ms for 8 cases, its migration and uninstall included; the unit files under 1 s each; no machine load recorded",
	decision:
		"600,000 ms is about fifteen times the slowest file's whole run, headroom stated for a loaded machine: a case cannot take longer than its file, so the guard only ever stops a case that never ends",
	revalidate:
		"a suite whose file takes longer than 60 s; a suite's runs raised; a Node, Vitest or PostgreSQL pin change; another machine"
})

/** Every search's hang guard in den's suites: caseHangMillis as the Duration an exploration's caseHang takes. */
export const caseHang: Duration.Duration = Duration.millis(caseHangMillis.value)
