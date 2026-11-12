import type { CallError, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import type { Cron, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import type { Ladder, Precondition, Window } from "#algebra/kinds.ts"
import type { ExclusiveId, Holder, Instant, ScopeKey, StepKey } from "#runtime/identity.ts"
import type { FlowName } from "#transport.ts"

/**
 * The ledger port: what den's runtime asks of a flow's relations, in den's own types. The module den generates for an
 * app's schema implements it over the app's served programs (programs over the concrete app schema, until grizzle can
 * build them over a fragment), so the runtime never names a grizzle program and grizzle never sees den's algebra.
 *
 * Three handles serve it: den's role (claims, retries, failures, admissions, requests and every read), den's
 * coordination role (seats, exclusivity, pauses: the seat module's, which LEASE replaces) and the flow's app role
 * (each step's commit, with the app's writes).
 */

/** A step's outcome, its Result: done with its output, or failed. */
export type Outcome = "done" | "failed"

/** Where a step is: its kind and its owning scope. */
export interface Located {
	readonly kind: string
	readonly scope: ScopeKey
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
 * (`false` for a wait, a transient refusal that outlasted the turn's deadline).
 */
export interface RetryRow {
	readonly step: StepKey
	readonly attempt: bigint
	readonly at: Instant
	readonly spent: boolean
}

/** A turn of a step, once claimed: the step, its attempt and scope, and its claim's deadline and lease. */
export interface Turn {
	readonly step: StepKey
	readonly attempt: bigint
	readonly scope: ScopeKey
	readonly holder: Holder
	readonly deadline: Instant
	readonly until: Instant
}

/**
 * What a kind's runner did: committed, recorded a typed failure, met a write's error, waited out its deadline on a
 * transient refusal, or spent its attempt (a defect, an interruption, its deadline), the detail for its span.
 */
export type Ran =
	| { readonly kind: "committed"; readonly committed: Committed }
	| { readonly kind: "failed" }
	| { readonly kind: "error"; readonly error: CallError }
	| { readonly kind: "waited" }
	| { readonly kind: "spent"; readonly detail: string }

/** A step kind's runner: what the scheduler reads of its declaration, and its turn after the claim. */
export interface StepRunner<R> {
	readonly kind: string
	readonly uses: ReadonlyArray<string>
	readonly retry: Ladder
	/** The scope it finishes, for a finish; none for a step kind. */
	readonly finishes: Option.Option<string>
	readonly run: (turn: Turn, now: Instant) => Effect.Effect<Ran, never, R | Digest.Digest>
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
	) => Effect.Effect<Option.Option<Committed>, CallError, Digest.Digest>
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

/** A seat's hold, as the coordination role keeps it. */
export interface HoldRow {
	readonly resource: string
	readonly seat: bigint
	readonly holder: Holder
	readonly until: Instant
}

/** An exclusivity seat's holder. */
export interface ExclusiveRow {
	readonly kind: string
	readonly key: ExclusiveId
	readonly scope: ScopeKey
}

/**
 * Everything the scheduler reads at one instant, for the relay's and the census's eligibility: the pending steps with
 * their claims, retries and first due instants; the live scopes (requested, or admitted with an unfinished finish);
 * and the coordination group's seats, holds, exclusivity seats and pauses; and, for each flow a precondition names,
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
	readonly dues: ReadonlyArray<{ readonly step: StepKey; readonly at: Instant }>
	readonly scopes: ReadonlyArray<ScopeView>
	readonly seats: ReadonlyArray<{ readonly resource: string; readonly seat: bigint }>
	readonly holds: ReadonlyArray<HoldRow>
	readonly exclusives: ReadonlyArray<ExclusiveRow>
	readonly paused: ReadonlyArray<string>
	readonly busy: ReadonlyArray<string>
}

/**
 * den's coordination role: the seat module's calls. At `a226cbac` taking and giving back seats certifies SERIALIZABLE,
 * so every call here may meet `transient`, which the seat module retries; grizzle's LEASE moves the same relations to
 * READ COMMITTED.
 */
export interface Coordination {
	readonly seats: Effect.Effect<
		ReadonlyArray<{ readonly resource: string; readonly seat: bigint }>,
		CallError
	>
	readonly holds: Effect.Effect<ReadonlyArray<HoldRow>, CallError>
	readonly exclusives: Effect.Effect<ReadonlyArray<ExclusiveRow>, CallError>
	readonly paused: Effect.Effect<ReadonlyArray<string>, CallError>
	readonly provision: (
		add: ReadonlyArray<{ readonly resource: string; readonly seat: bigint }>,
		remove: ReadonlyArray<{ readonly resource: string; readonly seat: bigint }>
	) => Effect.Effect<void, CallError>
	readonly take: (
		lapsed: ReadonlyArray<HoldRow>,
		taken: ReadonlyArray<HoldRow>
	) => Effect.Effect<void, CallError>
	readonly giveBack: (holds: ReadonlyArray<HoldRow>) => Effect.Effect<void, CallError>
	readonly holdExclusive: (row: ExclusiveRow) => Effect.Effect<void, CallError>
	readonly releaseExclusive: (rows: ReadonlyArray<ExclusiveRow>) => Effect.Effect<void, CallError>
	readonly pause: (target: string) => Effect.Effect<void, CallError>
	readonly resume: (target: string) => Effect.Effect<void, CallError>
}

/**
 * A flow's ledger: its name (the prefix its lowered relations carry), its declared kinds, reads by key, the claim and
 * the endings every kind shares, the scheduler's snapshot, the coordination role, and each kind's runner. R is what the
 * flow's bodies require.
 */
export interface Ledger<R> {
	readonly flow: FlowName
	readonly resources: ReadonlyArray<{ readonly name: string; readonly seats: number }>
	readonly steps: ReadonlyMap<string, StepRunner<R>>
	readonly roots: ReadonlyMap<string, RootRunner>
	readonly stepOf: (step: StepKey) => Effect.Effect<Option.Option<Located>, CallError>
	readonly resultOf: (step: StepKey) => Effect.Effect<Option.Option<Outcome>, CallError>
	readonly heldOf: (step: StepKey) => Effect.Effect<Option.Option<bigint>, CallError>
	readonly claimsOf: (step: StepKey) => Effect.Effect<ReadonlyArray<ClaimRow>, CallError>
	readonly retriesOf: (step: StepKey) => Effect.Effect<ReadonlyArray<RetryRow>, CallError>
	readonly dueOf: (step: StepKey) => Effect.Effect<Option.Option<Instant>, CallError>
	readonly scopeOf: (scope: ScopeKey) => Effect.Effect<Option.Option<ScopeView>, CallError>
	/** Whether some child of a scope, a step but its finish or a child scope, has not ended. */
	readonly unended: (scope: ScopeKey) => Effect.Effect<boolean, CallError>
	/** Whether a scope's finish has its result. */
	readonly finished: (scope: ScopeKey) => Effect.Effect<boolean, CallError>
	/** Whether a flow a precondition names holds a pending step. */
	readonly busy: (flow: string) => Effect.Effect<boolean, CallError>
	readonly claim: (claim: ClaimRow) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly retry: (retry: RetryRow) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly refuse: (
		step: StepKey,
		attempt: bigint,
		law: string
	) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly exhaust: (
		step: StepKey,
		attempt: bigint
	) => Effect.Effect<WriteOutcome<unknown>, CallError>
	/** Records a root not admitted because another live root of its kind, `by`, holds its exclusivity seat. */
	readonly skip: (scope: ScopeKey, by: ScopeKey) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly snapshot: Effect.Effect<Snapshot, CallError>
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
		readonly request: (at: Instant) => Effect.Effect<unknown, CallError, Digest.Digest>
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
