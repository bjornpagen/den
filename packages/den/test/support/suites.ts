/**
 * How long one case of den's suites, or one shrink candidate, may run before it is stopped and reported as hung. A
 * case runs inside its file, so it can never usefully run past the slowest file's whole run; the guard stops a case
 * that never ends, and decides no verdict of a case that does.
 *
 * @limitKind measured
 * @owner den's suites (packages/den/test, packages/den/integration, packages/den-vercel/test)
 * @unit milliseconds
 * @scope one case or shrink candidate of one search of den's suites
 * @evidence packages/den/out/case-hang/20261116T072705Z/ in den's checkout on cassowary, the uncommitted record of
 *   `pnpm test --force` then `pnpm test:network`: den-results.json and den-vercel-results.json, Vitest's own record of
 *   each file's last run (SHA-256 7f8e3b86be4ce7630b6e8795e1a5ec889d0f2bbce02bc07c91cf364477b4f5d4 and
 *   765b8e0cebf5e272caa3796a617ff5037198b4f775cd2dee0da91bde1c29c506), run.log with the load before, between and
 *   after, and environment.txt; and den 1baee82's message, which records test:network's whole run under a load of
 *   about 400
 * @observed 2026-11-16 07:27:05 to 07:27:35 UTC
 * @environment cassowary, Ubuntu 26.04 on an AWS Graviton3 (Neoverse-V1, arm64) instance, 64 CPUs and 247 GiB, load
 *   average 17.6 to 21.3 from other sessions; Node 26.13.1, Vitest 5.1.0, toolchain 4b24be8; den's PostgreSQL 19rc2
 *   cluster (scripts/pg.sh), each network file in a database of its own
 * @workload every suite that sets caseHang: den's five unit files and den-vercel's four, then den's fifteen network
 *   files on the cluster, every file of a package at once
 * @result every file passed; the slowest, integration/seatcount.test.ts, in 19,635 ms, every network file but
 *   certification's (3,319 ms) between 19,443 and 19,635 ms, migration included; the unit files 36 to 1,495 ms.
 *   1baee82 records the same fifteen network files in 5 min 44 s at a load of about 400, so a file then ran at most
 *   about 344,000 ms. Per-case times and memory were not recorded
 * @decision 600,000 ms is about thirty times the slowest file's whole run here, and about one and three quarters times
 *   the whole network run at a load of about 400: a case cannot take longer than its file, so the guard only ever
 *   stops a case that never ends, and a test's own timeout is unbounded, so without it a hung case would hang its run
 *   unreported
 * @revalidate a suite whose file takes longer than a minute; a suite's runs raised; a Node, Vitest or PostgreSQL pin
 *   change; another machine
 */
export const caseHangMillis = 600_000
