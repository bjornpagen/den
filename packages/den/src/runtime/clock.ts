import { Clock, Effect } from "effect"
import { type Instant, instantOf } from "#runtime/identity.ts"

/**
 * The instant every lease, due instant, window and census tick is judged by: the caller's clock, Effect's, which grizzle
 * takes as a parameter. It is the one place den reads the time, the seam DBCLOCK replaces with the database's own
 * instant as a query term. Keys fence every write, so correctness never rests on it; exactness of seats assumes two
 * callers' clocks differ by less than a lease's margin, which DBCLOCK removes.
 */
export const now: Effect.Effect<Instant> = Effect.map(Clock.currentTimeMillis, instantOf)
