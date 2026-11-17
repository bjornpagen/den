import type { Need } from "@bjornpagen/testing/property"
import { Context, Effect, Layer } from "effect"
import { Digest } from "effect/crypto"

/**
 * SHA-256 on WebCrypto, the Digest den derives its identities with: built once per worker, and the same immutable
 * service for every case there, which a check provides to what it runs.
 */
export const webCrypto: Need<Digest.Digest["Service"]> = {
	key: "den:digest:web-crypto",
	open: Effect.map(Layer.build(Digest.layerWebCrypto), (built) =>
		Effect.succeed(Context.get(built, Digest.Digest))
	)
}
