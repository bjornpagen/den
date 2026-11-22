import type { Need } from "@bjornpagen/testing/property"
import { Context, Effect, Layer } from "effect"
import { Digest } from "effect/crypto"

/**
 * The CPU webCrypto's open may spend on a worker: building Effect's WebCrypto Digest layer.
 *
 * @limitKind measured
 * @owner den's edullm suites (packages/edullm/test)
 * @unit milliseconds of CPU
 * @scope one open of webCrypto on one worker, the worker process's own CPU
 * @evidence each property's `readyingCpu` in ~/.cache/toolchain-test/runs/3058611297-3164397.json (`toolchain-test run
 *   test/bronze.test.ts test/replica.test.ts` in packages/edullm, TEST_SEED=3058611297), which bounds webCrypto's open
 *   from above
 * @observed 2026-11-21 15:40 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, 1-minute load 410 to 430 from other
 *   lanes' runs; Node 26.13.1, toolchain 46e6e52e43dd
 * @workload one run of the two properties that read it, on two workers, each opening it once
 * @result readyingCpu bronze 77.1 ms, replica 25.4 ms; no open failed
 * @decision 1 s, about thirteen times the larger, as the testing library's own budgets for opens of that size (its
 *   Checkout and Scratch directories, 1 s over opens of 6 ms and 36 ms): a layer's build moves with the load and a
 *   cold compile cache. Unmeasured: a quiet machine
 * @revalidate Effect's Digest layer doing more at its build, another machine
 */
const webCryptoBudgetMillis = 1_000

/**
 * SHA-256 on WebCrypto, the Digest den derives its identities with: built once per worker, and the same immutable
 * service for every case there, which a check provides to what it runs.
 */
export const webCrypto: Need<Digest.Digest["Service"]> = {
	key: "den:digest:web-crypto",
	budget: webCryptoBudgetMillis,
	runNeeds: [],
	open: Effect.map(Layer.build(Digest.layerWebCrypto), (built) =>
		Effect.succeed(Context.get(built, Digest.Digest))
	)
}
