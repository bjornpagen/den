import { defineTestConfig } from "@bjornpagen/testing/vitest/config"

/**
 * `pnpm test:network`: the vertical slice on den's own PostgreSQL 19 cluster (scripts/pg.sh), each file in a database
 * of its own, migrated from the slice's committed migrations.
 */
export default defineTestConfig({
	include: ["integration/**/*.test.ts"],
	guided: [],
	setup: [],
	conditions: [],
	timeouts: { test: { kind: "unbounded" }, hook: { kind: "unbounded" } },
	smallStack: []
})
