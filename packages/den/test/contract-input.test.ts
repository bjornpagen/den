import { contract, Num, pg, query, relation, schema, v } from "@bjornpagen/grizzle"
import { contractParser } from "@bjornpagen/grizzle/contract"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, describe, it } from "@effect/vitest"
import {
	Array as Arr,
	Effect,
	Formatter,
	Result,
	Schema,
	type SchemaIssue,
	SchemaParser,
	String as Str
} from "effect"
import { flow } from "#algebra/flow.ts"
import {
	always,
	atSpawn,
	contractInput,
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
import { printed } from "#lower/generate.ts"
import { Text } from "#lower/keys.ts"
import { type Placement, printFragment } from "#lower/print.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * A field of a consumer's contract (algebra/kinds.ts contractInput), from the contract's checked mint, grizzle's
 * contractParser(contract, key), and its base's schema, as metis's essay binding takes a sitting's stage, qti-pie's
 * SittingKey, where a plain Schema.BigInt could not type the read parameter of SittingKey its step's read binds.
 *
 * - Decoding reads a value of the base and holds it to the contract: a value inside it decodes as itself, minted under
 *   the contract's key, and encodes back to the base as itself; a value outside it is refused at decode, its issue's
 *   `refusal` the contract's own refusal of it (grizzle's ContractRefused), DomainRefused below zero and ValueRefused
 *   past int8.
 * - Lowering types the field's column by the contract itself, wherever a value holds it (a column, an Option's value, an
 *   array's element or a field of its structs, a tagged union's variant's field): the fragment imports the contract
 *   from the placement's contracts module under its name and declares the column by it, so PostgreSQL holds every value
 *   den stores to the contract's domain and grizzle's column delivers the contract's host type back into the step's
 *   port; den generate refuses a placement whose contracts module exports another value under the contract's name.
 *
 * Oracle (specification): the contract's parser, its verdict of each value; and the lowering's own relations and the
 * printed fragment's text. Mutants it kills: decoding that skips the contract's check (the decode getter succeeding
 * with its value), and the column lowered as its base again (columnOf's contract branch dropped).
 */

const sittingKeyKey = Symbol("SittingKey")

/** qti-pie's sitting key: any nonnegative int8, a sitting's stage in its ledger and in metis's essay binding. */
const SittingKey = contract<typeof sittingKeyKey>()("SittingKey", pg.bigint, (k) =>
	Num.within(k, 0n, 2n ** 63n - 1n)
)

/** SittingKey's checked mint, its checker derived from the contract, as qti-pie exports it beside its mint. */
const sittingKeyParser = contractParser(SittingKey, sittingKeyKey)

/** A sitting's stage as a step's input holds it, metis's essay shape. */
const Stage = contractInput(sittingKeyParser, Schema.BigInt)

/** A sitting, as metis's essay flow's Pending step takes it. */
const Sitting = Schema.Struct({ child: Schema.String, stage: Stage })

/** The app's pending applications, by the child and the sitting's stage, as metis's Delivery level holds them. */
const Pending = relation("Pending", { child: Text, stage: SittingKey, path: Text }, [
	"child",
	"stage",
	"path"
])
const Level = schema("Level", [Pending], [])

/** A sitting's pending applications, read by the child and by the stage, a parameter of SittingKey, from the input. */
const PendingReads = reads(
	Level,
	{
		pending: query(Level).rule((r) => {
			const { child, stage, path } = v(Pending, "pending")
			return r
				.match(Pending, { child, stage, path })
				.where(r.eq(child, r.param("child", Text)), r.eq(stage, r.param("stage", SittingKey)))
				.find({ child, stage, path })
		})
	},
	(sitting: typeof Sitting.Type) => ({
		"pending.child": sitting.child,
		"pending.stage": sitting.stage
	})
)

type Feature = "minted" | "refused by its domain" | "refused by its type"

/** The refusals an issue's tree carries, each an InvalidValue's `refusal`, with the path each stands at. */
const refusalsOf = (
	issue: SchemaIssue.Issue,
	path: ReadonlyArray<PropertyKey>
): ReadonlyArray<{ readonly path: ReadonlyArray<PropertyKey>; readonly refusal: unknown }> => {
	switch (issue._tag) {
		case "InvalidValue":
			return issue.annotations !== undefined && "refusal" in issue.annotations
				? [{ path, refusal: issue.annotations["refusal"] }]
				: []
		case "Composite":
		case "AnyOf":
			return Arr.flatMap(issue.issues, (inner) => refusalsOf(inner, path))
		case "Pointer":
			return refusalsOf(issue.issue, [...path, ...issue.path])
		case "Encoding":
		case "Filter":
			return refusalsOf(issue.issue, path)
		case "InvalidType":
		case "MissingKey":
		case "UnexpectedKey":
		case "Forbidden":
		case "OneOf":
			return []
	}
}

/**
 * A bigint at a power of two, by sign, exponent and a step of at most two either side: zero, one, the key's range's
 * edges and int8's, and values past int8 either way.
 */
const bigintGen: Gen<bigint> = (source) => {
	const negative = source.draw(int(0, 1)) === 1
	const exponent = source.draw(int(0, 65))
	const offset = source.draw(int(-2, 2))
	return (negative ? -1n : 1n) * 2n ** BigInt(exponent) + BigInt(offset)
}

/** The places a value holds a column: a column, an Option's value, an array's element, a struct's in an array, a variant's. */
type Place = "column" | "option" | "array" | "structs" | "variant"

const places = [
	"column",
	"option",
	"array",
	"structs",
	"variant"
] as const satisfies ReadonlyArray<Place>

/** A step's output holding a sitting's stage at `place`, every place a value holds a column. */
const outputAt = (place: Place) => {
	switch (place) {
		case "column":
			return Schema.Struct({ stage: Stage })
		case "option":
			return Schema.Struct({ stage: Schema.Option(Stage) })
		case "array":
			return Schema.Struct({ stage: Schema.Array(Stage) })
		case "structs":
			return Schema.Struct({ stage: Schema.Array(Schema.Struct({ held: Stage })) })
		case "variant":
			return Schema.Struct({ stage: Schema.TaggedUnion({ Held: { held: Stage }, None: {} }) })
	}
}

/**
 * metis's essay shape: a root of a sitting, whose Pending step reads the sitting's pending applications by its stage,
 * and outputs the stage at `place`.
 */
const essayAt = (place: Place) => {
	const output = outputAt(place)
	const Read = step(
		"Read",
		{
			input: Sitting,
			output,
			error: Schema.Never,
			reads: PendingReads,
			awaits: [],
			uses: [],
			retry: none,
			waits: none,
			due: atSpawn,
			writes: writesNothing
		},
		() => Effect.die("never run")
	)
	const Sit = root("Sit", {
		trigger: operator,
		from: given,
		input: Sitting,
		children: [Read],
		start: (input) => [Read.of(input)],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: {
			reads: [],
			output: Schema.Struct({}),
			error: Schema.Never,
			uses: [],
			retry: none,
			waits: none,
			writes: writesNothing,
			body: () => Effect.succeed({ output: {} })
		}
	})
	return flow("Essay", {
		writes: writer<{ readonly name: "loader" }>("loader"),
		kinds: [Read, Sit],
		edges: []
	})
}

/** metis's essay shape: a sitting's stage as a column of the step's input and its output. */
const essayColumn: Place = "column"

/** Where the modules are placed, its contracts module the one exporting SittingKey under its name. */
const placement = (exports: { readonly [name: string]: unknown }): Placement => ({
	fragment: "#fragment.ts",
	programs: "#programs.ts",
	relations: "#relations.ts",
	schema: { from: "#app.ts", name: "App" },
	writer: { from: "#roles.ts", name: "Loader" },
	flow: { from: "#flows.ts", name: "essay" },
	reads: { from: "#reads.ts", exports: { ReadReads: PendingReads } },
	contracts: { from: "#contracts.ts", exports }
})

describe("a field of a consumer's contract", () => {
	it.effect("decodes through the contract's checked mint and encodes to its base", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "contract input decode",
					oracle: {
						kind: "specification",
						name: "the contract's parser, its verdict of each value"
					},
					draw: drawn(bigintGen),
					literal: Formatter.format,
					coverage: required<Feature>(["minted", "refused by its domain", "refused by its type"], {
						cases: 60,
						sense: notesOnly
					}),
					kept: [
						{
							note: "a sitting key of -1n, an int8 outside SittingKey: refused at decode by the contract's own refusal, DomainRefused, never minted",
							sketch: -1n,
							draws: "",
							reaches: ["refused by its domain"]
						},
						{
							note: "a sitting key of 2^63, past int8: refused at decode by the contract's own refusal, ValueRefused, where decoding that skips the check refuses it by the declaration's guard alone (the floor's first failure under that mutant)",
							sketch: 9223372036854775808n,
							draws: "",
							reaches: ["refused by its type"]
						}
					],
					runs: 150,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				(value, c) =>
					Effect.gen(function* () {
						const expected = sittingKeyParser.parse(value)
						const decoded = yield* Effect.result(
							SchemaParser.decodeEffect(Sitting)({ child: "ada", stage: value })
						)
						if (Result.isSuccess(expected)) {
							c.note("minted")
							assert.isTrue(Result.isSuccess(decoded), `${String(value)} decodes`)
							if (Result.isSuccess(decoded)) {
								assert.strictEqual(decoded.success.stage, value)
								const encoded = yield* SchemaParser.encodeEffect(Sitting)(decoded.success)
								assert.deepStrictEqual(encoded, { child: "ada", stage: value })
							}
							return
						}
						c.note(
							expected.failure._tag === "DomainRefused"
								? "refused by its domain"
								: "refused by its type"
						)
						assert.isTrue(Result.isFailure(decoded), `${String(value)} is refused`)
						if (Result.isFailure(decoded)) {
							assert.deepStrictEqual(refusalsOf(decoded.failure, []), [
								{ path: ["stage"], refusal: expected.failure }
							])
						}
					})
			)
		)
	)

	it.effect("lowers to a column of the contract wherever a value holds it", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "contract input lowering",
					oracle: {
						kind: "specification",
						name: "the lowering's relations and the printed fragment's declaration of each column"
					},
					draw: drawn((source): Place => source.draw(element(places))),
					literal: Formatter.format,
					coverage: required<Place>(places, { cases: 20, sense: notesOnly }),
					kept: [
						{
							note: "a sitting's stage as a column of the step's input, metis's essay shape: lowered to a column of SittingKey, where the column lowered as its base lowers to bigint (the floor's first failure under that mutant)",
							sketch: essayColumn,
							draws: "",
							reaches: ["column"]
						}
					],
					runs: 20,
					shrink: boundedShrink(20),
					steerEvery: 4,
					caseHang: caseHangMillis
				},
				(place, c) =>
					Effect.sync(() => {
						c.note(place)
						const essay = essayAt(place)
						const lowered = lower(essay)
						const contracted = Arr.flatMap(lowered.relations, (r) =>
							Arr.flatMap(r.fields, (f) =>
								f.type.kind === "contract" ? [`${r.name}.${f.name}`] : []
							)
						)
						assert.isTrue(
							Arr.every(lowered.relations, (r) =>
								Arr.every(
									r.fields,
									(f) => f.type.kind !== "contract" || f.type.contract === SittingKey
								)
							),
							"every contract column is SittingKey itself"
						)
						assert.isTrue(
							Arr.some(contracted, (name) => Str.endsWith(".stage")(name)),
							"the sitting's stage is a column of SittingKey in the root's and the step's inputs"
						)
						assert.isTrue(
							contracted.length >= 3,
							`the output's ${place} holds a column of SittingKey beside both inputs' (${Arr.join(contracted, ", ")})`
						)
						const fragment = printFragment(lowered, placement({ SittingKey }))
						assert.isTrue(Str.includes(`import { SittingKey } from "#contracts.ts"`)(fragment))
						assert.isTrue(Str.includes("stage: SittingKey")(fragment))
						printed(essay, placement({ SittingKey }))
						assert.throws(() => printed(essay, placement({ SittingKey: pg.bigint })))
					})
			)
		)
	)
})
