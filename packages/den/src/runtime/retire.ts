import type { Settled } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Cron, Effect } from "effect"
import type { Instant, ScopeKey } from "#runtime/identity.ts"
import type { FinishedRoot, Ledger } from "#runtime/ledger.ts"

/**
 * Retirement: a root's graph is retired whole once it has ended (its root's finish has its result, or it was recorded
 * skipped), as one group of grizzle's retirable unit whose header is the flow's Root: every scope, step, claim, retry,
 * result, value, read and edge row of the graph goes in one transaction, the header stays retired, and its key never
 * starts a graph again: an operator's or the app's request of it again starts nothing and answers that the root was
 * already requested, as a request of any key already requested does, since the header's key refuses the request's own
 * instant, and a stale holder's write into the graph is refused by the unit's fence. den's
 * retiring role does nothing else, and its retirements of several roots run at once, each a call of its own that runs
 * again on a transient refusal (Settled), so two retirements that meet each other both retire. The coordination group's
 * chains of turns are no part of any unit and stay.
 *
 * A root is retired only once nothing still needs its graph: its exclusivity seat given back, which the census's tick
 * does by reading the graph, and its key no longer one the census requests, the latest instant of its kind's schedule,
 * which a tick requests again and which a retired key would refuse. An app row that references a row of the graph
 * keeps it, its retirement refused naming the relation, until the app lets it go.
 */

/** What a retirement did with one root: retired its graph, or kept it, with the failure that ended its call. */
export type Retirement =
	| { readonly kind: "retired"; readonly root: ScopeKey }
	| { readonly kind: "kept"; readonly root: ScopeKey; readonly error: Settled }

/** Whether the census still requests a root's key: its kind's schedule's latest instant at `at`. */
const requested = <R>(ledger: Ledger<R>, root: FinishedRoot, at: Instant): boolean =>
	Arr.some(
		ledger.scheduled,
		(s) => s.kind === root.kind && Number(root.at) === Cron.prev(s.cron, Number(at) + 1).getTime()
	)

/** Retires every ended root of one flow nothing still needs, each by a call of its own, at a reading of the database's instant. */
export const retire = <R>(ledger: Ledger<R>): Effect.Effect<ReadonlyArray<Retirement>, Settled> =>
	Effect.gen(function* () {
		const at = yield* ledger.now
		const finished = yield* ledger.finishedRoots
		const holding = yield* ledger.coordination.exclusives
		const due = Arr.filter(
			finished,
			(root) => !Arr.some(holding, (e) => e.scope === root.scope) && !requested(ledger, root, at)
		)
		return yield* Effect.forEach(
			due,
			(root) =>
				Effect.match(ledger.retire(root.scope), {
					onFailure: (error): Retirement => ({ kind: "kept", root: root.scope, error }),
					onSuccess: (): Retirement => ({ kind: "retired", root: root.scope })
				}),
			{ concurrency: "unbounded" }
		)
	})

/** The retirements of several flows, in their order. */
export const retireAll = <R>(
	ledgers: ReadonlyArray<Ledger<R>>
): Effect.Effect<ReadonlyArray<Retirement>, Settled> =>
	Effect.map(Effect.forEach(ledgers, retire), Arr.flatten)
