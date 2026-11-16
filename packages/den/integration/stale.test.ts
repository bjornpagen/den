import { holderOf, instantOf } from "@bjornpagen/den/runtime/identity"
import type { Ledger, Ran, Turn } from "@bjornpagen/den/runtime/ledger"
import { lostRace, serve } from "@bjornpagen/den/runtime/turn"
import { AttemptNumber, FlowName } from "@bjornpagen/den/transport"
import { type CallError, Db } from "@bjornpagen/grizzle/runtime"
import { drawn, exhaust, explore } from "@bjornpagen/testing/explore"
import { required, requiredInSpace } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Duration, Effect, Formatter, Option } from "effect"
import type { Digest } from "effect/crypto"
import { TestClock } from "effect/testing"
import type { Faults } from "#integration/slice/flows.ts"
import {
	AppServed,
	databaseMillis,
	nonce,
	openLedgers,
	rows,
	sliceLayer
} from "#integration/support/slice.ts"
import { longestLeaseMillis, reclaimableAfterMillis } from "#runtime/turn.ts"
import { caseHangMillis } from "#test/support/suites.ts"

/**
 * Two holders of one step, a stale one and a fresh one, each with its own attempt: the stale one claimed attempt 1 and
 * its lease lapsed at the database's instant while it still runs, as a holder paused past its lease does, with a
 * deadline of its own still ahead; the fresh one claimed attempt 2. Correctness rests on the keys alone, never on a
 * clock: whichever commits second is refused on the key the first commit's Held holds, its writes rolled back with its
 * result, a race lost; the first commit's attempt is the one Held names. A wake for an attempt whose predecessor was
 * never claimed is lost outright, claiming nothing. Beside it, every flow's ledger reads the database's instant: an
 * instant PostgreSQL reads itself between two readings lies between them, as calls that do not overlap read
 * non-decreasing instants of one server's clock.
 *
 * Oracle (specification): one holder committed, the other lost, the winner's attempt held, one result; a forged wake
 * lost with no claim. Oracle (second implementation): PostgreSQL's own `transaction_timestamp()`.
 */

type Order = "stale commits first" | "fresh commits first"

/** The slice's flows, whose ledgers each read the database's instant. */
type Flow = "Chain" | "Fan" | "Sync" | "Retry"

const flows: Arr.NonEmptyReadonlyArray<Flow> = ["Chain", "Fan", "Sync", "Retry"]

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

layer(sliceLayer)("a stale holder", (it) => {
	it.effect("loses when another attempt's commit holds its step", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "stale holder",
					oracle: {
						kind: "specification",
						name: "one holder committed, the other lost, the winner's attempt held, a forged attempt lost"
					},
					draw: drawn(races),
					literal: Formatter.format,
					coverage: required<Feature>(
						["stale commits first", "fresh commits first", "a forged attempt"],
						{
							cases: 8,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 8,
					shrink: boundedShrink(4),
					steerEvery: 4,
					caseHang: caseHangMillis
				},
				(race, c) =>
					Effect.gen(function* () {
						c.note(race.order)
						const { chain, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const flow = FlowName.make("Chain")
						const at = yield* chain.ledger.now
						const key = `stale-${yield* nonce}`
						const requested = yield* chain.request.ChainRun(key, at, {
							feed: "sport",
							pages: BigInt(race.pages)
						})
						assert.isTrue(requested.fresh)
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
						const runner = chain.ledger.steps.get("Page")
						if (Option.isNone(page) || runner === undefined) {
							return yield* Effect.die("a chain admits its first page, and runs Page")
						}
						const step = page.value.step
						const claimAt = (attempt: bigint) =>
							Effect.gen(function* () {
								const from = yield* chain.ledger.now
								const holder = yield* holderOf(step, Number(attempt), race.copy)
								const until = ends(from)
								yield* chain.ledger.claim({ step, attempt, holder, until })
								const turn: Turn = {
									step,
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
						assert.strictEqual(earlyRan.kind, "committed")
						assert.isTrue(lateRan.kind === "error" && lostRace("Chain", lateRan.error))
						const held = yield* chain.ledger.heldOf(step)
						assert.deepStrictEqual(held, Option.some(early.attempt))
						const pages = yield* rows(app.workload.pages.once({ params: {}, facts: {} }))
						assert.strictEqual(Arr.filter(pages, (p) => p.step === step).length, 1)
						const forgedAt = yield* chain.ledger.now
						const other = yield* chain.request.ChainRun(`${key}-forged`, forgedAt, {
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
						assert.strictEqual(forged.ending.kind, "lost")
						const claims = yield* chain.ledger.claimsOf(otherPage.value.step)
						assert.deepStrictEqual(claims, [])
					})
			)
		)
	)

	it.effect("reads the database's instant, between two readings of PostgreSQL's own", (ctx) =>
		searched(
			ctx,
			Effect.gen(function* () {
				const { all } = yield* openLedgers
				if (!Arr.isReadonlyArrayNonEmpty(all)) {
					return yield* Effect.die("the slice runs four flows")
				}
				return yield* exhaust(
					{
						suite: "the database's instant",
						generator: element<Ledger<Faults>>(all),
						literal: (ledger: Ledger<Faults>) => ledger.flow,
						coverage: requiredInSpace<Flow>(flows),
						caseHang: caseHangMillis,
						box: "each flow's ledger of the slice",
						oracle: {
							kind: "second-implementation",
							name: "PostgreSQL's transaction_timestamp() in milliseconds, read by the cluster's owner between two readings"
						}
					},
					(ledger, c) =>
						Effect.gen(function* () {
							Arr.forEach(
								Arr.filter(flows, (flow) => flow === ledger.flow),
								(flow) => c.note(flow)
							)
							const first = yield* ledger.now
							const between = yield* databaseMillis
							const second = yield* ledger.now
							assert.deepStrictEqual(
								Arr.map(between, (millis) => first <= millis && millis <= second),
								[true],
								`${first} ≤ ${Formatter.format(between)} ≤ ${second}`
							)
						})
				)
			})
		)
	)
})
