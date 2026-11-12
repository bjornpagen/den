import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { boolean, int, weighted } from "@den/testing/gen"
import { type Driver, interleave } from "@den/testing/interleave"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option } from "effect"
import type { Answer, Entry } from "#facts.ts"
import { emptyState, type Lease, ledgerOf, SOUND, type State } from "#ledger.ts"
import { admissionOf, type Lane, ordinals, type RootKind, type StepKind, stepOf } from "#program.ts"
import type { Law } from "#properties.ts"
import { exploration, holds } from "#search.ts"

/** A session's moves: a worker claims and commits; a clock lets every lease run out; an operator stops the root. */
type Move = "claim" | "commit" | "expire" | "stop"

/** The racing sessions: two workers, and a third that is a clock, an operator or a third worker. */
type Session = "first" | "second" | "third"

/** One race: the lane's width, the steps due, each step's lease, whether bodies output or retry, and the third. */
type Race = Readonly<{
	width: number
	steps: number
	lease: number
	retries: boolean
	third: "clock" | "operator" | "worker"
}>

/** Who saw what, in the order the race's moves ran. */
type Seen = "won" | "lost" | "late" | "stopped" | "at-width" | "reclaimed"

/** The ledger a race runs on: one root whose start holds `steps` steps on one lane. */
const raceOf = (race: Race) => {
	const lane: Lane = { name: "race", width: race.width, window: { _tag: "Always" } }
	const Work: StepKind<number, number, never> = {
		name: "Work",
		runs: {
			lane,
			lease: race.lease,
			ceilings: { attempts: 3, waits: 3, reclaims: 3 },
			ladder: { first: 1, last: 1 }
		},
		input: (n) => n,
		output: (n) => n,
		error: () => 0,
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
		trigger: { _tag: "Api" },
		scope: {
			name: "Race",
			input: (n) => n,
			start: (n) => Arr.map(ordinals(n), (index) => stepOf(Work, index + 1)),
			finish: {
				runs: Work.runs,
				output: (n) => n,
				error: () => 0,
				body: (_n, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}
	return { lane, admission: admissionOf(Root, "race", race.steps) }
}

/** A driver over one ledger shared by the sessions, every move one atomic call, none of them ever waiting. */
const driverOf = (race: Race) => {
	const { lane, admission } = raceOf(race)
	const ledger = ledgerOf(SOUND)
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
				const answered = ledger.claim(state, lane, 0, now)
				Option.match(answered.lease, {
					onNone: () => undefined,
					onSome: (lease) => leases.set(session, lease)
				})
				return record(answered)
			}
			case "commit":
				return Option.match(Option.fromNullishOr(leases.get(session)), {
					onNone: (): Answer => "idle",
					onSome: (lease) =>
						record(
							ledger.commit(
								state,
								{
									step: lease.step,
									claim: lease.claim,
									token: lease.token,
									settled: lease.run(lease.claimed),
									deployment: 0
								},
								now
							)
						)
				})
			case "expire":
				now += race.lease
				return "accepted"
			case "stop":
				return record(
					ledger.stop(state, { _tag: "RootScope", root: { trigger: "Race", key: "race" } }, now)
				)
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
			record(ledger.admit(state, admission, now))
		}),
		run: (session, move) => Effect.sync(() => run(session, move)),
		waitOf: () => Effect.succeedNone,
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
	return { driver, lane }
}

const thirdMoves = (third: Race["third"]): Arr.NonEmptyReadonlyArray<Move> => {
	switch (third) {
		case "clock":
			return ["expire"]
		case "operator":
			return ["stop"]
		case "worker":
			return ["claim", "commit"]
	}
}

describe("the claim and commit race, every interleaving", () => {
	it.effect(
		"workers racing for one lane, a lease running out and a stop never give a step two results or a lane too many claims",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "race: every interleaving",
						draw: drawn((source): Race => ({
							width: source.draw(int(1, 2)),
							steps: source.draw(int(1, 3)),
							lease: source.draw(int(1, 3)),
							retries: source.draw(boolean),
							third: source.draw(
								weighted<Race["third"]>([
									[1, () => "clock"],
									[1, () => "operator"],
									[1, () => "worker"]
								])
							)
						})),
						coverage: required<Seen>(["won", "lost", "late", "stopped", "at-width", "reclaimed"], {
							cases: 120,
							sense: notesOnly
						}),
						runs: 60,
						shrink: 100,
						oracle: {
							kind: "specification",
							name: "den's laws (properties.ts) over the trace of every interleaving the sessions can run"
						}
					}),
					(race: Race, c: Case<Seen>) => {
						const { driver, lane } = driverOf(race)
						return interleave(
							driver,
							{
								name: "claim and commit",
								sessions: {
									first: { moves: ["claim", "commit"], after: Option.none() },
									second: { moves: ["claim", "commit"], after: Option.none() },
									third: { moves: thirdMoves(race.third), after: Option.none() }
								},
								exclusive: [],
								state: Option.some("trace")
							},
							{ kind: "every", limit: 1000, reduction: "none" },
							(ran) =>
								Option.match(ran.state, {
									onNone: () => Effect.void,
									onSome: (trace) => judged(trace, lane, c)
								})
						)
					}
				)
			)
	)
})

/** Notes what a race's trace shows, and checks the laws a race can break over it. */
const judged = (trace: ReadonlyArray<Entry>, lane: Lane, c: Case<Seen>) =>
	Effect.gen(function* () {
		Arr.forEach(trace, (entry) => {
			if (entry.command._tag === "Commit") {
				c.note(entry.answer === "accepted" ? "won" : "lost")
			}
			if (entry.answer === "at-width") {
				c.note("at-width")
			}
			if (entry.command._tag === "Stop" && entry.answer === "accepted") {
				c.note("stopped")
			}
			Arr.forEach(entry.facts, (fact) => {
				if (fact._tag === "Claimed" && fact.claim > 0) {
					c.note("reclaimed")
				}
				if (fact._tag === "Done" && entry.at > 0) {
					c.note("late")
				}
			})
		})
		yield* holds(RACE_LAWS, {
			trace,
			lanes: [lane],
			reruns: [],
			end: { _tag: "Quiescent", at: 0 }
		})
	})

/** The laws a race of single calls can break: no fair phase runs, and no call is made again. */
const RACE_LAWS: ReadonlyArray<Law> = ["one-result", "scope-once", "width", "owned", "fenced"]
