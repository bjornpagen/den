import type { CallError } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Cron, Effect } from "effect"
import type { Instant, ScopeKey } from "#runtime/identity.ts"
import type { FinishedRoot, Ledger } from "#runtime/ledger.ts"

/**
 * Retirement: a root's graph is retired whole once it has ended (its root's finish has its result, or it was recorded
 * skipped), as one group of grizzle's retirable unit whose header is the flow's Root: every scope, step, claim, retry,
 * result, value, read and edge row of the graph goes in one transaction, the header stays retired, and its key never
 * starts a graph again, so a root requested again under it, or a stale holder's write into it, is refused. The
 * inserters stay READ COMMITTED; den's retiring role does nothing else. The coordination group's chains of turns are
 * no part of any unit and stay.
 *
 * A root is retired only once nothing still needs its graph: its exclusivity seat given back, which the census's tick
 * does by reading the graph, and its key no longer one the census requests, the latest instant of its kind's schedule,
 * which a tick requests again and which a retired key would refuse. An app row that references a row of the graph
 * keeps it, its retirement refused naming the relation, until the app lets it go.
 */

/** What a retirement did with one root: retired its graph, or kept it, with why. */
export type Retirement =
	| { readonly kind: "retired"; readonly root: ScopeKey }
	| { readonly kind: "kept"; readonly root: ScopeKey; readonly error: CallError }

/** Whether the census still requests a root's key: its kind's schedule's latest instant at `at`. */
const requested = <R>(ledger: Ledger<R>, root: FinishedRoot, at: Instant): boolean =>
	Arr.some(
		ledger.scheduled,
		(s) => s.kind === root.kind && Number(root.at) === Cron.prev(s.cron, Number(at) + 1).getTime()
	)

/** Retires every ended root of one flow nothing still needs, each by a call of its own, at a reading of the database's instant. */
export const retire = <R>(ledger: Ledger<R>): Effect.Effect<ReadonlyArray<Retirement>, CallError> =>
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
): Effect.Effect<ReadonlyArray<Retirement>, CallError> =>
	Effect.map(Effect.forEach(ledgers, retire), Arr.flatten)
