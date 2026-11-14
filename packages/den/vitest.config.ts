import { defineTestConfig } from "@bjornpagen/testing/vitest/config"

/** `pnpm test`: den's unit suites, which need no database. */
export default defineTestConfig({
	include: ["test/**/*.test.ts"],
	guided: [],
	setup: [],
	conditions: [],
	timeouts: { test: { kind: "unbounded" }, hook: { kind: "unbounded" } },
	smallStack: []
})
