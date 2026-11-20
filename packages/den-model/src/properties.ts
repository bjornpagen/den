import { Array as Arr, Data, HashMap, HashSet, Option, Order } from "effect"
import { type Datum, textOf } from "#datum.ts"
import {
	type Entry,
	type Fact,
	type Holder,
	holderText,
	type SeatKey,
	seatText,
	type Trace
} from "#facts.ts"
import {
	rootOfScope,
	rootOfStep,
	rootText,
	type ScopeId,
	type StepId,
	scopeText,
	stepText
} from "#identity.ts"
import { ordinals, type Program, type Query, windowsOf } from "#program.ts"
import type { FairEnd, Rerun, Sent } from "#simulator.ts"

/**
 * den's laws, in the order a run is checked, each over what a run leaves:
 * - `no-stall`: under fair scheduling every pending step moves within its program's patience, none passes its ladder,
 *   and the run ends with every root finished and retired;
 * - `one-result`: a step has at most one result, ever, since its key never recurs; an app write lands only with its
 *   step's result; and a commit lands only for the turn that holds the step's latest claim;
 * - `scope-once`: a scope finishes once, after every child it owns ended;
 * - `seats`: a seat never has two holders: it is taken only when free, taken from a claim only once its lease ran out,
 *   within its resource's seats, and a claim takes a seat of every resource its step holds, so no bound is exceeded;
 * - `exclusive`: never two live runs of one exclusive root kind under one key;
 * - `precondition`: a root kind's precondition was empty when each of its roots was admitted;
 * - `reads`: every read a commit or an admission recorded is the rows its query held where it was taken, at the claim
 *   or the admission, so every input a step saw is a fact of the graph;
 * - `rerun`: an accepted call made again at once adds nothing;
 * - `stale-drains`: a call from a deployment older than the current one is answered `stale`, and an old deployment's
 *   messages and workers drain away;
 * - `owned`: no fire-and-forget: every step and scope is opened inside a scope that has not finished, and no root
 *   retires with work pending inside it;
 * - `window-tick`: every span a declared window is open for, wholly inside the fair phase, holds a census tick;
 * - `rewake`: a wake re-rung by a later cause is always delivered: the transport drops a send as a duplicate only when
 *   an earlier send of its key had the same cause, so no step waits on a key an earlier ring spent.
 */
export const LAWS = [
	"no-stall",
	"one-result",
	"scope-once",
	"seats",
	"exclusive",
	"precondition",
	"reads",
	"rerun",
	"stale-drains",
	"owned",
	"window-tick",
	"rewake"
] as const

/** A law of den's, by name. */
export type Law = (typeof LAWS)[number]

/** A law a run broke, the law named as data and the witness in the message. */
export class LawBroken extends Data.TaggedError("LawBroken")<{ law: Law; message: string }> {}

/**
 * What a law is checked over: a trace (the model's, or one the real engine's harness wrote), the program it ran, and,
 * for the laws the platform decides, the re-runs, every send the transport was asked for and its fate, the instant the
 * fair phase began and how it ended.
 */
export type Evidence = Readonly<{
	trace: Trace
	program: Program
	reruns: ReadonlyArray<Rerun>
	sends: ReadonlyArray<Sent>
	fairFrom: number
	end: FairEnd
}>

const broken = (law: Law, message: string) => Option.some(new LawBroken({ law, message }))

const whereOf = (entry: Entry) => `at ${entry.at}, ${entry.command._tag}`

/** Folds a trace's facts in commit order, each with its entry, stopping at the first break a step finds. */
const firstBreak = <S>(
	trace: Trace,
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

/** Whether a fact ends a step, and which. */
const endedStep = (fact: Fact): Option.Option<StepId> =>
	fact._tag === "Done" || fact._tag === "Failed" ? Option.some(fact.step) : Option.none()

const claimText = (step: StepId, attempt: number) => `${stepText(step)}@${attempt}`

/**
 * One result per step, ever, and every write inside the entry that landed its step's `Done`, after it; every accepted
 * commit by the turn that took the step's latest claim.
 */
export const oneResult = (evidence: Evidence): Option.Option<LawBroken> => {
	const ended = new Set<string>()
	const turns = new Map<string, string>()
	const latest = new Map<string, number>()
	for (const entry of evidence.trace) {
		const command = entry.command
		if (command._tag === "Commit" && entry.answer === "accepted") {
			const step = stepText(command.step)
			const turn = Option.fromNullishOr(turns.get(claimText(command.step, command.attempt)))
			if (!Option.contains(turn, command.turn)) {
				return broken(
					"one-result",
					`${step} took the report of ${command.turn} for claim ${command.attempt}, which ${Option.match(turn, { onNone: () => "nobody took", onSome: (holder) => `${holder} took` })}, ${whereOf(entry)}`
				)
			}
			if (latest.get(step) !== command.attempt) {
				return broken(
					"one-result",
					`${step} took a report of claim ${command.attempt} after a newer claim, ${whereOf(entry)}`
				)
			}
		}
		for (const [at, fact] of entry.facts.entries()) {
			if (fact._tag === "Claimed") {
				turns.set(claimText(fact.step, fact.attempt), fact.turn)
				latest.set(stepText(fact.step), fact.attempt)
			}
			if (fact._tag === "Wrote" && fact.writer._tag === "Step") {
				const writer = fact.writer.step
				const landed = Arr.some(
					Arr.take(entry.facts, at),
					(earlier) => earlier._tag === "Done" && stepText(earlier.step) === stepText(writer)
				)
				if (!landed) {
					return broken(
						"one-result",
						`${fact.write.relation}/${fact.write.key} was written for ${stepText(writer)} without its result, ${whereOf(entry)}`
					)
				}
			}
			const ending = endedStep(fact)
			if (Option.isSome(ending)) {
				const step = stepText(ending.value)
				if (ended.has(step)) {
					return broken(
						"one-result",
						`${step} got a second result (${fact._tag}) ${whereOf(entry)}`
					)
				}
				ended.add(step)
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
	retired: HashSet.HashSet<string>
}>

const emptyGraph: Graph = {
	scopes: HashMap.empty(),
	steps: HashMap.empty(),
	retired: HashSet.empty()
}

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

const stepRoot = (step: StepId) => rootText(rootOfStep(step))
const scopeRoot = (scope: ScopeId) => rootText(rootOfScope(scope))

/** The graph a trace's facts open, finish and end, with the first break a check finds as it goes. */
const walkGraph = (
	trace: Trace,
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
			case "Retired":
				return ok({ ...graph, retired: HashSet.add(graph.retired, rootText(fact.root)) })
			case "Done":
			case "Failed":
				return ok({
					...graph,
					steps: HashMap.modify(graph.steps, stepText(fact.step), (row) => ({
						...row,
						ended: true
					}))
				})
			case "Claimed":
			case "Read":
			case "Seated":
			case "Unseated":
			case "Retried":
			case "Wrote":
			case "Paused":
			case "Resumed":
			case "Deployed":
				return ok(graph)
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
 * No fire-and-forget: every step and scope is opened inside a scope that exists, is not retired and has not finished,
 * and a root retires only once everything inside it ended, so no work runs that its scope will not wait for.
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
					row.finished || HashSet.has(graph.retired, row.root)
						? broken(
								"owned",
								`${what} was opened in ${scopeText(owner)} after it ended, so nothing joins it, ${whereOf(entry)}`
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
							broken(
								"owned",
								`${root} retired with ${step} still pending, so nothing joins it, ${whereOf(entry)}`
							)
					}
				)
			}
			case "Admitted":
			case "Claimed":
			case "Read":
			case "Seated":
			case "Unseated":
			case "Retried":
			case "Done":
			case "Wrote":
			case "Failed":
			case "Finished":
			case "Paused":
			case "Resumed":
			case "Deployed":
				return Option.none()
		}
	}).broke

/** The step whose own call an entry is: a claim's or a commit's, which may give back that step's own seats. */
const callerOf = (entry: Entry): Option.Option<string> => {
	switch (entry.command._tag) {
		case "Claim":
		case "Commit":
			return Option.some(stepText(entry.command.step))
		case "Admit":
		case "Write":
		case "Census":
		case "Retire":
		case "Pause":
		case "Resume":
		case "Deploy":
			return Option.none()
	}
}

/**
 * A seat never has two holders: a seat is taken only when no one holds it; a claim's seat is given back only by its
 * own step's call or, once its lease ran out, by whoever takes it; a counted resource's seat is one of its declared
 * seats; and a claim takes one seat of each resource its step holds, so the resource's bound is exact.
 */
export const seats = (evidence: Evidence): Option.Option<LawBroken> => {
	const counted = new Map(
		Arr.map(evidence.program.resources, (resource) => [resource.name, resource.seats] as const)
	)
	const within = (seat: SeatKey): boolean =>
		Option.match(Option.fromNullishOr(counted.get(seat.resource)), {
			onNone: () => true,
			onSome: (count) => Arr.contains(Arr.map(ordinals(count), String), seat.seat)
		})
	const holders = new Map<string, Holder>()
	const until = new Map<string, number>()
	const holds = new Map<string, ReadonlyArray<string>>()
	for (const entry of evidence.trace) {
		const where = whereOf(entry)
		for (const fact of entry.facts) {
			if (fact._tag === "Spawned") {
				holds.set(stepText(fact.step), fact.holds)
			}
			if (fact._tag === "Claimed") {
				until.set(claimText(fact.step, fact.attempt), fact.until)
				const holder = holderText({ _tag: "Claim", step: fact.step, attempt: fact.attempt })
				const taken = Arr.flatMap(entry.facts, (other) =>
					other._tag === "Seated" && holderText(other.holder) === holder
						? [other.seat.resource]
						: []
				)
				const needed = holds.get(stepText(fact.step)) ?? []
				if (!Arr.every(needed, (resource) => Arr.contains(taken, resource))) {
					return broken(
						"seats",
						`${holder} was claimed without a seat of each of ${Arr.join(needed, ", ")}, ${where}`
					)
				}
			}
			if (fact._tag === "Seated") {
				const seat = seatText(fact.seat)
				if (!within(fact.seat)) {
					return broken("seats", `${seat} is not one of its resource's seats, ${where}`)
				}
				const current = holders.get(seat)
				if (current !== undefined) {
					return broken(
						"seats",
						`${seat} was taken by ${holderText(fact.holder)} while ${holderText(current)} held it, ${where}`
					)
				}
				holders.set(seat, fact.holder)
			}
			if (fact._tag === "Unseated") {
				const holder = fact.holder
				if (holder._tag === "Claim") {
					const own = Option.contains(callerOf(entry), stepText(holder.step))
					const end = until.get(claimText(holder.step, holder.attempt)) ?? fact.at
					if (!own && end > fact.at) {
						return broken(
							"seats",
							`${seatText(fact.seat)} was taken from ${holderText(holder)}, whose lease runs to ${end}, ${where}`
						)
					}
				}
				holders.delete(seatText(fact.seat))
			}
			if (fact._tag === "Retired") {
				const root = rootText(fact.root)
				for (const [seat, holder] of holders) {
					if (rootOfHolder(holder) === root) {
						holders.delete(seat)
					}
				}
			}
		}
	}
	return Option.none()
}

/** The root a seat's holder belongs to. */
const rootOfHolder = (holder: Holder): string => {
	switch (holder._tag) {
		case "Claim":
			return stepRoot(holder.step)
		case "Scope":
			return scopeRoot(holder.scope)
	}
}

/**
 * Never two live runs of one exclusive root kind under one key: a root admitted while another run of its key is live
 * ends `Held` in the same entry, opening nothing.
 */
export const exclusive = (evidence: Evidence): Option.Option<LawBroken> => {
	const live = new Map<string, string>()
	const keys = new Map<string, string>()
	for (const entry of evidence.trace) {
		const contested = new Set<string>()
		for (const fact of entry.facts) {
			if (fact._tag === "Admitted" && Option.isSome(fact.exclusive)) {
				const scope = scopeText({ _tag: "RootScope", root: fact.root })
				const key = `${fact.root.kind}[${fact.exclusive.value}]`
				if (live.has(key)) {
					contested.add(scope)
				} else {
					live.set(key, scope)
					keys.set(scope, key)
				}
			}
			if (fact._tag === "Finished") {
				const scope = scopeText(fact.scope)
				const key = keys.get(scope)
				if (fact.ending === "Held") {
					contested.delete(scope)
				} else if (key !== undefined && live.get(key) === scope) {
					live.delete(key)
				}
			}
		}
		const twice = Arr.head(Arr.fromIterable(contested))
		if (Option.isSome(twice)) {
			return broken(
				"exclusive",
				`${twice.value} was admitted while another run of its key was live, and ran, ${whereOf(entry)}`
			)
		}
	}
	return Option.none()
}

/**
 * What a trace says the ledger held for its reads at a point: the steps not yet ended, each with its kind and its
 * root's kind, and the app's rows by relation and key, as every write before it left them.
 */
type Held = Readonly<{
	pending: HashMap.HashMap<string, Readonly<{ kind: string; root: string }>>
	app: HashMap.HashMap<string, HashMap.HashMap<string, Datum>>
}>

const emptyHeld: Held = { pending: HashMap.empty(), app: HashMap.empty() }

/** What the ledger holds for reads after one more fact. */
const heldAfter = (held: Held, fact: Fact): Held => {
	if (fact._tag === "Spawned") {
		return {
			...held,
			pending: HashMap.set(held.pending, stepText(fact.step), {
				kind: fact.kind,
				root: rootOfStep(fact.step).kind
			})
		}
	}
	if (fact._tag === "Done" || fact._tag === "Failed") {
		return { ...held, pending: HashMap.remove(held.pending, stepText(fact.step)) }
	}
	if (fact._tag === "Wrote") {
		const relation = Option.getOrElse(HashMap.get(held.app, fact.write.relation), () =>
			HashMap.empty<string, Datum>()
		)
		return {
			...held,
			app: HashMap.set(
				held.app,
				fact.write.relation,
				HashMap.set(relation, fact.write.key, fact.write.value)
			)
		}
	}
	return held
}

const BY_KEY = Order.mapInput(Order.String, (row: Readonly<{ key: string }>) => row.key)

/** The rows a query returns from what the ledger holds, by key, evaluated here from the trace alone. */
const rowsAt = (
	held: Held,
	query: Query
): ReadonlyArray<Readonly<{ key: string; value: Datum }>> => {
	switch (query._tag) {
		case "Pending":
			return Arr.sort(
				Arr.flatMap(HashMap.toEntries(held.pending), ([key, step]) =>
					Arr.contains(query.roots, step.root) ? [{ key, value: step.kind }] : []
				),
				BY_KEY
			)
		case "Rows": {
			const rows = Arr.sort(
				Arr.map(
					HashMap.toEntries(
						Option.getOrElse(HashMap.get(held.app, query.relation), () =>
							HashMap.empty<string, Datum>()
						)
					),
					([key, value]) => ({ key, value })
				),
				BY_KEY
			)
			return Option.match(query.key, {
				onNone: () => rows,
				onSome: (key) => Arr.filter(rows, (row) => row.key === key)
			})
		}
	}
}

/** Folds what the ledger holds for reads over a trace, checking each fact against it before it applies. */
const foldHeld = (
	trace: Trace,
	check: (held: Held, fact: Fact, entry: Entry) => Option.Option<LawBroken>
): Option.Option<LawBroken> =>
	firstBreak<Held>(trace, emptyHeld, (held, fact, entry) => {
		const broke = check(held, fact, entry)
		return Option.isSome(broke) ? { state: held, broke } : ok(heldAfter(held, fact))
	}).broke

/**
 * Each root of a kind with a precondition was admitted while its read was empty, the read evaluated here from the
 * trace alone: the steps pending under roots of the kinds it names, or the rows of the app relation it names.
 */
export const precondition = (evidence: Evidence): Option.Option<LawBroken> => {
	const preconditions = new Map(
		Arr.flatMap(evidence.program.roots, (root) =>
			Option.match(root.precondition, {
				onNone: () => [],
				onSome: (query) => [[root.kind, query] as const]
			})
		)
	)
	return foldHeld(evidence.trace, (held, fact, entry) => {
		if (fact._tag !== "Admitted") {
			return Option.none()
		}
		return Option.flatMap(Option.fromNullishOr(preconditions.get(fact.root.kind)), (query) => {
			const rows = rowsAt(held, query)
			return Arr.isReadonlyArrayNonEmpty(rows)
				? broken(
						"precondition",
						`${rootText(fact.root)} was admitted while its precondition read ${Arr.join(
							Arr.map(Arr.take(rows, 3), (row) => row.key),
							", "
						)}, ${whereOf(entry)}`
					)
				: Option.none()
		})
	})
}

/**
 * Every recorded read is the rows its query held where it was taken, the query evaluated here from the trace alone (the
 * app's rows as every write before it left them, or the steps not yet ended under roots of the kinds it names): a
 * claim's reads, recorded with its result, as the ledger stood at the claim; a precondition, at its admission.
 */
export const reads = (evidence: Evidence): Option.Option<LawBroken> => {
	const atClaim = new Map<string, Held>()
	return foldHeld(evidence.trace, (held, fact, entry) => {
		if (fact._tag === "Claimed") {
			atClaim.set(claimText(fact.step, fact.attempt), held)
		}
		if (fact._tag !== "Read") {
			return Option.none()
		}
		const reader = fact.reader
		const taken =
			reader._tag === "Claim"
				? Option.fromNullishOr(atClaim.get(claimText(reader.step, reader.attempt)))
				: Option.some(held)
		return Option.match(taken, {
			onNone: () =>
				broken("reads", `${fact.name} was recorded for a claim nobody took, ${whereOf(entry)}`),
			onSome: (then) => {
				const expected = textOf(Arr.map(rowsAt(then, fact.query), (row): Datum => row))
				return expected === textOf(fact.value)
					? Option.none()
					: broken(
							"reads",
							`${fact.name} recorded ${textOf(fact.value)} where its query held ${expected}, ${whereOf(entry)}`
						)
			}
		})
	})
}

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

/**
 * Every span a declared window is open for, from the fair phase's start to its end, holds a census tick: a window that
 * misses every tick is never rung, since only the census rings what a window's opening made eligible.
 */
export const windowTick = (evidence: Evidence): Option.Option<LawBroken> => {
	const ticks = Arr.flatMap(evidence.trace, (entry) =>
		entry.command._tag === "Census" && entry.at >= evidence.fairFrom ? [entry.at] : []
	)
	const until = evidence.end.at
	for (const window of windowsOf(evidence.program)) {
		const first = Math.ceil((evidence.fairFrom - window.opens) / window.period)
		for (
			let period = Math.max(0, first);
			period * window.period + window.closes <= until;
			period += 1
		) {
			const opens = period * window.period + window.opens
			const closes = period * window.period + window.closes
			if (!Arr.some(ticks, (tick) => tick >= opens && tick < closes)) {
				return broken(
					"window-tick",
					`the window open over [${opens}, ${closes}) held no census tick`
				)
			}
		}
	}
	return Option.none()
}

/**
 * A wake re-rung by a later cause is always delivered: every send the transport dropped as a duplicate repeats the
 * cause of the send that first took its key (a retry, a relay's replay of one position), never a later one.
 */
export const rewake = (evidence: Evidence): Option.Option<LawBroken> => {
	const first = new Map<string, string>()
	for (const sent of evidence.sends) {
		switch (sent.fate) {
			case "queued":
				first.set(sent.key, sent.cause)
				break
			case "deduplicated": {
				const cause = first.get(sent.key) ?? sent.cause
				if (cause !== sent.cause) {
					return broken(
						"rewake",
						`${sent.step} was rung by ${sent.cause} at ${sent.at} and dropped as a duplicate of ${cause}'s key ${sent.key}`
					)
				}
				break
			}
			case "dropped":
		}
	}
	return Option.none()
}

/** Each law's check. */
export const CHECKS: Readonly<Record<Law, (evidence: Evidence) => Option.Option<LawBroken>>> = {
	"no-stall": noStall,
	"one-result": oneResult,
	"scope-once": scopeOnce,
	seats,
	exclusive,
	precondition,
	reads,
	rerun,
	"stale-drains": staleDrains,
	owned,
	"window-tick": windowTick,
	rewake
}

/** The first of `laws` the evidence breaks, if any. */
export const firstBroken = (
	laws: ReadonlyArray<Law>,
	evidence: Evidence
): Option.Option<LawBroken> =>
	Arr.reduce(laws, Option.none<LawBroken>(), (found, law) =>
		Option.orElse(found, () => CHECKS[law](evidence))
	)
