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
import { type Base, type Column, errorShapeOf, type Shape, shapeOf } from "#lower/schema.ts"

/**
 * A flow lowered to a fragment, as data: the rosters, contracts, relations and laws the app spreads into its own
 * `schema(...)`, every name under the flow's prefix, and the kinds, joins and edges the programs and the binding are
 * printed from. The fragment's relations are an ordered list, the form grizzle's `schema()` takes once CLASH lands; the
 * one conversion to the record it takes at `a226cbac` is `lower/merge.ts`'s.
 *
 * Three groups of relations, by who writes them. The graph (scopes, steps, claims, results, values, edges) is
 * insert-only for every role, its every law a key, a containment or a row check, so den's role and the app's writer
 * role both certify READ COMMITTED. The coordination group (seats, holds, exclusivity and pauses) is deleted from as
 * seats are given back and pauses lifted, so only den's coordination role writes it and nothing in the graph references
 * it: a containment from the graph into it would read, at its check, rows a SERIALIZABLE role writes.
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

/** A law of the fragment. */
export type LawIR =
	| { readonly kind: "contained"; readonly from: SideIR; readonly to: SideIR }
	| { readonly kind: "key"; readonly side: SideIR }
	| {
			readonly kind: "check"
			readonly name: string
			readonly relation: string
			readonly field: string
			readonly bound: bigint
	  }

/** A value as relations: its owner's relation and, for each optional field, the relation of its own. */
export interface ValueIR {
	readonly relation: string
	readonly owner: "step" | "scope"
	readonly shape: Shape
	readonly sidecars: ReadonlyArray<{ readonly column: Column; readonly relation: string }>
}

/** The relation names a step's writes name, by operation. */
export interface WritesIR {
	readonly insert: ReadonlyArray<string>
	readonly put: ReadonlyArray<string>
	readonly delete: ReadonlyArray<string>
}

/** An edge, lowered: the relation of its facts, and what it spawns. */
export interface EdgeIR {
	readonly name: string
	readonly index: number
	readonly from: string
	readonly to: string
	readonly toKind: "step" | "scope"
	readonly relation: string
}

/** A step's declared read, lowered: the app relation it reads, the fields it reads by, and the relation it records in. */
export interface ReadIR {
	readonly relation: string
	readonly by: ReadonlyArray<string>
	readonly fields: readonly [string, ...Array<string>]
	readonly record: string
}

/** A step kind, lowered. */
export interface StepIR {
	readonly name: string
	readonly index: number
	readonly input: ValueIR
	readonly output: ValueIR
	readonly error: Option.Option<ValueIR>
	readonly reads: Option.Option<ReadIR>
	readonly writes: WritesIR
	readonly edges: ReadonlyArray<EdgeIR>
	readonly uses: ReadonlyArray<string>
	readonly retry: Ladder
	readonly due: Due
}

/** A child a join may start. */
export interface ChildIR {
	readonly name: string
	readonly kind: "step" | "scope"
}

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
	readonly children: ReadonlyArray<ChildIR>
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
	/** The relations den's coordination role writes, deleting from each. */
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
	const joinNames = Arr.map(joins, (j) => j.name)
	const pausable = [...Arr.map(flow.resources, (r) => r.name), ...Arr.map(roots, (r) => r.name)]
	if (
		!Arr.isReadonlyArrayNonEmpty(kindNames) ||
		!Arr.isReadonlyArrayNonEmpty(joinNames) ||
		!Arr.isReadonlyArrayNonEmpty(pausable)
	) {
		throw new Refused({
			declaration: `flow ${p}`,
			why: "a flow runs at least one root and its finish"
		})
	}
	rosters.push({ name: name("Kind"), handles: kindNames })
	rosters.push({ name: name("Join"), handles: joinNames })
	rosters.push({ name: name("Outcome"), handles: ["done", "failed"] })
	rosters.push({ name: name("Pausable"), handles: pausable })
	const resourceNames = Arr.map(flow.resources, (r) => r.name)
	if (Arr.isReadonlyArrayNonEmpty(resourceNames)) {
		rosters.push({ name: name("Resource"), handles: resourceNames })
	}

	const Scope = relation({
		name: name("Scope"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "kind", type: { kind: "closed", roster: name("Join") } }
		],
		key: ["scope"]
	})
	const Root = relation({
		name: name("Root"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "key", type: text },
			{ name: "at", type: instant }
		],
		key: ["scope"]
	})
	const Within = relation({
		name: name("Within"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "parent", type: scopeKey }
		],
		key: ["scope"]
	})
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
			{ name: "scope", type: scopeKey }
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
	const StartScope = relation({
		name: name("StartScope"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "ordinal", type: natural },
			{ name: "child", type: scopeKey }
		],
		key: ["scope", "ordinal"]
	})
	const Finish = relation({
		name: name("Finish"),
		fields: [
			{ name: "scope", type: scopeKey },
			{ name: "step", type: stepKey }
		],
		key: ["scope"]
	})
	const Due = relation({
		name: name("Due"),
		fields: [
			{ name: "step", type: stepKey },
			{ name: "at", type: instant }
		],
		key: ["step"]
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
	laws.push(
		into(side(Root, ["scope"]), side(Scope, ["scope"])),
		into(side(Within, ["scope"]), side(Scope, ["scope"])),
		into(side(Within, ["parent"]), side(Scope, ["scope"])),
		into(side(Admitted, ["scope"]), side(Scope, ["scope"])),
		into(side(Skipped, ["scope"]), side(Root, ["scope"])),
		into(side(Skipped, ["by"]), side(Admitted, ["scope"])),
		into(side(Step, ["scope"]), side(Admitted, ["scope"])),
		into(side(StartStep, ["scope"]), side(Admitted, ["scope"])),
		into(side(StartStep, ["step"]), side(Step, ["step"])),
		keyOf(StartStep, ["step"]),
		into(side(StartScope, ["scope"]), side(Admitted, ["scope"])),
		into(side(StartScope, ["child"]), side(Scope, ["scope"])),
		keyOf(StartScope, ["child"]),
		into(side(Finish, ["scope"]), side(Admitted, ["scope"])),
		into(side(Finish, ["step"]), side(Step, ["step"])),
		keyOf(Finish, ["step"]),
		into(side(Due, ["step"]), side(Step, ["step"])),
		into(side(Claim, ["step"]), side(Step, ["step"])),
		{ kind: "check", name: "AttemptFromOne", relation: Claim, field: "attempt", bound: 1n },
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
		relation({
			name: relationName,
			fields: [
				{ name: key, type: ownerKey(owner) },
				...Arr.map(shape.columns, (c) => ({ name: c.name, type: fieldOf(relationName, c) }))
			],
			key: [key]
		})
		Arr.forEach(owned, (to) => laws.push(into(side(relationName, [key]), to)))
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
			return { column, relation: sidecar }
		})
		return { relation: relationName, owner, shape, sidecars }
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
				[sideOf(Scope, ["scope"], ofKind(j.name))]
			)
		)
	)
	const inputOf = (kindName: string): ValueIR =>
		Option.getOrElse(Option.fromNullishOr(inputs.get(kindName)), () => {
			throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} takes an input` })
		})

	const edgesIR: ReadonlyArray<EdgeIR> = Arr.map(flow.edges, (e, index) => {
		const toKind = e.to._tag === "Step" ? "step" : "scope"
		const edgeRelation = relation({
			name: name(e.name),
			fields: [
				{ name: "from", type: stepKey },
				{ name: "ordinal", type: natural },
				{ name: "to", type: ownerKey(toKind) }
			],
			key: ["from", "ordinal"]
		})
		laws.push(
			into(side(edgeRelation, ["from"]), side(inputOf(e.from.name).relation, ["step"])),
			into(side(edgeRelation, ["to"]), side(inputOf(e.to.name).relation, [toKind])),
			keyOf(edgeRelation, ["to"])
		)
		return { name: e.name, index, from: e.from.name, to: e.to.name, toKind, relation: edgeRelation }
	})

	const readOf = (s: AnyStepKind): Option.Option<ReadIR> => {
		const declared = s.reads
		if (declared.kind === "none") {
			return Option.none()
		}
		const declaration = `step ${s.name}`
		const fields = fieldNamesOf(declaration, declared.relation)
		Arr.forEach(declared.by, (field) => {
			if (!Arr.contains(fields, field)) {
				throw new Refused({
					declaration,
					why: `it reads ${declared.relation.name} by ${field}, no field of it`
				})
			}
		})
		Arr.forEach(fields, (field) => {
			if (field === "step" || field === "ordinal") {
				throw new Refused({
					declaration,
					why: `the relation ${declared.relation.name} it reads has a field ${field}, which its record keeps for itself`
				})
			}
		})
		const record = relation({
			name: name(`${s.name}Read`),
			fields: [
				{ name: "step", type: stepKey },
				{ name: "ordinal", type: natural },
				...Arr.map(fields, (field) => ({
					name: field,
					type: { kind: "app", relation: declared.relation.name, field } satisfies FieldType
				}))
			],
			key: ["step", "ordinal"]
		})
		laws.push(into(side(record, ["step"]), side(Result, ["step"])))
		return Option.some({ relation: declared.relation.name, by: declared.by, fields, record })
	}

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
			reads: readOf(s),
			writes: writesOf(s.writes),
			edges: Arr.filter(edgesIR, (e) => e.from === s.name),
			uses: Arr.map(s.uses, (r) => r.name),
			retry: s.retry,
			due: s.due
		}
	})

	const childOf = (child: { readonly _tag: string; readonly name: string }): ChildIR => ({
		name: child.name,
		kind: child._tag === "Step" ? "step" : "scope"
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
			children: Arr.map(j.children, childOf),
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

	const coordination: Array<string> = []
	if (Arr.isReadonlyArrayNonEmpty(resourceNames)) {
		const Seat = relation({
			name: name("Seat"),
			fields: [
				{ name: "resource", type: { kind: "closed", roster: name("Resource") } },
				{ name: "seat", type: natural }
			],
			key: ["resource", "seat"]
		})
		const Hold = relation({
			name: name("Hold"),
			fields: [
				{ name: "resource", type: { kind: "closed", roster: name("Resource") } },
				{ name: "seat", type: natural },
				{ name: "holder", type: { kind: "key", contract: "DenHolder" } },
				{ name: "until", type: instant }
			],
			key: ["resource", "seat"]
		})
		laws.push(into(side(Hold, ["resource", "seat"]), side(Seat, ["resource", "seat"])))
		coordination.push(Seat, Hold)
	}
	if (Arr.isReadonlyArrayNonEmpty(exclusiveKeys)) {
		coordination.push(
			relation({
				name: name("Exclusive"),
				fields: [
					{ name: "kind", type: { kind: "closed", roster: name("Join") } },
					{ name: "key", type: { kind: "key", contract: "DenExclusive" } },
					{ name: "scope", type: scopeKey }
				],
				key: ["kind", "key"]
			})
		)
	}
	coordination.push(
		relation({
			name: name("Paused"),
			fields: [{ name: "target", type: { kind: "closed", roster: name("Pausable") } }],
			key: ["target"]
		})
	)

	const valueRelations = (value: ValueIR): ReadonlyArray<string> => [
		value.relation,
		...Arr.map(value.sidecars, (s) => s.relation)
	]
	const spawning = [
		Step,
		Due,
		Scope,
		Within,
		Admitted,
		Finish,
		StartStep,
		StartScope,
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

	const names = [
		...Arr.map(relations, (r) => r.name),
		...Arr.map(rosters, (r) => r.name),
		...Arr.map(brands, (b) => b.name)
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
		relations,
		laws,
		steps: stepsIR,
		joins: joinsIR,
		edges: edgesIR,
		resources: Arr.map(flow.resources, (r) => ({ name: r.name, seats: r.seats.value })),
		pausable,
		spawning,
		requesting,
		coordination,
		app: { insert: union("insert"), put: union("put"), delete: union("delete") },
		read: Arr.dedupe(
			Arr.flatMap(stepsIR, (s) => Option.toArray(Option.map(s.reads, (r) => r.relation)))
		),
		idle: Arr.dedupe(
			Arr.flatMap(joinsIR, (j) => Option.match(j.root, { onNone: () => [], onSome: (r) => r.idle }))
		)
	}
}
