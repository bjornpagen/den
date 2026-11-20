import { natural, pg, relation } from "@bjornpagen/grizzle"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option, Schema, String as Str } from "effect"
import { type AnyFlow, flow } from "#algebra/flow.ts"
import {
	type AnyEdge,
	type AnyStepKind,
	anchor,
	always,
	atSpawn,
	attempts,
	edge,
	exclusiveBy,
	type FieldSchema,
	nearest,
	operator,
	rows,
	resource,
	root,
	scope,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { type LawIR, lower } from "#lower/fragment.ts"
import { type Placement, printFragment } from "#lower/print.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * Lowering a flow: every relation and roster it declares carries the flow's prefix, every law names only relations the
 * fragment declares, an Option field lowers to a relation of its own, and its printing is a function of the flow. The
 * selected sides of a step's Result each have one source alone, its Done or its Failed arm, every output, error,
 * refusal and exhaustion contained in that arm by its plain key: a selected side with several sources is discharged by a
 * generated column grizzle's certifier reads as an unsealed foreign key check, which takes every writer of the flow to
 * SERIALIZABLE. The coordination relations (each seat's, exclusivity seat's and pause's chain of turns) meet no graph
 * relation in a containment; each chain's turns are keyed by its coordinates and turn, its ends contained in its turns
 * and each turn's predecessor in its ends; the exclusivity chain exists exactly when a root is exclusive, and the seat
 * chain, with its seat counts and its seat level, the live holds checked below them, exactly when a step uses a resource.
 * A scope's kind is its place's: a root's on its Root row, among the flow's roots, and a child scope's on its Within
 * row, among its child scope kinds, whose relations (Within, StartScope) exist exactly when the flow declares one.
 * Every graph relation but the root is a body of one retirable unit headed by the root: its root in every key and on
 * both sides of every containment between bodies, and no coordination relation carries one.
 *
 * Oracle (specification): the proposal's sections 5 and 6, over flows of up to three steps, chained or not, of each
 * field form, with or without a resource, an exclusive root, a child scope, a rows read, a nearest read and a typed
 * error. A nearest read records its neighbours without the vector they were ranked by and with their distance, and a
 * finite number is held finite by a row check.
 */

const Form = Schema.Literals([
	"text",
	"bigint",
	"finite",
	"boolean",
	"literals",
	"brand",
	"option",
	"array",
	"structs",
	"union"
])
type Form = typeof Form.Type

type Feature =
	| Form
	| "chained"
	| "unchained"
	| "a resource"
	| "an exclusive root"
	| "a child scope"
	| "a rows read"
	| "a nearest read"
	| "a typed error"

/** Which reads the first step declares: none, a rows read, a nearest read, or both. */
const Reading = Schema.Literals(["none", "rows", "nearest", "both"])

interface Sketch {
	readonly prefix: "Alpha" | "Beta"
	readonly steps: number
	readonly chained: boolean
	readonly form: Form
	readonly resource: boolean
	readonly exclusive: boolean
	readonly scoped: boolean
	readonly reads: typeof Reading.Type
	readonly typed: boolean
}

const sketches: Gen<Sketch> = (source) => ({
	prefix: source.draw(boolean) ? "Alpha" : "Beta",
	steps: source.draw(int(1, 3)),
	chained: source.draw(boolean),
	form: source.draw(element(Form.literals)),
	resource: source.draw(boolean),
	exclusive: source.draw(boolean),
	scoped: source.draw(boolean),
	reads: source.draw(element(Reading.literals)),
	typed: source.draw(boolean)
})

const fieldOf = (form: Form): FieldSchema => {
	switch (form) {
		case "text":
			return Schema.String
		case "bigint":
			return Schema.BigInt
		case "finite":
			return Schema.Finite
		case "boolean":
			return Schema.Boolean
		case "literals":
			return Schema.Literals(["low", "high"])
		case "brand":
			return Schema.BigInt.pipe(Schema.brand("Level"))
		case "option":
			return Schema.Option(Schema.String)
		case "array":
			return Schema.Array(Schema.BigInt)
		case "structs":
			return Schema.Array(Schema.Struct({ item: Schema.String, weight: Schema.Finite }))
		case "union":
			return Schema.TaggedUnion({ Serve: { item: Schema.String }, Rest: {} })
	}
}

/** An app relation a step may read: a feed's weight. */
const Weight = relation("Weight", { feed: pg.bigint, factor: natural }, ["feed", "factor"])

/** The suite's own vector width. */
const passageDimensions = 4

/** An app relation a step's nearest read ranks: a passage and its embedding. */
const Passage = relation(
	"Passage",
	{ passage: pg.bigint, embedding: pg.vector(passageDimensions) },
	["passage"]
)

/** How many passages a nearest read finds at most, the suite's own size. */
const passagesFound = 2

/** The anchor a nearest read searches from: a question's stored embedding, named by its key. */
const Question = relation(
	"Question",
	{ question: pg.bigint, embedding: pg.vector(passageDimensions) },
	["question"]
)

/** The reads a sketch's first step declares. */
const readsOf = (reading: typeof Reading.Type) => ({
	...(reading === "rows" || reading === "both"
		? { weights: rows(Weight, ["feed"], () => ({ feed: 0n })) }
		: {}),
	...(reading === "nearest" || reading === "both"
		? {
				passages: nearest(
					Passage,
					"embedding",
					passagesFound,
					[],
					anchor(Question, "embedding"),
					() => ({
						anchor: { question: 0n }
					})
				)
			}
		: {})
})

/**
 * The box of grizzle's own work-queue law suite: two seats.
 *
 * @limitKind published
 * @owner the lowering suite's resource, after grizzle's work-queue law suite
 * @unit seats
 * @scope the steps of a lowered flow that use the Pool
 * @constraint compile-time constant
 * @source https://github.com/bjornpagen/grizzle/blob/a226cbac/test/support/laws/boxes.ts
 * @quote Two resources of two seats each: two leases meet at a seat as often as they miss it.
 * @verified 2026-11-11
 */
const boxSeats = 2

const finishing = {
	reads: [],
	output: Schema.Struct({}),
	error: Schema.Never,
	uses: [],
	retry: attempts(1),
	waits: 0,
	writes: writesNothing,
	body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
} as const

const built = (sketch: Sketch): AnyFlow => {
	const value = Schema.Struct({ value: fieldOf(sketch.form) })
	const pool = resource("Pool", boxSeats)
	const done = (x: typeof value.Type) =>
		Effect.succeed({ output: x, writes: { insert: {}, put: {}, delete: {} } })
	const first = step(
		"S0",
		{
			input: value,
			output: value,
			error: sketch.typed ? Schema.Struct({ code: Schema.String }) : Schema.Never,
			reads: readsOf(sketch.reads),
			awaits: [],
			uses: sketch.resource ? [pool] : [],
			retry: attempts(1),
			waits: 0,
			due: atSpawn,
			writes: writesNothing
		},
		done
	)
	const later: ReadonlyArray<AnyStepKind> = Array.from({ length: sketch.steps - 1 }, (_, at) =>
		step(
			`S${at + 1}`,
			{
				input: value,
				output: value,
				error: Schema.Never,
				reads: {},
				awaits: [],
				uses: [],
				retry: attempts(1),
				waits: 0,
				due: atSpawn,
				writes: writesNothing
			},
			done
		)
	)
	const steps: ReadonlyArray<AnyStepKind> = [first, ...later]
	const edges: ReadonlyArray<AnyEdge> = sketch.chained
		? Arr.flatMap(
				Array.from({ length: sketch.steps - 1 }, (_, at) => at + 1),
				(i) =>
					Option.toArray(
						Option.zipWith(Arr.get(steps, i - 1), Arr.get(steps, i), (from, to) =>
							edge(`E${i}`, from, to, () => [])
						)
					)
			)
		: []
	const Leaf = step(
		"Leaf",
		{
			input: value,
			output: value,
			error: Schema.Never,
			reads: {},
			awaits: [],
			uses: [],
			retry: attempts(1),
			waits: 0,
			due: atSpawn,
			writes: writesNothing
		},
		done
	)
	const Inner = scope("Inner", {
		input: Schema.Struct({}),
		children: [Leaf],
		start: () => [],
		finish: finishing
	})
	const Run = root("Run", {
		trigger: operator,
		input: Schema.Struct({}),
		children: sketch.scoped ? [...steps, Inner] : steps,
		start: () => [],
		exclusive: sketch.exclusive ? exclusiveBy(() => "k") : shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	})
	return flow(sketch.prefix, {
		writes: writer<{ readonly name: "loader" }>("loader"),
		kinds: sketch.scoped ? [...steps, Leaf, Inner, Run] : [...steps, Run],
		edges: sketch.scoped ? [...edges, edge("After", Inner, first, () => [])] : edges
	})
}

/** The containments of a set of laws, by their sides' relations and the target's selection. */
const containmentsOf = (laws: ReadonlyArray<LawIR>) =>
	Arr.flatMap(laws, (law) => (law.kind === "contained" ? [law] : []))

it.effect(
	"lowers each flow under its prefix, its Result's arms and its coordination group apart",
	(ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "lowering",
					oracle: {
						kind: "specification",
						name: "the proposal's sections 5 and 6 rules for a fragment"
					},
					draw: drawn(sketches),
					literal: Formatter.format,
					coverage: required<Feature>(
						[
							...Form.literals,
							"chained",
							"unchained",
							"a resource",
							"an exclusive root",
							"a child scope",
							"a rows read",
							"a nearest read",
							"a typed error"
						],
						{ cases: 80, sense: notesOnly }
					),
					kept: [],
					runs: 160,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				(sketch, c) =>
					Effect.sync(() => {
						c.note(sketch.form)
						c.note(sketch.chained && sketch.steps > 1 ? "chained" : "unchained")
						if (sketch.resource) {
							c.note("a resource")
						}
						if (sketch.exclusive) {
							c.note("an exclusive root")
						}
						if (sketch.scoped) {
							c.note("a child scope")
						}
						const reading = {
							rows: sketch.reads === "rows" || sketch.reads === "both",
							nearest: sketch.reads === "nearest" || sketch.reads === "both"
						}
						if (reading.rows) {
							c.note("a rows read")
						}
						if (reading.nearest) {
							c.note("a nearest read")
						}
						if (sketch.typed) {
							c.note("a typed error")
						}
						const f = built(sketch)
						const P = f.name
						const lowered = lower(f)
						const relations = Arr.map(lowered.relations, (r) => r.name)
						const counts = Arr.flatMap(Option.toArray(lowered.seats), (seats) => [
							seats.counts.name,
							seats.live
						])
						const names = [...relations, ...counts, ...Arr.map(lowered.rosters, (r) => r.name)]
						const has = (suffix: string) => Arr.contains(relations, `${P}${suffix}`)
						assert.isTrue(Arr.every(names, Str.startsWith(P)))
						const sides = Arr.flatMap(lowered.laws, (law) => {
							switch (law.kind) {
								case "contained":
									return [law.from.relation, law.to.relation]
								case "key":
									return [law.side.relation]
								case "retirable":
									return [law.header, ...law.bodies]
								case "ordered":
									return [law.member.relation, law.owner]
								case "race":
								case "check":
									return [law.relation]
							}
						})
						assert.isTrue(Arr.every(sides, (side) => Arr.contains(names, side)))
						assert.strictEqual(
							has("S0InputValue"),
							sketch.form === "option" || sketch.form === "array" || sketch.form === "structs"
						)
						const keyed = (name: string) =>
							Option.map(
								Arr.findFirst(lowered.relations, (r) => r.name === name),
								(r): ReadonlyArray<string> => r.key
							)
						const lawsFrom = (name: string) =>
							Arr.filter(containmentsOf(lowered.laws), (law) => law.from.relation === name)
						if (sketch.form === "array" || sketch.form === "structs") {
							assert.deepStrictEqual(
								keyed(`${P}S0InputValue`),
								Option.some(["step", "ordinal", "root"])
							)
							assert.deepStrictEqual(
								Arr.map(lawsFrom(`${P}S0InputValue`), (law) => [
									law.to.relation,
									Arr.map(law.from.terms, (t) => `${t.pred ? "pred:" : ""}${t.field}`)
								]),
								[
									[`${P}S0Input`, ["step", "root"]],
									[`${P}S0InputValue`, ["step", "pred:ordinal", "root"]]
								]
							)
						}
						assert.strictEqual(
							has("S0InputValueServe") && has("S0InputValueRest"),
							sketch.form === "union"
						)
						if (sketch.form === "union") {
							Arr.forEach(["Serve", "Rest"], (tag) => {
								const variant = `${P}S0InputValue${tag}`
								const tagged = (law: Extract<LawIR, { readonly kind: "contained" }>["to"]) =>
									law.relation === `${P}S0Input` &&
									law.selection.kind === "handle" &&
									law.selection.field === "value" &&
									law.selection.handle === tag
								assert.isTrue(Arr.some(lawsFrom(variant), (law) => tagged(law.to)))
								assert.isTrue(
									Arr.some(
										containmentsOf(lowered.laws),
										(law) => tagged(law.from) && law.to.relation === variant
									)
								)
							})
						}
						assert.strictEqual(
							printFragment(lower(f), placement),
							printFragment(lowered, placement)
						)

						const containments = containmentsOf(lowered.laws)
						const into = (handle: "done" | "failed") =>
							Arr.filter(
								containments,
								(law) =>
									law.to.relation === `${P}Result` &&
									law.to.selection.kind === "handle" &&
									law.to.selection.handle === handle
							)
						assert.deepStrictEqual(
							Arr.map(into("done"), (law) => law.from.relation),
							[`${P}Done`]
						)
						assert.deepStrictEqual(
							Arr.map(into("failed"), (law) => law.from.relation),
							[`${P}Failed`]
						)
						assert.isTrue(has("RunFinishOutput"))
						assert.strictEqual(has("InnerFinishOutput"), sketch.scoped)
						const leaves = (edgeName: string, output: string) =>
							Arr.some(
								containments,
								(law) =>
									law.from.relation === `${P}${edgeName}` &&
									Arr.some(law.from.terms, (t) => t.field === "from") &&
									law.to.relation === `${P}${output}`
							)
						Arr.forEach(lowered.edges, (e) =>
							assert.isTrue(
								leaves(e.name, e.name === "After" ? "InnerFinishOutput" : `${e.from}Output`)
							)
						)
						assert.strictEqual(
							Arr.some(lowered.joins, (j) => Arr.some(j.finish.edges, (e) => e.name === "After")),
							sketch.scoped
						)
						assert.strictEqual(has("S0Error"), sketch.typed)
						if (sketch.typed) {
							assert.isTrue(
								Arr.some(
									containments,
									(law) => law.from.relation === `${P}S0Error` && law.to.relation === `${P}Failed`
								)
							)
						}
						assert.strictEqual(has("S0WeightsRead"), reading.rows)
						assert.strictEqual(has("S0PassagesRead"), reading.nearest)
						const fieldsOf = (name: string) =>
							Option.map(
								Arr.findFirst(lowered.relations, (r) => r.name === name),
								(r) => Arr.map(r.fields, (field) => [field.name, field.type.kind] as const)
							)
						if (reading.nearest) {
							assert.deepStrictEqual(
								fieldsOf(`${P}S0PassagesRead`),
								Option.some([
									["step", "key"],
									["ordinal", "natural"],
									["passage", "app"],
									["distance", "base"],
									["root", "key"]
								])
							)
						}
						assert.strictEqual(
							Arr.some(
								lowered.laws,
								(law) =>
									law.kind === "check" &&
									law.relation === `${P}S0Input` &&
									law.field === "value" &&
									law.holds.kind === "finite"
							),
							sketch.form === "finite"
						)

						const chains = [
							...(sketch.exclusive
								? [{ held: "Exclusive", ended: "Released", at: ["kind", "key"] }]
								: []),
							{ held: "Paused", ended: "Resumed", at: ["target"] }
						]
						const coordination = Arr.flatMap(chains, (ch) => [`${P}${ch.held}`, `${P}${ch.ended}`])
						assert.deepStrictEqual(lowered.coordination, coordination)
						assert.isTrue(
							Arr.every(
								containments,
								(law) =>
									Arr.contains(coordination, law.from.relation) ===
									Arr.contains(coordination, law.to.relation)
							)
						)
						Arr.forEach(chains, (ch) => {
							const held = `${P}${ch.held}`
							const ended = `${P}${ch.ended}`
							const turn = [...ch.at, "turn"]
							const termsOf = (side: (typeof containments)[number]["from"]) =>
								Arr.map(side.terms, (t) => `${t.pred ? "pred:" : ""}${t.field}`)
							const keyOf = (name: string) =>
								Option.map(
									Arr.findFirst(lowered.relations, (r) => r.name === name),
									(r): ReadonlyArray<string> => r.key
								)
							assert.deepStrictEqual(keyOf(held), Option.some(turn))
							assert.deepStrictEqual(keyOf(ended), Option.some(turn))
							assert.deepStrictEqual(
								Arr.map(
									Arr.filter(
										containments,
										(law) => law.from.relation === ended || law.from.relation === held
									),
									(law) => [law.from.relation, termsOf(law.from), law.to.relation, termsOf(law.to)]
								),
								[
									[ended, turn, held, turn],
									[held, [...ch.at, "pred:turn"], ended, turn]
								]
							)
						})
						assert.deepStrictEqual(
							Option.map(lowered.seats, (seats) => [
								seats.hold,
								seats.live,
								seats.counts.name,
								seats.bound
							]),
							sketch.resource
								? Option.some([`${P}Hold`, `${P}Live`, `${P}Seats`, `${P}SeatBelowCount`])
								: Option.none()
						)
						assert.deepStrictEqual(
							Option.map(
								lowered.seats,
								(seats): ReadonlyArray<{ readonly handle: string; readonly count: bigint }> =>
									seats.counts.rows
							),
							sketch.resource ? Option.some([{ handle: "Pool", count: 2n }]) : Option.none()
						)
						assert.strictEqual(
							Str.includes(`export const ${Str.uncapitalize(P)}SeatLevel =`)(
								printFragment(lowered, placement)
							),
							sketch.resource
						)
						assert.strictEqual(has("ExclusiveKey"), sketch.exclusive)
						assert.strictEqual(has("Within"), sketch.scoped)
						assert.strictEqual(has("StartScope"), sketch.scoped)
						const kindOf = (suffix: string) =>
							Option.flatMap(
								Arr.findFirst(lowered.relations, (r) => r.name === `${P}${suffix}`),
								(r) =>
									Option.map(
										Arr.findFirst(r.fields, (field) => field.name === "kind"),
										(field) => field.type
									)
							)
						assert.deepStrictEqual(kindOf("Scope"), Option.none())
						assert.deepStrictEqual(
							kindOf("Root"),
							Option.some({ kind: "closed", roster: `${P}RootKind` })
						)
						assert.deepStrictEqual(
							kindOf("Within"),
							sketch.scoped
								? Option.some({ kind: "closed", roster: `${P}ChildKind` })
								: Option.none()
						)
						const bodies = Arr.filter(
							relations,
							(name) => name !== `${P}Root` && !Arr.contains(lowered.coordination, name)
						)
						assert.deepStrictEqual(
							Arr.flatMap(lowered.laws, (law) =>
								law.kind === "retirable" ? [[law.header, ...law.bodies]] : []
							),
							[[`${P}Root`, ...bodies]]
						)
						assert.isTrue(
							Arr.every(lowered.relations, (rel) =>
								Arr.contains(bodies, rel.name)
									? Arr.contains(rel.key, "root") &&
										Arr.some(rel.fields, (field) => field.name === "root")
									: !Arr.some(rel.fields, (field) => field.name === "root")
							)
						)
						assert.isTrue(
							Arr.every(containmentsOf(lowered.laws), (law) =>
								Arr.contains(bodies, law.from.relation) && Arr.contains(bodies, law.to.relation)
									? Arr.some(law.from.terms, (t) => t.field === "root") &&
										Arr.some(law.to.terms, (t) => t.field === "root")
									: true
							)
						)
					})
			)
		)
)

/** Where a fragment's printing is placed; the fragment module reads only its app relations' module. */
const placement: Placement = {
	fragment: "#fragment.ts",
	programs: "#programs.ts",
	relations: "#relations.ts",
	schema: { from: "#app.ts", name: "App" },
	writer: { from: "#roles.ts", name: "Loader" },
	flow: { from: "#flows.ts", name: "flow" }
}
