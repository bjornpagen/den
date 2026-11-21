import { Array as Arr, Effect, FileSystem, Path } from "effect"
import { type AnyFlow, stepsOf } from "#algebra/flow.ts"
import { Refused } from "#algebra/kinds.ts"
import { lower } from "#lower/fragment.ts"
import {
	type Placement,
	printBinding,
	printFragment,
	printPrograms,
	readsExport
} from "#lower/print.ts"

/** The three modules of a flow: its fragment, its programs and its binding. */
export interface Printed {
	readonly fragment: string
	readonly programs: string
	readonly binding: string
}

/**
 * A flow's modules, printed from its lowering. Each step's reads must be the placement's reads module's export of its
 * name, the one value the fragment builds the read's records from and the flow runs: a step whose reads are any other
 * value is refused, since no type can say which module a value came from.
 */
export const printed = (flow: AnyFlow, place: Placement): Printed => {
	Arr.forEach(stepsOf(flow.kinds), (step) => {
		if (step.reads.kind === "query" && place.reads.exports[readsExport(step.name)] !== step.reads) {
			throw new Refused({
				declaration: `step ${step.name}`,
				why: `its reads are not ${place.reads.from}'s export ${readsExport(step.name)}, which den's fragment builds its records from`
			})
		}
	})
	const lowered = lower(flow)
	return {
		fragment: printFragment(lowered, place),
		programs: printPrograms(lowered, place),
		binding: printBinding(lowered, place)
	}
}

/**
 * `den generate`: writes a flow's three modules into `directory` under the file names `files` gives. The repository's
 * formatter runs over them after, so the committed text is the formatter's.
 */
export const generate = (
	flow: AnyFlow,
	directory: string,
	place: Placement,
	files: { readonly fragment: string; readonly programs: string; readonly binding: string }
) =>
	Effect.gen(function* () {
		const fs = yield* FileSystem.FileSystem
		const path = yield* Path.Path
		const modules = printed(flow, place)
		yield* fs.writeFileString(path.join(directory, files.fragment), modules.fragment)
		yield* fs.writeFileString(path.join(directory, files.programs), modules.programs)
		yield* fs.writeFileString(path.join(directory, files.binding), modules.binding)
	})
