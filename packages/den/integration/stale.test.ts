import { holderOf, instantOf } from "@bjornpagen/den/runtime/identity"
import type { Ran, Turn } from "@bjornpagen/den/runtime/ledger"
import { lostRace, serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName } from "@bjornpagen/den/transport"
import { type CallError, Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, Option } from "effect"
import type { Digest } from "effect/crypto"
import { TestClock } from "effect/testing"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis, reclaimableAfterMillis } from "#runtime/turn.ts"

/**
 * Two holders of one step, a stale one and a fresh one, each with its own attempt: the stale one claimed attempt 1 and
 * its lease lapsed at the database's instant while it still runs, as a holder paused past its lease does, with a
 * deadline of its own still ahead; the fresh one claimed attempt 2. Correctness rests on the keys alone, never on a
 * clock: whichever commits second is refused on the key the first commit's Held holds, its writes rolled back with its
 * result, a race lost; the first commit's attempt is the one Held names. A wake for an attempt whose predecessor was
 * never claimed is lost outright, claiming nothing.
 *
 * Oracle (specification): one holder committed, the other lost, the winner's attempt held, one result; a forged wake
 * lost with no claim.
 */

type Order = "stale commits first" | "fresh commits first"

type Feature = Order | "a forged attempt"

interface Race {
	readonly order: Order
	readonly pages: number
	readonly copy: number
}

const races: Gen<Race> = (source) => ({
	order: source.draw(element(["stale commits first", "fresh commits first"])),
	pages: source.draw(int(1, 3)),
	copy: source.draw(int(0, 99_999))
})

/**
 * Loses when another attempt's commit holds its step.
 *
 * Budget: its suite's count before the conversion (stale holder: 8 independent cases and 8 steered, Vitest at den
 * dc5bd11).
 */
export const aStaleHolderLosesWhenAnotherAttemptsCommitHoldsItsStep = property.explore(races, {
	needs: { slice: sliceCase },
	situations: [
		"stale commits first",
		"fresh commits first",
		"a forged attempt"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(race) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(race.order)
						const { chain, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const flow = FlowName.make("Chain")
						const at = yield* chain.ledger.now
						const key = "stale"
						const requested = yield* chain.request.ChainRun(key, {
							feed: "sport",
							pages: BigInt(race.pages)
						})
						assert.ok(requested.fresh)
						const ends = (from: bigint) => instantOf(Number(from) + longestLeaseMillis)
						const admitted = yield* serve(
							ledgers,
							{ _tag: "Admit", flow, scope: requested.scope },
							ends(at)
						)
						const page =
							admitted.ending.kind === "admitted"
								? Arr.head(admitted.ending.spawned.steps)
								: Option.none()
						if (Option.isNone(page)) {
							return yield* Effect.die("a chain admits its first page")
						}
						const step = page.value.step
						const located = yield* chain.ledger.stepOf(step)
						if (Option.isNone(located)) {
							return yield* Effect.die("an admitted page is located")
						}
						const runner = located.value.runner
						const claimAt = (attempt: bigint) =>
							Effect.gen(function* () {
								const from = yield* chain.ledger.now
								const holder = yield* holderOf(step, Number(attempt), race.copy)
								const until = ends(from)
								yield* chain.ledger.claim({ step, root: requested.scope, attempt, holder, until })
								const turn: Turn = {
									step,
									root: requested.scope,
									attempt,
									scope: requested.scope,
									holder,
									deadline: instantOf(Number(until) - 1),
									until
								}
								return turn
							})
						const first = yield* claimAt(1n)
						yield* TestClock.adjust(Duration.millis(reclaimableAfterMillis))
						const fresh = yield* claimAt(2n)
						const stale: Turn = { ...first, deadline: fresh.deadline, until: fresh.until }
						const [early, late] =
							race.order === "stale commits first" ? [stale, fresh] : [fresh, stale]
						const finish = (turn: Turn): Effect.Effect<Ran, CallError, Digest.Digest> =>
							Effect.flatMap(chain.ledger.now, (instant) =>
								runner.run(turn, instant, chain.ledger.now)
							)
						const earlyRan = yield* finish(early)
						const lateRan = yield* finish(late)
						assert.equal(earlyRan.kind, "committed")
						assert.ok(lateRan.kind === "error" && lostRace("Chain", lateRan.error))
						const held = yield* chain.ledger.heldOf(step)
						assert.deepEqual(held, Option.some(early.attempt))
						const pages = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						assert.equal(Arr.filter(pages, (p) => p.step === step).length, 1)
						const forgedAt = yield* chain.ledger.now
						const other = yield* chain.request.ChainRun(`${key}-forged`, {
							feed: "sport",
							pages: BigInt(race.pages)
						})
						const otherAdmitted = yield* serve(
							ledgers,
							{ _tag: "Admit", flow, scope: other.scope },
							ends(forgedAt)
						)
						const otherPage =
							otherAdmitted.ending.kind === "admitted"
								? Arr.head(otherAdmitted.ending.spawned.steps)
								: Option.none()
						if (Option.isNone(otherPage)) {
							return yield* Effect.die("a chain admits its first page")
						}
						c.note("a forged attempt")
						const forged = yield* serve(
							ledgers,
							{ _tag: "Step", flow, step: otherPage.value.step, attempt: AttemptNumber.make(2) },
							ends(forgedAt)
						)
						assert.equal(forged.ending.kind, "lost")
						const claims = yield* chain.ledger.claimsOf(otherPage.value.step)
						assert.deepEqual(claims, [])
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "one holder committed, the other lost, the winner's attempt held, a forged attempt lost"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "\t\tif (BigInt(wake.attempt) !== next) {",
			replacement: "\t\tif (BigInt(wake.attempt) === next) {",
			why: "A turn loses exactly the wake of its step's next attempt and serves every other (lane CATCH's comparison of den 9cffaba, moved where the attempt is checked)."
		}
	]
})
