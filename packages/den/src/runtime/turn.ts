import type { CallError, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import { backoffFirstMillis, backoffLastMillis, leaseMarginMillis } from "@den/limits/claim"
import { Array as Arr, Cause, Duration, Effect, Exit, Option, Order, Random } from "effect"
import type { Digest } from "effect/crypto"
import type { Ladder } from "#algebra/kinds.ts"
import { opensAt, isOpen } from "#runtime/eligible.ts"
import {
	finishStep,
	holderOf,
	type Instant,
	instantOf,
	type ScopeKey,
	type StepKey
} from "#runtime/identity.ts"
import type {
	ClaimRow,
	Committed,
	FencedRow,
	HoldRow,
	Ledger,
	Ran,
	RetryRow,
	ScopeView,
	Spawned,
	StepRunner,
	Turn
} from "#runtime/ledger.ts"
import { giveBack, holdExclusive, releaseExclusive, exclusiveOf, take } from "#runtime/seats.ts"
import { AttemptNumber, type FlowName, type Ring, Transport, type Wake } from "#transport.ts"

/** A wake a turn rings on, and its delay: `invoke` names the turn as its cause. */
export interface Onward {
	readonly wake: Wake
	readonly delay: Duration.Duration
}

/**
 * One turn, in three calls: the claim, a race at `(step, attempt)` certified READ COMMITTED, whose loser meets the
 * winner's claim and goes no further; the step's declared reads in one read-only call; and the commit, its result, the
 * rows its reads found, the body's writes and its spawns, in one call under the flow's app role. Before the claim the
 * turn takes a seat of each resource the step uses (the seat module), and after its last write it gives them back.
 *
 * Time is the database's: a turn judges its claim's lease, its due instant and its windows at a reading of the
 * database's instant (the ledger's `now`), stamps its claim's lease from the invocation's end in that clock and a
 * retry's due instant from a reading, and rings a timer with the duration between two readings.
 *
 * Endings come from grizzle's CallError: `transient` is a wait, retried in place within the deadline and, past it,
 * recorded with no attempt spent; `unavailable` and `transport`, which change nothing, spend an attempt, as every
 * other refusal of the call does; `refused` is `lost` when the law is a key another fact already holds, and `failed`
 * naming the law otherwise; `stale` and `credentialRefused` are the deployment's faults (Fault), on which this
 * deployment spends nothing, acknowledges its wake and exits. A defect is no state of its own: the attempt ends spent,
 * and its detail goes to the turn's span.
 */

/** Why a turn waits without spending an attempt. */
export type Wait =
	| "due"
	| "window"
	| "paused"
	| "seats"
	| "exclusive"
	| "precondition"
	| "unready"
	| "transient"
	| "unread"

/**
 * How a turn ended, the proposal's endings: `done` with what it spawned; `admitted`, a root's start written; `skipped`,
 * a root not admitted because another live root of its kind holds its exclusivity seat, recorded as such; `failed`
 * by its typed error, a law that refused its commit, or its ladder's end; `retry`, an attempt spent and the next due at
 * an instant; `waiting`, no attempt spent, rung again at an instant or by the relay; `lost`, another fact already holds
 * its key; `fenced`, a call met the deployment's fault, named, on which it acknowledges its wake and exits.
 */
export type Ending =
	| { readonly kind: "done"; readonly wake: Wake; readonly spawned: Spawned }
	| { readonly kind: "admitted"; readonly wake: Wake; readonly spawned: Spawned }
	| { readonly kind: "skipped"; readonly wake: Wake; readonly by: ScopeKey }
	| { readonly kind: "failed"; readonly wake: Wake; readonly why: "error" | "law" | "attempts" }
	| { readonly kind: "retry"; readonly wake: Wake; readonly due: Instant }
	| {
			readonly kind: "waiting"
			readonly wake: Wake
			readonly why: Wait
			readonly until: Option.Option<Instant>
	  }
	| { readonly kind: "lost"; readonly wake: Wake }
	| { readonly kind: "fenced"; readonly wake: Wake; readonly fault: Fault }

/**
 * The deployment's faults: `stale`, the database holds another snapshot than this deployment's, and
 * `credentialRefused`, the database does not let one of this deployment's logins in. A call that meets either changed
 * nothing, and no retry of it can succeed until the deployment changes, so a turn that meets one fences: it spends no
 * attempt, which would turn one misconfiguration into a run of failed steps, records a claimed attempt as fenced, waiting
 * on the deployment, where its own login still can (`ended`), rings nothing, and names the fault in its ending. A stale
 * deployment's record never lands, since its every call meets `stale`: its claim's lapse spends the attempt, as before.
 */
export type Fault = Extract<CallError, { readonly kind: "stale" | "credentialRefused" }>

/** The deployment's fault `error` is, if it is one. */
const faultOf = (error: CallError): Option.Option<Fault> =>
	error.kind === "stale" || error.kind === "credentialRefused" ? Option.some(error) : Option.none()

/** The ending of a call's failure: fenced on the deployment's fault, `otherwise` on any other. */
const fencedOr = (error: CallError, wake: Wake, otherwise: Ending): Ending =>
	Option.match(faultOf(error), {
		onSome: (fault): Ending => ({ kind: "fenced", wake, fault }),
		onNone: () => otherwise
	})

/** A turn's ending and the wakes it rings on. */
export interface Served {
	readonly ending: Ending
	readonly onward: ReadonlyArray<Onward>
}

const served = (ending: Ending): Served => ({ ending, onward: [] })

/** A delay from `at` to `until`, none once `until` has passed. */
const delayTo = (at: Instant, until: Instant): Duration.Duration =>
	Duration.millis(Math.max(0, Number(until) - Number(at)))

/** A step's wake at an attempt. */
const stepWake = (flow: FlowName, step: StepKey, attempt: bigint): Wake => ({
	_tag: "Step",
	flow,
	step,
	attempt: AttemptNumber.make(Number(attempt))
})

/**
 * The rung of a ladder after `spent` attempts: the census's period, doubling per spent attempt, never past the longest
 * lease.
 */
export const rungMillis = (spent: number): number =>
	Math.min(backoffFirstMillis.value * 2 ** Math.max(0, spent - 1), backoffLastMillis.value)

/** Whether a ladder allows another attempt after `spent` spent ones. */
const allows = (ladder: Ladder, spent: number): boolean =>
	ladder.kind === "never" || spent < ladder.attempts

/**
 * How many of a step's attempts before `next` were spent: every claimed attempt but those whose retry says it waited
 * without spending and those fenced on a refused credential; a claim whose holder vanished, recording neither, spent its
 * attempt.
 */
export const spentBefore = (
	claims: ReadonlyArray<ClaimRow>,
	retries: ReadonlyArray<RetryRow>,
	fenced: ReadonlyArray<FencedRow>,
	next: bigint
): number =>
	Arr.filter(
		claims,
		(c) =>
			c.attempt < next &&
			!Arr.some(retries, (r) => r.attempt === c.attempt && !r.spent) &&
			!Arr.some(fenced, (f) => f.attempt === c.attempt)
	).length

/**
 * Whether a refusal is a key race this turn lost: the step's Result or Held already held by another attempt's commit,
 * the attempt before this one never claimed (a stale or forged wake), or an admission whose rows another admitter
 * already wrote. A claim at this attempt by another holder refuses nothing: Claim races its key, and the claim reports
 * the holder it met.
 */
export const lostRace = (flow: string, error: CallError): boolean =>
	error.kind === "refused" &&
	Arr.some(
		error.refused.laws,
		({ law }) =>
			(law.kind === "primaryKey" &&
				Arr.contains(
					[
						`${flow}Result`,
						`${flow}Held`,
						`${flow}Retry`,
						`${flow}Fenced`,
						`${flow}Admitted`,
						`${flow}Due`,
						`${flow}Root`
					],
					law.relation
				)) ||
			(law.kind === "contained" && law.from.relation === `${flow}Claim`)
	)

/** The law a refusal names first, by its identity, as a Refusal row records it. */
const lawOf = (error: Extract<CallError, { readonly kind: "refused" }>): string =>
	String(error.refused.laws[0].id)

/**
 * Retries a write while it is refused as transient, which changed nothing, until `deadline`, judged at a reading of the
 * database's instant `clock` takes.
 */
export const written = <A, R>(
	write: Effect.Effect<A, CallError, R>,
	clock: Effect.Effect<Instant, CallError>,
	deadline: Instant
): Effect.Effect<Option.Option<A>, CallError, R> =>
	Effect.flatMap(clock, (at) =>
		Effect.timeoutOption(
			Effect.retry(write, { while: (error) => error.kind === "transient" }),
			delayTo(at, deadline)
		)
	)

/** A step kind's typed port: its input, its declared read, its commit and its typed failure. */
export interface StepPort<I, Rows, O, E, W> {
	readonly input: (step: StepKey) => Effect.Effect<Option.Option<I>, CallError>
	readonly read: (input: I) => Effect.Effect<Rows, CallError>
	readonly commit: (
		done: {
			readonly turn: Turn
			readonly input: I
			readonly rows: Rows
			readonly output: O
			readonly writes: W
		},
		at: Instant
	) => Effect.Effect<Committed, CallError, Digest.Digest>
	readonly fail: (failed: {
		readonly turn: Turn
		readonly input: I
		readonly rows: Rows
		readonly error: E
	}) => Effect.Effect<WriteOutcome<unknown>, CallError>
}

/** What a runner runs: a step kind's body, or a finish's over its scope's input and its children's endings. */
export interface Runnable<I, Rows, O, E, W, R> {
	readonly name: string
	readonly uses: ReadonlyArray<{ readonly name: string }>
	readonly retry: Ladder
	readonly body: (
		input: I,
		rows: Rows
	) => Effect.Effect<{ readonly output: O; readonly writes: W }, E, R>
}

/**
 * A kind's runner: its input, its declared read in one read-only call, its body under the turn's deadline from the
 * turn's reading `at`, and the write its exit decides, each write retried in place while transient and its spawns due
 * from a fresh reading of the database's instant `clock` takes. A defect or an interruption spends the attempt.
 */
export const runnerOf = <I, Rows, O, E, W, R>(
	runnable: Runnable<I, Rows, O, E, W, R>,
	port: StepPort<I, Rows, O, E, W>,
	finishes: Option.Option<string>
): StepRunner<R> => ({
	kind: runnable.name,
	uses: Arr.map(runnable.uses, (r) => r.name),
	retry: runnable.retry,
	finishes,
	run: Effect.fn(`den.turn.${runnable.name}`)(function* (
		turn: Turn,
		at: Instant,
		clock: Effect.Effect<Instant, CallError>
	) {
		const input = yield* Effect.result(port.input(turn.step))
		if (input._tag === "Failure") {
			return { kind: "error", error: input.failure } satisfies Ran
		}
		if (Option.isNone(input.success)) {
			return { kind: "spent", detail: "the step has no input" } satisfies Ran
		}
		const read = input.success.value
		const found = yield* Effect.result(port.read(read))
		if (found._tag === "Failure") {
			return { kind: "error", error: found.failure } satisfies Ran
		}
		const rows = found.success
		const exit = yield* Effect.exit(
			Effect.timeoutOption(runnable.body(read, rows), delayTo(at, turn.deadline))
		)
		if (Exit.isFailure(exit)) {
			const failure = Option.getOrUndefined(Exit.findErrorOption(exit))
			if (failure === undefined) {
				return { kind: "spent", detail: Cause.pretty(exit.cause) } satisfies Ran
			}
			return yield* Effect.match(
				written(port.fail({ turn, input: read, rows, error: failure }), clock, turn.deadline),
				{
					onFailure: (error): Ran => ({ kind: "error", error }),
					onSuccess: (outcome): Ran =>
						Option.isSome(outcome) ? { kind: "failed" } : { kind: "waited" }
				}
			)
		}
		if (Option.isNone(exit.value)) {
			return { kind: "spent", detail: "the body ran past the turn's deadline" } satisfies Ran
		}
		const { output, writes } = exit.value.value
		const reading = yield* Effect.result(clock)
		if (reading._tag === "Failure") {
			return { kind: "error", error: reading.failure } satisfies Ran
		}
		const committed = reading.success
		return yield* Effect.match(
			written(
				port.commit({ turn, input: read, rows, output, writes }, committed),
				clock,
				turn.deadline
			),
			{
				onFailure: (error): Ran => ({ kind: "error", error }),
				onSuccess: (outcome): Ran =>
					Option.isSome(outcome)
						? { kind: "committed", committed: outcome.value }
						: { kind: "waited" }
			}
		)
	})
})

/** The reads a turn needs, any failure but the deployment's fault a wait with no attempt spent. */
const readOr = <A>(read: Effect.Effect<A, CallError>, wake: Wake): Effect.Effect<A, Ending> =>
	Effect.mapError(read, (error) =>
		fencedOr(error, wake, { kind: "waiting", wake, why: "unread", until: Option.none() })
	)

/**
 * The ending of a write that failed: fenced on the deployment's fault, lost when another fact already holds its key,
 * and otherwise a wait with no attempt spent.
 */
const unwritten = (flow: string, error: CallError, wake: Wake): Ending =>
	fencedOr(
		error,
		wake,
		lostRace(flow, error)
			? { kind: "lost", wake }
			: { kind: "waiting", wake, why: "unread", until: Option.none() }
	)

/** The scopes from `scope` up to its root, each as the scheduler sees it. */
const chainOf = <R>(
	ledger: Ledger<R>,
	scope: ScopeKey
): Effect.Effect<ReadonlyArray<ScopeView>, CallError> => {
	const walk = (
		at: ScopeKey,
		seen: ReadonlyArray<ScopeView>
	): Effect.Effect<ReadonlyArray<ScopeView>, CallError> =>
		Effect.flatMap(ledger.scopeOf(at), (found) =>
			Option.match(found, {
				onNone: () => Effect.succeed(seen),
				onSome: (s) =>
					Option.match(s.parent, {
						onNone: () => Effect.succeed([...seen, s]),
						onSome: (parent) => walk(parent, [...seen, s])
					})
			})
		)
	return walk(scope, [])
}

/** Why a scope chain keeps its work waiting at `at`: a window shut, or its root kind or a resource paused. */
const gate = <R>(
	ledger: Ledger<R>,
	chain: ReadonlyArray<ScopeView>,
	uses: ReadonlyArray<string>,
	at: Instant
): Effect.Effect<
	Option.Option<{ readonly why: Wait; readonly until: Option.Option<Instant> }>,
	CallError
> =>
	Effect.gen(function* () {
		const windows = Arr.flatMap(chain, (s) =>
			Option.toArray(Option.map(Option.fromNullishOr(ledger.roots.get(s.kind)), (j) => j.window))
		)
		const shut = Arr.filter(windows, (w) => !isOpen(w, at))
		if (Arr.isReadonlyArrayNonEmpty(shut)) {
			const until = Arr.reduce(shut, at, (latest, w) => {
				const opens = opensAt(w, at)
				return opens > latest ? opens : latest
			})
			return Option.some({ why: "window", until: Option.some(until) } as const)
		}
		const live = yield* ledger.coordination.paused
		const paused = Arr.map(live, (row) => row.target)
		const root = Arr.findFirst(chain, (s) => Option.isSome(s.root))
		if (
			Option.exists(root, (s) => Arr.contains(paused, s.kind)) ||
			Arr.some(uses, (u) => Arr.contains(paused, u))
		) {
			return Option.some({ why: "paused", until: Option.none() } as const)
		}
		return Option.none()
	})

/** Claims, latest attempt first. */
const LATEST: Order.Order<ClaimRow> = Order.flip(
	Order.mapInput(Order.BigInt, (c: ClaimRow) => c.attempt)
)

/**
 * Whether a claim still holds its step at `at`: its lease stands and its attempt recorded neither a retry nor a fence,
 * either of which ended it.
 */
const stands = (
	claim: ClaimRow,
	retries: ReadonlyArray<RetryRow>,
	fenced: ReadonlyArray<FencedRow>,
	at: Instant
): boolean =>
	claim.until >= at &&
	!Arr.some(retries, (r) => r.attempt === claim.attempt) &&
	!Arr.some(fenced, (f) => f.attempt === claim.attempt)

/** The wake for a step's next attempt, as its claims, retries and fences stand: none while a claim stands. */
const nextWake = <R>(
	ledger: Ledger<R>,
	step: StepKey
): Effect.Effect<Option.Option<Onward>, CallError> =>
	Effect.gen(function* () {
		const at = yield* ledger.now
		const result = yield* ledger.resultOf(step)
		if (Option.isSome(result)) {
			return Option.none()
		}
		const claims = yield* ledger.claimsOf(step)
		const retries = yield* ledger.retriesOf(step)
		const fenced = yield* ledger.fencedOf(step)
		const latest = Arr.head(Arr.sort(claims, LATEST))
		if (Option.exists(latest, (c) => stands(c, retries, fenced, at))) {
			return Option.none()
		}
		const attempt = Option.match(latest, { onNone: () => 1n, onSome: (c) => c.attempt + 1n })
		return Option.some({ wake: stepWake(ledger.flow, step, attempt), delay: Duration.zero })
	})

/** The wakes of what a commit or an admission spawned: each step after its delay, an exact timer, and each ready finish. */
const spawnedRings = (flow: FlowName, at: Instant, spawned: Spawned): ReadonlyArray<Onward> => [
	...Arr.map(spawned.steps, (s) => ({
		wake: stepWake(flow, s.step, 1n),
		delay: delayTo(at, s.due)
	})),
	...Arr.map(spawned.finishes, (finish) => ({
		wake: stepWake(flow, finish, 1n),
		delay: Duration.zero
	}))
]

/**
 * What a step's end rings on: what it spawned, its scope's finish once its last child ended, and, for a finish, its
 * root's exclusivity seat given back and its parent's finish once that scope was the parent's last open child.
 */
const settled = <R>(
	ledger: Ledger<R>,
	runner: StepRunner<R>,
	scope: ScopeKey,
	spawned: Spawned
): Effect.Effect<ReadonlyArray<Onward>, never, Digest.Digest> =>
	Effect.gen(function* () {
		const at = yield* ledger.now
		const children = spawnedRings(ledger.flow, at, spawned)
		const ready = (s: ScopeKey) =>
			Effect.flatMap(ledger.unended(s), (busy) =>
				busy
					? Effect.succeedNone
					: Effect.flatMap(finishStep(s), (finish) => nextWake(ledger, finish))
			)
		if (Option.isNone(runner.finishes)) {
			const finish =
				Arr.isReadonlyArrayEmpty(spawned.steps) && Arr.isReadonlyArrayEmpty(spawned.finishes)
					? yield* ready(scope)
					: Option.none()
			return [...children, ...Option.toArray(finish)]
		}
		yield* Effect.flatMap(exclusiveOf(ledger, scope), (rows) => releaseExclusive(ledger, rows))
		const parent = yield* Effect.map(
			ledger.scopeOf(scope),
			Option.flatMap((s) => s.parent)
		)
		const upward = Option.isSome(parent) ? yield* ready(parent.value) : Option.none()
		return [...children, ...Option.toArray(upward)]
	}).pipe(Effect.orElseSucceed((): ReadonlyArray<Onward> => []))

/**
 * How a claimed attempt ended without a result: `spent`, its attempt spent; `waited`, a wait that spends nothing; or
 * `fenced`, a call met the deployment's fault, which spends nothing either.
 */
type Unfinished =
	| { readonly kind: "spent" }
	| { readonly kind: "waited" }
	| { readonly kind: "fenced"; readonly fault: Fault }

/**
 * An attempt that ended without a result, recorded at a reading of the database's instant: a spent one's retry due a
 * rung later, or the step failed once its ladder is spent; a wait recorded as a retry that spent nothing, due at once,
 * whose next attempt it rings at once; a fenced one recorded as fenced, where its own login still can, so it spends
 * nothing, no lapse of its claim counts it spent, and it waits on the deployment: it rings nothing, and the census rings
 * its step only once the commits' login is let in again, so no body runs while the deployment stays broken and the
 * step never fails of it.
 */
const ended = <R>(
	ledger: Ledger<R>,
	runner: StepRunner<R>,
	turn: Turn,
	spentSoFar: number,
	how: Unfinished,
	wake: Wake
): Effect.Effect<Ending> =>
	Effect.gen(function* () {
		const at = yield* readOr(ledger.now, wake)
		const next = stepWake(ledger.flow, turn.step, turn.attempt + 1n)
		switch (how.kind) {
			case "spent": {
				const total = spentSoFar + 1
				if (!allows(runner.retry, total)) {
					return yield* recorded(ledger, ledger.exhaust(turn.step, turn.attempt), wake, {
						kind: "failed",
						wake,
						why: "attempts"
					})
				}
				const due = instantOf(Number(at) + rungMillis(total))
				return yield* recorded(
					ledger,
					ledger.retry({ step: turn.step, attempt: turn.attempt, at: due, spent: true }),
					wake,
					{ kind: "retry", wake: next, due }
				)
			}
			case "waited":
				return yield* recorded(
					ledger,
					ledger.retry({ step: turn.step, attempt: turn.attempt, at, spent: false }),
					wake,
					{ kind: "waiting", wake: next, why: "transient", until: Option.some(at) }
				)
			case "fenced":
				return yield* recorded(
					ledger,
					ledger.fence({ step: turn.step, attempt: turn.attempt }),
					wake,
					{ kind: "fenced", wake, fault: how.fault }
				)
		}
	}).pipe(Effect.catch((ending: Ending) => Effect.succeed(ending)))

/** The ending a write's outcome gives: `ok` once written, lost when another fact holds its key, else a wait. */
const recorded = <R>(
	ledger: Ledger<R>,
	write: Effect.Effect<WriteOutcome<unknown>, CallError>,
	wake: Wake,
	ok: Ending
): Effect.Effect<Ending> =>
	Effect.match(write, {
		onFailure: (error) => unwritten(ledger.flow, error, wake),
		onSuccess: (): Ending => ok
	})

/** The ending of what a runner did: a refusal recorded, a commit whose answer never came read back. */
const endingOf = <R>(
	ledger: Ledger<R>,
	runner: StepRunner<R>,
	turn: Turn,
	ran: Ran,
	spentSoFar: number,
	wake: Wake
): Effect.Effect<Ending> => {
	switch (ran.kind) {
		case "committed":
			return Effect.succeed({ kind: "done", wake, spawned: ran.committed.spawned })
		case "failed":
			return Effect.succeed({ kind: "failed", wake, why: "error" })
		case "waited":
			return ended(ledger, runner, turn, spentSoFar, { kind: "waited" }, wake)
		case "spent":
			return Effect.andThen(
				Effect.annotateCurrentSpan("den.spent", ran.detail),
				ended(ledger, runner, turn, spentSoFar, { kind: "spent" }, wake)
			)
		case "error": {
			const error = ran.error
			switch (error.kind) {
				case "stale":
				case "credentialRefused":
					return ended(ledger, runner, turn, spentSoFar, { kind: "fenced", fault: error }, wake)
				case "refused":
					return lostRace(ledger.flow, error)
						? Effect.succeed({ kind: "lost", wake })
						: recorded(ledger, ledger.refuse(turn.step, turn.attempt, lawOf(error)), wake, {
								kind: "failed",
								wake,
								why: "law"
							})
				case "commitUnknown":
					return Effect.flatMap(Effect.option(ledger.heldOf(turn.step)), (held) =>
						Option.contains(Option.flatten(held), turn.attempt)
							? Effect.succeed<Ending>({ kind: "done", wake, spawned: { steps: [], finishes: [] } })
							: ended(ledger, runner, turn, spentSoFar, { kind: "spent" }, wake)
					)
				case "transient":
					return ended(ledger, runner, turn, spentSoFar, { kind: "waited" }, wake)
				case "unavailable":
				case "transport":
				case "input":
				case "outsideWorld":
				case "route":
				case "tokenRefused":
				case "tokenExpired":
				case "failed":
					return Effect.andThen(
						Effect.annotateCurrentSpan("den.spent", error.message),
						ended(ledger, runner, turn, spentSoFar, { kind: "spent" }, wake)
					)
			}
		}
	}
}

/** Gives back a turn's holds, then passes its ending on. */
const thenGiveBack = <R, A, E, X>(
	ledger: Ledger<R>,
	holds: ReadonlyArray<HoldRow>,
	effect: Effect.Effect<A, E, X>
): Effect.Effect<A, E, X> => Effect.ensuring(effect, giveBack(ledger, holds))

/**
 * Serves one wake of a step's attempt: refuses a wake that names no pending step or not its next attempt, waits for its
 * due instant, its windows, its pauses and, for a finish, its scope's last child; fails it once its ladder is spent;
 * takes its seats, claims it until `ends` (its invocation's end), runs its kind's turn, gives its seats back, and rings
 * on what its end made eligible.
 */
const serveStep = <R>(
	ledger: Ledger<R>,
	wake: Extract<Wake, { readonly _tag: "Step" }>,
	ends: Instant
): Effect.Effect<Served, Ending, R | Digest.Digest> =>
	Effect.gen(function* () {
		const step = wake.step
		const at = yield* readOr(ledger.now, wake)
		const located = yield* readOr(ledger.stepOf(step), wake)
		if (Option.isNone(located)) {
			return served({ kind: "lost", wake })
		}
		const { kind, scope } = located.value
		const runner = ledger.steps.get(kind)
		if (runner === undefined) {
			return served({ kind: "lost", wake })
		}
		const result = yield* readOr(ledger.resultOf(step), wake)
		if (Option.isSome(result)) {
			return served({ kind: "lost", wake })
		}
		const claims = yield* readOr(ledger.claimsOf(step), wake)
		const retries = yield* readOr(ledger.retriesOf(step), wake)
		const fenced = yield* readOr(ledger.fencedOf(step), wake)
		const latest = Arr.head(Arr.sort(claims, LATEST))
		const next = Option.match(latest, { onNone: () => 1n, onSome: (c) => c.attempt + 1n })
		if (
			BigInt(wake.attempt) !== next ||
			Option.exists(latest, (c) => stands(c, retries, fenced, at))
		) {
			return served({ kind: "lost", wake })
		}
		const due = yield* Option.match(latest, {
			onNone: () =>
				Effect.map(
					readOr(ledger.dueOf(step), wake),
					Option.getOrElse(() => at)
				),
			onSome: (c) =>
				Effect.succeed(
					Arr.some(fenced, (f) => f.attempt === c.attempt)
						? at
						: Option.getOrElse(
								Option.map(
									Arr.findFirst(retries, (r) => r.attempt === c.attempt),
									(r) => r.at
								),
								() => instantOf(Number(c.until) + 1)
							)
				)
		})
		if (due > at) {
			return {
				ending: { kind: "waiting", wake, why: "due", until: Option.some(due) },
				onward: [{ wake, delay: delayTo(at, due) }]
			} satisfies Served
		}
		const chain = yield* readOr(chainOf(ledger, scope), wake)
		const shut = yield* readOr(gate(ledger, chain, runner.uses, at), wake)
		if (Option.isSome(shut)) {
			return {
				ending: { kind: "waiting", wake, why: shut.value.why, until: shut.value.until },
				onward: Arr.map(Option.toArray(shut.value.until), (until) => ({
					wake,
					delay: delayTo(at, until)
				}))
			} satisfies Served
		}
		if (Option.isSome(runner.finishes)) {
			const busy = yield* readOr(ledger.unended(scope), wake)
			if (busy) {
				return served({ kind: "waiting", wake, why: "unready", until: Option.none() })
			}
		}
		const spentSoFar = spentBefore(claims, retries, fenced, next)
		const nonce = yield* Random.nextInt
		const holder = yield* holderOf(step, Number(next), nonce)
		const margin = leaseMarginMillis.value
		const deadline = instantOf(Number(ends) - margin)
		const until = ends
		const exhausted = !allows(runner.retry, spentSoFar)
		const holds = exhausted
			? Option.some(Arr.empty<HoldRow>())
			: yield* readOr(take(ledger, runner.uses, holder, until, at), wake)
		if (Option.isNone(holds)) {
			return served({ kind: "waiting", wake, why: "seats", until: Option.none() })
		}
		return yield* thenGiveBack(
			ledger,
			holds.value,
			Effect.gen(function* () {
				const claim: ClaimRow = { step, attempt: next, holder, until }
				const claimed = yield* Effect.result(
					Effect.retry(ledger.claim(claim), { while: (error) => error.kind === "transient" })
				)
				if (claimed._tag === "Failure") {
					return served(unwritten(ledger.flow, claimed.failure, wake))
				}
				if (!claimed.success) {
					return served({ kind: "lost", wake })
				}
				const turn: Turn = { step, attempt: next, scope, holder, deadline, until }
				if (exhausted) {
					const failed = yield* recorded(ledger, ledger.exhaust(step, next), wake, {
						kind: "failed",
						wake,
						why: "attempts"
					})
					return { ending: failed, onward: yield* settledOn(ledger, runner, scope, failed) }
				}
				const ran = yield* runner.run(turn, at, ledger.now)
				const ending = yield* endingOf(ledger, runner, turn, ran, spentSoFar, wake)
				return { ending, onward: yield* settledOn(ledger, runner, scope, ending) }
			})
		)
	})

/** What an ending rings on: a step's end settles its scope; a retry or a timed wait rings its own next attempt. */
const settledOn = <R>(
	ledger: Ledger<R>,
	runner: StepRunner<R>,
	scope: ScopeKey,
	ending: Ending
): Effect.Effect<ReadonlyArray<Onward>, never, Digest.Digest> => {
	const ringAt = (wake: Wake, until: Instant): Effect.Effect<ReadonlyArray<Onward>> =>
		Effect.match(ledger.now, {
			onFailure: (): ReadonlyArray<Onward> => [],
			onSuccess: (at) => [{ wake, delay: delayTo(at, until) }]
		})
	switch (ending.kind) {
		case "done":
			return settled(ledger, runner, scope, ending.spawned)
		case "failed":
			return settled(ledger, runner, scope, { steps: [], finishes: [] })
		case "retry":
			return ringAt(ending.wake, ending.due)
		case "waiting":
			return Option.match(ending.until, {
				onNone: () => Effect.succeed([]),
				onSome: (until) => ringAt(ending.wake, until)
			})
		case "admitted":
		case "skipped":
		case "lost":
		case "fenced":
			return Effect.succeed([])
	}
}

/**
 * Serves one wake of a root's admission: refuses a root already admitted or skipped, waits for its window, its pause and
 * its precondition (the flows it names idle), records it skipped when another live root of its kind holds its
 * exclusivity seat, and otherwise writes its start's children at every depth and every finish, and rings them on, or its
 * finish at once when it started nothing.
 */
const serveAdmit = <R>(
	ledger: Ledger<R>,
	wake: Extract<Wake, { readonly _tag: "Admit" }>
): Effect.Effect<Served, Ending, Digest.Digest> =>
	Effect.gen(function* () {
		const scope = wake.scope
		const at = yield* readOr(ledger.now, wake)
		const viewed = yield* readOr(ledger.scopeOf(scope), wake)
		if (Option.isNone(viewed) || viewed.value.admitted || viewed.value.skipped) {
			return served({ kind: "lost", wake })
		}
		const view = viewed.value
		const root = ledger.roots.get(view.kind)
		if (root === undefined) {
			return served({ kind: "lost", wake })
		}
		const shut = yield* readOr(gate(ledger, [view], [], at), wake)
		if (Option.isSome(shut)) {
			return {
				ending: { kind: "waiting", wake, why: shut.value.why, until: shut.value.until },
				onward: Arr.map(Option.toArray(shut.value.until), (until) => ({
					wake,
					delay: delayTo(at, until)
				}))
			} satisfies Served
		}
		const precondition = root.precondition
		if (precondition.kind === "idle") {
			const busy = yield* readOr(Effect.forEach(precondition.flows, ledger.busy), wake)
			if (Arr.some(busy, (b) => b)) {
				return served({ kind: "waiting", wake, why: "precondition", until: Option.none() })
			}
		}
		if (Option.isSome(view.key)) {
			const key = view.key.value
			const held = yield* readOr(holdExclusive(ledger, { kind: view.kind, key, scope }), wake)
			if (!held) {
				const holders = yield* readOr(ledger.coordination.exclusives, wake)
				const by = Arr.findFirst(holders, (e) => e.kind === view.kind && e.key === key)
				if (Option.isNone(by)) {
					return served({ kind: "waiting", wake, why: "exclusive", until: Option.none() })
				}
				const skipped = yield* recorded(ledger, ledger.skip(scope, by.value.scope), wake, {
					kind: "skipped",
					wake,
					by: by.value.scope
				})
				return served(skipped)
			}
		}
		const admitted = yield* Effect.result(root.admit(scope, at))
		if (admitted._tag === "Failure") {
			return served(unwritten(ledger.flow, admitted.failure, wake))
		}
		if (Option.isNone(admitted.success)) {
			return served({ kind: "lost", wake })
		}
		const spawned = admitted.success.value.spawned
		return {
			ending: { kind: "admitted", wake, spawned },
			onward: spawnedRings(ledger.flow, at, spawned)
		}
	})

/** The flows an app runs, each its ledger, by name. */
export type Ledgers<R> = ReadonlyMap<string, Ledger<R>>

/**
 * Serves one wake under the invocation that ends at `ends`. It never fails: every failure is an ending, and the runtime
 * acknowledges every wake.
 */
export const serve = <R>(
	ledgers: Ledgers<R>,
	wake: Wake,
	ends: Instant
): Effect.Effect<Served, never, R | Digest.Digest> => {
	const ledger = ledgers.get(wake.flow)
	if (ledger === undefined) {
		return Effect.succeed(served({ kind: "lost", wake }))
	}
	const turn = wake._tag === "Step" ? serveStep(ledger, wake, ends) : serveAdmit(ledger, wake)
	return turn.pipe(Effect.catch((ending: Ending) => Effect.succeed(served(ending))))
}

/**
 * One invocation of `budget`: serves the wake it was woken for, then continues with the first of each turn's onward
 * wakes due at once while a turn's deadline and margin still fit, and rings the rest through the transport as each turn
 * ends, so no step waits for a delivery its invocation could have run itself. Its end is its first reading of the
 * database's instant plus its budget, and each turn's fit is judged at a reading of its own.
 */
export const invoke = <R>(
	ledgers: Ledgers<R>,
	wake: Wake,
	budget: Duration.Duration
): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport> =>
	Effect.gen(function* () {
		const transport = yield* Transport
		const loop = (
			current: Option.Option<Wake>,
			ends: Option.Option<Instant>,
			endings: ReadonlyArray<Ending>
		): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport> =>
			Effect.gen(function* () {
				if (Option.isNone(current)) {
					return endings
				}
				const serving = current.value
				const ledger = ledgers.get(serving.flow)
				if (ledger === undefined) {
					return [...endings, { kind: "lost", wake: serving } satisfies Ending]
				}
				const reading = yield* Effect.result(readOr(ledger.now, serving))
				if (reading._tag === "Failure") {
					return [...endings, reading.failure]
				}
				const at = reading.success
				const end = Option.getOrElse(ends, () => instantOf(Number(at) + Duration.toMillis(budget)))
				const cause = { _tag: "Turn", by: serving, at: Number(at) } as const
				if (Number(at) + leaseMarginMillis.value >= Number(end)) {
					yield* transport.send([{ wake: serving, delay: Duration.zero, cause }])
					return endings
				}
				const turn = yield* serve(ledgers, serving, end)
				const rung = Arr.map(turn.onward, (o): Ring => ({ ...o, cause }))
				const [first, ...rest] = rung
				const continues = first !== undefined && Duration.isZero(first.delay)
				yield* transport.send(continues ? rest : rung)
				return yield* loop(continues ? Option.some(first.wake) : Option.none(), Option.some(end), [
					...endings,
					turn.ending
				])
			})
		return yield* loop(Option.some(wake), Option.none(), [])
	})
