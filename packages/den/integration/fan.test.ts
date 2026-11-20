import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect } from "effect"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The fan-out flow: a root admits one batch scope, whose admission starts one square per number from 1 to its size,
 * each holding a seat of the two-seat Pool while it runs; the batch's finish tallies them once every square has ended,
 * and the root's finish settles the batch after the batch's own finish.
 *
 * Oracle (specification): the batch's tally counts every square and sums their squares, n(n + 1)(2n + 1) / 6; the
 * batch and the root each finish once, done; an empty batch tallies nothing and still finishes; every seat is given
 * back at the end.
 */

type Feature = "an empty batch" | "fewer squares than seats" | "more squares than seats"

interface Run {
	readonly size: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({ size: source.draw(int(0, 5)), copy: source.draw(int(0, 9)) })

/**
 * Tallies every square once all have ended, the root after the batch.
 *
 * Budget: its suite's count before the conversion (fan-out flow: 10 independent cases and 10 steered, Vitest at den
 * dc5bd11).
 */
export const theFanOutFlowTalliesEverySquare = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"an empty batch",
		"fewer squares than seats",
		"more squares than seats"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(
							run.size === 0
								? "an empty batch"
								: run.size <= 2
									? "fewer squares than seats"
									: "more squares than seats"
						)
						const { fan, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const batch = `b-${run.size}`
						const requested = yield* fan.request.FanRun(batch, {
							batch,
							size: BigInt(run.size)
						})
						assert.ok(requested.fresh)
						yield* admitAndDrain(ledgers, FlowName.make("Fan"), [requested.scope])
						const tallies = yield* rows(app.workload.tallies.once({ params: {}, facts: {} }))
						const n = BigInt(run.size)
						assert.deepEqual(
							Arr.map(
								Arr.filter(tallies, (t) => t.batch === batch),
								(t) => ({ batch: t.batch, count: t.count, total: t.total })
							),
							[{ batch, count: n, total: (n * (n + 1n) * (2n * n + 1n)) / 6n }]
						)
						const settled = yield* rows(app.workload.settled.once({ params: {}, facts: {} }))
						assert.ok(Arr.some(settled, (s) => s.batch === batch))
						const finishes = yield* rows(app.workload.fanFinishes.once({ params: {}, facts: {} }))
						assert.ok(
							Arr.some(finishes, (f) => f.scope === requested.scope && f.outcome === "done")
						)
						const holds = yield* fan.ledger.holds
						assert.deepEqual(holds, [])
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a tally of every square, one done finish per scope, the root's after the batch's, every seat given back"
	},
	budget: { runs: 10, steered: 10 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\t\t\tif (Number(at) + leaseMarginMillis >= Number(end)) {",
			replacement: "\t\t\t\tif (Number(at) + leaseMarginMillis < Number(end)) {",
			why: "Operator mutant (comparison) at packages/den/src/runtime/turn.ts:1014 in loop: `>=` becomes `<`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
