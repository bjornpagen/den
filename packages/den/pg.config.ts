import { pin } from "@bjornpagen/grizzle-pg/pin"
import { localCluster } from "@bjornpagen/testing/pg"

/**
 * den's local cluster, which every integration property's database is cloned on and the runner's layer makes and
 * starts the first time a need reaches it (test.config.ts): on port 5443, run by the PostgreSQL build vendor/grizzle
 * pins (grizzle's scripts/pg/pin.env, which `grizzle-pg build` makes), owned by den_dev, its template den_template
 * carrying pgvector in vector_ext for the slice's nearest reads, throwaway, one member. `pnpm pg <command>` runs its life
 * by hand (`toolchain-pg`).
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
	family: { kind: "one" },
	sizing: {
		connections: { kind: "default" },
		replication: { kind: "perWorker", perWorker: 1, outside: 0 },
		sharedBuffers: { kind: "default" }
	}
})
