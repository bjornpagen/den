import { type ClockUnit, sha256 } from "@bjornpagen/grizzle"
import { records } from "@bjornpagen/grizzle/dynamic"
import { Array as Arr, Option, Record } from "effect"
import {
	type AnyFlow,
	type AnyJoin,
	type AnyRootKind,
	finishName,
	joinsOf,
	stepsOf
} from "#algebra/flow.ts"
import {
	type AnyCommit,
	type AnyStepKind,
	type ContractField,
	type Due,
	type Again,
	Refused,
	type InputFrom,
	type Stored,
	type Trigger
} from "#algebra/kinds.ts"
import {
	censusOf,
	declared,
	type Derived,
	type DerivedKind,
	derivedOf,
	handleOf,
	type Named,
	namedBrand,
	namedDerived,
	namedReadable,
	namedRecords,
	finiteCheckOf,
	type Piece,
	readableOf,
	under,
	word
} from "#lower/names.ts"
import {
	type ArrayField,
	type Base,
	type Column,
	type ColumnType,
	type DenKey,
	errorShapeOf,
	type Shape,
	shapeOf,
	type UnionField,
	type Variant
} from "#lower/schema.ts"

/**
 * A flow lowered to a fragment, as data: the rosters, contracts, relations and laws the app lists in its own
 * `schema(...)` as the flow's graph and coordination fragments, every name under the flow's prefix, and the kinds,
 * joins and edges the programs and the binding are printed from. The fragment's relations are an ordered list, the form
 * grizzle's `schema()` takes, which refuses two declarations of one name that differ as `DuplicateIdentity`.
 *
 * Two groups of relations, by who writes them, their every law a key, a containment or a row check; each role certifies
 * at the level grizzle's generate gives its writes (docs/build/repin.md), and every call of each runs again on a
 * transient refusal (runtime/ledger.ts Settled). The graph (scopes, steps, claims, results, values, edges) is written
 * by den's role and the app's writer role, inserted and never updated, and sits under grizzle's units: every relation
 * of a root's graph under DenRoot, at the root, which a finished root's clearing deletes the rows of under its den
 * retiring role, its root's record and what it was requested with kept; a claim's seats under the flow's seat unit, at
 * their resource. The coordination group is written by den's coordinator role alone, insert-only: each exclusivity seat
 * and pause is a chain of turns, a turn held and then ended (`Exclusive`/`Released`, `Paused`/`Resumed`), each turn
 * after the first contained in its predecessor's end, so a chain holds at most one live turn, its latest, and nothing
 * is ever deleted. A resource's seat count is a closed relation, which every live hold's seat is checked below on the
 * seat level (SeatsIR).
 */

/**
 * An identity den derives (runtime/identity.ts): a scope's from its parent's, a root's from its flow, kind and key, and a
 * step's from its parent's, each the SHA-256 of its parts, so each names one row of its holder, of one root.
 */
export type Identity = "step" | "scope"

/**
 * What a digest names: an identity, a row a step's read found (its text's digest), an exclusivity seat, or what a root
 * was requested with (a kind's input heading, or its input's codec text: runtime/identity.ts inputFingerprint,
 * inputDigest).
 */
export type Digested = Identity | "row" | "seat" | "request"

/** What a lowered field holds. */
export type FieldType =
	| { readonly kind: "key"; readonly contract: DenKey }
	| { readonly kind: "digest"; readonly names: Digested }
	| { readonly kind: "natural" }
	| { readonly kind: "place" }
	| { readonly kind: "drawn" }
	| { readonly kind: "closed"; readonly roster: string }
	| { readonly kind: "brand"; readonly brand: string }
	| { readonly kind: "base"; readonly base: Base }
	| { readonly kind: "app"; readonly relation: string; readonly field: string }
	| { readonly kind: "vector"; readonly dimensions: number }
	| { readonly kind: "contract"; readonly contract: ContractField }

/**
 * How grizzle holds a lowered name (lower/names.ts): declared, its identifier its conversion, or derived, its every
 * identifier hashed over the flow's name and the rest of the name, grizzle's `derivedName`.
 */
export type NamingIR =
	| { readonly kind: "declared" }
	| { readonly kind: "derived"; readonly stem: string; readonly path: readonly [string] }

/** A lowered relation: its name and naming, its fields in order, and its primary key. */
export interface RelationIR {
	readonly name: string
	readonly naming: NamingIR
	readonly fields: ReadonlyArray<{ readonly name: string; readonly type: FieldType }>
	readonly key: readonly [string, ...Array<string>]
}

/** A roster: its name and naming, and its handles, in code order. */
export interface RosterIR {
	readonly name: string
	readonly naming: NamingIR
	readonly handles: readonly [string, ...Array<string>]
}

/** A brand a value's schema declares, lowered to a contract of its base. */
export interface BrandIR {
	readonly name: string
	readonly base: Base
}

/** What a side of a law selects: rows whose field holds a handle, or whose natural field is at least a bound. */
export type Selection =
	| { readonly kind: "all" }
	| { readonly kind: "handle"; readonly field: string; readonly handle: string }
	| { readonly kind: "atLeast"; readonly field: string; readonly bound: bigint }

/** A side of a law: a relation, what it selects, and its terms, a field or a field's predecessor. */
export interface SideIR {
	readonly relation: string
	readonly selection: Selection
	readonly terms: ReadonlyArray<{ readonly field: string; readonly pred: boolean }>
}

/**
 * A law of the fragment: a containment, a key, a race, a row check holding a natural field to at least a constant, a
 * unit, a relation's rows mutable inside their unit, or an ordered family of an owner's members.
 */
export type LawIR =
	| { readonly kind: "contained"; readonly from: SideIR; readonly to: SideIR }
	| { readonly kind: "key"; readonly side: SideIR }
	| { readonly kind: "race"; readonly relation: string }
	| {
			readonly kind: "check"
			readonly name: string
			readonly relation: string
			readonly field: string
			readonly holds: Holds
	  }
	| {
			readonly kind: "unit"
			/** The unit's name, its lock's: one value of its heading is one lock. */
			readonly name: string
			/** The unit's key, which every relation under it leads its primary key with. */
			readonly heading: readonly [
				{ readonly name: string; readonly type: FieldType },
				...Array<{ readonly name: string; readonly type: FieldType }>
			]
	  }
	| { readonly kind: "mutable"; readonly relation: string }
	| {
			readonly kind: "ordered"
			readonly member: SideIR
			readonly owner: string
			readonly count: string
	  }

/** What a row check holds of its field: a bound it is at least, or that it is finite. */
export type Holds =
	| { readonly kind: "atLeast"; readonly bound: bigint }
	| { readonly kind: "finite" }

/**
 * A closed relation of counts keyed by a roster, fixed by the flow's declaration: each resource's seats. Its rows are
 * constants every statement that reads them folds in, so changing a count is a migration.
 */
export interface CountsIR {
	readonly name: string
	readonly key: { readonly field: string; readonly roster: string }
	readonly count: string
	readonly rows: readonly [
		{ readonly handle: string; readonly count: bigint },
		...Array<{ readonly handle: string; readonly count: bigint }>
	]
}

/**
 * A flow's seats: the closed relation of each resource's count; the holds, each a member of the claim that took it, so a
 * claim and its seats are one write and a hold names its claim's step and attempt; and the live holds, a derived relation
 * of the holds whose attempt has neither ended nor held its step's result, keyed by their seat, so a seat holds at most one
 * live hold, with the check `bound` that holds each live hold's seat below its resource's count. A seat is given back
 * when its claim's attempt ends, by the fact that ends it. A fragment declares no derived relation, which reads a level
 * below its own, so the live holds, their key and their check are the seat level: the schema that lists the flow's graph
 * states them on a level over itself. An ended attempt holds no live seat, so lowering a count is refused only while a
 * live hold sits at or above it.
 */
export interface SeatsIR {
	readonly counts: CountsIR
	readonly hold: string
	readonly live: string
	readonly bound: string
}

/**
 * A value as relations: its owner's relation; for each optional field, the relation of its own; for each array, its
 * ordered family; for each tagged union, a relation per variant.
 */
export interface ValueIR {
	readonly relation: string
	readonly owner: "step" | "scope"
	readonly shape: Shape
	readonly sidecars: ReadonlyArray<{ readonly column: Column; readonly relation: string }>
	readonly families: ReadonlyArray<{ readonly field: ArrayField; readonly relation: string }>
	readonly unions: ReadonlyArray<{
		readonly field: UnionField
		readonly variants: ReadonlyArray<{ readonly variant: Variant; readonly relation: string }>
	}>
}

/** Every relation of a value: its owner's, each option's, each array's family and each tagged union's variants. */
export const valueRelations = (value: ValueIR): ReadonlyArray<string> => [
	value.relation,
	...Arr.map(value.sidecars, (s) => s.relation),
	...Arr.map(value.families, (f) => f.relation),
	...Arr.flatMap(value.unions, (u) => Arr.map(u.variants, (v) => v.relation))
]

/**
 * What a step's or a finish's commit holds beside den's facts: nothing, or the app's ChangeSet over the flow's app role,
 * with each of its parameters its clock binds and the unit of the reading.
 */
export type CommitIR =
	| { readonly kind: "nothing" }
	| {
			readonly kind: "through"
			readonly clock: ReadonlyArray<readonly [string, ClockUnit]>
			/** The parameters of its clock whose consumers' contracts its declaration keys (algebra/kinds.ts ClockKeys). */
			readonly keyed: ReadonlyArray<string>
	  }

/**
 * An edge, lowered: the relation of its facts, the node it leaves (a step kind, or a child scope kind whose finish's
 * commit spawns it in the scope's parent), and the kind it spawns.
 */
export interface EdgeIR {
	readonly name: string
	readonly index: number
	readonly from: string
	readonly to: SpawnedIR
	readonly relation: string
}

/**
 * One named query of a step's declared reads, lowered: its name; the stem its records are named by, the relations
 * grizzle's `records` makes of the query when the fragment loads (`${stem}Row`, keyed by a row's digest alone, so a row
 * every root that found it shares is stored once, and a relation per attachment under it, each a name grizzle derives,
 * readable, its identifiers hashed), which no root's unit holds; and the relation of the step's references to the rows
 * it found, by ordinal, named the stem itself, which no records name is, a body of its root's unit. The records are
 * den's own relations: no flow names them.
 */
export interface ReadIR {
	readonly name: string
	readonly stem: string
	readonly record: string
}

/**
 * A fact a step awaits, lowered: the app relation, and each field of its whole key with the step's input field that
 * holds its value.
 */
export interface AwaitIR {
	readonly relation: string
	readonly key: ReadonlyArray<{ readonly field: string; readonly input: string }>
}

/** A step kind, lowered. */
export interface StepIR {
	readonly name: string
	readonly index: number
	readonly input: ValueIR
	readonly output: ValueIR
	readonly error: Option.Option<ValueIR>
	readonly reads: ReadonlyArray<ReadIR>
	readonly awaits: ReadonlyArray<AwaitIR>
	readonly writes: CommitIR
	readonly edges: ReadonlyArray<EdgeIR>
	readonly uses: ReadonlyArray<string>
	readonly retry: Again
	readonly due: Due<never>
}

/** A step kind as a spawn writes it: its Step row's kind, its kind's index (its due and its input's admission) and its input. */
export interface SpawnedStepIR {
	readonly kind: "step"
	readonly name: string
	readonly index: number
	readonly input: ValueIR
}

/** A scope kind as a spawn opens it: its Within row's kind, its input and its finish step's kind. */
export interface SpawnedScopeIR {
	readonly kind: "scope"
	readonly name: string
	readonly input: ValueIR
	readonly finish: string
}

/**
 * A kind a join's start or an edge spawns, resolved from the declared kind once, by the lowering, which refuses a kind
 * the flow does not declare: so the printer reads what a spawn writes off the reference and looks no kind up by name.
 */
export type SpawnedIR = SpawnedStepIR | SpawnedScopeIR

/**
 * What a finish reads of a child kind: its endings with their inputs and outputs, a step kind's own or a child scope
 * kind's, its finish's, which the finish reads from the steps of the kind in its scope or from the finishes of the child
 * scopes of the kind under it, each child's input by its step or its scope.
 */
export interface FinishReadIR {
	readonly kind: "step" | "scope"
	readonly name: string
	readonly input: ValueIR
	readonly output: ValueIR
}

/**
 * Whether a derived root's key's or input's column of type `type` is one its read can bind or deliver, and its key's
 * text names one way: a text, a bigint or a boolean. A read is declared over a level of the app's below den's
 * fragment, beside the flow, before den lowers the flow's rosters and contracts, so it delivers and binds base columns
 * alone; no double, whose -0 and 0 write alike.
 */
const derivable = (type: ColumnType): boolean => type.kind === "base" && type.base !== "double"

/**
 * Whether a root whose input comes `from` its request or its key records what it was requested with (its kind's
 * RequestedWith): exactly where its request gives its input; a derived input is a derived fact, nothing to compare, a
 * scheduled root's among them (grizzle main's ruling, 2026-11-25). The one place the rule is stated: the fragment's law
 * and the printed requests read it.
 */
export const recordsRequestOf = (from: InputFrom["kind"]): boolean => from === "given"

/**
 * A derived root's key, its kind's key relation (a derived name, lower/names.ts): the relation that keeps the key's
 * fields beside its Root, the fields, in its key struct's order, and the fields PostgreSQL stores beside them as the
 * SHA-256 digest of each text field (`<field>Digest`, `of` the field it digests): a B-tree keys no text of no byte
 * bound, so the key's law keys each text by its digest.
 */
export interface KeyIR {
	readonly relation: string
	readonly fields: ReadonlyArray<string>
	readonly digests: ReadonlyArray<{ readonly name: string; readonly of: string }>
}

/**
 * What only a root has: its trigger, where its input comes from (given, or derived from its key), which decides whether
 * its request records what it was requested with (`recordsRequestOf`), whether it holds an exclusivity seat, and the
 * flows its precondition names.
 */
export interface RootIR {
	readonly trigger: Trigger["kind"]
	readonly from: Readonly<{ kind: "given" }> | Readonly<{ kind: "derived"; key: KeyIR }>
	readonly exclusive: boolean
	readonly idle: ReadonlyArray<string>
}

/** A join (a scope kind or a root), lowered, with its finish. */
export interface JoinIR {
	readonly name: string
	readonly index: number
	readonly root: Option.Option<RootIR>
	readonly input: ValueIR
	readonly children: ReadonlyArray<SpawnedIR>
	readonly finish: {
		readonly name: string
		readonly output: ValueIR
		readonly error: Option.Option<ValueIR>
		readonly writes: CommitIR
		readonly retry: Again
		readonly reads: ReadonlyArray<FinishReadIR>
		/** The edges that leave the scope kind, which its finish's commit spawns in the scope's parent. */
		readonly edges: ReadonlyArray<EdgeIR>
	}
}

/** A resource, lowered: its name and its seats' count. */
export interface ResourceIR {
	readonly name: string
	readonly seats: number
}

/** A flow, lowered. */
export interface Lowered {
	readonly prefix: string
	/** The app role the flow's commits run under, by its stem. */
	readonly writer: string
	readonly rosters: ReadonlyArray<RosterIR>
	readonly brands: ReadonlyArray<BrandIR>
	/** The resources' seats, none when the flow declares no resource. */
	readonly seats: Option.Option<SeatsIR>
	readonly relations: ReadonlyArray<RelationIR>
	readonly laws: ReadonlyArray<LawIR>
	readonly steps: ReadonlyArray<StepIR>
	readonly joins: ReadonlyArray<JoinIR>
	readonly edges: ReadonlyArray<EdgeIR>
	readonly resources: ReadonlyArray<ResourceIR>
	/** What a pause attaches to: each resource, each pause handle and each root kind, by name. */
	readonly pausable: readonly [string, ...Array<string>]
	/**
	 * The relations a spawn writes into, each written by every start and every commit with edges: a child scope is admitted
	 * in the call that opens it, so its admission, its finish and its own start's children are among them.
	 */
	readonly spawning: ReadonlyArray<string>
	/** The relations den's coordinator role inserts into: each chain's turns and their ends. */
	readonly coordination: ReadonlyArray<string>
	/**
	 * The relations a finished root's clearing deletes the rows of, at its root: every graph relation but the root's
	 * own record, what it was requested with (RequestedWith) or a derived root's key, and its claims' holds, which go
	 * with their claims.
	 */
	readonly cleared: ReadonlyArray<string>
	/** The claims' holds, each a member of its claim's ordered family under the flow's seat unit. */
	readonly held: ReadonlyArray<string>
	/** The flows its scopes' preconditions read, each once. */
	readonly idle: ReadonlyArray<string>
	/** The app's relations its steps await a fact of, each once. */
	readonly awaited: ReadonlyArray<string>
}

const all: Selection = { kind: "all" }
const sideOf = (relation: string, terms: ReadonlyArray<string>, selection: Selection): SideIR => ({
	relation,
	selection,
	terms: Arr.map(terms, (field) => ({ field, pred: false }))
})
const side = (relation: string, terms: ReadonlyArray<string>): SideIR =>
	sideOf(relation, terms, all)
const into = (from: SideIR, to: SideIR): LawIR => ({ kind: "contained", from, to })
/** Whether two sides read alike: one relation, every row of it, at the same terms. */
const sameSide = (a: SideIR, b: SideIR): boolean =>
	a.relation === b.relation &&
	a.selection.kind === "all" &&
	b.selection.kind === "all" &&
	a.terms.length === b.terms.length &&
	Arr.every(Arr.zip(a.terms, b.terms), ([x, y]) => x.field === y.field && x.pred === y.pred)
const keyOf = (relation: string, terms: ReadonlyArray<string>): LawIR => ({
	kind: "key",
	side: side(relation, terms)
})

/** The relation names a writes declaration names. */
const writesOf = (commit: AnyCommit): CommitIR => {
	switch (commit.kind) {
		case "nothing":
			return commit
		case "through":
			return {
				kind: "through",
				clock: Record.toEntries(commit.clock),
				keyed: Arr.flatMap(commit.keys, (keys) => Record.keys(keys))
			}
	}
}

/** Lowers a flow to its fragment, refusing a name two of its relations, rosters or brands would share. */
export const lower = (flow: AnyFlow): Lowered => {
	const p = flow.name
	/** Every name the lowering mints, readable or derived, for the census of its names. */
	const minted: Array<Named> = []
	/** One of the flow's singletons, `<P><Word>`, readable, refused as the flow's where it passes PostgreSQL's bytes. */
	const name = (singleton: string): string => {
		const readable = readableOf(p, singleton)
		minted.push(namedReadable(readable))
		return readable
	}
	/** A name derived from the flow's names, readable, held by derived naming (lower/names.ts). */
	const derive = (kind: DerivedKind, pieces: ReadonlyArray<Piece>): Derived => {
		const derived = derivedOf(p, kind, pieces)
		minted.push(namedDerived(derived))
		return derived
	}
	const declaredNaming: NamingIR = { kind: "declared" }
	const derivedNaming = (d: Derived): NamingIR => ({ kind: "derived", ...d.naming })
	const relations: Array<RelationIR> = []
	const laws: Array<LawIR> = []
	const rosters: Array<RosterIR> = []
	const brands: Array<BrandIR> = []
	/** One of the flow's singletons' relations, declared. */
	const relation = (ir: Omit<RelationIR, "naming">): string => {
		relations.push({ ...ir, naming: declaredNaming })
		return ir.name
	}
	/** A relation den derives the name of, held by derived naming. */
	const derivedRelation = (d: Derived, ir: Omit<RelationIR, "name" | "naming">): string => {
		relations.push({ ...ir, name: d.name, naming: derivedNaming(d) })
		return d.name
	}
	const brand = (b: BrandIR): void => {
		const held = Arr.findFirst(brands, (other) => other.name === b.name)
		if (Option.isSome(held) && held.value.base !== b.base) {
			throw new Refused({
				declaration: `flow ${p}`,
				why: `brand ${b.name} brands two bases, ${held.value.base} and ${b.base}`
			})
		}
		if (Option.isNone(held)) {
			brands.push(b)
			minted.push(namedBrand(b.name))
		}
	}
	const fieldOf = (owner: Derived, column: Column): FieldType => {
		switch (column.type.kind) {
			case "contract":
				return { kind: "contract", contract: column.type.contract }
			case "base":
				return { kind: "base", base: column.type.base }
			case "brand":
				brand({ name: column.type.brand, base: column.type.base })
				return { kind: "brand", brand: column.type.brand }
			case "den":
				return { kind: "key", contract: column.type.contract }
			case "vector":
				return { kind: "vector", dimensions: column.type.dimensions }
			case "roster": {
				const roster = derive("roster", [under(owner), declared(column.name)])
				rosters.push({
					name: roster.name,
					naming: derivedNaming(roster),
					handles: column.type.handles
				})
				return { kind: "closed", roster: roster.name }
			}
		}
	}
	/**
	 * Holds every double column of `owner` finite by a row check, as `Schema.Finite`, the one number schema den lowers,
	 * states of its values.
	 */
	const finite = (owner: Derived, columns: ReadonlyArray<Column>): void =>
		Arr.forEach(columns, (c) => {
			if (
				(c.type.kind === "base" || c.type.kind === "brand" || c.type.kind === "contract") &&
				c.type.base === "double"
			) {
				laws.push({
					kind: "check",
					name: finiteCheckOf(p, owner.name, c.name),
					relation: owner.name,
					field: c.name,
					holds: { kind: "finite" }
				})
			}
		})
	const kinds = flow.kinds
	const steps = stepsOf(kinds)
	const joins = joinsOf(kinds)
	const roots = Arr.filter(joins, (j): j is AnyRootKind => j._tag === "Root")
	const stepKey: FieldType = { kind: "digest", names: "step" }
	const scopeKey: FieldType = { kind: "digest", names: "scope" }
	const seatKey: FieldType = { kind: "digest", names: "seat" }
	const instant: FieldType = { kind: "key", contract: "DenInstant" }
	const rowKey: FieldType = { kind: "digest", names: "row" }
	const requestDigest: FieldType = { kind: "digest", names: "request" }
	const text: FieldType = { kind: "base", base: "text" }
	const natural: FieldType = { kind: "natural" }
	const place: FieldType = { kind: "place" }
	const drawnCount: FieldType = { kind: "drawn" }
	const ownerKey = (owner: "step" | "scope"): FieldType => (owner === "step" ? stepKey : scopeKey)

	const kindNames = [
		...Arr.map(steps, (s) => s.name),
		...Arr.map(joins, (j) =>
			handleOf(`${j._tag === "Root" ? "root" : "scope"} ${j.name}`, finishName(j))
		)
	]
	const rootNames = Arr.map(roots, (r) => r.name)
	const childNames = Arr.map(
		Arr.filter(joins, (j) => j._tag === "Scope"),
		(j) => j.name
	)
	const pausable = [
		...Arr.map(flow.resources, (r) => r.name),
		...Arr.map(flow.handles, (h) => h.name),
		...Arr.map(roots, (r) => r.name)
	]
	if (
		!Arr.isReadonlyArrayNonEmpty(kindNames) ||
		!Arr.isReadonlyArrayNonEmpty(rootNames) ||
		!Arr.isReadonlyArrayNonEmpty(pausable)
	) {
		throw new Refused({
			declaration: `flow ${p}`,
			why: "a flow runs at least one root and its finish"
		})
	}
	rosters.push({ naming: declaredNaming, name: name("Kind"), handles: kindNames })
	rosters.push({ naming: declaredNaming, name: name("RootKind"), handles: rootNames })
	if (Arr.isReadonlyArrayNonEmpty(childNames)) {
		rosters.push({ naming: declaredNaming, name: name("ChildKind"), handles: childNames })
	}
	rosters.push({ naming: declaredNaming, name: name("Outcome"), handles: ["done", "failed"] })
	rosters.push({
		naming: declaredNaming,
		name: name("RetryWhy"),
		handles: ["spent", "transient", "later"]
	})
	rosters.push({ naming: declaredNaming, name: name("Pausable"), handles: pausable })
	const resourceNames = Arr.map(flow.resources, (r) => r.name)
	if (Arr.isReadonlyArrayNonEmpty(resourceNames)) {
		rosters.push({ naming: declaredNaming, name: name("Resource"), handles: resourceNames })
	}

	const Scope = relation({
		name: name("Scope"),
		fields: [{ name: "scope", type: scopeKey }],
		key: ["scope"]
	})
	/**
	 * A root as its request recorded it: its scope, the root of every row of its graph, its kind, its trigger's key and the
	 * instant it was requested. A closed fact, never updated or deleted, nor deleted by retirement: a request of its root
	 * again inserts nothing (print.ts requestOfRoot), and once its graph is cleared it holds what was requested and
	 * nothing more.
	 */
	const Root = relation({
		name: name("Root"),
		fields: [
			{ name: "root", type: scopeKey },
			{ name: "kind", type: { kind: "closed", roster: name("RootKind") } },
			{ name: "key", type: text },
			{ name: "at", type: instant }
		],
		key: ["root"]
	})
	/**
	 * What a root whose input its request gives was requested with: the fingerprint of its kind's input heading when
	 * its first request was made (lower/print.ts inputHeadingOf) and the digest of that request's input rows, grizzle's
	 * codec text of each (runtime/identity.ts inputDigest). A closed fact beside its Root, never updated or deleted,
	 * nor deleted by retirement. A request again under the same fingerprint inserts it again, so an equal input meets
	 * it and changes nothing and another input is refused on its key, naming the root: a key names one input. A request
	 * under another fingerprint, after a deploy that changed the kind's input heading, inserts nothing and is answered
	 * as already requested, the same keyed act, so a redelivery across a shape change is idempotent: a reused key with
	 * other content goes undetected only across that boundary, where the two inputs have no one text to compare. A root
	 * whose input derives from its key has none (its key instead), a scheduled root's among them, so no input change
	 * can stop the census that requests it every tick.
	 */
	const RequestedWith = relation({
		name: name("RequestedWith"),
		fields: [
			{ name: "root", type: scopeKey },
			{ name: "fingerprint", type: requestDigest },
			{ name: "input", type: requestDigest }
		],
		key: ["root"]
	})
	const withins: ReadonlyArray<string> = Arr.isReadonlyArrayNonEmpty(childNames)
		? [
				relation({
					name: name("Within"),
					fields: [
						{ name: "scope", type: scopeKey },
						{ name: "parent", type: scopeKey },
						{ name: "kind", type: { kind: "closed", roster: name("ChildKind") } }
					],
					key: ["scope"]
				})
			]
		: []
	const exclusiveKeys: ReadonlyArray<string> = Arr.some(
		roots,
		(j) => j.exclusive.kind === "exclusive"
	)
		? [
				relation({
					name: name("ExclusiveKey"),
					fields: [
						{ name: "scope", type: scopeKey },
						{ name: "key", type: text },
						{ name: "id", type: seatKey }
					],
					key: ["scope"]
				})
			]
		: []
	const Admitted = relation({
		name: name("Admitted"),
		fields: [{ name: "scope", type: scopeKey }],
		key: ["scope"]
	})
	const Skipped = relation({
		name: name("Skipped"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "by", type: scopeKey }
		],
		key: ["scope"]
	})
	const Step = relation({
		name: name("Step"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "kind", type: { kind: "closed", roster: name("Kind") } },
			{ name: "scope", type: scopeKey },
			{ name: "due", type: instant }
		],
		key: ["step"]
	})
	const StartStep = relation({
		name: name("StartStep"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "ordinal", type: natural },
			{ name: "step", type: stepKey }
		],
		key: ["scope", "ordinal"]
	})
	const startScopes: ReadonlyArray<string> = Arr.isReadonlyArrayNonEmpty(childNames)
		? [
				relation({
					name: name("StartScope"),
					fields: [
						{ name: "scope", type: scopeKey },
						{ name: "ordinal", type: natural },
						{ name: "child", type: scopeKey }
					],
					key: ["scope", "ordinal"]
				})
			]
		: []
	const Finish = relation({
		name: name("Finish"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "step", type: stepKey }
		],
		key: ["scope"]
	})
	/**
	 * A claim of a step's attempt, the attempt its place among the step's claims, which the database stamps from 0 as the
	 * claim is inserted, so concurrent claimants serialize on the step's head and none chooses an attempt; with its lease's
	 * end, and, for a flow with resources, its count of the seats it holds, its holds' family. The root stands before the
	 * place, which is last in its key.
	 */
	const Claim = relation({
		name: name("Claim"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: place },
			{ name: "until", type: instant },
			...(Arr.isReadonlyArrayNonEmpty(flow.resources) ? [{ name: "holds", type: drawnCount }] : [])
		],
		key: ["step", "root", "attempt"]
	})
	/**
	 * An attempt's end: a retry, a fence, or its lapse, which the next claim of its step or of one of its seats records
	 * once its lease has passed. A claim after the first follows its predecessor's end, so a step holds at most one
	 * unended claim, and a seat its claim held is free once the claim's attempt ends.
	 */
	const Ended = relation({
		name: name("Ended"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: natural }
		],
		key: ["step", "attempt"]
	})
	const Retry = relation({
		name: name("Retry"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: natural },
			{ name: "at", type: instant },
			{ name: "why", type: { kind: "closed", roster: name("RetryWhy") } }
		],
		key: ["step", "attempt"]
	})
	const Fenced = relation({
		name: name("Fenced"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: natural }
		],
		key: ["step", "attempt"]
	})
	const Result = relation({
		name: name("Result"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "outcome", type: { kind: "closed", roster: name("Outcome") } }
		],
		key: ["step"]
	})
	const Done = relation({
		name: name("Done"),
		fields: [{ name: "step", type: stepKey }],
		key: ["step"]
	})
	const Failed = relation({
		name: name("Failed"),
		fields: [{ name: "step", type: stepKey }],
		key: ["step"]
	})
	const Held = relation({
		name: name("Held"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: natural }
		],
		key: ["step"]
	})
	const Refusal = relation({
		name: name("Refusal"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "law", type: text }
		],
		key: ["step"]
	})
	const Exhausted = relation({
		name: name("Exhausted"),
		fields: [{ name: "step", type: stepKey }],
		key: ["step"]
	})
	const done: Selection = { kind: "handle", field: "outcome", handle: "done" }
	const failed: Selection = { kind: "handle", field: "outcome", handle: "failed" }
	const doneSide = side(Done, ["step"])
	const failedSide = side(Failed, ["step"])
	const ofKind = (kind: string): Selection => ({ kind: "handle", field: "kind", handle: kind })

	Arr.forEach(exclusiveKeys, (k) => laws.push(into(side(k, ["scope"]), side(Scope, ["scope"]))))
	Arr.forEach(withins, (w) =>
		laws.push(
			into(side(w, ["scope"]), side(Scope, ["scope"])),
			into(side(w, ["parent"]), side(Scope, ["scope"]))
		)
	)
	Arr.forEach(startScopes, (started) =>
		laws.push(
			into(side(started, ["scope"]), side(Admitted, ["scope"])),
			into(side(started, ["child"]), side(Scope, ["scope"])),
			keyOf(started, ["child"])
		)
	)
	laws.push(
		into(side(Admitted, ["scope"]), side(Scope, ["scope"])),
		into(side(Skipped, ["scope"]), side(Root, ["root"])),
		into(side(Skipped, ["by"]), side(Root, ["root"])),
		into(side(RequestedWith, ["root"]), side(Root, ["root"])),
		into(side(Step, ["scope"]), side(Admitted, ["scope"])),
		into(side(StartStep, ["scope"]), side(Admitted, ["scope"])),
		into(side(StartStep, ["step"]), side(Step, ["step"])),
		keyOf(StartStep, ["step"]),
		into(side(Finish, ["scope"]), side(Admitted, ["scope"])),
		into(side(Finish, ["step"]), side(Step, ["step"])),
		keyOf(Finish, ["step"]),
		into(side(Claim, ["step"]), side(Step, ["step"])),
		into(side(Ended, ["step", "attempt"]), side(Claim, ["step", "attempt"])),
		into(
			{
				relation: Claim,
				selection: { kind: "atLeast", field: "attempt", bound: 1n },
				terms: [
					{ field: "step", pred: false },
					{ field: "attempt", pred: true }
				]
			},
			side(Ended, ["step", "attempt"])
		),
		into(side(Retry, ["step", "attempt"]), side(Ended, ["step", "attempt"])),
		into(side(Fenced, ["step", "attempt"]), side(Ended, ["step", "attempt"])),
		into(side(Result, ["step"]), side(Step, ["step"])),
		into(side(Held, ["step", "attempt"]), side(Claim, ["step", "attempt"])),
		into(side(Held, ["step"]), side(Result, ["step"])),
		into(side(Done, ["step"]), sideOf(Result, ["step"], done)),
		into(side(Failed, ["step"]), sideOf(Result, ["step"], failed)),
		into(side(Refusal, ["step"]), failedSide),
		into(side(Exhausted, ["step"]), failedSide)
	)
	Arr.forEach(roots, (j) => {
		if (recordsRequestOf(j.from.kind)) {
			laws.push(into(sideOf(Root, ["root"], ofKind(j.name)), side(RequestedWith, ["root"])))
		}
	})

	/**
	 * A value's relations: its owner's row and a relation per optional field, each held to `owned`; a column `keyed`
	 * names is typed as the app's key field it holds (an awaited fact's), so the printed programs join it to that field.
	 */
	const valued = (
		named: Derived,
		owner: "step" | "scope",
		schema: Stored | Shape,
		declaration: string,
		owned: ReadonlyArray<SideIR>,
		keyed: ReadonlyMap<string, FieldType>
	): ValueIR => {
		const shape = "columns" in schema ? schema : shapeOf(declaration, schema)
		const key = owner === "step" ? "step" : "scope"
		const fieldNames = [
			...Arr.map([...shape.columns, ...shape.options], (c) => c.name),
			...Arr.map(shape.arrays, (a) => a.name),
			...Arr.map(shape.unions, (u) => u.name)
		]
		Arr.forEach(fieldNames, (field) => {
			if (field === key || field === "root") {
				throw new Refused({
					declaration,
					why: `its field ${field} is one its relation keeps for itself`
				})
			}
		})
		const relationName = named.name
		derivedRelation(named, {
			fields: [
				{ name: key, type: ownerKey(owner) },
				...Arr.map(shape.columns, (c) => ({
					name: c.name,
					type: Option.getOrElse(Option.fromNullishOr(keyed.get(c.name)), () => fieldOf(named, c))
				})),
				...Arr.map(shape.unions, (u) => ({
					name: u.name,
					type: fieldOf(named, {
						name: u.name,
						type: { kind: "roster", handles: Arr.map(u.variants, (variant) => variant.tag) }
					})
				}))
			],
			key: [key]
		})
		Arr.forEach(owned, (to) => laws.push(into(side(relationName, [key]), to)))
		finite(named, shape.columns)
		const sidecars = Arr.map(shape.options, (column) => {
			const option = derive("option", [under(named), declared(column.name)])
			const sidecar = derivedRelation(option, {
				fields: [
					{ name: key, type: ownerKey(owner) },
					{ name: "value", type: fieldOf(option, column) }
				],
				key: [key]
			})
			laws.push(into(side(sidecar, [key]), side(relationName, [key])))
			finite(option, [{ name: "value", type: column.type }])
			return { column, relation: sidecar }
		})
		const families = Arr.map(shape.arrays, (field) => {
			const array = derive("array", [under(named), declared(field.name)])
			const columns =
				field.element.kind === "value"
					? [{ name: "value", type: field.element.type }]
					: field.element.columns
			const family = derivedRelation(array, {
				fields: [
					{ name: key, type: ownerKey(owner) },
					{ name: "ordinal", type: natural },
					...Arr.map(columns, (c) => ({ name: c.name, type: fieldOf(array, c) }))
				],
				key: [key, "ordinal"]
			})
			laws.push(
				into(side(family, [key]), side(relationName, [key])),
				into(
					{
						relation: family,
						selection: { kind: "atLeast", field: "ordinal", bound: 1n },
						terms: [
							{ field: key, pred: false },
							{ field: "ordinal", pred: true }
						]
					},
					side(family, [key, "ordinal"])
				)
			)
			finite(array, columns)
			return { field, relation: family }
		})
		const unions = Arr.map(shape.unions, (field) => ({
			field,
			variants: Arr.map(field.variants, (variant) => {
				const variantNamed = derive("variant", [
					under(named),
					declared(field.name),
					declared(variant.tag)
				])
				const tagged = sideOf(relationName, [key], {
					kind: "handle",
					field: field.name,
					handle: variant.tag
				})
				const held = derivedRelation(variantNamed, {
					fields: [
						{ name: key, type: ownerKey(owner) },
						...Arr.map(variant.columns, (c) => ({
							name: c.name,
							type: fieldOf(variantNamed, c)
						}))
					],
					key: [key]
				})
				laws.push(into(side(held, [key]), tagged), into(tagged, side(held, [key])))
				finite(variantNamed, variant.columns)
				return { variant, relation: held }
			})
		}))
		return { relation: relationName, owner, shape, sidecars, families, unions }
	}

	const at = (kindName: string): number =>
		Option.match(
			Arr.findFirstIndex(kinds, (k) => k.name === kindName),
			{
				onNone: () => {
					throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} is declared` })
				},
				onSome: (index) => index
			}
		)

	/**
	 * The input columns a step's awaited facts are keyed by, each typed as the key field it holds, refused where one
	 * column would hold the keys of two fields.
	 */
	const keyedBy = (s: AnyStepKind): ReadonlyMap<string, FieldType> => {
		const keyed = new Map<string, FieldType>()
		Arr.forEach(s.awaits, (awaited) =>
			Arr.forEach(Record.toEntries(awaited.key), ([field, input]) => {
				const type: FieldType = { kind: "app", relation: awaited.relation.name, field }
				const held = keyed.get(input)
				if (
					held !== undefined &&
					!(held.kind === "app" && held.relation === type.relation && held.field === field)
				) {
					throw new Refused({
						declaration: `step ${s.name}`,
						why: `its input field ${input} would hold the keys of two awaited fields`
					})
				}
				keyed.set(input, type)
			})
		)
		return keyed
	}
	const unkeyed: ReadonlyMap<string, FieldType> = new Map()
	const inputs = new Map<string, ValueIR>()
	Arr.forEach(steps, (s) =>
		inputs.set(
			s.name,
			valued(
				derive("input", [declared(p), declared(s.name), word("Input")]),
				"step",
				s.input,
				`step ${s.name}`,
				[sideOf(Step, ["step"], ofKind(s.name))],
				keyedBy(s)
			)
		)
	)
	Arr.forEach(joins, (j) =>
		inputs.set(
			j.name,
			valued(
				derive("input", [declared(p), declared(j.name), word("Input")]),
				"scope",
				j.input,
				`${j._tag === "Root" ? "root" : "scope"} ${j.name}`,
				[
					j._tag === "Root"
						? sideOf(Root, ["root"], ofKind(j.name))
						: sideOf(name("Within"), ["scope"], ofKind(j.name))
				],
				unkeyed
			)
		)
	)
	const inputOf = (kindName: string): ValueIR =>
		Option.getOrElse(Option.fromNullishOr(inputs.get(kindName)), () => {
			throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} takes an input` })
		})

	/**
	 * Each derived root's key, by its kind's name: the fields its request names, kept beside its Root in
	 * its kind's key relation, keyed by the root, closed and outside the cleared unit like the Root itself, contained in the
	 * kind's Root and containing it, so no derived root stands without its key, nor a key without its root, a retired
	 * root's among them. Its fields and its input's are columns of a text, a bigint or a boolean (`derivable`), so its
	 * text is one way (runtime/bind.ts derivedKey) and its read is bound by them as its params and delivers its input
	 * as one row of such columns. Its fields key it too, each text by its digest (`<field>Digest`, a field den declares
	 * beside it, since a key text holds no byte bound), so one key's fields name one root: a request of them under
	 * another key text (a field renamed) is refused where a root of them stands, never a second root drawn. A key names
	 * one field at least, which its law keys.
	 */
	const keys = new Map<string, KeyIR>()
	Arr.forEach(roots, (j) => {
		if (j.from.kind !== "derived") {
			return
		}
		const declaration = `root ${j.name}'s key`
		const keyNamed = derive("key", [declared(p), declared(j.name), word("Key")])
		const relationName = keyNamed.name
		const shape = shapeOf(declaration, j.from.key)
		Arr.forEach(
			[
				[declaration, shape],
				[`root ${j.name}'s derived input`, inputOf(j.name).shape]
			] as const,
			([refused, held]) => {
				if (
					Arr.isReadonlyArrayNonEmpty(held.options) ||
					Arr.isReadonlyArrayNonEmpty(held.arrays) ||
					Arr.isReadonlyArrayNonEmpty(held.unions)
				) {
					throw new Refused({
						declaration: refused,
						why: "it holds columns alone, no Option, array or tagged union, the one row a read binds or delivers"
					})
				}
				Arr.forEach(held.columns, (c) => {
					if (c.name === "root") {
						throw new Refused({
							declaration: refused,
							why: "its field root is one its relation keeps for itself"
						})
					}
					if (!derivable(c.type)) {
						throw new Refused({
							declaration: refused,
							why: `its field ${c.name} is no text, bigint or boolean, the columns a read of a level of the app's binds or delivers`
						})
					}
				})
			}
		)
		const digests = Arr.flatMap(shape.columns, (c) =>
			c.type.kind === "base" && c.type.base === "text"
				? [{ name: `${c.name}Digest`, of: c.name }]
				: []
		)
		Arr.forEach(digests, (d) => {
			if (Arr.some(shape.columns, (c) => c.name === d.name)) {
				throw new Refused({
					declaration,
					why: `its field ${d.name} names the digest den keys its text field ${d.of} by`
				})
			}
		})
		if (!Arr.isReadonlyArrayNonEmpty(shape.columns)) {
			throw new Refused({
				declaration,
				why: "it names no field, and a key names what its root is requested by"
			})
		}
		derivedRelation(keyNamed, {
			fields: [
				{ name: "root", type: scopeKey },
				...Arr.map(shape.columns, (c) => ({ name: c.name, type: fieldOf(keyNamed, c) }))
			],
			key: ["root"]
		})
		laws.push(
			keyOf(
				relationName,
				Arr.map(shape.columns, (c) =>
					Option.match(
						Arr.findFirst(digests, (d) => d.of === c.name),
						{ onNone: () => c.name, onSome: (d) => d.name }
					)
				)
			)
		)
		laws.push(into(side(relationName, ["root"]), sideOf(Root, ["root"], ofKind(j.name))))
		laws.push(into(sideOf(Root, ["root"], ofKind(j.name)), side(relationName, ["root"])))
		keys.set(j.name, {
			relation: relationName,
			fields: Arr.map(shape.columns, (c) => c.name),
			digests
		})
	})

	/**
	 * Each node's output, by its kind's name: a step kind's, held only where its step is done and its input holds it, and
	 * a scope kind's, its finish's, held only where its finish is done; an edge leaves a node only from its output, so a
	 * node that failed spawns nothing.
	 */
	const outputs = new Map<string, ValueIR>()
	Arr.forEach(steps, (s) =>
		outputs.set(
			s.name,
			valued(
				derive("output", [declared(p), declared(s.name), word("Output")]),
				"step",
				s.output,
				`step ${s.name}`,
				[side(inputOf(s.name).relation, ["step"]), doneSide],
				unkeyed
			)
		)
	)
	Arr.forEach(joins, (j) =>
		outputs.set(
			j.name,
			valued(
				derive("output", [declared(p), declared(j.name), word("Finish"), word("Output")]),
				"step",
				j.finish.output,
				`${j._tag === "Root" ? "root" : "scope"} ${j.name}`,
				[doneSide],
				unkeyed
			)
		)
	)
	const outputOf = (kindName: string): ValueIR =>
		Option.getOrElse(Option.fromNullishOr(outputs.get(kindName)), () => {
			throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} gives an output` })
		})

	const spawnedOf = (kind: { readonly _tag: string; readonly name: string }): SpawnedIR =>
		kind._tag === "Step"
			? { kind: "step", name: kind.name, index: at(kind.name), input: inputOf(kind.name) }
			: { kind: "scope", name: kind.name, input: inputOf(kind.name), finish: finishName(kind) }

	const edgesIR: ReadonlyArray<EdgeIR> = Arr.map(flow.edges, (e, index) => {
		const to = spawnedOf(e.to)
		const edgeRelation = derivedRelation(derive("edge", [declared(p), declared(e.name)]), {
			fields: [
				{ name: "from", type: stepKey },
				{ name: "ordinal", type: natural },
				{ name: "to", type: ownerKey(to.kind) }
			],
			key: ["from", "ordinal"]
		})
		laws.push(
			into(side(edgeRelation, ["from"]), side(outputOf(e.from.name).relation, ["step"])),
			into(side(edgeRelation, ["to"]), side(to.input.relation, [to.kind])),
			keyOf(edgeRelation, ["to"])
		)
		return { name: e.name, index, from: e.from.name, to, relation: edgeRelation }
	})

	/**
	 * A step's records: per named query, the records grizzle makes of it, keyed by the digest of a row's text alone, so
	 * a row any step of any root found is stored once, content-addressed, and a relation of the step's references to
	 * them, keyed by the step and the row's place in what it found, each contained in its row and in the step's result.
	 */
	const readsOf = (s: AnyStepKind): ReadonlyArray<ReadIR> => {
		if (s.reads.kind === "none") {
			return []
		}
		return Arr.map(Record.toEntries(s.reads.named), ([readName, query]): ReadIR => {
			const read = derive("read", [declared(p), declared(s.name), word("Read"), declared(readName)])
			const stem = read.name
			Arr.forEach(
				records(stem, query, { digest: sha256 }, ["digest"], { names: {} }).relations,
				(made) => minted.push(namedRecords(stem, made.name))
			)
			const record = derivedRelation(read, {
				fields: [
					{ name: "step", type: stepKey },
					{ name: "ordinal", type: natural },
					{ name: "digest", type: rowKey }
				],
				key: ["step", "ordinal"]
			})
			laws.push(
				into(side(record, ["step"]), side(Result, ["step"])),
				into(side(record, ["digest"]), side(`${stem}Row`, ["digest"]))
			)
			return { name: readName, stem, record }
		})
	}

	/**
	 * The facts a step awaits: each refused unless its key fields are its relation's whole key and each names a column
	 * of the step's input.
	 */
	const awaitsOf = (s: AnyStepKind, input: ValueIR): ReadonlyArray<AwaitIR> =>
		Arr.map(s.awaits, (awaited): AwaitIR => {
			const declaration = `step ${s.name}, its awaited ${awaited.relation.name}`
			const key = awaited.relation.primaryKey
			const named = Record.keys(awaited.key)
			if (
				!Arr.isReadonlyArrayNonEmpty(key) ||
				named.length !== key.length ||
				!Arr.every(key, (field) => Arr.contains(named, field))
			) {
				throw new Refused({
					declaration,
					why: `it names ${Arr.join(named, ", ")}, where a fact is named by its whole key`
				})
			}
			const columns = Arr.map(input.shape.columns, (c) => c.name)
			return {
				relation: awaited.relation.name,
				key: Arr.map(key, (field) => {
					const from = awaited.key[field]
					if (from === undefined || !Arr.contains(columns, from)) {
						throw new Refused({
							declaration,
							why: `its key field ${field} is held by ${String(from)}, no column of the step's input`
						})
					}
					return { field, input: from }
				})
			}
		})

	const stepsIR: ReadonlyArray<StepIR> = Arr.map(steps, (s) => {
		const declaration = `step ${s.name}`
		const input = inputOf(s.name)
		const output = outputOf(s.name)
		const error = Option.map(errorShapeOf(declaration, s.error), (shape) =>
			valued(
				derive("error", [declared(p), declared(s.name), word("Error")]),
				"step",
				shape,
				declaration,
				[side(input.relation, ["step"]), failedSide],
				unkeyed
			)
		)
		return {
			name: s.name,
			index: at(s.name),
			input,
			output,
			error,
			reads: readsOf(s),
			awaits: awaitsOf(s, input),
			writes: writesOf(s.writes),
			edges: Arr.filter(edgesIR, (e) => e.from === s.name),
			uses: Arr.map(s.uses, (r) => r.name),
			retry: s.retry,
			due: s.due
		}
	})

	const joinsIR: ReadonlyArray<JoinIR> = Arr.map(joins, (j: AnyJoin): JoinIR => {
		const declaration = `${j._tag === "Root" ? "root" : "scope"} ${j.name}`
		const finish = finishName(j)
		const error = Option.map(errorShapeOf(declaration, j.finish.error), (shape) =>
			valued(
				derive("error", [declared(p), declared(j.name), word("Finish"), word("Error")]),
				"step",
				shape,
				declaration,
				[side(Step, ["step"]), failedSide],
				unkeyed
			)
		)
		return {
			name: j.name,
			index: at(j.name),
			root:
				j._tag === "Root"
					? Option.some({
							trigger: j.trigger.kind,
							from: Option.match(Option.fromNullishOr(keys.get(j.name)), {
								onNone: () => ({ kind: "given" as const }),
								onSome: (key) => ({ kind: "derived" as const, key })
							}),
							exclusive: j.exclusive.kind === "exclusive",
							idle: j.precondition.kind === "idle" ? j.precondition.flows : []
						})
					: Option.none(),
			input: inputOf(j.name),
			children: Arr.map(j.children, spawnedOf),
			finish: {
				name: finish,
				output: outputOf(j.name),
				error,
				writes: writesOf(j.finish.writes),
				retry: j.finish.retry,
				reads: Arr.map(j.finish.reads, (read): FinishReadIR => ({
					kind: read._tag === "Step" ? "step" : "scope",
					name: read.name,
					input: inputOf(read.name),
					output: outputOf(read.name)
				})),
				edges: Arr.filter(edgesIR, (e) => e.from === j.name)
			}
		}
	})

	/**
	 * A chain of turns over `coordinates`: `held` keyed by the coordinates and its turn, beside `payload`, and `ended`,
	 * one row per turn ended, contained in it; each turn after the first is contained in its predecessor's end, so a
	 * chain holds at most one turn not ended, its latest.
	 */
	const chainOf = (
		held: string,
		ended: string,
		coordinates: ReadonlyArray<{ readonly name: string; readonly type: FieldType }>,
		payload: ReadonlyArray<{ readonly name: string; readonly type: FieldType }>
	): readonly [string, string] => {
		const turnKey = Arr.append(
			Arr.map(coordinates, (c) => c.name),
			"turn"
		)
		const turn = { name: "turn", type: natural }
		const turns = relation({ name: held, fields: [...coordinates, turn, ...payload], key: turnKey })
		const ends = relation({ name: ended, fields: [...coordinates, turn], key: turnKey })
		laws.push(into(side(ends, turnKey), side(turns, turnKey)), {
			kind: "contained",
			from: {
				relation: turns,
				selection: all,
				terms: [
					...Arr.map(coordinates, (c) => ({ field: c.name, pred: false })),
					{ field: "turn", pred: true }
				]
			},
			to: side(ends, turnKey)
		})
		return [turns, ends]
	}

	const coordination: Array<string> = []
	const resourceRows = Arr.map(flow.resources, (r) => ({
		handle: r.name,
		count: BigInt(r.seats)
	}))
	const counts: Option.Option<CountsIR> = Arr.isReadonlyArrayNonEmpty(resourceRows)
		? Option.some({
				name: name("Seats"),
				key: { field: "resource", roster: name("Resource") },
				count: "seats",
				rows: resourceRows
			})
		: Option.none()
	/**
	 * A seat a claim holds, a member of its claim's ordered family, one a resource: the resource, the claim's root, step
	 * and attempt, its place among the claim's holds, and the resource's seat. It is written nested under its claim in the
	 * claim's own write, which supplies the attempt the database stamps, and lapses with its claim, so it carries no lease
	 * of its own and names no holder but its claim; a clearing of its claim's root deletes it with its claim. Keyed by its
	 * resource first, it sits under the flow's seat unit, `<P>Seat`, so every write of a resource's holds holds that
	 * resource, and the live holds' laws, at most one a seat and each below its resource's count, are judged inside it.
	 */
	const seats = Option.map(counts, (seatCounts): SeatsIR => {
		const resource = {
			name: seatCounts.key.field,
			type: { kind: "closed", roster: seatCounts.key.roster } satisfies FieldType
		}
		const Hold = relation({
			name: name("Hold"),
			fields: [
				resource,
				{ name: "root", type: scopeKey },
				{ name: "step", type: stepKey },
				{ name: "attempt", type: natural },
				{ name: "at", type: drawnCount },
				{ name: "seat", type: natural }
			],
			key: ["resource", "root", "step", "attempt"]
		})
		laws.push(
			{ kind: "unit", name: name("Seat"), heading: [resource] },
			{
				kind: "ordered",
				member: side(Hold, ["root", "step", "attempt", "at"]),
				owner: Claim,
				count: "holds"
			},
			{ kind: "mutable", relation: Hold }
		)
		return {
			counts: seatCounts,
			hold: Hold,
			live: name("Live"),
			bound: name("SeatBelowCount")
		}
	})
	if (Arr.isReadonlyArrayNonEmpty(exclusiveKeys)) {
		coordination.push(
			...chainOf(
				name("Exclusive"),
				name("Released"),
				[
					{ name: "kind", type: { kind: "closed", roster: name("RootKind") } },
					{ name: "key", type: seatKey }
				],
				[{ name: "scope", type: scopeKey }]
			)
		)
	}
	coordination.push(
		...chainOf(
			name("Paused"),
			name("Resumed"),
			[{ name: "target", type: { kind: "closed", roster: name("Pausable") } }],
			[]
		)
	)
	/**
	 * Each deployment an environment served, from the instant its deploy step promoted it, on the database's clock: the
	 * environment serves its latest, so a promotion replaces the deployment before it with no update, and a turn on a
	 * deployment its environment no longer serves ends itself (runtime/turn.ts invoke).
	 */
	const Served = relation({
		name: name("Served"),
		fields: [
			{ name: "environment", type: { kind: "key", contract: "DenEnvironment" } },
			{ name: "at", type: { kind: "key", contract: "DenInstant" } },
			{ name: "deployment", type: { kind: "base", base: "text" } }
		],
		key: ["environment", "at"]
	})
	coordination.push(Served)

	const spawning = [
		Step,
		Scope,
		...withins,
		Admitted,
		Finish,
		StartStep,
		...startScopes,
		...Arr.flatMap(stepsIR, (s) => valueRelations(s.input)),
		...Arr.flatMap(
			Arr.filter(joinsIR, (j: JoinIR) => Option.isNone(j.root)),
			(j: JoinIR) => valueRelations(j.input)
		),
		...Arr.map(edgesIR, (e) => e.relation)
	]

	/**
	 * Every root's graph sits under one unit of grizzle's, `DenRoot`, keyed by the root's scope, `root`, which every
	 * flow's fragment states alike and so one unit, the roots being digests that no two flows share: every graph
	 * relation but the root's own record carries its root as `root`, first in its key and on both sides of every
	 * containment and key between them, so every write of a graph's rows holds its root. A root's record is closed, the
	 * fact that it was requested, and so is what it was requested with (RequestedWith) and a derived root's key
	 * (its kind's key relation); every other graph relation is mutable inside the unit, since a finished root's graph is cleared
	 * under its root, every row of it deleted but those. A claim's holds sit under the flow's seat unit and are cleared
	 * with their claims. The coordination group is no part of any unit: its chains of turns outlive the graphs whose
	 * steps took them.
	 *
	 * A row's root is its owner's. Each identity is held by one relation keyed by it alone beside its root, a step by
	 * Step and a scope by Scope, since den derives it from its parent's (runtime/identity.ts): it names one row, of one
	 * root. Every other graph relation leads its fields with its owner, the identity its row lives under, and is
	 * contained by its root and its owner in its owner's holder; Step's owner is its scope, and Scope's is its root,
	 * its record. So a read that fixes a step or a scope fixes its root, the unit every row of it sits in: a
	 * containment onto a key of one field gives the field it pairs with the key every other field it pairs (grizzle's
	 * declared statistics, its dependencies), and each row's own containment in its root's record follows, through its
	 * holder's.
	 */
	const held = Arr.map(Option.toArray(seats), (st) => st.hold)
	const bodies = new Set(
		Arr.filter(
			Arr.map(relations, (r) => r.name),
			(r) =>
				r !== Root &&
				r !== RequestedWith &&
				!Arr.some(Array.from(keys.values()), (key) => key.relation === r) &&
				!Arr.contains(coordination, r) &&
				!Arr.contains(held, r)
		)
	)
	const rootField = { name: "root", type: scopeKey }
	const rooted = Arr.map(relations, (r): RelationIR =>
		bodies.has(r.name)
			? {
					...r,
					fields: [rootField, ...Arr.filter(r.fields, (f) => f.name !== "root")],
					key: ["root", ...Arr.filter(r.key, (f) => f !== "root")]
				}
			: r
	)
	const rootTerm = { field: "root", pred: false }
	const onRoot = (on: SideIR): SideIR => ({ ...on, terms: [rootTerm, ...on.terms] })
	const flowLaws = Arr.map(laws, (law): LawIR => {
		switch (law.kind) {
			case "contained":
				return bodies.has(law.from.relation) && bodies.has(law.to.relation)
					? { ...law, from: onRoot(law.from), to: onRoot(law.to) }
					: law
			case "key":
				return bodies.has(law.side.relation) ? { ...law, side: onRoot(law.side) } : law
			case "race":
			case "check":
			case "unit":
			case "mutable":
			case "ordered":
				return law
		}
	})
	const holders: Readonly<Record<Identity, string>> = { step: Step, scope: Scope }
	/** The identity a field names, where it names one. */
	const identityOf = (type: FieldType): Option.Option<Identity> =>
		type.kind === "digest" && (type.names === "step" || type.names === "scope")
			? Option.some(type.names)
			: Option.none()
	/** A body's owner: its first field naming an identity it does not hold, none for Scope, which names no other. */
	const ownerOf = (
		body: RelationIR
	): Option.Option<{ readonly field: string; readonly identity: Identity }> =>
		Arr.findFirst(body.fields, (f) =>
			Option.filter(
				Option.map(identityOf(f.type), (identity) => ({ field: f.name, identity })),
				(owner) => holders[owner.identity] !== body.name
			)
		)
	/** A body's containment in its owner's holder by its root and its owner, or Scope's in its root's record by its root. */
	const ownerLaw = (body: RelationIR): LawIR =>
		Option.match(ownerOf(body), {
			onNone: () => into(side(body.name, ["root"]), side(Root, ["root"])),
			onSome: (owner) =>
				into(
					side(body.name, ["root", owner.field]),
					side(holders[owner.identity], ["root", owner.identity])
				)
		})
	const statesAlready = (law: LawIR): boolean =>
		law.kind === "contained" &&
		Arr.some(
			flowLaws,
			(stated) =>
				stated.kind === "contained" &&
				sameSide(stated.from, law.from) &&
				sameSide(stated.to, law.to)
		)
	const rootedLaws: ReadonlyArray<LawIR> = [
		{ kind: "unit", name: "DenRoot", heading: [rootField] },
		keyOf(Scope, ["scope"]),
		keyOf(Step, ["step"]),
		...flowLaws,
		...Arr.flatMap(
			Arr.filter(relations, (r: RelationIR) => bodies.has(r.name)),
			(body: RelationIR): ReadonlyArray<LawIR> => {
				const owned = ownerLaw(body)
				return [...(statesAlready(owned) ? [] : [owned]), { kind: "mutable", relation: body.name }]
			}
		)
	]

	censusOf(p, minted)

	return {
		prefix: p,
		writer: flow.writes.name,
		rosters,
		brands,
		seats,
		relations: rooted,
		laws: rootedLaws,
		cleared: Array.from(bodies),
		held,
		steps: stepsIR,
		joins: joinsIR,
		edges: edgesIR,
		resources: Arr.map(flow.resources, (r) => ({ name: r.name, seats: r.seats })),
		pausable,
		spawning,
		coordination,
		idle: Arr.dedupe(
			Arr.flatMap(joinsIR, (j) => Option.match(j.root, { onNone: () => [], onSome: (r) => r.idle }))
		),
		awaited: Arr.dedupe(Arr.flatMap(stepsIR, (s) => Arr.map(s.awaits, (a) => a.relation)))
	}
}
