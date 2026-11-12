import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { boolean, characterOf, type Gen, int, string } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Effect, Formatter, Schema, String as Str } from "effect"
import { caseHang } from "#limits.ts"
import { idempotencyKey, WakeSchema } from "#transport.ts"

/**
 * The wake contract: a wake decodes from its encoding as it was, and two wakes share an idempotency key exactly when
 * they are one wake, a lane's name holding a colon or not, since a step's key and an attempt hold none.
 *
 * Oracle (universal): decode ∘ encode = id, and key(a) = key(b) ⇔ a = b.
 */

type Feature = "same wake" | "different wakes" | "a lane with a colon"

const hex = characterOf(["0", "1", "8", "a", "f"])
const group = (length: number) => string(hex, { min: length, max: length })

interface Encoded {
	readonly lane: string
	readonly step: string
	readonly attempt: number
}

const encodedWake: Gen<Encoded> = (source) => ({
	lane: source.draw(string(characterOf(["P", "a", ":", "-"]), { min: 1, max: 4 })),
	step: `${source.draw(group(8))}-${source.draw(group(4))}-8${source.draw(group(3))}-a${source.draw(group(3))}-${source.draw(group(12))}`,
	attempt: source.draw(int(1, 3))
})

it.effect("a wake round-trips, and its idempotency key names it alone", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "wake contract",
				oracle: { kind: "universal", name: "decode ∘ encode = id, and key(a) = key(b) ⇔ a = b" },
				draw: drawn((source): readonly [Encoded, Encoded] => {
					const first = source.draw(encodedWake)
					return [first, source.draw(boolean) ? first : source.draw(encodedWake)]
				}),
				literal: Formatter.format,
				coverage: required<Feature>(["same wake", "different wakes", "a lane with a colon"], {
					cases: 40,
					sense: notesOnly
				}),
				kept: [],
				runs: 200,
				shrink: boundedShrink(40),
				concurrency: 1,
				steerEvery: 16,
				caseHang
			},
			([first, second], c) =>
				Effect.gen(function* () {
					const a = yield* Schema.decodeUnknownEffect(WakeSchema)(first)
					const b = yield* Schema.decodeUnknownEffect(WakeSchema)(second)
					const encoded = yield* Schema.encodeEffect(WakeSchema)(a)
					const decoded = yield* Schema.decodeEffect(WakeSchema)(encoded)
					assert.deepStrictEqual(decoded, a)
					const same = a.lane === b.lane && a.step === b.step && a.attempt === b.attempt
					c.note(same ? "same wake" : "different wakes")
					if (Str.includes(":")(a.lane)) {
						c.note("a lane with a colon")
					}
					assert.strictEqual(idempotencyKey(a) === idempotencyKey(b), same)
				})
		)
	)
)
