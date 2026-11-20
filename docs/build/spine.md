# den's spine (`@bjornpagen/den`)

Wave 1: the algebra, its lowering into an app's own grizzle schema, the runtime's turn, and a vertical slice that runs
two flows end to end through grizzle on PostgreSQL 19, on den's own cluster. It follows [the proposal](../proposal.md);
where the proposal leaves a decision open, the spine makes the simplest one consistent with it and marks it
**provisional, for the owner**.

## What was built

`packages/den` (`@bjornpagen/den`, private), each module its own subpath export (`@bjornpagen/den/runtime/turn`, …).
Its limits (Vercel's function lifetime, the lease, the invocation budget and the retry ladder derived from it,
PostgreSQL's `authentication_timeout` and the connect timeout derived from it, the suites' case hang guard) are
constants with their evidence beside the code they bound (`src/runtime/turn.ts`, the suites' `test/support/suites.ts`).

| module | what it holds |
|---|---|
| `src/transport.ts` | the wake contract: `Wake` `{ lane, step, attempt }`, each field branded (`den/LaneName`, `DenStep`, `den/Attempt` ≥ 1), decoded by `WakeSchema`; `idempotencyKey` (`${lane}:${step}:${attempt}`); `Transport`, a `Context.Service` whose `send` never fails; the in-process transport over an unbounded `Queue` |
| `src/algebra/kinds.ts` | `lane` (width, window, pause, ceiling of attempts), `step`, `awaiting`, `scope`, `root`, `edge`, `writes`; a step's reads by name, each `rows` (equality over one relation) or `nearest` (grizzle's `approximateNearest` from an `anchor`, a stored row's vector by its whole key), taken in one statement; spawns typed by their kind (`Page.of(input)`); bodies `(input, found) → Effect<{ output, writes }, E, R>`, `found` each read's rows by its name; `Refused` |
| `src/algebra/flow.ts` | `flow(name, { lanes, kinds, edges })` and its declaration-time checks (below) |
| `src/lower/schema.ts` | Effect Schema to relations: columns of `String`, `BigInt`, `Finite` (double precision, held finite by a row check), `Boolean`, a literal union of texts (a roster) or a brand of one (a contract); an `Option` of a column (a relation of its own); an `Array` of columns or of structs of them (an ordered family keyed by owner and a gap-free ordinal from 0); a `TaggedUnion` of structs of columns (its tag a roster column of the owner's row, a relation per variant holding a row exactly where the tag names it); anything else, a refinement by a check included, `Refused` |
| `src/lower/fragment.ts` | a flow to its fragment as data (`Lowered`): rosters, contracts, relations, laws, and the kinds, joins and edges the printer reads |
| `src/lower/print.ts`, `generate.ts` | the fragment, the programs and the binding printed as three TypeScript modules the app commits (`den generate`) |
| `src/lower/merge.ts` | den's clash check: the app's relations and a fragment merged, a shared name refused |
| `src/lower/keys.ts` | den's contracts (`DenStep`, `DenScope`, `DenExclusive`, `DenInstant`) and `Text`, which an app's relation referencing den's facts types its column by |
| `src/runtime/identity.ts` | derived identity: the SHA-256 of a key's parts (Effect's `Digest`), grizzle's `sha256` |
| `src/runtime/ledger.ts` | the ledger port, in den's own types, that a flow's generated binding fills |
| `src/runtime/turn.ts` | one turn (`serve`), the claim (`claimed`), a kind's runner, endings from `CallError`, settling a scope (`settle`), a start's wakes (`begin`), one invocation under a budget (`invoke`) |
| `src/runtime/census.ts` | the census tick: due steps (no claim, or a lapsed one) at most a lane's free width, and finishes of complete open scopes |
| `src/runtime/drive.ts` | the in-process driver: delivers every queued wake, one invocation each, until none is left |

The slice, `packages/den/integration/slice/`: a toy app (`relations.ts`: items, insert-only cursor facts, tallies,
settled batches, audits referencing den's results), two flows (`flows.ts`), the generated modules (`generated/`), the
schema with both fragments spread in (`app.ts`), the logins (`logins.ts`: den's `worker` login with both flows' roles,
the app's `app` login with an `auditor` role), `grizzle.config.ts`, and `migrations/`, which `grizzle generate` drafted
and `grizzle check` passes.

- **Chain** (`Chain`): root `ChainRun` starts `Page` 0 of a feed; `Next` spawns page n + 1 while a page names one; each
  page inserts its items (an app relation) with its result; the root's finish reads every page's output and inserts the
  feed's cursor position.
- **Fan-out** (`Fan`): root `FanRun` starts one `Batch` scope, which starts one `Square` per number up to its size; the
  batch's finish tallies them once all have results; the root's finish runs after the batch's and inserts `Settled`.

The cluster: `packages/den/pg.config.ts`, the testing library's `localCluster` (`toolchain-pg init`, `start`, `stop`,
`status`, `psql`, `admin`, `reset`, `env`, run as `pnpm pg …`), made and started by the runner's first need; the build
`vendor/grizzle`'s `scripts/pg/pin.env` pins, its state under `~/.local/var/toolchain-pg/5443`, port 5443, verify-full
TLS with its own CA (grizzle speaks nothing else), PostgreSQL's default wal_level, replica, which PostgreSQL 19 decodes
logically on its own once a replication slot asks, a replication slot and walsender per worker,
`max_pred_locks_per_transaction = 2048`, owner role `den_dev` and the template `den_template` with pgvector in
`vector_ext`. Each test file creates a database of its own from the template, runs
`grizzle migrate` from the committed migrations under a role prefix of its own (roles are cluster-wide), gives its
logins passwords, and runs `grizzle uninstall` and drops the database when it ends. grizzle's cluster (5433) is never
touched.

Commands: `pnpm test` (unit), `pnpm test:network` (the slice), `pnpm --filter @bjornpagen/den generate:slice` (den
generate, then oxfmt), and in `integration/slice`, `pnpm exec grizzle generate|check grizzle.config.ts`.

## The graph as relations

Per flow, under its prefix `P` (the flow's name): rosters `PKind` (step kinds, awaits, finishes), `PRootKind` (the
roots, the kind a `PRoot` row and an exclusivity seat name), `PChildKind` (the child scope kinds, where the flow
declares one), `POutcome` (`done`, `failed`); relations `PScope` (every scope of a root's graph), `PRoot` (a root: its
kind, its trigger's key and its instant), `PWithin` (a child scope: its parent and its kind), `PStep` (kind, owning
scope, the instant its first attempt is due), `PStartStep`, `PStartScope` (a join's start edges, keyed by scope and
ordinal; `PWithin` and `PStartScope` only where the flow declares a child scope), `PFinish`
(scope → its finish step, the finish's key race), `PClaim` (step, its stamped attempt, until, and its holds' count), `PHold` (a claim's seats, its ordered family), `PEnded` (an attempt's end), `PResult` (one per step,
done or failed), `PHeld` (the attempt whose commit holds the result), `PRefusal` (the law's id), `PExhausted` (a step
failed by its ladder's end, at the attempt `PHeld` names); per step kind `PKInput` and `PKOutput` (and `PKError` for a
typed error), per join `PJInput`, per finish `PJFinishError`, per Option field a relation of its own, per declared read
`PKNRead` (step, ordinal, the fields it delivers, and a nearest read's `distance`), and per edge kind `PE` (from,
ordinal, to). Every law is a key, a native containment or a row check: a claim's attempt is its place among its step's
claims, stamped gap-free from 0, and each past 0 follows its predecessor's end (a `pred` containment over attempts ≥ 1
into `PEnded`); a finite number's column is finite; an edge's sides are contained in its kinds' input relations; an
output in its kind's input and in its done result; a read's record in its step's result.

## What `grizzle generate` certified

At `a226cbac`, every role of the slice: **`chain_worker`, `fan_worker` and the app's `auditor`, READ COMMITTED.**
`certification.test.ts` holds it, and holds the auditor's level to the one `generate` gives the same installation
without den's workers (also READ COMMITTED): den moves no app role.

It took one change. The first draft had each edge's sides contained in a *selected* side of `PStep`
(`select(PStep, kind = …)`), and `chain_worker` came out SERIALIZABLE (`snapshot 6, pivot 6`), which dragged the
auditor too (`writers 1`): a foreign key check into a selection of rows *another call* wrote is no point read of a
whole declared key (`packages/engine/src/analysis/isolation/certify.ts:302` "it reads rows of no one group",
`:320`). Containing the edge's sides in the kinds' input relations by their plain primary keys keeps the same law and
certifies. A containment into a selection of rows *the same call* inserts (an input into `select(PStep, kind)`, an
output into `select(PResult, outcome = done)`) certifies.

## Shortfalls met

**grizzle (`vendor/grizzle` at `a226cbac`)**

1. **No program generic over a schema.** A builder generic in the app's schema (`<S extends Schema<…, DenRelations,
   …>>`, or generic in the app's relations beside den's concrete ones, or den's own level over a generic app) fails
   `WritableCheck<S, R>` (`packages/engine/src/types/changeset/changeset.ts:220`) and `RelationOf<S>` /
   `IsRelationOf<S, R>` (`packages/engine/src/types/schema/schema.ts:323`, `:337`). Erasing instead is refused too:
   programs over `AnySchema` type, but no `workload` over the concrete schema or a role takes them, a login over an
   erased schema serves no handle (`WorkloadHandles<…, unknown>`), and erased relations fail `contained` ("the sides'
   field types differ"); a member typed `any` is refused by design (`packages/engine/src/types/core/phantom.ts:907`).
   The direct path: **den prints the programs over the app's concrete schema**, with the binding that calls them, and
   the app commits them beside the fragment (`den generate`). Everything then type-checks against grizzle's precise
   types, with no cast. This is the POROUS seam.
2. **Certification shows counts, not places.** `generate` prints `snapshot 6, pivot 6`; finding the selected-side
   foreign key took bisecting the fragment. The reasons exist (`certify.ts`), the CLI does not print them.
3. **Every login that serves a read needs a live source**, even one that only calls `once`
   (`packages/grizzle/src/adapter/types/layer.ts:222`): the suites build `LiveSource.layer` for the installation with a
   credential that never connects.
4. **Contracts of one definition share one domain**: `DenStep`, `DenScope` and `DenExclusive` are one PostgreSQL domain
   over `sha256`'s text, told apart only by TypeScript's brands. As documented, not a defect; recorded because the database cannot
   tell a scope from a step.
5. **A role prefix is converted** (`m1` installs as `m_1__…`): take every name from `roleNameOf`, as the harness does.

**Effect 4.1.4**

1. **A brand is not in the AST**: `Schema.brand` keeps the inner schema's AST and carries its identifier only on the
   schema value (`node_modules/effect/src/Schema.ts:5359-5361`), so lowering walks schema values (`schema.identifier`,
   `schema.value`, `schema.literals`), never the AST alone.
2. **`Array.range` and `Array.makeBy` never return an empty array** (`node_modules/effect/src/Array.ts:309`, `:215`):
   a batch of size 0 drew one square until the flow filtered the range.
3. **`String.charAt` returns an Option**, which a template literal printed as an object: the first derived uuids were
   refused by grizzle's uuid codec (`uuidSyntax`) until the variant digit unwrapped it.

**Tooling (not den's to change; for the coordinator)**

- **fallow** reports `@bjornpagen/grizzle` as an unused dependency of `packages/den`, because `.fallowrc.json` ignores
  `vendor/**`, where grizzle's workspace packages lie; `packages/den/src` imports it everywhere. `pnpm check` passes
  every other task (20 of 21); this one needs `"@bjornpagen/grizzle"` in `ignoreDependencies`, with that reason.
- **oxfmt** would reformat grizzle's committed JSON, which `grizzle check` holds byte for byte, and grizzle refuses any
  file in the migrations directory it did not write: `integration/slice/.oxfmtrc.json` (the root's options, plus
  `ignorePatterns: ["migrations/**"]`) spares it.

## Provisional, for the owner

1. **Claim protocol.** A claim is an insert of `PClaim(step)` whose attempt the database stamps, its place among the
   step's claims from 0, and whose `until` the statement computes, its reading of the database's clock plus the time
   the turn's invocation has left, with its seats nested under it, one write that reads its attempt back; a claim after the
   first follows its predecessor's `PEnded`, so a second claimant is refused whole and a forged or stale wake for an
   attempt that is not the step's next loses. A result is `PResult` plus `PHeld(step, attempt)`, keyed by step: whichever attempt commits first holds the
   step, and any later commit, stale or fresh, is refused on that key and ends `lost`, its writes rolled back with it.
   Correctness rests on keys alone, never on a clock (`stale.test.ts` runs the stale claimer with a skewed clock).
2. **Width.** Enforced by the census (at most a lane's width minus its standing leases is rung); no law bounds it yet.
3. **Window and pause.** A lane declares `window` (always, or an Effect `Cron`) and `pause` (the standing it is
   installed in); a turn outside the window ends `retry` at the window's next instant, no attempt spent. Pause is
   declared but not yet enforced: pausing and resuming as facts are wave 2's.
4. **Clock.** The database's: every reading is a clocked call's `transaction_timestamp()`, and every instant a write
   stores is computed in its statement, the call's reading plus a delay (a claim's lease the time its invocation has
   left, at most the function lifetime, 800 s; a retry's rung; a step's delay after its spawn); the census rings a
   lapsed claim at `until + 1 ms`.
5. **Endings.** `transient` is retried in place, within the claim's deadline, with no attempt spent; `unavailable`,
   `transport`, `input`, `outsideWorld`, `route`, `token*` and `failed` spend the attempt (`retry`, due at `until`);
   `refused` on `PResult`, `PHeld` or `PClaim` (or the attempts' `pred` law) is `lost`, on any other law `failed` with
   `PRefusal(step, law id)`; `stale` and `credentialRefused` are `fenced` (the attempt recorded in `PFenced` where it
   can be, waiting on the deployment, which the census asks after before it rings the step; acknowledge and exit);
   `commitUnknown` reads `PHeld` back and is
   `done` when it holds this attempt. A body's typed error is `failed` with `PKError`; a defect, an interruption or a
   body past its deadline spends the attempt. Past a lane's ceiling of attempts, the claim is made and `PExhausted`
   recorded: `failed`.
6. **Defect values.** Not stored: a defect only spends an attempt, and the ceiling turns endless defects into `failed`.
7. **Which role runs a step's writes.** The flow's worker role (`<flow>_worker`) writes the app relations its steps and
   finishes declare, by `insert` (or `write`, which forfeits READ COMMITTED, if any step declares a put or a delete).
8. **A step's writes** are the array facts of its commit program, by operation and relation, which the step declares
   (`writes({ insert: [Item], put: [], delete: [] })`): a served Db runs only workload members, so no ChangeSet is built
   at run time.
9. **A finish step** lives in the scope it finishes, is no child of it for completeness, and spawns nothing yet; a
   scope is done once its finish step has a result (done or failed).
10. **Retirement.** Built on grizzle's RETIRE (`docs/build/repin.md`): `runtime/retire.ts` retires each ended root's
    graph whole once its exclusivity seat is given back and the census no longer requests its key; an app row that
    references it keeps it. The app's census runs it beside its tick.
11. **Stopping.** Not built.
12. **The relay.** Not built: a committing turn sends its children's wakes itself after its commit, and the census heals
    any it loses.

## Seams, each one module for one coming grizzle feature

| grizzle feature | seam | what replaces what |
|---|---|---|
| POROUS | `src/lower/print.ts` (`printPrograms`, `printBinding`), the generated `*.programs.ts` and `*.binding.ts` | programs built once over the fragment, and a binding written over their handles, in place of printed modules |
| LEASE | `src/runtime/turn.ts` `claimed`, the `PClaim` relation and the census's lapsed-claim read | grizzle's certified lease race |
| RETIRE | taken: `src/runtime/retire.ts`, the fragment's retirable unit and each flow's retiring role | a retirement of a finished root's graph whole |
| DBCLOCK | `Clock.currentTimeMillis` in `runtime/turn.ts` (`serve`, `claimed`, the runner's deadline) and `runtime/census.ts` (`tick`) | the database's instant, as a query term |
| CLASH | `src/lower/merge.ts` | grizzle refusing a fragment's clashes itself |
| DELTAMET | `concluded`'s read-back of `PHeld` after `commitUnknown` | the winner's row in the same call |
| DEFERRABLE | the scheduler's snapshot (`PSnapshot`, one statement of den's role) and the relay's watches (`PPending`, `PRequested`, `PRunning`) | deferrable read-only reads |
| SCHEMAMAP | `src/lower/schema.ts` | grizzle's own Effect Schema mapping |

## The suites

Every case is a search on `@bjornpagen/testing`. Unit (`pnpm test`): the wake contract (decode ∘ encode = id, and a key names
one wake), the flow's declaration checks (exhausted, one fault at a time), derived identity, and lowering (every name
prefixed, every law over the fragment's own relations, an Option a relation of its own, the merge refusing a clash).
PostgreSQL (`pnpm test:network`, six files, each its own database):

- `chain.test.ts`: results are typed rows (each page's `seq` and `items`, read by the app's own query joining den's
  relations); each page's items commit with its result; one finish; the cursor moved; a rerun (the same root key, every
  page's first wake rung again) changes nothing, every wake ending `lost`.
- `fan.test.ts`: a batch's finish runs once after all its squares (its tally counts every one), the root's after the
  batch's, an empty batch included; a rerun changes nothing.
- `stale.test.ts`: a stale claimer, in either commit order, ends `lost`; the winner's attempt is held; a forged attempt
  loses its claim.
- `claim.test.ts`: two claimers of a step's first attempt, every interleaving of their moves (`interleave`, `every`):
  one claim at attempt 0, the other refused as a race lost.
- `census.test.ts`: every wake dropped, and a holder dead after its claim: ticks heal the run, never ringing a standing
  lease, and the dead holder's step is claimed again at attempt 1, its lapse recorded in that claim.
- `certification.test.ts`: as above.

`pnpm check`: 20 of 21 tasks pass; `dead-code` fails only on the fallow finding above.

## What wave 2 builds next

- **lowering-complete** (`src/lower/schema.ts`, `fragment.ts`, `print.ts`): tagged unions, arrays and finite numbers are
  built (the assignment engine's structured answer); records, recursion as trees, unions and arrays nested deeper than
  one struct, and Effect's built-in checks as CHECKs and patterns are not;
  feed edges (several parents, run once all have results); edges and spawns from a finish (Timeback's prune after its
  pages); edges that spawn a child scope and awaits exercised end to end (both are lowered and printed; neither is
  under a suite yet); a `den check` that holds the committed
  modules to a fresh print, as `grizzle check` holds served files.
- **coordination** (`src/runtime/turn.ts`, `census.ts`, the fragment): width as a law (slots taken by key race), pause
  and resume as facts, a lane's window in the census, stopping a scope, the ceilings on reclaims and waits, `Retry`
  facts for waits that must outlive a turn.
- **relay and census** (`src/runtime/census.ts`, a new relay module): the relay over a served live read of due steps
  (grizzle's `watch`), the census as Vercel Cron, its reads as DEFERRABLE once they exist.
- **HTTP surface**: den's operator verbs (start a root, complete an await, stop, pause, watch) as served programs in roles
  the app lists, through grizzle's `httpHandler`.
- **Vercel transport** (`packages/den-vercel`): a `Transport` over Vercel Queues, one topic per lane,
  `idempotencyKey` per send, `WakeSchema` at the consumer's boundary, every delivery acknowledged, `invoke` with the
  invocation's budget.
- **edullm's first use**: QTI as a chain in a scope, Timeback's growth as a fan-out, on the same generator.

A slip to record: one `git stash list`, read-only, ran during the work; it listed nothing and changed nothing.
