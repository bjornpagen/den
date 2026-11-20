import { contract, pg, sha256, str } from "@bjornpagen/grizzle"

/**
 * den's own contracts, every flow's alike: a step's key, a scope's key, a claim's holder, an exclusivity seat's key
 * (the digest of its kind and the key text its scope's input names, so any text keys a seat) and an instant; each key is a
 * SHA-256 digest of what identifies it (runtime/identity.ts), grizzle's `sha256`, under its own contract. An app's
 * relation that references den's facts (an audit of a step's result, say) types its column by these, since terms that
 * meet in a law have one contract.
 */
export const DenStep = contract("DenStep", sha256)
export const DenScope = contract("DenScope", sha256)
export const DenHolder = contract("DenHolder", sha256)
export const DenExclusive = contract("DenExclusive", sha256)
export const DenInstant = contract("DenInstant", pg.bigint)

/** Any text, as a value's text column holds it. */
export const Text = str.regex("^.*$", "su")
