import { exhaust } from "@den/testing/explore"
import { requiredInSpace } from "@den/testing/features"
import { element } from "@den/testing/gen"
import { searched } from "@den/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Effect, Exit, Formatter, Option, Schema } from "effect"
import { flow } from "#algebra/flow.ts"
import {
	type AnyStepKind,
	edge,
	lane,
	Refused,
	root,
	scope,
	step,
	writesNothing
} from "#algebra/kinds.ts"
import { caseHang } from "#limits.ts"

/**
 * A flow's declaration-time checks: a well-formed flow is accepted, and each fault is refused with Refused when the
 * flow is declared, naming the declaration: a kind declared twice, a step on a lane the flow does not declare, an edge
 * from a step it does not declare, a kind no scope owns, a finish reading a kind its scope never holds, no root at
 * all, and a name den cannot lower into a relation's.
 *
 * Oracle (specification): the proposal's rules of section 4, one fault at a time.
 */

const Fault = Schema.Literals([
	"none",
	"twice",
	"undeclared lane",
	"undeclared edge source",
	"unowned kind",
	"foreign read",
	"no root",
	"bad name"
])
type Fault = typeof Fault.Type

const Empty = Schema.Struct({})

const declare = (fault: Fault) => {
	const work = lane("Work", { width: 1, window: { kind: "always" }, pause: "running", attempts: 1 })
	const other = lane("Other", {
		width: 1,
		window: { kind: "always" },
		pause: "running",
		attempts: 1
	})
	const shape = { input: Empty, output: Empty, error: Schema.Never, writes: writesNothing }
	const done = () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	const A = step(fault === "undeclared lane" ? other : work, "A", shape, done)
	const B = step(work, "B", shape, done)
	const Stray = step(work, fault === "twice" ? "A" : "Stray", shape, done)
	const finish = (reads: ReadonlyArray<AnyStepKind>) => ({
		lane: work,
		reads,
		error: Schema.Never,
		writes: writesNothing,
		body: () => Effect.succeed({ insert: {}, put: {}, delete: {} })
	})
	const Inner = scope("Inner", {
		input: Empty,
		children: [B],
		start: () => [B.of({})],
		finish: finish(fault === "foreign read" ? [A] : [B])
	})
	const Run = root(fault === "bad name" ? "run_lower" : "Run", {
		trigger: { kind: "command" },
		input: Empty,
		children: fault === "unowned kind" ? [Inner] : [A, Inner],
		start: () => [Inner.of({})],
		finish: finish([])
	})
	return flow("Check", {
		lanes: [work],
		kinds:
			fault === "no root"
				? [A, B, Inner]
				: fault === "twice"
					? [A, B, Stray, Inner, Run]
					: [A, B, Inner, Run],
		edges: fault === "undeclared edge source" ? [edge("Loose", Stray, B, () => [])] : []
	})
}

it.effect("accepts a well-formed flow and refuses each fault when it is declared", (ctx) =>
	searched(
		ctx,
		exhaust(
			{
				suite: "flow checks",
				generator: element(Fault.literals),
				literal: Formatter.format,
				limit: Fault.literals.length,
				coverage: requiredInSpace<Fault>(Fault.literals),
				caseHang,
				box: "a flow of two steps, a scope and a root, with each single fault",
				oracle: {
					kind: "specification",
					name: "the proposal's section 4 rules, one fault at a time"
				}
			},
			(fault, c) =>
				Effect.gen(function* () {
					c.note(fault)
					const declared = yield* Effect.exit(
						Effect.try({
							try: () => declare(fault),
							catch: (thrown) => ({ refused: thrown instanceof Refused })
						})
					)
					assert.deepStrictEqual(
						Exit.findErrorOption(declared),
						fault === "none" ? Option.none() : Option.some({ refused: true })
					)
				})
		)
	)
)
