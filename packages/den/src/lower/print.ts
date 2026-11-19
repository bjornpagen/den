import { regex } from "arkregex"
import { Array as Arr, Option, Order, String as Str } from "effect"
import {
	type CountsIR,
	type EdgeIR,
	type FieldType,
	type JoinIR,
	type LawIR,
	type Lowered,
	type ReadIR,
	type SideIR,
	type StepIR,
	type ValueIR,
	valueRelations,
	type WritesIR
} from "#lower/fragment.ts"
import type { Base } from "#lower/schema.ts"

/**
 * The printer: a lowered flow as three TypeScript modules the app commits beside its schema, which `den generate`
 * writes and which compile with the app's own code.
 *
 * - the fragment: rosters, contracts and relations, and two grizzle fragments the app lists in its `schema(...)`, the
 *   flow's graph and its coordination group, each with its laws, beside the den relations the flow's app role inserts
 *   into to commit its steps;
 * - the programs: den's role's and its coordinator role's programs over those fragments, the roles over the app's
 *   schema that hold them whole and serve them, and the commits, requests and declared reads over the flow's app role;
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
		case "retirement":
			return "retirement"
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
					return `check(${q(law.name)}, ${law.relation}, (row) => Compute.isFinite(row.${law.field}))`
			}
		case "retirable":
			return `retirable(${law.header}, [${commas(Arr.map(law.bodies, (b) => `on(${b}, "root")`))}])`
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
	return [
		...(Arr.some(l.laws, (law) => law.kind === "check" && law.holds.kind === "finite")
			? ["Compute"]
			: []),
		...(seated || Arr.some(l.laws, (law) => law.kind === "check") ? ["check"] : []),
		"closed",
		...(used("closed") ? ["closedId"] : []),
		"contained",
		...(Arr.isReadonlyArrayNonEmpty(l.brands) ? ["contract"] : []),
		...(seated ? ["derived"] : []),
		"fragment",
		"key",
		...(used("natural") ? ["natural"] : []),
		"on",
		...(base("bigint") || base("double") || base("boolean") ? ["pg"] : []),
		...(Arr.some(sides, (sd) => Arr.some(sd.terms, (t) => t.pred)) ? ["pred"] : []),
		...(seated ? ["query"] : []),
		...(Arr.some(l.laws, (law) => law.kind === "race") ? ["race"] : []),
		"relation",
		...(Arr.some(l.laws, (law) => law.kind === "retirable") ? ["retirable"] : []),
		...(used("retirement") ? ["retirement"] : []),
		...(Arr.some(sides, (sd) => sd.selection.kind !== "all") ? ["select"] : []),
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
		...Arr.flatMap(l.steps, (s) => Arr.map(s.reads, (r) => r.record)),
		...(anySpawn ? l.spawning : []),
		...(appRoots ? l.requesting : [])
	])
}

/** An identifier of a printed module's text, for the names the module uses. */
const IDENTIFIER = regex("[A-Za-z_$][A-Za-z0-9_$]*", "g")

/** Every identifier of a module's text. */
const identifiersOf = (text: string): ReadonlySet<string> =>
	new Set(Arr.map(Arr.fromIterable(Str.matchAll(IDENTIFIER)(text)), (found) => found[0]))

/**
 * The rosters the binding reads by value: the root kinds an exclusivity seat names, the pausable targets, and the
 * resources.
 */
const boundRostersOf = (l: Lowered): ReadonlyArray<string> => {
	const relations = Arr.map(l.relations, (rel) => rel.name)
	const r = (s: string) => `${l.prefix}${s}`
	return [
		...(Arr.contains(relations, r("Exclusive")) ? [r("Join")] : []),
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
		case "retirable":
			return [law.header, ...law.bodies]
	}
}

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
	const reads = l.read
	const writer = writerRelationsOf(l)
	const rosterNames = Arr.map(l.rosters, (r) => r.name)
	const seats = Option.toArray(l.seats)
	const counts = Arr.map(seats, (st) => st.counts)
	const countNames = Arr.map(counts, (c) => c.name)
	const coordination = new Set([...l.coordination, ...countNames])
	const graphRelations = Arr.filter(
		Arr.map(l.relations, (r) => r.name),
		(r) => !coordination.has(r)
	)
	const coordinating = (law: LawIR) => Arr.every(lawRelations(law), (r) => coordination.has(r))
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
			(r) =>
				`export const ${r.name} = closed.unordered(${q(r.name)}, [${commas(Arr.map(r.handles, q))}])`
		),
		...Arr.map(counts, countsExpr),
		"",
		...Arr.map(
			l.relations,
			(r) =>
				`export const ${r.name} = relation(${q(r.name)}, { ${commas(
					Arr.map(r.fields, (f) => `${f.name}: ${fieldExpr(f.type)}`)
				)} }, [${commas(Arr.map(r.key, q))}])`
		),
		"",
		`/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role \`${l.writer}\` hold whole. */`,
		`export const ${n.graph} = fragment([${commas([...rosterNames, ...graphRelations])}], [${commas(
			Arr.map(
				Arr.filter(l.laws, (law) => !coordinating(law)),
				lawExpr
			)
		)}])`,
		"",
		`/** The flow's coordination group: its rosters, its seat counts, and its chains of holds, exclusivity seats and pauses, which den's coordinator role holds whole. */`,
		`export const ${n.coordination} = fragment([${commas([...rosterNames, ...countNames, ...l.coordination])}], [${commas(
			Arr.map(Arr.filter(l.laws, coordinating), lawExpr)
		)}])`,
		"",
		...Arr.flatMap(seats, (st) => [
			`/** The flow's live holds: each hold whose turn no free ended, which the coordinator role reads as the seats' holders. */`,
			`const ${st.live} = derived(${q(st.live)}, ${liveOf(n.coordination, st.hold, st.freed, ["resource", "seat"], ["holder", "until"])})`,
			"",
			`/** The flow's seat level: its live holds, each held below its resource's count. A fragment declares no derived relation, so the schema that lists \`${n.coordination}\` states these on a level over itself, \`schema.extend(listing, name, [...${n.seatLevel}.relations], [...${n.seatLevel}.laws])\`. */`,
			`export const ${n.seatLevel} = { relations: [${st.live}], laws: [check(${q(st.bound)}, ${st.live}, (row) => row.lt(row.seat, ${st.counts.name}.at(${q(st.counts.count)}, row.${st.counts.key.field})))] } as const`,
			""
		]),
		`/** The den relations the flow's app role \`${l.writer}\` inserts into: each step's commit's, and each app root's request's. */`,
		`export const ${n.writerInserts} = [${commas(Arr.map(writer, q))}] as const`
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
 * A query over `role` of the rows of `relation` whose field `owner` the parameter of its name holds, every field but a
 * root's retirement, which only grizzle's hold and retirement read: a body's key holds its root beside its owner, so
 * a read by its owner alone is a query, served by the key's index, whose leading field it is.
 */
const ownedBy = (l: Lowered, role: string, relation: string, owner: string): string => {
	const fields = Option.match(
		Arr.findFirst(l.relations, (rel) => rel.name === relation),
		{
			onNone: (): ReadonlyArray<string> => [],
			onSome: (rel) =>
				Arr.filter(
					Arr.map(rel.fields, (f) => f.name),
					(f) => f !== "retired"
				)
		}
	)
	return `query(${role}).rule((r) => {
	const { ${commas(fields)} } = v(${relation}, ${q(lower1(relation))})
	return r.match(${relation}, { ${commas(fields)} }).where(r.eq(${owner}, r.param(${q(owner)}, ${relation}.fields.${owner}))).find({ ${commas(fields)} })
})`
}

/** A query over `role` of each chain's latest turn in `held`: `r.max(turn)`, grouped by its coordinates. */
const latestOf = (role: string, held: string, coordinates: ReadonlyArray<string>): string =>
	`query(${role}).rule((r) => {
	const { ${commas([...coordinates, "turn"])} } = v(${held}, ${q(lower1(held))})
	return r.match(${held}, { ${commas([...coordinates, "turn"])} }).find({ ${commas([...coordinates, "turn: r.max(turn)"])} })
})`

/** A hold's fields, as the live holds find them. */
const seatFields = ["resource", "seat", "turn", "holder", "until"] as const

/** A query over `role` of each chain's live turn: every turn of `held` that no row of `ended` ends. */
const liveOf = (
	role: string,
	held: string,
	ended: string,
	coordinates: ReadonlyArray<string>,
	payload: ReadonlyArray<string>
): string => {
	const fields = commas([...coordinates, "turn", ...payload])
	return `query(${role}).rule((r) => {
	const { ${fields} } = v(${held}, ${q(lower1(held))})
	return r.match(${held}, { ${fields} }).where(r.not(${ended}, { ${commas([...coordinates, "turn"])} })).find({ ${fields} })
})`
}

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

/**
 * A step's or a finish's commit: den's facts, a ChangeSet over the flow's graph, and, when it writes any, the app's own
 * writes over its app role, unioned so both commit in one call.
 */
const commitOf = (
	graph: string,
	writer: string,
	inserts: ReadonlyArray<string>,
	app: WritesIR,
	appRef: string
): string => {
	const den = `ChangeSet.empty(${graph})${members(inserts, none, appRef)}`
	return Arr.isReadonlyArrayEmpty(app.insert) &&
		Arr.isReadonlyArrayEmpty(app.put) &&
		Arr.isReadonlyArrayEmpty(app.delete)
		? den
		: `ChangeSet.union(${den}, ChangeSet.empty(${writer})${members([], app, appRef)})`
}

/** The parameters a step's read takes from its input, each by the name it has inside the read's own query. */
const paramsOf = (rd: ReadIR): ReadonlyArray<string> =>
	rd.kind === "nearest" ? [...rd.by, ...Arr.map(rd.anchor.key, (k) => `anchor.${k}`)] : rd.by

/**
 * A step's declared read over the app's schema, under its app role `writer`: the rows of the relation whose fields `by`
 * equal the parameters of their names, or, for a nearest read, those rows scored by the cosine distance of their
 * vector to the vector of the anchor's row its whole key names, each key field the parameter `anchor.<field>`, and
 * searched by `approximateNearest`, delivered without the vector and with their distance.
 */
const readOf = (rd: ReadIR, app: string, writer: string): string => {
	const rel = `${app}.relations.${rd.relation}`
	const by = Arr.map(rd.by, (f) => `r.eq(${f}, r.param(${q(f)}, ${rel}.fields.${f}))`)
	if (rd.kind === "rows") {
		return `query(${writer}).rule((r) => {
	const { ${commas(rd.fields)} } = v(${rel}, "row")
	return r
		.match(${rel}, { ${commas(rd.fields)} })${
			Arr.isReadonlyArrayNonEmpty(by)
				? `
		.where(${commas(by)})`
				: ""
		}
		.find({ ${commas(rd.fields)} })
})`
	}
	const anchored = `${app}.relations.${rd.anchor.relation}`
	const keyed = Arr.map(
		rd.anchor.key,
		(k) => `r.eq(anchor.${k}, r.param(${q(`anchor.${k}`)}, ${anchored}.fields.${k}))`
	)
	return `query(${writer})
	.rule((r) => {
		const { ${commas([...rd.fields, rd.vector])} } = v(${rel}, "row")
		const anchor = v(${anchored}, "anchor")
		return r
			.match(${anchored}, { ${commas([...Arr.map(rd.anchor.key, (k) => `${k}: anchor.${k}`), `${rd.anchor.vector}: anchor.${rd.anchor.vector}`])} })
			.match(${rel}, { ${commas([...rd.fields, rd.vector])} })
			.where(${commas([...keyed, ...by])})
			.find({ ${commas([...rd.fields, `distance: Compute.cosineDistance(${rd.vector}, anchor.${rd.anchor.vector})`])} })
	})
	.approximateNearest({ by: "distance", take: ${rd.take} })`
}

/**
 * A step's declared reads as one read, grizzle's record of named queries: one statement, so every read a step declares
 * sees one snapshot and what it records describes one moment of the database. Each read's parameters are its own
 * under its name, `<read>.<parameter>`.
 */
const readsOf = (reads: readonly [ReadIR, ...Array<ReadIR>], app: string, writer: string): string =>
	`query(${writer}).reads({ ${commas(Arr.map(reads, (rd) => `${rd.name}: ${readOf(rd, app, writer)}`))} })`

/**
 * The programs module: den's programs over the flow's graph and coordination fragments, the roles over the app's
 * schema that hold them whole and serve them, each commit's union of den's facts with the app's writes, each app root's
 * request over the graph, which the app unions with its own write, and the declared reads over the flow's app role.
 */
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
	const denPrograms: Array<readonly [string, string]> = [
		[
			n.program("Now"),
			`clocked(query(${n.graph}).rule((r) => r.find({ now: r.param("now", DenInstant) })), { now: "millis" })`
		],
		[
			n.program("Claim"),
			`ChangeSet.empty(${n.graph})
	.insert(${r("Claim")}, [])
	.read("held", (delta) =>
		query(${n.graph})
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
		[n.program("Retry"), `ChangeSet.empty(${n.graph}).insert(${r("Retry")}, [])`],
		[n.program("Fence"), `ChangeSet.empty(${n.graph}).insert(${r("Fenced")}, [])`],
		[
			n.program("Refuse"),
			`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), r("Refusal")], none, app)}`
		],
		[
			n.program("Exhaust"),
			`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), r("Exhausted")], none, app)}`
		],
		[n.program("Admit"), `ChangeSet.empty(${n.graph})${members(admittingOf(l), none, app)}`],
		[n.program("Skip"), `ChangeSet.empty(${n.graph}).insert(${r("Skipped")}, [])`],
		[n.program("SkippedOf"), ownedBy(l, n.graph, r("Skipped"), "scope")],
		[n.program("StepOf"), ownedBy(l, n.graph, r("Step"), "step")],
		[n.program("ResultOf"), ownedBy(l, n.graph, r("Result"), "step")],
		[n.program("HeldOf"), ownedBy(l, n.graph, r("Held"), "step")],
		[n.program("DueOf"), ownedBy(l, n.graph, r("Due"), "step")],
		[n.program("ScopeOf"), ownedBy(l, n.graph, r("Scope"), "scope")],
		[n.program("WithinOf"), ownedBy(l, n.graph, r("Within"), "scope")],
		[n.program("AdmittedOf"), ownedBy(l, n.graph, r("Admitted"), "scope")],
		[n.program("RootOf"), ownedBy(l, n.graph, r("Root"), "scope")],
		...(exclusiveKeys
			? [[n.program("ExclusiveKeyOf"), ownedBy(l, n.graph, r("ExclusiveKey"), "scope")] as const]
			: []),
		[
			n.program("FinishedRoots"),
			deferred(`query(${n.graph})
	.rule((r) => {
		const { scope, key, at } = v(${r("Root")}, "root")
		const { kind } = v(${r("Scope")}, "scope")
		const { step } = v(${r("Finish")}, "finish")
		return r
			.match(${r("Root")}, { scope, key, at })
			.match(${r("Scope")}, { scope, kind })
			.match(${r("Finish")}, { scope, step })
			.match(${r("Result")}, { step })
			.find({ scope, kind, at })
	})
	.rule((r) => {
		const { scope, key, at } = v(${r("Root")}, "root")
		const { kind } = v(${r("Scope")}, "scope")
		return r.match(${r("Root")}, { scope, key, at }).match(${r("Scope")}, { scope, kind }).match(${r("Skipped")}, { scope }).find({ scope, kind, at })
	})`)
		],
		[
			n.program("ClaimsOf"),
			`query(${n.graph}).rule((r) => {
	const { step, attempt, holder, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, holder, until }).where(r.eq(step, ${stepParam})).find({ step, attempt, holder, until })
})`
		],
		[
			n.program("RetriesOf"),
			`query(${n.graph}).rule((r) => {
	const { step, attempt, at, spent } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { step, attempt, at, spent }).where(r.eq(step, ${stepParam})).find({ step, attempt, at, spent })
})`
		],
		[
			n.program("FencedOf"),
			`query(${n.graph}).rule((r) => {
	const { step, attempt } = v(${r("Fenced")}, "fenced")
	return r.match(${r("Fenced")}, { step, attempt }).where(r.eq(step, ${stepParam})).find({ step, attempt })
})`
		],
		[
			n.program("UnendedSteps"),
			`query(${n.graph}).rule((r) => {
	const { step, scope } = v(${r("Step")}, "step")
	return r
		.match(${r("Step")}, { step, scope })
		.where(r.eq(scope, ${scopeParam}), r.not(${r("Result")}, { step }), r.not(${r("Finish")}, { scope, step }))
		.find({ step })
})`
		],
		[
			n.program("OpenChildren"),
			`query(${n.graph})
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
			`query(${n.graph}).rule((r) => {
	const { scope, step } = v(${r("Finish")}, "finish")
	return r.match(${r("Finish")}, { scope, step }).match(${r("Result")}, { step }).where(r.eq(scope, ${scopeParam})).find({ step })
})`
		],
		[
			n.program("Pending"),
			deferred(`query(${n.graph}).rule((r) => {
	const { step, kind, scope } = v(${r("Step")}, "step")
	return r.match(${r("Step")}, { step, kind, scope }).where(r.not(${r("Result")}, { step })).find({ step, kind, scope })
})`)
		],
		[
			n.program("PendingClaims"),
			deferred(`query(${n.graph}).rule((r) => {
	const { step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, until }).where(r.not(${r("Result")}, { step })).find({ step, attempt, until })
})`)
		],
		[
			n.program("PendingRetries"),
			deferred(`query(${n.graph}).rule((r) => {
	const { step, attempt, at, spent } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { step, attempt, at, spent }).where(r.not(${r("Result")}, { step })).find({ step, attempt, at, spent })
})`)
		],
		[
			n.program("PendingFenced"),
			deferred(`query(${n.graph}).rule((r) => {
	const { step, attempt } = v(${r("Fenced")}, "fenced")
	return r.match(${r("Fenced")}, { step, attempt }).where(r.not(${r("Result")}, { step })).find({ step, attempt })
})`)
		],
		[
			n.program("PendingDues"),
			deferred(`query(${n.graph}).rule((r) => {
	const { step, at } = v(${r("Due")}, "due")
	return r.match(${r("Due")}, { step, at }).where(r.not(${r("Result")}, { step })).find({ step, at })
})`)
		],
		[
			n.program("Requested"),
			deferred(`query(${n.graph}).rule((r) => {
	const { scope, kind } = v(${r("Scope")}, "scope")
	return r.match(${r("Scope")}, { scope, kind }).where(r.not(${r("Admitted")}, { scope }), r.not(${r("Skipped")}, { scope })).find({ scope, kind })
})`)
		],
		[
			n.program("Running"),
			deferred(`query(${n.graph}).rule((r) => {
	const { scope, kind } = v(${r("Scope")}, "scope")
	const { step } = v(${r("Finish")}, "finish")
	return r.match(${r("Scope")}, { scope, kind }).match(${r("Finish")}, { scope, step }).where(r.not(${r("Result")}, { step })).find({ scope, kind })
})`)
		],
		[n.program("Withins"), deferred(allOf(n.graph, r("Within"), ["scope", "parent"]))],
		[n.program("Roots"), deferred(allOf(n.graph, r("Root"), ["scope", "key", "at"]))],
		...(exclusiveKeys
			? [
					[
						n.program("ExclusiveKeys"),
						deferred(allOf(n.graph, r("ExclusiveKey"), ["scope", "key", "id"]))
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
				`ChangeSet.empty(${n.graph})${members(
					[
						r("Result"),
						r("Failed"),
						r("Held"),
						...valueRelations(e),
						...Arr.map(s.reads, (rd) => rd.record)
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
				`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), ...valueRelations(e)], none, app)}`
			])
		)
		if (Option.isSome(j.root) && !isApp(j)) {
			denPrograms.push([
				n.program(`Request${j.name}`),
				`ChangeSet.empty(${n.graph})${members(
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
					`query(${n.graph}).rule((r) => {
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
			const output = read.output
			const outputsOf = (
				relation: string,
				fields: ReadonlyArray<string>,
				label: string
			): string => `query(${n.graph}).rule((r) => {
	const { step, scope } = v(${r("Step")}, "step")${
		Arr.isReadonlyArrayNonEmpty(fields)
			? `
	const { ${commas(fields)} } = v(${relation}, ${q(label)})`
			: ""
	}
	return r
		.match(${r("Step")}, { step, kind: ${q(read.name)}, scope })
		.match(${relation}, { ${commas(["step", ...fields])} })
		.where(r.eq(scope, ${scopeParam}))
		.find({ ${commas(["step", ...fields])} })
})`
			const outputs = `Outputs${j.name}${read.name}`
			const parts: ReadonlyArray<readonly [string, string]> = [
				[
					n.program(outputs),
					outputsOf(
						output.relation,
						[
							...Arr.map(output.shape.columns, (c) => c.name),
							...Arr.map(output.unions, (u) => u.field.name)
						],
						"output"
					)
				],
				...Arr.map(
					output.sidecars,
					(side) =>
						[
							n.program(`${outputs}${Str.capitalize(side.column.name)}`),
							outputsOf(side.relation, ["value"], "value")
						] as const
				),
				...Arr.map(
					output.families,
					(f) =>
						[
							n.program(`${outputs}${Str.capitalize(f.field.name)}`),
							outputsOf(f.relation, familyFields(f), "part")
						] as const
				),
				...Arr.flatMap(output.unions, (u) =>
					Arr.map(
						u.variants,
						(vr) =>
							[
								n.program(`${outputs}${Str.capitalize(u.field.name)}${vr.variant.tag}`),
								outputsOf(
									vr.relation,
									Arr.map(vr.variant.columns, (c) => c.name),
									"part"
								)
							] as const
					)
				)
			]
			Arr.forEach(parts, (part) => denPrograms.push(part))
			denPrograms.push([
				n.program(`Failures${j.name}${read.name}`),
				`query(${n.graph}).rule((r) => {
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

	const coordinatorPrograms: Array<readonly [string, string]> = []
	const insertInto = (relation: string) =>
		`ChangeSet.empty(${n.coordination}).insert(${relation}, [])`
	if (Option.isSome(l.seats)) {
		const st = l.seats.value
		const live = `${n.coordinator}.relations.${st.live}`
		const fields = commas(seatFields)
		coordinatorPrograms.push(
			[
				n.program("Take"),
				`ChangeSet.empty(${n.coordination}).insert(${st.freed}, []).insert(${st.hold}, [])`
			],
			[n.program("GiveBack"), insertInto(st.freed)],
			[n.program("SeatTurns"), deferred(latestOf(n.coordination, st.hold, ["resource", "seat"]))],
			[
				n.program("Holds"),
				deferred(`query(${n.coordinator}).rule((r) => {
	const { ${fields} } = v(${live}, "live")
	return r.match(${live}, { ${fields} }).find({ ${fields} })
})`)
			]
		)
	}
	if (has(r("Exclusive"))) {
		coordinatorPrograms.push(
			[n.program("HoldExclusive"), insertInto(r("Exclusive"))],
			[n.program("ReleaseExclusive"), insertInto(r("Released"))],
			[
				n.program("ExclusiveTurns"),
				deferred(latestOf(n.coordination, r("Exclusive"), ["kind", "key"]))
			],
			[
				n.program("Exclusives"),
				deferred(liveOf(n.coordination, r("Exclusive"), r("Released"), ["kind", "key"], ["scope"]))
			]
		)
	}
	coordinatorPrograms.push(
		[n.program("Pause"), insertInto(r("Paused"))],
		[n.program("Resume"), insertInto(r("Resumed"))],
		[n.program("PauseTurns"), deferred(latestOf(n.coordination, r("Paused"), ["target"]))],
		[
			n.program("PausedAll"),
			deferred(liveOf(n.coordination, r("Paused"), r("Resumed"), ["target"], []))
		]
	)

	const commitPrograms: Array<readonly [string, string]> = [
		[
			n.program("Authenticated"),
			`clocked(query(${n.graph}).rule((r) => r.find({ now: r.param("now", DenInstant) })), { now: "millis" })`
		]
	]
	Arr.forEach(l.steps, (s) => {
		const spawns = Arr.isReadonlyArrayNonEmpty(s.edges) ? l.spawning : []
		commitPrograms.push([
			n.program(`Commit${s.name}`),
			commitOf(
				n.graph,
				W,
				[
					r("Result"),
					r("Done"),
					r("Held"),
					...valueRelations(s.output),
					...Arr.map(s.reads, (rd) => rd.record),
					...spawns
				],
				s.writes,
				app
			)
		])
		if (Arr.isReadonlyArrayNonEmpty(s.reads)) {
			commitPrograms.push([n.program(`Read${s.name}`), deferred(readsOf(s.reads, app, W))])
		}
	})
	Arr.forEach(l.joins, (j) =>
		commitPrograms.push([
			n.program(`Commit${j.finish.name}`),
			commitOf(n.graph, W, [r("Result"), r("Done"), r("Held")], j.finish.writes, app)
		])
	)
	const appRoots = Arr.filter(l.joins, isApp)
	const requests = Arr.map(
		appRoots,
		(j) =>
			`${j.name}: ChangeSet.empty(${n.graph})${members(
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

	const block = (name: string, programs: ReadonlyArray<readonly [string, string]>) => [
		`export const ${name} = Object.freeze({`,
		...Arr.map(programs, ([member, program]) => `\t${member}: ${indented("\t")(program)},`),
		"})"
	]
	const body = lines([
		`/** den's role for the flow ${P}: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. */`,
		`export const ${n.den} = role(${app}, ${q(n.denName)}, { ${commas([`...${n.graph}.relations`, ...idleEntries])} }, { insert: [${commas(Arr.map(den, q))}] })`,
		"",
		`/** den's coordinator role for the flow ${P}: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation${Option.isSome(l.seats) ? ", and reads its seats' live holds through the seat level the app's schema states, so a schema without it fails to typecheck" : ""}. */`,
		`export const ${n.coordinator} = role(${app}, ${q(n.coordinatorName)}, { ${commas([...rosterNames, ...l.coordination, ...liveEntry])} }, { insert: [${commas(Arr.map(l.coordination, q))}] })`,
		"",
		...block(n.denPrograms, denPrograms),
		"",
		`export const ${n.denWorkload} = workload(${n.den}, ${n.denPrograms})`,
		"",
		...block(n.coordinatorPrograms, coordinatorPrograms),
		"",
		`export const ${n.coordinatorWorkload} = workload(${n.coordinator}, ${n.coordinatorPrograms})`,
		"",
		`/** den's retiring role for the flow ${P}: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */`,
		`export const ${n.retirer} = role(${app}, ${q(n.retirerName)}, { ...${n.graph}.relations }, { retire: [${q(r("Root"))}] })`,
		"",
		`export const ${n.retirerPrograms} = Object.freeze({ ${n.program("Retire")}: ChangeSet.empty(${n.graph}).retire(${r("Root")}, []) })`,
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
					`/** The requests of the flow's roots the app's own write starts, each a ChangeSet over the flow's graph the app unions with its own. */`,
					`export const ${n.requests} = Object.freeze({ ${commas(requests)} })`
				]
			: [])
	])
	const tokens = identifiersOf(body)
	const imported = Arr.filter([...rosterNames, ...allRelations, n.graph, n.coordination], (name) =>
		tokens.has(name)
	)
	return `${lines([
		`/** The programs den lowered the flow ${P} to, over its fragments, and its roles over the schema ${app}; \`den generate\` writes them, and nothing edits them. */`,
		`import { ${commas(Arr.filter(["ChangeSet", "Compute", "clocked", "deferrable", "query", "role", "v", "workload"], (name) => tokens.has(name)))} } from "@bjornpagen/grizzle"`,
		`import { DenInstant } from "@bjornpagen/den/lower/keys"`,
		`import { ${app} } from ${q(place.schema.from)}`,
		`import { ${W} } from ${q(place.writer.from)}`,
		`import { ${commas(imported)} } from ${q(place.fragment)}`,
		"",
		body
	])}\n`
}

/** A value's facts for one owner `key` of the root `root` and value `x`: its row, and a row of each part it holds. */
const factsOf = (v: ValueIR, key: string, x: string, root: string): ReadonlyArray<string> => [
	`${v.relation}: [{ ${commas([
		`${v.owner}: ${key}`,
		`root: ${root}`,
		...Arr.map(v.shape.columns, (c) => `${c.name}: ${x}.${c.name}`),
		...Arr.map(v.unions, (u) => `${u.field.name}: ${x}.${u.field.name}._tag`)
	])} }]`,
	...Arr.map(
		v.sidecars,
		(s) =>
			`${s.relation}: Option.toArray(Option.map(${x}.${s.column.name}, (value) => ({ ${v.owner}: ${key}, root: ${root}, value })))`
	),
	...Arr.map(
		v.families,
		(f) =>
			`${f.relation}: Arr.map(${x}.${f.field.name}, (element, index) => ({ ${commas([
				`${v.owner}: ${key}`,
				`root: ${root}`,
				"ordinal: BigInt(index)",
				...(f.field.element.kind === "value"
					? ["value: element"]
					: Arr.map(f.field.element.columns, (c) => `${c.name}: element.${c.name}`))
			])} }))`
	),
	...Arr.flatMap(v.unions, (u) =>
		Arr.map(
			u.variants,
			(vr) =>
				`${vr.relation}: Arr.flatMap([${x}.${u.field.name}], (variant) => (variant._tag === ${q(vr.variant.tag)} ? [{ ${commas(
					[
						`${v.owner}: ${key}`,
						`root: ${root}`,
						...Arr.map(vr.variant.columns, (c) => `${c.name}: variant.${c.name}`)
					]
				)} }] : []))`
		)
	)
]

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
			...Arr.map(vr.variant.columns, (c) => `${c.name}: part.${c.name}`)
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
		...Arr.map(v.shape.columns, (c) => `${c.name}: ${row}.${c.name}`),
		...Arr.map(
			v.sidecars,
			(s, i) => `${s.column.name}: Option.map(${parts.side(i)}, (o) => o.value)`
		),
		...Arr.map(
			v.families,
			(f, i) =>
				`${f.field.name}: Arr.map(ordered(${parts.family(i)}), (e) => ${
					f.field.element.kind === "value"
						? "e.value"
						: `({ ${commas(Arr.map(f.field.element.columns, (c) => `${c.name}: e.${c.name}`))} })`
				})`
		),
		...Arr.map(v.unions, (u) => `${u.field.name}: unions.${u.field.name}`)
	])} })`
	return Arr.isReadonlyArrayEmpty(v.unions)
		? object
		: `Option.map(Option.all({ ${commas(Arr.map(v.unions, (u, i) => `${u.field.name}: ${unionOf(v, i, row, parts)}`))} }), (unions) => ${object})`
}

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
	const all = [v.owner, ...fields]
	return `query(${graph}).rule((r) => {
	const { ${commas(all)} } = v(${relation}, "part")
	return r.match(${relation}, { ${commas(all)} }).where(r.eq(${v.owner}, r.param(${q(v.owner)}, ${relation}.fields.${v.owner}))).find({ ${commas(all)} })
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
	const spawning = l.spawning
	const allRelations = Arr.map(l.relations, (rel) => rel.name)
	const has = (relation: string) => Arr.contains(allRelations, relation)
	const exclusiveKeys = has(r("ExclusiveKey"))
	const rowsType = lines([
		"interface Rows {",
		...Arr.map(spawning, (rel) => `\treadonly ${rel}: ReadonlyArray<Addition<typeof ${rel}>>`),
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
		`Effect.map(settled(h.den.${handle}.once({ params: { ${owner}: ${key} }, facts: {} })), one)`
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
			...Arr.map(
				v.families,
				(f, i) =>
					`\tconst family${i} = yield* Effect.map(settled(h.den.${n.program(`Read${f.relation}`)}.once({ params: { ${v.owner} }, facts: {} })), rowsOf)`
			),
			...Arr.flatMap(v.unions, (u, i) =>
				Arr.map(
					u.variants,
					(vr, j) =>
						`\tconst variant${i}_${j} = yield* ${keyRead(n.program(`Read${vr.relation}`), v.owner, v.owner)}`
				)
			),
			`\treturn Option.${unioned(v) ? "flatMap" : "map"}(row, (found) => ${valueOf(v, "found", {
				side: (i) => `side${i}`,
				family: (i) => `family${i}`,
				variant: (i, j) => `variant${i}_${j}`
			})})`,
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
		extra: string,
		root: string
	): string =>
		`Effect.flatMap(finishStep(${key}), (finish) => Effect.map(start${j.name}(${root}, ${key}, ${input}, at), (inner): Grown => joined(inner, { rows: { ...noRows, ${commas(
			[
				`${r("Scope")}: [{ scope: ${key}, kind: ${q(j.name)}, root: ${root} }]`,
				`${r("Within")}: [{ scope: ${key}, parent: ${owner}, root: ${root} }]`,
				`${r("Admitted")}: [{ scope: ${key}, root: ${root} }]`,
				`${r("Finish")}: [{ scope: ${key}, step: finish, root: ${root} }]`,
				`${r("Step")}: [{ step: finish, kind: ${q(j.finish.name)}, scope: ${key}, root: ${root} }]`,
				`${r("Due")}: [{ step: finish, at, root: ${root} }]`,
				extra,
				...factsOf(j.input, key, input, root)
			]
		)} }, spawned: { steps: [], finishes: hasChildren(inner, ${key}) ? [] : [finish] } })))`

	/** A step spawned under `owner` with key `key` and input `input`: its Step, Due and input, and `extra`. */
	const spawnedStep = (
		s: StepIR,
		key: string,
		input: string,
		owner: string,
		extra: string,
		root: string
	): string =>
		`({ rows: { ...noRows, ${commas([
			`${r("Step")}: [{ step: ${key}, kind: ${q(s.name)}, scope: ${owner}, root: ${root} }]`,
			`${r("Due")}: [{ step: ${key}, at: dueAt(${kindAt(s.index)}.due, at), root: ${root} }]`,
			extra,
			...factsOf(s.input, key, input, root)
		])} }, spawned: { steps: [{ step: ${key}, kind: ${q(s.name)}, due: dueAt(${kindAt(s.index)}.due, at) }], finishes: [] } })`

	const startOf = (j: JoinIR): string => {
		const cases = Arr.map(j.children, (child) =>
			child.kind === "step"
				? Option.match(stepOfKind(child.name), {
						onNone: () => "",
						onSome: (s) =>
							`return Effect.map(startedStep(scope, ordinal), (key): Grown => ${spawnedStep(s, "key", "spawn.input", "scope", `${r("StartStep")}: [{ scope, ordinal: BigInt(ordinal), step: key, root }]`, "root")})`
					})
				: Option.match(joinOf(child.name), {
						onNone: () => "",
						onSome: (inner) =>
							`return Effect.flatMap(startedScope(scope, ordinal), (key) => ${openedScope(inner, "key", "spawn.input", "scope", `${r("StartScope")}: [{ scope, ordinal: BigInt(ordinal), child: key, root }]`, "root")})`
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
			`const start${j.name} = (root: ScopeKey, scope: ScopeKey, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0], ${usesAt ? "at" : "_at"}: Instant): Effect.Effect<Grown, never, Digest.Digest> =>`,
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
							`Effect.map(edgeStep(${from}.turn.step, ${q(e.name)}, ordinal), (key): Grown => ${spawnedStep(s, "key", "input", `${from}.turn.scope`, `${e.relation}: [{ from: ${from}.turn.step, ordinal: BigInt(ordinal), to: key, root: ${from}.turn.root }]`, `${from}.turn.root`)})`
					})
				: Option.match(joinOf(e.to), {
						onNone: () => "Effect.succeed(nothingGrown)",
						onSome: (j) =>
							`Effect.flatMap(edgeScope(${from}.turn.step, ${q(e.name)}, ordinal), (key) => ${openedScope(j, "key", "input", `${from}.turn.scope`, `${e.relation}: [{ from: ${from}.turn.step, ordinal: BigInt(ordinal), to: key, root: ${from}.turn.root }]`, `${from}.turn.root`)})`
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

	const recordFacts = (s: StepIR, found: string, turn: string): ReadonlyArray<string> =>
		Arr.map(
			s.reads,
			(rd) =>
				`${rd.record}: Arr.map(${found}.${rd.name}, (row, ordinal) => ({ ...row, step: ${turn}.step, root: ${turn}.root, ordinal: BigInt(ordinal) }))`
		)

	const failPort = (
		name: string,
		error: Option.Option<ValueIR>,
		records: (rows: string, turn: string) => ReadonlyArray<string>
	): string =>
		Option.match(error, {
			onNone: () => "fail: (failed) => Effect.die(failed.error)",
			onSome: (e) =>
				`fail: (failed) => settled(h.den.${n.program(`Fail${name}`)}.once({ params: {}, facts: { insert: { ${commas(
					[
						`${r("Result")}: [{ step: failed.turn.step, root: failed.turn.root, outcome: "failed" }]`,
						`${r("Failed")}: [{ step: failed.turn.step, root: failed.turn.root }]`,
						`${r("Held")}: [{ step: failed.turn.step, root: failed.turn.root, attempt: failed.turn.attempt }]`,
						...factsOf(e, "failed.turn.step", "failed.error", "failed.turn.root"),
						...records("failed.rows", "failed.turn")
					]
				)} } } }))`
		})

	const stepRunner = (s: StepIR): string => {
		const grow = Arr.isReadonlyArrayNonEmpty(s.edges)
			? `Effect.map(Effect.all([${commas(Arr.map(s.edges, (e) => edgeGrowth(e, "done")))}]), (parts) => Arr.reduce(parts, nothingGrown, joined))`
			: "Effect.succeed(nothingGrown)"
		const spawnRows = Arr.isReadonlyArrayNonEmpty(s.edges) ? ["...grown.rows"] : []
		const params = Arr.flatMap(s.reads, (rd) =>
			Arr.map(paramsOf(rd), (param) => `${q(`${rd.name}.${param}`)}: ${rd.name}.${param}`)
		)
		const read = Arr.isReadonlyArrayNonEmpty(s.reads)
			? lines([
					"read: (input) => {",
					...Arr.map(
						s.reads,
						(rd) => `\tconst ${rd.name} = ${kindAt(s.index)}.reads.${rd.name}.params(input)`
					),
					`\treturn Effect.flatMap(settled(h.commits.${n.program(`Read${s.name}`)}.once({ params: { ${commas(params)} }, facts: {} })), (rows) => Effect.map(only(rows), (row) => ({ ${commas(Arr.map(s.reads, (rd) => `${rd.name}: row.${rd.name}`))} })))`,
					"}"
				])
			: "read: () => Effect.succeed({})"
		return lines([
			`runnerOf(${kindAt(s.index)}, {`,
			`\tinput: (step) => ${readerOf(s.input)}(step),`,
			`\t${read},`,
			`\tcommit: (done, ${Arr.some(s.edges, (e) => e.toKind === "step") ? "at" : "_at"}) => Effect.gen(function* () {`,
			`\t\tconst grown = yield* ${grow}`,
			`\t\tconst outcome = yield* settled(h.commits.${n.program(`Commit${s.name}`)}.once({ params: {}, facts: { ${opsOf(
				[
					...spawnRows,
					`${r("Result")}: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }]`,
					`${r("Done")}: [{ step: done.turn.step, root: done.turn.root }]`,
					`${r("Held")}: [{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }]`,
					...factsOf(s.output, "done.turn.step", "done.output", "done.turn.root"),
					...recordFacts(s, "done.rows", "done.turn")
				],
				s.writes,
				"done"
			)} } }))`,
			"\t\treturn { outcome, spawned: grown.spawned }",
			"\t}),",
			`\t${failPort(s.name, s.error, (rows, turn) => recordFacts(s, rows, turn))}`,
			"}, Option.none())"
		])
	}

	const finishRunner = (j: JoinIR): string => {
		const reads = Arr.map(j.finish.reads, (read) => {
			if (read.kind === "scope") {
				return lines([
					`\t\tconst endings${read.name} = yield* Effect.map(settled(h.den.${n.program(`Endings${j.name}${read.name}`)}.once({ params: { scope }, facts: {} })), rowsOf)`,
					`\t\tconst ${read.name} = Arr.map(endings${read.name}, (row) => (row.outcome === "done" ? { _tag: "Done" as const } : { _tag: "Failed" as const }))`
				])
			}
			const output = read.output
			const outputs = `Outputs${j.name}${read.name}`
			const all = (name: string, program: string) =>
				`\t\tconst ${name} = yield* Effect.map(settled(h.den.${n.program(program)}.once({ params: { scope }, facts: {} })), rowsOf)`
			const value = valueOf(output, "row", {
				side: (i) => `Arr.findFirst(side${read.name}${i}, (o) => o.step === row.step)`,
				family: (i) => `Arr.filter(family${read.name}${i}, (o) => o.step === row.step)`,
				variant: (i, k) => `Arr.findFirst(variant${read.name}${i}_${k}, (o) => o.step === row.step)`
			})
			const done = unioned(output)
				? `...(yield* Effect.forEach(rows${read.name}, (row) => Effect.map(held(${value}), (output) => ({ _tag: "Done" as const, output }))))`
				: `...Arr.map(rows${read.name}, (row) => ({ _tag: "Done" as const, output: ${value} }))`
			return lines([
				all(`rows${read.name}`, outputs),
				...Arr.map(output.sidecars, (s, i) =>
					all(`side${read.name}${i}`, `${outputs}${Str.capitalize(s.column.name)}`)
				),
				...Arr.map(output.families, (f, i) =>
					all(`family${read.name}${i}`, `${outputs}${Str.capitalize(f.field.name)}`)
				),
				...Arr.flatMap(output.unions, (u, i) =>
					Arr.map(u.variants, (vr, k) =>
						all(
							`variant${read.name}${i}_${k}`,
							`${outputs}${Str.capitalize(u.field.name)}${vr.variant.tag}`
						)
					)
				),
				all(`failures${read.name}`, `Failures${j.name}${read.name}`),
				`\t\tconst ${read.name} = [${done}, ...Arr.map(failures${read.name}, () => ({ _tag: "Failed" as const }))]`
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
			`\t\tconst located = yield* Effect.map(settled(h.den.${n.program("StepOf")}.once({ params: { step }, facts: {} })), one)`,
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
			`\t\tcommit: (done) => Effect.map(settled(h.commits.${n.program(`Commit${j.finish.name}`)}.once({ params: {}, facts: { ${opsOf(
				[
					`${r("Result")}: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }]`,
					`${r("Done")}: [{ step: done.turn.step, root: done.turn.root }]`,
					`${r("Held")}: [{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }]`
				],
				j.finish.writes,
				"done"
			)} } })), (outcome) => ({ outcome, spawned: { steps: [], finishes: [] } })),`,
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
			`\tconst grown = yield* start${j.name}(scope, scope, input.value, at)`,
			"\tconst finish = yield* finishStep(scope)",
			`\tconst steps: ReadonlyArray<Addition<typeof ${r("Step")}>> = [...grown.rows.${r("Step")}, { step: finish, kind: ${q(j.finish.name)}, scope, root: scope }]`,
			`\tconst dues: ReadonlyArray<Addition<typeof ${r("Due")}>> = [...grown.rows.${r("Due")}, { step: finish, at, root: scope }]`,
			`\tconst admitted: ReadonlyArray<Addition<typeof ${r("Admitted")}>> = [...grown.rows.${r("Admitted")}, { scope, root: scope }]`,
			`\tconst finishes: ReadonlyArray<Addition<typeof ${r("Finish")}>> = [...grown.rows.${r("Finish")}, { scope, step: finish, root: scope }]`,
			`\tconst outcome = yield* settled(h.den.${n.program("Admit")}.once({ params: {}, facts: { insert: { ${commas(
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
			)} } } }))`,
			"\treturn Option.some({ outcome, spawned: { steps: grown.spawned.steps, finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])] } })",
			"})"
		])

	const roots = Arr.filter(l.joins, (j) => Option.isSome(j.root))
	const requestFacts = (j: JoinIR): ReadonlyArray<string> => [
		`${r("Scope")}: [{ scope, kind: ${q(j.name)} as const, root: scope }]`,
		`${r("Root")}: [{ scope, key, at }]`,
		...(isExclusive(j)
			? [`${r("ExclusiveKey")}: Arr.map(keys, (k) => ({ ...k, root: scope }))`]
			: []),
		...factsOf(j.input, "scope", "input", "scope")
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
			: `${j.name}: ${signature} => Effect.flatMap(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => ${keys(`Effect.map(fresh(${q(P)}, settled(h.den.${n.program(`Request${j.name}`)}.once({ params: {}, facts: { insert: { ${commas(requestFacts(j))} } } }))), (accepted) => ({ scope, fresh: accepted }))`)})`
	}
	const denRoots = Arr.filter(roots, (j) => !isApp(j))
	const appRoots = Arr.filter(roots, isApp)

	const scoped = (name: string) => `(typeof ${name})["handles"][number]`
	const handleOf = (roster: string) =>
		`(name: string): Option.Option<${scoped(roster)}> => Arr.findFirst(${roster}.handles, (handle) => handle === name)`
	const resources = has(r("Hold"))
	const exclusives = has(r("Exclusive"))
	const call = (program: string, input: string) =>
		`settled(h.coordinator.${n.program(program)}.once(${input}))`
	const read = (program: string, row: string) =>
		`Effect.map(${call(program, "{ params: {}, facts: {} }")}, (rows) => Arr.map(rowsOf(rows), (row) => (${row})))`
	const write = (program: string, facts: string) =>
		`Effect.asVoid(${call(program, `{ params: {}, facts: { insert: { ${facts} } } }`)})`
	const coordination = lines([
		"{",
		resources
			? `\tseatTurns: ${read("SeatTurns", "{ resource: row.resource, seat: row.seat, turn: row.turn }")},`
			: "\tseatTurns: Effect.succeed([]),",
		resources
			? `\tholds: ${read("Holds", "{ resource: row.resource, seat: row.seat, turn: row.turn, holder: row.holder, until: row.until }")},`
			: "\tholds: Effect.succeed([]),",
		exclusives
			? `\texclusiveTurns: ${read("ExclusiveTurns", "{ kind: row.kind, key: row.key, turn: row.turn }")},`
			: "\texclusiveTurns: Effect.succeed([]),",
		exclusives
			? `\texclusives: ${read("Exclusives", "{ kind: row.kind, key: row.key, turn: row.turn, scope: row.scope }")},`
			: "\texclusives: Effect.succeed([]),",
		`\tpauseTurns: ${read("PauseTurns", "{ target: row.target, turn: row.turn }")},`,
		`\tpaused: ${read("PausedAll", "{ target: row.target, turn: row.turn }")},`,
		resources
			? `\ttake: (lapsed, taken) => ${write("Take", `${r("Freed")}: seatTurnsOf(lapsed), ${r("Hold")}: holdsOf(taken)`)},`
			: "\ttake: () => Effect.void,",
		resources
			? `\tgiveBack: (holds) => ${write("GiveBack", `${r("Freed")}: seatTurnsOf(holds)`)},`
			: "\tgiveBack: () => Effect.void,",
		exclusives
			? `\tholdExclusive: (row) => ${write("HoldExclusive", `${r("Exclusive")}: Arr.flatMap(exclusiveTurnsOf([row]), (turn) => [{ ...turn, scope: row.scope }])`)},`
			: "\tholdExclusive: () => Effect.void,",
		exclusives
			? `\treleaseExclusive: (rows) => ${write("ReleaseExclusive", `${r("Released")}: exclusiveTurnsOf(rows)`)},`
			: "\treleaseExclusive: () => Effect.void,",
		`\tpause: (row) => ${write("Pause", `${r("Paused")}: pausesOf([row])`)},`,
		`\tresume: (row) => ${write("Resume", `${r("Resumed")}: pausesOf([row])`)}`,
		"}"
	])
	const all = (handle: string) =>
		`Effect.map(settled(h.den.${handle}.once({ params: {}, facts: {} })), rowsOf)`
	const snapshot = lines([
		"Effect.gen(function* () {",
		`\tconst steps = yield* ${all(n.program("Pending"))}`,
		`\tconst claims = yield* ${all(n.program("PendingClaims"))}`,
		`\tconst retries = yield* ${all(n.program("PendingRetries"))}`,
		`\tconst fenced = yield* ${all(n.program("PendingFenced"))}`,
		`\tconst dues = yield* ${all(n.program("PendingDues"))}`,
		`\tconst requested = yield* ${all(n.program("Requested"))}`,
		`\tconst running = yield* ${all(n.program("Running"))}`,
		`\tconst withins = yield* ${all(n.program("Withins"))}`,
		`\tconst roots = yield* ${all(n.program("Roots"))}`,
		exclusiveKeys
			? `\tconst keys = yield* ${all(n.program("ExclusiveKeys"))}`
			: "\tconst keys: ReadonlyArray<{ readonly scope: ScopeKey; readonly id: ExclusiveId }> = []",
		"\tconst holds = yield* coordination.holds",
		"\tconst exclusives = yield* coordination.exclusives",
		"\tconst paused = yield* Effect.map(coordination.paused, Arr.map((row) => row.target))",
		"\tconst busy = yield* busyFlows",
		"\tconst view = (scope: ScopeKey, kind: string, admission: Admission): ReadonlyArray<ScopeView> =>",
		"\t\tOption.match(Arr.findFirst(roots, (o) => o.scope === scope), {",
		'\t\t\tonSome: (o): ReadonlyArray<ScopeView> => [{ place: "root", scope, kind, key: o.key, at: o.at, admission, exclusive: Option.map(Arr.findFirst(keys, (k) => k.scope === scope), (k) => k.id) }],',
		'\t\t\tonNone: () => Arr.map(Option.toArray(Arr.findFirst(withins, (w) => w.scope === scope)), (w): ScopeView => ({ place: "child", scope, kind, parent: w.parent }))',
		"\t\t})",
		"\treturn {",
		"\t\tsteps,",
		"\t\tclaims,",
		"\t\tretries,",
		"\t\tfenced,",
		"\t\tdues,",
		'\t\tscopes: [...Arr.flatMap(requested, (s) => view(s.scope, s.kind, "requested")), ...Arr.flatMap(running, (s) => view(s.scope, s.kind, "admitted"))],',
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
			? [`signals(h.coordinator.${n.program("Holds")}.watch({ params: {}, facts: {} }))`]
			: []),
		...(exclusives
			? [`signals(h.coordinator.${n.program("Exclusives")}.watch({ params: {}, facts: {} }))`]
			: []),
		`signals(h.coordinator.${n.program("PausedAll")}.watch({ params: {}, facts: {} }))`,
		...Arr.map(
			l.idle,
			(f) => `signals(h.den.${n.program(`Busy${f}`)}.watch({ params: {}, facts: {} }))`
		)
	]
	const busyFlows = Arr.isReadonlyArrayNonEmpty(l.idle)
		? lines([
				"Effect.map(",
				"\tEffect.all([",
				...Arr.map(
					l.idle,
					(f) =>
						`\t\tEffect.map(h.den.${n.program(`Busy${f}`)}.once({ params: {}, facts: {} }).pipe(settled, any), (busy): ReadonlyArray<string> => (busy ? [${q(f)}] : [])),`
				),
				"\t]),",
				"\tArr.flatten",
				")"
			])
		: "Effect.succeed([])"
	const fragmentValues = boundRostersOf(l)
	const fragmentImports = Arr.dedupe([...spawning, ...fragmentValues])
	const fragmentTypes = Arr.filter(fragmentImports, (name) => !Arr.contains(fragmentValues, name))
	const valueReaders = [...Arr.map(l.steps, (s) => s.input), ...Arr.map(l.joins, (j) => j.input)]
	const finishOutputs = Arr.flatMap(l.joins, (j) =>
		Arr.flatMap(j.finish.reads, (ended) => (ended.kind === "step" ? [ended.output] : []))
	)
	const finishUnions = Arr.some(finishOutputs, unioned)
	const families = Arr.some([...valueReaders, ...finishOutputs], (v) =>
		Arr.isReadonlyArrayNonEmpty(v.families)
	)
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
		`import type { Addition } from "@bjornpagen/grizzle"`,
		`import { type MemberHandle, type Settled, settled } from "@bjornpagen/grizzle/runtime"`,
		`import { ${commas(["any", "dueAt", ...(exclusiveKeys ? ["exclusiveRows"] : []), ...(Arr.isReadonlyArrayNonEmpty(denRoots) ? ["fresh"] : []), ...(finishUnions ? ["held"] : []), "one", ...(Arr.some(l.steps, (st) => Arr.isReadonlyArrayNonEmpty(st.reads)) ? ["only"] : []), ...(families ? ["ordered"] : []), "readingOf", "rowsOf", "scheduleOf", "signals"])} } from "@bjornpagen/den/runtime/bind"`,
		`import { ${commas(identity)} } from "@bjornpagen/den/runtime/identity"`,
		`import type { ${commas(["FlowNeeds", ...(exclusives ? ["ExclusiveTurn"] : []), ...(resources ? ["HoldRow"] : []), "Admission", "Ledger", "PauseRow", "ScopeView", ...(resources ? ["SeatTurn"] : []), "Snapshot", "Spawned"])} } from "@bjornpagen/den/runtime/ledger"`,
		`import { runnerOf } from "@bjornpagen/den/runtime/turn"`,
		`import { FlowName } from "@bjornpagen/den/transport"`,
		`import { Array as Arr, Effect, Option, Stream } from "effect"`,
		`import type { Digest } from "effect/crypto"`,
		`import { ${F} } from ${q(place.flow.from)}`,
		`import { ${commas(fragmentValues)} } from ${q(place.fragment)}`,
		`import type { ${commas(fragmentTypes)} } from ${q(place.fragment)}`,
		`import type { ${commas([n.denPrograms, n.coordinatorPrograms, n.retirerPrograms, n.commitPrograms])} } from ${q(place.programs)}`,
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
					`const seatTurnsOf = (turns: ReadonlyArray<SeatTurn>) => Arr.flatMap(turns, (turn) => Option.toArray(Option.map(resourceOf(turn.resource), (resource) => ({ resource, seat: turn.seat, turn: turn.turn }))))`,
					`const holdsOf = (holds: ReadonlyArray<HoldRow>) => Arr.flatMap(holds, (hold) => Option.toArray(Option.map(resourceOf(hold.resource), (resource) => ({ resource, seat: hold.seat, turn: hold.turn, holder: hold.holder, until: hold.until }))))`
				]
			: []),
		...(exclusives
			? [
					`const exclusiveTurnsOf = (turns: ReadonlyArray<ExclusiveTurn>) => Arr.flatMap(turns, (turn) => Option.toArray(Option.map(joinOf(turn.kind), (kind) => ({ kind, key: turn.key, turn: turn.turn }))))`
				]
			: []),
		`const pausesOf = (rows: ReadonlyArray<PauseRow>) => Arr.flatMap(rows, (row) => Option.toArray(Option.map(pausableOf(row.target), (target) => ({ target, turn: row.turn }))))`,
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
		`\tconst busyFlows: Effect.Effect<ReadonlyArray<string>, Settled> = ${indented("\t")(busyFlows)}`,
		`\tconst request = { ${commas(Arr.map(denRoots, requestOf))} }`,
		`\tconst ledger: Ledger<FlowNeeds<typeof ${F}>> = {`,
		`\t\tflow: FlowName.make(${q(P)}),`,
		`\t\tnow: Effect.flatMap(settled(h.den.${n.program("Now")}.once({ params: {}, facts: {} })), readingOf),`,
		`\t\tauthenticated: Effect.asVoid(settled(h.commits.${n.program("Authenticated")}.once({ params: {}, facts: {} }))),`,
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
		`\t\tstepOf: (step) => Effect.map(settled(h.den.${n.program("StepOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => ({ kind: row.kind, scope: row.scope, root: row.root }))),`,
		`\t\tresultOf: (step) => Effect.map(settled(h.den.${n.program("ResultOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.outcome)),`,
		`\t\theldOf: (step) => Effect.map(settled(h.den.${n.program("HeldOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.attempt)),`,
		`\t\tdueOf: (step) => Effect.map(settled(h.den.${n.program("DueOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.at)),`,
		`\t\tclaimsOf: (step) => Effect.map(settled(h.den.${n.program("ClaimsOf")}.once({ params: { step }, facts: {} })), rowsOf),`,
		`\t\tretriesOf: (step) => Effect.map(settled(h.den.${n.program("RetriesOf")}.once({ params: { step }, facts: {} })), rowsOf),`,
		`\t\tfencedOf: (step) => Effect.map(settled(h.den.${n.program("FencedOf")}.once({ params: { step }, facts: {} })), rowsOf),`,
		"\t\tscopeOf: (scope) => Effect.gen(function* () {",
		`\t\t\tconst row = yield* ${keyRead(n.program("ScopeOf"), "scope", "scope")}`,
		"\t\t\tif (Option.isNone(row)) {",
		"\t\t\t\treturn Option.none()",
		"\t\t\t}",
		`\t\t\tconst root = yield* ${keyRead(n.program("RootOf"), "scope", "scope")}`,
		"\t\t\tif (Option.isNone(root)) {",
		`\t\t\t\tconst within = yield* ${keyRead(n.program("WithinOf"), "scope", "scope")}`,
		'\t\t\t\treturn Option.map(within, (w): ScopeView => ({ place: "child", scope, kind: row.value.kind, parent: w.parent }))',
		"\t\t\t}",
		`\t\t\tconst admitted = yield* ${keyRead(n.program("AdmittedOf"), "scope", "scope")}`,
		`\t\t\tconst skipped = yield* ${keyRead(n.program("SkippedOf"), "scope", "scope")}`,
		exclusiveKeys
			? `\t\t\tconst key = yield* ${keyRead(n.program("ExclusiveKeyOf"), "scope", "scope")}`
			: "\t\t\tconst key = Option.none<{ readonly id: ExclusiveId }>()",
		'\t\t\tconst admission: Admission = Option.isSome(admitted) ? "admitted" : Option.isSome(skipped) ? "skipped" : "requested"',
		'\t\t\treturn Option.some<ScopeView>({ place: "root", scope, kind: row.value.kind, key: root.value.key, at: root.value.at, admission, exclusive: Option.map(key, (k) => k.id) })',
		"\t\t}),",
		`\t\tunended: (scope) => Effect.flatMap(h.den.${n.program("UnendedSteps")}.once({ params: { scope }, facts: {} }).pipe(settled, any), (steps) => steps ? Effect.succeed(true) : h.den.${n.program("OpenChildren")}.once({ params: { scope }, facts: {} }).pipe(settled, any)),`,
		`\t\tfinished: (scope) => h.den.${n.program("Finished")}.once({ params: { scope }, facts: {} }).pipe(settled, any),`,
		"\t\tbusy: busyFlows,",
		`\t\tclaim: (row) => Effect.map(settled(h.den.${n.program("Claim")}.once({ params: {}, facts: { insert: { ${r("Claim")}: [row] } } })), (outcome) => Arr.some(rowsOf(outcome.reads.held), (c) => c.holder === row.holder)),`,
		`\t\tretry: (row) => settled(h.den.${n.program("Retry")}.once({ params: {}, facts: { insert: { ${r("Retry")}: [row] } } })),`,
		`\t\tfence: (row) => settled(h.den.${n.program("Fence")}.once({ params: {}, facts: { insert: { ${r("Fenced")}: [row] } } })),`,
		`\t\trefuse: ({ step, root, attempt }, law) => settled(h.den.${n.program("Refuse")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, root, outcome: "failed" }], ${r("Failed")}: [{ step, root }], ${r("Held")}: [{ step, root, attempt }], ${r("Refusal")}: [{ step, root, law }] } } })),`,
		`\t\tskip: (scope, by) => settled(h.den.${n.program("Skip")}.once({ params: {}, facts: { insert: { ${r("Skipped")}: [{ scope, by, root: scope }] } } })),`,
		`\t\texhaust: ({ step, root, attempt }) => settled(h.den.${n.program("Exhaust")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, root, outcome: "failed" }], ${r("Failed")}: [{ step, root }], ${r("Held")}: [{ step, root, attempt }], ${r("Exhausted")}: [{ step, root, attempts: attempt }] } } })),`,
		`\t\tfinishedRoots: Effect.map(settled(h.den.${n.program("FinishedRoots")}.once({ params: {}, facts: {} })), (rows) => Arr.map(rowsOf(rows), (row) => ({ scope: row.scope, kind: row.kind, at: row.at }))),`,
		`\t\tretire: (root) => settled(h.retirer.${n.program("Retire")}.once({ params: {}, facts: { retire: { ${r("Root")}: [{ scope: root }] } } })),`,
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
