import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { boolean, type Gen, int, option, production, weighted } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Data, Effect, Option } from "effect"
import type { Datum } from "#datum.ts"
import type { Trace } from "#facts.ts"
import { rootOfStep, rootText, stepText } from "#identity.ts"
import { ledgerOf, SOUND } from "#ledger.ts"
import { type Ladder, ordinals, type Window } from "#program.ts"
import { LAWS } from "#properties.ts"
import { faultsGen, natureOf, platformGen } from "#scenarios.ts"
import { declares, evidenceOf, exploration, holds } from "#search.ts"
import { type FairEnd, type Seen, simulate, SOUND_POLICY } from "#simulator.ts"
import { edullmOf, type Limits, type World } from "#workloads/edullm.ts"

/** A workload's own law broken: a cursor moved over work that did not land, a present child hung up, and the like. */
class WorkloadBroken extends Data.TaggedError("WorkloadBroken")<{ message: string }> {}

/** What a workload's run notices beyond the simulator's situations. */
type Noticed =
	| Seen
	| "w1-moved"
	| "w1-split"
	| "w1-refused"
	| "w2-moved"
	| "w2-kinds"
	| "w3-moved"
	| "w3-held"
	| "w4-swapped"
	| "w4-blocked"
	| "w4-stopped"
	| "w5-rearmed"
	| "w5-hung-up"
	| "w6-retried"
	| "w6-delivered"
	| "w7-reconciled"
	| "w8-seeded"

/** A ladder of edullm's five attempts, its rungs a tick doubling to ten; small ones a fifth of the time. */
const ladderGen: Gen<Ladder> = (source) => ({
	_tag: "Attempts",
	attempts: source.draw(production(5, [1, 2])),
	first: 1,
	last: source.draw(production(10, [1, 2]))
})

/** A ladder that never ends, for the workloads that must not give up: W5's takedown. */
const neverGen: Gen<Ladder> = (source) => ({
	_tag: "Never",
	first: 1,
	last: source.draw(production(10, [1, 2]))
})

/** edullm's overnight window, 07:00–12:59 of a day of 24 ticks, or none. */
const windowGen: Gen<Option.Option<Window>> = weighted<Option.Option<Window>>([
	[1, () => Option.none()],
	[2, () => Option.some({ period: 24, opens: 7, closes: 13 })]
])

const leaseGen: Gen<number> = production(10, [2, 3, 5])

const limitsGen: Gen<Limits> = (source) => ({
	timeback: {
		seats: source.draw(production(8, [1, 2, 3])),
		window: source.draw(windowGen),
		lease: source.draw(leaseGen),
		ladder: source.draw(ladderGen),
		pageBytes: source.draw(production(16, [4, 8]))
	},
	alphatest: {
		window: source.draw(windowGen),
		lease: source.draw(leaseGen),
		ladder: source.draw(ladderGen)
	},
	qti: {
		window: source.draw(windowGen),
		lease: source.draw(leaseGen),
		ladder: source.draw(ladderGen)
	},
	gold: { lease: source.draw(leaseGen), ladder: source.draw(ladderGen) },
	takedown: {
		idle: source.draw(production(6, [2, 3])),
		lease: source.draw(leaseGen),
		ladder: source.draw(neverGen)
	},
	reports: {
		delay: source.draw(production(3, [1])),
		lease: source.draw(leaseGen),
		first: 1,
		last: source.draw(production(5, [1, 2]))
	},
	enrollment: { lease: source.draw(leaseGen), ladder: source.draw(ladderGen) },
	seed: { lease: source.draw(leaseGen), ladder: source.draw(ladderGen) }
})

/** Up to `most` of something, none a third of the time, so a case runs a few workloads or all of them. */
const someOf =
	<A>(most: number, each: (index: number) => Gen<A>): Gen<ReadonlyArray<A>> =>
	(source) =>
		Arr.map(
			ordinals(
				source.draw(
					weighted<number>([
						[1, () => 0],
						[2, (inner) => inner.draw(int(1, most))]
					])
				)
			),
			(index) => source.draw(each(index))
		)

const worldGen: Gen<World> = (source) => ({
	timeback: source.draw(
		someOf(3, (index) => (inner) => {
			const blocks = inner.draw(int(1, 12))
			const hotFrom = inner.draw(int(0, blocks))
			return {
				at: inner.draw(int(0, 30)),
				what: {
					night: index + 1,
					relation: {
						name: `relation${inner.draw(int(1, 2))}`,
						blocks,
						blockBytes: inner.draw(int(1, 4)),
						hotFrom,
						hotTo: inner.draw(int(hotFrom, blocks))
					}
				}
			}
		})
	),
	alphatest: source.draw(
		someOf(2, (index) => (inner) => ({
			at: inner.draw(int(0, 30)),
			what: {
				night: index + 1,
				pages: inner.draw(int(1, 3)),
				kinds: Arr.map(ordinals(inner.draw(int(0, 3))), (kind) => ({
					kind: `kind${kind}`,
					perPage: inner.draw(int(0, 4))
				})),
				batch: inner.draw(int(1, 4)),
				throttles: inner.draw(int(0, 2)),
				scans: inner.draw(int(0, 3))
			}
		}))
	),
	qti: source.draw(
		someOf(2, (index) => (inner) => ({
			at: inner.draw(int(0, 30)),
			what: {
				night: index + 1,
				collections: Arr.map(ordinals(inner.draw(int(1, 3))), (collection) => {
					const pages = inner.draw(int(1, 4))
					return {
						name: `c${collection}`,
						pages,
						throttles: inner.draw(int(0, 2)),
						refuses: inner.draw(option(int(0, pages + 2)))
					}
				})
			}
		}))
	),
	gold: source.draw(
		someOf(3, (index) => (inner) => ({
			at: inner.draw(int(0, 48)),
			what: {
				refresh: {
					key: `press${index}`,
					views: inner.draw(int(1, 4)),
					fails: inner.draw(option(int(0, 5)))
				},
				by: inner.draw(boolean) ? "operator" : "schedule"
			}
		}))
	),
	attempts: source.draw(
		someOf(2, (index) => (inner) => {
			const entered = inner.draw(int(0, 10))
			return {
				attempt: { id: `attempt${index}`, entered },
				leaves: entered + inner.draw(int(0, 14))
			}
		})
	),
	reports: source.draw(
		someOf(3, (index) => (inner) => ({
			id: `report${index}`,
			written: inner.draw(int(0, 10)),
			stretch: inner.draw(boolean),
			heals: inner.draw(int(0, 30))
		}))
	),
	hours: source.draw(someOf(2, (index) => () => index * 12)),
	intents: source.draw(
		someOf(3, () => (inner) => ({
			at: inner.draw(int(0, 20)),
			what: { key: `learner${inner.draw(int(0, 2))}`, value: inner.draw(int(0, 2)) }
		}))
	),
	seeds: source.draw(
		someOf(1, (index) => (inner) => ({
			at: inner.draw(int(0, 10)),
			what: { key: `seed${index}`, tables: inner.draw(int(1, 3)) }
		}))
	)
})

/** Every write each root's steps landed, by root, as `relation/key` to its value. */
const writesByRoot = (trace: Trace): ReadonlyMap<string, ReadonlyMap<string, Datum>> => {
	const roots = new Map<string, Map<string, Datum>>()
	for (const entry of trace.entries) {
		for (const fact of entry.facts) {
			if (fact._tag !== "Wrote" || fact.writer._tag !== "Step") {
				continue
			}
			const root = rootText(rootOfStep(fact.writer.step))
			const writes = roots.get(root) ?? new Map<string, Datum>()
			writes.set(`${fact.write.relation}/${fact.write.key}`, fact.write.value)
			roots.set(root, writes)
		}
	}
	return roots
}

/** The first of a list of witnesses, as a workload's broken law. */
const firstOf = (witnesses: ReadonlyArray<string>): Option.Option<WorkloadBroken> =>
	Option.map(Arr.head(witnesses), (message) => new WorkloadBroken({ message }))

/**
 * Each workload's own law over one run: a cursor, frontier or generation moves only over work that all landed (W1 to
 * W4); a takedown hangs up only an attempt away for its idle time at its claim, and every attempt is hung up (W5);
 * every report is delivered and none fails (W6); the last reconciliation leaves the roster as the intents it read
 * (W7); every seed run with no failed step seeds every table (W8). What must happen is checked only when the run
 * ended quiescent.
 */
const ownLaws = (
	trace: Trace,
	limits: Limits,
	world: World,
	end: FairEnd,
	note: (noticed: Noticed) => void
): Option.Option<WorkloadBroken> => {
	const writes = writesByRoot(trace)
	const of = (kind: string, key: string) =>
		Option.getOrElse(
			Option.fromNullishOr(writes.get(rootText({ kind, key }))),
			() => new Map<string, Datum>()
		)
	const quiet = end._tag === "Quiescent"
	const facts = Arr.flatMap(trace.entries, (entry) => Arr.map(entry.facts, (fact) => ({ fact })))
	Arr.forEach(facts, ({ fact }) => {
		if (fact._tag === "Spawned" && fact.step._tag === "EdgeStep" && fact.step.edge === "split") {
			note("w1-split")
		}
		if (
			fact._tag === "Failed" &&
			fact.failure._tag === "Refused" &&
			rootOfStep(fact.step).kind === "TimebackDaily"
		) {
			note("w1-refused")
		}
		if (
			fact._tag === "Opened" &&
			fact.kind === "AlphaTestChain" &&
			fact.scope._tag === "EdgeScope"
		) {
			note("w2-kinds")
		}
		if (
			fact._tag === "Finished" &&
			fact.ending === "Held" &&
			fact.scope._tag === "RootScope" &&
			fact.scope.root.kind === "QtiRead"
		) {
			note("w3-held")
		}
		if (fact._tag === "Spawned" && fact.kind === "Takedown" && fact.step._tag === "EdgeStep") {
			note("w5-rearmed")
		}
		if (fact._tag === "Retried" && rootOfStep(fact.step).kind === "TimebackReport") {
			note("w6-retried")
		}
		if (
			fact._tag === "Failed" &&
			fact.step._tag === "EdgeStep" &&
			rootOfStep(fact.step).kind === "GoldRefresh"
		) {
			note("w4-stopped")
		}
	})
	Arr.forEach(trace.entries, (entry) => {
		if (
			entry.command._tag === "Admit" &&
			entry.command.root.kind === "GoldRefresh" &&
			entry.answer === "blocked"
		) {
			note("w4-blocked")
		}
	})
	const timeback = Arr.flatMap(world.timeback, ({ what: daily }) => {
		const landed = of("TimebackDaily", `${daily.relation.name}:${daily.night}`)
		if (!landed.has(`timeback_cursor/${daily.relation.name}`)) {
			return []
		}
		note("w1-moved")
		const every = Arr.every(ordinals(daily.relation.blocks), (block) =>
			landed.has(`silver/${daily.relation.name}:${block}`)
		)
		return every && landed.get(`pruned/${daily.relation.name}`) === daily.night
			? []
			: [
					`W1: ${daily.relation.name}'s cursor moved for night ${daily.night} with blocks missing or no prune of its print`
				]
	})
	const alphatest = Arr.flatMap(world.alphatest, ({ what: night }) => {
		const landed = of("AlphaTestNightly", `${night.night}`)
		if (!landed.has("alphatest_cursor/frontier")) {
			return []
		}
		note("w2-moved")
		const answered = (kind: string, links: number) =>
			Arr.every(ordinals(links), (seq) =>
				landed.has(`alphatest_answer/${night.night}:${kind}:${seq}`)
			)
		const every =
			answered("listing", Math.max(1, night.pages)) &&
			Arr.every(night.kinds, (kind) =>
				answered(kind.kind, Math.ceil((kind.perPage * night.pages) / night.batch))
			) &&
			Arr.every(ordinals(night.scans), (range) =>
				landed.has(`alphatest_scan/${night.night}:${range}`)
			)
		return every
			? []
			: [`W2: the frontier moved for night ${night.night} with answers or scans missing`]
	})
	const qti = Arr.flatMap(world.qti, ({ what: night }) =>
		Arr.flatMap(night.collections, (collection) => {
			const landed = of("QtiRead", `${collection.name}:${night.night}`)
			if (!landed.has(`qti_cursor/${collection.name}`)) {
				return []
			}
			note("w3-moved")
			return Arr.every(ordinals(collection.pages), (seq) =>
				landed.has(`qti_document/${collection.name}:${seq}`)
			)
				? []
				: [`W3: ${collection.name}'s frontier moved for night ${night.night} with pages missing`]
		})
	)
	const gold = Arr.flatMap(world.gold, ({ what: { refresh } }) => {
		const landed = of("GoldRefresh", refresh.key)
		if (!landed.has("gold/generation")) {
			return []
		}
		note("w4-swapped")
		return Arr.every(ordinals(refresh.views), (view) =>
			landed.has(`gold_next/${refresh.key}:${view}`)
		)
			? []
			: [`W4: ${refresh.key} swapped the generation with views missing`]
	})
	return firstOf([
		...timeback,
		...alphatest,
		...qti,
		...gold,
		...takedowns(trace, limits, world, quiet, note),
		...delivered(trace, world, quiet, note),
		...reconciled(trace, quiet, note),
		...Arr.flatMap(world.seeds, ({ what: seeding }) => {
			const landed = of("SilverSeedRun", seeding.key)
			const every = Arr.every(ordinals(seeding.tables), (table) =>
				landed.has(`silver_seed/${seeding.key}:${table}`)
			)
			if (every) {
				note("w8-seeded")
			}
			const failed = Arr.some(
				facts,
				({ fact }) =>
					fact._tag === "Failed" &&
					rootText(rootOfStep(fact.step)) === rootText({ kind: "SilverSeedRun", key: seeding.key })
			)
			return quiet && !failed && !every
				? [`W8: ${seeding.key} ended with tables unseeded and no seed failed`]
				: []
		})
	])
}

/**
 * W5's law: a takedown hangs up an attempt only when the attempt's last beacon, as the app wrote it before the claim,
 * is at least its idle time old at the claim; and once the run is quiescent every attempt was hung up, once.
 */
const takedowns = (
	trace: Trace,
	limits: Limits,
	world: World,
	quiet: boolean,
	note: (noticed: Noticed) => void
): ReadonlyArray<string> => {
	const beacons = new Map<string, number>()
	const claims = new Map<string, Readonly<{ at: number; last: number }>>()
	const hungUp = new Map<string, number>()
	const witnesses: Array<string> = []
	for (const entry of trace.entries) {
		for (const fact of entry.facts) {
			if (fact._tag === "Wrote" && fact.writer._tag === "App" && fact.write.relation === "beacon") {
				beacons.set(fact.write.key, typeof fact.write.value === "number" ? fact.write.value : 0)
			}
			if (fact._tag === "Claimed" && rootOfStep(fact.step).kind === "TutorAttempt") {
				const id = rootOfStep(fact.step).key
				const entered = Option.match(
					Arr.findFirst(world.attempts, (attempt) => attempt.attempt.id === id),
					{ onNone: () => 0, onSome: (attempt) => attempt.attempt.entered }
				)
				claims.set(`${stepText(fact.step)}@${fact.attempt}`, {
					at: fact.at,
					last: Math.max(entered, beacons.get(id) ?? entered)
				})
			}
			if (
				fact._tag === "Wrote" &&
				fact.writer._tag === "Step" &&
				fact.write.relation === "hangup"
			) {
				note("w5-hung-up")
				hungUp.set(fact.write.key, (hungUp.get(fact.write.key) ?? 0) + 1)
				const done = Arr.findFirst(
					entry.facts,
					(other) =>
						other._tag === "Done" &&
						fact.writer._tag === "Step" &&
						stepText(other.step) === stepText(fact.writer.step)
				)
				Option.match(done, {
					onNone: () => undefined,
					onSome: (other) => {
						const claim =
							other._tag === "Done"
								? claims.get(`${stepText(other.step)}@${other.attempt}`)
								: undefined
						if (claim !== undefined && claim.at < claim.last + limits.takedown.idle) {
							witnesses.push(
								`W5: ${fact.write.key} was hung up by a claim at ${claim.at}, its last beacon at ${claim.last}`
							)
						}
					}
				})
			}
		}
	}
	return [
		...witnesses,
		...Arr.flatMap(world.attempts, ({ attempt }) =>
			quiet && hungUp.get(attempt.id) !== 1
				? [`W5: ${attempt.id} was hung up ${hungUp.get(attempt.id) ?? 0} times`]
				: []
		)
	]
}

/** W6's law: no report's delivery fails, and once the run is quiescent every report was delivered. */
const delivered = (
	trace: Trace,
	world: World,
	quiet: boolean,
	note: (noticed: Noticed) => void
): ReadonlyArray<string> => {
	const facts = Arr.flatMap(trace.entries, (entry) => entry.facts)
	const failed = Arr.flatMap(facts, (fact) =>
		fact._tag === "Failed" && rootOfStep(fact.step).kind === "TimebackReport"
			? [`W6: ${stepText(fact.step)} failed, on a ladder that never ends`]
			: []
	)
	const sent = new Set(
		Arr.flatMap(facts, (fact) =>
			fact._tag === "Wrote" && fact.write.relation === "report_delivered" ? [fact.write.key] : []
		)
	)
	if (sent.size > 0) {
		note("w6-delivered")
	}
	return [
		...failed,
		...Arr.flatMap(world.reports, (report) =>
			quiet && !sent.has(report.id) ? [`W6: ${report.id} was never delivered`] : []
		)
	]
}

/**
 * W7's law: once the run is quiescent, the roster holds every intent as the app had written it when the last
 * reconciliation that landed took its reads.
 */
const reconciled = (
	trace: Trace,
	quiet: boolean,
	note: (noticed: Noticed) => void
): ReadonlyArray<string> => {
	const intents = new Map<string, Datum>()
	const roster = new Map<string, Datum>()
	const seen = new Map<string, ReadonlyMap<string, Datum>>()
	const passes = new Set<string>()
	let last: ReadonlyMap<string, Datum> = new Map()
	for (const entry of trace.entries) {
		for (const fact of entry.facts) {
			if (fact._tag === "Spawned" && fact.kind === "Reconcile") {
				passes.add(stepText(fact.step))
			}
			if (fact._tag === "Wrote" && fact.write.relation === "enrollment_intent") {
				intents.set(fact.write.key, fact.write.value)
			}
			if (fact._tag === "Claimed" && passes.has(stepText(fact.step))) {
				seen.set(`${stepText(fact.step)}@${fact.attempt}`, new Map(intents))
			}
			if (fact._tag === "Done" && passes.has(stepText(fact.step))) {
				note("w7-reconciled")
				last = seen.get(`${stepText(fact.step)}@${fact.attempt}`) ?? new Map()
			}
			if (fact._tag === "Wrote" && fact.write.relation === "enrollment") {
				roster.set(fact.write.key, fact.write.value)
			}
		}
	}
	return quiet
		? Arr.flatMap(Arr.fromIterable(last), ([key, value]) =>
				roster.get(key) === value ? [] : [`W7: ${key} is not enrolled as its intent read`]
			)
		: []
}

describe("edullm's eight workloads as den programs, side by side on one ledger, under den's laws", () => {
	it.effect(
		"Timeback, AlphaTest, QTI, Gold, the takedowns, the reports, enrollment and the seed keep every law and their own",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "workloads: edullm",
						draw: drawn((source) => ({
							limits: source.draw(limitsGen),
							world: source.draw(worldGen),
							platform: source.draw(platformGen),
							faults: source.draw(faultsGen([]))
						})),
						coverage: required<Noticed>(
							[
								"claimed",
								"reclaimed",
								"full",
								"behind",
								"stale",
								"held",
								"blocked",
								"timer",
								"read",
								"retired",
								"w1-moved",
								"w1-split",
								"w2-moved",
								"w2-kinds",
								"w3-moved",
								"w3-held",
								"w4-swapped",
								"w4-blocked",
								"w4-stopped",
								"w5-rearmed",
								"w5-hung-up",
								"w6-retried",
								"w6-delivered",
								"w7-reconciled",
								"w8-seeded"
							],
							{ cases: 300, sense: notesOnly }
						),
						runs: 500,
						shrink: 300,
						oracle: {
							kind: "specification",
							name: "den's laws, and each workload's own: cursors move only over work that landed, no present child is hung up, every report is delivered"
						}
					}),
					(scenario, c: Case<Noticed>) =>
						Effect.gen(function* () {
							const { program, acts, horizon } = edullmOf(scenario.limits, scenario.world)
							if (!declares(SOUND, program, scenario.platform.census)) {
								return
							}
							const run = simulate(
								{
									program,
									acts,
									ledger: ledgerOf(SOUND),
									policy: SOUND_POLICY,
									platform: scenario.platform,
									horizon
								},
								natureOf(c, scenario.faults)
							)
							c.noteAll(run.seen)
							yield* holds(LAWS, evidenceOf(run, program))
							const own = ownLaws(run.trace, scenario.limits, scenario.world, run.end, (noticed) =>
								c.note(noticed)
							)
							if (Option.isSome(own)) {
								return yield* own.value
							}
						})
				)
			)
	)
})
