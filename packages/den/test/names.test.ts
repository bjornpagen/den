import {
	type AnyRoster,
	closedId,
	conversionOf,
	type FieldBase,
	natural,
	parseDeclaredName,
	pg,
	query,
	recordPaths,
	relation,
	schema,
	sha256,
	v
} from "@bjornpagen/grizzle"
import { installedIdentifiersOf, lawsOf } from "@bjornpagen/grizzle/compile"
import * as Dynamic from "@bjornpagen/grizzle/dynamic"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import {
	array,
	constant,
	element,
	type Gen,
	int,
	map,
	uniqueArray,
	weighted
} from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, it } from "@effect/vitest"
import { regex } from "arkregex"
import {
	Array as Arr,
	Effect,
	Formatter,
	Option,
	Record as Rec,
	Schema,
	String as Str
} from "effect"
import { type AnyFlow, flow, stepsOf } from "#algebra/flow.ts"
import {
	type AnyEdge,
	type AnyStepKind,
	always,
	atSpawn,
	edge,
	given,
	none,
	operator,
	type ReadsOver,
	nameBytes,
	Refused,
	root,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { type FieldType, type Lowered, lower } from "#lower/fragment.ts"
import { DenEnvironment, DenInstant, Text } from "#lower/keys.ts"
import { type Placement, printBinding, printFragment } from "#lower/print.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * den's naming door (lower/names.ts): every name den gives grizzle stays readable, the schema type's key and its row
 * maps', which apps name in source: a flow's singletons `<P><Word>`, declared, refused at den's door, naming the flow,
 * where they cannot fit; every other relation and roster name den composes from a flow's names (`<P><Step>Input`, an
 * option's `<Relation><Field>`, an edge's `<P><Edge>`, a read's `<P><Step>Read<Read>`), of any length, held by grizzle's
 * derived naming, its every identifier hashed, so no nesting and no length of a flow's names carries a PostgreSQL
 * identifier past 63 bytes; two identities whose readable names meet are refused by den's census; and a read's records
 * take the names grizzle derives, readable, their identifiers hashed too.
 *
 * Property: over drawn flows, a flow's name, its steps' names, their input fields' names and forms, their reads' names
 * and an edge's name each of one to six words drawn from a vocabulary whose words compose into one another (so two
 * identities' readable names can meet) and run long, and each read's query nested to any of the depths its box holds:
 * a flow whose name fits den's longest word beside it and whose steps' names fit a roster's handle is lowered or
 * refused as two identities meeting, whose names the refusal names and whose conversions meet, and any other is
 * refused at den's door, naming the flow or the step; a lowered flow names each kind's input and output, its edge and
 * each read by the readable composition of their names; no identifier or row map's key den prints holds a digest; no
 * two declarations share a conversion, each read's records' among them; and a schema of every relation and roster the
 * lowering names, each by its naming, and every read's records compiles through grizzle with every PostgreSQL
 * identifier it installs within 63 bytes.
 *
 * Kept case: metis's essay flow, whose item step reads the stimuli its item cites with each stimulus's document and the
 * document's scan nested under the citation (metis packages/essay-grading/src/documents.ts and reads.ts, delivery's
 * scannedDocument, pantry's documentScanOf), where den's readable composition of the deepest records path,
 * `EssayItemReadCitedDocumentScanDocumentRowDeclarationStandalone`, passes PostgreSQL's bytes: it must reach that.
 *
 * Oracle (specification): the readable compositions, grizzle's conversion and compile, and PostgreSQL's 63 bytes.
 * Mutant it kills: the digest back in a derived name (`name: \`${name}_${digest}\``), which prints a digest into the
 * fragment's identifiers and row maps' keys and names no kind's input by its composition.
 */

/** The level the reads are over: the nodes of documents, one relation every query of the box reads. */
const Node = relation("Node", { doc: Text, at: natural }, ["doc", "at"])
const Docs = schema("Docs", [Node], [])

/** A query of every node: each level of a box's query, whose head names none of its attachments. */
const nodes = () =>
	query(Docs).rule((r) => {
		const { doc, at } = v(Node, "node")
		return r.match(Node, { doc, at }).find({ doc, at })
	})

/**
 * metis's item read of its cited stimuli: each citation with its stimulus's document, the document with its scan, and
 * each scanned node with what documentScanOf attaches to it, the document row's declaration with its encoding and its
 * standalone, an attribute's entities among them. Every child is an array of nodes: a records' relation is named by its
 * path alone, never by its delivery.
 */
const citedWithScans = nodes().attach(
	"document",
	() =>
		nodes().attach(
			"scan",
			() =>
				nodes()
					.attach("comment", () => nodes(), "array")
					.attach("pi", () => nodes(), "array")
					.attach("doctype", () => nodes(), "array")
					.attach("elementType", () => nodes(), "array")
					.attach("openElementType", () => nodes(), "array")
					.attach("openElementName", () => nodes(), "array")
					.attach(
						"documentRow",
						() =>
							nodes().attach(
								"declaration",
								() =>
									nodes()
										.attach("encoding", () => nodes(), "array")
										.attach("standalone", () => nodes(), "array"),
								"array"
							),
						"array"
					)
					.attach("attributes", () => nodes().attach("entities", () => nodes(), "array"), "array")
					.attach(
						"openAttributes",
						() => nodes().attach("entities", () => nodes(), "array"),
						"array"
					)
					.attach("namespaces", () => nodes(), "array"),
			"array"
		),
	"array"
)

/**
 * A long attachment's name, its conversion within PostgreSQL's identifier, as the count column its parent's records hold
 * under it must be: a path of two already passes PostgreSQL's bytes.
 */
const deeper = "everyDocumentTheCitationNamesWithItsScannedNodes"

/** A query nested six levels deep under the one long attachment name, repeated at every level. */
const deep1 = nodes().attach(deeper, () => nodes(), "array")
const deep2 = nodes().attach(deeper, () => deep1, "array")
const deep3 = nodes().attach(deeper, () => deep2, "array")
const deep4 = nodes().attach(deeper, () => deep3, "array")
const deep5 = nodes().attach(deeper, () => deep4, "array")
const deep6 = nodes().attach(deeper, () => deep5, "array")

/** The queries a read is drawn from: flat, nested one to six levels under a long name, and metis's citations. */
const box = [nodes(), deep1, deep2, deep3, deep4, deep5, deep6, citedWithScans] as const

/**
 * The words a name is drawn of: den's own words among them, so a flow's names compose into the names den composes (an
 * edge named as a step's input's option), and long ones, so a name runs past PostgreSQL's bytes.
 */
const words = [
	"Page",
	"Input",
	"Output",
	"Read",
	"Value",
	"Key",
	"Row",
	"Item",
	"Documentation",
	"CitationOfTheStimulus"
] as const

/** A PascalCase name of one to `most` words. */
const pascal = (most: number): Gen<string> =>
	map(array(element(words), { min: 1, max: most }), (drawnWords) => Arr.join(drawnWords, ""))

/** A camelCase name of one to `most` words. */
const camel = (most: number): Gen<string> => map(pascal(most), Str.uncapitalize)

/** What a drawn input field holds. */
const Form = Schema.Literals(["text", "finite", "literals", "option", "array", "union"])
type Form = typeof Form.Type

/** A drawn flow: its name, its steps' names and fields, the first step's reads by their box index, and an edge's name. */
interface Drawn {
	readonly flow: string
	readonly root: string
	readonly steps: readonly [string, string]
	readonly fields: ReadonlyArray<{ readonly name: string; readonly form: Form }>
	readonly reads: ReadonlyArray<{ readonly name: string; readonly query: number }>
	readonly edge: string
}

const fieldOf = (form: Form) => {
	switch (form) {
		case "text":
			return Schema.String
		case "finite":
			return Schema.Finite
		case "literals":
			return Schema.Literals(["low", "high"])
		case "option":
			return Schema.Option(Schema.String)
		case "array":
			return Schema.Array(Schema.BigInt)
		case "union":
			return Schema.TaggedUnion({ Serve: { item: Schema.String }, Rest: {} })
	}
}

const finishing = {
	reads: [],
	output: Schema.Struct({}),
	error: Schema.Never,
	uses: [],
	retry: none,
	waits: none,
	writes: writesNothing,
	body: () => Effect.succeed({ output: {} })
} as const

/** The reads a step declares: each named query of the box, none where it reads nothing. */
const readsOf = <I>(reads: Drawn["reads"]): ReadsOver<I> =>
	Arr.isReadonlyArrayNonEmpty(reads)
		? {
				kind: "query",
				over: Docs,
				named: Rec.fromEntries(
					Arr.map(reads, (read) => [read.name, Arr.getUnsafe(box, read.query)] as const)
				),
				params: () => ({})
			}
		: { kind: "none" }

/** A drawn flow, built: its first step reading, its second spawned by the edge from it, both started by its root. */
const built = (d: Drawn): AnyFlow => {
	const input = Schema.Struct(
		Rec.fromEntries(Arr.map(d.fields, (field) => [field.name, fieldOf(field.form)] as const))
	)
	const first = step(
		d.steps[0],
		{
			input,
			output: Schema.Struct({}),
			error: Schema.Never,
			reads: readsOf(d.reads),
			awaits: [],
			uses: [],
			retry: none,
			waits: none,
			due: atSpawn,
			writes: writesNothing
		},
		() => Effect.succeed({ output: {} })
	)
	const second = step(
		d.steps[1],
		{
			input: Schema.Struct({}),
			output: Schema.Struct({}),
			error: Schema.Never,
			reads: { kind: "none" },
			awaits: [],
			uses: [],
			retry: none,
			waits: none,
			due: atSpawn,
			writes: writesNothing
		},
		() => Effect.succeed({ output: {} })
	)
	const kinds: ReadonlyArray<AnyStepKind> = [first, second]
	const edges: ReadonlyArray<AnyEdge> = [edge(d.edge, first, second, () => [{}])]
	const run = root(d.root, {
		trigger: operator,
		from: given,
		input: Schema.Struct({}),
		children: [first],
		start: () => [],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	})
	return flow(d.flow, {
		writes: writer<{ readonly name: "loader" }>("loader"),
		kinds: [...kinds, run],
		edges
	})
}

/**
 * The longest word den lowers a flow's singletons by, in its conversion's bytes: `RequestedWith`, every flow's, whose
 * conversion is `requested_with`; a flow whose name's conversion leaves it room fits every singleton but a seat's.
 */
const longestWordBytes = Str.length("_requested_with")

/** The census's refusal of two identities meeting: the conversion, and the two names. */
const MET = regex("meet under the name (\\S+): (\\S+) and (\\S+)$")

/** A digest den once put in a derived name: an underscore and thirteen letters from a to p, closing a name. */
const DIGESTED = regex("_[a-p]{13}(?![A-Za-z0-9_])")

/** A field as grizzle declares it, for the schema that compiles the lowering's names. */
const fieldExpr = (type: FieldType, rosters: ReadonlyMap<string, AnyRoster>): FieldBase => {
	switch (type.kind) {
		case "key":
			return type.contract === "DenInstant" ? DenInstant : DenEnvironment
		case "digest":
			return sha256
		case "natural":
		case "place":
		case "drawn":
			return natural
		case "closed":
			return Option.match(Option.fromNullishOr(rosters.get(type.roster)), {
				onNone: () => Text,
				onSome: (roster) => closedId(roster)
			})
		case "brand":
		case "app":
		case "vector":
			return Text
		case "base":
			switch (type.base) {
				case "text":
					return Text
				case "bigint":
					return pg.bigint
				case "double":
					return pg["double precision"]
				case "boolean":
					return pg.boolean
			}
	}
}

/** A roster as grizzle's dynamic door declares it, by its naming. */
const rosterOf = (r: Lowered["rosters"][number]): AnyRoster => {
	switch (r.naming.kind) {
		case "declared":
			return Dynamic.closed.unordered(r.name, r.handles)
		case "derived":
			return Dynamic.derivedName(r.naming).unordered(r.name, r.handles)
	}
}

/** Where the probe prints a lowering's modules: printed, never loaded. */
const placement: Placement = {
	fragment: "#fragment.ts",
	programs: "#programs.ts",
	relations: "#relations.ts",
	schema: { from: "#app.ts", name: "App" },
	writer: { from: "#roles.ts", name: "Loader" },
	flow: { from: "#flows.ts", name: "flow" },
	reads: { from: "#reads.ts", exports: {} }
}

/** Whatever a lowering's names hold, checked against grizzle (see the module's doc); `what` names the case. */
const namesHold = (d: Drawn, declaredFlow: AnyFlow, lowered: Lowered, what: string): void => {
	const P = d.flow
	const relationNames = Arr.map(lowered.relations, (r) => r.name)
	Arr.forEach(
		[
			`${P}${d.steps[0]}Input`,
			`${P}${d.steps[0]}Output`,
			`${P}${d.steps[1]}Input`,
			`${P}${d.edge}`,
			...Arr.map(d.reads, (read) => `${P}${d.steps[0]}Read${Str.capitalize(read.name)}`)
		],
		(expected) =>
			assert.isTrue(
				Arr.contains(relationNames, expected),
				`${what}: den names ${expected} by its readable composition`
			)
	)
	const printed = Arr.join(
		[printFragment(lowered, placement), printBinding(lowered, placement)],
		"\n"
	)
	assert.isFalse(
		DIGESTED.test(printed),
		`${what}: no printed identifier or row map's key names a digest`
	)
	const checks = Arr.flatMap(lowered.laws, (law) => (law.kind === "check" ? [law] : []))
	Arr.forEach(checks, (check) =>
		assert.isTrue(parseDeclaredName(check.name).ok, `${what}: grizzle admits ${check.name}`)
	)
	const rosters = new Map(Arr.map(lowered.rosters, (r) => [r.name, rosterOf(r)] as const))
	const relations = Arr.map(lowered.relations, (r) => {
		const fields = Rec.fromEntries(
			Arr.map(r.fields, (f) => [f.name, fieldExpr(f.type, rosters)] as const)
		)
		switch (r.naming.kind) {
			case "declared":
				return Dynamic.relation(r.name, fields, r.key)
			case "derived":
				return Dynamic.derivedName(r.naming).relation(r.name, fields, r.key)
		}
	})
	const records = Arr.flatMap(stepsOf(declaredFlow.kinds), (kind) =>
		Arr.flatMap(
			kind.reads.kind === "query" ? Rec.toEntries(kind.reads.named) : [],
			([readName, readQuery]) =>
				Arr.flatMap(lowered.steps, (s) =>
					s.name === kind.name
						? Arr.flatMap(s.reads, (read) =>
								read.name === readName
									? [
											Dynamic.records(read.stem, readQuery, { digest: sha256 }, ["digest"], {
												names: {}
											})
										]
									: []
							)
						: []
				)
		)
	)
	const conversions = Arr.map(
		[
			...relationNames,
			...Arr.map(lowered.rosters, (r) => r.name),
			...Arr.flatMap(records, (made) => Arr.map(made.relations, (r) => r.name))
		],
		conversionOf
	)
	assert.strictEqual(
		Arr.dedupe(conversions).length,
		conversions.length,
		`${what}: no two declarations meet under one name`
	)
	const level = schema(
		"Names",
		[...rosters.values(), ...relations, ...Arr.flatMap(records, (made) => made.relations)],
		Arr.flatMap(records, (made) => made.rules)
	)
	lawsOf(level)
	Arr.forEach(installedIdentifiersOf(level), ({ identifier, display }) =>
		assert.isAtMost(
			new TextEncoder().encode(identifier).length,
			nameBytes,
			`${what}: ${display}'s identifier ${identifier} fits PostgreSQL's`
		)
	)
}

/**
 * A drawn input field's name: of one to three of the short words, so it composes into den's names as the others do and
 * fits grizzle's own door for a column, the author's name verbatim, a closed id's decoded column `<field>_name` beside
 * it.
 */
const fieldGen: Gen<string> = map(
	array(element(["page", "input", "output", "value", "key", "row", "item"] as const), {
		min: 1,
		max: 3
	}),
	(drawnWords) => Str.uncapitalize(Arr.join(Arr.map(drawnWords, Str.capitalize), ""))
)

/**
 * A drawn flow (Drawn): every name of one to six words, the first step's reads each a query of the box, its edge named
 * now and then as the first step's input, whose readable name the edge's relation meets.
 */
const drawnFlow: Gen<Drawn> = (source) => {
	const first = source.draw(pascal(6))
	return {
		flow: source.draw(pascal(5)),
		root: "Run",
		steps: [first, `${first}${source.draw(pascal(2))}`],
		fields: source.draw(
			uniqueArray(fieldGen, (name) => map(element(Form.literals), (form) => ({ name, form })), {
				min: 0,
				max: 3
			})
		),
		reads: source.draw(
			uniqueArray(camel(6), (name) => map(int(0, box.length - 1), (at) => ({ name, query: at })), {
				min: 0,
				max: 2
			})
		),
		edge: source.draw(
			weighted([
				[3, pascal(6)],
				[1, constant(`${first}Input`)]
			])
		)
	}
}

type Feature =
	| "refused at den's door"
	| "two identities meeting under one name, refused"
	| "lowered"
	| "a read nested two levels or more"
	| "a step whose readable names pass PostgreSQL's bytes"
	| "a records path whose readable name passes PostgreSQL's bytes"

/**
 * The readable name den once composed for the records at `path` of the read `read` of `stepName` of `flowName`: the
 * flow's, the step's, `Read`, the read's and each attachment's names, capitalized and joined, which passes PostgreSQL's
 * bytes where nesting runs deep.
 */
const readableRecordsName = (
	flowName: string,
	stepName: string,
	read: string,
	path: string
): string =>
	Arr.join(Arr.map([flowName, stepName, "Read", read, ...Str.split(path, ".")], Str.capitalize), "")

/** Lowers a drawn flow: its refusal at den's door, or its names held against grizzle. */
const lowersWithin = (d: Drawn, note: (feature: Feature) => void): Effect.Effect<void> =>
	Effect.gen(function* () {
		const fits =
			Str.length(conversionOf(d.flow)) + longestWordBytes <= nameBytes &&
			Arr.every(d.steps, (name) => Str.length(name) <= nameBytes)
		const lowering = yield* Effect.result(
			Effect.try({
				try: () => {
					const declaredFlow = built(d)
					return { declaredFlow, lowered: lower(declaredFlow) }
				},
				catch: (thrown): Option.Option<Refused> =>
					thrown instanceof Refused ? Option.some(thrown) : Option.none()
			})
		)
		if (lowering._tag === "Failure") {
			const refused = lowering.failure
			const met = Option.flatMap(refused, (r) => Option.fromNullishOr(MET.exec(r.why)))
			if (Option.isSome(met)) {
				const [, conversion, first, second] = met.value
				assert.isTrue(
					conversionOf(first) === conversion && conversionOf(second) === conversion,
					`two identities refused only where their names meet: ${Formatter.format(refused)}`
				)
				note("two identities meeting under one name, refused")
				return
			}
			note("refused at den's door")
			assert.isTrue(
				Option.exists(refused, (r) =>
					Arr.contains(
						[`flow ${d.flow}`, ...Arr.map(d.steps, (name) => `step ${name}`)],
						r.declaration
					)
				),
				`a refusal is den's, naming the flow or a step: ${Formatter.format(refused)}`
			)
			assert.isFalse(fits, `a flow whose names fit is never refused: ${Formatter.format(refused)}`)
			return
		}
		note("lowered")
		if (Arr.some(d.reads, (read) => read.query >= 2)) {
			note("a read nested two levels or more")
		}
		if (Str.length(conversionOf(`${d.flow}${d.steps[0]}Output`)) > nameBytes) {
			note("a step whose readable names pass PostgreSQL's bytes")
		}
		if (
			Arr.some(d.reads, (read) =>
				Arr.some(
					recordPaths(Arr.getUnsafe(box, read.query)),
					(path) => !parseDeclaredName(readableRecordsName(d.flow, d.steps[0], read.name, path)).ok
				)
			)
		) {
			note("a records path whose readable name passes PostgreSQL's bytes")
		}
		namesHold(d, lowering.success.declaredFlow, lowering.success.lowered, Formatter.format(d))
	})

/** The kept case's flow: metis's essay grading, its item step reading its citations with their scans nested. */
const metisEssay: Drawn = {
	flow: "Essay",
	root: "Sitting",
	steps: ["Item", "Xml"],
	fields: [],
	reads: [{ name: "cited", query: 7 }],
	edge: "Cites"
}

it.effect(
	"names every derived declaration in one form within PostgreSQL's bytes, each identity its own",
	(ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "den's names",
					oracle: {
						kind: "specification",
						name: "the readable compositions, grizzle's conversion and compile, and PostgreSQL's 63 bytes"
					},
					draw: drawn(drawnFlow),
					literal: Formatter.format,
					coverage: required<Feature>(
						[
							"refused at den's door",
							"two identities meeting under one name, refused",
							"lowered",
							"a read nested two levels or more",
							"a step whose readable names pass PostgreSQL's bytes",
							"a records path whose readable name passes PostgreSQL's bytes"
						],
						{ cases: 60, sense: notesOnly }
					),
					kept: [
						{
							note: "metis's essay flow: its item step reads the stimuli its item cites with each stimulus's document and the document's scan nested under the citation, whose readable records name EssayItemReadCitedDocumentScanDocumentRowDeclarationStandalone passes PostgreSQL's bytes (metis packages/essay-grading/src/documents.ts and reads.ts, delivery's scannedDocument, pantry's documentScanOf)",
							sketch: metisEssay,
							draws: "",
							reaches: [
								"lowered",
								"a read nested two levels or more",
								"a records path whose readable name passes PostgreSQL's bytes"
							]
						}
					],
					runs: 120,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				(d, c) => lowersWithin(d, c.note)
			)
		)
)
