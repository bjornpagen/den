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
	always,
	atSpawn,
	attempts,
	edge,
	exclusiveBy,
	type FieldSchema,
	noReads,
	operator,
	reads,
	resource,
	root,
	scope,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { caseHang, published } from "#limits.ts"
import { type LawIR, lower } from "#lower/fragment.ts"
import { type Placement, printFragment } from "#lower/print.ts"

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
 *
 * Oracle (specification): the proposal's sections 5 and 6, over flows of up to three steps, chained or not, of each
 * field form, with or without a resource, an exclusive root, a child scope, a declared read and a typed error.
 */

const Form = Schema.Literals(["text", "bigint", "boolean", "literals", "brand", "option"])
type Form = typeof Form.Type

type Feature =
	| Form
	| "chained"
	| "unchained"
	| "a resource"
	| "an exclusive root"
	| "a child scope"
	| "a declared read"
	| "a typed error"

interface Sketch {
	readonly prefix: "Alpha" | "Beta"
	readonly steps: number
	readonly chained: boolean
	readonly form: Form
	readonly resource: boolean
	readonly exclusive: boolean
	readonly scoped: boolean
	readonly read: boolean
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
	read: source.draw(boolean),
	typed: source.draw(boolean)
})

const fieldOf = (form: Form): FieldSchema => {
	switch (form) {
		case "text":
			return Schema.String
		case "bigint":
			return Schema.BigInt
		case "boolean":
			return Schema.Boolean
		case "literals":
			return Schema.Literals(["low", "high"])
		case "brand":
			return Schema.BigInt.pipe(Schema.brand("Level"))
		case "option":
			return Schema.Option(Schema.String)
	}
}

/** An app relation a step may read: a feed's weight. */
const Weight = relation("Weight", { feed: pg.bigint, factor: natural }, ["feed", "factor"])

/** The box of grizzle's own work-queue law suite: two seats. */
const boxSeats = published({
	value: 2,
	owner: "the lowering suite's resource, after grizzle's work-queue law suite",
	unit: "seats",
	scope: "the steps of a lowered flow that use the Pool",
	constraint: "compile-time constant",
	source: "https://github.com/bjornpagen/grizzle/blob/a226cbac/test/support/laws/boxes.ts",
	quote: "Two resources of two seats each: two leases meet at a seat as often as they miss it.",
	verified: "2026-11-11"
})

const finishing = {
	reads: [],
	error: Schema.Never,
	retry: attempts(1),
	writes: writesNothing,
	body: () => Effect.succeed({ insert: {}, put: {}, delete: {} })
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
			reads: sketch.read ? reads(Weight, ["feed"], () => ({ feed: 0n })) : noReads,
			uses: sketch.resource ? [pool] : [],
			retry: attempts(1),
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
				uses: [],
				retry: attempts(1),
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
			uses: [],
			retry: attempts(1),
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
		edges
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
							"a declared read",
							"a typed error"
						],
						{ cases: 80, sense: notesOnly }
					),
					kept: [],
					runs: 160,
					shrink: boundedShrink(40),
					concurrency: 1,
					steerEvery: 16,
					caseHang
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
						if (sketch.read) {
							c.note("a declared read")
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
						const sides = Arr.flatMap(lowered.laws, (law) =>
							law.kind === "contained"
								? [law.from.relation, law.to.relation]
								: law.kind === "key"
									? [law.side.relation]
									: [law.relation]
						)
						assert.isTrue(Arr.every(sides, (side) => Arr.contains(names, side)))
						assert.strictEqual(has("S0InputValue"), sketch.form === "option")
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
						assert.strictEqual(has("S0Error"), sketch.typed)
						if (sketch.typed) {
							assert.isTrue(
								Arr.some(
									containments,
									(law) => law.from.relation === `${P}S0Error` && law.to.relation === `${P}Failed`
								)
							)
						}
						assert.strictEqual(has("S0Read"), sketch.read)

						const chains = [
							...(sketch.resource
								? [{ held: "Hold", ended: "Freed", at: ["resource", "seat"] }]
								: []),
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
								seats.freed,
								seats.live,
								seats.counts.name,
								seats.bound
							]),
							sketch.resource
								? Option.some([
										`${P}Hold`,
										`${P}Freed`,
										`${P}Live`,
										`${P}Seats`,
										`${P}SeatBelowCount`
									])
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
