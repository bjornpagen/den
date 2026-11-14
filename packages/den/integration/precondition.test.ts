import { caseHang, longestLeaseMillis } from "@bjornpagen/den/limits"
import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Random } from "effect"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"

/**
 * A precondition root, as W4's Gold build: admitted only while the chain flow has no step pending. A chain is admitted
 * and left with its pages pending; a Gold build's admission then waits on its precondition and spawns nothing, and the
 * census does not ring it while the chain is busy; once the chain has run to its end the census rings the build, which
 * is admitted and builds.
 *
 * Each case builds a number of its own, drawn fresh as a nonce is: Built is keyed by its build, so a number an earlier
 * case of the suite's database built would be there before this case's build ran, and that case's chain left pending
 * by the failure would keep every later case's chain busy.
 *
 * Oracle (specification): no Built row while any chain step is pending; the waiting admission ends `waiting` on
 * `precondition`; the build runs once the chain is idle.
 */

type Feature = "one page pending" | "several pages" | "the build waited"

interface Run {
	readonly pages: number
	readonly feed: "news" | "sport"
}

const runs: Gen<Run> = (source) => ({
	pages: source.draw(int(1, 3)),
	feed: source.draw(element(["news", "sport"] as const))
})

layer(sliceLayer)("a precondition root", (it) => {
	it.effect("admits the Gold build only once the chain has nothing pending", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "precondition root",
					oracle: {
						kind: "specification",
						name: "no build while a chain step is pending; the build admitted once the chain is idle"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(["one page pending", "several pages", "the build waited"], {
						cases: 6,
						sense: notesOnly
					}),
					kept: [],
					runs: 6,
					shrink: boundedShrink(4),
					concurrency: 1,
					steerEvery: 3,
					caseHang
				},
				(run, c) =>
					Effect.gen(function* () {
						c.note(run.pages === 1 ? "one page pending" : "several pages")
						const { chain, sync, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const at = yield* chain.ledger.now
						const ends = instantOf(Number(at) + longestLeaseMillis.value)
						const build = yield* Effect.map(Random.nextInt, (n) => BigInt(Math.abs(n)))
						const tag = yield* nonce
						const chained = yield* chain.request.ChainRun(`gold-${tag}`, at, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						const gold = yield* sync.request.Gold(`gold-${tag}`, at, { build })
						assert.isTrue(chained.fresh)
						assert.isTrue(gold.fresh)
						const chainAdmitted = yield* serve(
							ledgers,
							{ _tag: "Admit", flow: FlowName.make("Chain"), scope: chained.scope },
							ends
						)
						assert.strictEqual(chainAdmitted.ending.kind, "admitted")
						const held = yield* serve(
							ledgers,
							{ _tag: "Admit", flow: FlowName.make("Sync"), scope: gold.scope },
							ends
						)
						assert.deepStrictEqual(
							held.ending.kind === "waiting"
								? [held.ending.why, held.onward.length]
								: [held.ending.kind],
							["precondition", 0]
						)
						c.note("the build waited")
						const busyTick = yield* tick(sync.ledger)
						assert.isFalse(
							Arr.some(
								busyTick.rings,
								(ring) => ring.wake._tag === "Admit" && ring.wake.scope === gold.scope
							)
						)
						const builtBefore = yield* rows(app.workload.built.once({ params: {}, facts: {} }))
						assert.isFalse(Arr.some(builtBefore, (b) => b.build === build))
						yield* ringOnAndDrain(ledgers, chainAdmitted)
						const idleTick = yield* tick(sync.ledger)
						assert.isTrue(
							Arr.some(
								idleTick.rings,
								(ring) => ring.wake._tag === "Admit" && ring.wake.scope === gold.scope
							)
						)
						yield* drain(ledgers)
						const built = yield* rows(app.workload.built.once({ params: {}, facts: {} }))
						assert.isTrue(Arr.some(built, (b) => b.build === build))
					})
			)
		)
	)
})
