import { Array as Arr, Option } from "effect"
import type { Datum } from "#datum.ts"

/**
 * A resource: a named bottleneck whose capacity is its seats, keyed `0 … seats − 1` (W1's replica holds 8). A step
 * holds one seat of each resource it declares while it runs; no two holders share a seat key, so the bound is exact.
 * A scope's exclusivity is a seat too, keyed by its kind and the value its input names, held for the scope's life.
 */
export type Resource = Readonly<{ name: string; seats: number }>

/**
 * A root kind's window: the steps of its roots may run only inside a span of every period, `[opens, closes)` ticks past
 * each multiple of `period` (edullm's 07:00–12:59Z, at the model's scale). A window must hold a census tick, so its
 * open span is never shorter than the census's period: only the census rings what a window's opening made eligible.
 * Windows and exclusivity belong to root kinds only, as every one of edullm's is per run, so no step is under two.
 */
export type Window = Readonly<{ period: number; opens: number; closes: number }>

/** Whether a window is open at an instant. */
export const isOpenAt = (window: Window, at: number): boolean => {
	const phase = at % window.period
	return phase >= window.opens && phase < window.closes
}

/** The most ticks a window keeps a due step waiting: its closed span. */
export const closedSpanOf = (window: Window): number =>
	window.period - (window.closes - window.opens)

/**
 * A step's retry ladder, written out either way: it ends after `attempts` counted attempts (W1 to W4), or never (W6's
 * reports). A rung waits `first` ticks, doubling, never more than `last`, which is also the furthest a body may set
 * its own retry.
 */
export type Ladder =
	| Readonly<{ _tag: "Attempts"; attempts: number; first: number; last: number }>
	| Readonly<{ _tag: "Never"; first: number; last: number }>

/** The delay of a ladder's rung after `count` earlier rungs. */
export const rungOf = (ladder: Ladder, count: number): number =>
	Math.min(ladder.first * 2 ** count, ladder.last)

/**
 * How a step runs: the ticks its claim's lease lasts (the holder's deadline is one tick before its end), the resources
 * it holds a seat of while it runs, and its retry ladder. Every step kind and every scope's finish states one.
 */
export type Runs = Readonly<{ lease: number; holds: ReadonlyArray<Resource>; ladder: Ladder }>

/** One write into the app's own relations, by a step's result or by the app's own transaction. */
export type Write = Readonly<{ relation: string; key: string; value: Datum }>

/** One row a read returns: its key and its value. */
export type Row = Readonly<{ key: string; value: Datum }>

/**
 * A declared read, as data: the rows of an app relation (all of them, or the one row of a key), or the steps pending
 * under roots of some kinds, keyed by their identity's text and valued by their kind.
 */
export type Query =
	| Readonly<{ _tag: "Rows"; relation: string; key: Option.Option<string> }>
	| Readonly<{ _tag: "Pending"; roots: ReadonlyArray<string> }>

/**
 * A read a step kind declares, by name: taken by the claim before the body runs and recorded as part of the step's
 * input (W1's fingerprint, W5's presence, W7's intents). A read that depends on what a body computed is its own step.
 */
export type Read = Readonly<{ name: string; query: Query }>

/**
 * What a body sees of its claim: the instant the ledger's clock gave it, the claim's number, the attempts and waits its
 * step spent so far, and the rows each of its declared reads returned. A body is a pure function of its input and
 * this, so a re-run of one claim computes the same outcome.
 */
export type Claimed = Readonly<{
	at: number
	attempt: number
	attempts: number
	waits: number
	read: (name: string) => ReadonlyArray<Row>
}>

/** Whether a retry spends an attempt on the step's ladder, or is a wait, which spends nothing. */
export type Counts = "attempt" | "wait"

/**
 * A body's outcome: an output with the app writes that land with it; a typed failure, which ends the step `failed`; or
 * a retry at an instant no later than `at + ladder.last`.
 */
export type Outcome<O, E> =
	| Readonly<{ _tag: "Output"; output: O; writes: ReadonlyArray<Write> }>
	| Readonly<{ _tag: "Failure"; error: E }>
	| Readonly<{ _tag: "Retry"; at: number; counts: Counts }>

/** How a scope's child ended, as its scope's finish reads it: done with its output, or failed. */
export type ChildEnding =
	| Readonly<{ _tag: "Done"; kind: string; output: Datum }>
	| Readonly<{ _tag: "Failed"; kind: string }>

/** When a spawned step is due: at once, or at an instant its edge names (W5's timer, W6's delay). */
export type Due = Readonly<{ _tag: "Now" }> | Readonly<{ _tag: "At"; at: number }>

/**
 * A step's outcome once it leaves its typed code: the output and error as data, and, for an output, every child its
 * declared edges take from it, each with the edge's name and its ordinal there. A failed step spawns nothing.
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

/** A child an output starts under one of its step's declared edges, at its ordinal there. */
export type Next = Readonly<{ edge: string; ordinal: number; child: Child }>

/** A step's work, its types erased into the closure that holds its typed input: how it runs, its reads, its body. */
export type StepWork = Readonly<{
	runs: Runs
	reads: ReadonlyArray<Read>
	run: (claimed: Claimed) => Settled
}>

/**
 * A scope's work, its types erased: the children its start opens, and its finish, which runs once every child ended,
 * reads their endings, and starts the edges that follow it in the scope that owns this one.
 */
export type ScopeWork = Readonly<{
	children: ReadonlyArray<Child>
	finish: Readonly<{
		runs: Runs
		run: (children: ReadonlyArray<ChildEnding>, claimed: Claimed) => Settled
	}>
}>

/** A step an edge or a start opens, due at once or at an instant. */
export type StepChild = Readonly<{
	_tag: "StepChild"
	kind: string
	input: Datum
	due: Due
	work: StepWork
}>

/** A scope an edge or a start opens, with the edges that follow its finish already in its work. */
export type ScopeChild = Readonly<{
	_tag: "ScopeChild"
	kind: string
	input: Datum
	scope: ScopeWork
}>

/** A child an edge or a start opens: a step, or a scope. */
export type Child = StepChild | ScopeChild

/**
 * A step kind: its name, how it runs, how its values show as data, the reads it declares for an input, its pure body
 * and its declared edges.
 */
export type StepKind<I, O, E> = Readonly<{
	name: string
	runs: Runs
	input: (input: I) => Datum
	output: (output: O) => Datum
	error: (error: E) => Datum
	reads: (input: I) => ReadonlyArray<Read>
	body: (input: I, claimed: Claimed) => Outcome<O, E>
	edges: () => ReadonlyArray<Edge<I, O>>
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

/** What starts a root: a schedule every `every` ticks, an operator, or the app's own write inside its transaction. */
export type Trigger =
	| Readonly<{ _tag: "Schedule"; every: number }>
	| Readonly<{ _tag: "Operator" }>
	| Readonly<{ _tag: "App" }>

/**
 * Where a root's input comes from (den's `from`): given by its request, which names its kind's input heading as its
 * deployment declares it, the fingerprint its root records beside the input it was requested with, so a deploy that
 * changes the heading changes it; or derived from its key, a read of the app's facts at the request's commit (a
 * schedule's from its key alone), so its root records nothing.
 */
export type From = Readonly<{ _tag: "Given"; heading: string }> | Readonly<{ _tag: "Derived" }>

/**
 * A root's trigger and its input's source together, as den holds them: a schedule's input derives from its key; an
 * operator's or the app's is given or derived.
 */
export type Started =
	| Readonly<{
			trigger: Extract<Trigger, Readonly<{ _tag: "Schedule" }>>
			from: Extract<From, Readonly<{ _tag: "Derived" }>>
	  }>
	| Readonly<{ trigger: Exclude<Trigger, Readonly<{ _tag: "Schedule" }>>; from: From }>

/**
 * A root kind: a scope a trigger starts, the only way a graph begins, behind its precondition (a read that must be
 * empty for it to be admitted, W4's quiescence) and its exclusivity (the key of the seat its run holds for its life,
 * one live run per key: per relation, per collection, one Gold build), named by what its request names, `S`: its
 * input, or a derived root's key, as den names it before any read; its window bounds when its steps may run. Nothing
 * follows a root's finish.
 */
export type RootKind<I, O, E, S = I> = Started &
	Readonly<{
		name: string
		precondition: Option.Option<Query>
		exclusive: Option.Option<(named: S) => string>
		window: Option.Option<Window>
		scope: ScopeKind<I, O, E>
	}>

/**
 * A declared spawn edge from a step of input `I` and output `O`: a pure function to the children it starts, steps or
 * scopes of one declared kind, ordinal by position. It runs only on an output: a step that fails spawns nothing.
 */
export type Edge<I, O> = Readonly<{
	name: string
	children: (input: I, output: O) => ReadonlyArray<Child>
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

/** What a step's declared edges take from its output: each edge's children under their ordinals. */
export const nextOf = <I, O>(
	edges: ReadonlyArray<Edge<I, O>>,
	input: I,
	output: O
): ReadonlyArray<Next> =>
	Arr.flatMap(edges, (edge) =>
		Arr.map(edge.children(input, output), (child, ordinal): Next => ({
			edge: edge.name,
			ordinal,
			child
		}))
	)

const childOf = <I, O, E>(kind: StepKind<I, O, E>, input: I, due: Due): StepChild => ({
	_tag: "StepChild",
	kind: kind.name,
	input: kind.input(input),
	due,
	work: {
		runs: kind.runs,
		reads: kind.reads(input),
		run: (claimed) =>
			settledOf(kind.body(input, claimed), kind, (output) => nextOf(kind.edges(), input, output))
	}
})

/** A step of a kind, with its input, due at once: the child an edge or a start opens. */
export const stepOf = <I, O, E>(kind: StepKind<I, O, E>, input: I): StepChild =>
	childOf(kind, input, { _tag: "Now" })

/** A step of a kind, with its input, due at an instant: a timer. */
export const stepAt = <I, O, E>(kind: StepKind<I, O, E>, input: I, at: number): StepChild =>
	childOf(kind, input, { _tag: "At", at })

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

/** A spawn edge to a step kind: one step per input `inputs` returns, each due at once. */
export const spawn = <I, O, J, P, Q>(
	name: string,
	target: StepKind<J, P, Q>,
	inputs: (input: I, output: O) => ReadonlyArray<J>
): Edge<I, O> => ({
	name,
	children: (input, output) => Arr.map(inputs(input, output), (child) => stepOf(target, child))
})

/** A spawn edge to a step kind whose children are timers: one step per input, each due at the instant it names. */
export const spawnAt = <I, O, J, P, Q>(
	name: string,
	target: StepKind<J, P, Q>,
	timed: (input: I, output: O) => ReadonlyArray<Readonly<{ input: J; at: number }>>
): Edge<I, O> => ({
	name,
	children: (input, output) =>
		Arr.map(timed(input, output), (child) => stepAt(target, child.input, child.at))
})

/** A spawn edge to a scope kind: one child scope per input, each followed by `then` in the scope that opens it. */
export const open = <I, O, J, P, Q>(
	name: string,
	target: ScopeKind<J, P, Q>,
	inputs: (input: I, output: O) => ReadonlyArray<J>,
	then: () => ReadonlyArray<Edge<J, P>>
): Edge<I, O> => ({
	name,
	children: (input, output) =>
		Arr.map(inputs(input, output), (child) => scopeOf(target, child, then))
})

/** What a root admits, its types erased: its input as data, its exclusivity seat's key, and its scope's work. */
export type Admits = Readonly<{
	input: Datum
	exclusive: Option.Option<string>
	scope: ScopeWork
}>

/**
 * Where an admission's root's input comes from: given by its request, beside the fingerprint it records with it (its
 * kind's input heading); or derived, at the request's commit, from the rows `read` finds of the app's facts (none, for
 * an input derived from its key's values alone), none where it derives nothing, and recorded nowhere.
 */
export type Source =
	| Readonly<{ _tag: "Given"; heading: string; admits: Admits }>
	| Readonly<{
			_tag: "Derived"
			read: Option.Option<Query>
			derive: (rows: ReadonlyArray<Row>) => Option.Option<Admits>
	  }>

/**
 * A root's admission, its types erased: the root's key (its kind and idempotency key), what its request names as data
 * (its input, or a derived root's key; a scheduled root's admitted by `admissionOf` names the input its key derives),
 * where its input comes from, its precondition and its window.
 */
export type Admission = Readonly<{
	kind: string
	key: string
	named: Datum
	source: Source
	precondition: Option.Option<Query>
	window: Option.Option<Window>
}>

/** What a root of `kind` admits with `input`, at the seat `exclusive` its request named. */
const admitsOf = <I, O, E, S>(
	kind: RootKind<I, O, E, S>,
	input: I,
	exclusive: Option.Option<string>
): Admits => ({
	input: kind.scope.input(input),
	exclusive,
	scope: scopeWorkOf(kind.scope, input, () => [])
})

/**
 * The admission of a root kind under an idempotency key, with its input: given by its request, or, for a kind whose
 * input derives from its key alone (a schedule's), the input its key derives, which also names its seat; a kind whose
 * input a read derives is admitted by `derivedAdmissionOf`. Nothing follows a root's finish.
 */
export const admissionOf = <I, O, E>(kind: RootKind<I, O, E>, key: string, input: I): Admission => {
	const admits = admitsOf(
		kind,
		input,
		Option.map(kind.exclusive, (exclusive) => exclusive(input))
	)
	return {
		kind: kind.name,
		key,
		named: kind.scope.input(input),
		source:
			kind.from._tag === "Given"
				? { _tag: "Given", heading: kind.from.heading, admits }
				: { _tag: "Derived", read: Option.none(), derive: () => Option.some(admits) },
		precondition: kind.precondition,
		window: kind.window
	}
}

/**
 * The admission of a root kind whose input derives from its key `named` by a read of the app's facts: the rows `read`
 * finds at the request's commit, which `derive` makes its input of, or none, where the root is not admitted; its seat
 * is named by the key, before any read, as den's binding names it.
 */
export const derivedAdmissionOf = <I, O, E, S extends Datum>(
	kind: RootKind<I, O, E, S>,
	key: string,
	named: S,
	read: Query,
	derive: (rows: ReadonlyArray<Row>) => Option.Option<I>
): Admission => ({
	kind: kind.name,
	key,
	named,
	source: {
		_tag: "Derived",
		read: Option.some(read),
		derive: (rows) =>
			Option.map(derive(rows), (input) =>
				admitsOf(
					kind,
					input,
					Option.map(kind.exclusive, (exclusive) => exclusive(named))
				)
			)
	},
	precondition: kind.precondition,
	window: kind.window
})

/**
 * The ordinals `0 … count − 1`, none for a count of 0: Effect's `Array.range` makes one element of an empty range, so a
 * program that spawns `count` children counts them here.
 */
export const ordinals = (count: number): ReadonlyArray<number> =>
	Array.from({ length: count }, (_, at) => at)

/** A root kind as its program declares it to the laws: its name, its precondition and its window. */
export type Rooted = Readonly<{
	kind: string
	precondition: Option.Option<Query>
	window: Option.Option<Window>
}>

/**
 * A den program as the simulator and the laws read it: its resources and its root kinds. Steps and scopes are not
 * listed: their kinds arrive with each admission's work.
 */
export type Program = Readonly<{
	name: string
	resources: ReadonlyArray<Resource>
	roots: Arr.NonEmptyReadonlyArray<Rooted>
}>

/** A root kind's declaration for its program. */
export const rootedOf = <I, O, E>(kind: RootKind<I, O, E>): Rooted => ({
	kind: kind.name,
	precondition: kind.precondition,
	window: kind.window
})

/** The windows a program's root kinds carry. */
export const windowsOf = (program: Program): ReadonlyArray<Window> =>
	Arr.flatMap(program.roots, (root) => Option.toArray(root.window))

/** Programs side by side, as one app runs them: their resources and roots together. */
export const together = (name: string, programs: Arr.NonEmptyReadonlyArray<Program>): Program => ({
	name,
	resources: Arr.dedupeWith(
		Arr.flatMap(programs, (program) => program.resources),
		(a, b) => a.name === b.name
	),
	roots: Arr.flatMap(programs, (program) => program.roots)
})
