# den's reference model (`@den/model`)

`packages/den-model` is den's laws stated apart from the engine: a den program as data, the ledger as immutable facts
with every transition a pure function, a deterministic simulator of the platform around it, and the laws as searches.
It imports nothing of den or grizzle, only `effect` and `@den/testing`, so the real engine's suites can hold
`packages/den` to it by differential tests. Everything here follows [the proposal](../proposal.md); where the proposal
leaves a decision open, the model makes the simplest one consistent with it and marks it **provisional, for the
owner**.

## Modules

| module | what it holds |
|---|---|
| `datum.ts` | `Datum`, the JSON tree a value is once it leaves typed code, and its canonical text |
| `identity.ts` | derived identities of roots, scopes and steps, and their canonical texts |
| `program.ts` | the program model: lanes, step kinds, await kinds, scope kinds, root kinds, edges, feeds, and their erasure |
| `facts.ts` | the trace format: facts, commands, answers, entries |
| `ledger.ts` | the ledger: state as a projection of facts, the rules, every transition |
| `simulator.ts` | workers, transport, deaths, clock, census, relay, deployments; the chaotic and the fair phase |
| `properties.ts` | the laws, each a pure check over a trace |
| `planted.ts` | the planted bugs, each one rule broken |
| `machine.ts` | the ledger as a `@den/testing/commands` machine over a flat program |
| `scenarios.ts`, `search.ts` | generators, the simulator's nature drawn from a case's tape, search helpers |
| `workloads/` | generated programs, edullm's QTI chain and Timeback daily job |

## The program model

- **Lane**: a name, a width, and a window (`Always`, or open `[opens, closes)` of every `period`). A lane's pause is not
  declared: pausing and resuming are operator verbs recorded as facts.
- **Step kind**: a name; how it runs (`Runs`: lane, lease, ceilings, ladder); how its input, output and error show as
  data; a pure body `(input, claimed) → Output{output, writes} | Failure{error} | Retry{at, counts}`; and its declared
  edges. `claimed` is the claim's instant and the step's counters, so a re-run of one claim computes the same outcome.
- **Await kind**: a step with no body, completed from outside (`External`) or by a timer `after` ticks from its spawn.
- **Scope kind**: a start (the children it opens) and a finish, a step-like body over the scope's input and its
  children's endings.
- **Root kind**: a trigger (`Schedule`, `Operator`, `Api`) and a scope. A root's finish starts nothing.
- **Edges**: `spawn` (steps of one kind in the same scope), `spawnAwait`, `open` (a child scope of one kind, with the
  `then` edges that start steps in the opening scope once the child's finish is done: "Pages' finish starts Prune"),
  and `contribute` (one role of a `feed`, a join of several parents in one scope).
- **Erasure**: a typed kind and input become a `Child` whose closure holds the typed input; the ledger sees only that
  closure and the input as data. The model never decodes a datum.

## The ledger

The state (`State`) is a projection of the facts, keyed by canonical text; `apply` is the one place a fact's meaning is
written. A transition computes the facts it adds by emitting them one by one on an evolving state (`Tx`), so later
decisions in one call see earlier facts, as one grizzle transaction would. A fact whose key is already held is no
change, so a call made twice adds nothing the second time. Every transition takes the ledger's clock `at`.

- **admit** `(admission)`: a root under `(trigger, idempotency key)`. If a root of that key is in the ledger, the answer
  is `unchanged`. Otherwise `Admitted`, then the root scope's start children (`Spawned` for steps, `Opened` for child
  scopes, recursively), then the finish at once if the scope has no children.
- **claim** `(lane, deployment)`: refused `stale` for a deployment that is not current, `paused`, `closed` outside the
  window, `at-width` when the lane's live claims (lease not run out, no result) leave no room, `idle` when nothing is
  due. Otherwise the earliest due step (due instant, then key); a step whose lease ran out is due at `until`, and this
  claim is then a reclaim. A reclaim reaching the step's reclaim ceiling ends it `Failed{ReclaimsExhausted}` instead
  (answer `exhausted`). The claim is `Claimed{claim, token, slot, until = at + lease, deployment}`, its slot the lowest
  no live claim holds, its token minted once.
- **commit** `(step, claim, token, report, deployment)`: `stale`, or `gone` for a step not in the ledger. Then the
  fence: `open` when the step is held by the claim the token names, whatever its lease; `rerun` when the step already
  holds exactly this claim's report (or this claim's retry); `lost` otherwise. An open commit lands its outcome:
  - an output: `Done`, every write as `Wrote`, then each declared edge's children under derived identity, then what
    the step's end settles;
  - a failure: `Failed{Refused}`;
  - a retry: a wait past the waits ceiling counts as an attempt; a counted attempt reaching the attempts ceiling ends
    it `Failed{AttemptsExhausted}`; else `Retried{due, counts}`.

  A rerun re-derives the children and inserts those absent (none, under derived identity): `unchanged`.
- **spawn identity**: a start child `scope/start#n`, an edge child `step/edge#n` (its ordinal its position in the
  edge's output), a child scope `step/edge[n]` or `scope/start[n]`, a joined step `scope/feed@key`, a finish
  `scope/finish`. A re-run lands on the same keys.
- **finish**: when a step ends, its scope is settled: once every child (step or scope) has ended and the scope has no
  finish, `Spawned(scope/finish)` on the finish's lane. When the finish ends, `Finished{scope, Done|Failed}`, and the
  owner scope is settled in turn. The key race is the finish's key: one scope, one finish.
- **feeds**: a part is `Fed{feed, scope, key, role, parent, value}` once per role; when every role has arrived, the
  joined step is spawned with the parts as its input.
- **complete** `(await, value)`: an external await's first completion wins; the same value again is `unchanged`, another
  is `lost`. **fire**: every timer whose instant has come completes with that instant.
- **stop** `(scope)`: every unended step under it `Stopped`, every unended scope under it `Finished{Stopped}` innermost
  first, without running any finish; then the owner scope is settled. A running holder's later commit finds its step
  ended and is lost, with its spawns.
- **pause/resume** `(lane)`: facts; idempotent.
- **retire** `(root)`: refused `live` until the root's scope finished; then `Retired`, and every row of the root's graph
  is deleted. The app's rows and the token count survive. The key is free again.
- **deploy**: `Deployed{n + 1}`; calls from older deployments are answered `stale`.

## The simulator

`simulate(setup, nature)` runs a chaotic phase of drawn events, then a fair phase. Every choice is a decision of the
search case's tape (`natureOf`), so a run replays from its token and shrinks; faults are turned on per case by a swarm.

- **Transport**: a message is a doorbell for a lane, keyed, pinned to the deployment that sent it. Faults: `drop`,
  `duplicate` (a delivery made again), `delay`, `reorder`; a send whose key was seen within the dedup window is dropped.
  A dead worker's delivery comes back after the visibility timeout (the lifetime), up to `deliveries`.
- **Workers**: one invocation per delivery, on the message's deployment: claim, run (its body, or a call fault:
  `transient` is a wait, `unavailable` an attempt, a deadline at `until − 1` an attempt), commit, then another turn while
  turns and lifetime last, else a continuation keyed by the invocation, only if it worked. Death strikes before the
  claim, between claim and commit, or after the commit before the ring. `pause` delays a commit, maybe past its lease;
  `lost-answer` makes a commit land but its answer vanish, so the worker sends it again. On `stale` a worker acknowledges
  and exits.
- **Relay**: a leader holding an in-memory set of keys sent; its read is, per lane, the steps due the moment a commit
  made them so, up to the free slots, each rung once keyed `(step, claims)`, pinned to the leader's deployment. A
  hand-over clears the set and moves the leader to the current deployment: it replays its whole read, at least once.
- **Census**: fires timers, retires finished roots, and per lane rings `min(due, free)` doorbells keyed by lane, tick
  and index, pinned to the current deployment, `due` counting deferred retries and leases that ran out.
- **Clock**: the ledger's, advanced by `tick` events; nothing else keeps time.
- **Operators**: admit (and re-admit), stop a scope, pause and resume a lane, complete an await (again, maybe with
  another value), deploy.
- **Fair phase** (TigerBeetle's VOPR liveness mode): every admission made, lanes resumed, the relay handed over; then per
  tick every await completed, the relay served, the census on its period, every delivery made and every worker run
  through its turns, with no fault. It ends `Quiescent` (no root, no message, no worker), `Stalled` (a step pending with
  no move for longer than the patience), `Undrained` (an old deployment's messages or workers past the drain bound) or
  `Spent` (a step past the claims its ceilings allow, or the phase's whole budget).
- **Re-runs**: every accepted keyed call (admit, commit, complete, fire, stop, pause, resume, retire) is made again at
  once and recorded in `reruns`.

The patience (`patienceOf`) is derived, not tuned: a pending step's next move waits at most for its lease to run out,
its retry to fall due, its timer to fire or its window to open, and then for the census's next tick, which rings it, so
it is delivered and claimed that tick. A step takes at most `attempts + waits + reclaims − 1` claims
(`claimsBoundOf`).

## Provisional decisions, for the owner

1. **Claim protocol and width.** A claim names a lane, never a step, and takes the earliest due step (due instant, then
   key): edullm's doorbell. A wake's key only deduplicates the transport. Width is checked before candidates, against
   live claims: a claim in force whose lease has not run out and whose step has no result. A holder whose lease ran out
   no longer counts, though it may still run. Slots are the lowest free in `0 … width − 1`.
2. **The fence is a token the ledger mints per claim**, never reused, retirement included; `(step, attempt)` stays the
   key race and the claim's number. See the finding below.
3. **Correctness never reads the clock.** A commit is fenced on its token alone: a holder whose lease ran out still
   lands while no newer claim took its step (edullm's B5), and the newer claim, once taken, makes it `lost`. Leases,
   due instants and timers read the ledger's clock only for liveness.
4. **The clock** is the ledger's: every transition takes `at`; workers keep none; a holder's deadline is `until − 1` on
   that clock; a retry is due at an absolute instant no later than `at + ladder.last`.
5. **Retirement**: the census retires every finished root whole; the root key is free again, and a new admission under
   it is a new graph with the same derived identities. The app's rows and the token count survive.
6. **Stopping a running step**: a stop ends every unended step and scope under it at once; the scope finishes `Stopped`
   without running its finish (so no cursor moves); the holder's later commit is `lost`, its writes and spawns with it;
   the owning scope carries on.
7. **A finish** runs on its own lane like any step (`FinishKind.runs`), is spawned by the commit that ends the last
   child, and its `then` edges are declared on the edge that opened its scope.
8. **Feeds** join parents of one scope; their parts are data, so parents of different kinds join without a shared type;
   a parent that never contributes leaves no joined step.
9. **Ceilings are per step kind**: a counted attempt reaching `attempts` fails; a wait past `waits` counts as an attempt;
   a reclaim reaching `reclaims` fails at the claim. A call fault climbs the kind's ladder `min(first · 2ⁿ, last)`.
10. **Deployments**: a call is served only from the current deployment; on `stale` a worker acknowledges and exits,
    sending nothing. The relay's leader stays on its deployment until a hand-over.
11. **Awaits**: an external await's first completion wins; a timer fires at its spawn plus `after`, completed by the
    census with its instant as its value.

## The laws, and the bugs planted to break them

Each law is a pure check over evidence (`Evidence`: a trace, the lanes, and for the platform's laws the re-runs and the
fair phase's end). Each planted bug replaces exactly one rule (`Rules`) or platform decision (`Policy`); each test
requires the search over it to fail in a witness phase (the floor or steered stream its suite's label fixes), so the
law catches the bug on every run seed (`caught`).

| law | what it checks | planted bug it catches |
|---|---|---|
| `no-stall` | the fair phase ends quiescent: no step pending past its patience, none past its claims bound | `censusBlindToExpiry` (the census forgets leases that ran out); `ceilingsIgnored` |
| `one-result` | at most one `Done`, `Failed`, `Completed` or `Stopped` per step and incarnation; every `Wrote` follows its step's `Done` in one entry | `fenceBlindToResult` (the fence ignores a result already there); `lostWritesLand` (a lost commit's writes land) |
| `scope-once` | one `Finished` per scope, after every child it owns ended | `finishBlindToScopes` (children scopes not counted); `finishWithoutKey` (the finish is no key race) |
| `width` | live claims of a lane never exceed its width; no two share a slot | `widthOffByOne` |
| `rerun` | an accepted keyed call made again at once adds nothing | `ordinalNotDerived` (children keyed by the ledger's count) |
| `stale-drains` | an old deployment's claims and commits are answered `stale`; its messages and workers drain | `servesOldDeployments`; `staleRingsOn` (a stale worker rings itself on) |
| `owned` | every step and scope opens inside an open scope; no root retires with work pending | `stopBlindToSpawns` (a stop fences the result, not the spawns) |
| `fenced` | a landed commit names a token its step minted in the graph as it stands | `fenceOnAttempt` (fenced on the attempt number), caught by the command machine against the specification |

## The searches

- `laws.test.ts`: generated programs (chains, fan-out, a child scope with a follow-up, a feed join, external and timer
  awaits, every behaviour from output to retry-forever) under every fault, every law; 2,000 independent cases and 21
  required situations, from reclaims and late commits to hand-overs and deduplication.
- `planted.test.ts`: the eleven simulator-caught planted bugs above.
- `workloads.test.ts`: the QTI chain (a nightly root, one read scope per collection, pages each naming the next, a
  finish moving the frontier) and the Timeback daily job (a print, a pages scope cut at admission with a split edge for
  a page too large and a refusal for a one-block page too large, a prune started by the pages scope's finish, a cursor
  moved by the root's finish), both under every law, with edullm's limits in force (`production`) and small ones; and
  each workload's own law: a frontier or cursor moves only once every page or block landed (checked to fail when the
  finish moves it regardless).
- `race.test.ts`: `interleave` with `every`: two workers and a third session (a clock running leases out, an operator's
  stop, or a third worker), every interleaving of their moves on one ledger, judged by `one-result`, `scope-once`,
  `width`, `owned` and `fenced`.
- `machine.test.ts`: `commands`: the ledger as a command machine over a flat program, answered by a specification of
  the same laws written apart from `ledger.ts`, 600 programs of up to 40 commands; and the planted attempt fence, which
  the steered phase reaches through a gradient of situations (a retirement, a re-admission, a commit naming a retired
  graph's lease).

## The trace format

`Trace` (`facts.ts`) is the ordered list of every ledger call a run made: the clock's instant, the `Command` as data, the
`Answer`, and the `Fact`s it committed in order. Steps and scopes are named by their derived identity
(`identity.ts`), structurally and as canonical text. The real engine's tests produce one by reading their committed rows
in commit order and naming each step and scope by the path its keys derive. Two traces compare fact by fact, except
`token`, which each implementation mints itself and which compares as a one-to-one renaming. `properties.ts`
reads either.

## What the real engine's differential tests should check

1. **The same commands, the same answers and facts.** Drive the engine's ledger with `flatMachine(flat, SOUND)` through
   `runProgram`, its `Real` the engine; and replay a simulated run's `Trace` command by command against the engine with
   the same program, comparing answers and committed facts (tokens renamed).
2. **The laws over the engine's own traces.** Run `CHECKS` (`properties.ts`) over traces the engine commits under the
   simulator's schedules, with the engine's workers, relay and census in place of the model's.
3. **The planted bugs, planted in the engine.** Each planted bug in `planted.ts` names a decision the engine makes too
   (the fence, the width check, the finish's key race, the census's due count, the deploy fence); breaking the engine's
   the same way should fail the same law.
4. **The provisional decisions as differences.** Where the engine decided otherwise (claim by step, a clock in the
   fence, a stopped scope's finish), the differential tests show exactly which answers and facts differ; each is a
   question for the owner, not a defect of either side.
5. **The identity paths.** The engine's derived keys must name the same paths: `scope/start#n`, `step/edge#n`,
   `step/edge[n]`, `scope/feed@key`, `scope/finish`.

## Findings

- **`(step, attempt)` is no fence across a root's incarnations.** Retirement frees the root key; re-admission rederives
  the same step keys and their claims count from 0 again, so a paused holder from the retired graph matches the new
  graph's claim of the same number and its report lands there. The model fences on a token minted per claim that
  survives retirement (a sequence, or the claim row's uuidv7 in grizzle). `fenceOnAttempt` reproduces the hole, and
  the command machine catches it.
- **A lane's window must hold a census tick.** A wake that finds the window closed is consumed, and only the census rings
  again; a window shorter than the census's period may never see one, and its due work stalls for good. The generators
  draw windows at least a census period long; den's lanes should state the constraint.
- **The relay cannot heal a lease that ran out.** Expiry is time passing, not a commit, so no live read sees it; the
  census is the only path back for a dead holder's step, which `censusBlindToExpiry` shows is load-bearing.
- **Effect's `Array.range(1, 0)` is `[1]`.** The model counts children with `ordinals`, which makes none for zero; the
  specification caught the model spawning a step for a count of zero.

## Ambiguities the proposal leaves

- "Lanes … with a width, a pause and a window": whether the window is a claim window in time (taken here) or a
  flow-control window, and whether a pause is declared state or only a verb (taken: a verb).
- A step's key is "(parent step, edge kind, ordinal)": start children, finishes and joined steps have no parent step;
  the model extends the path with `start`, `finish` and `feed@key`.
- Where a child scope's finish starts its follow-ups ("Pages' finish starts Prune"): taken as the opening scope, with
  the follow-up edges declared on the opening edge.
- Whether a feed's parents may live in different scopes, and how its parts are typed.
- What a stopped scope's finish does, and whether a commit after a lease ran out but before a reclaim lands.
- "A retry at an instant": whose instant, and its bound; taken as the ledger's clock, at most `ladder.last` ahead.
- Re-admission after retirement: the proposal deletes the graph whole but does not say whether its key may be reused;
  edullm's "one live job per source" needs it reusable, and then the fence needs a token.

## Outside this package

- The root `.fallowrc.json` gives the `den-model` zone `allow: []`, which refuses its imports of `@den/testing`
  (`pnpm architecture` and `pnpm dead-code` report them); `den` has the same problem with its suites. Both zones need
  `testing` in their `allow`.
- `pnpm install` added the workspace package to `pnpm-lock.yaml`.
