import { Array as Arr, Equal, HashMap, HashSet, Option, Order } from "effect"
import type { Datum } from "#datum.ts"
import type { Answer, Command, Entry, Fact, Failure, Reported, ScopeEnding, Spawn } from "#facts.ts"
import {
	type RootKey,
	rootOfScope,
	rootOfStep,
	rootText,
	type ScopeId,
	type StepId,
	scopeText,
	stepText
} from "#identity.ts"
import type {
	Admission,
	ChildEnding,
	Claimed,
	Completion,
	Counts,
	Feed,
	Lane,
	Next,
	Runs,
	ScopeChild,
	ScopeWork,
	Settled,
	StepChild,
	Write
} from "#program.ts"
import { isOpenAt } from "#program.ts"

/** How a step ended, as its row holds it: the facts that ended it, folded. */
export type Ending =
	| Readonly<{
			_tag: "Done"
			claim: number
			token: Option.Option<number>
			output: Datum
			writes: ReadonlyArray<Write>
	  }>
	| Readonly<{ _tag: "Failed"; claim: number; token: Option.Option<number>; failure: Failure }>
	| Readonly<{ _tag: "Completed"; value: Datum }>
	| Readonly<{ _tag: "Stopped" }>

/**
 * A live claim: its number, its fence token, its slot in the lane, the instant its lease ends, and the deployment that
 * took it.
 */
export type Hold = Readonly<{
	claim: number
	token: number
	slot: number
	until: number
	deployment: number
}>

/**
 * Where a step that runs on a lane stands: due at an instant (`since` the instant the fact that made it due committed),
 * held by its latest claim (whose lease may have run out,
 * which makes it due again at `until` and its next claim a reclaim), or ended.
 */
export type Phase =
	| Readonly<{ _tag: "Due"; at: number; since: number }>
	| Readonly<{ _tag: "Held"; hold: Hold }>
	| Readonly<{ _tag: "Ended"; ending: Ending }>

/** Whether a step is one of its scope's children or the scope's finish. */
export type Role = "Child" | "Finish"

/** What every step's row holds: its identity, kind, input, owning scope (fixed at spawn) and root, and its role. */
type Common = Readonly<{
	id: StepId
	text: string
	kind: string
	input: Datum
	scope: string
	root: string
	role: Role
}>

/** The row of a step that runs on a lane: its work, where it stands, its claims so far and its counters. */
export type BodyRow = Common &
	Readonly<{
		_tag: "Body"
		runs: Runs
		run: (claimed: Claimed) => Settled
		phase: Phase
		claims: number
		attempts: number
		waits: number
		reclaims: number
		retried: Option.Option<Readonly<{ token: number; at: number; counts: Counts }>>
	}>

/** How an await is completed, its timer's instant fixed at its spawn. */
export type Awaiting = Readonly<{ _tag: "External" }> | Readonly<{ _tag: "Timer"; fires: number }>

/** The row of an await: how it completes, what its completion starts, and its ending once completed or stopped. */
export type AwaitRow = Common &
	Readonly<{
		_tag: "Await"
		awaiting: Awaiting
		settle: (value: Datum) => ReadonlyArray<Next>
		ending: Option.Option<Ending>
	}>

/** A step's row. */
export type StepRow = BodyRow | AwaitRow

/** A scope's child, by the kind of row it is and its key. */
export type ChildRef = Readonly<{ _tag: "Step" | "Scope"; text: string }>

/** A scope's row: its identity, kind, root and owner, its work, its children so far, its finishes and its ending. */
export type ScopeRow = Readonly<{
	id: ScopeId
	text: string
	kind: string
	root: string
	owner: Option.Option<string>
	work: ScopeWork
	children: ReadonlyArray<ChildRef>
	finishes: ReadonlyArray<string>
	ending: Option.Option<ScopeEnding>
}>

/** A feed's join in one scope under one key: the parts that arrived, by role. */
export type JoinRow = Readonly<{
	text: string
	feed: Feed
	scope: string
	root: string
	parts: HashMap.HashMap<string, Datum>
}>

/** A root's row: its key and its scope. */
export type RootRow = Readonly<{ key: RootKey; text: string; scope: string }>

/**
 * The ledger's state: a projection of the facts it holds, keyed by canonical text (identity.ts). The app's own rows,
 * which steps' writes land in, are a relation of their own that retirement never touches, and so is the count of fence
 * tokens minted, so no token is ever minted twice.
 */
export type State = Readonly<{
	roots: HashMap.HashMap<string, RootRow>
	scopes: HashMap.HashMap<string, ScopeRow>
	steps: HashMap.HashMap<string, StepRow>
	joins: HashMap.HashMap<string, JoinRow>
	paused: HashSet.HashSet<string>
	deployment: number
	minted: number
	app: HashMap.HashMap<string, Datum>
}>

/** The empty ledger, under deployment 0. */
export const emptyState: State = {
	roots: HashMap.empty(),
	scopes: HashMap.empty(),
	steps: HashMap.empty(),
	joins: HashMap.empty(),
	paused: HashSet.empty(),
	deployment: 0,
	minted: 0,
	app: HashMap.empty()
}

type FactOf<T extends Fact["_tag"]> = Extract<Fact, Readonly<{ _tag: T }>>

/**
 * A fact as the ledger applies it: the facts that start something carry the work their typed code erased, which the
 * trace leaves out.
 */
type Event =
	| Readonly<{ _tag: "Admit"; fact: FactOf<"Admitted">; work: ScopeWork }>
	| Readonly<{ _tag: "Open"; fact: FactOf<"Opened">; work: ScopeWork }>
	| Readonly<{ _tag: "Spawn"; fact: FactOf<"Spawned">; child: StepChild; role: Role }>
	| Readonly<{ _tag: "Join"; fact: FactOf<"Fed">; feed: Feed }>
	| Readonly<{
			_tag: "Plain"
			fact: Exclude<Fact, Readonly<{ _tag: "Admitted" | "Opened" | "Spawned" | "Fed" }>>
	  }>

/** A step's ending, wherever its row keeps it. */
export const endingOf = (row: StepRow): Option.Option<Ending> => {
	switch (row._tag) {
		case "Body":
			return row.phase._tag === "Ended" ? Option.some(row.phase.ending) : Option.none()
		case "Await":
			return row.ending
	}
}

const withStep = (state: State, text: string, change: (row: StepRow) => StepRow): State =>
	Option.match(HashMap.get(state.steps, text), {
		onNone: () => state,
		onSome: (row) => ({ ...state, steps: HashMap.set(state.steps, text, change(row)) })
	})

const withScope = (state: State, text: string, change: (row: ScopeRow) => ScopeRow): State =>
	Option.match(HashMap.get(state.scopes, text), {
		onNone: () => state,
		onSome: (row) => ({ ...state, scopes: HashMap.set(state.scopes, text, change(row)) })
	})

const withBody = (state: State, text: string, change: (row: BodyRow) => BodyRow): State =>
	withStep(state, text, (row) => (row._tag === "Body" ? change(row) : row))

const ended = (row: StepRow, ending: Ending): StepRow => {
	switch (row._tag) {
		case "Body":
			return { ...row, phase: { _tag: "Ended", ending } }
		case "Await":
			return { ...row, ending: Option.some(ending) }
	}
}

const rowOfSpawn = (
	fact: FactOf<"Spawned">,
	child: StepChild,
	role: Role,
	scope: string
): StepRow => {
	const common: Common = {
		id: fact.step,
		text: stepText(fact.step),
		kind: fact.kind,
		input: fact.input,
		scope,
		root: rootText(rootOfStep(fact.step)),
		role
	}
	const work = child.work
	switch (work._tag) {
		case "Body":
			return {
				...common,
				_tag: "Body",
				runs: work.runs,
				run: work.run,
				phase: { _tag: "Due", at: fact.at, since: fact.at },
				claims: 0,
				attempts: 0,
				waits: 0,
				reclaims: 0,
				retried: Option.none()
			}
		case "Await":
			return {
				...common,
				_tag: "Await",
				awaiting:
					fact.spawn._tag === "Timer"
						? { _tag: "Timer", fires: fact.spawn.fires }
						: { _tag: "External" },
				settle: work.settle,
				ending: Option.none()
			}
	}
}

const scopeRowOf = (
	id: ScopeId,
	kind: string,
	owner: Option.Option<string>,
	work: ScopeWork
): ScopeRow => ({
	id,
	text: scopeText(id),
	kind,
	root: rootText(rootOfScope(id)),
	owner,
	work,
	children: [],
	finishes: [],
	ending: Option.none()
})

/** The ledger's state after one more fact: the one place a fact's meaning is written. */
const apply = (state: State, event: Event): State => {
	switch (event._tag) {
		case "Admit": {
			const id: ScopeId = { _tag: "RootScope", root: event.fact.root }
			const text = rootText(event.fact.root)
			return {
				...state,
				roots: HashMap.set(state.roots, text, { key: event.fact.root, text, scope: scopeText(id) }),
				scopes: HashMap.set(
					state.scopes,
					scopeText(id),
					scopeRowOf(id, event.fact.root.trigger, Option.none(), event.work)
				)
			}
		}
		case "Open": {
			const owner = scopeText(event.fact.owner)
			const text = scopeText(event.fact.scope)
			const opened: State = {
				...state,
				scopes: HashMap.set(
					state.scopes,
					text,
					scopeRowOf(event.fact.scope, event.fact.kind, Option.some(owner), event.work)
				)
			}
			return withScope(opened, owner, (row) => ({
				...row,
				children: Arr.append(row.children, { _tag: "Scope", text })
			}))
		}
		case "Spawn": {
			const scope = scopeText(event.fact.scope)
			const row = rowOfSpawn(event.fact, event.child, event.role, scope)
			return withScope(
				{ ...state, steps: HashMap.set(state.steps, row.text, row) },
				scope,
				(owner) =>
					event.role === "Child"
						? { ...owner, children: Arr.append(owner.children, { _tag: "Step", text: row.text }) }
						: { ...owner, finishes: Arr.append(owner.finishes, row.text) }
			)
		}
		case "Join": {
			const scope = scopeText(event.fact.scope)
			const text = joinText(scope, event.fact.feed, event.fact.key)
			const join = Option.getOrElse(HashMap.get(state.joins, text), (): JoinRow => ({
				text,
				feed: event.feed,
				scope,
				root: rootText(rootOfScope(event.fact.scope)),
				parts: HashMap.empty()
			}))
			return {
				...state,
				joins: HashMap.set(state.joins, text, {
					...join,
					parts: HashMap.set(join.parts, event.fact.role, event.fact.value)
				})
			}
		}
		case "Plain":
			return applyPlain(state, event.fact)
	}
}

const applyPlain = (
	state: State,
	fact: Extract<Event, Readonly<{ _tag: "Plain" }>>["fact"]
): State => {
	switch (fact._tag) {
		case "Claimed":
			return withBody(
				{ ...state, minted: Math.max(state.minted, fact.token + 1) },
				stepText(fact.step),
				(row) => ({
					...row,
					phase: {
						_tag: "Held",
						hold: {
							claim: fact.claim,
							token: fact.token,
							slot: fact.slot,
							until: fact.until,
							deployment: fact.deployment
						}
					},
					claims: row.claims + 1,
					reclaims: row.reclaims + (row.phase._tag === "Held" ? 1 : 0)
				})
			)
		case "Retried":
			return withBody(state, stepText(fact.step), (row) => ({
				...row,
				phase: { _tag: "Due", at: fact.due, since: fact.at },
				attempts: row.attempts + (fact.counts === "attempt" ? 1 : 0),
				waits: row.waits + (fact.counts === "wait" ? 1 : 0),
				retried: Option.map(tokenOf(row), (token) => ({ token, at: fact.due, counts: fact.counts }))
			}))
		case "Done":
			return withStep(state, stepText(fact.step), (row) =>
				ended(row, {
					_tag: "Done",
					claim: fact.claim,
					token: tokenOf(row),
					output: fact.output,
					writes: []
				})
			)
		case "Wrote":
			return {
				...withStep(state, stepText(fact.step), (row) =>
					Option.match(endingOf(row), {
						onNone: () => row,
						onSome: (ending) =>
							ending._tag === "Done"
								? ended(row, { ...ending, writes: Arr.append(ending.writes, fact.write) })
								: row
					})
				),
				app: HashMap.set(state.app, `${fact.write.relation}/${fact.write.key}`, fact.write.value)
			}
		case "Failed":
			return withStep(state, stepText(fact.step), (row) =>
				ended(row, {
					_tag: "Failed",
					claim: fact.claim,
					token: tokenOf(row),
					failure: fact.failure
				})
			)
		case "Completed":
			return withStep(state, stepText(fact.step), (row) =>
				ended(row, { _tag: "Completed", value: fact.value })
			)
		case "Stopped":
			return withStep(state, stepText(fact.step), (row) => ended(row, { _tag: "Stopped" }))
		case "Finished":
			return withScope(state, scopeText(fact.scope), (row) => ({
				...row,
				ending: Option.some(fact.ending)
			}))
		case "Paused":
			return { ...state, paused: HashSet.add(state.paused, fact.lane) }
		case "Resumed":
			return { ...state, paused: HashSet.remove(state.paused, fact.lane) }
		case "Deployed":
			return { ...state, deployment: fact.deployment }
		case "Retired": {
			const root = rootText(fact.root)
			const kept = <R extends Readonly<{ root: string }>>(rows: HashMap.HashMap<string, R>) =>
				HashMap.filter(rows, (row) => row.root !== root)
			return {
				...state,
				roots: HashMap.remove(state.roots, root),
				scopes: kept(state.scopes),
				steps: kept(state.steps),
				joins: kept(state.joins)
			}
		}
	}
}

/** The token of the claim that holds a step, if one does: the claim a result or a retry landing now closes. */
const tokenOf = (row: StepRow): Option.Option<number> =>
	row._tag === "Body" && row.phase._tag === "Held"
		? Option.some(row.phase.hold.token)
		: Option.none()

/** A join's key: its scope, its feed and the key its parents named. */
const joinText = (scope: string, feed: string, key: string): string => `${scope}/${feed}@${key}`

/** Whether a commit may land, re-run, or is lost, as a rule decides. */
export type Fence = "open" | "rerun" | "lost"

/**
 * The ledger's decisions, each a function so a planted bug replaces exactly one (planted.ts). The sound rules are
 * `SOUND`.
 * - `serves`: whether a call from a deployment is served while another is current;
 * - `room`: whether a lane holding `live` claims has a free slot under its width;
 * - `fence`: whether the report of a claim, by its number and its fence token, may land on a step's row, is a re-run
 *   of what already landed, or is lost;
 * - `complete`: whether every child of a scope has ended, so its finish is due;
 * - `finish`: the identity of the finish a complete scope spawns, none when it has one;
 * - `ordinal`: the ordinal a child an edge returned at position `ordinal` is spawned under;
 * - `lostWrites`: the writes a lost commit still lands;
 * - `exhausted`: whether `spent` attempts or reclaims reach a ceiling, ending the step failed.
 */
export type Rules = Readonly<{
	serves: (caller: number, current: number) => boolean
	room: (live: number, width: number) => boolean
	fence: (
		row: BodyRow,
		claim: Readonly<{ claim: number; token: number }>,
		reported: Reported
	) => Fence
	complete: (scope: ScopeRow, state: State) => boolean
	finish: (scope: ScopeRow, state: State) => Option.Option<StepId>
	ordinal: (ordinal: number, state: State) => number
	lostWrites: (reported: Reported) => ReadonlyArray<Write>
	exhausted: (spent: number, ceiling: number) => boolean
}>

/** Whether an ending is the one a claim's report would land: the same claim, the same output and writes, or failure. */
const isLanded = (ending: Ending, token: number, reported: Reported): boolean => {
	switch (ending._tag) {
		case "Done":
			return (
				Option.contains(ending.token, token) &&
				reported._tag === "Output" &&
				Equal.equals(ending.output, reported.output) &&
				Equal.equals(ending.writes, reported.writes)
			)
		case "Failed":
			switch (ending.failure._tag) {
				case "Refused":
					return (
						Option.contains(ending.token, token) &&
						reported._tag === "Failure" &&
						Equal.equals(ending.failure.error, reported.error)
					)
				case "AttemptsExhausted":
					return Option.contains(ending.token, token) && reported._tag === "Retry"
				case "ReclaimsExhausted":
					return false
			}
		case "Completed":
		case "Stopped":
			return false
	}
}

/**
 * The sound fence: a commit lands only on the live claim its token names, whatever its lease; the same report again is
 * a re-run; anything else is lost. The fence is the token, never the clock: a holder whose lease ran out still lands
 * while no newer claim took its step.
 */
const soundFence = (
	row: BodyRow,
	{ token }: Readonly<{ claim: number; token: number }>,
	reported: Reported
): Fence => {
	switch (row.phase._tag) {
		case "Ended":
			return isLanded(row.phase.ending, token, reported) ? "rerun" : "lost"
		case "Held":
			return row.phase.hold.token === token ? "open" : "lost"
		case "Due":
			return Option.exists(
				row.retried,
				(retried) =>
					retried.token === token &&
					reported._tag === "Retry" &&
					retried.at === reported.at &&
					retried.counts === reported.counts
			)
				? "rerun"
				: "lost"
	}
}

/** Whether a scope's child has ended. */
const childEnded = (state: State, child: ChildRef): boolean => {
	switch (child._tag) {
		case "Step":
			return Option.exists(HashMap.get(state.steps, child.text), (row) =>
				Option.isSome(endingOf(row))
			)
		case "Scope":
			return Option.exists(HashMap.get(state.scopes, child.text), (row) =>
				Option.isSome(row.ending)
			)
	}
}

/** The ledger's laws as the proposal states them. */
export const SOUND: Rules = {
	serves: (caller, current) => caller === current,
	room: (live, width) => live < width,
	fence: soundFence,
	complete: (scope, state) => Arr.every(scope.children, (child) => childEnded(state, child)),
	finish: (scope) =>
		Arr.isReadonlyArrayEmpty(scope.finishes)
			? Option.some({ _tag: "FinishStep", scope: scope.id })
			: Option.none(),
	ordinal: (ordinal) => ordinal,
	lostWrites: () => [],
	exhausted: (spent, ceiling) => spent >= ceiling
}

/** One call's answer: the ledger after it, how it answered, and the trace entry it adds. */
export type Answered = Readonly<{ state: State; answer: Answer; entry: Entry }>

/**
 * What a won claim hands its holder: the step, the claim's number and fence token, its lease's end, how it runs, its
 * work, and what its body sees.
 */
export type Lease = Readonly<{
	step: StepId
	text: string
	claim: number
	token: number
	until: number
	runs: Runs
	run: (claimed: Claimed) => Settled
	claimed: Claimed
}>

/** A claim's answer, with the lease it won, if it won one. */
export type ClaimAnswered = Answered & Readonly<{ lease: Option.Option<Lease> }>

/** A transaction in progress: the state as of its facts so far, and the facts, in order. */
type Tx = Readonly<{
	state: () => State
	emit: (event: Event) => void
	events: () => ReadonlyArray<Event>
}>

const begin = (state: State): Tx => {
	let current = state
	const events: Array<Event> = []
	return {
		state: () => current,
		emit: (event) => {
			current = apply(current, event)
			events.push(event)
		},
		events: () => events
	}
}

const plain = (fact: Extract<Event, Readonly<{ _tag: "Plain" }>>["fact"]): Event => ({
	_tag: "Plain",
	fact
})

const entryOf = (
	at: number,
	command: Command,
	answer: Answer,
	events: ReadonlyArray<Event>
): Entry => ({
	at,
	command,
	answer,
	facts: Arr.map(events, (event) => event.fact)
})

const answered = (state: State, at: number, command: Command, answer: Answer): Answered => ({
	state,
	answer,
	entry: entryOf(at, command, answer, [])
})

/** A transaction's answer: `accepted` with its facts, or `unchanged` when it added none. */
const committed = (tx: Tx, at: number, command: Command): Answered => {
	const answer: Answer = Arr.isReadonlyArrayEmpty(tx.events()) ? "unchanged" : "accepted"
	return { state: tx.state(), answer, entry: entryOf(at, command, answer, tx.events()) }
}

/** What a worker's report says, without the children its edges take, which the ledger derives itself. */
export const reportedOf = (settled: Settled): Reported => {
	switch (settled._tag) {
		case "Output":
			return { _tag: "Output", output: settled.output, writes: settled.writes }
		case "Failure":
		case "Retry":
			return settled
	}
}

/** The instant a step that runs on a lane is due: its due instant, or its lease's end once a claim holds it. */
export const dueAtOf = (row: BodyRow): Option.Option<number> => {
	switch (row.phase._tag) {
		case "Due":
			return Option.some(row.phase.at)
		case "Held":
			return Option.some(row.phase.hold.until)
		case "Ended":
			return Option.none()
	}
}

const BY_DUE: Order.Order<readonly [number, BodyRow]> = Order.combine(
	Order.mapInput(Order.Number, ([due]: readonly [number, BodyRow]) => due),
	Order.mapInput(Order.String, ([, row]: readonly [number, BodyRow]) => row.text)
)

/** The steps of a lane a claim may take at an instant, earliest due first, then by key. */
export const claimable = (state: State, lane: string, at: number): ReadonlyArray<BodyRow> =>
	Arr.map(
		Arr.sort(
			Arr.flatMap(HashMap.toValues(state.steps), (row): ReadonlyArray<readonly [number, BodyRow]> =>
				row._tag === "Body" && row.runs.lane.name === lane
					? Option.match(dueAtOf(row), {
							onNone: () => [],
							onSome: (due) => (due <= at ? [[due, row]] : [])
						})
					: []
			),
			BY_DUE
		),
		([, row]) => row
	)

/** The live claims of a lane at an instant: claims in force whose lease has not run out. */
export const liveHolds = (state: State, lane: string, at: number): ReadonlyArray<Hold> =>
	Arr.flatMap(HashMap.toValues(state.steps), (row): ReadonlyArray<Hold> =>
		row._tag === "Body" &&
		row.runs.lane.name === lane &&
		row.phase._tag === "Held" &&
		row.phase.hold.until > at
			? [row.phase.hold]
			: []
	)

/** The free slots of a lane at an instant: its width less its live claims, never below none. */
export const freeSlots = (state: State, lane: Lane, at: number): number =>
	Math.max(0, lane.width - liveHolds(state, lane.name, at).length)

/** The ending each child of a scope reads as, for its finish. */
const endingsOf = (state: State, scope: ScopeRow): ReadonlyArray<ChildEnding> =>
	Arr.flatMap(scope.children, (child): ReadonlyArray<ChildEnding> =>
		Option.toArray(endingOfChild(state, child))
	)

const endingOfChild = (state: State, child: ChildRef): Option.Option<ChildEnding> => {
	switch (child._tag) {
		case "Step":
			return Option.flatMap(HashMap.get(state.steps, child.text), (row) =>
				Option.map(endingOf(row), (ending) => stepEnding(row.kind, ending))
			)
		case "Scope":
			return Option.flatMap(HashMap.get(state.scopes, child.text), (row) =>
				Option.map(row.ending, (ending) => scopeEnding(state, row, ending))
			)
	}
}

const stepEnding = (kind: string, ending: Ending): ChildEnding => {
	switch (ending._tag) {
		case "Done":
			return { _tag: "Done", kind, output: ending.output }
		case "Completed":
			return { _tag: "Done", kind, output: ending.value }
		case "Failed":
			return { _tag: "Failed", kind }
		case "Stopped":
			return { _tag: "Stopped", kind }
	}
}

const scopeEnding = (state: State, scope: ScopeRow, ending: ScopeEnding): ChildEnding => {
	switch (ending) {
		case "Done":
			return Option.match(
				Option.flatMap(
					Option.flatMap(Arr.head(scope.finishes), (finish) => HashMap.get(state.steps, finish)),
					endingOf
				),
				{
					onNone: (): ChildEnding => ({ _tag: "Failed", kind: scope.kind }),
					onSome: (finished) => stepEnding(scope.kind, finished)
				}
			)
		case "Failed":
			return { _tag: "Failed", kind: scope.kind }
		case "Stopped":
			return { _tag: "Stopped", kind: scope.kind }
	}
}

const spawnOf = (child: StepChild, at: number): Spawn => {
	const work = child.work
	switch (work._tag) {
		case "Body":
			return { _tag: "Runs", lane: work.runs.lane.name }
		case "Await":
			return completionSpawn(work.completion, at)
	}
}

const completionSpawn = (completion: Completion, at: number): Spawn => {
	switch (completion._tag) {
		case "External":
			return { _tag: "Awaits" }
		case "Timer":
			return { _tag: "Timer", fires: at + completion.after }
	}
}

/**
 * The ledger's transitions under a set of rules. Each is a pure function of the state, the call and the ledger's
 * clock, and returns the state after, its answer and its trace entry. Every fact it adds is keyed by derived identity,
 * and a fact whose key is already held is no change, so a call made twice changes nothing the second time.
 */
export const ledgerOf = (rules: Rules) => {
	const spawnStep = (
		tx: Tx,
		id: StepId,
		scope: ScopeRow,
		child: StepChild,
		role: Role,
		at: number
	): void => {
		if (HashMap.has(tx.state().steps, stepText(id))) {
			return
		}
		tx.emit({
			_tag: "Spawn",
			fact: {
				_tag: "Spawned",
				step: id,
				kind: child.kind,
				input: child.input,
				scope: scope.id,
				spawn: spawnOf(child, at),
				at
			},
			child,
			role
		})
	}

	const startChildren = (tx: Tx, scope: ScopeRow, at: number): void => {
		Arr.forEach(scope.work.children, (child, ordinal) => {
			switch (child._tag) {
				case "StepChild":
					spawnStep(tx, { _tag: "StartStep", scope: scope.id, ordinal }, scope, child, "Child", at)
					return
				case "ScopeChild":
					openScope(tx, { _tag: "StartScope", scope: scope.id, ordinal }, scope, child, at)
			}
		})
		settle(tx, scope.text, at)
	}

	const openScope = (tx: Tx, id: ScopeId, owner: ScopeRow, child: ScopeChild, at: number): void => {
		const text = scopeText(id)
		if (HashMap.has(tx.state().scopes, text)) {
			return
		}
		tx.emit({
			_tag: "Open",
			fact: {
				_tag: "Opened",
				scope: id,
				kind: child.kind,
				input: child.input,
				owner: owner.id,
				at
			},
			work: child.scope
		})
		Option.match(HashMap.get(tx.state().scopes, text), {
			onNone: () => undefined,
			onSome: (opened) => startChildren(tx, opened, at)
		})
	}

	/** Spawns a scope's finish once every child ended, under the identity the rules give it. */
	const settle = (tx: Tx, text: string, at: number): void => {
		Option.match(HashMap.get(tx.state().scopes, text), {
			onNone: () => undefined,
			onSome: (scope) => {
				if (Option.isSome(scope.ending) || !rules.complete(scope, tx.state())) {
					return
				}
				Option.match(rules.finish(scope, tx.state()), {
					onNone: () => undefined,
					onSome: (id) => {
						const endings = endingsOf(tx.state(), scope)
						spawnStep(
							tx,
							id,
							scope,
							{
								_tag: "StepChild",
								kind: scope.kind,
								input: endingsDatum(endings),
								work: {
									_tag: "Body",
									runs: scope.work.finish.runs,
									run: (claimed) => scope.work.finish.run(endings, claimed)
								}
							},
							"Finish",
							at
						)
					}
				})
			}
		})
	}

	/** What follows a step's end: its scope's finish if it was the last child; its scope's end if it was the finish. */
	const endStep = (tx: Tx, text: string, at: number): void => {
		Option.match(HashMap.get(tx.state().steps, text), {
			onNone: () => undefined,
			onSome: (row) => {
				settle(tx, row.scope, at)
				if (row.role !== "Finish") {
					return
				}
				Option.match(HashMap.get(tx.state().scopes, row.scope), {
					onNone: () => undefined,
					onSome: (scope) => {
						tx.emit(
							plain({
								_tag: "Finished",
								scope: scope.id,
								ending: Option.exists(endingOf(row), (ending) => ending._tag === "Failed")
									? "Failed"
									: "Done",
								at
							})
						)
						Option.match(scope.owner, {
							onNone: () => undefined,
							onSome: (owner) => settle(tx, owner, at)
						})
					}
				})
			}
		})
	}

	/** The scope a step's edges start children in: its own, or, for a finish, the scope that owns its scope. */
	const targetOf = (state: State, row: StepRow): Option.Option<ScopeRow> => {
		const scope = HashMap.get(state.scopes, row.scope)
		return row.role === "Child"
			? scope
			: Option.flatMap(
					Option.flatMap(scope, (own) => own.owner),
					(owner) => HashMap.get(state.scopes, owner)
				)
	}

	const landNext = (tx: Tx, row: StepRow, next: ReadonlyArray<Next>, at: number): void => {
		Option.match(targetOf(tx.state(), row), {
			onNone: () => undefined,
			onSome: (scope) =>
				Arr.forEach(next, (item) => {
					switch (item._tag) {
						case "Spawn": {
							const ordinal = rules.ordinal(item.ordinal, tx.state())
							switch (item.child._tag) {
								case "StepChild":
									spawnStep(
										tx,
										{ _tag: "EdgeStep", by: row.id, edge: item.edge, ordinal },
										scope,
										item.child,
										"Child",
										at
									)
									return
								case "ScopeChild":
									openScope(
										tx,
										{ _tag: "EdgeScope", by: row.id, edge: item.edge, ordinal },
										scope,
										item.child,
										at
									)
									return
							}
						}
						case "Part":
							feedPart(tx, scope, row.id, item, at)
					}
				})
		})
	}

	const feedPart = (
		tx: Tx,
		scope: ScopeRow,
		parent: StepId,
		part: Extract<Next, Readonly<{ _tag: "Part" }>>,
		at: number
	): void => {
		const text = joinText(scope.text, part.feed.name, part.key)
		const arrived = Option.exists(HashMap.get(tx.state().joins, text), (join) =>
			HashMap.has(join.parts, part.role)
		)
		if (arrived) {
			return
		}
		tx.emit({
			_tag: "Join",
			fact: {
				_tag: "Fed",
				feed: part.feed.name,
				scope: scope.id,
				key: part.key,
				role: part.role,
				parent,
				value: part.value,
				at
			},
			feed: part.feed
		})
		Option.match(HashMap.get(tx.state().joins, text), {
			onNone: () => undefined,
			onSome: (join) => {
				if (Arr.every(part.feed.roles, (role) => HashMap.has(join.parts, role))) {
					spawnStep(
						tx,
						{ _tag: "JoinStep", scope: scope.id, feed: part.feed.name, key: part.key },
						scope,
						part.feed.join(new Map(HashMap.toEntries(join.parts))),
						"Child",
						at
					)
				}
			}
		})
	}

	const land = (tx: Tx, row: BodyRow, claim: number, settled: Settled, at: number): void => {
		switch (settled._tag) {
			case "Output":
				tx.emit(plain({ _tag: "Done", step: row.id, claim, output: settled.output, at }))
				Arr.forEach(settled.writes, (write) =>
					tx.emit(plain({ _tag: "Wrote", step: row.id, write, at }))
				)
				landNext(tx, row, settled.next, at)
				endStep(tx, row.text, at)
				return
			case "Failure":
				tx.emit(
					plain({
						_tag: "Failed",
						step: row.id,
						claim,
						failure: { _tag: "Refused", error: settled.error },
						at
					})
				)
				endStep(tx, row.text, at)
				return
			case "Retry": {
				const ceilings = row.runs.ceilings
				const counts: Counts =
					settled.counts === "wait" && row.waits + 1 <= ceilings.waits ? "wait" : "attempt"
				if (counts === "attempt" && rules.exhausted(row.attempts + 1, ceilings.attempts)) {
					tx.emit(
						plain({
							_tag: "Failed",
							step: row.id,
							claim,
							failure: { _tag: "AttemptsExhausted" },
							at
						})
					)
					endStep(tx, row.text, at)
					return
				}
				tx.emit(plain({ _tag: "Retried", step: row.id, claim, due: settled.at, counts, at }))
			}
		}
	}

	const settleAwait = (tx: Tx, row: AwaitRow, value: Datum, at: number): void => {
		tx.emit(plain({ _tag: "Completed", step: row.id, value, at }))
		landNext(tx, row, row.settle(value), at)
		endStep(tx, row.text, at)
	}

	/** Ends every unended step and scope under a scope `stopped`, innermost first, without starting any finish. */
	const stopTree = (tx: Tx, scope: ScopeRow, at: number): void => {
		Arr.forEach(scope.children, (child) => {
			switch (child._tag) {
				case "Step":
					stopStep(tx, child.text, at)
					return
				case "Scope":
					Option.match(HashMap.get(tx.state().scopes, child.text), {
						onNone: () => undefined,
						onSome: (inner) => {
							if (Option.isNone(inner.ending)) {
								stopTree(tx, inner, at)
							}
						}
					})
			}
		})
		Arr.forEach(scope.finishes, (finish) => stopStep(tx, finish, at))
		tx.emit(plain({ _tag: "Finished", scope: scope.id, ending: "Stopped", at }))
	}

	const stopStep = (tx: Tx, text: string, at: number): void => {
		Option.match(HashMap.get(tx.state().steps, text), {
			onNone: () => undefined,
			onSome: (row) => {
				if (Option.isNone(endingOf(row))) {
					tx.emit(plain({ _tag: "Stopped", step: row.id, at }))
				}
			}
		})
	}

	return {
		/** Admits a root under its key: no change while a root of that key is in the ledger. */
		admit: (state: State, admission: Admission, at: number): Answered => {
			const root: RootKey = { trigger: admission.trigger, key: admission.key }
			const command: Command = { _tag: "Admit", root, input: admission.input }
			const tx = begin(state)
			if (!HashMap.has(state.roots, rootText(root))) {
				tx.emit({
					_tag: "Admit",
					fact: { _tag: "Admitted", root, input: admission.input, at },
					work: admission.scope
				})
				Option.match(HashMap.get(tx.state().scopes, scopeText({ _tag: "RootScope", root })), {
					onNone: () => undefined,
					onSome: (scope) => startChildren(tx, scope, at)
				})
			}
			return committed(tx, at, command)
		},

		/**
		 * Claims a lane's earliest due step for a deployment: refused for a stale deployment, a paused lane, a closed
		 * window, a lane at its width or one with nothing due. A claim of a step whose lease ran out is a reclaim; one
		 * past the step's reclaim ceiling ends it failed instead.
		 */
		claim: (state: State, lane: Lane, deployment: number, at: number): ClaimAnswered => {
			const command: Command = { _tag: "Claim", lane: lane.name, deployment }
			const refuse = (answer: Answer): ClaimAnswered => ({
				...answered(state, at, command, answer),
				lease: Option.none()
			})
			if (!rules.serves(deployment, state.deployment)) {
				return refuse("stale")
			}
			if (HashSet.has(state.paused, lane.name)) {
				return refuse("paused")
			}
			if (!isOpenAt(lane.window, at)) {
				return refuse("closed")
			}
			const holds = liveHolds(state, lane.name, at)
			if (!rules.room(holds.length, lane.width)) {
				return refuse("at-width")
			}
			return Option.match(Arr.head(claimable(state, lane.name, at)), {
				onNone: () => refuse("idle"),
				onSome: (row): ClaimAnswered => {
					const tx = begin(state)
					const reclaims = row.reclaims + (row.phase._tag === "Held" ? 1 : 0)
					if (rules.exhausted(reclaims, row.runs.ceilings.reclaims)) {
						tx.emit(
							plain({
								_tag: "Failed",
								step: row.id,
								claim: row.claims,
								failure: { _tag: "ReclaimsExhausted" },
								at
							})
						)
						endStep(tx, row.text, at)
						return {
							state: tx.state(),
							answer: "exhausted",
							entry: entryOf(at, command, "exhausted", tx.events()),
							lease: Option.none()
						}
					}
					const slot = lowestFree(Arr.map(holds, (hold) => hold.slot))
					const until = at + row.runs.lease
					const token = state.minted
					tx.emit(
						plain({
							_tag: "Claimed",
							step: row.id,
							claim: row.claims,
							token,
							slot,
							until,
							deployment,
							at
						})
					)
					return {
						state: tx.state(),
						answer: "accepted",
						entry: entryOf(at, command, "accepted", tx.events()),
						lease: Option.some({
							step: row.id,
							text: row.text,
							claim: row.claims,
							token,
							until,
							runs: row.runs,
							run: row.run,
							claimed: { at, attempts: row.attempts, waits: row.waits, reclaims }
						})
					}
				}
			})
		},

		/**
		 * Commits a claim's report: the output, its writes and the children its edges take land together, or a failure,
		 * or a retry under the step's ceilings. A report that already landed is a re-run and changes nothing; a report
		 * whose claim is no longer the step's latest, or whose step already has another result, is lost.
		 */
		commit: (
			state: State,
			report: Readonly<{
				step: StepId
				claim: number
				token: number
				settled: Settled
				deployment: number
			}>,
			at: number
		): Answered => {
			const reported = reportedOf(report.settled)
			const command: Command = {
				_tag: "Commit",
				step: report.step,
				claim: report.claim,
				token: report.token,
				reported,
				deployment: report.deployment
			}
			if (!rules.serves(report.deployment, state.deployment)) {
				return answered(state, at, command, "stale")
			}
			return Option.match(HashMap.get(state.steps, stepText(report.step)), {
				onNone: () => answered(state, at, command, "gone"),
				onSome: (row): Answered => {
					if (row._tag !== "Body") {
						return answered(state, at, command, "lost")
					}
					const tx = begin(state)
					switch (rules.fence(row, report, reported)) {
						case "lost": {
							Arr.forEach(rules.lostWrites(reported), (write) =>
								tx.emit(plain({ _tag: "Wrote", step: row.id, write, at }))
							)
							return {
								state: tx.state(),
								answer: "lost",
								entry: entryOf(at, command, "lost", tx.events())
							}
						}
						case "rerun":
							if (report.settled._tag === "Output") {
								landNext(tx, row, report.settled.next, at)
							}
							return committed(tx, at, command)
						case "open":
							land(tx, row, report.claim, report.settled, at)
							return committed(tx, at, command)
					}
				}
			})
		},

		/** Completes an external await from outside: the first completion wins, the same one again is no change. */
		complete: (state: State, step: StepId, value: Datum, at: number): Answered => {
			const command: Command = { _tag: "Complete", step, value }
			return Option.match(HashMap.get(state.steps, stepText(step)), {
				onNone: () => answered(state, at, command, "gone"),
				onSome: (row): Answered => {
					if (row._tag !== "Await" || row.awaiting._tag !== "External") {
						return answered(state, at, command, "lost")
					}
					return Option.match(row.ending, {
						onSome: (ending) =>
							answered(
								state,
								at,
								command,
								ending._tag === "Completed" && Equal.equals(ending.value, value)
									? "unchanged"
									: "lost"
							),
						onNone: () => {
							const tx = begin(state)
							settleAwait(tx, row, value, at)
							return committed(tx, at, command)
						}
					})
				}
			})
		},

		/** Completes every timer whose instant has come, each with its instant. */
		fire: (state: State, at: number): Answered => {
			const tx = begin(state)
			Arr.forEach(dueTimers(state, at), (row) => {
				Option.match(HashMap.get(tx.state().steps, row.text), {
					onNone: () => undefined,
					onSome: (current) => {
						if (
							current._tag === "Await" &&
							Option.isNone(current.ending) &&
							current.awaiting._tag === "Timer"
						) {
							settleAwait(tx, current, current.awaiting.fires, at)
						}
					}
				})
			})
			return committed(tx, at, { _tag: "Fire" })
		},

		/**
		 * Stops a scope: every unended step and scope under it ends `stopped`, the scope finishes stopped without its
		 * finish, and the scope that owns it carries on. A holder's later commit finds its step ended and is lost.
		 */
		stop: (state: State, scope: ScopeId, at: number): Answered => {
			const command: Command = { _tag: "Stop", scope }
			return Option.match(HashMap.get(state.scopes, scopeText(scope)), {
				onNone: () => answered(state, at, command, "gone"),
				onSome: (row): Answered => {
					if (Option.isSome(row.ending)) {
						return answered(state, at, command, "unchanged")
					}
					const tx = begin(state)
					stopTree(tx, row, at)
					Option.match(row.owner, {
						onNone: () => undefined,
						onSome: (owner) => settle(tx, owner, at)
					})
					return committed(tx, at, command)
				}
			})
		},

		/** Pauses a lane: its claims are refused until it is resumed, and nothing it holds is lost. */
		pause: (state: State, lane: string, at: number): Answered => {
			const tx = begin(state)
			if (!HashSet.has(state.paused, lane)) {
				tx.emit(plain({ _tag: "Paused", lane, at }))
			}
			return committed(tx, at, { _tag: "Pause", lane })
		},

		/** Resumes a paused lane. */
		resume: (state: State, lane: string, at: number): Answered => {
			const tx = begin(state)
			if (HashSet.has(state.paused, lane)) {
				tx.emit(plain({ _tag: "Resumed", lane, at }))
			}
			return committed(tx, at, { _tag: "Resume", lane })
		},

		/** Retires a finished root's graph whole; a root still running is refused `live`. */
		retire: (state: State, root: RootKey, at: number): Answered => {
			const command: Command = { _tag: "Retire", root }
			return Option.match(HashMap.get(state.roots, rootText(root)), {
				onNone: () => answered(state, at, command, "gone"),
				onSome: (row): Answered => {
					const finished = Option.exists(HashMap.get(state.scopes, row.scope), (scope) =>
						Option.isSome(scope.ending)
					)
					if (!finished) {
						return answered(state, at, command, "live")
					}
					const tx = begin(state)
					tx.emit(plain({ _tag: "Retired", root, at }))
					return committed(tx, at, command)
				}
			})
		},

		/** Makes a new deployment the current one. */
		deploy: (state: State, at: number): Answered => {
			const tx = begin(state)
			tx.emit(plain({ _tag: "Deployed", deployment: state.deployment + 1, at }))
			return committed(tx, at, { _tag: "Deploy" })
		}
	}
}

/** The ledger's transitions under a set of rules. */
export type Ledger = ReturnType<typeof ledgerOf>

/** The lowest slot no live claim holds. */
const lowestFree = (held: ReadonlyArray<number>): number => {
	let slot = 0
	while (Arr.contains(held, slot)) {
		slot += 1
	}
	return slot
}

/** A finish's input as data: its children's endings, in order. */
const endingsDatum = (endings: ReadonlyArray<ChildEnding>): Datum =>
	Arr.map(endings, (ending): Datum => {
		switch (ending._tag) {
			case "Done":
				return { ending: "Done", kind: ending.kind, output: ending.output }
			case "Failed":
			case "Stopped":
				return { ending: ending._tag, kind: ending.kind }
		}
	})

/** The timers whose instant has come, not yet completed. */
export const dueTimers = (state: State, at: number): ReadonlyArray<AwaitRow> =>
	Arr.flatMap(HashMap.toValues(state.steps), (row): ReadonlyArray<AwaitRow> =>
		row._tag === "Await" &&
		Option.isNone(row.ending) &&
		row.awaiting._tag === "Timer" &&
		row.awaiting.fires <= at
			? [row]
			: []
	)
