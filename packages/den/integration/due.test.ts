import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName, type Wake } from "@bjornpagen/den/transport"
import type { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, Option, Order } from "effect"
import { TestClock } from "effect/testing"
import { openLedgers, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A step due at the instant its input holds, on PostgreSQL 19 (kinds.ts `dueAt`): each of the clock flow's Sitting
 * roots is requested with the instant its sitting closes at, the database's reading moved by a drawn offset, before it
 * or after it, as carried sittings already past their expiry stand beside fresh ones; its one step, Close, is due at that
 * instant. The suite's clock is moved, never slept, and every reading of the database's clock moves with it.
 *
 * Each admission rings its Close timed to its instant from a reading after the admission, at once for an instant
 * already past; those rings are lost, so the census is the net. Its first tick rings every Close already past, which
 * runs, and none still ahead. Each one ahead, served by hand short of its instant, finds itself not yet due and claims
 * nothing; the tick at its instant rings it, and it runs.
 *
 * Oracle (specification): every Close is spawned due at its input's instant and rung no sooner than its instant from a
 * reading after its admission; one already past runs at the first tick; one ahead is never claimed before its instant
 * and runs at the tick at it.
 */

type Feature = "an instant already past" | "an instant ahead" | "several instants ahead"

/**
 * A sitting's instant, in seconds from the request's reading: past it or ahead of it, by at least two census periods,
 * so a serve short of an instant ahead stands a period and more before it whatever real time the case spends, and by
 * up to a day.
 */
const offsets: Gen<number> = (source) =>
	source.draw(boolean) ? -source.draw(int(120, 86_400)) : source.draw(int(120, 86_400))

/** One to four sittings, each closing at its own instant. */
const sittings: Gen<ReadonlyArray<number>> = array(offsets, { min: 1, max: 4 })

/** How far short of its instant a sitting ahead is served by hand, in seconds: half a census period. */
const shortSeconds = 30

/**
 * Runs each step due at its input's instant at that instant, one already past at the first census tick, and never one
 * before its instant.
 *
 * Budget: provisional, the retry ladders' (8 independent cases and 8 steered), over one to four sittings each past or
 * ahead by up to a day.
 */
export const aStepDueAtItsInputsInstantRunsAtItAndNotBefore = property.explore(sittings, {
	needs: { slice: sliceCase },
	situations: [
		"an instant already past",
		"an instant ahead",
		"several instants ahead"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(drawn) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { clock, ledgers } = yield* openLedgers
						const ledger = clock.ledger
						const flow = FlowName.make("Clock")
						const endsFrom = Effect.map(ledger.now, (at) =>
							instantOf(Number(at) + longestLeaseMillis)
						)
						const opened = yield* ledger.now
						const planned = yield* Effect.forEach(drawn, (offset, index) =>
							Effect.gen(function* () {
								const deadline = instantOf(Number(opened) + offset * 1000)
								const key = `sitting${String(index)}`
								const requested = yield* clock.request.Sitting(key, { sitting: key, deadline })
								const admitting = yield* endsFrom
								const admitted = yield* serve(
									ledgers,
									{ _tag: "Admit", flow, scope: requested.scope },
									admitting
								)
								const spawned =
									admitted.ending.kind === "admitted" ? admitted.ending.spawned.steps : []
								assert.deepEqual(
									Arr.map(spawned, (s) => s.due),
									[{ kind: "at", instant: deadline }],
									"Close is spawned due at the instant its input holds"
								)
								const rung = Arr.map(
									Arr.filter(admitted.onward, (o) => o.wake._tag === "Step"),
									(o) => Duration.toMillis(o.delay)
								)
								assert.ok(
									offset < 0
										? Arr.every(rung, (millis) => millis === 0)
										: Arr.every(rung, (millis) => millis > 0 && millis <= offset * 1000),
									"its admission rings it timed to its instant, at once for one already past"
								)
								const step: Sha256 = Option.getOrThrow(Arr.head(spawned)).step
								return { offset, deadline, step, scope: requested.scope }
							})
						)
						/** A planned sitting's close step, by its key: its root, the sitting's own scope, then the step. */
						const keyOf = (p: (typeof planned)[number]) => ({ root: p.scope, step: p.step })
						const wakeOf = (p: (typeof planned)[number]): Wake => ({
							_tag: "Step",
							flow,
							...keyOf(p),
							attempt: AttemptNumber.make(0)
						})
						const ranOf = (p: (typeof planned)[number]) =>
							Effect.map(ledger.resultOf(keyOf(p)), (outcome) => Option.contains(outcome, "done"))
						yield* tick(ledger)
						yield* drain(ledgers)
						const past = Arr.filter(planned, (p) => p.offset < 0)
						const ahead = Arr.sort(
							Arr.filter(planned, (p) => p.offset > 0),
							Order.mapInput(Order.Number, (p: (typeof planned)[number]) => p.offset)
						)
						if (Arr.isReadonlyArrayNonEmpty(past)) {
							c.note("an instant already past")
						}
						if (Arr.isReadonlyArrayNonEmpty(ahead)) {
							c.note("an instant ahead")
						}
						if (ahead.length > 1) {
							c.note("several instants ahead")
						}
						const pastRan = yield* Effect.forEach(past, ranOf)
						assert.ok(
							Arr.every(pastRan, (ran) => ran),
							"every sitting already past its instant closes at the first census tick"
						)
						const aheadRan = yield* Effect.forEach(ahead, ranOf)
						assert.ok(
							!Arr.some(aheadRan, (ran) => ran),
							"no sitting ahead of its instant closes at the first tick"
						)
						yield* Effect.forEach(ahead, (p) =>
							Effect.gen(function* () {
								const reading = yield* ledger.now
								const short = Number(p.deadline) - shortSeconds * 1000 - Number(reading)
								yield* TestClock.adjust(Duration.millis(Math.max(0, short)))
								const early = yield* endsFrom
								const served = yield* serve(ledgers, wakeOf(p), early)
								assert.deepEqual(
									served.ending.kind === "waiting"
										? { why: served.ending.why, until: served.ending.until }
										: served.ending.kind,
									{ why: "due", until: Option.some(p.deadline) },
									"short of its instant, its wake finds it not yet due"
								)
								const claims = yield* ledger.claimsOf(keyOf(p))
								assert.deepEqual(claims, [], "nothing claimed it before its instant")
								yield* TestClock.adjust(Duration.seconds(shortSeconds))
								yield* tick(ledger)
								yield* drain(ledgers)
								const ran = yield* ranOf(p)
								assert.ok(ran, "the tick at its instant closes it")
							})
						)
						const finished = yield* Effect.forEach(planned, (p) =>
							ledger.finished({ root: p.scope, scope: p.scope })
						)
						assert.ok(Arr.every(finished, (f) => f))
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a step due at its input's instant is spawned due at it and rung timed to it, runs at the first tick once it is past, and never before it"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/bind.ts",
			original: '\t\t\treturn { kind: "at", instant: due.instant(input) }',
			replacement: '\t\t\treturn { kind: "after", delay: atOnce }',
			why: "A step due at its input's instant is due at once: a timed sitting closes the moment it starts, long before its deadline."
		},
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\t\t\tonSome: (at) => delayTo(at, due.instant)",
			replacement: "\t\t\t\tonSome: () => Duration.zero",
			why: "A timed step's spawn rings it at once rather than at its instant: its wake arrives early and costs an invocation that finds it not yet due."
		},
		{
			file: "packages/den/src/runtime/eligible.ts",
			original: "\t\tif (due > now) {",
			replacement: "\t\tif (due !== now) {",
			why: "Past instants never fire: the census rings a step only at its exact instant, so a carried sitting already past its expiry is never closed once its spawn's ring is lost."
		}
	]
})
