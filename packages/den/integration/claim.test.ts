import { holderOf, instantOf, type StepKey } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { finite, int } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option, Ref } from "effect"
import type { Digest } from "effect/crypto"
import { openLedgers, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A claim is a race at `(step, attempt)`, decided by the claim's primary key alone, which Claim races. Two claimers
 * of one step's first attempt, each under its own holder, in every order of their moves, each move in flight beside
 * the other's: exactly one claim holds the key, and the other meets it and reports another holder's, a race lost,
 * refused by nothing.
 *
 * Oracle (postgresql): PostgreSQL's unique index, which grizzle's insert protocol arbitrates by ON CONFLICT DO SELECT,
 * over every interleaving the testing library's `every` strategy runs.
 */

type Session = "first" | "second"
type Outcome = "claimed" | "lost" | "other"

type Feature = "one page" | "two pages"

/**
 * Admits one claimer of an attempt in every interleaving.
 *
 * Box: its suite's, every case of it (two claimers of one chain's first page, a run of one or two pages).
 */
export const admitsOneClaimerOfAnAttemptInEveryInterleaving = property.exhaust(finite(int(1, 2)), {
	box: "two claimers of one chain's first page, a run of one or two pages",
	needs: { slice: sliceCase },
	situations: ["one page", "two pages"] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(pages) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(pages === 1 ? "one page" : "two pages")
						const { chain, ledgers } = yield* openLedgers
						const runs = yield* Ref.make(0)
						const current = yield* Ref.make(Option.none<StepKey>())
						const reset = Effect.gen(function* () {
							const n = yield* Ref.getAndUpdate(runs, (k) => k + 1)
							const at = yield* chain.ledger.now
							const requested = yield* chain.request.ChainRun(`claim-${pages}-${n}`, at, {
								feed: "news",
								pages: BigInt(pages)
							})
							const served = yield* serve(
								ledgers,
								{ _tag: "Admit", flow: FlowName.make("Chain"), scope: requested.scope },
								instantOf(Number(at) + longestLeaseMillis)
							)
							const first =
								served.ending.kind === "admitted"
									? Arr.head(served.ending.spawned.steps)
									: Option.none()
							yield* Ref.set(
								current,
								Option.map(first, (s) => s.step)
							)
						}).pipe(Effect.orDie)
						const claim = (session: Session): Effect.Effect<Outcome, never, Digest.Digest> =>
							Effect.gen(function* () {
								const held = yield* Ref.get(current)
								const step = Option.getOrThrow(held)
								const at = yield* chain.ledger.now
								const holder = yield* holderOf(step, 1, session === "first" ? 0 : 1)
								const located = yield* Effect.orDie(chain.ledger.stepOf(step))
								const root = Option.getOrThrow(located).root
								const outcome = yield* Effect.result(
									chain.ledger.claim({
										step,
										root,
										attempt: 1n,
										holder,
										until: instantOf(Number(at) + longestLeaseMillis)
									})
								)
								return outcome._tag === "Success" ? (outcome.success ? "claimed" : "lost") : "other"
							}).pipe(Effect.orDie)
						const judge = (run: Interleaving<Session, "claim", Outcome, never, never, never>) =>
							Effect.gen(function* () {
								const outcomes = Arr.flatMap(run.order, (record) =>
									Option.toArray(
										Option.flatMap(record.result, (result) =>
											result.ended.kind === "ended"
												? Option.some(result.ended.outcome)
												: Option.none()
										)
									)
								)
								assert.deepStrictEqual(
									Arr.sort(outcomes, (a: string, b: string) => (a < b ? -1 : a > b ? 1 : 0)),
									["claimed", "lost"]
								)
								const held = yield* Ref.get(current)
								const claims = yield* chain.ledger.claimsOf(Option.getOrThrow(held))
								assert.strictEqual(claims.length, 1)
							}).pipe(Effect.orDie)
						yield* interleave(
							{
								reset,
								run: (session: Session) => claim(session),
								waitOf: () => Effect.never,
								quiesce: () => Effect.void,
								outcome: (_move, ended) => ({
									key: ended.kind === "ended" ? ended.outcome : "cancelled",
									session: "continues"
								}),
								release: () => Effect.void,
								commute: () => false,
								onWait: () => "wait",
								read: () => Effect.die("the race reads no final state")
							},
							{
								sessions: {
									first: { moves: ["claim"], after: Option.none() },
									second: { moves: ["claim"], after: Option.none() }
								},
								exclusive: [],
								state: Option.none()
							},
							{ kind: "every", reduction: "none" },
							judge
						)
					}),
					services
				)
			),
	oracle: {
		kind: "postgresql",
		name: "the claim's primary key, over every interleaving of two claimers"
	},
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\tconst shut = Arr.filter(windows, (w) => !isOpen(w, at))",
			replacement: "\t\tconst shut = Arr.filter(windows, (w) => true)",
			why: "Operator mutant (boolean-return) at packages/den/src/runtime/turn.ts:485 in gate: `!isOpen(w, at)` becomes `true`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
