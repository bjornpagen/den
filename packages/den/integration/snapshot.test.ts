import { tick } from "@bjornpagen/den/runtime/census"
import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import * as g from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { finite, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Order } from "effect"
import { openLedgers, readAcrossWrite, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * The scheduler's snapshot is one statement, so it reads one state of the database. A census tick of the sync flow
 * reads its snapshot while one or two exclusive roots are requested and admitted, each taking its relation's
 * exclusivity seat: the tick's statement waits on a lock of a relation it reads (Chain's steps, which Sync's
 * precondition names) until the admissions have committed, so it reads the state before them, and gives back no seat a
 * live root holds. A snapshot whose reads span two transactions reads the seats after the admissions and the scopes
 * before them: each new root's seat shows held by a scope that is not live, and the census gives it back while the
 * root runs.
 *
 * Oracle (specification): after the tick, every root admitted during it still holds its seat.
 */

type Feature =
	| "one root admitted while the census reads"
	| "two roots admitted while the census reads"

/** Sync's steps' and results' readers wait on this relation of Chain's while its lock is held. */
const chainSteps = `"slice_den"."chain_step"`

/**
 * Keeps every seat a root takes while the census reads its snapshot.
 *
 * Box: its suite's, every case of it (one or two exclusive sync roots admitted while a tick's snapshot waits).
 */
export const theCensusKeepsTheSeatOfEveryRootAdmittedWhileItReads = property.exhaust(
	finite(int(1, 2)),
	{
		box: "one or two exclusive sync roots admitted while a census tick's snapshot waits on a lock of Chain's steps",
		needs: { slice: sliceCase },
		situations: [
			"one root admitted while the census reads",
			"two roots admitted while the census reads"
		] satisfies ReadonlyArray<Reached<Feature>>,
		check:
			({ slice }, c: Case<Feature>) =>
			(roots) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							c.note(
								roots === 1
									? "one root admitted while the census reads"
									: "two roots admitted while the census reads"
							)
							const { sync, ledgers } = yield* openLedgers
							const at = yield* sync.ledger.now
							const ends = instantOf(Number(at) + longestLeaseMillis)
							const admitted = Effect.forEach(
								Array.from({ length: roots }, (_, ordinal) => ordinal),
								(n) =>
									Effect.gen(function* () {
										const requested = yield* sync.request.SyncRun(`mid-read-${n}`, {
											relation: `mid-read-${n}`,
											run: BigInt(n)
										})
										const served = yield* serve(
											ledgers,
											{ _tag: "Admit", flow: FlowName.make("Sync"), scope: requested.scope },
											ends
										)
										assert.equal(served.ending.kind, "admitted")
										return requested.scope
									})
							)
							const [, scopes] = yield* readAcrossWrite(chainSteps, tick(sync.ledger), admitted)
							const held = yield* sync.ledger.coordination.exclusives
							const sorted = (all: ReadonlyArray<g.Sha256>) =>
								Arr.sort(all, Order.mapInput(Order.String, g.Sha256.toHex))
							assert.deepEqual(sorted(Arr.map(held, (seat) => seat.scope)), sorted(scopes))
						}).pipe(Effect.orDie),
						services
					)
				),
		oracle: {
			kind: "specification",
			name: "every root admitted while the census read still holds its exclusivity seat after the tick"
		},
		kept: [],
		kills: [
			{
				file: "packages/den/integration/slice/generated/sync.binding.ts",
				original: "\t\t\tEffect.map(only(rows), (read): Snapshot<FlowNeeds<typeof sync>> => {",
				replacement:
					"\t\t\tEffect.zipWith(only(rows), coordination.exclusives, (one, exclusives): Snapshot<FlowNeeds<typeof sync>> => { const read = { ...one, exclusives }",
				why: "The snapshot's exclusivity seats are read in a transaction of their own, the coordinator's, after the rest, as the scheduler's snapshot read them before it was one statement: a seat a root took after the scopes were read shows held by no live scope, and the census gives it back while the root runs."
			}
		]
	}
)
