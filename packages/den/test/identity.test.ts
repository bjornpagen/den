import { Sha256 } from "@bjornpagen/grizzle"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, characterOf, type Gen, string } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter } from "effect"
import {
	edgeScope,
	edgeStep,
	exclusiveId,
	finishStep,
	rootScope,
	startedScope,
	startedStep
} from "#runtime/identity.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * Derived identity: a root's scope is a function of its flow, kind and idempotency key, a spawned step or scope of its
 * parent, edge and ordinal, and an exclusivity seat of its flow, kind and key text, each the SHA-256 of its parts,
 * grizzle's `sha256`, its 32 bytes, so a step run twice spawns onto the same keys and two scopes of one key meet at one
 * seat; and distinct parts derive distinct keys, so no two children of a graph share one. A start's ordinal and an edge's
 * ordinal name one child each, a step or a scope, so a step and a scope derived from the same parts never both exist.
 *
 * Oracle (universal): f(x) = f(x), x ≠ y ⇒ f(x) ≠ f(y), and 32 bytes.
 */

type Feature = "same key" | "different keys"

/** A SHA-256 digest's length: FIPS 180-4's 256 bits. */
const DIGEST_BYTES = 32

const key: Gen<string> = string(characterOf(["a", "b", "-", "0"]), { min: 0, max: 4 })

describe("derived identity", () => {
	it.effect("derives each key from its parts alone, distinct parts apart", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "derived identity",
					oracle: {
						kind: "universal",
						name: "f(x) = f(x), x ≠ y ⇒ f(x) ≠ f(y), and 32 bytes"
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
					steerEvery: 16,
					caseHang: caseHangMillis
				},
				([a, b], c) =>
					Effect.sync(() => {
						c.note(a === b ? "same key" : "different keys")
						const first = rootScope("Flow", "Run", a)
						const again = rootScope("Flow", "Run", a)
						const second = rootScope("Flow", "Run", b)
						assert.isTrue(Sha256.equals(first, again))
						assert.strictEqual(Sha256.equals(first, second), a === b)
						const started = startedStep(first, 0)
						const next = edgeStep(started, "Next", 0)
						const finish = finishStep(first)
						const child = startedScope(first, 0)
						const opened = edgeScope(started, "Next", 0)
						const seat = exclusiveId("Flow", "Run", a)
						const sameSeat = exclusiveId("Flow", "Run", a)
						const otherSeat = exclusiveId("Flow", "Run", b)
						assert.isTrue(Sha256.equals(seat, sameSeat))
						assert.strictEqual(Sha256.equals(seat, otherSeat), a === b)
						const derived = [first, started, next, finish, seat]
						assert.isTrue(
							Arr.every(
								[...derived, child, opened],
								(derivedKey) => derivedKey.length === DIGEST_BYTES
							)
						)
						assert.strictEqual(Arr.dedupeWith(derived, Sha256.equals).length, derived.length)
						const sibling = startedScope(first, 1)
						const further = edgeScope(next, "Next", 0)
						assert.isFalse(Sha256.equals(child, sibling))
						assert.isFalse(Sha256.equals(opened, further))
					})
			)
		)
	)
})
