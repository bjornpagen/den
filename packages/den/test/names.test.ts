import {
	CompileError,
	natural,
	query,
	records,
	relation,
	schema,
	sha256,
	v
} from "@bjornpagen/grizzle"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { element } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { testWorkers } from "@bjornpagen/testing/workers"
import { assert, it } from "@effect/vitest"
import { regex } from "arkregex"
import { Array as Arr, Effect, Formatter, Option, Schema, String as Str } from "effect"
import { flow } from "#algebra/flow.ts"
import {
	always,
	atSpawn,
	given,
	none,
	operator,
	reads,
	root,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { lower } from "#lower/fragment.ts"
import { Text } from "#lower/keys.ts"
import { type Placement, printFragment } from "#lower/print.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * A step's reads state relation names for their records, and den forwards them to grizzle's records(...) of each named
 * query (kinds.ts ReadsNames): metis's one read of an item's documents, the item's document with its scan and each
 * stimulus's document with its own, under den's stem for the read, `EssayGradingItemReadDoc`, derives names past
 * PostgreSQL's 63 bytes for the scans' repeated paths (a node's document row's declaration's standalone), which grizzle
 * refuses as RecordNameTooLong naming the path, and stating a name for each scan's document row, under which its
 * children's names chain, makes every name fit.
 *
 * Oracle (specification): grizzle's records(...) over the arguments den prints, its stem, the read's query, a digest
 * owner and the read's stated names: the read that states its names compiles, every relation's name within PostgreSQL's
 * 63 bytes, and the one that states none is refused as RecordNameTooLong at the path past them; den prints the names'
 * forwarding exactly where its reads state them. Mutant it kills: printing no names, which prints a read's records
 * without them.
 */

/** Whether the read states a name for the path above the overlong one, or none. */
const Stating = Schema.Literals(["states the path above the overlong one", "states none"])
type Stating = typeof Stating.Type

const Document = relation("Document", { package: Text, path: Text }, ["package", "path"])
const Node = relation("Node", { package: Text, path: Text, start: natural, chars: Text }, [
	"package",
	"path",
	"start"
])
const XmlDecl = relation("XmlDecl", { package: Text, path: Text, version: Text }, [
	"package",
	"path"
])
const SdDecl = relation("SdDecl", { package: Text, path: Text, standalone: Text }, [
	"package",
	"path"
])
const Cite = relation("Cite", { package: Text, path: Text, start: natural, target: Text }, [
	"package",
	"path",
	"start"
])
const Bank = schema("Bank", [Document, Node, XmlDecl, SdDecl, Cite], [])

/**
 * An item's document by its key with its scan, and each stimulus it cites with its document and that document's scan,
 * each scan's node with its document's row, the row's declaration and the declaration's standalone (documentScanOf's
 * shape, metis's one read of an item's documents): the scan's names repeat under the item and under each stimulus, so
 * records chain each repeated name under its parent's.
 */
const itemDocuments = query(Bank)
	.rule((r) => {
		const { package: pkg, path } = v(Document, "document")
		return r
			.match(Document, { package: pkg, path })
			.where(
				r.eq(pkg, r.param("package", Document.fields.package)),
				r.eq(path, r.param("path", Document.fields.path))
			)
			.find({ package: pkg, path })
	})
	.attach(
		"scan",
		(document) =>
			query(Bank)
				.rule((r) => {
					const { start, chars } = v(Node, "node")
					return r
						.match(Node, { package: document.package, path: document.path, start, chars })
						.find({ package: document.package, path: document.path, start, chars })
				})
				.attach(
					"documentRow",
					(node) =>
						query(Bank)
							.rule((r) =>
								r
									.match(Document, { package: node.package, path: node.path })
									.find({ package: node.package, path: node.path })
							)
							.attach(
								"declaration",
								(row) =>
									query(Bank)
										.rule((r) => {
											const { version } = v(XmlDecl, "declaration")
											return r
												.match(XmlDecl, { package: row.package, path: row.path, version })
												.find({ package: row.package, path: row.path, version })
										})
										.attach(
											"standalone",
											(declaration) =>
												query(Bank).rule((r) => {
													const { standalone } = v(SdDecl, "standalone")
													return r
														.match(SdDecl, {
															package: declaration.package,
															path: declaration.path,
															standalone
														})
														.find({ standalone })
												}),
											"option"
										),
								"option"
							),
					"option"
				)
				.orderBy(["start", "asc"]),
		"array"
	)
	.attach(
		"stimuli",
		(item) =>
			query(Bank)
				.rule((r) => {
					const { start, target } = v(Cite, "cite")
					return r
						.match(Cite, { package: item.package, path: item.path, start, target })
						.find({ package: item.package, start, target })
				})
				.attach(
					"document",
					(cite) =>
						query(Bank)
							.rule((r) =>
								r
									.match(Document, { package: cite.package, path: cite.target })
									.find({ package: cite.package, path: cite.target })
							)
							.attach(
								"scan",
								(document) =>
									query(Bank)
										.rule((r) => {
											const { start, chars } = v(Node, "node")
											return r
												.match(Node, {
													package: document.package,
													path: document.path,
													start,
													chars
												})
												.find({ package: document.package, path: document.path, start, chars })
										})
										.attach(
											"documentRow",
											(node) =>
												query(Bank)
													.rule((r) =>
														r
															.match(Document, { package: node.package, path: node.path })
															.find({ package: node.package, path: node.path })
													)
													.attach(
														"declaration",
														(row) =>
															query(Bank)
																.rule((r) => {
																	const { version } = v(XmlDecl, "declaration")
																	return r
																		.match(XmlDecl, {
																			package: row.package,
																			path: row.path,
																			version
																		})
																		.find({ package: row.package, path: row.path, version })
																})
																.attach(
																	"standalone",
																	(declaration) =>
																		query(Bank).rule((r) => {
																			const { standalone } = v(SdDecl, "standalone")
																			return r
																				.match(SdDecl, {
																					package: declaration.package,
																					path: declaration.path,
																					standalone
																				})
																				.find({ standalone })
																		}),
																	"option"
																),
														"option"
													),
											"option"
										)
										.orderBy(["start", "asc"]),
								"array"
							),
					"option"
				)
				.orderBy(["start", "asc"]),
		"array"
	)

const params = (item: { readonly package: string; readonly path: string }) => ({
	"doc.package": item.package,
	"doc.path": item.path
})

/**
 * The item's reads, stating a name for each scan's document row, the item's and its stimuli's, under which each row's
 * declaration and standalone chain their names.
 */
const ItemReadsNamed = reads(Bank, { doc: itemDocuments }, params, {
	names: {
		doc: {
			"scan.documentRow": "EssayItemRow",
			"stimuli.document.scan.documentRow": "EssayStimulusRow"
		}
	}
})

/** The item's reads, stating no name. */
const ItemReadsDerived = reads(Bank, { doc: itemDocuments }, params)

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

/** metis's essay grading, its item step reading the item's document. */
const grading = (stating: Stating) => {
	const Application = Schema.Struct({ package: Schema.String, path: Schema.String })
	const Item = step(
		"Item",
		{
			input: Application,
			output: Schema.Struct({}),
			error: Schema.Never,
			reads: stating === "states none" ? ItemReadsDerived : ItemReadsNamed,
			awaits: [],
			uses: [],
			retry: none,
			waits: none,
			due: atSpawn,
			writes: writesNothing
		},
		() => Effect.succeed({ output: {} })
	)
	const Sitting = root("Sitting", {
		trigger: operator,
		from: given,
		input: Schema.Struct({}),
		children: [Item],
		start: () => [],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	})
	return flow("EssayGrading", {
		writes: writer<{ readonly name: "grader" }>("grader"),
		kinds: [Item, Sitting],
		edges: []
	})
}

/** Where the fragment is placed; it is printed, never loaded. */
const placement: Placement = {
	fragment: "#fragment.ts",
	programs: "#programs.ts",
	relations: "#relations.ts",
	schema: { from: "#app.ts", name: "App" },
	writer: { from: "#roles.ts", name: "Grader" },
	flow: { from: "#flows.ts", name: "flow" },
	reads: { from: "#reads.ts", exports: {} }
}

/**
 * How records(...) refused: its compile error's reason's tag and the path it names (its attachment names, joined by
 * `.`).
 */
const refusalOf = (thrown: unknown): { readonly tag: string; readonly path: string } =>
	thrown instanceof CompileError
		? {
				tag: thrown.reason._tag,
				path: thrown.reason._tag === "RecordNameTooLong" ? Arr.join(thrown.reason.path, ".") : ""
			}
		: { tag: "another refusal", path: String(thrown) }

/** PostgreSQL's identifiers, in bytes: what no relation name's conversion may pass. */
const identifierBytes = 63

/** A lowercase letter or a digit and the capital after it, where grizzle's conversion puts an underscore. */
const WORD_BOUNDARY = regex("([a-z0-9])([A-Z])", "g")

/** A relation's name as PostgreSQL holds it, grizzle's conversion: its words lowercased, joined by underscores. */
const conversion = (name: string): string =>
	Str.toLowerCase(Str.replaceAll(WORD_BOUNDARY, "$1_$2")(name))

it.effect(
	"forwards a read's stated record names, which fit a deep read's names grizzle refuses without them",
	(ctx) =>
		searched(
			ctx,
			exhaust(
				{
					suite: "record names",
					generator: element(Stating.literals),
					literal: Formatter.format,
					coverage: requiredInSpace<Stating>(Stating.literals),
					caseHang: caseHangMillis,
					box: "metis's item read, a document with its scan, each node's document row, declaration and standalone",
					oracle: {
						kind: "specification",
						name: "grizzle's records(...) over the arguments den prints, and den's forwarding where names are stated"
					},
					concurrency: testWorkers
				},
				(stating, c) =>
					Effect.gen(function* () {
						c.note(stating)
						const lowered = lower(grading(stating))
						const stem = Option.getOrThrow(
							Arr.findFirst(
								Arr.flatMap(lowered.steps, (s) => s.reads),
								(read) => read.name === "doc"
							)
						).stem
						assert.strictEqual(stem, "EssayGradingItemReadDoc")
						const forwarded = ", { names: ItemReads.options[0].names.doc }"
						assert.include(
							printFragment(lowered, placement),
							`records("EssayGradingItemReadDoc", ItemReads.named.doc, { digest: sha256 }, ["digest"]${stating === "states none" ? "" : forwarded})`,
							"den prints the read's records with its stated names, and without where it states none"
						)
						if (stating === "states none") {
							const refused = yield* Effect.flip(
								Effect.try({
									try: () =>
										records(
											"EssayGradingItemReadDoc",
											ItemReadsDerived.named.doc,
											{ digest: sha256 },
											["digest"]
										),
									catch: refusalOf
								})
							)
							assert.deepStrictEqual(
								refused,
								{ tag: "RecordNameTooLong", path: "scan.documentRow.declaration.standalone" },
								"the derived names refuse a scan's deepest path, past PostgreSQL's bytes"
							)
						} else {
							const made = yield* Effect.try({
								try: () =>
									records(
										"EssayGradingItemReadDoc",
										ItemReadsNamed.named.doc,
										{ digest: sha256 },
										["digest"],
										{ names: ItemReadsNamed.options[0].names.doc }
									),
								catch: refusalOf
							})
							const names: ReadonlyArray<string> = Arr.map(
								made.relations,
								(rel): string => rel.name
							)
							assert.isTrue(
								Arr.every(names, (name) => Str.length(conversion(name)) <= identifierBytes),
								"every relation's name fits PostgreSQL's identifiers"
							)
							assert.isTrue(
								Arr.contains(names, "EssayStimulusRowDeclarationStandalone"),
								"a stated name leads its children's derived names"
							)
						}
					})
			)
		)
)
