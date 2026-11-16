# @den/limits

Every number den bounds something by, as a `Limit` of `@bjornpagen/limit`: a frozen, branded value that carries its
evidence. A limit is one of four kinds: **published** (a source's number, quoted, with the day it was checked),
**measured** (an operating value with the record of its measurement and what invalidates it), **derived** (computed
from other limits, never a second spelling of their numbers) or **provisional** (a protective cap whose evidence is
still owed). Limits are minted here and nowhere else, and code reads a limit's `.value`.

What a limit is and is not, the evidence each kind needs, how to measure one and how to review one: the limits skill,
[`.agents/skills/limits`](../../.agents/skills/limits/SKILL.md).

## Modules

| module | what it bounds |
|---|---|
| `vercel-functions` | an invocation's lifetime (published) and the budget den's turns take from it |
| `vercel-cron` | the census's shortest period (published) and its cron step |
| `vercel-queues` | a message's retention, a batch, an idempotency key and the configured retries (published); the visibility timeout, the most deliveries and the longest delay den derives from them |
| `postgres` | PostgreSQL 19's `authentication_timeout` and `max_connections` defaults (published) |
| `cluster` | den's own cluster (`scripts/pg.sh`): the suites' connect timeout, the replication slots and walsenders (derived), the predicate locks grizzle recommends (published) |
| `claim` | a claim's lease margin and longest lease, the first reclaimable instant, the retry ladder's rungs (derived) |
| `suites` | the hang guard of one case of den's suites (measured) |
| `flow-control` | BBR's gains, probe wait and min-latency filter, and TCP's congestion divisor, which the AlphaTest flow controller runs on (published) |
| `alphatest` | AlphaTest's knees, listing page and throttle range, as edullm measured them (measured) |
| `qti` | the QTI REST API's page (published) |
| `bastion` | Timeback's bastion seats and rates, as edullm's operator holds it (measured) |

## Where the rules reach

The dev tools' `no-bare-limit` refuses a bare number where a limit belongs and `limits-sole-mint` a mint anywhere but
here (`oxlint.config.ts`). Test files are exempt (`*.test.ts`, `test/`, `integration/`), and so are den's test support
packages, the reference model (`packages/den-model`) and the outside systems' fakes (`packages/edullm`), which read
their limits from here all the same.

`scripts/pg.sh` reads the cluster's settings from `src/cluster.ts` with `node` when it writes the cluster's
configuration, so no shell script holds a copy of a number.

## Provisional

None.
