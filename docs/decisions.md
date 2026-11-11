# Decisions

## Settled by the owner, 2026-11-11

- **Name:** den.
- **The algebra is Effect's.** den implements an engine for `effect/workflow` as Effect's newest release ships it.
  No new computation language. A shortfall of the algebra is reported in the review and pauses the work.
- **grizzle is the only store; PostgreSQL 19 only.**
- **Vercel Queues, through a transactional outbox**, wake the functions that run the work.
- **First use:** a reimplementation of edullm's queueing code inside den. Nothing is backported into edullm.
- **Research before design.** The research lanes only gather; the design is made with the owner afterwards.

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
