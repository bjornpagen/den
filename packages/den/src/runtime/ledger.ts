import type { CallError, Settled, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, type Cron, Data, type Effect, Option, type Stream } from "effect"
import type { Digest } from "effect/crypto"
import type { Ladder, Precondition, Resource, Window } from "#algebra/kinds.ts"
import type { Delay, ExclusiveId, Instant, ScopeKey, StepKey } from "#runtime/identity.ts"
import type { FlowName } from "#transport.ts"

/**
 * The ledger port: what den's runtime asks of a flow's relations, in den's own types. The module den generates for an
 * app's schema implements it over the app's served programs (den's over the flow's fragments, the commits over its app
 * role), so the runtime never names a grizzle program and grizzle never sees den's algebra.
 *
 * Three handles serve it: den's role (claims, retries, failures, admissions, requests and every read), den's
 * coordinator role (the turns of seats, exclusivity seats and pauses: the seat module's) and the flow's app role (each
 * step's commit, with the app's writes).
 */

/** Whether a call was refused on the primary key of one of `relations`: another fact already holds that key. */
export const refusedOnKey = (error: Settled, relations: ReadonlyArray<string>): boolean =>
	error.kind === "refused" &&
	Arr.some(
		error.refused.laws,
		({ law }) => law.kind === "primaryKey" && Arr.contains(relations, law.relation)
	)

/** A step's outcome, its Result: done with its output, or failed. */
export type Outcome = "done" | "failed"

/**
 * Where a step is: its kind's runner, its owning scope, its root, the retirable unit its graph is a group of, and the
 * instant its first attempt is due.
 */
export interface Located<R> {
	readonly runner: StepRunner<R>
	readonly scope: ScopeKey
	readonly root: ScopeKey
	readonly due: Instant
}

/**
 * A row as written: every row of a root's graph carries its root's scope, the group of grizzle's retirable unit it
 * belongs to, which every write holds and a retirement removes whole.
 */
export type Rooted<A> = A & { readonly root: ScopeKey }

/** A step's attempt, in its root's graph: what a refusal or an exhaustion records its ending against. */
export interface StepAt {
	readonly step: StepKey
	readonly root: ScopeKey
	readonly attempt: bigint
}

/** A root whose graph has ended: its finish has a result, or it was recorded skipped, with its kind and instant. */
export interface FinishedRoot {
	readonly scope: ScopeKey
	readonly kind: string
	readonly at: Instant
}

/** A step a commit or an admission spawned, with how long after the call it is first due. */
export interface SpawnedStep {
	readonly step: StepKey
	readonly kind: string
	readonly delay: Delay
}

/**
 * What a commit or an admission spawned: steps at every depth (a child scope is admitted in the call that opens it, its
 * start's children with it), and the finishes of the scopes it opened that started nothing, ready at once.
 */
export interface Spawned {
	readonly steps: ReadonlyArray<SpawnedStep>
	readonly finishes: ReadonlyArray<StepKey>
}

/** What a commit or an admission wrote: grizzle's outcome, and the children it spawned. */
export interface Committed {
	readonly outcome: WriteOutcome<unknown>
	readonly spawned: Spawned
}

/**
 * A claim, as the ledger's Claim relation holds it: the step, its attempt, its place among the step's claims, which the
 * database stamps, and until when its lease holds. The claim is its turn's identity: no holder beside it.
 */
export interface ClaimRow {
	readonly step: StepKey
	readonly attempt: bigint
	readonly until: Instant
}

/** An attempt of a step of a root's graph. */
export interface AttemptOf {
	readonly step: StepKey
	readonly root: ScopeKey
	readonly attempt: bigint
}

/**
 * A claim as a turn asks for it: the step, how long its lease holds from the claim's own reading of the database's
 * clock, the seats it takes, which the claim's one write holds, and the attempts it names lapsed (its step's latest
 * claim, and each claim holding one of its seats), whose ends the write records where the database's instant has passed
 * their leases.
 */
export interface ClaimOf {
	readonly step: StepKey
	readonly budget: Delay
	readonly seats: ReadonlyArray<SeatAt>
	readonly lapsed: ReadonlyArray<AttemptOf>
}

/**
 * An attempt that ended without a result: the step, the attempt, when the next is due, and whether it spent the attempt
 * (`false` for a wait: a write still running at the turn's deadline, run again on each transient refusal).
 */
export interface RetryRow {
	readonly step: StepKey
	readonly attempt: bigint
	readonly at: Instant
	readonly spent: boolean
}

/** A retry as a turn records it: when the next attempt is due, its delay after the database's reading in the write. */
export interface RetryOf {
	readonly step: StepKey
	readonly attempt: bigint
	readonly delay: Delay
	readonly spent: boolean
}

/**
 * An attempt fenced on a refused credential: its commit's login was not let in, so it spent nothing and waits on the
 * deployment, with no due instant of its own; the census rings its step again once the commits' login is let in.
 */
export interface FencedRow {
	readonly step: StepKey
	readonly attempt: bigint
}

/** A turn of a step, once claimed: the step, its attempt, scope and root, and the deadline its body runs to. */
export interface Turn {
	readonly step: StepKey
	readonly root: ScopeKey
	readonly attempt: bigint
	readonly scope: ScopeKey
	readonly deadline: Instant
}

/**
 * What a kind's runner did: committed, recorded a typed failure, met a write's error, waited without spending its
 * attempt, or spent its attempt (a defect, an interruption, its deadline), the detail for its span. A wait is due again
 * `after` the write that records it: at once for a write still running at its deadline (run again on each transient
 * refusal, `transient`), or the delay its body's source named (`later`).
 */
export type Ran =
	| { readonly kind: "committed"; readonly committed: Committed }
	| { readonly kind: "failed" }
	| { readonly kind: "error"; readonly error: Settled }
	| { readonly kind: "waited"; readonly why: "transient" | "later"; readonly after: Delay }
	| { readonly kind: "spent"; readonly detail: string }

/** A step kind's runner: what the scheduler reads of its declaration, and its turn after the claim. */
export interface StepRunner<R> {
	readonly kind: string
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	/** The scope it finishes, for a finish; none for a step kind. */
	readonly finishes: Option.Option<string>
	/**
	 * The turn after its claim: `at` the turn's reading of the database's instant, and `clock` a fresh reading, for its
	 * commit's spawns and its writes' deadline.
	 */
	readonly run: (
		turn: Turn,
		at: Instant,
		clock: Effect.Effect<Instant, Settled>
	) => Effect.Effect<Ran, never, R | Digest.Digest>
}

/** A root kind's gates and admission. */
export interface RootRunner {
	readonly window: Window
	readonly precondition: Precondition
	/**
	 * Writes the root's admission: its start's children at every depth and every finish, each step due its delay after
	 * the admission's own reading of the database's clock.
	 */
	readonly admit: (
		scope: ScopeKey
	) => Effect.Effect<Option.Option<Committed>, Settled, Digest.Digest>
}

/** How a root stands toward its admission: requested and not yet admitted, admitted, or recorded skipped. */
export type Admission = "requested" | "admitted" | "skipped"

/**
 * A scope as the scheduler sees it, by its place in its graph: a root of a root kind, requested under its trigger's key
 * at its instant, standing toward its admission, with the exclusivity key its scopes share when its kind is exclusive,
 * and its kind's runner; or a child, admitted in the call that opened it under its parent.
 */
export type ScopeView =
	| {
			readonly place: "root"
			readonly scope: ScopeKey
			readonly kind: string
			readonly key: string
			readonly at: Instant
			readonly admission: Admission
			readonly exclusive: Option.Option<ExclusiveId>
			readonly runner: RootRunner
	  }
	| {
			readonly place: "child"
			readonly scope: ScopeKey
			readonly kind: string
			readonly parent: ScopeKey
	  }

/** A root scope as the scheduler sees it. */
export type RootView = Extract<ScopeView, { readonly place: "root" }>

/** A scope's parent: a child's, and none for a root. */
export const parentOf = (view: ScopeView): Option.Option<ScopeKey> =>
	view.place === "child" ? Option.some(view.parent) : Option.none()

/** A seat: a resource, and one of its seats, `0 … seats − 1`. */
export interface SeatAt {
	readonly resource: string
	readonly seat: bigint
}

/** A seat's live hold: the claim that holds it, an attempt that has neither ended nor held its step's result, and its lease. */
export interface HoldRow extends SeatAt, AttemptOf {
	readonly until: Instant
}

/** An exclusivity seat: a root kind and the exclusivity key its scopes share. */
export interface ExclusiveAt {
	readonly kind: string
	readonly key: ExclusiveId
}

/** An exclusivity seat's turn, as a seat's. */
export interface ExclusiveTurn extends ExclusiveAt {
	readonly turn: bigint
}

/** An exclusivity seat's live turn, not released, and the scope holding it. */
export interface ExclusiveRow extends ExclusiveTurn {
	readonly scope: ScopeKey
}

/** A pause's turn: a resource or a root kind, paused at a turn until that turn is resumed. */
export interface PauseRow {
	readonly target: string
	readonly turn: bigint
}

/**
 * A pause or a resume named a target that is no resource and no root kind of its flow: the flow's coordinator role
 * refuses the name before it reads or writes anything, since a pause of it would hold nothing paused and a resume of
 * it would leave the target the operator meant paused.
 */
export class UnknownPauseTarget extends Data.TaggedError("UnknownPauseTarget")<{
	readonly flow: FlowName
	readonly target: string
}> {}

/**
 * Everything the scheduler reads, for the relay's and the census's eligibility, in one statement of den's role and so
 * one snapshot of the database: the pending steps, each with its first due instant, and their claims, retries and fenced
 * attempts;
 * the live scopes (requested, or admitted with an unfinished finish); the coordination group's live holds, exclusivity
 * seats and paused targets; and the flows a precondition names that hold a pending step. Read apart, a seat taken by a
 * root requested after the scopes were read would show held by a scope no longer live, and the census would give it
 * back while its root runs.
 */
export interface Snapshot<R> {
	readonly steps: ReadonlyArray<{
		readonly step: StepKey
		readonly runner: StepRunner<R>
		readonly scope: ScopeKey
		readonly due: Instant
	}>
	readonly claims: ReadonlyArray<{
		readonly step: StepKey
		readonly attempt: bigint
		readonly until: Instant
	}>
	readonly retries: ReadonlyArray<RetryRow>
	readonly fenced: ReadonlyArray<FencedRow>
	readonly scopes: ReadonlyArray<ScopeView>
	readonly holds: ReadonlyArray<HoldRow>
	readonly exclusives: ReadonlyArray<ExclusiveRow>
	readonly paused: ReadonlyArray<string>
	readonly busy: ReadonlyArray<string>
}

/**
 * den's coordinator role: the seat module's calls, each certified READ COMMITTED. An exclusivity seat and a pause are
 * each a chain of turns, inserted and never deleted: a read of each chain's latest turn, a read of its live turns, a
 * take of turns, and an end of turns. A step's seats are its claim's, written and given back by den's role.
 */
export interface Coordination {
	readonly exclusiveTurns: Effect.Effect<ReadonlyArray<ExclusiveTurn>, Settled>
	readonly exclusives: Effect.Effect<ReadonlyArray<ExclusiveRow>, Settled>
	readonly paused: Effect.Effect<ReadonlyArray<PauseRow>, Settled>
	readonly holdExclusive: (row: ExclusiveRow) => Effect.Effect<void, Settled>
	readonly releaseExclusive: (rows: ReadonlyArray<ExclusiveTurn>) => Effect.Effect<void, Settled>
	/**
	 * Pauses a resource or a root kind by its name (seats.ts pauseIn over the flow's chains of pauses), refused when the
	 * name is no target of the flow's.
	 */
	readonly pause: (target: string) => Effect.Effect<void, Settled | UnknownPauseTarget>
	/** Resumes a resource or a root kind by its name (seats.ts resumeIn), refused when the name is no target of the flow's. */
	readonly resume: (target: string) => Effect.Effect<void, Settled | UnknownPauseTarget>
}

/**
 * A flow's ledger: its name (the prefix its lowered relations carry), its declared kinds, the database's instant,
 * reads by key, the claim and the endings every kind shares, the scheduler's snapshot, the coordinator role, and each
 * kind's runner. R is what the flow's bodies require.
 */
export interface Ledger<R> {
	readonly flow: FlowName
	/**
	 * The database's instant, a clocked read of `transaction_timestamp()` in milliseconds, one reading per call: every
	 * lease, due instant and window is judged at a reading of it, and a claim's lease and a retry's due instant are
	 * stamped from one, so no host's clock judges anything.
	 */
	readonly now: Effect.Effect<Instant, Settled>
	/**
	 * Whether the deployment's commits' login is let in: one cheap read under it, which authenticates a session and
	 * runs no body, so the census rings a fenced attempt's step again only once it succeeds.
	 */
	readonly authenticated: Effect.Effect<void, Settled>
	readonly stepOf: (step: StepKey) => Effect.Effect<Option.Option<Located<R>>, Settled>
	readonly resultOf: (step: StepKey) => Effect.Effect<Option.Option<Outcome>, Settled>
	readonly heldOf: (step: StepKey) => Effect.Effect<Option.Option<bigint>, Settled>
	readonly claimsOf: (step: StepKey) => Effect.Effect<ReadonlyArray<ClaimRow>, Settled>
	readonly retriesOf: (step: StepKey) => Effect.Effect<ReadonlyArray<RetryRow>, Settled>
	readonly fencedOf: (step: StepKey) => Effect.Effect<ReadonlyArray<FencedRow>, Settled>
	readonly scopeOf: (scope: ScopeKey) => Effect.Effect<Option.Option<ScopeView>, Settled>
	/** Whether some child of a scope, a step but its finish or a child scope, has not ended. */
	readonly unended: (scope: ScopeKey) => Effect.Effect<boolean, Settled>
	/** Whether a scope's finish has its result. */
	readonly finished: (scope: ScopeKey) => Effect.Effect<boolean, Settled>
	/** The flows this flow's preconditions name that hold a pending step, in one statement. */
	readonly busy: Effect.Effect<ReadonlyArray<string>, Settled>
	/**
	 * Claims a step's next attempt with the seats it takes, one write: the attempt the database stamped, read back from
	 * the write. The ends of the lapsed attempts of its step and of its seats' holders are recorded in it, so a seat a
	 * lapsed claim held is free in the write that takes it. Refused whole when another claim of the step stands
	 * unended (the claim's law of its predecessor's end) or another live hold holds one of its seats (the live holds' key).
	 */
	readonly claim: (claim: Rooted<ClaimOf>) => Effect.Effect<bigint, Settled>
	/** The live holds of the flow's seats, each with its claim and its claim's lease. */
	readonly holds: Effect.Effect<ReadonlyArray<HoldRow>, Settled>
	readonly retry: (retry: Rooted<RetryOf>) => Effect.Effect<WriteOutcome<unknown>, Settled>
	readonly fence: (fenced: Rooted<FencedRow>) => Effect.Effect<WriteOutcome<unknown>, Settled>
	readonly refuse: (at: StepAt, law: string) => Effect.Effect<WriteOutcome<unknown>, Settled>
	readonly exhaust: (at: StepAt) => Effect.Effect<WriteOutcome<unknown>, Settled>
	/** Records a root not admitted because another live root of its kind, `by`, holds its exclusivity seat. */
	readonly skip: (scope: ScopeKey, by: ScopeKey) => Effect.Effect<WriteOutcome<unknown>, Settled>
	/** The roots whose graphs have ended and are not yet retired, a retirement's candidates. */
	readonly finishedRoots: Effect.Effect<ReadonlyArray<FinishedRoot>, Settled>
	/**
	 * Retires a root's graph whole, grizzle's retirement of the flow's unit under den's retiring role: every row its
	 * graph holds goes, its header stays retired, and its key never starts a graph again. An app row that references
	 * one of its rows refuses it, naming the relation.
	 */
	readonly retire: (root: ScopeKey) => Effect.Effect<WriteOutcome<unknown>, Settled>
	readonly snapshot: Effect.Effect<Snapshot<R>, Settled>
	/**
	 * The relay's watch: one signal per change of the served reads eligibility depends on (pending steps, live scopes,
	 * holds, exclusivity seats, pauses and the flows a precondition names), each through grizzle's live source, and the
	 * CallError that ended one of them.
	 */
	readonly changes: Stream.Stream<Option.Option<CallError>>
	readonly coordination: Coordination
	/** The roots a schedule starts: each one's cron, and its request at a scheduled instant. */
	readonly scheduled: ReadonlyArray<{
		readonly kind: string
		readonly cron: Cron.Cron
		readonly request: (at: Instant) => Effect.Effect<unknown, Settled, Digest.Digest>
	}>
}

/** What a step kind's body, or a join's finish, requires: R of the Effect it returns. */
export type Needs<K> = K extends {
	readonly body: (input: never, rows: never) => Effect.Effect<unknown, unknown, infer R>
}
	? R
	: K extends {
				readonly finish: {
					readonly body: (input: never, endings: never) => Effect.Effect<unknown, unknown, infer R>
				}
		  }
		? R
		: never

/** What every body and finish of a flow requires: the union of its kinds' Needs. */
export type FlowNeeds<F extends { readonly kinds: ReadonlyArray<unknown> }> = Needs<
	F["kinds"][number]
>
