import { defineTestConfig } from "@den/testing/vitest/config"
import { Option } from "effect"

/** `pnpm test`: the transport's suites, over the fake of Vercel Queues' client; none reaches Vercel. */
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
