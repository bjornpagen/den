import type { Settled, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Cause, Duration, Effect, Exit, Option } from "effect"
import type { Digest } from "effect/crypto"
import type { Ladder, Resource } from "#algebra/kinds.ts"
import { censusPeriodSeconds } from "#algebra/kinds.ts"
import { Later } from "#algebra/later.ts"
import { census } from "#runtime/census.ts"
import { eligible, isOpen, lapsedAttempt, opensAt, standing } from "#runtime/eligible.ts"
import {
	atOnce,
	type Delay,
	delayOf,
	finishStep,
	type Instant,
	instantOf,
	type ScopeKey,
	type StepKey
} from "#runtime/identity.ts"
import type {
	ClaimOf,
	ClaimRow,
	Committed,
	FencedRow,
	Ledger,
	Ran,
	RetryRow,
	Rooted,
	RootView,
	SeatAt,
	Spawned,
	StepRunner,
	Turn
} from "#runtime/ledger.ts"
import { parentOf, refusedOnKey } from "#runtime/ledger.ts"
import {
	exclusiveOf,
	holdExclusive,
	releaseExclusive,
	seatsFor,
	seatTaken
} from "#runtime/seats.ts"
import { AttemptNumber, type FlowName, type Ring, Transport, type Wake } from "#transport.ts"

/**
 * How long a PostgreSQL server lets a client take to authenticate before it closes the connection, by default: no
 * connection attempt to a server at its default can usefully take longer.
 *
 * @limitKind published
 * @owner PostgreSQL 19, the authentication_timeout setting
 * @unit seconds
 * @scope one client's authentication on one connection, from its start until the server closes the connection
 * @constraint configurable default
 * @source https://www.postgresql.org/docs/19/runtime-config-connection.html
 * @quote Maximum amount of time allowed to complete client authentication. [...] The default is one minute (1m).
 * @verified 2026-11-16
 */
export const authenticationTimeoutSeconds = 60

/**
 * How far a claim's lease outlasts its turn's deadline. After its deadline a holder's last acts are its commit and the
 * giving back of its seats, each a call whose session a server at its default lets take at most this long to
 * authenticate, so a lease this much past the deadline still holds while its holder can be committing. Seats are exact
 * while the clocks of two holders differ by less than this margin, which DBCLOCK removes by taking the database's
 * instant.
 *
 * @limitKind derived
 * @owner den's claim protocol (packages/den/src/runtime/turn.ts)
 * @unit milliseconds
 * @scope the interval from a turn's deadline to its claim's and its seats' `until`
 * @derivation the commit and the seats' give-back after the deadline each open a session, which the server closes once
 *   authentication_timeout passes
 * @from {@link authenticationTimeoutSeconds}
 */
const leaseMarginMillis = authenticationTimeoutSeconds * 1000

/**
 * The longest a Vercel function invocation lives, Fluid compute on the Pro and Enterprise plans: past it Vercel
 * terminates the invocation. Every unit of den's work fits one invocation (the proposal's ninth principle). Vercel's
 * longer durations are a beta, configured per function, which den does not take.
 *
 * @limitKind published
 * @owner Vercel Functions, Fluid compute, Pro and Enterprise plans
 * @unit seconds
 * @scope one function invocation, from its start until Vercel terminates it
 * @constraint hard quota
 * @source https://vercel.com/docs/functions/configuring-functions/duration
 * @quote The 800 second maximum is generally available for Pro and Enterprise teams.
 * @verified 2026-11-16
 */
export const functionLifetimeSeconds = 800

/**
 * The most milliseconds one invocation spends taking turns: its whole lifetime. A turn starts only while its deadline
 * and the lease margin still fit inside what is left of it.
 *
 * @limitKind derived
 * @owner den's runtime (packages/den/src/runtime/drive.ts)
 * @unit milliseconds
 * @scope one invocation's turns, from the instant it was woken
 * @derivation an invocation takes turns only while the platform keeps it alive
 * @from {@link functionLifetimeSeconds}
 */
export const invocationBudgetMillis = functionLifetimeSeconds * 1000

/**
 * The longest a claim's lease can be: a turn's deadline is what its invocation has left less the margin, so its lease
 * ends no later than the invocation that took it can live.
 *
 * @limitKind derived
 * @owner den's claim protocol (packages/den/src/runtime/turn.ts)
 * @unit milliseconds
 * @scope the interval from a claim's instant to its `until`, at its longest
 * @derivation deadline plus margin is at most the invocation's remaining budget, which is at most its whole budget
 * @from {@link invocationBudgetMillis}
 */
export const longestLeaseMillis = invocationBudgetMillis

/**
 * The first instant after the longest lease at which its step may be claimed again: a lease holds through its `until`,
 * and the caller's clock reads whole milliseconds, so the next instant it can read is one millisecond later.
 *
 * @limitKind derived
 * @owner den's claim protocol
 * @unit milliseconds
 * @scope the interval from a claim's instant to the first instant the census rings its step's next attempt, at the
 *   longest
 * @derivation a claim stands while `until >= now`, and the clock's resolution is one millisecond, so one past the
 *   lease is the first instant it no longer stands
 * @from {@link longestLeaseMillis}
 */
export const reclaimableAfterMillis = longestLeaseMillis + 1

/**
 * The first rung of every retry ladder: one census period, the soonest the census rings a step again if the wake its
 * failed turn sent with a delay is lost.
 *
 * @limitKind derived
 * @owner den's retry ladder (packages/den/src/runtime/turn.ts)
 * @unit milliseconds
 * @scope the wait from a spent attempt's end to the next attempt's due instant, at the first rung
 * @derivation the census's period, so a lost delayed wake costs at most one more rung
 * @from {@link censusPeriodSeconds}
 */
export const backoffFirstMillis = censusPeriodSeconds * 1000

/**
 * The last rung of every retry ladder: the longest lease, so a step is never due again later than a dead holder's step
 * would be reclaimed.
 *
 * @limitKind derived
 * @owner den's retry ladder (packages/den/src/runtime/turn.ts)
 * @unit milliseconds
 * @scope the wait from a spent attempt's end to the next attempt's due instant, at its longest
 * @derivation rungs double from the first until they reach the longest lease, which a reclaim waits at most
 * @from {@link longestLeaseMillis}
 */
export const backoffLastMillis = longestLeaseMillis

/** A wake a turn rings on, and its delay: `invoke` names the turn as its cause. */
export interface Onward {
	readonly wake: Wake
	readonly delay: Duration.Duration
}

/**
 * One turn, in three calls: the claim, a race at `(step, attempt)`, whose loser meets the winner's claim and goes no
 * further; the step's declared reads in one read-only call; and the commit, its result, the
 * rows its reads found, the body's writes and its spawns, in one call under the flow's app role. Before the claim the
 * turn takes a seat of each resource the step uses (the seat module), and after its last write it gives them back.
 *
 * Time is the database's: a turn judges its claim's lease, its due instant and its windows at a reading of the
 * database's instant (the ledger's `now`), stamps its claim's lease from the invocation's end in that clock and a
 * retry's due instant from a reading, and rings a timer with the duration between two readings.
 *
 * Endings come from grizzle's CallError, which a call meets once it is no longer `transient` (Settled): a write still
 * running again on transient refusals at the turn's deadline is a wait, recorded with no attempt spent; `unavailable`
 * and `transport`, which change nothing, spend an attempt, as every
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
	| "later"
	| "unread"

/**
 * How a turn ended, the proposal's endings: `done` with what it spawned; `admitted`, a root's start written; `skipped`,
 * a root not admitted because another live root of its kind holds its exclusivity seat, recorded as such; `failed`
 * by its typed error, a law that refused its commit, or its ladder's end; `retry`, an attempt spent and the next due at
 * an instant; `waiting`, no attempt spent, rung again at an instant or by the relay; `lost`, another fact already holds
 * its key; `fenced`, a call met the deployment's fault, named, on which it acknowledges its wake and exits;
 * `censused`, a period's census, with how many due wakes it rang.
 */
export type Ending =
	| { readonly kind: "done"; readonly wake: Wake; readonly spawned: Spawned }
	| { readonly kind: "admitted"; readonly wake: Wake; readonly spawned: Spawned }
	| { readonly kind: "skipped"; readonly wake: Wake; readonly by: ScopeKey }
	| { readonly kind: "failed"; readonly wake: Wake; readonly why: "error" | "law" | "attempts" }
	| { readonly kind: "retry"; readonly wake: Wake; readonly delay: Duration.Duration }
	| {
			readonly kind: "waiting"
			readonly wake: Wake
			readonly why: Wait
			readonly until: Option.Option<Instant>
	  }
	| { readonly kind: "lost"; readonly wake: Wake }
	| { readonly kind: "fenced"; readonly wake: Wake; readonly fault: Fault }
	| { readonly kind: "censused"; readonly wake: Wake; readonly rung: number }

/**
 * The deployment's faults: `stale`, the database holds another snapshot than this deployment's, and
 * `credentialRefused`, the database does not let one of this deployment's logins in. A call that meets either changed
 * nothing, and no retry of it can succeed until the deployment changes, so a turn that meets one fences: it spends no
 * attempt, which would turn one misconfiguration into a run of failed steps, records a claimed attempt as fenced, waiting
 * on the deployment, where its own login still can (`ended`), rings nothing, and names the fault in its ending. A stale
 * deployment's record never lands, since its every call meets `stale`: its claim's lapse spends the attempt, as before.
 */
export type Fault = Extract<Settled, { readonly kind: "stale" | "credentialRefused" }>

/** The deployment's fault `error` is, if it is one. */
const faultOf = (error: Settled): Option.Option<Fault> =>
	error.kind === "stale" || error.kind === "credentialRefused" ? Option.some(error) : Option.none()

/** The ending of a call's failure: fenced on the deployment's fault, `otherwise` on any other. */
const fencedOr = (error: Settled, wake: Wake, otherwise: Ending): Ending =>
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
	Math.min(backoffFirstMillis * 2 ** Math.max(0, spent - 1), backoffLastMillis)

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
export const lostRace = (flow: string, error: Settled): boolean =>
	refusedOnKey(error, [
		`${flow}Result`,
		`${flow}Held`,
		`${flow}Retry`,
		`${flow}Fenced`,
		`${flow}Admitted`,
		`${flow}Step`,
		`${flow}Root`
	]) ||
	(error.kind === "refused" &&
		Arr.some(
			error.refused.laws,
			({ law }) => law.kind === "contained" && law.from.relation === `${flow}Claim`
		))

/** The law a refusal names first, by its identity, as a Refusal row records it. */
const lawOf = (error: Extract<Settled, { readonly kind: "refused" }>): string =>
	String(error.refused.laws[0].id)

/**
 * A write within `deadline`, judged at a reading of the database's instant `clock` takes: none where it was still
 * running at the deadline, as a write run again on each transient refusal can be (Settled).
 */
export const written = <A, R>(
	write: Effect.Effect<A, Settled, R>,
	clock: Effect.Effect<Instant, Settled>,
	deadline: Instant
): Effect.Effect<Option.Option<A>, Settled, R> =>
	Effect.flatMap(clock, (at) => Effect.timeoutOption(write, delayTo(at, deadline)))

/** A step kind's typed port: its input, its declared read, its commit and its typed failure. */
export interface StepPort<I, Rows, O, E, W> {
	readonly input: (step: StepKey) => Effect.Effect<Option.Option<I>, Settled>
	readonly read: (input: I) => Effect.Effect<Rows, Settled>
	readonly commit: (done: {
		readonly turn: Turn
		readonly input: I
		readonly rows: Rows
		readonly output: O
		readonly writes: W
	}) => Effect.Effect<Committed, Settled, Digest.Digest>
	readonly fail: (failed: {
		readonly turn: Turn
		readonly input: I
		readonly rows: Rows
		readonly error: E
	}) => Effect.Effect<WriteOutcome<unknown>, Settled>
}

/**
 * What a runner runs: a step kind's body, or a finish's over its scope's input and its children's endings, which fails
 * with its typed error or with `Later`, its source's named delay.
 */
export interface Runnable<I, Rows, O, E, W, R> {
	readonly name: string
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	readonly body: (
		input: I,
		rows: Rows
	) => Effect.Effect<{ readonly output: O; readonly writes: W }, E | Later, R>
}

/** A wait for a write still running at its turn's deadline: due again at once. */
const stillRunning: Ran = { kind: "waited", why: "transient", after: atOnce }

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
	uses: runnable.uses,
	retry: runnable.retry,
	finishes,
	run: Effect.fn(`den.turn.${runnable.name}`)(function* (
		turn: Turn,
		at: Instant,
		clock: Effect.Effect<Instant, Settled>
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
			const typed = Exit.findErrorOption(exit)
			if (Option.isNone(typed)) {
				return { kind: "spent", detail: Cause.pretty(exit.cause) } satisfies Ran
			}
			const failure = typed.value
			if (failure instanceof Later) {
				return { kind: "waited", why: "later", after: failure.after } satisfies Ran
			}
			return yield* Effect.match(
				written(port.fail({ turn, input: read, rows, error: failure }), clock, turn.deadline),
				{
					onFailure: (error): Ran => ({ kind: "error", error }),
					onSuccess: (outcome): Ran => (Option.isSome(outcome) ? { kind: "failed" } : stillRunning)
				}
			)
		}
		if (Option.isNone(exit.value)) {
			return { kind: "spent", detail: "the body ran past the turn's deadline" } satisfies Ran
		}
		const { output, writes } = exit.value.value
		return yield* Effect.match(
			written(port.commit({ turn, input: read, rows, output, writes }), clock, turn.deadline),
			{
				onFailure: (error): Ran => ({ kind: "error", error }),
				onSuccess: (outcome): Ran =>
					Option.isSome(outcome) ? { kind: "committed", committed: outcome.value } : stillRunning
			}
		)
	})
})

/** The reads a turn needs, any failure but the deployment's fault a wait with no attempt spent. */
const readOr = <A>(read: Effect.Effect<A, Settled>, wake: Wake): Effect.Effect<A, Ending> =>
	Effect.mapError(read, (error) =>
		fencedOr(error, wake, { kind: "waiting", wake, why: "unread", until: Option.none() })
	)

/**
 * The ending of a write that failed: fenced on the deployment's fault, lost when another fact already holds its key,
 * and otherwise a wait with no attempt spent.
 */
const unwritten = (flow: string, error: Settled, wake: Wake): Ending =>
	fencedOr(
		error,
		wake,
		lostRace(flow, error)
			? { kind: "lost", wake }
			: { kind: "waiting", wake, why: "unread", until: Option.none() }
	)

/** The root of `scope`'s graph, read upward through its parents: none once a scope on the way is gone. */
const rootOf = <R>(
	ledger: Ledger<R>,
	scope: ScopeKey
): Effect.Effect<Option.Option<RootView>, Settled> =>
	Effect.flatMap(ledger.scopeOf(scope), (found) =>
		Option.match(found, {
			onNone: () => Effect.succeedNone,
			onSome: (s) => (s.place === "root" ? Effect.succeedSome(s) : rootOf(ledger, s.parent))
		})
	)

/** Why work under `root` keeps waiting at `at`: its root kind's window shut, or its root kind or a resource paused. */
const gate = <R>(
	ledger: Ledger<R>,
	root: Option.Option<RootView>,
	uses: ReadonlyArray<Resource>,
	at: Instant
): Effect.Effect<
	Option.Option<{ readonly why: Wait; readonly until: Option.Option<Instant> }>,
	Settled
> =>
	Effect.gen(function* () {
		const window = Option.map(root, (r) => r.runner.window)
		if (Option.exists(window, (w) => !isOpen(w, at))) {
			return Option.some({
				why: "window",
				until: Option.map(window, (w) => opensAt(w, at))
			} as const)
		}
		const live = yield* ledger.coordination.paused
		const paused = Arr.map(live, (row) => row.target)
		if (
			Option.exists(root, (r) => Arr.contains(paused, r.kind)) ||
			Arr.some(uses, (u) => Arr.contains(paused, u.name))
		) {
			return Option.some({ why: "paused", until: Option.none() } as const)
		}
		return Option.none()
	})

/** The wake for a step's next attempt, as its claims, retries and fences stand (Standing): none while a claim holds it. */
const nextWake = <R>(
	ledger: Ledger<R>,
	step: StepKey
): Effect.Effect<Option.Option<Onward>, Settled> =>
	Effect.gen(function* () {
		const at = yield* ledger.now
		const result = yield* ledger.resultOf(step)
		if (Option.isSome(result)) {
			return Option.none()
		}
		const claims = yield* ledger.claimsOf(step)
		const retries = yield* ledger.retriesOf(step)
		const fenced = yield* ledger.fencedOf(step)
		const stands = standing(claims, retries, fenced, at)
		switch (stands.kind) {
			case "held":
				return Option.none()
			case "first":
				return Option.some({ wake: stepWake(ledger.flow, step, 0n), delay: Duration.zero })
			case "next":
				return Option.some({
					wake: stepWake(ledger.flow, step, stands.attempt),
					delay: Duration.zero
				})
		}
	})

/** The wakes of what a commit or an admission spawned: each step after its delay, an exact timer, and each ready finish. */
const spawnedRings = (flow: FlowName, spawned: Spawned): ReadonlyArray<Onward> => [
	...Arr.map(spawned.steps, (s) => ({
		wake: stepWake(flow, s.step, 0n),
		delay: Duration.millis(Number(s.delay))
	})),
	...Arr.map(spawned.finishes, (finish) => ({
		wake: stepWake(flow, finish, 0n),
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
		const children = spawnedRings(ledger.flow, spawned)
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
		const parent = yield* Effect.map(ledger.scopeOf(scope), Option.flatMap(parentOf))
		const upward = Option.isSome(parent) ? yield* ready(parent.value) : Option.none()
		return [...children, ...Option.toArray(upward)]
	}).pipe(Effect.orElseSucceed((): ReadonlyArray<Onward> => []))

/**
 * How a claimed attempt ended without a result: `spent`, its attempt spent; `waited`, a wait that spends nothing, due
 * again `after` the write that records it, for a write still running or a source's named delay; or `fenced`, a call met
 * the deployment's fault, which spends nothing either.
 */
type Unfinished =
	| { readonly kind: "spent" }
	| { readonly kind: "waited"; readonly why: "transient" | "later"; readonly after: Delay }
	| { readonly kind: "fenced"; readonly fault: Fault }

/**
 * An attempt that ended without a result, recorded at a reading of the database's instant: a spent one's retry due a
 * rung later, or the step failed once its ladder is spent; a wait recorded as a retry that spent nothing, due its delay
 * after the write (at once for a write still running, the source's own for a `Later`), whose next attempt it rings
 * then; a fenced one recorded as fenced, where its own login still can, so it spends
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
					return yield* recorded(ledger, ledger.exhaust(turn), wake, {
						kind: "failed",
						wake,
						why: "attempts"
					})
				}
				const rung = rungMillis(total)
				return yield* recorded(
					ledger,
					ledger.retry({
						step: turn.step,
						root: turn.root,
						attempt: turn.attempt,
						delay: delayOf(rung),
						spent: true
					}),
					wake,
					{ kind: "retry", wake: next, delay: Duration.millis(rung) }
				)
			}
			case "waited":
				return yield* recorded(
					ledger,
					ledger.retry({
						step: turn.step,
						root: turn.root,
						attempt: turn.attempt,
						delay: how.after,
						spent: false
					}),
					wake,
					{
						kind: "waiting",
						wake: next,
						why: how.why,
						until: Option.some(instantOf(Number(at) + Number(how.after)))
					}
				)
			case "fenced":
				return yield* recorded(
					ledger,
					ledger.fence({ step: turn.step, root: turn.root, attempt: turn.attempt }),
					wake,
					{ kind: "fenced", wake, fault: how.fault }
				)
		}
	}).pipe(Effect.catch((ending: Ending) => Effect.succeed(ending)))

/** The ending a write's outcome gives: `ok` once written, lost when another fact holds its key, else a wait. */
const recorded = <R>(
	ledger: Ledger<R>,
	write: Effect.Effect<WriteOutcome<unknown>, Settled>,
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
			return ended(ledger, runner, turn, spentSoFar, ran, wake)
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
						: recorded(ledger, ledger.refuse(turn, lawOf(error)), wake, {
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
				case "unavailable":
				case "transport":
				case "input":
				case "paramRejected":
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

/**
 * A claim's end: the attempt the database stamped with the seats its write holds, or the ending of a claim that found no
 * seat, lost or failed.
 */
type Claimed =
	| { readonly kind: "claimed"; readonly attempt: bigint; readonly seats: ReadonlyArray<SeatAt> }
	| { readonly kind: "ended"; readonly ending: Ending }

/**
 * Claims a step's next attempt for `budget` with one seat of each resource it uses, in one write: the attempt the
 * database stamped; waiting on seats when some resource has no seat free at `at`; lost when another claim of the step
 * stands unended; or the ending of a write that failed. A seat another claim took between the read and the claim
 * refuses the claim whole on the live holds' key, and the seats are picked again from a fresh read, so it ends once it
 * claims or finds no seat free.
 */
const claimSeated = <R>(
	ledger: Ledger<R>,
	at: Instant,
	wake: Wake,
	claim: Rooted<Omit<ClaimOf, "seats">>,
	uses: ReadonlyArray<Resource>
): Effect.Effect<Claimed, Ending> =>
	Effect.gen(function* () {
		const live = Arr.isReadonlyArrayEmpty(uses) ? [] : yield* readOr(ledger.holds, wake)
		const taken = seatsFor(uses, live, at)
		if (Option.isNone(taken)) {
			return {
				kind: "ended",
				ending: { kind: "waiting", wake, why: "seats", until: Option.none() }
			} satisfies Claimed
		}
		const lapsed = [
			...claim.lapsed,
			...Arr.map(taken.value.lapsed, (h) => ({ step: h.step, root: h.root, attempt: h.attempt }))
		]
		const outcome = yield* Effect.result(
			ledger.claim({ ...claim, seats: taken.value.seats, lapsed })
		)
		if (outcome._tag === "Success") {
			return {
				kind: "claimed",
				attempt: outcome.success,
				seats: taken.value.seats
			} satisfies Claimed
		}
		if (seatTaken(ledger.flow, outcome.failure)) {
			return yield* claimSeated(ledger, at, wake, claim, uses)
		}
		return {
			kind: "ended",
			ending: unwritten(ledger.flow, outcome.failure, wake)
		} satisfies Claimed
	})

/**
 * Serves one wake of a step's attempt: refuses a wake that names no pending step or not its next attempt, waits for its
 * due instant, its windows, its pauses and, for a finish, its scope's last child; fails it once its ladder is spent;
 * claims it with its seats in one write, its lease the time its invocation has left at its reading of the database's
 * instant, so the lease ends at `ends` (its invocation's end) read from the claim's own clock, runs its kind's turn, whose end gives its
 * seats back, and rings on what its end made eligible.
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
		const { runner, scope, root, due: first } = located.value
		const result = yield* readOr(ledger.resultOf(step), wake)
		if (Option.isSome(result)) {
			return served({ kind: "lost", wake })
		}
		const claims = yield* readOr(ledger.claimsOf(step), wake)
		const retries = yield* readOr(ledger.retriesOf(step), wake)
		const fenced = yield* readOr(ledger.fencedOf(step), wake)
		const stands = standing(claims, retries, fenced, at)
		if (stands.kind === "held") {
			return served({ kind: "lost", wake })
		}
		const next = stands.kind === "next" ? stands.attempt : 0n
		if (BigInt(wake.attempt) !== next) {
			return served({ kind: "lost", wake })
		}
		const due = stands.kind === "next" ? stands.due : first
		if (due > at) {
			return {
				ending: { kind: "waiting", wake, why: "due", until: Option.some(due) },
				onward: [{ wake, delay: delayTo(at, due) }]
			} satisfies Served
		}
		const graph = yield* readOr(rootOf(ledger, scope), wake)
		const shut = yield* readOr(gate(ledger, graph, runner.uses, at), wake)
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
		const deadline = instantOf(Number(ends) - leaseMarginMillis)
		const budget = delayOf(Number(ends) - Number(at))
		const exhausted = !allows(runner.retry, spentSoFar)
		const lapsed = Arr.map(
			Option.toArray(lapsedAttempt(claims, retries, fenced, at)),
			(attempt) => ({
				step,
				root,
				attempt
			})
		)
		const claimed = yield* claimSeated(
			ledger,
			at,
			wake,
			{ step, root, budget, lapsed },
			exhausted ? [] : runner.uses
		)
		if (claimed.kind === "ended") {
			return served(claimed.ending)
		}
		const turn: Turn = { step, root, attempt: claimed.attempt, scope, deadline }
		if (exhausted) {
			const failed = yield* recorded(ledger, ledger.exhaust(turn), wake, {
				kind: "failed",
				wake,
				why: "attempts"
			})
			return {
				ending: failed,
				onward: yield* settledOn(ledger, runner, scope, failed, claimed.seats)
			}
		}
		const ran = yield* runner.run(turn, at, ledger.now)
		const ending = yield* endingOf(ledger, runner, turn, ran, spentSoFar, wake)
		return { ending, onward: yield* settledOn(ledger, runner, scope, ending, claimed.seats) }
	})

/**
 * The waiters a claimed attempt's end rings, once it gave back `freed`: the steps eligibility finds due at a fresh
 * reading of the scheduler's snapshot, one statement, that wait on a resource it held a seat of, as many as the seats it
 * finds free, the oldest root first. A step that found no seat free ended waiting and rang nothing, so the end of the
 * attempt that held the seat rings it, as that end made it eligible; without it, a fan-out of N steps on S seats would
 * run S at each census tick. An attempt that held no seat reads nothing. A read that fails rings nothing: the census
 * heals it.
 */
const waitersOf = <R>(
	ledger: Ledger<R>,
	freed: ReadonlyArray<SeatAt>
): Effect.Effect<ReadonlyArray<Onward>> =>
	Arr.isReadonlyArrayEmpty(freed)
		? Effect.succeed([])
		: Effect.zipWith(ledger.snapshot, ledger.now, (snapshot, at) => {
				const waits = (wake: Wake): boolean =>
					wake._tag === "Step" &&
					Arr.some(
						snapshot.steps,
						(p) =>
							p.step === wake.step &&
							Arr.some(p.runner.uses, (r) => Arr.some(freed, (seat) => seat.resource === r.name))
					)
				return Arr.map(Arr.filter(eligible(ledger, snapshot, at).wakes, waits), (wake): Onward => ({
					wake,
					delay: Duration.zero
				}))
			}).pipe(Effect.orElseSucceed((): ReadonlyArray<Onward> => []))

/**
 * What an ending rings on: a step's end settles its scope; a retry or a timed wait rings its own next attempt; and an
 * attempt that held seats, `freed`, rings the waiters its end made eligible (waitersOf), whatever its ending.
 */
const settledOn = <R>(
	ledger: Ledger<R>,
	runner: StepRunner<R>,
	scope: ScopeKey,
	ending: Ending,
	freed: ReadonlyArray<SeatAt>
): Effect.Effect<ReadonlyArray<Onward>, never, Digest.Digest> => {
	const ringAt = (wake: Wake, until: Instant): Effect.Effect<ReadonlyArray<Onward>> =>
		Effect.match(ledger.now, {
			onFailure: (): ReadonlyArray<Onward> => [],
			onSuccess: (at) => [{ wake, delay: delayTo(at, until) }]
		})
	const own = ((): Effect.Effect<ReadonlyArray<Onward>, never, Digest.Digest> => {
		switch (ending.kind) {
			case "done":
				return settled(ledger, runner, scope, ending.spawned)
			case "failed":
				return settled(ledger, runner, scope, { steps: [], finishes: [] })
			case "retry":
				return Effect.succeed([{ wake: ending.wake, delay: ending.delay }])
			case "waiting":
				return Option.match(ending.until, {
					onNone: () => Effect.succeed([]),
					onSome: (until) => ringAt(ending.wake, until)
				})
			case "admitted":
			case "skipped":
			case "lost":
			case "fenced":
			case "censused":
				return Effect.succeed([])
		}
	})()
	return Effect.zipWith(own, waitersOf(ledger, freed), (mine, waiters) => [...mine, ...waiters])
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
		if (
			Option.isNone(viewed) ||
			viewed.value.place === "child" ||
			viewed.value.admission !== "requested"
		) {
			return served({ kind: "lost", wake })
		}
		const view = viewed.value
		const root = view.runner
		const shut = yield* readOr(gate(ledger, Option.some(view), [], at), wake)
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
			const busy = yield* readOr(ledger.busy, wake)
			if (Arr.some(precondition.flows, (f) => Arr.contains(busy, f))) {
				return served({ kind: "waiting", wake, why: "precondition", until: Option.none() })
			}
		}
		if (Option.isSome(view.exclusive)) {
			const key = view.exclusive.value
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
		const admitted = yield* Effect.result(root.admit(scope))
		if (admitted._tag === "Failure") {
			return served(unwritten(ledger.flow, admitted.failure, wake))
		}
		if (Option.isNone(admitted.success)) {
			return served({ kind: "lost", wake })
		}
		const spawned = admitted.success.value.spawned
		return {
			ending: { kind: "admitted", wake, spawned },
			onward: spawnedRings(ledger.flow, spawned)
		}
	})

/**
 * The flows an app runs, each its ledger: at least one, an app's whole set, which a census ticks and whose first's
 * clock, the database's, it reads.
 */
export type Ledgers<R> = Arr.NonEmptyReadonlyArray<Ledger<R>>

/** The ledger of the flow a wake names, none for a flow the app does not run. */
const ledgerOf = <R>(ledgers: Ledgers<R>, flow: FlowName): Option.Option<Ledger<R>> =>
	Arr.findFirst(ledgers, (ledger) => ledger.flow === flow)

/**
 * Serves a period's census (runtime/census.ts): every flow's due wakes rung at once and the next period's census when
 * it starts. A census that read nothing still rings the next.
 */
const serveCensus = <R>(
	ledgers: Ledgers<R>,
	wake: Extract<Wake, { readonly _tag: "Census" }>
): Effect.Effect<Served, never, Digest.Digest> =>
	census(ledgers).pipe(
		Effect.match({
			onFailure: (): Served => ({ ending: { kind: "censused", wake, rung: 0 }, onward: [] }),
			onSuccess: (done): Served => ({
				ending: { kind: "censused", wake, rung: done.due.length },
				onward: [
					...Arr.map(done.due, (due): Onward => ({ wake: due, delay: Duration.zero })),
					done.next
				]
			})
		})
	)

/**
 * Serves one wake under the invocation that ends at `ends`. It never fails: every failure is an ending, and the runtime
 * acknowledges every wake.
 */
export const serve = <R>(
	ledgers: Ledgers<R>,
	wake: Wake,
	ends: Instant
): Effect.Effect<Served, never, R | Digest.Digest> => {
	switch (wake._tag) {
		case "Census":
			return serveCensus(ledgers, wake)
		case "Step":
		case "Admit":
			return Option.match(ledgerOf(ledgers, wake.flow), {
				onNone: () => Effect.succeed(served({ kind: "lost", wake })),
				onSome: (ledger) =>
					(wake._tag === "Step" ? serveStep(ledger, wake, ends) : serveAdmit(ledger, wake)).pipe(
						Effect.catch((ending: Ending) => Effect.succeed(served(ending)))
					)
			})
	}
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
		/**
		 * A reading of the database's instant: by the ledger a wake names, or by the first flow's for a census; the ending
		 * of a wake no ledger serves.
		 */
		const readingOf = (serving: Wake): Effect.Effect<Instant, Ending> => {
			switch (serving._tag) {
				case "Census":
					return readOr(Arr.headNonEmpty(ledgers).now, serving)
				case "Step":
				case "Admit":
					return Option.match(ledgerOf(ledgers, serving.flow), {
						onNone: () => Effect.fail<Ending>({ kind: "lost", wake: serving }),
						onSome: (ledger) => readOr(ledger.now, serving)
					})
			}
		}
		const loop = (
			serving: Wake,
			at: Instant,
			end: Instant,
			endings: ReadonlyArray<Ending>
		): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport> =>
			Effect.gen(function* () {
				const cause = { _tag: "Turn", by: serving, at: Number(at) } as const
				if (Number(at) + leaseMarginMillis >= Number(end)) {
					yield* transport.send([{ wake: serving, delay: Duration.zero, cause }])
					return endings
				}
				const turn = yield* serve(ledgers, serving, end)
				const rung = Arr.map(turn.onward, (o): Ring => ({ ...o, cause }))
				const [first, ...rest] = rung
				const sofar = [...endings, turn.ending]
				if (first === undefined || !Duration.isZero(first.delay)) {
					yield* transport.send(rung)
					return sofar
				}
				yield* transport.send(rest)
				const next = yield* Effect.result(readingOf(first.wake))
				return next._tag === "Failure"
					? [...sofar, next.failure]
					: yield* loop(first.wake, next.success, end, sofar)
			})
		const started = yield* Effect.result(readingOf(wake))
		return started._tag === "Failure"
			? [started.failure]
			: yield* loop(
					wake,
					started.success,
					instantOf(Number(started.success) + Duration.toMillis(budget)),
					[]
				)
	})
