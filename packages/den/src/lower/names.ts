import { conversionOf, nameFaultText, parseDeclaredName, Sha256 } from "@bjornpagen/grizzle"
import { Array as Arr, String as Str } from "effect"
import { nameBytes, Refused } from "#algebra/kinds.ts"
import { framedText } from "#runtime/identity.ts"

/**
 * den's naming door: every name den gives what it lowers a flow to is minted here, of one form per kind, as grizzle's
 * naming door (core/identity.ts) mints every PostgreSQL identifier grizzle installs. Each name is a declared name to
 * grizzle, which judges it by its conversion: its segments, lowercased, joined by single underscores, within
 * PostgreSQL's nameBytes.
 *
 * - Readable: a name of the flow's own and one of den's words, `<P><Word>` (the flow's singletons: `<P>Scope`,
 *   `<P>Step`, `<P>Kind`, …), as grizzle keeps `<schema>__<name>` readable. Its identity is the flow's name and the word,
 *   so it is one-to-one in the schema's namespace, and it is refused at den's door, as its flow's, when its conversion
 *   passes nameBytes (`readableOf`), before grizzle sees it.
 * - Derived: every other name den makes from the flow's names (a kind's input, output and error relations and their
 *   options, arrays and variants, a column's roster and a double's row check, a derived root's key, an edge, a read's
 *   records and every attachment path of them). Its identity holds its names whole, as many and as long as the flow
 *   nests them, so no fixed width holds it readably; its form is always `<stem>_<digest>`, never readable where it would
 *   fit, so a name never changes form for its length: the stem its identity's segments cut at a segment boundary to
 *   stemBudget bytes, and the digest digestLetters letters of the SHA-256 of its canonical encoding. Already in its
 *   conversion, so its conversion is itself, and within nameBytes by construction. The names grizzle's records derive
 *   from a stem den gives them, their root's `${stem}Row`, are grizzle's derived names, its identifiers hashed, so
 *   den's stem leaves them no room.
 *
 * Two distinct derived identities meet under one name only where their stems and their digests do, which the census
 * of a flow's names refuses (`censusOf`), as it refuses two declarations of any form that meet under one conversion.
 *
 * The canonical encoding is injective: what the name names (DerivedKind), then each piece tagged by what it is (a name
 * the flow declares, a word of den's, the identity it is under, by that identity's canonical encoding), each framed by
 * its length (framedText). The stem is read off the same pieces and is presentation only.
 */

/** The suffix grizzle's records add to the stem den gives them, naming their root relation (`${stem}Row`). */
const recordsRowSuffix = "Row"

/**
 * The width of a derived name's digest, in letters: a format constant of den's naming door, whose change renames every
 * derived relation.
 *
 * Its letters are the sixteen from a to p, four bits each, so the digest is one segment of grizzle's conversion,
 * which splits a name at every boundary between a letter and a digit: an alphabet with digits would scatter underscores
 * through a digest and make its width depend on its value. Collision arithmetic: two distinct derived identities share a
 * name only where their stems agree and the first 4 * 13 = 52 bits of their canonical encodings' SHA-256 do; over n
 * derived names of one flow the chance of any shared digest is at most n(n - 1) / 2 / 2^52, below 1.2 * 10^-8 for
 * n = 10^4. One that happens is refused by the census (`censusOf`), never lowered.
 *
 * @formatConstant the letters of a derived name's digest
 */
const digestLetters = 13

/** The code point of `a`, the letter of a digest's nibble 0: nibble n is the letter n places after it. */
const firstLetter = 0x61

/**
 * The bytes a derived name's stem may take: nameBytes less the underscore before the digest and the digest. No limit
 * of its own: PostgreSQL's identifier read against the derived name's form.
 *
 * @limitKind derived
 * @owner den's naming door (packages/den/src/lower/names.ts)
 * @unit bytes
 * @scope a derived name's stem
 * @derivation nameBytes - 1 - digestLetters = 63 - 1 - 13 = 49
 */
const stemBudget = nameBytes - 1 - digestLetters

/**
 * What a derived name names, the first part of its identity: a kind's or a join's input, output or error relation; one
 * of a value's options, arrays or variants; a column's roster; a double column's row check; a derived root's key; an
 * edge; a read's records, their stem, and the relation of each attachment path of them.
 */
export type DerivedKind =
	| "input"
	| "output"
	| "error"
	| "option"
	| "array"
	| "variant"
	| "roster"
	| "finite"
	| "key"
	| "edge"
	| "read"
	| "attachment"

/** A piece of a derived name's identity: a name its flow declares, a word of den's, or the derived name it is under. */
export type Piece =
	| { readonly kind: "declared"; readonly name: string }
	| { readonly kind: "word"; readonly word: string }
	| { readonly kind: "under"; readonly derived: Derived }

/** A name its flow declares, as a piece of a derived identity. */
export const declared = (name: string): Piece => ({ kind: "declared", name })

/** A word of den's, as a piece of a derived identity. */
export const word = (text: string): Piece => ({ kind: "word", word: text })

/** The derived name a piece's identity is under. */
export const under = (derived: Derived): Piece => ({ kind: "under", derived })

/**
 * A name den derives: its identity's canonical encoding, its identity's segments, whole, which a name under it extends,
 * and the name, `<stem>_<digest>`.
 */
export interface Derived {
	readonly canonical: string
	readonly segments: ReadonlyArray<string>
	readonly name: string
}

/** A piece's canonical encoding: its tag, then its text or the canonical encoding of what it is under. */
const encodedPiece = (piece: Piece): string => {
	switch (piece.kind) {
		case "declared":
			return `d${piece.name}`
		case "word":
			return `w${piece.word}`
		case "under":
			return `u${piece.derived.canonical}`
	}
}

/** A piece's segments: a name's or a word's in grizzle's conversion, or those of what it is under, whole. */
const pieceSegments = (piece: Piece): ReadonlyArray<string> => {
	switch (piece.kind) {
		case "declared":
			return Str.split(conversionOf(piece.name), "_")
		case "word":
			return Str.split(conversionOf(piece.word), "_")
		case "under":
			return piece.derived.segments
	}
}

/** The longest run of `segments` from the first whose conversion, joined by underscores, fits stemBudget bytes. */
const stemOf = (segments: ReadonlyArray<string>): ReadonlyArray<string> =>
	Arr.reduce(segments, { kept: Arr.empty<string>(), open: true }, (cut, segment) => {
		const joined = [...cut.kept, segment]
		return cut.open && Arr.join(joined, "_").length <= stemBudget
			? { kept: joined, open: true }
			: { kept: cut.kept, open: false }
	}).kept

const encoder = new TextEncoder()

/**
 * The digest of a canonical encoding: its SHA-256's first digestLetters nibbles, high nibble of each byte first, each the
 * letter that many places after `a`.
 */
const digestOf = (canonical: string): string =>
	Arr.join(
		Arr.map(
			Arr.take(
				Arr.flatMap(Array.from(Sha256.ofBytes(encoder.encode(canonical))), (byte) => [
					byte >> 4,
					byte & 0x0f
				]),
				digestLetters
			),
			(nibble) => String.fromCodePoint(firstLetter + nibble)
		),
		""
	)

/** The derived name of what `kind` names by `pieces`: `<stem>_<digest>`, its one form. */
export const derivedOf = (kind: DerivedKind, pieces: ReadonlyArray<Piece>): Derived => {
	const canonical = framedText([kind, ...Arr.map(pieces, encodedPiece)])
	const segments = Arr.flatMap(pieces, pieceSegments)
	return {
		canonical,
		segments,
		name: Arr.join([...stemOf(segments), digestOf(canonical)], "_")
	}
}

/**
 * The readable name of one of a flow's singletons, `<P><Word>`, or its refusal as the flow's, where its conversion
 * passes nameBytes: a flow's name too long to hold den's words.
 */
export const readableOf = (flow: string, singleton: string): string => {
	const name = `${flow}${singleton}`
	const parsed = parseDeclaredName(name)
	if (!parsed.ok) {
		throw new Refused({
			declaration: `flow ${flow}`,
			why: `its name does not hold den's ${singleton}: ${name}, ${nameFaultText(parsed.error)}`
		})
	}
	return name
}

/** A name of a flow's lowering in its census: the name, and its identity, a derived name's canonical or its own. */
export interface Named {
	readonly name: string
	readonly identity: string
}

/** One of a flow's singletons in the census (`readableOf`), its identity the name itself. */
export const namedReadable = (name: string): Named => ({ name, identity: `r${name}` })

/** A brand's contract in the census, its identity the brand's name. */
export const namedBrand = (brand: string): Named => ({ name: brand, identity: `b${brand}` })

/** The root relation grizzle's records make of a read's stem (`${stem}Row`), in the census, its identity the read's. */
export const namedRecordsRow = (read: Derived): Named => ({
	name: `${read.name}${recordsRowSuffix}`,
	identity: `w${read.canonical}`
})

/**
 * A roster handle den composes from a declared name, `handle`, or its refusal as `declaration`'s where its bytes pass
 * nameBytes, the most a name holds, which grizzle's roster refuses past: a scope's or a root's finish's kind,
 * `<Join>Finish`.
 */
export const handleOf = (declaration: string, handle: string): string => {
	const bytes = encoder.encode(handle).length
	if (bytes > nameBytes) {
		throw new Refused({
			declaration,
			why: `its handle ${handle} takes ${String(bytes)} bytes, past the ${String(nameBytes)} a roster's handle holds`
		})
	}
	return handle
}

/** A derived name in the census, its identity its canonical encoding. */
export const namedDerived = (derived: Derived): Named => ({
	name: derived.name,
	identity: `d${derived.canonical}`
})

/**
 * The census of a flow's names: two of them of one conversion, grizzle's one namespace of relations, rosters and
 * contracts, are refused, two identities meeting under one name (a digest collision, where both are derived); one
 * identity named twice is one declaration.
 */
export const censusOf = (flow: string, names: ReadonlyArray<Named>): void => {
	const held = new Map<string, Named>()
	Arr.forEach(names, (named) => {
		const conversion = conversionOf(named.name)
		const earlier = held.get(conversion)
		if (earlier !== undefined && earlier.identity !== named.identity) {
			throw new Refused({
				declaration: `flow ${flow}`,
				why: `two of its lowered declarations meet under the name ${conversion}: ${earlier.name} and ${named.name}`
			})
		}
		held.set(conversion, named)
	})
}
