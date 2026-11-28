import { defineTestConfig } from "@bjornpagen/testing/vitest/config"

/** `pnpm test`: the transport's suites, over the fake of Vercel Queues' client; none reaches Vercel. */
export default defineTestConfig({
	include: ["test/**/*.test.ts"],
	guided: [],
	setup: [],
	conditions: [],
	smallStack: [],
	examples: { kind: "banned", exempt: [] }
})
