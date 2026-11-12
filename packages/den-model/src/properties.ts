import { Array as Arr, Data, HashMap, Option } from "effect"
import type { Entry, Fact } from "#facts.ts"
import {
	rootOfScope,
	rootOfStep,
	rootText,
	type ScopeId,
	type StepId,
	scopeText,
	stepText
} from "#identity.ts"
import type { Lane } from "#program.ts"
import type { FairEnd, Rerun } from "#simulator.ts"

/**
 * den's laws, each checked over what a run leaves:
 * - `no-stall`: under fair scheduling every pending step reaches an end, none waiting past its program's patience;
 * - `one-result`: a step has at most one result, and an app write lands only with its step's result;
 * - `scope-once`: a scope finishes once, after every child it owns;
 * - `width`: a lane never holds more live claims than its width, each in a slot of its own;
 * - `rerun`: an accepted call made again at once adds nothing;
 * - `stale-drains`: a call from a deployment older than the current one is answered `stale`, and an old deployment's
 *   messages and workers drain away;
 * - `owned`: every step and scope is opened inside a scope that has not finished, and no root retires with work pending
 *   inside it, so nothing runs that nobody joins;
 * - `fenced`: a commit lands only on a claim its token names, of its step's graph as it stands, never on a claim of a
 *   graph admitted again under a retired root's key.
 */
export type Law =
	| "no-stall"
	| "one-result"
	| "scope-once"
	| "width"
	| "rerun"
	| "stale-drains"
	| "owned"
	| "fenced"

/** Every law, in the order a run is checked. */
export const LAWS: Arr.NonEmptyReadonlyArray<Law> = [
	"no-stall",
	"one-result",
	"scope-once",
	"width",
	"rerun",
	"stale-drains",
	"owned",
	"fenced"
]

/** A law a run broke, the law named as data and the witness in the message. */
export class LawBroken extends Data.TaggedError("LawBroken")<{ law: Law; message: string }> {}

/**
 * What a law is checked over: a trace (the model's, or one the real engine's tests wrote), the program's lanes, and,
 * for the laws the platform decides, the re-runs and the fair phase's end a simulated run records.
 */
export type Evidence = Readonly<{
	trace: ReadonlyArray<Entry>
	lanes: ReadonlyArray<Lane>
	reruns: ReadonlyArray<Rerun>
	end: FairEnd
}>

const broken = (law: Law, message: string) => Option.some(new LawBroken({ law, message }))

const whereOf = (entry: Entry) => `at ${entry.at}, ${entry.command._tag}`

/**
 * Folds a trace's facts in commit order, each with its entry. The state the check keeps is its own; a root's
 * retirement is the end of its incarnation, after which a root under the same key is a new graph.
 */
const firstBreak = <S>(
	trace: ReadonlyArray<Entry>,
	initial: S,
	step: (
		state: S,
		fact: Fact,
		entry: Entry
	) => Readonly<{ state: S; broke: Option.Option<LawBroken> }>
): Readonly<{ state: S; broke: Option.Option<LawBroken> }> => {
	let state = initial
	for (const entry of trace) {
		for (const fact of entry.facts) {
			const next = step(state, fact, entry)
			if (Option.isSome(next.broke)) {
				return next
			}
			state = next.state
		}
	}
	return { state, broke: Option.none() }
}

const ok = <S>(state: S) => ({ state, broke: Option.none<LawBroken>() })

/** Drops every key of a retired root from a map keyed by step or scope text. */
const forget = <V>(
	map: HashMap.HashMap<string, V>,
	root: string,
	rootOf: (value: V) => string
): HashMap.HashMap<string, V> => HashMap.filter(map, (value) => rootOf(value) !== root)

const stepRoot = (step: StepId) => rootText(rootOfStep(step))
const scopeRoot = (scope: ScopeId) => rootText(rootOfScope(scope))

/** Whether a fact ends a step, and which. */
const endedStep = (fact: Fact): Option.Option<StepId> => {
	switch (fact._tag) {
		case "Done":
		case "Failed":
		case "Completed":
		case "Stopped":
			return Option.some(fact.step)
		case "Admitted":
		case "Opened":
		case "Spawned":
		case "Fed":
		case "Claimed":
		case "Retried":
		case "Wrote":
		case "Finished":
		case "Paused":
		case "Resumed":
		case "Deployed":
		case "Retired":
			return Option.none()
	}
}

/** One result per step, and every write inside the entry that landed its step's `Done`, after it. */
export const oneResult = (evidence: Evidence): Option.Option<LawBroken> => {
	type Results = HashMap.HashMap<string, StepId>
	const results = firstBreak<Results>(evidence.trace, HashMap.empty(), (state, fact, entry) => {
		if (fact._tag === "Retired") {
			return ok(forget(state, rootText(fact.root), stepRoot))
		}
		return Option.match(endedStep(fact), {
			onNone: () => ok(state),
			onSome: (step) =>
				HashMap.has(state, stepText(step))
					? {
							state,
							broke: broken(
								"one-result",
								`${stepText(step)} got a second result (${fact._tag}) ${whereOf(entry)}`
							)
						}
					: ok(HashMap.set(state, stepText(step), step))
		})
	})
	if (Option.isSome(results.broke)) {
		return results.broke
	}
	for (const entry of evidence.trace) {
		for (const [at, fact] of entry.facts.entries()) {
			if (fact._tag !== "Wrote") {
				continue
			}
			const landed = Arr.some(
				Arr.take(entry.facts, at),
				(earlier) => earlier._tag === "Done" && stepText(earlier.step) === stepText(fact.step)
			)
			if (!landed) {
				return broken(
					"one-result",
					`${fact.write.relation}/${fact.write.key} was written for ${stepText(fact.step)} without its result, ${whereOf(entry)}`
				)
			}
		}
	}
	return Option.none()
}

/** What the scope laws keep of a scope: its root, its children so far and whether it finished. */
type ScopeSeen = Readonly<{ root: string; children: ReadonlyArray<string>; finished: boolean }>

type Graph = Readonly<{
	scopes: HashMap.HashMap<string, ScopeSeen>
	steps: HashMap.HashMap<string, Readonly<{ root: string; ended: boolean }>>
}>

const emptyGraph: Graph = { scopes: HashMap.empty(), steps: HashMap.empty() }

const opened = (graph: Graph, scope: string, root: string): Graph => ({
	...graph,
	scopes: HashMap.set(graph.scopes, scope, { root, children: [], finished: false })
})

const adopt = (graph: Graph, owner: string, child: string): Graph => ({
	...graph,
	scopes: HashMap.modify(graph.scopes, owner, (row) => ({
		...row,
		children: Arr.append(row.children, child)
	}))
})

const childEnded = (graph: Graph, child: string): boolean =>
	Option.exists(HashMap.get(graph.steps, child), (row) => row.ended) ||
	Option.exists(HashMap.get(graph.scopes, child), (row) => row.finished)

/** The graph a trace's facts open, finish and end, with the first break a check finds as it goes. */
const walkGraph = (
	trace: ReadonlyArray<Entry>,
	check: (graph: Graph, fact: Fact, entry: Entry) => Option.Option<LawBroken>
): Readonly<{ state: Graph; broke: Option.Option<LawBroken> }> =>
	firstBreak<Graph>(trace, emptyGraph, (graph, fact, entry) => {
		const broke = check(graph, fact, entry)
		if (Option.isSome(broke)) {
			return { state: graph, broke }
		}
		switch (fact._tag) {
			case "Admitted":
				return ok(
					opened(graph, scopeText({ _tag: "RootScope", root: fact.root }), rootText(fact.root))
				)
			case "Opened":
				return ok(
					adopt(
						opened(graph, scopeText(fact.scope), scopeRoot(fact.scope)),
						scopeText(fact.owner),
						scopeText(fact.scope)
					)
				)
			case "Spawned": {
				const spawned: Graph = {
					...graph,
					steps: HashMap.set(graph.steps, stepText(fact.step), {
						root: stepRoot(fact.step),
						ended: false
					})
				}
				return ok(
					fact.step._tag === "FinishStep"
						? spawned
						: adopt(spawned, scopeText(fact.scope), stepText(fact.step))
				)
			}
			case "Finished":
				return ok({
					...graph,
					scopes: HashMap.modify(graph.scopes, scopeText(fact.scope), (row) => ({
						...row,
						finished: true
					}))
				})
			case "Retired": {
				const root = rootText(fact.root)
				return ok({
					scopes: forget(graph.scopes, root, (row) => row.root),
					steps: forget(graph.steps, root, (row) => row.root)
				})
			}
			case "Fed":
			case "Claimed":
			case "Retried":
			case "Wrote":
			case "Paused":
			case "Resumed":
			case "Deployed":
				return ok(graph)
			case "Done":
			case "Failed":
			case "Completed":
			case "Stopped":
				return ok({
					...graph,
					steps: HashMap.modify(graph.steps, stepText(fact.step), (row) => ({
						...row,
						ended: true
					}))
				})
		}
	})

/** Each scope finishes once, and only after every child it owns ended. */
export const scopeOnce = (evidence: Evidence): Option.Option<LawBroken> =>
	walkGraph(evidence.trace, (graph, fact, entry) => {
		if (fact._tag !== "Finished") {
			return Option.none()
		}
		const scope = scopeText(fact.scope)
		return Option.match(HashMap.get(graph.scopes, scope), {
			onNone: () =>
				broken("scope-once", `${scope} finished without being opened, ${whereOf(entry)}`),
			onSome: (row) => {
				if (row.finished) {
					return broken("scope-once", `${scope} finished twice, ${whereOf(entry)}`)
				}
				return Option.match(
					Arr.findFirst(row.children, (child) => !childEnded(graph, child)),
					{
						onNone: () => Option.none(),
						onSome: (child) =>
							broken(
								"scope-once",
								`${scope} finished before its child ${child} ended, ${whereOf(entry)}`
							)
					}
				)
			}
		})
	}).broke

/**
 * Every step and scope is opened inside a scope that exists and has not finished, and a root retires only once
 * everything inside it ended: no work runs that its scope will not wait for.
 */
export const owned = (evidence: Evidence): Option.Option<LawBroken> =>
	walkGraph(evidence.trace, (graph, fact, entry) => {
		const inside = (owner: ScopeId, what: string) =>
			Option.match(HashMap.get(graph.scopes, scopeText(owner)), {
				onNone: () =>
					broken(
						"owned",
						`${what} was opened in ${scopeText(owner)}, which is not open, ${whereOf(entry)}`
					),
				onSome: (row) =>
					row.finished
						? broken(
								"owned",
								`${what} was opened in ${scopeText(owner)} after it finished, so nothing joins it, ${whereOf(entry)}`
							)
						: Option.none()
			})
		switch (fact._tag) {
			case "Spawned":
				return inside(fact.scope, stepText(fact.step))
			case "Opened":
				return inside(fact.owner, scopeText(fact.scope))
			case "Retired": {
				const root = rootText(fact.root)
				return Option.match(
					Arr.findFirst(
						HashMap.toEntries(graph.steps),
						([, row]) => row.root === root && !row.ended
					),
					{
						onNone: () => Option.none(),
						onSome: ([step]) =>
							broken("owned", `${root} retired with ${step} still pending, ${whereOf(entry)}`)
					}
				)
			}
			case "Admitted":
			case "Fed":
			case "Claimed":
			case "Retried":
			case "Done":
			case "Wrote":
			case "Failed":
			case "Completed":
			case "Stopped":
			case "Finished":
			case "Paused":
			case "Resumed":
			case "Deployed":
				return Option.none()
		}
	}).broke

/** A claim a check holds: its step's lane, its slot and its lease's end. */
type Held = Readonly<{ lane: string; claim: number; slot: number; until: number; root: string }>

type Claims = Readonly<{
	lanes: HashMap.HashMap<string, Readonly<{ lane: string; root: string }>>
	held: HashMap.HashMap<string, Held>
}>

/** No lane ever holds more live claims than its width, and no two live claims share a slot. */
export const width = (evidence: Evidence): Option.Option<LawBroken> =>
	firstBreak<Claims>(
		evidence.trace,
		{ lanes: HashMap.empty(), held: HashMap.empty() },
		(claims, fact, entry) => {
			switch (fact._tag) {
				case "Spawned":
					return ok(
						fact.spawn._tag === "Runs"
							? {
									...claims,
									lanes: HashMap.set(claims.lanes, stepText(fact.step), {
										lane: fact.spawn.lane,
										root: stepRoot(fact.step)
									})
								}
							: claims
					)
				case "Claimed": {
					const step = stepText(fact.step)
					return Option.match(HashMap.get(claims.lanes, step), {
						onNone: () => ({
							state: claims,
							broke: broken(
								"width",
								`${step} was claimed but never spawned on a lane, ${whereOf(entry)}`
							)
						}),
						onSome: ({ lane, root }) => {
							const live = Arr.filter(
								HashMap.toEntries(claims.held),
								([other, hold]) => other !== step && hold.lane === lane && hold.until > fact.at
							)
							const widthOf = Arr.findFirst(evidence.lanes, (declared) => declared.name === lane)
							const over = Option.exists(widthOf, (declared) => live.length + 1 > declared.width)
							const outside = Option.exists(
								widthOf,
								(declared) => fact.slot < 0 || fact.slot >= declared.width
							)
							const shared = Arr.some(live, ([, hold]) => hold.slot === fact.slot)
							if (over || outside || shared) {
								return {
									state: claims,
									broke: broken(
										"width",
										`${step} was claimed in slot ${fact.slot} of ${lane} beside ${live.length} live claims, ${whereOf(entry)}`
									)
								}
							}
							return ok({
								...claims,
								held: HashMap.set(claims.held, step, {
									lane,
									claim: fact.claim,
									slot: fact.slot,
									until: fact.until,
									root
								})
							})
						}
					})
				}
				case "Retried":
				case "Done":
				case "Failed":
				case "Stopped":
					return ok({ ...claims, held: HashMap.remove(claims.held, stepText(fact.step)) })
				case "Retired": {
					const root = rootText(fact.root)
					return ok({
						lanes: forget(claims.lanes, root, (row) => row.root),
						held: forget(claims.held, root, (row) => row.root)
					})
				}
				case "Admitted":
				case "Opened":
				case "Fed":
				case "Wrote":
				case "Completed":
				case "Finished":
				case "Paused":
				case "Resumed":
				case "Deployed":
					return ok(claims)
			}
		}
	).broke

/** Every accepted call made again at once added nothing. */
export const rerun = (evidence: Evidence): Option.Option<LawBroken> =>
	Option.flatMap(
		Arr.findFirst(evidence.reruns, (made) => Arr.isReadonlyArrayNonEmpty(made.again.facts)),
		(made) =>
			broken(
				"rerun",
				`${made.entry.command._tag} ${whereOf(made.entry)} made again added ${Arr.join(
					Arr.map(made.again.facts, (fact) => fact._tag),
					", "
				)}`
			)
	)

/**
 * A claim or commit from a deployment older than the current one is answered `stale`, and the fair phase drained every
 * old deployment's messages and workers.
 */
export const staleDrains = (evidence: Evidence): Option.Option<LawBroken> => {
	let current = 0
	for (const entry of evidence.trace) {
		const command = entry.command
		if (
			(command._tag === "Claim" || command._tag === "Commit") &&
			command.deployment < current &&
			entry.answer !== "stale"
		) {
			return broken(
				"stale-drains",
				`deployment ${command.deployment} was answered ${entry.answer} after deployment ${current}, ${whereOf(entry)}`
			)
		}
		for (const fact of entry.facts) {
			if (fact._tag === "Deployed") {
				current = fact.deployment
			}
		}
	}
	return evidence.end._tag === "Undrained"
		? broken(
				"stale-drains",
				`deployments ${Arr.join(Arr.map(evidence.end.deployments, String), ", ")} still had messages or workers at ${evidence.end.at}`
			)
		: Option.none()
}

/** The fair phase ended with every root finished and retired, no step left waiting past its patience. */
export const noStall = (evidence: Evidence): Option.Option<LawBroken> => {
	const end = evidence.end
	switch (end._tag) {
		case "Quiescent":
		case "Undrained":
			return Option.none()
		case "Stalled":
			return broken(
				"no-stall",
				`nothing moved from ${end.since} to ${end.at}, past the patience of ${end.patience}, with ${Arr.join(Arr.take(end.pending, 4), ", ")} pending`
			)
		case "Spent":
			return broken(
				"no-stall",
				`the fair phase spent its budget at ${end.at} with ${Arr.join(Arr.take(end.pending, 4), ", ")} pending`
			)
	}
}

/** A commit that landed names a token its step's claims minted in the graph as it stands. */
export const fenced = (evidence: Evidence): Option.Option<LawBroken> => {
	let tokens = HashMap.empty<string, Readonly<{ root: string; minted: ReadonlyArray<number> }>>()
	for (const entry of evidence.trace) {
		const command = entry.command
		if (command._tag === "Commit" && entry.answer === "accepted") {
			const step = stepText(command.step)
			const minted = Option.exists(HashMap.get(tokens, step), (row) =>
				Arr.contains(row.minted, command.token)
			)
			if (!minted) {
				return broken(
					"fenced",
					`${step} took a commit of token ${command.token}, which none of its claims in this graph minted, ${whereOf(entry)}`
				)
			}
		}
		for (const fact of entry.facts) {
			if (fact._tag === "Claimed") {
				const step = stepText(fact.step)
				tokens = HashMap.set(tokens, step, {
					root: stepRoot(fact.step),
					minted: Arr.append(
						Option.match(HashMap.get(tokens, step), {
							onNone: () => [],
							onSome: (row) => row.minted
						}),
						fact.token
					)
				})
			}
			if (fact._tag === "Retired") {
				tokens = forget(tokens, rootText(fact.root), (row) => row.root)
			}
		}
	}
	return Option.none()
}

/** Each law's check. */
export const CHECKS: Readonly<Record<Law, (evidence: Evidence) => Option.Option<LawBroken>>> = {
	"no-stall": noStall,
	"one-result": oneResult,
	"scope-once": scopeOnce,
	width,
	rerun,
	"stale-drains": staleDrains,
	owned,
	fenced
}

/** The first of `laws` the evidence breaks, if any. */
export const firstBroken = (
	laws: ReadonlyArray<Law>,
	evidence: Evidence
): Option.Option<LawBroken> =>
	Arr.reduce(laws, Option.none<LawBroken>(), (found, law) =>
		Option.orElse(found, () => CHECKS[law](evidence))
	)
