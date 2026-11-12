import { drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { boolean, characterOf, type Gen, string } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { boundedShrink } from "@den/testing/shrink"
import { searched } from "@den/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { regex } from "arkregex"
import { Effect, Formatter } from "effect"
import { Digest } from "effect/crypto"
import { caseHang } from "#limits.ts"
import { edgeStep, finishStep, rootScope, startedStep } from "#runtime/identity.ts"

/**
 * Derived identity: a root's scope is a function of its flow, kind and idempotency key, and a spawned step of its
 * parent, edge and ordinal, each a version 8 uuid, so a step run twice spawns onto the same keys; and distinct parts
 * derive distinct keys, so no two children of a graph share one.
 *
 * Oracle (universal): f(x) = f(x), x ≠ y ⇒ f(x) ≠ f(y), and RFC 9562's version 8 layout.
 */

type Feature = "same key" | "different keys"

const UUID_V8 = regex("^[0-9a-f]{8}-[0-9a-f]{4}-8[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$")

const key: Gen<string> = string(characterOf(["a", "b", "-", "0"]), { min: 0, max: 4 })

layer(Digest.layerWebCrypto)("derived identity", (it) => {
	it.effect("derives each key from its parts alone, distinct parts apart", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "derived identity",
					oracle: {
						kind: "universal",
						name: "f(x) = f(x), x ≠ y ⇒ f(x) ≠ f(y), and the version 8 layout"
					},
					draw: drawn((source): readonly [string, string] => {
						const first = source.draw(key)
						return [first, source.draw(boolean) ? first : source.draw(key)]
					}),
					literal: Formatter.format,
					coverage: required<Feature>(["same key", "different keys"], {
						cases: 40,
						sense: notesOnly
					}),
					kept: [],
					runs: 100,
					shrink: boundedShrink(40),
					concurrency: 1,
					steerEvery: 16,
					caseHang
				},
				([a, b], c) =>
					Effect.gen(function* () {
						c.note(a === b ? "same key" : "different keys")
						const first = yield* rootScope("Flow", "Run", a)
						const again = yield* rootScope("Flow", "Run", a)
						const second = yield* rootScope("Flow", "Run", b)
						assert.strictEqual(first, again)
						assert.strictEqual(first === second, a === b)
						const started = yield* startedStep(first, 0)
						const next = yield* edgeStep(started, "Next", 0)
						const finish = yield* finishStep(first)
						for (const derived of [first, started, next, finish]) {
							assert.isTrue(UUID_V8.test(derived))
						}
						assert.notStrictEqual(started, next)
						assert.notStrictEqual(started, finish)
					})
			)
		)
	)
})
