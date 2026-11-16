import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { holderOf, instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName, InProcess } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { longestLeaseMillis, reclaimableAfterMillis } from "@den/limits/claim"
import { caseHangMillis } from "@den/limits/suites"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Duration, Effect, Formatter, Option, Ref } from "effect"
import { TestClock } from "effect/testing"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"

/**
 * The census heals what the doorbell loses and rings what time made eligible. A chain's wakes are dropped (its
 * admission's, or its first page's after an admission served by hand); its first page may be claimed by a holder that
 * dies before it commits. Census ticks at the database's instant, each followed by delivering what it rang, still admit
 * the root, run every page and the finish, never ringing a claim whose lease stands, and ring the dead holder's step at
 * its next attempt once its lease lapses, a reclaim counted on its ladder.
 *
 * Oracle (specification): after the ticks every page has its result and the finish is done; no tick while the lease
 * stands rings that step; the reclaimed step's result is held by attempt 2.
 */

type Feature = "an admission lost" | "a page's wake lost" | "a dead holder" | "several pages"

interface Loss {
	readonly pages: number
	readonly admitted: boolean
	readonly deadHolder: boolean
	readonly copy: number
}

const losses: Gen<Loss> = (source) => ({
	pages: source.draw(int(1, 3)),
	admitted: source.draw(boolean),
	deadHolder: source.draw(boolean),
	copy: source.draw(int(0, 99_999))
})

layer(sliceLayer)("the census", (it) => {
	it.effect(
		"rings every wake that was lost, and reclaims a dead holder's step at its next attempt",
		(ctx) =>
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
						coverage: required<Feature>(
							["an admission lost", "a page's wake lost", "a dead holder", "several pages"],
							{
								cases: 8,
								sense: notesOnly
							}
						),
						kept: [],
						runs: 8,
						shrink: boundedShrink(4),
						steerEvery: 4,
						caseHang: caseHangMillis.value
					},
					(loss, c) =>
						Effect.gen(function* () {
							if (loss.pages > 1) {
								c.note("several pages")
							}
							const { held } = yield* InProcess
							const { chain, ledgers } = yield* openLedgers
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const at = yield* chain.ledger.now
							const key = `census-${yield* nonce}`
							const requested = yield* chain.request.ChainRun(key, at, {
								feed: "news",
								pages: BigInt(loss.pages)
							})
							assert.isTrue(requested.fresh)
							const ends = instantOf(Number(at) + longestLeaseMillis.value)
							const flow = FlowName.make("Chain")
							const first = loss.admitted
								? yield* Effect.map(
										serve(ledgers, { _tag: "Admit", flow, scope: requested.scope }, ends),
										(served) =>
											served.ending.kind === "admitted"
												? Arr.head(served.ending.spawned.steps)
												: Option.none()
									)
								: Option.none()
							c.note(loss.admitted ? "a page's wake lost" : "an admission lost")
							if (loss.deadHolder && Option.isSome(first)) {
								c.note("a dead holder")
								const step = first.value.step
								const holder = yield* holderOf(step, 1, loss.copy)
								yield* chain.ledger.claim({ step, attempt: 1n, holder, until: ends })
								const standing = yield* tick(chain.ledger)
								assert.isFalse(
									Arr.some(
										standing.rings,
										(ring) => ring.wake._tag === "Step" && ring.wake.step === step
									)
								)
								yield* Ref.set(held, [])
								yield* TestClock.adjust(Duration.millis(reclaimableAfterMillis.value))
							}
							yield* Ref.set(held, [])
							const finished = Effect.map(
								rows(app.workload.chainFinishes.once({ params: {}, facts: {} })),
								(finishes) =>
									Arr.some(finishes, (f) => f.scope === requested.scope && f.outcome === "done")
							)
							const passes = yield* Effect.forEach(Array.from({ length: loss.pages + 3 }), () =>
								Effect.gen(function* () {
									yield* tick(chain.ledger)
									yield* drain(ledgers)
									return yield* finished
								})
							)
							assert.isTrue(Arr.some(passes, (done) => done))
							const pages = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
							assert.strictEqual(
								Arr.filter(pages, (p) => p.scope === requested.scope).length,
								loss.pages
							)
							if (loss.deadHolder && Option.isSome(first)) {
								const attempt = yield* chain.ledger.heldOf(first.value.step)
								assert.deepStrictEqual(attempt, Option.some(2n))
							}
						})
				)
			)
	)
})
