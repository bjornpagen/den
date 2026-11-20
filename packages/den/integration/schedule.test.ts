import { tick } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { retire } from "@bjornpagen/den/runtime/retire"
import { Db } from "@bjornpagen/grizzle/runtime"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect } from "effect"
import { AppServed, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"

/**
 * A scheduled root's key, retired and requested again, on PostgreSQL 19: the census ticks the clock, whose tick requests
 * the root its cron's latest hour names, at the request's own instant, and rings its admission; the transport is
 * drained, the hour chimes once and the root finishes; a retirement retires it, as any ended root, though the census
 * still requests its key; and every tick after it within the hour requests that key again, which answers that the root
 * was already requested, since its header's key refuses another instant, rings nothing for the retired root, whose
 * graph is gone, and brings no graph row back.
 *
 * Oracle (specification): one chime of the hour; the first tick rings exactly the root's admission; the retirement
 * retires it; each tick after it succeeds and rings nothing; and the flow's snapshot holds no scope and no step.
 */

type Feature = "one tick after" | "several ticks after"

interface Run {
	readonly after: number
}

const runs: Gen<Run> = (source) => ({ after: source.draw(int(1, 3)) })

/**
 * Retires a scheduled root the census still requests, whose key requested again answers it was already requested.
 *
 * Budget: provisional, the retirement suite's (8 independent cases and 8 steered), over one to three ticks after it.
 */
export const aRetiredScheduledRootsKeyRequestedAgainStartsNothing = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: ["one tick after", "several ticks after"] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.after > 1 ? "several ticks after" : "one tick after")
						const { clock, ledgers } = yield* openLedgers
						const app = yield* Db.open(AppServed.roles.auditor, {})
						const first = yield* tick(clock.ledger)
						const admits = Arr.filter(first.rings, (ring) => ring.wake._tag === "Admit")
						assert.equal(admits.length, 1)
						yield* drain(ledgers)
						const chimes = yield* rows(app.workload.chimes.once({ params: {}, facts: {} }))
						assert.equal(chimes.length, 1)
						const retired = yield* retire(clock.ledger)
						assert.deepEqual(
							Arr.map(retired, (r) => r.kind),
							["retired"]
						)
						const after = yield* Effect.forEach(Array.from({ length: run.after }), () =>
							Effect.tap(tick(clock.ledger), () => drain(ledgers))
						)
						assert.deepEqual(
							Arr.flatMap(after, (t) => t.rings),
							[]
						)
						const again = yield* rows(app.workload.chimes.once({ params: {}, facts: {} }))
						assert.equal(again.length, 1)
						const snapshot = yield* clock.ledger.snapshot
						assert.deepEqual([snapshot.scopes.length, snapshot.steps.length], [0, 0])
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "one chime, the root retired, and every tick after it ringing nothing and failing nothing"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/bind.ts",
			original: "(error: Settled) => refusedOnKey(error, [`",
			replacement: "(error: Settled) => false && refusedOnKey(error, [`",
			why: "A request of a key already requested, which its header's key refuses, fails where it answers that the root was already requested: the census's tick of a retired schedule's key fails."
		},
		{
			file: "packages/den/integration/slice/generated/clock.binding.ts",
			original: '...Arr.flatMap(read.requested, (s) => view(s.scope, "requested")),',
			replacement: '...Arr.flatMap(read.roots, (s) => view(s.scope, "requested")),',
			why: "A retired root reads as requested, its header standing with no admission: every tick rings its admission again, for ever."
		}
	]
})
