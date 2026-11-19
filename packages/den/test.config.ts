import { pgOwnerSession } from "@bjornpagen/testing/pg-session"
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
 * cluster (pg.config.ts), which the layer provides as the PgCluster their needs clone from, every database named after
 * den's test prefix `den_t_`, every session the owner's over node-postgres; the testing library makes and starts the
 * cluster the first time a need reaches it.
 */
export default defineRunner({
	include: ["integration/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	layer: PgCluster.layer({
		prefix: DatabasePrefix("den_t_"),
		cluster: denCluster,
		connect: pgOwnerSession("den-resources owner")
	}),
	mutation: noMutation
})
