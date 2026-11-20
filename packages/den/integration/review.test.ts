import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order } from "effect"
import { ringAndDrain } from "#integration/support/run.ts"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The next stage after a scope ends, and edges that open child scopes, end to end on PostgreSQL 19, in the review flow,
 * AlphaTest's gap analysis's shape: an operator requests a review of groups of questions, beside its attempt's
 * writeback, whose delivery its Gather step awaits; Gather's edge opens
 * one Questions scope per group, each admitted in Gather's commit with one Analyze per question; each group's finish,
 * the cluster over its questions, answers the group's count and total, and its commit spawns the group's Save in the
 * review, from the group's input and the cluster's output; the review's finish reads every group's ending with its
 * cluster's output and every save, and sums them.
 *
 * Oracle (specification): for sizes s, one Reviewed row per group g, (g, s_g, the sum of q² over q from 1 to s_g); the
 * review's Summary, every group saved and the sum of every group's total; every Questions scope a child of the review,
 * every Save living in the review's own scope, beside Gather; each group's cluster, the finish, holding a seat of
 * Anthropic's as each analysis does, and every seat free at the end; and every scope finished once, done.
 */

type Feature = "no group" | "an empty group" | "several groups" | "a group of several questions"

interface Run {
	readonly sizes: ReadonlyArray<number>
}

const runs: Gen<Run> = (source) => ({
	sizes: source.draw(array(int(0, 3), { min: 0, max: 3 }))
})

/** The sum of q² over q from 1 to n. */
const squares = (n: bigint): bigint => (n * (n + 1n) * (2n * n + 1n)) / 6n

/**
 * Opens a child scope per group from Gather's edge and saves each group after its cluster, in the review.
 *
 * Budget: provisional, the fan-out flow's own (10 independent cases and 10 steered), over reviews of up to three
 * groups of up to three questions.
 */
export const aScopesFinishSpawnsTheNextStageInItsParent = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"no group",
		"an empty group",
		"several groups",
		"a group of several questions"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						if (Arr.isReadonlyArrayEmpty(run.sizes)) {
							c.note("no group")
						}
						if (run.sizes.length > 1) {
							c.note("several groups")
						}
						if (Arr.contains(run.sizes, 0)) {
							c.note("an empty group")
						}
						if (Arr.some(run.sizes, (size) => size > 1)) {
							c.note("a group of several questions")
						}
						const { review, writeback, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const key = `r-${Arr.join(Arr.map(run.sizes, String), "-")}`
						const delivered = yield* writeback.request.Writeback(key, { attempt: key })
						const requested = yield* review.request.ReviewRun(key, {
							review: key,
							sizes: Arr.map(run.sizes, BigInt)
						})
						yield* ringAndDrain(ledgers, [delivered, requested])
						const root = requested.scope
						const reviewed = yield* rows(app.workload.reviewed.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.sort(
								Arr.map(
									Arr.filter(reviewed, (r) => r.review === key),
									(r) => [r.group, r.count, r.total] as const
								),
								Order.mapInput(Order.BigInt, (row: readonly [bigint, bigint, bigint]) => row[0])
							),
							Arr.map(run.sizes, (size, group) => {
								const n = BigInt(size)
								return [BigInt(group), n, squares(n)] as const
							})
						)
						const summaries = yield* rows(app.workload.summaries.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(
								Arr.filter(summaries, (s) => s.review === key),
								(s) => [s.groups, s.total] as const
							),
							[
								[
									BigInt(run.sizes.length),
									Arr.reduce(run.sizes, 0n, (sum, size) => sum + squares(BigInt(size)))
								] as const
							]
						)
						const withins = yield* rows(app.workload.reviewWithins.once({ params: {}, facts: {} }))
						const groups = Arr.filter(withins, (w) => w.parent === root)
						assert.deepEqual(
							Arr.map(groups, (w) => w.kind),
							Arr.map(run.sizes, () => "Questions" as const)
						)
						const steps = yield* rows(app.workload.reviewSteps.once({ params: {}, facts: {} }))
						const inRoot = Arr.filter(
							steps,
							(s) => s.scope === root && s.kind !== "ReviewRunFinish"
						)
						assert.deepEqual(
							Arr.sort(
								Arr.map(inRoot, (s) => `${s.kind} ${s.outcome}`),
								Order.String
							),
							["Gather done", ...Arr.map(run.sizes, () => "Save done")]
						)
						const holds = yield* rows(app.workload.reviewHolds.once({ params: {}, facts: {} }))
						const clusterSteps = Arr.filter(steps, (s) => s.kind === "QuestionsFinish")
						assert.deepEqual(
							Arr.map(clusterSteps, (s) =>
								Arr.map(
									Arr.filter(holds, (h) => h.step === s.step),
									(h) => h.resource
								)
							),
							Arr.map(clusterSteps, () => ["Anthropic" as const]),
							"each group's cluster held a seat of Anthropic's while it ran"
						)
						const left = yield* review.ledger.holds
						assert.deepEqual(left, [])
						const finishes = yield* rows(
							app.workload.reviewFinishes.once({ params: {}, facts: {} })
						)
						const scopes = [root, ...Arr.map(groups, (w) => w.scope)]
						assert.deepEqual(
							Arr.map(scopes, (scope) =>
								Arr.map(
									Arr.filter(finishes, (f) => f.scope === scope),
									(f) => f.outcome
								)
							),
							Arr.map(scopes, () => ["done" as const])
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "each group saved in the review from its cluster's output, the summary over every group, one done finish per scope"
	},
	budget: { runs: 10, steered: 10 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "return [...children, ...Option.toArray(upward)]",
			replacement: "return [...Option.toArray(upward)]",
			why: "A finish rings nothing of what its commit spawned in its scope's parent: every group's save waits for the census, and with no tick the review never finishes."
		},
		{
			file: "packages/den/integration/slice/generated/review.binding.ts",
			original: "uses: review.kinds[1].finish.uses,",
			replacement: "uses: [],",
			why: "A finish holds no seat of the resources it uses: each group's cluster runs its model call on no seat of Anthropic's."
		},
		{
			file: "packages/den/integration/slice/generated/review.binding.ts",
			original: "scope: done.input.parent,",
			replacement: "scope: done.turn.scope,",
			why: "A finish spawns the next stage in the scope it finished, after its own end, where it belongs to the scope's parent: the review's finish reads no save, and each group's save lives under a scope already done."
		}
	]
})
