import { defineRunner, noMutation } from "@bjornpagen/testing/runner"
import { denCluster } from "#integration/support/runner.ts"

/**
 * den's runner config: its integration properties (integration/), each case over its own database on den's PostgreSQL
 * 19 cluster (scripts/pg.sh), which the layer provides as the PgCluster their needs clone from
 * (integration/support/runner.ts), built the first time a need reaches it.
 */
export default defineRunner({
	include: ["integration/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	layer: denCluster,
	mutation: noMutation
})
