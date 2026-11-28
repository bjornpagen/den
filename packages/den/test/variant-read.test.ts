import {
	closed,
	natural,
	pg,
	query,
	type RecordedQuery,
	relation,
	schema,
	sha256,
	str,
	v,
	variant
} from "@bjornpagen/grizzle"
import { lawsOf } from "@bjornpagen/grizzle/compile"
import * as Dynamic from "@bjornpagen/grizzle/dynamic"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { element } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Record as Rec, Schema, String as Str } from "effect"
import { flow } from "#algebra/flow.ts"
import {
	always,
	atSpawn,
	given,
	none,
	operator,
	type ReadsOver,
	root,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { lower } from "#lower/fragment.ts"
import { type Placement, printFragment } from "#lower/print.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * A step may read variant cells: the records den's fragment builds of a step's read (lower/print.ts, grizzle's
 * records(stem, query, { digest: sha256 }, ["digest"]) over the placement's reads export) hold each variant column of
 * the read as the variant the read's schema declares, its arms' checks with it, so the app's schema listing them
 * compiles, one declaration per variant name. metis's essay flow's Complete step reads qti-pie's
 * evaluationInputsOf(Delivery), whose carried attempts' multiples carry QtiValue cells, a typed sum whose pair arm
 * states least <= greatest; its records were refused, `DuplicateIdentity at field
 * EssayCompleteReadSittingCarriedMultiple.value: one declaration per variant name; variant QtiValue is also declared
 * differently at field AttemptMark.value`, while grizzle rebuilt a record's variant from the column's type, of no arm's
 * check.
 *
 * Exhausted over each place a read's row holds a column: the read's own row, an array attachment's, an option
 * attachment's, and an attachment's under an array attachment, metis's carried multiples.
 *
 * Oracle (specification): grizzle's compile of the read's level extended by the records den's fragment builds, each
 * relation's name led by den's stem: built by grizzle's dynamic door (grizzle/dynamic records), whose relations and
 * laws are what records' builder declares of the same arguments, one Description by semantic identity (grizzle's
 * test/unit/program/records.test.ts), since a test's stem is no literal. Mutant it kills: grizzle's record field of a variant column
 * rebuilt from the column's type with no arm's check (vendor/grizzle schema/field-desc.ts declaredDescOf's variant
 * case), which refuses every place's level DuplicateIdentity.
 */

/** Where a read's row holds the variant column: its own row, an attachment's, or an attachment's attachment's. */
const Place = Schema.Literals(["row", "array", "option", "nested"])
type Place = typeof Place.Type

/** The read's records relation that holds the variant column at each place, after den's stem. */
const holderOf: { readonly [P in Place]: string } = {
	row: "Row",
	array: "Carried",
	option: "Ended",
	nested: "Multiple"
}

/** A learner or an item path: a short word, so a key holds it. */
const Word = str.bytes(64, str.regex("^[a-z]+$"))

/** qti-pie's base types, the tag of a value cell. */
const BaseType = closed.unordered("BaseType", ["integer", "pair", "string"])

/** qti-pie's QtiValue, reduced: a typed sum whose pair arm's check orders its two identifiers, least first. */
const QtiValue = variant(
	"QtiValue",
	BaseType,
	{
		integer: { value: pg.integer },
		pair: { greatest: Word, least: Word },
		string: { value: Word }
	},
	{ pair: (a) => a.le(a.least, a.greatest) }
)

/** A sitting, with a value cell of its own. */
const Sitting = relation("Sitting", { child: Word, stage: pg.bigint, value: QtiValue }, [
	"child",
	"stage"
])
/** A sitting's carried attempt at an item, with a value cell. */
const Carried = relation(
	"Carried",
	{ child: Word, stage: pg.bigint, path: Word, value: QtiValue },
	["child", "stage", "path"]
)
/** A carried attempt's multiple's values, each a cell at its place, as qti-pie's attempt rows hold them. */
const Multiple = relation(
	"Multiple",
	{ child: Word, stage: pg.bigint, path: Word, place: natural, value: QtiValue },
	["child", "stage", "path", "place"]
)
/** A sitting's end, with a value cell. */
const Ended = relation("Ended", { child: Word, stage: pg.bigint, value: QtiValue }, [
	"child",
	"stage"
])

/** The app's level, metis's Delivery reduced: every relation holding a QtiValue cell declares it alike. */
const Delivery = schema("Delivery", [BaseType, Sitting, Carried, Multiple, Ended], [])

/** A sitting as the Complete step takes it. */
const SittingInput = Schema.Struct({ child: Schema.String, stage: Schema.BigInt })
type SittingInput = typeof SittingInput.Type

/** The read of `sitting` the Complete step declares, by the input's child and stage, its value cell at `place`. */
const readAt = (place: Place): RecordedQuery => {
	const sitting = query(Delivery).rule((r) => {
		const { child, stage } = v(Sitting, "sitting")
		return r
			.match(Sitting, { child, stage })
			.where(r.eq(child, r.param("child", Word)), r.eq(stage, r.param("stage", pg.bigint)))
			.find({ child, stage })
	})
	switch (place) {
		case "row":
			return query(Delivery).rule((r) => {
				const { child, stage, value } = v(Sitting, "sitting")
				return r
					.match(Sitting, { child, stage, value })
					.where(r.eq(child, r.param("child", Word)), r.eq(stage, r.param("stage", pg.bigint)))
					.find({ child, stage, value })
			})
		case "array":
			return sitting.attach(
				"carried",
				(at) =>
					query(Delivery).rule((r) => {
						const { path, value } = v(Carried, "carried")
						return r
							.match(Carried, { child: at.child, stage: at.stage, path, value })
							.find({ path, value })
					}),
				"array"
			)
		case "option":
			return sitting.attach(
				"ended",
				(at) =>
					query(Delivery).rule((r) => {
						const { value } = v(Ended, "ended")
						return r.match(Ended, { child: at.child, stage: at.stage, value }).find({ value })
					}),
				"option"
			)
		case "nested":
			return sitting.attach(
				"carried",
				(at) =>
					query(Delivery)
						.rule((r) => {
							const { child, stage, path } = v(Carried, "carried")
							return r
								.match(Carried, { child, stage, path })
								.where(r.eq(child, at.child), r.eq(stage, at.stage))
								.find({ child, stage, path })
						})
						.attach(
							"multiple",
							(carried) =>
								query(Delivery).rule((r) => {
									const { place: ordinal, value } = v(Multiple, "multiple")
									return r
										.match(Multiple, {
											child: carried.child,
											stage: carried.stage,
											path: carried.path,
											place: ordinal,
											value
										})
										.find({ place: ordinal, value })
								}),
							"array"
						),
				"array"
			)
	}
}

/** The Complete step's reads: the sitting at `place`, its parameters the input's child and stage. */
const completeReads = (sitting: RecordedQuery): ReadsOver<SittingInput> => ({
	kind: "query",
	over: Delivery,
	named: { sitting },
	params: (input) => ({ "sitting.child": input.child, "sitting.stage": input.stage })
})

/** metis's essay flow, reduced: a root of a sitting whose Complete step reads it. */
const essayOf = (completeReading: ReadsOver<SittingInput>) => {
	const Complete = step(
		"Complete",
		{
			input: SittingInput,
			output: Schema.Struct({}),
			error: Schema.Never,
			reads: completeReading,
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
		input: SittingInput,
		children: [Complete],
		start: (input) => [Complete.of(input)],
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
		kinds: [Complete, Sit],
		edges: []
	})
}

/** Where the modules are placed: printed, never loaded. */
const placement = (completeReading: ReadsOver<SittingInput>): Placement => ({
	fragment: "#fragment.ts",
	programs: "#programs.ts",
	relations: "#relations.ts",
	schema: { from: "#app.ts", name: "App" },
	writer: { from: "#roles.ts", name: "Loader" },
	flow: { from: "#flows.ts", name: "essay" },
	reads: { from: "#reads.ts", exports: { CompleteReads: completeReading } },
	contracts: { from: "#contracts.ts", exports: {} }
})

describe("a step's read of variant cells", () => {
	it.effect(
		"compiles its records beside the variant's one declaration wherever its row holds one",
		(ctx) =>
			searched(
				ctx,
				exhaust(
					{
						suite: "variant reads",
						generator: element(Place.literals),
						literal: Formatter.format,
						coverage: requiredInSpace<Place>(Place.literals),
						caseHang: caseHangMillis,
						box: "a step reading a sitting whose QtiValue cell stands in its own row, an array attachment's, an option attachment's, or an attachment's under an array attachment (metis's carried multiples)",
						oracle: {
							kind: "specification",
							name: "grizzle's compile of the read's level extended by the records den prints, one declaration per variant name"
						}
					},
					(place, c) =>
						Effect.sync(() => {
							c.note(place)
							const sitting = readAt(place)
							const completeReading = completeReads(sitting)
							const lowered = lower(essayOf(completeReading))
							const read = Arr.getUnsafe(
								Arr.flatMap(lowered.steps, (s) => (s.name === "Complete" ? s.reads : [])),
								0
							)
							assert.strictEqual(read.stem, "EssayCompleteReadSitting")
							const fragmentText = printFragment(lowered, placement(completeReading))
							assert.isTrue(
								Str.includes(
									`records("${read.stem}", CompleteReads.named.sitting, { digest: sha256 }, ["digest"])`
								)(fragmentText),
								"den's fragment builds the read's records from the reads export"
							)
							const made = Dynamic.records(read.stem, sitting, { digest: sha256 }, ["digest"], {
								names: {}
							})
							const holder = `${read.stem}${holderOf[place]}`
							assert.isTrue(
								Arr.some(made.relations, (r) => r.name === holder && Rec.has(r.fields, "value")),
								`${holder} holds the read's value cell, among ${Arr.join(
									Arr.map(made.relations, (r) => r.name),
									", "
								)}`
							)
							lawsOf(schema.extend([Delivery], "EssayDen", [...made.relations], [...made.rules]))
						})
				)
			)
	)
})
