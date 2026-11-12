import { defineTestConfig } from "@den/testing/vitest/config"
import { Option } from "effect"

/** `pnpm test`: den's unit suites, which need no database. */
export default defineTestConfig({
	include: ["test/**/*.test.ts"],
	exclusive: [],
	guided: [],
	setup: [],
	conditions: ["grizzle-source"],
	timeouts: { test: { kind: "unbounded" }, hook: { kind: "unbounded" } },
	maxWorkers: Option.none(),
	smallStack: []
})
