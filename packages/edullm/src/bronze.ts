import type { Gen } from "@bjornpagen/testing/gen"
import { Context, Effect, HashMap, Layer, Option, Ref, Schema } from "effect"
import { Digest } from "effect/crypto"
import { Hex } from "effect/encoding"
import type { Nature } from "#nature.ts"

/**
 * Bronze, the byte store every source's answers land in, as edullm keeps it in S3: an object's key is the SHA-256 of
 * its body, and a put is create-only (`If-None-Match: *`), so an object never changes once written and a body put again
 * finds itself already there. The fake is that bucket, with what S3 does on its own: refuse a put for a while, or write
 * it and lose the answer.
 */

/** A body's SHA-256, lowercase hex: its object's key, minted only by `sha256Of`. */
export const Sha256 = Schema.String.pipe(Schema.brand("Sha256"))
export type Sha256 = typeof Sha256.Type

/** A body's key. */
export const sha256Of = Effect.fnUntraced(function* (body: Uint8Array) {
	const digest = yield* Digest.Digest
	const bytes = yield* digest.digest(Digest.sha256, body)
	return Sha256.make(Hex.encode(bytes))
})

/** How a put ended: the body is now stored under its key, written by this put or found already there. */
export type Stored = Readonly<{ key: Sha256; put: "created" | "already-identical" }>

/** S3 did not answer a put: nothing is known of whether it landed, and the same put is safe to make again. */
export class BronzeUnanswered extends Schema.TaggedError<
	BronzeUnanswered,
	{ readonly brand: unique symbol }
>()("BronzeUnanswered", {}) {}

/** What one put meets: an answer, a refusal that wrote nothing, or a write whose answer was lost. */
export type Weather = "answered" | "refused" | "lost-answer"

/** The fake bucket: `put` stores a body under its key, `get` reads one back, `objects` is every object it holds. */
export class Bronze extends Context.Service<
	Bronze,
	{
		readonly put: (body: Uint8Array) => Effect.Effect<Stored, BronzeUnanswered>
		readonly get: (key: Sha256) => Effect.Effect<Option.Option<Uint8Array>>
		readonly objects: Effect.Effect<HashMap.HashMap<Sha256, Uint8Array>>
	}
>()("@den/edullm/bronze") {}

/** The bucket, empty, its puts' weather drawn from `nature`. */
export const makeBronze = (weather: Gen<Weather>, nature: Nature) =>
	Effect.gen(function* () {
		const digest = yield* Digest.Digest
		const objects = yield* Ref.make(HashMap.empty<Sha256, Uint8Array>())
		return Bronze.of({
			put: Effect.fnUntraced(function* (body: Uint8Array) {
				const key = yield* sha256Of(body).pipe(Effect.provideService(Digest.Digest, digest))
				const met = nature.draw(weather)
				if (met === "refused") {
					return yield* BronzeUnanswered.make()
				}
				const put = yield* Ref.modify(
					objects,
					(held): readonly ["created" | "already-identical", HashMap.HashMap<Sha256, Uint8Array>] =>
						HashMap.has(held, key)
							? ["already-identical", held]
							: ["created", HashMap.set(held, key, Uint8Array.from(body))]
				)
				return met === "lost-answer" ? yield* BronzeUnanswered.make() : { key, put }
			}),
			get: (key) => Effect.map(Ref.get(objects), (held) => HashMap.get(held, key)),
			objects: Ref.get(objects)
		})
	})

/** The fake as a layer. */
export const bronzeLayer = (
	weather: Gen<Weather>,
	nature: Nature
): Layer.Layer<Bronze, never, Digest.Digest> => Layer.effect(Bronze, makeBronze(weather, nature))
