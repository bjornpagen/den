import * as g from "@bjornpagen/grizzle"
import { Array as Arr, Option, Result } from "effect"
import type { Brand } from "effect"
import { type denDelayKey, type denInstantKey, mintDelay, mintInstant } from "#lower/keys.ts"

/**
 * Identity, derived: a step's key is its parent, its edge kind and its ordinal; a scope's start child is its scope and
 * its ordinal; a scope's finish is its scope; a root's scope is its flow, its kind and its trigger's idempotency key.
 * Each key is the SHA-256 of its parts, grizzle's `sha256`, its 32 bytes, a content digest and so a natural key, so a
 * step run twice spawns onto the same keys, which grizzle reads as no change.
 */

/** An instant, milliseconds since the epoch: the ledger's `DenInstant`, its host type, as the database's clock reads it. */
export type Instant = g.Marked<bigint, typeof denInstantKey>

/**
 * A duration in milliseconds, never negative: the ledger's `DenDelay`, its host type, what a step waits after its spawn,
 * a retry after its attempt, and the instant the database computes from a reading of its clock plus it.
 */
export type Delay = g.Marked<bigint, typeof denDelayKey>

/** The instant `millis` milliseconds after the epoch, the one mint of an Instant on the host. */
export const instantOf = (millis: number): Instant => mintInstant(BigInt(millis))

/** A delay of `millis` milliseconds, the one mint of a Delay; DenDelay's law refuses a negative one where it is written. */
export const delayOf = (millis: number): Delay => mintDelay(BigInt(millis))

/** No delay: due at the call's own reading. */
export const atOnce: Delay = delayOf(0)

const encoder = new TextEncoder()

/**
 * The SHA-256 of a derivation's parts, each kept apart by a NUL, which no key's text holds, of their UTF-8: a key that
 * is a part is its digest's hex (Sha256.toHex), so each key's 32 bytes are those whose hex den's keys were.
 */
const derive = (parts: ReadonlyArray<string>): g.Sha256 =>
	g.Sha256.ofBytes(encoder.encode(Arr.join(parts, "\u0000")))

/** The scope of root kind `kind` of flow `flow`, started under the idempotency key `key`. */
export const rootScope = (flow: string, kind: string, key: string): g.Sha256 =>
	derive(["root", flow, kind, key])

/**
 * The texts of a request's input, each a relation's name or a field's grizzle codec text (codecText), where every value
 * is one its field's type admits; none where any is not, a value its kind's schema admits and its type does not (a text
 * holding NUL, a bigint past int8). The request's own input rows carry that value, which grizzle's parameter encoder
 * refuses, typed, before any statement runs, and a Root of a kind whose input its request gives cannot stand without
 * its record, so such a request is refused whatever its record: none is printed for it.
 */
export const codecTextsOf = (
	texts: ReadonlyArray<Result.Result<string, unknown>>
): Option.Option<ReadonlyArray<string>> => Result.getSuccess(Result.all(texts))

/**
 * Texts as one text that names them apart: each its length, a colon and itself, as grizzle's rowText frames a row's
 * columns (a text may hold any character, a NUL among them, which `derive` keeps its parts apart by, a key's text
 * holding none), so no two lists of texts, nested or not, make one text: den's one framing of texts a request names,
 * of its input (`inputDigest`) and of a kind's input heading (lower/print.ts inputHeadingOf).
 */
export const framedText = (texts: ReadonlyArray<string>): string =>
	Arr.join(
		Arr.map(texts, (text) => `${String(text.length)}:${text}`),
		""
	)

/**
 * The digest of a request's input rows, each row's relation and each declared field's codec text, framed
 * (`framedText`), so two requests of one kind under one fingerprint name one input exactly when their rows agree value
 * for value: the content a key names, beside it (the fragment's RequestedWith). The text of each value is grizzle's;
 * the framing of a request's rows is den's.
 */
export const inputDigest = (flow: string, kind: string, texts: ReadonlyArray<string>): g.Sha256 =>
	derive(["input", flow, kind, framedText(texts)])

/**
 * Texts an input digest is probed over: none, empty ones, one, texts that join alike, the framing's own digits and
 * colon, NUL, an uppercase letter and a decomposed character (a digest that folds case or normalizes answers apart),
 * and texts outside ASCII and outside the BMP.
 */
const PROBES: ReadonlyArray<ReadonlyArray<string>> = [
	[],
	[""],
	["a"],
	["ab"],
	["a", "b"],
	["1:a"],
	["", ""],
	["a\u0000b"],
	["A", "e\u0301"],
	["é", "\u{1F600}"]
]

/** An input digest's scheme (`schemeOf`): a digest's hex, which holds no NUL, so a fingerprint under it names it apart. */
export type InputScheme = string & Brand.Brand<"DenInputScheme">

/** The claim behind the scheme's one mint (`schemeOf`), unchecked: a value read here is a digest's hex. */
const readScheme: (value: string) => asserts value is InputScheme = () => undefined

/**
 * The scheme of an input digest `digest`: what it answers over a fixed probe (`PROBES`, under a flow and a kind of two
 * names, so a digest that confuses them answers apart), digested, a known answer, so two digests that answer any probe
 * apart have two schemes, whatever loader or bundler ran them.
 */
export const schemeOf = (digest: typeof inputDigest): InputScheme => {
	const scheme = g.Sha256.toHex(
		derive([
			"scheme",
			...Arr.map(PROBES, (texts) => g.Sha256.toHex(digest("ProbeFlow", "ProbeKind", texts)))
		])
	)
	readScheme(scheme)
	return scheme
}

/** The running den's input digest scheme (`schemeOf` its `inputDigest`), taken when den loads. */
export const inputScheme = schemeOf(inputDigest)

/** The fingerprint of a heading under the input digest scheme `scheme`: each of them apart. */
export const fingerprintUnder = (scheme: InputScheme, heading: string): g.Sha256 =>
	derive(["heading", scheme, heading])

/**
 * The fingerprint of a root kind's input heading, under the running den's input digest scheme: the heading's relations,
 * fields and types and the printed construction of its digest, as den generate prints them (lower/print.ts
 * inputHeadingOf), so a deploy that changes the shape of a kind's input changes its fingerprint, and so does a den
 * whose digest answers otherwise, generated again or not.
 */
export const inputFingerprint = (heading: string): g.Sha256 =>
	fingerprintUnder(inputScheme, heading)

/** The step a scope's start spawns at `ordinal`. */
export const startedStep = (scope: g.Sha256, ordinal: number): g.Sha256 =>
	derive(["start", g.Sha256.toHex(scope), String(ordinal)])

/** The child scope a scope's start spawns at `ordinal`. */
export const startedScope = (scope: g.Sha256, ordinal: number): g.Sha256 =>
	derive(["start-scope", g.Sha256.toHex(scope), String(ordinal)])

/** The step edge `edge` of step `step` spawns at `ordinal`. */
export const edgeStep = (step: g.Sha256, edge: string, ordinal: number): g.Sha256 =>
	derive(["edge", g.Sha256.toHex(step), edge, String(ordinal)])

/** The child scope edge `edge` of step `step` spawns at `ordinal`. */
export const edgeScope = (step: g.Sha256, edge: string, ordinal: number): g.Sha256 =>
	derive(["edge-scope", g.Sha256.toHex(step), edge, String(ordinal)])

/** The step that runs scope `scope`'s finish: one per scope, the key its finish's race is decided on. */
export const finishStep = (scope: g.Sha256): g.Sha256 => derive(["finish", g.Sha256.toHex(scope)])

/** The exclusivity seat of scope kind `kind` of flow `flow` under the key text `key`. */
export const exclusiveId = (flow: string, kind: string, key: string): g.Sha256 =>
	derive(["exclusive", flow, kind, key])

/**
 * The key of a row a step's read `read` found, the digest of its text (grizzle's `rowText` of the read's query, every
 * column and every row its attachments delivered, framed so two rows' texts agree exactly when the rows do): rows of
 * one read agree exactly when their digests do, so a root holds each once.
 */
export const rowDigest = (read: string, text: string): g.Sha256 => derive(["row", read, text])
