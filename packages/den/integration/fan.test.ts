import { caseHang } from "@bjornpagen/den/limits"
import { drain } from "@bjornpagen/den/runtime/drive"
import { rootScope, startedScope } from "@bjornpagen/den/runtime/identity"
import { begin } from "@bjornpagen/den/runtime/turn"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { layer } from "@effect/vitest"
import { assert } from "@effect/vitest"
import { Array as Arr, Effect, Formatter } from "effect"
import { fanLedger } from "#integration/slice/generated/fan.binding.ts"
import { AppServed, sliceLayer, WorkerServed } from "#integration/support/slice.ts"

/**
 * The fan-out flow end to end on PostgreSQL 19: a root starts one batch scope, the batch starts one square per number up
 * to its size, the batch's finish tallies them once every square has its result, and the root's finish runs once
 * after the batch's.
 *
 * Oracle (specification): a batch of size n leaves its tally of n squares summing 1² + … + n², the run settled, and
 * exactly one done finish for each of its two scopes, an empty batch's included; and starting it again changes
 * nothing.
 */

type Feature = "empty batch" | "several squares" | "first start" | "start again"

interface Run {
	readonly size: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({ size: source.draw(int(0, 5)), copy: source.draw(int(0, 2)) })

const batchOf = (run: Run) => `b-${run.size}-${run.copy}`

layer(sliceLayer)("the fan-out flow", (it) => {
	it.effect("finishes a batch once after all its children, and its root once after it", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "fan-out flow",
					oracle: {
						kind: "specification",
						name: "a tally of every square, the run settled, one finish per scope, and no change on a rerun"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(
						["empty batch", "several squares", "first start", "start again"],
						{ cases: 12, sense: notesOnly }
					),
					kept: [],
					runs: 12,
					shrink: boundedShrink(8),
					concurrency: 1,
					steerEvery: 4,
					caseHang
				},
				(run, c) =>
					Effect.gen(function* () {
						c.note(run.size === 0 ? "empty batch" : "several squares")
						const worker = yield* Db.open(WorkerServed.roles.fan_worker, {})
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const fan = fanLedger(worker.workload)
						const batch = batchOf(run)
						const input = { batch, size: BigInt(run.size) }
						const started = yield* fan.start.FanRun(batch, input)
						c.note(started.outcome.kind === "accepted" ? "first start" : "start again")
						yield* begin(fan.ledger, started.spawned)
						yield* drain(fan.ledger)
						const tallied = yield* app.workload.tallies.once({ params: {}, facts: {} })
						const tally = Arr.filter(Arr.fromIterable(tallied), (t) => t.batch === batch)
						const squares = Arr.map(
							Arr.filter(Arr.range(1, run.size), (n) => n <= run.size),
							(n) => BigInt(n * n)
						)
						assert.deepStrictEqual(
							Arr.map(tally, (t) => [t.count, t.total]),
							[[BigInt(run.size), Arr.reduce(squares, 0n, (sum, s) => sum + s)]]
						)
						const settled = yield* app.workload.settled.once({ params: {}, facts: {} })
						assert.isTrue(Arr.some(Arr.fromIterable(settled), (s) => s.batch === batch))
						const root = yield* rootScope("Fan", "FanRun", batch)
						const child = yield* startedScope(root, 0)
						const finished = yield* app.workload.fanFinishes.once({ params: {}, facts: {} })
						const finishes = Arr.filter(
							Arr.fromIterable(finished),
							(f) => f.scope === root || f.scope === child
						)
						assert.deepStrictEqual(
							Arr.map(finishes, (f) => f.outcome),
							["done", "done"]
						)
						const again = yield* fan.start.FanRun(batch, input)
						assert.strictEqual(again.outcome.kind, "unchanged")
						yield* begin(fan.ledger, again.spawned)
						yield* drain(fan.ledger)
						const after = yield* app.workload.fanFinishes.once({ params: {}, facts: {} })
						assert.strictEqual(
							Arr.filter(Arr.fromIterable(after), (f) => f.scope === root || f.scope === child)
								.length,
							2
						)
					})
			)
		)
	)
})
