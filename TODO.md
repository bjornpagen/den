# TODO

- **Wave 2a, the core:** `packages/den` is mid-build at the settled design (`docs/proposal.md`, `docs/decisions.md`).
  `docs/build/core.md`, the core's notes, is not written yet. The differential harness against `@den/model` is part of
  the brief and unfinished.
- **The repin's seams:** `vendor/grizzle` is on grizzle's `main`; LEASE for the coordination group and DBCLOCK are
  taken. RETIRE waits for grizzle's `ChangeSet.retire` (`runtime/retire.ts` is its seam), then GUARD and SCHEMAMAP. Once
  grizzle's MONOTONE certifies a rule over a query READ COMMITTED, the seat bound moves to the live holds alone, so
  lowering a seat count is admitted once no live hold sits above it (`docs/build/repin.md`, `seatcount.test.ts`).
- **Wave 2b:** the operator surface, the eight workloads as den flows on the fakes of `packages/edullm`, differential
  runs at scale, an adversarial review.
