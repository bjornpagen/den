import * as g from "@bjornpagen/grizzle"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, characterOf, type Gen, string } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, String as Str } from "effect"
import { derivedKey } from "#runtime/bind.ts"
import {
	edgeScope,
	edgeStep,
	exclusiveId,
	finishStep,
	fingerprintUnder,
	inputDigest,
	inputFingerprint,
	inputScheme,
	rootScope,
	schemeOf,
	startedScope,
	startedStep
} from "#runtime/identity.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * Derived identity: a root's scope is a function of its flow, kind and idempotency key, a spawned step or scope of its
 * parent, edge and ordinal, and an exclusivity seat of its flow, kind and key text, each the SHA-256 of its parts,
 * grizzle's `sha256`, its 32 bytes, so a step run twice spawns onto the same keys and two scopes of one key meet at one
 * seat; and distinct parts derive distinct keys, so no two children of a graph share one. A start's ordinal and an
 * edge's ordinal name one child each, a step or a scope, so a step and a scope derived from the same parts never both
 * exist. A kind's input fingerprint is a function of its heading's text under the running den's input digest scheme,
 * and a request's input digest of its flow, kind and input texts, each text framed by its length; a digest's scheme is
 * what it answers over a fixed probe, so a digest that answers otherwise has another scheme, and every fingerprint with
 * it. A derived root's key text is its key's fields' names and texts, each framed, by the fields' names
 * (runtime/bind.ts derivedKey), so two keys share a text exactly where they are equal, a key's parts moved between its
 * fields among them, and a struct that only reorders its fields keeps its text.
 *
 * Oracle (universal): f(x) = f(x), x ≠ y ⇒ f(x) ≠ f(y), and 32 bytes. Mutant it kills: a derived key's texts joined
 * unframed, `derivedKey = (fields, key) => Arr.join(Arr.map(fields, (f) => String(key[f])), "")`; the fields taken in
 * their struct's order.
 */

type Feature = "same key" | "different keys"

/**
 * den's input digest scheme, stated: the known answer of its inputDigest over its probe (runtime/identity.ts
 * schemeOf), fixed in advance, so a den that changes its digest or its probe, which changes every fingerprint and so
 * stops comparing every key requested before it with what it is requested with again, is seen to and must mean it.
 */
const INPUT_SCHEME = "024fd7dbc3ed4905e537f080e5aa555e6b8cf29f89ad4ebb5b7ea4e984c799d0"

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
						assert.isTrue(g.Sha256.equals(first, again))
						assert.strictEqual(g.Sha256.equals(first, second), a === b)
						const started = startedStep(first, 0)
						const next = edgeStep(started, "Next", 0)
						const finish = finishStep(first)
						const child = startedScope(first, 0)
						const opened = edgeScope(started, "Next", 0)
						const keyed = derivedKey(["at", "member"], { at: a, member: b })
						assert.strictEqual(keyed, derivedKey(["at", "member"], { at: a, member: b }))
						assert.strictEqual(
							keyed,
							derivedKey(["member", "at"], { at: a, member: b }),
							"a derived key's text is its fields' by their names, whatever order its struct declares them in"
						)
						assert.strictEqual(
							keyed === derivedKey(["at", "member"], { at: b, member: a }),
							a === b,
							"a derived key's text names its fields' values in its fields' order"
						)
						assert.strictEqual(
							keyed === derivedKey(["at", "member"], { at: `${a}${b}`, member: "" }),
							b === "",
							"a derived key's text keeps its fields apart"
						)
						const seat = exclusiveId("Flow", "Run", a)
						const sameSeat = exclusiveId("Flow", "Run", a)
						const otherSeat = exclusiveId("Flow", "Run", b)
						assert.isTrue(g.Sha256.equals(seat, sameSeat))
						assert.strictEqual(g.Sha256.equals(seat, otherSeat), a === b)
						const heading = inputFingerprint(a)
						assert.isTrue(g.Sha256.equals(heading, inputFingerprint(a)))
						assert.strictEqual(g.Sha256.equals(heading, inputFingerprint(b)), a === b)
						assert.isTrue(
							g.Sha256.equals(heading, fingerprintUnder(inputScheme, a)),
							"a fingerprint is under the running den's input digest scheme"
						)
						/**
						 * Digests that answer apart from den's, each named by what it does and each its own scheme: some on every
						 * probe (a text appended, flow and kind swapped), some on one class of probe alone.
						 */
						const others = [
							[
								"a text appended",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(flow, kind, [...texts, a])
							],
							[
								"flow and kind swapped",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(kind, flow, texts)
							],
							[
								"texts joined",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(flow, kind, [Arr.join(texts, "")])
							],
							[
								"empty texts dropped",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(
										flow,
										kind,
										Arr.filter(texts, (text) => text !== "")
									)
							],
							[
								"NUL dropped",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(flow, kind, Arr.map(texts, Str.replaceAll("\u0000", "")))
							],
							[
								"case folded",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(flow, kind, Arr.map(texts, Str.toLowerCase))
							],
							[
								"texts normalized",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(flow, kind, Arr.map(texts, Str.normalize("NFC")))
							],
							[
								"a character outside the BMP changed",
								(flow: string, kind: string, texts: ReadonlyArray<string>) =>
									inputDigest(flow, kind, Arr.map(texts, Str.replaceAll("\u{1F600}", "\u{1F601}")))
							]
						] as const
						assert.strictEqual(
							inputScheme,
							schemeOf(inputDigest),
							"the running den's scheme is its digest's"
						)
						Arr.forEach(others, ([what, other]) =>
							assert.notStrictEqual(
								schemeOf(other),
								inputScheme,
								`a digest with ${what} has another scheme`
							)
						)
						assert.isFalse(
							g.Sha256.equals(
								fingerprintUnder(inputScheme, a),
								fingerprintUnder(schemeOf(Arr.getUnsafe(others, 0)[1]), a)
							),
							"two schemes fingerprint one heading apart"
						)
						assert.strictEqual(
							inputScheme,
							INPUT_SCHEME,
							"den's input digest scheme is the one it states: a den that changes it changes every fingerprint, which it must mean"
						)
						const digest = inputDigest("Flow", "Run", [a])
						assert.isTrue(g.Sha256.equals(digest, inputDigest("Flow", "Run", [a])))
						assert.strictEqual(g.Sha256.equals(digest, inputDigest("Flow", "Run", [b])), a === b)
						assert.isFalse(
							g.Sha256.equals(
								inputDigest("Flow", "Run", [`${a}\u0000${b}`]),
								inputDigest("Flow", "Run", [a, b])
							),
							"each text is framed by its length, so no text's characters move a boundary"
						)
						const derived = [first, started, next, finish, seat, heading, digest]
						assert.isTrue(
							Arr.every([...derived, child, opened], (id) => id.length === DIGEST_BYTES)
						)
						assert.strictEqual(Arr.dedupeWith(derived, g.Sha256.equals).length, derived.length)
						const sibling = startedScope(first, 1)
						const further = edgeScope(next, "Next", 0)
						assert.isFalse(g.Sha256.equals(child, sibling))
						assert.isFalse(g.Sha256.equals(opened, further))
					})
			)
		)
	)
})
