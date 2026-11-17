/**
 * The Timeback replica as a daily read meets it: a drawn heap read one binary COPY page of blocks at a time on bastion
 * sessions at the share of the bastion its hold buys, a page that would outlast its session's statement timeout split
 * until one block alone is refused, weather retried, a hold past the bastion's seats; then the rows changed since the
 * last read, and a prune by the print of per-bucket key fingerprints and the keys of the buckets it names, against a
 * source that deleted some keys.
 *
 * Oracle (specification): binary COPY pages of a heap at the bastion's measured share, and a bucketed-fingerprint
 * prune.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Effect } from "effect"
import { Digest } from "effect/crypto"
import { makeReplica, TimebackReplica } from "#replica.ts"
import {
	changesOf,
	nightOf,
	pruneOf,
	type Scenario,
	scenarioGen,
	type Seen
} from "#test/replica.fixtures.ts"
import { webCrypto } from "#test/support/digest.ts"

/**
 * The Timeback replica: pages answer their blocks within their timeout, split past it, and a print and its bucket keys
 * prune what the source deleted.
 *
 * Budget: its suite's count before the conversion (replica: a daily read: 200 independent cases and 200 steered, Vitest
 * at den dc5bd11).
 */
export const dailyRead = property.explore(scenarioGen, {
	needs: { digest: webCrypto },
	situations: [
		"copied",
		"timeout-split",
		"one-block-refused",
		"weather-retried",
		"over-hold",
		"pruned",
		"untouched-prune",
		"changes-read"
	] satisfies ReadonlyArray<Reached<Seen>>,
	check: (resources, c: Case<Seen>) => (scenario: Scenario) =>
		Effect.provideServiceEffect(
			Effect.gen(function* () {
				const digest = yield* Digest.Digest
				yield* Effect.gen(function* () {
					const night = yield* nightOf(scenario, c)
					yield* changesOf(scenario, night.session, c)
					yield* pruneOf(scenario, night.session, c)
				}).pipe(
					Effect.provideServiceEffect(
						TimebackReplica,
						makeReplica(scenario.world, c).pipe(Effect.provideService(Digest.Digest, digest))
					)
				)
			}),
			Digest.Digest,
			resources.digest
		),
	oracle: {
		kind: "specification",
		name: "binary COPY pages of a heap at the bastion's measured share, and a bucketed-fingerprint prune"
	},
	budget: { runs: 200, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: "\t\t\tsignatureAt += 1",
			replacement: "\t\t\t{}",
			why: "Operator mutant (statement) at packages/edullm/src/copy-binary.ts:166 in acceptByte: `signatureAt += 1` becomes `{}`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
