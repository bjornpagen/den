import type { Gen } from "@bjornpagen/testing/gen"

/**
 * Where a fake draws its misbehaviour from: a case's own choice stream (a `Case` of `@bjornpagen/testing/explore` is one), so
 * a search can find, shrink and replay what the outside world did. A fake draws only what the real system decides on
 * its own (whether a page times out, which request the gateway throttles, when an outside actor edits the roster) and
 * takes everything else from its caller.
 */
export type Nature = Readonly<{ draw: <A>(generator: Gen<A>) => A }>
