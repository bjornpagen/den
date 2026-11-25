import { Array as Arr, Option } from "effect"
import {
	type Admission,
	admissionOf,
	type Ladder,
	ordinals,
	type Program,
	type RootKind,
	rootedOf,
	type Runs,
	type StepKind,
	spawn,
	stepOf
} from "#program.ts"

/** The limits of AlphaTest's history load, each the test's input: how a chunk runs, its lease and its ladder. */
export type HistoryLimits = Readonly<{ lease: number; ladder: Ladder }>

/**
 * One history load an operator starts: its key, the rows the outside source holds (AlphaTest's old database), the
 * chains it runs side by side (S, from production measurements, not from seats), and the rows one chunk reads.
 */
export type Load = Readonly<{ key: string; rows: number; chains: number; chunk: number }>

/** One link of a chain: its load, its chain's end, and the cursor it reads from. */
type Chunk = Readonly<{ load: Load; end: number; cursor: number }>

/** The ranges of the source's key the load's chains cover, `[from, to)`, one per chain that holds a row. */
const rangesOf = (load: Load): ReadonlyArray<Readonly<{ from: number; to: number }>> => {
	const span = Math.ceil(load.rows / load.chains)
	return Arr.filter(
		Arr.map(ordinals(load.chains), (chain) => ({
			from: chain * span,
			to: Math.min(load.rows, (chain + 1) * span)
		})),
		(range) => range.from < range.to
	)
}

/**
 * AlphaTest's history load as a den program: an operator's root whose start opens S chains, one per range of the
 * source's key; each link reads one chunk from the source through its own client and returns its rows as writes,
 * committed with its result, and its edge passes the next cursor on while its range holds more; the root's finish
 * counts the rows every link loaded. Chains continue in their own invocations, so the load holds no seat and never
 * crawls at the census's pace.
 */
export const historyOf = (
	limits: HistoryLimits
): Readonly<{ program: Program; start: (load: Load) => Admission }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Link: StepKind<Chunk, number, never> = {
		name: "HistoryChunk",
		runs,
		input: (chunk) => ({ load: chunk.load.key, cursor: chunk.cursor, end: chunk.end }),
		output: (loaded) => loaded,
		error: () => 0,
		reads: () => [],
		body: (chunk) => {
			const rows = Arr.map(
				ordinals(Math.min(chunk.load.chunk, chunk.end - chunk.cursor)),
				(offset) => chunk.cursor + offset
			)
			return {
				_tag: "Output",
				output: rows.length,
				writes: Arr.map(rows, (row) => ({
					relation: "history",
					key: `${chunk.load.key}:${row}`,
					value: row
				}))
			}
		},
		edges: () => [
			spawn("next", Link, (chunk: Chunk) =>
				chunk.cursor + chunk.load.chunk < chunk.end
					? [{ load: chunk.load, end: chunk.end, cursor: chunk.cursor + chunk.load.chunk }]
					: []
			)
		]
	}

	const HistoryLoad: RootKind<Load, number, never> = {
		name: "HistoryLoad",
		trigger: { _tag: "Operator" },
		from: { _tag: "Given", heading: "HistoryLoadInput" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "HistoryLoad",
			input: (load) => ({ key: load.key, rows: load.rows, chains: load.chains }),
			start: (load) =>
				Arr.map(rangesOf(load), (range) =>
					stepOf(Link, { load, end: range.to, cursor: range.from })
				),
			finish: {
				runs,
				output: (loaded) => loaded,
				error: () => 0,
				body: (load, children) => {
					const loaded = Arr.reduce(children, 0, (sum, child) =>
						child._tag === "Done" && typeof child.output === "number" ? sum + child.output : sum
					)
					return {
						_tag: "Output",
						output: loaded,
						writes: [{ relation: "history_loaded", key: load.key, value: loaded }]
					}
				}
			}
		}
	}

	return {
		program: { name: "history", resources: [], roots: [rootedOf(HistoryLoad)] },
		start: (load) => admissionOf(HistoryLoad, load.key, load)
	}
}
