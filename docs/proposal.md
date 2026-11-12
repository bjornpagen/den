# den: the proposal

Approved by the owner, 2026-11-11. The decisions behind it are [decisions.md](decisions.md); the evidence is
[research/](research/README.md).

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

Five primitives, and lanes.

- **Step kind.** A name; a typed input, output and error (Effect Schemas); a lane; a body
  `input → Effect<{ output, writes }, Error, R>`, where `writes` is a ChangeSet over the app's relations and `R` never
  holds grizzle's database handle.
- **Scope kind.** A join: it owns the steps started in it and finishes exactly once, after every child has a result.
  Its finish is a step that reads the children's results and returns writes.
- **Root kind.** A scope started by a trigger: a schedule, an operator command, an API call. The only way a graph
  begins.
- **Edge kind.** A pure function from a step's input and output to new step inputs. *Spawn* edges start steps in the
  same scope or a new child scope (chains, fan-out, splits, the next stage); *feed* edges give a step several parents,
  and it runs once all of them have results.
- **Await kind.** A step with no body whose result is inserted from outside (a webhook, an operator, an instant
  passing for a timer); the first insert wins.
- **Lanes.** Every step kind runs on a lane, with a width (the most of its steps running at once across every graph),
  a pause and a window. Flow-control state (AlphaTest's BBR window) is a field carried along a chain edge.

A step ends `done` (output, writes, spawns), `failed` (a typed error), `retry` (due again at an instant, counted as an
attempt or a wait), `stopped` (its scope was stopped) or `lost` (another fact already holds its key). Ceilings on
attempts, reclaims and waits turn endless retrying into `failed`.

Laws: a step has exactly one owning scope, fixed at spawn, so ownership is a tree; a step has at most one result, the
first; a scope finishes once, after all its children; results never change; outputs flow only along declared edges.
Unrepresentable: fire-and-forget, untyped values, writes outside a step's returned writes, cycles of ownership, edges
nobody declared.

The QTI chain, as an illustration of shape only:

```ts
const qti = lane("qti", { width: 3 })
const Page = step(qti, "QtiPage", { input: PageInput, output: PageRead, error: QtiRefused }, readPage)
const Next = edge(Page, Page, (page, read) => Option.map(read.next, (after) => ({ ...page, seq: page.seq + 1n, after })))
const Read = scope("QtiRead", { input: Window, start: (w) => [Page.first(w)], finish: moveFrontier })
const Nightly = root("QtiNightly", { trigger: schedule("0 7 * * *"), start: () => COLLECTIONS.map(Read.of) })
export const qtiFlow = flow("qti", { lanes: [qti], kinds: [Page, Read, Nightly], edges: [Next] })
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
  level (`research/porous.md`).
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

## 7. Coordination

Free, because each only adds facts: recording a result, spawning, adding edges, moving a cursor forward, an await's
first insert. One key decides each of: a claim (`Claim(step, attempt)`, certified READ COMMITTED: ask 4), width (slot
facts decided by key), a scope's finish, and retirement (a finished root's graph deleted whole: ask 5; history lives in
spans). Time is a parameter in grizzle; keys fence every write, so correctness never depends on a clock, only liveness
does (ask 6).

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
acknowledged, a finite `maxDeliveries`, an idempotency key per step attempt. The contract any transport must meet is in
`research/transports.md`; SQS, Cloudflare and a server of one's own come later.

## 11. Effect's place

Used: Effect for step bodies and the runtime; Schema, the source of every lowered type; Scope and interruption; `Cron`
for root triggers; `Schedule` for retry ladders; `TestClock`. Not used: the workflow engine (replay, JSON),
`effect/cluster` (long-lived runners), `effect/sql`.

## 12. Testing

A deterministic simulator on `@den/testing`: a fake transport that drops, duplicates, delays and pins messages;
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

`vendor/grizzle` is a git submodule pinned at `a226cbac` of grizzle's `live` branch, its `engine` and `grizzle`
packages in the workspace through the `grizzle-source` condition. Effect 4.1.4. A PostgreSQL 19 cluster of den's own
(`pnpm pg`), from the build grizzle's `scripts/pg` makes, with `wal_level=logical`.

## 15. grizzle's part

The owner's order, sent to the grizzle session on 2026-11-11: fix every defect in `research/grizzle-defects.md` on the
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

den repins `vendor/grizzle` as each lands on `live`.

## 16. Open, decided with the owner one at a time

1. The claim protocol and width. 2. The clock. 3. Retiring finished graphs. 4. Where the relay runs, and the WAL
bound. 5. Defect values and type refusals. 6. What stopping means for a running step. 7. Which role runs a step's
writes into the app's relations.
