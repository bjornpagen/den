import { instantOf, type StepKey } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName, type Wake } from "@bjornpagen/den/transport"
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
import { openLedgers, Planted, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A source's named delay on PostgreSQL 19: the Polite step's source refuses its calls for now, each response naming
 * when to call again in its `Retry-After`, as delay-seconds or as an IMF-fixdate beside its `Date`, and then answers.
 * Each refusal's turn is served by hand: its body parses the delay at the boundary and fails with it, `Later`; the turn
 * ends waiting and records its attempt's retry with nothing spent, due that delay past the database's reading in the
 * write that records it, and rings its next attempt after the delay; the suite's clock is moved by the delay before
 * the next attempt is served. Polite's ladder allows one attempt, so a refusal that spent one would fail it.
 *
 * Oracle (specification): each refused attempt ends waiting on its source, its retry unspent and due the stated delay
 * after a reading between the turn's start and end, its next attempt rung no later than that; the step then ends done
 * on its last claim, one more than its refusals, and its root's finish runs.
 */

type Feature = "no refusal" | "delay-seconds" | "an HTTP-date" | "several refusals"

/** A refusal's response: the delay it names in seconds, and whether it names it as a date. */
interface Refusal {
	readonly seconds: number
	readonly dated: boolean
}

const refusals: Gen<ReadonlyArray<Refusal>> = array(
	(source) => ({ seconds: source.draw(int(1, 900)), dated: source.draw(boolean) }),
	{ min: 0, max: 3 }
)

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
 * Waits each delay its source names, spending no attempt, and answers once the source does.
 *
 * Budget: provisional, the retry ladders' (8 independent cases and 8 steered), over up to three refusals.
 */
export const aSourcesNamedDelayIsAWaitThatSpendsNothing = property.explore(refusals, {
	needs: { slice: sliceCase },
	situations: [
		"no refusal",
		"delay-seconds",
		"an HTTP-date",
		"several refusals"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(planned) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						if (Arr.isReadonlyArrayEmpty(planned)) {
							c.note("no refusal")
						}
						if (planned.length > 1) {
							c.note("several refusals")
						}
						const { retry, ledgers } = yield* openLedgers
						const ledger = retry.ledger
						const flow = FlowName.make("Retry")
						const { refusals: planted } = yield* Planted
						const key = "polite"
						const responses: ReadonlyArray<Headers> = Arr.map(planned, responseOf)
						yield* Ref.update(planted, HashMap.set(key, responses))
						const requested = yield* retry.request.Throttled(key, { key })
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
						const step: StepKey = Option.getOrThrow(Arr.head(spawned)).step
						const wakeOf = (attempt: number): Wake => ({
							_tag: "Step",
							flow,
							step,
							attempt: AttemptNumber.make(attempt)
						})
						const travelled = yield* Ref.make(0)
						/** The database's own reading: the ledger's, less what the suite's clock has travelled. */
						const reading = Effect.zipWith(
							ledger.now,
							Ref.get(travelled),
							(at, travel) => Number(at) - travel
						)
						yield* Effect.forEach(planned, (refusal, attempt) =>
							Effect.gen(function* () {
								c.note(refusal.dated ? "an HTTP-date" : "delay-seconds")
								const millis = refusal.seconds * 1000
								const before = yield* reading
								const ends = yield* endsFrom
								const waited = yield* serve(ledgers, wakeOf(attempt), ends)
								const after = yield* reading
								assert.equal(
									waited.ending.kind === "waiting" ? waited.ending.why : waited.ending.kind,
									"later"
								)
								assert.deepEqual(
									Arr.map(waited.onward, (o) => o.wake),
									[wakeOf(attempt + 1)]
								)
								assert.ok(
									Arr.every(waited.onward, (o) => Duration.toMillis(o.delay) <= millis),
									"the next attempt is rung no later than the source's delay"
								)
								const retries = yield* ledger.retriesOf(step)
								const mine = Arr.filter(retries, (r) => r.attempt === BigInt(attempt))
								assert.deepEqual(
									Arr.map(mine, (r) => r.spent),
									[false]
								)
								assert.ok(
									Arr.every(
										mine,
										(r) => Number(r.at) >= before + millis && Number(r.at) <= after + millis
									),
									"the retry is due the source's delay after the write's reading"
								)
								yield* TestClock.adjust(Duration.millis(millis))
								yield* Ref.update(travelled, (t) => t + millis)
							})
						)
						const ends = yield* endsFrom
						const answered = yield* serve(ledgers, wakeOf(planned.length), ends)
						assert.equal(answered.ending.kind, "done")
						yield* ringOnAndDrain(ledgers, answered)
						const claims = yield* ledger.claimsOf(step)
						assert.equal(claims.length, planned.length + 1)
						const outcome = yield* ledger.resultOf(step)
						assert.deepEqual(outcome, Option.some("done" as const))
						const finished = yield* ledger.finished(requested.scope)
						assert.equal(finished, true)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "each refusal a wait due the source's delay with nothing spent, then done on its refusals plus one claims"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original:
				'\t\t\t\treturn { kind: "waited", why: "later", after: failure.after } satisfies Ran',
			replacement: '\t\t\t\treturn { kind: "spent", detail: "later" } satisfies Ran',
			why: "A source's named delay spends the attempt on den's ladder: the one-attempt step is exhausted by its first refusal, and its wait is den's rung, not the source's."
		},
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\t\t\t\t\tdelay: how.after,",
			replacement: "\t\t\t\t\t\tdelay: atOnce,",
			why: "A wait records its retry due at once, whatever delay its source named: the next attempt is due before the source asked to be called again."
		}
	]
})
