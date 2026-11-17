import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { holderOf, instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName, InProcess } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { aimed, boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, Option, Ref } from "effect"
import { TestClock } from "effect/testing"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis, reclaimableAfterMillis } from "#runtime/turn.ts"

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

/**
 * A loss whose admission was served by hand and whose first page's holder died before it committed: the case "a dead
 * holder" names, which the space draws one time in four, aimed at whenever it is pending.
 */
const deadHolders: Gen<Loss> = (source) => ({
	pages: source.draw(int(1, 3)),
	admitted: true,
	deadHolder: true,
	copy: source.draw(int(0, 99_999))
})

/**
 * Rings every wake that was lost, and reclaims a dead holder's step at its next attempt.
 *
 * Budget: its suite's count before the conversion (census: 8 independent cases and 8 steered, Vitest at den dc5bd11).
 */
export const theCensusRingsEveryLostWakeAndReclaimsADeadHoldersStep = property.explore(
	aimed(losses, [["a dead holder", deadHolders]]),
	{
		needs: { slice: sliceCase },
		situations: [
			"an admission lost",
			"a page's wake lost",
			"a dead holder",
			"several pages"
		] satisfies ReadonlyArray<Reached<Feature>>,
		check:
			({ slice }, c: Case<Feature>) =>
			(loss) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							if (loss.pages > 1) {
								c.note("several pages")
							}
							const { held } = yield* InProcess
							const { chain, ledgers } = yield* openLedgers
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const at = yield* chain.ledger.now
							const key = "census"
							const requested = yield* chain.request.ChainRun(key, at, {
								feed: "news",
								pages: BigInt(loss.pages)
							})
							assert.isTrue(requested.fresh)
							const ends = instantOf(Number(at) + longestLeaseMillis)
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
								yield* TestClock.adjust(Duration.millis(reclaimableAfterMillis))
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
						}),
						services
					)
				),
		oracle: {
			kind: "specification",
			name: "every page and the finish done after the ticks, a standing lease never rung, the dead holder's step held by attempt 2"
		},
		budget: { runs: 8, steered: 8 },
		kept: [],
		kills: [
			{
				file: "packages/den/src/runtime/turn.ts",
				original: "\t\tconst exhausted = !allows(runner.retry, spentSoFar)",
				replacement: "\t\tconst exhausted = allows(runner.retry, spentSoFar)",
				why: "Operator mutant (negation) at packages/den/src/runtime/turn.ts:821 in serveStep: `!allows(runner.retry, spentSoFar)` becomes `allows(runner.retry, spentSoFar)`; the property fails (lane CATCH, den 9cffaba)."
			}
		]
	}
)
