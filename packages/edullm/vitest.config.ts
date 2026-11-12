import { defineTestConfig } from "@den/testing/vitest/config"
import { Option } from "effect"

/** `pnpm test`: the fakes' and the pure pieces' searches, which need no database and no network. */
export default defineTestConfig({
	include: ["test/**/*.test.ts"],
	exclusive: [],
	guided: [],
	setup: [],
	conditions: [],
	timeouts: { test: { kind: "unbounded" }, hook: { kind: "unbounded" } },
	maxWorkers: Option.none(),
	smallStack: []
})
