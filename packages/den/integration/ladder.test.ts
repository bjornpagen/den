import { drain } from "@bjornpagen/den/runtime/drive"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, HashMap, Order, Ref } from "effect"
import { TestClock } from "effect/testing"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, Planted, rows, sliceCase } from "#integration/support/slice.ts"
import { backoffLastMillis } from "#runtime/turn.ts"

/**
 * Retry ladders, written out: `Steadfast` never stops retrying (W6's reports), `Brittle` ends after two spent attempts.
 * Each dies, a defect, as many times as the case plants, then succeeds. A spent attempt records its retry due a rung
 * later and rings itself with that delay; the suite's clock is moved a whole longest rung at a time and the transport
 * drained, so every delayed wake lands.
 *
 * Oracle (specification): Steadfast ends done after its planted deaths plus one claims, however many; Brittle ends done
 * after its deaths plus one claims when it dies at most once, and otherwise failed, exhausted after its second spent
 * attempt with two claims; the root's finish runs once both have ended, and records what it heard of each by the key of
 * the input its ending carries: the steadfast step's answered, the brittle step's answered exactly when it was done.
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

/**
 * Retries a never-ending ladder until it succeeds, and fails one past its attempts.
 *
 * Budget: its suite's count before the conversion (retry ladders: 8 independent cases and 8 steered, Vitest at den
 * dc5bd11).
 */
export const aLadderRetriesUntilItSucceedsAndFailsOnePastItsAttempts = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"a long never-ending ladder",
		"brittle done",
		"brittle exhausted"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						if (run.steadfast > 2) {
							c.note("a long never-ending ladder")
						}
						c.note(run.brittle < 2 ? "brittle done" : "brittle exhausted")
						const { retry, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const { faults } = yield* Planted
						const steadfast = "steadfast"
						const brittle = "brittle"
						yield* Ref.update(faults, (map) =>
							HashMap.set(HashMap.set(map, steadfast, run.steadfast), brittle, run.brittle)
						)
						const requested = yield* retry.request.Ladders("ladders", {
							steadfast,
							brittle
						})
						assert.ok(requested.fresh)
						yield* ringAndDrain(ledgers, [requested])
						yield* Effect.forEach(Array.from({ length: run.steadfast + run.brittle + 2 }), () =>
							Effect.andThen(TestClock.adjust(Duration.millis(backoffLastMillis)), drain(ledgers))
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
						assert.deepEqual(
							Arr.map(of("Steadfast"), (r) => r.outcome),
							["done"]
						)
						assert.equal(claimsOf("Steadfast"), run.steadfast + 1)
						if (run.brittle < 2) {
							assert.deepEqual(
								Arr.map(of("Brittle"), (r) => r.outcome),
								["done"]
							)
							assert.equal(claimsOf("Brittle"), run.brittle + 1)
						} else {
							assert.deepEqual(
								Arr.map(of("Brittle"), (r) => r.outcome),
								["failed"]
							)
							assert.equal(claimsOf("Brittle"), 2)
							assert.ok(
								Arr.some(exhausted, (e) => Arr.some(of("Brittle"), (r) => r.step === e.step))
							)
						}
						assert.deepEqual(
							Arr.map(of("LaddersFinish"), (r) => r.outcome),
							["done"]
						)
						const heard = yield* rows(app.workload.heard.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.sort(
								Arr.map(heard, (h) => `${h.key}:${String(h.answered)}`),
								Order.String
							),
							[`brittle:${String(run.brittle < 2)}`, "steadfast:true"]
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "the never-ending step done after its deaths; the two-attempt step done or exhausted at two"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/retry.binding.ts",
			original: "Effect.map(inputBrittle(failed.step), (given)",
			replacement: "Effect.map(inputSteadfast(inputSteadfastRows[0].step), (given)",
			why: "A failed ending carries another child's input: the brittle step's failure is heard under the steadfast key, which the finish's write refuses or misnames."
		},
		{
			file: "packages/den/src/runtime/drive.ts",
			original: "\t\t\t\t\t({ h }) => h.at <= Number(at)",
			replacement: "\t\t\t\t\t({ h }) => h.at > Number(at)",
			why: "Operator mutant (comparison) at packages/den/src/runtime/drive.ts:27 in deliver: `<=` becomes `>`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
