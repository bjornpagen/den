import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { element } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { testWorkers } from "@bjornpagen/testing/workers"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Effect, Exit, Formatter, Option, Schema } from "effect"
import { flow } from "#algebra/flow.ts"
import {
	type AnyStepKind,
	always,
	atSpawn,
	attempts,
	edge,
	operator,
	Refused,
	type Resource,
	resource,
	root,
	scope,
	shared,
	step,
	unconditional,
	utcHours,
	type Window,
	writer,
	writesNothing
} from "#algebra/kinds.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * A flow's declaration-time checks: a well-formed flow is accepted, and each fault is refused with Refused when the
 * flow or one of its kinds is declared, naming the declaration: a kind declared twice, an edge from a step the flow does
 * not declare, a kind no scope owns, a finish reading a kind its scope never holds, no root at all, a name den cannot
 * lower into a relation's, two resources of one name, a resource of no seats, a ladder of no attempts, a count of waits
 * below 0, and a window that is empty or reaches past a day.
 *
 * Oracle (specification): the proposal's rules of section 4, one fault at a time.
 */

const Fault = Schema.Literals([
	"none",
	"twice",
	"undeclared edge source",
	"unowned kind",
	"foreign read",
	"no root",
	"bad name",
	"resource name twice",
	"no seats",
	"no attempts",
	"negative waits",
	"empty window",
	"window past a day"
])
type Fault = typeof Fault.Type

/**
 * The box of grizzle's own work-queue law suite: two seats, where two leases meet at a seat as often as they miss.
 *
 * @limitKind published
 * @owner the flow checks' resource, after grizzle's work-queue law suite
 * @unit seats
 * @scope the steps of the checked flow that use the Pool
 * @constraint compile-time constant
 * @source https://github.com/bjornpagen/grizzle/blob/a226cbac/test/support/laws/boxes.ts
 * @quote Two resources of two seats each: two leases meet at a seat as often as they miss it.
 * @verified 2026-11-11
 */
const boxSeats = 2

/**
 * A resource with none of the box's seats, the count a resource is refused for.
 *
 * @limitKind derived
 * @owner the flow checks' refused resource
 * @unit seats
 * @scope a resource declared with no seat, which den refuses
 * @derivation the box's seats less themselves: a resource that holds no seat bounds nothing
 * @from {@link boxSeats}
 */
const noSeats = boxSeats - boxSeats

const Empty = Schema.Struct({})

const windowOf = (fault: Fault): Window => {
	switch (fault) {
		case "empty window":
			return utcHours(5, 5)
		case "window past a day":
			return utcHours(3, 25)
		case "none":
		case "twice":
		case "undeclared edge source":
		case "unowned kind":
		case "foreign read":
		case "no root":
		case "bad name":
		case "resource name twice":
		case "no seats":
		case "no attempts":
		case "negative waits":
			return always
	}
}

const declare = (fault: Fault) => {
	const pool = resource("Pool", fault === "no seats" ? noSeats : boxSeats)
	const other: Resource = fault === "resource name twice" ? resource("Pool", boxSeats) : pool
	const ladder = fault === "no attempts" ? attempts(0) : attempts(1)
	const shape = (uses: ReadonlyArray<Resource>) => ({
		input: Empty,
		output: Empty,
		error: Schema.Never,
		reads: {},
		awaits: [],
		uses,
		retry: ladder,
		waits: fault === "negative waits" ? -1 : 0,
		due: atSpawn,
		writes: writesNothing
	})
	const done = () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	const A = step("A", shape([pool]), done)
	const B = step("B", shape([other]), done)
	const Stray = step(fault === "twice" ? "A" : "Stray", shape([]), done)
	const finish = <const Reads extends ReadonlyArray<AnyStepKind>>(reads: Reads) => ({
		reads,
		output: Empty,
		error: Schema.Never,
		uses: [],
		retry: attempts(1),
		waits: 0,
		writes: writesNothing,
		body: () => Effect.succeed({ output: {}, writes: { insert: {}, put: {}, delete: {} } })
	})
	const Inner = scope("Inner", {
		input: Empty,
		children: [B],
		start: () => [B.of({})],
		finish: finish(fault === "foreign read" ? [A] : [B])
	})
	const Run = root(fault === "bad name" ? "run_lower" : "Run", {
		trigger: operator,
		input: Empty,
		children: fault === "unowned kind" ? [Inner] : [A, Inner],
		start: () => [Inner.of({})],
		exclusive: shared,
		window: windowOf(fault),
		precondition: unconditional,
		finish: finish([])
	})
	return flow("Check", {
		writes: writer<{ readonly name: "loader" }>("loader"),
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
				coverage: requiredInSpace<Fault>(Fault.literals),
				caseHang: caseHangMillis,
				box: "a flow of two steps on one resource, a scope and a root, with each single fault",
				oracle: {
					kind: "specification",
					name: "the proposal's section 4 rules, one fault at a time"
				},
				concurrency: testWorkers
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
					if (Exit.isSuccess(declared)) {
						assert.deepStrictEqual(
							Arr.map(declared.value.resources, (r) => r.name),
							["Pool"]
						)
					}
				})
		)
	)
)
