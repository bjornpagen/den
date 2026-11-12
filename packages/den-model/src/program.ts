import { Array as Arr, Option, Record } from "effect"
import type { Datum } from "#datum.ts"

/**
 * When a lane admits claims: always, or inside a span of every period, `[opens, closes)` ticks past each multiple of
 * `period` (edullm's 07:00–12:59Z window, at the model's scale). A claim at a closed instant is refused; due work waits
 * for the window to open.
 */
export type Window =
	| Readonly<{ _tag: "Always" }>
	| Readonly<{ _tag: "Periodic"; period: number; opens: number; closes: number }>

/**
 * A lane: the most of its steps that hold a live claim at once across every graph (`width`), and its claim window. A
 * lane's pause is not declared: pausing and resuming are operator verbs, recorded as facts.
 */
export type Lane = Readonly<{ name: string; width: number; window: Window }>

/** Whether a window admits a claim at an instant. */
export const isOpenAt = (window: Window, at: number): boolean => {
	switch (window._tag) {
		case "Always":
			return true
		case "Periodic": {
			const phase = at % window.period
			return phase >= window.opens && phase < window.closes
		}
	}
}

/**
 * The most ticks a window keeps a due step waiting: none for one that is always open, and the closed span of a period
 * for a periodic one.
 */
export const closedSpanOf = (window: Window): number => {
	switch (window._tag) {
		case "Always":
			return 0
		case "Periodic":
			return window.period - (window.closes - window.opens)
	}
}

/**
 * What turns endless retrying into `failed`: the counted attempts a step may spend, the waits it may spend before each
 * further wait counts as an attempt, and the times its claim may be reclaimed after its holder vanished.
 */
export type Ceilings = Readonly<{ attempts: number; waits: number; reclaims: number }>

/**
 * The retry ladder a step climbs when its call fails outside its body (a transient or unavailable answer, a deadline):
 * `first` ticks, doubling per rung, never more than `last`, which is also the furthest a body may set its own retry.
 */
export type Ladder = Readonly<{ first: number; last: number }>

/** The delay of the ladder's rung after `count` earlier rungs. */
export const rungOf = (ladder: Ladder, count: number): number =>
	Math.min(ladder.first * 2 ** count, ladder.last)

/**
 * How a step runs: its lane, the ticks its claim's lease lasts (the holder's deadline is one tick before it), its
 * ceilings and its retry ladder. Every step kind and every scope's finish states one.
 */
export type Runs = Readonly<{ lane: Lane; lease: number; ceilings: Ceilings; ladder: Ladder }>

/** One write a step's body returns for the app's own relations; it lands with the step's result or not at all. */
export type Write = Readonly<{ relation: string; key: string; value: Datum }>

/**
 * What a body sees of its claim: the instant the ledger's clock gave it, and the step's counters so far. A body is a
 * pure function of its input and this, so a re-run of the same claim computes the same outcome.
 */
export type Claimed = Readonly<{ at: number; attempts: number; waits: number; reclaims: number }>

/**
 * A body's outcome: an output with the app writes that land with it; a typed failure, which ends the step `failed`; or
 * a retry at an instant no later than `at + ladder.last`, counted as an attempt or as a wait.
 */
export type Outcome<O, E> =
	| Readonly<{ _tag: "Output"; output: O; writes: ReadonlyArray<Write> }>
	| Readonly<{ _tag: "Failure"; error: E }>
	| Readonly<{ _tag: "Retry"; at: number; counts: Counts }>

/** Whether a retry spends an attempt or a wait. */
export type Counts = "attempt" | "wait"

/** How a scope's child ended, as its scope's finish reads it. A child scope ended as its finish did. */
export type ChildEnding =
	| Readonly<{ _tag: "Done"; kind: string; output: Datum }>
	| Readonly<{ _tag: "Failed"; kind: string }>
	| Readonly<{ _tag: "Stopped"; kind: string }>

/**
 * A step's outcome once it leaves its typed code: the output and error as data, and, for an output, every child its
 * declared edges take from it, each with the edge's name and its ordinal there.
 */
export type Settled =
	| Readonly<{
			_tag: "Output"
			output: Datum
			writes: ReadonlyArray<Write>
			next: ReadonlyArray<Next>
	  }>
	| Readonly<{ _tag: "Failure"; error: Datum }>
	| Readonly<{ _tag: "Retry"; at: number; counts: Counts }>

/** What an output starts: a child under an edge and an ordinal, or one role's part of a feed's join. */
export type Next =
	| Readonly<{ _tag: "Spawn"; edge: string; ordinal: number; child: Child }>
	| Readonly<{ _tag: "Part"; feed: Feed; role: string; key: string; value: Datum }>

/** How an await is completed: from outside (a webhook, an operator), or by an instant passing `after` ticks from its
 * spawn. */
export type Completion = Readonly<{ _tag: "External" }> | Readonly<{ _tag: "Timer"; after: number }>

/**
 * A step's work, its types erased into the closure that holds its typed input: a body that runs on a lane under a
 * claim, or an await, which has no body and is completed once, from outside or by its timer.
 */
export type Work =
	| Readonly<{ _tag: "Body"; runs: Runs; run: (claimed: Claimed) => Settled }>
	| Readonly<{
			_tag: "Await"
			completion: Completion
			settle: (value: Datum) => ReadonlyArray<Next>
	  }>

/**
 * A scope's work, its types erased: the children its start opens, and its finish, which runs on its lane once every
 * child ended, reads their endings, and starts the edges that follow it in the scope that owns this one.
 */
export type ScopeWork = Readonly<{
	children: ReadonlyArray<Child>
	finish: Readonly<{
		runs: Runs
		run: (children: ReadonlyArray<ChildEnding>, claimed: Claimed) => Settled
	}>
}>

/** A step an edge or a start opens. */
export type StepChild = Readonly<{ _tag: "StepChild"; kind: string; input: Datum; work: Work }>

/** A scope an edge or a start opens, with the edges that follow its finish already in its work. */
export type ScopeChild = Readonly<{
	_tag: "ScopeChild"
	kind: string
	input: Datum
	scope: ScopeWork
}>

/** A child an edge or a start opens: a step, or a scope. */
export type Child = StepChild | ScopeChild

/** A step kind: its name, how it runs, how its values show as data, its pure body and its declared edges. */
export type StepKind<I, O, E> = Readonly<{
	name: string
	runs: Runs
	input: (input: I) => Datum
	output: (output: O) => Datum
	error: (error: E) => Datum
	body: (input: I, claimed: Claimed) => Outcome<O, E>
	edges: () => ReadonlyArray<Edge<I, O>>
}>

/** An await kind: a step with no body, completed from outside or by a timer, whose completion value is its output. */
export type AwaitKind<I> = Readonly<{
	name: string
	input: (input: I) => Datum
	completion: (input: I) => Completion
	edges: () => ReadonlyArray<Edge<I, Datum>>
}>

/** A scope's finish: how it runs, how its values show, and its body over the scope's input and its children's endings. */
export type FinishKind<I, O, E> = Readonly<{
	runs: Runs
	output: (output: O) => Datum
	error: (error: E) => Datum
	body: (input: I, children: ReadonlyArray<ChildEnding>, claimed: Claimed) => Outcome<O, E>
}>

/** A scope kind: its name, how its input shows, the children its start opens, and its finish. */
export type ScopeKind<I, O, E> = Readonly<{
	name: string
	input: (input: I) => Datum
	start: (input: I) => ReadonlyArray<Child>
	finish: FinishKind<I, O, E>
}>

/** What starts a root: a schedule every `every` ticks (its key the period's index), an operator, or an API call. */
export type Trigger =
	| Readonly<{ _tag: "Schedule"; every: number }>
	| Readonly<{ _tag: "Operator" }>
	| Readonly<{ _tag: "Api" }>

/** A root kind: a scope a trigger starts, the only way a graph begins. Its finish has no edges: nothing follows a root. */
export type RootKind<I, O, E> = Readonly<{
	name: string
	trigger: Trigger
	scope: ScopeKind<I, O, E>
}>

/**
 * A declared edge from a step of input `I` and output `O`: a spawn edge, which starts steps or child scopes of one
 * declared kind, one per input it returns, ordinal by position; or a contribution to a feed's join, which names the
 * join's key and this role's part, or none.
 */
export type Edge<I, O> =
	| Readonly<{
			_tag: "Spawn"
			name: string
			children: (input: I, output: O) => ReadonlyArray<Child>
	  }>
	| Readonly<{
			_tag: "Contribute"
			feed: Feed
			role: string
			part: (input: I, output: O) => Option.Option<Readonly<{ key: string; value: Datum }>>
	  }>

/**
 * A feed: a join of several parents, one per role, in one scope. Its step is started once every role's part arrived
 * under one join key, with the parts as its input; a parent that never contributes leaves no step.
 */
export type Feed = Readonly<{
	name: string
	roles: Arr.NonEmptyReadonlyArray<string>
	join: (parts: ReadonlyMap<string, Datum>) => StepChild
}>

/** An erased outcome of a typed one: its values shown as data and, for an output, the children its edges take. */
const settledOf = <O, E>(
	outcome: Outcome<O, E>,
	shows: Readonly<{ output: (output: O) => Datum; error: (error: E) => Datum }>,
	next: (output: O) => ReadonlyArray<Next>
): Settled => {
	switch (outcome._tag) {
		case "Output":
			return {
				_tag: "Output",
				output: shows.output(outcome.output),
				writes: outcome.writes,
				next: next(outcome.output)
			}
		case "Failure":
			return { _tag: "Failure", error: shows.error(outcome.error) }
		case "Retry":
			return outcome
	}
}

/** What a step's declared edges take from its output: each spawn's children under their ordinals, each part. */
export const nextOf = <I, O>(
	edges: ReadonlyArray<Edge<I, O>>,
	input: I,
	output: O
): ReadonlyArray<Next> =>
	Arr.flatMap(edges, (edge): ReadonlyArray<Next> => {
		switch (edge._tag) {
			case "Spawn":
				return Arr.map(edge.children(input, output), (child, ordinal): Next => ({
					_tag: "Spawn",
					edge: edge.name,
					ordinal,
					child
				}))
			case "Contribute":
				return Option.match(edge.part(input, output), {
					onNone: () => [],
					onSome: (part) => [{ _tag: "Part", feed: edge.feed, role: edge.role, ...part }]
				})
		}
	})

/** A step of a kind, with its input: the child an edge or a start opens. */
export const stepOf = <I, O, E>(kind: StepKind<I, O, E>, input: I): StepChild => ({
	_tag: "StepChild",
	kind: kind.name,
	input: kind.input(input),
	work: {
		_tag: "Body",
		runs: kind.runs,
		run: (claimed) =>
			settledOf(kind.body(input, claimed), kind, (output) => nextOf(kind.edges(), input, output))
	}
})

/** An await of a kind, with its input. */
export const awaitOf = <I>(kind: AwaitKind<I>, input: I): StepChild => ({
	_tag: "StepChild",
	kind: kind.name,
	input: kind.input(input),
	work: {
		_tag: "Await",
		completion: kind.completion(input),
		settle: (value) => nextOf(kind.edges(), input, value)
	}
})

/** A scope's work for an input, with the edges that follow its finish in the scope that owns it. */
const scopeWorkOf = <I, O, E>(
	kind: ScopeKind<I, O, E>,
	input: I,
	then: () => ReadonlyArray<Edge<I, O>>
): ScopeWork => ({
	children: kind.start(input),
	finish: {
		runs: kind.finish.runs,
		run: (children, claimed) =>
			settledOf(kind.finish.body(input, children, claimed), kind.finish, (output) =>
				nextOf(then(), input, output)
			)
	}
})

/** A child scope of a kind, with its input and the edges that follow its finish in the scope that opens it. */
export const scopeOf = <I, O, E>(
	kind: ScopeKind<I, O, E>,
	input: I,
	then: () => ReadonlyArray<Edge<I, O>>
): ScopeChild => ({
	_tag: "ScopeChild",
	kind: kind.name,
	input: kind.input(input),
	scope: scopeWorkOf(kind, input, then)
})

/** A spawn edge to a step kind: one step per input `inputs` returns. */
export const spawn = <I, O, J, P, Q>(
	name: string,
	target: StepKind<J, P, Q>,
	inputs: (input: I, output: O) => ReadonlyArray<J>
): Edge<I, O> => ({
	_tag: "Spawn",
	name,
	children: (input, output) => Arr.map(inputs(input, output), (child) => stepOf(target, child))
})

/** A spawn edge to an await kind: one await per input `inputs` returns. */
export const spawnAwait = <I, O, J>(
	name: string,
	target: AwaitKind<J>,
	inputs: (input: I, output: O) => ReadonlyArray<J>
): Edge<I, O> => ({
	_tag: "Spawn",
	name,
	children: (input, output) => Arr.map(inputs(input, output), (child) => awaitOf(target, child))
})

/** A spawn edge to a scope kind: one child scope per input, each followed by `then` in the scope that opens it. */
export const open = <I, O, J, P, Q>(
	name: string,
	target: ScopeKind<J, P, Q>,
	inputs: (input: I, output: O) => ReadonlyArray<J>,
	then: () => ReadonlyArray<Edge<J, P>>
): Edge<I, O> => ({
	_tag: "Spawn",
	name,
	children: (input, output) =>
		Arr.map(inputs(input, output), (child) => scopeOf(target, child, then))
})

/**
 * A feed joining one part per role into a step of `target`, whose input is the parts by role: a feed's parts are what
 * its parents contribute as data, so parents of different kinds join without sharing a type.
 */
export const feed = <P, Q>(
	name: string,
	roles: Arr.NonEmptyReadonlyArray<string>,
	target: StepKind<Readonly<{ [role: string]: Datum }>, P, Q>
): Feed => ({ name, roles, join: (parts) => stepOf(target, Record.fromEntries(parts)) })

/** A parent's contribution to a feed under one of its roles. */
export const contribute = <I, O>(
	target: Feed,
	role: string,
	part: (input: I, output: O) => Option.Option<Readonly<{ key: string; value: Datum }>>
): Edge<I, O> => ({ _tag: "Contribute", feed: target, role, part })

/**
 * A root's admission, its types erased: the root's key (its trigger's name and the idempotency key), its input as data,
 * and its scope's work.
 */
export type Admission = Readonly<{ trigger: string; key: string; input: Datum; scope: ScopeWork }>

/** The admission of a root kind under an idempotency key, with its input. Nothing follows a root's finish. */
export const admissionOf = <I, O, E>(
	kind: RootKind<I, O, E>,
	key: string,
	input: I
): Admission => ({
	trigger: kind.name,
	key,
	input: kind.scope.input(input),
	scope: scopeWorkOf(kind.scope, input, () => [])
})

/**
 * The ordinals `0 … count − 1`, none for a count of 0: Effect's `Array.range` makes one element of an empty range, so a
 * program that spawns `count` children counts them here.
 */
export const ordinals = (count: number): ReadonlyArray<number> =>
	count > 0 ? Arr.range(0, count - 1) : []

/** A den program as the simulator runs it: its lanes, which the census reads, and its name. */
export type Program = Readonly<{ name: string; lanes: Arr.NonEmptyReadonlyArray<Lane> }>
