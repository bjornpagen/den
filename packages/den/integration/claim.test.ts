import { delayOf, instantOf } from "@bjornpagen/den/runtime/identity"
import { lostRace, serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import type { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { finite, int } from "@bjornpagen/testing/gen"
import { interleave, type Interleaving } from "@bjornpagen/testing/interleave"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Option, Ref } from "effect"
import { openLedgers, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A claim's attempt is its place among its step's claims, which the database stamps, and a claim after the first
 * follows its predecessor's end. Two claimers of one step's first attempt, in every order of their moves, each move in
 * flight beside the other's: exactly one claims, at attempt 0, and the other is refused whole as a race lost, whether it
 * stamps after the first's commit or its serialization failure is run again and stamps after it, since attempt 0 has
 * not ended; the step holds one claim.
 *
 * Oracle (postgresql): PostgreSQL's serializable isolation over the step's head and the claim's law of its predecessor's
 * end, over every interleaving the testing library's `every` strategy runs.
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
						const current = yield* Ref.make(Option.none<Sha256>())
						const reset = Effect.gen(function* () {
							const n = yield* Ref.getAndUpdate(runs, (k) => k + 1)
							const at = yield* chain.ledger.now
							const requested = yield* chain.request.ChainRun(`claim-${pages}-${n}`, {
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
						const claim = (_session: Session): Effect.Effect<Outcome> =>
							Effect.gen(function* () {
								const held = yield* Ref.get(current)
								const step = Option.getOrThrow(held)
								const located = yield* Effect.orDie(chain.ledger.stepOf(step))
								const root = Option.getOrThrow(located).root
								const outcome = yield* Effect.result(
									chain.ledger.claim({
										step,
										root,
										budget: delayOf(longestLeaseMillis),
										seats: [],
										lapsed: []
									})
								)
								if (outcome._tag === "Success") {
									assert.equal(outcome.success, 0n)
									return "claimed"
								}
								return lostRace("Chain", outcome.failure) ? "lost" : "other"
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
								assert.deepEqual(
									Arr.sort(outcomes, (a: string, b: string) => (a < b ? -1 : a > b ? 1 : 0)),
									["claimed", "lost"]
								)
								const held = yield* Ref.get(current)
								const claims = yield* chain.ledger.claimsOf(Option.getOrThrow(held))
								assert.equal(claims.length, 1)
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
		name: "the step's stamped attempt and its predecessor's end, over every interleaving of two claimers"
	},
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\tif (Option.exists(window, (w) => !isOpen(w, at))) {",
			replacement: "\t\tif (Option.exists(window, (w) => true)) {",
			why: "A root's window reads as shut at every instant, so its work always waits (lane CATCH's boolean-return of den 9cffaba, in gate's one window test where it moved)."
		}
	]
})
