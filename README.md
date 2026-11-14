# den

Durable execution as typed facts: a fully declared computation graph held in the app's own grizzle schema on
PostgreSQL 19, each step's writes committed with its result in one call, its functions woken by Vercel Queues.

den is being built. Read [docs/proposal.md](docs/proposal.md) for the design and [AGENTS.md](AGENTS.md) for how to
work here.

```bash
git submodule update --init
pnpm install
pnpm check            # the gate
pnpm test             # the suites that need no database
pnpm pg init && pnpm pg start && pnpm test:network   # den's own PostgreSQL 19 cluster
```

Requires pnpm at the version `packageManager` pins; it downloads the exact Node that `devEngines` pins.
