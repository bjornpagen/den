import { stripTypeScriptTypes } from "node:module"
import { relation } from "@bjornpagen/grizzle"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { element } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { testWorkers } from "@bjornpagen/testing/workers"
import * as NodeServices from "@effect/platform-node/NodeServices"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option, Schema, Stream } from "effect"
import { ChildProcess } from "effect/process"
import { flow } from "#algebra/flow.ts"
import {
	always,
	atSpawn,
	awaitFact,
	none,
	noReads,
	operator,
	root,
	shared,
	step,
	unconditional,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
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
 * binding in a module (its reserved words, those strict code reserves, `await`, `eval` and `arguments`) and the two
 * names each printed rule binds itself, its builder `r` and the variables' maker `v`. Mutant it kills: printing a field
 * as its own name wherever a rule binds it, `bound = (field) => field`, which prints `const { package } = v(...)`.
 */

/** The words no module's code can bind, and the two names each printed rule binds itself. */
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
	"v"
])
type Word = typeof Word.Type

/** The app relation whose fact the step awaits, keyed by a text. */
const Fact = relation("Fact", { k: Text }, ["k"])

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

/** A flow of one step whose input names `word` three ways: a column, a column of its structs, an awaited fact's key. */
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
		input: Schema.Struct({}),
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
	reads: { from: "#reads.ts", exports: {} }
}

/** How Node refuses `source` as a module's code once its types are stripped: its parser's report, or none. */
const refusalOf = (source: string) =>
	Effect.gen(function* () {
		const code = yield* Effect.try({
			try: () => stripTypeScriptTypes(source),
			catch: (thrown) => `${thrown}`
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
		Effect.catch((why) => Effect.succeedSome(`${why}`))
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
