import { startedStep } from "@bjornpagen/den/runtime/identity"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option } from "effect"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * A step joined on two facts, on PostgreSQL 19: the review flow's Gather awaits the gradebook's Delivered of the attempt
 * it reviews, which the writeback flow's Deliver step writes, so Gather is eligible once its own input and that row
 * both exist. A review and its attempt's writeback are requested in either order, each run to the end on the in-process
 * transport before the other is requested, and no census ever ticks: where the delivery came first, the review's own
 * spawn rings Gather; where the review came first, Gather waits on the fact, spending nothing and claiming nothing,
 * until Deliver's commit, in the other flow, rings it.
 *
 * Oracle (specification): Gather never runs before the delivery (no claim of it while it waits), runs once (one claim,
 * attempt 0) whichever came first, and the review then runs to its summary.
 */

type Order = "the fact first" | "the step first"

type Feature = Order | "a review of groups"

interface Joined {
	readonly order: Order
	readonly sizes: ReadonlyArray<number>
}

const joined: Gen<Joined> = (source) => ({
	order: source.draw(element<Order>(["the fact first", "the step first"])),
	sizes: source.draw(array(int(0, 2), { min: 0, max: 2 }))
})

/**
 * Runs Gather once its attempt is delivered, rung by whichever commit completes the pair.
 *
 * Budget: provisional, the review flow's own (10 independent cases and 10 steered), over reviews of up to two groups of
 * up to two questions.
 */
export const aStepJoinedOnTwoFactsRunsOnceBothExist = property.explore(joined, {
	needs: { slice: sliceCase },
	situations: ["the fact first", "the step first", "a review of groups"] satisfies ReadonlyArray<
		Reached<Feature>
	>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.order)
						if (Arr.isReadonlyArrayNonEmpty(run.sizes)) {
							c.note("a review of groups")
						}
						const { review, writeback, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const key = `a-${Arr.join(Arr.map(run.sizes, String), "-")}`
						const requestReview = review.request.ReviewRun(key, {
							review: key,
							sizes: Arr.map(run.sizes, BigInt)
						})
						const requestDelivery = writeback.request.Writeback(key, { attempt: key })
						const first = yield* run.order === "the fact first" ? requestDelivery : requestReview
						yield* ringAndDrain(ledgers, [first])
						const second = yield* run.order === "the fact first" ? requestReview : requestDelivery
						const root = run.order === "the fact first" ? second.scope : first.scope
						const gather = startedStep(root, 0)
						if (run.order === "the step first") {
							const early = yield* review.ledger.claimsOf(gather)
							assert.deepEqual(early, [], "Gather claims nothing while it waits on its fact")
							const unmet = yield* review.ledger.awaiting(gather)
							assert.equal(unmet, true)
						}
						yield* ringAndDrain(ledgers, [second])
						const claims = yield* review.ledger.claimsOf(gather)
						assert.deepEqual(
							Arr.map(claims, (claim) => claim.attempt),
							[0n],
							"Gather runs once, at its first attempt"
						)
						const outcome = yield* review.ledger.resultOf(gather)
						assert.deepEqual(outcome, Option.some("done" as const))
						const summaries = yield* rows(app.workload.summaries.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(
								Arr.filter(summaries, (s) => s.review === key),
								(s) => s.groups
							),
							[BigInt(run.sizes.length)]
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "Gather never claimed before its fact, run once at attempt 0 in either order, and the review summarised"
	},
	budget: { runs: 10, steered: 10 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original:
				'\t\tconst readied =\n\t\t\tran.kind === "committed" ? yield* readiedBy(ledgers, writtenBy(ran.committed.outcome)) : []',
			replacement: "\t\tconst readied: ReadonlyArray<Onward> = []",
			why: "A commit that writes an awaited fact rings no step waiting on it: a review requested before its delivery waits for a census that never ticks, and never runs."
		},
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\t\tif (unmet) {",
			replacement: "\t\t\tif (false) {",
			why: "A step runs whether or not its awaited fact exists: a review requested before its delivery gathers at once, before the gradebook has its result."
		}
	]
})
