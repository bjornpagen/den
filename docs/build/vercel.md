# den on Vercel Queues (`@bjornpagen/den-vercel`)

The transport that wakes den's functions on Vercel: one topic for every wake, a push consumer that decodes a delivery
once and always acknowledges it, the census as Vercel Cron, and the `vercel.json` fragment that declares both, with
the check a host's repository check calls. It meets `packages/den/src/transport.ts` as that module stands: a wake names
its flow and rings a step's attempt or a scope's admission, and `send` takes rings, each a wake and its delay.

## What was built

The transport's limits are constants of `src/send.ts` and `src/config.ts`, each with its evidence: the visibility timeout (derived
from `functionLifetimeSeconds`), the deliveries Vercel retries at a trigger's configured delay (32, published) and
`maxDeliveries` derived from it, the batch size (100, published), the default retention (24 h, published), the longest
delay (derived), the idempotency key's length (256, published), the census cron's step (derived from
`censusPeriodSeconds`).

| module | what it holds |
|---|---|
| `src/queue.ts` | the topic `den-wakes`; `WakeJson`, the contract's schema over JSON text, the one codec both ways; `text`, the client's serializer (JSON text as UTF-8, read back as text); `Queue`, what den asks of the client (`sendBatch`, `handleCallback`), and the `VercelQueue` service |
| `src/live.ts` | `live`: `@vercel/queue`'s `QueueClient` with the `text` serializer and every other option at the client's default (region, OIDC, the deployment a send is pinned to) |
| `src/send.ts` | `messageOf` (a ring to its message: payload, the contract's key, its delay in whole seconds rounded up), `sender` and `transport` (den's `Transport` over the client, batches of 100, every failed message or batch logged, never a failure) |
| `src/consumer.ts` | `consumer(serve)`: the route on the one topic; each delivery decoded once with `WakeJson`, handed to `serve`, logged, and acknowledged whatever happened; lease `visibilityTimeoutSeconds`; a retry hook that answers `{ acknowledge: true }` to anything, so a lost acknowledgement is sent again by the client |
| `src/census.ts` | `census(tick, secret)`: the cron route; a request whose bearer is the cron secret runs one tick and answers 200 or 500, any other answers 401 and runs nothing |
| `src/config.ts` | `fragment(routes)`: the consumer's function (`maxDuration` the function lifetime, one `queue/v2beta` trigger on `den-wakes` with `maxDeliveries`), the census route's function (`maxDuration`), the census cron (`*/1 * * * *`); `check(text, routes)`: den's two functions hold the fragment's `maxDuration` and the consumer exactly its trigger (other keys are the host's), no other function's trigger takes den's topic (a wildcard included), and the census path is requested by exactly the fragment's cron |

A host serves two routes: `export const POST = await runtime.runPromise(consumer(serve))` over den's runtime, and
`export const GET = await runtime.runPromise(census(ringCensus, secret))`, with `transport` (over `live`) as the
runtime's `Transport`, and calls `check` from its own repository check on its `vercel.json` text. The census is a wake
(`runtime/census.ts`): its cron route only rings the current period's census, keyed by its period, and the consumer
serves it, ticking every flow, retiring what ended and ringing the next period's, so the census runs in every
environment the queue delivers to, a preview or a staging one whose cron Vercel never calls included; there a chain
that stopped is revived by the next write that requests a root (`afterCommit`), which rings the current period's
census beside its admissions, one message with the chain's own.

## Decisions

- **One topic, one consumer group.** Every function runs every step kind; the wake names its flow, so the runtime
  routes it. A second trigger on the topic would be a second consumer group receiving a copy of every wake, which
  `check` refuses.
- **The consumer depends on the contract only.** It takes `serve: (wake) => Effect<A, never, R>` and the census route
  a `tick` effect, not den's `invoke` and `tick` by name, because the runtime is being rewritten beside this package.
- **Every delivery acknowledged.** The handler never rejects (a body that is no wake is logged, a runtime that dies or
  is interrupted is logged), and the retry hook acknowledges whatever reached it, so the only redelivery is one whose
  invocation died before it could acknowledge. The client's default serializer parses JSON before the handler runs
  and answers a body it cannot parse with a 500; `text` hands the handler the text instead.
- **Visibility timeout = the function lifetime (800 s).** The client renews the lease while the handler runs, so this
  is how long a dead holder's wake stays hidden: it comes back only once its invocation cannot still be running.
- **`maxDeliveries` = 32**, every delivery Vercel makes at the trigger's configured delay ("Retry behavior (first 32
  attempts) | Configured delay"), none on the backoff it does not publish. A redelivery is the only prompt heal of a
  wake whose invocation died before it claimed; each costs an invocation, which a deployment that cannot finish one
  spends at most 32 times per wake. edullm uses 3 with no evidence beyond its reasoning; **for the owner.**
- **The longest delay is 60,800 s**: the retention (86,400 s) less 32 leases of 800 s, so a delayed wake still has
  room for every delivery before it expires. The timer search found that a delay equal to the retention is accepted
  and expires the instant it becomes visible. A longer ring is not sent; the census rings its step once due.
- **No retries of a failed send, no retention set, no retry delay set**: the census is the retry, and Vercel's
  defaults stand (zero config).

## Mismatches with the contract

1. **A key reused for a later, legitimate send drops it.** The contract's key is unique per step attempt and per
   admission, not per send. When a delivered wake ends without its key being consumed (an admission refused by its
   precondition or its seat, a turn outside its window or on a transient read, `stale` on an old deployment, or an
   invocation that died before its claim on every delivery), the census rings the same attempt or admission again
   under the same key, and Vercel drops that send for the original message's retention: 24 h by default, under both
   readings of its docs (whole retention, or `min(retention, 24 h)`). A Gold-style admission waiting on a precondition
   would wait up to a day. Ways out, for the owner: key a census ring by its tick (edullm's minute and slot), send the
   census's rings with no key (Vercel's Workflow rule for wakes), or set a short retention per message, which also
   bounds the delay and the redeliveries.
2. **A key can pass 256 characters.** A flow's name is unbounded; a flow named longer than about 200 characters makes
   every one of its sends a 400. Nothing refuses such a name.

## The suites

Every case a search on `@bjornpagen/testing`, over `test/fake.ts`, a fake of `@vercel/queue`'s client with a clock of its
own: an idempotency key drops a later send for its message's retention, a message lives for its retention and is
consumed only while unexpired, a delay holds it back, a lapsed lease delivers it again up to the trigger's
`maxDeliveries`, the client serializes with `text`, and the suite's fates drop, duplicate, delay and redeliver.

- `transport.test.ts`: every wake sent is delivered at least once or healed by a census (faults: a batch lost before
  or after acceptance, a message refused, a delivery unreachable, dying before its acknowledgement or doubled, an
  acknowledgement lost; the census rings every unheard wake each tick, skipping ticks only while every ring would be
  deduplicated); keys never collide across distinct wakes and repeat for a wake rung twice, which is delivered once,
  batches of 100 included; a timer is delivered at the first whole second at or after its delay, never before, and one
  past the longest delay is not sent.
- `consumer.test.ts`: every delivery is acknowledged, a `fenced` ending, a dying or interrupted runtime, a body that is
  no JSON or JSON that is no wake, and a lost acknowledgement included; only decoded wakes reach the runtime, once per
  delivery.
- `census.test.ts`: the tick runs exactly for `Bearer <secret>`; 200, 500, or 401 having run nothing.
- `config.test.ts`: den's file passes; one edit of it is reported exactly when it changes what den owns.

## Not verified

Nothing here ran against Vercel. A first deployment must confirm: the trigger and the census cron are accepted as
rendered (`*/1 * * * *` included); `handleCallback` and `sendBatch` behave with the `text` serializer as the client's
source reads; `vercel dev`, whose dev consumers are registered by the caller's stack trace, finds the host's route
even though `handleCallback` is called from this package.
