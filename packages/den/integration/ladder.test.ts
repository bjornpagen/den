import { drain } from "@bjornpagen/den/runtime/drive"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { backoffLastMillis } from "@den/limits/claim"
import { caseHangMillis } from "@den/limits/suites"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Duration, Effect, Formatter, HashMap, Ref } from "effect"
import { TestClock } from "effect/testing"
import { admitAndDrain } from "#integration/support/run.ts"
import {
	AppServed,
	nonce,
	openLedgers,
	Planted,
	rows,
	sliceLayer
} from "#integration/support/slice.ts"

/**
 * Retry ladders, written out: `Steadfast` never stops retrying (W6's reports), `Brittle` ends after two spent attempts.
 * Each dies, a defect, as many times as the case plants, then succeeds. A spent attempt records its retry due a rung
 * later and rings itself with that delay; the suite's clock is moved a whole longest rung at a time and the transport
 * drained, so every delayed wake lands.
 *
 * Oracle (specification): Steadfast ends done after its planted deaths plus one claims, however many; Brittle ends done
 * after its deaths plus one claims when it dies at most once, and otherwise failed, exhausted after its second spent
 * attempt with two claims; the root's finish runs once both have ended.
 */

type Feature = "a long never-ending ladder" | "brittle done" | "brittle exhausted"

interface Run {
	readonly steadfast: number
	readonly brittle: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({
	steadfast: source.draw(int(2, 6)),
	brittle: source.draw(int(0, 3)),
	copy: source.draw(int(0, 9_999))
})

layer(sliceLayer)("retry ladders", (it) => {
	it.effect(
		"retries a never-ending ladder until it succeeds, and fails one past its attempts",
		(ctx) =>
			searched(
				ctx,
				explore(
					{
						suite: "retry ladders",
						oracle: {
							kind: "specification",
							name: "the never-ending step done after its deaths; the two-attempt step done or exhausted at two"
						},
						draw: drawn(runs),
						literal: Formatter.format,
						coverage: required<Feature>(
							["a long never-ending ladder", "brittle done", "brittle exhausted"],
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
					(run, c) =>
						Effect.gen(function* () {
							if (run.steadfast > 2) {
								c.note("a long never-ending ladder")
							}
							c.note(run.brittle < 2 ? "brittle done" : "brittle exhausted")
							const { retry, ledgers } = yield* openLedgers
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const { faults } = yield* Planted
							const tag = yield* nonce
							const steadfast = `steadfast-${tag}`
							const brittle = `brittle-${tag}`
							yield* Ref.update(faults, (map) =>
								HashMap.set(HashMap.set(map, steadfast, run.steadfast), brittle, run.brittle)
							)
							const at = yield* retry.ledger.now
							const requested = yield* retry.request.Ladders(`ladders-${tag}`, at, {
								steadfast,
								brittle
							})
							assert.isTrue(requested.fresh)
							yield* admitAndDrain(ledgers, FlowName.make("Retry"), [requested.scope])
							yield* Effect.forEach(Array.from({ length: run.steadfast + run.brittle + 2 }), () =>
								Effect.andThen(
									TestClock.adjust(Duration.millis(backoffLastMillis.value)),
									drain(ledgers)
								)
							)
							const results = yield* rows(app.workload.retryResults.once({ params: {}, facts: {} }))
							const claims = yield* rows(app.workload.retryClaims.once({ params: {}, facts: {} }))
							const exhausted = yield* rows(
								app.workload.retryExhausted.once({ params: {}, facts: {} })
							)
							const mine = Arr.filter(results, (r) => r.scope === requested.scope)
							const of = (kind: string) => Arr.filter(mine, (r) => r.kind === kind)
							const claimsOf = (kind: string) =>
								Arr.flatMap(of(kind), (r) => Arr.filter(claims, (cl) => cl.step === r.step)).length
							assert.deepStrictEqual(
								Arr.map(of("Steadfast"), (r) => r.outcome),
								["done"]
							)
							assert.strictEqual(claimsOf("Steadfast"), run.steadfast + 1)
							if (run.brittle < 2) {
								assert.deepStrictEqual(
									Arr.map(of("Brittle"), (r) => r.outcome),
									["done"]
								)
								assert.strictEqual(claimsOf("Brittle"), run.brittle + 1)
							} else {
								assert.deepStrictEqual(
									Arr.map(of("Brittle"), (r) => r.outcome),
									["failed"]
								)
								assert.strictEqual(claimsOf("Brittle"), 2)
								assert.isTrue(
									Arr.some(
										exhausted,
										(e) => Arr.some(of("Brittle"), (r) => r.step === e.step) && e.attempts === 2n
									)
								)
							}
							assert.deepStrictEqual(
								Arr.map(of("LaddersFinish"), (r) => r.outcome),
								["done"]
							)
						})
				)
			)
	)
})
