import { tickAll } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import type { StepKey } from "@bjornpagen/den/runtime/identity"
import type { Ledger } from "@bjornpagen/den/runtime/ledger"
import type { Ending, Ledgers } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { finite, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, HashMap, Option, Order, Ref } from "effect"
import { TestClock } from "effect/testing"
import type { Faults } from "#integration/slice/flows.ts"
import { admitAndDrain } from "#integration/support/run.ts"
import { AppServed, openLedgers, Planted, rows, sliceCase } from "#integration/support/slice.ts"
import { backoffLastMillis } from "#runtime/turn.ts"

/**
 * A refused credential fences, spends nothing, and runs no body again while it stands. A deployment whose app login
 * offers the worker's password, which PostgreSQL refuses, runs a Ladders root: each step's commit meets
 * `credentialRefused` while the worker's own login, which claims and records, is let in. `Brittle` first dies as many
 * times as the case plants, each a spent attempt; `Steadfast` never dies. A round moves the suite's clock a whole
 * longest rung on, ticks the census, as it does about once a minute, and drains the transport. Once both steps are
 * fenced, the deployment stays broken for as many more rounds as the case draws; then its credential is set right, for
 * one round more.
 *
 * Oracle (specification): each step's commit is refused once, fenced on `credentialRefused` (`passwordRefused`,
 * PostgreSQL's 28P01) and recorded fenced, every death's attempt spent; no body runs and no attempt is claimed while the
 * deployment stays broken, however many ticks; and with the credential right, each step ends done at the attempt after
 * its fence, having run its body once more, and the root's finish once both have.
 *
 * Its kills, each turns it red: a refused credential counted as a spent attempt, a fence that records nothing, whose
 * claim's lapse then spends it, and a census that rings fenced steps without asking whether the deployment's login is
 * let in.
 */

type Feature =
	| "fenced at its first attempt"
	| "fenced after a spent attempt"
	| "broken for one tick"
	| "broken for several ticks"

interface Run {
	readonly deaths: number
	readonly ticks: number
}

const runs: Gen<Run> = (source) => ({
	deaths: source.draw(int(0, 1)),
	ticks: source.draw(int(1, 3))
})

/** One of the root's two steps, and how many times the case planted its body's death. */
interface Planned {
	readonly kind: "Steadfast" | "Brittle"
	readonly key: string
	readonly deaths: number
}

/** One round: the suite's clock a longest rung on, a census tick of every flow, the transport drained. */
const round = (all: ReadonlyArray<Ledger<Faults>>, ledgers: Ledgers<Faults>) =>
	Effect.gen(function* () {
		yield* TestClock.adjust(Duration.millis(backoffLastMillis))
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

/**
 * Fences its commits, spends no attempt, runs no body while it stands, and the steps end done once it is set right.
 *
 * Box: its suite's, every case of it.
 */
export const aRefusedCredentialFencesSpendsNothingAndRunsNoBodyWhileItStands = property.exhaust(
	finite(runs),
	{
		box: "a two-attempt ladder dead at most once, then its commit refused, beside a never-ending one, the deployment broken one to three ticks after",
		needs: { slice: sliceCase },
		situations: [
			"fenced at its first attempt",
			"fenced after a spent attempt",
			"broken for one tick",
			"broken for several ticks"
		] satisfies ReadonlyArray<Reached<Feature>>,
		check:
			({ slice }, c: Case<Feature>) =>
			(run) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							c.note(
								run.deaths > 0 ? "fenced after a spent attempt" : "fenced at its first attempt"
							)
							c.note(run.ticks > 1 ? "broken for several ticks" : "broken for one tick")
							const { retry, ledgers, all, misconfigured } = yield* openLedgers
							const app = yield* Db.open(AppServed.roles.auditor, {})
							const { faults, runs: ran } = yield* Planted
							const steps: ReadonlyArray<Planned> = [
								{ kind: "Steadfast", key: "steadfast", deaths: 0 },
								{ kind: "Brittle", key: "brittle", deaths: run.deaths }
							]
							yield* Ref.update(faults, (map) =>
								Arr.reduce(steps, map, (acc, s) => HashMap.set(acc, s.key, s.deaths))
							)
							const runsOf = (key: string) =>
								Effect.map(Ref.get(ran), (map) => Option.getOrElse(HashMap.get(map, key), () => 0))
							const requested = yield* retry.request.Ladders("refused", {
								steadfast: "steadfast",
								brittle: "brittle"
							})
							assert.ok(requested.fresh)
							const first = yield* admitAndDrain(misconfigured.ledgers, FlowName.make("Retry"), [
								requested.scope
							])
							const dying = yield* Effect.forEach(Array.from({ length: run.deaths }), () =>
								round(misconfigured.all, misconfigured.ledgers)
							)
							const fencedRuns = yield* Effect.forEach(steps, (s) => runsOf(s.key))
							const broken = yield* Effect.forEach(Array.from({ length: run.ticks }), () =>
								round(misconfigured.all, misconfigured.ledgers)
							)
							const brokenRuns = yield* Effect.forEach(steps, (s) => runsOf(s.key))
							assert.deepEqual(
								brokenRuns,
								fencedRuns,
								"a body ran while the deployment stayed broken"
							)
							assert.deepEqual(
								Arr.flatten(broken),
								[],
								"a turn ran while the deployment stayed broken"
							)
							const endings = [...first, ...Arr.flatten(dying)]
							yield* round(all, ledgers)
							const results = yield* rows(app.workload.retryResults.once({ params: {}, facts: {} }))
							const mine = Arr.filter(results, (r) => r.scope === requested.scope)
							const of = (kind: string) => Arr.filter(mine, (r) => r.kind === kind)
							const settled = (planned: Planned) =>
								Effect.gen(function* () {
									const done = of(planned.kind)
									assert.deepEqual(
										Arr.map(done, (r) => r.outcome),
										["done"]
									)
									const step = (yield* Effect.fromOption(Arr.head(done))).step
									const claimed = yield* retry.ledger.claimsOf(step)
									const retried = yield* retry.ledger.retriesOf(step)
									const fenced = yield* retry.ledger.fencedOf(step)
									const fence = BigInt(planned.deaths + 1)
									assert.deepEqual(
										Arr.map(Arr.sort(claimed, byAttempt), (cl) => cl.attempt),
										Array.from({ length: planned.deaths + 2 }, (_, i) => BigInt(i + 1))
									)
									assert.deepEqual(
										Arr.map(Arr.sort(retried, byAttempt), (r) => [r.attempt, r.spent] as const),
										Array.from({ length: planned.deaths }, (_, i) => [BigInt(i + 1), true] as const)
									)
									assert.deepEqual(
										Arr.map(fenced, (f) => f.attempt),
										[fence]
									)
									assert.equal(Arr.filter(endings, (ending) => refusedAt(step, ending)).length, 1)
									const bodies = yield* runsOf(planned.key)
									assert.equal(bodies, planned.deaths + 2)
								})
							yield* Effect.forEach(steps, settled, { discard: true })
							assert.deepEqual(
								Arr.map(of("LaddersFinish"), (r) => r.outcome),
								["done"]
							)
						}),
						services
					)
				),
		oracle: {
			kind: "specification",
			name: "refused commits fenced and recorded, deaths spent, no body run while broken, every step done once the credential is right"
		},
		kept: [],
		kills: [
			{
				file: "packages/den/src/runtime/turn.ts",
				original: "\t\tif (BigInt(wake.attempt) !== next) {",
				replacement: "\t\tif (false) {",
				why: "A turn serves a wake of any attempt once no claim holds its step, so a stale wake of an earlier attempt runs its body again (lane CATCH's disjunct of den 9cffaba, moved where the attempt is checked)."
			},
			{
				file: "packages/den/src/runtime/turn.ts",
				original:
					'\t\t\t\tcase "stale":\n\t\t\t\tcase "credentialRefused":\n\t\t\t\t\treturn ended(ledger, runner, turn, spentSoFar, { kind: "fenced", fault: error }, wake)\n',
				replacement:
					'\t\t\t\tcase "stale":\n\t\t\t\t\treturn ended(ledger, runner, turn, spentSoFar, { kind: "fenced", fault: error }, wake)\n\t\t\t\tcase "credentialRefused":\n\t\t\t\t\treturn ended(ledger, runner, turn, spentSoFar, { kind: "spent" }, wake)\n',
				why: "A refused credential spends its attempt; the property fails on it (one of den's kept mutants before the conversion)."
			},
			{
				file: "packages/den/src/runtime/turn.ts",
				original:
					'\t\t\tcase "fenced":\n\t\t\t\treturn yield* recorded(\n\t\t\t\t\tledger,\n\t\t\t\t\tledger.fence({ step: turn.step, root: turn.root, attempt: turn.attempt }),\n\t\t\t\t\twake,\n\t\t\t\t\t{ kind: "fenced", wake, fault: how.fault }\n\t\t\t\t)\n',
				replacement:
					'\t\t\tcase "fenced":\n\t\t\t\treturn { kind: "fenced", wake, fault: how.fault } satisfies Ending\n',
				why: "A fenced attempt records nothing, so its claim's lapse spends it; the property fails on it (one of den's kept mutants before the conversion)."
			},
			{
				file: "packages/den/src/runtime/census.ts",
				original:
					"\t\tconst letIn = Arr.isReadonlyArrayNonEmpty(found.fenced)\n\t\t\t? yield* Effect.isSuccess(ledger.authenticated)\n\t\t\t: false\n",
				replacement: "\t\tconst letIn = Arr.isReadonlyArrayNonEmpty(found.fenced)\n",
				why: "The census rings fenced steps without asking whether the deployment's login is let in; the property fails on it (one of den's kept mutants before the conversion)."
			}
		]
	}
)
