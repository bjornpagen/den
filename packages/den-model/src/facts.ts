import type { Option } from "effect"
import type { Datum } from "#datum.ts"
import { type RootKey, type ScopeId, type StepId, scopeText, stepText } from "#identity.ts"
import type { Counts, Query, Write } from "#program.ts"

/**
 * One seat's key: a resource and a seat of it. A counted resource's seats are `"0" … "<seats − 1>"`; a scope kind's
 * exclusivity seat is the kind's name and the key its input names. No two holders share a key.
 */
export type SeatKey = Readonly<{ resource: string; seat: string }>

/** A seat's canonical text: `<resource>[<seat>]`. */
export const seatText = (seat: SeatKey): string => `${seat.resource}[${seat.seat}]`

/** Who holds a seat: a step's claim while it runs, or a scope for its life (its exclusivity). */
export type Holder =
	| Readonly<{ _tag: "Claim"; step: StepId; attempt: number }>
	| Readonly<{ _tag: "Scope"; scope: ScopeId }>

/** A holder's canonical text: a claim as `<step>@<attempt>`, a scope as its own text. */
export const holderText = (holder: Holder): string => {
	switch (holder._tag) {
		case "Claim":
			return `${stepText(holder.step)}@${holder.attempt}`
		case "Scope":
			return scopeText(holder.scope)
	}
}

/** Who took a read: a step's claim, before its body ran, or a root's admission, for its precondition. */
export type Reader =
	| Readonly<{ _tag: "Claim"; step: StepId; attempt: number }>
	| Readonly<{ _tag: "Admission"; root: RootKey }>

/** Who wrote an app row: a step, with its result, or the app's own transaction. */
export type Writer = Readonly<{ _tag: "Step"; step: StepId }> | Readonly<{ _tag: "App" }>

/** What a pause attaches to: a resource, whose seats are then not taken, or a root kind, whose steps then wait. */
export type Target =
	| Readonly<{ _tag: "Resource"; name: string }>
	| Readonly<{ _tag: "Root"; kind: string }>

/** A pause target's canonical text: `resource:<name>` or `root:<kind>`. */
export const targetText = (target: Target): string => {
	switch (target._tag) {
		case "Resource":
			return `resource:${target.name}`
		case "Root":
			return `root:${target.kind}`
	}
}

/** Who admitted a root: its schedule, an operator, or the app's own write. */
export type By = "schedule" | "operator" | "app"

/**
 * Why a step ended `failed`: its body's typed failure, or its ladder ended, on the retry its last attempt's report
 * asked for, or at the claim that found its last attempt's lease run out, when nothing that attempt reported landed.
 */
export type Failure =
	| Readonly<{ _tag: "Refused"; error: Datum }>
	| Readonly<{ _tag: "LadderEnded"; last: "retried" | "lapsed" }>

/**
 * How a scope ended: its finish's output or failure, or `Held`: a root admitted while another live run held its
 * exclusivity seat, which therefore opened nothing and ran no finish, so its key's run is skipped (edullm's "that
 * relation skips the night").
 */
export type ScopeEnding = "Done" | "Failed" | "Held"

/**
 * One fact the ledger commits. Facts only accumulate; a transition is the facts it adds, in
 * order, and retirement is the one fact that deletes: a finished root's graph, whole. Its key never recurs. Every fact
 * carries the instant of the ledger's clock it committed at.
 *
 * - `Admitted`: a root under its key, with its input, its exclusivity key, and who admitted it; its scope is the
 *   root's scope. A root's age, which orders contended seats, is its admission's place in commit order. A root whose
 *   exclusivity seat another live run holds is admitted and its scope `Finished` `Held` in the same entry.
 * - `Opened`: a child scope of a kind, with its input, under the scope that owns it.
 * - `Spawned`: a step of a kind, with its input, in its owning scope (fixed here for good), due at `due`, holding a
 *   seat of each resource named in `holds` while it runs.
 * - `Claimed`: claim `attempt` of a step (numbered from 0), taken by the turn `turn` of a deployment, its lease running
 *   to `until`. The key `(step, attempt)` decides the claim and fences its commit: since retired keys never recur, no
 *   holder of a retired graph can pass for a claim of a new one. `turn` names the holder, so a law can see who
 *   committed; two traces compare turns as names, one to one.
 * - `Read`: one declared read, its name, its query and its value, the rows, `[{ key, value }]` by key: a read the claim
 *   took before its step's body ran, recorded with the result in the commit that lands it (`Done` or `Failed`), so a
 *   holder that dies after reading reads again; or a precondition an admission read empty.
 * - `Seated`, `Unseated`: a seat taken and given back. A claim takes one seat of each resource its step holds, the
 *   lowest free, and gives them back with its result or retry; a seat whose claim's lease ran out is free, and taking it
 *   gives it back for its old holder first. A root's scope takes its exclusivity seat when it is admitted and gives
 *   it back when it finishes.
 * - `Retried`: claim `attempt` ended in a retry, due again at `due`, spending an attempt or a wait.
 * - `Done`: the step's result, its output, from claim `attempt`; the first result is the only one.
 * - `Wrote`: one app write: with a step's `Done`, in its entry, or by the app's own transaction.
 * - `Failed`: the step ended failed at claim `attempt`: its body refused, or its ladder ended (at a commit, or at the
 *   claim that found its last attempt's lease run out).
 * - `Finished`: the scope ended, once, after every child.
 * - `Paused`, `Resumed`: an operator paused or resumed a resource or a root kind.
 * - `Deployed`: a new deployment became the current one; calls from older ones are answered `stale`.
 * - `Retired`: a finished root's graph was deleted whole; its key never recurs.
 */
export type Fact =
	| Readonly<{
			_tag: "Admitted"
			root: RootKey
			input: Datum
			exclusive: Option.Option<string>
			by: By
			at: number
	  }>
	| Readonly<{
			_tag: "Opened"
			scope: ScopeId
			kind: string
			input: Datum
			owner: ScopeId
			at: number
	  }>
	| Readonly<{
			_tag: "Spawned"
			step: StepId
			kind: string
			input: Datum
			scope: ScopeId
			due: number
			holds: ReadonlyArray<string>
			at: number
	  }>
	| Readonly<{
			_tag: "Claimed"
			step: StepId
			attempt: number
			turn: string
			until: number
			deployment: number
			at: number
	  }>
	| Readonly<{ _tag: "Read"; reader: Reader; name: string; query: Query; value: Datum; at: number }>
	| Readonly<{ _tag: "Seated"; seat: SeatKey; holder: Holder; at: number }>
	| Readonly<{ _tag: "Unseated"; seat: SeatKey; holder: Holder; at: number }>
	| Readonly<{
			_tag: "Retried"
			step: StepId
			attempt: number
			due: number
			counts: Counts
			at: number
	  }>
	| Readonly<{ _tag: "Done"; step: StepId; attempt: number; output: Datum; at: number }>
	| Readonly<{ _tag: "Wrote"; writer: Writer; write: Write; at: number }>
	| Readonly<{ _tag: "Failed"; step: StepId; attempt: number; failure: Failure; at: number }>
	| Readonly<{ _tag: "Finished"; scope: ScopeId; ending: ScopeEnding; at: number }>
	| Readonly<{ _tag: "Paused"; target: Target; at: number }>
	| Readonly<{ _tag: "Resumed"; target: Target; at: number }>
	| Readonly<{ _tag: "Deployed"; deployment: number; at: number }>
	| Readonly<{ _tag: "Retired"; root: RootKey; at: number }>

/** One declared read as a claim took it: its name, its query, and the rows it returned, `[{ key, value }]` by key. */
export type Taken = Readonly<{ name: string; query: Query; value: Datum }>

/** What a worker reports of a claim it ran: the body's outcome as data, or the retry its failed call earned. */
export type Reported =
	| Readonly<{ _tag: "Output"; output: Datum; writes: ReadonlyArray<Write> }>
	| Readonly<{ _tag: "Failure"; error: Datum }>
	| Readonly<{ _tag: "Retry"; at: number; counts: Counts }>

/**
 * One call of the ledger, as data: what the real engine's differential tests replay against its own ledger.
 *
 * - `Admit`: a trigger admits a root under its key.
 * - `Write`: the app's own transaction writes its rows and may admit one root in the same commit (W5's entry, W6's
 *   report row).
 * - `Claim`: a woken function claims the step its message names, as one turn of one deployment.
 * - `Commit`: a holder commits claim `attempt` of a step with its report and the reads its claim took; the ledger
 *   derives the spawns of the step's declared edges itself.
 * - `Census`: the census's read at a tick. It commits nothing; it is in the trace so a law can see when ticks fell.
 * - `Retire`, `Pause`, `Resume`, `Deploy`: the census's retirement of a finished root, and the operator's verbs.
 */
export type Command =
	| Readonly<{ _tag: "Admit"; root: RootKey; named: Datum; by: By }>
	| Readonly<{
			_tag: "Write"
			writes: ReadonlyArray<Write>
			admits: ReadonlyArray<Readonly<{ root: RootKey; named: Datum }>>
	  }>
	| Readonly<{ _tag: "Claim"; step: StepId; turn: string; deployment: number }>
	| Readonly<{
			_tag: "Commit"
			step: StepId
			attempt: number
			turn: string
			reported: Reported
			reads: ReadonlyArray<Taken>
			deployment: number
	  }>
	| Readonly<{ _tag: "Census" }>
	| Readonly<{ _tag: "Retire"; root: RootKey }>
	| Readonly<{ _tag: "Pause"; target: Target }>
	| Readonly<{ _tag: "Resume"; target: Target }>
	| Readonly<{ _tag: "Deploy" }>

/**
 * How the ledger answered a call:
 * - `accepted`: it committed facts;
 * - `unchanged`: every fact the call would add is already there: a re-run, or a census's read;
 * - `lost`: another fact already holds the key the call needed (a live claim, another result, a newer claim);
 * - `gone`: the step or root it names is not in the ledger: never admitted, or retired;
 * - `stale`: the caller's deployment is not the current one;
 * - `early`, `closed`, `paused`: a claim found its step not yet due, its window closed, or something it touches paused;
 * - `full`, `behind`: a claim found a resource of its step with no free seat, or every free seat owed to older work;
 * - `exhausted`: a claim found the lease of its step's last attempt run out, and ended it failed instead;
 * - `live`: a retirement found its root not yet finished;
 * - `held`, `retired`, `blocked`: an admission found its exclusivity seat held by a live run, its key retired (it never
 *   recurs), or its precondition's read not empty;
 * - `differs`: an admission whose input its request gives found its key requested with another input under its kind's
 *   same input heading, and the call commits nothing, the app's own writes beside it among it;
 * - `underived`: an admission whose input derives from its key found that its read derives none at the request's
 *   commit, so no root stands, and the app's own writes beside it land.
 */
export type Answer =
	| "accepted"
	| "unchanged"
	| "lost"
	| "gone"
	| "stale"
	| "early"
	| "closed"
	| "paused"
	| "full"
	| "behind"
	| "exhausted"
	| "live"
	| "held"
	| "retired"
	| "blocked"
	| "differs"
	| "underived"

/**
 * One entry of a trace: the ledger's clock when a call ran, the call, the answer, and the facts it committed, in the
 * order it committed them.
 */
export type Entry = Readonly<{
	at: number
	command: Command
	answer: Answer
	facts: ReadonlyArray<Fact>
}>

/**
 * A run's trace, den's differential format: every call the run made of its ledger, in commit order.
 * The model writes one for every simulated run. The real engine's harness writes one by reading its committed rows in
 * commit order (a claim's `Claim` row and its reads, a seat's rows taken and deleted, a result's `Finished` or `Failed`
 * row, a spawn's `Step` and edge rows, the app's own rows) and naming each step and scope by the path its derived
 * identity is (identity.ts), so the same program under the same commands compares fact by fact, turns renamed one to
 * one; the laws (properties.ts) read either.
 */
export type Trace = ReadonlyArray<Entry>
