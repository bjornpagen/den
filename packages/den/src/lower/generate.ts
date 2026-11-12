import { Effect, FileSystem, Path } from "effect"
import type { AnyFlow } from "#algebra/flow.ts"
import { lower } from "#lower/fragment.ts"
import { type Placement, printBinding, printFragment, printPrograms } from "#lower/print.ts"

/** The three modules of a flow: its fragment, its programs and its binding. */
export interface Printed {
	readonly fragment: string
	readonly programs: string
	readonly binding: string
}

/** A flow's modules, printed from its lowering. */
export const printed = (flow: AnyFlow, place: Placement): Printed => {
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
