import { Array as Arr, Option, String as Str } from "effect"
import {
	type AnyFlow,
	type AnyJoin,
	awaitsOf,
	finishName,
	joinsOf,
	stepsOf
} from "#algebra/flow.ts"
import { Refused, type Stored, type WritesDeclaration } from "#algebra/kinds.ts"
import { type Base, type Column, errorShapeOf, type Shape, shapeOf } from "#lower/schema.ts"

/**
 * A flow lowered to a fragment, as data: the rosters, contracts, relations and laws the app spreads into its own
 * `schema(...)`, every name under the flow's prefix, and the kinds, joins and edges the programs and the binding are
 * printed from. The fragment has no derived relation and no rule over a query: every law is a key, a containment or a
 * row check, so every relation stays insert-only and certifiable at READ COMMITTED.
 */

/** One of den's own key contracts, every flow's alike. */
export type DenKey = "DenStep" | "DenScope" | "DenHolder" | "DenInstant"

/** What a lowered field holds. */
export type FieldType =
	| { readonly kind: "key"; readonly contract: DenKey }
	| { readonly kind: "natural" }
	| { readonly kind: "closed"; readonly roster: string }
	| { readonly kind: "brand"; readonly brand: string }
	| { readonly kind: "base"; readonly base: Base }

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
	readonly toKind: "step" | "await" | "scope"
	readonly relation: string
}

/** A step kind, lowered. */
export interface StepIR {
	readonly name: string
	readonly index: number
	readonly input: ValueIR
	readonly output: ValueIR
	readonly error: Option.Option<ValueIR>
	readonly writes: WritesIR
	readonly edges: ReadonlyArray<EdgeIR>
}

/** An await, lowered. */
export interface AwaitIR {
	readonly name: string
	readonly index: number
	readonly input: ValueIR
	readonly output: ValueIR
}

/** A child a join may start. */
export interface ChildIR {
	readonly name: string
	readonly kind: "step" | "await" | "scope"
}

/** A join (a scope kind or a root), lowered, with its finish. */
export interface JoinIR {
	readonly name: string
	readonly index: number
	readonly root: boolean
	readonly input: ValueIR
	readonly children: ReadonlyArray<ChildIR>
	readonly finish: {
		readonly name: string
		readonly error: Option.Option<ValueIR>
		readonly writes: WritesIR
		readonly reads: ReadonlyArray<{ readonly name: string; readonly output: ValueIR }>
	}
}

/** A flow, lowered. */
export interface Lowered {
	readonly prefix: string
	readonly rosters: ReadonlyArray<RosterIR>
	readonly brands: ReadonlyArray<BrandIR>
	readonly relations: ReadonlyArray<RelationIR>
	readonly laws: ReadonlyArray<LawIR>
	readonly steps: ReadonlyArray<StepIR>
	readonly awaits: ReadonlyArray<AwaitIR>
	readonly joins: ReadonlyArray<JoinIR>
	readonly edges: ReadonlyArray<EdgeIR>
	/** The relations a start or a commit spawns into, each written by every one of them. */
	readonly spawning: ReadonlyArray<string>
	/** The app's relations the flow's steps and finishes write, by operation. */
	readonly app: WritesIR
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

const capitalized = (text: string): string => Str.capitalize(text)

/** The relation names a writes declaration names. */
const writesOf = (declared: WritesDeclaration): WritesIR => ({
	insert: Arr.map(declared.insert, (r) => r.name),
	put: Arr.map(declared.put, (r) => r.name),
	delete: Arr.map(declared.delete, (r) => r.name)
})

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
	const awaits = awaitsOf(kinds)
	const joins = joinsOf(kinds)
	const ownerKey = (owner: "step" | "scope"): FieldType => ({
		kind: "key",
		contract: owner === "step" ? "DenStep" : "DenScope"
	})

	const kindNames = [
		...Arr.map(steps, (s) => s.name),
		...Arr.map(awaits, (a) => a.name),
		...Arr.map(joins, finishName)
	]
	const joinNames = Arr.map(joins, (j) => j.name)
	if (!Arr.isReadonlyArrayNonEmpty(kindNames) || !Arr.isReadonlyArrayNonEmpty(joinNames)) {
		throw new Refused({ declaration: `flow ${p}`, why: "a flow runs at least one join's finish" })
	}
	rosters.push({ name: name("Kind"), handles: kindNames })
	rosters.push({ name: name("Join"), handles: joinNames })
	rosters.push({ name: name("Outcome"), handles: ["done", "failed"] })

	const Scope = relation({
		name: name("Scope"),
		fields: [
			{ name: "scope", type: ownerKey("scope") },
			{ name: "kind", type: { kind: "closed", roster: name("Join") } }
		],
		key: ["scope"]
	})
	const Root = relation({
		name: name("Root"),
		fields: [
			{ name: "scope", type: ownerKey("scope") },
			{ name: "key", type: { kind: "base", base: "text" } }
		],
		key: ["scope"]
	})
	const Within = relation({
		name: name("Within"),
		fields: [
			{ name: "scope", type: ownerKey("scope") },
			{ name: "parent", type: ownerKey("scope") }
		],
		key: ["scope"]
	})
	const Step = relation({
		name: name("Step"),
		fields: [
			{ name: "step", type: ownerKey("step") },
			{ name: "kind", type: { kind: "closed", roster: name("Kind") } },
			{ name: "scope", type: ownerKey("scope") }
		],
		key: ["step"]
	})
	const StartStep = relation({
		name: name("StartStep"),
		fields: [
			{ name: "scope", type: ownerKey("scope") },
			{ name: "ordinal", type: { kind: "natural" } },
			{ name: "step", type: ownerKey("step") }
		],
		key: ["scope", "ordinal"]
	})
	const StartScope = relation({
		name: name("StartScope"),
		fields: [
			{ name: "scope", type: ownerKey("scope") },
			{ name: "ordinal", type: { kind: "natural" } },
			{ name: "child", type: ownerKey("scope") }
		],
		key: ["scope", "ordinal"]
	})
	const Finish = relation({
		name: name("Finish"),
		fields: [
			{ name: "scope", type: ownerKey("scope") },
			{ name: "step", type: ownerKey("step") }
		],
		key: ["scope"]
	})
	const Claim = relation({
		name: name("Claim"),
		fields: [
			{ name: "step", type: ownerKey("step") },
			{ name: "attempt", type: { kind: "natural" } },
			{ name: "holder", type: { kind: "key", contract: "DenHolder" } },
			{ name: "until", type: { kind: "key", contract: "DenInstant" } }
		],
		key: ["step", "attempt"]
	})
	const Result = relation({
		name: name("Result"),
		fields: [
			{ name: "step", type: ownerKey("step") },
			{ name: "outcome", type: { kind: "closed", roster: name("Outcome") } }
		],
		key: ["step"]
	})
	const Held = relation({
		name: name("Held"),
		fields: [
			{ name: "step", type: ownerKey("step") },
			{ name: "attempt", type: { kind: "natural" } }
		],
		key: ["step"]
	})
	const Refusal = relation({
		name: name("Refusal"),
		fields: [
			{ name: "step", type: ownerKey("step") },
			{ name: "law", type: { kind: "base", base: "text" } }
		],
		key: ["step"]
	})
	const Exhausted = relation({
		name: name("Exhausted"),
		fields: [
			{ name: "step", type: ownerKey("step") },
			{ name: "attempts", type: { kind: "natural" } }
		],
		key: ["step"]
	})
	const done: Selection = { kind: "handle", field: "outcome", handle: "done" }
	const failed: Selection = { kind: "handle", field: "outcome", handle: "failed" }
	const ofKind = (kind: string): Selection => ({ kind: "handle", field: "kind", handle: kind })

	laws.push(
		into(side(Root, ["scope"]), side(Scope, ["scope"])),
		into(side(Within, ["scope"]), side(Scope, ["scope"])),
		into(side(Within, ["parent"]), side(Scope, ["scope"])),
		into(side(Step, ["scope"]), side(Scope, ["scope"])),
		into(side(StartStep, ["scope"]), side(Scope, ["scope"])),
		into(side(StartStep, ["step"]), side(Step, ["step"])),
		{ kind: "key", side: side(StartStep, ["step"]) },
		into(side(StartScope, ["scope"]), side(Scope, ["scope"])),
		into(side(StartScope, ["child"]), side(Scope, ["scope"])),
		{ kind: "key", side: side(StartScope, ["child"]) },
		into(side(Finish, ["scope"]), side(Scope, ["scope"])),
		into(side(Finish, ["step"]), side(Step, ["step"])),
		{ kind: "key", side: side(Finish, ["step"]) },
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
		into(side(Result, ["step"]), side(Step, ["step"])),
		into(side(Held, ["step", "attempt"]), side(Claim, ["step", "attempt"])),
		into(side(Held, ["step"]), side(Result, ["step"])),
		into(side(Refusal, ["step"]), sideOf(Result, ["step"], failed)),
		into(side(Exhausted, ["step"]), sideOf(Result, ["step"], failed))
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

	const edgesIR: ReadonlyArray<EdgeIR> = Arr.map(flow.edges, (e, index) => {
		const toKind = e.to._tag === "Step" ? "step" : e.to._tag === "Await" ? "await" : "scope"
		const edgeRelation = relation({
			name: name(e.name),
			fields: [
				{ name: "from", type: ownerKey("step") },
				{ name: "ordinal", type: { kind: "natural" } },
				{ name: "to", type: ownerKey(toKind === "scope" ? "scope" : "step") }
			],
			key: ["from", "ordinal"]
		})
		laws.push(
			into(side(edgeRelation, ["from"]), side(name(`${e.from.name}Input`), ["step"])),
			into(
				side(edgeRelation, ["to"]),
				side(name(`${e.to.name}Input`), [toKind === "scope" ? "scope" : "step"])
			),
			{ kind: "key", side: side(edgeRelation, ["to"]) }
		)
		return {
			name: e.name,
			index,
			from: e.from.name,
			to: e.to.name,
			toKind,
			relation: edgeRelation
		}
	})

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

	const stepsIR: ReadonlyArray<StepIR> = Arr.map(steps, (s) => {
		const declaration = `step ${s.name}`
		const input = valued(name(`${s.name}Input`), "step", s.input, declaration, [
			sideOf(Step, ["step"], ofKind(s.name))
		])
		const output = valued(name(`${s.name}Output`), "step", s.output, declaration, [
			side(input.relation, ["step"]),
			sideOf(Result, ["step"], done)
		])
		const error = Option.map(errorShapeOf(declaration, s.error), (shape) =>
			valued(name(`${s.name}Error`), "step", shape, declaration, [
				side(input.relation, ["step"]),
				sideOf(Result, ["step"], failed)
			])
		)
		return {
			name: s.name,
			index: at(s.name),
			input,
			output,
			error,
			writes: writesOf(s.writes),
			edges: Arr.filter(edgesIR, (e) => e.from === s.name)
		}
	})

	const awaitsIR: ReadonlyArray<AwaitIR> = Arr.map(awaits, (a) => {
		const declaration = `await ${a.name}`
		const input = valued(name(`${a.name}Input`), "step", a.input, declaration, [
			sideOf(Step, ["step"], ofKind(a.name))
		])
		const output = valued(name(`${a.name}Output`), "step", a.output, declaration, [
			side(input.relation, ["step"]),
			sideOf(Result, ["step"], done)
		])
		return { name: a.name, index: at(a.name), input, output }
	})

	const outputOf = (kindName: string): ValueIR =>
		Option.getOrElse(
			Arr.findFirst(
				[...Arr.map(stepsIR, (s) => ({ name: s.name, output: s.output })), ...awaitsIR],
				(k) => k.name === kindName
			),
			() => {
				throw new Refused({ declaration: `flow ${p}`, why: `no kind ${kindName} gives an output` })
			}
		).output

	const childOf = (child: { readonly _tag: string; readonly name: string }): ChildIR => ({
		name: child.name,
		kind: child._tag === "Step" ? "step" : child._tag === "Await" ? "await" : "scope"
	})

	const joinsIR: ReadonlyArray<JoinIR> = Arr.map(joins, (j: AnyJoin): JoinIR => {
		const declaration = `${j._tag === "Root" ? "root" : "scope"} ${j.name}`
		const input = valued(name(`${j.name}Input`), "scope", j.input, declaration, [
			sideOf(Scope, ["scope"], ofKind(j.name))
		])
		const finish = finishName(j)
		const error = Option.map(errorShapeOf(declaration, j.finish.error), (shape) =>
			valued(name(`${finish}Error`), "step", shape, declaration, [
				sideOf(Step, ["step"], ofKind(finish)),
				sideOf(Result, ["step"], failed)
			])
		)
		return {
			name: j.name,
			index: at(j.name),
			root: j._tag === "Root",
			input,
			children: Arr.map(j.children, childOf),
			finish: {
				name: finish,
				error,
				writes: writesOf(j.finish.writes),
				reads: Arr.map(j.finish.reads, (read) => ({ name: read.name, output: outputOf(read.name) }))
			}
		}
	})

	const valueRelations = (value: ValueIR): ReadonlyArray<string> => [
		value.relation,
		...Arr.map(value.sidecars, (s) => s.relation)
	]
	const spawning = [
		Step,
		Scope,
		Within,
		StartStep,
		StartScope,
		...Arr.flatMap(stepsIR, (s) => valueRelations(s.input)),
		...Arr.flatMap(awaitsIR, (a) => valueRelations(a.input)),
		...Arr.flatMap(
			Arr.filter(joinsIR, (j: JoinIR) => !j.root),
			(j: JoinIR) => valueRelations(j.input)
		),
		...Arr.map(edgesIR, (e) => e.relation)
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
		rosters,
		brands,
		relations,
		laws,
		steps: stepsIR,
		awaits: awaitsIR,
		joins: joinsIR,
		edges: edgesIR,
		spawning,
		app: { insert: union("insert"), put: union("put"), delete: union("delete") }
	}
}
