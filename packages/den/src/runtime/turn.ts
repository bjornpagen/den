import type { CallError, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Clock, Cron, Duration, Effect, Exit, Option, Random } from "effect"
import type { Digest } from "effect/crypto"
import { finishName } from "#algebra/flow.ts"
import type { Lane } from "#algebra/kinds.ts"
import { leaseMillis } from "#limits.ts"
import {
	finishStep,
	holderOf,
	type Instant,
	instantOf,
	type ScopeKey,
	type StepKey
} from "#runtime/identity.ts"
import type { Ending, KindPort, Ledger, Ran, Runner, Spawned, Turn } from "#runtime/ledger.ts"
import { AttemptNumber, LaneName, Transport, type Wake, WakeSchema } from "#transport.ts"

/**
 * One turn of a step: claim it, a key race on `(step, attempt)`; run its body under the claim's deadline; commit its
 * result, its output, its spawns and its writes in one grizzle call. Endings come from grizzle's CallError: `transient`
 * is a wait, retried within the deadline with no attempt spent; `unavailable` and `transport` spend the attempt;
 * `refused` is `lost` when the law is a key another fact already holds, and `failed` naming the law otherwise; `stale`
 * is the deploy fence, on which this deployment acknowledges its wake and exits.
 */

/** Something a body runs: its name, lane and body, a step kind's or a finish's. */
export interface Runnable<I, O, E, W, R> {
	readonly name: string
	readonly lane: Lane
	readonly body: (input: I) => Effect.Effect<{ readonly output: O; readonly writes: W }, E, R>
}

/** Retries a write while SERIALIZABLE refuses it as transient, which changed nothing, within `deadline`. */
const written = <A, R>(
	write: Effect.Effect<A, CallError, R>,
	deadline: Duration.Duration
): Effect.Effect<Option.Option<A>, CallError, R> =>
	Effect.timeoutOption(
		Effect.retry(write, { while: (error) => error.kind === "transient" }),
		deadline
	)

/** A kind's runner: its input, its body under the claim's deadline, and the write its exit decides. */
export const runner = <I, O, E, W, R>(
	runnable: Runnable<I, O, E, W, R>,
	port: KindPort<I, O, E, W>
): Runner<R> => ({
	kind: runnable.name,
	lane: runnable.lane,
	run: (turn) =>
		Effect.gen(function* () {
			const now = yield* Clock.currentTimeMillis
			const deadline = Duration.millis(Math.max(0, Number(turn.until) - now))
			const input = yield* Effect.exit(port.input(turn.step, turn.scope))
			if (Exit.isFailure(input)) {
				return yield* Effect.match(Effect.failCause(input.cause), {
					onFailure: (error): Ran => ({ kind: "error", error }),
					onSuccess: (): Ran => ({ kind: "spent" })
				})
			}
			if (Option.isNone(input.value)) {
				return { kind: "spent" } satisfies Ran
			}
			const read = input.value.value
			const exit = yield* Effect.exit(Effect.timeoutOption(runnable.body(read), deadline))
			if (Exit.isFailure(exit)) {
				const failure = Option.getOrUndefined(Exit.findErrorOption(exit))
				if (failure === undefined) {
					return { kind: "spent" } satisfies Ran
				}
				return yield* Effect.match(
					written(port.fail({ step: turn.step, attempt: turn.attempt, error: failure }), deadline),
					{
						onFailure: (error): Ran => ({ kind: "error", error }),
						onSuccess: (outcome): Ran =>
							Option.isSome(outcome) ? { kind: "failed" } : { kind: "spent" }
					}
				)
			}
			if (Option.isNone(exit.value)) {
				return { kind: "spent" } satisfies Ran
			}
			const { output, writes } = exit.value.value
			return yield* Effect.match(
				written(
					port.commit({
						step: turn.step,
						attempt: turn.attempt,
						scope: turn.scope,
						input: read,
						output,
						writes
					}),
					deadline
				),
				{
					onFailure: (error): Ran => ({ kind: "error", error }),
					onSuccess: (committed): Ran =>
						Option.isSome(committed)
							? { kind: "committed", committed: committed.value }
							: { kind: "spent" }
				}
			)
		})
})

/**
 * Whether a refusal is a key race this turn lost: the step's Result or Held already held by another attempt's commit,
 * its Claim at this attempt by another holder, or the attempt before this one never claimed (a stale or forged wake).
 */
export const lostRace = (prefix: string, error: CallError): boolean =>
	error.kind === "refused" &&
	Arr.some(
		error.refused.laws,
		({ law }) =>
			(law.kind === "primaryKey" &&
				(law.relation === `${prefix}Result` ||
					law.relation === `${prefix}Held` ||
					law.relation === `${prefix}Claim`)) ||
			(law.kind === "contained" && law.from.relation === `${prefix}Claim`)
	)

/** The law a refusal names first, by its identity, as a Refusal row records it. */
const lawOf = (error: Extract<CallError, { readonly kind: "refused" }>): string =>
	String(error.refused.laws[0].id)

const nothingSpawned: Spawned = { steps: [], scopes: [] }

/** The ending a write's outcome gives: lost when another fact already held its key, else `ok`. */
const recorded = <R>(
	ledger: Ledger<R>,
	step: StepKey,
	write: Effect.Effect<WriteOutcome<unknown>, CallError>,
	ok: Ending,
	due: Instant
): Effect.Effect<Ending> =>
	Effect.match(write, {
		onFailure: (error): Ending =>
			error.kind === "stale"
				? { kind: "fenced", step }
				: lostRace(ledger.prefix, error)
					? { kind: "lost", step }
					: { kind: "retry", step, due, spent: true },
		onSuccess: (): Ending => ok
	})

/** The ending of what a runner did, recording a refusal, and reading back a commit whose answer never came. */
const endingOf = <R>(ledger: Ledger<R>, turn: Turn, ran: Ran): Effect.Effect<Ending> => {
	const step = turn.step
	switch (ran.kind) {
		case "committed":
			return Effect.succeed({ kind: "done", step, spawned: ran.committed.spawned })
		case "failed":
			return Effect.succeed({ kind: "failed", step, why: "error" })
		case "spent":
			return Effect.succeed({ kind: "retry", step, due: turn.until, spent: true })
		case "error": {
			const error = ran.error
			switch (error.kind) {
				case "stale":
					return Effect.succeed({ kind: "fenced", step })
				case "refused":
					return lostRace(ledger.prefix, error)
						? Effect.succeed({ kind: "lost", step })
						: recorded(
								ledger,
								step,
								ledger.refuse(step, turn.attempt, lawOf(error)),
								{ kind: "failed", step, why: "law" },
								turn.until
							)
				case "commitUnknown":
					return Effect.match(ledger.heldOf(step), {
						onFailure: (): Ending => ({ kind: "retry", step, due: turn.until, spent: true }),
						onSuccess: (held): Ending =>
							Option.contains(held, turn.attempt)
								? { kind: "done", step, spawned: nothingSpawned }
								: { kind: "retry", step, due: turn.until, spent: true }
					})
				case "transient":
					return Effect.succeed({ kind: "retry", step, due: turn.until, spent: false })
				case "unavailable":
				case "transport":
				case "input":
				case "outsideWorld":
				case "route":
				case "tokenRefused":
				case "tokenExpired":
				case "failed":
					return Effect.succeed({ kind: "retry", step, due: turn.until, spent: true })
			}
		}
	}
}

/** A read the turn needs; a read never commits, so any failure but the fence is a wait. */
const readOr = <A>(
	read: Effect.Effect<A, CallError>,
	step: StepKey,
	now: Instant
): Effect.Effect<A, Ending> =>
	Effect.mapError(read, (error): Ending =>
		error.kind === "stale"
			? { kind: "fenced", step }
			: { kind: "retry", step, due: now, spent: false }
	)

/** The wake for a pending step of a kind that runs, at `attempt`; none for an await, which no turn runs. */
export const wakeOf = <R>(
	ledger: Ledger<R>,
	step: StepKey,
	kind: string,
	attempt: number
): Option.Option<Wake> =>
	Option.map(Option.fromNullishOr(ledger.runners.get(kind)), (found) =>
		WakeSchema.make({
			lane: LaneName.make(found.lane.name),
			step,
			attempt: AttemptNumber.make(attempt)
		})
	)

/**
 * Settles a scope: when every step in it has a result and every child scope has finished, inserts its finish step, a
 * key race on the scope that two settlers win alike, and gives that step's wake. Sound because only a child's own
 * commit, made before it has a result, can add a sibling.
 */
export const settle = <R>(
	ledger: Ledger<R>,
	scope: ScopeKey
): Effect.Effect<Option.Option<Wake>, CallError, Digest.Digest> =>
	Effect.gen(function* () {
		const steps = yield* ledger.stepsIn(scope)
		const scopes = yield* ledger.scopesIn(scope)
		if (!Arr.every(steps, (c) => c.done) || !Arr.every(scopes, (c) => c.done)) {
			return Option.none()
		}
		const join = yield* ledger.joinOf(scope)
		if (Option.isNone(join)) {
			return Option.none()
		}
		const kind = finishName({ name: join.value })
		const step = yield* finishStep(scope)
		yield* ledger.finish(scope, step, kind)
		return wakeOf(ledger, step, kind, 1)
	})

/** The scopes a done step's commit may have completed: its own, a finish's parent instead, and each child it started. */
const touched = <R>(
	ledger: Ledger<R>,
	kind: string,
	scope: ScopeKey,
	spawned: Spawned
): Effect.Effect<ReadonlyArray<ScopeKey>, CallError> =>
	Effect.map(
		ledger.finishKinds.has(kind) ? ledger.parentOf(scope) : Effect.succeedSome(scope),
		(own) => [...Option.toArray(own), ...spawned.scopes]
	)

/** What a turn sends on: the wakes of the steps its commit spawned, and of the finishes the scopes it completed run. */
const onward = <R>(
	ledger: Ledger<R>,
	kind: string,
	scope: ScopeKey,
	spawned: Spawned
): Effect.Effect<ReadonlyArray<Wake>, never, Digest.Digest> =>
	Effect.gen(function* () {
		const scopes = yield* touched(ledger, kind, scope, spawned)
		const finishes = yield* Effect.forEach(scopes, (s) => settle(ledger, s))
		return [
			...Arr.flatMap(spawned.steps, (s) => Option.toArray(wakeOf(ledger, s.step, s.kind, 1))),
			...Arr.flatMap(finishes, Option.toArray)
		]
	}).pipe(Effect.orElseSucceed((): ReadonlyArray<Wake> => []))

/** Whether `now` lies in a lane's window, and when it next opens if it does not. */
const opened = (lane: Lane, now: number): Option.Option<Instant> => {
	switch (lane.window.kind) {
		case "always":
			return Option.none()
		case "cron":
			return Cron.match(lane.window.cron, now)
				? Option.none()
				: Option.some(instantOf(Cron.next(lane.window.cron, now).getTime()))
	}
}

/** A turn's ending and the wakes it sends on. */
export interface Served {
	readonly ending: Ending
	readonly onward: ReadonlyArray<Wake>
}

const served = (ending: Ending): Served => ({ ending, onward: [] })

/**
 * Serves one wake: finds its step, refuses a wake that names no pending step of its lane, waits outside the lane's
 * window, claims the step at the wake's attempt for one lease, fails it once its lane's ceiling of attempts is spent,
 * runs its kind's turn, and, when it is done, settles the scopes it may have completed. It never fails: every failure
 * is an ending, and the runtime acknowledges every wake.
 */
export const serve = <R>(
	ledger: Ledger<R>,
	wake: Wake
): Effect.Effect<Served, never, R | Digest.Digest> =>
	Effect.gen(function* () {
		const step = wake.step
		const millis = yield* Clock.currentTimeMillis
		const now = instantOf(millis)
		const located = yield* readOr(ledger.stepOf(step), step, now)
		if (Option.isNone(located)) {
			return served({ kind: "lost", step })
		}
		const { kind, scope } = located.value
		const kindRunner = ledger.runners.get(kind)
		if (kindRunner === undefined || kindRunner.lane.name !== wake.lane) {
			return served({ kind: "lost", step })
		}
		const result = yield* readOr(ledger.resultOf(step), step, now)
		if (Option.isSome(result)) {
			return served({ kind: "lost", step })
		}
		const closed = opened(kindRunner.lane, millis)
		if (Option.isSome(closed)) {
			return served({ kind: "retry", step, due: closed.value, spent: false })
		}
		const turn = yield* Effect.mapError(
			claimed(ledger, step, wake.attempt, scope),
			(error): Ending =>
				error.kind === "stale"
					? { kind: "fenced", step }
					: lostRace(ledger.prefix, error)
						? { kind: "lost", step }
						: { kind: "retry", step, due: now, spent: false }
		)
		if (wake.attempt > kindRunner.lane.attempts) {
			const exhausted = yield* recorded(
				ledger,
				step,
				ledger.exhaust(step, turn.attempt),
				{ kind: "failed", step, why: "attempts" },
				turn.until
			)
			return served(exhausted)
		}
		const ran = yield* kindRunner.run(turn)
		const ending = yield* endingOf(ledger, turn, ran)
		if (ending.kind !== "done") {
			return served(ending)
		}
		const wakes = yield* onward(ledger, kind, scope, ending.spawned)
		return { ending, onward: wakes }
	}).pipe(Effect.catch((ending: Ending) => Effect.succeed(served(ending))))

/**
 * Claims `step` at `attempt` for one lease from the runtime's clock, under a holder of this turn's own: the key race
 * on the Claim's primary key `(step, attempt)`, which a second claimer of the attempt loses. The claim protocol the
 * seam LEASE replaces.
 */
export const claimed = <R>(
	ledger: Ledger<R>,
	step: StepKey,
	attempt: number,
	scope: ScopeKey
): Effect.Effect<Turn, CallError, Digest.Digest> =>
	Effect.gen(function* () {
		const millis = yield* Clock.currentTimeMillis
		const nonce = yield* Random.nextInt
		const holder = yield* holderOf(step, attempt, nonce)
		const until = instantOf(millis + leaseMillis.value)
		const claim = { step, attempt: BigInt(attempt), holder, until }
		yield* ledger.claim(claim)
		const turn: Turn = { step, attempt: claim.attempt, scope, until }
		return turn
	})

/**
 * One invocation: serves the wake it was woken for, then the wakes its own turns send on while its budget allows, and
 * sends the rest on as its continuation, so no step waits for a delivery its invocation could have run itself.
 */
export const invoke = <R>(
	ledger: Ledger<R>,
	wake: Wake,
	budget: Duration.Duration
): Effect.Effect<ReadonlyArray<Ending>, never, R | Digest.Digest | Transport> =>
	Effect.gen(function* () {
		const started = yield* Clock.currentTimeMillis
		const ends = Duration.toMillis(budget) + started
		const endings: Array<Ending> = []
		let queue: ReadonlyArray<Wake> = [wake]
		while (Arr.isReadonlyArrayNonEmpty(queue) && (yield* Clock.currentTimeMillis) < ends) {
			const [next, ...rest] = queue
			const turn = yield* serve(ledger, next)
			endings.push(turn.ending)
			queue = [...rest, ...turn.onward]
		}
		const transport = yield* Transport
		yield* transport.send(queue)
		return endings
	})

/**
 * What a root's start, or an await's completion, sends on: the wakes of the steps it spawned, and the finishes of the
 * scopes it left complete (a scope started with no children is complete at once).
 */
export const begin = <R>(
	ledger: Ledger<R>,
	spawned: Spawned
): Effect.Effect<ReadonlyArray<Wake>, CallError, Digest.Digest | Transport> =>
	Effect.gen(function* () {
		const finishes = yield* Effect.forEach(spawned.scopes, (s) => settle(ledger, s))
		const wakes = [
			...Arr.flatMap(spawned.steps, (s) => Option.toArray(wakeOf(ledger, s.step, s.kind, 1))),
			...Arr.flatMap(finishes, Option.toArray)
		]
		const transport = yield* Transport
		yield* transport.send(wakes)
		return wakes
	})

/** The ending a runner's turn gives, as serve concludes it: a refusal recorded, an unanswered commit read back. */
export const concluded = endingOf
