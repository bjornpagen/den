import type { CallError, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import type { Effect, Option } from "effect"
import type { Digest } from "effect/crypto"
import type { Lane } from "#algebra/kinds.ts"
import type { Holder, Instant, ScopeKey, StepKey } from "#runtime/identity.ts"

/**
 * The ledger port: what den's runtime asks of a flow's relations, in den's own types. The module den generates for an
 * app's schema implements it over the app's served programs (programs over the concrete app schema, until grizzle can
 * build them over a fragment), so the runtime never names a grizzle program and grizzle never sees den's algebra.
 */

/** A step's outcome, its Result: done with its output, or failed with its typed error, the law that refused it, or its
 * ceiling of attempts. */
export type Outcome = "done" | "failed"

/** Where a step is: its kind and its owning scope. */
export interface Located {
	readonly kind: string
	readonly scope: ScopeKey
}

/** A child a commit or a start spawned: a step or await, by key and kind, or a child scope. */
export interface Spawned {
	readonly steps: ReadonlyArray<{ readonly step: StepKey; readonly kind: string }>
	readonly scopes: ReadonlyArray<ScopeKey>
}

/** What a commit or a start wrote: grizzle's outcome, and the children it spawned. */
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

/** A committing step: its claim, its scope, its input, and what its body returned. */
export interface Committing<I, O, W> {
	readonly step: StepKey
	readonly attempt: bigint
	readonly scope: ScopeKey
	readonly input: I
	readonly output: O
	readonly writes: W
}

/** A failing step: its claim and the typed error its body failed with. */
export interface Failing<E> {
	readonly step: StepKey
	readonly attempt: bigint
	readonly error: E
}

/**
 * One kind's port: its input as stored (a finish's is its scope's input and the outputs it reads), its commit (the
 * result, the output, the spawns its edges yield and the body's writes, in one call), and its typed failure.
 */
export interface KindPort<I, O, E, W> {
	readonly input: (step: StepKey, scope: ScopeKey) => Effect.Effect<Option.Option<I>, CallError>
	readonly commit: (done: Committing<I, O, W>) => Effect.Effect<Committed, CallError, Digest.Digest>
	readonly fail: (failed: Failing<E>) => Effect.Effect<WriteOutcome<unknown>, CallError>
}

/** A step that is pending: no result yet. */
export interface PendingStep {
	readonly step: StepKey
	readonly kind: string
	readonly scope: ScopeKey
}

/** A claim of a pending step. */
export interface PendingClaim {
	readonly step: StepKey
	readonly attempt: bigint
	readonly until: Instant
}

/** A child of a scope, and whether it has its result (a step) or has finished (a child scope). */
export interface Child<K> {
	readonly key: K
	readonly done: boolean
}

/** How a claim of a step at an attempt is made, and one turn of a step's kind after it. */
export interface Turn {
	readonly step: StepKey
	readonly attempt: bigint
	readonly scope: ScopeKey
	readonly until: Instant
}

/**
 * How a turn ended, the proposal's endings: `done`, with what it spawned; `failed`, by its typed error, a law that
 * refused its commit, or its ceiling of attempts; `retry`, due again at an instant, `spent` when it counted as an
 * attempt; `lost`, another fact already holds its key; `fenced`, the database holds another snapshot than this
 * deployment's, which acknowledges its wake and exits.
 */
export type Ending =
	| { readonly kind: "done"; readonly step: StepKey; readonly spawned: Spawned }
	| {
			readonly kind: "failed"
			readonly step: StepKey
			readonly why: "error" | "law" | "attempts"
	  }
	| {
			readonly kind: "retry"
			readonly step: StepKey
			readonly due: Instant
			readonly spent: boolean
	  }
	| { readonly kind: "lost"; readonly step: StepKey }
	| { readonly kind: "fenced"; readonly step: StepKey }

/** What a kind's runner did: committed, recorded a typed failure, met a write's error, or spent its attempt. */
export type Ran =
	| { readonly kind: "committed"; readonly committed: Committed }
	| { readonly kind: "failed" }
	| { readonly kind: "error"; readonly error: CallError }
	| { readonly kind: "spent" }

/** A kind's turn, after its claim: its runner, built from its body and its port. */
export interface Runner<R> {
	readonly kind: string
	readonly lane: Lane
	readonly run: (turn: Turn) => Effect.Effect<Ran, never, R | Digest.Digest>
}

/**
 * A flow's ledger: its prefix (the flow's name, which the lowered relations carry), reads by key, the claim and the
 * failures every kind shares, the census's reads, the finish race, and each kind's runner. R is what the flow's bodies
 * require.
 */
export interface Ledger<R> {
	readonly prefix: string
	readonly stepOf: (step: StepKey) => Effect.Effect<Option.Option<Located>, CallError>
	readonly resultOf: (step: StepKey) => Effect.Effect<Option.Option<Outcome>, CallError>
	readonly heldOf: (step: StepKey) => Effect.Effect<Option.Option<bigint>, CallError>
	readonly joinOf: (scope: ScopeKey) => Effect.Effect<Option.Option<string>, CallError>
	readonly parentOf: (scope: ScopeKey) => Effect.Effect<Option.Option<ScopeKey>, CallError>
	readonly claim: (claim: ClaimRow) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly refuse: (
		step: StepKey,
		attempt: bigint,
		law: string
	) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly exhaust: (
		step: StepKey,
		attempt: bigint
	) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly pending: Effect.Effect<ReadonlyArray<PendingStep>, CallError>
	readonly pendingClaims: Effect.Effect<ReadonlyArray<PendingClaim>, CallError>
	readonly openScopes: Effect.Effect<ReadonlyArray<ScopeKey>, CallError>
	readonly stepsIn: (scope: ScopeKey) => Effect.Effect<ReadonlyArray<Child<StepKey>>, CallError>
	readonly scopesIn: (scope: ScopeKey) => Effect.Effect<ReadonlyArray<Child<ScopeKey>>, CallError>
	readonly finish: (
		scope: ScopeKey,
		step: StepKey,
		kind: string
	) => Effect.Effect<WriteOutcome<unknown>, CallError>
	readonly runners: ReadonlyMap<string, Runner<R>>
	readonly finishKinds: ReadonlySet<string>
}

/** What a step kind's body, or a join's finish, requires: R of the Effect it returns. */
export type Needs<K> = K extends {
	readonly body: (input: never) => Effect.Effect<unknown, unknown, infer R>
}
	? R
	: K extends {
				readonly finish: {
					readonly body: (input: never, results: never) => Effect.Effect<unknown, unknown, infer R>
				}
		  }
		? R
		: never

/** What every body and finish of a flow requires: the union of its kinds' Needs. */
export type FlowNeeds<F extends { readonly kinds: ReadonlyArray<unknown> }> = Needs<
	F["kinds"][number]
>
