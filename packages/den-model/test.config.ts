import { defineRunner, noMutation } from "@bjornpagen/testing/runner"
import { Layer } from "effect"

/**
 * The model's runner config: its property modules, which toolchain-test runs; no export conditions; no services beyond
 * the runner's own, since the model needs no database; and the library's operators alone for mutation.
 */
export default defineRunner({
	include: ["src/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	layer: Layer.empty,
	mutation: noMutation
})
