import { Sha256 } from "@bjornpagen/grizzle"
import { Array as Arr, Match } from "effect"
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

/** A recorded column's value: what a record's column holds. */
export type RecordedColumn = string | bigint | number | boolean

/** What a record holds of a row: each field by its name, in its record's order, with its recorded value. */
export type RecordedRow = ReadonlyArray<readonly [string, Recorded]>

/**
 * A recorded field's value: a column's, or the rows an attachment delivered under it, in their order, at most one for
 * an attachment of one row at most.
 */
export type Recorded =
	| RecordedColumn
	| { readonly _tag: "Attached"; readonly rows: ReadonlyArray<RecordedRow> }

/** The rows an attachment delivered, as a record's field holds them. */
export const attached = (rows: ReadonlyArray<RecordedRow>): Recorded => ({ _tag: "Attached", rows })

/**
 * A recorded column's text, told apart by its type: a text as itself, a bigint and a finite number by their decimal
 * spellings, -0 apart from 0, and a boolean by its name.
 */
const columnText = (value: RecordedColumn): string =>
	Match.value(value).pipe(
		Match.when(Match.string, (text) => `s${text}`),
		Match.when(Match.bigint, (n) => `b${String(n)}`),
		Match.when(Match.number, (x) => (Object.is(x, -0) ? "n-0" : `n${String(x)}`)),
		Match.when(Match.boolean, (b) => (b ? "t" : "f")),
		Match.exhaustive
	)

/**
 * A recorded row's parts: each field's name, then its value's parts. A record fixes its fields, their order and which
 * are attachments, so the parts of two rows of one record agree exactly when the rows do, nested rows and all.
 */
const rowParts = (row: RecordedRow): ReadonlyArray<string> =>
	Arr.flatMap(row, ([name, value]) => [name, ...valueParts(value)])

/** A recorded value's parts: a column's text, or an attachment's rows. */
const valueParts = (value: Recorded): ReadonlyArray<string> =>
	typeof value === "object" ? attachedParts(value.rows) : [columnText(value)]

/** The parts of the rows an attachment delivered: their count, then each row's parts in order. */
const attachedParts = (rows: ReadonlyArray<RecordedRow>): ReadonlyArray<string> => [
	"a",
	String(rows.length),
	...Arr.flatMap(rows, rowParts)
]

/**
 * The key of a row a step's read `read` found, the digest of its record, its columns and the rows its attachments
 * delivered, at every depth: rows of one record agree exactly when their digests do, so a root holds each once.
 */
export const rowDigest = (read: string, row: RecordedRow): Sha256 =>
	derive(["row", read, ...rowParts(row)])
