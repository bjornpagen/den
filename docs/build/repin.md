# The seams grizzle's main replaces

den is pinned on grizzle's `main`, into which `live` merged, so every commit below is in its pin. Taken: CLASH
(`schema()` takes a list, `lower/merge.ts` deleted), LIVE-SOURCE (the suites' decoder grant deleted), DEFERRABLE (the
status and declared reads deferrable), LEASE and DELTAMET for claims (each flow's Claim races its key, and a claim reads
back the holder it added or met), CARRIER (that read-back rides the claim's one statement, which generate compiles; den
has no other read-back), POROUS (each flow is two grizzle fragments the app lists, its graph and its coordination
group; den's programs are written over them, and each commit is a union of den's facts with the app's writes), LEASE
for the coordination group, and DBCLOCK:

- **LEASE for the coordination group (28496788).** The group is insert-only, and every den role, each flow's
  coordinator role included, certifies READ COMMITTED (`certification.test.ts`). Each seat, exclusivity seat and pause is
  a chain of turns: `<P>Hold(resource, seat, turn, holder, until)` keyed by `(resource, seat, turn)`, `<P>Freed(resource,
  seat, turn)` contained in it, and `contained(on(<P>Hold, "resource", "seat", pred("turn")), on(<P>Freed, "resource",
  "seat", "turn"))`, so a turn after the first needs its predecessor freed and a seat holds at most one live hold, which
  the database enforces. Taking a lapsed seat frees its turn and holds the next in one call; giving back inserts
  `Freed`, which is the same row, no change, for a turn another holder already freed and took over. The live holds are the
  holds with no `Freed`; a seat's next turn is one past its latest, `r.max(turn)` grouped by seat, or 0. Exclusivity seats
  (`<P>Exclusive` and `<P>Released`, by `(kind, key, turn)`) and pauses (`<P>Paused` and `<P>Resumed`, by `(target,
  turn)`) take the same shape. A resource's seat count is a closed relation, `closed.relation("<P>Seats", { resource,
  seats }, ["resource"], …)` from the flow's declaration, and every hold's seat is checked below it (`check("SeatBelowCount",
  <P>Hold, (row) => row.lt(row.seat, <P>Seats.at("seats", row.resource)))`), so provisioning is gone. The coordinator role
  (`<p>_coordinator`) holds the group's rosters and relations by name, since no role holds a closed relation. None of
  these relations races: a multi-resource take must win every seat or none, which one call refused whole on any held key
  gives and a raced insert would not (it can win one seat and meet another), and a raced insert at a turn a stale read
  chose meets that turn's old row, which says nothing of who holds the key now; a refusal and a fresh read do. Until
  RETIRE, the turns accumulate as the graph does, and the status reads scan them as the graph's do.

  One outcome moved: **lowering a resource's seat count.** The provisioned seats let the census remove a seat once its
  hold was given back. Now a changed `<P>Seats` replaces and validates `SeatBelowCount` against every `Hold` row, freed
  turns included, so a migration that lowers a count is refused while any turn, live or freed, sits at or above the new
  count, which is always once that seat was used, until RETIRE deletes turns (`seatcount.test.ts` holds it). The owner's choice was to bound the live
  holds alone, a rule over a query (`derived` live holds, `Hold` with no `Freed`, checked below the count), and grizzle
  states it only in a level above the app's (a fragment declares no derived relation) and certifies the coordinator role
  SERIALIZABLE for it (`laws`: a rule over a query, which a trigger checks), giving up the READ COMMITTED LEASE exists
  for; it waits on grizzle. Growing a count is a migration that validates at once.

- **DBCLOCK (44cade74, 6172e92c, 8081e6ce).** `clocked(program, { now: unit })` binds `now` to
  `transaction_timestamp()`, one reading per call. Each flow's den role serves a clocked read of the database's instant
  alone, `<p>Now: clocked(query(<p>Graph).rule((r) => r.find({ now: r.param("now", DenInstant) })), { now: "millis" })`,
  and the ledger port answers it as `now`. The census's tick and the relay's pass read it once each and judge leases,
  due instants and windows at that reading; a turn judges its claim and its gates at a reading, its retry's due instant
  is stamped from a reading, its commit's spawns are due from one, and the timers it rings are the durations between
  two readings. An invocation's end is its first reading plus its budget, and a claim's lease is that end, so no host's
  clock judges anything. `runtime/clock.ts` keeps only the in-process transport's clock, at which the in-process driver
  delivers a held wake once its delay has passed. Clocked reads serve `once` and no `watch`, which matches den's split:
  the relay's watch reads what commits made eligible, without time, and the census reads what time made eligible. The
  suites cannot move the database's clock: their ledgers read it moved on by the time their TestClock travelled since
  they were opened (`integration/support/slice.ts`), and `stale.test.ts` holds each flow's reading between two of
  PostgreSQL's own.

den still takes this, from the grizzle session's report:

- **RETIRE (c70cbed8, 1f935498, f14a46da).** `retirable(header, bodies)` with a declared `retirement` field; adopting a
  unit rewrites each body table once in its migration. Holds (commit 2, f14a46da) grant EXECUTE on each unit's hold to
  its holding roles, with `UnheldGroup` refusals. The retire API (commit 4) is still to come, so den's retirement seam
  stays a seam until then.

Still to come from the grizzle session: RETIRE's `ChangeSet.retire` API (commit 4), then GUARD and SCHEMAMAP.
