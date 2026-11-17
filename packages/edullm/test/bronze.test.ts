/**
 * Bronze, the content-addressed store: three writers race to put drawn bodies into one fake S3 bucket under each body's
 * SHA-256, every put one create-only call that S3 may answer, refuse, or carry out and lose the answer of, run under
 * drawn interleavings. Each body is stored once, under its own key, never changed, and every answered put is in the
 * bucket.
 *
 * Oracle (specification): S3 create-only puts under content addresses: one object a body, written once, an answered put
 * stored.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { interleave } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { Effect, Option } from "effect"
import { Digest } from "effect/crypto"
import { driverOf, judged, type Race, raceGen, type Seen } from "#test/bronze.fixtures.ts"
import { webCrypto } from "#test/support/digest.ts"

/**
 * Bronze writers racing to put bodies store each once under its SHA-256, never changed, whatever S3 answers.
 *
 * Budget: its suite's count before the conversion (bronze: create-only race: 300 independent cases and 200 steered,
 * Vitest at den dc5bd11).
 */
export const createOnly = property.explore(raceGen, {
	needs: { digest: webCrypto },
	situations: [
		"created",
		"already-identical",
		"unanswered",
		"answer-lost",
		"raced"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (resources, c: Case<Seen>) => (race: Race) =>
		Effect.provideServiceEffect(
			Effect.gen(function* () {
				const digest = yield* Digest.Digest
				const { driver, log } = driverOf(race, c, digest)
				yield* interleave(
					driver,
					{
						sessions: {
							first: { moves: race.puts.first, after: Option.none() },
							second: { moves: race.puts.second, after: Option.none() },
							third: { moves: race.puts.third, after: Option.none() }
						},
						exclusive: [],
						state: Option.some("objects")
					},
					{ kind: "drawn", nature: c },
					(run) => judged(race, run, log, c)
				)
			}),
			Digest.Digest,
			resources.digest
		),
	oracle: {
		kind: "specification",
		name: "S3 create-only puts under content addresses: one object a body, written once, an answered put stored"
	},
	budget: { runs: 300, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/bronze.ts",
			original:
				'\t\t\t\t\t\tHashMap.has(held, key)\n\t\t\t\t\t\t\t? ["already-identical", held]\n\t\t\t\t\t\t\t: ["created", HashMap.set(held, key, Uint8Array.from(body))]',
			replacement:
				'\t\t\t\t\t\tHashMap.has(held, key) ? ["created", HashMap.set(held, key, Uint8Array.from(body))] : ["already-identical", held]',
			why: 'Operator mutant (arm-swap) at packages/edullm/src/bronze.ts:62 in makeBronze: `HashMap.has(held, key) ? ["already-identical", held] : ["created", HashMap.set(h` becomes `HashMap.has(held, key) ? ["created", HashMap.set(held, key, Uint8Array.from(body`; the property fails (lane CATCH, den 9cffaba).'
		}
	]
})
