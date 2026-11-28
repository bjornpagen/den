import { stripTypeScriptTypes } from "node:module"
import * as g from "@bjornpagen/grizzle"
import { aimed, exhaust, explore } from "@bjornpagen/testing/explore"
import { required, requiredInSpace } from "@bjornpagen/testing/features"
import { array, boolean, element, type Gen } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { testWorkers } from "@bjornpagen/testing/workers"
import * as NodeServices from "@effect/platform-node/NodeServices"
import { assert, layer } from "@effect/vitest"
import { regex } from "arkregex"
import {
	Array as Arr,
	Cron,
	Effect,
	Equal,
	Formatter,
	Option,
	Record,
	Schema,
	Stream,
	String as Str
} from "effect"
import { ChildProcess } from "effect/process"
import { flow } from "#algebra/flow.ts"
import {
	always,
	atSpawn,
	awaitFact,
	derived,
	given,
	none,
	noReads,
	operator,
	root,
	schedule,
	scheduleKey,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import {
	assign,
	chain,
	clock,
	fan,
	retry,
	review,
	sync,
	writeback
} from "#integration/slice/flows.ts"
import { lower } from "#lower/fragment.ts"
import { Text } from "#lower/keys.ts"
import { type Placement, printBinding, printFragment, printPrograms } from "#lower/print.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * Every module den prints for a flow parses as a module's code whatever its author named a field: a step's input
 * column, a column of its array of structs, and the input field naming the key of a fact it awaits, each named by a
 * word a module cannot bind, which den prints bound to a variable of its own wherever a printed rule binds the field
 * (lower/print.ts `bound`), so metis's `package` is `package` again.
 *
 * Oracle (specification): ECMAScript's grammar of a module, whose code is strict, as Node's parser judges each printed
 * module once its types are stripped (`node --input-type=module --check`), over every word the grammar keeps from a
 * binding in a module (its reserved words, those strict code reserves, `await`, `eval` and `arguments`) and the names
 * printed rules bind themselves, their builder `r`, the variables' maker `v` and a request's relation parameter
 * `requested`. Mutant it kills: printing a field as its own name wherever a rule binds it, `bound = (field) => field`,
 * which prints `const { package } = v(...)`, or `const { requested } = v(requested, ...)` in a root's request.
 */

/** The words no module's code can bind, and the names printed rules bind themselves. */
const Word = Schema.Literals([
	"await",
	"break",
	"case",
	"catch",
	"class",
	"const",
	"continue",
	"debugger",
	"default",
	"delete",
	"do",
	"else",
	"enum",
	"export",
	"extends",
	"false",
	"finally",
	"for",
	"function",
	"if",
	"import",
	"in",
	"instanceof",
	"new",
	"null",
	"return",
	"super",
	"switch",
	"this",
	"throw",
	"true",
	"try",
	"typeof",
	"var",
	"void",
	"while",
	"with",
	"yield",
	"implements",
	"interface",
	"let",
	"package",
	"private",
	"protected",
	"public",
	"static",
	"arguments",
	"eval",
	"r",
	"v",
	"requested"
])
type Word = typeof Word.Type

/** The app relation whose fact the step awaits, keyed by a text. */
const Fact = g.relation("Fact", { k: Text }, ["k"])

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

/**
 * A flow of one step whose input names `word` three ways, a column, a column of its structs and an awaited fact's key,
 * under a root whose input names it too, so its request's rule binds it.
 */
const named = (word: Word) => {
	const value = Schema.Struct({
		[word]: Schema.String,
		rows: Schema.Array(Schema.Struct({ [word]: Schema.String }))
	})
	const Named = step(
		"Named",
		{
			input: value,
			output: value,
			error: Schema.Never,
			reads: noReads,
			awaits: [awaitFact(Fact, { k: word })],
			uses: [],
			retry: none,
			waits: none,
			due: atSpawn,
			writes: writesNothing
		},
		(x: typeof value.Type) => Effect.succeed({ output: x })
	)
	const Run = root("Run", {
		trigger: operator,
		from: given,
		input: Schema.Struct({ [word]: Schema.String }),
		children: [Named],
		start: () => [],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	})
	return flow("Words", {
		writes: writer<{ readonly name: "loader" }>("loader"),
		kinds: [Named, Run],
		edges: []
	})
}

/** Where the modules are placed; no module is loaded, so the places are names alone. */
const placement: Placement = {
	fragment: "#fragment.ts",
	programs: "#programs.ts",
	relations: "#relations.ts",
	schema: { from: "#app.ts", name: "App" },
	writer: { from: "#roles.ts", name: "Loader" },
	flow: { from: "#flows.ts", name: "flow" },
	reads: { from: "#reads.ts", exports: {} },
	contracts: { from: "#contracts.ts", exports: {} }
}

/** How Node refuses `source` as a module's code once its types are stripped: its parser's report, or none. */
const refusalOf = (source: string) =>
	Effect.gen(function* () {
		const code = yield* Effect.try({
			try: () => stripTypeScriptTypes(source),
			catch: (thrown) => String(thrown)
		})
		const checking = yield* ChildProcess.make(
			process.execPath,
			["--input-type=module", "--check"],
			{
				stdin: Stream.encodeText(Stream.make(code)),
				stdout: "ignore"
			}
		)
		const [report, exit] = yield* Effect.all(
			[Stream.mkString(Stream.decodeText(checking.stderr)), checking.exitCode],
			{ concurrency: "unbounded" }
		)
		return exit === 0 ? Option.none<string>() : Option.some(report)
	}).pipe(
		Effect.scoped,
		Effect.catch((why) => Effect.succeedSome(String(why)))
	)

layer(NodeServices.layer)((it) =>
	it.effect("prints modules that parse whatever word an author names a field", (ctx) =>
		searched(
			ctx,
			exhaust(
				{
					suite: "printed names",
					generator: element(Word.literals),
					literal: Formatter.format,
					coverage: requiredInSpace<Word>(Word.literals),
					caseHang: caseHangMillis,
					box: "a flow of one step whose input names the word as a column, a column of its structs and an awaited fact's key",
					oracle: {
						kind: "specification",
						name: "ECMAScript's grammar of a module, as Node's parser judges each printed module"
					},
					concurrency: testWorkers
				},
				(word, c) =>
					Effect.gen(function* () {
						c.note(word)
						const lowered = lower(named(word))
						const modules = [
							["fragment", printFragment(lowered, placement)],
							["programs", printPrograms(lowered, placement)],
							["binding", printBinding(lowered, placement)]
						] as const
						const refusals = yield* Effect.forEach(modules, ([module, source]) =>
							Effect.map(refusalOf(source), (refusal) => [module, refusal] as const)
						)
						assert.deepStrictEqual(
							refusals,
							Arr.map(modules, ([module]) => [module, Option.none()] as const),
							`each module den prints for a field named ${word} parses`
						)
					})
			)
		)
	)
)

/** How a root is started: by its schedule, by an operator. */
const Started = Schema.Literals(["schedule", "operator"])
type Started = typeof Started.Type

/** The level a schedule's hour is read over: one of no relation, which den's role holds whole. */
const Bells = g.schema("Bells", [], [])

/** The hour a schedule's key derives: the instant and the member it names, a read of no relation. */
const hourOf = g
	.query(Bells)
	.rule((r) => r.find({ hour: r.param("at", g.int8), bell: r.param("member", Text) }))

/** An hour of the clock, and the bell that chimes it. */
const Hour = Schema.Struct({ hour: Schema.BigInt, bell: Schema.String })

/** Echoes its hour. */
const Chiming = step(
	"Chime",
	{
		input: Hour,
		output: Hour,
		error: Schema.Never,
		reads: noReads,
		awaits: [],
		uses: [],
		retry: none,
		waits: none,
		due: atSpawn,
		writes: writesNothing
	},
	(hour: typeof Hour.Type) => Effect.succeed({ output: hour })
)

/** The hourly root, each source's: a schedule's, its hour derived from its key, or an operator's, given. */
const hourly = Object.freeze({
	schedule: root("Hourly", {
		trigger: schedule(Cron.parseUnsafe("0 * * * *"), ["east"]),
		from: derived(scheduleKey, Bells, hourOf),
		input: Hour,
		children: [Chiming],
		start: (hour) => [Chiming.of(hour)],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	}),
	operator: root("Hourly", {
		trigger: operator,
		from: given,
		input: Hour,
		children: [Chiming],
		start: (hour) => [Chiming.of(hour)],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	})
})

/**
 * A flow of one root started as `started`, its one step echoing its input: a schedule's root keyed by its cron's
 * instant and its one member, or an operator's. Over both, a scheduled root's request records nothing beside its Root,
 * and an operator's records what it was requested with (the fragment's RequestedWith, lower/print.ts recordsRequest): a
 * schedule's input derives from its key, which the census requests every tick, so a deploy that changes that input
 * must never meet a recorded one and stop the census.
 *
 * Oracle (specification): docs/decisions.md, a root's request is one fact: scheduled roots record no input. Mutants it
 * kills: `recordsRequest = (j) => Option.isSome(j.root)`, which prints a schedule's request recording its input, and
 * `recordsRequestOf = () => true`, which makes a derived input record.
 */
const startedBy = (started: Started) =>
	started === "schedule"
		? flow("Bells", {
				writes: writer<{ readonly name: "loader" }>("loader"),
				kinds: [Chiming, hourly.schedule],
				edges: []
			})
		: flow("Bells", {
				writes: writer<{ readonly name: "loader" }>("loader"),
				kinds: [Chiming, hourly.operator],
				edges: []
			})

layer(NodeServices.layer)((it) =>
	it.effect(
		"prints a record of the request beside an operator's root and none beside a schedule's",
		(ctx) =>
			searched(
				ctx,
				exhaust(
					{
						suite: "printed requests",
						generator: element(Started.literals),
						literal: Formatter.format,
						coverage: requiredInSpace<Started>(Started.literals),
						caseHang: caseHangMillis,
						box: "a flow of one root, started by its schedule or by an operator",
						oracle: {
							kind: "specification",
							name: "scheduled roots record no input; an operator's records its kind's input fingerprint and its input's digest"
						},
						concurrency: testWorkers
					},
					(started, c) =>
						Effect.sync(() => {
							c.note(started)
							const programs = printPrograms(lower(startedBy(started)), placement)
							assert.strictEqual(
								Str.includes("bellsHourlyBellsRequestedWith")(programs),
								started === "operator",
								`a root started by ${started} records what it was requested with exactly where an operator starts it`
							)
						})
				)
			)
	)
)

/** The slice's flows by name, every feature den lowers among them: child scopes, finish reads, awaited facts, seats. */
const sliceFlows = Object.freeze({ chain, fan, sync, retry, assign, review, writeback, clock })

/**
 * A slice flow's name: every read of a step's or a scope's rows states its root, so each printed rule that binds a step
 * or a scope by parameter binds the root too, a probe of the key of grizzle's unit DenRoot, which every graph relation
 * leads with, never a read with its unit unbound.
 *
 * Every anti-join probe names its row's root too, a scan's among them, and so does every join of a rule that reads by
 * step or scope.
 *
 * Oracle (specification): docs/decisions.md, rooted reads (grizzle main's ruling, 2026-11-26). Mutants it kills: the
 * root binding dropped from `ownedBy` (a body read by its owner), from a claim's, a retry's or a fence's read, or from
 * a scope's unended steps; the root dropped from a pending step's probe of its Result, or from a finish's join of it.
 */
const SliceFlow = Schema.Literals([
	"chain",
	"fan",
	"sync",
	"retry",
	"assign",
	"review",
	"writeback",
	"clock"
])
type SliceFlow = typeof SliceFlow.Type

/** Whether a printed rule binds a step or a scope by a parameter of that name, and so reads a graph's rows by it. */
const STEP_OR_SCOPE = regex('r\\.param\\("(?:step|scope)"')

/** The slice's relations that carry a root field, every flow's graph's: a probe of one, any flow's, names it. */
const rooted = Arr.flatMap(Record.values(sliceFlows), (sliceFlow) =>
	Arr.flatMap(lower(sliceFlow).relations, (lowered) =>
		Arr.some(lowered.fields, (field) => field.name === "root") ? [lowered.name] : []
	)
)

/** Whether a printed rule binds the root it reads under. */
const ROOTED = regex('r\\.param\\("root"')

/**
 * Each join or anti-join a printed rule writes over a relation, by name or through the app's schema (`App.relations.X`,
 * another flow's relations a busy read probes): how, the relation, and its entries' text.
 */
const PROBE = regex("(\\.match|r\\.not)\\((?:\\w+\\.relations\\.)?(\\w+), \\{([^}]*)\\}", "g")

/** Whether a join's or an anti-join's entries name the root as an entry of its own: `root` or `root: …`. */
const NAMES_ROOT = regex("(?:^|,)\\s*root\\s*(?::|,|$)")

layer(NodeServices.layer)((it) =>
	it.effect("binds every read of a step's or a scope's rows by its root", (ctx) =>
		searched(
			ctx,
			exhaust(
				{
					suite: "rooted reads",
					generator: element(SliceFlow.literals),
					literal: Formatter.format,
					coverage: requiredInSpace<SliceFlow>(SliceFlow.literals),
					caseHang: caseHangMillis,
					box: "each of the slice's flows, printed",
					oracle: {
						kind: "specification",
						name: "docs/decisions.md: every read of a graph's rows by step or scope states its root"
					},
					concurrency: testWorkers
				},
				(name, c) =>
					Effect.sync(() => {
						c.note(name)
						const rules = Arr.drop(
							Str.split(".rule((r) =>")(printPrograms(lower(sliceFlows[name]), placement)),
							1
						)
						assert.deepStrictEqual(
							Arr.filter(rules, (rule) => STEP_OR_SCOPE.test(rule) && !ROOTED.test(rule)),
							[],
							`every rule of the flow ${name} that reads by step or scope binds its root`
						)
						assert.deepStrictEqual(
							Arr.flatMap(rules, (rule) =>
								Arr.flatMap(Arr.fromIterable(Str.matchAll(PROBE)(rule)), (found) => {
									const [probe, how, probed, entries] = found
									if (probed === undefined || entries === undefined) {
										return [probe]
									}
									return Arr.contains(rooted, probed) &&
										(how === "r.not" || STEP_OR_SCOPE.test(rule)) &&
										!NAMES_ROOT.test(entries)
										? [probe]
										: []
								})
							),
							[],
							`every anti-join of the flow ${name}, and every join of a rule it reads by step or scope, names its row's root`
						)
					})
			)
		)
	)
)

/** A field's type, as a deploy may declare it: a base, a roster of two handles, or a brand of a base. */
const FIELD_TYPES = [
	"bigint",
	"text",
	"east or west",
	"east or north",
	"a brand of text",
	"a brand of bigint"
] as const

/** A field's name and type in a root kind's input, as a deploy may declare it. */
type Field = readonly [name: "hour" | "bell" | "note", type: (typeof FIELD_TYPES)[number]]

/** A root kind's input: its fields in order, each name once, none to three of them. */
type Shape = ReadonlyArray<Field>

const field: Gen<Field> = (source) => [
	source.draw(element(["hour", "bell", "note"] as const)),
	source.draw(element(FIELD_TYPES))
]

/** A field's schema: its type's, a brand named after the field, so no two fields of a shape share one. */
const schemaOf = ([name, type]: Field) => {
	switch (type) {
		case "bigint":
			return Schema.BigInt
		case "text":
			return Schema.String
		case "east or west":
			return Schema.Literals(["east", "west"])
		case "east or north":
			return Schema.Literals(["east", "north"])
		case "a brand of text":
			return name === "hour"
				? Schema.String.pipe(Schema.brand("HourMark"))
				: name === "bell"
					? Schema.String.pipe(Schema.brand("BellMark"))
					: Schema.String.pipe(Schema.brand("NoteMark"))
		case "a brand of bigint":
			return name === "hour"
				? Schema.BigInt.pipe(Schema.brand("HourMark"))
				: name === "bell"
					? Schema.BigInt.pipe(Schema.brand("BellMark"))
					: Schema.BigInt.pipe(Schema.brand("NoteMark"))
	}
}

const shapeGen: Gen<Shape> = (source) =>
	Arr.dedupeWith(source.draw(array(field, { min: 0, max: 3 })), ([a], [b]) => a === b)

/**
 * Two deployments' shapes of one operator's root kind's input, none to three fields: the later the earlier again, or
 * one drawn afresh. Over them, the heading a binding fingerprints the kind's input by is one exactly where the shapes
 * are (the same fields, in order, of the same types), so a request again across a deploy that changed the input is
 * never compared with the first's digest, and one within a deployment always is. It imports codecText exactly where it
 * binds a relation's codec texts, so an input of no field imports none. Mutants it kills: inputHeadingOf printing
 * `${f.name}` for each field, without its type, which gives an hour as text an hour's heading; and headingTypeOf
 * printing a roster or a brand by its name alone, which gives east or north east or west's heading, and a brand of
 * bigint a brand of text's; and the codecText import printed for every recording root, which an input of no field
 * leaves unused.
 */
const deployed: Gen<readonly [Shape, Shape]> = (source) => {
	const earlier = source.draw(shapeGen)
	return [earlier, source.draw(boolean) ? earlier : source.draw(shapeGen)]
}

/** A flow of one operator's root over an input of `shape`, its one step echoing it. */
const shapedBy = (shape: Shape) => {
	const Input = Schema.Struct(
		Record.fromEntries(Arr.map(shape, (f) => [f[0], schemaOf(f)] as const))
	)
	const Chime = step(
		"Chime",
		{
			input: Input,
			output: Input,
			error: Schema.Never,
			reads: noReads,
			awaits: [],
			uses: [],
			retry: none,
			waits: none,
			due: atSpawn,
			writes: writesNothing
		},
		(input: typeof Input.Type) => Effect.succeed({ output: input })
	)
	const Hourly = root("Hourly", {
		trigger: operator,
		from: given,
		input: Input,
		children: [Chime],
		start: (input) => [Chime.of(input)],
		exclusive: shared,
		window: always,
		precondition: unconditional,
		finish: finishing
	})
	return flow("Bells", {
		writes: writer<{ readonly name: "loader" }>("loader"),
		kinds: [Chime, Hourly],
		edges: []
	})
}

/** The binding den prints for a flow of one operator's root over an input of `shape`. */
const bindingOf = (shape: Shape): string => printBinding(lower(shapedBy(shape)), placement)

/** The heading the binding fingerprints the hourly kind's input by: the line that takes it, as printed. */
const headingOf = (shape: Shape): Option.Option<string> =>
	Arr.findFirst(
		Str.split("\n")(bindingOf(shape)),
		Str.includes("bellsHourlyHeading = inputFingerprint(")
	)

type Deployed =
	| "the same shape"
	| "another shape"
	| "an input of no field"
	| "a roster's handles changed"
	| "a brand's base changed"

/**
 * Two deployments of a one-field input whose field's type moves from `earlier` to `later` and nothing else: what a
 * heading that names a roster or a brand by its name alone gives one heading.
 */
const swapped =
	(earlier: Field[1], later: Field[1]): Gen<readonly [Shape, Shape]> =>
	(source) => {
		const name = source.draw(element(["hour", "bell", "note"] as const))
		return [[[name, earlier]], [[name, later]]]
	}

/** Whether two shapes differ in one field's type alone, from `from` to `to`. */
const swappedIn = (earlier: Shape, later: Shape, from: Field[1], to: Field[1]): boolean =>
	earlier.length === later.length &&
	Arr.filter(Arr.zip(earlier, later), ([[a, t], [b, u]]) => a !== b || t !== u).length === 1 &&
	Arr.some(Arr.zip(earlier, later), ([[a, t], [b, u]]) => a === b && t === from && u === to)

/** Whether two shapes are one: the same fields, in the same order, of the same types. */
const sameShape = (earlier: Shape, later: Shape): boolean =>
	earlier.length === later.length &&
	Arr.every(Arr.zip(earlier, later), ([[a, t], [b, u]]) => a === b && t === u)

layer(NodeServices.layer)((it) =>
	it.effect("prints a kind's input heading that changes exactly with its input's shape", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "printed headings",
					oracle: {
						kind: "specification",
						name: "docs/decisions.md: a request again under another fingerprint, after a deploy that changed the kind's input heading, is the same keyed act"
					},
					draw: aimed(deployed, [
						["a roster's handles changed", swapped("east or west", "east or north")],
						["a brand's base changed", swapped("a brand of text", "a brand of bigint")]
					]),
					literal: Formatter.format,
					coverage: required<Deployed>(
						[
							"the same shape",
							"another shape",
							"an input of no field",
							"a roster's handles changed",
							"a brand's base changed"
						],
						{
							cases: 40,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 100,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				([earlier, later], c) =>
					Effect.sync(() => {
						c.note(sameShape(earlier, later) ? "the same shape" : "another shape")
						if (Arr.isReadonlyArrayEmpty(earlier)) {
							c.note("an input of no field")
						}
						if (swappedIn(earlier, later, "east or west", "east or north")) {
							c.note("a roster's handles changed")
						}
						if (swappedIn(earlier, later, "a brand of text", "a brand of bigint")) {
							c.note("a brand's base changed")
						}
						const first = headingOf(earlier)
						assert.isTrue(
							Option.isSome(first),
							"an operator's root kind's binding takes its heading"
						)
						assert.strictEqual(
							Equal.equals(first, headingOf(later)),
							sameShape(earlier, later),
							"two headings are one exactly where their shapes are"
						)
						const binding = bindingOf(earlier)
						assert.strictEqual(
							Str.includes('import * as gCompile from "@bjornpagen/grizzle/compile"')(binding),
							Str.includes("Texts = Object.freeze(")(binding),
							"a binding imports the compile entry, for its codecText, exactly where it binds a relation's codec texts, an input of no field binding none"
						)
					})
			)
		)
	)
)
