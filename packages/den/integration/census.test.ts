import { caseHang, reclaimableAfterMillis } from "@bjornpagen/den/limits"
import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { rootScope } from "@bjornpagen/den/runtime/identity"
import { begin, claimed } from "@bjornpagen/den/runtime/turn"
import { InProcess } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { boolean, type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { layer } from "@effect/vitest"
import { assert } from "@effect/vitest"
import { Array as Arr, Duration, Effect, Formatter, Option, Queue } from "effect"
import { TestClock } from "effect/testing"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { AppServed, sliceLayer, WorkerServed } from "#integration/support/slice.ts"

/**
 * The census heals what the doorbell loses. A run's wakes are dropped before any is delivered, and its first page may
 * be claimed by a holder that dies before it commits; census ticks, each followed by delivering what it sent, still
 * run every page and the finish, the dead holder's step reclaimed at the next attempt once its lease lapses.
 *
 * Oracle (specification): after the ticks, every page has its result and the run's finish is done; a claim whose lease
 * still stands is never rung, and the reclaimed step's result is held by attempt 2.
 */

type Feature = "wakes lost" | "a dead holder" | "several pages"

interface Loss {
	readonly pages: number
	readonly deadHolder: boolean
	readonly copy: number
}

const losses: Gen<Loss> = (source) => ({
	pages: source.draw(int(1, 3)),
	deadHolder: source.draw(boolean),
	copy: source.draw(int(0, 9))
})

layer(sliceLayer)("the census", (it) => {
	it.effect("rings every step whose wake was lost, and reclaims a dead holder's step", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "census",
					oracle: {
						kind: "specification",
						name: "every page and the finish done after the ticks, a standing lease never rung, the dead holder's step held by attempt 2"
					},
					draw: drawn(losses),
					literal: Formatter.format,
					coverage: required<Feature>(["wakes lost", "a dead holder", "several pages"], {
						cases: 8,
						sense: notesOnly
					}),
					kept: [],
					runs: 8,
					shrink: boundedShrink(8),
					concurrency: 1,
					steerEvery: 4,
					caseHang
				},
				(loss, c) =>
					Effect.gen(function* () {
						const { queue } = yield* InProcess
						const worker = yield* Db.open(WorkerServed.roles.chain_worker, {})
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const chain = chainLedger(worker.workload)
						const key = `census-${loss.pages}-${loss.deadHolder ? "d" : "a"}-${loss.copy}`
						const started = yield* chain.start.ChainRun(key, {
							feed: "news",
							pages: BigInt(loss.pages)
						})
						if (started.outcome.kind === "unchanged") {
							return yield* c.assume(false)
						}
						yield* begin(chain.ledger, started.spawned)
						yield* Queue.clear(queue)
						c.note("wakes lost")
						if (loss.pages > 1) {
							c.note("several pages")
						}
						const first = Arr.head(started.spawned.steps)
						if (Option.isNone(first)) {
							return yield* Effect.die("a chain starts its first page")
						}
						const step = first.value.step
						if (loss.deadHolder) {
							c.note("a dead holder")
							const located = yield* chain.ledger.stepOf(step)
							if (Option.isNone(located)) {
								return yield* Effect.die("a started page is a step")
							}
							yield* claimed(chain.ledger, step, 1, located.value.scope)
							const standing = yield* tick(chain.ledger)
							assert.isFalse(Arr.some(standing.due, (wake) => wake.step === step))
							yield* Queue.clear(queue)
							yield* TestClock.adjust(Duration.millis(reclaimableAfterMillis.value))
						}
						const scope = yield* rootScope("Chain", "ChainRun", key)
						const finished = Effect.map(
							app.workload.chainFinishes.once({ params: {}, facts: {} }),
							(rows) =>
								Arr.some(
									Arr.fromIterable(rows),
									(finish) => finish.scope === scope && finish.outcome === "done"
								)
						)
						const healed = Effect.gen(function* () {
							yield* tick(chain.ledger)
							yield* drain(chain.ledger)
							return yield* finished
						})
						const passes = yield* Effect.forEach(Arr.range(0, loss.pages + 1), () => healed)
						assert.isTrue(Arr.some(passes, (done) => done))
						const read = yield* app.workload.pages.once({ params: {}, facts: {} })
						assert.strictEqual(
							Arr.filter(Arr.fromIterable(read), (page) => page.scope === scope).length,
							loss.pages
						)
						const held = yield* chain.ledger.heldOf(step)
						assert.deepStrictEqual(held, Option.some(loss.deadHolder ? 2n : 1n))
					})
			)
		)
	)
})
