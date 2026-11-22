import type { ClockUnit } from "@bjornpagen/grizzle"
import { Array as Arr, Option, Record, String as Str } from "effect"
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
	type Due,
	type Again,
	Refused,
	type Stored,
	type Trigger
} from "#algebra/kinds.ts"
import {
	type ArrayField,
	type Base,
	type Column,
	type DenKey,
	errorShapeOf,
	type Shape,
	shapeOf,
	type UnionField,
	type Variant
} from "#lower/schema.ts"

/**
 * A flow lowered to a fragment, as data: the rosters, contracts, relations and laws the app lists in its own
 * `schema(...)` as the flow's graph and coordination fragments, every name under the flow's prefix, and the kinds, joins and edges the programs and the binding are
 * printed from. The fragment's relations are an ordered list, the form grizzle's `schema()` takes, which refuses two
 * declarations of one name that differ as `DuplicateIdentity`.
 *
 * Two groups of relations, by who writes them, each insert-only for every role, its every law a key, a containment or
 * a row check; each role certifies at the level grizzle's generate gives its writes (docs/build/repin.md), and every
 * call of each runs again on a transient refusal (runtime/ledger.ts Settled). The graph (scopes, steps, claims,
 * results, values, edges) is written by den's role and the app's writer role. The coordination group is written by
 * den's coordinator role alone: each seat, exclusivity seat and pause is a chain of turns, a turn held and then ended
 * (`Hold`/`Freed`, `Exclusive`/`Released`, `Paused`/`Resumed`), each turn after the first contained in its
 * predecessor's end, so a chain holds at most one live turn, its latest, and nothing is ever deleted. A resource's seat
 * count is a closed relation, which every live hold's seat is checked below on the seat level (SeatsIR).
 */

/** What a lowered field holds. */
export type FieldType =
	| { readonly kind: "key"; readonly contract: DenKey }
	| { readonly kind: "digest" }
	| { readonly kind: "natural" }
	| { readonly kind: "place" }
	| { readonly kind: "drawn" }
	| { readonly kind: "closed"; readonly roster: string }
	| { readonly kind: "brand"; readonly brand: string }
	| { readonly kind: "base"; readonly base: Base }
	| { readonly kind: "retirement" }
	| { readonly kind: "app"; readonly relation: string; readonly field: string }
	| { readonly kind: "vector"; readonly dimensions: number }

/** A lowered relation: its name, its fields in order, and its primary key. */
export interface RelationIR {
	readonly name: string
	readonly fields: ReadonlyArray<{ readonly name: string; readonly type: FieldType }>
	readonly key: readonly [string, ...Array<string>]
}

/** A roster: its name and handles, in code order. */
export interface RosterIR {
	readonly name: string
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

/** A law of the fragment: a containment, a key, a race, or a row check holding a natural field to at least a constant. */
export type LawIR =
	| { readonly kind: "contained"; readonly from: SideIR; readonly to: SideIR }
	| {
			readonly kind: "reachable"
			/** The stem of the records it keeps, whose root is `${records}Row`, owned by a row's digest. */
			readonly records: string
			/** The sides whose facts hold a record live, each by the digest it names, every one a body of a root's unit. */
			readonly holders: readonly [SideIR, ...Array<SideIR>]
	  }
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
			readonly kind: "retirable"
			readonly header: string
			readonly bodies: ReadonlyArray<string>
	  }
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
	| { readonly kind: "through"; readonly clock: ReadonlyArray<readonly [string, ClockUnit]> }

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
 * every root that found it shares is stored once, and a relation per attachment under it, each the stem and a suffix),
 * which den names nothing of but the root and which no root's unit holds; and the relation of the step's references to
 * the rows it found, by ordinal, named the stem itself, which no records name is, a body of its root's unit.
 */
export interface ReadIR {
	readonly name: string
	readonly stem: string
	readonly record: string
	/** Whether its step's reads state relation names for its records (kinds.ts ReadsNames), which den forwards. */
	readonly statesNames: boolean
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

/** What only a root has: its trigger, whether it holds an exclusivity seat, and the flows its precondition names. */
export interface RootIR {
	readonly trigger: Trigger<never>["kind"]
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
	/** The relations the request of a root the app's own write starts writes. */
	readonly requesting: ReadonlyArray<string>
	/** The relations den's coordinator role inserts into: each chain's turns and their ends. */
	readonly coordination: ReadonlyArray<string>
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
const keyOf = (relation: string, terms: ReadonlyArray<string>): LawIR => ({
	kind: "key",
	side: side(relation, terms)
})

const capitalized = (text: string): string => Str.capitalize(text)

/** The relation names a writes declaration names. */
const writesOf = (declared: AnyCommit): CommitIR => {
	switch (declared.kind) {
		case "nothing":
			return declared
		case "through":
			return { kind: "through", clock: Record.toEntries(declared.clock) }
	}
}

/** Lowers a flow to its fragment, refusing a name two of its relations, rosters or brands would share. */
export const lower = (flow: AnyFlow): Lowered => {
	const p = flow.name
	const name = (suffix: string) => `${p}${suffix}`
	const relations: Array<RelationIR> = []
	const laws: Array<LawIR> = []
	const rosters: Array<RosterIR> = []
	const brands: Array<BrandIR> = []
	const relation = (ir: RelationIR): string => {
		relations.push(ir)
		return ir.name
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
		}
	}
	const fieldOf = (owner: string, column: Column): FieldType => {
		switch (column.type.kind) {
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
				const roster = `${owner}${capitalized(column.name)}`
				rosters.push({ name: roster, handles: column.type.handles })
				return { kind: "closed", roster }
			}
		}
	}
	/**
	 * Holds every double column of `relationName` finite by a row check, as `Schema.Finite`, the one number schema den
	 * lowers, states of its values.
	 */
	const finite = (relationName: string, columns: ReadonlyArray<Column>): void =>
		Arr.forEach(columns, (c) => {
			if ((c.type.kind === "base" || c.type.kind === "brand") && c.type.base === "double") {
				laws.push({
					kind: "check",
					name: `${relationName}${capitalized(c.name)}Finite`,
					relation: relationName,
					field: c.name,
					holds: { kind: "finite" }
				})
			}
		})
	const kinds = flow.kinds
	const steps = stepsOf(kinds)
	const joins = joinsOf(kinds)
	const roots = Arr.filter(joins, (j): j is AnyRootKind => j._tag === "Root")
	const digest: FieldType = { kind: "digest" }
	const stepKey = digest
	const scopeKey = digest
	const instant: FieldType = { kind: "key", contract: "DenInstant" }
	const rowKey = digest
	const text: FieldType = { kind: "base", base: "text" }
	const natural: FieldType = { kind: "natural" }
	const place: FieldType = { kind: "place" }
	const drawnCount: FieldType = { kind: "drawn" }
	const ownerKey = (owner: "step" | "scope"): FieldType => (owner === "step" ? stepKey : scopeKey)

	const kindNames = [...Arr.map(steps, (s) => s.name), ...Arr.map(joins, finishName)]
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
	rosters.push({ name: name("Kind"), handles: kindNames })
	rosters.push({ name: name("RootKind"), handles: rootNames })
	if (Arr.isReadonlyArrayNonEmpty(childNames)) {
		rosters.push({ name: name("ChildKind"), handles: childNames })
	}
	rosters.push({ name: name("Outcome"), handles: ["done", "failed"] })
	rosters.push({ name: name("RetryWhy"), handles: ["spent", "transient", "later"] })
	rosters.push({ name: name("Pausable"), handles: pausable })
	const resourceNames = Arr.map(flow.resources, (r) => r.name)
	if (Arr.isReadonlyArrayNonEmpty(resourceNames)) {
		rosters.push({ name: name("Resource"), handles: resourceNames })
	}

	const Scope = relation({
		name: name("Scope"),
		fields: [{ name: "scope", type: scopeKey }],
		key: ["scope"]
	})
	const Root = relation({
		name: name("Root"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "kind", type: { kind: "closed", roster: name("RootKind") } },
			{ name: "key", type: text },
			{ name: "at", type: instant }
		],
		key: ["scope"]
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
						{ name: "id", type: digest }
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
		into(side(Skipped, ["scope"]), side(Root, ["scope"])),
		into(side(Skipped, ["by"]), side(Root, ["scope"])),
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

	/**
	 * A value's relations: its owner's row and a relation per optional field, each held to `owned`; a column `keyed`
	 * names is typed as the app's key field it holds (an awaited fact's), so the printed programs join it to that field.
	 */
	const valued = (
		relationName: string,
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
		relation({
			name: relationName,
			fields: [
				{ name: key, type: ownerKey(owner) },
				...Arr.map(shape.columns, (c) => ({
					name: c.name,
					type: Option.getOrElse(Option.fromNullishOr(keyed.get(c.name)), () =>
						fieldOf(relationName, c)
					)
				})),
				...Arr.map(shape.unions, (u) => ({
					name: u.name,
					type: fieldOf(relationName, {
						name: u.name,
						type: { kind: "roster", handles: Arr.map(u.variants, (variant) => variant.tag) }
					})
				}))
			],
			key: [key]
		})
		Arr.forEach(owned, (to) => laws.push(into(side(relationName, [key]), to)))
		finite(relationName, shape.columns)
		const sidecars = Arr.map(shape.options, (column) => {
			const sidecar = relation({
				name: `${relationName}${capitalized(column.name)}`,
				fields: [
					{ name: key, type: ownerKey(owner) },
					{ name: "value", type: fieldOf(`${relationName}${capitalized(column.name)}`, column) }
				],
				key: [key]
			})
			laws.push(into(side(sidecar, [key]), side(relationName, [key])))
			finite(sidecar, [{ name: "value", type: column.type }])
			return { column, relation: sidecar }
		})
		const families = Arr.map(shape.arrays, (field) => {
			const familyName = `${relationName}${capitalized(field.name)}`
			const columns =
				field.element.kind === "value"
					? [{ name: "value", type: field.element.type }]
					: field.element.columns
			const family = relation({
				name: familyName,
				fields: [
					{ name: key, type: ownerKey(owner) },
					{ name: "ordinal", type: natural },
					...Arr.map(columns, (c) => ({ name: c.name, type: fieldOf(familyName, c) }))
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
			finite(family, columns)
			return { field, relation: family }
		})
		const unions = Arr.map(shape.unions, (field) => ({
			field,
			variants: Arr.map(field.variants, (variant) => {
				const variantName = `${relationName}${capitalized(field.name)}${variant.tag}`
				const tagged = sideOf(relationName, [key], {
					kind: "handle",
					field: field.name,
					handle: variant.tag
				})
				const held = relation({
					name: variantName,
					fields: [
						{ name: key, type: ownerKey(owner) },
						...Arr.map(variant.columns, (c) => ({ name: c.name, type: fieldOf(variantName, c) }))
					],
					key: [key]
				})
				laws.push(into(side(held, [key]), tagged), into(tagged, side(held, [key])))
				finite(held, variant.columns)
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
				name(`${s.name}Input`),
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
				name(`${j.name}Input`),
				"scope",
				j.input,
				`${j._tag === "Root" ? "root" : "scope"} ${j.name}`,
				[sideOf(j._tag === "Root" ? Root : name("Within"), ["scope"], ofKind(j.name))],
				unkeyed
			)
		)
	)
	const inputOf = (kindName: string): ValueIR =>
		Option.getOrElse(Option.fromNullishOr(inputs.get(kindName)), () => {
			throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} takes an input` })
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
				name(`${s.name}Output`),
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
				name(`${finishName(j)}Output`),
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
		const edgeRelation = relation({
			name: name(e.name),
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
		const stated = Arr.flatMap(s.reads.options, (options) => Record.keys(options.names))
		return Arr.map(Record.keys(s.reads.named), (readName): ReadIR => {
			const stem = name(`${s.name}Read${capitalized(readName)}`)
			const record = relation({
				name: stem,
				fields: [
					{ name: "step", type: stepKey },
					{ name: "ordinal", type: natural },
					{ name: "digest", type: rowKey }
				],
				key: ["step", "ordinal"]
			})
			laws.push(into(side(record, ["step"]), side(Result, ["step"])), {
				kind: "reachable",
				records: stem,
				holders: [side(record, ["digest"])]
			})
			return { name: readName, stem, record, statesNames: Arr.contains(stated, readName) }
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
				name(`${s.name}Error`),
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
				name(`${finish}Error`),
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
	 * A seat a claim holds, a member of its claim's ordered family: the claim's step, root and attempt, its place among the
	 * claim's holds, and the resource's seat. It is written in the claim's own write and lapses with its claim, so it
	 * carries no lease of its own and names no holder but its claim.
	 */
	const seats = Option.map(counts, (seatCounts): SeatsIR => {
		const Hold = relation({
			name: name("Hold"),
			fields: [
				{ name: "step", type: stepKey },
				{ name: "attempt", type: natural },
				{ name: "at", type: drawnCount },
				{ name: "resource", type: { kind: "closed", roster: seatCounts.key.roster } },
				{ name: "seat", type: natural }
			],
			key: ["step", "root", "attempt", "at"]
		})
		laws.push({
			kind: "ordered",
			member: side(Hold, ["step", "root", "attempt", "at"]),
			owner: Claim,
			count: "holds"
		})
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
					{ name: "key", type: digest }
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
	const requesting = [
		Scope,
		Root,
		...exclusiveKeys,
		...Arr.flatMap(
			Arr.filter(joinsIR, (j: JoinIR) => Option.exists(j.root, (r) => r.trigger === "app")),
			(j: JoinIR) => valueRelations(j.input)
		)
	]

	/**
	 * Every root's graph is one retirable unit of grizzle's: its header the root, every other graph relation a body
	 * carrying its root's scope as `root`, in every key it holds and on both sides of every containment between bodies,
	 * which every row of one graph shares, and the header holding its group's retirement. The coordination group is no
	 * part of any unit: its chains of turns outlive the graphs whose steps took them.
	 */
	const bodies = new Set(
		Arr.filter(
			Arr.map(relations, (r) => r.name),
			(r) => r !== Root && !Arr.contains(coordination, r)
		)
	)
	const rootField = { name: "root", type: scopeKey }
	const rooted = Arr.map(relations, (r): RelationIR => {
		if (bodies.has(r.name)) {
			return {
				...r,
				fields: [...r.fields, rootField],
				key: Arr.contains(r.key, "root") ? r.key : [...r.key, "root"]
			}
		}
		return r.name === Root
			? { ...r, fields: [...r.fields, { name: "retired", type: { kind: "retirement" } }] }
			: r
	})
	const rootTerm = { field: "root", pred: false }
	const onRoot = (on: SideIR): SideIR => ({ ...on, terms: [...on.terms, rootTerm] })
	const rootedLaws: ReadonlyArray<LawIR> = [
		...Arr.map(laws, (law): LawIR => {
			switch (law.kind) {
				case "contained":
					return bodies.has(law.from.relation) && bodies.has(law.to.relation)
						? { ...law, from: onRoot(law.from), to: onRoot(law.to) }
						: law
				case "key":
					return bodies.has(law.side.relation) ? { ...law, side: onRoot(law.side) } : law
				case "race":
				case "check":
				case "retirable":
				case "ordered":
				case "reachable":
					return law
			}
		}),
		{ kind: "retirable", header: Root, bodies: Array.from(bodies) }
	]

	const names = [
		...Arr.map(relations, (r) => r.name),
		...Arr.map(rosters, (r) => r.name),
		...Arr.map(brands, (b) => b.name),
		...Arr.flatMap(Option.toArray(seats), (st) => [st.counts.name, st.live])
	]
	Arr.forEach(names, (n, i) => {
		if (Arr.some(Arr.take(names, i), (earlier) => earlier === n)) {
			throw new Refused({
				declaration: `flow ${p}`,
				why: `two of its lowered declarations are named ${n}`
			})
		}
	})

	return {
		prefix: p,
		writer: flow.writes.name,
		rosters,
		brands,
		seats,
		relations: rooted,
		laws: rootedLaws,
		steps: stepsIR,
		joins: joinsIR,
		edges: edgesIR,
		resources: Arr.map(flow.resources, (r) => ({ name: r.name, seats: r.seats })),
		pausable,
		spawning,
		requesting,
		coordination,
		idle: Arr.dedupe(
			Arr.flatMap(joinsIR, (j) => Option.match(j.root, { onNone: () => [], onSome: (r) => r.idle }))
		),
		awaited: Arr.dedupe(Arr.flatMap(stepsIR, (s) => Arr.map(s.awaits, (a) => a.relation)))
	}
}
