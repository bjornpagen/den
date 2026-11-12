# Working in den

den holds a fully declared computation graph as immutable typed facts in the app's own grizzle schema
(PostgreSQL 19): Effect states each step's body, a step's writes commit with its result in one grizzle call, and
Vercel Queues wake the functions that run it. The design is [docs/proposal.md](docs/proposal.md), the goals
[docs/goals.md](docs/goals.md), and the owner's rulings [docs/decisions.md](docs/decisions.md).

## Code is the documentation

Code, types and lint rules are the documentation. The only comments are JSDoc on declarations and the comments other
tools read. Write JSDoc and Markdown only for what code cannot express: why a design exists, what it rejects, and
outside facts. State rules in plain words; never narrate history.

Lint (oxlint and the dev tools' plugin, superlint, fallow) and Effect's diagnostics record owner decisions: strengthen
them, never weaken them to let code through. Inline suppressions are refused; a file a rule must spare is named in
config. Rules rejected on purpose live in `REJECTED` in the dev tools' preset, and Effect's diagnostics in
`REJECTED_DIAGNOSTICS`, each with its reason; turning one back on needs the owner. A rule that forces worse code is
rejected, never kept with an allow-list or worked around.

## Design

- **Effect's algebra first, judged on merit.** Effect already has a computation algebra (`effect/workflow`:
  Workflow, Activity, DurableClock, DurableDeferred, DurableQueue, the `WorkflowEngine` contract). It is den's
  starting point, and den departs from its API only where a better design wins on technical merit.
  Where it falls short, the shortfall is written into the review and work stops for the owner; it is never worked
  around.
- **The full graph, no hedging.** den records the whole computation graph as typed facts in grizzle: every step and
  every edge, joins, fan-in and edges found at run time included, never a blob. Where Effect's algebra is partial,
  den goes past it. No local maximums.
- **No fire-and-forget.** Every piece of work started is joined by a scope that waits for it; work nobody joins is
  unrepresentable.
- **A tight algebraic core.** If Effect's algebra is not good enough, den builds its own small core, as grizzle did
  for the relational model. Effect stays the language a step's body is written in.
- **Glue Effect's upstream parts.** When in doubt, use Effect's upstream code (`effect/cluster`, `effect/persistence`,
  `effect/sql`, `effect/rpc`, Cron, Schedule and the rest) and glue the parts together; never reinvent what Effect
  already ships.
- **grizzle only, PostgreSQL 19 only.** den's state lives in a grizzle installation and nowhere else. No other store,
  no driver beside grizzle's, no PostgreSQL before 19. grizzle beats `effect/sql` wherever an Effect part reaches for
  SQL: such a part is glued in through a grizzle-backed implementation of its interface.
- **Representation over control flow.** When a new case appears, change the types so it stops being special or stops
  being expressible, instead of adding a branch, flag, guard or sentinel (`.agents/skills/representation-first`).
  Parse at the boundary once; absence is a variant or an `Option`, never a fallback.
- **Never defend against a trusted component.** What grizzle returns and what our own schema guarantees arrives typed
  and is used as it is.
- **Delete before you add; hard cutovers.** A fix removes the cause. A change replaces the old way everywhere in one
  go: no shims, aliases or readers of an old form.
- **Zero config.** Configuration that restates a library's default is deleted.
- **Every limit has evidence.** A literal that bounds concurrency, retries, timeouts, batch size or budget carries its
  `@limitKind` JSDoc (`.agents/skills/indefensible-numbers`).

## Workspace

A Turborepo workspace of private packages named `@den/<name>`, each exporting its raw TypeScript:

- `packages/devtools`: the lint preset (`lintConfig`, `REJECTED`, `REJECTED_DIAGNOSTICS`), the tsconfig base, the
  oxlint plugin and superlint, each rule proven against fixtures. Copied from grizzle's; den owns its copy.
- `packages/testing`: the choice-stream testing library every suite runs on (`explore`, `exhaust`, `commands`,
  `interleave`, the shrinker, `pnpm fuzz`, `pnpm mutate`). Copied from grizzle's; den owns its copy.
- `packages/den` (`@bjornpagen/den`): the library. `packages/den-model`: its reference model and simulator.
  `packages/den-vercel`: the Vercel Queues transport. `packages/edullm`: the outside systems of den's first use.
- `vendor/grizzle`: grizzle, a git submodule pinned on its `live` branch.
- `docs/`: the goals, the decisions, the proposal and the build notes.

Inside a package, import through its own `#` map with the real extension; across packages, by package export.

## Toolchain

- Node 26 runs TypeScript by type stripping; pnpm installs; no bundler. Every external version lives once, in the
  strict catalog (`pnpm-workspace.yaml`). A release is admitted once it is a day old, except Effect's own packages:
  den builds on Effect's newest release.
- TypeScript 7.1 beta with Effect's language service, from `@effect/tsgo`; `pnpm install` patches it in.
- `pnpm check` is the gate, run by hand before a commit: every package's typecheck, superlint and oxlint, the dev
  tools' fixture suites, oxfmt, fallow (`dead-code`, `architecture`) and `pnpm dedupe --check`. `pnpm test` runs the
  testing library's suite.

## Working here

- Commit only when asked, by explicit paths. Never run `git stash` in any form.
- The remote is github.com/bjornpagen/den. Nothing is published to npm.
- `../edullm` and `../grizzle` are read, never changed, from here.
