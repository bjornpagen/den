import { type Case, drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import {
	array,
	bytes,
	constant,
	type Gen,
	int,
	production,
	subarray,
	weighted
} from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { layer } from "@effect/vitest"
import { Array as Arr, Effect, HashMap, Option, Result } from "effect"
import { Digest } from "effect/crypto"
import { PGCOPY, tuplesOf } from "#copy-binary.ts"
import {
	absentOf,
	differingOf,
	digestOf,
	EVERY_BUCKET,
	markOf,
	printOf,
	settledOf
} from "#fingerprint.ts"
import { halvesOf, type Range, rootPagesOf, widthOf } from "#ranges.ts"
import {
	type Bastion,
	type CopyFailed,
	type Heap,
	type Key,
	makeReplica,
	MEASURED_BASTION,
	pageBodyOf,
	ROW_FIELDS,
	type Row,
	type Session,
	TimebackReplica,
	type Weather,
	type World
} from "#replica.ts"
import { exploration, law } from "#test/support/search.ts"

const RELATION = "assessment_results"

/** A replica, a night's read of it, and what the source changes before the prune. */
type Scenario = Readonly<{
	world: World
	sessions: number
	statementTimeoutMillis: number
	pageBytes: number
	changes: Readonly<{ since: number; before: number }>
	deleted: ReadonlyArray<string>
	inserted: ReadonlyArray<Row>
	fetchKeys: number
}>

type Seen =
	| "copied"
	| "timeout-split"
	| "one-block-refused"
	| "weather-retried"
	| "over-hold"
	| "pruned"
	| "untouched-prune"
	| "changes-read"

const rowGen =
	(key: string): Gen<Row> =>
	(source) => ({
		key,
		payload: source.draw(bytes({ min: 0, max: 40 })),
		changedAt: source.draw(int(0, 100))
	})

/** A bastion slow enough that a page of a few hundred bytes outlasts a timeout of seconds, beside the measured one. */
const SLOW: Bastion = { seats: 2, bytesPerSecond: 100, keysPerSecondPerSession: 2 }

const weatherGen: Gen<Weather> = weighted<Weather>([
	[8, constant({ _tag: "Clear" })],
	[1, constant({ _tag: "Failed", cause: "recovery-conflict" })],
	[1, constant({ _tag: "Failed", cause: "transport" })]
])

const scenarioGen: Gen<Scenario> = (source) => {
	let next = 0
	const heap: Heap = source.draw(
		array(
			(s) =>
				s.draw(
					array(
						(t) => {
							next += 1
							return t.draw(rowGen(`r${String(next)}`))
						},
						{ min: 0, max: 4 }
					)
				),
			{ min: 0, max: 8 }
		)
	)
	const keys = Arr.map(Arr.flatten(heap), (row) => row.key)
	const since = source.draw(int(0, 100))
	return {
		world: {
			relations: HashMap.make([RELATION, heap]),
			bastion: source.draw(production(MEASURED_BASTION, [SLOW])),
			weather: weatherGen
		},
		sessions: source.draw(int(1, 10)),
		statementTimeoutMillis: source.draw(production(540_000, [1000, 3000, 8000])),
		pageBytes: source.draw(int(20, 400)),
		changes: { since, before: since + source.draw(int(0, 50)) },
		deleted: source.draw(subarray(keys)),
		inserted: Array.from({ length: source.draw(int(1, 3)) }, (_, at) =>
			source.draw(rowGen(`new${String(at + 1)}`))
		),
		fetchKeys: source.draw(int(1, 6))
	}
}

/** Runs a statement until its weather lets it end: a retry is an attempt edullm's ladder spends, never a split. */
const throughWeather = <A>(run: () => Effect.Effect<A, CopyFailed>, c: Case<Seen>) =>
	Effect.gen(function* () {
		for (;;) {
			const ended = yield* Effect.result(run())
			if (
				Result.isSuccess(ended) ||
				ended.failure.cause === "statement-timeout" ||
				ended.failure.cause === "undefined-object"
			) {
				return ended
			}
			c.note("weather-retried")
		}
	})

const nightOf = (scenario: Scenario, c: Case<Seen>) =>
	Effect.gen(function* () {
		const replica = yield* TimebackReplica
		const heap = Option.getOrElse(HashMap.get(scenario.world.relations, RELATION), (): Heap => [])
		const session = yield* replica.open(0, scenario.statementTimeoutMillis)
		for (let opened = 1; opened < scenario.sessions; opened += 1) {
			yield* replica.open(0, scenario.statementTimeoutMillis)
		}
		const sharers = Math.max(scenario.world.bastion.seats, scenario.sessions)
		if (scenario.sessions > scenario.world.bastion.seats) {
			c.note("over-hold")
		}
		const catalog = yield* replica.catalog(RELATION, 0)
		let pending: ReadonlyArray<Range> = rootPagesOf(
			{ from: 0, blocks: catalog.blocks, bytesPerBlock: catalog.bytesPerBlock },
			scenario.pageBytes
		)
		let copied = 0
		let refused = 0
		while (Arr.isReadonlyArrayNonEmpty(pending)) {
			const page = Arr.headNonEmpty(pending)
			pending = Arr.tailNonEmpty(pending)
			const rows = Arr.flatten(Arr.take(Arr.drop(heap, page.lo), widthOf(page)))
			const bodyBytes = pageBodyOf(rows).length
			const fits =
				(bodyBytes / (scenario.world.bastion.bytesPerSecond / sharers)) * 1000 <=
				scenario.statementTimeoutMillis
			const ended = yield* throughWeather(
				() => replica.page(session, RELATION, page, Option.none(), 0),
				c
			)
			if (Result.isSuccess(ended)) {
				yield* law(
					"a page answered only within its timeout",
					fits,
					() => `a page of ${String(bodyBytes)} bytes outlasted its timeout and still answered`
				)
				const tuples = tuplesOf(PGCOPY, ROW_FIELDS, ended.success.chunks)
				yield* law(
					"a page holds its blocks' rows",
					Result.isSuccess(tuples) && tuples.success === rows.length,
					() =>
						`page [${String(page.lo)}, ${String(page.hi)}) scanned ${String(tuples)} for ${String(rows.length)} rows`
				)
				c.note("copied")
				copied += rows.length
				continue
			}
			yield* law(
				"a page timed out only past its timeout",
				!fits,
				() => `a page of ${String(bodyBytes)} bytes timed out within its timeout`
			)
			yield* Option.match(halvesOf(page), {
				onNone: () =>
					Effect.sync(() => {
						c.note("one-block-refused")
						refused += rows.length
					}),
				onSome: (halves) =>
					Effect.sync(() => {
						c.note("timeout-split")
						pending = [...halves, ...pending]
					})
			})
		}
		yield* law(
			"every row copied once or held by a refused block",
			copied + refused === Arr.flatten(heap).length,
			() =>
				`copied ${String(copied)} and refused ${String(refused)} of ${String(Arr.flatten(heap).length)} rows`
		)
		return { session, copiedAll: refused === 0 }
	})

const changesOf = (scenario: Scenario, session: Session, c: Case<Seen>) =>
	Effect.gen(function* () {
		const replica = yield* TimebackReplica
		const heap = Option.getOrElse(HashMap.get(scenario.world.relations, RELATION), (): Heap => [])
		const whole: Range = { lo: 0, hi: Math.max(1, heap.length) }
		const ended = yield* throughWeather(
			() => replica.page(session, RELATION, whole, Option.some(scenario.changes), 0),
			c
		)
		if (Result.isFailure(ended)) {
			return
		}
		c.note("changes-read")
		const expected = Arr.filter(
			Arr.flatten(heap),
			(row) => row.changedAt >= scenario.changes.since && row.changedAt < scenario.changes.before
		).length
		const tuples = tuplesOf(PGCOPY, ROW_FIELDS, ended.success.chunks)
		yield* law(
			"a changes read holds the rows changed in its window",
			Result.isSuccess(tuples) && tuples.success === expected,
			() => `the changes read scanned ${String(tuples)} for ${String(expected)} rows`
		)
	})

/** The prune after the source's edits: Silver holds the night's keys, the replica's print drives, bucket keys are fetched. */
const pruneOf = (scenario: Scenario, session: Session, c: Case<Seen>) =>
	Effect.gen(function* () {
		const replica = yield* TimebackReplica
		const heap = Option.getOrElse(HashMap.get(scenario.world.relations, RELATION), (): Heap => [])
		const keyOf = (text: string) =>
			Effect.map(digestOf([text]), (digest): Key => ({ text, mark: markOf(digest) }))
		let silver = yield* Effect.forEach(Arr.flatten(heap), (row) => keyOf(row.key))
		for (const key of scenario.deleted) {
			yield* replica.edit(RELATION, { _tag: "Delete", key })
		}
		for (const row of scenario.inserted) {
			yield* replica.edit(RELATION, { _tag: "Insert", row, newBlock: false })
		}
		const printed = yield* throughWeather(() => replica.print(session, RELATION, 0), c)
		if (Result.isFailure(printed)) {
			return
		}
		const source = printed.success.print
		let pending: ReadonlyArray<Range> = [EVERY_BUCKET]
		while (Arr.isReadonlyArrayNonEmpty(pending)) {
			const range = Arr.headNonEmpty(pending)
			pending = Arr.tailNonEmpty(pending)
			const settled = settledOf(
				differingOf(printOf(Arr.map(silver, (key) => key.mark)), source, range),
				range,
				scenario.fetchKeys
			)
			switch (settled._tag) {
				case "Untouched":
					c.note("untouched-prune")
					break
				case "Split":
					pending = [...settled.halves, ...pending]
					break
				case "Fetch": {
					const fetched = yield* throughWeather(
						() => replica.bucketKeys(session, RELATION, settled.buckets, 0),
						c
					)
					if (Result.isFailure(fetched)) {
						return
					}
					const gone = new Set(
						Arr.map(absentOf(silver, fetched.success.keys, settled.buckets), (key) => key.text)
					)
					if (gone.size > 0) {
						c.note("pruned")
					}
					silver = Arr.filter(silver, (key) => !gone.has(key.text))
				}
			}
		}
		const kept = new Set(Arr.map(silver, (key) => key.text))
		yield* law(
			"the prune deletes what the source deleted",
			Arr.every(scenario.deleted, (key) => !kept.has(key)) &&
				Arr.every(
					Arr.flatten(heap),
					(row) => Arr.contains(scenario.deleted, row.key) || kept.has(row.key)
				),
			() => "Silver kept a deleted key, or lost one the source holds"
		)
	})

layer(Digest.layerWebCrypto)("the Timeback replica", (it) => {
	it.effect(
		"pages answer their blocks within their timeout, split past it, and a print and its bucket keys prune what the source deleted",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "replica: a daily read",
						draw: drawn(scenarioGen),
						coverage: required<Seen>(
							[
								"copied",
								"timeout-split",
								"one-block-refused",
								"weather-retried",
								"over-hold",
								"pruned",
								"untouched-prune",
								"changes-read"
							],
							{ cases: 200, sense: notesOnly }
						),
						runs: 200,
						shrink: 100,
						oracle: {
							kind: "specification",
							name: "binary COPY pages of a heap at the bastion's measured share, and a bucketed-fingerprint prune"
						}
					}),
					(scenario: Scenario, c: Case<Seen>) =>
						Effect.gen(function* () {
							const digest = yield* Digest.Digest
							yield* Effect.gen(function* () {
								const night = yield* nightOf(scenario, c)
								yield* changesOf(scenario, night.session, c)
								yield* pruneOf(scenario, night.session, c)
							}).pipe(
								Effect.provideServiceEffect(
									TimebackReplica,
									makeReplica(scenario.world, c).pipe(Effect.provideService(Digest.Digest, digest))
								)
							)
						})
				)
			)
	)
})
