import { Array as Arr, DateTime, HashMap, Option, Order } from "effect"
import { HOURS_IN_DAY, type Window } from "#algebra/kinds.ts"
import { type Instant, instantOf, type ScopeKey, type StepKey } from "#runtime/identity.ts"
import type { ExclusiveRow, Ledger, ScopeView, Snapshot } from "#runtime/ledger.ts"
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
	readonly attempt: number
	readonly uses: ReadonlyArray<string>
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

/** Claims, latest attempt first. */
const LATEST: Order.Order<Snapshot["claims"][number]> = Order.flip(
	Order.mapInput(Order.BigInt, (c: Snapshot["claims"][number]) => c.attempt)
)

/** The wakes due at `now` in a snapshot, and the exclusivity seats to give back. */
export const eligible = <R>(ledger: Ledger<R>, snapshot: Snapshot, now: Instant): Eligible => {
	const scopes = HashMap.fromIterable(Arr.map(snapshot.scopes, (s) => [s.scope, s] as const))
	const view = (scope: ScopeKey): Option.Option<ScopeView> => HashMap.get(scopes, scope)
	const chain = (scope: ScopeKey): ReadonlyArray<ScopeView> => {
		const walk = (
			at: Option.Option<ScopeView>,
			seen: ReadonlyArray<ScopeView>
		): ReadonlyArray<ScopeView> =>
			Option.match(at, {
				onNone: () => seen,
				onSome: (s) => walk(Option.flatMap(s.parent, view), [...seen, s])
			})
		return walk(view(scope), [])
	}
	const rootOf = (scope: ScopeKey): Option.Option<ScopeView> =>
		Arr.findFirst(chain(scope), (s) => Option.isSome(s.root))
	const ageOf = (scope: ScopeKey): Instant =>
		Option.getOrElse(
			Option.flatMap(rootOf(scope), (s) => Option.map(s.root, (r) => r.at)),
			() => now
		)
	const open = (scope: ScopeKey): boolean =>
		Option.match(rootOf(scope), {
			onNone: () => false,
			onSome: (r) =>
				Option.match(Option.fromNullishOr(ledger.roots.get(r.kind)), {
					onNone: () => false,
					onSome: (root) => isOpen(root.window, now)
				})
		})
	const paused = (target: string): boolean => Arr.contains(snapshot.paused, target)
	const rootPaused = (scope: ScopeKey): boolean =>
		Option.exists(rootOf(scope), (s) => paused(s.kind))

	const admissions = Arr.filter(snapshot.scopes, (s) => {
		const root = ledger.roots.get(s.kind)
		if (s.admitted || s.skipped || root === undefined || !open(s.scope) || rootPaused(s.scope)) {
			return false
		}
		const precondition = root.precondition
		return !(
			precondition.kind === "idle" &&
			Arr.some(precondition.flows, (f) => Arr.contains(snapshot.busy, f))
		)
	})

	const unended = (scope: ScopeKey, except: StepKey): boolean =>
		Arr.some(snapshot.steps, (p) => p.scope === scope && p.step !== except) ||
		Arr.some(snapshot.scopes, (s) => Option.contains(s.parent, scope))

	const candidates = Arr.flatMap(snapshot.steps, (p): ReadonlyArray<Candidate> => {
		const runner = ledger.steps.get(p.kind)
		if (runner === undefined || Option.isNone(view(p.scope))) {
			return []
		}
		const claims = Arr.filter(snapshot.claims, (c) => c.step === p.step)
		const latest = Arr.head(Arr.sort(claims, LATEST))
		const retried = (attempt: bigint) =>
			Arr.some(snapshot.retries, (r) => r.step === p.step && r.attempt === attempt)
		const fenced = (attempt: bigint) =>
			Arr.some(snapshot.fenced, (f) => f.step === p.step && f.attempt === attempt)
		if (Option.exists(latest, (c) => c.until >= now && !retried(c.attempt) && !fenced(c.attempt))) {
			return []
		}
		const waited = Option.exists(latest, (c) => fenced(c.attempt)) ? "deployment" : "time"
		const due = Option.match(latest, {
			onNone: () =>
				Option.getOrElse(
					Option.map(
						Arr.findFirst(snapshot.dues, (d) => d.step === p.step),
						(d) => d.at
					),
					() => now
				),
			onSome: (c) =>
				fenced(c.attempt)
					? now
					: Option.getOrElse(
							Option.map(
								Arr.findFirst(
									snapshot.retries,
									(r) => r.step === p.step && r.attempt === c.attempt
								),
								(r) => r.at
							),
							() => instantOf(Number(c.until) + 1)
						)
		})
		if (due > now) {
			return []
		}
		if (Option.isSome(runner.finishes) && unended(p.scope, p.step)) {
			return []
		}
		if (!open(p.scope) || rootPaused(p.scope) || Arr.some(runner.uses, paused)) {
			return []
		}
		const attempt = Option.match(latest, { onNone: () => 1, onSome: (c) => Number(c.attempt) + 1 })
		return [{ step: p.step, attempt, uses: runner.uses, age: ageOf(p.scope), due, waited }]
	})

	const free = HashMap.fromIterable(
		Arr.map(
			ledger.resources,
			(r) =>
				[
					r.name,
					r.seats -
						Arr.filter(snapshot.holds, (h) => h.resource === r.name && h.until >= now).length
				] as const
		)
	)
	const seated = (left: HashMap.HashMap<string, number>, c: Candidate) =>
		Arr.every(c.uses, (r) => Option.getOrElse(HashMap.get(left, r), () => 0) > 0)
	const { chosen } = Arr.reduce(
		Arr.sort(candidates, BY_ORDER),
		{ left: free, chosen: Arr.empty<Candidate>() },
		(acc, c) =>
			seated(acc.left, c)
				? {
						left: Arr.reduce(c.uses, acc.left, (left, r) => HashMap.modify(left, r, (n) => n - 1)),
						chosen: [...acc.chosen, c]
					}
				: acc
	)

	const live = (scope: ScopeKey) => Option.isSome(view(scope))
	const wakeOf = (c: Candidate): Wake => ({
		_tag: "Step",
		flow: ledger.flow,
		step: c.step,
		attempt: AttemptNumber.make(c.attempt)
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
