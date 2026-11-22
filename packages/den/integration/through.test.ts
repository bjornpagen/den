import { drain } from "@bjornpagen/den/runtime/drive"
import { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, HashMap, Order, Ref } from "effect"
import { TestClock } from "effect/testing"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, Planted, rows, sliceCase } from "#integration/support/slice.ts"
import { backoffLastMillis } from "#runtime/turn.ts"

/**
 * A finish commits through the app's own ChangeSet in its own commit's call: the Ladders root's finish records what it
 * heard of each ladder, `Heard` by the key of the input its ending carries, through a ChangeSet over the app role that
 * den's commit unions with the finish's result. The app's Heard holds at most one row a key, so where the app already
 * heard the steadfast key otherwise, the ChangeSet's insert is refused on Heard's key.
 *
 * Oracle (specification): with no conflicting row, the finish is done and the app holds what it heard of both
 * ladders; with one, the whole call is refused: the finish ends failed by the law, its refusal recorded, and nothing it
 * would have committed stands, neither its result nor what it heard of either ladder, the conflicting row alone left.
 */

type Feature = "accepted" | "refused" | "brittle done" | "brittle exhausted"

interface Run {
	readonly heardBefore: boolean
	readonly brittle: number
}

const runs: Gen<Run> = (source) => ({
	heardBefore: source.draw(boolean),
	brittle: source.draw(int(0, 3))
})

/**
 * A finish's ChangeSet and its result commit as one: a refusal of the ChangeSet refuses the finish's facts with it.
 *
 * Budget: provisional, two situations of the commit crossed with the brittle ladder's two endings, each reached by
 * eight cases and eight steered.
 */
export const aRefusalOfAStepsChangeSetRefusesItsResultWithIt = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: ["accepted", "refused", "brittle done", "brittle exhausted"] satisfies ReadonlyArray<
		Reached<Feature>
	>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.heardBefore ? "refused" : "accepted")
						c.note(run.brittle === 0 ? "brittle done" : "brittle exhausted")
						const { retry, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						const { faults } = yield* Planted
						const steadfast = "steadfast"
						const brittle = "brittle"
						yield* Ref.update(faults, (map) => HashMap.set(map, brittle, run.brittle))
						if (run.heardBefore) {
							yield* loader.workload.hear.once({
								params: {},
								facts: { insert: { Heard: [{ key: steadfast, answered: false }] } }
							})
						}
						const requested = yield* retry.request.Ladders("through", { steadfast, brittle })
						assert.ok(requested.fresh)
						yield* ringAndDrain(ledgers, [requested])
						yield* Effect.forEach(Array.from({ length: run.brittle + 2 }), () =>
							Effect.andThen(TestClock.adjust(Duration.millis(backoffLastMillis)), drain(ledgers))
						)
						const results = yield* rows(app.workload.retryResults.once({ params: {}, facts: {} }))
						const finish = Arr.filter(
							results,
							(r) => Sha256.equals(r.scope, requested.scope) && r.kind === "LaddersFinish"
						)
						const heard = yield* rows(app.workload.heard.once({ params: {}, facts: {} }))
						const heardText = Arr.sort(
							Arr.map(heard, (h) => `${h.key}:${String(h.answered)}`),
							Order.String
						)
						if (run.heardBefore) {
							assert.deepEqual(
								Arr.map(finish, (r) => r.outcome),
								["failed"],
								"the refused ChangeSet fails the finish by its law"
							)
							assert.deepEqual(
								heardText,
								["steadfast:false"],
								"nothing the finish would have heard stands"
							)
						} else {
							assert.deepEqual(
								Arr.map(finish, (r) => r.outcome),
								["done"]
							)
							assert.deepEqual(heardText, [
								`brittle:${String(run.brittle === 0)}`,
								"steadfast:true"
							])
						}
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a finish's ChangeSet and its result commit as one: done with both, or refused with both"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/retry.binding.ts",
			original:
				"h.commits.retryCommitLaddersFinish.once({\n\t\t\t\t\t\t\t\tparams: { ...done.writes.params },\n\t\t\t\t\t\t\t\tfacts: committedFacts(",
			replacement:
				"h.commits.retryCommitLaddersFinish.once({\n\t\t\t\t\t\t\t\tparams: { ...done.writes.params },\n\t\t\t\t\t\t\t\tfacts: ((den: object, _step: object) => den)(",
			why: "The finish's result is committed apart from its ChangeSet's rows: its call carries none of the ChangeSet's facts, so what the finish heard never lands with its result, and a refusal of the app's write no longer refuses it."
		}
	]
})
