import { Array as Arr, Equal, HashMap, HashSet, Option, Order } from "effect"
import { type Datum, textOf } from "#datum.ts"
import {
	type Answer,
	type By,
	type Command,
	type Entry,
	type Fact,
	type Failure,
	type Holder,
	holderText,
	type Reported,
	type ScopeEnding,
	type SeatKey,
	seatText,
	type Taken,
	type Target,
	targetText
} from "#facts.ts"
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
import {
	type Admission,
	type ChildEnding,
	type Claimed,
	type Counts,
	isOpenAt,
	type Ladder,
	type Next,
	ordinals,
	type Query,
	type Read,
	type Resource,
	type Row,
	type Runs,
	type ScopeChild,
	type ScopeWork,
	type Settled,
	type StepChild,
	type Window,
	type Write
} from "#program.ts"

/** How a step ended, as its row holds it: the facts that ended it, folded. */
export type Ending =
	| Readonly<{ _tag: "Done"; attempt: number; output: Datum; writes: ReadonlyArray<Write> }>
	| Readonly<{ _tag: "Failed"; attempt: number; failure: Failure }>

/** A claim in force: its number, the turn that holds it, the instant its lease ends, and the deployment that took it. */
export type Hold = Readonly<{ attempt: number; turn: string; until: number; deployment: number }>

/**
 * Where a step stands: due at an instant (`since` the instant the fact that made it due committed), held by its latest
 * claim (whose lease may have run out, which makes it due again at `until` and its next claim a reclaim), or ended.
 */
export type Phase =
	| Readonly<{ _tag: "Due"; at: number; since: number }>
	| Readonly<{ _tag: "Held"; hold: Hold }>
	| Readonly<{ _tag: "Ended"; ending: Ending }>

/** Whether a step is one of its scope's children or the scope's finish. */
export type Role = "Child" | "Finish"

/**
 * A step's row: its identity, kind, input, owning scope (fixed at spawn), its root's row (fixed at its admission) and
 * role; its work; where it stands; its claims so far, the attempts and waits it spent; and the retry its latest claim
 * committed, if one did.
 */
export type StepRow = Readonly<{
	id: StepId
	text: string
	kind: string
	input: Datum
	scope: string
	rooted: RootRow
	role: Role
	runs: Runs
	reads: ReadonlyArray<Read>
	run: (claimed: Claimed) => Settled
	phase: Phase
	claims: number
	attempts: number
	waits: number
	retried: Option.Option<Readonly<{ attempt: number; at: number; counts: Counts }>>
}>

/** A scope's child, by the kind of row it is and its key. */
export type ChildRef = Readonly<{ _tag: "Step" | "Scope"; text: string }>

/**
 * A scope's row: its identity, kind, its root's row (fixed at its admission) and owner, its work, its children so far,
 * its finishes and its ending.
 */
export type ScopeRow = Readonly<{
	id: ScopeId
	text: string
	kind: string
	rooted: RootRow
	owner: Option.Option<string>
	work: ScopeWork
	children: ReadonlyArray<ChildRef>
	finishes: ReadonlyArray<string>
	ending: Option.Option<ScopeEnding>
}>

/**
 * A root's row: its key, its kind, its scope, its age (its admission's place among every admission), the key of the
 * exclusivity seat its run holds, and the window its steps run in.
 */
export type RootRow = Readonly<{
	key: RootKey
	text: string
	kind: string
	scope: string
	age: number
	exclusive: Option.Option<string>
	window: Option.Option<Window>
}>

/** A seat's row: the seat and its holder. A seat with no row is free. */
export type SeatRow = Readonly<{ seat: SeatKey; holder: Holder }>

/**
 * What an app's or an operator's root was requested with: its kind's input heading at its first request, and its
 * input's canonical text. A key names one input under one heading.
 */
export type Requested = Readonly<{ heading: string; input: string }>

/**
 * The ledger's state: a projection of the facts it holds, keyed by canonical text. The retired root keys, which never
 * recur, survive their graphs, and so do what each root was requested with and the app's own relations, which steps'
 * writes and the app's transactions land in.
 */
export type State = Readonly<{
	roots: HashMap.HashMap<string, RootRow>
	retired: HashSet.HashSet<string>
	requested: HashMap.HashMap<string, Requested>
	scopes: HashMap.HashMap<string, ScopeRow>
	steps: HashMap.HashMap<string, StepRow>
	seats: HashMap.HashMap<string, SeatRow>
	paused: HashSet.HashSet<string>
	deployment: number
	admitted: number
	app: HashMap.HashMap<string, HashMap.HashMap<string, Datum>>
}>

/** The empty ledger, under deployment 0. */
export const emptyState: State = {
	roots: HashMap.empty(),
	retired: HashSet.empty(),
	requested: HashMap.empty(),
	scopes: HashMap.empty(),
	steps: HashMap.empty(),
	seats: HashMap.empty(),
	paused: HashSet.empty(),
	deployment: 0,
	admitted: 0,
	app: HashMap.empty()
}

type FactOf<T extends Fact["_tag"]> = Extract<Fact, Readonly<{ _tag: T }>>

/** A fact that starts nothing new. */
type PlainFact = Exclude<Fact, Readonly<{ _tag: "Admitted" | "Opened" | "Spawned" }>>

/**
 * A fact as the ledger applies it: the facts that start something carry the rows they start, built where the call is
 * made with the work their typed code erased, which the trace leaves out.
 */
type Event =
	| Readonly<{
			_tag: "Admit"
			fact: FactOf<"Admitted">
			root: RootRow
			scope: ScopeRow
			requested: Option.Option<Requested>
	  }>
	| Readonly<{ _tag: "Open"; fact: FactOf<"Opened">; scope: ScopeRow }>
	| Readonly<{ _tag: "Spawn"; fact: FactOf<"Spawned">; row: StepRow }>
	| Readonly<{ _tag: "Plain"; fact: PlainFact }>

/** A step's ending, if it ended. */
export const endingOf = (row: StepRow): Option.Option<Ending> =>
	row.phase._tag === "Ended" ? Option.some(row.phase.ending) : Option.none()

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

const ended = (row: StepRow, ending: Ending): StepRow => ({
	...row,
	phase: { _tag: "Ended", ending }
})

const scopeRowOf = (
	id: ScopeId,
	kind: string,
	rooted: RootRow,
	owner: Option.Option<string>,
	work: ScopeWork
): ScopeRow => ({
	id,
	text: scopeText(id),
	kind,
	rooted,
	owner,
	work,
	children: [],
	finishes: [],
	ending: Option.none()
})

/** The root a holder belongs to. */
const rootOfHolder = (holder: Holder): string => {
	switch (holder._tag) {
		case "Claim":
			return rootText(rootOfStep(holder.step))
		case "Scope":
			return rootText(rootOfScope(holder.scope))
	}
}

const spawnedRow = (
	fact: FactOf<"Spawned">,
	child: StepChild,
	role: Role,
	rooted: RootRow
): StepRow => ({
	id: fact.step,
	text: stepText(fact.step),
	kind: fact.kind,
	input: fact.input,
	scope: scopeText(fact.scope),
	rooted,
	role,
	runs: child.work.runs,
	reads: child.work.reads,
	run: child.work.run,
	phase: { _tag: "Due", at: fact.due, since: fact.at },
	claims: 0,
	attempts: 0,
	waits: 0,
	retried: Option.none()
})

/** The ledger's state after one more fact: the one place a fact's meaning is written. */
const apply = (state: State, event: Event): State => {
	switch (event._tag) {
		case "Admit":
			return {
				...state,
				roots: HashMap.set(state.roots, event.root.text, event.root),
				requested: Option.match(event.requested, {
					onNone: () => state.requested,
					onSome: (requested) => HashMap.set(state.requested, event.root.text, requested)
				}),
				admitted: state.admitted + 1,
				scopes: HashMap.set(state.scopes, event.scope.text, event.scope)
			}
		case "Open": {
			const text = event.scope.text
			const opened: State = { ...state, scopes: HashMap.set(state.scopes, text, event.scope) }
			return withScope(opened, scopeText(event.fact.owner), (row) => ({
				...row,
				children: Arr.append(row.children, { _tag: "Scope", text })
			}))
		}
		case "Spawn": {
			const row = event.row
			return withScope(
				{ ...state, steps: HashMap.set(state.steps, row.text, row) },
				row.scope,
				(owner) =>
					row.role === "Child"
						? { ...owner, children: Arr.append(owner.children, { _tag: "Step", text: row.text }) }
						: { ...owner, finishes: Arr.append(owner.finishes, row.text) }
			)
		}
		case "Plain":
			return applyPlain(state, event.fact)
	}
}

const applyPlain = (state: State, fact: PlainFact): State => {
	switch (fact._tag) {
		case "Claimed":
			return withStep(state, stepText(fact.step), (row) => ({
				...row,
				phase: {
					_tag: "Held",
					hold: {
						attempt: fact.attempt,
						turn: fact.turn,
						until: fact.until,
						deployment: fact.deployment
					}
				},
				claims: row.claims + 1,
				attempts: row.attempts + (row.phase._tag === "Held" ? 1 : 0)
			}))
		case "Read":
			return state
		case "Seated":
			return {
				...state,
				seats: HashMap.set(state.seats, seatText(fact.seat), {
					seat: fact.seat,
					holder: fact.holder
				})
			}
		case "Unseated": {
			const text = seatText(fact.seat)
			const held = Option.exists(
				HashMap.get(state.seats, text),
				(row) => holderText(row.holder) === holderText(fact.holder)
			)
			return held ? { ...state, seats: HashMap.remove(state.seats, text) } : state
		}
		case "Retried":
			return withStep(state, stepText(fact.step), (row) => ({
				...row,
				phase: { _tag: "Due", at: fact.due, since: fact.at },
				attempts: row.attempts + (fact.counts === "attempt" ? 1 : 0),
				waits: row.waits + (fact.counts === "wait" ? 1 : 0),
				retried: Option.some({ attempt: fact.attempt, at: fact.due, counts: fact.counts })
			}))
		case "Done":
			return withStep(state, stepText(fact.step), (row) =>
				ended(row, { _tag: "Done", attempt: fact.attempt, output: fact.output, writes: [] })
			)
		case "Wrote": {
			const relation = Option.getOrElse(HashMap.get(state.app, fact.write.relation), () =>
				HashMap.empty<string, Datum>()
			)
			const app = HashMap.set(
				state.app,
				fact.write.relation,
				HashMap.set(relation, fact.write.key, fact.write.value)
			)
			switch (fact.writer._tag) {
				case "App":
					return { ...state, app }
				case "Step":
					return {
						...withStep(state, stepText(fact.writer.step), (row) =>
							row.phase._tag === "Ended" && row.phase.ending._tag === "Done"
								? ended(row, {
										...row.phase.ending,
										writes: Arr.append(row.phase.ending.writes, fact.write)
									})
								: row
						),
						app
					}
			}
		}
		case "Failed":
			return withStep(state, stepText(fact.step), (row) =>
				ended(row, { _tag: "Failed", attempt: fact.attempt, failure: fact.failure })
			)
		case "Finished":
			return withScope(state, scopeText(fact.scope), (row) => ({
				...row,
				ending: Option.some(fact.ending)
			}))
		case "Paused":
			return { ...state, paused: HashSet.add(state.paused, targetText(fact.target)) }
		case "Resumed":
			return { ...state, paused: HashSet.remove(state.paused, targetText(fact.target)) }
		case "Deployed":
			return { ...state, deployment: fact.deployment }
		case "Retired": {
			const root = rootText(fact.root)
			const kept = <R extends Readonly<{ rooted: RootRow }>>(rows: HashMap.HashMap<string, R>) =>
				HashMap.filter(rows, (row) => row.rooted.text !== root)
			return {
				...state,
				roots: HashMap.remove(state.roots, root),
				retired: HashSet.add(state.retired, root),
				scopes: kept(state.scopes),
				steps: kept(state.steps),
				seats: HashMap.filter(state.seats, (row) => rootOfHolder(row.holder) !== root)
			}
		}
	}
}

/** Whether a commit may land, is a re-run of what already landed, or is lost. */
export type Fence = "open" | "rerun" | "lost"

/** Whether a call from a deployment is served: only the current deployment's is. */
const serves = (caller: number, current: number): boolean => caller === current

/** Whether a claim whose lease ends at `until` has lapsed at `at`, so its seats are free. */
const leaseLapsed = (until: number, at: number): boolean => until <= at

/** Whether `spent` attempts end a ladder, so the step fails: a ladder of attempts ends at its count, and `Never` never. */
const exhausted = (spent: number, ladder: Ladder): boolean => {
	switch (ladder._tag) {
		case "Attempts":
			return spent >= ladder.attempts
		case "Never":
			return false
	}
}

/** Whether an ending is the one a claim's report would land: the same claim, the same output and writes, or failure. */
const isLanded = (ending: Ending, attempt: number, reported: Reported): boolean => {
	if (ending.attempt !== attempt) {
		return false
	}
	switch (ending._tag) {
		case "Done":
			return (
				reported._tag === "Output" &&
				Equal.equals(ending.output, reported.output) &&
				Equal.equals(ending.writes, reported.writes)
			)
		case "Failed":
			switch (ending.failure._tag) {
				case "Refused":
					return reported._tag === "Failure" && Equal.equals(ending.failure.error, reported.error)
				case "LadderEnded":
					return ending.failure.last === "retried" && reported._tag === "Retry"
			}
	}
}

/**
 * The fence, on the claim's key `(step, attempt)` alone: a commit lands only on the step's latest claim while it holds
 * no result, whatever its lease; the same report again is a re-run; anything else is lost. Sound because retired keys
 * never recur: a step key names one step for ever, so its claim `attempt` is one claim, one holder.
 */
const fence = (row: StepRow, attempt: number, reported: Reported): Fence => {
	switch (row.phase._tag) {
		case "Ended":
			return isLanded(row.phase.ending, attempt, reported) ? "rerun" : "lost"
		case "Held":
			return row.phase.hold.attempt === attempt ? "open" : "lost"
		case "Due":
			return Option.exists(
				row.retried,
				(retried) =>
					retried.attempt === attempt &&
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

/** Whether every child of a scope has ended, so its finish is due. */
const complete = (scope: ScopeRow, state: State): boolean =>
	Arr.every(scope.children, (child) => childEnded(state, child))

/** Whether a root may be retired: its scope has ended, so nothing of its graph still runs. */
const retirable = (state: State, root: RootRow): boolean =>
	Option.exists(HashMap.get(state.scopes, root.scope), (scope) => Option.isSome(scope.ending))

/** The finish a complete scope spawns, keyed by its scope alone: none once it has one. */
const finishOf = (scope: ScopeRow): Option.Option<StepId> =>
	Arr.isReadonlyArrayEmpty(scope.finishes)
		? Option.some({ _tag: "FinishStep", scope: scope.id })
		: Option.none()

/** One call's answer: the ledger after it, how it answered, and the trace entry it adds. */
export type Answered = Readonly<{ state: State; answer: Answer; entry: Entry }>

/**
 * What a won claim hands its holder: the step, the claim's number, the turn holding it, its lease's end, how it runs,
 * its work, what its body sees, and the reads it took as data, which the holder's commit records with its result.
 */
export type Lease = Readonly<{
	step: StepId
	text: string
	attempt: number
	turn: string
	until: number
	runs: Runs
	run: (claimed: Claimed) => Settled
	claimed: Claimed
	taken: ReadonlyArray<Taken>
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

const plain = (fact: PlainFact): Event => ({ _tag: "Plain", fact })

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

/** A transaction's answer when it decided the answer itself. */
const decided = (tx: Tx, at: number, command: Command, answer: Answer): Answered => ({
	state: tx.state(),
	answer,
	entry: entryOf(at, command, answer, tx.events())
})

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

/** The instant a step is due: its due instant, or its lease's end once a claim holds it. */
export const dueAtOf = (row: StepRow): Option.Option<number> => {
	switch (row.phase._tag) {
		case "Due":
			return Option.some(row.phase.at)
		case "Held":
			return Option.some(row.phase.hold.until)
		case "Ended":
			return Option.none()
	}
}

/**
 * The rows a declared read returns, by key: an app relation's, all of them or the one row of its key; or the steps not
 * yet ended under roots of some kinds, a precondition's quiescence.
 */
export const rowsOf = (state: State, query: Query): ReadonlyArray<Row> => {
	switch (query._tag) {
		case "Rows": {
			const relation = Option.getOrElse(HashMap.get(state.app, query.relation), () =>
				HashMap.empty<string, Datum>()
			)
			return Option.match(query.key, {
				onNone: () =>
					Arr.sort(
						Arr.map(HashMap.toEntries(relation), ([key, value]): Row => ({ key, value })),
						BY_KEY
					),
				onSome: (key) =>
					Option.match(HashMap.get(relation, key), {
						onNone: () => [],
						onSome: (value) => [{ key, value }]
					})
			})
		}
		case "Pending":
			return Arr.sort(
				Arr.flatMap(HashMap.toValues(state.steps), (row): ReadonlyArray<Row> =>
					Option.isNone(endingOf(row)) && Arr.contains(query.roots, row.rooted.kind)
						? [{ key: row.text, value: row.kind }]
						: []
				),
				BY_KEY
			)
	}
}

const BY_KEY: Order.Order<Row> = Order.mapInput(Order.String, (row: Row) => row.key)

/** Rows as the datum a `Read` fact records. */
export const rowsDatum = (rows: ReadonlyArray<Row>): Datum =>
	Arr.map(rows, (row): Datum => ({ key: row.key, value: row.value }))

/** The seat keys of a resource, `"0" … "<seats − 1>"`. */
export const seatsOf = (resource: Resource): ReadonlyArray<SeatKey> =>
	Arr.map(ordinals(resource.seats), (seat) => ({ resource: resource.name, seat: `${seat}` }))

/**
 * Where a step stands for a claim at an instant: eligible, with the seat of each resource it would take, or refused
 * with the answer a claim gets.
 */
export type Standing =
	| Readonly<{ _tag: "Eligible"; seats: ReadonlyArray<SeatKey> }>
	| Readonly<{ _tag: "Refused"; answer: Answer }>

/** A step that could run at an instant but for the seats it needs, and when it is due: what order ranks. */
type Candidate = Readonly<{ row: StepRow; age: number; due: number }>

/**
 * The order contended seats are given in, durable and the same for every resource: the oldest root first, then the
 * earliest due, then the step's key, so nothing starves and there are no priority or fairness keys.
 */
const BY_ORDER: Order.Order<Candidate> = Order.combine(
	Order.combine(
		Order.mapInput(Order.Number, (candidate: Candidate) => candidate.age),
		Order.mapInput(Order.Number, (candidate: Candidate) => candidate.due)
	),
	Order.mapInput(Order.String, (candidate: Candidate) => candidate.row.text)
)

/** Whether a seat is held: by a scope for its life, or by a claim still its step's latest whose lease runs on. */
const busy = (state: State, seat: SeatKey, at: number): boolean =>
	Option.exists(HashMap.get(state.seats, seatText(seat)), (row) => {
		const holder = row.holder
		switch (holder._tag) {
			case "Scope":
				return true
			case "Claim":
				return Option.exists(
					HashMap.get(state.steps, stepText(holder.step)),
					(step) =>
						step.phase._tag === "Held" &&
						step.phase.hold.attempt === holder.attempt &&
						!leaseLapsed(step.phase.hold.until, at)
				)
		}
	})

/** The free seats of a resource at an instant, lowest first. */
const freeOf = (state: State, resource: Resource, at: number): ReadonlyArray<SeatKey> =>
	Arr.filter(seatsOf(resource), (seat) => !busy(state, seat, at))

/** Whether the window of a step's root, if its kind carries one, is open at an instant. */
const windowOpen = (row: StepRow, at: number): boolean =>
	Option.match(row.rooted.window, { onNone: () => true, onSome: (window) => isOpenAt(window, at) })

const touchesPaused = (state: State, row: StepRow): boolean =>
	HashSet.has(state.paused, targetText({ _tag: "Root", kind: row.rooted.kind })) ||
	Arr.some(row.runs.holds, (resource) =>
		HashSet.has(state.paused, targetText({ _tag: "Resource", name: resource.name }))
	)

/** Where a step stands at an instant before seats are counted: a candidate for seats, or refused. */
const before = (state: State, row: StepRow, at: number): Option.Option<Answer> => {
	switch (row.phase._tag) {
		case "Ended":
			return Option.some("lost")
		case "Held":
			if (row.phase.hold.until > at) {
				return Option.some("lost")
			}
			break
		case "Due":
			if (row.phase.at > at) {
				return Option.some("early")
			}
	}
	if (!windowOpen(row, at)) {
		return Option.some("closed")
	}
	return touchesPaused(state, row) ? Option.some("paused") : Option.none()
}

/** Every step that could run at an instant but for its seats, in order. */
const candidatesOf = (state: State, at: number): ReadonlyArray<Candidate> =>
	Arr.sort(
		Arr.flatMap(HashMap.toValues(state.steps), (row): ReadonlyArray<Candidate> =>
			Option.isSome(before(state, row, at))
				? []
				: [
						{
							row,
							age: row.rooted.age,
							due: Option.getOrElse(dueAtOf(row), () => at)
						}
					]
		),
		BY_ORDER
	)

/**
 * Every candidate's standing at an instant, in order: a step may take a seat of a resource only while fewer
 * candidates ahead of it hold that resource than it has free seats, so older work is never overtaken.
 */
const ranked = (
	state: State,
	at: number
): ReadonlyArray<Readonly<{ row: StepRow; standing: Standing }>> => {
	const free = new Map<string, ReadonlyArray<SeatKey>>()
	const ahead = new Map<string, number>()
	return Arr.map(candidatesOf(state, at), ({ row }) => {
		const seats = Arr.map(row.runs.holds, (resource) => {
			const known = free.get(resource.name)
			const open = known ?? freeOf(state, resource, at)
			free.set(resource.name, open)
			const rank = ahead.get(resource.name) ?? 0
			ahead.set(resource.name, rank + 1)
			return { open, rank }
		})
		const full = Arr.some(seats, (seat) => Arr.isReadonlyArrayEmpty(seat.open))
		const behind = Arr.some(seats, (seat) => seat.rank >= seat.open.length)
		const standing: Standing = full
			? { _tag: "Refused", answer: "full" }
			: behind
				? { _tag: "Refused", answer: "behind" }
				: {
						_tag: "Eligible",
						seats: Arr.flatMap(seats, (seat) => Arr.take(seat.open, 1))
					}
		return { row, standing }
	})
}

/** Where one step stands at an instant. */
const standingOf = (state: State, row: StepRow, at: number): Standing =>
	Option.match(before(state, row, at), {
		onSome: (answer): Standing => ({ _tag: "Refused", answer }),
		onNone: () =>
			Option.match(
				Arr.findFirst(ranked(state, at), (ranking) => ranking.row.text === row.text),
				{
					onNone: (): Standing => ({ _tag: "Refused", answer: "lost" }),
					onSome: (ranking) => ranking.standing
				}
			)
	})

/** The steps eligible at an instant, in order: what the relay and the census ring. */
const eligibleAt = (state: State, at: number): ReadonlyArray<StepRow> =>
	Arr.flatMap(ranked(state, at), (ranking) =>
		ranking.standing._tag === "Eligible" ? [ranking.row] : []
	)

/**
 * The ledger's reads of where steps stand: whether a seat is free, and where a step stands at an instant, by the proposal's eligibility (its parent ended, its due instant passed, every
 * window open, nothing it touches paused, a seat of every resource it holds free) and order.
 */
const standings = { busy, standingOf, eligibleAt } as const

/** The ending each child of a scope reads as, for its finish: done with its output, or failed. */
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
		case "Failed":
			return { _tag: "Failed", kind }
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
		case "Held":
			return { _tag: "Failed", kind: scope.kind }
	}
}

/** A finish's input as data: its children's endings, in order. */
const endingsDatum = (endings: ReadonlyArray<ChildEnding>): Datum =>
	Arr.map(endings, (ending): Datum => {
		switch (ending._tag) {
			case "Done":
				return { ending: "Done", kind: ending.kind, output: ending.output }
			case "Failed":
				return { ending: "Failed", kind: ending.kind }
		}
	})

/** The seat a root's exclusivity takes, keyed by its kind and the value its input names, if its kind is exclusive. */
const exclusiveSeat = (kind: string, exclusive: Option.Option<string>): Option.Option<SeatKey> =>
	Option.map(exclusive, (key) => ({ resource: kind, seat: key }))

const BY_SEAT: Order.Order<SeatRow> = Order.mapInput(Order.String, (row: SeatRow) =>
	seatText(row.seat)
)

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
	const fact: FactOf<"Spawned"> = {
		_tag: "Spawned",
		step: id,
		kind: child.kind,
		input: child.input,
		scope: scope.id,
		due: child.due._tag === "At" ? child.due.at : at,
		holds: Arr.map(child.work.runs.holds, (resource) => resource.name),
		at
	}
	tx.emit({ _tag: "Spawn", fact, row: spawnedRow(fact, child, role, scope.rooted) })
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

/** Opens a child scope under its derived identity, and starts its children. */
const openScope = (tx: Tx, id: ScopeId, owner: ScopeRow, child: ScopeChild, at: number): void => {
	const text = scopeText(id)
	if (HashMap.has(tx.state().scopes, text)) {
		return
	}
	const opened = scopeRowOf(id, child.kind, owner.rooted, Option.some(owner.text), child.scope)
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
		scope: opened
	})
	startChildren(tx, opened, at)
}

/** Gives back a root scope's exclusivity seat, if it still holds it. */
const unseatScope = (tx: Tx, scope: ScopeRow, at: number): void => {
	const root = scope.rooted
	Option.match(
		root.scope === scope.text ? exclusiveSeat(root.kind, root.exclusive) : Option.none(),
		{
			onNone: () => undefined,
			onSome: (seat) => {
				const holder: Holder = { _tag: "Scope", scope: scope.id }
				if (
					Option.exists(
						HashMap.get(tx.state().seats, seatText(seat)),
						(row) => holderText(row.holder) === holderText(holder)
					)
				) {
					tx.emit(plain({ _tag: "Unseated", seat, holder, at }))
				}
			}
		}
	)
}

/** Gives back every seat a claim still holds, in seat order. */
const giveBack = (tx: Tx, step: StepId, attempt: number, at: number): void => {
	const holder: Holder = { _tag: "Claim", step, attempt }
	const text = holderText(holder)
	Arr.forEach(
		Arr.sort(
			Arr.filter(HashMap.toValues(tx.state().seats), (row) => holderText(row.holder) === text),
			BY_SEAT
		),
		(row) => tx.emit(plain({ _tag: "Unseated", seat: row.seat, holder, at }))
	)
}

/** Spawns a scope's finish once every child ended, under the identity the rules give it. */
const settle = (tx: Tx, text: string, at: number): void => {
	Option.match(HashMap.get(tx.state().scopes, text), {
		onNone: () => undefined,
		onSome: (scope) => {
			if (Option.isSome(scope.ending) || !complete(scope, tx.state())) {
				return
			}
			Option.match(finishOf(scope), {
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
							due: { _tag: "Now" },
							work: {
								runs: scope.work.finish.runs,
								reads: [],
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
					unseatScope(tx, scope, at)
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
				const ordinal = item.ordinal
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
				}
			})
	})
}

/** Records a claim's reads with its result, in the commit that lands it. */
const recordReads = (
	tx: Tx,
	row: StepRow,
	attempt: number,
	reads: ReadonlyArray<Taken>,
	at: number
): void =>
	Arr.forEach(reads, (read) =>
		tx.emit(
			plain({
				_tag: "Read",
				reader: { _tag: "Claim", step: row.id, attempt },
				name: read.name,
				query: read.query,
				value: read.value,
				at
			})
		)
	)

const land = (
	tx: Tx,
	row: StepRow,
	attempt: number,
	settled: Settled,
	reads: ReadonlyArray<Taken>,
	at: number
): void => {
	switch (settled._tag) {
		case "Output":
			tx.emit(plain({ _tag: "Done", step: row.id, attempt, output: settled.output, at }))
			recordReads(tx, row, attempt, reads, at)
			giveBack(tx, row.id, attempt, at)
			Arr.forEach(settled.writes, (write) =>
				tx.emit(plain({ _tag: "Wrote", writer: { _tag: "Step", step: row.id }, write, at }))
			)
			landNext(tx, row, settled.next, at)
			endStep(tx, row.text, at)
			return
		case "Failure":
			tx.emit(
				plain({
					_tag: "Failed",
					step: row.id,
					attempt,
					failure: { _tag: "Refused", error: settled.error },
					at
				})
			)
			recordReads(tx, row, attempt, reads, at)
			giveBack(tx, row.id, attempt, at)
			endStep(tx, row.text, at)
			return
		case "Retry":
			if (settled.counts === "attempt" && exhausted(row.attempts + 1, row.runs.ladder)) {
				tx.emit(
					plain({
						_tag: "Failed",
						step: row.id,
						attempt,
						failure: { _tag: "LadderEnded", last: "retried" },
						at
					})
				)
				recordReads(tx, row, attempt, reads, at)
				giveBack(tx, row.id, attempt, at)
				endStep(tx, row.text, at)
				return
			}
			tx.emit(
				plain({
					_tag: "Retried",
					step: row.id,
					attempt,
					due: settled.at,
					counts: settled.counts,
					at
				})
			)
			giveBack(tx, row.id, attempt, at)
	}
}

/**
 * Admits a root into a transaction under its key, behind what its key was requested with, its key race, its retired
 * key and its precondition's read; a root whose exclusivity seat another live run holds is recorded and ends `Held` at
 * once, so its night is skipped under its key, and answers how it went. A key requested with another input under the
 * same heading `differs`; under another heading, after a deploy that changed the kind's input, it is the same keyed
 * act, answered as its root stands.
 */
const admitInto = (tx: Tx, admission: Admission, by: By, at: number): Answer => {
	const root: RootKey = { kind: admission.kind, key: admission.key }
	const text = rootText(root)
	const state = tx.state()
	const input = textOf(admission.input)
	if (
		Option.exists(
			HashMap.get(state.requested, text),
			(held) => Option.contains(admission.heading, held.heading) && held.input !== input
		)
	) {
		return "differs"
	}
	if (HashMap.has(state.roots, text)) {
		return "unchanged"
	}
	if (HashSet.has(state.retired, text)) {
		return "retired"
	}
	const precondition = Option.map(admission.precondition, (query) => ({
		query,
		rows: rowsOf(state, query)
	}))
	if (Option.exists(precondition, (read) => Arr.isReadonlyArrayNonEmpty(read.rows))) {
		return "blocked"
	}
	const seat = exclusiveSeat(admission.kind, admission.exclusive)
	const held = Option.exists(seat, (key) => standings.busy(state, key, at))
	const scope: ScopeId = { _tag: "RootScope", root }
	const rooted: RootRow = {
		key: root,
		text,
		kind: root.kind,
		scope: scopeText(scope),
		age: state.admitted,
		exclusive: admission.exclusive,
		window: admission.window
	}
	const scoped = scopeRowOf(scope, root.kind, rooted, Option.none(), admission.scope)
	tx.emit({
		_tag: "Admit",
		fact: {
			_tag: "Admitted",
			root,
			input: admission.input,
			exclusive: admission.exclusive,
			by,
			at
		},
		root: rooted,
		scope: scoped,
		requested: Option.map(admission.heading, (heading) => ({ heading, input }))
	})
	Option.match(precondition, {
		onNone: () => undefined,
		onSome: (read) =>
			tx.emit(
				plain({
					_tag: "Read",
					reader: { _tag: "Admission", root },
					name: "precondition",
					query: read.query,
					value: rowsDatum(read.rows),
					at
				})
			)
	})
	if (held) {
		tx.emit(plain({ _tag: "Finished", scope, ending: "Held", at }))
		return "held"
	}
	Option.match(seat, {
		onNone: () => undefined,
		onSome: (key) =>
			tx.emit(plain({ _tag: "Seated", seat: key, holder: { _tag: "Scope", scope }, at }))
	})
	startChildren(tx, scoped, at)
	return "accepted"
}

/**
 * A claim won: the reclaim that ends its ladder, or the claim and its seats, its declared reads taken in the same
 * transaction for its body and handed to its holder, who reports them with the claim's result.
 */
const won = (
	state: State,
	row: StepRow,
	seats: ReadonlyArray<SeatKey>,
	command: Command,
	turn: string,
	deployment: number,
	at: number
): ClaimAnswered => {
	const tx = begin(state)
	const lapsed = row.phase._tag === "Held" ? Option.some(row.phase.hold) : Option.none()
	const attempts = row.attempts + (Option.isSome(lapsed) ? 1 : 0)
	if (Option.isSome(lapsed) && exhausted(attempts, row.runs.ladder)) {
		tx.emit(
			plain({
				_tag: "Failed",
				step: row.id,
				attempt: lapsed.value.attempt,
				failure: { _tag: "LadderEnded", last: "lapsed" },
				at
			})
		)
		giveBack(tx, row.id, lapsed.value.attempt, at)
		endStep(tx, row.text, at)
		return { ...decided(tx, at, command, "exhausted"), lease: Option.none() }
	}
	const attempt = row.claims
	const until = at + row.runs.lease
	tx.emit(plain({ _tag: "Claimed", step: row.id, attempt, turn, until, deployment, at }))
	Option.match(lapsed, {
		onNone: () => undefined,
		onSome: (hold) => giveBack(tx, row.id, hold.attempt, at)
	})
	const holder: Holder = { _tag: "Claim", step: row.id, attempt }
	Arr.forEach(seats, (seat) => {
		Option.match(HashMap.get(tx.state().seats, seatText(seat)), {
			onNone: () => undefined,
			onSome: (old) => tx.emit(plain({ _tag: "Unseated", seat, holder: old.holder, at }))
		})
		tx.emit(plain({ _tag: "Seated", seat, holder, at }))
	})
	const taken = Arr.map(row.reads, (read) => ({
		name: read.name,
		query: read.query,
		rows: rowsOf(tx.state(), read.query)
	}))
	const claimed: Claimed = {
		at,
		attempt,
		attempts,
		waits: row.waits,
		read: (name) =>
			Option.match(
				Arr.findFirst(taken, (read) => read.name === name),
				{ onNone: () => [], onSome: (read) => read.rows }
			)
	}
	return {
		...decided(tx, at, command, "accepted"),
		lease: Option.some({
			step: row.id,
			text: row.text,
			attempt,
			turn,
			until,
			runs: row.runs,
			run: row.run,
			claimed,
			taken: Arr.map(taken, (read) => ({
				name: read.name,
				query: read.query,
				value: rowsDatum(read.rows)
			}))
		})
	}
}

/**
 * The ledger's transitions. Each is a pure function of the state, the call and the ledger's
 * clock, and returns the state after, its answer and its trace entry. Every fact it adds is keyed by derived identity,
 * and a fact whose key is already held is no change, so a call made twice changes nothing the second time.
 */
export const ledger = {
	/** Where steps stand. */
	standings,

	/** Admits a root under its key, by its trigger. */
	admit: (state: State, admission: Admission, by: By, at: number): Answered => {
		const command: Command = {
			_tag: "Admit",
			root: { kind: admission.kind, key: admission.key },
			input: admission.input,
			by
		}
		const tx = begin(state)
		return decided(tx, at, command, admitInto(tx, admission, by, at))
	},

	/**
	 * Commits the app's own transaction: its writes, and the roots it admits in the same commit, each behind its own
	 * key race. The writes land whatever the admissions answer, but for an admission whose key was requested with
	 * another input (`differs`), which refuses the whole transaction, its writes among it.
	 */
	write: (
		state: State,
		writes: ReadonlyArray<Write>,
		admits: ReadonlyArray<Admission>,
		at: number
	): Answered => {
		const command: Command = {
			_tag: "Write",
			writes,
			admits: Arr.map(admits, (admission) => ({
				root: { kind: admission.kind, key: admission.key },
				input: admission.input
			}))
		}
		const tx = begin(state)
		Arr.forEach(writes, (write) =>
			tx.emit(plain({ _tag: "Wrote", writer: { _tag: "App" }, write, at }))
		)
		const answers = Arr.map(admits, (admission) => admitInto(tx, admission, "app", at))
		return Arr.contains(answers, "differs")
			? answered(state, at, command, "differs")
			: committed(tx, at, command)
	},

	/**
	 * Claims the step a message names, as one turn of a deployment: refused for a stale deployment, a step not in the
	 * ledger, one ended or held, one not due, one under a closed window, one touching a paused resource or root kind,
	 * and one whose resources have no seat for it. A claim of a step whose lease ran out is a reclaim, and spends an
	 * attempt; one at the end of its ladder ends the step failed instead. A won claim takes the lowest free seat of
	 * each resource its step holds, giving back any whose holder's lease ran out, and takes its declared reads.
	 */
	claim: (
		state: State,
		step: StepId,
		turn: string,
		deployment: number,
		at: number
	): ClaimAnswered => {
		const command: Command = { _tag: "Claim", step, turn, deployment }
		const refuse = (answer: Answer): ClaimAnswered => ({
			...answered(state, at, command, answer),
			lease: Option.none()
		})
		if (!serves(deployment, state.deployment)) {
			return refuse("stale")
		}
		return Option.match(HashMap.get(state.steps, stepText(step)), {
			onNone: () => refuse("gone"),
			onSome: (row): ClaimAnswered => {
				const standing = standings.standingOf(state, row, at)
				switch (standing._tag) {
					case "Refused":
						return refuse(standing.answer)
					case "Eligible":
						return won(state, row, standing.seats, command, turn, deployment, at)
				}
			}
		})
	},

	/**
	 * Commits a claim's report: the output, its writes and the children its edges take land together, or a failure,
	 * or a retry on the step's ladder; the claim's seats go back with it. A report that already landed is a re-run
	 * and changes nothing; a report whose claim is no longer the step's latest, or whose step already has another
	 * result, is lost.
	 */
	commit: (
		state: State,
		report: Readonly<{
			step: StepId
			attempt: number
			turn: string
			settled: Settled
			reads: ReadonlyArray<Taken>
			deployment: number
		}>,
		at: number
	): Answered => {
		const reported = reportedOf(report.settled)
		const command: Command = {
			_tag: "Commit",
			step: report.step,
			attempt: report.attempt,
			turn: report.turn,
			reported,
			reads: report.reads,
			deployment: report.deployment
		}
		if (!serves(report.deployment, state.deployment)) {
			return answered(state, at, command, "stale")
		}
		return Option.match(HashMap.get(state.steps, stepText(report.step)), {
			onNone: () => answered(state, at, command, "gone"),
			onSome: (row): Answered => {
				const tx = begin(state)
				switch (fence(row, report.attempt, reported)) {
					case "lost":
						return decided(tx, at, command, "lost")
					case "rerun":
						if (report.settled._tag === "Output") {
							landNext(tx, row, report.settled.next, at)
						}
						return committed(tx, at, command)
					case "open":
						land(tx, row, report.attempt, report.settled, report.reads, at)
						return committed(tx, at, command)
				}
			}
		})
	},

	/** The census's read at a tick: it commits nothing, and is recorded so the laws see when ticks fell. */
	census: (state: State, at: number): Answered =>
		answered(state, at, { _tag: "Census" }, "unchanged"),

	/** Pauses a resource or a root kind: what touches it is not claimed until it is resumed, and nothing is lost. */
	pause: (state: State, target: Target, at: number): Answered => {
		const tx = begin(state)
		if (!HashSet.has(state.paused, targetText(target))) {
			tx.emit(plain({ _tag: "Paused", target, at }))
		}
		return committed(tx, at, { _tag: "Pause", target })
	},

	/** Resumes a paused resource or root kind. */
	resume: (state: State, target: Target, at: number): Answered => {
		const tx = begin(state)
		if (HashSet.has(state.paused, targetText(target))) {
			tx.emit(plain({ _tag: "Resumed", target, at }))
		}
		return committed(tx, at, { _tag: "Resume", target })
	},

	/** Retires a finished root's graph whole, its key never to recur; a root still running is refused `live`. */
	retire: (state: State, root: RootKey, at: number): Answered => {
		const command: Command = { _tag: "Retire", root }
		const text = rootText(root)
		return Option.match(HashMap.get(state.roots, text), {
			onNone: () =>
				answered(state, at, command, HashSet.has(state.retired, text) ? "unchanged" : "gone"),
			onSome: (row): Answered => {
				if (!retirable(state, row)) {
					return answered(state, at, command, "live")
				}
				const tx = begin(state)
				tx.emit(plain({ _tag: "Retired", root, at }))
				return committed(tx, at, command)
			}
		})
	},

	/** The roots the census may retire: those whose scope ended. */
	retirable: (state: State): ReadonlyArray<RootKey> =>
		Arr.flatMap(HashMap.toValues(state.roots), (root) =>
			retirable(state, root) ? [root.key] : []
		),

	/** Makes a new deployment the current one. */
	deploy: (state: State, at: number): Answered => {
		const tx = begin(state)
		tx.emit(plain({ _tag: "Deployed", deployment: state.deployment + 1, at }))
		return committed(tx, at, { _tag: "Deploy" })
	}
} as const

/** The ledger's transitions. */
export type Ledger = typeof ledger

/** Every pending step and unfinished scope of the ledger, by key: what a stall leaves behind. */
export const pendingOf = (state: State): ReadonlyArray<string> => [
	...Arr.flatMap(HashMap.toValues(state.steps), (row) =>
		Option.isNone(endingOf(row)) ? [row.text] : []
	),
	...Arr.flatMap(HashMap.toValues(state.scopes), (row) =>
		Option.isNone(row.ending) ? [row.text] : []
	)
]
