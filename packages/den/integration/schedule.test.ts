import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { retire } from "@bjornpagen/den/runtime/retire"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order } from "effect"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * A schedule's roots, one per member of its roster, retired and requested again, on PostgreSQL 19: the census ticks
 * the clock, whose tick requests a root per bell for the hour its cron's latest instant names, each keyed by the
 * instant and its bell, at the request's own instant, and rings each one's admission; the transport is drained, each
 * bell chimes the hour once and each root finishes, and a tick then rings no admission of a root admitted already; a
 * retirement retires both, as any ended root, though the census still requests their keys; and every tick after it
 * within the hour requests those keys again, which answers that each root was already requested, since its Root stands
 * and a request adds nothing where one does, rings nothing for a retired root, whose graph is gone, and brings no graph
 * row back.
 *
 * Oracle (specification): one chime of the hour per bell; the first tick rings exactly one admission per bell, and a
 * tick once they have run rings none; the retirement retires each; each tick after it succeeds and rings nothing; and
 * the flow's snapshot holds no scope and no step.
 */

type Feature = "one tick after" | "several ticks after"

/** An hour in milliseconds, the clock's cron's period ("0 * * * *"). */
const hourMillis = 3_600_000

/** The clock's bells, its schedule's roster, in order. */
const bells = ["east", "west"] as const

interface Run {
	readonly after: number
}

const runs: Gen<Run> = (source) => ({ after: source.draw(int(1, 3)) })

/**
 * Retires a schedule's roots, one per bell, which the census still requests, whose keys requested again answer they
 * were already requested.
 *
 * Budget: provisional, the retirement suite's (8 independent cases and 8 steered), over one to three ticks after it.
 */
export const aRetiredScheduledRootsKeyRequestedAgainStartsNothing = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: ["one tick after", "several ticks after"] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.after > 1 ? "several ticks after" : "one tick after")
						const { clock, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const first = yield* tick(clock.ledger)
						const admits = Arr.filter(first.rings, (ring) => ring.wake._tag === "Admit")
						assert.equal(admits.length, bells.length)
						yield* drain(ledgers)
						const chimes = yield* rows(app.workload.chimes.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.sort(
								Arr.map(chimes, (chime): string => chime.bell),
								Order.String
							),
							[...bells]
						)
						const at = Arr.map(first.rings, (ring) => ring.cause)
						assert.deepEqual(
							Arr.dedupe(Arr.map(chimes, (chime) => chime.hour)),
							Arr.flatMap(Arr.take(at, 1), (cause) =>
								cause._tag === "Census"
									? [BigInt(Math.floor(cause.at / hourMillis) * hourMillis)]
									: []
							),
							"each bell chimes the hour its schedule's latest instant names, derived from its key"
						)
						const between = yield* tick(clock.ledger)
						assert.deepEqual(
							Arr.filter(between.rings, (ring) => ring.wake._tag === "Admit"),
							[],
							"a tick after its roots were admitted rings no admission of them"
						)
						const retired = yield* retire(clock.ledger)
						assert.deepEqual(
							Arr.map(retired, (r) => r.kind),
							Arr.map(bells, () => "retired" as const)
						)
						const after = yield* Effect.forEach(Array.from({ length: run.after }), () =>
							Effect.tap(tick(clock.ledger), () => drain(ledgers))
						)
						assert.deepEqual(
							Arr.flatMap(after, (t) => t.rings),
							[]
						)
						const again = yield* rows(app.workload.chimes.once({ params: {}, facts: {} }))
						assert.equal(again.length, bells.length)
						const snapshot = yield* clock.ledger.snapshot
						assert.deepEqual([snapshot.scopes.length, snapshot.steps.length], [0, 0])
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "one chime per bell, each root retired, and every tick after it ringing nothing and failing nothing"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/clock.programs.ts",
			original:
				'\t\t\t\t\t\t\tr.eq(root, r.param("clockHourlyScope", ClockRoot.fields.root)),\n\t\t\t\t\t\t\tr.not(ClockRoot, { root })\n',
			replacement: '\t\t\t\t\t\t\tr.eq(root, r.param("clockHourlyScope", ClockRoot.fields.root))\n',
			why: "A request of a key already requested writes its Root again at its own instant, which the held Root's key refuses: the census's tick of a retired schedule's key fails."
		},
		{
			file: "packages/den/integration/slice/generated/clock.binding.ts",
			original: '...Arr.flatMap(read.requested, (s) => view(s.scope, "requested")),',
			replacement: '...Arr.flatMap(read.roots, (s) => view(s.scope, "requested")),',
			why: "An admitted root reads as requested: every tick rings its admission again until its graph is cleared."
		},
		{
			file: "packages/den/src/runtime/bind.ts",
			original:
				"\t\tArr.flatMap(Arr.sort(fields, Order.String), (field: string) => [field, String(key[field])])\n",
			replacement:
				"\t\tArr.flatMap(Arr.take(Arr.sort(fields, Order.String), 1), (field: string) => [field, String(key[field])])\n",
			why: "A derived root is keyed by its key's first field alone, a schedule's by its instant: the second bell's root meets the first's key, answers it was already requested, and never chimes."
		}
	]
})
