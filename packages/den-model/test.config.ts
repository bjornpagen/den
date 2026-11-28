import { defineRunner, noMutation } from "@bjornpagen/testing/runner"
import { Layer } from "effect"

/**
 * The CPU a whole run of den-model's properties may spend beyond its workers' starts and readyings and its run needs'
 * opens (the toolchain's RunBudget `run`, the report's `run`): a run past it fails, naming what it spent, a regression to
 * find, never a number to raise.
 *
 * @limitKind measured
 * @owner den-model's runner config (test.config.ts)
 * @unit milliseconds of metered CPU
 * @scope one whole run of the package's properties (`toolchain-test run`), at its run's width
 * @evidence the run's report, ~/.cache/toolchain-test/runs/1899440492-3900082.json, a copy of it in
 *   ~/.cache/den/DENVARIANT-evidence/den-model-run.json: `pnpm test` of den's workspace, 5 properties, none cached
 * @observed 2026-11-28 01:33 to 01:38 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, shared (load average 290 to 320), Node
 *   26, toolchain 13a371cdaeeb, grizzle dcffb8552d8c
 * @workload every property of the package, run once on 5 workers
 * @result report.run 40,919.2 ms, 29,759 ms of the run's wall; none failed
 * @decision twice report.run, rounded up, as the toolchain's migration states (its README "a run's budget holds two
 *   parts")
 * @revalidate a property added or grown, a toolchain or grizzle repin, another machine
 */
const runBudgetMillis = 81_839

/**
 * The CPU one worker may spend importing one property's module as it readies the property (the toolchain's RunBudget
 * `import`, each report row's `imports`): an import past it fails the run, naming its property, a module whose import
 * closure grew to find.
 *
 * @limitKind measured
 * @owner den-model's runner config (test.config.ts)
 * @unit milliseconds of a process's own CPU, user and system
 * @scope one import of one test module, the cold import of a worker whose first module it is bounding every later one
 * @evidence each of the package's test modules imported cold in a process of its own (node --disable-proto=delete
 *   --disable-sigusr1, process.cpuUsage around `await import`, no compile cache), 8 at once:
 *   ~/.cache/den/DENVARIANT-evidence/imports-20261128T0139Z.log, by measure.mjs and all.sh beside it
 * @observed 2026-11-28 01:39 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, shared (load average 280 to 310), Node
 *   26, toolchain 13a371cdaeeb
 * @workload every test module of the package, each imported once
 * @result largest 817.5 ms (src/metis.test.ts); none failed to import
 * @decision twice the largest, rounded up, as the toolchain's migration states
 * @revalidate a module whose import closure grows, a toolchain repin, another machine
 */
const importBudgetMillis = 1_635

/**
 * The model's runner config: its property modules, which toolchain-test runs; no export conditions; no services beyond
 * the runner's own, since the model needs no database; and the library's operators alone for mutation.
 */
export default defineRunner({
	budget: { kind: "cpu", run: runBudgetMillis, import: importBudgetMillis },
	include: ["src/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	environment: [],
	layer: Layer.empty,
	mutation: noMutation
})
