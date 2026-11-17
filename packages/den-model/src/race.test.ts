import { type Case, drawn, explore, Run } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { boolean, int, weighted } from "@bjornpagen/testing/gen"
import { type Driver, interleave } from "@bjornpagen/testing/interleave"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { runOfTest } from "@bjornpagen/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option } from "effect"
import { type Answer, type Entry, TRACE_VERSION } from "#facts.ts"
import type { StepId } from "#identity.ts"
import { emptyState, type Lease, ledgerOf, type Rules, SOUND, type State } from "#ledger.ts"
import { lapseEarly } from "#planted.ts"
import {
	admissionOf,
	ordinals,
	type Program,
	type Resource,
	type RootKind,
	rootedOf,
	type StepKind,
	stepOf
} from "#program.ts"
import type { Law } from "#properties.ts"
import { caught, exploration, holds } from "#search.ts"

/**
 * A session's moves: a worker claims its step and commits; a clock lets one tick pass; an operator pauses and resumes
 * the resource.
 */
type Move = "claim" | "commit" | "tick" | "pause" | "resume"

/** The racing sessions: two workers, and a third that is a clock, an operator or a third worker. */
type Session = "first" | "second" | "third"

/**
 * One race: the resource's seats, the steps due, each step's lease, whether bodies retry once, the step each worker
 * claims, and the third session.
 */
type Race = Readonly<{
	seats: number
	steps: number
	lease: number
	retries: boolean
	targets: Readonly<Record<Session, number>>
	third: "clock" | "operator" | "worker"
}>

/** Who saw what, in the order the race's moves ran. */
type Seen = "won" | "lost" | "late" | "full" | "behind" | "paused" | "reclaimed" | "taken-over"

/** The ledger a race runs on: one root whose start holds `steps` steps, each holding a seat of one resource. */
const raceOf = (race: Race) => {
	const resource: Resource = { name: "seat", seats: race.seats }
	const ladder = { _tag: "Attempts", attempts: 3, first: 1, last: 1 } as const
	const Work: StepKind<number, number, never> = {
		name: "Work",
		runs: { lease: race.lease, holds: [resource], ladder },
		input: (n) => n,
		output: (n) => n,
		error: () => 0,
		reads: () => [],
		body: (n, claimed) =>
			race.retries && claimed.attempts === 0
				? { _tag: "Retry", at: claimed.at, counts: "attempt" }
				: {
						_tag: "Output",
						output: n,
						writes: [{ relation: "race", key: `${n}`, value: claimed.at }]
					},
		edges: () => []
	}
	const Root: RootKind<number, number, never> = {
		name: "Race",
		trigger: { _tag: "App" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "Race",
			input: (n) => n,
			start: (n) => Arr.map(ordinals(n), (index) => stepOf(Work, index + 1)),
			finish: {
				runs: { lease: race.lease, holds: [], ladder },
				output: (n) => n,
				error: () => 0,
				body: (_n, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}
	const program: Program = {
		name: "race",
		resources: [resource],
		roots: [rootedOf(Root)]
	}
	return { resource, program, admission: admissionOf(Root, "race", race.steps) }
}

/** A driver over one ledger shared by the sessions, every move one atomic call, none of them ever waiting. */
const driverOf = (race: Race, rules: Rules) => {
	const { resource, program, admission } = raceOf(race)
	const ledger = ledgerOf(rules)
	const scope = { _tag: "RootScope", root: { kind: "Race", key: "race" } } as const
	const target = (session: Session): StepId => ({
		_tag: "StartStep",
		scope,
		ordinal: race.targets[session] % race.steps
	})
	let state: State = emptyState
	let now = 0
	let trace: Array<Entry> = []
	const leases = new Map<Session, Lease>()
	const record = (answered: Readonly<{ state: State; answer: Answer; entry: Entry }>): Answer => {
		state = answered.state
		trace.push(answered.entry)
		return answered.answer
	}
	const run = (session: Session, move: Move): Answer => {
		switch (move) {
			case "claim": {
				const answered = ledger.claim(state, target(session), session, 0, now)
				Option.match(answered.lease, {
					onNone: () => undefined,
					onSome: (lease) => leases.set(session, lease)
				})
				return record(answered)
			}
			case "commit":
				return Option.match(Option.fromNullishOr(leases.get(session)), {
					onNone: (): Answer => "gone",
					onSome: (lease) =>
						record(
							ledger.commit(
								state,
								{
									step: lease.step,
									attempt: lease.attempt,
									turn: lease.turn,
									settled: lease.run(lease.claimed),
									reads: lease.taken,
									deployment: 0
								},
								now
							)
						)
				})
			case "tick":
				now += 1
				return "accepted"
			case "pause":
				return record(ledger.pause(state, { _tag: "Resource", name: resource.name }, now))
			case "resume":
				return record(ledger.resume(state, { _tag: "Resource", name: resource.name }, now))
		}
	}
	const driver: Driver<
		Session,
		Move,
		Answer,
		"trace",
		ReadonlyArray<Entry>,
		never,
		never,
		never
	> = {
		reset: Effect.sync(() => {
			now = 0
			trace = []
			leases.clear()
			state = emptyState
			record(ledger.admit(state, admission, "app", now))
		}),
		run: (session, move) => Effect.sync(() => run(session, move)),
		waitOf: () => Effect.never,
		quiesce: () => Effect.void,
		outcome: (_move, ended) => ({
			key: ended.kind === "ended" ? ended.outcome : "cancelled",
			session: "continues"
		}),
		release: () => Effect.void,
		commute: () => false,
		onWait: () => "wait",
		read: () => Effect.sync(() => trace)
	}
	return { driver, program }
}

const thirdMoves = (third: Race["third"]): Arr.NonEmptyReadonlyArray<Move> => {
	switch (third) {
		case "clock":
			return ["tick", "tick"]
		case "operator":
			return ["pause", "resume"]
		case "worker":
			return ["claim", "commit"]
	}
}

/** The laws a race of single calls can break: no fair phase runs, and no call is made again. */
const RACE_LAWS: ReadonlyArray<Law> = ["one-result", "scope-once", "seats", "exclusive", "owned"]

/** Notes what a race's trace shows, and checks `laws` over it. */
const judged = (
	laws: ReadonlyArray<Law>,
	trace: ReadonlyArray<Entry>,
	program: Program,
	c: Case<Seen>
) =>
	Effect.gen(function* () {
		Arr.forEach(trace, (entry) => {
			if (entry.command._tag === "Commit") {
				c.note(entry.answer === "accepted" ? "won" : "lost")
			}
			if (entry.answer === "full" || entry.answer === "behind" || entry.answer === "paused") {
				c.note(entry.answer)
			}
			Arr.forEach(entry.facts, (fact) => {
				if (fact._tag === "Claimed" && fact.attempt > 0) {
					c.note("reclaimed")
				}
				if (fact._tag === "Done" && entry.at > 0) {
					c.note("late")
				}
				if (
					fact._tag === "Unseated" &&
					fact.holder._tag === "Claim" &&
					entry.command._tag === "Claim" &&
					fact.holder.step._tag === "StartStep" &&
					entry.command.step._tag === "StartStep" &&
					fact.holder.step.ordinal !== entry.command.step.ordinal
				) {
					c.note("taken-over")
				}
			})
		})
		yield* holds(laws, {
			trace: { version: TRACE_VERSION, entries: trace },
			program,
			reruns: [],
			sends: [],
			fairFrom: 0,
			end: { _tag: "Quiescent", at: 0 }
		})
	})

/** A race drawn small: one or two seats, up to three steps, short leases, the workers' targets and the third. */
const raceGen = drawn((source): Race => ({
	seats: source.draw(int(1, 2)),
	steps: source.draw(int(1, 3)),
	lease: source.draw(int(1, 3)),
	retries: source.draw(boolean),
	targets: {
		first: source.draw(int(0, 2)),
		second: source.draw(int(0, 2)),
		third: source.draw(int(0, 2))
	},
	third: source.draw(
		weighted<Race["third"]>([
			[1, () => "clock"],
			[1, () => "operator"],
			[1, () => "worker"]
		])
	)
}))

/** Every interleaving of the sessions' moves on one ledger under `rules`, judged by `laws`. */
const raceSearch = (race: Race, rules: Rules, laws: ReadonlyArray<Law>, c: Case<Seen>) => {
	const { driver, program } = driverOf(race, rules)
	return interleave(
		driver,
		{
			sessions: {
				first: { moves: ["claim", "commit"], after: Option.none() },
				second: { moves: ["claim", "commit"], after: Option.none() },
				third: { moves: thirdMoves(race.third), after: Option.none() }
			},
			exclusive: [],
			state: Option.some("trace")
		},
		{ kind: "every", reduction: "none" },
		(ran) =>
			Option.match(ran.state, {
				onNone: () => Effect.void,
				onSome: (trace) => judged(laws, trace, program, c)
			})
	)
}

describe("the claim, seat and commit race, every interleaving", () => {
	it.effect(
		"workers racing for steps and seats, a lease running out and a pause never give a step two results or a seat two holders",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "race: every interleaving",
						draw: raceGen,
						coverage: required<Seen>(
							["won", "lost", "late", "full", "behind", "paused", "reclaimed", "taken-over"],
							{ cases: 120, sense: notesOnly }
						),
						runs: 60,
						shrink: 100,
						oracle: {
							kind: "specification",
							name: "den's laws (properties.ts) over the trace of every interleaving the sessions can run"
						}
					}),
					(race: Race, c: Case<Seen>) => raceSearch(race, SOUND, RACE_LAWS, c)
				)
			)
	)

	it.effect(
		"the seat law catches, in some interleaving, a lease counted as run out a tick early",
		(ctx) =>
			caught(
				explore(
					exploration({
						suite: "planted: lease lapses early, every interleaving",
						draw: raceGen,
						coverage: required<Seen>(["taken-over"], { cases: 120, sense: notesOnly }),
						runs: 60,
						shrink: 40,
						oracle: {
							kind: "specification",
							name: "the seats law over every interleaving, against a ledger whose leases lapse a tick early"
						}
					}),
					(race: Race, c: Case<Seen>) => raceSearch(race, lapseEarly.rules, ["seats"], c)
				)
			).pipe(Effect.provideServiceEffect(Run, runOfTest(ctx)))
	)
})
