import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { caseHangMillis } from "@den/limits/suites"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter } from "effect"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"

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

layer(sliceLayer)("the fan-out flow", (it) => {
	it.effect("tallies every square once all have ended, the root after the batch", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "fan-out flow",
					oracle: {
						kind: "specification",
						name: "a tally of every square, one done finish per scope, the root's after the batch's, every seat given back"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(
						["an empty batch", "fewer squares than seats", "more squares than seats"],
						{
							cases: 10,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 10,
					shrink: boundedShrink(8),
					steerEvery: 4,
					caseHang: caseHangMillis.value
				},
				(run, c) =>
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
						const batch = `b-${run.size}-${yield* nonce}`
						const at = yield* fan.ledger.now
						const requested = yield* fan.request.FanRun(batch, at, {
							batch,
							size: BigInt(run.size)
						})
						assert.isTrue(requested.fresh)
						yield* admitAndDrain(ledgers, FlowName.make("Fan"), [requested.scope])
						const tallies = yield* rows(app.workload.tallies.once({ params: {}, facts: {} }))
						const n = BigInt(run.size)
						assert.deepStrictEqual(
							Arr.filter(tallies, (t) => t.batch === batch),
							[{ batch, count: n, total: (n * (n + 1n) * (2n * n + 1n)) / 6n }]
						)
						const settled = yield* rows(app.workload.settled.once({ params: {}, facts: {} }))
						assert.isTrue(Arr.some(settled, (s) => s.batch === batch))
						const finishes = yield* rows(app.workload.fanFinishes.once({ params: {}, facts: {} }))
						assert.isTrue(
							Arr.some(finishes, (f) => f.scope === requested.scope && f.outcome === "done")
						)
						const holds = yield* fan.ledger.coordination.holds
						assert.deepStrictEqual(holds, [])
					})
			)
		)
	)
})
