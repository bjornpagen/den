import { defineRunner, noMutation } from "@bjornpagen/testing/runner"
import { Layer } from "effect"

/**
 * edullm's runner config: the properties of its fakes and its pure pieces (test/), which need no database and no
 * network, so the runner provides them no service of the repository's.
 */
export default defineRunner({
	include: ["test/**/*.test.ts"],
	smallStack: [],
	conditions: [],
	layer: Layer.empty,
	mutation: noMutation
})
