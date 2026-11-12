import { caseHang } from "@bjornpagen/den/limits"
import type { ScopeKey, StepKey } from "@bjornpagen/den/runtime/identity"
import type { Turn } from "@bjornpagen/den/runtime/ledger"
import { claimed, concluded } from "@bjornpagen/den/runtime/turn"
import { Db } from "@bjornpagen/grizzle/runtime"
import { exhaust } from "@den/testing/explore"
import { requiredInSpace } from "@den/testing/features"
import { int } from "@den/testing/gen"
import { interleave, type Interleaving } from "@den/testing/interleave"
import { searched } from "@den/testing/vitest"
import { layer } from "@effect/vitest"
import { assert } from "@effect/vitest"
import { Array as Arr, Effect, Formatter, Option, Ref } from "effect"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { sliceLayer, WorkerServed } from "#integration/support/slice.ts"

/**
 * A claim is a key race on (step, attempt), decided at READ COMMITTED by the claim's primary key alone. Two claimers of
 * one step at one attempt, each claiming and then finishing its turn, in every order of their moves: exactly one claim
 * is accepted, the other refused on the key, the holder's turn ends done, and the step's one result is held by that
 * attempt.
 *
 * Oracle (postgresql): PostgreSQL's unique index, which grizzle's insert protocol arbitrates by ON CONFLICT DO SELECT,
 * judged over every interleaving the testing library's `every` strategy runs.
 */

type Session = "first" | "second"
type Move = "claim" | "finish"
type Outcome = "claimed" | "refused" | "done" | "idle" | "other"

type Feature = "one page" | "two pages"

/** The interleavings of two sessions of two moves each, (2 + 2)! / (2! 2!): the search's every order, its runaway guard. */
const orders = 6

interface Race {
	readonly step: StepKey
	readonly scope: ScopeKey
	readonly held: Option.Option<{ readonly session: Session; readonly turn: Turn }>
}

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
						name: "the claim's primary key, over every interleaving of two claimers' moves"
					}
				},
				(pages, c) =>
					Effect.gen(function* () {
						c.note(pages === 1 ? "one page" : "two pages")
						const worker = yield* Db.open(WorkerServed.roles.chain_worker, {})
						const chain = chainLedger(worker.workload)
						const runner = chain.ledger.runners.get("Page")
						if (runner === undefined) {
							return yield* Effect.die("the chain flow runs Page")
						}
						const runs = yield* Ref.make(0)
						const race = yield* Ref.make(Option.none<Race>())
						const current = Effect.flatMap(Ref.get(race), (r) =>
							Option.match(r, {
								onNone: () => Effect.die("a run resets before its first move"),
								onSome: Effect.succeed
							})
						)
						const reset = Effect.gen(function* () {
							const n = yield* Ref.getAndUpdate(runs, (k) => k + 1)
							const started = yield* chain.start.ChainRun(`claim-${pages}-${n}`, {
								feed: "news",
								pages: BigInt(pages)
							})
							const first = Arr.head(started.spawned.steps)
							if (Option.isNone(first)) {
								return yield* Effect.die("a chain starts its first page")
							}
							const located = yield* chain.ledger.stepOf(first.value.step)
							if (Option.isNone(located)) {
								return yield* Effect.die("a started page is a step")
							}
							yield* Ref.set(
								race,
								Option.some({
									step: first.value.step,
									scope: located.value.scope,
									held: Option.none()
								})
							)
						}).pipe(Effect.orDie)
						const claim = (session: Session) =>
							Effect.gen(function* () {
								const r = yield* current
								const won = yield* Effect.result(claimed(chain.ledger, r.step, 1, r.scope))
								if (won._tag === "Failure") {
									const lost: Outcome = won.failure.kind === "refused" ? "refused" : "other"
									return lost
								}
								const turn = won.success
								yield* Ref.set(race, Option.some({ ...r, held: Option.some({ session, turn }) }))
								const outcome: Outcome = "claimed"
								return outcome
							})
						const finish = (session: Session) =>
							Effect.gen(function* () {
								const r = yield* current
								if (Option.isNone(r.held) || r.held.value.session !== session) {
									const idle: Outcome = "idle"
									return idle
								}
								const turn = r.held.value.turn
								const ran = yield* runner.run(turn)
								const ending = yield* concluded(chain.ledger, turn, ran)
								const outcome: Outcome = ending.kind === "done" ? "done" : "other"
								return outcome
							})
						const judge = (run: Interleaving<Session, Move, Outcome, never, never, never>) =>
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
								const count = (o: Outcome) => Arr.filter(outcomes, (x) => x === o).length
								assert.deepStrictEqual(
									[
										count("claimed"),
										count("refused"),
										count("done"),
										count("idle"),
										count("other")
									],
									[1, 1, 1, 1, 0]
								)
								const r = yield* current
								const held = yield* chain.ledger.heldOf(r.step)
								assert.deepStrictEqual(held, Option.some(1n))
							}).pipe(Effect.orDie)
						yield* interleave(
							{
								reset,
								run: (session: Session, move: Move) =>
									(move === "claim" ? claim(session) : finish(session)).pipe(
										Effect.orElseSucceed((): Outcome => "other")
									),
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
									first: { moves: ["claim", "finish"], after: Option.none() },
									second: { moves: ["claim", "finish"], after: Option.none() }
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
