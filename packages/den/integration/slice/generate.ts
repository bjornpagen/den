import { generate } from "@bjornpagen/den/lower/generate"
import { NodeRuntime, NodeServices } from "@effect/platform-node"
import { Effect } from "effect"
import { chain, fan, retry, sync } from "#integration/slice/flows.ts"

/** `den generate` for the slice: each flow's fragment, programs and binding, into generated/. */
const placement = (name: string) => ({
	fragment: `#integration/slice/generated/${name}.fragment.ts`,
	programs: `#integration/slice/generated/${name}.programs.ts`,
	relations: "#integration/slice/relations.ts",
	schema: { from: "#integration/slice/app.ts", name: "App" },
	writer: { from: "#integration/slice/roles.ts", name: "Loader" },
	flow: { from: "#integration/slice/flows.ts", name }
})

const files = (name: string) => ({
	fragment: `${name}.fragment.ts`,
	programs: `${name}.programs.ts`,
	binding: `${name}.binding.ts`
})

const directory = `${import.meta.dirname}/generated`

if (import.meta.main) {
	NodeRuntime.runMain(
		Effect.all([
			generate(chain, directory, placement("chain"), files("chain")),
			generate(fan, directory, placement("fan"), files("fan")),
			generate(sync, directory, placement("sync"), files("sync")),
			generate(retry, directory, placement("retry"), files("retry"))
		]).pipe(Effect.provide(NodeServices.layer))
	)
}
