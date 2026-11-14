import { backoffLastMillis, caseHang } from "@bjornpagen/den/limits"
import { tickAll } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import type { StepKey } from "@bjornpagen/den/runtime/identity"
import type { Ledger } from "@bjornpagen/den/runtime/ledger"
import type { Ending, Ledgers } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Duration, Effect, Formatter, HashMap, Order, Ref } from "effect"
import { TestClock } from "effect/testing"
import type { Faults } from "#integration/slice/flows.ts"
import { admitAndDrain } from "#integration/support/run.ts"
import {
	AppServed,
	nonce,
	openLedgers,
	Planted,
	rows,
	sliceLayer
} from "#integration/support/slice.ts"

/**
 * A refused credential fences, and spends nothing: a deployment whose app login offers the worker's password, which
 * PostgreSQL refuses, runs a Ladders root, whose two steps' commits each meet `credentialRefused` round after round
 * while the worker's own login, which claims and records, is let in. `Brittle` first dies as many times as the case
 * plants, and its ladder ends after two spent attempts; `Steadfast` never dies, and never stops retrying. A round moves
 * the suite's clock a whole longest rung on, ticks the census, as it does about once a minute, and drains the
 * transport; once the deployment's credential is set right, one round more.
 *
 * Oracle (specification): every refused commit ends fenced on `credentialRefused` (`passwordRefused`, PostgreSQL's
 * 28P01), its attempt recorded as one that spent nothing, and every death's attempt spent; with the credential right,
 * each step ends done at the attempt after its last refusal, and the root's finish once both have, however many
 * refusals met a ladder that spending them would have ended failed.
 *
 * Its plants, kept mutants of the turn (kept-mutants.json, `pnpm mutate --package packages/den --kept
 * packages/den/integration/kept-mutants.json --config vitest.network.config.ts`), each turn it red: a refused
 * credential counted as a spent attempt, and a fence that records nothing, whose claim's lapse then spends it.
 */

type Feature =
	| "a refusal its ladder had room to spend"
	| "refusals that spent would end its ladder"
	| "a refusal after a spent attempt"

interface Run {
	readonly deaths: number
	readonly refusals: number
}

const runs: Gen<Run> = (source) => ({
	deaths: source.draw(int(0, 1)),
	refusals: source.draw(int(1, 3))
})

/** One of the root's two steps, and how many times the case planted its body's death. */
interface Planned {
	readonly kind: "Steadfast" | "Brittle"
	readonly deaths: number
}

/** One round: the suite's clock a longest rung on, a census tick of every flow, the transport drained. */
const round = (all: ReadonlyArray<Ledger<Faults>>, ledgers: Ledgers<Faults>) =>
	Effect.gen(function* () {
		yield* TestClock.adjust(Duration.millis(backoffLastMillis.value))
		yield* tickAll(all)
		return yield* drain(ledgers)
	})

const byAttempt = Order.mapInput(Order.BigInt, (row: { readonly attempt: bigint }) => row.attempt)

/** Whether an ending is a fence of `step`'s on a refused credential. */
const refusedAt = (step: StepKey, ending: Ending): boolean =>
	ending.kind === "fenced" &&
	ending.wake._tag === "Step" &&
	ending.wake.step === step &&
	ending.fault.kind === "credentialRefused" &&
	ending.fault.reason === "passwordRefused"

layer(sliceLayer)("a refused credential", (it) => {
	it.effect(
		"fences its commits, spends no attempt, and the steps end done once it is set right",
		(ctx) =>
			searched(
				ctx,
				exhaust(
					{
						suite: "refused credential",
						generator: runs,
						literal: Formatter.format,
						coverage: requiredInSpace<Feature>([
							"a refusal its ladder had room to spend",
							"refusals that spent would end its ladder",
							"a refusal after a spent attempt"
						]),
						caseHang,
						box: "a two-attempt ladder dead at most once, then refused its commit one to three times, beside a never-ending one",
						oracle: {
							kind: "specification",
							name: "refused commits fenced and recorded unspent, deaths spent, every step done once the credential is right"
						},
						/** Every case shares the suite's database, its ledgers, its transport and its clock. */
						concurrency: 1
					},
					(run, c) =>
						Effect.gen(function* () {
							const rounds = run.deaths + run.refusals
							const { retry, ledgers, all, misconfigured } = yield* openLedgers
							const ladder = (yield* Effect.fromNullishOr(retry.ledger.steps.get("Brittle"))).retry
							c.note(
								ladder.kind === "attempts" && rounds >= ladder.attempts
									? "refusals that spent would end its ladder"
									: "a refusal its ladder had room to spend"
							)
							if (run.deaths > 0) {
								c.note("a refusal after a spent attempt")
							}
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const { faults } = yield* Planted
							const tag = yield* nonce
							const steadfast = `steadfast-${tag}`
							const brittle = `brittle-${tag}`
							yield* Ref.update(faults, (map) =>
								HashMap.set(HashMap.set(map, steadfast, 0), brittle, run.deaths)
							)
							const at = yield* retry.ledger.now
							const requested = yield* retry.request.Ladders(`refused-${tag}`, at, {
								steadfast,
								brittle
							})
							assert.isTrue(requested.fresh)
							const first = yield* admitAndDrain(misconfigured.ledgers, FlowName.make("Retry"), [
								requested.scope
							])
							const later = yield* Effect.forEach(Array.from({ length: rounds - 1 }), () =>
								round(misconfigured.all, misconfigured.ledgers)
							)
							const endings = [...first, ...Arr.flatten(later)]
							yield* round(all, ledgers)
							const results = yield* rows(app.workload.retryResults.once({ params: {}, facts: {} }))
							const mine = Arr.filter(results, (r) => r.scope === requested.scope)
							const of = (kind: string) => Arr.filter(mine, (r) => r.kind === kind)
							const settled = (planned: Planned) =>
								Effect.gen(function* () {
									const done = of(planned.kind)
									assert.deepStrictEqual(
										Arr.map(done, (r) => r.outcome),
										["done"]
									)
									const step = (yield* Effect.fromOption(Arr.head(done))).step
									const claimed = yield* retry.ledger.claimsOf(step)
									const retried = yield* retry.ledger.retriesOf(step)
									const claims = Arr.sort(claimed, byAttempt)
									const retries = Arr.sort(retried, byAttempt)
									const attempts = Array.from({ length: rounds + 1 }, (_, i) => BigInt(i + 1))
									assert.deepStrictEqual(
										Arr.map(claims, (cl) => cl.attempt),
										attempts
									)
									assert.deepStrictEqual(
										Arr.map(retries, (r) => [r.attempt, r.spent] as const),
										Arr.map(
											Arr.take(attempts, rounds),
											(attempt, i) => [attempt, i < planned.deaths] as const
										)
									)
									assert.strictEqual(
										Arr.filter(endings, (ending) => refusedAt(step, ending)).length,
										rounds - planned.deaths
									)
								})
							yield* settled({ kind: "Steadfast", deaths: 0 })
							yield* settled({ kind: "Brittle", deaths: run.deaths })
							assert.deepStrictEqual(
								Arr.map(of("LaddersFinish"), (r) => r.outcome),
								["done"]
							)
						})
				)
			)
	)
})
