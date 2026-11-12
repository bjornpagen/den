import { Array as Arr, Option, Order, String as Str } from "effect"
import type {
	EdgeIR,
	FieldType,
	JoinIR,
	LawIR,
	Lowered,
	SideIR,
	StepIR,
	ValueIR,
	WritesIR
} from "#lower/fragment.ts"

/**
 * The printer: a lowered flow as three TypeScript modules the app commits beside its schema, which `den generate`
 * writes and which compile with the app's own code.
 *
 * - the fragment: rosters, contracts, relations and laws, plain grizzle values the app spreads into its `schema(...)`;
 * - the programs: den's role, its ChangeSets, its key reads and its queries, written over the app's concrete schema,
 *   since grizzle at its pin builds no program generic over a schema (the seam POROUS replaces with programs over the
 *   fragment, and this module with nothing);
 * - the binding: the ledger port over the programs' served handles, converting den's values to facts and rows back.
 */

/** Where the printed modules find what they import, each by the module specifier the app imports it under. */
export interface Placement {
	/** The fragment module, which the programs and the binding import. */
	readonly fragment: string
	/** The programs module, which the binding imports for its types. */
	readonly programs: string
	/** The module exporting the app's schema, and its export's name. */
	readonly schema: { readonly from: string; readonly name: string }
	/** The module exporting the flow, and its export's name. */
	readonly flow: { readonly from: string; readonly name: string }
}

/** A string literal of `text`, its quotes, backslashes and line breaks escaped. */
const q = (text: string): string =>
	`"${Str.replaceAll("\n", "\\n")(Str.replaceAll('"', '\\"')(Str.replaceAll("\\", "\\\\")(text)))}"`
const indented =
	(by: string) =>
	(text: string): string =>
		Str.replaceAll("\n", `\n${by}`)(text)
const lines = (parts: ReadonlyArray<string>): string => Arr.join(parts, "\n")
const commas = (parts: ReadonlyArray<string>): string => Arr.join(parts, ", ")
const lower1 = (text: string): string => Str.uncapitalize(text)

const fieldExpr = (type: FieldType): string => {
	switch (type.kind) {
		case "key":
			return type.contract
		case "natural":
			return "natural"
		case "closed":
			return `closedId(${type.roster})`
		case "brand":
			return type.brand
		case "base":
			switch (type.base) {
				case "text":
					return "Text"
				case "bigint":
					return "pg.bigint"
				case "boolean":
					return "pg.boolean"
			}
	}
}

const baseExpr = (base: "text" | "bigint" | "boolean"): string => fieldExpr({ kind: "base", base })

const sideExpr = (side: SideIR): string => {
	const source = (() => {
		switch (side.selection.kind) {
			case "all":
				return side.relation
			case "handle":
				return `select(${side.relation}, (row) => row.eq(row.${side.selection.field}, ${q(side.selection.handle)}))`
			case "atLeast":
				return `select(${side.relation}, (row) => row.ge(row.${side.selection.field}, ${side.selection.bound}n))`
		}
	})()
	const terms = Arr.map(side.terms, (t) => (t.pred ? `pred(${q(t.field)})` : q(t.field)))
	return `on(${source}, ${commas(terms)})`
}

const lawExpr = (law: LawIR): string => {
	switch (law.kind) {
		case "contained":
			return `contained(${sideExpr(law.from)}, ${sideExpr(law.to)})`
		case "key":
			return `key(${sideExpr(law.side)})`
		case "check":
			return `check(${q(law.name)}, ${law.relation}, (row) => row.ge(row.${law.field}, ${law.bound}n))`
	}
}

/** The den contracts and text a fragment module uses. */
const denKeysOf = (l: Lowered): ReadonlyArray<string> => {
	const fields = Arr.flatMap(l.relations, (r) => Arr.map(r.fields, (f) => f.type))
	const keys = Arr.dedupe(Arr.flatMap(fields, (t) => (t.kind === "key" ? [t.contract] : [])))
	const text =
		Arr.some(fields, (t) => t.kind === "base" && t.base === "text") ||
		Arr.some(l.brands, (b) => b.base === "text")
	return Arr.sort([...keys, ...(text ? ["Text"] : [])], Order.String)
}

/** The grizzle names a fragment module uses. */
const fragmentImportsOf = (l: Lowered): ReadonlyArray<string> => {
	const fields = Arr.flatMap(l.relations, (r) => Arr.map(r.fields, (f) => f.type))
	const used = (kind: FieldType["kind"]) => Arr.some(fields, (t) => t.kind === kind)
	const base = (b: "bigint" | "boolean") =>
		Arr.some(fields, (t) => t.kind === "base" && t.base === b) ||
		Arr.some(l.brands, (br) => br.base === b)
	const sides = Arr.flatMap(l.laws, (law) =>
		law.kind === "contained" ? [law.from, law.to] : law.kind === "key" ? [law.side] : []
	)
	return [
		...(Arr.some(l.laws, (law) => law.kind === "check") ? ["check"] : []),
		"closed",
		...(used("closed") ? ["closedId"] : []),
		"contained",
		...(Arr.isReadonlyArrayNonEmpty(l.brands) ? ["contract"] : []),
		"key",
		...(used("natural") ? ["natural"] : []),
		"on",
		...(base("bigint") || base("boolean") ? ["pg"] : []),
		...(Arr.some(sides, (sd) => Arr.some(sd.terms, (t) => t.pred)) ? ["pred"] : []),
		"relation",
		...(Arr.some(sides, (sd) => sd.selection.kind !== "all") ? ["select"] : [])
	]
}

/** The fragment module: the flow's rosters, contracts, relations and laws, under `${prefix}Fragment`. */
export const printFragment = (l: Lowered): string => {
	const exportName = `${lower1(l.prefix)}Fragment`
	return `${lines([
		`/** The fragment den lowered the flow ${l.prefix} to; \`den generate\` writes it, and nothing edits it. */`,
		`import { ${commas(fragmentImportsOf(l))} } from "@bjornpagen/grizzle"`,
		`import { ${commas(denKeysOf(l))} } from "@bjornpagen/den/lower/keys"`,
		"",
		...Arr.map(l.brands, (b) => `const ${b.name} = contract(${q(b.name)}, ${baseExpr(b.base)})`),
		"",
		...Arr.map(
			l.rosters,
			(r) => `export const ${r.name} = closed(${q(r.name)}, [${commas(Arr.map(r.handles, q))}])`
		),
		"",
		...Arr.map(
			l.relations,
			(r) =>
				`export const ${r.name} = relation(${q(r.name)}, { ${commas(
					Arr.map(r.fields, (f) => `${f.name}: ${fieldExpr(f.type)}`)
				)} }, [${commas(Arr.map(r.key, q))}])`
		),
		"",
		`export const ${exportName} = Object.freeze({`,
		`\trelations: Object.freeze({ ${commas([...Arr.map(l.rosters, (r) => r.name), ...Arr.map(l.relations, (r) => r.name)])} }),`,
		`\tlaws: Object.freeze([${commas(Arr.map(l.laws, lawExpr))}])`,
		"})"
	])}\n`
}

const valueRelations = (v: ValueIR): ReadonlyArray<string> => [
	v.relation,
	...Arr.map(v.sidecars, (s) => s.relation)
]

const ownerOf = (v: ValueIR): string => (v.owner === "step" ? "step" : "scope")

/** The names programs and handles take, under the flow's prefix. */
const naming = (l: Lowered) => {
	const p = lower1(l.prefix)
	const n = (suffix: string) => `${p}${suffix}`
	return {
		role: `${l.prefix}Worker`,
		roleName: `${Str.camelToSnake(Str.uncapitalize(l.prefix))}_worker`,
		programs: n("Programs"),
		workload: n("Workload"),
		claim: n("Claim"),
		refuse: n("Refuse"),
		exhaust: n("Exhaust"),
		finish: n("Finish"),
		stepOf: n("StepOf"),
		resultOf: n("ResultOf"),
		heldOf: n("HeldOf"),
		scopeOf: n("ScopeOf"),
		withinOf: n("WithinOf"),
		pending: n("Pending"),
		pendingClaims: n("PendingClaims"),
		openScopes: n("OpenScopes"),
		stepsIn: n("StepsIn"),
		scopesIn: n("ScopesIn"),
		commit: (kind: string) => n(`Commit${kind}`),
		fail: (kind: string) => n(`Fail${kind}`),
		start: (root: string) => n(`Start${root}`),
		complete: (a: string) => n(`Complete${a}`),
		read: (relation: string) => n(`Read${relation}`),
		outputs: (join: string, kind: string) => n(`Outputs${join}${kind}`),
		outputsOf: (join: string, kind: string, field: string) =>
			n(`Outputs${join}${kind}${Str.capitalize(field)}`),
		ledger: n("Ledger"),
		handles: `${l.prefix}Handles`
	}
}

/** The array members of a write: an insert of each relation, then the app's puts and deletes. */
const members = (inserts: ReadonlyArray<string>, app: WritesIR, appRef: string): string =>
	Arr.join(
		[
			...Arr.map(inserts, (r) => `.insert(${r}, [])`),
			...Arr.map(app.insert, (r) => `.insert(${appRef}.relations.${r}, [])`),
			...Arr.map(app.put, (r) => `.put(${appRef}.relations.${r}, [])`),
			...Arr.map(app.delete, (r) => `.delete(${appRef}.relations.${r}, [])`)
		],
		""
	)

/** The programs module: den's role over the app's schema, its programs, and its workload. */
export const printPrograms = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const P = l.prefix
	const app = place.schema.name
	const W = n.role
	const r = (s: string) => `${P}${s}`
	const changes = (inserts: ReadonlyArray<string>, writes: WritesIR) =>
		`ChangeSet.empty(${W})${members(inserts, writes, app)}`
	const none: WritesIR = { insert: [], put: [], delete: [] }
	const writesAny = l.app.put.length + l.app.delete.length > 0
	const denRelations = Arr.map(l.relations, (rel) => rel.name)
	const appRelations = Arr.dedupe([...l.app.insert, ...l.app.put, ...l.app.delete])
	const scopeParam = `r.param("scope", ${r("Scope")}.fields.scope)`
	const programs: Array<readonly [string, string]> = [
		[n.claim, changes([r("Claim")], none)],
		[n.refuse, changes([r("Result"), r("Held"), r("Refusal")], none)],
		[n.exhaust, changes([r("Result"), r("Held"), r("Exhausted")], none)],
		[n.finish, changes([r("Finish"), r("Step")], none)],
		[n.stepOf, r("Step")],
		[n.resultOf, r("Result")],
		[n.heldOf, r("Held")],
		[n.scopeOf, r("Scope")],
		[n.withinOf, r("Within")],
		[
			n.pending,
			`query(${W}).rule((r) => {
	const { step, kind, scope } = v(${r("Step")}, "step")
	return r.match(${r("Step")}, { step, kind, scope }).where(r.not(${r("Result")}, { step })).find({ step, kind, scope })
})`
		],
		[
			n.pendingClaims,
			`query(${W}).rule((r) => {
	const { step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, until }).where(r.not(${r("Result")}, { step })).find({ step, attempt, until })
})`
		],
		[
			n.openScopes,
			`query(${W}).rule((r) => {
	const { scope } = v(${r("Scope")}, "scope")
	return r.match(${r("Scope")}, { scope }).where(r.not(${r("Finish")}, { scope })).find({ scope })
})`
		],
		[
			n.stepsIn,
			`query(${W})
	.rule((r) => {
		const { step, scope } = v(${r("Step")}, "step")
		return r
			.match(${r("Step")}, { step, scope })
			.match(${r("Result")}, { step })
			.where(r.eq(scope, ${scopeParam}), r.not(${r("Finish")}, { scope, step }))
			.find({ step, done: true })
	})
	.rule((r) => {
		const { step, scope } = v(${r("Step")}, "step")
		return r
			.match(${r("Step")}, { step, scope })
			.where(r.eq(scope, ${scopeParam}), r.not(${r("Result")}, { step }), r.not(${r("Finish")}, { scope, step }))
			.find({ step, done: false })
	})`
		],
		[
			n.scopesIn,
			`query(${W})
	.rule((r) => {
		const { scope, parent } = v(${r("Within")}, "within")
		const { step } = v(${r("Finish")}, "finish")
		return r
			.match(${r("Within")}, { scope, parent })
			.match(${r("Finish")}, { scope, step })
			.match(${r("Result")}, { step })
			.where(r.eq(parent, ${scopeParam}))
			.find({ child: scope, done: true })
	})
	.rule((r) => {
		const { scope, parent } = v(${r("Within")}, "within")
		return r
			.match(${r("Within")}, { scope, parent })
			.where(r.eq(parent, ${scopeParam}), r.not(${r("Finish")}, { scope }))
			.find({ child: scope, done: false })
	})
	.rule((r) => {
		const { scope, parent } = v(${r("Within")}, "within")
		const { step } = v(${r("Finish")}, "finish")
		return r
			.match(${r("Within")}, { scope, parent })
			.match(${r("Finish")}, { scope, step })
			.where(r.eq(parent, ${scopeParam}), r.not(${r("Result")}, { step }))
			.find({ child: scope, done: false })
	})`
		]
	]
	const reads = (v: ValueIR) =>
		Arr.forEach(valueRelations(v), (rel) => programs.push([n.read(rel), rel]))
	Arr.forEach(l.steps, (s) => {
		const spawns = Arr.isReadonlyArrayNonEmpty(s.edges) ? l.spawning : []
		programs.push([
			n.commit(s.name),
			changes([r("Result"), r("Held"), ...valueRelations(s.output), ...spawns], s.writes)
		])
		Option.map(s.error, (e) =>
			programs.push([n.fail(s.name), changes([r("Result"), r("Held"), ...valueRelations(e)], none)])
		)
		reads(s.input)
	})
	Arr.forEach(l.awaits, (a) => {
		programs.push([n.complete(a.name), changes([r("Result"), ...valueRelations(a.output)], none)])
		reads(a.input)
	})
	Arr.forEach(l.joins, (j) => {
		programs.push([n.commit(j.finish.name), changes([r("Result"), r("Held")], j.finish.writes)])
		Option.map(j.finish.error, (e) =>
			programs.push([
				n.fail(j.finish.name),
				changes([r("Result"), r("Held"), ...valueRelations(e)], none)
			])
		)
		if (j.root) {
			programs.push([
				n.start(j.name),
				changes([r("Root"), ...valueRelations(j.input), ...l.spawning], none)
			])
		}
		reads(j.input)
		Arr.forEach(j.finish.reads, (read) => {
			const cols = Arr.map(read.output.shape.columns, (c) => c.name)
			programs.push([
				n.outputs(j.name, read.name),
				`query(${W}).rule((r) => {
	const { step, scope } = v(${r("Step")}, "step")
	const { ${commas(cols)} } = v(${read.output.relation}, "output")
	return r
		.match(${r("Step")}, { step, kind: ${q(read.name)}, scope })
		.match(${read.output.relation}, { ${commas(["step", ...cols])} })
		.where(r.eq(scope, ${scopeParam}))
		.find({ ${commas(["step", ...cols])} })
})`
			])
			Arr.forEach(read.output.sidecars, (side) =>
				programs.push([
					n.outputsOf(j.name, read.name, side.column.name),
					`query(${W}).rule((r) => {
	const { step, scope } = v(${r("Step")}, "step")
	const { value } = v(${side.relation}, "value")
	return r
		.match(${r("Step")}, { step, kind: ${q(read.name)}, scope })
		.match(${side.relation}, { step, value })
		.where(r.eq(scope, ${scopeParam}))
		.find({ step, value })
})`
				])
			)
		})
	})
	const entries = [
		...Arr.map(l.rosters, (ro) => ro.name),
		...denRelations,
		...Arr.map(appRelations, (a) => `${a}: ${app}.relations.${a}`)
	]
	const writable = [...denRelations, ...appRelations]
	return `${lines([
		`/** The programs den lowered the flow ${P} to, over the schema ${app}; \`den generate\` writes them, and nothing edits them. */`,
		`import { ChangeSet, query, role, v, workload } from "@bjornpagen/grizzle"`,
		`import { ${place.schema.name} } from ${q(place.schema.from)}`,
		`import { ${commas([...Arr.map(l.rosters, (ro) => ro.name), ...denRelations])} } from ${q(place.fragment)}`,
		"",
		`export const ${W} = role(${app}, ${q(n.roleName)}, { ${commas(entries)} }, { ${writesAny ? "write" : "insert"}: [${commas(Arr.map(writable, q))}] })`,
		"",
		`export const ${n.programs} = Object.freeze({`,
		...Arr.map(programs, ([name, program]) => `\t${name}: ${program},`),
		"})",
		"",
		`export const ${n.workload} = workload(${W}, ${n.programs})`
	])}\n`
}

/** A value's facts for one owner `key` and value `x`: its row, and a row of each optional field it holds. */
const factsOf = (v: ValueIR, key: string, x: string): ReadonlyArray<string> => [
	`${v.relation}: [{ ${commas([`${ownerOf(v)}: ${key}`, ...Arr.map(v.shape.columns, (c) => `${c.name}: ${x}.${c.name}`)])} }]`,
	...Arr.map(
		v.sidecars,
		(s) =>
			`${s.relation}: Option.toArray(Option.map(${x}.${s.column.name}, (value) => ({ ${ownerOf(v)}: ${key}, value })))`
	)
]

/** A value's facts for many children `cs`, each with `key` and `input`. */
const childFactsOf = (v: ValueIR, cs: string): ReadonlyArray<string> => [
	`${v.relation}: Arr.map(${cs}, (c) => ({ ${commas([`${ownerOf(v)}: c.key`, ...Arr.map(v.shape.columns, (col) => `${col.name}: c.input.${col.name}`)])} }))`,
	...Arr.map(
		v.sidecars,
		(s) =>
			`${s.relation}: Arr.flatMap(${cs}, (c) => Option.toArray(Option.map(c.input.${s.column.name}, (value) => ({ ${ownerOf(v)}: c.key, value }))))`
	)
]

/** The value of a row `row` of `v` read by key, with each optional field read by its own handle. */
const valueOf = (v: ValueIR, row: string, side: (relation: string) => string): string =>
	`({ ${commas([
		...Arr.map(v.shape.columns, (c) => `${c.name}: ${row}.${c.name}`),
		...Arr.map(
			v.sidecars,
			(s) => `${s.column.name}: Option.map(${side(s.relation)}, (o) => o.value)`
		)
	])} })`

/** The den runtime imports a binding module needs, one per module. */
const runtimeImportsOf = (l: Lowered): ReadonlyArray<string> => {
	const children = Arr.flatMap(l.joins, (j) => j.children)
	const identity = [
		...(Arr.some(l.edges, (e) => e.toKind === "scope") ? ["edgeScope"] : []),
		...(Arr.some(l.edges, (e) => e.toKind !== "scope") ? ["edgeStep"] : []),
		"rootScope",
		"type ScopeKey",
		...(Arr.some(children, (c) => c.kind === "scope") ? ["startedScope"] : []),
		...(Arr.some(children, (c) => c.kind !== "scope") ? ["startedStep"] : []),
		"type StepKey"
	]
	return [
		`import { ${commas(identity)} } from "@bjornpagen/den/runtime/identity"`,
		`import type { Committed, FlowNeeds, Ledger } from "@bjornpagen/den/runtime/ledger"`,
		`import { runner } from "@bjornpagen/den/runtime/turn"`
	]
}

/** The binding module: the ledger port over the programs' served handles. */
export const printBinding = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const P = l.prefix
	const F = place.flow.name
	const r = (s: string) => `${P}${s}`
	const kindAt = (index: number) => `${F}.kinds[${index}]`
	const edgeAt = (index: number) => `${F}.edges[${index}]`
	const spawning = l.spawning
	const rowsType = lines([
		"interface Rows {",
		...Arr.map(spawning, (rel) => `\treadonly ${rel}: ReadonlyArray<Written<typeof ${rel}>>`),
		"}"
	])
	const noRows = `const noRows: Rows = { ${commas(Arr.map(spawning, (rel) => `${rel}: []`))} }`
	const joined = lines([
		"const joined = (a: Grown, b: Grown): Grown => ({",
		`\trows: { ${commas(Arr.map(spawning, (rel) => `${rel}: [...a.rows.${rel}, ...b.rows.${rel}]`))} },`,
		"\tspawned: { steps: [...a.spawned.steps, ...b.spawned.steps], scopes: [...a.spawned.scopes, ...b.spawned.scopes] }",
		"})"
	])
	const kindName = (name: string) => q(name)
	const readOne = (relation: string, key: string, owner: "step" | "scope") =>
		`Effect.map(h.${n.read(relation)}.once({ params: { ${owner}: ${key} }, facts: {} }), one)`

	/** A value read by key: its row and its optional fields' rows, as an Option of the value. */
	const readerOf = (v: ValueIR): string => `read${v.relation}`
	const readValue = (v: ValueIR, key: string): string => `${readerOf(v)}(${key})`
	const readerDef = (v: ValueIR): string => {
		const key = v.owner
		const keyType = v.owner === "step" ? "StepKey" : "ScopeKey"
		const body = Arr.isReadonlyArrayNonEmpty(v.sidecars)
			? lines([
					"Effect.gen(function* () {",
					`\tconst row = yield* ${readOne(v.relation, key, v.owner)}`,
					...Arr.map(
						v.sidecars,
						(s, i) => `\tconst side${i} = yield* ${readOne(s.relation, key, v.owner)}`
					),
					`\treturn Option.map(row, (found) => ${valueOf(v, "found", (rel) => `side${Arr.findFirstIndex(v.sidecars, (s) => s.relation === rel).pipe(Option.getOrElse(() => 0))}`)})`,
					"})"
				])
			: `Effect.map(${readOne(v.relation, key, v.owner)}, Option.map((found) => ${valueOf(v, "found", () => "")}))`
		return `const ${readerOf(v)} = (${key}: ${keyType}) => ${indented("\t")(body)}`
	}

	const startOf = (j: JoinIR): string => {
		const cases = Arr.map(j.children, (child) => {
			if (child.kind === "scope") {
				const target = Arr.findFirst(l.joins, (o) => o.name === child.name)
				return Option.match(target, {
					onNone: () => "",
					onSome: (t) =>
						`return Effect.flatMap(startedScope(scope, ordinal), (key) => Effect.map(start${t.name}(key, spawn.input), (inner) => joined(inner, { rows: { ...noRows, ${commas(
							[
								`${r("Scope")}: [{ scope: key, kind: ${kindName(child.name)} }]`,
								`${r("Within")}: [{ scope: key, parent: scope }]`,
								`${r("StartScope")}: [{ scope, ordinal: BigInt(ordinal), child: key }]`,
								...factsOf(t.input, "key", "spawn.input")
							]
						)} }, spawned: { steps: [], scopes: [key] } })))`
				})
			}
			const value = Arr.findFirst([...l.steps, ...l.awaits], (k) => k.name === child.name).pipe(
				Option.map((k) => k.input)
			)
			return Option.match(value, {
				onNone: () => "",
				onSome: (input) =>
					`return Effect.map(startedStep(scope, ordinal), (key): Grown => ({ rows: { ...noRows, ${commas(
						[
							`${r("Step")}: [{ step: key, kind: ${kindName(child.name)}, scope }]`,
							`${r("StartStep")}: [{ scope, ordinal: BigInt(ordinal), step: key }]`,
							...factsOf(input, "key", "spawn.input")
						]
					)} }, spawned: { steps: ${child.kind === "await" ? "[]" : `[{ step: key, kind: ${kindName(child.name)} }]`}, scopes: [] } }))`
			})
		})
		const labelled = Arr.zip(
			Arr.map(j.children, (child) => child.name),
			cases
		)
		const single = labelled.length === 1
		const body = single
			? Arr.map(labelled, ([, c]) => `\t\t${Str.slice("return ".length)(c)}`)
			: [
					"\t\tswitch (spawn.kind) {",
					...Arr.map(labelled, ([name, c]) => `\t\t\tcase ${kindName(name)}: ${c}`),
					"\t\t}"
				]
		return lines([
			`const start${j.name} = (scope: ScopeKey, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0]): Effect.Effect<Grown, never, Digest.Digest> =>`,
			`\tEffect.map(Effect.forEach(${kindAt(j.index)}.start(input), (spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> => ${single ? "" : "{"}`,
			...body,
			`\t${single ? "" : "}"}), (parts) => Arr.reduce(parts, nothingGrown, joined))`
		])
	}

	const edgeGrowth = (e: EdgeIR, from: string): string => {
		if (e.toKind === "scope") {
			const target = Arr.findFirst(l.joins, (o) => o.name === e.to)
			return Option.match(target, {
				onNone: () => "Effect.succeed(nothingGrown)",
				onSome: (t) =>
					`Effect.flatMap(Effect.forEach(${edgeAt(e.index)}.next(${from}.input, ${from}.output), (input, ordinal) => Effect.map(edgeScope(${from}.step, ${q(e.name)}, ordinal), (key) => ({ key, ordinal, input }))), (cs) => Effect.map(Effect.forEach(cs, (c) => start${t.name}(c.key, c.input)), (inner) => Arr.reduce(inner, { rows: { ...noRows, ${commas(
						[
							`${r("Scope")}: Arr.map(cs, (c) => ({ scope: c.key, kind: ${kindName(e.to)} }))`,
							`${r("Within")}: Arr.map(cs, (c) => ({ scope: c.key, parent: ${from}.scope }))`,
							`${e.relation}: Arr.map(cs, (c) => ({ from: ${from}.step, ordinal: BigInt(c.ordinal), to: c.key }))`,
							...childFactsOf(t.input, "cs")
						]
					)} }, spawned: { steps: [], scopes: Arr.map(cs, (c) => c.key) } }, joined)))`
			})
		}
		const input = Arr.findFirst([...l.steps, ...l.awaits], (k) => k.name === e.to).pipe(
			Option.map((k) => k.input)
		)
		return Option.match(input, {
			onNone: () => "Effect.succeed(nothingGrown)",
			onSome: (v) =>
				`Effect.map(Effect.forEach(${edgeAt(e.index)}.next(${from}.input, ${from}.output), (input, ordinal) => Effect.map(edgeStep(${from}.step, ${q(e.name)}, ordinal), (key) => ({ key, ordinal, input }))), (cs): Grown => ({ rows: { ...noRows, ${commas(
					[
						`${r("Step")}: Arr.map(cs, (c) => ({ step: c.key, kind: ${kindName(e.to)}, scope: ${from}.scope }))`,
						`${e.relation}: Arr.map(cs, (c) => ({ from: ${from}.step, ordinal: BigInt(c.ordinal), to: c.key }))`,
						...childFactsOf(v, "cs")
					]
				)} }, spawned: { steps: ${e.toKind === "await" ? "[]" : `Arr.map(cs, (c) => ({ step: c.key, kind: ${kindName(e.to)} }))`}, scopes: [] } }))`
		})
	}

	const opsOf = (inserts: ReadonlyArray<string>, w: WritesIR, done: string): string =>
		commas([
			`insert: { ${commas([...inserts, ...Arr.map(w.insert, (rel) => `${rel}: ${done}.writes.insert.${rel}`)])} }`,
			...(Arr.isReadonlyArrayNonEmpty(w.put)
				? [`put: { ${commas(Arr.map(w.put, (rel) => `${rel}: ${done}.writes.put.${rel}`))} }`]
				: []),
			...(Arr.isReadonlyArrayNonEmpty(w.delete)
				? [
						`delete: { ${commas(Arr.map(w.delete, (rel) => `${rel}: ${done}.writes.delete.${rel}`))} }`
					]
				: [])
		])

	const failPort = (name: string, error: Option.Option<ValueIR>): string =>
		Option.match(error, {
			onNone: () => "fail: (failed) => Effect.die(failed.error)",
			onSome: (e) =>
				`fail: (failed) => h.${n.fail(name)}.once({ params: {}, facts: { insert: { ${commas([
					`${r("Result")}: [{ step: failed.step, outcome: "failed" }]`,
					`${r("Held")}: [{ step: failed.step, attempt: failed.attempt }]`,
					...factsOf(e, "failed.step", "failed.error")
				])} } } })`
		})

	const stepRunner = (s: StepIR): string => {
		const grow = Arr.isReadonlyArrayNonEmpty(s.edges)
			? `Effect.map(Effect.all([${commas(Arr.map(s.edges, (e) => edgeGrowth(e, "done")))}]), (parts) => Arr.reduce(parts, nothingGrown, joined))`
			: "Effect.succeed(nothingGrown)"
		const spawnRows = Arr.isReadonlyArrayNonEmpty(s.edges) ? ["...grown.rows"] : []
		return lines([
			`runner(${kindAt(s.index)}, {`,
			`\tinput: (step) => ${readValue(s.input, "step")},`,
			"\tcommit: (done) => Effect.gen(function* () {",
			`\t\tconst grown = yield* ${grow}`,
			`\t\tconst outcome = yield* h.${n.commit(s.name)}.once({ params: {}, facts: { ${opsOf(
				[
					...spawnRows,
					`${r("Result")}: [{ step: done.step, outcome: "done" }]`,
					`${r("Held")}: [{ step: done.step, attempt: done.attempt }]`,
					...factsOf(s.output, "done.step", "done.output")
				],
				s.writes,
				"done"
			)} } })`,
			"\t\treturn { outcome, spawned: grown.spawned }",
			"\t}),",
			`\t${failPort(s.name, s.error)}`,
			"})"
		])
	}

	const finishRunner = (j: JoinIR): string => {
		const reads = Arr.map(j.finish.reads, (read) => {
			const cols = Arr.map(read.output.shape.columns, (c) => `${c.name}: row.${c.name}`)
			const sides = Arr.map(
				read.output.sidecars,
				(s, i) =>
					`${s.column.name}: Option.map(Arr.findFirst(side${i}, (o) => o.step === row.step), (o) => o.value)`
			)
			return lines([
				`\t\tconst rows${read.name} = yield* Effect.map(h.${n.outputs(j.name, read.name)}.once({ params: { scope }, facts: {} }), Arr.fromIterable)`,
				...Arr.map(
					read.output.sidecars,
					(s, i) =>
						`\t\tconst side${i} = yield* Effect.map(h.${n.outputsOf(j.name, read.name, s.column.name)}.once({ params: { scope }, facts: {} }), Arr.fromIterable)`
				),
				`\t\tconst ${read.name} = Arr.map(rows${read.name}, (row) => ({ ${commas([...cols, ...sides])} }))`
			])
		})
		const kind = kindAt(j.index)
		return lines([
			"runner(",
			"\t{",
			`\t\tname: ${q(j.finish.name)},`,
			`\t\tlane: ${kind}.finish.lane,`,
			`\t\tbody: (read: { readonly input: Parameters<(typeof ${kind})["start"]>[0]; readonly results: Parameters<(typeof ${kind})["finish"]["body"]>[1] }) => Effect.map(${kind}.finish.body(read.input, read.results), (writes) => ({ output: {}, writes }))`,
			"\t},",
			"\t{",
			"\t\tinput: (_step, scope) => Effect.gen(function* () {",
			`\t\tconst input = yield* ${readValue(j.input, "scope")}`,
			"\t\tif (Option.isNone(input)) {",
			"\t\t\treturn Option.none()",
			"\t\t}",
			...reads,
			`\t\treturn Option.some({ input: input.value, results: { ${commas(Arr.map(j.finish.reads, (read) => read.name))} } })`,
			"\t}),",
			`\t\tcommit: (done) => Effect.map(h.${n.commit(j.finish.name)}.once({ params: {}, facts: { ${opsOf(
				[
					`${r("Result")}: [{ step: done.step, outcome: "done" }]`,
					`${r("Held")}: [{ step: done.step, attempt: done.attempt }]`
				],
				j.finish.writes,
				"done"
			)} } }), (outcome) => ({ outcome, spawned: { steps: [], scopes: [] } })),`,
			`\t\t${failPort(j.finish.name, j.finish.error)}`,
			"\t}",
			")"
		])
	}

	const roots = Arr.filter(l.joins, (j) => j.root)
	const rootStart = (j: JoinIR): string =>
		lines([
			`${j.name}: (key: string, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0]): Effect.Effect<Committed, CallError, Digest.Digest> => Effect.gen(function* () {`,
			`\tconst scope = yield* rootScope(${q(P)}, ${q(j.name)}, key)`,
			`\tconst grown = yield* start${j.name}(scope, input)`,
			`\tconst outcome = yield* h.${n.start(j.name)}.once({ params: {}, facts: { insert: { ${commas(
				[
					"...grown.rows",
					`${r("Scope")}: [{ scope, kind: ${q(j.name)} }, ...grown.rows.${r("Scope")}]`,
					`${r("Root")}: [{ scope, key }]`,
					...factsOf(j.input, "scope", "input")
				]
			)} } } })`,
			"\treturn { outcome, spawned: { steps: grown.spawned.steps, scopes: [scope, ...grown.spawned.scopes] } }",
			"})"
		])
	const completeAwait = (a: Lowered["awaits"][number]): string =>
		`${a.name}: (step: StepKey, output: (typeof ${kindAt(a.index)})["output"]["Type"]) => h.${n.complete(a.name)}.once({ params: {}, facts: { insert: { ${commas(
			[`${r("Result")}: [{ step, outcome: "done" }]`, ...factsOf(a.output, "step", "output")]
		)} } } })`

	const finishOfJoin = lines(
		l.joins.length === 1
			? Arr.map(
					l.joins,
					(j) =>
						`const finishOf = (_join: (typeof ${r("Join")})["handles"][number]): (typeof ${r("Kind")})["handles"][number] => ${q(j.finish.name)}`
				)
			: [
					`const finishOf = (join: (typeof ${r("Join")})["handles"][number]): (typeof ${r("Kind")})["handles"][number] => {`,
					"\tswitch (join) {",
					...Arr.map(l.joins, (j) => `\t\tcase ${q(j.name)}: return ${q(j.finish.name)}`),
					"\t}",
					"}"
				]
	)

	const fragmentImports = Arr.dedupe([r("Join"), r("Kind"), ...spawning])

	return `${lines([
		`/** The ledger port of the flow ${P} over its served programs; \`den generate\` writes it, and nothing edits it. */`,
		`import type { Written } from "@bjornpagen/grizzle"`,
		`import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"`,
		`import { Array as Arr, Effect, Option } from "effect"`,
		`import type { Digest } from "effect/crypto"`,
		...runtimeImportsOf(l),
		`import { ${F} } from ${q(place.flow.from)}`,
		`import type { ${commas(fragmentImports)} } from ${q(place.fragment)}`,
		`import type { ${n.programs} } from ${q(place.programs)}`,
		"",
		`/** The handles the ledger calls: each of the flow's programs, from whichever login serves them. */`,
		`export type ${n.handles} = { readonly [K in keyof typeof ${n.programs}]: MemberHandle<(typeof ${n.programs})[K]> }`,
		"",
		rowsType,
		"",
		"interface Grown {",
		"\treadonly rows: Rows",
		"\treadonly spawned: { readonly steps: ReadonlyArray<{ readonly step: StepKey; readonly kind: string }>; readonly scopes: ReadonlyArray<ScopeKey> }",
		"}",
		"",
		"const one = <A>(rows: Iterable<A>): Option.Option<A> => Arr.head(Arr.fromIterable(rows))",
		"",
		finishOfJoin,
		"",
		`/** The ledger of the flow ${P} over its handles, with the starts of its roots and the completions of its awaits. */`,
		`export const ${n.ledger} = (h: ${n.handles}) => {`,
		`\t${noRows}`,
		"\tconst nothingGrown: Grown = { rows: noRows, spawned: { steps: [], scopes: [] } }",
		`\t${indented("\t")(joined)}`,
		...Arr.map(l.joins, (j) => `\t${indented("\t")(startOf(j))}`),
		...Arr.map(
			[...Arr.map(l.steps, (st) => st.input), ...Arr.map(l.joins, (j) => j.input)],
			(v) => `\t${indented("\t")(readerDef(v))}`
		),
		`\tconst ledger: Ledger<FlowNeeds<typeof ${F}>> = {`,
		`\t\tprefix: ${q(P)},`,
		`\t\tstepOf: (step) => Effect.map(h.${n.stepOf}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))),`,
		`\t\tresultOf: (step) => Effect.map(h.${n.resultOf}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.outcome)),`,
		`\t\theldOf: (step) => Effect.map(h.${n.heldOf}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.attempt)),`,
		`\t\tjoinOf: (scope) => Effect.map(h.${n.scopeOf}.once({ params: { scope }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.kind)),`,
		`\t\tparentOf: (scope) => Effect.map(h.${n.withinOf}.once({ params: { scope }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.parent)),`,
		`\t\tclaim: (claim) => h.${n.claim}.once({ params: {}, facts: { insert: { ${r("Claim")}: [claim] } } }),`,
		`\t\trefuse: (step, attempt, law) => h.${n.refuse}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, outcome: "failed" }], ${r("Held")}: [{ step, attempt }], ${r("Refusal")}: [{ step, law }] } } }),`,
		`\t\texhaust: (step, attempt) => h.${n.exhaust}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, outcome: "failed" }], ${r("Held")}: [{ step, attempt }], ${r("Exhausted")}: [{ step, attempts: attempt }] } } }),`,
		`\t\tpending: Effect.map(h.${n.pending}.once({ params: {}, facts: {} }), (rows) => Arr.map(Arr.fromIterable(rows), (row) => ({ step: row.step, kind: row.kind, scope: row.scope }))),`,
		`\t\tpendingClaims: Effect.map(h.${n.pendingClaims}.once({ params: {}, facts: {} }), Arr.fromIterable),`,
		`\t\topenScopes: Effect.map(h.${n.openScopes}.once({ params: {}, facts: {} }), (rows) => Arr.map(Arr.fromIterable(rows), (row) => row.scope)),`,
		`\t\tstepsIn: (scope) => Effect.map(h.${n.stepsIn}.once({ params: { scope }, facts: {} }), (rows) => Arr.map(Arr.fromIterable(rows), (row) => ({ key: row.step, done: row.done }))),`,
		`\t\tscopesIn: (scope) => Effect.map(h.${n.scopesIn}.once({ params: { scope }, facts: {} }), (rows) => Arr.map(Arr.fromIterable(rows), (row) => ({ key: row.child, done: row.done }))),`,
		`\t\tfinish: (scope, step) => Effect.flatMap(h.${n.scopeOf}.once({ params: { scope }, facts: {} }), (rows) => Option.match(one(rows), { onNone: () => Effect.die("a scope finishes only once it is installed"), onSome: (row) => h.${n.finish}.once({ params: {}, facts: { insert: { ${r("Finish")}: [{ scope, step }], ${r("Step")}: [{ step, kind: finishOf(row.kind), scope }] } } }) })),`,
		"\t\trunners: new Map([",
		...Arr.map(l.steps, (s) => `\t\t\t[${q(s.name)}, ${indented("\t\t\t")(stepRunner(s))}],`),
		...Arr.map(
			l.joins,
			(j) => `\t\t\t[${q(j.finish.name)}, ${indented("\t\t\t")(finishRunner(j))}],`
		),
		"\t\t]),",
		`\t\tfinishKinds: new Set([${commas(Arr.map(l.joins, (j) => q(j.finish.name)))}])`,
		"\t}",
		"\treturn {",
		"\t\tledger,",
		`\t\tstart: { ${commas(Arr.map(roots, rootStart))} },`,
		`\t\tcomplete: { ${commas(Arr.map(l.awaits, completeAwait))} }`,
		"\t}",
		"}"
	])}\n`
}
