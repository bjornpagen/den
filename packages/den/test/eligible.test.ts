import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { array, boolean, element, type Gen, int, oneOf, option } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, layer } from "@effect/vitest"
import {
	Array as Arr,
	DateTime,
	Effect,
	Formatter,
	HashSet,
	Option,
	Order,
	Stream,
	String as Str
} from "effect"
import { Digest } from "effect/crypto"
import {
	always,
	attempts,
	idle,
	type Precondition,
	unconditional,
	utcHours,
	type Window
} from "#algebra/kinds.ts"
import { backoffFirstMillis, backoffLastMillis, caseHang } from "#limits.ts"
import { eligible, isOpen, opensAt } from "#runtime/eligible.ts"
import {
	exclusiveId,
	type Instant,
	instantOf,
	finishStep,
	holderOf,
	rootScope,
	type ScopeKey,
	startedScope,
	startedStep,
	type StepKey
} from "#runtime/identity.ts"
import type {
	ClaimRow,
	ExclusiveRow,
	FencedRow,
	HoldRow,
	Ledger,
	RetryRow,
	RootRunner,
	ScopeView,
	Snapshot,
	StepRunner
} from "#runtime/ledger.ts"
import { rungMillis, spentBefore } from "#runtime/turn.ts"
import { FlowName, type Wake, wakeText } from "#transport.ts"

/**
 * Eligibility, the relay's and the census's one rule, over generated snapshots of a small world: admitted roots of one
 * kind under a drawn window, each with pending steps that use the Pool or nothing, its finish, and child scopes whose
 * finish is pending; roots of a gated kind waiting for their admission, some recorded skipped, behind a precondition
 * on another flow; the Pool's live and lapsed holds; exclusivity seats held by live roots or by finished ones; and
 * pauses of the Pool and of each root kind. The wakes it rings are exactly those a specification written apart from it
 * gives: a step whose latest claim stands (its lease not run out and its attempt recording no retry) is never rung, a
 * retried or lapsed attempt's step is rung once its retry's instant or its lease's end has passed, a finish only once
 * its scope has no other pending step and no live child scope, nothing while its root's window is shut or its root kind
 * or a resource it uses is paused, and of the steps contending for the Pool's free seats the oldest roots' first, then
 * the earliest due, never more than the seats its live holds leave; a root is rung for its admission only while it is
 * neither admitted nor skipped, its window is open, its kind is not paused and the flows its precondition names are
 * idle; and exactly the exclusivity seats of scopes no longer live are given back. Beside it, a window's next opening is
 * open and no earlier, and the retry ladder's rungs.
 *
 * Oracle (specification): the proposal's §7, eligibility and order, written apart from `eligible`.
 */

const flowName = FlowName.make("Elig")

/** A fake ledger: the declarations eligibility reads, and nothing else, which no case calls. */
const unread = () => Effect.die("eligibility reads only the snapshot")

const runnerOf = (
	kind: string,
	uses: ReadonlyArray<string>,
	finishes: Option.Option<string>
): StepRunner<never> => ({
	kind,
	uses,
	retry: attempts(1),
	finishes,
	run: unread
})

const rootOf = (
	kind: string,
	window: Window,
	exclusive: boolean,
	precondition: Precondition
): RootRunner => ({
	kind,
	exclusive,
	window,
	precondition,
	finish: `${kind}Finish`,
	admit: unread
})

const ledgerOf = (seats: number, window: Window): Ledger<never> => ({
	flow: flowName,
	now: Effect.die("eligibility judges the instant it is given"),
	authenticated: Effect.die("the census asks after the deployment, never eligibility"),
	resources: [{ name: "Pool", seats }],
	steps: new Map([
		["Work", runnerOf("Work", ["Pool"], Option.none())],
		["Free", runnerOf("Free", [], Option.none())],
		["RunFinish", runnerOf("RunFinish", [], Option.some("Run"))],
		["BatchFinish", runnerOf("BatchFinish", [], Option.some("Batch"))],
		["SyncFinish", runnerOf("SyncFinish", [], Option.some("Sync"))]
	]),
	roots: new Map([
		["Run", rootOf("Run", window, false, unconditional)],
		["Sync", rootOf("Sync", always, true, idle("Other"))]
	]),
	stepOf: unread,
	resultOf: unread,
	heldOf: unread,
	claimsOf: unread,
	retriesOf: unread,
	fencedOf: unread,
	dueOf: unread,
	scopeOf: unread,
	unended: unread,
	finished: unread,
	busy: unread,
	claim: unread,
	retry: unread,
	fence: unread,
	refuse: unread,
	exhaust: unread,
	skip: unread,
	snapshot: Effect.die("eligibility reads only the snapshot"),
	changes: Stream.empty,
	coordination: {
		seatTurns: Effect.die("unread"),
		holds: Effect.die("unread"),
		exclusiveTurns: Effect.die("unread"),
		exclusives: Effect.die("unread"),
		pauseTurns: Effect.die("unread"),
		paused: Effect.die("unread"),
		take: unread,
		giveBack: unread,
		holdExclusive: unread,
		releaseExclusive: unread,
		pause: unread,
		resume: unread
	},
	scheduled: []
})

/** How a claimed attempt ended without a result: a retry, due at an offset, or a fence on a refused credential. */
type EndSketch =
	| { readonly kind: "retry"; readonly at: number; readonly spent: boolean }
	| { readonly kind: "fenced" }

/** A pending step of a root: its kind, its latest claim, if any, with how it ended, and its first due instant. */
interface StepSketch {
	readonly kind: "Work" | "Free"
	readonly claim: Option.Option<{
		readonly attempt: number
		readonly until: number
		readonly end: Option.Option<EndSketch>
	}>
	readonly due: Option.Option<number>
}

/** A root of the windowed kind: waiting for its admission, or admitted with its steps and child scopes. */
interface RootSketch {
	readonly age: number
	readonly admitted: boolean
	readonly steps: ReadonlyArray<StepSketch>
	readonly batches: number
}

/** A root of the gated kind waiting for its admission: its age, its key, and whether it was recorded skipped. */
interface SyncSketch {
	readonly age: number
	readonly key: number
	readonly skipped: boolean
}

/** An exclusivity seat held for a key: by one of the world's waiting roots, or by a scope that finished. */
interface ExclusiveSketch {
	readonly key: number
	readonly holder: Option.Option<number>
}

interface World {
	readonly seats: number
	readonly roots: ReadonlyArray<RootSketch>
	readonly syncs: ReadonlyArray<SyncSketch>
	readonly holds: ReadonlyArray<{ readonly until: number }>
	readonly exclusives: ReadonlyArray<ExclusiveSketch>
	readonly paused: { readonly pool: boolean; readonly run: boolean; readonly sync: boolean }
	readonly otherBusy: boolean
	readonly window: Option.Option<{ readonly opens: number; readonly length: number }>
	readonly hour: number
}

/** An offset from the case's instant, some before it, some at it, some after. */
const offset = int(-3, 3)

const stepSketch: Gen<StepSketch> = (source) => ({
	kind: source.draw(boolean) ? "Work" : "Free",
	claim: source.draw(
		option((s) => ({
			attempt: s.draw(int(1, 3)),
			until: s.draw(offset),
			end: s.draw(
				option(
					oneOf<EndSketch>([
						(r) => ({ kind: "retry", at: r.draw(offset), spent: r.draw(boolean) }),
						() => ({ kind: "fenced" })
					])
				)
			)
		}))
	),
	due: source.draw(option(offset))
})

const world: Gen<World> = (source) => ({
	seats: source.draw(int(1, 3)),
	roots: source.draw(
		array(
			(s) => ({
				age: s.draw(int(0, 4)),
				admitted: s.draw(int(0, 3)) > 0,
				steps: s.draw(array(stepSketch, { min: 0, max: 4 })),
				batches: s.draw(int(0, 2))
			}),
			{ min: 1, max: 3 }
		)
	),
	syncs: source.draw(
		array((s) => ({ age: s.draw(int(0, 4)), key: s.draw(int(0, 1)), skipped: s.draw(boolean) }), {
			min: 0,
			max: 3
		})
	),
	holds: source.draw(array((s) => ({ until: s.draw(offset) }), { min: 0, max: 3 })),
	exclusives: source.draw(
		array((s) => ({ key: s.draw(int(0, 1)), holder: s.draw(option(int(0, 3))) }), {
			min: 0,
			max: 2
		})
	),
	paused: { pool: source.draw(boolean), run: source.draw(boolean), sync: source.draw(boolean) },
	otherBusy: source.draw(boolean),
	window: source.draw(option((s) => ({ opens: s.draw(int(0, 22)), length: s.draw(int(1, 6)) }))),
	hour: source.draw(int(0, 23))
})

/** A built world: its snapshot, the case's instant, and the ledger's declarations. */
interface Built {
	readonly snapshot: Snapshot
	readonly now: Instant
	readonly window: Window
	readonly ledger: Ledger<never>
	readonly kinds: ReadonlyMap<StepKey, string>
	readonly seats: number
}

/** The ordinals `0 … count − 1`, none for a count of 0. */
const ordinals = (count: number): ReadonlyArray<number> =>
	Array.from({ length: count }, (_, at) => at)

const indexed = <A>(items: ReadonlyArray<A>) => Arr.map(items, (value, index) => ({ value, index }))

const built = (w: World) =>
	Effect.gen(function* () {
		const day = DateTime.makeUnsafe({ year: 2026, month: 11, day: 11 })
		const now = instantOf(DateTime.toEpochMillis(DateTime.add(day, { hours: w.hour })))
		const at = (delta: number) => instantOf(Number(now) + delta)
		const window = Option.match(w.window, {
			onNone: () => always,
			onSome: (s) => utcHours(s.opens, Math.min(24, s.opens + s.length))
		})
		const ledger = ledgerOf(w.seats, window)
		const scopes: Array<ScopeView> = []
		const steps: Array<Snapshot["steps"][number]> = []
		const claims: Array<Snapshot["claims"][number]> = []
		const retries: Array<RetryRow> = []
		const fenced: Array<FencedRow> = []
		const dues: Array<Snapshot["dues"][number]> = []
		const kinds = new Map<StepKey, string>()
		const syncs: Array<ScopeKey> = []
		const firstKey = yield* exclusiveId(flowName, "Sync", "k0")
		const secondKey = yield* exclusiveId(flowName, "Sync", "k1")
		const keyOf = (k: number) => (k === 0 ? firstKey : secondKey)
		for (const { value: r, index: i } of indexed(w.roots)) {
			const root = yield* rootScope(flowName, "Run", `r${i}`)
			scopes.push({
				scope: root,
				kind: "Run",
				parent: Option.none(),
				admitted: r.admitted,
				skipped: false,
				key: Option.none(),
				root: Option.some({ key: `r${i}`, at: at(r.age - 10) })
			})
			if (!r.admitted) {
				continue
			}
			for (const { value: s, index: j } of indexed(r.steps)) {
				const step = yield* startedStep(root, j)
				kinds.set(step, s.kind)
				steps.push({ step, kind: s.kind, scope: root })
				if (Option.isSome(s.due)) {
					dues.push({ step, at: at(s.due.value) })
				}
				if (Option.isSome(s.claim)) {
					const c = s.claim.value
					claims.push({ step, attempt: BigInt(c.attempt), until: at(c.until) })
					if (Option.isSome(c.end)) {
						const end = c.end.value
						if (end.kind === "retry") {
							retries.push({ step, attempt: BigInt(c.attempt), at: at(end.at), spent: end.spent })
						} else {
							fenced.push({ step, attempt: BigInt(c.attempt) })
						}
					}
				}
			}
			const finish = yield* finishStep(root)
			kinds.set(finish, "RunFinish")
			steps.push({ step: finish, kind: "RunFinish", scope: root })
			for (const j of ordinals(r.batches)) {
				const batch = yield* startedScope(root, 100 + j)
				scopes.push({
					scope: batch,
					kind: "Batch",
					parent: Option.some(root),
					admitted: true,
					skipped: false,
					key: Option.none(),
					root: Option.none()
				})
				const batchFinish = yield* finishStep(batch)
				kinds.set(batchFinish, "BatchFinish")
				steps.push({ step: batchFinish, kind: "BatchFinish", scope: batch })
			}
		}
		for (const { value: y, index: i } of indexed(w.syncs)) {
			const sync = yield* rootScope(flowName, "Sync", `s${i}`)
			syncs.push(sync)
			scopes.push({
				scope: sync,
				kind: "Sync",
				parent: Option.none(),
				admitted: false,
				skipped: y.skipped,
				key: Option.some(keyOf(y.key)),
				root: Option.some({ key: `s${i}`, at: at(y.age - 10) })
			})
		}
		const dead = yield* rootScope(flowName, "Sync", "finished")
		const exclusives: ReadonlyArray<ExclusiveRow> = Arr.dedupeWith(
			Arr.map(w.exclusives, (e) => ({
				kind: "Sync",
				key: keyOf(e.key),
				turn: 0n,
				scope: Option.getOrElse(
					Option.flatMap(e.holder, (h) => Arr.get(syncs, h)),
					() => dead
				)
			})),
			(a, b) => a.key === b.key
		)
		const holdersStep = yield* startedStep(dead, 0)
		const holds: ReadonlyArray<HoldRow> = yield* Effect.forEach(w.holds, (h, seat) =>
			Effect.map(holderOf(holdersStep, seat + 1, seat), (holder): HoldRow => ({
				resource: "Pool",
				seat: BigInt(seat),
				turn: 0n,
				holder,
				until: at(h.until)
			}))
		)
		const snapshot: Snapshot = {
			steps,
			claims,
			retries,
			fenced,
			dues,
			scopes,
			holds,
			exclusives,
			paused: [
				...(w.paused.pool ? ["Pool"] : []),
				...(w.paused.run ? ["Run"] : []),
				...(w.paused.sync ? ["Sync"] : [])
			],
			busy: w.otherBusy ? ["Other"] : []
		}
		const done: Built = { snapshot, now, window, ledger, kinds, seats: w.seats }
		return done
	})

/**
 * The specification, written apart from `eligible`: which steps and admissions a snapshot makes eligible at `now`, and,
 * apart, the steps whose latest attempt was fenced, which wait on the deployment rather than on time.
 */
const specified = (
	b: Built
): { readonly wakes: ReadonlyArray<string>; readonly fenced: ReadonlyArray<string> } => {
	const { snapshot, now } = b
	const viewOf = (scope: ScopeKey) => Arr.findFirst(snapshot.scopes, (s) => s.scope === scope)
	const rootViewOf = (scope: ScopeKey): Option.Option<ScopeView> =>
		Option.flatMap(viewOf(scope), (s) =>
			Option.isSome(s.root) ? Option.some(s) : Option.flatMap(s.parent, rootViewOf)
		)
	const ageOf = (scope: ScopeKey) =>
		Option.getOrElse(
			Option.flatMap(rootViewOf(scope), (s) => Option.map(s.root, (r) => r.at)),
			() => now
		)
	const open = (scope: ScopeKey) =>
		Option.exists(rootViewOf(scope), (r) => (r.kind === "Run" ? isOpen(b.window, now) : true))
	const paused = (target: string) => Arr.contains(snapshot.paused, target)
	const rootPaused = (scope: ScopeKey) => Option.exists(rootViewOf(scope), (r) => paused(r.kind))

	const admitted = Arr.flatMap(snapshot.scopes, (s): ReadonlyArray<string> =>
		Option.isSome(s.root) &&
		!s.admitted &&
		!s.skipped &&
		open(s.scope) &&
		!paused(s.kind) &&
		!(s.kind === "Sync" && Arr.contains(snapshot.busy, "Other"))
			? [`admit ${s.scope}`]
			: []
	)

	interface Ready {
		readonly step: StepKey
		readonly kind: string
		readonly attempt: number
		readonly age: Instant
		readonly due: Instant
		readonly fenced: boolean
	}
	const ready = Arr.flatMap(snapshot.steps, (p): ReadonlyArray<Ready> => {
		const mine = Arr.filter(snapshot.claims, (c) => c.step === p.step)
		const latest = Arr.reduce(mine, Option.none<(typeof mine)[number]>(), (best, c) =>
			Option.match(best, {
				onNone: () => Option.some(c),
				onSome: (x) => (c.attempt > x.attempt ? Option.some(c) : best)
			})
		)
		const retryOf = (attempt: bigint) =>
			Arr.findFirst(snapshot.retries, (r) => r.step === p.step && r.attempt === attempt)
		const fencedAt = (attempt: bigint) =>
			Arr.some(snapshot.fenced, (f) => f.step === p.step && f.attempt === attempt)
		const stands = Option.exists(
			latest,
			(c) => c.until >= now && Option.isNone(retryOf(c.attempt)) && !fencedAt(c.attempt)
		)
		if (stands) {
			return []
		}
		const fenced = Option.exists(latest, (c) => fencedAt(c.attempt))
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
				fenced
					? now
					: Option.getOrElse(
							Option.map(retryOf(c.attempt), (r) => r.at),
							() => instantOf(Number(c.until) + 1)
						)
		})
		if (
			due > now ||
			!open(p.scope) ||
			rootPaused(p.scope) ||
			(p.kind === "Work" && paused("Pool"))
		) {
			return []
		}
		const finishes = Str.endsWith("Finish")(p.kind)
		const blocked =
			Arr.some(snapshot.steps, (o) => o.scope === p.scope && o.step !== p.step) ||
			Arr.some(snapshot.scopes, (s) => Option.contains(s.parent, p.scope))
		if (finishes && blocked) {
			return []
		}
		const attempt = Option.match(latest, { onNone: () => 1, onSome: (c) => Number(c.attempt) + 1 })
		return [{ step: p.step, kind: p.kind, attempt, age: ageOf(p.scope), due, fenced }]
	})
	const liveHolds = Arr.filter(snapshot.holds, (h) => h.until >= now).length
	const free = Math.max(0, b.seats - liveHolds)
	const contending = Arr.sort(
		Arr.filter(ready, (r) => r.kind === "Work"),
		Order.combine(
			Order.combine(
				Order.mapInput(Order.BigInt, (r: Ready) => r.age),
				Order.mapInput(Order.BigInt, (r: Ready) => r.due)
			),
			Order.mapInput(Order.String, (r: Ready) => r.step)
		)
	)
	const seated = [...Arr.filter(ready, (r) => r.kind !== "Work"), ...Arr.take(contending, free)]
	const text = (r: Ready) => `step ${r.step} ${r.attempt}`
	return {
		wakes: [
			...admitted,
			...Arr.map(
				Arr.filter(seated, (r) => !r.fenced),
				text
			)
		],
		fenced: Arr.map(
			Arr.filter(seated, (r) => r.fenced),
			text
		)
	}
}

const textOf = (wake: Wake): string =>
	wake._tag === "Admit" ? `admit ${wake.scope}` : `step ${wake.step} ${wake.attempt}`

type Feature =
	| "contended seats"
	| "a standing claim"
	| "a retried attempt"
	| "a fenced attempt waiting on the deployment"
	| "a lapsed lease"
	| "a finish held back"
	| "a finish rung"
	| "a root admitted"
	| "a root held back by its precondition"
	| "a skipped root"
	| "a seat given back"
	| "a shut window"
	| "a pause"

const ringsStep = (wakes: ReadonlyArray<Wake>, step: StepKey) =>
	Arr.some(wakes, (wake) => wake._tag === "Step" && wake.step === step)

const ringsAdmit = (wakes: ReadonlyArray<Wake>, scope: ScopeKey) =>
	Arr.some(wakes, (wake) => wake._tag === "Admit" && wake.scope === scope)

layer(Digest.layerWebCrypto)("eligibility", (it) => {
	it.effect(
		"rings exactly what the specification makes eligible, oldest root first, within the free seats",
		(ctx) =>
			searched(
				ctx,
				explore(
					{
						suite: "eligibility",
						oracle: {
							kind: "specification",
							name: "§7's eligibility and order, written apart from eligible"
						},
						draw: drawn(world),
						literal: Formatter.format,
						coverage: required<Feature>(
							[
								"contended seats",
								"a standing claim",
								"a retried attempt",
								"a fenced attempt waiting on the deployment",
								"a lapsed lease",
								"a finish held back",
								"a finish rung",
								"a root admitted",
								"a root held back by its precondition",
								"a skipped root",
								"a seat given back",
								"a shut window",
								"a pause"
							],
							{ cases: 120, sense: notesOnly }
						),
						kept: [],
						runs: 300,
						shrink: boundedShrink(60),
						steerEvery: 16,
						caseHang
					},
					(w, c) =>
						Effect.gen(function* () {
							const b = yield* built(w)
							const { snapshot, now } = b
							const found = eligible(b.ledger, snapshot, now)
							const spec = specified(b)
							assert.deepStrictEqual(
								Arr.sort(Arr.map(found.wakes, textOf), Order.String),
								Arr.sort(spec.wakes, Order.String)
							)
							assert.deepStrictEqual(
								Arr.sort(Arr.map(found.fenced, textOf), Order.String),
								Arr.sort(spec.fenced, Order.String)
							)
							const every = [...found.wakes, ...found.fenced]
							assert.strictEqual(
								HashSet.size(HashSet.fromIterable(Arr.map(every, wakeText))),
								every.length
							)

							const liveHolds = Arr.filter(snapshot.holds, (h) => h.until >= now).length
							const pool = Arr.filter(
								every,
								(wake) => wake._tag === "Step" && b.kinds.get(wake.step) === "Work"
							).length
							assert.isAtMost(pool, Math.max(0, w.seats - liveHolds))
							assert.deepStrictEqual(
								Arr.map(found.release, (e) => e.scope),
								Arr.map(
									Arr.filter(
										snapshot.exclusives,
										(e) => !Arr.some(snapshot.scopes, (s) => s.scope === e.scope)
									),
									(e) => e.scope
								)
							)

							const retriedOf = (step: StepKey, attempt: bigint) =>
								Arr.some(snapshot.retries, (r) => r.step === step && r.attempt === attempt) ||
								Arr.some(snapshot.fenced, (f) => f.step === step && f.attempt === attempt)
							const work = Arr.filter(snapshot.steps, (p) => p.kind === "Work")
							if (
								pool > 0 &&
								pool === Math.max(0, w.seats - liveHolds) &&
								Arr.some(work, (p) => !ringsStep(found.wakes, p.step))
							) {
								c.note("contended seats")
							}
							if (
								Arr.some(
									snapshot.claims,
									(cl) => cl.until >= now && !retriedOf(cl.step, cl.attempt)
								)
							) {
								c.note("a standing claim")
							}
							if (Arr.some(snapshot.retries, (r) => ringsStep(found.wakes, r.step))) {
								c.note("a retried attempt")
							}
							if (Arr.isReadonlyArrayNonEmpty(found.fenced)) {
								c.note("a fenced attempt waiting on the deployment")
							}
							if (
								Arr.some(
									snapshot.claims,
									(cl) =>
										cl.until < now &&
										!retriedOf(cl.step, cl.attempt) &&
										ringsStep(found.wakes, cl.step)
								)
							) {
								c.note("a lapsed lease")
							}
							const finishes = Arr.filter(snapshot.steps, (p) => Str.endsWith("Finish")(p.kind))
							if (Arr.some(finishes, (p) => ringsStep(found.wakes, p.step))) {
								c.note("a finish rung")
							}
							if (
								Arr.some(
									finishes,
									(p) =>
										(Arr.some(snapshot.steps, (o) => o.scope === p.scope && o.step !== p.step) ||
											Arr.some(snapshot.scopes, (s) => Option.contains(s.parent, p.scope))) &&
										!ringsStep(found.wakes, p.step)
								)
							) {
								c.note("a finish held back")
							}
							const waiting = Arr.filter(
								snapshot.scopes,
								(s) => Option.isSome(s.root) && !s.admitted
							)
							if (Arr.some(waiting, (s) => ringsAdmit(found.wakes, s.scope))) {
								c.note("a root admitted")
							}
							if (
								w.otherBusy &&
								Arr.some(
									waiting,
									(s) => s.kind === "Sync" && !s.skipped && !ringsAdmit(found.wakes, s.scope)
								)
							) {
								c.note("a root held back by its precondition")
							}
							if (Arr.some(waiting, (s) => s.skipped)) {
								c.note("a skipped root")
							}
							if (Arr.isReadonlyArrayNonEmpty(found.release)) {
								c.note("a seat given back")
							}
							if (!isOpen(b.window, now)) {
								c.note("a shut window")
							}
							if (Arr.isReadonlyArrayNonEmpty(snapshot.paused)) {
								c.note("a pause")
							}
						})
				)
			)
	)
})

type WindowFeature = "open at the instant" | "shut at the instant" | "opens tomorrow"

interface WindowCase {
	readonly opens: number
	readonly length: number
	readonly hour: number
	readonly minute: number
}

const windowCases: Gen<WindowCase> = (source) => ({
	opens: source.draw(int(0, 23)),
	length: source.draw(int(1, 24)),
	hour: source.draw(int(0, 23)),
	minute: source.draw(int(0, 59))
})

layer(Digest.layerWebCrypto)("windows", (it) => {
	it.effect("a window's next opening is open, at or after the instant, and no earlier", (ctx) =>
		searched(
			ctx,
			explore(
				{
					suite: "windows",
					oracle: {
						kind: "universal",
						name: "isOpen(opensAt(w, t)), opensAt(w, t) ≥ t, = t when open, and the instant before it shut"
					},
					draw: drawn(windowCases),
					literal: Formatter.format,
					coverage: required<WindowFeature>(
						["open at the instant", "shut at the instant", "opens tomorrow"],
						{
							cases: 40,
							sense: notesOnly
						}
					),
					kept: [],
					runs: 200,
					shrink: boundedShrink(40),
					steerEvery: 16,
					caseHang
				},
				(wc, c) =>
					Effect.sync(() => {
						const window = utcHours(wc.opens, Math.min(24, wc.opens + wc.length))
						const day = DateTime.makeUnsafe({ year: 2026, month: 11, day: 11 })
						const at = instantOf(
							DateTime.toEpochMillis(DateTime.add(day, { hours: wc.hour, minutes: wc.minute }))
						)
						const next = opensAt(window, at)
						assert.isTrue(isOpen(window, next))
						assert.isTrue(next >= at)
						if (isOpen(window, at)) {
							c.note("open at the instant")
							assert.strictEqual(next, at)
						} else {
							c.note("shut at the instant")
							assert.isFalse(isOpen(window, instantOf(Number(next) - 1)))
							if (wc.hour >= wc.opens) {
								c.note("opens tomorrow")
							}
						}
					})
			)
		)
	)
})

type LadderFeature = "the first rung" | "a doubled rung" | "the last rung"

layer(Digest.layerWebCrypto)("the retry ladder", (it) => {
	it.effect(
		"rungs start at the census's period, never shrink, and stop at the longest lease",
		(ctx) =>
			searched(
				ctx,
				explore(
					{
						suite: "retry ladder",
						oracle: {
							kind: "specification",
							name: "rung(1) = first, rung(n) ≤ rung(n + 1) ≤ last, and spentBefore counts every attempt but a wait or a fence"
						},
						draw: drawn((source) => ({
							spent: source.draw(int(1, 12)),
							claims: source.draw(
								array(
									(s) => ({
										ended: s.draw(
											option(element<"spent" | "waited" | "fenced">(["spent", "waited", "fenced"]))
										)
									}),
									{ min: 0, max: 5 }
								)
							),
							next: source.draw(int(1, 6))
						})),
						literal: Formatter.format,
						coverage: required<LadderFeature>(
							["the first rung", "a doubled rung", "the last rung"],
							{
								cases: 20,
								sense: notesOnly
							}
						),
						kept: [],
						runs: 100,
						shrink: boundedShrink(40),
						steerEvery: 16,
						caseHang
					},
					(l, c) =>
						Effect.gen(function* () {
							const rung = rungMillis(l.spent)
							c.note(
								l.spent === 1
									? "the first rung"
									: rung === backoffLastMillis.value
										? "the last rung"
										: "a doubled rung"
							)
							assert.strictEqual(rungMillis(1), backoffFirstMillis.value)
							assert.isAtLeast(rung, backoffFirstMillis.value)
							assert.isAtMost(rung, backoffLastMillis.value)
							assert.isAtMost(rung, rungMillis(l.spent + 1))
							const ladder = yield* rootScope(flowName, "Run", "ladder")
							const step = yield* startedStep(ladder, 0)
							const claims: ReadonlyArray<ClaimRow> = yield* Effect.forEach(l.claims, (_, i) =>
								Effect.map(holderOf(step, i + 1, i), (holder): ClaimRow => ({
									step,
									attempt: BigInt(i + 1),
									holder,
									until: instantOf(0)
								}))
							)
							const retries: ReadonlyArray<RetryRow> = Arr.flatMap(l.claims, (cl, i) =>
								Option.toArray(
									Option.flatMap(cl.ended, (ended) =>
										ended === "fenced"
											? Option.none()
											: Option.some({
													step,
													attempt: BigInt(i + 1),
													at: instantOf(0),
													spent: ended === "spent"
												})
									)
								)
							)
							const fenced: ReadonlyArray<FencedRow> = Arr.flatMap(l.claims, (cl, i) =>
								Option.contains(cl.ended, "fenced") ? [{ step, attempt: BigInt(i + 1) }] : []
							)
							const expected = Arr.filter(
								Arr.map(l.claims, (cl, i) => ({ cl, attempt: i + 1 })),
								({ cl, attempt }) =>
									attempt < l.next &&
									!Option.contains(cl.ended, "waited") &&
									!Option.contains(cl.ended, "fenced")
							).length
							assert.strictEqual(spentBefore(claims, retries, fenced, BigInt(l.next)), expected)
						})
				)
			)
	)
})
