import type { Datum } from "@den/model/datum"
import { textOf } from "@den/model/datum"
import type { Fact, ScopeEnding } from "@den/model/facts"
import {
	type RootKey,
	rootText,
	type ScopeId,
	type StepId,
	scopeText,
	stepText
} from "@den/model/identity"
import { Array as Arr, HashMap, Option } from "effect"

/**
 * The differential harness's two halves meet here: the engine's committed rows, read back and named by the paths their
 * derived keys stand for, as the reference model's trace facts (`@den/model/facts`), and both traces reduced to the
 * facts the engine and the model agree on, as canonical texts.
 *
 * Compared: each root admitted under its key; each child scope opened, its kind and its owner; each step spawned, its
 * kind and input (a finish by its identity alone, since the model spawns it once its children end, with their endings
 * as its input, and the engine at its scope's admission); each step done with its output, or failed; each scope
 * finished and how. Not compared, each decided by one side alone: claims (the engine's stamped by the database under
 * its leases, the model's under its own turns), retries and their due instants, seats taken and given back,
 * reads (the engine records rows of the app's relation, the model the rows of its own app store), app writes, and every
 * instant.
 */

/** A graph as the engine committed it: each relation's rows the harness reads, keys as their digest text. */
export interface Graph {
	readonly roots: ReadonlyArray<{
		readonly scope: string
		readonly kind: string
		readonly key: string
	}>
	readonly admitted: ReadonlyArray<string>
	readonly withins: ReadonlyArray<{
		readonly scope: string
		readonly parent: string
		readonly kind: string
	}>
	readonly startSteps: ReadonlyArray<{
		readonly scope: string
		readonly ordinal: bigint
		readonly step: string
	}>
	readonly startScopes: ReadonlyArray<{
		readonly scope: string
		readonly ordinal: bigint
		readonly child: string
	}>
	readonly edges: ReadonlyArray<{
		readonly edge: string
		readonly from: string
		readonly ordinal: bigint
		readonly to: string
		readonly scope: boolean
	}>
	readonly finishes: ReadonlyArray<{ readonly scope: string; readonly step: string }>
	readonly steps: ReadonlyArray<{
		readonly step: string
		readonly kind: string
		readonly scope: string
	}>
	readonly inputs: ReadonlyMap<string, Datum>
	readonly results: ReadonlyArray<{ readonly step: string; readonly outcome: "done" | "failed" }>
	readonly outputs: ReadonlyMap<string, Datum>
}

/** The model's identity of each scope and step the graph holds, derived from the rows that say how each was opened. */
const identitiesOf = (graph: Graph) => {
	const scopes = new Map<string, ScopeId>()
	const steps = new Map<string, StepId>()
	Arr.forEach(graph.roots, (r) => {
		const root: RootKey = { kind: r.kind, key: r.key }
		scopes.set(r.scope, { _tag: "RootScope", root })
	})
	const grow = (): boolean => {
		const before = scopes.size + steps.size
		Arr.forEach(graph.startSteps, (s) =>
			Option.map(Option.fromNullishOr(scopes.get(s.scope)), (scope) =>
				steps.set(s.step, { _tag: "StartStep", scope, ordinal: Number(s.ordinal) })
			)
		)
		Arr.forEach(graph.startScopes, (s) =>
			Option.map(Option.fromNullishOr(scopes.get(s.scope)), (scope) =>
				scopes.set(s.child, { _tag: "StartScope", scope, ordinal: Number(s.ordinal) })
			)
		)
		Arr.forEach(graph.edges, (e) =>
			Option.map(Option.fromNullishOr(steps.get(e.from)), (by) =>
				e.scope
					? scopes.set(e.to, { _tag: "EdgeScope", by, edge: e.edge, ordinal: Number(e.ordinal) })
					: steps.set(e.to, { _tag: "EdgeStep", by, edge: e.edge, ordinal: Number(e.ordinal) })
			)
		)
		Arr.forEach(graph.finishes, (f) =>
			Option.map(Option.fromNullishOr(scopes.get(f.scope)), (scope) =>
				steps.set(f.step, { _tag: "FinishStep", scope })
			)
		)
		return scopes.size + steps.size > before
	}
	const settle = (): void => {
		if (grow()) {
			settle()
		}
	}
	settle()
	return { scopes, steps }
}

/** The engine's graph as the model's facts, every instant zero: the model compares none. */
export const factsOf = (graph: Graph): ReadonlyArray<Fact> => {
	const { scopes, steps } = identitiesOf(graph)
	const finishOf = HashMap.fromIterable(Arr.map(graph.finishes, (f) => [f.scope, f.step] as const))
	const outcome = HashMap.fromIterable(Arr.map(graph.results, (r) => [r.step, r.outcome] as const))
	const scopeOf = (key: string) => Option.fromNullishOr(scopes.get(key))
	const stepOf = (key: string) => Option.fromNullishOr(steps.get(key))
	const datumOf = (map: ReadonlyMap<string, Datum>, key: string): Datum =>
		Option.getOrElse(Option.fromNullishOr(map.get(key)), () => ({}))
	return [
		...Arr.flatMap(graph.roots, (r): ReadonlyArray<Fact> =>
			Arr.contains(graph.admitted, r.scope)
				? [
						{
							_tag: "Admitted",
							root: { kind: r.kind, key: r.key },
							input: {},
							exclusive: Option.none(),
							by: "operator",
							at: 0
						}
					]
				: []
		),
		...Arr.flatMap(graph.withins, (w): ReadonlyArray<Fact> =>
			Option.toArray(
				Option.flatMap(scopeOf(w.scope), (scope) =>
					Option.map(scopeOf(w.parent), (owner): Fact => ({
						_tag: "Opened",
						scope,
						kind: w.kind,
						input: {},
						owner,
						at: 0
					}))
				)
			)
		),
		...Arr.flatMap(graph.steps, (s): ReadonlyArray<Fact> =>
			Option.toArray(
				Option.flatMap(stepOf(s.step), (step) =>
					Option.map(scopeOf(s.scope), (scope): Fact => ({
						_tag: "Spawned",
						step,
						kind: s.kind,
						input: datumOf(graph.inputs, s.step),
						scope,
						due: 0,
						holds: [],
						at: 0
					}))
				)
			)
		),
		...Arr.flatMap(graph.results, (r): ReadonlyArray<Fact> =>
			Option.toArray(
				Option.map(stepOf(r.step), (step): Fact =>
					r.outcome === "done"
						? { _tag: "Done", step, attempt: 0, output: datumOf(graph.outputs, r.step), at: 0 }
						: { _tag: "Failed", step, attempt: 0, failure: { _tag: "Refused", error: {} }, at: 0 }
				)
			)
		),
		...Arr.flatMap(Arr.fromIterable(scopes.entries()), ([key, scope]): ReadonlyArray<Fact> =>
			Option.toArray(
				Option.flatMap(HashMap.get(finishOf, key), (finish) =>
					Option.map(HashMap.get(outcome, finish), (o): Fact => ({
						_tag: "Finished",
						scope,
						ending: o === "done" ? "Done" : "Failed",
						at: 0
					}))
				)
			)
		)
	]
}

/** A finish's step, by the shape of its identity. */
const isFinish = (step: StepId): boolean => step._tag === "FinishStep"

/** The text of an ending both sides give a scope. */
const endingText = (ending: ScopeEnding): string => ending

/**
 * The facts both sides agree on, as canonical texts, sorted: the comparison the harness makes. A fact neither side
 * compares, or a part of one, is left out (see the module's documentation).
 */
export const agreed = (facts: ReadonlyArray<Fact>): ReadonlyArray<string> =>
	Arr.sort(
		Arr.flatMap(facts, (fact): ReadonlyArray<string> => {
			switch (fact._tag) {
				case "Admitted":
					return [`admitted ${rootText(fact.root)}`]
				case "Opened":
					return [`opened ${scopeText(fact.scope)} ${fact.kind} in ${scopeText(fact.owner)}`]
				case "Spawned":
					return [
						isFinish(fact.step)
							? `spawned ${stepText(fact.step)}`
							: `spawned ${stepText(fact.step)} ${fact.kind} ${textOf(fact.input)}`
					]
				case "Done":
					return [`done ${stepText(fact.step)} ${isFinish(fact.step) ? "" : textOf(fact.output)}`]
				case "Failed":
					return [`failed ${stepText(fact.step)}`]
				case "Finished":
					return [`finished ${scopeText(fact.scope)} ${endingText(fact.ending)}`]
				case "Claimed":
				case "Read":
				case "Seated":
				case "Unseated":
				case "Retried":
				case "Wrote":
				case "Paused":
				case "Resumed":
				case "Deployed":
				case "Retired":
					return []
			}
		}),
		(a: string, b: string) => (a < b ? -1 : a > b ? 1 : 0)
	)
