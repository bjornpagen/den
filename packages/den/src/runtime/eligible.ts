import { Array as Arr, DateTime, HashMap, Option, Order } from "effect"
import { HOURS_IN_DAY, type Resource, type Window } from "#algebra/kinds.ts"
import { type Instant, instantOf, type ScopeKey, type StepKey } from "#runtime/identity.ts"
import {
	type ExclusiveRow,
	type Ledger,
	parentOf,
	type RootView,
	type ScopeView,
	type Snapshot
} from "#runtime/ledger.ts"
import { AttemptNumber, type Wake } from "#transport.ts"

/**
 * Eligibility (§7, the issue's law, durable), as a pure function of a snapshot and an instant, which the relay and the
 * census share. A step may run once its parent ended (an edge's child is spawned by its parent's commit, so its parent
 * has; a finish waits for every child of its scope), its due instant passed (or, its latest attempt fenced on a refused
 * credential, the deployment let in again, which the census asks), its root's window is open, nothing it
 * touches is paused (its root kind, its resources), and a seat of every resource it uses is
 * free. A root is rung for its admission once its window is open, its kind is not paused and its precondition holds;
 * its admission takes its exclusivity seat or records it skipped. When seats are contended, the oldest root goes first,
 * then the earliest due, so nothing starves; there is no priority or fairness key.
 */

/** Whether a window is open at `at`. */
export const isOpen = (window: Window, at: Instant): boolean => {
	switch (window.kind) {
		case "always":
			return true
		case "utcHours": {
			const hour = DateTime.getPartUtc(DateTime.makeUnsafe(Number(at)), "hour")
			return hour >= window.opens && hour < window.closes
		}
	}
}

/** The next instant a window opens at or after `at`. */
export const opensAt = (window: Window, at: Instant): Instant => {
	switch (window.kind) {
		case "always":
			return at
		case "utcHours": {
			if (isOpen(window, at)) {
				return at
			}
			const day = DateTime.startOf(DateTime.makeUnsafe(Number(at)), "day")
			const today = DateTime.add(day, { hours: window.opens })
			const next =
				DateTime.toEpochMillis(today) > Number(at)
					? today
					: DateTime.add(today, { hours: HOURS_IN_DAY })
			return instantOf(DateTime.toEpochMillis(next))
		}
	}
}

/**
 * What eligibility found: the wakes to ring now; the wakes of steps whose latest attempt was fenced on a refused
 * credential, which wait on the deployment rather than on time, so only the census rings them, once the commits' login
 * is let in; and the exclusivity seats of finished scopes to give back.
 */
export interface Eligible {
	readonly wakes: ReadonlyArray<Wake>
	readonly fenced: ReadonlyArray<Wake>
	readonly release: ReadonlyArray<ExclusiveRow>
}

/**
 * A candidate step: its wake's parts, the resources it needs, its order key, and what it waited on: `time`, its due
 * instant, or `deployment`, its latest attempt fenced.
 */
interface Candidate {
	readonly step: StepKey
	readonly attempt: bigint
	readonly uses: ReadonlyArray<Resource>
	readonly age: Instant
	readonly due: Instant
	readonly waited: "time" | "deployment"
}

const BY_ORDER: Order.Order<Candidate> = Order.combine(
	Order.combine(
		Order.mapInput(Order.BigInt, (c: Candidate) => c.age),
		Order.mapInput(Order.BigInt, (c: Candidate) => c.due)
	),
	Order.mapInput(Order.String, (c: Candidate) => c.step)
)

/** A claim of a step's attempt, as far as its standing reads it: the attempt and its lease's end. */
interface Claimed {
	readonly attempt: bigint
	readonly until: Instant
}

/** Claims, latest attempt first. */
const LATEST: Order.Order<Claimed> = Order.flip(
	Order.mapInput(Order.BigInt, (c: Claimed) => c.attempt)
)

/**
 * Where a step's attempts stand at `at`, the one reading of a step's claims, retries and fences that the relay's and
 * the census's eligibility and a turn share: `first`, never claimed, its first attempt due at its step's due; `held`, its
 * latest claim's lease stands and its attempt recorded neither a retry nor a fence, either of which ended it; or
 * `next`, its next attempt, due at once after a fence (waiting on the deployment), at its retry's instant, or once its
 * latest claim's lease lapsed.
 */
export type Standing =
	| { readonly kind: "first" }
	| { readonly kind: "held" }
	| {
			readonly kind: "next"
			readonly attempt: bigint
			readonly due: Instant
			readonly waited: "time" | "deployment"
	  }

/** Where a step's attempts stand at `at`, from its claims, retries and fences. */
export const standing = (
	claims: ReadonlyArray<Claimed>,
	retries: ReadonlyArray<{ readonly attempt: bigint; readonly at: Instant }>,
	fenced: ReadonlyArray<{ readonly attempt: bigint }>,
	at: Instant
): Standing =>
	Option.match(Arr.head(Arr.sort(claims, LATEST)), {
		onNone: (): Standing => ({ kind: "first" }),
		onSome: (latest): Standing => {
			const attempt = latest.attempt + 1n
			if (Arr.some(fenced, (f) => f.attempt === latest.attempt)) {
				return { kind: "next", attempt, due: at, waited: "deployment" }
			}
			return Option.match(
				Arr.findFirst(retries, (r) => r.attempt === latest.attempt),
				{
					onSome: (retry): Standing => ({ kind: "next", attempt, due: retry.at, waited: "time" }),
					onNone: (): Standing =>
						latest.until >= at
							? { kind: "held" }
							: { kind: "next", attempt, due: instantOf(Number(latest.until) + 1), waited: "time" }
				}
			)
		}
	})

/** The wakes due at `now` in a snapshot, and the exclusivity seats to give back. */
export const eligible = <R>(ledger: Ledger<R>, snapshot: Snapshot<R>, now: Instant): Eligible => {
	const scopes = HashMap.fromIterable(Arr.map(snapshot.scopes, (s) => [s.scope, s] as const))
	const view = (scope: ScopeKey): Option.Option<ScopeView> => HashMap.get(scopes, scope)
	const rootOf = (scope: ScopeKey): Option.Option<RootView> =>
		Option.flatMap(view(scope), (s) => (s.place === "root" ? Option.some(s) : rootOf(s.parent)))
	const open = (root: RootView): boolean => isOpen(root.runner.window, now)
	const paused = (target: string): boolean => Arr.contains(snapshot.paused, target)
	const admissions = Arr.filter(snapshot.scopes, (s) => {
		if (s.place === "child" || s.admission !== "requested" || !open(s) || paused(s.kind)) {
			return false
		}
		const precondition = s.runner.precondition
		return !(
			precondition.kind === "idle" &&
			Arr.some(precondition.flows, (f) => Arr.contains(snapshot.busy, f))
		)
	})

	const unended = (scope: ScopeKey, except: StepKey): boolean =>
		Arr.some(snapshot.steps, (p) => p.scope === scope && p.step !== except) ||
		Arr.some(snapshot.scopes, (s) => Option.contains(parentOf(s), scope))

	const candidates = Arr.flatMap(snapshot.steps, (p): ReadonlyArray<Candidate> => {
		const runner = p.runner
		const root = rootOf(p.scope)
		if (Option.isNone(view(p.scope)) || Option.isNone(root)) {
			return []
		}
		const stands = standing(
			Arr.filter(snapshot.claims, (c) => c.step === p.step),
			Arr.filter(snapshot.retries, (r) => r.step === p.step),
			Arr.filter(snapshot.fenced, (f) => f.step === p.step),
			now
		)
		if (stands.kind === "held") {
			return []
		}
		const { attempt, due, waited } =
			stands.kind === "next"
				? stands
				: {
						attempt: 1n,
						due: p.due,
						waited: "time" as const
					}
		if (due > now) {
			return []
		}
		if (Option.isSome(runner.finishes) && unended(p.scope, p.step)) {
			return []
		}
		if (
			!open(root.value) ||
			paused(root.value.kind) ||
			Arr.some(runner.uses, (r) => paused(r.name))
		) {
			return []
		}
		return [{ step: p.step, attempt, uses: runner.uses, age: root.value.at, due, waited }]
	})

	const held = (r: Resource): number =>
		Arr.filter(snapshot.holds, (h) => h.resource === r.name && h.until >= now).length
	const { chosen } = Arr.reduce(
		Arr.sort(candidates, BY_ORDER),
		{ taken: HashMap.empty<string, number>(), chosen: Arr.empty<Candidate>() },
		(acc, c) =>
			Arr.every(
				c.uses,
				(r) => r.seats - held(r) - Option.getOrElse(HashMap.get(acc.taken, r.name), () => 0) > 0
			)
				? {
						taken: Arr.reduce(c.uses, acc.taken, (taken, r) =>
							HashMap.set(taken, r.name, Option.getOrElse(HashMap.get(taken, r.name), () => 0) + 1)
						),
						chosen: [...acc.chosen, c]
					}
				: acc
	)

	const live = (scope: ScopeKey) => Option.isSome(view(scope))
	const wakeOf = (c: Candidate): Wake => ({
		_tag: "Step",
		flow: ledger.flow,
		step: c.step,
		attempt: AttemptNumber.make(Number(c.attempt))
	})
	const waitedOn = (waited: Candidate["waited"]) =>
		Arr.map(
			Arr.filter(chosen, (c) => c.waited === waited),
			wakeOf
		)
	return {
		wakes: [
			...Arr.map(admissions, (s): Wake => ({ _tag: "Admit", flow: ledger.flow, scope: s.scope })),
			...waitedOn("time")
		],
		fenced: waitedOn("deployment"),
		release: Arr.filter(snapshot.exclusives, (e) => !live(e.scope))
	}
}
