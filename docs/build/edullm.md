# edullm's outside world (`@den/edullm`)

`packages/edullm` is what den's first use, edullm's queueing rebuilt inside den, talks to: faithful fakes of edullm's
outside systems, Bronze, the app's own facts, and the pure pieces the eight workloads (`../decisions.md`) need. It
imports only `effect` and `@bjornpagen/testing`, nothing of den or grizzle; the flows that drive these fakes come in the next
wave, once den's API settles. The behaviour reproduced is the one edullm measured, as its code at `staging` 903bad4ba
records it (its `packages/platform/pipeline/src/limits.ts` and `packages/data/alphatest-acquisition/src/`).

## How a fake is built

- **The caller owns the clock.** Every call takes the instant it is made at (milliseconds) and answers the instant it
  ended; nothing sleeps and nothing reads a wall clock, so a simulation moves time itself, as grizzle takes time as a
  parameter.
- **Misbehaviour is drawn.** A fake takes a `World` (what the outside system is: its rows, its knees, its outage) and a
  `Nature` (`src/nature.ts`), the choice stream it draws what the real system decides on its own: a page's chunking, a
  statement's failure, which request meets a 5xx, what an outside actor does to the roster. A `@bjornpagen/testing` `Case` is a
  `Nature`, so a search finds, shrinks and replays the outside world's behaviour with the rest of its case.
- **The fake speaks the system's own protocol.** AlphaTest and QTI answer HTTP statuses, exact bodies and Retry-After
  headers; the replica answers binary COPY bodies in chunks and SQLSTATE-named failures. Classifying an answer is the
  flow's job (AlphaTest's `classify` is ported beside its fake, edullm's one table).
- Each fake is an Effect service with a `make…` constructor and a `…Layer`.

## Modules

| module | what it holds | workload |
|---|---|---|
| `copy-binary.ts` | PostgreSQL's binary COPY format as data, the frame scanner (`scannerOf`, `tuplesOf`), the body encoder | W1, W8 |
| `ranges.ts` | half-open ranges never empty, root pages cut by the page budget, the midpoint split | W1 |
| `fingerprint.ts` | MD5 key digests, marks (bucket, fingerprint), prints, the differing buckets, the prune's settle and its absent keys | W1 |
| `flow-control.ts` | the AlphaTest controller of `fetch.ts` as a pure state machine (`bbr`: BBR's probes, TCP's halving) | W2 |
| `replica.ts` | Timeback's replica behind the bastion: catalog, pages, the daily print, bucket keys, edits, seatings | W1, W8 |
| `alphatest.ts` | AlphaTest's five kinds at their knees, the gateway throttle, final answers, the 200-row listing | W2 |
| `qti.ts` | QTI's three collections, `after` chains over a frozen window, a source that changes mid-chain | W3 |
| `reports.ts` | Timeback's Caliper endpoint: an outage until an instant, weather, first acceptance kept by report id | W6 |
| `presence.ts` | an attempt's beacons and the child heard, away derived and permanent, the takedown consumer's standing | W5 |
| `enrollment.ts` | the shared roster that drifts, EduBridge's two writes, edullm's `plan`, the intent ledger fenced by version | W7 |
| `bronze.ts` | the content-addressed, create-only body store by SHA-256, with S3's refusals and lost answers | W1–W3 |
| `app.ts` | the app's own facts as Effect Schemas: cursors, Silver rows, QTI documents, AlphaTest answers, acceptances, intents | all |

W4 (Gold) has no outside system: its views are the app's own SQL.

## Measured numbers

Each is a constant of the fake that reads it, with its evidence in its JSDoc, citing edullm's `limits.ts`: the AlphaTest knees, the 200-row
listing page and the gateway's 40–68 requests a second (drawn by a simulation, never fixed) in `alphatest`; the
bastion's eight seats at 5,227,836.87 bytes a second and 13,941 keys a second a session in `bastion`; QTI's published
1,000-document page in `qti`; BBR's and TCP's published constants in `flow-control`. The 65,536 print buckets are a
format's width (`@formatConstant`), no limit. Every other time, retry or concurrency bound is a caller's input: the
suites draw edullm's values in force with `production`, small ones a sixth of the time.

## The searches

Every case is a search; the bugs a pure piece's search must catch are its property's kills.

| suite | laws |
|---|---|
| `copy-binary` | a body's tuple count under any chunking; its first malformed byte (truncated, trailing, widened tuple, critical flag, signature) |
| `ranges` | root pages tile the window, as wide as the budget allows; halves tile, down to single blocks within ⌈log₂ w⌉ splits |
| `fingerprint` | exactly the absent keys of differing buckets deleted; fetches within budget unless one bucket |
| `flow-control` | the window ≥ 1; it moves only by a kept probe or a once-per-event halving; no ratchet past the knee |
| `alphatest` | 429 exactly past the threshold, Retry-After only where the world sends one; each target's one final status; listing pages; rate grows to the knee and is flat above it |
| `replica` | a page answers within its timeout and holds its blocks' rows; a timeout splits, a one-block page is refused; a changes read; the print and bucket keys prune what the source deleted |
| `qti` | each document of the window once, in identifier order; every document stable for the whole read is read; a chain ends with no `next` |
| `bronze` (`interleave`) | racing writers: one object a body under its SHA-256, never changed, created at most once |
| `reports` (`interleave`) | racing deliveries: one record a report, at its first acceptance, none during the outage, never a malformed report |
| `presence` | the takedown timer, re-armed for the whole-second remainder, takes an attempt down within a second of its going away, never while present |
| `enrollment` | an intent applied only where Timeback agrees; a mark lands only on its own version; an admin's decision outranks the automatic one |

## Where the fakes depart from edullm, and why

- **AlphaTest's knees.** The ramp probe's latency is not Little's law's window ÷ rate (listing: 2 ÷ 0.56 req/s is
  3.57 s, the probe printed 2,538 ms; the other kinds' printed latencies are a third to a half of the quotient). The fake keeps the window and
  the rate, a bottleneck of that rate whose latency at the knee is their quotient.
- **AlphaTest's 429 carries no Retry-After**, as edullm's `answers.ts` records of the 991 throttles of 2026-10-09; the
  header is the world's option, not the default. The throttle is a trailing-window count; API Gateway's real token
  bucket (rate and burst) was never measured.
- **The bastion has no hard cap.** Eight is the operator's hold, so a ninth session opens and every session then
  shares the measured bytes; whether fewer than eight sessions each go faster was never measured, so they keep the
  eighth's share. A statement's time follows its body's bytes, not the blocks it scans. The print answers its buckets
  typed, not as a binary COPY body of edullm's `PRINT_ROSTER`; keys are one text column, not edullm's typed key parts.
- **An empty heap is no page**, where edullm admits a witness page `[0, 1)`: the empty read is the empty list.
- **QTI's `next` is null only when nothing is left**; what the real API answers after an exactly full last page, and
  its count reads (`total`), are not modelled. Items carry only `id` and `updatedAt`.
- **Timeback's report endpoint** keeps the first acceptance per report id, as the brief and edullm's first-write-wins
  acceptance assume; that Timeback itself deduplicates by event id is not in what edullm's code shows. Its refusals are
  503, 500, 403 and 400, edullm's `unavailable`, `server`, `forbidden` and `rejected`.
- **The roster** is reduced to records at our org or elsewhere, active or retired; classes, dates and inactive classes
  are not modelled.
- **Presence's silence window is never the shorter**: edullm's first takedown waits one idle window from entry because
  of it, and the search found a takedown 15 s late when the rules break that order.
- **The flow controller** is ported without `fetchAll`'s loop, deadline and byte budget, which are the W2 flow's; the
  suites' batch driver (`test/support/batch.ts`) is that loop's simulation.
