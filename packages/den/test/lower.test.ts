import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { boolean, element, type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, it } from "@effect/vitest"
import {
	Array as Arr,
	Effect,
	Exit,
	Formatter,
	Option,
	Record,
	Schema,
	String as Str
} from "effect"
import { type AnyFlow, flow } from "#algebra/flow.ts"
import {
	type AnyEdge,
	type AnyStepKind,
	edge,
	type FieldSchema,
	lane,
	Refused,
	root,
	step,
	writesNothing
} from "#algebra/kinds.ts"
import { caseHang } from "#limits.ts"
import { lower } from "#lower/fragment.ts"
import { merge } from "#lower/merge.ts"
import { printFragment } from "#lower/print.ts"

/**
 * Lowering a flow: every relation and roster it declares carries the flow's prefix, every law names only relations
 * the fragment declares, an Option field lowers to a relation of its own, its printing is a function of the flow, and
 * den's merge refuses a fragment spread twice into one record, where a JavaScript spread would drop the clash silently.
 *
 * Oracle (specification): the proposal's section 5, over flows of up to three steps, chained or not, of each field form.
 */

const forms = [
	"text",
	"bigint",
	"boolean",
	"literals",
	"brand",
	"option"
] as const satisfies ReadonlyArray<string>
type Form = (typeof forms)[number]

type Feature = Form | "chained" | "unchained"

interface Sketch {
	readonly prefix: "Alpha" | "Beta"
	readonly steps: number
	readonly chained: boolean
	readonly form: Form
}

const sketches: Gen<Sketch> = (source) => ({
	prefix: source.draw(element(["Alpha", "Beta"])),
	steps: source.draw(int(1, 3)),
	chained: source.draw(boolean),
	form: source.draw(element(forms))
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

const built = (sketch: Sketch): AnyFlow => {
	const work = lane("Work", { width: 1, window: { kind: "always" }, pause: "running", attempts: 1 })
	const value = Schema.Struct({ value: fieldOf(sketch.form) })
	const steps: ReadonlyArray<AnyStepKind> = Arr.map(Arr.range(0, sketch.steps - 1), (i) =>
		step(
			work,
			`S${i}`,
			{ input: value, output: value, error: Schema.Never, writes: writesNothing },
			(x) => Effect.succeed({ output: x, writes: { insert: {}, put: {}, delete: {} } })
		)
	)
	const edges: ReadonlyArray<AnyEdge> = sketch.chained
		? Arr.flatMap(Arr.range(1, sketch.steps - 1), (i) =>
				Option.toArray(
					Option.zipWith(Arr.get(steps, i - 1), Arr.get(steps, i), (from, to) =>
						edge(`E${i}`, from, to, () => [])
					)
				)
			)
		: []
	const Run = root("Run", {
		trigger: { kind: "command" },
		input: Schema.Struct({}),
		children: steps,
		start: () => [],
		finish: {
			lane: work,
			reads: [],
			error: Schema.Never,
			writes: writesNothing,
			body: () => Effect.succeed({ insert: {}, put: {}, delete: {} })
		}
	})
	return flow(sketch.prefix, { lanes: [work], kinds: [...steps, Run], edges })
}

it.effect("lowers each flow under its prefix, into laws over its own relations", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "lowering",
				oracle: { kind: "specification", name: "the proposal's section 5 rules for a fragment" },
				draw: drawn(sketches),
				literal: Formatter.format,
				coverage: required<Feature>([...forms, "chained", "unchained"], {
					cases: 60,
					sense: notesOnly
				}),
				kept: [],
				runs: 120,
				shrink: boundedShrink(40),
				concurrency: 1,
				steerEvery: 16,
				caseHang
			},
			(sketch, c) =>
				Effect.gen(function* () {
					c.note(sketch.form)
					c.note(sketch.chained && sketch.steps > 1 ? "chained" : "unchained")
					const f = built(sketch)
					const lowered = lower(f)
					const names = [
						...Arr.map(lowered.relations, (r) => r.name),
						...Arr.map(lowered.rosters, (r) => r.name)
					]
					assert.isTrue(Arr.every(names, Str.startsWith(f.name)))
					const sides = Arr.flatMap(lowered.laws, (law) =>
						law.kind === "contained"
							? [law.from.relation, law.to.relation]
							: law.kind === "key"
								? [law.side.relation]
								: [law.relation]
					)
					assert.isTrue(Arr.every(sides, (side) => Arr.contains(names, side)))
					assert.strictEqual(
						Arr.some(lowered.relations, (r) => r.name === `${f.name}S0InputValue`),
						sketch.form === "option"
					)
					assert.strictEqual(printFragment(lower(f)), printFragment(lowered))
					const record = Record.fromEntries(
						Arr.map(lowered.relations, (r): readonly [string, string] => [r.name, r.name])
					)
					const merged = yield* Effect.exit(
						Effect.try({
							try: () => merge(record, record),
							catch: (thrown) => ({ refused: thrown instanceof Refused })
						})
					)
					assert.deepStrictEqual(Exit.findErrorOption(merged), Option.some({ refused: true }))
				})
		)
	)
)
