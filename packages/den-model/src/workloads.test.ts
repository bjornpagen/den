import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { type Gen, int, option, production } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Data, Effect } from "effect"
import type { Entry } from "#facts.ts"
import { rootOfStep, rootText } from "#identity.ts"
import { ledgerOf, SOUND } from "#ledger.ts"
import { type Ceilings, type Ladder, ordinals } from "#program.ts"
import { LAWS } from "#properties.ts"
import { faultsGen, natureOf, platformGen } from "#scenarios.ts"
import { evidenceOf, exploration, holds } from "#search.ts"
import { type Seen, simulate, SOUND_POLICY } from "#simulator.ts"
import { type Collection, type Night, type QtiLimits, qtiOf } from "#workloads/qti.ts"
import { type Daily, type TimebackLimits, timebackOf } from "#workloads/timeback.ts"

/** An app write the workload's own law forbids: a cursor moved over work that did not land. */
class CursorMovedEarly extends Data.TaggedError("CursorMovedEarly")<{ message: string }> {}

/** What a workload's run notices beyond the simulator's situations. */
type Noticed = Seen | "split" | "refused" | "moved" | "held"

/** edullm's ceilings in force: five attempts, thirty waits, five reclaims; small ones a fifth of the time. */
const ceilingsGen: Gen<Ceilings> = (source) => ({
	attempts: source.draw(production(5, [1, 2])),
	waits: source.draw(production(30, [0, 1, 2])),
	reclaims: source.draw(production(5, [1, 2]))
})

/** edullm's ladder at the model's scale, a tick a minute: one minute doubling to ten. */
const ladderGen: Gen<Ladder> = (source) => ({ first: 1, last: source.draw(production(10, [1, 2])) })

const qtiLimitsGen: Gen<QtiLimits> = (source) => ({
	width: source.draw(production(3, [1, 2])),
	lease: source.draw(production(10, [2, 3, 5])),
	ceilings: source.draw(ceilingsGen),
	ladder: source.draw(ladderGen)
})

const collectionGen =
	(index: number): Gen<Collection> =>
	(source) => {
		const pages = source.draw(int(1, 4))
		return {
			name: `c${index}`,
			pages,
			throttles: source.draw(int(0, 2)),
			refuses: source.draw(option(int(0, pages + 2)))
		}
	}

const nightGen =
	(night: number): Gen<Night> =>
	(source) => ({
		night,
		collections: Arr.map(Arr.range(1, source.draw(int(1, 3))), (index) =>
			source.draw(collectionGen(index))
		)
	})

const timebackLimitsGen: Gen<TimebackLimits> = (source) => ({
	width: source.draw(production(8, [1, 2, 3])),
	lease: source.draw(production(10, [2, 3, 5])),
	ceilings: source.draw(ceilingsGen),
	ladder: source.draw(ladderGen),
	pageBytes: source.draw(production(16, [4, 8]))
})

const dailyGen =
	(index: number): Gen<Daily> =>
	(source) => {
		const blocks = source.draw(int(1, 12))
		const hotFrom = source.draw(int(0, blocks))
		return {
			night: 1,
			relation: {
				name: `relation${index}`,
				blocks,
				blockBytes: source.draw(int(1, 4)),
				hotFrom,
				hotTo: source.draw(int(hotFrom, blocks))
			}
		}
	}

/** The writes of each root's incarnation, by relation and key: what its finish's cursor rests on. */
const writesByRoot = (
	trace: ReadonlyArray<Entry>
): ReadonlyArray<Readonly<{ root: string; writes: ReadonlyArray<string>; at: number }>> => {
	const landed: Array<Readonly<{ root: string; writes: ReadonlyArray<string>; at: number }>> = []
	const open = new Map<string, Array<string>>()
	for (const entry of trace) {
		for (const fact of entry.facts) {
			if (fact._tag === "Wrote") {
				const root = rootText(rootOfStep(fact.step))
				const writes = open.get(root) ?? []
				writes.push(`${fact.write.relation}/${fact.write.key}`)
				open.set(root, writes)
			}
			if (fact._tag === "Retired") {
				const root = rootText(fact.root)
				landed.push({ root, writes: open.get(root) ?? [], at: entry.at })
				open.delete(root)
			}
		}
	}
	return landed
}

/** The trace's spawns under an edge of a name. */
const spawnsUnder = (trace: ReadonlyArray<Entry>, edge: string): boolean =>
	Arr.some(trace, (entry) =>
		Arr.some(
			entry.facts,
			(fact) => fact._tag === "Spawned" && fact.step._tag === "EdgeStep" && fact.step.edge === edge
		)
	)

const refusedIn = (trace: ReadonlyArray<Entry>): boolean =>
	Arr.some(trace, (entry) =>
		Arr.some(entry.facts, (fact) => fact._tag === "Failed" && fact.failure._tag === "Refused")
	)

describe("edullm's workloads as den programs, under den's laws", () => {
	it.effect(
		"the QTI chain: pages each naming the next, a frontier moved only over every page of its window",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "workload: qti",
						draw: drawn((source) => ({
							limits: source.draw(qtiLimitsGen),
							nights: Arr.map(Arr.range(1, source.draw(int(1, 2))), (night) =>
								source.draw(nightGen(night))
							),
							platform: source.draw(platformGen),
							faults: source.draw(faultsGen([]))
						})),
						coverage: required<Noticed>(
							[
								"claimed",
								"retried",
								"reclaimed",
								"stale",
								"stopped",
								"refused",
								"moved",
								"held",
								"retired"
							],
							{ cases: 300, sense: notesOnly }
						),
						runs: 400,
						shrink: 300,
						oracle: {
							kind: "specification",
							name: "den's laws, and a QTI read's finish moves its frontier only once every page of its window landed"
						}
					}),
					(scenario, c: Case<Noticed>) =>
						Effect.gen(function* () {
							const qti = qtiOf(scenario.limits)
							const run = simulate(
								{
									program: qti.program,
									admissions: Arr.map(scenario.nights, qti.admit),
									ledger: ledgerOf(SOUND),
									policy: SOUND_POLICY,
									platform: scenario.platform
								},
								natureOf(c, scenario.faults)
							)
							c.noteAll(run.seen)
							if (refusedIn(run.trace)) {
								c.note("refused")
							}
							yield* holds(LAWS, evidenceOf(run, qti.program.lanes))
							const retired = writesByRoot(run.trace)
							for (const night of scenario.nights) {
								const root = rootText({ trigger: "QtiNightly", key: `${night.night}` })
								for (const { writes } of Arr.filter(retired, (landed) => landed.root === root)) {
									for (const collection of night.collections) {
										const moved = Arr.contains(writes, `qti_cursor/${collection.name}`)
										c.note(moved ? "moved" : "held")
										const pages = Arr.map(
											ordinals(collection.pages),
											(seq) => `qti_document/${collection.name}:${seq}`
										)
										if (moved && !Arr.every(pages, (page) => Arr.contains(writes, page))) {
											return yield* new CursorMovedEarly({
												message: `${root} moved ${collection.name}'s frontier with pages missing`
											})
										}
									}
								}
							}
						})
				)
			)
	)

	it.effect(
		"the Timeback daily job: a print, a pages scope that splits a page too large, a prune, a cursor moved only over every block",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "workload: timeback daily",
						draw: drawn((source) => ({
							limits: source.draw(timebackLimitsGen),
							dailies: Arr.map(Arr.range(1, source.draw(int(1, 2))), (index) =>
								source.draw(dailyGen(index))
							),
							platform: source.draw(platformGen),
							faults: source.draw(faultsGen([]))
						})),
						coverage: required<Noticed>(
							[
								"claimed",
								"retried",
								"reclaimed",
								"at-width",
								"stale",
								"stopped",
								"split",
								"refused",
								"moved",
								"held",
								"retired"
							],
							{ cases: 300, sense: notesOnly }
						),
						runs: 400,
						shrink: 300,
						oracle: {
							kind: "specification",
							name: "den's laws, and the daily root moves its cursor only once every block landed in Silver and the prune ran"
						}
					}),
					(scenario, c: Case<Noticed>) =>
						Effect.gen(function* () {
							const timeback = timebackOf(scenario.limits)
							const run = simulate(
								{
									program: timeback.program,
									admissions: Arr.map(scenario.dailies, timeback.admit),
									ledger: ledgerOf(SOUND),
									policy: SOUND_POLICY,
									platform: scenario.platform
								},
								natureOf(c, scenario.faults)
							)
							c.noteAll(run.seen)
							if (spawnsUnder(run.trace, "split")) {
								c.note("split")
							}
							if (refusedIn(run.trace)) {
								c.note("refused")
							}
							yield* holds(LAWS, evidenceOf(run, timeback.program.lanes))
							for (const { writes } of writesByRoot(run.trace)) {
								for (const daily of scenario.dailies) {
									const relation = daily.relation
									if (!Arr.contains(writes, `timeback_print/${relation.name}`)) {
										continue
									}
									const moved = Arr.contains(writes, `timeback_cursor/${relation.name}`)
									c.note(moved ? "moved" : "held")
									const every = Arr.every(ordinals(relation.blocks), (block) =>
										Arr.contains(writes, `silver/${relation.name}:${block}`)
									)
									if (moved && (!every || !Arr.contains(writes, `pruned/${relation.name}`))) {
										return yield* new CursorMovedEarly({
											message: `${relation.name}'s cursor moved with blocks missing from Silver or no prune`
										})
									}
								}
							}
						})
				)
			)
	)
})
