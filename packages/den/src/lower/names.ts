import * as g from "@bjornpagen/grizzle"
import { Array as Arr, String as Str } from "effect"
import { nameBytes, Refused } from "#algebra/kinds.ts"
import { framedText } from "#runtime/identity.ts"

/**
 * den's naming door: every name den gives what it lowers a flow to is minted here. A name is the schema type's key and
 * its row maps' key, which apps name in source (a law over a derived root's key, a grant, a test's rows), so every name
 * stays readable; only the PostgreSQL identifiers grizzle mints from a name ever differ from it, by its naming.
 *
 * - Readable singletons: a name of the flow's own and one of den's words, `<P><Word>` (`<P>Scope`, `<P>Step`,
 *   `<P>Kind`, …), declared to grizzle, its identifier its conversion, as grizzle keeps `<schema>__<name>` readable. Its
 *   identity is the flow's name and the word, so it is one-to-one in the schema's namespace, and it is refused at den's
 *   door, as its flow's, when its conversion passes nameBytes (`readableOf`), before grizzle sees it.
 * - Derived: every other relation or roster name den makes from the flow's names (a kind's or a join's input, output
 *   and error relations and their options, arrays and variants, a column's roster, a derived root's key, an edge, a
 *   read's references), the readable composition of its pieces, `<P><Kind>Input`, `<Relation><Field>`, of any length,
 *   which grizzle holds by derived naming (its `derivedName`): its name refused for nothing but a collision, and every
 *   identifier grizzle installs for it the hashed form of its kind, over the flow's name and the rest of the name, so
 *   no nesting and no length of a flow's names carries an identifier past PostgreSQL's 63 bytes.
 *
 * Two identities can compose one readable name (an edge named as a kind's input field's option), so the census of a
 * flow's names refuses two declarations of distinct identities whose conversions meet (`censusOf`), before grizzle
 * would. A derived name's identity is its canonical encoding: what it names (DerivedKind), then each piece tagged by
 * what it is (a name the flow declares, a word of den's, the derived name it is under, by that name's canonical
 * encoding), each framed by its length (framedText).
 */

/**
 * What a derived name names, the first part of its identity: a kind's or a join's input, output or error relation; one
 * of a value's options, arrays or variants; a column's roster; a derived root's key; an edge; a read's references, the
 * stem of its records.
 */
export type DerivedKind =
	| "input"
	| "output"
	| "error"
	| "option"
	| "array"
	| "variant"
	| "roster"
	| "key"
	| "edge"
	| "read"

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
 * A name den derives: its identity's canonical encoding, its readable name, and its naming as grizzle's derivedName
 * takes it, the flow's name as its stem and the rest of the name as its path, which grizzle hashes every identifier of
 * it over.
 */
export interface Derived {
	readonly canonical: string
	readonly name: string
	readonly naming: { readonly stem: string; readonly path: readonly [string] }
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

/** A piece's part of the readable name: a name capitalized, a word as it is, or the name it is under, whole. */
const pieceText = (piece: Piece): string => {
	switch (piece.kind) {
		case "declared":
			return Str.capitalize(piece.name)
		case "word":
			return piece.word
		case "under":
			return piece.derived.name
	}
}

/**
 * The derived name of what `kind` names by `pieces` in the flow `flow`: the readable composition of its pieces, which
 * starts with the flow's name, and its naming over the flow's name and the rest.
 */
export const derivedOf = (
	flow: string,
	kind: DerivedKind,
	pieces: ReadonlyArray<Piece>
): Derived => {
	const name = Arr.join(Arr.map(pieces, pieceText), "")
	return {
		canonical: framedText([kind, ...Arr.map(pieces, encodedPiece)]),
		name,
		naming: { stem: flow, path: [Str.slice(flow.length)(name)] }
	}
}

/**
 * The readable name of one of a flow's singletons, `<P><Word>`, or its refusal as the flow's, where its conversion
 * passes nameBytes: a flow's name too long to hold den's words.
 */
export const readableOf = (flow: string, singleton: string): string => {
	const name = `${flow}${singleton}`
	const parsed = g.parseDeclaredName(name)
	if (!parsed.ok) {
		throw new Refused({
			declaration: `flow ${flow}`,
			why: `its name does not hold den's ${singleton}: ${name}, ${g.nameFaultText(parsed.error)}`
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

/** A relation grizzle's records derive from a read's stem, in the census, its identity the stem's and its own name. */
export const namedRecords = (stem: string, name: string): Named => ({
	name,
	identity: `w${framedText([stem, name])}`
})

/**
 * A row check's name den composes from a double column's, `<column>Finite`, in its relation's namespace of checks, or
 * its refusal as the flow's where its conversion passes nameBytes: a column's name too long to hold den's word.
 */
export const finiteCheckOf = (flow: string, relation: string, column: string): string => {
	const name = `${column}Finite`
	const parsed = g.parseDeclaredName(name)
	if (!parsed.ok) {
		throw new Refused({
			declaration: `flow ${flow}`,
			why: `${relation}'s field ${column} does not hold den's row check ${name}, ${g.nameFaultText(parsed.error)}`
		})
	}
	return name
}

/**
 * A roster handle den composes from a declared name, `handle`, or its refusal as `declaration`'s where its bytes pass
 * nameBytes, the most a name holds, which grizzle's roster refuses past: a scope's or a root's finish's kind,
 * `<Join>Finish`.
 */
export const handleOf = (declaration: string, handle: string): string => {
	const bytes = new TextEncoder().encode(handle).length
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
 * contracts, are refused, two identities meeting under one name; one identity named twice is one declaration.
 */
export const censusOf = (flow: string, names: ReadonlyArray<Named>): void => {
	const held = new Map<string, Named>()
	Arr.forEach(names, (named) => {
		const conversion = g.conversionOf(named.name)
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
