import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect } from "effect"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

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
	readonly feed: "news" | "sport"
}

const runs: Gen<Run> = (source) => ({
	pages: source.draw(int(1, 3)),
	feed: source.draw(element(["news", "sport"] as const))
})

/**
 * Admits the Gold build only once the chain has nothing pending.
 *
 * Budget: its suite's count before the conversion (precondition root: 6 independent cases and 6 steered, Vitest at den
 * dc5bd11).
 */
export const aPreconditionRootAdmitsTheGoldBuildOnlyOnceTheChainHasNothingPending =
	property.explore(runs, {
		needs: { slice: sliceCase },
		situations: ["one page pending", "several pages", "the build waited"] satisfies ReadonlyArray<
			Reached<Feature>
		>,
		check:
			({ slice }, c: Case<Feature>) =>
			(run) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							c.note(run.pages === 1 ? "one page pending" : "several pages")
							const { chain, sync, ledgers } = yield* openLedgers
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const at = yield* chain.ledger.now
							const ends = instantOf(Number(at) + longestLeaseMillis)
							const build = 1n
							const chained = yield* chain.request.ChainRun("gold", at, {
								feed: run.feed,
								pages: BigInt(run.pages)
							})
							const gold = yield* sync.request.Gold("gold", at, { build })
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
						}),
						services
					)
				),
		oracle: {
			kind: "specification",
			name: "no build while a chain step is pending; the build admitted once the chain is idle"
		},
		budget: { runs: 6, steered: 6 },
		kept: [],
		kills: [
			{
				file: "packages/den/src/runtime/turn.ts",
				original: "\t\tif (Option.exists(window, (w) => !isOpen(w, at))) {",
				replacement: "\t\tif (Option.exists(window, (w) => true)) {",
				why: "A root's window reads as shut at every instant, so its work always waits (lane CATCH's boolean-return of den 9cffaba, in gate's one window test where it moved)."
			}
		]
	})
