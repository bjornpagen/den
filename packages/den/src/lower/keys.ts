import { contract, Logic, pg, sha256, str } from "@bjornpagen/grizzle"

/**
 * den's own contracts, every flow's alike: a step's key, a scope's key, an exclusivity seat's key
 * (the digest of its kind and the key text its scope's input names, so any text keys a seat), a recorded row's key
 * (the digest of what a read found of it) and an instant; each key is a
 * SHA-256 digest of what identifies it (runtime/identity.ts), grizzle's `sha256`, under its own contract. An app's
 * relation that references den's facts (an audit of a step's result, say) types its column by these, since terms that
 * meet in a law have one contract.
 */
export const DenStep = contract("DenStep", sha256)
export const DenScope = contract("DenScope", sha256)
export const DenExclusive = contract("DenExclusive", sha256)
export const DenInstant = contract("DenInstant", pg.bigint)
export const DenRow = contract("DenRow", sha256)

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
export const DenDelay = contract("DenDelay", pg.bigint, (d) =>
	Logic.and(Logic.ge(d, 0n), Logic.le(d, longestDelayMillis))
)

/** Any text, as a value's text column holds it. */
export const Text = str.regex("^.*$", "su")
