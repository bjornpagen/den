# den

Durable execution for Effect's own workflow algebra (`effect/workflow`), on grizzle and PostgreSQL 19, scheduled on
Vercel Queues through a transactional outbox.

den is in its research phase: there is no library code yet. Read [docs/goals.md](docs/goals.md), then
[docs/research/](docs/research/README.md). How to work here is [AGENTS.md](AGENTS.md).

```bash
pnpm install
pnpm check            # the gate
./scripts/sources.sh  # the research sources, into sources/ (ignored by git)
```

Requires Node 26 or later and pnpm at the version `packageManager` pins.
