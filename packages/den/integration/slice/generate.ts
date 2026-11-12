import { generate } from "@bjornpagen/den/lower/generate"
import { NodeRuntime, NodeServices } from "@effect/platform-node"
import { Effect } from "effect"
import { chain, fan } from "#integration/slice/flows.ts"

/** `den generate` for the slice: each flow's fragment, programs and binding, into generated/. */
const placement = (name: string) => ({
	fragment: `${name}.fragment.ts`,
	programs: `${name}.programs.ts`,
	binding: `${name}.binding.ts`,
	specifiers: {
		fragment: `#integration/slice/generated/${name}.fragment.ts`,
		programs: `#integration/slice/generated/${name}.programs.ts`
	},
	schema: { from: "#integration/slice/app.ts", name: "App" },
	flow: { from: "#integration/slice/flows.ts", name }
})

if (import.meta.main) {
	NodeRuntime.runMain(
		Effect.all([
			generate(chain, `${import.meta.dirname}/generated`, placement("chain")),
			generate(fan, `${import.meta.dirname}/generated`, placement("fan"))
		]).pipe(Effect.provide(NodeServices.layer))
	)
}
