# TODO

- **Wave 2a, the core:** `packages/den` is mid-build at the settled design (`docs/proposal.md`, `docs/decisions.md`).
  `docs/build/core.md`, the core's notes, is not written yet. The differential harness against `@den/model` is part of
  the brief and unfinished.
- **The repin's seams:** `vendor/grizzle` is on grizzle's `main`; LEASE for the coordination group and DBCLOCK are
  taken, and the seat bound is over the live holds alone. RETIRE is taken: a finished root's graph retires whole
  (`runtime/retire.ts`, `docs/build/repin.md`); the coordination group's chains of turns (exclusivity seats and pauses; a step's seats are its claim's and retire with its graph) still grow, until the owner
  rules how they are restated. Then GUARD and SCHEMAMAP.
- **The assignment engine (owner, 2026-11-18):** named reads with nearest reads, finite numbers, vectors, arrays and
  tagged unions are built (`docs/decisions.md`), a step's reads are one statement and a nearest read searches from a
  stored row's vector (grizzle's DENREADS), and finished graphs retire. The seat history's restatement for retirement
  waits on Bjorn.
- **Wave 2b:** the operator surface, the eight workloads as den flows on the fakes of `packages/edullm`, differential
  runs at scale, an adversarial review.
- **AlphaTest (owner, 2026-11-20):** ring after request, the seat handoff, finish spawns with child-scope edges and the
  source's named delay are built, and AlphaTest's background work is modelled in den-model; running on Vercel and a
  census for staging (Vercel Cron calls production only) are next.
- **A key names one input, what is left (grizzle main's ruling, 2026-11-25; lane METIS-PROCTOR):** a root kind whose
  input is a derivation of its key declares it so and records nothing, scheduled roots its special case, so a scheduled
  kind's request port takes no input from its caller (v3, next); a step input refined by a check lowers to its contract
  and law (after v3, with DENSCOPE on lower/schema.ts); the fingerprint out of its caller's hands, named by the served
  request program itself under the running den's scheme, so no caller can name another; grizzle's codec text is part of
  its format (engine core/format.ts artifactFormat), which grizzle does not export yet: once it does, each kind's
  fingerprint folds it in at run time, so a repin that changes a value's text changes every fingerprint and a key
  requested before it is the same keyed act; and the model judges a precondition before it records a root, den after it
  records the request, so a key requested again after a blocked admission is answered apart by them, a divergence the
  differential's programs, which hold no precondition, do not reach.
