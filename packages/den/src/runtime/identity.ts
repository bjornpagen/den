import { Sha256 } from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import type { Brand } from "effect"

/**
 * Identity, derived: a step's key is its parent, its edge kind and its ordinal; a scope's start child is its scope and
 * its ordinal; a scope's finish is its scope; a root's scope is its flow, its kind and its trigger's idempotency key.
 * Each key is the SHA-256 of its parts, grizzle's `sha256`, its 32 bytes, a content digest and so a natural key, so a
 * step run twice spawns onto the same keys, which grizzle reads as no change.
 */

/** An instant, milliseconds since the epoch: the ledger's `DenInstant`, as the database's clock reads it. */
export type Instant = bigint & Brand.Brand<"DenInstant">

/**
 * A duration in milliseconds, never negative: the ledger's `DenDelay`, what a step waits after its spawn, a retry after
 * its attempt, and the instant the database computes from a reading of its clock plus it.
 */
export type Delay = bigint & Brand.Brand<"DenDelay">

/** The claim behind each mint, unchecked: a value read here is an instant, or a delay, of den's. */
const readInstant: (value: bigint) => asserts value is Instant = () => undefined
const readDelay: (value: bigint) => asserts value is Delay = () => undefined

/** The instant `millis` milliseconds after the epoch, the one mint of an Instant. */
export const instantOf = (millis: number): Instant => {
	const value = BigInt(millis)
	readInstant(value)
	return value
}

/** A delay of `millis` milliseconds, the one mint of a Delay; DenDelay's law refuses a negative one where it is written. */
export const delayOf = (millis: number): Delay => {
	const value = BigInt(millis)
	readDelay(value)
	return value
}

/** No delay: due at the call's own reading. */
export const atOnce: Delay = delayOf(0)

const encoder = new TextEncoder()

/**
 * The SHA-256 of a derivation's parts, each kept apart by a NUL, which no key's text holds, of their UTF-8: a key that
 * is a part is its digest's hex (Sha256.toHex), so each key's 32 bytes are those whose hex den's keys were.
 */
const derive = (parts: ReadonlyArray<string>): Sha256 =>
	Sha256.ofBytes(encoder.encode(Arr.join(parts, "\u0000")))

/** The scope of root kind `kind` of flow `flow`, started under the idempotency key `key`. */
export const rootScope = (flow: string, kind: string, key: string): Sha256 =>
	derive(["root", flow, kind, key])

/** The step a scope's start spawns at `ordinal`. */
export const startedStep = (scope: Sha256, ordinal: number): Sha256 =>
	derive(["start", Sha256.toHex(scope), String(ordinal)])

/** The child scope a scope's start spawns at `ordinal`. */
export const startedScope = (scope: Sha256, ordinal: number): Sha256 =>
	derive(["start-scope", Sha256.toHex(scope), String(ordinal)])

/** The step edge `edge` of step `step` spawns at `ordinal`. */
export const edgeStep = (step: Sha256, edge: string, ordinal: number): Sha256 =>
	derive(["edge", Sha256.toHex(step), edge, String(ordinal)])

/** The child scope edge `edge` of step `step` spawns at `ordinal`. */
export const edgeScope = (step: Sha256, edge: string, ordinal: number): Sha256 =>
	derive(["edge-scope", Sha256.toHex(step), edge, String(ordinal)])

/** The step that runs scope `scope`'s finish: one per scope, the key its finish's race is decided on. */
export const finishStep = (scope: Sha256): Sha256 => derive(["finish", Sha256.toHex(scope)])

/** The exclusivity seat of scope kind `kind` of flow `flow` under the key text `key`. */
export const exclusiveId = (flow: string, kind: string, key: string): Sha256 =>
	derive(["exclusive", flow, kind, key])

/**
 * The key of a row a step's read `read` found, the digest of its text (grizzle's `rowText` of the read's query, every
 * column and every row its attachments delivered, framed so two rows' texts agree exactly when the rows do): rows of
 * one read agree exactly when their digests do, so a root holds each once.
 */
export const rowDigest = (read: string, text: string): Sha256 => derive(["row", read, text])
