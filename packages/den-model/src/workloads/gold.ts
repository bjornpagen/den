import { Array as Arr, Option } from "effect"
import {
	type Admission,
	admissionOf,
	type Ladder,
	type Program,
	type RootKind,
	rootedOf,
	type Runs,
	type StepKind,
	spawn,
	stepOf
} from "#program.ts"
import { QTI_READ } from "#workloads/qti.ts"
import { TIMEBACK_DAILY } from "#workloads/timeback.ts"

/** W4's limits, each the test's input: how a view's build runs. */
export type GoldLimits = Readonly<{ lease: number; ladder: Ladder }>

/** One Gold run: its key (a schedule's day or a press of the button), its views in order, and the view that fails. */
export type Refresh = Readonly<{ key: string; views: number; fails: Option.Option<number> }>

/** One view's build: its run and its place in the chain. */
type View = Readonly<{ refresh: Refresh; view: number }>

/**
 * W4, edullm's Gold refresh, as a den program: a singleton root, admitted by its schedule or the operator's button only
 * while no Timeback or QTI step is pending (its precondition), builds one view per step, each naming the next, so a
 * failed view stops the run (a failed step spawns nothing); its finish swaps the generation in only once every view
 * was built.
 */
export const goldOf = (
	limits: GoldLimits
): Readonly<{ program: Program; admit: (refresh: Refresh) => Admission }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Build: StepKind<View, number, number> = {
		name: "GoldView",
		runs,
		input: (view) => ({ refresh: view.refresh.key, view: view.view }),
		output: (view) => view,
		error: (view) => view,
		reads: () => [],
		body: (view) =>
			Option.contains(view.refresh.fails, view.view)
				? { _tag: "Failure", error: view.view }
				: {
						_tag: "Output",
						output: view.view,
						writes: [
							{ relation: "gold_next", key: `${view.refresh.key}:${view.view}`, value: view.view }
						]
					},
		edges: () => [
			spawn("next", Build, (view: View) =>
				view.view + 1 < view.refresh.views ? [{ refresh: view.refresh, view: view.view + 1 }] : []
			)
		]
	}

	const GoldRefresh: RootKind<Refresh, boolean, never> = {
		name: "GoldRefresh",
		trigger: { _tag: "Operator" },
		precondition: Option.some({ _tag: "Pending", roots: [TIMEBACK_DAILY, QTI_READ] }),
		window: Option.none(),
		exclusive: Option.some(() => "gold"),
		scope: {
			name: "GoldRefresh",
			input: (refresh) => ({ key: refresh.key, views: refresh.views }),
			start: (refresh) => [stepOf(Build, { refresh, view: 0 })],
			finish: {
				runs,
				output: (swapped) => swapped,
				error: () => false,
				body: (refresh, children) => {
					const swapped =
						children.length === refresh.views &&
						Arr.every(children, (child) => child._tag === "Done")
					return {
						_tag: "Output",
						output: swapped,
						writes: swapped ? [{ relation: "gold", key: "generation", value: refresh.key }] : []
					}
				}
			}
		}
	}

	return {
		program: { name: "gold", resources: [], roots: [rootedOf(GoldRefresh)] },
		admit: (refresh) => admissionOf(GoldRefresh, refresh.key, refresh)
	}
}
