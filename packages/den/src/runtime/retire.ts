import { Sha256 } from "@bjornpagen/grizzle"
import { Array as Arr, Effect } from "effect"
import type { Ledger } from "#runtime/ledger.ts"
import type { Settled } from "#runtime/settled.ts"

/**
 * Retirement: a root's graph is cleared once it has ended (its root's finish has its result, or it was recorded
 * skipped), under its root, the key of grizzle's unit DenRoot every graph relation leads with: one call deletes every
 * scope, step, claim and its holds, retry, result, value, read reference and edge row of the graph, each relation's
 * rows at the root, and keeps the root's record, the closed fact that it was requested, and what an app's or an
 * operator's root was requested with (RequestedWith), so its key never starts a graph again: a request of it again
 * starts nothing, since a request inserts its graph's rows only where no record holds its root (lower/print.ts
 * requestOfRoot), and is answered as already requested, the app's write it rides in committing its own, unless it names
 * another input under its kind's same input heading, which RequestedWith's key refuses, retired or not; and a stale
 * holder's write into the graph is refused by the foreign keys into the rows its clearing deleted. The records' rows a
 * read found stay, closed facts outside every unit. den's retiring role does nothing else, and its retirements of
 * several roots run at once, each a call of its own that runs again on a transient refusal (Settled). The coordination
 * group's chains of turns are no part of any unit and stay.
 *
 * A root is retired only once nothing still needs its graph: its exclusivity seat given back, which the census's tick
 * does by reading the graph. A schedule's key the census still requests is retired like any other: the tick's request
 * of it again answers that it was already requested. An app row that references a row of the graph keeps it, its
 * retirement refused naming the relation, until the app lets it go.
 */

/** What a retirement did with one root: retired its graph, or kept it, with the failure that ended its call. */
export type Retirement =
	| { readonly kind: "retired"; readonly root: Sha256 }
	| { readonly kind: "kept"; readonly root: Sha256; readonly error: Settled }

/** Retires every ended root of one flow nothing still needs, each by a call of its own. */
export const retire = <R>(ledger: Ledger<R>): Effect.Effect<ReadonlyArray<Retirement>, Settled> =>
	Effect.gen(function* () {
		const finished = yield* ledger.finishedRoots
		const holding = yield* ledger.coordination.exclusives
		const due = Arr.filter(
			finished,
			(root) => !Arr.some(holding, (e) => Sha256.equals(e.scope, root))
		)
		return yield* Effect.forEach(
			due,
			(root) =>
				Effect.match(ledger.retire(root), {
					onFailure: (error): Retirement => ({ kind: "kept", root, error }),
					onSuccess: (): Retirement => ({ kind: "retired", root })
				}),
			{ concurrency: "unbounded" }
		)
	})

/** The retirements of several flows, in their order. */
export const retireAll = <R>(
	ledgers: ReadonlyArray<Ledger<R>>
): Effect.Effect<ReadonlyArray<Retirement>, Settled> =>
	Effect.map(Effect.forEach(ledgers, retire), Arr.flatten)
