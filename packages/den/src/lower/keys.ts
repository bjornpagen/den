import * as g from "@bjornpagen/grizzle"

/**
 * den's own contracts, every flow's alike: an instant, a delay and an environment's name. A step's key, a scope's key, an exclusivity seat's
 * key (the digest of its kind and the key text its scope's input names, so any text keys a seat) and a recorded row's
 * key (the digest of what a read found of it) are each a SHA-256 digest of what identifies it (runtime/identity.ts),
 * grizzle's `sha256` field itself, its 32 bytes: a digest's one predicate is its length, which grizzle's digest domain
 * holds, so no contract is over one. An app's relation that references den's facts (an audit of a step's result, say)
 * types its column `sha256`, as den's own relations do.
 */
/** DenInstant's key: the capability to mint its host type, which den's printed clocked programs and casts name. */
export const denInstantKey = Symbol("DenInstant")
export const DenInstant = g.domain<typeof denInstantKey>()("DenInstant", g.int8)

/** The mint of DenInstant's host type: den's one conversion of a reading of its clock into an instant. */
export const mintInstant = g.mintOf(denInstantKey)

/**
 * An environment's name, as a host names the environment it serves (Vercel's `VERCEL_ENV`: production, preview,
 * development or a custom environment's name): letters, digits, `_`, `.` and `-`, at most 64 of them.
 *
 * @limitKind provisional
 * @owner den's contracts (packages/den/src/lower/keys.ts)
 * @unit characters
 * @scope an environment's name, the key of the deployments it served (`<P>Served`)
 * @guards grizzle keys a text only under a pattern that bounds its bytes, so an unbounded name cannot key a promotion
 * @measure read the longest environment name Vercel admits (its custom environments' documented limit) and make it the
 *   bound
 * @origin written with no evidence by lane DENFEAT4 for the deployment fence (2026-11-21)
 * @recorded 2026-11-21
 */
export const environmentPattern = "^[A-Za-z0-9_.-]{1,64}$"

/** An environment's name, the key of the deployments it served. */
/** DenEnvironment's key: the capability to mint its host type. */
export const denEnvironmentKey = Symbol("DenEnvironment")
export const DenEnvironment = g.domain<typeof denEnvironmentKey>()(
	"DenEnvironment",
	g.str.regex(environmentPattern, "u")
)

/** The mint of DenEnvironment's host type: den's one conversion of a parsed environment's name. */
export const mintEnvironment = g.mintOf(denEnvironmentKey)

/**
 * The most milliseconds a den delay holds: a due instant, a retry's or a lease's end is the database's clock reading plus
 * a delay, computed in the statement that writes it, and the reading lies at most at the top of PostgreSQL's timestamptz
 * range in milliseconds, so a delay up to the room bigint leaves above that top keeps every such instant a bigint, which
 * grizzle proves from the two ranges with no guard.
 *
 * @limitKind derived
 * @owner den's contracts (packages/den/src/lower/keys.ts)
 * @unit milliseconds
 * @scope a delay den writes beside a clocked reading: a step's due after its spawn, a retry's rung
 * @derivation bigint's greatest value, 9223372036854775807, less the latest reading of the clock grizzle's clocked
 *   binding states in milliseconds, 9224318015999999 (PostgreSQL's timestamptz range, grizzle 79874ab5f)
 */
const longestDelayMillis = 9214147718838775808n

/** A delay in milliseconds, never negative and at most {@link longestDelayMillis}. */
/** DenDelay's key: the capability to mint its host type. */
export const denDelayKey = Symbol("DenDelay")
export const DenDelay = g.domain<typeof denDelayKey>()("DenDelay", g.int8, (d) =>
	g.Logic.and([g.Logic.ge(d, 0n), g.Logic.le(d, longestDelayMillis)])
)

/** The mint of DenDelay's host type: den's one conversion of a delay in milliseconds. */
export const mintDelay = g.mintOf(denDelayKey)

/** Any text, as a value's text column holds it. */
export const Text = g.str.regex("^.*$", "su")
