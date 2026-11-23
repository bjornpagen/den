import { localCluster } from "@bjornpagen/testing/pg"

/**
 * One busy backend's proportional share of memory at den's heaviest one-backend work, which a member's connections are
 * the machine's memory over (`toolchain-pg settle`): the slice's whole init migration, every statement of its five
 * files, run in one backend.
 *
 * @limitKind measured
 * @owner den's integration suites (packages/den/integration)
 * @unit bytes
 * @scope one backend of a member of den's test cluster, at its peak
 * @evidence the slice's init migration at grizzle's pin stack d0a5b0a95 (migrations/slice/20261121132246_init, 01 to 05,
 *   24,135 lines) run by psql in one backend as the bootstrap superuser on the workbench's PostgreSQL 19.0 (the
 *   `postgres` unit, over its socket), then that backend's `SELECT pg_catalog.pg_read_file('/proc/self/smaps_rollup')`
 *   (script ~/.cache/den/denrepin2-tools/measure.sql, log ~/.cache/den/denrepin2-logs/measure.log; the database and
 *   its roles dropped after)
 * @observed 2026-11-21 13:33:33 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, shared with other lanes' runs
 * @workload one backend alone, as the bootstrap superuser, running the five files in order on an empty database
 * @result Rss 937,292 kB, Pss 96,728 kB (Pss_Anon 38,306 kB, Pss_Shmem 58,126 kB, Pss_File 294 kB): 99,049,472 bytes
 * @decision the Pss as measured, no headroom: a member's connections are the machine's memory over it, and a member past
 *   them refuses one (53300), a problem met where it happens. Unmeasured: a case's backends, each working less than
 *   the whole migration at once
 * @revalidate a slice whose migration grows past it, a case whose one backend works harder than the init migration
 *   (a larger publish), a PostgreSQL repin, another machine
 */
const backendBytes = 99_049_472

/**
 * den's local cluster, which every integration property's database is cloned on (test.config.ts): at each checkout a
 * family of its own of one member, the workbench's unit `postgres@den-test-<key>-0` (@bjornpagen/testing/pg family.ts),
 * reached over verify-full TLS at localhost at a port it claims from 20,000, since grizzle's client speaks nothing else.
 * Owned by den_dev, who may set deadlock_timeout, which grizzle's installation sets; its template den_template carries
 * pgvector in vector_ext for the slice's nearest reads. Throwaway. Its connections are the machine's memory over one
 * busy backend's, and a replication slot and a WAL sender for each, since every live source's leader holds one of each;
 * its predicate lock table PostgreSQL's room for every backend at grizzle's recommendation to production, since den
 * states no measured room of its own. `pnpm exec toolchain-pg settle` from this package gives the member this spec; a
 * run only reads it.
 */
export default localCluster({
	unit: "den-test",
	network: { kind: "tls", from: 20_000 },
	owner: "den_dev",
	template: "den_template",
	extensions: [{ name: "vector", schema: "vector_ext" }],
	ownerParameters: ["deadlock_timeout"],
	durability: "throwaway",
	sizing: {
		kind: "workers",
		family: { kind: "one" },
		connections: { kind: "capacity", backendBytes },
		replication: { kind: "capacity" },
		sharedBuffers: { kind: "default" },
		locks: { kind: "default" },
		predicateLocks: { kind: "perBackend" }
	}
})
