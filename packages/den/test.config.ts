import { pgOwnerSession, pgSuperuserSession } from "@bjornpagen/testing/pg-session"
import { DatabasePrefix, PgCluster } from "@bjornpagen/testing/resources"
import { defineRunner, noMutation } from "@bjornpagen/testing/runner"
import denCluster from "#pg.config.ts"

declare module "@bjornpagen/testing/property" {
	interface RunnerServices {
		readonly cluster: PgCluster
	}
}

/**
 * The CPU a whole run of den's integration properties may spend beyond its workers' starts and readyings and its run
 * needs' opens (the toolchain's RunBudget `run`, the report's `run`), its cases' PostgreSQL backends among it: a run
 * past it fails, naming what it spent, a regression to find, never a number to raise.
 *
 * @limitKind measured
 * @owner den's runner config (packages/den/test.config.ts)
 * @unit milliseconds of metered CPU
 * @scope one whole run of den's integration properties (`toolchain-test run` in packages/den), at its run's width
 * @evidence the run's report, ~/.cache/toolchain-test/runs/79771309-870018.json, a copy of it in
 *   ~/.cache/den/DENVARIANT-evidence/den-run.json: 38 properties, none cached, none failed
 * @observed 2026-11-28 02:02 to 02:18 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, shared (load average 360 to 380), Node
 *   26, toolchain 13a371cdaeeb, grizzle 1b28f7563f73, den-test-0 on the workbench's PostgreSQL 19.0
 * @workload every integration property, run once on 31 workers over den's one-member family
 * @result report.run 1,963,847.8 ms (report.metered 2,354,752.4 ms with the backends), 963,387 ms of the run's wall
 * @decision twice report.run, rounded up, as the toolchain's migration states (its README "a run's budget holds two
 *   parts")
 * @revalidate a property added or grown, the slice's migration grown, a toolchain or grizzle repin, another machine
 */
const runBudgetMillis = 3_927_696

/**
 * The CPU one worker may spend importing one property's module as it readies the property (the toolchain's RunBudget
 * `import`, each report row's `imports`): an import past it fails the run, naming its property, a module whose import
 * closure grew to find.
 *
 * @limitKind measured
 * @owner den's runner config (packages/den/test.config.ts)
 * @unit milliseconds of a process's own CPU, user and system
 * @scope one import of one integration module, the cold import of a worker whose first module it is bounding every
 *   later one
 * @evidence each of den's 31 integration modules imported cold in a process of its own (node --disable-proto=delete
 *   --disable-sigusr1, process.cpuUsage around `await import`, no compile cache), 8 at once:
 *   ~/.cache/den/DENVARIANT-evidence/imports-20261128T0139Z.log, by measure.mjs and all.sh beside it; the run above's
 *   rows' imports, a warm compile cache's, at most 2,244.4 ms
 * @observed 2026-11-28 01:39 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, shared (load average 280 to 310), Node
 *   26, toolchain 13a371cdaeeb, grizzle dcffb8552d8c
 * @workload every integration module, each imported once
 * @result median 4,556.8 ms, largest 4,689.2 ms (integration/contract.test.ts); none failed to import
 * @decision twice the largest cold import, rounded up, as the toolchain's migration states
 * @revalidate a module whose import closure grows (the slice's generated modules, grizzle's), a toolchain repin,
 *   another machine
 */
const importBudgetMillis = 9_379

/**
 * den's runner config: its integration properties (integration/), each case over its own database on den's local
 * cluster (pg.config.ts), which the layer provides as the PgCluster their needs clone from, worker i on member i mod
 * the members' count, every database named after den's test prefix `den_t_`, every session the owner's over
 * node-postgres but the bootstrap superuser's, the account's over the member's socket, which makes a clone's role
 * settings again. A run's workers hold the checkout's family and bring up the members they reach, each settled to
 * pg.config.ts's spec where it is not, and the members stop once the run ends, however it ends.
 */
export default defineRunner({
	budget: { kind: "cpu", run: runBudgetMillis, import: importBudgetMillis },
	include: ["integration/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	environment: [],
	layer: PgCluster.layer({
		prefix: DatabasePrefix("den_t_"),
		cluster: denCluster,
		connect: pgOwnerSession("den-resources owner"),
		superuser: pgSuperuserSession("den-resources superuser")
	}),
	mutation: noMutation
})
