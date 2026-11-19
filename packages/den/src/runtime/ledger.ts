import type { CallError, Settled, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import type { Cron, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import type { Ladder, Precondition, Window } from "#algebra/kinds.ts"
import type { ExclusiveId, Holder, Instant, ScopeKey, StepKey } from "#runtime/identity.ts"
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

/** A step's outcome, its Result: done with its output, or failed. */
export type Outcome = "done" | "failed"

/** Where a step is: its kind, its owning scope, and its root, the retirable unit its graph is a group of. */
export interface Located {
	readonly kind: string
	readonly scope: ScopeKey
	readonly root: ScopeKey
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

/** A step a commit or an admission spawned, with the instant it is first due. */
export interface SpawnedStep {
	readonly step: StepKey
	readonly kind: string
	readonly due: Instant
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

/** A claim, as the ledger's Claim relation holds it: the step, its attempt, who holds it and until when. */
export interface ClaimRow {
	readonly step: StepKey
	readonly attempt: bigint
	readonly holder: Holder
	readonly until: Instant
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

/**
 * An attempt fenced on a refused credential: its commit's login was not let in, so it spent nothing and waits on the
 * deployment, with no due instant of its own; the census rings its step again once the commits' login is let in.
 */
export interface FencedRow {
	readonly step: StepKey
	readonly attempt: bigint
}

/** A turn of a step, once claimed: the step, its attempt, scope and root, and its claim's deadline and lease. */
export interface Turn {
	readonly step: StepKey
	readonly root: ScopeKey
	readonly attempt: bigint
	readonly scope: ScopeKey
	readonly holder: Holder
	readonly deadline: Instant
	readonly until: Instant
}

/**
 * What a kind's runner did: committed, recorded a typed failure, met a write's error, waited out its deadline with a
 * write still running (run again on each transient refusal), or spent its attempt (a defect, an interruption, its
 * deadline), the detail for its span.
 */
export type Ran =
	| { readonly kind: "committed"; readonly committed: Committed }
	| { readonly kind: "failed" }
	| { readonly kind: "error"; readonly error: Settled }
	| { readonly kind: "waited" }
	| { readonly kind: "spent"; readonly detail: string }

/** A step kind's runner: what the scheduler reads of its declaration, and its turn after the claim. */
export interface StepRunner<R> {
	readonly kind: string
	readonly uses: ReadonlyArray<string>
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

/** A root kind's admission and gates. */
export interface RootRunner {
	readonly kind: string
	readonly exclusive: boolean
	readonly window: Window
	readonly precondition: Precondition
	readonly finish: string
	/** Writes the root's admission: its start's children at every depth and every finish, at the caller's instant. */
	readonly admit: (
		scope: ScopeKey,
		now: Instant
	) => Effect.Effect<Option.Option<Committed>, Settled, Digest.Digest>
}

/** A scope as the scheduler sees it: its kind, its parent, whether it is admitted, and its exclusivity key. */
export interface ScopeView {
	readonly scope: ScopeKey
	readonly kind: string
	readonly parent: Option.Option<ScopeKey>
	readonly admitted: boolean
	readonly skipped: boolean
	readonly key: Option.Option<ExclusiveId>
	readonly root: Option.Option<{ readonly key: string; readonly at: Instant }>
}

/** A seat: a resource, and one of its seats, `0 … seats − 1`. */
export interface SeatAt {
	readonly resource: string
	readonly seat: bigint
}

/** A seat's turn: the turns of a seat run from 0, each taken once the one before it was freed. */
export interface SeatTurn extends SeatAt {
	readonly turn: bigint
}

/** A seat's live hold, a turn not freed: who holds it and until when. */
export interface HoldRow extends SeatTurn {
	readonly holder: Holder
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
 * Everything the scheduler reads at one instant, for the relay's and the census's eligibility: the pending steps with
 * their claims, retries, fenced attempts and first due instants; the live scopes (requested, or admitted with an unfinished finish);
 * the coordination group's live holds, exclusivity seats and paused targets; and, for each flow a precondition names,
 * whether it holds a pending step.
 */
export interface Snapshot {
	readonly steps: ReadonlyArray<{
		readonly step: StepKey
		readonly kind: string
		readonly scope: ScopeKey
	}>
	readonly claims: ReadonlyArray<{
		readonly step: StepKey
		readonly attempt: bigint
		readonly until: Instant
	}>
	readonly retries: ReadonlyArray<RetryRow>
	readonly fenced: ReadonlyArray<FencedRow>
	readonly dues: ReadonlyArray<{ readonly step: StepKey; readonly at: Instant }>
	readonly scopes: ReadonlyArray<ScopeView>
	readonly holds: ReadonlyArray<HoldRow>
	readonly exclusives: ReadonlyArray<ExclusiveRow>
	readonly paused: ReadonlyArray<string>
	readonly busy: ReadonlyArray<string>
}

/**
 * den's coordinator role: the seat module's calls, each certified READ COMMITTED. A seat, an exclusivity seat and a
 * pause are each a chain of turns, inserted and never deleted: a read of each chain's latest turn, a read of its live
 * turns, a take of turns, and an end of turns.
 */
export interface Coordination {
	readonly seatTurns: Effect.Effect<ReadonlyArray<SeatTurn>, Settled>
	readonly holds: Effect.Effect<ReadonlyArray<HoldRow>, Settled>
	readonly exclusiveTurns: Effect.Effect<ReadonlyArray<ExclusiveTurn>, Settled>
	readonly exclusives: Effect.Effect<ReadonlyArray<ExclusiveRow>, Settled>
	readonly pauseTurns: Effect.Effect<ReadonlyArray<PauseRow>, Settled>
	readonly paused: Effect.Effect<ReadonlyArray<PauseRow>, Settled>
	/** Frees `lapsed` and holds `taken` in one call, refused whole on any turn another holder took first. */
	readonly take: (
		lapsed: ReadonlyArray<SeatTurn>,
		taken: ReadonlyArray<HoldRow>
	) => Effect.Effect<void, Settled>
	readonly giveBack: (holds: ReadonlyArray<SeatTurn>) => Effect.Effect<void, Settled>
	readonly holdExclusive: (row: ExclusiveRow) => Effect.Effect<void, Settled>
	readonly releaseExclusive: (rows: ReadonlyArray<ExclusiveTurn>) => Effect.Effect<void, Settled>
	readonly pause: (row: PauseRow) => Effect.Effect<void, Settled>
	readonly resume: (row: PauseRow) => Effect.Effect<void, Settled>
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
	readonly resources: ReadonlyArray<{ readonly name: string; readonly seats: number }>
	readonly steps: ReadonlyMap<string, StepRunner<R>>
	readonly roots: ReadonlyMap<string, RootRunner>
	readonly stepOf: (step: StepKey) => Effect.Effect<Option.Option<Located>, Settled>
	readonly resultOf: (step: StepKey) => Effect.Effect<Option.Option<Outcome>, Settled>
	readonly heldOf: (step: StepKey) => Effect.Effect<Option.Option<bigint>, Settled>
	readonly claimsOf: (step: StepKey) => Effect.Effect<ReadonlyArray<ClaimRow>, Settled>
	readonly retriesOf: (step: StepKey) => Effect.Effect<ReadonlyArray<RetryRow>, Settled>
	readonly fencedOf: (step: StepKey) => Effect.Effect<ReadonlyArray<FencedRow>, Settled>
	readonly dueOf: (step: StepKey) => Effect.Effect<Option.Option<Instant>, Settled>
	readonly scopeOf: (scope: ScopeKey) => Effect.Effect<Option.Option<ScopeView>, Settled>
	/** Whether some child of a scope, a step but its finish or a child scope, has not ended. */
	readonly unended: (scope: ScopeKey) => Effect.Effect<boolean, Settled>
	/** Whether a scope's finish has its result. */
	readonly finished: (scope: ScopeKey) => Effect.Effect<boolean, Settled>
	/** Whether a flow a precondition names holds a pending step. */
	readonly busy: (flow: string) => Effect.Effect<boolean, Settled>
	/**
	 * Claims a step's attempt, a race at its key: whether the claim holding `(step, attempt)` is `claim`'s holder's, this
	 * call's or an earlier one of the same holder, or another holder's, which this call met and wrote nothing beside.
	 */
	readonly claim: (claim: Rooted<ClaimRow>) => Effect.Effect<boolean, Settled>
	readonly retry: (retry: Rooted<RetryRow>) => Effect.Effect<WriteOutcome<unknown>, Settled>
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
	readonly snapshot: Effect.Effect<Snapshot, Settled>
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
