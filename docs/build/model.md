# den's reference model (`@den/model`)

`packages/den-model` states den's laws apart from the engine: a den program as data, the ledger as immutable facts
with every transition a pure function, a deterministic simulator of the platform around it, the laws as searches, and
edullm's eight workloads as model programs. It imports nothing of den or grizzle, only `effect` and `@bjornpagen/testing`,
so the engine's suites can hold `packages/den` to it by differential tests. It follows [the proposal](../proposal.md)
§4, §7 and §8 and [the decisions](../decisions.md); where they leave a choice open, the model makes the simplest one
consistent with them and marks it **provisional, for the owner**; the ambiguities it reported are settled by the
evidence (`decisions.md`, "Settled by the evidence"), and the model follows those rulings.

## Modules

| module | what it holds |
|---|---|
| `datum.ts` | `Datum`, the JSON tree a value is once it leaves typed code, and its canonical text |
| `identity.ts` | derived identities of roots, scopes and steps, and their canonical texts |
| `program.ts` | the primitives: resources, windows, ladders, runs, declared reads, step, scope, root and edge kinds, their erasure, `Program` |
| `facts.ts` | the trace format: facts, commands, answers, entries, `Trace`, and the canonical texts of seats, holders and pause targets |
| `ledger.ts` | the state as a projection of facts, eligibility and order (`standings`), every transition (`ledger`) |
| `simulator.ts` | workers, transport, deaths, clock, census, relay, deployments, the world's acts; the chaotic and the fair phase |
| `properties.ts` | the twelve laws, each a pure check over a trace and the run's sends |
| `machine.ts` | the ledger as a `@bjornpagen/testing/commands` machine over a flat program |
| `scenarios.ts`, `search.ts` | generators, the simulator's nature drawn from a case's tape, the declaration check, a run's evidence and its laws' verdict |
| `workloads/` | `synthetic.ts` (generated programs), W1 `timeback.ts`, W2 `alphatest.ts`, W3 `qti.ts`, W4 `gold.ts`, W5 `takedown.ts`, W6 `reports.ts`, W7 `enrollment.ts`, W8 `seed.ts`, and `edullm.ts`, all eight on one ledger |

## The program model

- **Step kind**: a name; how it runs (`Runs`: lease, the resources it holds a seat of while it runs, its ladder); how
  its input, output and error show as data; its declared reads, a function of its input to named `Query`s (an app
  relation's rows, all or one key's, or the steps pending under roots of some kinds); a pure body
  `(input, claimed) → Output{output, writes} | Failure{error} | Retry{at, counts}`, where `claimed` holds the claim's
  instant, its number, the attempts and waits spent, and the rows each read returned; and its declared spawn edges.
- **Ladder**: `Attempts{attempts, first, last}` (W1 to W4) or `Never{first, last}` (W6), its rungs written out either
  way, `min(first · 2ⁿ, last)`.
- **Due instant**: a child is due at once or at an instant its edge names (`stepAt`, `spawnAt`: W5's timer, W6's delay).
- **Scope kind**: the children its start opens, and a finish, a step over the scope's input and its children's
  endings (done or failed). A child scope's `then` edges start steps in the scope that opened it once its finish is
  done ("Pages' finish starts Prune").
- **Root kind**: a trigger (`Schedule`, `Operator`, `App`), a precondition (a `Query` that must read empty) or none,
  an exclusivity key of its input or none, a window or none, and a scope. Exclusivity and windows belong to root kinds
  only: every one of edullm's is per run.
- **Edges**: spawn edges only, to steps or child scopes of one declared kind, ordinal by position. An edge runs only on
  an output: a step that fails spawns nothing.
- **Resource**: a name and its seats, keyed `"0" … "<seats − 1>"`; a root's exclusivity is a seat keyed by its kind and
  the value its input names, held by its scope for its life.
- **Erasure**: a typed kind and input become a `Child` whose closure holds the typed input; the ledger sees only that
  closure and the input as data.
- **Program**: its resources and its root kinds (with their preconditions and windows), which is all the laws need.

## The ledger

The state is a projection of the facts, keyed by canonical text; `apply` is the one place a fact's meaning is written.
A transition emits its facts one by one on an evolving state, so later decisions in one call see earlier facts, as one
grizzle transaction would. A fact whose key is already held is no change, so a call made twice adds nothing.

- **admit**: `unchanged` if a root of the key is live; `retired` if the key was retired (it never recurs); `blocked` if
  the precondition reads rows. Otherwise `Admitted` and the precondition's `Read` (empty); then, if another live run
  holds the exclusivity seat, `Finished{Held}` at once (`held`: the run is recorded and skipped, edullm's "that
  relation skips the night"), else the scope's `Seated` and the start's children, recursively.
- **write**: the app's own transaction: its rows as `Wrote{App}`, and the roots it admits, each behind its own race.
- **claim(step, turn)**: `stale`, `gone`, `lost` (ended, or a live claim holds it), `early`, `closed`, `paused`, `full`,
  `behind`; else a reclaim of a lapsed lease at the end of its ladder fails the step `LadderEnded{lapsed}` (`exhausted`),
  and any other claim is `Claimed{attempt, turn, until}`, the lapsed claim's seats given back, and the lowest free seat
  of each resource taken (giving it back for a lapsed holder first). The claim takes the step's declared reads in its
  transaction and hands them to its holder; they are recorded with the result. A reclaim spends an attempt.
- **commit(step, attempt, turn, report)**: `stale`, `gone`; then the fence on the claim's key: `open` when the step's
  latest claim is this attempt and it holds no result, whatever its lease; `rerun` when this attempt's identical report
  already landed; `lost` otherwise. An open commit lands `Done` and its claim's reads as `Read`s, gives back its seats,
  lands its writes and its edges' children, and settles its scope; or `Failed{Refused}` with its reads; or a retry: a
  counted attempt at the ladder's end is `Failed{LadderEnded{retried}}` with its reads, else `Retried{due, counts}`. A
  wait spends nothing. A holder that dies after reading reads again at its next claim.
- **settle**: once every child of a scope ended, `Spawned(scope/finish)` under the finish's key race; when the finish
  ends, `Finished{Done|Failed}`, a root scope's exclusivity seat given back, and the owner settled in turn.
- **retire**: `live` until the root's scope finished; then `Retired`, the graph deleted whole, the key kept as retired.
- **pause, resume** a resource or a root kind; **deploy**; **census**, a read that commits nothing and is recorded so
  the laws see when ticks fell.

**Eligibility and order** (`standingsOf`). A step is a candidate at an instant when it exists (its parent ended), has
not ended, holds no live claim, its due instant (or its lapsed lease's end) has passed, its root's window is open, and neither its root kind nor any resource it holds is paused. Candidates are ordered by their root's age (its
admission's place), then their due instant, then their key, the same order for every resource. A candidate is eligible
when every resource it holds has a free seat and fewer candidates ahead of it hold that resource than it has free
seats: older work is never overtaken, even when it is blocked on another resource.

## Ringing, and the simulator

`simulate(setup, nature)` runs a chaotic phase of drawn events, then a fair phase. Every choice is a decision of the
case's tape (`natureOf`), so a run replays from its token and shrinks; faults are turned on per case by a swarm.

- **The committing worker continues with its own first spawn and rings the rest**: a worker's call that spawned a step
  eligible at once claims it next, while its turns and lifetime last, else sends it as a continuation message; it
  rings everything else its call made eligible, timers delayed to their instants, keyed by that commit. A worker that
  dies after its commit rings nothing.
- **The relay** tails the log of committed entries in commit order: for each, the steps it made eligible (eligible after
  it, not before) and the timers it spawned, all of them, keyed by the entry's position, pinned to the leader's
  deployment, so a hand-over's replay of a position is a true duplicate. It and the committer ring the same steps
  under different keys, harmlessly: the claim decides. A timer, a step spawned due later, is a delayed delivery to its instant. The leader saves
  its position after sending unless it lags; a hand-over starts the new leader, on the current deployment, from the
  last position saved: at least once.
- **The census tick** records its read, retires every root the ledger finds ended, and rings every step eligible at the
  tick, in order, keyed by the tick's instant: time-made eligibility (due instants, retries, windows opening, lapsed leases) and
  the net under every lost ring. Eligibility bounds the rings by free seats.
- **Transport**: a message names one step. Faults: `drop`, `duplicate`, `delay`, `reorder`. As Vercel Queues does, a
  send whose key the transport accepted within its deduplication window is dropped out of band, however the first was
  processed; the window is a day at the model's minute tick (`min(retention, 24 h)`, Vercel Queues' concepts page),
  longer than any run, a few ticks or none in a sixth of cases. Every send is recorded with its key, cause and fate.
  A dead worker's delivery comes back after the visibility timeout, up to `deliveries`.
- **Keys name the ring's cause** (`Policy.keyOf`): the fast path's commit, the relay's position, the census's instant,
  a continuation's worker, with the step. A delivery that ends without a claim (a seat held, a window closed, `stale`)
  leaves the next cause's ring a fresh key.
- **Workers**: one invocation per delivery, on the message's deployment: claim, run (its body, or `transient` a wait,
  `unavailable` an attempt, a deadline at `until − 1` an attempt), commit. Deaths before the claim, between claim and
  commit and after the commit; `pause` delays a commit maybe past its lease; `lost-answer` loses an accepted commit's
  answer, so the worker commits again. On `stale` it acknowledges and exits.
- **The world's acts**: admissions by schedule and operator and the app's own transactions (writes, maybe admitting a
  root) at their instants; `readmit` admits a root again; operators pause and resume resources and root kinds; deploys.
- **Fair phase** (TigerBeetle's VOPR liveness mode): everything resumed, the relay handed over; per tick the acts due,
  the relay, the census on its period, every delivery, every worker through its turns, no fault. It ends `Quiescent`
  (every act done, no root, no message, no worker), `Stalled` (a step pending with no move past the patience),
  `Undrained` (old deployments past the drain bound) or `Spent` (a step past its ladder, or the budget).

The patience (`patienceOf`) is derived: a pending step's next move waits at most for its lease to run out, its due
instant or retry, and the closed span of a window, then for the census's next tick, which rings it. A step on
`attempts(n)` that still pends with `n` attempts spent is `Spent` at once.

## The trace format

`Trace` (`facts.ts`) is the entries of every ledger call a run made, in commit order, each the clock's
instant, the `Command`, the `Answer` and the `Fact`s it committed in order. Steps and scopes are named by their derived
identity paths (`<root>/start#n`, `<step>/<edge>#n`, `<step>/<edge>[n]`, `<scope>/start[n]`, `<scope>/finish`). The
facts: `Admitted` (with exclusivity key and trigger), `Opened`, `Spawned` (with due instant and resources held),
`Claimed` (step, attempt, turn, until, deployment), `Read` (reader, name, query, rows; a claim's reads in the commit
that lands its result, a precondition's in its admission), `Seated`, `Unseated` (seat and holder, a claim or a root's
scope), `Retried`, `Done`, `Wrote` (by a step or the app), `Failed` (`Refused` or `LadderEnded{retried|lapsed}`),
`Finished` (`Done`, `Failed`, or `Held` for a root whose exclusivity seat was held), and the `Commit` command carries
the reads its claim took, `Paused`, `Resumed` (a resource or root kind),
`Deployed`, `Retired`. Two traces compare fact by fact, turns as a one-to-one renaming. The JSDoc of `Fact`, `Command`,
`Answer` and `Trace` is the format's definition.

## The laws, and the kills that break them

Each law is a pure check over `Evidence` (a trace, the program, and for the platform's laws the re-runs and the fair
phase). Each decision of the ledger and the platform is stated once, where it is made, and every way a real slip would
break one is a kill on the property that must catch it (`kills: [{ file, original, replacement, why }]`), which
`toolchain-test` applies to the source and gates: with it applied, the property's witness cases fail.

| law | what it checks | kills it catches |
|---|---|---|
| `no-stall` | the fair phase ends quiescent: no step pending past its patience, none past its ladder | the census ringing only steps due by their own instant, blind to a lapsed lease; a ladder that never ends; a key per attempt, under a seat held and under a window closed |
| `one-result` | one result per step key ever; a write only in its step's `Done` entry; a commit lands only for the turn holding the step's latest claim | a fence blind to a result already there; a lost commit whose writes still land; retired keys recurring |
| `scope-once` | one `Finished` per scope, after every child ended | a scope blind to its child scopes; a finish that is no key race |
| `seats` | a seat is taken only when free, taken from a claim only once its lease ran out, within its resource's seats, and a claim takes a seat of every resource its step holds | a lease counted as run out a tick early, in simulation and in some interleaving |
| `exclusive` | never two live runs of one exclusive root kind and key; a contested admission ends `Held` in its entry | the seat given back when the finish is spawned |
| `precondition` | a root was admitted only while its precondition, evaluated from the trace, read empty | a `Pending` read that forgets held steps |
| `reads` | every recorded read is the rows its query held where it was taken (the claim, or the admission), evaluated from the trace | a keyed read that returns its whole relation |
| `rerun` | an accepted call made again at once adds nothing | a child's ordinal counted from the ledger, not derived |
| `stale-drains` | old deployments' claims and commits are answered `stale`, and their messages and workers drain | a ledger that serves every deployment; a stale worker that rings itself on |
| `owned` | no fire-and-forget: everything opens inside a scope not yet ended, and no root retires with work pending | a root retired once its children ended, before its finish ran |
| `window-tick` | every open span of a declared window inside the fair phase holds a census tick | a declaration check that admits a span a tick short |
| `rewake` | a wake re-rung by a later cause is always delivered: the transport drops a send as a duplicate only of an earlier send of the same cause | every ring keyed by step and attempt |

## The properties

Each is a `toolchain-test` property (`pnpm test` in the package):

- `laws.test.ts`: generated programs (chains, fan-out, a child scope with a follow-up, exclusive roots under one key,
  a seat-holding resource, a root window, timers re-armed by a declared read, a gate root with a quiescence
  precondition, attempts and never-ending ladders, outages, every trigger) under every fault and every law; 2,000
  independent cases and 30 required situations, from reclaims and late commits to held roots, blocked gates, workers'
  rings, replayed relays and refused declarations; the table's seventeen kills.
- `race.test.ts`: `interleave` with `every`: two workers and a third session (a clock, an operator pausing the
  resource, or a third worker) claiming steps that share a resource of one or two seats, every interleaving judged by
  `one-result`, `scope-once`, `seats`, `exclusive` and `owned`; its kill a lease run out a tick early.
- `machine.test.ts`: `commands`: the ledger as a command machine over a flat program (steps holding one resource),
  answered by a specification written apart from `ledger.ts`, 600 programs of up to 40 commands, `full`, `behind`,
  `retired` included; its kill retired keys recurring, which the specification refuses.
- `workloads.test.ts`: all eight workloads on one ledger, each present or not by case, edullm's limits in force
  (`production`) or small ones, under every law and each workload's own (below); 500 independent cases and 25
  required situations.

## edullm's eight workloads

- **W1** (`timeback.ts`): a root per relation and night, exclusive per relation, in its window: a print; its edge opens
  pages (split for a page too large, a one-block one refused); the pages' finish starts the prune, which reads the print
  as its declared read; the root's finish moves the cursor. Every part holds a seat of the 8-seat replica. Law: a
  cursor moves only once every block landed and the prune ran against that night's print.
- **W2** (`alphatest.ts`): a singleton root in its window opens the listing chain; its finish, the listing gate, opens
  one chain per request kind (the singleton root keeps each the only live one), the flow window travelling along each
  chain edge, then the scans.
  Law: the frontier moves only over every listing page, request batch and scan.
- **W3** (`qti.ts`): each night the schedule admits one root per collection, exclusive per collection and in its
  window, a chain of pages; a night whose previous read of the collection still runs is held for it. Law: a frontier
  moves only over every page.
- **W4** (`gold.ts`): a singleton root with no window, behind the quiescence precondition (no `TimebackDaily` or
  `QtiRead` step pending), a chain of views that stops at a failed one, its finish swapping the generation. Law: the swap only over
  every view.
- **W5** (`takedown.ts`): the app's write of an attempt's entry admits its root; a timer due `idle` later reads the
  attempt's presence and re-arms for the instant its last beacon makes it away, or hangs up; the browser's beacons are
  app writes every tick. Law: no hang-up of an attempt whose last beacon before the claim is younger than `idle`, and
  every attempt hung up once.
- **W6** (`reports.ts`): the app's write of a report admits its root; a delivery, delayed for a stretch, on a ladder
  that never ends, refused while Timeback's outage lasts. Law: none fails, every report is delivered.
- **W7** (`enrollment.ts`): an hourly exclusive root whose pass reads the intents and the roster and writes the plan.
  Law: the roster ends as the intents the last pass read.
- **W8** (`seed.ts`): a one-off operator root seeding one table per step. Law: a run with no failed step seeds every
  table.

## Retirement closes the fence

The claim's key `(step, attempt)` fences its commit, with no token beside it, because retired keys never recur
(grizzle's RETIRE): a step key names one step for ever, so its claim `attempt` is one claim, one holder. grizzle's
RETIRE remembers retired keys; in the model, tombstones of the retired root keys stand for it, and an admission under
one is answered `retired`. If retired keys recurred, a re-admission
would rederive the same step keys with claims counting from 0 again, and a holder of the retired graph would pass for
the new graph's claim of the same number. The kill that forgets retired keys is exactly that: the laws fail
`one-result` under it, the specification refuses its re-admission, and a direct probe over 3,000 simulated runs of it found the landing itself 44
times (`Synthetic("r0")/start#0 took the report of w12.0 for claim 0, which w22.0 took`), beside 2,152 runs whose new
graph took a second result under a recurring key.

## Findings

- **A key per attempt stalls a step for a day.** Vercel Queues keeps a key for up to 24 h whether or not its first
  delivery was processed, so a ring that ended without a claim (a seat held, a window closed, `stale`) spends its
  attempt's key and every later ring of that attempt, the census's included, is dropped. Keys name the ring's cause
  instead; the kill that keys a ring by its attempt reproduces the stall (found first by the den-vercel lane).
- **Nested windows can make a step unable to run.** Two windows each holding a census tick, whose open spans never
  overlap, left the steps under both pending for ever (found by the laws search: a root open over `[1, 2)` and a child
  scope over `[0, 1)` of period 2). Windows on root kinds only make it unrepresentable.
- **A window must hold a census tick**, and the flow's declaration is where to check it: a wake that finds the window
  closed is consumed, and only the census rings what a window's opening made eligible. `declares` refuses a window
  whose open span is shorter than the census's period; its kill shows the law catching an off-by-one there.
- **The relay cannot heal a lapsed lease**: expiry is time passing, not a commit, so only the census rings a dead
  holder's step, which the kill of the census's rings shows is load-bearing.
- **A ladder ending at a claim is not a report landing.** A reclaim that ends a ladder records `LadderEnded{lapsed}`;
  the lapsed holder's late commit of that attempt is `lost`, not a re-run, which the specification caught when the
  ending did not say how the last attempt ended.

## Settled by the evidence

The model follows the rulings in `decisions.md`: the committing worker continues with its first spawn and rings the
rest, and the relay rings everything each commit made eligible, harmlessly twice; exclusivity and windows belong to
root kinds only, and a root whose exclusivity seat is held is recorded `Held` and not run; a step's declared reads,
taken by its claim, are recorded with its result in the commit; a reclaim counts as an attempt and a wait does not;
grizzle's RETIRE remembers retired keys, for which the model's tombstones stand; W4 has no window.

## Provisional decisions, for the owner

1. **Preconditions are evaluated at admission**; a refused admission commits nothing, while a held one is recorded.
2. **Pausing a resource or a root kind stops claims only**; admission proceeds and nothing is lost.
3. **Waits have no ceiling**: only waits a source asked for (a body's `Retry{wait}`, a `transient` call) are waits.
4. **Order holds back younger work** on every resource an older candidate holds, even while it is blocked on another.
5. **Exact timers are delayed deliveries of spawns due later**; a retry's due instant is the census's to ring.
6. **The fence is `(step, attempt)` alone**; a lapsed holder still lands while no newer claim took its step (edullm's
   B5); a lapsed claim's seats are free, and the holder's deadline is one tick before its lease's end.
7. **The census retires** every root whose scope finished, held roots included.
8. **Deployments**: a call is served only from the current deployment; a stale worker acknowledges and exits.

## What the engine's differential harness should check

1. **The same commands, the same answers and facts**: drive the engine's ledger with `flatMachine(flat)` through
   `runProgram`; and replay a simulated run's `Trace` command by command against the engine on the same program,
   comparing answers and facts, turns renamed one to one.
2. **The laws over the engine's own traces**: `CHECKS` over traces the engine commits under the simulator's schedules.
3. **The model's kills, applied to the engine**: each names a decision the engine makes too (the fence, the seat's lapse,
   the finish's key race, the exclusivity release, the precondition's read, the census's rings, the deploy fence, the
   retired keys); breaking the engine the same way should fail the same law.
4. **The provisional decisions as differences**: where the engine decided otherwise, the differing answers and facts
   are questions for the owner, not defects of either side.
5. **The identity paths and the order**: the engine's derived keys must name the same paths, and its claims must
   answer `full` and `behind` where the model's do.
