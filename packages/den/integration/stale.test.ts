import { caseHang, reclaimableAfterMillis } from "@bjornpagen/den/limits"
import type { Ending, Turn } from "@bjornpagen/den/runtime/ledger"
import { claimed, concluded, serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, LaneName, WakeSchema } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { element, type Gen, int } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { layer } from "@effect/vitest"
import { assert } from "@effect/vitest"
import { Array as Arr, Duration, Effect, Formatter, Option } from "effect"
import { TestClock } from "effect/testing"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { AppServed, sliceLayer, WorkerServed } from "#integration/support/slice.ts"

/**
 * Two claimers of one step, a stale one and a fresh one, each holding its own attempt: the stale one claimed attempt 1
 * and its lease lapsed, though its own clock, skewed, still holds it; the fresh one claimed attempt 2. Correctness rests
 * on the keys alone, never on a clock. Whichever commits second ends `lost`, refused on the key the
 * first commit's Held holds, and its writes roll back with its result; the first commit's attempt is the one Held
 * names. A wake for an attempt whose predecessor was never claimed loses its claim outright.
 *
 * Oracle (specification): exactly one claimer ends done, the other lost, the step's one result is the winner's, and a
 * forged attempt is lost.
 */

type Order = "stale commits first" | "fresh commits first"

type Feature = Order | "a forged attempt"

interface Race {
	readonly order: Order
	readonly pages: number
	readonly copy: number
}

const races: Gen<Race> = (source) => ({
	order: source.draw(element(["stale commits first", "fresh commits first"])),
	pages: source.draw(int(1, 3)),
	copy: source.draw(int(0, 9))
})

layer(sliceLayer)("a stale claimer", (it) => {
	it.effect("ends lost when another attempt's commit holds its step", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "stale claimer",
					oracle: {
						kind: "specification",
						name: "one claimer done, the other lost, the winner's attempt held, a forged attempt lost"
					},
					draw: drawn(races),
					literal: Formatter.format,
					coverage: required<Feature>(
						["stale commits first", "fresh commits first", "a forged attempt"],
						{ cases: 8, sense: notesOnly }
					),
					kept: [],
					runs: 8,
					shrink: boundedShrink(8),
					concurrency: 1,
					steerEvery: 4,
					caseHang
				},
				(race, c) =>
					Effect.gen(function* () {
						c.note(race.order)
						const worker = yield* Db.open(WorkerServed.roles.chain_worker, {})
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const chain = chainLedger(worker.workload)
						const key = `race-${race.order === "stale commits first" ? "s" : "f"}-${race.pages}-${race.copy}`
						const started = yield* chain.start.ChainRun(key, {
							feed: "sport",
							pages: BigInt(race.pages)
						})
						if (started.outcome.kind === "unchanged") {
							return yield* c.assume(false)
						}
						const page = Arr.head(started.spawned.steps)
						const runner = chain.ledger.runners.get("Page")
						if (Option.isNone(page) || runner === undefined) {
							return yield* Effect.die("a chain starts its first page, and runs Page")
						}
						const step = page.value.step
						const located = yield* chain.ledger.stepOf(step)
						if (Option.isNone(located)) {
							return yield* Effect.die("a started page is a step")
						}
						const scope = located.value.scope
						const claimAt = (attempt: number) => claimed(chain.ledger, step, attempt, scope)
						const first = yield* claimAt(1)
						yield* TestClock.adjust(Duration.millis(reclaimableAfterMillis.value))
						const fresh = yield* claimAt(2)
						const stale: Turn = { ...first, until: fresh.until }
						const finish = (turn: Turn) =>
							Effect.flatMap(runner.run(turn), (ran): Effect.Effect<Ending> =>
								concluded(chain.ledger, turn, ran)
							)
						const [early, late] =
							race.order === "stale commits first" ? [stale, fresh] : [fresh, stale]
						const firstEnding = yield* finish(early)
						const secondEnding = yield* finish(late)
						assert.strictEqual(firstEnding.kind, "done")
						assert.strictEqual(secondEnding.kind, "lost")
						const held = yield* chain.ledger.heldOf(step)
						assert.deepStrictEqual(held, Option.some(early.attempt))
						const read = yield* app.workload.pages.once({ params: {}, facts: {} })
						assert.strictEqual(
							Arr.filter(Arr.fromIterable(read), (row) => row.step === step).length,
							1
						)
						const unclaimed = yield* chain.start.ChainRun(`${key}-forged`, {
							feed: "sport",
							pages: BigInt(race.pages)
						})
						const unclaimedPage = Arr.head(unclaimed.spawned.steps)
						if (Option.isNone(unclaimedPage)) {
							return yield* Effect.die("a chain starts its first page")
						}
						c.note("a forged attempt")
						const forged = yield* serve(
							chain.ledger,
							WakeSchema.make({
								lane: LaneName.make("Pages"),
								step: unclaimedPage.value.step,
								attempt: AttemptNumber.make(2)
							})
						)
						assert.strictEqual(forged.ending.kind, "lost")
						const claims = yield* app.workload.chainClaims.once({ params: {}, facts: {} })
						assert.isFalse(
							Arr.some(Arr.fromIterable(claims), (claim) => claim.step === unclaimedPage.value.step)
						)
					})
			)
		)
	)
})
