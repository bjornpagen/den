import { caseHang, longestLeaseMillis } from "@bjornpagen/den/limits"
import { now } from "@bjornpagen/den/runtime/clock"
import { holderOf, instantOf, type StepKey } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { exhaust } from "@den/testing/explore"
import { requiredInSpace } from "@den/testing/features"
import { int } from "@den/testing/gen"
import { interleave, type Interleaving } from "@den/testing/interleave"
import { searched } from "@den/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option, Ref } from "effect"
import type { Digest } from "effect/crypto"
import { openLedgers, sliceLayer } from "#integration/support/slice.ts"

/**
 * A claim is a race at `(step, attempt)`, decided at READ COMMITTED by the claim's primary key alone, which Claim
 * races. Two claimers of one step's first attempt, each under its own holder, in every order of their moves, each move
 * in flight beside the other's: exactly one claim holds the key, and the other meets it and reports another holder's,
 * a race lost, refused by nothing.
 *
 * Oracle (postgresql): PostgreSQL's unique index, which grizzle's insert protocol arbitrates by ON CONFLICT DO SELECT,
 * over every interleaving the testing library's `every` strategy runs.
 */

type Session = "first" | "second"
type Outcome = "claimed" | "lost" | "other"

type Feature = "one page" | "two pages"

/** The interleavings of two sessions of one move each: issue and join orders, the search's runaway guard. */
const orders = 6

layer(sliceLayer)("the claim race", (it) => {
	it.effect("admits one claimer of an attempt in every interleaving", (ctx) =>
		searched(
			ctx,
			exhaust(
				{
					suite: "claim race",
					generator: int(1, 2),
					literal: Formatter.format,
					limit: 2,
					coverage: requiredInSpace<Feature>(["one page", "two pages"]),
					caseHang,
					box: "two claimers of one chain's first page, a run of one or two pages",
					oracle: {
						kind: "postgresql",
						name: "the claim's primary key, over every interleaving of two claimers"
					}
				},
				(pages, c) =>
					Effect.gen(function* () {
						c.note(pages === 1 ? "one page" : "two pages")
						const { chain, ledgers } = yield* openLedgers
						const runs = yield* Ref.make(0)
						const current = yield* Ref.make(Option.none<StepKey>())
						const reset = Effect.gen(function* () {
							const n = yield* Ref.getAndUpdate(runs, (k) => k + 1)
							const at = yield* now
							const requested = yield* chain.request.ChainRun(`claim-${pages}-${n}`, at, {
								feed: "news",
								pages: BigInt(pages)
							})
							const served = yield* serve(
								ledgers,
								{ _tag: "Admit", flow: FlowName.make("Chain"), scope: requested.scope },
								instantOf(Number(at) + longestLeaseMillis.value)
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
								const at = yield* now
								const holder = yield* holderOf(step, 1, session === "first" ? 0 : 1)
								const outcome = yield* Effect.result(
									chain.ledger.claim({
										step,
										attempt: 1n,
										holder,
										until: instantOf(Number(at) + longestLeaseMillis.value)
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
								waitOf: () => Effect.succeedNone,
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
								name: "claim race",
								sessions: {
									first: { moves: ["claim"], after: Option.none() },
									second: { moves: ["claim"], after: Option.none() }
								},
								exclusive: [],
								state: Option.none()
							},
							{ kind: "every", limit: orders, reduction: "none" },
							judge
						)
					})
			)
		)
	)
})
