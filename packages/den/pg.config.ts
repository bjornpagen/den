import { pin } from "@bjornpagen/grizzle-pg/pin"
import { localCluster } from "@bjornpagen/testing/pg"

/**
 * One worker's connections at most at once: its owner session, which clones each case's database from the template,
 * and its case's sessions, the slice's logins' pools a case opens, at most 7 on one case database.
 *
 * @limitKind measured
 * @owner den's integration suites (packages/den/integration)
 * @unit connections
 * @scope one worker of the runner on the one member
 * @measurement den's network suite at the repin to grizzle 6230b6610 and toolchain d3a4a60 (TEST_SEED=1570319363, 64
 *   cores), every client backend sampled every 0.1 s by database and application over 22,119 samples
 *   (~/.cache/grizzle-release/DENSYNC2-tools/measure): one `den-resources owner` session a worker, and at most 7 on any
 *   one case database (31 of 38 case databases held 1, 6 held 2)
 */
const perWorker = 8

/**
 * The connections no worker holds, at most at once: the template's build, a doctor's, an operator's psql and the
 * maker's own admin session.
 *
 * @limitKind measured
 * @owner den's integration suites (packages/den/integration)
 * @unit connections
 * @scope the member, outside every worker
 * @measurement the same run: at most 1 on the template database, 1 psql, 1 admin session on `postgres` and 1 unattached
 *   session at once
 */
const outside = 4

/**
 * den's local cluster, which every integration property's database is cloned on and the runner's layer makes and
 * starts the first time a need reaches it (test.config.ts): on port 5443, run by the PostgreSQL build vendor/grizzle
 * pins (grizzle's scripts/pg/pin.env, which `grizzle-pg build` makes), owned by den_dev, who may set deadlock_timeout,
 * which grizzle's installation sets, its template den_template carrying pgvector in vector_ext for the slice's nearest
 * reads, throwaway, one member, leased by the runner's workers. `pnpm pg <command>` runs its life by hand
 * (`toolchain-pg`).
 *
 * Its replication slots and walsenders: every live source's leader holds one slot and one walsender, and a worker runs
 * one case at a time, each with at most one installation whose live source a leader serves.
 *
 * @limitKind derived
 * @owner den's integration suites (packages/den/integration)
 * @unit replication slots, and walsenders
 * @scope one worker of the runner, and nothing outside a worker
 * @derivation a case's installation has one live source, which one leader serves with one slot and one walsender, and a
 *   worker runs one case at a time; the templates the runner builds serve no live source
 * @from integration/support/slice.ts, installedSliceCase and liveSliceCase: an installation of the case's own
 */
export default localCluster({
	port: 5443,
	bin: { kind: "directory", directory: `${pin.GRIZZLE_PG_PREFIX}/bin` },
	owner: "den_dev",
	template: "den_template",
	extensions: [{ name: "vector", schema: "vector_ext" }],
	peerLogins: [],
	durability: "throwaway",
	ownerParameters: ["deadlock_timeout"],
	sizing: {
		kind: "leased",
		family: { kind: "one" },
		connections: { perWorker, outside },
		replication: { kind: "perWorker", perWorker: 1, outside: 0 },
		sharedBuffers: { kind: "default" },
		locks: { kind: "default" }
	}
})
