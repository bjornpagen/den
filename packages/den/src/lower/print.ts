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
 * - the fragment: rosters, contracts, relations and laws, plain grizzle values the app spreads into its `schema(...)`,
 *   and the den relations the flow's app role must hold to commit its steps;
 * - the programs: den's role and its coordination role over the app's schema, their programs, and the commits and
 *   declared reads over the flow's app role, written over the app's concrete schema, since grizzle at its pin builds no
 *   program generic over a schema (the seam POROUS replaces with programs over the fragment, and this module with
 *   nothing);
 * - the binding: the ledger port over the programs' served handles, converting den's values to facts and rows back.
 */

/** Where the printed modules find what they import, each by the module specifier the app imports it under. */
export interface Placement {
	/** The fragment module, which the programs and the binding import. */
	readonly fragment: string
	/** The programs module, which the binding imports for its types. */
	readonly programs: string
	/** The module exporting each app relation a declared read names under its own name. */
	readonly relations: string
	/** The module exporting the app's schema, and its export's name. */
	readonly schema: { readonly from: string; readonly name: string }
	/** The module exporting the flow's app role, and its export's name. */
	readonly writer: { readonly from: string; readonly name: string }
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
		case "app":
			return `${type.relation}.fields.${type.field}`
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
		case "race":
			return `race(${law.relation})`
		case "check":
			return `check(${q(law.name)}, ${law.relation}, (row) => row.ge(row.${law.field}, ${law.bound}n))`
	}
}

const fieldsOf = (l: Lowered): ReadonlyArray<FieldType> =>
	Arr.flatMap(l.relations, (r) => Arr.map(r.fields, (f) => f.type))

/** The den contracts and text a fragment module uses. */
const denKeysOf = (l: Lowered): ReadonlyArray<string> => {
	const fields = fieldsOf(l)
	const keys = Arr.dedupe(Arr.flatMap(fields, (t) => (t.kind === "key" ? [t.contract] : [])))
	const text =
		Arr.some(fields, (t) => t.kind === "base" && t.base === "text") ||
		Arr.some(l.brands, (b) => b.base === "text")
	return Arr.sort([...keys, ...(text ? ["Text"] : [])], Order.String)
}

/** The grizzle names a fragment module uses. */
const fragmentImportsOf = (l: Lowered): ReadonlyArray<string> => {
	const fields = fieldsOf(l)
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
		...(Arr.some(l.laws, (law) => law.kind === "race") ? ["race"] : []),
		"relation",
		...(Arr.some(sides, (sd) => sd.selection.kind !== "all") ? ["select"] : [])
	]
}

const valueRelations = (v: ValueIR): ReadonlyArray<string> => [
	v.relation,
	...Arr.map(v.sidecars, (s) => s.relation)
]

/** The names a flow's printed programs and handles take, under its prefix. */
const naming = (l: Lowered) => {
	const p = lower1(l.prefix)
	const n = (suffix: string) => `${p}${suffix}`
	const snake = Str.camelToSnake(Str.uncapitalize(l.prefix))
	return {
		fragment: n("Fragment"),
		den: `${l.prefix}Den`,
		denName: `${snake}_den`,
		seats: `${l.prefix}Seats`,
		seatsName: `${snake}_seats`,
		denPrograms: n("DenPrograms"),
		denWorkload: n("DenWorkload"),
		seatsPrograms: n("SeatsPrograms"),
		seatsWorkload: n("SeatsWorkload"),
		commitPrograms: n("CommitPrograms"),
		commitWorkload: n("Commits"),
		requests: n("Requests"),
		handles: `${l.prefix}Handles`,
		ledger: n("Ledger"),
		program: n
	}
}

/** Whether a join is a root the app's own write requests. */
const isApp = (j: JoinIR): boolean => Option.exists(j.root, (r) => r.trigger === "app")

/** Whether a join is a root that holds an exclusivity seat. */
const isExclusive = (j: JoinIR): boolean => Option.exists(j.root, (r) => r.exclusive)

/** The relations a flow's app role writes: each result, output, read and spawn a commit writes, and its roots' requests. */
const writerRelationsOf = (l: Lowered): ReadonlyArray<string> => {
	const P = l.prefix
	const anySpawn = Arr.some(l.steps, (s) => Arr.isReadonlyArrayNonEmpty(s.edges))
	const appRoots = Arr.some(l.joins, (j) => isApp(j))
	return Arr.dedupe([
		`${P}Result`,
		`${P}Done`,
		`${P}Held`,
		...Arr.flatMap(l.steps, (s) => valueRelations(s.output)),
		...Arr.flatMap(l.steps, (s) => Option.toArray(Option.map(s.reads, (r) => r.record))),
		...(anySpawn ? l.spawning : []),
		...(appRoots ? l.requesting : [])
	])
}

/** The fragment module: the flow's rosters, contracts, relations, laws, and its app role's den relations. */
export const printFragment = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const reads = l.read
	const writer = writerRelationsOf(l)
	const rosterNames = Arr.map(l.rosters, (r) => r.name)
	return `${lines([
		`/** The fragment den lowered the flow ${l.prefix} to; \`den generate\` writes it, and nothing edits it. */`,
		`import { ${commas(fragmentImportsOf(l))} } from "@bjornpagen/grizzle"`,
		`import { ${commas(denKeysOf(l))} } from "@bjornpagen/den/lower/keys"`,
		...(Arr.isReadonlyArrayNonEmpty(reads)
			? [`import { ${commas(reads)} } from ${q(place.relations)}`]
			: []),
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
		`/** The flow's declarations, in order, its laws, and the den relations its app role \`${l.writer}\` holds and inserts into. */`,
		`export const ${n.fragment} = Object.freeze({`,
		`\trelations: [${commas([...rosterNames, ...Arr.map(l.relations, (r) => r.name)])}] as const,`,
		`\tlaws: Object.freeze([${commas(Arr.map(l.laws, lawExpr))}]),`,
		`\twriter: Object.freeze({ relations: Object.freeze({ ${commas([...rosterNames, ...writer])} }), insert: [${commas(Arr.map(writer, q))}] as const })`,
		"})"
	])}\n`
}

/** The array members of a ChangeSet: an insert of each relation, then the app's inserts, puts and deletes. */
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

const none: WritesIR = { insert: [], put: [], delete: [] }

/** A query over `role` of every row of `relation`, by its fields. */
const allOf = (role: string, relation: string, fields: ReadonlyArray<string>): string =>
	`query(${role}).rule((r) => {
	const { ${commas(fields)} } = v(${relation}, ${q(lower1(relation))})
	return r.match(${relation}, { ${commas(fields)} }).find({ ${commas(fields)} })
})`

/**
 * A status read, run deferrable: it waits for a safe snapshot and then never fails with a serialization failure, the
 * census's and the relay's reads, the seat module's and each step's declared read.
 */
const deferred = (program: string): string => `deferrable(${program})`

/** The relations den's own role inserts into: every graph relation but those only a commit writes. */
const denRelationsOf = (l: Lowered): ReadonlyArray<string> => {
	const coordination = new Set(l.coordination)
	const outputs = new Set([
		...Arr.flatMap(l.steps, (s) => valueRelations(s.output)),
		...Arr.map(l.edges, (e) => e.relation)
	])
	return Arr.filter(
		Arr.map(l.relations, (r) => r.name),
		(name) => !coordination.has(name) && !outputs.has(name)
	)
}

/** The relations a scope's admission writes. */
const admittingOf = (l: Lowered): ReadonlyArray<string> => {
	const P = l.prefix
	return Arr.dedupe([
		`${P}Admitted`,
		`${P}Finish`,
		`${P}StartStep`,
		`${P}StartScope`,
		...Arr.filter(l.spawning, (r) => !Arr.some(l.edges, (e) => e.relation === r))
	])
}

/** The programs module: den's roles over the app's schema, their programs and workloads, and the app role's commits. */
export const printPrograms = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const P = l.prefix
	const app = place.schema.name
	const W = place.writer.name
	const r = (s: string) => `${P}${s}`
	const scopeParam = `r.param("scope", ${r("Scope")}.fields.scope)`
	const stepParam = `r.param("step", ${r("Step")}.fields.step)`
	const den = denRelationsOf(l)
	const idleEntries = Arr.flatMap(l.idle, (f) => [
		`${f}Step: ${app}.relations.${f}Step`,
		`${f}Result: ${app}.relations.${f}Result`
	])
	const rosterNames = Arr.map(l.rosters, (ro) => ro.name)
	const allRelations = Arr.map(l.relations, (rel) => rel.name)
	const has = (relation: string) => Arr.contains(allRelations, relation)
	const exclusiveKeys = has(r("ExclusiveKey"))
	const denPrograms: Array<readonly [string, string]> = [
		[
			n.program("Claim"),
			`ChangeSet.empty(${n.den})
	.insert(${r("Claim")}, [])
	.read("held", (delta) =>
		query(${n.den})
			.rule((r) => {
				const { step, attempt, holder } = v(delta.added(${r("Claim")}), "added")
				return r.match(delta.added(${r("Claim")}), { step, attempt, holder }).find({ step, attempt, holder })
			})
			.rule((r) => {
				const { step, attempt, holder } = v(delta.met(${r("Claim")}), "met")
				return r.match(delta.met(${r("Claim")}), { step, attempt, holder }).find({ step, attempt, holder })
			})
	)`
		],
		[n.program("Retry"), `ChangeSet.empty(${n.den}).insert(${r("Retry")}, [])`],
		[
			n.program("Refuse"),
			`ChangeSet.empty(${n.den})${members([r("Result"), r("Failed"), r("Held"), r("Refusal")], none, app)}`
		],
		[
			n.program("Exhaust"),
			`ChangeSet.empty(${n.den})${members([r("Result"), r("Failed"), r("Held"), r("Exhausted")], none, app)}`
		],
		[n.program("Admit"), `ChangeSet.empty(${n.den})${members(admittingOf(l), none, app)}`],
		[n.program("Skip"), `ChangeSet.empty(${n.den}).insert(${r("Skipped")}, [])`],
		[n.program("SkippedOf"), r("Skipped")],
		[n.program("StepOf"), r("Step")],
		[n.program("ResultOf"), r("Result")],
		[n.program("HeldOf"), r("Held")],
		[n.program("DueOf"), r("Due")],
		[n.program("ScopeOf"), r("Scope")],
		[n.program("WithinOf"), r("Within")],
		[n.program("AdmittedOf"), r("Admitted")],
		[n.program("RootOf"), r("Root")],
		...(exclusiveKeys ? [[n.program("ExclusiveKeyOf"), r("ExclusiveKey")] as const] : []),
		[
			n.program("ClaimsOf"),
			`query(${n.den}).rule((r) => {
	const { step, attempt, holder, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, holder, until }).where(r.eq(step, ${stepParam})).find({ step, attempt, holder, until })
})`
		],
		[
			n.program("RetriesOf"),
			`query(${n.den}).rule((r) => {
	const { step, attempt, at, spent } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { step, attempt, at, spent }).where(r.eq(step, ${stepParam})).find({ step, attempt, at, spent })
})`
		],
		[
			n.program("UnendedSteps"),
			`query(${n.den}).rule((r) => {
	const { step, scope } = v(${r("Step")}, "step")
	return r
		.match(${r("Step")}, { step, scope })
		.where(r.eq(scope, ${scopeParam}), r.not(${r("Result")}, { step }), r.not(${r("Finish")}, { scope, step }))
		.find({ step })
})`
		],
		[
			n.program("OpenChildren"),
			`query(${n.den})
	.rule((r) => {
		const { scope, parent } = v(${r("Within")}, "within")
		return r.match(${r("Within")}, { scope, parent }).where(r.eq(parent, ${scopeParam}), r.not(${r("Admitted")}, { scope })).find({ child: scope })
	})
	.rule((r) => {
		const { scope, parent } = v(${r("Within")}, "within")
		const { step } = v(${r("Finish")}, "finish")
		return r
			.match(${r("Within")}, { scope, parent })
			.match(${r("Finish")}, { scope, step })
			.where(r.eq(parent, ${scopeParam}), r.not(${r("Result")}, { step }))
			.find({ child: scope })
	})`
		],
		[
			n.program("Finished"),
			`query(${n.den}).rule((r) => {
	const { scope, step } = v(${r("Finish")}, "finish")
	return r.match(${r("Finish")}, { scope, step }).match(${r("Result")}, { step }).where(r.eq(scope, ${scopeParam})).find({ step })
})`
		],
		[
			n.program("Pending"),
			deferred(`query(${n.den}).rule((r) => {
	const { step, kind, scope } = v(${r("Step")}, "step")
	return r.match(${r("Step")}, { step, kind, scope }).where(r.not(${r("Result")}, { step })).find({ step, kind, scope })
})`)
		],
		[
			n.program("PendingClaims"),
			deferred(`query(${n.den}).rule((r) => {
	const { step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, until }).where(r.not(${r("Result")}, { step })).find({ step, attempt, until })
})`)
		],
		[
			n.program("PendingRetries"),
			deferred(`query(${n.den}).rule((r) => {
	const { step, attempt, at, spent } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { step, attempt, at, spent }).where(r.not(${r("Result")}, { step })).find({ step, attempt, at, spent })
})`)
		],
		[
			n.program("PendingDues"),
			deferred(`query(${n.den}).rule((r) => {
	const { step, at } = v(${r("Due")}, "due")
	return r.match(${r("Due")}, { step, at }).where(r.not(${r("Result")}, { step })).find({ step, at })
})`)
		],
		[
			n.program("Requested"),
			deferred(`query(${n.den}).rule((r) => {
	const { scope, kind } = v(${r("Scope")}, "scope")
	return r.match(${r("Scope")}, { scope, kind }).where(r.not(${r("Admitted")}, { scope }), r.not(${r("Skipped")}, { scope })).find({ scope, kind })
})`)
		],
		[
			n.program("Running"),
			deferred(`query(${n.den}).rule((r) => {
	const { scope, kind } = v(${r("Scope")}, "scope")
	const { step } = v(${r("Finish")}, "finish")
	return r.match(${r("Scope")}, { scope, kind }).match(${r("Finish")}, { scope, step }).where(r.not(${r("Result")}, { step })).find({ scope, kind })
})`)
		],
		[n.program("Withins"), deferred(allOf(n.den, r("Within"), ["scope", "parent"]))],
		[n.program("Roots"), deferred(allOf(n.den, r("Root"), ["scope", "key", "at"]))],
		...(exclusiveKeys
			? [
					[
						n.program("ExclusiveKeys"),
						deferred(allOf(n.den, r("ExclusiveKey"), ["scope", "key", "id"]))
					] as const
				]
			: []),
		...Arr.map(
			l.idle,
			(f) =>
				[
					n.program(`Busy${f}`),
					deferred(`query(${n.den}).rule((r) => {
	const { step } = v(${app}.relations.${f}Step, "step")
	return r.match(${app}.relations.${f}Step, { step }).where(r.not(${app}.relations.${f}Result, { step })).find({ step })
})`)
				] as const
		)
	]
	const denValueReads = (v: ValueIR) =>
		Arr.forEach(valueRelations(v), (rel) => denPrograms.push([n.program(`Read${rel}`), rel]))
	Arr.forEach(l.steps, (s) => {
		denValueReads(s.input)
		Option.map(s.error, (e) =>
			denPrograms.push([
				n.program(`Fail${s.name}`),
				`ChangeSet.empty(${n.den})${members(
					[
						r("Result"),
						r("Failed"),
						r("Held"),
						...valueRelations(e),
						...Option.toArray(Option.map(s.reads, (rd) => rd.record))
					],
					none,
					app
				)}`
			])
		)
	})
	Arr.forEach(l.joins, (j) => {
		denValueReads(j.input)
		Option.map(j.finish.error, (e) =>
			denPrograms.push([
				n.program(`Fail${j.finish.name}`),
				`ChangeSet.empty(${n.den})${members([r("Result"), r("Failed"), r("Held"), ...valueRelations(e)], none, app)}`
			])
		)
		if (Option.isSome(j.root) && !isApp(j)) {
			denPrograms.push([
				n.program(`Request${j.name}`),
				`ChangeSet.empty(${n.den})${members(
					[
						r("Scope"),
						r("Root"),
						...(isExclusive(j) ? [r("ExclusiveKey")] : []),
						...valueRelations(j.input)
					],
					none,
					app
				)}`
			])
		}
		Arr.forEach(j.finish.reads, (read) => {
			if (read.kind === "scope") {
				denPrograms.push([
					n.program(`Endings${j.name}${read.name}`),
					`query(${n.den}).rule((r) => {
	const { scope, parent } = v(${r("Within")}, "within")
	const { step } = v(${r("Finish")}, "finish")
	const { outcome } = v(${r("Result")}, "result")
	return r
		.match(${r("Within")}, { scope, parent })
		.match(${r("Scope")}, { scope, kind: ${q(read.name)} })
		.match(${r("Finish")}, { scope, step })
		.match(${r("Result")}, { step, outcome })
		.where(r.eq(parent, ${scopeParam}))
		.find({ child: scope, outcome })
})`
				])
				return
			}
			const cols = Arr.map(read.output.shape.columns, (c) => c.name)
			denPrograms.push([
				n.program(`Outputs${j.name}${read.name}`),
				`query(${n.den}).rule((r) => {
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
				denPrograms.push([
					n.program(`Outputs${j.name}${read.name}${Str.capitalize(side.column.name)}`),
					`query(${n.den}).rule((r) => {
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
			denPrograms.push([
				n.program(`Failures${j.name}${read.name}`),
				`query(${n.den}).rule((r) => {
	const { step, scope } = v(${r("Step")}, "step")
	return r
		.match(${r("Step")}, { step, kind: ${q(read.name)}, scope })
		.match(${r("Result")}, { step, outcome: "failed" })
		.where(r.eq(scope, ${scopeParam}))
		.find({ step })
})`
			])
		})
	})

	const coordination = l.coordination
	const seatsPrograms: Array<readonly [string, string]> = []
	if (has(r("Seat"))) {
		seatsPrograms.push(
			[
				n.program("Provision"),
				`ChangeSet.empty(${n.seats}).insert(${r("Seat")}, []).delete(${r("Seat")}, [])`
			],
			[
				n.program("Take"),
				`ChangeSet.sequence(ChangeSet.empty(${n.seats}).delete(${r("Hold")}, []), ChangeSet.empty(${n.seats}).insert(${r("Hold")}, []))`
			],
			[n.program("GiveBack"), `ChangeSet.empty(${n.seats}).delete(${r("Hold")}, [])`],
			[n.program("Seats"), deferred(allOf(n.seats, r("Seat"), ["resource", "seat"]))],
			[
				n.program("Holds"),
				deferred(allOf(n.seats, r("Hold"), ["resource", "seat", "holder", "until"]))
			]
		)
	}
	if (has(r("Exclusive"))) {
		seatsPrograms.push(
			[n.program("HoldExclusive"), `ChangeSet.empty(${n.seats}).insert(${r("Exclusive")}, [])`],
			[n.program("ReleaseExclusive"), `ChangeSet.empty(${n.seats}).delete(${r("Exclusive")}, [])`],
			[n.program("Exclusives"), deferred(allOf(n.seats, r("Exclusive"), ["kind", "key", "scope"]))]
		)
	}
	seatsPrograms.push(
		[n.program("Pause"), `ChangeSet.empty(${n.seats}).insert(${r("Paused")}, [])`],
		[n.program("Resume"), `ChangeSet.empty(${n.seats}).delete(${r("Paused")}, [])`],
		[n.program("PausedAll"), deferred(allOf(n.seats, r("Paused"), ["target"]))]
	)

	const commitPrograms: Array<readonly [string, string]> = []
	Arr.forEach(l.steps, (s) => {
		const spawns = Arr.isReadonlyArrayNonEmpty(s.edges) ? l.spawning : []
		commitPrograms.push([
			n.program(`Commit${s.name}`),
			`ChangeSet.empty(${W})${members(
				[
					r("Result"),
					r("Done"),
					r("Held"),
					...valueRelations(s.output),
					...Option.toArray(Option.map(s.reads, (rd) => rd.record)),
					...spawns
				],
				s.writes,
				app
			)}`
		])
		Option.map(s.reads, (rd) =>
			commitPrograms.push([
				n.program(`Read${s.name}`),
				deferred(`query(${W}).rule((r) => {
	const { ${commas(rd.fields)} } = v(${app}.relations.${rd.relation}, "row")
	return r
		.match(${app}.relations.${rd.relation}, { ${commas(rd.fields)} })${
			Arr.isReadonlyArrayNonEmpty(rd.by)
				? `
		.where(${commas(Arr.map(rd.by, (f) => `r.eq(${f}, r.param(${q(f)}, ${app}.relations.${rd.relation}.fields.${f}))`))})`
				: ""
		}
		.find({ ${commas(rd.fields)} })
})`)
			])
		)
	})
	Arr.forEach(l.joins, (j) =>
		commitPrograms.push([
			n.program(`Commit${j.finish.name}`),
			`ChangeSet.empty(${W})${members([r("Result"), r("Done"), r("Held")], j.finish.writes, app)}`
		])
	)
	const appRoots = Arr.filter(l.joins, isApp)
	const requests = Arr.map(
		appRoots,
		(j) =>
			`${j.name}: ChangeSet.empty(${W})${members(
				[
					r("Scope"),
					r("Root"),
					...(isExclusive(j) ? [r("ExclusiveKey")] : []),
					...valueRelations(j.input)
				],
				none,
				app
			)}`
	)

	const fragmentNames = [...rosterNames, ...allRelations]
	const block = (name: string, programs: ReadonlyArray<readonly [string, string]>) => [
		`export const ${name} = Object.freeze({`,
		...Arr.map(programs, ([member, program]) => `\t${member}: ${indented("\t")(program)},`),
		"})"
	]
	return `${lines([
		`/** The programs den lowered the flow ${P} to, over the schema ${app}; \`den generate\` writes them, and nothing edits them. */`,
		`import { ChangeSet, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"`,
		`import { ${app} } from ${q(place.schema.from)}`,
		`import { ${W} } from ${q(place.writer.from)}`,
		`import { ${commas(fragmentNames)} } from ${q(place.fragment)}`,
		"",
		`/** den's role for the flow ${P}: claims, retries, failures, admissions, requests, and every read the scheduler makes. */`,
		`export const ${n.den} = role(${app}, ${q(n.denName)}, { ${commas([...rosterNames, ...Arr.filter(allRelations, (rel) => !Arr.contains(coordination, rel)), ...idleEntries])} }, { insert: [${commas(Arr.map(den, q))}] })`,
		"",
		`/** den's coordination role for the flow ${P}: seats, holds, exclusivity seats and pauses, the seat module's (LEASE replaces it). */`,
		`export const ${n.seats} = role(${app}, ${q(n.seatsName)}, { ${commas([...rosterNames, ...coordination])} }, { write: [${commas(Arr.map(coordination, q))}] })`,
		"",
		...block(n.denPrograms, denPrograms),
		"",
		`export const ${n.denWorkload} = workload(${n.den}, ${n.denPrograms})`,
		"",
		...block(n.seatsPrograms, seatsPrograms),
		"",
		`export const ${n.seatsWorkload} = workload(${n.seats}, ${n.seatsPrograms})`,
		"",
		`/** The commits and declared reads of the flow ${P}, over its app role ${W}. */`,
		...block(n.commitPrograms, commitPrograms),
		"",
		`export const ${n.commitWorkload} = workload(${W}, ${n.commitPrograms})`,
		"",
		...(Arr.isReadonlyArrayNonEmpty(requests)
			? [
					`/** The requests of the flow's roots the app's own write starts, each a ChangeSet over ${W} the app unions with its own. */`,
					`export const ${n.requests} = Object.freeze({ ${commas(requests)} })`
				]
			: [])
	])}\n`
}

/** A value's facts for one owner `key` and value `x`: its row, and a row of each optional field it holds. */
const factsOf = (v: ValueIR, key: string, x: string): ReadonlyArray<string> => [
	`${v.relation}: [{ ${commas([`${v.owner}: ${key}`, ...Arr.map(v.shape.columns, (c) => `${c.name}: ${x}.${c.name}`)])} }]`,
	...Arr.map(
		v.sidecars,
		(s) =>
			`${s.relation}: Option.toArray(Option.map(${x}.${s.column.name}, (value) => ({ ${v.owner}: ${key}, value })))`
	)
]

/** The value of a row `row` of `v` read by key, with each optional field read by its own handle. */
const valueOf = (v: ValueIR, row: string, side: (index: number) => string): string =>
	`({ ${commas([
		...Arr.map(v.shape.columns, (c) => `${c.name}: ${row}.${c.name}`),
		...Arr.map(v.sidecars, (s, i) => `${s.column.name}: Option.map(${side(i)}, (o) => o.value)`)
	])} })`

/** The binding module: the ledger port over the programs' served handles. */
export const printBinding = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const P = l.prefix
	const F = place.flow.name
	const r = (s: string) => `${P}${s}`
	const kindAt = (index: number) => `${F}.kinds[${index}]`
	const edgeAt = (index: number) => `${F}.edges[${index}]`
	const spawning = l.spawning
	const allRelations = Arr.map(l.relations, (rel) => rel.name)
	const has = (relation: string) => Arr.contains(allRelations, relation)
	const exclusiveKeys = has(r("ExclusiveKey"))
	const rowsType = lines([
		"interface Rows {",
		...Arr.map(spawning, (rel) => `\treadonly ${rel}: ReadonlyArray<Written<typeof ${rel}>>`),
		"}"
	])
	const noRows = `const noRows: Rows = { ${commas(Arr.map(spawning, (rel) => `${rel}: []`))} }`
	const joined = lines([
		"const joined = (a: Grown, b: Grown): Grown => ({",
		`\trows: { ${commas(Arr.map(spawning, (rel) => `${rel}: [...a.rows.${rel}, ...b.rows.${rel}]`))} },`,
		"\tspawned: { steps: [...a.spawned.steps, ...b.spawned.steps], finishes: [...a.spawned.finishes, ...b.spawned.finishes] }",
		"})"
	])
	const keyRead = (handle: string, key: string, owner: "step" | "scope") =>
		`Effect.map(h.den.${handle}.once({ params: { ${owner}: ${key} }, facts: {} }), one)`
	const readerOf = (v: ValueIR): string => `read${v.relation}`
	const readerDef = (v: ValueIR): string => {
		const keyType = v.owner === "step" ? "StepKey" : "ScopeKey"
		const body = lines([
			"Effect.gen(function* () {",
			`\tconst row = yield* ${keyRead(n.program(`Read${v.relation}`), v.owner, v.owner)}`,
			...Arr.map(
				v.sidecars,
				(s, i) =>
					`\tconst side${i} = yield* ${keyRead(n.program(`Read${s.relation}`), v.owner, v.owner)}`
			),
			`\treturn Option.map(row, (found) => ${valueOf(v, "found", (i) => `side${i}`)})`,
			"})"
		])
		return `const ${readerOf(v)} = (${v.owner}: ${keyType}) => ${indented("\t")(body)}`
	}
	const joinOf = (name: string) => Arr.findFirst(l.joins, (j) => j.name === name)
	const stepOfKind = (name: string) => Arr.findFirst(l.steps, (s) => s.name === name)

	/**
	 * A child scope opened under `owner` with key `key` and input `input`, admitted in the same call: its Scope, Within,
	 * Admitted and Finish rows, its finish step, its input, its own start's children at every depth (`inner`), and its
	 * finish ready at once when it started nothing. `extra` adds the row that names how it was opened.
	 */
	const openedScope = (
		j: JoinIR,
		key: string,
		input: string,
		owner: string,
		extra: string
	): string =>
		`Effect.flatMap(finishStep(${key}), (finish) => Effect.map(start${j.name}(${key}, ${input}, at), (inner): Grown => joined(inner, { rows: { ...noRows, ${commas(
			[
				`${r("Scope")}: [{ scope: ${key}, kind: ${q(j.name)} }]`,
				`${r("Within")}: [{ scope: ${key}, parent: ${owner} }]`,
				`${r("Admitted")}: [{ scope: ${key} }]`,
				`${r("Finish")}: [{ scope: ${key}, step: finish }]`,
				`${r("Step")}: [{ step: finish, kind: ${q(j.finish.name)}, scope: ${key} }]`,
				`${r("Due")}: [{ step: finish, at }]`,
				extra,
				...factsOf(j.input, key, input)
			]
		)} }, spawned: { steps: [], finishes: hasChildren(inner, ${key}) ? [] : [finish] } })))`

	/** A step spawned under `owner` with key `key` and input `input`: its Step, Due and input, and `extra`. */
	const spawnedStep = (
		s: StepIR,
		key: string,
		input: string,
		owner: string,
		extra: string
	): string =>
		`({ rows: { ...noRows, ${commas([
			`${r("Step")}: [{ step: ${key}, kind: ${q(s.name)}, scope: ${owner} }]`,
			`${r("Due")}: [{ step: ${key}, at: dueAt(${kindAt(s.index)}.due, at) }]`,
			extra,
			...factsOf(s.input, key, input)
		])} }, spawned: { steps: [{ step: ${key}, kind: ${q(s.name)}, due: dueAt(${kindAt(s.index)}.due, at) }], finishes: [] } })`

	const startOf = (j: JoinIR): string => {
		const cases = Arr.map(j.children, (child) =>
			child.kind === "step"
				? Option.match(stepOfKind(child.name), {
						onNone: () => "",
						onSome: (s) =>
							`return Effect.map(startedStep(scope, ordinal), (key): Grown => ${spawnedStep(s, "key", "spawn.input", "scope", `${r("StartStep")}: [{ scope, ordinal: BigInt(ordinal), step: key }]`)})`
					})
				: Option.match(joinOf(child.name), {
						onNone: () => "",
						onSome: (inner) =>
							`return Effect.flatMap(startedScope(scope, ordinal), (key) => ${openedScope(inner, "key", "spawn.input", "scope", `${r("StartScope")}: [{ scope, ordinal: BigInt(ordinal), child: key }]`)})`
					})
		)
		const labelled = Arr.zip(
			Arr.map(j.children, (child) => child.name),
			cases
		)
		const single = labelled.length === 1
		const body = single
			? Arr.map(labelled, ([, c]) => `\t\t${Str.slice("return ".length)(c)}`)
			: [
					"\t\tswitch (spawn.kind) {",
					...Arr.map(labelled, ([name, c]) => `\t\t\tcase ${q(name)}: ${c}`),
					"\t\t}"
				]
		const usesAt = Arr.isReadonlyArrayNonEmpty(j.children)
		return lines([
			`const start${j.name} = (scope: ScopeKey, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0], ${usesAt ? "at" : "_at"}: Instant): Effect.Effect<Grown, never, Digest.Digest> =>`,
			`\tEffect.map(Effect.forEach(${kindAt(j.index)}.start(input), (spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> => ${single ? "" : "{"}`,
			...body,
			`\t${single ? "" : "}"}), (parts) => Arr.reduce(parts, nothingGrown, joined))`
		])
	}

	const edgeGrowth = (e: EdgeIR, from: string): string => {
		const each =
			e.toKind === "step"
				? Option.match(stepOfKind(e.to), {
						onNone: () => "Effect.succeed(nothingGrown)",
						onSome: (s) =>
							`Effect.map(edgeStep(${from}.turn.step, ${q(e.name)}, ordinal), (key): Grown => ${spawnedStep(s, "key", "input", `${from}.turn.scope`, `${e.relation}: [{ from: ${from}.turn.step, ordinal: BigInt(ordinal), to: key }]`)})`
					})
				: Option.match(joinOf(e.to), {
						onNone: () => "Effect.succeed(nothingGrown)",
						onSome: (j) =>
							`Effect.flatMap(edgeScope(${from}.turn.step, ${q(e.name)}, ordinal), (key) => ${openedScope(j, "key", "input", `${from}.turn.scope`, `${e.relation}: [{ from: ${from}.turn.step, ordinal: BigInt(ordinal), to: key }]`)})`
					})
		return `Effect.map(Effect.forEach(${edgeAt(e.index)}.next(${from}.input, ${from}.output), (input, ordinal): Effect.Effect<Grown, never, Digest.Digest> => ${each}), (parts) => Arr.reduce(parts, nothingGrown, joined))`
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

	const recordFacts = (s: StepIR, rows: string, step: string): ReadonlyArray<string> =>
		Option.match(s.reads, {
			onNone: () => [],
			onSome: (rd) => [
				`${rd.record}: Arr.map(${rows}, (row, ordinal) => ({ ...row, step: ${step}, ordinal: BigInt(ordinal) }))`
			]
		})

	const failPort = (
		name: string,
		error: Option.Option<ValueIR>,
		records: (rows: string, step: string) => ReadonlyArray<string>
	): string =>
		Option.match(error, {
			onNone: () => "fail: (failed) => Effect.die(failed.error)",
			onSome: (e) =>
				`fail: (failed) => h.den.${n.program(`Fail${name}`)}.once({ params: {}, facts: { insert: { ${commas(
					[
						`${r("Result")}: [{ step: failed.turn.step, outcome: "failed" }]`,
						`${r("Failed")}: [{ step: failed.turn.step }]`,
						`${r("Held")}: [{ step: failed.turn.step, attempt: failed.turn.attempt }]`,
						...factsOf(e, "failed.turn.step", "failed.error"),
						...records("failed.rows", "failed.turn.step")
					]
				)} } } })`
		})

	const stepRunner = (s: StepIR): string => {
		const grow = Arr.isReadonlyArrayNonEmpty(s.edges)
			? `Effect.map(Effect.all([${commas(Arr.map(s.edges, (e) => edgeGrowth(e, "done")))}]), (parts) => Arr.reduce(parts, nothingGrown, joined))`
			: "Effect.succeed(nothingGrown)"
		const spawnRows = Arr.isReadonlyArrayNonEmpty(s.edges) ? ["...grown.rows"] : []
		const read = Option.match(s.reads, {
			onNone: () => "read: () => Effect.succeed([])",
			onSome: () =>
				`read: (input) => Effect.map(h.commits.${n.program(`Read${s.name}`)}.once({ params: ${kindAt(s.index)}.reads.params(input), facts: {} }), rowsOf)`
		})
		return lines([
			`runnerOf(${kindAt(s.index)}, {`,
			`\tinput: (step) => ${readerOf(s.input)}(step),`,
			`\t${read},`,
			`\tcommit: (done, ${Arr.some(s.edges, (e) => e.toKind === "step") ? "at" : "_at"}) => Effect.gen(function* () {`,
			`\t\tconst grown = yield* ${grow}`,
			`\t\tconst outcome = yield* h.commits.${n.program(`Commit${s.name}`)}.once({ params: {}, facts: { ${opsOf(
				[
					...spawnRows,
					`${r("Result")}: [{ step: done.turn.step, outcome: "done" }]`,
					`${r("Done")}: [{ step: done.turn.step }]`,
					`${r("Held")}: [{ step: done.turn.step, attempt: done.turn.attempt }]`,
					...factsOf(s.output, "done.turn.step", "done.output"),
					...recordFacts(s, "done.rows", "done.turn.step")
				],
				s.writes,
				"done"
			)} } })`,
			"\t\treturn { outcome, spawned: grown.spawned }",
			"\t}),",
			`\t${failPort(s.name, s.error, (rows, step) => recordFacts(s, rows, step))}`,
			"}, Option.none())"
		])
	}

	const finishRunner = (j: JoinIR): string => {
		const reads = Arr.map(j.finish.reads, (read) => {
			if (read.kind === "scope") {
				return lines([
					`\t\tconst endings${read.name} = yield* Effect.map(h.den.${n.program(`Endings${j.name}${read.name}`)}.once({ params: { scope }, facts: {} }), rowsOf)`,
					`\t\tconst ${read.name} = Arr.map(endings${read.name}, (row) => (row.outcome === "done" ? { _tag: "Done" as const } : { _tag: "Failed" as const }))`
				])
			}
			const cols = Arr.map(read.output.shape.columns, (c) => `${c.name}: row.${c.name}`)
			const sides = Arr.map(
				read.output.sidecars,
				(s, i) =>
					`${s.column.name}: Option.map(Arr.findFirst(side${read.name}${i}, (o) => o.step === row.step), (o) => o.value)`
			)
			return lines([
				`\t\tconst rows${read.name} = yield* Effect.map(h.den.${n.program(`Outputs${j.name}${read.name}`)}.once({ params: { scope }, facts: {} }), rowsOf)`,
				...Arr.map(
					read.output.sidecars,
					(s, i) =>
						`\t\tconst side${read.name}${i} = yield* Effect.map(h.den.${n.program(`Outputs${j.name}${read.name}${Str.capitalize(s.column.name)}`)}.once({ params: { scope }, facts: {} }), rowsOf)`
				),
				`\t\tconst failures${read.name} = yield* Effect.map(h.den.${n.program(`Failures${j.name}${read.name}`)}.once({ params: { scope }, facts: {} }), rowsOf)`,
				`\t\tconst ${read.name} = [...Arr.map(rows${read.name}, (row) => ({ _tag: "Done" as const, output: { ${commas([...cols, ...sides])} } })), ...Arr.map(failures${read.name}, () => ({ _tag: "Failed" as const }))]`
			])
		})
		const kind = kindAt(j.index)
		return lines([
			"runnerOf(",
			"\t{",
			`\t\tname: ${q(j.finish.name)},`,
			"\t\tuses: [],",
			`\t\tretry: ${kind}.finish.retry,`,
			`\t\tbody: (read: { readonly input: Parameters<(typeof ${kind})["start"]>[0]; readonly endings: Parameters<(typeof ${kind})["finish"]["body"]>[1] }) => Effect.map(${kind}.finish.body(read.input, read.endings), (writes) => ({ output: {}, writes }))`,
			"\t},",
			"\t{",
			"\t\tinput: (step) => Effect.gen(function* () {",
			`\t\tconst located = yield* Effect.map(h.den.${n.program("StepOf")}.once({ params: { step }, facts: {} }), one)`,
			"\t\tif (Option.isNone(located)) {",
			"\t\t\treturn Option.none()",
			"\t\t}",
			"\t\tconst scope = located.value.scope",
			`\t\tconst input = yield* ${readerOf(j.input)}(scope)`,
			"\t\tif (Option.isNone(input)) {",
			"\t\t\treturn Option.none()",
			"\t\t}",
			...reads,
			`\t\treturn Option.some({ input: input.value, endings: { ${commas(Arr.map(j.finish.reads, (read) => read.name))} } })`,
			"\t}),",
			"\t\tread: () => Effect.succeed([]),",
			`\t\tcommit: (done) => Effect.map(h.commits.${n.program(`Commit${j.finish.name}`)}.once({ params: {}, facts: { ${opsOf(
				[
					`${r("Result")}: [{ step: done.turn.step, outcome: "done" }]`,
					`${r("Done")}: [{ step: done.turn.step }]`,
					`${r("Held")}: [{ step: done.turn.step, attempt: done.turn.attempt }]`
				],
				j.finish.writes,
				"done"
			)} } }), (outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })),`,
			`\t\t${failPort(j.finish.name, j.finish.error, () => [])}`,
			"\t},",
			`\tOption.some(${q(j.name)})`,
			")"
		])
	}

	const admitOf = (j: JoinIR): string =>
		lines([
			"(scope: ScopeKey, at: Instant) => Effect.gen(function* () {",
			`\tconst input = yield* ${readerOf(j.input)}(scope)`,
			"\tif (Option.isNone(input)) {",
			"\t\treturn Option.none()",
			"\t}",
			`\tconst grown = yield* start${j.name}(scope, input.value, at)`,
			"\tconst finish = yield* finishStep(scope)",
			`\tconst steps: ReadonlyArray<Written<typeof ${r("Step")}>> = [...grown.rows.${r("Step")}, { step: finish, kind: ${q(j.finish.name)}, scope }]`,
			`\tconst dues: ReadonlyArray<Written<typeof ${r("Due")}>> = [...grown.rows.${r("Due")}, { step: finish, at }]`,
			`\tconst admitted: ReadonlyArray<Written<typeof ${r("Admitted")}>> = [...grown.rows.${r("Admitted")}, { scope }]`,
			`\tconst finishes: ReadonlyArray<Written<typeof ${r("Finish")}>> = [...grown.rows.${r("Finish")}, { scope, step: finish }]`,
			`\tconst outcome = yield* h.den.${n.program("Admit")}.once({ params: {}, facts: { insert: { ${commas(
				[
					...Arr.map(
						Arr.filter(
							spawning,
							(rel) =>
								!Arr.some(l.edges, (e) => e.relation === rel) &&
								!Arr.contains([r("Step"), r("Due"), r("Admitted"), r("Finish")], rel)
						),
						(rel) => `${rel}: grown.rows.${rel}`
					),
					`${r("Step")}: steps`,
					`${r("Due")}: dues`,
					`${r("Admitted")}: admitted`,
					`${r("Finish")}: finishes`
				]
			)} } } })`,
			"\treturn Option.some({ outcome, spawned: { steps: grown.spawned.steps, finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])] } })",
			"})"
		])

	const roots = Arr.filter(l.joins, (j) => Option.isSome(j.root))
	const requestFacts = (j: JoinIR): ReadonlyArray<string> => [
		`${r("Scope")}: [{ scope, kind: ${q(j.name)} as const }]`,
		`${r("Root")}: [{ scope, key, at }]`,
		...(isExclusive(j) ? [`${r("ExclusiveKey")}: keys`] : []),
		...factsOf(j.input, "scope", "input")
	]
	const requestOf = (j: JoinIR): string => {
		const keys = (body: string) =>
			isExclusive(j)
				? `Effect.flatMap(exclusiveRows(${q(P)}, ${q(j.name)}, ${kindAt(j.index)}.exclusive, input, scope), (keys) => ${body})`
				: body
		const signature = `(key: string, at: Instant, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0])`
		const facts = `({ scope, facts: { ${commas(requestFacts(j))} } })`
		return isApp(j)
			? isExclusive(j)
				? `${j.name}: ${signature} => Effect.flatMap(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => Effect.map(exclusiveRows(${q(P)}, ${q(j.name)}, ${kindAt(j.index)}.exclusive, input, scope), (keys) => ${facts}))`
				: `${j.name}: ${signature} => Effect.map(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => ${facts})`
			: `${j.name}: ${signature} => Effect.flatMap(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => ${keys(`Effect.map(fresh(${q(P)}, h.den.${n.program(`Request${j.name}`)}.once({ params: {}, facts: { insert: { ${commas(requestFacts(j))} } } })), (accepted) => ({ scope, fresh: accepted }))`)})`
	}
	const denRoots = Arr.filter(roots, (j) => !isApp(j))
	const appRoots = Arr.filter(roots, isApp)

	const scoped = (name: string) => `(typeof ${name})["handles"][number]`
	const handleOf = (roster: string) =>
		`(name: string): Option.Option<${scoped(roster)}> => Arr.findFirst(${roster}.handles, (handle) => handle === name)`
	const resources = has(r("Seat"))
	const exclusives = has(r("Exclusive"))
	const coordination = lines([
		"{",
		resources
			? `\tseats: Effect.map(h.seats.${n.program("Seats")}.once({ params: {}, facts: {} }), (rows) => Arr.map(rowsOf(rows), (row) => ({ resource: row.resource, seat: row.seat }))),`
			: "\tseats: Effect.succeed([]),",
		resources
			? `\tholds: Effect.map(h.seats.${n.program("Holds")}.once({ params: {}, facts: {} }), (rows) => Arr.map(rowsOf(rows), (row) => ({ resource: row.resource, seat: row.seat, holder: row.holder, until: row.until }))),`
			: "\tholds: Effect.succeed([]),",
		exclusives
			? `\texclusives: Effect.map(h.seats.${n.program("Exclusives")}.once({ params: {}, facts: {} }), (rows) => Arr.map(rowsOf(rows), (row) => ({ kind: row.kind, key: row.key, scope: row.scope }))),`
			: "\texclusives: Effect.succeed([]),",
		`\tpaused: Effect.map(h.seats.${n.program("PausedAll")}.once({ params: {}, facts: {} }), (rows) => Arr.map(rowsOf(rows), (row) => row.target)),`,
		resources
			? `\tprovision: (add, remove) => Effect.asVoid(h.seats.${n.program("Provision")}.once({ params: {}, facts: { insert: { ${r("Seat")}: Arr.flatMap(add, (s) => Option.toArray(Option.map(resourceOf(s.resource), (resource) => ({ resource, seat: s.seat })))) }, delete: { ${r("Seat")}: Arr.flatMap(remove, (s) => Option.toArray(Option.map(resourceOf(s.resource), (resource) => ({ resource, seat: s.seat })))) } } })),`
			: "\tprovision: () => Effect.void,",
		resources
			? `\ttake: (lapsed, taken) => Effect.asVoid(h.seats.${n.program("Take")}.once({ params: {}, facts: { delete: { ${r("Hold")}: holdsOf(lapsed) }, insert: { ${r("Hold")}: holdsOf(taken) } } })),`
			: "\ttake: () => Effect.void,",
		resources
			? `\tgiveBack: (holds) => Effect.asVoid(h.seats.${n.program("GiveBack")}.once({ params: {}, facts: { delete: { ${r("Hold")}: holdsOf(holds) } } })),`
			: "\tgiveBack: () => Effect.void,",
		exclusives
			? `\tholdExclusive: (row) => Effect.asVoid(h.seats.${n.program("HoldExclusive")}.once({ params: {}, facts: { insert: { ${r("Exclusive")}: exclusivesOf([row]) } } })),`
			: "\tholdExclusive: () => Effect.void,",
		exclusives
			? `\treleaseExclusive: (rows) => Effect.asVoid(h.seats.${n.program("ReleaseExclusive")}.once({ params: {}, facts: { delete: { ${r("Exclusive")}: exclusivesOf(rows) } } })),`
			: "\treleaseExclusive: () => Effect.void,",
		`\tpause: (target) => Effect.asVoid(h.seats.${n.program("Pause")}.once({ params: {}, facts: { insert: { ${r("Paused")}: Arr.map(Option.toArray(pausableOf(target)), (id) => ({ target: id })) } } })),`,
		`\tresume: (target) => Effect.asVoid(h.seats.${n.program("Resume")}.once({ params: {}, facts: { delete: { ${r("Paused")}: Arr.map(Option.toArray(pausableOf(target)), (id) => ({ target: id })) } } }))`,
		"}"
	])
	const all = (handle: string) =>
		`Effect.map(h.den.${handle}.once({ params: {}, facts: {} }), rowsOf)`
	const snapshot = lines([
		"Effect.gen(function* () {",
		`\tconst steps = yield* ${all(n.program("Pending"))}`,
		`\tconst claims = yield* ${all(n.program("PendingClaims"))}`,
		`\tconst retries = yield* ${all(n.program("PendingRetries"))}`,
		`\tconst dues = yield* ${all(n.program("PendingDues"))}`,
		`\tconst requested = yield* ${all(n.program("Requested"))}`,
		`\tconst running = yield* ${all(n.program("Running"))}`,
		`\tconst withins = yield* ${all(n.program("Withins"))}`,
		`\tconst roots = yield* ${all(n.program("Roots"))}`,
		exclusiveKeys
			? `\tconst keys = yield* ${all(n.program("ExclusiveKeys"))}`
			: "\tconst keys: ReadonlyArray<{ readonly scope: ScopeKey; readonly id: ExclusiveId }> = []",
		"\tconst seats = yield* coordination.seats",
		"\tconst holds = yield* coordination.holds",
		"\tconst exclusives = yield* coordination.exclusives",
		"\tconst paused = yield* coordination.paused",
		`\tconst busy = yield* Effect.filter([${commas(Arr.map(l.idle, q))}], (flow) => busyOf(flow))`,
		"\tconst view = (scope: ScopeKey, kind: string, admitted: boolean): ScopeView => ({",
		"\t\tscope,",
		"\t\tkind,",
		"\t\tparent: Option.map(Arr.findFirst(withins, (w) => w.scope === scope), (w) => w.parent),",
		"\t\tadmitted,",
		"\t\tskipped: false,",
		"\t\tkey: Option.map(Arr.findFirst(keys, (k) => k.scope === scope), (k) => k.id),",
		"\t\troot: Option.map(Arr.findFirst(roots, (o) => o.scope === scope), (o) => ({ key: o.key, at: o.at }))",
		"\t})",
		"\treturn {",
		"\t\tsteps,",
		"\t\tclaims,",
		"\t\tretries,",
		"\t\tdues,",
		"\t\tscopes: [...Arr.map(requested, (s) => view(s.scope, s.kind, false)), ...Arr.map(running, (s) => view(s.scope, s.kind, true))],",
		"\t\tseats,",
		"\t\tholds,",
		"\t\texclusives,",
		"\t\tpaused,",
		"\t\tbusy",
		"\t} satisfies Snapshot",
		"})"
	])
	const watched = [
		`signals(h.den.${n.program("Pending")}.watch({ params: {}, facts: {} }))`,
		`signals(h.den.${n.program("Requested")}.watch({ params: {}, facts: {} }))`,
		`signals(h.den.${n.program("Running")}.watch({ params: {}, facts: {} }))`,
		...(resources
			? [`signals(h.seats.${n.program("Holds")}.watch({ params: {}, facts: {} }))`]
			: []),
		...(exclusives
			? [`signals(h.seats.${n.program("Exclusives")}.watch({ params: {}, facts: {} }))`]
			: []),
		`signals(h.seats.${n.program("PausedAll")}.watch({ params: {}, facts: {} }))`,
		...Arr.map(
			l.idle,
			(f) => `signals(h.den.${n.program(`Busy${f}`)}.watch({ params: {}, facts: {} }))`
		)
	]
	const busyOf = lines([
		"(flow: string): Effect.Effect<boolean, CallError> => {",
		"\tswitch (flow) {",
		...Arr.map(
			l.idle,
			(f) =>
				`\t\tcase ${q(f)}: return any(h.den.${n.program(`Busy${f}`)}.once({ params: {}, facts: {} }))`
		),
		"\t\tdefault: return Effect.succeed(false)",
		"\t}",
		"}"
	])
	const fragmentValues = [
		...(exclusives ? [r("Join")] : []),
		r("Pausable"),
		...(resources ? [r("Resource")] : [])
	]
	const fragmentImports = Arr.dedupe([...spawning, ...fragmentValues])
	const fragmentTypes = Arr.filter(fragmentImports, (name) => !Arr.contains(fragmentValues, name))
	const valueReaders = [...Arr.map(l.steps, (s) => s.input), ...Arr.map(l.joins, (j) => j.input)]
	const identity = Arr.dedupe([
		...(Arr.some(l.edges, (e) => e.toKind === "scope") ? ["edgeScope"] : []),
		...(Arr.some(l.edges, (e) => e.toKind === "step") ? ["edgeStep"] : []),
		"finishStep",
		...(exclusiveKeys ? [] : ["type ExclusiveId"]),
		"type Instant",
		"rootScope",
		"type ScopeKey",
		...(Arr.some(l.joins, (j) => Arr.some(j.children, (c) => c.kind === "scope"))
			? ["startedScope"]
			: []),
		...(Arr.some(l.joins, (j) => Arr.some(j.children, (c) => c.kind === "step"))
			? ["startedStep"]
			: []),
		"type StepKey"
	])
	return `${lines([
		`/** The ledger port of the flow ${P} over its served programs; \`den generate\` writes it, and nothing edits it. */`,
		`import type { Written } from "@bjornpagen/grizzle"`,
		`import type { CallError, MemberHandle } from "@bjornpagen/grizzle/runtime"`,
		`import { ${commas(["any", "dueAt", ...(exclusiveKeys ? ["exclusiveRows"] : []), ...(Arr.isReadonlyArrayNonEmpty(denRoots) ? ["fresh"] : []), "one", "rowsOf", "scheduleOf", "signals"])} } from "@bjornpagen/den/runtime/bind"`,
		`import { ${commas(identity)} } from "@bjornpagen/den/runtime/identity"`,
		`import type { ${commas(["FlowNeeds", ...(exclusives ? ["ExclusiveRow"] : []), ...(resources ? ["HoldRow"] : []), "Ledger", "ScopeView", "Snapshot", "Spawned"])} } from "@bjornpagen/den/runtime/ledger"`,
		`import { runnerOf } from "@bjornpagen/den/runtime/turn"`,
		`import { FlowName } from "@bjornpagen/den/transport"`,
		`import { Array as Arr, Effect, Option, Stream } from "effect"`,
		`import type { Digest } from "effect/crypto"`,
		`import { ${F} } from ${q(place.flow.from)}`,
		`import { ${commas(fragmentValues)} } from ${q(place.fragment)}`,
		`import type { ${commas(fragmentTypes)} } from ${q(place.fragment)}`,
		`import type { ${commas([n.denPrograms, n.seatsPrograms, n.commitPrograms])} } from ${q(place.programs)}`,
		"",
		`/** The handles the ledger calls: den's role's, its coordination role's, and the app role's commits, from whichever logins serve them. */`,
		`export interface ${n.handles} {`,
		`\treadonly den: { readonly [K in keyof typeof ${n.denPrograms}]: MemberHandle<(typeof ${n.denPrograms})[K]> }`,
		`\treadonly seats: { readonly [K in keyof typeof ${n.seatsPrograms}]: MemberHandle<(typeof ${n.seatsPrograms})[K]> }`,
		`\treadonly commits: { readonly [K in keyof typeof ${n.commitPrograms}]: MemberHandle<(typeof ${n.commitPrograms})[K]> }`,
		"}",
		"",
		rowsType,
		"",
		"interface Grown {",
		"\treadonly rows: Rows",
		"\treadonly spawned: Spawned",
		"}",
		"",
		...(exclusives ? [`const joinOf = ${handleOf(r("Join"))}`] : []),
		`const pausableOf = ${handleOf(r("Pausable"))}`,
		...(resources ? [`const resourceOf = ${handleOf(r("Resource"))}`] : []),
		...(resources
			? [
					`const holdsOf = (holds: ReadonlyArray<HoldRow>) => Arr.flatMap(holds, (hold) => Option.toArray(Option.map(resourceOf(hold.resource), (resource) => ({ resource, seat: hold.seat, holder: hold.holder, until: hold.until }))))`
				]
			: []),
		...(exclusives
			? [
					`const exclusivesOf = (rows: ReadonlyArray<ExclusiveRow>) => Arr.flatMap(rows, (row) => Option.toArray(Option.map(joinOf(row.kind), (kind) => ({ kind, key: row.key, scope: row.scope }))))`
				]
			: []),
		"",
		`/** The ledger of the flow ${P} over its handles, with the requests of its roots. */`,
		`export const ${n.ledger} = (h: ${n.handles}) => {`,
		`\t${noRows}`,
		"\tconst nothingGrown: Grown = { rows: noRows, spawned: { steps: [], finishes: [] } }",
		`\tconst hasChildren = (grown: Grown, scope: ScopeKey): boolean => Arr.some(grown.rows.${r("StartStep")}, (s) => s.scope === scope) || Arr.some(grown.rows.${r("StartScope")}, (s) => s.scope === scope)`,
		`\t${indented("\t")(joined)}`,
		...Arr.map(l.joins, (j) => `\t${indented("\t")(startOf(j))}`),
		...Arr.map(valueReaders, (v) => `\t${indented("\t")(readerDef(v))}`),
		`\tconst coordination: Ledger<never>["coordination"] = ${indented("\t")(coordination)}`,
		`\tconst busyOf = ${indented("\t")(busyOf)}`,
		`\tconst request = { ${commas(Arr.map(denRoots, requestOf))} }`,
		`\tconst ledger: Ledger<FlowNeeds<typeof ${F}>> = {`,
		`\t\tflow: FlowName.make(${q(P)}),`,
		`\t\tresources: [${commas(Arr.map(l.resources, (res) => `{ name: ${q(res.name)}, seats: ${res.seats} }`))}],`,
		"\t\tsteps: new Map([",
		...Arr.map(l.steps, (s) => `\t\t\t[${q(s.name)}, ${indented("\t\t\t")(stepRunner(s))}],`),
		...Arr.map(
			l.joins,
			(j) => `\t\t\t[${q(j.finish.name)}, ${indented("\t\t\t")(finishRunner(j))}],`
		),
		"\t\t]),",
		"\t\troots: new Map([",
		...Arr.map(
			roots,
			(j) =>
				`\t\t\t[${q(j.name)}, { kind: ${q(j.name)}, exclusive: ${isExclusive(j)}, window: ${kindAt(j.index)}.window, precondition: ${kindAt(j.index)}.precondition, finish: ${q(j.finish.name)}, admit: ${indented("\t\t\t")(admitOf(j))} }],`
		),
		"\t\t]),",
		`\t\tstepOf: (step) => Effect.map(h.den.${n.program("StepOf")}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope }))),`,
		`\t\tresultOf: (step) => Effect.map(h.den.${n.program("ResultOf")}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.outcome)),`,
		`\t\theldOf: (step) => Effect.map(h.den.${n.program("HeldOf")}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.attempt)),`,
		`\t\tdueOf: (step) => Effect.map(h.den.${n.program("DueOf")}.once({ params: { step }, facts: {} }), (rows) => Option.map(one(rows), (row) => row.at)),`,
		`\t\tclaimsOf: (step) => Effect.map(h.den.${n.program("ClaimsOf")}.once({ params: { step }, facts: {} }), rowsOf),`,
		`\t\tretriesOf: (step) => Effect.map(h.den.${n.program("RetriesOf")}.once({ params: { step }, facts: {} }), rowsOf),`,
		"\t\tscopeOf: (scope) => Effect.gen(function* () {",
		`\t\t\tconst row = yield* ${keyRead(n.program("ScopeOf"), "scope", "scope")}`,
		"\t\t\tif (Option.isNone(row)) {",
		"\t\t\t\treturn Option.none()",
		"\t\t\t}",
		`\t\t\tconst parent = yield* ${keyRead(n.program("WithinOf"), "scope", "scope")}`,
		`\t\t\tconst admitted = yield* ${keyRead(n.program("AdmittedOf"), "scope", "scope")}`,
		`\t\t\tconst skipped = yield* ${keyRead(n.program("SkippedOf"), "scope", "scope")}`,
		exclusiveKeys
			? `\t\t\tconst key = yield* ${keyRead(n.program("ExclusiveKeyOf"), "scope", "scope")}`
			: "\t\t\tconst key = Option.none<{ readonly id: ExclusiveId }>()",
		`\t\t\tconst root = yield* ${keyRead(n.program("RootOf"), "scope", "scope")}`,
		"\t\t\treturn Option.some({ scope, kind: row.value.kind, parent: Option.map(parent, (w) => w.parent), admitted: Option.isSome(admitted), skipped: Option.isSome(skipped), key: Option.map(key, (k) => k.id), root: Option.map(root, (o) => ({ key: o.key, at: o.at })) })",
		"\t\t}),",
		`\t\tunended: (scope) => Effect.flatMap(any(h.den.${n.program("UnendedSteps")}.once({ params: { scope }, facts: {} })), (steps) => steps ? Effect.succeed(true) : any(h.den.${n.program("OpenChildren")}.once({ params: { scope }, facts: {} }))),`,
		`\t\tfinished: (scope) => any(h.den.${n.program("Finished")}.once({ params: { scope }, facts: {} })),`,
		"\t\tbusy: busyOf,",
		`\t\tclaim: (row) => Effect.map(h.den.${n.program("Claim")}.once({ params: {}, facts: { insert: { ${r("Claim")}: [row] } } }), (outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)),`,
		`\t\tretry: (row) => h.den.${n.program("Retry")}.once({ params: {}, facts: { insert: { ${r("Retry")}: [row] } } }),`,
		`\t\trefuse: (step, attempt, law) => h.den.${n.program("Refuse")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, outcome: "failed" }], ${r("Failed")}: [{ step }], ${r("Held")}: [{ step, attempt }], ${r("Refusal")}: [{ step, law }] } } }),`,
		`\t\tskip: (scope, by) => h.den.${n.program("Skip")}.once({ params: {}, facts: { insert: { ${r("Skipped")}: [{ scope, by }] } } }),`,
		`\t\texhaust: (step, attempt) => h.den.${n.program("Exhaust")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, outcome: "failed" }], ${r("Failed")}: [{ step }], ${r("Held")}: [{ step, attempt }], ${r("Exhausted")}: [{ step, attempts: attempt }] } } }),`,
		`\t\tsnapshot: ${indented("\t\t")(snapshot)},`,
		`\t\tchanges: Stream.mergeAll([${commas(watched)}], { concurrency: "unbounded" }),`,
		"\t\tcoordination,",
		`\t\tscheduled: [${commas(
			Arr.map(
				denRoots,
				(j) =>
					`...Option.toArray(Option.map(scheduleOf(${kindAt(j.index)}.trigger), (s) => ({ kind: ${q(j.name)}, cron: s.cron, request: (at: Instant) => request.${j.name}(String(at), at, s.input(at)) })))`
			)
		)}]`,
		"\t}",
		"\treturn {",
		"\t\tledger,",
		"\t\trequest,",
		`\t\trequestFacts: { ${commas(Arr.map(appRoots, requestOf))} }`,
		"\t}",
		"}"
	])}\n`
}
