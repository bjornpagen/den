import { defineTestConfig } from "@den/testing/vitest/config"
import { Option } from "effect"

/**
 * `pnpm test:network`: the vertical slice on den's own PostgreSQL 19 cluster (scripts/pg.sh), each file in a database
 * of its own, migrated from the slice's committed migrations.
 */
export default defineTestConfig({
	include: ["integration/**/*.test.ts"],
	exclusive: [],
	guided: [],
	setup: [],
	conditions: [],
	timeouts: { test: { kind: "unbounded" }, hook: { kind: "unbounded" } },
	maxWorkers: Option.none(),
	smallStack: []
})
