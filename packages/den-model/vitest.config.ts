import { defineTestConfig } from "@den/testing/vitest/config"
import { Option } from "effect"

export default defineTestConfig({
	include: ["src/**/*.test.ts"],
	exclusive: [],
	guided: [],
	setup: [],
	conditions: [],
	timeouts: {
		test: { kind: "bounded", millis: 120_000 },
		hook: { kind: "bounded", millis: 60_000 }
	},
	maxWorkers: Option.none(),
	smallStack: []
})
