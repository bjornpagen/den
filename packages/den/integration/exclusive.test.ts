import { caseHang, longestLeaseMillis } from "@bjornpagen/den/limits"
import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Db } from "@bjornpagen/grizzle/runtime"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import { Array as Arr, Effect, Formatter } from "effect"
import { admitAndDrain, ringOnAndDrain } from "#integration/support/run.ts"
import { AppServed, nonce, openLedgers, rows, sliceLayer } from "#integration/support/slice.ts"

/**
 * Exclusivity: a sync root holds a seat per relation for its whole life. Several roots for one relation are requested
 * at once; the first admitted takes the seat, and every other one's admission, while the first lives, is recorded
 * skipped and admits nothing, as edullm's relation skips the night. Once the first's finish has its result the seat is
 * given back, and a root for the relation requested later is admitted and runs.
 *
 * Oracle (specification): one root of the relation admitted while it lives; each other root skipped, naming the first
 * as the holder, with nothing spawned and no copy of its run; the seat free once the first finished; a later root
 * admitted and copied.
 */

type Feature = "one skipped" | "two skipped" | "admitted after the seat was given back"

interface Run {
	readonly roots: number
	readonly copy: number
}

const runs: Gen<Run> = (source) => ({
	roots: source.draw(int(2, 3)),
	copy: source.draw(int(0, 9_999))
})

layer(sliceLayer)("exclusivity", (it) => {
	it.effect("admits one live sync per relation and skips the others while it lives", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "exclusivity",
					oracle: {
						kind: "specification",
						name: "one admitted live root per relation; the others skipped, naming it; a later root admitted once it finished"
					},
					draw: drawn(runs),
					literal: Formatter.format,
					coverage: required<Feature>(
						["one skipped", "two skipped", "admitted after the seat was given back"],
						{
							cases: 6,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 6,
					shrink: boundedShrink(4),
					steerEvery: 3,
					caseHang
				},
				(run, c) =>
					Effect.gen(function* () {
						c.note(run.roots === 2 ? "one skipped" : "two skipped")
						const { sync, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const relation = `rel-${yield* nonce}`
						const at = yield* sync.ledger.now
						const request = (n: number) =>
							sync.request.SyncRun(`${relation}-${n}`, at, { relation, run: BigInt(n) })
						const first = yield* request(1)
						const rest = yield* Effect.forEach(
							Array.from({ length: run.roots - 1 }, (_, ordinal) => ordinal + 2),
							request
						)
						assert.isTrue(Arr.every([first, ...rest], (r) => r.fresh))
						const ends = instantOf(Number(at) + longestLeaseMillis.value)
						const admit = (scope: typeof first.scope) =>
							serve(ledgers, { _tag: "Admit", flow: FlowName.make("Sync"), scope }, ends)
						const winner = yield* admit(first.scope)
						assert.strictEqual(winner.ending.kind, "admitted")
						const losers = yield* Effect.forEach(rest, (r) => admit(r.scope))
						Arr.forEach(losers, (loser) => {
							assert.deepStrictEqual(
								loser.ending.kind === "skipped"
									? [loser.ending.by, loser.onward.length]
									: [loser.ending.kind],
								[first.scope, 0]
							)
						})
						const skipped = yield* rows(app.workload.syncSkipped.once({ params: {}, facts: {} }))
						assert.deepStrictEqual(
							Arr.map(
								Arr.filter(skipped, (s) => Arr.some(rest, (r) => r.scope === s.scope)),
								(s) => s.by
							),
							Arr.map(rest, () => first.scope)
						)
						yield* ringOnAndDrain(ledgers, winner)
						const freed = yield* sync.ledger.coordination.exclusives
						assert.deepStrictEqual(freed, [])
						const later = yield* sync.request.SyncRun(`${relation}-later`, at, {
							relation,
							run: 0n
						})
						yield* admitAndDrain(ledgers, FlowName.make("Sync"), [later.scope])
						const admitted = yield* rows(app.workload.syncAdmitted.once({ params: {}, facts: {} }))
						assert.isTrue(Arr.some(admitted, (a) => a.scope === later.scope))
						c.note("admitted after the seat was given back")
						const copied = yield* rows(app.workload.copied.once({ params: {}, facts: {} }))
						assert.deepStrictEqual(
							Arr.sort(
								Arr.map(
									Arr.filter(copied, (row) => row.relation === relation),
									(row) => Number(row.run)
								),
								(a: number, b: number) => (a < b ? -1 : a > b ? 1 : 0)
							),
							[0, 1]
						)
					})
			)
		)
	)
})
