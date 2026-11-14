import { Clock, Effect } from "effect"
import { type Instant, instantOf } from "#runtime/identity.ts"

/**
 * The in-process transport's clock: Effect's, at which the in-process driver delivers a held wake once its delay has
 * passed, so a test's clock decides when a delayed wake lands. It judges nothing else: every lease, due instant and
 * window is judged at a reading of the database's instant (a ledger's `now`), and a delay a turn rings with is a
 * duration between two such readings.
 */
export const now: Effect.Effect<Instant> = Effect.map(Clock.currentTimeMillis, instantOf)
