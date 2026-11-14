# The seams grizzle's main replaces

den is pinned on grizzle's `main`, into which `live` merged, so every commit below is in its pin. Taken: CLASH
(`schema()` takes a list, `lower/merge.ts` deleted), LIVE-SOURCE (the suites' decoder grant deleted), DEFERRABLE (the
status and declared reads deferrable), LEASE and DELTAMET for claims (each flow's Claim races its key, and a claim reads
back the holder it added or met), and CARRIER (that read-back rides the claim's one statement, which generate compiles;
den has no other read-back). den still takes these, each from the grizzle session's report:

- **LEASE (28496788).** `race(R)`, a schema rule beside `mutable`: a raced table's inserts arbitrate at its primary key,
  and the loser meets the stored fact; refused on a mutable relation, a whole-heading or span key, a drawn primary-key
  field, a family's owner or member, a derived relation. The certifier counts a winner read after a clean arbitration as
  arbitrated, and expiry is a new fact (`at + ttl < now`, DBCLOCK's `now`). den's seat relations become raced (its
  claims race since the claim seam), and the seat module (SERIALIZABLE at `a226cbac`) moves to READ COMMITTED; adding or
  dropping `race` is a fingerprint-only migration, after which an old Db answers `StaleSnapshot`
- **POROUS (e509252a, 9a2af8c5).** `fragment(relations, statements)`: a nameless library fragment, identified by its
  content, listed in an app's `schema()` or `schema.extend()` list and a level of every schema that lists it. Programs
  written once over the fragment compile per host at generate, served byte-identical to their host twin. Every
  write-deciding statement over a fragment relation (key, mutable, race, retirable, family, tree, fold) is the
  fragment's own; a host adds only refusals; a role holds the fragment whole to serve its programs. den's
  `lower/print.ts` and `merge.ts` seams are deleted: den exports `fragment([...])`, and the app lists it. Open at the
  repin: how a step's commit, den's fragment facts plus the app's own writes in one call, is written as a host program
  over the fragment and the app's relations
- **DBCLOCK (44cade74, 6172e92c, 8081e6ce).** `clocked(program, { now: unit })` binds `now` to
  `transaction_timestamp()`, one reading per call. Leases, due instants and windows are judged by the database's clock:
  den's caller-clock seam is deleted. Clocked reads serve `once` and no `watch`, which matches den's split: the relay's
  watch reads what commits made eligible, without time; the census reads what time made eligible, as a clocked `once`
- **RETIRE (c70cbed8, 1f935498, f14a46da).** `retirable(header, bodies)` with a declared `retirement` field; adopting a
  unit rewrites each body table once in its migration. Holds (commit 2, f14a46da) grant EXECUTE on each unit's hold to
  its holding roles, with `UnheldGroup` refusals. The retire API (commit 4) is still to come, so den's retirement seam
  stays a seam until then.

Still to come from the grizzle session: RETIRE's `ChangeSet.retire` API (commit 4), then GUARD and SCHEMAMAP.
