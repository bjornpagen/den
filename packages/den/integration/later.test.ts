import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName, type Wake } from "@bjornpagen/den/transport"
import { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { array, boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import {
	Array as Arr,
	DateTime,
	Duration,
	Effect,
	HashMap,
	Option,
	Ref,
	String as Str
} from "effect"
import { TestClock } from "effect/testing"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, Planted, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A source's named delay on PostgreSQL 19: the Patient step's source refuses its calls for now, each response naming
 * when to call again in its `Retry-After`, as delay-seconds or as an IMF-fixdate beside its `Date`, and then answers.
 * Each refusal's turn is served by hand: its body parses the delay at the boundary and fails with it, `Later`; the turn
 * ends waiting and records its attempt's retry as a wait on its source, nothing spent, due that delay past the
 * database's reading in the write that records it, and rings its next attempt after the delay; the suite's clock is
 * moved by the delay before the next attempt is served. Patient is never tried again after a spent attempt, so a
 * refusal that spent one would fail it, and it waits on its source until the source settles: however often it refuses,
 * each refusal is a wait, and the step ends done once its source answers. The Polite step, the same call, does not wait
 * on its source: its source's first refusal fails it, recorded as exhausted, and its root's finish reads it failed.
 *
 * Oracle (specification): each refusal of the patient step's source ends waiting on its source, its retry a wait on its
 * source due the stated delay after a reading between the turn's start and end, its next attempt rung no later than
 * that; the step then ends done on its last claim, one more than its refusals, with exactly its refusals recorded as
 * waits on its source; the polite step ends done on its one claim where its source answers at once, and otherwise
 * failed and exhausted at the first refusal on that claim; and each root's finish records what it read, answered or
 * not.
 */

type Feature =
	| "no refusal"
	| "delay-seconds"
	| "an HTTP-date"
	| "several refusals"
	| "refused where it does not wait"

/** A refusal's response: the delay it names in seconds, and whether it names it as a date. */
interface Refusal {
	readonly seconds: number
	readonly dated: boolean
}

const drawnRefusal: Gen<Refusal> = (source) => ({
	seconds: source.draw(int(1, 900)),
	dated: source.draw(boolean)
})

/** Which step a run calls its source from, and the refusals its source plants. */
interface Run {
	/** The patient step, which waits until its source settles, or the polite one, which does not wait. */
	readonly patient: boolean
	readonly refusals: ReadonlyArray<Refusal>
}

const runs: Gen<Run> = (source) => ({
	patient: source.draw(boolean),
	refusals: source.draw(array(drawnRefusal, { min: 0, max: 4 }))
})

const DAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"] as const
const MONTHS = [
	"Jan",
	"Feb",
	"Mar",
	"Apr",
	"May",
	"Jun",
	"Jul",
	"Aug",
	"Sep",
	"Oct",
	"Nov",
	"Dec"
] as const

const two = (n: number): string => Str.padStart(2, "0")(String(n))

/** An instant's IMF-fixdate, spelled from its UTC parts. */
const imf = (seconds: number): string => {
	const p = DateTime.toPartsUtc(DateTime.makeUnsafe(seconds * 1000))
	return `${DAYS[p.weekDay]}, ${two(p.day)} ${MONTHS[p.month - 1]} ${String(p.year)} ${two(p.hour)}:${two(p.minute)}:${two(p.second)} GMT`
}

/**
 * The instant the source's responses are dated, in seconds since the epoch: its clock is its own, so any instant
 * serves.
 */
const sourceClock = 1_800_000_000

/** A refusal's response, naming its delay as it is drawn. */
const responseOf = (refusal: Refusal): Headers =>
	new Headers(
		refusal.dated
			? { "retry-after": imf(sourceClock + refusal.seconds), date: imf(sourceClock) }
			: { "retry-after": String(refusal.seconds) }
	)

/**
 * Waits each delay its source names, spending no attempt, until the source answers, or fails at the source's first
 * refusal where the step does not wait.
 *
 * Budget: provisional, the retry ladders' (8 independent cases and 8 steered), over up to four refusals.
 */
export const aSourcesNamedDelayIsAWaitThatSpendsNothingUntilItSettles = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"no refusal",
		"delay-seconds",
		"an HTTP-date",
		"several refusals",
		"refused where it does not wait"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const planned = run.refusals
						if (Arr.isReadonlyArrayEmpty(planned)) {
							c.note("no refusal")
						}
						if (run.patient && planned.length > 1) {
							c.note("several refusals")
						}
						const { retry, ledgers } = yield* openLedgers
						const ledger = retry.ledger
						const flow = FlowName.make("Retry")
						const { refusals: planted } = yield* Planted
						const key = run.patient ? "patient" : "polite"
						const responses: ReadonlyArray<Headers> = Arr.map(planned, responseOf)
						yield* Ref.update(planted, HashMap.set(key, responses))
						const requested = yield* run.patient
							? retry.request.Unhurried(key, { key })
							: retry.request.Throttled(key, { key })
						const endsFrom = Effect.map(ledger.now, (at) =>
							instantOf(Number(at) + longestLeaseMillis)
						)
						const opening = yield* endsFrom
						const admitted = yield* serve(
							ledgers,
							{ _tag: "Admit", flow, scope: requested.scope },
							opening
						)
						const spawned = admitted.ending.kind === "admitted" ? admitted.ending.spawned.steps : []
						assert.equal(spawned.length, 1)
						const step: Sha256 = Option.getOrThrow(Arr.head(spawned)).step
						const wakeOf = (attempt: number): Wake => ({
							_tag: "Step",
							flow,
							step,
							attempt: AttemptNumber.make(attempt)
						})
						/**
						 * The database's reading, the one every call of the case reads, the retry's write among them: moved on by
						 * what the suite's clock has travelled.
						 */
						const reading = Effect.map(ledger.now, Number)
						const waited = run.patient ? planned : []
						yield* Effect.forEach(waited, (refusal, attempt) =>
							Effect.gen(function* () {
								c.note(refusal.dated ? "an HTTP-date" : "delay-seconds")
								const millis = refusal.seconds * 1000
								const before = yield* reading
								const ends = yield* endsFrom
								const turn = yield* serve(ledgers, wakeOf(attempt), ends)
								const after = yield* reading
								assert.equal(
									turn.ending.kind === "waiting" ? turn.ending.why : turn.ending.kind,
									"later"
								)
								assert.deepEqual(
									Arr.map(turn.onward, (o) => o.wake),
									[wakeOf(attempt + 1)]
								)
								assert.ok(
									Arr.every(turn.onward, (o) => Duration.toMillis(o.delay) <= millis),
									"the next attempt is rung no later than the source's delay"
								)
								const retries = yield* ledger.retriesOf(step)
								const mine = Arr.filter(retries, (r) => r.attempt === BigInt(attempt))
								assert.deepEqual(
									Arr.map(mine, (r) => r.why),
									["later"]
								)
								assert.ok(
									Arr.every(
										mine,
										(r) => Number(r.at) >= before + millis && Number(r.at) <= after + millis
									),
									"the retry is due the source's delay after the write's reading"
								)
								yield* TestClock.adjust(Duration.millis(millis))
							})
						)
						const past = !run.patient && Arr.isReadonlyArrayNonEmpty(planned)
						if (past) {
							c.note("refused where it does not wait")
						}
						const ends = yield* endsFrom
						const last = yield* serve(ledgers, wakeOf(waited.length), ends)
						assert.deepEqual(
							last.ending.kind === "failed" ? `failed by its ${last.ending.why}` : last.ending.kind,
							past ? "failed by its waits" : "done"
						)
						yield* ringOnAndDrain(ledgers, last)
						const claims = yield* ledger.claimsOf(step)
						assert.equal(claims.length, waited.length + 1)
						const waits = yield* ledger.retriesOf(step)
						assert.equal(
							Arr.filter(waits, (r) => r.why === "later").length,
							waited.length,
							"each refusal it waited on is one wait on its source, and nothing else is"
						)
						const outcome = yield* ledger.resultOf(step)
						assert.deepEqual(outcome, Option.some(past ? ("failed" as const) : ("done" as const)))
						const app = yield* openAuditor
						const exhausted = yield* rows(
							app.workload.retryExhausted.once({ params: {}, facts: {} })
						)
						assert.equal(
							Arr.some(exhausted, (row) => Sha256.equals(row.step, step)),
							past
						)
						const finished = yield* ledger.finished(requested.scope)
						assert.equal(finished, true)
						const heard = yield* rows(app.workload.heard.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(
								Arr.filter(heard, (row) => row.key === key),
								(row) => row.answered
							),
							[!past]
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "each refusal of a step that waits a wait due the source's delay with nothing spent, then done on its refusals plus one claims with each refusal one wait; a step that does not wait failed at its first refusal"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original:
				'\t\t\t\treturn { kind: "waited", why: "later", after: failure.after } satisfies Ran',
			replacement: '\t\t\t\treturn { kind: "spent", detail: "later" } satisfies Ran',
			why: "A source's named delay spends the attempt on den's ladder: the patient step, never tried again, is exhausted by its first refusal, and its wait is den's rung, not the source's."
		},
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\t\t\t\t\tdelay: how.after,",
			replacement: "\t\t\t\t\t\tdelay: atOnce,",
			why: "A wait records its retry due at once, whatever delay its source named: the next attempt is due before the source asked to be called again."
		},
		{
			file: "packages/den/src/runtime/turn.ts",
			original: '\t\t\t\tif (how.why === "later" && !goesAgain(runner.waits)) {',
			replacement: "\t\t\t\tif (false) {",
			why: "Every step waits on its source: the polite step, which does not wait, waits on its refusal, never fails, and its finish never reads it failed."
		},
		{
			file: "packages/den/src/algebra/kinds.ts",
			original: 'export const goesAgain = (again: Again): boolean => again.kind === "untilSettled"',
			replacement: "export const goesAgain = (again: Again): boolean => false",
			why: "A step that waits until its source settles does not wait: its first refusal fails it, so a write its source asked to retry later is dropped."
		},
		{
			file: "packages/den/src/algebra/kinds.ts",
			original: 'export const goesAgain = (again: Again): boolean => again.kind === "untilSettled"',
			replacement: "export const goesAgain = (again: Again): boolean => true",
			why: "A step that does not wait on its source waits until it settles: the polite step's refusal is a wait, and it ends done where it should have failed."
		}
	]
})
