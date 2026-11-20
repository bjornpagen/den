import { Array as Arr, Option, Predicate, Record, String as Str } from "effect"
import {
	type AnyFlow,
	type AnyJoin,
	type AnyRootKind,
	finishName,
	joinsOf,
	stepsOf
} from "#algebra/flow.ts"
import {
	type AnyStepKind,
	type Due,
	type Ladder,
	Refused,
	type Stored,
	type Trigger,
	type WritesDeclaration
} from "#algebra/kinds.ts"
import {
	type ArrayField,
	type Base,
	type Column,
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

/** One of den's own key contracts, every flow's alike. */
export type DenKey = "DenStep" | "DenScope" | "DenHolder" | "DenExclusive" | "DenInstant"

/** What a lowered field holds. */
export type FieldType =
	| { readonly kind: "key"; readonly contract: DenKey }
	| { readonly kind: "natural" }
	| { readonly kind: "closed"; readonly roster: string }
	| { readonly kind: "brand"; readonly brand: string }
	| { readonly kind: "base"; readonly base: Base }
	| { readonly kind: "retirement" }
	| { readonly kind: "app"; readonly relation: string; readonly field: string }

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
	| { readonly kind: "key"; readonly side: SideIR }
	| { readonly kind: "race"; readonly relation: string }
	| {
			readonly kind: "check"
			readonly name: string
			readonly relation: string
			readonly field: string
			readonly holds: Holds
	  }
	| { readonly kind: "retirable"; readonly header: string; readonly bodies: ReadonlyArray<string> }

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
 * A flow's seats: the closed relation of each resource's count; the chain of holds and frees; and the live holds, a
 * derived relation of the holds no free ended, with the check `bound` that holds each live hold's seat below its
 * resource's count. A fragment declares no derived relation, which reads a level below its own, so the live holds and
 * their check are the seat level: the schema that lists the flow's coordination fragment states them on a level over
 * itself. A freed turn is no live hold, so lowering a count is refused only while a live hold sits at or above it.
 */
export interface SeatsIR {
	readonly counts: CountsIR
	readonly hold: string
	readonly freed: string
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

/** The relation names a step's writes name, by operation. */
export interface WritesIR {
	readonly insert: ReadonlyArray<string>
	readonly put: ReadonlyArray<string>
	readonly delete: ReadonlyArray<string>
}

/** An edge, lowered: the relation of its facts, and the kind it spawns. */
export interface EdgeIR {
	readonly name: string
	readonly index: number
	readonly from: string
	readonly to: SpawnedIR
	readonly relation: string
}

/**
 * A step's declared read, lowered: its name, the app relation it reads, the fields it reads by, the fields it delivers
 * and the relation it records them in, row by row under the step and an ordinal. A nearest read also names the vector
 * field it ranks by, which it does not deliver, its bound, and its anchor: the relation, the vector field and the whole
 * key of the stored row whose vector it ranks by; it records each row's distance beside it.
 */
export type ReadIR = {
	readonly name: string
	readonly relation: string
	readonly by: ReadonlyArray<string>
	readonly fields: ReadonlyArray<string>
	readonly record: string
} & (
	| { readonly kind: "rows" }
	| {
			readonly kind: "nearest"
			readonly vector: string
			readonly take: number
			readonly anchor: {
				readonly relation: string
				readonly vector: string
				readonly key: readonly [string, ...Array<string>]
			}
	  }
)

/** A step kind, lowered. */
export interface StepIR {
	readonly name: string
	readonly index: number
	readonly input: ValueIR
	readonly output: ValueIR
	readonly error: Option.Option<ValueIR>
	readonly reads: ReadonlyArray<ReadIR>
	readonly writes: WritesIR
	readonly edges: ReadonlyArray<EdgeIR>
	readonly uses: ReadonlyArray<string>
	readonly retry: Ladder
	readonly due: Due
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

/** What a finish reads of a child kind: a step kind's endings with its outputs, or a scope kind's endings. */
export type FinishReadIR =
	| { readonly kind: "step"; readonly name: string; readonly output: ValueIR }
	| { readonly kind: "scope"; readonly name: string }

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
		readonly error: Option.Option<ValueIR>
		readonly writes: WritesIR
		readonly retry: Ladder
		readonly reads: ReadonlyArray<FinishReadIR>
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
	/** What a pause attaches to: each resource and each root kind, by name. */
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
	/** The app's relations the flow's steps and finishes write, by operation. */
	readonly app: WritesIR
	/** The app's relations the flow's steps read, each once. */
	readonly read: ReadonlyArray<string>
	/** The flows its scopes' preconditions read, each once. */
	readonly idle: ReadonlyArray<string>
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
const writesOf = (declared: WritesDeclaration): WritesIR => ({
	insert: Arr.map(declared.insert, (r) => r.name),
	put: Arr.map(declared.put, (r) => r.name),
	delete: Arr.map(declared.delete, (r) => r.name)
})

/** The field names of an app relation, in its declared order. */
const fieldNamesOf = (
	declaration: string,
	relation: { readonly name: string; readonly fields: unknown }
) => {
	const fields = relation.fields
	const names = Predicate.isObject(fields) ? Record.keys(fields) : []
	if (!Arr.isReadonlyArrayNonEmpty(names)) {
		throw new Refused({ declaration, why: `the relation ${relation.name} it reads has no fields` })
	}
	return names
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
	const stepKey: FieldType = { kind: "key", contract: "DenStep" }
	const scopeKey: FieldType = { kind: "key", contract: "DenScope" }
	const instant: FieldType = { kind: "key", contract: "DenInstant" }
	const text: FieldType = { kind: "base", base: "text" }
	const natural: FieldType = { kind: "natural" }
	const ownerKey = (owner: "step" | "scope"): FieldType => (owner === "step" ? stepKey : scopeKey)

	const kindNames = [...Arr.map(steps, (s) => s.name), ...Arr.map(joins, finishName)]
	const rootNames = Arr.map(roots, (r) => r.name)
	const childNames = Arr.map(
		Arr.filter(joins, (j) => j._tag === "Scope"),
		(j) => j.name
	)
	const pausable = [...Arr.map(flow.resources, (r) => r.name), ...Arr.map(roots, (r) => r.name)]
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
						{ name: "id", type: { kind: "key", contract: "DenExclusive" } }
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
	const Claim = relation({
		name: name("Claim"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: natural },
			{ name: "holder", type: { kind: "key", contract: "DenHolder" } },
			{ name: "until", type: instant }
		],
		key: ["step", "attempt"]
	})
	const Retry = relation({
		name: name("Retry"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempt", type: natural },
			{ name: "at", type: instant },
			{ name: "spent", type: { kind: "base", base: "boolean" } }
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
		fields: [
			{ name: "step", type: stepKey },
			{ name: "attempts", type: natural }
		],
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
		{ kind: "race", relation: Claim },
		{
			kind: "check",
			name: "AttemptFromOne",
			relation: Claim,
			field: "attempt",
			holds: { kind: "atLeast", bound: 1n }
		},
		into(
			{
				relation: Claim,
				selection: { kind: "atLeast", field: "attempt", bound: 2n },
				terms: [
					{ field: "step", pred: false },
					{ field: "attempt", pred: true }
				]
			},
			side(Claim, ["step", "attempt"])
		),
		into(side(Retry, ["step", "attempt"]), side(Claim, ["step", "attempt"])),
		into(side(Fenced, ["step", "attempt"]), side(Claim, ["step", "attempt"])),
		into(side(Result, ["step"]), side(Step, ["step"])),
		into(side(Held, ["step", "attempt"]), side(Claim, ["step", "attempt"])),
		into(side(Held, ["step"]), side(Result, ["step"])),
		into(side(Done, ["step"]), sideOf(Result, ["step"], done)),
		into(side(Failed, ["step"]), sideOf(Result, ["step"], failed)),
		into(side(Refusal, ["step"]), failedSide),
		into(side(Exhausted, ["step"]), failedSide)
	)

	/** A value's relations: its owner's row and a relation per optional field, each held to `owned`. */
	const valued = (
		relationName: string,
		owner: "step" | "scope",
		schema: Stored | Shape,
		declaration: string,
		owned: ReadonlyArray<SideIR>
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
				...Arr.map(shape.columns, (c) => ({ name: c.name, type: fieldOf(relationName, c) })),
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

	const inputs = new Map<string, ValueIR>()
	Arr.forEach(steps, (s) =>
		inputs.set(
			s.name,
			valued(name(`${s.name}Input`), "step", s.input, `step ${s.name}`, [
				sideOf(Step, ["step"], ofKind(s.name))
			])
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
				[sideOf(j._tag === "Root" ? Root : name("Within"), ["scope"], ofKind(j.name))]
			)
		)
	)
	const inputOf = (kindName: string): ValueIR =>
		Option.getOrElse(Option.fromNullishOr(inputs.get(kindName)), () => {
			throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} takes an input` })
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
			into(side(edgeRelation, ["from"]), side(inputOf(e.from.name).relation, ["step"])),
			into(side(edgeRelation, ["to"]), side(to.input.relation, [to.kind])),
			keyOf(edgeRelation, ["to"])
		)
		return { name: e.name, index, from: e.from.name, to, relation: edgeRelation }
	})

	const readsOf = (s: AnyStepKind): ReadonlyArray<ReadIR> =>
		Arr.map(Record.toEntries(s.reads), ([readName, declared]): ReadIR => {
			const declaration = `step ${s.name}, its read ${readName}`
			const fields = fieldNamesOf(declaration, declared.relation)
			Arr.forEach(declared.by, (field) => {
				if (!Arr.contains(fields, field)) {
					throw new Refused({
						declaration,
						why: `it reads ${declared.relation.name} by ${field}, no field of it`
					})
				}
			})
			const reserved =
				declared.kind === "nearest"
					? ["step", "ordinal", "root", "distance"]
					: ["step", "ordinal", "root"]
			Arr.forEach(fields, (field) => {
				if (Arr.contains(reserved, field)) {
					throw new Refused({
						declaration,
						why: `the relation ${declared.relation.name} it reads has a field ${field}, which its record keeps for itself`
					})
				}
			})
			const delivered =
				declared.kind === "nearest"
					? Arr.filter(fields, (field) => field !== declared.vector)
					: fields
			const record = relation({
				name: name(`${s.name}${capitalized(readName)}Read`),
				fields: [
					{ name: "step", type: stepKey },
					{ name: "ordinal", type: natural },
					...Arr.map(delivered, (field) => ({
						name: field,
						type: { kind: "app", relation: declared.relation.name, field } satisfies FieldType
					})),
					...(declared.kind === "nearest"
						? [{ name: "distance", type: { kind: "base", base: "double" } satisfies FieldType }]
						: [])
				],
				key: ["step", "ordinal"]
			})
			laws.push(into(side(record, ["step"]), side(Result, ["step"])))
			const read = {
				name: readName,
				relation: declared.relation.name,
				by: declared.by,
				fields: delivered,
				record
			}
			if (declared.kind === "rows") {
				return { ...read, kind: "rows" }
			}
			const key = declared.anchor.relation.primaryKey
			if (!Arr.isReadonlyArrayNonEmpty(key)) {
				throw new Refused({
					declaration,
					why: `its anchor ${declared.anchor.relation.name} has no key to name a row by`
				})
			}
			return {
				...read,
				kind: "nearest",
				vector: declared.vector,
				take: declared.take,
				anchor: { relation: declared.anchor.relation.name, vector: declared.anchor.vector, key }
			}
		})

	const stepsIR: ReadonlyArray<StepIR> = Arr.map(steps, (s) => {
		const declaration = `step ${s.name}`
		const input = inputOf(s.name)
		const output = valued(name(`${s.name}Output`), "step", s.output, declaration, [
			side(input.relation, ["step"]),
			doneSide
		])
		const error = Option.map(errorShapeOf(declaration, s.error), (shape) =>
			valued(name(`${s.name}Error`), "step", shape, declaration, [
				side(input.relation, ["step"]),
				failedSide
			])
		)
		return {
			name: s.name,
			index: at(s.name),
			input,
			output,
			error,
			reads: readsOf(s),
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
			valued(name(`${finish}Error`), "step", shape, declaration, [side(Step, ["step"]), failedSide])
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
				error,
				writes: writesOf(j.finish.writes),
				retry: j.finish.retry,
				reads: Arr.map(j.finish.reads, (read): FinishReadIR =>
					read._tag === "Step"
						? {
								kind: "step",
								name: read.name,
								output: Option.getOrElse(
									Option.map(
										Arr.findFirst(stepsIR, (s) => s.name === read.name),
										(s) => s.output
									),
									() => {
										throw new Refused({ declaration, why: `no step ${read.name} gives an output` })
									}
								)
							}
						: { kind: "scope", name: read.name }
				)
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
	const seats = Option.map(counts, (seatCounts): SeatsIR => {
		const resourceField: FieldType = { kind: "closed", roster: seatCounts.key.roster }
		const [Hold, Freed] = chainOf(
			name("Hold"),
			name("Freed"),
			[
				{ name: "resource", type: resourceField },
				{ name: "seat", type: natural }
			],
			[
				{ name: "holder", type: { kind: "key", contract: "DenHolder" } },
				{ name: "until", type: instant }
			]
		)
		coordination.push(Hold, Freed)
		return {
			counts: seatCounts,
			hold: Hold,
			freed: Freed,
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
					{ name: "key", type: { kind: "key", contract: "DenExclusive" } }
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
	const appWrites = [
		...Arr.map(stepsIR, (s) => s.writes),
		...Arr.map(joinsIR, (j) => j.finish.writes)
	]
	const union = (op: keyof WritesIR) => Arr.dedupe(Arr.flatMap(appWrites, (w) => w[op]))

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
			return { ...r, fields: [...r.fields, rootField], key: [...r.key, "root"] }
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
		app: { insert: union("insert"), put: union("put"), delete: union("delete") },
		read: Arr.dedupe(Arr.flatMap(stepsIR, (s) => Arr.map(s.reads, (r) => r.relation))),
		idle: Arr.dedupe(
			Arr.flatMap(joinsIR, (j) => Option.match(j.root, { onNone: () => [], onSome: (r) => r.idle }))
		)
	}
}
