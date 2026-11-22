import { retire } from "@bjornpagen/den/runtime/retire"
import { serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName } from "@bjornpagen/den/transport"
import { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order } from "effect"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * Retirement of finished graphs on PostgreSQL 19: an operator requests chain roots, some of which run to their end and
 * some of which are never admitted, and the app audits a result of some finished ones. One retirement then retires
 * every finished root no audit pins, under grizzle's retirable unit whose header is the chain's Root.
 *
 * Oracle (specification): docs/decisions.md and grizzle's README, "Retirable units". A finished root with no audit is
 * retired: no step, result or input row of its graph is left, its header stays, and a stale wake of one of its steps is
 * lost. A finished root an audit references is kept, its retirement refused, its graph whole. A root never admitted has
 * not ended and is neither retired nor kept. A request of any root's key again, retired, kept or never admitted, starts
 * nothing and answers that the root was already requested, under the same scope, since its header keeps the key
 * whatever became of its graph; no graph row comes back. A second retirement retires nothing more, and the app's own
 * rows (each feed's items) stay.
 */

type Feature = "a root retired" | "a root kept by an audit" | "a root not finished"

interface Planned {
	readonly pages: number
	readonly run: boolean
	readonly audit: boolean
}

const runs: Gen<ReadonlyArray<Planned>> = array(
	(source): Planned => ({
		pages: source.draw(int(1, 3)),
		run: source.draw(boolean),
		audit: source.draw(boolean)
	}),
	{ min: 1, max: 4 }
)

/** Scopes in one order, their digests' hex (Sha256.toHex). */
const byScope = Order.mapInput(Order.String, Sha256.toHex)

/** A graph's rows as texts, each key its digest's hex, in one order, so two reads of them compare as sets. */
const graphTexts = (graph: ReadonlyArray<{ readonly step: Sha256; readonly root: Sha256 }>) =>
	Arr.sort(
		Arr.map(graph, (row) => `${Sha256.toHex(row.root)} ${Sha256.toHex(row.step)}`),
		Order.String
	)

/**
 * Retires every finished chain no app row pins, whole, and keeps the rest.
 */
export const aRetirementTakesEveryFinishedGraphNoAppRowPins = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"a root retired",
		"a root kept by an audit",
		"a root not finished"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(planned) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { chain, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const requested = yield* Effect.forEach(planned, (plan, index) =>
							Effect.map(
								chain.request.ChainRun(`root-${index}`, {
									feed: "news",
									pages: BigInt(plan.pages)
								}),
								(r) => ({ plan, index, flow: r.flow, scope: r.scope })
							)
						)
						const running = Arr.filter(requested, (r) => r.plan.run)
						yield* ringAndDrain(ledgers, running)
						const audited = Arr.filter(running, (r) => r.plan.audit)
						const results = yield* rows(app.workload.chainGraphRows.once({ params: {}, facts: {} }))
						const pages = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						yield* Effect.forEach(audited, (r) =>
							Effect.forEach(
								Arr.take(
									Arr.filter(pages, (page) => Sha256.equals(page.scope, r.scope)),
									1
								),
								(page) =>
									app.workload.audit.once({
										params: {},
										facts: { insert: { Audit: [{ step: page.step, root: r.scope, note: "kept" }] } }
									})
							)
						)
						const retiredScopes = Arr.map(
							Arr.filter(running, (r) => !r.plan.audit),
							(r) => r.scope
						)
						const keptScopes = Arr.map(audited, (r) => r.scope)
						const idle = Arr.filter(requested, (r) => !r.plan.run)
						if (Arr.isReadonlyArrayNonEmpty(retiredScopes)) {
							c.note("a root retired")
						}
						if (Arr.isReadonlyArrayNonEmpty(keptScopes)) {
							c.note("a root kept by an audit")
						}
						if (Arr.isReadonlyArrayNonEmpty(idle)) {
							c.note("a root not finished")
						}

						const retirements = yield* retire(chain.ledger)
						assert.deepEqual(
							Arr.sort(
								Arr.flatMap(retirements, (r) => (r.kind === "retired" ? [r.root] : [])),
								byScope
							),
							Arr.sort(retiredScopes, byScope)
						)
						assert.deepEqual(
							Arr.sort(
								Arr.flatMap(retirements, (r) =>
									r.kind === "kept" && r.error.kind === "refused" ? [r.root] : []
								),
								byScope
							),
							Arr.sort(keptScopes, byScope)
						)
						assert.equal(retirements.length, retiredScopes.length + keptScopes.length)

						const left = yield* rows(app.workload.chainGraphRows.once({ params: {}, facts: {} }))
						/** The roots left, by their digests' hex. */
						const rootsLeft = new Set(Arr.map(left, (row) => Sha256.toHex(row.root)))
						Arr.forEach(retiredScopes, (scope) =>
							assert.equal(rootsLeft.has(Sha256.toHex(scope)), false)
						)
						Arr.forEach(keptScopes, (scope) =>
							assert.equal(
								Arr.filter(left, (row) => Sha256.equals(row.root, scope)).length,
								Arr.filter(results, (row) => Sha256.equals(row.root, scope)).length
							)
						)
						const headers = yield* rows(app.workload.chainHeaders.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.sort(
								Arr.map(headers, (h) => h.scope),
								byScope
							),
							Arr.sort(
								Arr.map(requested, (r) => r.scope),
								byScope
							)
						)

						yield* Effect.forEach(requested, (r) =>
							Effect.map(
								chain.request.ChainRun(`root-${r.index}`, {
									feed: "news",
									pages: BigInt(r.plan.pages)
								}),
								(again) => assert.deepEqual(again, { flow: r.flow, scope: r.scope, fresh: false })
							)
						)
						const after = yield* rows(app.workload.chainGraphRows.once({ params: {}, facts: {} }))
						assert.deepEqual(graphTexts(after), graphTexts(left))

						yield* Effect.forEach(
							Arr.filter(requested, (r) =>
								Arr.some(retiredScopes, (scope) => Sha256.equals(scope, r.scope))
							),
							(r) =>
								Effect.gen(function* () {
									const stale = Arr.filter(pages, (page) => Sha256.equals(page.scope, r.scope))
									const ends = yield* chain.ledger.now
									yield* Effect.forEach(stale, (page) =>
										Effect.map(
											serve(
												ledgers,
												{
													_tag: "Step",
													flow: FlowName.make("Chain"),
													step: page.step,
													attempt: AttemptNumber.make(0)
												},
												ends
											),
											(turn) => assert.equal(turn.ending.kind, "lost")
										)
									)
								})
						)

						const second = yield* retire(chain.ledger)
						assert.deepEqual(
							Arr.flatMap(second, (r) => (r.kind === "retired" ? [r.root] : [])),
							[]
						)
						const items = yield* rows(app.workload.items.once({ params: {}, facts: {} }))
						const most = Arr.reduce(running, 0, (m, r) => Math.max(m, r.plan.pages))
						assert.equal(items.length, (most * (most + 1)) / 2)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "grizzle's retirable units: finished unpinned graphs gone whole, headers kept, every key requested again not fresh, pinned graphs kept"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/chain.binding.ts",
			original: "retire: { ChainRoot: [{ scope: root }] }",
			replacement: "retire: { ChainRoot: [] }",
			why: "the binding retires no group, so a finished graph's rows stay"
		},
		{
			file: "packages/den/src/runtime/bind.ts",
			original: "\t\t\t() => Effect.succeed(false)",
			replacement: "\t\t\t() => Effect.succeed(true)",
			why: "A request of a key already requested, which its root's header refuses on its key, answers that it started the root, a retired one's included."
		}
	]
})
