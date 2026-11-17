import { type Case, drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { array, constant, type Gen, int, weighted } from "@bjornpagen/testing/gen"
import { type Driver, interleave } from "@bjornpagen/testing/interleave"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, HashMap, HashSet, Option } from "effect"
import { makeReports, type Sent, type TimebackReports, type Weather, type World } from "#reports.ts"
import { exploration, law } from "#test/support/search.ts"

/** The deliveries that race for one report: a queue redelivery, a stretch's message, and the report's redrive. */
type Session = "redelivery" | "stretch" | "redrive"

/** A move: send one of the race's reports after letting `gap` milliseconds pass. */
type Move = Readonly<{ report: number; gap: number }>

type Race = Readonly<{
	world: World
	reports: number
	moves: Readonly<Record<Session, Arr.NonEmptyReadonlyArray<Move>>>
}>

type Seen =
	| "accepted"
	| "accepted-again"
	| "outage"
	| "malformed"
	| "server-error"
	| "forbidden"
	| "transport"

const weatherGen: Gen<Weather> = weighted<Weather>([
	[8, constant("answered")],
	[1, constant("server-error")],
	[1, constant("forbidden")],
	[1, constant("transport")]
])

const raceGen: Gen<Race> = (source) => {
	const reports = source.draw(int(1, 2))
	const moveGen: Gen<Move> = (s) => ({ report: s.draw(int(1, reports)), gap: s.draw(int(0, 400)) })
	const movesGen: Gen<Arr.NonEmptyReadonlyArray<Move>> = (s) => [
		s.draw(moveGen),
		...s.draw(array(moveGen, { min: 0, max: 3 }))
	]
	return {
		world: {
			outageEndsAt: source.draw(int(0, 1500)),
			malformed: HashSet.fromIterable(
				Arr.map(
					Arr.filter(
						Array.from({ length: reports }, (_, at) => at + 1),
						() => source.draw(int(0, 3)) === 0
					),
					(report) => String(report)
				)
			),
			weather: weatherGen
		},
		reports,
		moves: {
			redelivery: source.draw(movesGen),
			stretch: source.draw(movesGen),
			redrive: source.draw(movesGen)
		}
	}
}

type Delivery = Readonly<{ report: string; at: number; sent: Sent }>

const driverOf = (race: Race, c: Case<Seen>) => {
	let endpoint: Option.Option<TimebackReports["Service"]> = Option.none()
	let now = 0
	const log: Array<Delivery> = []
	const driver: Driver<
		Session,
		Move,
		Sent,
		"accepted",
		HashMap.HashMap<string, number>,
		never,
		never,
		never
	> = {
		reset: Effect.gen(function* () {
			now = 0
			log.length = 0
			const fresh = yield* makeReports(race.world, c)
			endpoint = Option.some(fresh)
		}),
		run: (_session, move) =>
			Option.match(endpoint, {
				onNone: () => Effect.die("the endpoint was not reset"),
				onSome: (live) => {
					now += move.gap
					const at = now
					const report = String(move.report)
					return Effect.tap(live.send(report, at), (sent) =>
						Effect.sync(() => log.push({ report, at, sent }))
					)
				}
			}),
		waitOf: () => Effect.never,
		quiesce: () => Effect.void,
		outcome: (_move, ended) => ({
			key:
				ended.kind === "ended"
					? ended.outcome._tag === "Answered"
						? String(ended.outcome.status)
						: "transport"
					: "cancelled",
			session: "continues"
		}),
		release: () => Effect.void,
		commute: () => false,
		onWait: () => "wait",
		read: () =>
			Option.match(endpoint, {
				onNone: () => Effect.succeed(HashMap.empty<string, number>()),
				onSome: (live) => live.accepted
			})
	}
	return { driver, log }
}

const statusOf = (sent: Sent): Option.Option<number> =>
	sent._tag === "Answered" ? Option.some(sent.status) : Option.none()

const judged = (
	race: Race,
	accepted: HashMap.HashMap<string, number>,
	log: ReadonlyArray<Delivery>,
	c: Case<Seen>
) =>
	Effect.gen(function* () {
		for (const [index, delivery] of log.entries()) {
			const status = statusOf(delivery.sent)
			const before = Arr.take(log, index)
			const earlierAccepted = Arr.some(
				before,
				(other) => other.report === delivery.report && Option.contains(statusOf(other.sent), 200)
			)
			if (Option.isNone(status)) {
				c.note("transport")
				continue
			}
			if (status.value === 503) {
				c.note("outage")
				yield* law(
					"down only during its outage",
					delivery.at < race.world.outageEndsAt,
					() => "a 503 after the outage ended"
				)
			}
			if (status.value === 500) {
				c.note("server-error")
			}
			if (status.value === 403) {
				c.note("forbidden")
			}
			if (status.value === 400) {
				c.note("malformed")
				yield* law(
					"only a malformed report refused",
					HashSet.has(race.world.malformed, delivery.report),
					() => `report ${delivery.report} was refused as built`
				)
			}
			if (status.value === 200) {
				c.note(earlierAccepted ? "accepted-again" : "accepted")
				yield* law(
					"accepted after its outage",
					delivery.at >= race.world.outageEndsAt,
					() => "a report accepted during the outage"
				)
				yield* law(
					"never a malformed report",
					!HashSet.has(race.world.malformed, delivery.report),
					() => "a malformed report was accepted"
				)
			}
		}
		for (const [report, at] of accepted) {
			const first = Arr.findFirst(
				log,
				(delivery) => delivery.report === report && Option.contains(statusOf(delivery.sent), 200)
			)
			yield* law(
				"Timeback keeps the first acceptance",
				Option.exists(first, (delivery) => delivery.at === at),
				() => `report ${report} holds an acceptance no first 200 made`
			)
		}
		const answered = Arr.dedupe(
			Arr.map(
				Arr.filter(log, (delivery) => Option.contains(statusOf(delivery.sent), 200)),
				(delivery) => delivery.report
			)
		)
		yield* law(
			"every 200 recorded once",
			answered.length === HashMap.size(accepted),
			() => "an accepted send left no record, or a record has no accepted send"
		)
	})

describe("Timeback's report endpoint", () => {
	it.effect(
		"racing deliveries of a report record it once, at its first acceptance, and only once the outage is over",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "reports: racing deliveries",
						draw: drawn(raceGen),
						coverage: required<Seen>(
							[
								"accepted",
								"accepted-again",
								"outage",
								"malformed",
								"server-error",
								"forbidden",
								"transport"
							],
							{
								cases: 200,
								sense: notesOnly
							}
						),
						runs: 300,
						shrink: 200,
						oracle: {
							kind: "specification",
							name: "a Caliper endpoint idempotent by report id: first acceptance kept, an outage until its instant, a malformed report refused"
						}
					}),
					(race: Race, c: Case<Seen>) => {
						const { driver, log } = driverOf(race, c)
						return interleave(
							driver,
							{
								sessions: {
									redelivery: { moves: race.moves.redelivery, after: Option.none() },
									stretch: { moves: race.moves.stretch, after: Option.none() },
									redrive: { moves: race.moves.redrive, after: Option.none() }
								},
								exclusive: [],
								state: Option.some("accepted")
							},
							{ kind: "drawn", nature: c },
							(run) =>
								judged(
									race,
									Option.getOrElse(run.state, () => HashMap.empty<string, number>()),
									log,
									c
								)
						)
					}
				)
			)
	)
})
