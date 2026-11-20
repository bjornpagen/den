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
	type SeatsIR,
	type SideIR,
	type SpawnedScopeIR,
	type SpawnedStepIR,
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
		...(used("drawn") ? ["drawn"] : []),
		...(Arr.some(l.laws, (law) => law.kind === "ordered") ? ["fin"] : []),
		"fragment",
		"key",
		...(used("natural") || used("drawn") ? ["natural"] : []),
		"on",
		...(Arr.some(l.laws, (law) => law.kind === "ordered") ? ["ordered"] : []),
		...(used("place") ? ["place"] : []),
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
 * A root's Root row as a request at its own instant inserts it: its scope and key the request's parameters, its kind
 * the root kind's handle, and its instant the request's reading of the database's clock, `now`, which the clocked
 * request binds, so no host names the instant a root was requested.
 */
const requestedRootOf = (
	P: string,
	j: JoinIR,
	graph: string,
	root: string,
	kinds: string
): string => {
	const params = requestParams(P, j)
	return `.insert(${root}, query(${graph}).rule((r) => r.find({ scope: r.param(${q(params.scope)}, ${root}.fields.scope), kind: ${kinds}.handle(${q(j.name)}), key: r.param(${q(params.key)}, ${root}.fields.key), at: r.param("now", ${root}.fields.at) })))`
}

/** Whether a join is a root that holds an exclusivity seat. */
const isExclusive = (j: JoinIR): boolean => Option.exists(j.root, (r) => r.exclusive)

/** The relations a flow's app role writes: each result, output, read and spawn a commit writes, and its roots' requests. */
const writerRelationsOf = (l: Lowered): ReadonlyArray<string> => {
	const P = l.prefix
	const anySpawn = Arr.isReadonlyArrayNonEmpty(l.edges)
	const appRoots = Arr.some(l.joins, (j) => isApp(j))
	return Arr.dedupe([
		`${P}Result`,
		`${P}Done`,
		`${P}Held`,
		...Arr.flatMap(l.steps, (s) => valueRelations(s.output)),
		...Arr.flatMap(l.joins, (j) => valueRelations(j.finish.output)),
		...Arr.flatMap(l.steps, (s) => Arr.map(s.reads, (r) => r.record)),
		...(anySpawn ? l.spawning : []),
		...(appRoots ? l.requesting : [])
	])
}

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
		case "retirable":
			return [law.header, ...law.bodies]
		case "ordered":
			return [law.member.relation, law.owner]
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
	/** The relations written only nested under their owners, which no module but the fragment names: a claim's holds. */
	const nested = Arr.map(seats, (st) => st.hold)
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
				`${Arr.contains(nested, r.name) ? "const" : "export const"} ${r.name} = relation(${q(r.name)}, { ${commas(
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
			`/** The flow's seat level: its live holds, at most one a seat, each held below its resource's count. A fragment declares no derived relation, so the schema that lists \`${n.graph}\` states these on a level over itself, \`schema.extend(listing, name, [...${n.seatLevel}.relations], [...${n.seatLevel}.laws])\`. */`,
			`export const ${n.seatLevel} = { relations: [${st.live}], laws: [key(on(${st.live}, "resource", "seat")), check(${q(st.bound)}, ${st.live}, (row) => row.lt(row.seat, ${st.counts.name}.at(${q(st.counts.count)}, row.${st.counts.key.field})))] } as const`,
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
		.insertComputed(${r("Claim")}, [], {
			until: Compute.cast(Compute.add(Compute.base(param("now", DenInstant)), Compute.base(param("budget", DenDelay))), DenInstant)
		})
		.insert(${r("Ended")}, [])
		.read("held", (delta) =>
			query(${graph}).rule((r) => {
				const { step, root, attempt } = v(delta.added(${r("Claim")}), "added")
				return r.match(delta.added(${r("Claim")}), { step, root, attempt }).find({ step, root, attempt })
			})
		),
	{ now: "millis" }
)`

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
	spawns: Option.Option<string>,
	app: WritesIR,
	appRef: string
): string => {
	const den = `ChangeSet.empty(${graph})${members(inserts, none, appRef)}${Option.getOrElse(spawns, () => "")}`
	const commit =
		Arr.isReadonlyArrayEmpty(app.insert) &&
		Arr.isReadonlyArrayEmpty(app.put) &&
		Arr.isReadonlyArrayEmpty(app.delete)
			? den
			: `ChangeSet.union(${den}, ChangeSet.empty(${writer})${members([], app, appRef)})`
	return Option.isSome(spawns) ? `clocked(${commit}, { now: "millis" })` : commit
}

/**
 * The insert of the steps a call spawns, each due its delay after the call's own reading of the database's clock: the
 * rows of the relation parameter `steps`, each a step, its kind, its owning scope and its delay, under the call's one
 * graph, the scalar parameter `root`, so the database computes every due instant and no host names one. A delay is a
 * DenDelay, bounded so the sum fits an instant.
 */
const spawnedStepsOf = (graph: string, step: string): string => `.insert(
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
				due: Compute.cast(Compute.add(Compute.base(r.param("now", DenInstant)), Compute.base(delay)), DenInstant),
				root: r.param("root", ${step}.fields.root)
			})
	})
)`

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
	const children = has(r("Within"))
	/**
	 * The reads the relay watches and the scheduler's snapshot reads too, each one query over den's role, declared once
	 * in the programs module and named there: the pending steps, the requested scopes (a root whose graph is open, its
	 * Scope standing, and that is neither admitted nor skipped: a retired root's graph is gone, so it is no longer requested),
	 * the running scopes, and each idle
	 * flow's pending steps.
	 */
	const sharedReads = {
		pending: [
			n.program("PendingRead"),
			`query(${n.den}).rule((r) => {
	const { step, kind, scope, due } = v(${r("Step")}, "step")
	return r.match(${r("Step")}, { step, kind, scope, due }).where(r.not(${r("Result")}, { step })).find({ step, kind, scope, due })
})`
		],
		requested: [
			n.program("RequestedRead"),
			`query(${n.den}).rule((r) => {
	const { scope } = v(${r("Root")}, "root")
	return r.match(${r("Root")}, { scope }).match(${r("Scope")}, { scope }).where(r.not(${r("Admitted")}, { scope }), r.not(${r("Skipped")}, { scope })).find({ scope })
})`
		],
		running: [
			n.program("RunningRead"),
			`query(${n.den}).rule((r) => {
	const { scope, step } = v(${r("Finish")}, "finish")
	return r.match(${r("Finish")}, { scope, step }).where(r.not(${r("Result")}, { step })).find({ scope })
})`
		]
	} as const
	const busyRead = (f: string): readonly [string, string] => [
		n.program(`Busy${f}Read`),
		`query(${n.den}).rule((r) => {
	const { step } = v(${app}.relations.${f}Step, "step")
	return r.match(${app}.relations.${f}Step, { step }).where(r.not(${app}.relations.${f}Result, { step })).find({ step })
})`
	]
	const sharedDeclarations: ReadonlyArray<readonly [string, string]> = [
		sharedReads.pending,
		sharedReads.requested,
		sharedReads.running,
		...Arr.map(l.idle, busyRead)
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
	const { step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, until }).where(r.not(${r("Result")}, { step })).find({ step, attempt, until })
})`,
		`retries: query(${n.den}).rule((r) => {
	const { step, attempt, at, why } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { step, attempt, at, why }).where(r.not(${r("Result")}, { step })).find({ step, attempt, at, why })
})`,
		`fenced: query(${n.den}).rule((r) => {
	const { step, attempt } = v(${r("Fenced")}, "fenced")
	return r.match(${r("Fenced")}, { step, attempt }).where(r.not(${r("Result")}, { step })).find({ step, attempt })
})`,
		`requested: ${shared.requested}`,
		`running: ${shared.running}`,
		...(children ? [`withins: ${allOf(n.den, r("Within"), ["scope", "parent", "kind"])}`] : []),
		`roots: ${allOf(n.den, r("Root"), ["scope", "kind", "key", "at"])}`,
		...(exclusiveKeys ? [`keys: ${allOf(n.den, r("ExclusiveKey"), ["scope", "key", "id"])}`] : []),
		...Arr.map(Option.toArray(l.seats), (st) => `holds: ${liveHoldsOf(n.den, st)}`),
		...(has(r("Exclusive"))
			? [`exclusives: ${liveOf(n.den, r("Exclusive"), r("Released"), ["kind", "key"], ["scope"])}`]
			: []),
		`paused: ${liveOf(n.den, r("Paused"), r("Resumed"), ["target"], [])}`,
		...Arr.map(l.idle, (f) => `${busyName(f)}: ${shared.busy(f)}`)
	])} })`
	const denPrograms: Array<readonly [string, string]> = [
		[
			n.program("Now"),
			`clocked(query(${n.graph}).rule((r) => r.find({ now: r.param("now", DenInstant) })), { now: "millis" })`
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
					at: Compute.cast(Compute.add(Compute.base(r.param("now", DenInstant)), Compute.base(r.param("delay", DenDelay))), DenInstant),
					why: r.param("why", ${r("Retry")}.fields.why),
					root: r.param("root", ${r("Retry")}.fields.root)
				})
			)
		),
	{ now: "millis" }
)`
		],
		[
			n.program("Fence"),
			`ChangeSet.empty(${n.graph}).insert(${r("Ended")}, []).insert(${r("Fenced")}, [])`
		],
		...Arr.map(
			Option.toArray(l.seats),
			(st) => [n.program("Holds"), deferred(liveHoldsOf(n.den, st))] as const
		),
		[
			n.program("Refuse"),
			`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), r("Refusal")], none, app)}`
		],
		[
			n.program("Exhaust"),
			`ChangeSet.empty(${n.graph})${members([r("Result"), r("Failed"), r("Held"), r("Exhausted")], none, app)}`
		],
		[
			n.program("Admit"),
			`clocked(ChangeSet.empty(${n.graph})${members(
				Arr.filter(admittingOf(l), (rel) => rel !== r("Step")),
				none,
				app
			)}${spawnedStepsOf(n.graph, r("Step"))}, { now: "millis" })`
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
		[n.program("RootOf"), ownedBy(l, n.graph, r("Root"), "scope")],
		...(exclusiveKeys
			? [[n.program("ExclusiveKeyOf"), ownedBy(l, n.graph, r("ExclusiveKey"), "scope")] as const]
			: []),
		[
			n.program("FinishedRoots"),
			deferred(`query(${n.graph})
	.rule((r) => {
		const { scope } = v(${r("Root")}, "root")
		const { step } = v(${r("Finish")}, "finish")
		return r.match(${r("Root")}, { scope }).match(${r("Finish")}, { scope, step }).match(${r("Result")}, { step }).find({ scope })
	})
	.rule((r) => {
		const { scope } = v(${r("Root")}, "root")
		return r.match(${r("Root")}, { scope }).match(${r("Skipped")}, { scope }).find({ scope })
	})`)
		],
		[
			n.program("ClaimsOf"),
			`query(${n.graph}).rule((r) => {
	const { step, attempt, until } = v(${r("Claim")}, "claim")
	return r.match(${r("Claim")}, { step, attempt, until }).where(r.eq(step, ${stepParam})).find({ step, attempt, until })
})`
		],
		[
			n.program("RetriesOf"),
			`query(${n.graph}).rule((r) => {
	const { step, attempt, at, why } = v(${r("Retry")}, "retry")
	return r.match(${r("Retry")}, { step, attempt, at, why }).where(r.eq(step, ${stepParam})).find({ step, attempt, at, why })
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
		...(children
			? [
					[
						n.program("OpenChildren"),
						`query(${n.graph}).rule((r) => {
	const { scope, parent } = v(${r("Within")}, "within")
	const { step } = v(${r("Finish")}, "finish")
	return r
		.match(${r("Within")}, { scope, parent })
		.match(${r("Finish")}, { scope, step })
		.where(r.eq(parent, ${scopeParam}), r.not(${r("Result")}, { step }))
		.find({ child: scope })
})`
					] as const
				]
			: []),
		[
			n.program("Finished"),
			`query(${n.graph}).rule((r) => {
	const { scope, step } = v(${r("Finish")}, "finish")
	return r.match(${r("Finish")}, { scope, step }).match(${r("Result")}, { step }).where(r.eq(scope, ${scopeParam})).find({ step })
})`
		],
		[n.program("Pending"), deferred(shared.pending)],
		[n.program("Requested"), deferred(shared.requested)],
		[n.program("Running"), deferred(shared.running)],
		...Arr.map(l.idle, (f) => [n.program(`Busy${f}`), deferred(shared.busy(f))] as const),
		...(Arr.isReadonlyArrayNonEmpty(l.idle)
			? [
					[
						n.program("Busy"),
						deferred(
							`query(${n.den}).reads({ ${commas(Arr.map(l.idle, (f) => `${busyName(f)}: ${shared.busy(f)}`))} })`
						)
					] as const
				]
			: []),
		[n.program("Snapshot"), deferred(snapshotOf)]
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
			const request = `ChangeSet.empty(${n.graph})${members(
				[
					r("Scope"),

					...(isExclusive(j) ? [r("ExclusiveKey")] : []),
					...valueRelations(j.input)
				],
				none,
				app
			)}${requestedRootOf(P, j, n.graph, r("Root"), r("RootKind"))}`
			denPrograms.push([n.program(`Request${j.name}`), `clocked(${request}, { now: "millis" })`])
		}
		Arr.forEach(j.finish.reads, (read) => {
			const output = read.output
			/**
			 * The members a finish reads of a kind: the steps of a step kind in its scope, or the finishes of the child scopes
			 * of a scope kind under it, each by its step, bound by the finish's scope.
			 */
			const ofKind =
				read.kind === "step"
					? {
							bind: `const { step, scope } = v(${r("Step")}, "step")`,
							match: `.match(${r("Step")}, { step, kind: ${q(read.name)}, scope })`,
							owner: "scope"
						}
					: {
							bind: `const { scope, parent } = v(${r("Within")}, "within")
	const { step } = v(${r("Finish")}, "finish")`,
							match: `.match(${r("Within")}, { scope, parent, kind: ${q(read.name)} })
		.match(${r("Finish")}, { scope, step })`,
							owner: "parent"
						}
			const outputsOf = (
				relation: string,
				fields: ReadonlyArray<string>,
				label: string
			): string => `query(${n.graph}).rule((r) => {
	${ofKind.bind}${
		Arr.isReadonlyArrayNonEmpty(fields)
			? `
	const { ${commas(fields)} } = v(${relation}, ${q(label)})`
			: ""
	}
	return r
		${ofKind.match}
		.match(${relation}, { ${commas(["step", ...fields])} })
		.where(r.eq(${ofKind.owner}, ${scopeParam}))
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
	${ofKind.bind}
	return r
		${ofKind.match}
		.match(${r("Result")}, { step, outcome: "failed" })
		.where(r.eq(${ofKind.owner}, ${scopeParam}))
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
	/**
	 * A step's or a finish's commit: its result, its output, its reads' records, what its edges spawn (a step's in its
	 * own scope, a finish's in its scope's parent) and the app's writes, in one call.
	 */
	const committing = (
		name: string,
		output: ValueIR,
		records: ReadonlyArray<string>,
		edges: ReadonlyArray<EdgeIR>,
		w: WritesIR
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
					? Option.some(spawnedStepsOf(n.graph, r("Step")))
					: Option.none(),
				w,
				app
			)
		])
	Arr.forEach(l.steps, (s) => {
		committing(
			s.name,
			s.output,
			Arr.map(s.reads, (rd) => rd.record),
			s.edges,
			s.writes
		)
		if (Arr.isReadonlyArrayNonEmpty(s.reads)) {
			commitPrograms.push([n.program(`Read${s.name}`), deferred(readsOf(s.reads, app, W))])
		}
	})
	Arr.forEach(l.joins, (j) =>
		committing(j.finish.name, j.finish.output, [], j.finish.edges, j.finish.writes)
	)
	const appRoots = Arr.filter(l.joins, isApp)
	const requests = Arr.map(
		appRoots,
		(j) =>
			`${j.name}: ChangeSet.empty(${n.graph})${members(
				[r("Scope"), ...(isExclusive(j) ? [r("ExclusiveKey")] : []), ...valueRelations(j.input)],
				none,
				app
			)}${requestedRootOf(P, j, n.graph, r("Root"), r("RootKind"))}`
	)

	const block = (name: string, programs: ReadonlyArray<readonly [string, string]>) => [
		`export const ${name} = Object.freeze({`,
		...Arr.map(programs, ([member, program]) => `\t${member}: ${indented("\t")(program)},`),
		"})"
	]
	const body = lines([
		`/** den's role for the flow ${P}: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains${Option.isSome(l.seats) ? " and live holds" : ""} and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */`,
		`export const ${n.den} = role(${app}, ${q(n.denName)}, { ${commas([`...${n.graph}.relations`, ...l.coordination, ...liveEntry, ...idleEntries])} }, { insert: [${commas(Arr.map(den, q))}] })`,
		"",
		`/** den's coordinator role for the flow ${P}: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation${Option.isSome(l.seats) ? ", and reads its seats' live holds through the seat level the app's schema states, so a schema without it fails to typecheck" : ""}. */`,
		`export const ${n.coordinator} = role(${app}, ${q(n.coordinatorName)}, { ${commas([...rosterNames, ...l.coordination, ...liveEntry])} }, { insert: [${commas(Arr.map(l.coordination, q))}] })`,
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
		`import { ${commas(Arr.filter(["ChangeSet", "Compute", "clocked", "deferrable", "param", "query", "role", "v", "workload"], (name) => tokens.has(name)))} } from "@bjornpagen/grizzle"`,
		`import { ${commas(Arr.filter(["DenDelay", "DenInstant"], (name) => tokens.has(name)))} } from "@bjornpagen/den/lower/keys"`,
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
		`Effect.flatMap(finishStep(${key}), (finish) => Effect.map(start${j.name}(${root}, ${key}, ${input}), (inner): Grown => joined(inner, { rows: { ...noRows, ${commas(
			[
				`${r("Scope")}: [{ scope: ${key}, root: ${root} }]`,
				`${r("Within")}: [{ scope: ${key}, parent: ${owner}, kind: ${q(j.name)}, root: ${root} }]`,
				`${r("Admitted")}: [{ scope: ${key}, root: ${root} }]`,
				`${r("Finish")}: [{ scope: ${key}, step: finish, root: ${root} }]`,
				extra,
				...factsOf(j.input, key, input, root)
			]
		)} }, steps: [{ step: finish, kind: ${q(j.finish)}, scope: ${key}, delay: atOnce }], spawned: { steps: [], finishes: hasChildren(inner, ${key}) ? [] : [finish] } })))`

	/** A step spawned under `owner` with key `key` and input `input`: its Step, first due by its kind, its input, and `extra`. */
	const spawnedStep = (
		s: SpawnedStepIR,
		key: string,
		input: string,
		owner: string,
		extra: string,
		root: string
	): string =>
		`({ rows: { ...noRows, ${commas([extra, ...factsOf(s.input, key, input, root)])} }, steps: [{ step: ${key}, kind: ${q(s.name)}, scope: ${owner}, delay: delayAfter(${kindAt(s.index)}.due) }], spawned: { steps: [{ step: ${key}, kind: ${q(s.name)}, delay: delayAfter(${kindAt(s.index)}.due) }], finishes: [] } })`

	const startOf = (j: JoinIR): string => {
		const cases = Arr.map(j.children, (child) =>
			child.kind === "step"
				? `return Effect.map(startedStep(scope, ordinal), (key): Grown => ${spawnedStep(child, "key", "spawn.input", "scope", `${r("StartStep")}: [{ scope, ordinal: BigInt(ordinal), step: key, root }]`, "root")})`
				: `return Effect.flatMap(startedScope(scope, ordinal), (key) => ${openedScope(child, "key", "spawn.input", "scope", `${r("StartScope")}: [{ scope, ordinal: BigInt(ordinal), child: key, root }]`, "root")})`
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
			`const start${j.name} = (root: ScopeKey, scope: ScopeKey, input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0]): Effect.Effect<Grown, never, Digest.Digest> =>`,
			`\tEffect.map(Effect.forEach(${kindAt(j.index)}.start(input), (spawn, ordinal): Effect.Effect<Grown, never, Digest.Digest> => ${single ? "" : "{"}`,
			...body,
			`\t${single ? "" : "}"}), (parts) => Arr.reduce(parts, nothingGrown, joined))`
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
				? `Effect.map(edgeStep(${from.step}, ${q(e.name)}, ordinal), (key): Grown => ${spawnedStep(e.to, "key", "input", from.owner, fact, from.root)})`
				: `Effect.flatMap(edgeScope(${from.step}, ${q(e.name)}, ordinal), (key) => ${openedScope(e.to, "key", "input", from.owner, fact, from.root)})`
		return `Effect.map(Effect.forEach(${edgeAt(e.index)}.next(${from.input}, ${from.output}), (input, ordinal): Effect.Effect<Grown, never, Digest.Digest> => ${each}), (parts) => Arr.reduce(parts, nothingGrown, joined))`
	}

	/**
	 * A commit port: what its edges spawn from `from`, then its result, its output, `records` and the app's writes in
	 * one call, answering what it spawned.
	 */
	const commitPort = (
		name: string,
		output: ValueIR,
		edges: ReadonlyArray<EdgeIR>,
		w: WritesIR,
		records: ReadonlyArray<string>,
		from: Node
	): string => {
		const grow = Arr.isReadonlyArrayNonEmpty(edges)
			? `Effect.map(Effect.all([${commas(Arr.map(edges, (e) => edgeGrowth(e, from)))}]), (parts) => Arr.reduce(parts, nothingGrown, joined))`
			: "Effect.succeed(nothingGrown)"
		return lines([
			"commit: (done) => Effect.gen(function* () {",
			`\tconst grown = yield* ${grow}`,
			`\tconst outcome = yield* settled(h.commits.${n.program(`Commit${name}`)}.once({ params: ${Arr.isReadonlyArrayNonEmpty(edges) ? "{ steps: grown.steps, root: done.turn.root }" : "{}"}, facts: { ${opsOf(
				[
					...(Arr.isReadonlyArrayNonEmpty(edges) ? ["...grown.rows"] : []),
					`${r("Result")}: [{ step: done.turn.step, root: done.turn.root, outcome: "done" }]`,
					`${r("Done")}: [{ step: done.turn.step, root: done.turn.root }]`,
					`${r("Held")}: [{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }]`,
					...factsOf(output, "done.turn.step", "done.output", "done.turn.root"),
					...records
				],
				w,
				"done"
			)} } }))`,
			"\treturn { outcome, spawned: grown.spawned }",
			"})"
		])
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
			`\t${indented("\t")(
				commitPort(s.name, s.output, s.edges, s.writes, recordFacts(s, "done.rows", "done.turn"), {
					step: "done.turn.step",
					input: "done.input",
					output: "done.output",
					owner: "done.turn.scope",
					root: "done.turn.root"
				})
			)},`,
			`\t${failPort(s.name, s.error, (rows, turn) => recordFacts(s, rows, turn))}`,
			"}, Option.none())"
		])
	}

	const finishRunner = (j: JoinIR): string => {
		const reads = Arr.map(j.finish.reads, (read) => {
			const output = read.output
			const outputs = `Outputs${j.name}${read.name}`
			const all = (name: string, program: string) =>
				`\t\tconst ${name} = yield* Effect.map(settled(h.den.${n.program(program)}.once({ params: { scope }, facts: {} })), rowsOf)`
			const value = valueOf(output, "row", {
				side: (i) => `Arr.findFirst(side${read.name}${i}, (o) => o.step === row.step)`,
				family: (i) => `Arr.filter(family${read.name}${i}, (o) => o.step === row.step)`,
				variant: (i, k) => `Arr.findFirst(variant${read.name}${i}_${k}, (o) => o.step === row.step)`
			})
			/** A row of the read's outputs, named only where its value reads it: an output of no field reads none. */
			const row =
				Arr.isReadonlyArrayEmpty(output.shape.columns) &&
				Arr.isReadonlyArrayEmpty(output.sidecars) &&
				Arr.isReadonlyArrayEmpty(output.families) &&
				!unioned(output)
					? ""
					: "row"
			const done = unioned(output)
				? `...(yield* Effect.forEach(rows${read.name}, (row) => Effect.map(held(${value}), (output) => ({ _tag: "Done" as const, output }))))`
				: `...Arr.map(rows${read.name}, (${row}) => ({ _tag: "Done" as const, output: ${value} }))`
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
		/** A finish whose scope kind edges leave spawns them in its scope's parent, which it reads with its input. */
		const spawns = Arr.isReadonlyArrayNonEmpty(j.finish.edges)
		return lines([
			"runnerOf(",
			"\t{",
			`\t\tname: ${q(j.finish.name)},`,
			`\t\tuses: ${kind}.finish.uses,`,
			`\t\tretry: ${kind}.finish.retry,`,
			`\t\twaits: ${kind}.finish.waits,`,
			`\t\tbody: (read: { readonly input: Parameters<(typeof ${kind})["start"]>[0]; readonly endings: Parameters<(typeof ${kind})["finish"]["body"]>[1]${spawns ? "; readonly parent: ScopeKey" : ""} }) => ${kind}.finish.body(read.input, read.endings)`,
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
			...(spawns
				? [
						`\t\tconst within = yield* ${keyRead(n.program("WithinOf"), "scope", "scope")}`,
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
				commitPort(j.finish.name, j.finish.output, j.finish.edges, j.finish.writes, [], {
					step: "done.turn.step",
					input: "done.input.input",
					output: "done.output",
					owner: "done.input.parent",
					root: "done.turn.root"
				})
			)},`,
			`\t\t${failPort(j.finish.name, j.finish.error, () => [])}`,
			"\t},",
			`\tOption.some(${q(j.name)})`,
			")"
		])
	}

	const admitOf = (j: JoinIR): string =>
		lines([
			"(scope: ScopeKey) => Effect.gen(function* () {",
			`\tconst input = yield* ${readerOf(j.input)}(scope)`,
			"\tif (Option.isNone(input)) {",
			"\t\treturn Option.none()",
			"\t}",
			`\tconst grown = yield* start${j.name}(scope, scope, input.value)`,
			"\tconst finish = yield* finishStep(scope)",
			`\tconst steps: ReadonlyArray<SpawnRow> = [...grown.steps, { step: finish, kind: ${q(j.finish.name)}, scope, delay: atOnce }]`,
			`\tconst admitted: ReadonlyArray<Addition<typeof ${r("Admitted")}>> = [...grown.rows.${r("Admitted")}, { scope, root: scope }]`,
			`\tconst finishes: ReadonlyArray<Addition<typeof ${r("Finish")}>> = [...grown.rows.${r("Finish")}, { scope, step: finish, root: scope }]`,
			`\tconst outcome = yield* settled(h.den.${n.program("Admit")}.once({ params: { steps, root: scope }, facts: { insert: { ${commas(
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
	const requestFacts = (j: JoinIR): ReadonlyArray<string> => [
		`${r("Scope")}: [{ scope, root: scope }]`,
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
		const input = `input: Parameters<(typeof ${kindAt(j.index)})["start"]>[0]`
		const signature = `(key: string, ${input})`
		const names = requestParams(P, j)
		const params = `{ ${names.scope}: scope, ${names.key}: key }`
		const facts = `({ flow: FlowName.make(${q(P)}), scope, params: ${params}, facts: { ${commas(requestFacts(j))} } })`
		return isApp(j)
			? isExclusive(j)
				? `${j.name}: ${signature} => Effect.flatMap(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => Effect.map(exclusiveRows(${q(P)}, ${q(j.name)}, ${kindAt(j.index)}.exclusive, input, scope), (keys) => ${facts}))`
				: `${j.name}: ${signature} => Effect.map(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => ${facts})`
			: `${j.name}: ${signature} => Effect.flatMap(rootScope(${q(P)}, ${q(j.name)}, key), (scope) => ${keys(`Effect.map(fresh(${q(P)}, settled(h.den.${n.program(`Request${j.name}`)}.once({ params: ${params}, facts: { insert: { ${commas(requestFacts(j))} } } }))), (accepted) => ({ flow: FlowName.make(${q(P)}), scope, fresh: accepted }))`)})`
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
		"\tconst view = (scope: ScopeKey, admission: Admission): ReadonlyArray<ScopeView> =>",
		"\t\tOption.match(Arr.findFirst(read.roots, (o) => o.scope === scope), {",
		`\t\t\tonSome: (o): ReadonlyArray<ScopeView> => [{ place: "root", scope, kind: o.kind, key: o.key, at: o.at, admission, exclusive: ${exclusiveKeys ? "Option.map(Arr.findFirst(read.keys, (k) => k.scope === scope), (k) => k.id)" : "Option.none()"}, runner: roots[o.kind] }],`,
		children
			? '\t\t\tonNone: () => Arr.map(Option.toArray(Arr.findFirst(read.withins, (w) => w.scope === scope)), (w): ScopeView => ({ place: "child", scope, kind: w.kind, parent: w.parent }))'
			: "\t\t\tonNone: (): ReadonlyArray<ScopeView> => []",
		"\t\t})",
		"\treturn {",
		"\t\tsteps: Arr.map(read.steps, (s) => ({ step: s.step, runner: runners[s.kind], scope: s.scope, due: s.due })),",
		"\t\tclaims: read.claims,",
		"\t\tretries: read.retries,",
		"\t\tfenced: read.fenced,",
		'\t\tscopes: [...Arr.flatMap(read.requested, (s) => view(s.scope, "requested")), ...Arr.flatMap(read.running, (s) => view(s.scope, "admitted"))],',
		`\t\tholds: ${resources ? "read.holds" : "[]"},`,
		`\t\texclusives: ${exclusives ? "read.exclusives" : "[]"},`,
		"\t\tpaused: Arr.map(read.paused, (row) => row.target),",
		`\t\tbusy: ${Arr.isReadonlyArrayNonEmpty(l.idle) ? "busyOf(read)" : "[]"}`,
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
		)
	]
	const busyFlows = Arr.isReadonlyArrayNonEmpty(l.idle)
		? `Effect.flatMap(settled(h.den.${n.program("Busy")}.once({ params: {}, facts: {} })), (rows) => Effect.map(only(rows), busyOf))`
		: "Effect.succeed([])"
	const busyOf = `const busyOf = (read: { ${commas(Arr.map(l.idle, (f) => `readonly ${busyName(f)}: ReadonlyArray<unknown>`))} }): ReadonlyArray<string> => Arr.filter([${commas(Arr.map(l.idle, q))}] as const, (flow) => Arr.isReadonlyArrayNonEmpty(read[\`${BUSY}\${flow}\`]))`
	const fragmentValues = boundRostersOf(l)
	const fragmentImports = Arr.dedupe([...spawning, r("Kind"), r("RootKind"), ...fragmentValues])
	const fragmentTypes = Arr.filter(fragmentImports, (name) => !Arr.contains(fragmentValues, name))
	const valueReaders = [...Arr.map(l.steps, (s) => s.input), ...Arr.map(l.joins, (j) => j.input)]
	const finishOutputs = Arr.flatMap(l.joins, (j) =>
		Arr.map(j.finish.reads, (ended) => ended.output)
	)
	const finishUnions = Arr.some(finishOutputs, unioned)
	const families = Arr.some([...valueReaders, ...finishOutputs], (v) =>
		Arr.isReadonlyArrayNonEmpty(v.families)
	)
	const identity = Arr.dedupe([
		...(Arr.some(l.edges, (e) => e.to.kind === "scope") ? ["edgeScope"] : []),
		...(Arr.some(l.edges, (e) => e.to.kind === "step") ? ["edgeStep"] : []),
		"atOnce",
		"type Delay",
		"finishStep",
		...(Arr.some(roots, isScheduled) ? ["type Instant"] : []),
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
		`import { type MemberHandle, settled } from "@bjornpagen/grizzle/runtime"`,
		`import { ${commas(["any", "delayAfter", ...(exclusiveKeys ? ["exclusiveRows"] : []), ...(Arr.isReadonlyArrayNonEmpty(denRoots) ? ["fresh"] : []), ...(finishUnions ? ["held"] : []), "one", "only", ...(families ? ["ordered"] : []), "readingOf", "rowsOf", ...(Arr.some(denRoots, isScheduled) ? ["scheduleOf"] : []), "signals"])} } from "@bjornpagen/den/runtime/bind"`,
		`import { ${commas(identity)} } from "@bjornpagen/den/runtime/identity"`,
		`import type { ${commas(["FlowNeeds", ...(exclusives ? ["ExclusiveTurn"] : []), "Admission", "Ledger", "RootRunner", "ScopeView", ...(resources ? ["SeatAt"] : []), "Snapshot", "Spawned"])} } from "@bjornpagen/den/runtime/ledger"`,
		`import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"`,
		`import { type PauseChains, pauseIn, resumeIn } from "@bjornpagen/den/runtime/seats"`,
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
		`/** A step a call spawns, as the call names it: the database writes its due instant, its delay after the call's reading. */`,
		"interface SpawnRow {",
		"\treadonly step: StepKey",
		`\treadonly kind: ${scoped(r("Kind"))}`,
		"\treadonly scope: ScopeKey",
		"\treadonly delay: Delay",
		"}",
		"",
		"interface Grown {",
		"\treadonly rows: Rows",
		"\treadonly steps: ReadonlyArray<SpawnRow>",
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
		`/** The ledger of the flow ${P} over its handles, with the requests of its roots. */`,
		`export const ${n.ledger} = (h: ${n.handles}) => {`,
		`\t${noRows}`,
		"\tconst nothingGrown: Grown = { rows: noRows, steps: [], spawned: { steps: [], finishes: [] } }",
		`\tconst hasChildren = (grown: Grown, scope: ScopeKey): boolean => ${Arr.join(
			Arr.map(
				[r("StartStep"), ...(children ? [r("StartScope")] : [])],
				(started) => `Arr.some(grown.rows.${started}, (s) => s.scope === scope)`
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
		`\t\tauthenticated: Effect.asVoid(settled(h.commits.${n.program("Authenticated")}.once({ params: {}, facts: {} }))),`,
		resources
			? `\t\tholds: Effect.map(settled(h.den.${n.program("Holds")}.once({ params: {}, facts: {} })), rowsOf),`
			: "\t\tholds: Effect.succeed([]),",
		`\t\tstepOf: (step) => Effect.map(settled(h.den.${n.program("StepOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => ({ runner: runners[row.kind], scope: row.scope, root: row.root, due: row.due }))),`,
		`\t\tresultOf: (step) => Effect.map(settled(h.den.${n.program("ResultOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.outcome)),`,
		`\t\theldOf: (step) => Effect.map(settled(h.den.${n.program("HeldOf")}.once({ params: { step }, facts: {} })), (rows) => Option.map(one(rows), (row) => row.attempt)),`,
		`\t\tclaimsOf: (step) => Effect.map(settled(h.den.${n.program("ClaimsOf")}.once({ params: { step }, facts: {} })), rowsOf),`,
		`\t\tretriesOf: (step) => Effect.map(settled(h.den.${n.program("RetriesOf")}.once({ params: { step }, facts: {} })), rowsOf),`,
		`\t\tfencedOf: (step) => Effect.map(settled(h.den.${n.program("FencedOf")}.once({ params: { step }, facts: {} })), rowsOf),`,
		"\t\tscopeOf: (scope) => Effect.gen(function* () {",
		`\t\t\tconst root = yield* ${keyRead(n.program("RootOf"), "scope", "scope")}`,
		"\t\t\tif (Option.isNone(root)) {",
		...(children
			? [
					`\t\t\t\tconst within = yield* ${keyRead(n.program("WithinOf"), "scope", "scope")}`,
					'\t\t\t\treturn Option.map(within, (w): ScopeView => ({ place: "child", scope, kind: w.kind, parent: w.parent }))'
				]
			: ["\t\t\t\treturn Option.none()"]),
		"\t\t\t}",
		`\t\t\tconst admitted = yield* ${keyRead(n.program("AdmittedOf"), "scope", "scope")}`,
		`\t\t\tconst skipped = yield* ${keyRead(n.program("SkippedOf"), "scope", "scope")}`,
		...(exclusiveKeys
			? [`\t\t\tconst key = yield* ${keyRead(n.program("ExclusiveKeyOf"), "scope", "scope")}`]
			: []),
		'\t\t\tconst admission: Admission = Option.isSome(admitted) ? "admitted" : Option.isSome(skipped) ? "skipped" : "requested"',
		`\t\t\treturn Option.some<ScopeView>({ place: "root", scope, kind: root.value.kind, key: root.value.key, at: root.value.at, admission, exclusive: ${exclusiveKeys ? "Option.map(key, (k) => k.id)" : "Option.none()"}, runner: roots[root.value.kind] })`,
		"\t\t}),",
		children
			? `\t\tunended: (scope) => Effect.flatMap(h.den.${n.program("UnendedSteps")}.once({ params: { scope }, facts: {} }).pipe(settled, any), (steps) => steps ? Effect.succeed(true) : h.den.${n.program("OpenChildren")}.once({ params: { scope }, facts: {} }).pipe(settled, any)),`
			: `\t\tunended: (scope) => h.den.${n.program("UnendedSteps")}.once({ params: { scope }, facts: {} }).pipe(settled, any),`,
		`\t\tfinished: (scope) => h.den.${n.program("Finished")}.once({ params: { scope }, facts: {} }).pipe(settled, any),`,
		`\t\tbusy: ${indented("\t\t")(busyFlows)},`,
		resources
			? `\t\tclaim: (row) => Effect.flatMap(settled(h.den.${n.program("Claim")}.once({ params: { budget: row.budget }, facts: { insert: { ${r("Claim")}: [{ step: row.step, root: row.root, holds: holdsOf(row.seats) }], ${r("Ended")}: row.lapsed } } })), (outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)),`
			: `\t\tclaim: (row) => Effect.flatMap(settled(h.den.${n.program("Claim")}.once({ params: { budget: row.budget }, facts: { insert: { ${r("Claim")}: [{ step: row.step, root: row.root }], ${r("Ended")}: row.lapsed } } })), (outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)),`,
		`\t\tretry: (row) => settled(h.den.${n.program("Retry")}.once({ params: { step: row.step, attempt: row.attempt, delay: row.delay, why: row.why, root: row.root }, facts: { insert: { ${r("Ended")}: [{ step: row.step, root: row.root, attempt: row.attempt }] } } })),`,
		`\t\tfence: (row) => settled(h.den.${n.program("Fence")}.once({ params: {}, facts: { insert: { ${r("Ended")}: [{ step: row.step, root: row.root, attempt: row.attempt }], ${r("Fenced")}: [row] } } })),`,
		`\t\trefuse: ({ step, root, attempt }, law) => settled(h.den.${n.program("Refuse")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, root, outcome: "failed" }], ${r("Failed")}: [{ step, root }], ${r("Held")}: [{ step, root, attempt }], ${r("Refusal")}: [{ step, root, law }] } } })),`,
		`\t\tskip: (scope, by) => settled(h.den.${n.program("Skip")}.once({ params: {}, facts: { insert: { ${r("Skipped")}: [{ scope, by, root: scope }] } } })),`,
		`\t\texhaust: ({ step, root, attempt }) => settled(h.den.${n.program("Exhaust")}.once({ params: {}, facts: { insert: { ${r("Result")}: [{ step, root, outcome: "failed" }], ${r("Failed")}: [{ step, root }], ${r("Held")}: [{ step, root, attempt }], ${r("Exhausted")}: [{ step, root }] } } })),`,
		`\t\tfinishedRoots: Effect.map(settled(h.den.${n.program("FinishedRoots")}.once({ params: {}, facts: {} })), (rows) => Arr.map(rowsOf(rows), (row) => row.scope)),`,
		`\t\tretire: (root) => settled(h.retirer.${n.program("Retire")}.once({ params: {}, facts: { retire: { ${r("Root")}: [{ scope: root }] } } })),`,
		`\t\tsnapshot: ${indented("\t\t")(snapshot)},`,
		`\t\tchanges: Stream.mergeAll([${commas(watched)}], { concurrency: "unbounded" }),`,
		"\t\tcoordination,",
		`\t\tscheduled: [${commas(
			Arr.map(
				Arr.filter(denRoots, isScheduled),
				(j) =>
					`...Option.toArray(Option.map(scheduleOf(${kindAt(j.index)}.trigger), (s) => ({ kind: ${q(j.name)}, cron: s.cron, request: (at: Instant) => request.${j.name}(String(at), s.input(at)) })))`
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
