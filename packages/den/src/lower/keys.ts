import { contract, pg, str, uuid } from "@bjornpagen/grizzle"

/**
 * den's own contracts, every flow's alike: a step's key, a scope's key, a claim's holder, an exclusivity seat's key
 * (the uuid of its kind and the key text its scope's input names, so any text keys a seat) and an instant. An app's
 * relation that references den's facts (an audit of a step's result, say) types its column by these, since terms that
 * meet in a law have one contract.
 */
export const DenStep = contract("DenStep", uuid)
export const DenScope = contract("DenScope", uuid)
export const DenHolder = contract("DenHolder", uuid)
export const DenExclusive = contract("DenExclusive", uuid)
export const DenInstant = contract("DenInstant", pg.bigint)

/** Any text, as a value's text column holds it. */
export const Text = str.regex("^.*$", "su")
