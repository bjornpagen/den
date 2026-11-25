import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option, Order, Schema, String as Str } from "effect"
import { type AnyFlow, flow } from "#algebra/flow.ts"
import {
	type AnyEdge,
	type AnyStepKind,
	always,
	atSpawn,
	edge,
	exclusiveBy,
	type FieldSchema,
	none,
	noReads,
	operator,
	pauseHandle,
	type ReadsOver,
	resource,
	root,
	scope,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { type LawIR, type Lowered, lower, type SideIR } from "#lower/fragment.ts"
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
 * chain, with its seat counts and its seat level, the live holds checked below them, exactly when a step uses a resource,
 * never for a pause handle, which only the flow's pausable targets name, beside its resources and its roots.
 * A scope's kind is its place's: a root's on its Root row, among the flow's roots, and a child scope's on its Within
 * row, among its child scope kinds, whose relations (Within, StartScope) exist exactly when the flow declares one.
 * Every graph relation but the root's record sits under one unit, DenRoot, keyed by the root: its root first in every
 * key and on both sides of every containment between them, mutable, cleared under its root; a claim's holds lead with
 * their resource, under the flow's seat unit; and no coordination relation carries a root. A row's root is its owner's:
 * Step and Scope are each keyed by their identity alone too, every other graph relation is contained by its root and its
 * owner, the field its key leads with after its root, in its owner's holder, and Scope in the root's record, so a read
 * that fixes a row's owner (and Step's scope, and Within's parent) fixes its root, its unit, by the fragment's keys and
 * containments alone, read as grizzle reads a dependency: a containment over every row of a relation onto a key of one
 * field of its target gives the field it pairs with that key every other field it pairs. Mutants it kills: the holders
 * keyed by their root and identity alone (no `key(on(<P>Scope, "scope"))`, no `key(on(<P>Step, "step"))`), and every
 * graph relation contained in its root's record by its root alone, as it was, which fixes no root from a step or a scope.
 *
 * Oracle (specification): the proposal's sections 5 and 6, over flows of up to three steps, chained or not, of each
 * field form, with or without a resource, a pause handle, an exclusive root, a child scope, one or two named reads and a typed
 * error. Each named read's references are a relation named by its step and read, keyed by the step and the row's
 * place, each contained in its step's result and, by its digest alone, in the root of its records, which grizzle makes
 * of the read's query when the fragment loads and which no root's unit holds, so every root that found a row shares
 * it; a finite number is held finite by a row check.
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
	| "a pause handle"
	| "an exclusive root"
	| "a child scope"
	| "a read"
	| "two reads"
	| "a typed error"

/** Which reads the first step declares: none, one, or two. */
const Reading = Schema.Literals(["none", "one", "two"])

interface Sketch {
	readonly prefix: "Alpha" | "Beta"
	readonly steps: number
	readonly chained: boolean
	readonly form: Form
	readonly resource: boolean
	readonly handle: boolean
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
	handle: source.draw(boolean),
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

/**
 * The reads a sketch's first step declares, by their names alone: lowering never runs a read's query, whose records
 * grizzle makes when the fragment loads, so a sketch's queries are no queries at all.
 */
const readsOf = <I>(reading: typeof Reading.Type): ReadsOver<I> =>
	reading === "none"
		? noReads
		: {
				kind: "query",
				over: {},
				named: reading === "one" ? { weights: {} } : { weights: {}, passages: {} },
				params: () => ({}),
				options: []
			}

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
	retry: none,
	waits: none,
	writes: writesNothing,
	body: () => Effect.succeed({ output: {} })
} as const

const built = (sketch: Sketch): AnyFlow => {
	const value = Schema.Struct({ value: fieldOf(sketch.form) })
	const pool = resource("Pool", boxSeats)
	const hush = pauseHandle("Hush")
	const done = (x: typeof value.Type) => Effect.succeed({ output: x })
	const first = step(
		"S0",
		{
			input: value,
			output: value,
			error: sketch.typed ? Schema.Struct({ code: Schema.String }) : Schema.Never,
			reads: readsOf(sketch.reads),
			awaits: [],
			uses: [...(sketch.resource ? [pool] : []), ...(sketch.handle ? [hush] : [])],
			retry: none,
			waits: none,
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
				reads: noReads,
				awaits: [],
				uses: [],
				retry: none,
				waits: none,
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
			reads: noReads,
			awaits: [],
			uses: [],
			retry: none,
			waits: none,
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

/** The plain fields of a side, none where it reads a field's predecessor or selects some of its rows. */
const plainFields = (side: SideIR): Option.Option<ReadonlyArray<string>> =>
	side.selection.kind === "all" && Arr.every(side.terms, (t) => !t.pred)
		? Option.some(Arr.map(side.terms, (t) => t.field))
		: Option.none()

/** A relation's keys: its primary key and each key law over every row of it, by their fields. */
const keysOf = (lowered: Lowered, relation: string): ReadonlyArray<ReadonlyArray<string>> => [
	...Arr.flatMap(lowered.relations, (r) => (r.name === relation ? [r.key] : [])),
	...Arr.flatMap(lowered.laws, (law) =>
		law.kind === "key" && law.side.relation === relation
			? Option.toArray(plainFields(law.side))
			: []
	)
]

/** A key's one field, none for a key of several. */
const soleField = (key: ReadonlyArray<string>): Option.Option<string> =>
	key.length === 1 ? Arr.head(key) : Option.none()

/**
 * The fields of `relation` a read fixing `fixed` fixes, by the fragment's keys and containments alone, read as grizzle
 * reads a dependency (its declared statistics and its unit-bound reads): a containment over every row of the relation,
 * onto a key of one field of its target, gives the field it pairs with that key every other field it pairs; and a key
 * fixed whole fixes every field.
 */
const fixedBy = (
	lowered: Lowered,
	relation: string,
	fixed: ReadonlyArray<string>
): ReadonlyArray<string> => {
	const dependencies = Arr.flatMap(containmentsOf(lowered.laws), (law) =>
		law.from.relation === relation
			? Option.match(Option.all([plainFields(law.from), plainFields(law.to)]), {
					onNone: () => [],
					onSome: ([from, to]) =>
						Arr.flatMap(keysOf(lowered, law.to.relation), (key) =>
							Option.toArray(
								Option.flatMap(soleField(key), (field) =>
									Option.flatMap(
										Arr.findFirstIndex(to, (paired) => paired === field),
										(at) => Option.map(Arr.get(from, at), (by) => ({ by, fields: from }))
									)
								)
							)
						)
				})
			: []
	)
	const fields = Arr.flatMap(lowered.relations, (r) =>
		r.name === relation ? Arr.map(r.fields, (field) => field.name) : []
	)
	const grow = (held: ReadonlyArray<string>): ReadonlyArray<string> => {
		const next = Arr.dedupe([
			...held,
			...Arr.flatMap(dependencies, (d) => (Arr.contains(held, d.by) ? d.fields : [])),
			...(Arr.some(keysOf(lowered, relation), (key) =>
				Arr.every(key, (field) => Arr.contains(held, field))
			)
				? fields
				: [])
		])
		return next.length === held.length ? held : grow(next)
	}
	return grow(Arr.dedupe(fixed))
}

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
							"a pause handle",
							"an exclusive root",
							"a child scope",
							"a read",
							"two reads",
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
						if (sketch.handle) {
							c.note("a pause handle")
						}
						if (sketch.exclusive) {
							c.note("an exclusive root")
						}
						if (sketch.scoped) {
							c.note("a child scope")
						}
						const reading = {
							weights: sketch.reads !== "none",
							passages: sketch.reads === "two"
						}
						if (sketch.reads === "one") {
							c.note("a read")
						}
						if (sketch.reads === "two") {
							c.note("two reads")
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
						const recordRoots = Arr.flatMap(lowered.steps, (s) =>
							Arr.map(s.reads, (read) => `${read.stem}Row`)
						)
						const names = [
							...relations,
							...recordRoots,
							...counts,
							...Arr.map(lowered.rosters, (r) => r.name)
						]
						const has = (suffix: string) => Arr.contains(relations, `${P}${suffix}`)
						assert.isTrue(Arr.every(names, Str.startsWith(P)))
						const sides = Arr.flatMap(lowered.laws, (law) => {
							switch (law.kind) {
								case "contained":
									return [law.from.relation, law.to.relation]
								case "key":
									return [law.side.relation]
								case "unit":
									return []
								case "ordered":
									return [law.member.relation, law.owner]
								case "race":
								case "check":
								case "mutable":
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
								Option.some(["root", "step", "ordinal"])
							)
							assert.deepStrictEqual(
								Arr.map(lawsFrom(`${P}S0InputValue`), (law) => [
									law.to.relation,
									Arr.map(law.from.terms, (t) => `${t.pred ? "pred:" : ""}${t.field}`)
								]),
								[
									[`${P}S0Input`, ["root", "step"]],
									[`${P}S0InputValue`, ["root", "step", "pred:ordinal"]],
									[`${P}Step`, ["root", "step"]]
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
						assert.strictEqual(has("S0ReadWeights"), reading.weights)
						assert.strictEqual(has("S0ReadPassages"), reading.passages)
						const fieldsOf = (name: string) =>
							Option.map(
								Arr.findFirst(lowered.relations, (r) => r.name === name),
								(r) => Arr.map(r.fields, (field) => [field.name, field.type.kind] as const)
							)
						if (reading.passages) {
							assert.deepStrictEqual(
								fieldsOf(`${P}S0ReadPassages`),
								Option.some([
									["root", "digest"],
									["step", "digest"],
									["ordinal", "natural"],
									["digest", "digest"]
								])
							)
						}
						Arr.forEach(
							[...(reading.weights ? ["Weights"] : []), ...(reading.passages ? ["Passages"] : [])],
							(read) => {
								assert.isTrue(
									Arr.some(
										containments,
										(law) =>
											law.from.relation === `${P}S0Read${read}` &&
											law.to.relation === `${P}S0Read${read}Row` &&
											Arr.join(
												Arr.map(law.from.terms, (t) => t.field),
												","
											) === "digest"
									),
									`each reference of ${read} names its row by its digest alone`
								)
								assert.isFalse(
									Arr.some(
										lowered.laws,
										(law) => law.kind === "mutable" && law.relation === `${P}S0Read${read}Row`
									),
									`${read}'s records are closed, under no root`
								)
							}
						)
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
						const coordination = [
							...Arr.flatMap(chains, (ch) => [`${P}${ch.held}`, `${P}${ch.ended}`]),
							`${P}Served`
						]
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
						const rosterOf = (suffix: string) =>
							Option.map(
								Arr.findFirst(lowered.rosters, (r) => r.name === `${P}${suffix}`),
								(r): ReadonlyArray<string> => r.handles
							)
						assert.deepStrictEqual(
							rosterOf("Pausable"),
							Option.some([
								...(sketch.resource ? ["Pool"] : []),
								...(sketch.handle ? ["Hush"] : []),
								"Run"
							])
						)
						assert.deepStrictEqual(
							rosterOf("Resource"),
							sketch.resource ? Option.some(["Pool"]) : Option.none()
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
						const held = Arr.filter(relations, (name) => name === `${P}Hold`)
						const bodies = Arr.filter(
							relations,
							(name) =>
								name !== `${P}Root` &&
								name !== `${P}RequestedWith` &&
								!Arr.contains(lowered.coordination, name) &&
								!Arr.contains(held, name)
						)
						assert.deepStrictEqual(
							Arr.flatMap(lowered.laws, (law) =>
								law.kind === "unit"
									? [[law.name, ...Arr.map(law.heading, (field) => field.name)]]
									: []
							),
							[["DenRoot", "root"], ...Arr.map(held, () => [`${P}Seat`, "resource"])],
							"one root unit, and a seat unit exactly where the flow seats"
						)
						assert.deepStrictEqual(
							Arr.sort(
								Arr.flatMap(lowered.laws, (law) => (law.kind === "mutable" ? [law.relation] : [])),
								Order.String
							),
							Arr.sort([...bodies, ...held], Order.String),
							"every graph relation but the root's record and what it was requested with is mutable, cleared under its root"
						)
						assert.deepStrictEqual(
							Arr.sort(lowered.cleared, Order.String),
							Arr.sort(bodies, Order.String)
						)
						assert.deepStrictEqual(
							Arr.flatMap(lowered.laws, (law) =>
								law.kind === "key" &&
								(law.side.relation === `${P}Scope` || law.side.relation === `${P}Step`)
									? [[law.side.relation, ...Arr.map(law.side.terms, (t) => t.field)]]
									: []
							),
							[
								[`${P}Scope`, "scope"],
								[`${P}Step`, "step"]
							],
							"each identity's holder is keyed by it alone"
						)
						/** A body's owner: the field its key leads with after its root. */
						const ownerOf = (body: string) =>
							Option.flatMap(
								Arr.findFirst(lowered.relations, (r) => r.name === body),
								(r) => Arr.get(r.key, 1)
							)
						const holderOf = (body: string, owner: string) =>
							body === `${P}Scope`
								? { relation: `${P}Root`, terms: ["root"], at: ["root"] }
								: Option.exists(
											Arr.findFirst(lowered.relations, (r) => r.name === body),
											(r) =>
												Arr.some(
													r.fields,
													(field) =>
														field.name === owner &&
														field.type.kind === "digest" &&
														field.type.names === "step"
												)
									  )
									? { relation: `${P}Step`, terms: ["root", owner], at: ["root", "step"] }
									: { relation: `${P}Scope`, terms: ["root", owner], at: ["root", "scope"] }
						assert.isTrue(
							Arr.every(bodies, (body) =>
								Option.exists(ownerOf(body), (owner) => {
									const holder = holderOf(body, body === `${P}Step` ? "scope" : owner)
									return Arr.some(
										containmentsOf(lowered.laws),
										(law) =>
											law.from.relation === body &&
											law.to.relation === holder.relation &&
											Option.exists(
												plainFields(law.from),
												(from) => Arr.join(from, ",") === Arr.join(holder.terms, ",")
											) &&
											Option.exists(
												plainFields(law.to),
												(to) => Arr.join(to, ",") === Arr.join(holder.at, ",")
											)
									)
								})
							),
							"every body is contained by its root and its owner in its owner's holder, Scope in its root's record"
						)
						Arr.forEach(bodies, (body) =>
							Arr.forEach(
								[
									...Option.toArray(ownerOf(body)),
									...(body === `${P}Step` ? ["scope"] : []),
									...(body === `${P}Within` ? ["parent"] : [])
								],
								(owner) =>
									assert.isTrue(
										Arr.contains(fixedBy(lowered, body, [owner]), "root"),
										`a read of ${body} that fixes its ${owner} fixes its root`
									)
							)
						)
						assert.isTrue(
							Arr.every(lowered.relations, (rel) =>
								Arr.contains(bodies, rel.name)
									? rel.key[0] === "root" && Arr.some(rel.fields, (field) => field.name === "root")
									: Arr.contains(held, rel.name)
										? rel.key[0] === "resource"
										: rel.name === `${P}Root` || rel.name === `${P}RequestedWith`
											? rel.key[0] === "root"
											: !Arr.some(rel.fields, (field) => field.name === "root")
							)
						)
						assert.isTrue(
							Arr.every(containmentsOf(lowered.laws), (law) =>
								Arr.contains(bodies, law.from.relation) && Arr.contains(bodies, law.to.relation)
									? Arr.head(law.from.terms).pipe(Option.exists((t) => t.field === "root")) &&
										Arr.head(law.to.terms).pipe(Option.exists((t) => t.field === "root"))
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
	flow: { from: "#flows.ts", name: "flow" },
	reads: { from: "#reads.ts", exports: {} }
}
