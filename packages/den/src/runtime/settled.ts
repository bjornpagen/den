import type * as gRuntime from "@bjornpagen/grizzle/runtime"
import { Effect } from "effect"

/**
 * A call to an answer that is not a transient refusal: den runs a grizzle call again past each of its transient
 * refusals, and grizzle never runs a call again by itself: den is the one place anything goes again (Bjorn,
 * 2026-11-21). A step goes again by its kind's `retry` and `waits`, and a call of the ledger port, or an app's call to
 * its own served programs, goes again here.
 */

/** A transient refusal: the one CallError that changed nothing, which a call settled runs again past. */
type Transient = Extract<gRuntime.CallError, { readonly _tag: "transient" }>

/**
 * Every failure a call ends with but a transient refusal: what a call settled ends with, and so what every call of the
 * ledger port fails with.
 */
export type Settled = Exclude<gRuntime.CallError, Transient>

/**
 * `call` run again at once while it fails `transient`, and ended by its value or by any other failure, which it fails
 * with as it is.
 *
 * A transient refusal changed nothing, and it means another transaction's work committed first: SERIALIZABLE refused
 * the attempt (40001), a deadlock aborted it (40P01), or the statement met a concurrent transaction's committed change
 * (grizzle's TransientReason names which). PostgreSQL's serializable isolation raises 40001 only where a run of the
 * same transaction from the beginning does not meet the same conflict again ("The second time through, the transaction
 * will see the previously-committed change as part of its initial view of the database", PostgreSQL 19's Transaction
 * Isolation, Serializable Isolation Level), and a deadlock aborts one of its transactions so the other goes on, so each
 * attempt after the first starts past work that committed, and the system advances whatever the attempts number. No
 * count of attempts is defensible: any bound refuses a call that its next attempt completes. Nor is a delay: the
 * conflicting work has already committed, so the next attempt is due at once. A caller that answers by a deadline
 * states it on the call itself (`Effect.timeout`), its own decision, never this combinator's.
 *
 * The failure keeps the call's own kinds but `transient`, so a call that fails with fewer kinds than every CallError
 * keeps them; over every kind it is Settled.
 */
export const settled = <A, E extends gRuntime.CallError, R>(
	call: Effect.Effect<A, E, R>
): Effect.Effect<A, Exclude<E, Extract<E, Transient>>, R> =>
	Effect.retry(call, {
		while: (error: E): error is Extract<E, Transient> => error._tag === "transient"
	})
