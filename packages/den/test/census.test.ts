import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { type Gen, int, oneOf } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Ref } from "effect"
import { TestClock } from "effect/testing"
import { censusPeriodSeconds } from "#algebra/kinds.ts"
import { ringCensus } from "#runtime/census.ts"
import { caseHangMillis } from "#test/support/suites.ts"
import { idempotencyKey, type Ring, Transport } from "#transport.ts"

/**
 * A cron's ring of the census (runtime/census.ts ringCensus) answers what it rang: the census of the period that holds
 * the host's reading, by the instant that period starts, and the idempotency key it sent that ring under, so a host's
 * log of its cron shows one census a period by its key, where it logged nothing it could read.
 *
 * Oracle (specification): the period holding a reading starts at the reading rounded down to a whole census period, and
 * the answer is the one ring sent, its wake's instant and its key. Mutant it kills: answering the reading as the
 * period's instant, `at: CensusInstant.make(millis)`, which no ring was sent for.
 */

type Feature = "at a period's start" | "inside a period"

/** A census period, in milliseconds. */
const periodMillis = censusPeriodSeconds * 1000

/** A reading of the host's clock: a period's start, or an instant inside a period, over some fifty years. */
const readings: Gen<number> = (source) =>
	source.draw(int(0, 27_000_000)) * periodMillis +
	source.draw(oneOf([() => 0, (s) => s.draw(int(1, periodMillis - 1))]))

it.effect("a cron's ring of the census answers the census it sent and its key", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "census ring",
				oracle: {
					kind: "specification",
					name: "the period holding the reading, and the one ring sent, by its instant and key"
				},
				draw: drawn(readings),
				literal: Formatter.format,
				coverage: required<Feature>(["at a period's start", "inside a period"], {
					cases: 40,
					sense: notesOnly
				}),
				kept: [],
				runs: 100,
				shrink: boundedShrink(40),
				steerEvery: 16,
				caseHang: caseHangMillis
			},
			(millis, c) =>
				Effect.gen(function* () {
					c.note(millis % periodMillis === 0 ? "at a period's start" : "inside a period")
					const sent = yield* Ref.make<ReadonlyArray<Ring>>([])
					yield* TestClock.setTime(millis)
					const rung = yield* ringCensus.pipe(
						Effect.provideService(Transport, {
							send: (rings) => Ref.update(sent, (list) => [...list, ...rings])
						})
					)
					const rings = yield* Ref.get(sent)
					assert.strictEqual(rings.length, 1, "it sends one ring")
					assert.deepStrictEqual(
						Arr.map(rings, (ring) => ({ wake: ring.wake, key: idempotencyKey(ring) })),
						[{ wake: { _tag: "Census", at: rung.at }, key: rung.key }],
						"it answers the ring it sent, its census's instant and its key"
					)
					assert.strictEqual(
						rung.at,
						Math.floor(millis / periodMillis) * periodMillis,
						"its census is the period's that holds the reading"
					)
				})
		)
	)
)
