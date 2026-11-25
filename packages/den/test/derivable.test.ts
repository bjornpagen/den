import { pg, query, relation, schema, v } from "@bjornpagen/grizzle"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { element } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { testWorkers } from "@bjornpagen/testing/workers"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Cron, Effect, Exit, Formatter, Option, Schema } from "effect"
import { flow } from "#algebra/flow.ts"
import {
	always,
	app,
	derived,
	given,
	none,
	operator,
	Refused,
	root,
	schedule,
	scheduleKey,
	shared,
	type Derived,
	type Exclusive,
	exclusiveBy,
	type InputFrom,
	type CommitsNothing,
	type SeatOf,
	type Stored,
	type Trigger,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { lower } from "#lower/fragment.ts"
import { Text } from "#lower/keys.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * A derived root's key and input as lowering holds them: each a struct of text, bigint and boolean columns alone, the
 * columns a read of a level of the app's binds and delivers, its key's field never `root`, which its record keeps for
 * itself; any other is refused with Refused when the flow is lowered, naming the root's key or its derived input. Each
 * fault is a kind built past `root`'s types (a spread, as a deploy's copy of a flow is), so lowering is the check that
 * meets it.
 *
 * Oracle (specification): docs/decisions.md, a derived root's key and input hold text, bigint and boolean columns
 * alone (lower/fragment.ts derivable), and its key is a closed record held to its root both ways and kept through
 * retirement. Mutants it kills: `derivable = () => true`; the "columns alone" refusal deleted; either of the key's laws
 * dropped; the key cleared with the graph.
 */

const Fault = Schema.Literals([
	"none",
	"a key's Option",
	"a key's roster",
	"a key's double",
	"a key's brand",
	"a key's field named root",
	"an input's array",
	"an input's tagged union",
	"an input's double"
])
type Fault = typeof Fault.Type

/** The app's wants of a batch, which the read derives a run's size from. */
const Want = relation("Want", { batch: Text, size: pg.bigint }, ["batch", "size"])

/** The level the read is over. */
const Wants = schema("Wants", [Want], [])

/** A key whose field the read's text parameter cannot take. */
const NumberedKey = Schema.Struct({ batch: Schema.BigInt })

/** A level the read is not over. */
const Elsewhere = schema("Elsewhere", [Want], [])

/** A batch's largest wanted size. */
const wantedOf = query(Wants).rule((r) => {
	const { batch, size } = v(Want, "want")
	return r
		.match(Want, { batch, size })
		.where(r.eq(batch, r.param("batch", Text)))
		.find({ batch, size: r.max(size) })
})

/** A run of a batch the app's write requests by the batch alone, its size derived. */
const Wanted = root("Wanted", {
	trigger: app,
	from: derived(Schema.Struct({ batch: Schema.String }), Wants, wantedOf),
	input: Schema.Struct({ batch: Schema.String, size: Schema.BigInt }),
	children: [],
	start: () => [],
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

/** The key a fault gives the root, or its own. */
const keyOf = (fault: Fault) => {
	switch (fault) {
		case "a key's Option":
			return Schema.Struct({ batch: Schema.Option(Schema.String) })
		case "a key's roster":
			return Schema.Struct({ batch: Schema.Literals(["left", "right"]) })
		case "a key's double":
			return Schema.Struct({ batch: Schema.Finite })
		case "a key's brand":
			return Schema.Struct({ batch: Schema.String.pipe(Schema.brand("Batch")) })
		case "a key's field named root":
			return Schema.Struct({ root: Schema.String })
		case "none":
		case "an input's array":
		case "an input's tagged union":
		case "an input's double":
			return Wanted.from.key
	}
}

/** The input a fault gives the root, or its own. */
const inputOf = (fault: Fault) => {
	switch (fault) {
		case "an input's array":
			return Schema.Struct({ batch: Schema.String, size: Schema.Array(Schema.BigInt) })
		case "an input's tagged union":
			return Schema.Struct({
				batch: Schema.String,
				size: Schema.TaggedUnion({ Some: { n: Schema.BigInt }, None: {} })
			})
		case "an input's double":
			return Schema.Struct({ batch: Schema.String, size: Schema.Finite })
		case "none":
		case "a key's Option":
		case "a key's roster":
		case "a key's double":
		case "a key's brand":
		case "a key's field named root":
			return Wanted.input
	}
}

/** The flow of one derived root, its key and its input as `fault` gives them. */
const declare = (fault: Fault) =>
	flow("Wants", {
		writes: writer<{ readonly name: "loader" }>("loader"),
		kinds: [{ ...Wanted, from: { ...Wanted.from, key: keyOf(fault) }, input: inputOf(fault) }],
		edges: []
	})

it.effect("lowers a derived root's key and input of base columns and refuses any other", (ctx) =>
	searched(
		ctx,
		exhaust(
			{
				suite: "derived lowering",
				generator: element(Fault.literals),
				literal: Formatter.format,
				coverage: requiredInSpace<Fault>(Fault.literals),
				caseHang: caseHangMillis,
				box: "a flow of one derived root, its key or its input given each fault, one at a time",
				oracle: {
					kind: "specification",
					name: "a derived root's key and input hold text, bigint and boolean columns alone"
				},
				concurrency: testWorkers
			},
			(fault, c) =>
				Effect.gen(function* () {
					c.note(fault)
					const lowered = yield* Effect.exit(
						Effect.try({
							try: () => lower(declare(fault)),
							catch: (thrown) => ({ refused: thrown instanceof Refused })
						})
					)
					assert.deepStrictEqual(
						Exit.findErrorOption(lowered),
						fault === "none" ? Option.none() : Option.some({ refused: true })
					)
				})
		)
	)
)

/** The sources beside their triggers, and the seats, whose verdicts `root`'s declared type gives. */
const Source = Schema.Literals([
	"derived",
	"scheduled",
	"given",
	"twoRows",
	"otherParameter",
	"otherRow",
	"scheduleGiven",
	"scheduleKeyedOtherwise",
	"eitherSource",
	"fewerColumns",
	"otherLevel",
	"eitherTrigger",
	"twoDerived",
	"eitherCommand",
	"keyOtherType",
	"seatByKey",
	"seatByInput",
	"seatUninferred"
])
type Source = typeof Source.Type

/**
 * What `root` takes beside its name for a root of input `IS`, trigger `Tr` and source `From`: its own parameter's type
 * (its `RootDeclared` among it), so a verdict is what `root` itself says.
 */
type RootTakes<IS extends Stored, Tr extends Trigger, From extends InputFrom> = Parameters<
	typeof root<
		"Probe",
		IS,
		readonly [],
		readonly [],
		typeof Wanted.finish.output,
		typeof Schema.Never,
		CommitsNothing,
		never,
		Tr,
		From
	>
>[1]

/** An input of the batch alone, which the read delivers more than. */
const OnlyBatch = Schema.Struct({ batch: Schema.String })

/** An input of a column beside the read's, which it delivers less than. */
const WithLate = Schema.Struct({ batch: Schema.String, size: Schema.BigInt, late: Schema.Boolean })

/** The members of `T` named by a sentence: the refusals `root`'s declared type adds. */
type RefusalsOf<T> = { [K in keyof T]: K extends `${string} ${string}` ? K : never }[keyof T]

/**
 * The refusal `root` names for a trigger and a source, the member its parameter's type adds where they do not hold, or
 * "accepted".
 */
type VerdictOf<T> = [RefusalsOf<T>] extends [never] ? "accepted" : RefusalsOf<T>

/** Whether a seat function `S` names the seat `root`'s parameter `D` takes. */
type SeatVerdict<S, D> = D extends { readonly exclusive: infer E }
	? [S] extends [E]
		? "accepted"
		: "refused"
	: never

/** A batch's wanted sizes, every one: a read that can find two rows for a key. */
const everyWant = query(Wants).rule((r) => {
	const { batch, size } = v(Want, "want")
	return r
		.match(Want, { batch, size })
		.where(r.eq(batch, r.param("batch", Text)))
		.find({ batch, size })
})

/** A schedule's batch run, read of no relation: its member's batch at its instant's size. */
const hourOf = query(Wants).rule((r) =>
	r.find({ batch: r.param("member", Text), size: r.param("at", pg.bigint) })
)

/** The trigger of a schedule of one member. */
const hourly = schedule(Cron.parseUnsafe("0 * * * *"), ["east"])

/** The finish every accepted root here runs. */
const finished = Wanted.finish

/** A scheduled run of a batch, its input derived from its key. */
const Scheduled = root("Scheduled", {
	trigger: hourly,
	from: derived(scheduleKey, Wants, hourOf),
	input: Wanted.input,
	children: [],
	start: () => [],
	exclusive: exclusiveBy((key: { readonly member: string }) => key.member),
	window: always,
	precondition: unconditional,
	finish: finished
})

/** An operator's run of a batch, its input given. */
const Given = root("Given", {
	trigger: operator,
	from: given,
	input: Wanted.input,
	children: [],
	start: () => [],
	exclusive: exclusiveBy((run: { readonly batch: string }) => run.batch),
	window: always,
	precondition: unconditional,
	finish: finished
})

/**
 * What `root`'s own parameter says of each source beside its trigger, and of each seat, each verdict a type the
 * typecheck holds to the refusal it names: accepted, a derived read held to its level, key and input, a schedule's to
 * `scheduleKey`, a given input, and a derived root's seat named by its key; refused, each by its own rule, a read that
 * can find two rows for a key, takes another parameter, delivers another row or fewer columns, or is over another
 * level, a key whose value its read's parameter cannot take, a schedule given its input or keyed otherwise, a source of
 * either kind or two derived ones, a trigger of either kind (a schedule or a command, or two commands), and a derived
 * root's seat named by its input; and a seat function before `root`'s types are inferred sees `unknown`.
 */
const verdicts: Readonly<{
	derived: VerdictOf<RootTakes<typeof Wanted.input, typeof app, typeof Wanted.from>>
	scheduled: VerdictOf<RootTakes<typeof Wanted.input, typeof hourly, typeof Scheduled.from>>
	given: VerdictOf<RootTakes<typeof Wanted.input, typeof operator, typeof given>>
	twoRows: VerdictOf<
		RootTakes<
			typeof Wanted.input,
			typeof app,
			Derived<typeof Wanted.from.key, typeof Wants, typeof everyWant>
		>
	>
	otherParameter: VerdictOf<
		RootTakes<
			typeof Wanted.input,
			typeof app,
			Derived<typeof scheduleKey, typeof Wants, typeof wantedOf>
		>
	>
	otherRow: VerdictOf<RootTakes<typeof OnlyBatch, typeof app, typeof Wanted.from>>
	scheduleGiven: VerdictOf<RootTakes<typeof Wanted.input, typeof hourly, typeof given>>
	scheduleKeyedOtherwise: VerdictOf<
		RootTakes<typeof Wanted.input, typeof hourly, typeof Wanted.from>
	>
	eitherSource: VerdictOf<
		RootTakes<typeof Wanted.input, typeof app, typeof given | typeof Wanted.from>
	>
	fewerColumns: VerdictOf<RootTakes<typeof WithLate, typeof app, typeof Wanted.from>>
	otherLevel: VerdictOf<
		RootTakes<
			typeof Wanted.input,
			typeof app,
			Derived<typeof Wanted.from.key, typeof Elsewhere, typeof wantedOf>
		>
	>
	eitherTrigger: VerdictOf<
		RootTakes<typeof Wanted.input, typeof hourly | typeof app, typeof Scheduled.from>
	>
	eitherCommand: VerdictOf<
		RootTakes<typeof Wanted.input, typeof operator | typeof app, typeof given>
	>
	keyOtherType: VerdictOf<
		RootTakes<
			typeof Wanted.input,
			typeof app,
			Derived<typeof NumberedKey, typeof Wants, typeof wantedOf>
		>
	>
	twoDerived: VerdictOf<
		RootTakes<typeof Wanted.input, typeof app, typeof Wanted.from | typeof Scheduled.from>
	>
	seatByKey: SeatVerdict<
		Exclusive<{ readonly batch: string }>,
		RootTakes<typeof Wanted.input, typeof app, typeof Wanted.from>
	>
	seatByInput: SeatVerdict<
		Exclusive<{ readonly size: bigint }>,
		RootTakes<typeof Wanted.input, typeof app, typeof Wanted.from>
	>
	seatUninferred: [unknown] extends [SeatOf<Stored["Type"], InputFrom>] ? "unknown" : "a type"
}> = {
	derived: "accepted",
	scheduled: "accepted",
	given: "accepted",
	twoRows: "a derived root's read finds at most one row for its key",
	otherParameter: "a derived root's read takes its key's fields as its parameters, and no other",
	otherRow: "a derived root's read delivers its input and nothing else",
	scheduleGiven: "a scheduled root's input derives from its key",
	scheduleKeyedOtherwise: "a scheduled root's key is scheduleKey, its instant and its member",
	eitherSource: "a root's input comes from one source",
	fewerColumns: "a derived root's read delivers its whole input",
	otherLevel: "a derived root's read is over the level its source names",
	eitherTrigger: "a root is started by a schedule or by a command, never by either",
	twoDerived: "a root's input comes from one source",
	eitherCommand: "a root is started by a schedule or by a command, never by either",
	keyOtherType: "a derived root's key binds its read's parameters",
	seatByKey: "accepted",
	seatByInput: "refused",
	seatUninferred: "unknown"
}

/** A run of a batch derived from its key, one live run per batch, its seat named by its key. */
const Seated = root("Seated", {
	trigger: app,
	from: Wanted.from,
	input: Wanted.input,
	children: [],
	start: () => [],
	exclusive: exclusiveBy((key: { readonly batch: string }) => key.batch),
	window: always,
	precondition: unconditional,
	finish: finished
})

/** The root each accepted declaration is, which lowering takes. */
const accepted = { derived: Wanted, scheduled: Scheduled, given: Given, seatByKey: Seated } as const

it.effect("types a root's source and seat with its trigger, and lowers each it accepts", (ctx) =>
	searched(
		ctx,
		exhaust(
			{
				suite: "root's sources by type",
				generator: element(Source.literals),
				literal: Formatter.format,
				coverage: requiredInSpace<Source>(Source.literals),
				caseHang: caseHangMillis,
				box: "each source beside its trigger, and each seat, the verdicts name",
				oracle: {
					kind: "specification",
					name: "docs/decisions.md: one trigger, one source, a schedule's derived from scheduleKey, a read held to its level, key, input and one row, a derived root's seat named by its key"
				},
				concurrency: testWorkers
			},
			(source, c) =>
				Effect.sync(() => {
					c.note(source)
					if (
						source === "derived" ||
						source === "scheduled" ||
						source === "given" ||
						source === "seatByKey"
					) {
						const kind = accepted[source]
						const lowered = lower(
							flow("Wants", {
								writes: writer<{ readonly name: "loader" }>("loader"),
								kinds: [kind],
								edges: []
							})
						)
						assert.deepStrictEqual(
							Arr.map(lowered.joins, (j) => j.name),
							[kind.name],
							"a root its type accepts lowers"
						)
						return
					}
					assert.notStrictEqual(verdicts[source], "accepted")
				})
		)
	)
)

/** The records lowering holds to their roots: a derived root's key, a given root's record of its input. */
const Recorded = Schema.Literals(["a derived root's key", "a given root's record"])
type Recorded = typeof Recorded.Type

it.effect(
	"holds a derived root's key, and a given root's record, to its root both ways, kept through retirement",
	(ctx) =>
		searched(
			ctx,
			exhaust(
				{
					suite: "derived lowering's records",
					generator: element(Recorded.literals),
					literal: Formatter.format,
					coverage: requiredInSpace<Recorded>(Recorded.literals),
					caseHang: caseHangMillis,
					box: "a flow of one root of each source",
					oracle: {
						kind: "specification",
						name: "docs/decisions.md: a derived root's key is closed, kept and contains its root, as a given root's record does"
					},
					concurrency: testWorkers
				},
				(recorded, c) =>
					Effect.sync(() => {
						c.note(recorded)
						const kind = recorded === "a derived root's key" ? Wanted : Given
						const lowered = lower(
							flow("Wants", {
								writes: writer<{ readonly name: "loader" }>("loader"),
								kinds: [kind],
								edges: []
							})
						)
						const record =
							recorded === "a derived root's key" ? `Wants${kind.name}Key` : "WantsRequestedWith"
						const contains = (from: string, to: string) =>
							Arr.some(
								lowered.laws,
								(law) =>
									law.kind === "contained" &&
									law.from.relation === from &&
									law.to.relation === to &&
									Arr.join(
										Arr.map(law.from.terms, (t) => t.field),
										","
									) === "root" &&
									Arr.join(
										Arr.map(law.to.terms, (t) => t.field),
										","
									) === "root"
							)
						assert.isTrue(contains(record, "WantsRoot"), "the record names a root that stands")
						assert.isTrue(
							contains("WantsRoot", record),
							"no root of the kind stands without its record"
						)
						assert.isFalse(
							Arr.contains(lowered.cleared, record),
							"retirement keeps the record with the root"
						)
						assert.strictEqual(
							Arr.some(lowered.relations, (r) => r.name === `Wants${kind.name}Key`),
							recorded === "a derived root's key",
							"only a derived root keeps a key"
						)
					})
			)
		)
)
