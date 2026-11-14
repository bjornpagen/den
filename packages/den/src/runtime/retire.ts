import { Effect } from "effect"
import type { ScopeKey } from "#runtime/identity.ts"
import type { Ledger } from "#runtime/ledger.ts"

/**
 * Retirement, built against grizzle's RETIRE contract: a root's graph is retired whole once its root's finish has its
 * result (every scope, step, claim, retry, result, value, read and edge row its derived keys reach), as one sealed group,
 * without forcing any insert-only writer onto SERIALIZABLE, and a retired key never recurs, so a root requested again
 * under a retired key is refused rather than started as a new graph with the same derived identities. grizzle's main
 * declares retirable units and holds them (`retirable(header, bodies)`, c70cbed8, 1f935498, f14a46da), but the call
 * that retires a group, `ChangeSet.retire`, is not built, and any delete of a graph relation would decertify every
 * inserter of it (`privileges`), so this seam deletes nothing yet and graphs grow, the coordination group's turns with
 * them, until it lands; there is no interim janitor.
 */
export const retire = <R>(_ledger: Ledger<R>, _root: ScopeKey): Effect.Effect<void> => Effect.void
