# den: the proposal

Approved by the owner, 2026-11-11. The decisions behind it are [decisions.md](decisions.md).

## 1. The problem

A program does work over time: it reads, writes, fans out, joins, waits and retries, on machines that die, on hosts
that live 800 seconds, woken by a queue that delivers late, twice or never. Its work is mostly database work. Today it
takes an engine whose store sits beside the program's database, where a step's result and the program's own write
never land as one fact, or a hand-built ledger like edullm's kernel, which took about twenty incidents to get right.

## 2. The idea

A computation is a graph of facts, and grizzle can hold that graph exactly, inside the app's own schema. The program
declares the graph's shape; den lowers it into ordinary grizzle relations, laws, roles and programs, which
`grizzle generate` compiles beside the app's own in the same run. After that, den is gone: there is grizzle, and a
small runtime that claims a step, runs its body and commits it in one call. Exactly-once database effects, the deploy
fence, the HTTP API, live status and the outbox all come from grizzle.

## 3. First principles

1. **The ledger is the only authority.** A transport is a doorbell: a lost, duplicated or late wake costs nothing.
2. **The computation is a graph of immutable typed facts.** Steps, edges, results, failures and claims; nothing is a
   blob.
3. **The shape is declared.** Step kinds, scope kinds and edge kinds are known when `grizzle generate` runs; a result
   decides only which declared edges it takes, and how often.
4. **Every piece of work is joined.** Every step lives under a scope that finishes only after all its children.
   Fire-and-forget is unrepresentable.
5. **Monotone by default.** Facts only accumulate, so recording them needs no coordination (CALM). Coordination happens
   only where it cannot be avoided, each time as a race on one key.
6. **Exactly once for the database, at least once for everything else.** A step's own writes and its result commit in
   one grizzle call; work outside the database is safe to repeat by digest or key.
7. **A step's body cannot reach the database.** It returns its writes as data.
8. **Porous and erased.** den's declarations become the app's own grizzle declarations; den owns no installation,
   root, login, layer or schema. The app's code reads, joins and writes den's facts, and den's steps write the app's
   relations.
9. **Serverless-native, not serverless-bound.** Every unit fits a function's lifetime; nothing needs a long-lived
   process.
10. **Every limit has evidence.**

## 4. The algebra

Four primitives and resources, each needed by a workload of the eight (`decisions.md`); feed edges with several
parents, awaits completed from outside, stopping, fairness and priority are not built, because no workload needs them.

- **Step kind.** A name; a typed input, output and error (Effect Schemas); its declared reads (W1's fingerprint, W5's
  presence, W7's intents), taken before its body runs and recorded as part of its input; the resources it holds a
  seat of while it runs; its retry ladder, ending after `n` attempts (W1 to W4) or never (W6's reports), written out
  either way; a due instant (backoff, W5's timer, W6's delay). Its body is
  `input → Effect<{ output, writes }, Error, R>`, where `writes` is a ChangeSet over the app's relations and `R` holds
  no grizzle handle.
- **Scope kind.** A join: it owns the steps started in it and finishes exactly once, after every child has ended
  (done or failed); its finish is a step that reads the children's endings and returns writes (a cursor moved, or held
  where a child failed). A scope kind may hold a seat for its whole life: that is exclusivity (one live run per
  relation, W1; per collection, W3; per request kind, W2; one Gold build, W4). It may carry a window (W1 to W4) and a
  precondition, a read that must be empty for it to be admitted (W4: no Timeback or QTI step pending).
- **Root kind.** A scope started by a trigger: a schedule (W1 to W4, W7), an operator (W4's button, W8) or the app's
  own write inside its own transaction. The only way a graph begins; its key is its trigger and idempotency key.
- **Edge kind.** A pure function from a step's input and output to the inputs of the steps it spawns, in the same
  scope or in a new child scope: chains whose result names the next step (W2, W3, W4), a timer that re-arms (W5),
  fan-out over a computed partition with split (W1), the next stage (W1, W2, W4). A step that fails spawns nothing.
- **Resources.** A named bottleneck whose capacity is its seats, as rows, each count a limit with evidence: W1's
  replica holds 8, the operator's hold on a bastion shared with other principals. A fixed host (a server of one's own,
  celld) is a resource whose seats are its workers; on an elastic host compute is no resource. A step holds a seat
  while it runs; a scope holds one for its life. No two holders share a seat key, so a bound is never exceeded.
  Pausing attaches to a resource or a root kind. AlphaTest's adaptive window is not a resource: it bounds requests
  inside one link's body and travels along the chain edge.

A step ends `done` (output, writes, spawns), `failed` (a typed error, or its ladder ended), `retry` (due again at an
instant) or `lost` (another fact already holds its key). A defect is no state of its own: the attempt ends, the step is
retried on its ladder, and the defect's detail goes to its span.

Laws: a step has exactly one owning scope, fixed at spawn, so ownership is a tree; a step has at most one result, the
first; a scope finishes once, after all its children have ended; results never change; outputs flow only along
declared edges; a seat has at most one holder; a window contains at least one census tick. Unrepresentable:
fire-and-forget, untyped values, writes outside a step's returned writes, reads nobody declared, cycles of ownership,
edges nobody declared, a bound without evidence.

The QTI chain, as an illustration of shape only:

```ts
const Page = step("QtiPage", { input: PageInput, output: PageRead, error: QtiRefused, retry: attempts(5) }, readPage)
const Next = edge(Page, Page, (page, read) => Option.map(read.next, (after) => ({ ...page, seq: page.seq + 1n, after })))
const Read = scope("QtiRead", { input: Window, exclusive: (w) => w.collection, window: utcHours(7, 13), start: (w) => [Page.first(w)], finish: moveFrontier })
const Nightly = root("QtiNightly", { trigger: schedule("0 7 * * *"), start: () => COLLECTIONS.map(Read.of) })
export const qtiFlow = flow("qti", { writes: Loader, kinds: [Page, Read, Nightly], edges: [Next] })
```

Timeback's daily job: `TimebackDaily` starts `Print`; Print's edge starts a child scope `Pages` (one `Page` per block
range, a split edge for a page too large); `Pages`' finish starts `Prune`; `TimebackDaily`'s finish moves the cursor.
A stage boundary is a scope's finish, the one point CALM says needs coordination.

## 5. Erasure into the app's schema

A flow lowers to a fragment the app's own `schema(...)` takes, and to programs and roles built over the app's schema
value:

```ts
const qtiFlow = den.lower(qti)
export const App = schema("App", { ...appRelations, ...qtiFlow.relations }, [...appLaws, ...qtiFlow.laws])
const qtiPrograms = qtiFlow.programs(App)
export const Worker = login(App, "worker", [AppRole, ...qtiPrograms.roles])
```

- Relations and laws are plain values, so den's spread into the app's call, and foreign keys run both ways within the
  level.
- Programs are built over the app's schema value; whether a builder generic over any schema holding den's fragment
  typechecks is open (grizzle ask 1).
- Every generated name carries its flow's prefix; den's merge checks clashes until grizzle does (ask 2).
- den's fragment has no derived relation and no rule over a query.
- Every den role is designed to certify READ COMMITTED, so it never drags an app role to SERIALIZABLE.
- One installation, one snapshot, one migrations chain: adding a flow or upgrading den is an ordinary migration of the
  app.
- On grizzle's `live` branch every login that serves a read already needs the live source; den adds nothing
  installation-wide.
- The owner's floor, a named schema of den's in the same `grizzle generate` run, exists today only as a level, which
  is blind above the app or takes the installation below it; it needs grizzle ask 3.

## 6. The graph as relations

Generated into the app's schema under the flow's prefix; every optional thing is its own relation, never a nullable
column. Generic, per flow: `Lane`, `Slot`, `Paused`, `Window`, `Root` (trigger, idempotency key), `Scope` (kind,
spawning step), `Step` (kind, owning scope), `Claim` (step, attempt, slot, until), `Finished`, `Failed`, `Stopped`,
`Retry`. Per declared kind: a typed input and output relation per step kind, a typed error relation, and one edge
relation per edge kind with a foreign key on each side.

- **Identity is derived:** a step's key is (parent step, edge kind, ordinal), a root's (trigger, idempotency key), so a
  step run twice spawns onto the same keys, which grizzle reads as no change.
- **Types from Effect Schema:** Struct to relation, literal union to closed relation, tagged union to a header with a
  table per variant, Option to a row that may be missing, Array to an ordered family, brand to contract, recursive to
  tree; `Unknown`, `Any` and function refinements are refused.
- **Edges are foreign keys.** "This scope is done" is a read-only query and a key race on the finish, sound because
  only a child's own result, committed in the same call, can add a sibling.

## 7. Coordination and the scheduler

Free, because each only adds facts: recording a result, spawning, adding edges, moving a cursor forward. One key
decides each of: a claim (`Claim(step, attempt)`), a seat (`(resource, seat)`, exact: the 9th holder of an
8-seat resource finds no key), a scope's finish, and a root's admission (its trigger and idempotency key, behind its
precondition and exclusivity seat). Retirement deletes a finished root's graph whole under grizzle's RETIRE; until it
lands nothing is deleted and no interim janitor exists. Time is a parameter in grizzle until DBCLOCK; keys fence every
write, so correctness holds whatever the clocks say, and exactness of seats assumes clocks drift less than a lease's
margin (60 s), which DBCLOCK removes (Gray and Cheriton's lease).

**Eligibility** (issue's law, durable): a step may run once its parent ended, its due instant passed, its root is
inside its window, nothing it touches is paused, and a seat of every resource it uses is free. **Order** when seats
are contended: the oldest root first, then the earliest due, so nothing starves; no priority or fairness keys.
**Ringing**, three paths: the committing function continues with its own first spawn and rings the rest; the relay
rings what someone else's commit made eligible (the app's own write, an operator); the census tick rings what time
made eligible (windows, due instants, expired leases). Exact timers (W5's 180 s) ride the transport's delayed delivery,
the census as their net. On a fixed host the relay's watch is the transport and the host's workers are seats.

Taking and giving back seats certifies SERIALIZABLE at `a226cbac` (the disjoint-key 40001 the owner keeps is
retryable and, at W1's measured one claim per seven seconds, rare); grizzle's LEASE moves the same relations to READ
COMMITTED with nothing in den changed.

## 8. How it runs

1. **The relay** watches a served read, the due steps with free slots per lane. grizzle's live leader streams commits
   in commit order, at least once, and only once they are visible; the relay sends one transport message per new row,
   keyed by step and attempt. That is the transactional outbox by log tailing: no wake table.
2. A function wakes for the step and inserts its `Claim`; a lost race stops it.
3. It runs the body under the step's deadline; on interruption grizzle cancels the server's statement.
4. One grizzle call commits the output, the body's writes and the spawns. A duplicate run changes nothing; a stale
   holder is refused on the key and ends `lost`.
5. It takes further turns while its budget allows, then sends a continuation.
6. **The census**, a tick about once a minute, re-runs the relay's read at the tick's instant: due instants, expired
   leases, timers. It writes only key races.

Endings come from grizzle's `CallError`: `transient` is a wait, no attempt spent; `unavailable` and `transport` are an
attempt; `refused` is `failed`, naming the law and its witness; `stale` is the deploy fence, on which an old
deployment acknowledges its wake and exits. A finished root's graph is deleted whole.

## 9. The surface is the app's login

den's operator verbs (start a root, stop a scope, pause and resume a lane, complete an await, watch the status) are
served programs in roles the app lists in its own logins, so they appear in the app's routes
(`POST /<login>/<role>/<program>`), its OpenAPI 3.2 document and its typed client. Awaits are webhooks; status is a
live `watch` over SSE; the CLI is generated from the app's OpenAPI document by `effect-openapi-cli-generator` once it
works. Exploration: workers anywhere, calling the claim and commit programs over HTTP with only a token.

## 10. Transports

Vercel Queues first: one topic per lane, a visibility timeout equal to the function's lifetime, every delivery
acknowledged, a finite `maxDeliveries`, an idempotency key per ring's cause. Any transport that delivers "take this
step" after commit, losses and duplicates allowed, meets den's contract; SQS, Cloudflare and a server of one's own
come later.

## 11. Effect's place

Used: Effect for step bodies and the runtime; Schema, the source of every lowered type; Scope and interruption; `Cron`
for root triggers; `Schedule` for retry ladders; `TestClock`. Not used: the workflow engine (replay, JSON),
`effect/cluster` (long-lived runners), `effect/sql`.

## 12. Testing

A deterministic simulator on `@bjornpagen/testing`: a fake transport that drops, duplicates, delays and pins messages;
functions that die; a clock the test controls; a fake leader that hands over and replays. Properties: every pending
step has a bounded next move; one result per step; each scope finishes once, after all its children; width is never
exceeded; a re-run changes nothing; `stale` drains old deployments; an app schema with den spread into it certifies its
own roles as before, and a flow added or removed is a clean migration. Integration on PostgreSQL 19 with logical
replication.

## 13. First use: edullm's queueing, rebuilt

QTI is a chain in a scope; Timeback growth a fan-out scope; Timeback daily print, a pages scope, prune; AlphaTest one
chain per request kind carrying its flow, the listing gate a stage, then scans; Gold a chain of one-view steps whose
finish swaps generations; cursors are the app's facts that a finish moves forward. Gone: `fenceShare` and the loader
role, `due_at = 'infinity'`, `prune_refused`, `job_qti_end`, per-lane claim and commit SQL, the wake-key bug, the
outbox send path, the second scheduler, removing old deployments by hand.

## 14. The repository

`vendor/grizzle` is a git submodule pinned on grizzle's `main` branch, its `engine` and `grizzle` packages in the
workspace, whose exports name their TypeScript sources. Effect 4.1.4. A PostgreSQL 19 cluster of den's own
(`pnpm pg`), from the build grizzle's `scripts/pg/pin.env` pins, with `wal_level=logical`.

## 15. grizzle's part

The owner's order, sent to the grizzle session on 2026-11-11: fix every known grizzle defect that affects den, on the
`live` branch. The owner's rulings there, the same day:

- **Kept as is:** the false 40001 between SERIALIZABLE writers of disjoint keys (retryable, never a wrong answer; den
  keeps its hot paths at certified READ COMMITTED, where SSI never applies), and the SSI conflict-out patch, not carried
  in grizzle's build so local behaviour matches RDS, filed upstream when the owner chooses.
- **Approved, each designed by its own lane before code, all on `live`:** RETIRE (retiring whole sealed groups without
  forcing insert-only writers onto SERIALIZABLE; retired keys never recur), LEASE (the certified READ COMMITTED lease
  race), DELTAMET (`delta.met`), CARRIER (no temporary table per call), DBCLOCK (a database-clock term), DEFERRABLE
  (deferrable read-only reads), CLASH (fragment name clashes refused), DENTRIAGE (the remaining catalogue items), and,
  as slots free, POROUS (programs generic over a fragment), GUARD (a guard over a whole ChangeSet) and SCHEMAMAP (the
  Effect Schema mapping, `Exit` and `Cause`).
- **In motion:** RULESEED (rules over queries no longer quadratic, on `main`, then merged into `live`), the 19rc2
  repin on 2026-11-12, and `stale` (already a typed CallError on `live`).

den repins `vendor/grizzle` along grizzle's `main`, into which `live` merged.

## 16. Settled with the owner

Every open decision is settled (`decisions.md`): exact seats, declared reads, writes under the app's own role, the
eight workloads and nothing invented, retirement under RETIRE, the clock as a parameter until DBCLOCK.
