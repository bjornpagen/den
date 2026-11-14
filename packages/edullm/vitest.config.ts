import { defineTestConfig } from "@bjornpagen/testing/vitest/config"

/** `pnpm test`: the fakes' and the pure pieces' searches, which need no database and no network. */
export default defineTestConfig({
	include: ["test/**/*.test.ts"],
	guided: [],
	setup: [],
	conditions: [],
	timeouts: { test: { kind: "unbounded" }, hook: { kind: "unbounded" } },
	smallStack: []
})
