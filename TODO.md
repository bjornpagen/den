# TODO

- **Wave 2a, the core:** `packages/den` is mid-build at the settled design (`docs/proposal.md`, `docs/decisions.md`).
  `docs/build/core.md`, the core's notes, is not written yet. The differential harness against `@den/model` is part of
  the brief and unfinished.
- **The repin's seams:** `vendor/grizzle` is on grizzle's `main`; LEASE for the coordination group and DBCLOCK are
  taken, and the seat bound is over the live holds alone. RETIRE waits for grizzle's lane RETIRE3 and its
  `ChangeSet.retire` (`runtime/retire.ts` is its seam; `docs/build/repin.md` holds grizzle's rulings on den's use), then
  GUARD and SCHEMAMAP.
- **The assignment engine (owner, 2026-11-18):** named reads with nearest reads, finite numbers, vectors, arrays and
  tagged unions are built (`docs/decisions.md`). Waiting on grizzle: a step's reads in one snapshot and a nearest read
  from a stored row's vector (asked 2026-11-18), then retirement (RETIRE3); the seat history's restatement for
  retirement waits on Bjorn.
- **Wave 2b:** the operator surface, the eight workloads as den flows on the fakes of `packages/edullm`, differential
  runs at scale, an adversarial review.
