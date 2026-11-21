import { nextCensus } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { InProcess, Transport } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, Ref } from "effect"
import { TestClock } from "effect/testing"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * The census as a wake, on PostgreSQL 19: an operator requests a chain root and no one rings its admission, as when a
 * ring is lost; a census wake is rung and the in-process transport drained, with no cron and no relay. Its turn ticks
 * every flow and rings what each found due, the lost admission among them, which the invocation runs itself, so the
 * chain runs to its finish; and it rings the next period's census, held until that period starts. The suite's clock is
 * moved to it and the transport drained again, periods on end: each census rings the next, a chain.
 *
 * Oracle (specification): the chain finishes from the census's ring alone, its feed's cursor at its last page; after
 * each census exactly one census wake is held, the next period's, at its start; and each period's census runs once.
 */

type Feature = "news" | "sport" | "a census chain"

interface Run {
	readonly feed: "news" | "sport"
	readonly pages: number
	readonly periods: number
}

const runs: Gen<Run> = (source) => ({
	feed: source.draw(element(["news", "sport"])),
	pages: source.draw(int(1, 3)),
	periods: source.draw(int(1, 3))
})

/**
 * Heals a lost admission from a census wake, which rings the next period's census, period after period.
 *
 * Budget: provisional, the census suite's (8 independent cases and 8 steered), over one to three periods.
 */
export const aCensusWakeTicksEveryFlowAndRingsTheNextPeriods = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: ["news", "sport", "a census chain"] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.feed)
						const { chain, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const { held } = yield* InProcess
						const transport = yield* Transport
						yield* chain.request.ChainRun(`lost-${run.feed}`, {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						const reading = yield* chain.ledger.now
						const first = nextCensus(Number(reading)).wake
						yield* transport.send([
							{ wake: first, delay: Duration.zero, cause: { _tag: "Census", at: first.at } }
						])
						const censuses = yield* Effect.forEach(Array.from({ length: run.periods }), () =>
							Effect.gen(function* () {
								const endings = yield* drain(ledgers)
								const left = yield* Ref.get(held)
								assert.deepEqual(
									Arr.map(left, (h) => h.wake._tag),
									["Census"]
								)
								yield* TestClock.adjust(Duration.seconds(60))
								return Arr.filter(endings, (ending) => ending.kind === "censused").length
							})
						)
						if (run.periods > 1) {
							c.note("a census chain")
						}
						assert.deepEqual(
							censuses,
							Arr.map(Array.from({ length: run.periods }), () => 1)
						)
						const cursors = yield* rows(app.workload.cursors.once({ params: {}, facts: {} }))
						assert.deepEqual(
							Arr.map(
								Arr.filter(cursors, (cursor) => cursor.feed === run.feed),
								(cursor) => cursor.position
							),
							[BigInt(run.pages - 1)],
							"the chain ran to its finish from the census's ring, which moved the feed's cursor: an app row, which a later census's retirement of the finished graph keeps"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a lost admission healed by a census wake alone, which holds exactly the next period's census, once a period"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\t\t\t\tdone.next\n",
			replacement: "",
			why: "A census rings no next period's census: the chain stops after one period, and with no cron nothing ticks again."
		},
		{
			file: "packages/den/src/runtime/turn.ts",
			original:
				"\t\t\t\t\t...Arr.map(done.due, (due): Onward => ({ wake: due, delay: Duration.zero })),\n",
			replacement: "",
			why: "A census rings nothing it found due: the lost admission is never rung, and the chain never starts."
		}
	]
})
