import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import {
	boolean,
	characterOf,
	element,
	type Gen,
	int,
	string,
	weighted
} from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { caseHangMillis } from "@den/limits/suites"
import { assert, it } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, HashSet, Schema, String as Str } from "effect"
import { type Cause, idempotencyKey, WakeSchema } from "#transport.ts"

/**
 * The wake contract: a wake, a step's attempt or a scope's admission, decodes from its encoding as it was; a ring's
 * idempotency key names its wake and its cause, so two rings share one exactly when both their wakes and their causes
 * are one; and a transport that drops a send whose key it has seen (Vercel Queues' deduplication) drops a ring repeated
 * for the same cause and delivers the same wake rung again by a later cause, whatever became of the first.
 *
 * Oracle (universal): decode ∘ encode = id; key(a) = key(b) ⇔ a = b, the equality written field by field apart from the
 * key; and the deduplicating transport's model, a set of the keys it has seen.
 */

const hex = characterOf(["0", "1", "8", "a", "f"])
const group = (length: number) => string(hex, { min: length, max: length })
const uuid: Gen<string> = (source) =>
	`${source.draw(group(8))}-${source.draw(group(4))}-8${source.draw(group(3))}-a${source.draw(group(3))}-${source.draw(group(12))}`

/** A wake as it travels, before it is decoded. */
type Encoded =
	| {
			readonly _tag: "Step"
			readonly flow: string
			readonly step: string
			readonly attempt: number
	  }
	| { readonly _tag: "Admit"; readonly flow: string; readonly scope: string }

const flowName: Gen<string> = string(characterOf(["P", "a", ":", "-"]), { min: 1, max: 4 })

const encodedIn =
	(flow: string): Gen<Encoded> =>
	(source) =>
		source.draw(boolean)
			? { _tag: "Step", flow, step: source.draw(uuid), attempt: source.draw(int(1, 3)) }
			: { _tag: "Admit", flow, scope: source.draw(uuid) }

const encodedWake: Gen<Encoded> = (source) => source.draw(encodedIn(source.draw(flowName)))

const decoded = (encoded: Encoded) => Schema.decodeUnknownEffect(WakeSchema)(encoded)

/** A cause of a ring of a wake of `flow`, a turn's by a wake of the same flow, since a turn rings its own flow's wakes. */
type CauseSketch =
	| { readonly _tag: "Turn"; readonly by: Encoded; readonly at: number }
	| { readonly _tag: "Relay"; readonly position: string }
	| { readonly _tag: "Census"; readonly at: number }
	| { readonly _tag: "Start"; readonly at: number }

const causeIn = (flow: string): Gen<CauseSketch> =>
	weighted<CauseSketch>([
		[
			1,
			(source) => ({ _tag: "Turn", by: source.draw(encodedIn(flow)), at: source.draw(int(0, 3)) })
		],
		[1, (source) => ({ _tag: "Relay", position: source.draw(string(hex, { min: 1, max: 3 })) })],
		[1, (source) => ({ _tag: "Census", at: source.draw(int(0, 3)) })],
		[1, (source) => ({ _tag: "Start", at: source.draw(int(0, 3)) })]
	])

const causeOf = (sketch: CauseSketch) =>
	sketch._tag === "Turn"
		? Effect.map(decoded(sketch.by), (by): Cause => ({ _tag: "Turn", by, at: sketch.at }))
		: Effect.succeed<Cause>(sketch)

/** Two wakes are one when they ring the same thing of the same flow. */
const sameWake = (a: Encoded, b: Encoded): boolean =>
	a._tag === "Step" && b._tag === "Step"
		? a.flow === b.flow && a.step === b.step && a.attempt === b.attempt
		: a._tag === "Admit" && b._tag === "Admit"
			? a.flow === b.flow && a.scope === b.scope
			: false

/** Two causes are one when they are of one kind with the same fields. */
const sameCause = (a: CauseSketch, b: CauseSketch): boolean => {
	switch (a._tag) {
		case "Turn":
			return b._tag === "Turn" && sameWake(a.by, b.by) && a.at === b.at
		case "Relay":
			return b._tag === "Relay" && a.position === b.position
		case "Census":
			return b._tag === "Census" && a.at === b.at
		case "Start":
			return b._tag === "Start" && a.at === b.at
	}
}

interface RingSketch {
	readonly wake: Encoded
	readonly cause: CauseSketch
}

const ringSketch: Gen<RingSketch> = (source) => {
	const wake = source.draw(encodedWake)
	return { wake, cause: source.draw(causeIn(wake.flow)) }
}

type KeyFeature =
	| "same ring"
	| "different wakes"
	| "one wake, different causes"
	| "a flow with a colon"
	| "an admission"
	| "a turn's cause"

it.effect("a wake round-trips, and a ring's key names its wake and its cause", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "wake contract",
				oracle: {
					kind: "universal",
					name: "decode ∘ encode = id, and key(a) = key(b) ⇔ wake and cause are one"
				},
				draw: drawn((source): readonly [RingSketch, RingSketch] => {
					const first = source.draw(ringSketch)
					const second = source.draw(
						weighted<RingSketch>([
							[1, () => first],
							[1, ringSketch],
							[1, (s) => ({ wake: first.wake, cause: s.draw(causeIn(first.wake.flow)) })]
						])
					)
					return [first, second]
				}),
				literal: Formatter.format,
				coverage: required<KeyFeature>(
					[
						"same ring",
						"different wakes",
						"one wake, different causes",
						"a flow with a colon",
						"an admission",
						"a turn's cause"
					],
					{ cases: 60, sense: notesOnly }
				),
				kept: [],
				runs: 300,
				shrink: boundedShrink(40),
				steerEvery: 16,
				caseHang: caseHangMillis.value
			},
			([first, second], c) =>
				Effect.gen(function* () {
					const a = yield* decoded(first.wake)
					const b = yield* decoded(second.wake)
					const encoded = yield* Schema.encodeEffect(WakeSchema)(a)
					const back = yield* Schema.decodeEffect(WakeSchema)(encoded)
					assert.deepStrictEqual(back, a)
					const wakes = sameWake(first.wake, second.wake)
					const causes = sameCause(first.cause, second.cause)
					c.note(
						wakes && causes ? "same ring" : wakes ? "one wake, different causes" : "different wakes"
					)
					if (Str.includes(":")(first.wake.flow)) {
						c.note("a flow with a colon")
					}
					if (first.wake._tag === "Admit") {
						c.note("an admission")
					}
					if (first.cause._tag === "Turn") {
						c.note("a turn's cause")
					}
					const keyA = idempotencyKey({ wake: a, cause: yield* causeOf(first.cause) })
					const keyB = idempotencyKey({ wake: b, cause: yield* causeOf(second.cause) })
					assert.strictEqual(keyA === keyB, wakes && causes)
				})
		)
	)
)

/** How the second cause follows the first: a later tick, a later turn, another committed state, or another kind. */
const Later = Schema.Literals([
	"a later census tick",
	"a later turn",
	"another relay position",
	"another kind of cause"
])
type Later = typeof Later.Type

const kinds = ["Turn", "Relay", "Census", "Start"] as const satisfies ReadonlyArray<
	CauseSketch["_tag"]
>

/** A cause that follows `first` for a wake of `flow`, as `how` says: never the same cause. */
const laterCause =
	(flow: string, first: CauseSketch, how: Later): Gen<CauseSketch> =>
	(source) => {
		const step = source.draw(int(1, 3))
		switch (how) {
			case "a later census tick":
				return { _tag: "Census", at: (first._tag === "Census" ? first.at : 0) + step }
			case "a later turn":
				return {
					_tag: "Turn",
					by: first._tag === "Turn" ? first.by : source.draw(encodedIn(flow)),
					at: (first._tag === "Turn" ? first.at : 0) + step
				}
			case "another relay position":
				return {
					_tag: "Relay",
					position: `${first._tag === "Relay" ? first.position : ""}${source.draw(string(hex, { min: 1, max: 2 }))}`
				}
			case "another kind of cause": {
				const other = Arr.filter(kinds, (k) => k !== first._tag)
				const at = source.draw(int(0, 3))
				switch (Arr.getUnsafe(other, source.draw(int(0, other.length - 1)))) {
					case "Turn":
						return { _tag: "Turn", by: source.draw(encodedIn(flow)), at }
					case "Relay":
						return { _tag: "Relay", position: source.draw(string(hex, { min: 1, max: 3 })) }
					case "Census":
						return { _tag: "Census", at }
					case "Start":
						return { _tag: "Start", at }
				}
			}
		}
	}

type DeliveryFeature = Later | "other rings between"

interface Rerung {
	readonly wake: Encoded
	readonly first: CauseSketch
	readonly later: CauseSketch
	readonly how: Later
	readonly between: ReadonlyArray<RingSketch>
}

const rerung: Gen<Rerung> = (source) => {
	const wake = source.draw(encodedWake)
	const first = source.draw(causeIn(wake.flow))
	const how = source.draw(element(Later.literals))
	const between = Array.from({ length: source.draw(int(1, 3)) }, () => source.draw(ringSketch))
	return {
		wake,
		first,
		later: source.draw(laterCause(wake.flow, first, how)),
		how,
		between: source.draw(boolean) ? between : []
	}
}

/** A transport that drops a send whose key it has seen, as Vercel Queues does within its deduplication window. */
interface Deduplicating {
	readonly seen: HashSet.HashSet<string>
	readonly delivered: ReadonlyArray<string>
}

const sendTo = (transport: Deduplicating, key: string): Deduplicating =>
	HashSet.has(transport.seen, key)
		? transport
		: { seen: HashSet.add(transport.seen, key), delivered: [...transport.delivered, key] }

it.effect(
	"a ring repeated for its cause is dropped, and its wake rung again by a later cause is delivered",
	(ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "rung again",
					oracle: {
						kind: "universal",
						name: "a deduplicating transport, a set of the keys it has seen, delivers every new cause's ring"
					},
					draw: drawn(rerung),
					literal: Formatter.format,
					coverage: required<DeliveryFeature>([...Later.literals, "other rings between"], {
						cases: 40,
						sense: notesOnly
					}),
					kept: [],
					runs: 200,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang: caseHangMillis.value
				},
				(r, c) =>
					Effect.gen(function* () {
						c.note(r.how)
						if (Arr.isReadonlyArrayNonEmpty(r.between)) {
							c.note("other rings between")
						}
						assert.isFalse(sameCause(r.first, r.later))
						const wake = yield* decoded(r.wake)
						const keyOf = (cause: CauseSketch) =>
							Effect.map(causeOf(cause), (decodedCause) =>
								idempotencyKey({ wake, cause: decodedCause })
							)
						const firstKey = yield* keyOf(r.first)
						const laterKey = yield* keyOf(r.later)
						const others = yield* Effect.forEach(r.between, (ring) =>
							Effect.flatMap(decoded(ring.wake), (w) =>
								Effect.map(causeOf(ring.cause), (cause) => idempotencyKey({ wake: w, cause }))
							)
						)
						const empty: Deduplicating = { seen: HashSet.empty(), delivered: [] }
						const afterFirst = sendTo(empty, firstKey)
						const repeated = sendTo(Arr.reduce(others, afterFirst, sendTo), firstKey)
						assert.strictEqual(
							Arr.filter(repeated.delivered, (k) => k === firstKey).length,
							1,
							"a ring repeated for its cause is dropped"
						)
						const afterLater = sendTo(repeated, laterKey)
						assert.isTrue(
							Arr.contains(afterLater.delivered, laterKey),
							"the later cause's ring is delivered"
						)
						assert.strictEqual(afterLater.delivered.length, repeated.delivered.length + 1)
					})
			)
		)
)
