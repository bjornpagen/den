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
 * den's runner config: its integration properties (integration/), each case over its own database on den's local
 * cluster (pg.config.ts), which the layer provides as the PgCluster their needs clone from, worker i on member i mod
 * the members' count, every database named after den's test prefix `den_t_`, every session the owner's over
 * node-postgres but the bootstrap superuser's, the account's over the member's socket, which makes a clone's role
 * settings again. A run's workers hold the checkout's family and bring up the members they reach, each settled to
 * pg.config.ts's spec where it is not, and the members stop once the run ends, however it ends.
 */
export default defineRunner({
	include: ["integration/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	layer: PgCluster.layer({
		prefix: DatabasePrefix("den_t_"),
		cluster: denCluster,
		connect: pgOwnerSession("den-resources owner"),
		superuser: pgSuperuserSession("den-resources superuser")
	}),
	mutation: noMutation
})
