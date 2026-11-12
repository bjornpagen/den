# Goals

The owner's goals for den, 2026-11-11.

1. **Effect-based execution as a declarative language.** The computation is written in Effect. Where Effect already
   includes a computation algebra, den uses it as it is, in Effect's newest release: Effect 4.1.4 ships
   `effect/workflow` (Workflow, Activity, DurableClock, DurableDeferred, DurableQueue and the `WorkflowEngine`
   contract, with an in-memory engine) and `effect/cluster` (a SQL-backed `ClusterWorkflowEngine`). den is an engine
   for that algebra, not a new one. Where the algebra falls short, the shortfall goes into the review and the work
   pauses for the owner. When in doubt, den uses Effect's upstream code and glues the parts together rather than
   reinventing them.
2. **Painless lowering onto grizzle.** What a workflow persists becomes grizzle relations, laws and writes.
3. **Deep coupling with grizzle.** den takes every advantage of grizzle's transactions and ACID guarantees; the
   workload is assumed to be primarily database work.
4. **Execution scheduled on Vercel Queues, dead easily, through a transactional outbox.** What a transaction decides
   to run next is recorded in that same transaction and delivered to Vercel Queues after it commits.
5. **First use: a clean, far better reimplementation of edullm's queueing code**, as den's own first program.

## Scope

- **PostgreSQL 19 only**, because grizzle is PostgreSQL 19 only.
- **Forward-looking.** This is an extraction: nothing is backported into edullm, and edullm's PostgreSQL 18
  database, its Drizzle schema and its deployment are not den's concern.
- **grizzle is the only store.**

## Exploration

Owner, 2026-11-11, as exploration only: the transport that wakes functions might be swappable. Vercel Queues is the
first; others worth knowing are SQS, plain Vercel (cron, `waitUntil`, a function that calls itself), Cloudflare
(Queues, Durable Object alarms, Workflows), and a server of one's own (supervised Node spawns, systemd, celld).

Owner, 2026-11-11, also exploration only: more projections of a login's served file, beside its OpenAPI document,
each reading `watch` events (`reset`, `upsert`, `remove`, `ready`) as keyed state and calling writes through `once`:

- an htmx dashboard generated from the served programs, each event's data an HTML fragment swapped by row key;
- an OpenTUI console (`sst/opentui`), possibly generated from the OpenAPI document by a `tui` mode of
  `effect-openapi-cli-generator`, possibly served over SSH (`@opentui/ssh`); its Node support is unverified;
- a GraphQL adapter through Effect's `effect/graphql`, persisted documents only.

## Phase

The design is approved (`proposal.md`) and being built in waves; `../TODO.md` says what is next.
