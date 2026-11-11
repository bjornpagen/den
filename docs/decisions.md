# Decisions

## Settled by the owner, 2026-11-11

- **Name:** den.
- **The algebra is Effect's.** den implements an engine for `effect/workflow` as Effect's newest release ships it.
  No new computation language. A shortfall of the algebra is reported in the review and pauses the work.
- **Glue Effect's upstream parts.** When in doubt, den uses Effect's upstream code and glues the parts together
  (`effect/cluster`, `effect/persistence`, `effect/sql`, `effect/rpc`, Cron, Schedule, RateLimiter and the rest)
  rather than reinventing them. The research inventories every such part first, so the options are known.
- **grizzle is the only store; PostgreSQL 19 only.** grizzle beats `effect/sql` wherever an Effect part reaches for
  SQL, unless there is no reason to: grizzle on PostgreSQL is a real improvement over a generic SQL driver. An upstream
  part built on `effect/sql` is glued in through a grizzle-backed implementation of its interface.
- **Vercel Queues, through a transactional outbox**, wake the functions that run the work.
- **First use:** a reimplementation of edullm's queueing code inside den. Nothing is backported into edullm.
- **Research before design.** The research lanes only gather; the design is made with the owner afterwards.

## Owner direction, 2026-11-11, to be designed

- **The bet: grizzle holds the computation graph as a graph.** Steps are immutable facts in typed relations, their
  edges are laws PostgreSQL checks, and no payload or result is a JSON blob. No document-store or column-store hacks.
- **The full graph, no hedging (owner, 2026-11-11).** den records the whole computation graph: every step and every
  edge between steps, including data edges from a result to the steps it feeds, joins with several parents, fan-in,
  and edges discovered while running. Effect's algebra records only a tree of executions and their named results;
  where it is partial, den goes past it. Every API, Effect's included, is judged against this target. No local
  maximums.
- **No fire-and-forget work (owner, 2026-11-11).** Every piece of work started is joined by a scope that waits for
  it; work nobody joins is unrepresentable. Joining children is part of the core.
- **den's own core if Effect's is not good enough (owner, 2026-11-11).** den may build its own tight, algebraic core,
  as grizzle did for the relational model: "it's the same move." Effect stays the language a step's body is written
  in.
- **The API is decided on technical merit.** Whether den keeps Effect's `Workflow`/`Activity` API as it is or offers
  a graph of steps with no workflow above them is decided by what is great about Effect's API and whether den can
  measurably do better (`docs/research/api.md`).
- **Every step is an immutable fact.** grizzle's insert-only relations make each step's record a ledger entry, which
  systems that keep step state in their own store apart from the user's data cannot do. There is no separate kind
  of record for workflows and for steps: the whole computation is one graph of facts.
- **As atomic as possible, with as little coordination as possible.** Where a write only adds new facts under their
  keys, no further coordination is needed; the research names the places where some is unavoidable.

## What the research must answer

Gathered by the lanes in `docs/research/`, decided with the owner afterwards, one question at a time:

- What `effect/workflow` persists and assumes of its engine (the `WorkflowEngine` contract), what
  `effect/cluster`'s SQL engine does with it, and where the algebra falls short of edullm's queueing.
- How a claim of work runs on grizzle under concurrency: SERIALIZABLE with retry, a key race grizzle certifies at
  READ COMMITTED, or per-slot queues.
- How a step's own database writes and the engine's state commit in one grizzle transaction, `Stream` rows included.
- Whose clock decides a lease and a timer: grizzle takes the current time as a parameter.
- What a transactional outbox into Vercel Queues needs, and what Vercel Queues guarantee.
- Exploration: what the transport that wakes functions must promise for den to run on others (SQS, plain Vercel,
  Cloudflare, a server of one's own).
- How deployments are fenced: Vercel pins a message to the deployment that sent it.
- What grizzle has to grow for all of the above, each at its smallest.
