# den

Durable execution as typed facts: a fully declared computation graph held in the app's own grizzle schema on
PostgreSQL 19, each step's writes committed with its result in one call, its functions woken by Vercel Queues.

den is being built. Read [docs/proposal.md](docs/proposal.md) for the design and [AGENTS.md](AGENTS.md) for how to
work here.

```bash
git submodule update --init
pnpm install
pnpm types            # after every edit: every project's typecheck
pnpm check            # the gate, which a push runs
pnpm check:full       # the same past turbo's cache, which a push runs once a day
pnpm test             # the suites that need no database
pnpm test:network     # on den's own PostgreSQL 19 cluster (packages/den/pg.config.ts), made by its first need
```

Requires Node 26 or later and pnpm at the version `packageManager` pins.
