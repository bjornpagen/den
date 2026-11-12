import type { Datum } from "#datum.ts"
import type { RootKey, ScopeId, StepId } from "#identity.ts"
import type { Counts, Write } from "#program.ts"

/**
 * How a step was spawned: to run on a lane under claims, to await a completion from outside, or to await its timer,
 * which fires at an instant the spawn fixed.
 */
export type Spawn =
	| Readonly<{ _tag: "Runs"; lane: string }>
	| Readonly<{ _tag: "Awaits" }>
	| Readonly<{ _tag: "Timer"; fires: number }>

/**
 * Why a step ended `failed`: its body's typed failure, or a ceiling: the attempts it may spend, or the reclaims its
 * claim may suffer.
 */
export type Failure =
	| Readonly<{ _tag: "Refused"; error: Datum }>
	| Readonly<{ _tag: "AttemptsExhausted" }>
	| Readonly<{ _tag: "ReclaimsExhausted" }>

/** How a scope ended: by its finish's output or failure, or because it was stopped. */
export type ScopeEnding = "Done" | "Failed" | "Stopped"

/**
 * One fact the ledger commits. Facts only accumulate; a transition is the facts it adds, and retirement is the one fact
 * that deletes, a finished root's graph whole. Every fact carries the instant of the ledger's clock it committed at.
 *
 * - `Admitted`: a root under its key, with its input; its scope is the root's scope.
 * - `Opened`: a child scope of a kind, with its input, under the scope that owns it.
 * - `Spawned`: a step of a kind, with its input, in its owning scope, which is fixed here for good.
 * - `Fed`: one role's part of a feed's join, from the parent step that contributed it.
 * - `Claimed`: claim `claim` (the step's claims are numbered from 0) of a step, in a slot of its lane, live until
 *   `until`, taken by a deployment, fenced by `token`: a name the ledger mints once and never again, retirement
 *   included, so a holder from a retired graph cannot pass for a claim of a new one under the same key. Two traces
 *   compare their tokens as names, one to one.
 * - `Retried`: claim `claim` ended in a retry, due again at `due`, spending an attempt or a wait.
 * - `Done`: the step's result, its output, from claim `claim`; the first result is the only one.
 * - `Wrote`: one app write that landed with a `Done`.
 * - `Failed`: the step ended failed, at claim `claim` (the claim it was refused at for a reclaim ceiling).
 * - `Completed`: an await's completion, its first and only one.
 * - `Stopped`: the step ended because its scope was stopped.
 * - `Finished`: the scope ended, once, after every child.
 * - `Paused`, `Resumed`: an operator paused or resumed a lane.
 * - `Deployed`: a new deployment became the current one; calls from older ones are answered `stale`.
 * - `Retired`: a finished root's graph was deleted whole; its key is free again.
 */
export type Fact =
	| Readonly<{ _tag: "Admitted"; root: RootKey; input: Datum; at: number }>
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
			spawn: Spawn
			at: number
	  }>
	| Readonly<{
			_tag: "Fed"
			feed: string
			scope: ScopeId
			key: string
			role: string
			parent: StepId
			value: Datum
			at: number
	  }>
	| Readonly<{
			_tag: "Claimed"
			step: StepId
			claim: number
			token: number
			slot: number
			until: number
			deployment: number
			at: number
	  }>
	| Readonly<{
			_tag: "Retried"
			step: StepId
			claim: number
			due: number
			counts: Counts
			at: number
	  }>
	| Readonly<{ _tag: "Done"; step: StepId; claim: number; output: Datum; at: number }>
	| Readonly<{ _tag: "Wrote"; step: StepId; write: Write; at: number }>
	| Readonly<{ _tag: "Failed"; step: StepId; claim: number; failure: Failure; at: number }>
	| Readonly<{ _tag: "Completed"; step: StepId; value: Datum; at: number }>
	| Readonly<{ _tag: "Stopped"; step: StepId; at: number }>
	| Readonly<{ _tag: "Finished"; scope: ScopeId; ending: ScopeEnding; at: number }>
	| Readonly<{ _tag: "Paused"; lane: string; at: number }>
	| Readonly<{ _tag: "Resumed"; lane: string; at: number }>
	| Readonly<{ _tag: "Deployed"; deployment: number; at: number }>
	| Readonly<{ _tag: "Retired"; root: RootKey; at: number }>

/** What a worker reports of a claim it ran: the body's outcome as data, or the retry its failed call earned. */
export type Reported =
	| Readonly<{ _tag: "Output"; output: Datum; writes: ReadonlyArray<Write> }>
	| Readonly<{ _tag: "Failure"; error: Datum }>
	| Readonly<{ _tag: "Retry"; at: number; counts: Counts }>

/**
 * One call of the ledger, as data: what the real engine's differential tests replay against its own ledger. A claim
 * names a lane, never a step; a commit names its claim and reports its outcome, from which the engine derives the
 * spawns of its own declared edges.
 */
export type Command =
	| Readonly<{ _tag: "Admit"; root: RootKey; input: Datum }>
	| Readonly<{ _tag: "Claim"; lane: string; deployment: number }>
	| Readonly<{
			_tag: "Commit"
			step: StepId
			claim: number
			token: number
			reported: Reported
			deployment: number
	  }>
	| Readonly<{ _tag: "Complete"; step: StepId; value: Datum }>
	| Readonly<{ _tag: "Fire" }>
	| Readonly<{ _tag: "Stop"; scope: ScopeId }>
	| Readonly<{ _tag: "Pause"; lane: string }>
	| Readonly<{ _tag: "Resume"; lane: string }>
	| Readonly<{ _tag: "Retire"; root: RootKey }>
	| Readonly<{ _tag: "Deploy" }>

/**
 * How the ledger answered a call:
 * - `accepted`: it committed facts;
 * - `unchanged`: every fact the call would add is already there, the answer to a re-run;
 * - `lost`: another fact already holds the key the call needed (a newer claim, another result);
 * - `gone`: the step or scope it names is not in the ledger, never admitted or retired;
 * - `stale`: the caller's deployment is not the current one;
 * - `paused`, `closed`, `at-width`, `idle`: a claim found its lane paused, outside its window, at its width, or with no
 *   due step;
 * - `exhausted`: a claim found its step's reclaims spent, and ended it failed instead;
 * - `live`: a retirement found its root not yet finished.
 */
export type Answer =
	| "accepted"
	| "unchanged"
	| "lost"
	| "gone"
	| "stale"
	| "paused"
	| "closed"
	| "at-width"
	| "idle"
	| "exhausted"
	| "live"

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
 * A run's trace: every call the run made of its ledger, in commit order. It is den's differential format. The model
 * writes one for every simulated run; the real engine's tests write one by reading their own committed rows in commit
 * order (a claim's `Claim` row, a result's `Finished`, `Failed` or `Stopped` row, a spawn's `Step` and edge rows) and
 * naming each step and scope by the path its derived identity is (identity.ts), so the same program under the same
 * commands is compared fact by fact, and the property checks (properties.ts) read either.
 */
export type Trace = ReadonlyArray<Entry>
