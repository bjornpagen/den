import { caseHang, longestLeaseMillis } from "@bjornpagen/den/limits"
import { tick } from "@bjornpagen/den/runtime/census"
import { now } from "@bjornpagen/den/runtime/clock"
import { drain } from "@bjornpagen/den/runtime/drive"
import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter } from "effect"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"

/**
 * A precondition root, as W4's Gold build: admitted only while the chain flow has no step pending. A chain is admitted
 * and left with its pages pending; a Gold build's admission then waits on its precondition and spawns nothing, and the
 * census does not ring it while the chain is busy; once the chain has run to its end the census rings the build, which
 * is admitted and builds.
 *
 * Oracle (specification): no Built row while any chain step is pending; the waiting admission ends `waiting` on
 * `precondition`; the build runs once the chain is idle.
 */

type Feature = "one page pending" | "several pages" | "the build waited"

interface Run {
	readonly pages: number
	readonly build: number
}

const runs: Gen<Run> = (source) => ({
	pages: source.draw(int(1, 3)),
	build: source.draw(int(0, 9_999))
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
						const at = yield* now
						const ends = instantOf(Number(at) + longestLeaseMillis.value)
						const feed = run.build % 2 === 0 ? "news" : "sport"
						const tag = yield* nonce
						const chained = yield* chain.request.ChainRun(`gold-${tag}`, at, {
							feed,
							pages: BigInt(run.pages)
						})
						const gold = yield* sync.request.Gold(`gold-${tag}`, at, { build: BigInt(run.build) })
						if (!chained.fresh || !gold.fresh) {
							return yield* c.assume(false)
						}
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
						const busyAt = yield* now
						const busyTick = yield* tick(sync.ledger, busyAt)
						assert.isFalse(
							Arr.some(
								busyTick.rings,
								(ring) => ring.wake._tag === "Admit" && ring.wake.scope === gold.scope
							)
						)
						const builtBefore = yield* rows(app.workload.built.once({ params: {}, facts: {} }))
						assert.isFalse(Arr.some(builtBefore, (b) => b.build === BigInt(run.build)))
						yield* ringOnAndDrain(ledgers, chainAdmitted)
						const idleAt = yield* now
						const idleTick = yield* tick(sync.ledger, idleAt)
						assert.isTrue(
							Arr.some(
								idleTick.rings,
								(ring) => ring.wake._tag === "Admit" && ring.wake.scope === gold.scope
							)
						)
						yield* drain(ledgers)
						const built = yield* rows(app.workload.built.once({ params: {}, facts: {} }))
						assert.isTrue(Arr.some(built, (b) => b.build === BigInt(run.build)))
					})
			)
		)
	)
})
