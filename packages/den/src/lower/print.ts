import { regex } from "arkregex"
import { Array as Arr, Option, Order, Record as Rec, String as Str } from "effect"
import { denClock } from "#algebra/kinds.ts"
import {
	type AwaitIR,
	type CommitIR,
	type CountsIR,
	type EdgeIR,
	type FieldType,
	type JoinIR,
	type KeyIR,
	type LawIR,
	type Lowered,
	type ReadIR,
	type RelationIR,
	type SeatsIR,
	type SideIR,
	type SpawnedScopeIR,
	type SpawnedStepIR,
	type StepIR,
	type ValueIR,
	recordsRequestOf,
	valueRelations
} from "#lower/fragment.ts"
import { type Base, type ColumnType, denContracts } from "#lower/schema.ts"
import { framedText } from "#runtime/identity.ts"

/**
 * The printer: a lowered flow as three TypeScript modules the app commits beside its schema, which `den generate`
 * writes and which compile with the app's own code.
 *
 * - the fragment: rosters, contracts and relations, and two grizzle fragments the app lists in its `schema(...)`, the
 *   flow's graph and its coordination group, each with its laws, beside the den relations the flow's app role inserts
 *   into to commit its steps;
 * - the programs: den's role's and its coordinator role's programs over those fragments, the roles over the app's
 *   schema that hold them whole and serve them, the commits and declared reads over the flow's app role, and the
 *   requests the app's writes compose, over the graph or the app's schema;
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
	/**
	 * The module exporting each step's declared reads as `<Step>Reads`, over a level below den's fragment alone, which the
	 * fragment imports to build each read's records: never the flow, whose type names its app role, a role over the
	 * schema the fragment is spread into. `exports` is that module's namespace, which `den generate` holds each step's
	 * reads to.
	 */
	readonly reads: { readonly from: string; readonly exports: { readonly [name: string]: unknown } }
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
/** The key a brand's contract is its fragment module's under, the symbol only that module holds. */
const brandKey = (brand: string): string => `${lower1(brand)}Key`
/** The mint of a brand's host type, its fragment module's, under its key (`brandKey`). */
const brandMint = (brand: string): string => `${lower1(brand)}Mint`

/** The mint of each of den's own contracts' host types (lower/keys.ts). */
const denMints = {
	DenInstant: "mintInstant",
	DenEnvironment: "mintEnvironment"
} as const satisfies Record<keyof typeof denContracts, string>

/** The TypeScript type of a base's host value. */
const baseHostType = {
	text: "string",
	bigint: "bigint",
	double: "number",
	boolean: "boolean"
} as const satisfies Record<Base, string>

/**
 * A column's value as grizzle's host type holds it, from `value`, the body's: a contract's, den's own or a brand's, is
 * its key's mint of it (its host type is its base's under its consumer's key, which grizzle's types read), and any other
 * column's is its value as it is.
 */
const hostValue = (type: ColumnType, value: string): string => {
	switch (type.kind) {
		case "brand":
			return `${brandMint(type.brand)}(${value})`
		case "den":
			return `${denMints[type.contract]}(${value})`
		case "base":
		case "roster":
		case "vector":
			return value
	}
}

/**
 * A column's value as the body's Effect Schema types it, from `value`, grizzle's host type: a contract's is the brand of
 * its name on its base (`Brand.nominal`, the brand Effect's `Schema.brand` types), and any other column's is its value
 * as it is.
 */
const bodyValue = (type: ColumnType, value: string): string => {
	switch (type.kind) {
		case "brand":
			return `Brand.nominal<${baseHostType[type.base]} & Brand.Brand<${q(type.brand)}>>()(${value})`
		case "den":
			return `Brand.nominal<${baseHostType[denContracts[type.contract]]} & Brand.Brand<${q(type.contract)}>>()(${value})`
		case "base":
		case "roster":
		case "vector":
			return value
	}
}

/**
 * The names a printed rule cannot bind a variable to: the words ECMAScript reserves in a module, whose code is strict
 * (its keywords, `enum`, the words strict code reserves, `await`, and the literals `null`, `true` and `false`), `eval`
 * and `arguments`, which strict code may not bind, and the names printed rules bind themselves, their builder `r`, the
 * variables' maker `v` and `requested`, the relation parameter a request's rule binds beside its relation's fields
 * (`requestOfRoot`): a field so named would redeclare one of them, or reach it before its declaration.
 */
const unbindable: ReadonlyArray<string> = [
	"await",
	"break",
	"case",
	"catch",
	"class",
	"const",
	"continue",
	"debugger",
	"default",
	"delete",
	"do",
	"else",
	"enum",
	"export",
	"extends",
	"false",
	"finally",
	"for",
	"function",
	"if",
	"import",
	"in",
	"instanceof",
	"new",
	"null",
	"return",
	"super",
	"switch",
	"this",
	"throw",
	"true",
	"try",
	"typeof",
	"var",
	"void",
	"while",
	"with",
	"yield",
	"implements",
	"interface",
	"let",
	"package",
	"private",
	"protected",
	"public",
	"static",
	"arguments",
	"eval",
	"r",
	"v",
	"requested"
]

/**
 * The variable a printed rule binds a relation's field to, the one spelling of a field as a variable: the field's own
 * name, or, for a name no rule can bind (`unbindable`), the name after an underscore, which no declared name starts
 * with (grizzle's declared-name rule), so it is no author's field and no name den prints of its own.
 */
const bound = (field: string): string => (Arr.contains(unbindable, field) ? `_${field}` : field)

/** A field as an entry of a printed destructuring or object literal: its name, or `name: variable` where they differ. */
const entry = (field: string): string => {
	const variable = bound(field)
	return variable === field ? field : `${field}: ${variable}`
}

/** Fields as the entries of a printed destructuring or object literal, each its `entry`. */
const entries = (fields: ReadonlyArray<string>): string => commas(Arr.map(fields, entry))

const fieldExpr = (type: FieldType): string => {
	switch (type.kind) {
		case "key":
			return type.contract
		case "digest":
			return "sha256"
		case "natural":
			return "natural"
		case "place":
			return "place"
		case "drawn":
			return "drawn(natural)"
		case "closed":
			return `closedId(${type.roster})`
		case "brand":
			return type.brand
		case "app":
			return `${type.relation}.fields.${type.field}`
		case "vector":
			return `pg.vector(${type.dimensions})`
		case "base":
			switch (type.base) {
				case "text":
					return "Text"
				case "bigint":
					return "pg.bigint"
				case "double":
					return `pg["double precision"]`
				case "boolean":
					return "pg.boolean"
			}
	}
}

const baseExpr = (base: Base): string => fieldExpr({ kind: "base", base })

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
			switch (law.holds.kind) {
				case "atLeast":
					return `check(${q(law.name)}, ${law.relation}, (row) => row.ge(row.${law.field}, ${law.holds.bound}n))`
				case "finite":
					return `check(${q(law.name)}, ${law.relation}, (row) => Num.isFinite(row.${law.field}))`
			}
		case "unit":
			return `unit(${q(law.name)}, { ${commas(Arr.map(law.heading, (f) => `${f.name}: ${fieldExpr(f.type)}`))} })`
		case "mutable":
			return `mutable(${law.relation})`
		case "ordered":
			return `ordered(${sideExpr(law.member)}, fin(${law.owner}, ${q(law.count)}))`
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
	const base = (b: Exclude<Base, "text">) =>
		Arr.some(fields, (t) => t.kind === "base" && t.base === b) ||
		Arr.some(l.brands, (br) => br.base === b)
	const sides = Arr.flatMap(l.laws, (law) =>
		law.kind === "contained" ? [law.from, law.to] : law.kind === "key" ? [law.side] : []
	)
	const seated = Option.isSome(l.seats)
	const digested = Arr.some(l.relations, (r) => Arr.isReadonlyArrayNonEmpty(digestsOf(l, r.name)))
	return [
		...(seated || Arr.some(l.laws, (law) => law.kind === "check") ? ["check"] : []),
		"closed",
		...(used("closed") ? ["closedId"] : []),
		"contained",
		...(Arr.isReadonlyArrayNonEmpty(l.brands) ? ["contract"] : []),
		...(digested ? ["Crypto"] : []),
		...(seated ? ["derived"] : []),
		...(used("drawn") ? ["drawn"] : []),
		...(Arr.some(l.laws, (law) => law.kind === "ordered") ? ["fin"] : []),
		"fragment",
		...(digested ? ["generated"] : []),
		"key",
		...(Arr.isReadonlyArrayNonEmpty(l.brands) ? ["mintOf"] : []),
		"mutable",
		...(used("natural") || used("drawn") ? ["natural"] : []),
		...(Arr.some(l.laws, (law) => law.kind === "check" && law.holds.kind === "finite")
			? ["Num"]
			: []),
		"on",
		...(Arr.some(l.laws, (law) => law.kind === "ordered") ? ["ordered"] : []),
		...(used("place") ? ["place"] : []),
		...(base("bigint") || base("double") || base("boolean") ? ["pg"] : []),
		...(Arr.some(sides, (sd) => Arr.some(sd.terms, (t) => t.pred)) ? ["pred"] : []),
		...(seated ? ["query"] : []),
		...(Arr.some(l.laws, (law) => law.kind === "race") ? ["race"] : []),
		...(Arr.some(l.steps, (st) => Arr.isReadonlyArrayNonEmpty(st.reads)) ? ["records"] : []),
		"relation",
		...(Arr.some(sides, (sd) => sd.selection.kind !== "all") ? ["select"] : []),
		"sha256",
		"unit",
		...(seated ? ["v"] : [])
	]
}

/** The names a flow's printed programs and handles take, under its prefix. */
const naming = (l: Lowered) => {
	const p = lower1(l.prefix)
	const n = (suffix: string) => `${p}${suffix}`
	const snake = Str.camelToSnake(Str.uncapitalize(l.prefix))
	return {
		graph: n("Graph"),
		coordination: n("Coordination"),
		seatLevel: n("SeatLevel"),
		writerInserts: n("Writer"),
		den: `${l.prefix}Den`,
		denName: `${snake}_den`,
		coordinator: `${l.prefix}Coordinator`,
		coordinatorName: `${snake}_coordinator`,
		denPrograms: n("DenPrograms"),
		denWorkload: n("DenWorkload"),
		coordinatorPrograms: n("CoordinatorPrograms"),
		coordinatorWorkload: n("CoordinatorWorkload"),
		retirer: `${l.prefix}Retirer`,
		retirerName: `${snake}_retirer`,
		retirerPrograms: n("RetirerPrograms"),
		retirerWorkload: n("RetirerWorkload"),
		commitPrograms: n("CommitPrograms"),
		commitWorkload: n("Commits"),
		requests: n("Requests"),
		requestWrites: n("RequestWrites"),
		appRequests: n("AppRequests"),
		handles: `${l.prefix}Handles`,
		ledger: n("Ledger"),
		program: n
	}
}

/** The prefix of an idle flow's pending steps' name in the scheduler's snapshot and its busy read. */
const BUSY = "busy"

/** The name of an idle flow's pending steps in the scheduler's snapshot and its busy read. */
const busyName = (flow: string): string => `${BUSY}${flow}`

/** Whether a join is a root the app's own write requests. */
const isApp = (j: JoinIR): boolean => Option.exists(j.root, (r) => r.trigger === "app")

/** Whether a join is a root a schedule starts, which the census requests at each instant its cron names. */
const isScheduled = (j: JoinIR): boolean => Option.exists(j.root, (r) => r.trigger === "schedule")

/**
 * The parameters a root's request names its scope and key by, the flow's and the kind's, so the app's write that unions
 * several roots' requests binds each its own.
 */
const requestParams = (P: string, j: JoinIR) => ({
	scope: `${lower1(P)}${j.name}Scope`,
	key: `${lower1(P)}${j.name}Key`
})

/**
 * The fields of `relation`, one of the flow's fragments' relations: the printer names only relations the lowering made,
 * so one it cannot find is its own defect, which throws rather than print a rule of no fields.
 */
const relationFieldsOf = (l: Lowered, relation: string): RelationIR["fields"] =>
	Option.getOrThrowWith(
		Arr.findFirst(l.relations, (rel) => rel.name === relation),
		() =>
			new Error(`den's printer named ${relation}, which no fragment of the flow ${l.prefix} holds`)
	).fields

/** The names of `relation`'s fields (`relationFieldsOf`). */
const fieldNamesOf = (l: Lowered, relation: string): ReadonlyArray<string> =>
	Arr.map(relationFieldsOf(l, relation), (f) => f.name)

/**
 * The rows a root's request writes beside its Root, each relation beside its printed rows, the one list its printed
 * ChangeSet and its printed parameters follow, each guarded by the absence of its Root: its root scope's row, its
 * exclusivity keys where it holds a seat, and a given root's input rows (a derived root's are its read's,
 * `requestOfRoot`'s derivedRows).
 */
const requestedRowsOf = (P: string, j: JoinIR): ReadonlyArray<readonly [string, string]> => [
	[`${P}Scope`, "[{ scope, root: scope }]"],
	...(isExclusive(j)
		? [[`${P}ExclusiveKey`, "Arr.map(keys, (k) => ({ ...k, root: scope }))"] as const]
		: []),
	...(isDerived(j) ? [] : factRowsOf(j.input, "scope", "input", "scope"))
]

/**
 * A derived root's key (lower/fragment.ts RootIR `from`), none for a root whose input its request gives, or a scope.
 */
const derivedKeyOf = (j: JoinIR): Option.Option<KeyIR> =>
	Option.flatMap(j.root, (r) =>
		r.from.kind === "derived" ? Option.some(r.from.key) : Option.none()
	)

/**
 * The fields a derived root's key keeps beside its text fields as their digests (lower/fragment.ts KeyIR `digests`),
 * none for any other relation.
 */
const digestsOf = (l: Lowered, relation: string): KeyIR["digests"] =>
	Arr.flatMap(l.joins, (j) =>
		Option.match(derivedKeyOf(j), {
			onNone: () => [],
			onSome: (key) => (key.relation === relation ? key.digests : [])
		})
	)

/** Whether a root's input is derived from its key. */
const isDerived = (j: JoinIR): boolean => Option.isSome(derivedKeyOf(j))

/** A derived root's key fields, in its key struct's order, none for any other join. */
const keyFieldsOf = (j: JoinIR): ReadonlyArray<string> =>
	Option.match(derivedKeyOf(j), { onNone: () => [], onSome: (key) => key.fields })

/** The parameter a derived root's request names its key's field `field` in. */
const keyParamName = (P: string, j: JoinIR, field: string): string =>
	`${lower1(P)}${j.name}Key${Str.capitalize(field)}`

/** A derived root's key's field `field` as a rule's term: its request's parameter, of its key relation's type. */
const keyParamOf = (P: string, j: JoinIR, key: KeyIR, field: string): string =>
	`r.param(${q(keyParamName(P, j, field))}, ${key.relation}.fields.${field})`

/** The variable a rule binds a derived root's read's column `field` to. */
const derivedColumn = (field: string): string => `derived${Str.capitalize(field)}`

/**
 * A derived root's read, bound by its request's key, in a rule: the read the flow declares beside the kind
 * (`declaredFlow`, its `from.read`), each key field its param, and each of its columns a variable `derived<Field>`,
 * which the rule matches, each its own line before the rule's return; nothing for a root whose input its request gives.
 */
const derivedOf = (
	l: Lowered,
	j: JoinIR
): Readonly<{ declare: string; match: string; columns: ReadonlyArray<string> }> =>
	Option.match(derivedKeyOf(j), {
		onNone: () => ({ declare: "", match: "", columns: [] }),
		onSome: (key) => {
			const columns = inputFieldsOf(l, j.input.relation)
			const columnsBound = `{ ${commas(Arr.map(columns, (c) => `${c}: ${derivedColumn(c)}`))} }`
			return {
				declare: `
	const derived = declaredFlow.kinds[${String(j.index)}].from.read.bind({ ${commas(Arr.map(key.fields, (f) => `${f}: ${keyParamOf(l.prefix, j, key, f)}`))} })
	const ${columnsBound} = v(derived, "derived")`,
				match: `.match(derived, ${columnsBound})`,
				columns
			}
		}
	})

/** The relation parameter a root's request names its rows of `relation` in. */
const requestedRowsParam = (P: string, j: JoinIR, relation: string): string =>
	`${lower1(P)}${j.name}${relation}`

/**
 * Whether a root's request records what it was requested with (lower/fragment.ts recordsRequestOf, read off its IR).
 */
const recordsRequest = (j: JoinIR): boolean =>
	Option.exists(j.root, (r) => recordsRequestOf(r.from.kind))

/**
 * The declared fields of an input relation, the ones its heading names and its digest reads: every field but the root
 * and the owning scope, which its key names.
 */
const declaredFieldsOf = (l: Lowered, relation: string): RelationIR["fields"] =>
	Arr.filter(relationFieldsOf(l, relation), (f) => f.name !== "root" && f.name !== "scope")

/** The names of an input relation's declared fields (`declaredFieldsOf`), each of which its digest reads. */
const inputFieldsOf = (l: Lowered, relation: string): ReadonlyArray<string> =>
	Arr.map(declaredFieldsOf(l, relation), (f) => f.name)

/**
 * A root kind's input heading, the text its fingerprint is taken of under the running den's input digest scheme
 * (runtime/identity.ts inputFingerprint): each relation its input lowers to with each declared field's name and type
 * (`headingTypeOf`), and the printed construction of its digest (`inputTextsOf`), every part framed (`framedText`), so
 * a deploy that changes the input's shape changes the fingerprint, and a request again across it is the same keyed act,
 * never compared with a digest of another shape.
 */
const inputHeadingOf = (l: Lowered, j: JoinIR): string =>
	framedText([
		...Arr.map(valueRelations(j.input), (relation) =>
			framedText([
				relation,
				...Arr.map(declaredFieldsOf(l, relation), (f) =>
					framedText([f.name, headingTypeOf(l, f.type)])
				)
			])
		),
		framedText(["digest", inputTextsOf(l, j)])
	])

/**
 * A declared field's type as a kind's input heading names it: as the printer writes it, a brand with the base it
 * brands, and a roster with its handles, each framed (`framedText`), so a deploy that changes what a field holds
 * changes the heading: a brand's base, or a roster's handles, a value's codec text being its handle, so a handle
 * renamed would give the same event another text under the same heading.
 */
const headingTypeOf = (l: Lowered, type: FieldType): string =>
	type.kind === "brand"
		? framedText([
				"brand",
				type.brand,
				fieldExpr({
					kind: "base",
					base: Option.getOrThrowWith(
						Arr.findFirst(l.brands, (b) => b.name === type.brand),
						() =>
							new Error(
								`den's printer named the brand ${type.brand}, which the flow ${l.prefix} declares none of`
							)
					).base
				})
			])
		: type.kind === "closed"
			? framedText([
					"closedId",
					type.roster,
					...Option.getOrThrowWith(
						Arr.findFirst(l.rosters, (r) => r.name === type.roster),
						() =>
							new Error(
								`den's printer named the roster ${type.roster}, which the flow ${l.prefix} declares none of`
							)
					).handles
				])
			: fieldExpr(type)

/**
 * The texts a request's input digest is taken of, each a Result of its codec: each input relation's rows, the
 * relation's name before each row and each declared field's grizzle codec text (runtime/identity.ts codecTextsOf,
 * inputDigest).
 */
const inputTextsOf = (l: Lowered, j: JoinIR): string =>
	`[${commas(
		Arr.map(factRowsOf(j.input, "scope", "input", "scope"), ([relation, rows]) => {
			const fields = inputFieldsOf(l, relation)
			return Arr.isReadonlyArrayNonEmpty(fields)
				? `...pipe(${rows}, Arr.flatMap((row) => [${commas([
						`Result.succeed(${q(relation)})`,
						...Arr.map(fields, (f) => `${lower1(relation)}Texts.${f}(row.${f})`)
					])}]))`
				: `...Arr.map(${rows}, () => Result.succeed(${q(relation)}))`
		})
	)}]`

/**
 * A root's request, one fact identified by its root: its Root and every row of its graph it names (`requestedRowsOf`),
 * each relation's rows a relation parameter, each inserted only where no Root holds the request's root, as the state
 * before the change reads it. The Root's own row is the request's root scope's, at its scope and key the request's
 * parameters, its kind the root kind's handle, and its instant the request's reading of the database's clock, `denNow`,
 * which the clocked request binds, so no host names the instant a root was requested. A root whose input its request
 * gives records beside it what it was requested with (`RequestedWith`: its kind's input fingerprint and its input's
 * digest), inserted where no Root holds the root, or again where the held record has the request's fingerprint: an
 * equal input meets it, another is refused on its key, naming the root, and a request under another fingerprint inserts
 * nothing. A derived root's request names its key alone: its key is the request's parameters and its input its read's
 * row at that key (`derivedOf`), every row of the request inserted only where the read finds one: a derived root stands
 * only where its input derives, and records nothing. Its read is of the app's facts, which the graph does not hold, so
 * its request is written `over` a level that holds the read's level and the graph (the programs' `requestOver`): den's
 * role, which serves a root den requests; the app's schema for a root the app's write requests, so the request
 * composes into any of the app's writes over the schema or a level above it, run by a role that holds the schema whole;
 * any other's over the graph.
 *
 * A request of a root already requested inserts nothing else, its graph standing or retired: retirement deletes a
 * graph's rows but never its Root, its RequestedWith nor a derived root's key (the fragment's `cleared`), so a repeat
 * of the same input adds no fact and refuses nothing, and an app's write that unions the request with its own commits
 * its own facts. Two first requests of one root at once meet in the database's serializable read of the Root's absence:
 * the second is refused transient, and run again it inserts nothing, or, naming another input, is refused on its key.
 */
const requestOfRoot = (l: Lowered, j: JoinIR, over: string): string => {
	const P = l.prefix
	const root = `${P}Root`
	const scope = `${P}Scope`
	const requested = `${P}RequestedWith`
	const params = requestParams(P, j)
	const relationOf = (relation: string, fields: ReadonlyArray<string>): string =>
		`const requested = r.relation(${q(requestedRowsParam(P, j, relation))}, { ${commas(Arr.map(fields, (f) => `${f}: ${relation}.fields.${f}`))} })
	const { ${entries(fields)} } = v(requested, "requested")`
	const derived = derivedOf(l, j)
	const guarded = (relation: string): string => {
		const fields = fieldNamesOf(l, relation)
		return `.insert(${relation}, query(${over}).rule((r) => {
	${relationOf(relation, fields)}${derived.declare}
	return r.match(requested, { ${entries(fields)} })${derived.match}.where(r.not(${root}, { root })).find({ ${entries(fields)} })
}))`
	}
	/**
	 * A derived root's key, kept beside its Root, and its input, its read's row at the request's own root scope, each
	 * inserted where the read finds the row.
	 */
	const derivedRows = Option.match(derivedKeyOf(j), {
		onNone: () => "",
		onSome: (key) => {
			const atRoot = (
				relation: string,
				found: string
			) => `.insert(${relation}, query(${over}).rule((r) => {
	${relationOf(scope, ["root", "scope"])}${derived.declare}
	return r.match(requested, { root, scope })${derived.match}.where(r.eq(scope, root), r.not(${root}, { root })).find(${found})
}))`
			return `${atRoot(key.relation, `{ root, ${commas(Arr.map(key.fields, (f) => `${f}: ${keyParamOf(P, j, key, f)}`))} }`)}${atRoot(j.input.relation, `{ scope, root, ${commas(Arr.map(derived.columns, (c) => `${c}: ${derivedColumn(c)}`))} }`)}`
		}
	})
	const record = recordsRequest(j)
		? `.insert(${requested}, query(${over}).rule((r) => {
	${relationOf(requested, ["root", "fingerprint", "input"])}
	return r.match(requested, { root, fingerprint, input }).where(r.not(${root}, { root })).find({ root, fingerprint, input })
}).rule((r) => {
	${relationOf(requested, ["root", "fingerprint", "input"])}
	const { input: held } = v(${requested}, "held")
	return r.match(requested, { root, fingerprint, input }).match(${requested}, { root, fingerprint, input: held }).find({ root, fingerprint, input })
}))`
		: ""
	return `ChangeSet.empty(${over})${Arr.join(
		Arr.map(requestedRowsOf(P, j), ([relation]) => guarded(relation)),
		""
	)}${derivedRows}${record}.insert(${root}, query(${over}).rule((r) => {
	const requested = r.relation(${q(requestedRowsParam(P, j, scope))}, { root: ${scope}.fields.root, scope: ${scope}.fields.scope })
	const { root, scope } = v(requested, "requested")${derived.declare}
	return r
		.match(requested, { root, scope })${derived.match}
		.where(r.eq(scope, root), r.eq(root, r.param(${q(params.scope)}, ${root}.fields.root)), r.not(${root}, { root }))
		.find({ root, kind: ${P}RootKind.handle(${q(j.name)}), key: r.param(${q(params.key)}, ${root}.fields.key), at: r.param("${denClock}", ${root}.fields.at) })
}))`
}

/**
 * The relations a root's request inserts, from the pieces its printed ChangeSet is (requestOfRoot): its scope's row,
 * its exclusivity keys and a given root's input rows (`requestedRowsOf`), a derived root's key and input, what a given
 * root was requested with, and its Root.
 */
const requestWritesOf = (P: string, j: JoinIR): ReadonlyArray<string> => [
	...Arr.map(requestedRowsOf(P, j), ([relation]) => relation),
	...Option.match(derivedKeyOf(j), {
		onNone: () => [],
		onSome: (key) => [key.relation, j.input.relation]
	}),
	...(recordsRequest(j) ? [`${P}RequestedWith`] : []),
	`${P}Root`
]

/** Whether a flow has a step kind due at its input's instant, whose spawns name their due instants (`timed`). */
const timedKinds = (l: Lowered): boolean => Arr.some(l.steps, (s) => s.due.kind === "at")

/** Whether a join is a root that holds an exclusivity seat. */
const isExclusive = (j: JoinIR): boolean => Option.exists(j.root, (r) => r.exclusive)

/**
 * The relations a flow's app role writes: each result, output, read and spawn a commit writes, and its app's roots'
 * requests.
 */
const writerRelationsOf = (l: Lowered): ReadonlyArray<string> => {
	const P = l.prefix
	const anySpawn = Arr.isReadonlyArrayNonEmpty(l.edges)
	return Arr.dedupe([
		`${P}Result`,
		`${P}Done`,
		`${P}Held`,
		...Arr.flatMap(l.steps, (s) => valueRelations(s.output)),
		...Arr.flatMap(l.joins, (j) => valueRelations(j.finish.output)),
		...Arr.flatMap(l.steps, (s) => Arr.map(s.reads, (r) => r.record)),
		...(anySpawn ? l.spawning : []),
		...Arr.flatMap(
			Arr.filter(l.joins, (j) => isApp(j)),
			(j: JoinIR) => requestWritesOf(l.prefix, j)
		)
	])
}

/** What a commit records of its step's reads: the lines that digest each row, and the facts that hold them. */
interface Recording {
	readonly lines: ReadonlyArray<string>
	readonly facts: ReadonlyArray<string>
}

/** A commit that records no read: a finish's, a step's of no reads. */
const unrecorded: Recording = { lines: [], facts: [] }

/** An identifier of a printed module's text, for the names the module uses. */
const IDENTIFIER = regex("[A-Za-z_$][A-Za-z0-9_$]*", "g")

/** A double-quoted string of a printed module's text, which names no value the module uses. */
const QUOTED = regex('"(?:[^"\\\\]|\\\\.)*"', "g")

/** Every identifier of a module's text outside its double-quoted strings. */
const identifiersOf = (text: string): ReadonlySet<string> =>
	new Set(
		Arr.map(
			Arr.fromIterable(Str.matchAll(IDENTIFIER)(Str.replaceAll(QUOTED, "")(text))),
			(found) => found[0]
		)
	)

/**
 * The rosters the binding reads by value: the root kinds an exclusivity seat names, the pausable targets, and the
 * resources.
 */
const boundRostersOf = (l: Lowered): ReadonlyArray<string> => {
	const relations = Arr.map(l.relations, (rel) => rel.name)
	const r = (s: string) => `${l.prefix}${s}`
	return [
		...(Arr.contains(relations, r("Exclusive")) ? [r("RootKind")] : []),
		r("Pausable"),
		...(Arr.contains(relations, r("Hold")) ? [r("Resource")] : [])
	]
}

/** The relations a law names. */
const lawRelations = (law: LawIR): ReadonlyArray<string> => {
	switch (law.kind) {
		case "contained":
			return [law.from.relation, law.to.relation]
		case "key":
			return [law.side.relation]
		case "race":
			return [law.relation]
		case "check":
			return [law.relation]
		case "unit":
			return []
		case "mutable":
			return [law.relation]
		case "ordered":
			return [law.member.relation, law.owner]
	}
}

/** The name a step's declared reads are exported under from the placement's reads module. */
export const readsExport = (step: string): string => `${step}Reads`

/** The steps' reads, each with its step's index in the flow's kinds. */
const readsOfFlow = (l: Lowered): ReadonlyArray<{ readonly step: StepIR; readonly read: ReadIR }> =>
	Arr.flatMap(l.steps, (step) => Arr.map(step.reads, (read) => ({ step, read })))

/** Each spread of the names of the relations a flow's records hold, which grizzle made. */
const recordNames = (l: Lowered): ReadonlyArray<string> =>
	Arr.map(
		readsOfFlow(l),
		({ read }) => `...Arr.map(${read.stem}Records.relations, (rel) => rel.name)`
	)

/** The closed relation of a flow's seat counts, as its fragment module declares it. */
const countsExpr = (counts: CountsIR): string =>
	`const ${counts.name} = closed.relation(${q(counts.name)}, { ${counts.key.field}: closedId(${counts.key.roster}), ${counts.count}: natural }, [${q(counts.key.field)}], [${commas(
		Arr.map(
			counts.rows,
			(row) => `{ ${counts.key.field}: ${q(row.handle)}, ${counts.count}: ${row.count}n }`
		)
	)}])`

/**
 * The fragment module: the flow's rosters, contracts and relations, and two grizzle fragments the app lists in its
 * schema, each with every roster: the graph, its relations and laws, which den's role and the flow's app role hold
 * whole; and the coordination group, its chains of turns and its seat counts, which den's coordinator role holds whole and
 * no law of the graph names. For a flow with seats, its seat level: the live holds, a derived relation, and their check
 * below the counts, which the listing schema states on a level over itself. Beside them, the den relations the flow's
 * app role inserts into.
 */
export const printFragment = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const reads = l.awaited
	const writer = writerRelationsOf(l)
	const rosterNames = Arr.map(l.rosters, (r) => r.name)
	const seats = Option.toArray(l.seats)
	const counts = Arr.map(seats, (st) => st.counts)
	const countNames = Arr.map(counts, (c) => c.name)
	const coordination = new Set([...l.coordination, ...countNames])
	/** The relations written only nested under their owners, which no module but the fragment names: a claim's holds. */
	const nested = Arr.map(seats, (st) => st.hold)
	const graphRelations = Arr.filter(
		Arr.map(l.relations, (r) => r.name),
		(r) => !coordination.has(r)
	)
	/** A law of the coordination group names its relations alone; a unit names none, and is the graph's. */
	const coordinating = (law: LawIR) => {
		const named = lawRelations(law)
		return Arr.isReadonlyArrayNonEmpty(named) && Arr.every(named, (r) => coordination.has(r))
	}
	return `${lines([
		`/** The fragment den lowered the flow ${l.prefix} to; \`den generate\` writes it, and nothing edits it. */`,
		`import { ${commas(fragmentImportsOf(l))} } from "@bjornpagen/grizzle"`,
		`import { ${commas(denKeysOf(l))} } from "@bjornpagen/den/lower/keys"`,
		...(Arr.isReadonlyArrayNonEmpty(reads)
			? [`import { ${commas(reads)} } from ${q(place.relations)}`]
			: []),
		...(Arr.isReadonlyArrayNonEmpty(readsOfFlow(l))
			? [
					`import { Array as Arr } from "effect"`,
					`import { ${commas(Arr.dedupe(Arr.map(readsOfFlow(l), ({ step }) => readsExport(step.name))))} } from ${q(place.reads.from)}`
				]
			: []),
		"",
		...Arr.flatMap(l.brands, (b) => [
			`const ${brandKey(b.name)} = Symbol(${q(b.name)})`,
			`const ${b.name} = contract<typeof ${brandKey(b.name)}>()(${q(b.name)}, ${baseExpr(b.base)})`,
			`/** The mint of ${b.name}'s host type, which the flow's binding writes a value of the brand ${b.name} by. */`,
			`export const ${brandMint(b.name)} = mintOf(${brandKey(b.name)})`
		]),
		"",
		...Arr.map(
			l.rosters,
			(r) =>
				`export const ${r.name} = closed.unordered(${q(r.name)}, [${commas(Arr.map(r.handles, q))}])`
		),
		...Arr.map(counts, countsExpr),
		"",
		...Arr.map(
			l.relations,
			(r) =>
				`${Arr.contains(nested, r.name) ? "const" : "export const"} ${r.name} = ${Arr.isReadonlyArrayNonEmpty(digestsOf(l, r.name)) ? "relation.generated" : "relation"}(${q(r.name)}, { ${commas(
					Arr.map(r.fields, (f) => `${f.name}: ${fieldExpr(f.type)}`)
				)} }, [${commas(Arr.map(r.key, q))}]${Arr.match(digestsOf(l, r.name), { onEmpty: () => "", onNonEmpty: (digests) => `, (row) => ({ ${commas(Arr.map(digests, (d) => `${d.name}: generated(sha256, Crypto.sha256(row.${d.of}))`))} })` })})`
		),
		"",
		...Arr.flatMap(readsOfFlow(l), ({ step, read }) => [
			`/** The records of the rows step ${step.name}'s read \`${read.name}\` found, grizzle's of its query: each column the query's own field, each attachment a relation under its owner, named by den, keyed by a row's digest alone, so every root that found a row shares it. */`,
			`export const ${read.stem}Records = records(${q(read.stem)}, ${readsExport(step.name)}.named.${read.name}, { digest: sha256 }, ["digest"]${Arr.isReadonlyArrayNonEmpty(read.paths) ? `, { names: { ${commas(Arr.map(read.paths, (at) => `${q(at.path)}: ${q(at.name)}`))} } }` : ""})`,
			`export const ${read.stem}Row = ${read.stem}Records.row`,
			""
		]),
		`/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role \`${l.writer}\` hold whole. */`,
		`export const ${n.graph} = fragment([${commas([
			...rosterNames,
			...graphRelations,
			...Arr.map(readsOfFlow(l), ({ read }) => `...${read.stem}Records.relations`)
		])}], [${commas([
			...Arr.map(
				Arr.filter(l.laws, (law) => !coordinating(law)),
				lawExpr
			),
			...Arr.map(readsOfFlow(l), ({ read }) => `...${read.stem}Records.rules`)
		])}])`,
		"",
		`/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */`,
		`export const ${n.coordination} = fragment([${commas([...rosterNames, ...countNames, ...l.coordination])}], [${commas(
			Arr.map(Arr.filter(l.laws, coordinating), lawExpr)
		)}])`,
		"",
		...Arr.flatMap(seats, (st) => [
			`/** The flow's live holds: each hold whose claim's attempt has neither ended nor held its step's result, with its claim's lease, which den's role reads as the seats' holders. */`,
			`const ${st.live} = derived(${q(st.live)}, query(${n.graph}).rule((r) => {
	const { step, root, attempt, resource, seat } = v(${st.hold}, ${q(lower1(st.hold))})
	const { until } = v(${l.prefix}Claim, ${q(lower1(`${l.prefix}Claim`))})
	return r
		.match(${st.hold}, { step, root, attempt, resource, seat })
		.match(${l.prefix}Claim, { step, root, attempt, until })
		.where(r.not(${l.prefix}Ended, { step, root, attempt }), r.not(${l.prefix}Held, { step, root, attempt }))
		.find({ ${commas(seatFields)} })
}))`,
			"",
			`/** The flow's seat level: its live holds, at most one a seat, each held below its resource's count. A fragment declares no derived relation, so the schema that lists \`${n.graph}\` states these on a level over itself, \`schema.extend([listing], name, [...${n.seatLevel}.relations], [...${n.seatLevel}.laws])\`. */`,
			`export const ${n.seatLevel} = { relations: [${st.live}], laws: [key(on(${st.live}, "resource", "seat")), check(${q(st.bound)}, ${st.live}, (row) => row.lt(row.seat, ${st.counts.name}.at(${q(st.counts.count)}, row.${st.counts.key.field})))] } as const`,
			""
		]),
		`/** The den relations the flow's app role \`${l.writer}\` inserts into: each step's commit's, and each app root's request's. */`,
		`export const ${n.writerInserts} = [${commas([...Arr.map(writer, q), ...recordNames(l)])}] as const`
	])}\n`
}

/**
 * The array members of a commit that records a step's reads: for each, the insert of its records' every relation grizzle
 * made of its query, the root's and each attachment's an insert states beside it.
 */
const recordsMembersOf = (graph: string, reads: ReadonlyArray<ReadIR>): string =>
	Arr.join(
		Arr.map(reads, (rd) => `.insertAll(recordsFacts(${graph}, ${rd.stem}Records)([]))`),
		""
	)

/** The array members of a ChangeSet of den's: an insert of each relation. */
const members = (inserts: ReadonlyArray<string>): string =>
	Arr.join(
		Arr.map(inserts, (r) => `.insert(${r}, [])`),
		""
	)

/** A query over `role` of every row of `relation`, by its fields. */
const allOf = (role: string, relation: string, fields: ReadonlyArray<string>): string =>
	`query(${role}).rule((r) => {
	const { ${entries(fields)} } = v(${relation}, ${q(lower1(relation))})
	return r.match(${relation}, { ${entries(fields)} }).find({ ${entries(fields)} })
})`

/**
 * A query over `role` of the rows of `relation` under the root and the owner (`owner`) its parameters of their names
 * hold, every field: a body's key holds its root before its owner, so the read is one probe of that key.
 */
const ownedBy = (l: Lowered, role: string, relation: string, owner: string): string => {
	const fields = fieldNamesOf(l, relation)
	return `query(${role}).rule((r) => {
	const { ${entries(fields)} } = v(${relation}, ${q(lower1(relation))})
	return r.match(${relation}, { ${entries(fields)} }).where(r.eq(${bound("root")}, r.param("root", ${relation}.fields.root)), r.eq(${bound(owner)}, r.param(${q(owner)}, ${relation}.fields.${owner}))).find({ ${entries(fields)} })
})`
}

/**
 * A query over `role` of the roots whose graph stands, each by its scope, kind, key and instant, where `where` holds: a
 * root's record and its own scope's, which a clearing deletes, so a cleared root, its record kept, is no root a read of
 * the graph finds.
 */
const standingRootsOf = (
	role: string,
	r: (s: string) => string,
	where: ReadonlyArray<string>
): string => `query(${role}).rule((r) => {
	const { kind, key, at } = v(${r("Root")}, "root")
	const { scope } = v(${r("Scope")}, "scope")
	return r.match(${r("Root")}, { root: scope, kind, key, at }).match(${r("Scope")}, { root: scope, scope })${Arr.isReadonlyArrayNonEmpty(where) ? `.where(${commas(where)})` : ""}.find({ scope, kind, key, at })
})`

/** A query over `role` of each chain's latest turn in `held`: `r.max(turn)`, grouped by its coordinates. */
const latestOf = (role: string, held: string, coordinates: ReadonlyArray<string>): string =>
	`query(${role}).rule((r) => {
	const { ${entries([...coordinates, "turn"])} } = v(${held}, ${q(lower1(held))})
	return r.match(${held}, { ${entries([...coordinates, "turn"])} }).find({ ${commas([...Arr.map(coordinates, entry), "turn: r.max(turn)"])} })
})`

/** A live hold's fields: its seat, the claim that holds it and its claim's lease. */
const seatFields = ["resource", "seat", "step", "root", "attempt", "until"] as const

/** A query over `role` of the seats' live holds, through the entry of its seat level's live holds that `role` holds. */
const liveHoldsOf = (role: string, st: SeatsIR): string => {
	const live = `${role}.relations.${st.live}`
	const fields = commas(seatFields)
	return `query(${role}).rule((r) => {
	const { ${fields} } = v(${live}, "live")
	return r.match(${live}, { ${fields} }).find({ ${fields} })
})`
}

/**
 * A claim's one write: the claim of a step, its attempt left out for the database to stamp in the step's group and its
 * lease's end computed in the statement, the call's reading of the database's clock plus the turn's `budget`, a
 * DenDelay, so no host names the instant its lease ends, with its holds nested under it, which carry its step, root and
 * attempt; and the end of each attempt its turn found lapsed at its reading of the database's clock (its step's latest
 * claim, and each claim holding a seat this claim takes), so a lapsed holder's seats are free in the write that takes
 * them and a claim after a lapsed one follows its end. The ends are the call's rows, each stating its root's graph, since
 * a call holds every graph it touches before it touches it. The stamped attempt is read back from the same write, the
 * claim's one way to know which attempt it holds.
 */
const claimOf = (graph: string, r: (s: string) => string): string => `clocked(
	ChangeSet.empty(${graph})
		.insertAllComputed({ ${r("Claim")}: [] }, {
			until: Type.cast(Num.add(Type.base(param("${denClock}", DenInstant)), Type.base(param("budget", DenDelay))), DenInstant, denInstantKey)
		})
		.insert(${r("Ended")}, [])
		.read("held", (delta) =>
			query(${graph}).rule((r) => {
				const { step, root, attempt } = v(delta.added(${r("Claim")}), "added")
				return r.match(delta.added(${r("Claim")}), { step, root, attempt }).find({ step, root, attempt })
			})
		),
	{ ${denClock}: "millis" },
	{ ${denClock}: denInstantKey }
)`

/** A query over `role` of each chain's live turn: every turn of `held` that no row of `ended` ends. */
const liveOf = (
	role: string,
	held: string,
	ended: string,
	coordinates: ReadonlyArray<string>,
	payload: ReadonlyArray<string>
): string => {
	const fields = entries([...coordinates, "turn", ...payload])
	return `query(${role}).rule((r) => {
	const { ${fields} } = v(${held}, ${q(lower1(held))})
	return r.match(${held}, { ${fields} }).where(r.not(${ended}, { ${entries([...coordinates, "turn"])} })).find({ ${fields} })
})`
}

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
		...Arr.filter(l.spawning, (r) => !Arr.some(l.edges, (e) => e.relation === r))
	])
}

/**
 * A step's or a finish's commit: den's facts, a ChangeSet over the flow's graph, and, for a kind that commits through
 * the app's ChangeSet, that ChangeSet, which `kind`'s `writes` makes of the flow's app role `writer`, unioned so both
 * commit in one call: a refusal of either refuses both. The call's reading of the database's clock binds `denNow`, the
 * instant its spawned steps are due from, and each instant of the app's ChangeSet its clock names.
 */
const commitOf = (
	graph: string,
	writer: string,
	inserts: ReadonlyArray<string>,
	spawns: Option.Option<string>,
	commit: CommitIR,
	kind: string,
	recorded: string
): string => {
	const den = `ChangeSet.empty(${graph})${members(inserts)}${recorded}${Option.getOrElse(spawns, () => "")}`
	const clock = [
		...(Option.isSome(spawns) ? [[denClock, "millis"] as const] : []),
		...(commit.kind === "through" ? commit.clock : [])
	]
	const united =
		commit.kind === "through" ? `ChangeSet.union(${den}, ${kind}.writes.changes(${writer}))` : den
	return Arr.isReadonlyArrayNonEmpty(clock)
		? `clocked(${united}, { ${commas(Arr.map(clock, ([param, unit]) => `${param}: ${q(unit)}`))} }${Option.isSome(spawns) ? `, { ${denClock}: denInstantKey }` : ""})`
		: united
}

/**
 * The insert of the steps a call spawns, under the call's one graph, the scalar parameter `root`: the rows of the
 * relation parameter `steps`, each a step, its kind, its owning scope and its delay, each due its delay after the call's
 * own reading of the database's clock, so the database computes the due instant; and, for a flow with a step kind due at
 * its input's instant (`timed`), the rows of `timed`, each due at the instant its input holds, a value the database
 * computed. No host names a due instant. A delay is a DenDelay, bounded so the sum fits an instant.
 */
const spawnedStepsOf = (graph: string, step: string, timed: boolean): string => `.insert(
	${step},
	query(${graph}).rule((r) => {
		const steps = r.relation("steps", { step: ${step}.fields.step, kind: ${step}.fields.kind, scope: ${step}.fields.scope, delay: DenDelay })
		const { step, kind, scope, delay } = v(steps, "spawned")
		return r
			.match(steps, { step, kind, scope, delay })
			.find({
				step,
				kind,
				scope,
				due: Type.cast(Num.add(Type.base(r.param("${denClock}", DenInstant)), Type.base(delay)), DenInstant, denInstantKey),
				root: r.param("root", ${step}.fields.root)
			})
	})${
		timed
			? `
	.rule((r) => {
		const timed = r.relation("timed", { step: ${step}.fields.step, kind: ${step}.fields.kind, scope: ${step}.fields.scope, due: ${step}.fields.due })
		const { step, kind, scope, due } = v(timed, "timed")
		return r.match(timed, { step, kind, scope, due }).find({ step, kind, scope, due, root: r.param("root", ${step}.fields.root) })
	})`
			: ""
	}
)`

/**
 * The programs module: den's programs over the flow's graph and coordination fragments, the roles over the app's
 * schema that hold them whole and serve them, each commit's union of den's facts with the app's writes, each app root's
 * request, which the app's write commits beside its own (over the graph, or over the app's schema for a derived root),
 * and the declared reads over the flow's app role.
 */
export const printPrograms = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const P = l.prefix
	const app = place.schema.name
	const W = place.writer.name
	const r = (s: string) => `${P}${s}`
	/**
	 * What a root's request is written over. A derived root's read is of the app's facts, which the graph does not hold:
	 * den's role, which serves it, holds them for a root den requests, and the app's schema for a root the app's write
	 * requests, so the request composes into any of the app's writes over the schema or a level above it.
	 */
	const requestOver = (j: JoinIR): string => (isDerived(j) ? (isApp(j) ? app : n.den) : n.graph)
	/** The levels the reads of the derived roots den requests are over, each of which den's role holds whole. */
	const derivedLevels = Arr.map(
		Arr.filter(l.joins, (j) => isDerived(j) && !isApp(j)),
		(j) => `...declaredFlow.kinds[${String(j.index)}].from.over.relations`
	)
	const scopeParam = `r.param("scope", ${r("Scope")}.fields.scope)`
	const stepParam = `r.param("step", ${r("Step")}.fields.step)`
	/** The root of the graph a read by step or by scope reads: the unit's key, which every graph relation leads with. */
	const rootParam = `r.param("root", ${r("Scope")}.fields.root)`
	const den = denRelationsOf(l)
	const idleEntries = Arr.flatMap(l.idle, (f) => [
		`${f}Step: ${app}.relations.${f}Step`,
		`${f}Result: ${app}.relations.${f}Result`
	])
	const awaitedEntries = Arr.map(l.awaited, (rel) => `${rel}: ${app}.relations.${rel}`)
	/** The step kinds that await a fact, each with what it awaits. */
	const awaiting = Arr.filter(l.steps, (s) => Arr.isReadonlyArrayNonEmpty(s.awaits))
	/** The input fields an awaited fact's key reads, each once, in its kind's input. */
	const keyColumns = (awaits: ReadonlyArray<AwaitIR>): ReadonlyArray<string> =>
		Arr.dedupe(Arr.flatMap(awaits, (a) => Arr.map(a.key, (k) => k.input)))
	const keyOf = (a: AwaitIR): string =>
		`{ ${commas(Arr.map(a.key, (k) => `${k.field}: ${bound(k.input)}`))} }`
	/**
	 * The steps that wait on a fact, one arm per fact a kind awaits: a step of the kind with no result whose awaited row
	 * does not exist, each `where` term beside it.
	 */
	const awaitingOf = (also: ReadonlyArray<string>): string =>
		`query(${n.den})${Arr.join(
			Arr.flatMap(awaiting, (s) =>
				Arr.map(
					s.awaits,
					(a) => `
	.rule((r) => {
		const { ${entries(["root", "step", ...keyColumns([a])])} } = v(${s.input.relation}, "input")
		return r
			.match(${s.input.relation}, { ${entries(["root", "step", ...keyColumns([a])])} })
			.where(${commas([...also, `r.not(${r("Result")}, { root, step })`, `r.not(${app}.relations.${a.relation}, ${keyOf(a)})`])})
			.find({ root, step })
	})`
				)
			),
			""
		)}`
	/**
	 * The steps a fact's arrival made ready: a step of a kind that awaits, with no result and no claim, whose every
	 * awaited row exists, one arm per kind.
	 */
	const readyOf = `query(${n.den})${Arr.join(
		Arr.map(
			awaiting,
			(s) => `
	.rule((r) => {
		const { ${entries(["root", "step", ...keyColumns(s.awaits)])} } = v(${s.input.relation}, "input")
		return r
			.match(${s.input.relation}, { ${entries(["root", "step", ...keyColumns(s.awaits)])} })${Arr.join(
				Arr.map(
					s.awaits,
					(a) => `
			.match(${app}.relations.${a.relation}, ${keyOf(a)})`
				),
				""
			)}
			.where(r.not(${r("Result")}, { root, step }), r.not(${r("Claim")}, { root, step }))
			.find({ root, step })
	})`
		),
		""
	)}`
	const rosterNames = Arr.map(l.rosters, (ro) => ro.name)
	const liveEntry = Arr.map(Option.toArray(l.seats), (st) => {
		const fields = commas(seatFields)
		return `${st.live}: query(${app}).rule((r) => {
	const { ${fields} } = v(${app}.relations.${st.live}, "live")
	return r.match(${app}.relations.${st.live}, { ${fields} }).find({ ${fields} })
})`
	})
	const allRelations = Arr.map(l.relations, (rel) => rel.name)
	const has = (relation: string) => Arr.contains(allRelations, relation)
	const exclusiveKeys = has(r("ExclusiveKey"))
	const children = has(r("Within"))
	/**
	 * The reads the relay watches and the scheduler's snapshot reads too, each one query over den's role, declared once
	 * in the programs module and named there: the pending steps, the requested scopes (a root whose graph is open, its
	 * Scope standing, and that is neither admitted nor skipped: a retired root's graph is cleared, so it is no longer
	 * requested),
	 * the running scopes, and each idle
	 * flow's pending steps.
	 */
	const sharedReads = {
		pending: [
			n.program("PendingRead"),
			`query(${n.den}).rule((r) => {
	const { root, step, kind, scope, due } = v(${r("Step")}, "step")
	return r.match(${r("Step")}, { root, step, kind, scope, due }).where(r.not(${r("Result")}, { root, step })).find({ root, step, kind, scope, due })
})`
		],
		requested: [
			n.program("RequestedRead"),
			`query(${n.den}).rule((r) => {
	const { scope } = v(${r("Scope")}, "scope")
	return r.match(${r("Root")}, { root: scope }).match(${r("Scope")}, { root: scope, scope }).where(r.not(${r("Admitted")}, { root: scope, scope }), r.not(${r("Skipped")}, { root: scope, scope })).find({ scope })
})`
		],
		running: [
			n.program("RunningRead"),
			`query(${n.den}).rule((r) => {
	const { root, scope, step } = v(${r("Finish")}, "finish")
	return r.match(${r("Finish")}, { root, scope, step }).where(r.not(${r("Result")}, { root, step })).find({ scope })
})`
		]
	} as const
	const busyRead = (f: string): readonly [string, string] => [
		n.program(`Busy${f}Read`),
		`query(${n.den}).rule((r) => {
	const { root, step } = v(${app}.relations.${f}Step, "step")
	return r.match(${app}.relations.${f}Step, { root, step }).where(r.not(${app}.relations.${f}Result, { root, step })).find({ step })
})`
	]
	/** The instant each environment's latest promotion was served from: the one its deployment serves. */
	const latestServed = [
		`${Str.uncapitalize(P)}LatestServed`,
		`query(${n.den}).rule((r) => {
	const { environment, at } = v(${r("Served")}, "served")
	return r
		.match(${r("Served")}, { environment, at })
		.where(r.eq(environment, r.param("environment", ${r("Served")}.fields.environment)))
		.find({ environment, at: r.max(at) })
})`
	] as const
	const sharedDeclarations: ReadonlyArray<readonly [string, string]> = [
		sharedReads.pending,
		sharedReads.requested,
		sharedReads.running,
		...Arr.map(l.idle, busyRead),
		latestServed
	]
	const shared = {
		pending: sharedReads.pending[0],
		requested: sharedReads.requested[0],
		running: sharedReads.running[0],
		busy: (f: string) => busyRead(f)[0]
	}
	/**
	 * The scheduler's snapshot: every read eligibility depends on, as one record of named reads over den's role, so one
	 * statement and one snapshot (ReadsQuery): the pending steps and their claims, retries and fenced attempts, the
	 * requested and running scopes, every child scope's parent and every root's key and instant, each exclusive root's
	 * key, the live holds, exclusivity seats and pauses, and each idle flow's pending steps.
	 */
	const snapshotOf = `query(${n.den}).reads({ ${commas([
		`steps: ${shared.pending}`,
		`claims: query(${n.den}).rule((r) => {
	const { root, step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { root, step, attempt, until }).where(r.not(${r("Result")}, { root, step })).find({ step, attempt, until })
})`,
		`retries: query(${n.den}).rule((r) => {
	const { root, step, attempt, at, why } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { root, step, attempt, at, why }).where(r.not(${r("Result")}, { root, step })).find({ step, attempt, at, why })
})`,
		`fenced: query(${n.den}).rule((r) => {
	const { root, step, attempt } = v(${r("Fenced")}, "fenced")
	return r.match(${r("Fenced")}, { root, step, attempt }).where(r.not(${r("Result")}, { root, step })).find({ step, attempt })
})`,
		`requested: ${shared.requested}`,
		`running: ${shared.running}`,
		...(children ? [`withins: ${allOf(n.den, r("Within"), ["scope", "parent", "kind"])}`] : []),
		`roots: ${standingRootsOf(n.den, r, [])}`,
		...(exclusiveKeys ? [`keys: ${allOf(n.den, r("ExclusiveKey"), ["scope", "key", "id"])}`] : []),
		...Arr.map(Option.toArray(l.seats), (st) => `holds: ${liveHoldsOf(n.den, st)}`),
		...(has(r("Exclusive"))
			? [`exclusives: ${liveOf(n.den, r("Exclusive"), r("Released"), ["kind", "key"], ["scope"])}`]
			: []),
		`paused: ${liveOf(n.den, r("Paused"), r("Resumed"), ["target"], [])}`,
		...Arr.map(l.idle, (f) => `${busyName(f)}: ${shared.busy(f)}`),
		...(Arr.isReadonlyArrayNonEmpty(awaiting) ? [`awaiting: ${awaitingOf([])}`] : [])
	])} })`
	const denPrograms: Array<readonly [string, string]> = [
		[
			n.program("Now"),
			`clocked(query(${n.graph}).rule((r) => r.find({ now: r.param("${denClock}", DenInstant) })), { ${denClock}: "millis" }, { ${denClock}: denInstantKey })`
		],
		[
			n.program("Reading"),
			`clocked(
	query(${n.den}).reads({
		now: query(${n.graph}).rule((r) => r.find({ now: r.param("${denClock}", DenInstant) })),
		serving: query(${n.den}).rule((r) => {
			const { environment, at, deployment } = v(${r("Served")}, "served")
			return r
				.match(${latestServed[0]}.bind({ environment: r.param("environment", ${r("Served")}.fields.environment) }), { environment, at })
				.match(${r("Served")}, { environment, at, deployment })
				.find({ deployment })
		})
	}),
	{ "now.${denClock}": "millis" },
	{ "now.${denClock}": denInstantKey }
)`
		],
		[n.program("Claim"), claimOf(n.graph, r)],
		[
			n.program("Retry"),
			`clocked(
	ChangeSet.empty(${n.graph})
		.insert(${r("Ended")}, [])
		.insert(
			${r("Retry")},
			query(${n.graph}).rule((r) =>
				r.find({
					step: r.param("step", ${r("Retry")}.fields.step),
					attempt: r.param("attempt", ${r("Retry")}.fields.attempt),
					at: Type.cast(Num.add(Type.base(r.param("${denClock}", DenInstant)), Type.base(r.param("delay", DenDelay))), DenInstant, denInstantKey),
					why: r.param("why", ${r("Retry")}.fields.why),
					root: r.param("root", ${r("Retry")}.fields.root)
				})
			)
		),
	{ ${denClock}: "millis" },
	{ ${denClock}: denInstantKey }
)`
		],
		[
			n.program("Fence"),
			`ChangeSet.empty(${n.graph}).insert(${r("Ended")}, []).insert(${r("Fenced")}, [])`
		],
		...Arr.map(
			Option.toArray(l.seats),
			(st) => [n.program("Holds"), liveHoldsOf(n.den, st)] as const
		),
		[
			n.program("Refuse"),
			`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), r("Refusal")])}`
		],
		[
			n.program("Exhaust"),
			`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), r("Exhausted")])}`
		],
		[
			n.program("Admit"),
			`clocked(ChangeSet.empty(${n.graph})${members(
				Arr.filter(admittingOf(l), (rel) => rel !== r("Step"))
			)}${spawnedStepsOf(n.graph, r("Step"), timedKinds(l))}, { ${denClock}: "millis" }, { ${denClock}: denInstantKey })`
		],
		[n.program("Skip"), `ChangeSet.empty(${n.graph}).insert(${r("Skipped")}, [])`],
		[n.program("SkippedOf"), ownedBy(l, n.graph, r("Skipped"), "scope")],
		[n.program("StepOf"), ownedBy(l, n.graph, r("Step"), "step")],
		[n.program("ResultOf"), ownedBy(l, n.graph, r("Result"), "step")],
		[n.program("HeldOf"), ownedBy(l, n.graph, r("Held"), "step")],
		...(children
			? [[n.program("WithinOf"), ownedBy(l, n.graph, r("Within"), "scope")] as const]
			: []),
		[n.program("AdmittedOf"), ownedBy(l, n.graph, r("Admitted"), "scope")],
		[
			n.program("RootOf"),
			standingRootsOf(n.graph, r, [`r.eq(scope, r.param("root", ${r("Root")}.fields.root))`])
		],
		...(exclusiveKeys
			? [[n.program("ExclusiveKeyOf"), ownedBy(l, n.graph, r("ExclusiveKey"), "scope")] as const]
			: []),
		[
			n.program("FinishedRoots"),
			`query(${n.graph})
	.rule((r) => {
		const { scope, step } = v(${r("Finish")}, "finish")
		return r.match(${r("Finish")}, { root: scope, scope, step }).match(${r("Result")}, { root: scope, step }).find({ scope })
	})
	.rule((r) => {
		const { scope } = v(${r("Skipped")}, "skipped")
		return r.match(${r("Skipped")}, { root: scope, scope }).find({ scope })
	})`
		],
		[
			n.program("ClaimsOf"),
			`query(${n.graph}).rule((r) => {
	const { root, step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { root, step, attempt, until }).where(r.eq(root, ${rootParam}), r.eq(step, ${stepParam})).find({ step, attempt, until })
})`
		],
		[
			n.program("RetriesOf"),
			`query(${n.graph}).rule((r) => {
	const { root, step, attempt, at, why } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { root, step, attempt, at, why }).where(r.eq(root, ${rootParam}), r.eq(step, ${stepParam})).find({ step, attempt, at, why })
})`
		],
		[
			n.program("FencedOf"),
			`query(${n.graph}).rule((r) => {
	const { root, step, attempt } = v(${r("Fenced")}, "fenced")
	return r.match(${r("Fenced")}, { root, step, attempt }).where(r.eq(root, ${rootParam}), r.eq(step, ${stepParam})).find({ step, attempt })
})`
		],
		[
			n.program("UnendedSteps"),
			`query(${n.graph}).rule((r) => {
	const { root, step, scope } = v(${r("Step")}, "step")
	return r
		.match(${r("Step")}, { root, step, scope })
		.where(r.eq(root, ${rootParam}), r.eq(scope, ${scopeParam}), r.not(${r("Result")}, { root, step }), r.not(${r("Finish")}, { root, scope, step }))
		.find({ step })
})`
		],
		...(children
			? [
					[
						n.program("OpenChildren"),
						`query(${n.graph}).rule((r) => {
	const { root, scope, parent } = v(${r("Within")}, "within")
	const { step } = v(${r("Finish")}, "finish")
	return r
		.match(${r("Within")}, { root, scope, parent })
		.match(${r("Finish")}, { root, scope, step })
		.where(r.eq(root, ${rootParam}), r.eq(parent, ${scopeParam}), r.not(${r("Result")}, { root, step }))
		.find({ child: scope })
})`
					] as const
				]
			: []),
		[
			n.program("Finished"),
			`query(${n.graph}).rule((r) => {
	const { root, scope, step } = v(${r("Finish")}, "finish")
	return r.match(${r("Finish")}, { root, scope, step }).match(${r("Result")}, { root, step }).where(r.eq(root, ${rootParam}), r.eq(scope, ${scopeParam})).find({ step })
})`
		],
		[n.program("Pending"), shared.pending],
		[n.program("Requested"), shared.requested],
		[n.program("Running"), shared.running],
		...Arr.map(l.idle, (f) => [n.program(`Busy${f}`), shared.busy(f)] as const),
		...(Arr.isReadonlyArrayNonEmpty(l.idle)
			? [
					[
						n.program("Busy"),
						`query(${n.den}).reads({ ${commas(Arr.map(l.idle, (f) => `${busyName(f)}: ${shared.busy(f)}`))} })`
					] as const
				]
			: []),
		[n.program("Snapshot"), snapshotOf],
		...(Arr.isReadonlyArrayNonEmpty(awaiting)
			? [
					[
						n.program("AwaitingOf"),
						awaitingOf([`r.eq(root, ${rootParam})`, `r.eq(step, ${stepParam})`])
					] as const,
					[n.program("Ready"), readyOf] as const
				]
			: [])
	]
	const denValueReads = (v: ValueIR) => {
		Arr.forEach(
			[
				v.relation,
				...Arr.map(v.sidecars, (side) => side.relation),
				...Arr.flatMap(v.unions, (u) => Arr.map(u.variants, (vr) => vr.relation))
			],
			(rel) => denPrograms.push([n.program(`Read${rel}`), ownedBy(l, n.graph, rel, v.owner)])
		)
		Arr.forEach(v.families, (f) =>
			denPrograms.push([
				n.program(`Read${f.relation}`),
				ownedOf(n.graph, v, f.relation, familyFields(f))
			])
		)
	}
	Arr.forEach(l.steps, (s) => {
		denValueReads(s.input)
		Option.map(s.error, (e) =>
			denPrograms.push([
				n.program(`Fail${s.name}`),
				`ChangeSet.empty(${n.graph})${members([
					r("Result"),
					r("Failed"),
					r("Held"),
					...valueRelations(e),
					...Arr.map(s.reads, (rd) => rd.record)
				])}${recordsMembersOf(n.graph, s.reads)}`
			])
		)
	})
	Arr.forEach(l.joins, (j) => {
		denValueReads(j.input)
		Option.map(j.finish.error, (e) =>
			denPrograms.push([
				n.program(`Fail${j.finish.name}`),
				`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), ...valueRelations(e)])}`
			])
		)
		if (Option.isSome(j.root) && !isApp(j)) {
			const request = requestOfRoot(l, j, requestOver(j))
			denPrograms.push([
				n.program(`Request${j.name}`),
				`clocked(${request}, { ${denClock}: "millis" }, { ${denClock}: denInstantKey })`
			])
		}
		Arr.forEach(j.finish.reads, (read) => {
			/**
			 * The members a finish reads of a kind: the steps of a step kind in its scope, or the finishes of the child scopes
			 * of a scope kind under it, each by its step, bound by the finish's scope.
			 */
			const ofKind =
				read.kind === "step"
					? {
							bind: `const { root, step, scope } = v(${r("Step")}, "step")`,
							match: `.match(${r("Step")}, { root, step, kind: ${q(read.name)}, scope })`,
							owner: "scope"
						}
					: {
							bind: `const { root, scope, parent } = v(${r("Within")}, "within")
	const { step } = v(${r("Finish")}, "finish")`,
							match: `.match(${r("Within")}, { root, scope, parent, kind: ${q(read.name)} })
		.match(${r("Finish")}, { root, scope, step })`,
							owner: "parent"
						}
			/** A set read of the relation `relation` owned by `by`, the step or the scope it is keyed by, of `fields`, by step. */
			const ownedRows = (
				relation: string,
				by: ValueIR["owner"],
				fields: ReadonlyArray<string>,
				label: string
			): string => `query(${n.graph}).rule((r) => {
	${ofKind.bind}${
		Arr.isReadonlyArrayNonEmpty(fields)
			? `
	const { ${entries(fields)} } = v(${relation}, ${q(label)})`
			: ""
	}
	return r
		${ofKind.match}
		.match(${relation}, { ${entries(["root", by, ...fields])} })
		.where(r.eq(root, ${rootParam}), r.eq(${ofKind.owner}, ${scopeParam}))
		.find({ ${entries(["step", ...fields])} })
})`
			/**
			 * The set reads of every relation of `value`, the children's outputs or their inputs, under `stem`, its own
			 * relation's rows labelled `label`.
			 */
			const partsOf = (
				value: ValueIR,
				stem: string,
				label: string
			): ReadonlyArray<readonly [string, string]> => [
				[
					n.program(stem),
					ownedRows(
						value.relation,
						value.owner,
						[
							...Arr.map(value.shape.columns, (c) => c.name),
							...Arr.map(value.unions, (u) => u.field.name)
						],
						label
					)
				],
				...Arr.map(
					value.sidecars,
					(side) =>
						[
							n.program(`${stem}${Str.capitalize(side.column.name)}`),
							ownedRows(side.relation, value.owner, ["value"], "part")
						] as const
				),
				...Arr.map(
					value.families,
					(f) =>
						[
							n.program(`${stem}${Str.capitalize(f.field.name)}`),
							ownedRows(f.relation, value.owner, familyFields(f), "part")
						] as const
				),
				...Arr.flatMap(value.unions, (u) =>
					Arr.map(
						u.variants,
						(vr) =>
							[
								n.program(`${stem}${Str.capitalize(u.field.name)}${vr.variant.tag}`),
								ownedRows(
									vr.relation,
									value.owner,
									Arr.map(vr.variant.columns, (c) => c.name),
									"part"
								)
							] as const
					)
				)
			]
			const parts = [
				...partsOf(read.output, `Outputs${j.name}${read.name}`, "output"),
				...partsOf(read.input, `Inputs${j.name}${read.name}`, "input")
			]
			Arr.forEach(parts, (part) => denPrograms.push(part))
			denPrograms.push([
				n.program(`Failures${j.name}${read.name}`),
				`query(${n.graph}).rule((r) => {
	${ofKind.bind}
	return r
		${ofKind.match}
		.match(${r("Result")}, { root, step, outcome: "failed" })
		.where(r.eq(root, ${rootParam}), r.eq(${ofKind.owner}, ${scopeParam}))
		.find({ step })
})`
			])
		})
	})

	const coordinatorPrograms: Array<readonly [string, string]> = []
	const insertInto = (relation: string) =>
		`ChangeSet.empty(${n.coordination}).insert(${relation}, [])`
	if (has(r("Exclusive"))) {
		coordinatorPrograms.push(
			[n.program("HoldExclusive"), insertInto(r("Exclusive"))],
			[n.program("ReleaseExclusive"), insertInto(r("Released"))],
			[n.program("ExclusiveTurns"), latestOf(n.coordination, r("Exclusive"), ["kind", "key"])],
			[
				n.program("Exclusives"),
				liveOf(n.coordination, r("Exclusive"), r("Released"), ["kind", "key"], ["scope"])
			]
		)
	}
	coordinatorPrograms.push(
		[
			n.program("Promote"),
			`clocked(ChangeSet.empty(${n.coordination}).insert(${r("Served")}, query(${n.coordination}).rule((r) => r.find({ environment: r.param("environment", ${r("Served")}.fields.environment), at: r.param("${denClock}", ${r("Served")}.fields.at), deployment: r.param("deployment", ${r("Served")}.fields.deployment) }))), { ${denClock}: "millis" }, { ${denClock}: denInstantKey })`
		],
		[n.program("Pause"), insertInto(r("Paused"))],
		[n.program("Resume"), insertInto(r("Resumed"))],
		[n.program("PauseTurns"), latestOf(n.coordination, r("Paused"), ["target"])],
		[n.program("PausedAll"), liveOf(n.coordination, r("Paused"), r("Resumed"), ["target"], [])]
	)

	const commitPrograms: Array<readonly [string, string]> = [
		[
			n.program("Authenticated"),
			`clocked(query(${n.graph}).rule((r) => r.find({ now: r.param("${denClock}", DenInstant) })), { ${denClock}: "millis" }, { ${denClock}: denInstantKey })`
		]
	]
	/**
	 * A step's or a finish's commit: its result, its output, its reads' records, what its edges spawn (a step's in its
	 * own scope, a finish's in its scope's parent) and the app's writes, in one call.
	 */
	const committing = (
		name: string,
		output: ValueIR,
		records: ReadonlyArray<string>,
		edges: ReadonlyArray<EdgeIR>,
		commit: CommitIR,
		kind: string,
		reads: ReadonlyArray<ReadIR>
	) =>
		commitPrograms.push([
			n.program(`Commit${name}`),
			commitOf(
				n.graph,
				W,
				[
					r("Result"),
					r("Done"),
					r("Held"),
					...valueRelations(output),
					...records,
					...(Arr.isReadonlyArrayNonEmpty(edges)
						? Arr.filter(l.spawning, (rel) => rel !== r("Step"))
						: [])
				],
				Arr.isReadonlyArrayNonEmpty(edges)
					? Option.some(spawnedStepsOf(n.graph, r("Step"), timedKinds(l)))
					: Option.none(),
				commit,
				kind,
				recordsMembersOf(n.graph, reads)
			)
		])
	Arr.forEach(l.steps, (s) => {
		committing(
			s.name,
			s.output,
			Arr.map(s.reads, (rd) => rd.record),
			s.edges,
			s.writes,
			`declaredFlow.kinds[${s.index}]`,
			s.reads
		)
		if (Arr.isReadonlyArrayNonEmpty(s.reads)) {
			commitPrograms.push([
				n.program(`Read${s.name}`),
				`query(${W}).reads(declaredFlow.kinds[${s.index}].reads.named)`
			])
		}
	})
	Arr.forEach(l.joins, (j) =>
		committing(
			j.finish.name,
			j.finish.output,
			[],
			j.finish.edges,
			j.finish.writes,
			`declaredFlow.kinds[${j.index}].finish`,
			[]
		)
	)
	const appRoots = Arr.filter(l.joins, isApp)
	const requests = Arr.map(appRoots, (j) => `${j.name}: ${requestOfRoot(l, j, requestOver(j))}`)
	const requestWrites = Arr.map(
		appRoots,
		(j) => `${j.name}: [${commas(Arr.map(requestWritesOf(P, j), q))}] as const`
	)

	const block = (name: string, programs: ReadonlyArray<readonly [string, string]>) => [
		`export const ${name} = Object.freeze({`,
		...Arr.map(programs, ([member, program]) => `\t${member}: ${indented("\t")(program)},`),
		"})"
	]
	const body = lines([
		`/** den's role for the flow ${P}: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains${Option.isSome(l.seats) ? ", live holds" : ""}${Arr.isReadonlyArrayNonEmpty(derivedLevels) ? ", the levels its derived roots' reads are over, whole," : ""} and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */`,
		`export const ${n.den} = role(${app}, ${q(n.denName)}, { ${commas([`...${n.graph}.relations`, ...derivedLevels, ...l.coordination, ...liveEntry, ...idleEntries, ...awaitedEntries])} }, { insert: [${commas([...Arr.map(den, q), ...recordNames(l)])}] })`,
		"",
		`/** den's coordinator role for the flow ${P}: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */`,
		`export const ${n.coordinator} = role(${app}, ${q(n.coordinatorName)}, { ${commas([...rosterNames, ...l.coordination])} }, { insert: [${commas(Arr.map(l.coordination, q))}] })`,
		"",
		...Arr.flatMap(sharedDeclarations, ([name, program]) => [`const ${name} = ${program}`, ""]),
		...block(n.denPrograms, denPrograms),
		"",
		`export const ${n.denWorkload} = workload(${n.den}, ${n.denPrograms})`,
		"",
		...block(n.coordinatorPrograms, coordinatorPrograms),
		"",
		`export const ${n.coordinatorWorkload} = workload(${n.coordinator}, ${n.coordinatorPrograms})`,
		"",
		`/** den's retiring role for the flow ${P}: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */`,
		`export const ${n.retirer} = role(${app}, ${q(n.retirerName)}, { ...${n.graph}.relations }, { write: [${commas(Arr.map([...l.cleared, ...l.held], q))}] })`,
		"",
		`export const ${n.retirerPrograms} = Object.freeze({ ${n.program("Retire")}: ChangeSet.empty(${n.graph}).deleteWhere({ ${commas(Arr.map(l.cleared, (rel) => `${rel}: { root: param("root", ${r("Root")}.fields.root) }`))} }) })`,
		"",
		`export const ${n.retirerWorkload} = workload(${n.retirer}, ${n.retirerPrograms})`,
		"",
		`/** The commits and declared reads of the flow ${P}, over its app role ${W}, and a read of the database's instant that says the role's login is let in. */`,
		...block(n.commitPrograms, commitPrograms),
		"",
		`export const ${n.commitWorkload} = workload(${W}, ${n.commitPrograms})`,
		"",
		...(Arr.isReadonlyArrayNonEmpty(requests)
			? [
					`/** The requests of the flow's roots the app's own write starts, each a ChangeSet the app's write commits beside its own: over the flow's graph, unioned with it, or, for a root whose input derives from its key, over the app's schema, sequenced after the strata whose facts it derives from. */`,
					`export const ${n.requests} = Object.freeze({ ${commas(requests)} })`,
					"",
					`/** What each of the flow's requests inserts, by its root: a role whose write composes a request inserts these beside its write's own, and none of den's step commits; a role composing several of the flow's requests names each relation in its insert list once. */`,
					`export const ${n.requestWrites} = Object.freeze({ ${commas(requestWrites)} })`
				]
			: [])
	])
	const tokens = identifiersOf(body)
	const recordsNames = Arr.flatMap(l.steps, (st) => Arr.map(st.reads, (rd) => `${rd.stem}Records`))
	const imported = Arr.filter(
		[...rosterNames, ...allRelations, ...recordsNames, n.graph, n.coordination],
		(name) => tokens.has(name)
	)
	return `${lines([
		`/** The programs den lowered the flow ${P} to, over its fragments, and its roles over the schema ${app}; \`den generate\` writes them, and nothing edits them. */`,
		`import { ${commas(Arr.filter(["ChangeSet", "Num", "Type", "clocked", "param", "query", "recordsFacts", "role", "v", "workload"], (name) => tokens.has(name)))} } from "@bjornpagen/grizzle"`,
		`import { ${commas(Arr.filter(["DenDelay", "DenInstant", "denInstantKey"], (name) => tokens.has(name)))} } from "@bjornpagen/den/lower/keys"`,
		...(tokens.has("Arr") ? [`import { Array as Arr } from "effect"`] : []),
		...Arr.map(
			Rec.toEntries(Arr.groupBy([place.schema, place.writer], (exported) => exported.from)),
			([from, names]) =>
				`import { ${commas(
					Arr.sort(
						Arr.map(names, (exported) => exported.name),
						Order.String
					)
				)} } from ${q(from)}`
		),
		...(Arr.some(
			l.steps,
			(st) => Arr.isReadonlyArrayNonEmpty(st.reads) || st.writes.kind === "through"
		) || Arr.some(l.joins, (j) => j.finish.writes.kind === "through" || isDerived(j))
			? [`import { ${place.flow.name} as declaredFlow } from ${q(place.flow.from)}`]
			: []),
		`import { ${commas(imported)} } from ${q(place.fragment)}`,
		"",
		body
	])}\n`
}

/**
 * A value's facts for one owner `key` of the root `root` and value `x`, each relation beside its rows: its row, and a
 * row of each part it holds.
 */
const factRowsOf = (
	v: ValueIR,
	key: string,
	x: string,
	root: string
): ReadonlyArray<readonly [string, string]> => [
	[
		v.relation,
		`[{ ${commas([
			`${v.owner}: ${key}`,
			`root: ${root}`,
			...Arr.map(v.shape.columns, (c) => `${c.name}: ${hostValue(c.type, `${x}.${c.name}`)}`),
			...Arr.map(v.unions, (u) => `${u.field.name}: ${x}.${u.field.name}._tag`)
		])} }]`
	],
	...Arr.map(v.sidecars, (s): readonly [string, string] => [
		s.relation,
		`Option.toArray(Option.map(${x}.${s.column.name}, (value) => ({ ${v.owner}: ${key}, root: ${root}, value: ${hostValue(s.column.type, "value")} })))`
	]),
	...Arr.map(v.families, (f): readonly [string, string] => [
		f.relation,
		`Arr.map(${x}.${f.field.name}, (element, index) => ({ ${commas([
			`${v.owner}: ${key}`,
			`root: ${root}`,
			"ordinal: BigInt(index)",
			...(f.field.element.kind === "value"
				? [`value: ${hostValue(f.field.element.type, "element")}`]
				: Arr.map(
						f.field.element.columns,
						(c) => `${c.name}: ${hostValue(c.type, `element.${c.name}`)}`
					))
		])} }))`
	]),
	...Arr.flatMap(v.unions, (u) =>
		Arr.map(u.variants, (vr): readonly [string, string] => [
			vr.relation,
			`Arr.flatMap([${x}.${u.field.name}], (variant) => (variant._tag === ${q(vr.variant.tag)} ? [{ ${commas(
				[
					`${v.owner}: ${key}`,
					`root: ${root}`,
					...Arr.map(
						vr.variant.columns,
						(c) => `${c.name}: ${hostValue(c.type, `variant.${c.name}`)}`
					)
				]
			)} }] : []))`
		])
	)
]

/** A value's facts for one owner `key` of the root `root` and value `x`, as a facts record's entries (`factRowsOf`). */
const factsOf = (v: ValueIR, key: string, x: string, root: string): ReadonlyArray<string> =>
	Arr.map(factRowsOf(v, key, x, root), ([relation, rows]) => `${relation}: ${rows}`)

/** Where a value's parts are found as it is read: each option's row, each array's rows and each variant's row. */
interface Parts {
	readonly side: (index: number) => string
	readonly family: (index: number) => string
	readonly variant: (union: number, index: number) => string
}

/** A tagged union's value, as an Option: the variant `row`'s tag names, from the row its relation holds. */
const unionOf = (v: ValueIR, at: number, row: string, parts: Parts): string => {
	const u = Arr.getUnsafe(v.unions, at)
	const arm = (j: number): string => {
		const vr = Arr.getUnsafe(u.variants, j)
		const fields = commas([
			`_tag: ${q(vr.variant.tag)} as const`,
			...Arr.map(vr.variant.columns, (c) => `${c.name}: ${bodyValue(c.type, `part.${c.name}`)}`)
		])
		const mapped = `Option.map(${parts.variant(at, j)}, (${Arr.isReadonlyArrayNonEmpty(vr.variant.columns) ? "part" : ""}) => ({ ${fields} }))`
		return j === u.variants.length - 1
			? mapped
			: `${row}.${u.field.name} === ${q(vr.variant.tag)} ? ${mapped} : ${arm(j + 1)}`
	}
	return arm(0)
}

/**
 * The value of a row `row` of `v`, its parts found where `parts` says: an object, or, when it holds a tagged union, an
 * Option of one, none where a variant's row is missing.
 */
const valueOf = (v: ValueIR, row: string, parts: Parts): string => {
	const object = `({ ${commas([
		...Arr.map(v.shape.columns, (c) => `${c.name}: ${bodyValue(c.type, `${row}.${c.name}`)}`),
		...Arr.map(
			v.sidecars,
			(s, i) =>
				`${s.column.name}: Option.map(${parts.side(i)}, (o) => ${bodyValue(s.column.type, "o.value")})`
		),
		...Arr.map(
			v.families,
			(f, i) =>
				`${f.field.name}: Arr.map(ordered(${parts.family(i)}), (e) => ${
					f.field.element.kind === "value"
						? bodyValue(f.field.element.type, "e.value")
						: `({ ${commas(Arr.map(f.field.element.columns, (c) => `${c.name}: ${bodyValue(c.type, `e.${c.name}`)}`))} })`
				})`
		),
		...Arr.map(v.unions, (u) => `${u.field.name}: unions.${u.field.name}`)
	])} })`
	return Arr.isReadonlyArrayEmpty(v.unions)
		? object
		: `Option.map(Option.all({ ${commas(Arr.map(v.unions, (u, i) => `${u.field.name}: ${unionOf(v, i, row, parts)}`))} }), (unions) => ${object})`
}

/** The type of every column a value holds: its own, each option's, each array's elements' and each variant's. */
const columnTypesOf = (v: ValueIR): ReadonlyArray<ColumnType> => [
	...Arr.map(v.shape.columns, (c) => c.type),
	...Arr.map(v.sidecars, (sd) => sd.column.type),
	...Arr.flatMap(v.families, (f) =>
		f.field.element.kind === "value"
			? [f.field.element.type]
			: Arr.map(f.field.element.columns, (c) => c.type)
	),
	...Arr.flatMap(v.unions, (u) =>
		Arr.flatMap(u.variants, (vr) => Arr.map(vr.variant.columns, (c) => c.type))
	)
]

/** Whether a value holds a tagged union, so that reading it back answers an Option. */
const unioned = (v: ValueIR): boolean => Arr.isReadonlyArrayNonEmpty(v.unions)

/**
 * A query of a value's family or variant relation `relation`, of fields `fields` beside its owner, for the owner the
 * parameter of its key names.
 */
const ownedOf = (
	graph: string,
	v: ValueIR,
	relation: string,
	fields: ReadonlyArray<string>
): string => {
	const all = ["root", v.owner, ...fields]
	return `query(${graph}).rule((r) => {
	const { ${entries(all)} } = v(${relation}, "part")
	return r.match(${relation}, { ${entries(all)} }).where(r.eq(${bound("root")}, r.param("root", ${relation}.fields.root)), r.eq(${bound(v.owner)}, r.param(${q(v.owner)}, ${relation}.fields.${v.owner}))).find({ ${entries(all)} })
})`
}

/** A family's fields beside its owner: its ordinal and its element's columns. */
const familyFields = (f: ValueIR["families"][number]): ReadonlyArray<string> => [
	"ordinal",
	...(f.field.element.kind === "value"
		? ["value"]
		: Arr.map(f.field.element.columns, (c) => c.name))
]

/** The binding module: the ledger port over the programs' served handles. */
export const printBinding = (l: Lowered, place: Placement): string => {
	const n = naming(l)
	const P = l.prefix
	const F = place.flow.name
	const r = (s: string) => `${P}${s}`
	const kindAt = (index: number) => `${F}.kinds[${index}]`
	const edgeAt = (index: number) => `${F}.edges[${index}]`
	const spawning = Arr.filter(l.spawning, (rel) => rel !== r("Step"))
	const allRelations = Arr.map(l.relations, (rel) => rel.name)
	const has = (relation: string) => Arr.contains(allRelations, relation)
	const exclusiveKeys = has(r("ExclusiveKey"))
	const children = has(r("Within"))
	const rowsType = lines([
		"interface Rows {",
		...Arr.map(spawning, (rel) => `\treadonly ${rel}: ReadonlyArray<Addition<typeof ${rel}>>`),
		"}"
	])
	const noRows = `const noRows: Rows = { ${commas(Arr.map(spawning, (rel) => `${rel}: []`))} }`
	const joined = lines([
		"const joined = (a: Grown, b: Grown): Grown => ({",
		`\trows: { ${commas(Arr.map(spawning, (rel) => `${rel}: [...a.rows.${rel}, ...b.rows.${rel}]`))} },`,
		"\tsteps: [...a.steps, ...b.steps],",
		"\ttimed: [...a.timed, ...b.timed],",
		"\tspawned: { steps: [...a.spawned.steps, ...b.spawned.steps], finishes: [...a.spawned.finishes, ...b.spawned.finishes] }",
		"})"
	])
	/** A read of one row by its printed parameters, `params`, its root among them where the row is a graph body's. */
	const keyRead = (handle: string, params: string) =>
		`Effect.map(settled(h.den.${handle}.once({ params: ${params}, facts: {} })), one)`
	const readerOf = (v: ValueIR): string => `read${v.relation}`
	const readerDef = (v: ValueIR): string => {
		const body = lines([
			"Effect.gen(function* () {",
			`\tconst row = yield* ${keyRead(n.program(`Read${v.relation}`), `{ root, ${v.owner} }`)}`,
			...Arr.map(
				v.sidecars,
				(s, i) =>
					`\tconst side${i} = yield* ${keyRead(n.program(`Read${s.relation}`), `{ root, ${v.owner} }`)}`
			),
			...Arr.map(
				v.families,
				(f, i) =>
					`\tconst family${i} = yield* Effect.map(settled(h.den.${n.program(`Read${f.relation}`)}.once({ params: { root, ${v.owner} }, facts: {} })), rowsOf)`
			),
			...Arr.flatMap(v.unions, (u, i) =>
				Arr.map(
					u.variants,
					(vr, j) =>
						`\tconst variant${i}_${j} = yield* ${keyRead(n.program(`Read${vr.relation}`), `{ root, ${v.owner} }`)}`
				)
			),
			`\treturn Option.${unioned(v) ? "flatMap" : "map"}(row, (found) => ${valueOf(v, "found", {
				side: (i) => `side${i}`,
				family: (i) => `family${i}`,
				variant: (i, j) => `variant${i}_${j}`
			})})`,
			"})"
		])
		return `const ${readerOf(v)} = (root: Sha256, ${v.owner}: Sha256) => ${indented("\t")(body)}`
	}
	/**
	 * A child scope opened under `owner` with key `key` and input `input`, admitted in the same call: its Scope, Within,
	 * Admitted and Finish rows, its finish step, its input, its own start's children at every depth (`inner`), and its
	 * finish ready at once when it started nothing. `extra` adds the row that names how it was opened.
	 */
	const openedScope = (
		j: SpawnedScopeIR,
		key: string,
		input: string,
		owner: string,
		extra: string,
		root: string
	): string =>
		`pipe(start${j.name}(${root}, ${key}, ${input}), (inner): Grown => pipe(finishStep(${key}), (finish): Grown => joined(inner, { rows: { ...noRows, ${commas(
			[
				`${r("Scope")}: [{ scope: ${key}, root: ${root} }]`,
				`${r("Within")}: [{ scope: ${key}, parent: ${owner}, kind: ${q(j.name)}, root: ${root} }]`,
				`${r("Admitted")}: [{ scope: ${key}, root: ${root} }]`,
				`${r("Finish")}: [{ scope: ${key}, step: finish, root: ${root} }]`,
				extra,
				...factsOf(j.input, key, input, root)
			]
		)} }, steps: [{ step: finish, kind: ${q(j.finish)}, scope: ${key}, delay: atOnce }], timed: [], spawned: { steps: [], finishes: hasChildren(inner, ${key}) ? [] : [finish] } })))`

	/** A step spawned under `owner` with key `key` and input `input`: its Step, first due by its kind, its input, and `extra`. */
	const spawnedStep = (
		s: SpawnedStepIR,
		key: string,
		input: string,
		owner: string,
		extra: string,
		root: string
	): string =>
		`({ rows: { ...noRows, ${commas([extra, ...factsOf(s.input, key, input, root)])} }, ...spawnedOf({ step: ${key}, kind: ${q(s.name)}, scope: ${owner} }, dueOf(${kindAt(s.index)}.due, ${input})) })`

	const startOf = (j: JoinIR): string => {
		const cases = Arr.map(j.children, (child) =>
			child.kind === "step"
				? `return pipe(startedStep(scope, ordinal), (key): Grown => ${spawnedStep(child, "key", "spawn.input", "scope", `${r("StartStep")}: [{ scope, ordinal: BigInt(ordinal), step: key, root }]`, "root")})`
				: `return pipe(startedScope(scope, ordinal), (key): Grown => ${openedScope(child, "key", "spawn.input", "scope", `${r("StartScope")}: [{ scope, ordinal: BigInt(ordinal), child: key, root }]`, "root")})`
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
		return lines([
			`const start${j.name} = (root: Sha256, scope: Sha256, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0]): Grown =>`,
			`\tArr.reduce(Arr.map(${kindAt(j.index)}.start(input), (spawn, ordinal): Grown => ${single ? "" : "{"}`,
			...body,
			`\t${single ? "" : "}"}), nothingGrown, joined)`
		])
	}

	/**
	 * A committed node as an edge reads it, each an expression of the commit: the step it leaves from (a step, or a
	 * finish), the input and output its edges' `next` takes, the scope what it spawns lives in (a step's own, a finish's
	 * parent) and its root.
	 */
	interface Node {
		readonly step: string
		readonly input: string
		readonly output: string
		readonly owner: string
		readonly root: string
	}

	const edgeGrowth = (e: EdgeIR, from: Node): string => {
		const fact = `${e.relation}: [{ from: ${from.step}, ordinal: BigInt(ordinal), to: key, root: ${from.root} }]`
		const each =
			e.to.kind === "step"
				? `pipe(edgeStep(${from.step}, ${q(e.name)}, ordinal), (key): Grown => ${spawnedStep(e.to, "key", "input", from.owner, fact, from.root)})`
				: `pipe(edgeScope(${from.step}, ${q(e.name)}, ordinal), (key): Grown => ${openedScope(e.to, "key", "input", from.owner, fact, from.root)})`
		return `Arr.reduce(Arr.map(${edgeAt(e.index)}.next(${from.input}, ${from.output}), (input, ordinal): Grown => ${each}), nothingGrown, joined)`
	}

	/**
	 * A commit port: what its edges spawn from `from`, then its result, its output, `records` and, for a kind that commits
	 * through the app's ChangeSet, that ChangeSet's parameters and facts, in one call, answering what it spawned.
	 */
	const commitPort = (
		name: string,
		output: ValueIR,
		edges: ReadonlyArray<EdgeIR>,
		commit: CommitIR,
		records: Recording,
		from: Node
	): string => {
		const grow = Arr.isReadonlyArrayNonEmpty(edges)
			? `Arr.reduce([${commas(Arr.map(edges, (e) => edgeGrowth(e, from)))}], nothingGrown, joined)`
			: "nothingGrown"
		return lines([
			"commit: (done) => Effect.gen(function* () {",
			`\tconst grown = ${grow}`,
			...records.lines,
			`\tconst outcome = yield* settled(h.commits.${n.program(`Commit${name}`)}.once({ params: ${commitParamsOf(edges, commit)}, facts: ${commitFactsOf(
				[
					...(Arr.isReadonlyArrayNonEmpty(edges) ? ["...grown.rows"] : []),
					`${r("Result")}: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }]`,
					`${r("Done")}: [{ step: done.turn.step, root: done.turn.root }]`,
					`${r("Held")}: [{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }]`,
					...factsOf(output, "done.turn.step", "done.output", "done.turn.root"),
					...records.facts
				],
				commit
			)} }))`,
			"\treturn { outcome, spawned: grown.spawned }",
			"})"
		])
	}

	/** A commit's parameters: den's own, its spawns' steps and root, and its ChangeSet's, which its body returned. */
	const commitParamsOf = (edges: ReadonlyArray<EdgeIR>, commit: CommitIR): string =>
		`{ ${commas([
			...(Arr.isReadonlyArrayNonEmpty(edges)
				? [
						"steps: grown.steps",
						...(timedKinds(l) ? ["timed: grown.timed"] : []),
						"root: done.turn.root"
					]
				: []),
			...(commit.kind === "through" ? ["...done.writes.params"] : [])
		])} }`

	/** A commit's facts: den's inserts, and its ChangeSet's facts, which its body returned, op by op. */
	const commitFactsOf = (inserts: ReadonlyArray<string>, commit: CommitIR): string =>
		commit.kind === "through"
			? `committedFacts({ insert: { ${commas(inserts)} } }, done.writes.facts)`
			: `{ insert: { ${commas(inserts)} } }`

	/**
	 * What a step's commit records of its reads, from the rows `found` names and the turn `turn` names: each row's digest
	 * computed first, from its text (grizzle's rowText of the read's query); then each row once, under its digest alone,
	 * into the records grizzle made of the query (recordsFacts, its attachments' rows with it), a row already stored by
	 * any root no change; and the step's reference to each in the order it found them, under its root.
	 */
	const recordingOf = (s: StepIR, found: string, turn: string): Recording => ({
		lines: Arr.flatMap(s.reads, (rd) => [
			`\tconst recorded${Str.capitalize(rd.name)} = yield* Effect.forEach(${found}.${rd.name}, (row) => Effect.map(${rd.stem}Text(row), (text) => ({ row, digest: rowDigest(${q(rd.name)}, text) })))`,
			`\tconst unique${Str.capitalize(rd.name)} = Arr.dedupeWith(recorded${Str.capitalize(rd.name)}, (a, b) => Sha256.equals(a.digest, b.digest))`
		]),
		facts: Arr.flatMap(s.reads, (rd) => [
			`...recordsFacts(${n.graph}, ${rd.stem}Records)(Arr.map(unique${Str.capitalize(rd.name)}, (found) => [{ digest: found.digest }, found.row] as const))`,
			`${rd.record}: Arr.map(recorded${Str.capitalize(rd.name)}, (found, ordinal) => ({ step: ${turn}.step, root: ${turn}.root, ordinal: BigInt(ordinal), digest: found.digest }))`
		])
	})

	const failPort = (name: string, error: Option.Option<ValueIR>, records: Recording): string =>
		Option.match(error, {
			onNone: () => "fail: (failed) => Effect.die(failed.error)",
			onSome: (e) =>
				`fail: (failed) => Effect.gen(function* () {\n${lines(records.lines)}\n\treturn yield* settled(h.den.${n.program(`Fail${name}`)}.once({ params: {}, facts: { insert: { ${commas(
					[
						`${r("Result")}: [{ step: failed.turn.step, root: failed.turn.root, outcome: "failed" }]`,
						`${r("Failed")}: [{ step: failed.turn.step, root: failed.turn.root }]`,
						`${r("Held")}: [{ step: failed.turn.step, root: failed.turn.root, attempt: failed.turn.attempt }]`,
						...factsOf(e, "failed.turn.step", "failed.error", "failed.turn.root"),
						...records.facts
					]
				)} } } }))\n})`
		})

	const stepRunner = (s: StepIR): string => {
		const read = Arr.isReadonlyArrayNonEmpty(s.reads)
			? `read: (input) => Effect.flatMap(settled(h.commits.${n.program(`Read${s.name}`)}.once({ params: ${kindAt(s.index)}.reads.params(input), facts: {} })), only)`
			: "read: () => Effect.succeed({})"
		return lines([
			`runnerOf(${kindAt(s.index)}, {`,
			`\tinput: ({ root, step }) => ${readerOf(s.input)}(root, step),`,
			`\t${read},`,
			`\t${indented("\t")(
				commitPort(s.name, s.output, s.edges, s.writes, recordingOf(s, "done.rows", "done.turn"), {
					step: "done.turn.step",
					input: "done.input",
					output: "done.output",
					owner: "done.turn.scope",
					root: "done.turn.root"
				})
			)},`,
			`\t${failPort(s.name, s.error, recordingOf(s, "failed.rows", "failed.turn"))}`,
			"}, Option.none())"
		])
	}

	const finishRunner = (j: JoinIR): string => {
		const reads = Arr.map(j.finish.reads, (read) => {
			const all = (name: string, program: string) =>
				`\t\tconst ${name} = yield* Effect.map(settled(h.den.${n.program(program)}.once({ params: { root, scope }, facts: {} })), rowsOf)`
			/** The set reads of every relation of `value`, under `stem`, each into a constant named from `at`. */
			const loaded = (value: ValueIR, stem: string, at: string): ReadonlyArray<string> => [
				all(`${at}Rows`, stem),
				...Arr.map(value.sidecars, (s, i) =>
					all(`${at}Side${i}`, `${stem}${Str.capitalize(s.column.name)}`)
				),
				...Arr.map(value.families, (f, i) =>
					all(`${at}Family${i}`, `${stem}${Str.capitalize(f.field.name)}`)
				),
				...Arr.flatMap(value.unions, (u, i) =>
					Arr.map(u.variants, (vr, k) =>
						all(`${at}Variant${i}_${k}`, `${stem}${Str.capitalize(u.field.name)}${vr.variant.tag}`)
					)
				)
			]
			/** The value of the child whose step `row` names, from the set reads `loaded` named from `at`. */
			const valueAt = (value: ValueIR, at: string): string =>
				valueOf(value, "row", {
					side: (i) => `Arr.findFirst(${at}Side${i}, (o) => Sha256.equals(o.step, row.step))`,
					family: (i) => `Arr.filter(${at}Family${i}, (o) => Sha256.equals(o.step, row.step))`,
					variant: (i, k) =>
						`Arr.findFirst(${at}Variant${i}_${k}, (o) => Sha256.equals(o.step, row.step))`
				})
			/** A row of `value`, named only where its value reads it: a value of no field reads none. */
			const rowOf = (value: ValueIR): string =>
				Arr.isReadonlyArrayEmpty(value.shape.columns) &&
				Arr.isReadonlyArrayEmpty(value.sidecars) &&
				Arr.isReadonlyArrayEmpty(value.families) &&
				!unioned(value)
					? ""
					: "row"
			const output = read.output
			const input = read.input
			const out = `output${read.name}`
			const inp = `input${read.name}`
			const outputValue = unioned(output)
				? `held(${valueAt(output, out)})`
				: `Effect.succeed(${valueAt(output, out)})`
			return lines([
				...loaded(output, `Outputs${j.name}${read.name}`, out),
				...loaded(input, `Inputs${j.name}${read.name}`, inp),
				all(`failures${read.name}`, `Failures${j.name}${read.name}`),
				`\t\tconst ${inp} = (child: (typeof ${inp}Rows)[number]["step"]) => held(Option.${unioned(input) ? "flatMap" : "map"}(Arr.findFirst(${inp}Rows, (row) => Sha256.equals(row.step, child)), (${rowOf(input)}) => ${valueAt(input, inp)}))`,
				`\t\tconst ${read.name} = [`,
				`\t\t\t...(yield* Effect.forEach(${out}Rows, (row) => Effect.map(Effect.all({ input: ${inp}(row.step), output: ${outputValue} }), (ended) => ({ _tag: "Done" as const, ...ended })))),`,
				`\t\t\t...(yield* Effect.forEach(failures${read.name}, (failed) => Effect.map(${inp}(failed.step), (given) => ({ _tag: "Failed" as const, input: given }))))`,
				"\t\t]"
			])
		})
		const kind = kindAt(j.index)
		/** A finish whose scope kind edges leave spawns them in its scope's parent, which it reads with its input. */
		const spawns = Arr.isReadonlyArrayNonEmpty(j.finish.edges)
		return lines([
			"runnerOf(",
			"\t{",
			`\t\tname: ${q(j.finish.name)},`,
			`\t\tuses: ${kind}.finish.uses,`,
			`\t\tretry: ${kind}.finish.retry,`,
			`\t\twaits: ${kind}.finish.waits,`,
			"\t\tawaits: [],",
			`\t\tbody: (read: { readonly input: Parameters<(typeof ${kind})["start"]>[0]; readonly endings: Parameters<(typeof ${kind})["finish"]["body"]>[1]${spawns ? "; readonly parent: Sha256" : ""} }) => ${kind}.finish.body(read.input, read.endings)`,
			"\t},",
			"\t{",
			"\t\tinput: ({ root, step }) => Effect.gen(function* () {",
			`\t\tconst located = yield* Effect.map(settled(h.den.${n.program("StepOf")}.once({ params: { root, step }, facts: {} })), one)`,
			"\t\tif (Option.isNone(located)) {",
			"\t\t\treturn Option.none()",
			"\t\t}",
			"\t\tconst scope = located.value.scope",
			`\t\tconst input = yield* ${readerOf(j.input)}(root, scope)`,
			"\t\tif (Option.isNone(input)) {",
			"\t\t\treturn Option.none()",
			"\t\t}",
			...(spawns
				? [
						`\t\tconst within = yield* ${keyRead(n.program("WithinOf"), "{ root, scope }")}`,
						"\t\tif (Option.isNone(within)) {",
						"\t\t\treturn Option.none()",
						"\t\t}"
					]
				: []),
			...reads,
			`\t\treturn Option.some({ input: input.value, endings: { ${commas(Arr.map(j.finish.reads, (read) => read.name))} }${spawns ? ", parent: within.value.parent" : ""} })`,
			"\t}),",
			"\t\tread: () => Effect.succeed([]),",
			`\t\t${indented("\t\t")(
				commitPort(j.finish.name, j.finish.output, j.finish.edges, j.finish.writes, unrecorded, {
					step: "done.turn.step",
					input: "done.input.input",
					output: "done.output",
					owner: "done.input.parent",
					root: "done.turn.root"
				})
			)},`,
			`\t\t${failPort(j.finish.name, j.finish.error, unrecorded)}`,
			"\t},",
			`\tOption.some(${q(j.name)})`,
			")"
		])
	}

	const admitOf = (j: JoinIR): string =>
		lines([
			"(scope: Sha256) => Effect.gen(function* () {",
			`\tconst input = yield* ${readerOf(j.input)}(scope, scope)`,
			"\tif (Option.isNone(input)) {",
			"\t\treturn Option.none()",
			"\t}",
			`\tconst grown = start${j.name}(scope, scope, input.value)`,
			"\tconst finish = finishStep(scope)",
			`\tconst steps: Grown["steps"] = [...grown.steps, { step: finish, kind: ${q(j.finish.name)}, scope, delay: atOnce }]`,
			`\tconst admitted: ReadonlyArray<Addition<typeof ${r("Admitted")}>> = [...grown.rows.${r("Admitted")}, { scope, root: scope }]`,
			`\tconst finishes: ReadonlyArray<Addition<typeof ${r("Finish")}>> = [...grown.rows.${r("Finish")}, { scope, step: finish, root: scope }]`,
			`\tconst outcome = yield* settled(h.den.${n.program("Admit")}.once({ params: { steps, ${timedKinds(l) ? "timed: grown.timed, " : ""}root: scope }, facts: { insert: { ${commas(
				[
					...Arr.map(
						Arr.filter(
							spawning,
							(rel) =>
								!Arr.some(l.edges, (e) => e.relation === rel) &&
								!Arr.contains([r("Admitted"), r("Finish")], rel)
						),
						(rel) => `${rel}: grown.rows.${rel}`
					),
					`${r("Admitted")}: admitted`,
					`${r("Finish")}: finishes`
				]
			)} } } }))`,
			"\treturn Option.some({ outcome, spawned: { steps: grown.spawned.steps, finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])] } })",
			"})"
		])

	const roots = Arr.filter(l.joins, (j) => Option.isSome(j.root))
	/**
	 * The rows a root's request names (`requestedRowsOf`), each relation's under its relation parameter, a derived
	 * root's key's fields, each its own parameter, and, for a root whose input its request gives, what it is requested
	 * with (`RequestedWith`): its kind's input fingerprint and its input's digest.
	 */
	const requestRows = (j: JoinIR): ReadonlyArray<string> => [
		...Arr.map(
			requestedRowsOf(P, j),
			([relation, rows]) => `${requestedRowsParam(P, j, relation)}: ${rows}`
		),
		...Arr.map(keyFieldsOf(j), (f) => `${keyParamName(P, j, f)}: key.${f}`),
		...(recordsRequest(j)
			? [
					`${requestedRowsParam(P, j, r("RequestedWith"))}: Option.toArray(Option.map(codecTextsOf(${inputTextsOf(l, j)}), (texts) => ({ root: scope, fingerprint: ${lower1(P)}${j.name}Heading, input: inputDigest(${q(P)}, ${q(j.name)}, texts) })))`
				]
			: [])
	]
	const requestOf = (j: JoinIR): string => {
		const derivedKind = isDerived(j)
		/** What names the root's exclusivity seat: its given input, or a derived root's key. */
		const seatOf = derivedKind ? "key" : "input"
		const keys = (body: string) =>
			isExclusive(j)
				? `pipe(exclusiveRows(${q(P)}, ${q(j.name)}, ${kindAt(j.index)}.exclusive, ${seatOf}, scope), (keys) => ${body})`
				: body
		const signature = derivedKind
			? `(key: Extract<(typeof ${kindAt(j.index)})["from"], { readonly kind: "derived" }>["key"]["Type"])`
			: `(key: string, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0])`
		const names = requestParams(P, j)
		/** The root's idempotency key: a given root's as its request names it, a derived root's its key's text. */
		const keyText = derivedKind ? "keyText" : "key"
		const params = `{ ${commas([`${names.scope}: scope`, `${names.key}: ${keyText}`, ...requestRows(j)])} }`
		const requested = `({ flow: FlowName.make(${q(P)}), scope, params: ${params} })`
		const body = isApp(j)
			? keys(requested)
			: keys(
					`pipe(h.den.${n.program(`Request${j.name}`)}.once({ params: ${params}, facts: {} }), settled, fresh, Effect.map((accepted) => ({ flow: FlowName.make(${q(P)}), scope, fresh: accepted })))`
				)
		const scoped = `pipe(rootScope(${q(P)}, ${q(j.name)}, ${keyText}), (scope) => ${body})`
		return derivedKind
			? `${j.name}: ${signature} => pipe(derivedKey([${commas(Arr.map(keyFieldsOf(j), q))}], key), (keyText) => ${scoped})`
			: `${j.name}: ${signature} => ${scoped}`
	}
	const denRoots = Arr.filter(roots, (j) => !isApp(j))
	const appRoots = Arr.filter(roots, isApp)

	const scoped = (name: string) => `(typeof ${name})["handles"][number]`
	const handleOf = (roster: string) =>
		`(name: string): Option.Option<${scoped(roster)}> => Arr.findFirst(${roster}.handles, (handle) => handle === name)`
	const resources = has(r("Hold"))
	const exclusives = has(r("Exclusive"))
	/** The step kinds that await a fact. */
	const awaitingKinds = Arr.filter(l.steps, (s) => Arr.isReadonlyArrayNonEmpty(s.awaits))
	const call = (program: string, input: string) =>
		`settled(h.coordinator.${n.program(program)}.once(${input}))`
	const read = (program: string, row: string) =>
		`Effect.map(${call(program, "{ params: {}, facts: {} }")}, (rows) => Arr.map(rowsOf(rows), (row) => (${row})))`
	const write = (program: string, facts: string) =>
		`Effect.asVoid(${call(program, `{ params: {}, facts: { insert: { ${facts} } } }`)})`
	const pauseChains = lines([
		`{`,
		`\tflow: FlowName.make(${q(P)}),`,
		`\tturns: ${read("PauseTurns", "{ target: row.target, turn: row.turn }")},`,
		`\tlive: ${read("PausedAll", "{ target: row.target, turn: row.turn }")},`,
		`\tpause: (row) => ${write("Pause", `${r("Paused")}: [row]`)},`,
		`\tresume: (row) => ${write("Resume", `${r("Resumed")}: [row]`)}`,
		"}"
	])
	const coordination = lines([
		"{",
		exclusives
			? `\texclusiveTurns: ${read("ExclusiveTurns", "{ kind: row.kind, key: row.key, turn: row.turn }")},`
			: "\texclusiveTurns: Effect.succeed([]),",
		exclusives
			? `\texclusives: ${read("Exclusives", "{ kind: row.kind, key: row.key, turn: row.turn, scope: row.scope }")},`
			: "\texclusives: Effect.succeed([]),",
		"\tpaused: pauseChains.live,",
		exclusives
			? `\tholdExclusive: (row) => ${write("HoldExclusive", `${r("Exclusive")}: Arr.flatMap(exclusiveTurnsOf([row]), (turn) => [{ ...turn, scope: row.scope }])`)},`
			: "\tholdExclusive: () => Effect.void,",
		exclusives
			? `\treleaseExclusive: (rows) => ${write("ReleaseExclusive", `${r("Released")}: exclusiveTurnsOf(rows)`)},`
			: "\treleaseExclusive: () => Effect.void,",
		"\tpause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),",
		"\tresume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))",
		"}"
	])
	const snapshot = lines([
		`Effect.flatMap(settled(h.den.${n.program("Snapshot")}.once({ params: {}, facts: {} })), (rows) => Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof ${F}>> => {`,
		"\tconst view = (scope: Sha256, admission: Admission): ReadonlyArray<ScopeView> =>",
		"\t\tOption.match(Arr.findFirst(read.roots, (o) => Sha256.equals(o.scope, scope)), {",
		`\t\t\tonSome: (o): ReadonlyArray<ScopeView> => [{ place: "root", scope, kind: o.kind, key: o.key, at: o.at, admission, exclusive: ${exclusiveKeys ? "Option.map(Arr.findFirst(read.keys, (k) => Sha256.equals(k.scope, scope)), (k) => k.id)" : "Option.none()"}, runner: roots[o.kind] }],`,
		children
			? '\t\t\tonNone: () => Arr.map(Option.toArray(Arr.findFirst(read.withins, (w) => Sha256.equals(w.scope, scope))), (w): ScopeView => ({ place: "child", scope, kind: w.kind, parent: w.parent }))'
			: "\t\t\tonNone: (): ReadonlyArray<ScopeView> => []",
		"\t\t})",
		"\treturn {",
		"\t\tsteps: Arr.map(read.steps, (s) => ({ step: s.step, root: s.root, runner: runners[s.kind], scope: s.scope, due: s.due })),",
		"\t\tclaims: read.claims,",
		"\t\tretries: read.retries,",
		"\t\tfenced: read.fenced,",
		'\t\tscopes: [...Arr.flatMap(read.requested, (s) => view(s.scope, "requested")), ...Arr.flatMap(read.running, (s) => view(s.scope, "admitted"))],',
		`\t\tholds: ${resources ? "read.holds" : "[]"},`,
		`\t\texclusives: ${exclusives ? "read.exclusives" : "[]"},`,
		"\t\tpaused: Arr.map(read.paused, (row) => row.target),",
		`\t\tbusy: ${Arr.isReadonlyArrayNonEmpty(l.idle) ? "busyOf(read)" : "[]"},`,
		`\t\tawaiting: ${Arr.isReadonlyArrayNonEmpty(awaitingKinds) ? "Arr.map(read.awaiting, (row) => row.step)" : "[]"}`,
		"\t}",
		"}))"
	])
	const watched = [
		`signals(h.den.${n.program("Pending")}.watch({ params: {}, facts: {} }))`,
		`signals(h.den.${n.program("Requested")}.watch({ params: {}, facts: {} }))`,
		`signals(h.den.${n.program("Running")}.watch({ params: {}, facts: {} }))`,
		...(resources ? [`signals(h.den.${n.program("Holds")}.watch({ params: {}, facts: {} }))`] : []),
		...(exclusives
			? [`signals(h.coordinator.${n.program("Exclusives")}.watch({ params: {}, facts: {} }))`]
			: []),
		`signals(h.coordinator.${n.program("PausedAll")}.watch({ params: {}, facts: {} }))`,
		...Arr.map(
			l.idle,
			(f) => `signals(h.den.${n.program(`Busy${f}`)}.watch({ params: {}, facts: {} }))`
		),
		...(Arr.isReadonlyArrayNonEmpty(awaitingKinds)
			? [`signals(h.den.${n.program("Ready")}.watch({ params: {}, facts: {} }))`]
			: [])
	]
	const busyFlows = Arr.isReadonlyArrayNonEmpty(l.idle)
		? `Effect.flatMap(settled(h.den.${n.program("Busy")}.once({ params: {}, facts: {} })), (rows) => Effect.map(only(rows), busyOf))`
		: "Effect.succeed([])"
	const busyOf = `const busyOf = (read: { ${commas(Arr.map(l.idle, (f) => `readonly ${busyName(f)}: ReadonlyArray<unknown>`))} }): ReadonlyArray<string> => Arr.filter([${commas(Arr.map(l.idle, q))}] as const, (flow) => Arr.isReadonlyArrayNonEmpty(read[\`${BUSY}\${flow}\`]))`
	const recordsValues = Arr.flatMap(l.steps, (st) => Arr.map(st.reads, (rd) => `${rd.stem}Records`))
	/**
	 * The input relations whose fields a request's digest reads (`inputTextsOf`): a root's whose input its request
	 * gives.
	 */
	const digestedRelations = Arr.dedupe(
		Arr.flatMap(Arr.filter(roots, recordsRequest), (j: JoinIR) =>
			Arr.filter(valueRelations(j.input), (relation) =>
				Arr.isReadonlyArrayNonEmpty(inputFieldsOf(l, relation))
			)
		)
	)
	const fragmentValues = Arr.dedupe([
		...Arr.map(l.brands, (b) => brandMint(b.name)),
		...boundRostersOf(l),
		...recordsValues,
		...(Arr.isReadonlyArrayNonEmpty(recordsValues) ? [n.graph] : []),
		...digestedRelations
	])
	/** The contract columns of the flow's values, each converted where it crosses between a body and grizzle. */
	const contracted = Arr.filter(
		Arr.flatMap(
			[
				...Arr.flatMap(l.steps, (st) => [st.input, st.output, ...Option.toArray(st.error)]),
				...Arr.flatMap(l.joins, (j) => [
					j.input,
					j.finish.output,
					...Option.toArray(j.finish.error)
				])
			],
			columnTypesOf
		),
		(t) => t.kind === "brand" || t.kind === "den"
	)
	const fragmentImports = Arr.dedupe([...spawning, r("Kind"), r("RootKind"), ...fragmentValues])
	const fragmentTypes = Arr.filter(fragmentImports, (name) => !Arr.contains(fragmentValues, name))
	const valueReaders = [...Arr.map(l.steps, (s) => s.input), ...Arr.map(l.joins, (j) => j.input)]
	const finishValues = Arr.flatMap(l.joins, (j) =>
		Arr.flatMap(j.finish.reads, (ended) => [ended.input, ended.output])
	)
	/** Whether a step or a finish commits through the app's ChangeSet, whose facts `committedFacts` joins to den's. */
	const throughs =
		Arr.some(l.steps, (st) => st.writes.kind === "through") ||
		Arr.some(l.joins, (j) => j.finish.writes.kind === "through")
	/** Whether a finish reads endings, each found with its child's input, which `held` finds. */
	const finishReads = Arr.isReadonlyArrayNonEmpty(finishValues)
	const families = Arr.some([...valueReaders, ...finishValues], (v) =>
		Arr.isReadonlyArrayNonEmpty(v.families)
	)
	const identity = Arr.dedupe([
		...(Arr.some(l.edges, (e) => e.to.kind === "scope") ? ["edgeScope"] : []),
		...(Arr.some(l.edges, (e) => e.to.kind === "step") ? ["edgeStep"] : []),
		"atOnce",
		"finishStep",
		...(Arr.some(roots, isScheduled) ? ["type Instant"] : []),
		"rootScope",
		...(Arr.some(roots, recordsRequest) ? ["codecTextsOf", "inputDigest", "inputFingerprint"] : []),
		...(Arr.some(l.steps, (st) => Arr.isReadonlyArrayNonEmpty(st.reads)) ? ["rowDigest"] : []),
		...(Arr.some(l.joins, (j) => Arr.some(j.children, (c) => c.kind === "scope"))
			? ["startedScope"]
			: []),
		...(Arr.some(l.joins, (j) => Arr.some(j.children, (c) => c.kind === "step"))
			? ["startedStep"]
			: [])
	])
	return `${lines([
		`/** The ledger port of the flow ${P} over its served programs; \`den generate\` writes it, and nothing edits it. */`,
		`import { ${commas(["type Addition", ...(Arr.isReadonlyArrayNonEmpty(recordsValues) ? ["recordsFacts"] : []), "Sha256"])} } from "@bjornpagen/grizzle"`,
		...(Arr.isReadonlyArrayNonEmpty(digestedRelations)
			? [`import { codecText } from "@bjornpagen/grizzle/compile"`]
			: []),
		`import type { MemberHandle } from "@bjornpagen/grizzle/runtime"`,
		`import { ${commas(["any", ...(throughs ? ["committedFacts"] : []), ...(Arr.some(roots, isDerived) ? ["derivedKey"] : []), "dueOf", ...(exclusiveKeys ? ["exclusiveRows"] : []), ...(Arr.isReadonlyArrayNonEmpty(denRoots) ? ["fresh"] : []), ...(finishReads ? ["held"] : []), "one", "only", ...(families ? ["ordered"] : []), "readingOf", ...(Arr.isReadonlyArrayNonEmpty(recordsValues) ? ["recordText"] : []), "rowsOf", "signals", "spawnedOf", "type SpawnRows"])} } from "@bjornpagen/den/runtime/bind"`,
		`import { ${commas(identity)} } from "@bjornpagen/den/runtime/identity"`,
		`import type { ${commas(["FlowNeeds", ...(exclusives ? ["ExclusiveTurn"] : []), "Admission", "Ledger", "RootRunner", "ScopeView", ...(resources ? ["SeatAt"] : []), "Snapshot", "Spawned"])} } from "@bjornpagen/den/runtime/ledger"`,
		`import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"`,
		`import { type PauseChains, pauseIn, resumeIn } from "@bjornpagen/den/runtime/seats"`,
		`import { settled } from "@bjornpagen/den/runtime/settled"`,
		`import { runnerOf } from "@bjornpagen/den/runtime/turn"`,
		`import { FlowName } from "@bjornpagen/den/transport"`,
		`import { ${commas(["mintEnvironment", ...(Arr.some(contracted, (t) => t.kind === "den" && t.contract === "DenInstant") ? ["mintInstant"] : [])])} } from "@bjornpagen/den/lower/keys"`,
		`import { ${commas(["Array as Arr", ...(Arr.isReadonlyArrayNonEmpty(contracted) ? ["Brand"] : []), "Effect", "Option", "pipe", ...(Arr.some(roots, recordsRequest) ? ["Result"] : []), "Stream"])} } from "effect"`,
		`import { ${F} } from ${q(place.flow.from)}`,
		`import { ${commas(fragmentValues)} } from ${q(place.fragment)}`,
		`import type { ${commas(fragmentTypes)} } from ${q(place.fragment)}`,
		`import type { ${commas([n.denPrograms, n.coordinatorPrograms, n.retirerPrograms, n.commitPrograms])} } from ${q(place.programs)}`,
		"",
		...Arr.flatMap(l.steps, (st) =>
			Arr.map(
				st.reads,
				(rd) =>
					`/** The text of a row step ${st.name}'s read \`${rd.name}\` found, its digest's input. */\nconst ${rd.stem}Text = recordText(${kindAt(st.index)}.reads.named.${rd.name})`
			)
		),
		...Arr.map(
			digestedRelations,
			(relation) =>
				`/** The codec text of each declared field of ${relation}, a request's input row, bound once (grizzle's codecText). */\nconst ${lower1(relation)}Texts = Object.freeze({ ${commas(Arr.map(inputFieldsOf(l, relation), (f) => `${f}: codecText(${relation}.fields.${f})`))} })`
		),
		...Arr.map(
			Arr.filter(roots, recordsRequest),
			(j) =>
				`/** The fingerprint of root kind ${j.name}'s input heading, taken once. */\nconst ${lower1(P)}${j.name}Heading = inputFingerprint(${q(inputHeadingOf(l, j))})`
		),
		"",
		`/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */`,
		`export interface ${n.handles} {`,
		`\treadonly den: { readonly [K in keyof typeof ${n.denPrograms}]: MemberHandle<(typeof ${n.denPrograms})[K]> }`,
		`\treadonly coordinator: { readonly [K in keyof typeof ${n.coordinatorPrograms}]: MemberHandle<(typeof ${n.coordinatorPrograms})[K]> }`,
		`\treadonly retirer: { readonly [K in keyof typeof ${n.retirerPrograms}]: MemberHandle<(typeof ${n.retirerPrograms})[K]> }`,
		`\treadonly commits: { readonly [K in keyof typeof ${n.commitPrograms}]: MemberHandle<(typeof ${n.commitPrograms})[K]> }`,
		"}",
		"",
		rowsType,
		"",
		`/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */`,
		`interface Grown extends SpawnRows<${scoped(r("Kind"))}> {`,
		"\treadonly rows: Rows",
		"\treadonly spawned: Spawned",
		"}",
		"",
		...(exclusives ? [`const rootKindOf = ${handleOf(r("RootKind"))}`] : []),
		`const pausableOf = (target: string): Effect.Effect<${scoped(r("Pausable"))}, UnknownPauseTarget> => Effect.mapError(Effect.fromOption(Arr.findFirst(${r("Pausable")}.handles, (handle) => handle === target)), () => new UnknownPauseTarget({ flow: FlowName.make(${q(P)}), target }))`,
		...(resources ? [`const resourceOf = ${handleOf(r("Resource"))}`] : []),
		...(resources
			? [
					`const holdsOf = (seats: ReadonlyArray<SeatAt>) => Arr.flatMap(seats, (taken) => Option.toArray(Option.map(resourceOf(taken.resource), (resource) => ({ resource, seat: taken.seat }))))`
				]
			: []),
		...(exclusives
			? [
					`const exclusiveTurnsOf = (turns: ReadonlyArray<ExclusiveTurn>) => Arr.flatMap(turns, (turn) => Option.toArray(Option.map(rootKindOf(turn.kind), (kind) => ({ kind, key: turn.key, turn: turn.turn }))))`
				]
			: []),
		"",
		...(Arr.isReadonlyArrayNonEmpty(appRoots)
			? [
					`/** Each app root's request as a host names it, by the root: the flow, the root's scope, and the parameters of its printed request (\`${n.requests}\`), which the app's write commits beside its own and rings once committed, with no ledger opened. */`,
					`export const ${n.appRequests} = Object.freeze({ ${commas(Arr.map(appRoots, requestOf))} })`,
					""
				]
			: []),
		`/** The ledger of the flow ${P} over its handles, with the requests of the roots den requests. */`,
		`export const ${n.ledger} = (h: ${n.handles}) => {`,
		`\t${noRows}`,
		"\tconst nothingGrown: Grown = { rows: noRows, steps: [], timed: [], spawned: { steps: [], finishes: [] } }",
		`\tconst hasChildren = (grown: Grown, scope: Sha256): boolean => ${Arr.join(
			Arr.map(
				[r("StartStep"), ...(children ? [r("StartScope")] : [])],
				(started) => `Arr.some(grown.rows.${started}, (s) => Sha256.equals(s.scope, scope))`
			),
			" || "
		)}`,
		`\t${indented("\t")(joined)}`,
		...Arr.map(l.joins, (j) => `\t${indented("\t")(startOf(j))}`),
		...Arr.map(valueReaders, (v) => `\t${indented("\t")(readerDef(v))}`),
		`\tconst pauseChains: PauseChains<${scoped(r("Pausable"))}> = ${indented("\t")(pauseChains)}`,
		`\tconst coordination: Ledger<never>["coordination"] = ${indented("\t")(coordination)}`,
		...(Arr.isReadonlyArrayNonEmpty(l.idle) ? [`\t${busyOf}`] : []),
		`\tconst request = { ${commas(Arr.map(denRoots, requestOf))} }`,
		"\tconst runners = {",
		...Arr.map(l.steps, (s) => `\t\t${s.name}: ${indented("\t\t")(stepRunner(s))},`),
		...Arr.map(l.joins, (j) => `\t\t${j.finish.name}: ${indented("\t\t")(finishRunner(j))},`),
		"\t}",
		`\tconst roots: { readonly [K in ${scoped(r("RootKind"))}]: RootRunner } = {`,
		...Arr.map(
			roots,
			(j) =>
				`\t\t${j.name}: { window: ${kindAt(j.index)}.window, precondition: ${kindAt(j.index)}.precondition, admit: ${indented("\t\t")(admitOf(j))} },`
		),
		"\t}",
		`\tconst ledger: Ledger<FlowNeeds<typeof ${F}>> = {`,
		`\t\tflow: FlowName.make(${q(P)}),`,
		`\t\tnow: Effect.flatMap(settled(h.den.${n.program("Now")}.once({ params: {}, facts: {} })), readingOf),`,
		`\t\treading: (environment) => Effect.flatMap(settled(h.den.${n.program("Reading")}.once({ params: { "serving.environment": mintEnvironment(environment) }, facts: {} })), (rows) => Effect.flatMap(only(rows), (row) => Effect.map(readingOf(row.now), (now) => ({ now, serving: Option.map(Arr.head(row.serving), (served) => served.deployment) })))),`,
		`\t\tpromote: (host) => Effect.asVoid(settled(h.coordinator.${n.program("Promote")}.once({ params: { environment: mintEnvironment(host.environment), deployment: host.deployment }, facts: {} }))),`,
		`\t\tauthenticated: Effect.asVoid(settled(h.commits.${n.program("Authenticated")}.once({ params: {}, facts: {} }))),`,
		resources
			? `\t\tholds: Effect.map(settled(h.den.${n.program("Holds")}.once({ params: {}, facts: {} })), rowsOf),`
			: "\t\tholds: Effect.succeed([]),",
		`\t\tstepOf: (at) => Effect.map(settled(h.den.${n.program("StepOf")}.once({ params: { root: at.root, step: at.step }, facts: {} })), (rows) => Option.map(one(rows), (row) => ({ runner: runners[row.kind], scope: row.scope, due: row.due }))),`,
		`\t\tresultOf: (at) => Effect.map(settled(h.den.${n.program("ResultOf")}.once({ params: { root: at.root, step: at.step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.outcome)),`,
		`\t\theldOf: (at) => Effect.map(settled(h.den.${n.program("HeldOf")}.once({ params: { root: at.root, step: at.step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.attempt)),`,
		`\t\tclaimsOf: (at) => Effect.map(settled(h.den.${n.program("ClaimsOf")}.once({ params: { root: at.root, step: at.step }, facts: {} })), rowsOf),`,
		`\t\tretriesOf: (at) => Effect.map(settled(h.den.${n.program("RetriesOf")}.once({ params: { root: at.root, step: at.step }, facts: {} })), rowsOf),`,
		`\t\tfencedOf: (at) => Effect.map(settled(h.den.${n.program("FencedOf")}.once({ params: { root: at.root, step: at.step }, facts: {} })), rowsOf),`,
		"\t\tscopeOf: ({ root, scope }) => Effect.gen(function* () {",
		"\t\t\tif (!Sha256.equals(root, scope)) {",
		...(children
			? [
					`\t\t\t\tconst within = yield* ${keyRead(n.program("WithinOf"), "{ root, scope }")}`,
					'\t\t\t\treturn Option.map(within, (w): ScopeView => ({ place: "child", scope, kind: w.kind, parent: w.parent }))'
				]
			: ["\t\t\t\treturn Option.none()"]),
		"\t\t\t}",
		`\t\t\tconst standing = yield* ${keyRead(n.program("RootOf"), "{ root }")}`,
		"\t\t\tif (Option.isNone(standing)) {",
		"\t\t\t\treturn Option.none()",
		"\t\t\t}",
		`\t\t\tconst admitted = yield* ${keyRead(n.program("AdmittedOf"), "{ root, scope }")}`,
		`\t\t\tconst skipped = yield* ${keyRead(n.program("SkippedOf"), "{ root, scope }")}`,
		...(exclusiveKeys
			? [`\t\t\tconst key = yield* ${keyRead(n.program("ExclusiveKeyOf"), "{ root, scope }")}`]
			: []),
		'\t\t\tconst admission: Admission = Option.isSome(admitted) ? "admitted" : Option.isSome(skipped) ? "skipped" : "requested"',
		`\t\t\treturn Option.some<ScopeView>({ place: "root", scope, kind: standing.value.kind, key: standing.value.key, at: standing.value.at, admission, exclusive: ${exclusiveKeys ? "Option.map(key, (k) => k.id)" : "Option.none()"}, runner: roots[standing.value.kind] })`,
		"\t\t}),",
		children
			? `\t\tunended: ({ root, scope }) => Effect.flatMap(h.den.${n.program("UnendedSteps")}.once({ params: { root, scope }, facts: {} }).pipe(settled, any), (steps) => steps ? Effect.succeed(true) : h.den.${n.program("OpenChildren")}.once({ params: { root, scope }, facts: {} }).pipe(settled, any)),`
			: `\t\tunended: ({ root, scope }) => h.den.${n.program("UnendedSteps")}.once({ params: { root, scope }, facts: {} }).pipe(settled, any),`,
		`\t\tfinished: ({ root, scope }) => h.den.${n.program("Finished")}.once({ params: { root, scope }, facts: {} }).pipe(settled, any),`,
		`\t\tbusy: ${indented("\t\t")(busyFlows)},`,
		`\t\tawaits: [${commas(Arr.map(l.awaited, q))}],`,
		Arr.isReadonlyArrayNonEmpty(awaitingKinds)
			? `\t\tawaiting: ({ root, step }) => h.den.${n.program("AwaitingOf")}.once({ params: { root, step }, facts: {} }).pipe(settled, any),`
			: "\t\tawaiting: () => Effect.succeed(false),",
		Arr.isReadonlyArrayNonEmpty(awaitingKinds)
			? `\t\tready: Effect.map(settled(h.den.${n.program("Ready")}.once({ params: {}, facts: {} })), (rows) => Arr.map(rowsOf(rows), (row) => ({ root: row.root, step: row.step }))),`
			: "\t\tready: Effect.succeed([]),",
		resources
			? `\t\tclaim: (row) => Effect.flatMap(settled(h.den.${n.program("Claim")}.once({ params: { budget: row.budget }, facts: { insert: { ${r("Claim")}: [{ step: row.step, root: row.root, holds: holdsOf(row.seats) }], ${r("Ended")}: row.lapsed } } })), (outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)),`
			: `\t\tclaim: (row) => Effect.flatMap(settled(h.den.${n.program("Claim")}.once({ params: { budget: row.budget }, facts: { insert: { ${r("Claim")}: [{ step: row.step, root: row.root }], ${r("Ended")}: row.lapsed } } })), (outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)),`,
		`\t\tretry: (row) => settled(h.den.${n.program("Retry")}.once({ params: { step: row.step, attempt: row.attempt, delay: row.delay, why: row.why, root: row.root }, facts: { insert: { ${r("Ended")}: [{ step: row.step, root: row.root, attempt: row.attempt }] } } })),`,
		`\t\tfence: (row) => settled(h.den.${n.program("Fence")}.once({ params: {}, facts: { insert: { ${r("Ended")}: [{ step: row.step, root: row.root, attempt: row.attempt }], ${r("Fenced")}: [row] } } })),`,
		`\t\trefuse: ({ step, root, attempt }, law) => settled(h.den.${n.program("Refuse")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, root, outcome: "failed" }], ${r("Failed")}: [{ step, root }], ${r("Held")}: [{ step, root, attempt }], ${r("Refusal")}: [{ step, root, law }] } } })),`,
		`\t\tskip: (scope, by) => settled(h.den.${n.program("Skip")}.once({ params: {}, facts: { insert: { ${r("Skipped")}: [{ scope, by, root: scope }] } } })),`,
		`\t\texhaust: ({ step, root, attempt }) => settled(h.den.${n.program("Exhaust")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, root, outcome: "failed" }], ${r("Failed")}: [{ step, root }], ${r("Held")}: [{ step, root, attempt }], ${r("Exhausted")}: [{ step, root }] } } })),`,
		`\t\tfinishedRoots: Effect.map(settled(h.den.${n.program("FinishedRoots")}.once({ params: {}, facts: {} })), (rows) => Arr.map(rowsOf(rows), (row) => row.scope)),`,
		`\t\tretire: (root) => settled(h.retirer.${n.program("Retire")}.once({ params: { root }, facts: {} })),`,
		`\t\tsnapshot: ${indented("\t\t")(snapshot)},`,
		`\t\tchanges: Stream.mergeAll([${commas(watched)}], { concurrency: "unbounded" }),`,
		"\t\tcoordination,",
		`\t\tscheduled: [${commas(
			Arr.map(
				Arr.filter(denRoots, isScheduled),
				(j) =>
					`{ kind: ${q(j.name)}, cron: ${kindAt(j.index)}.trigger.cron, request: (at: Instant) => Effect.forEach(${kindAt(j.index)}.trigger.members, (member) => request.${j.name}({ at, member })) }`
			)
		)}]`,
		"\t}",
		"\treturn {",
		"\t\tledger,",
		"\t\trequest",
		"\t}",
		"}"
	])}\n`
}
