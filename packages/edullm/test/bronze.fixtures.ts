/** What the properties of bronze.test.ts read: its spaces, models and helpers. */

import { array, bytes, constant, type Gen, int, weighted } from "@bjornpagen/testing/gen"
import type { Driver, Interleaving } from "@bjornpagen/testing/interleave"
import type { Case } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, HashMap, Option, Result } from "effect"
import { Digest } from "effect/crypto"
import { Bronze, makeBronze, sha256Of, type Stored, type Weather } from "#bronze.ts"
import { law } from "#test/support/law.ts"

type Session = "first" | "second" | "third"

/** The bodies a race puts, and each writer's puts, by body. */
export type Race = Readonly<{
	bodies: Arr.NonEmptyReadonlyArray<Uint8Array>
	puts: Readonly<Record<Session, Arr.NonEmptyReadonlyArray<number>>>
}>

type Outcome = Result.Result<Stored, "unanswered">

export type Seen = "created" | "already-identical" | "unanswered" | "answer-lost" | "raced"

const weatherGen: Gen<Weather> = weighted<Weather>([
	[6, constant("answered")],
	[1, constant("refused")],
	[1, constant("lost-answer")]
])

const sameBytes = (left: Uint8Array, right: Uint8Array): boolean =>
	left.length === right.length && left.every((byte, index) => right[index] === byte)

export const raceGen: Gen<Race> = (source) => {
	const first = source.draw(bytes({ min: 0, max: 4 }))
	const bodies: Arr.NonEmptyReadonlyArray<Uint8Array> = [
		first,
		...source.draw(array(bytes({ min: 0, max: 4 }), { min: 0, max: 2 }))
	]
	const putsGen: Gen<Arr.NonEmptyReadonlyArray<number>> = (s) => [
		s.draw(int(0, bodies.length - 1)),
		...s.draw(array(int(0, bodies.length - 1), { min: 0, max: 2 }))
	]
	return {
		bodies,
		puts: { first: source.draw(putsGen), second: source.draw(putsGen), third: source.draw(putsGen) }
	}
}

/** A driver over one fake bucket the writers share, every put one atomic call. */
export const driverOf = (race: Race, c: Case<Seen>, digest: Digest.Digest["Service"]) => {
	let bucket: Option.Option<Bronze["Service"]> = Option.none()
	const log: Array<Readonly<{ body: number; outcome: Outcome }>> = []
	const put = (body: number) =>
		Option.match(bucket, {
			onNone: () => Effect.die("the bucket was not reset"),
			onSome: (live) =>
				live.put(Arr.getUnsafe(race.bodies, body)).pipe(
					Effect.match({
						onFailure: (): Outcome => Result.fail("unanswered"),
						onSuccess: (stored): Outcome => Result.succeed(stored)
					}),
					Effect.tap((outcome) => Effect.sync(() => log.push({ body, outcome })))
				)
		})
	const driver: Driver<
		Session,
		number,
		Outcome,
		"objects",
		HashMap.HashMap<string, Uint8Array>,
		never,
		never,
		never
	> = {
		reset: Effect.gen(function* () {
			log.length = 0
			const fresh = yield* makeBronze(weatherGen, c).pipe(
				Effect.provideService(Digest.Digest, digest)
			)
			bucket = Option.some(fresh)
		}),
		run: (_session, body) => put(body),
		waitOf: () => Effect.never,
		quiesce: () => Effect.void,
		outcome: (_body, ended) => ({
			key:
				ended.kind === "ended"
					? Result.isSuccess(ended.outcome)
						? ended.outcome.success.put
						: "unanswered"
					: "cancelled",
			session: "continues"
		}),
		release: () => Effect.void,
		commute: () => false,
		onWait: () => "wait",
		read: () =>
			Option.match(bucket, {
				onNone: () => Effect.succeed(HashMap.empty<string, Uint8Array>()),
				onSome: (live) => Effect.map(live.objects, (objects) => HashMap.fromIterable(objects))
			})
	}
	return { driver, log }
}

export const judged = (
	race: Race,
	run: Interleaving<
		Session,
		number,
		Outcome,
		"objects",
		HashMap.HashMap<string, Uint8Array>,
		never
	>,
	log: ReadonlyArray<Readonly<{ body: number; outcome: Outcome }>>,
	c: Case<Seen>
) =>
	Effect.gen(function* () {
		const objects = Option.getOrElse(run.state, () => HashMap.empty<string, Uint8Array>())
		const keys = yield* Effect.forEach(race.bodies, (body) => sha256Of(body))
		for (const [key, held] of objects) {
			const body = Option.map(
				Arr.findFirstIndex(keys, (candidate) => candidate === key),
				(at) => Arr.getUnsafe(race.bodies, at)
			)
			yield* law(
				"content-addressed",
				Option.exists(body, (put) => sameBytes(put, held)),
				() => `object ${key} is no body put under its key`
			)
		}
		const created = new Map<string, number>()
		for (const entry of log) {
			const key = Arr.getUnsafe(keys, entry.body)
			if (Result.isFailure(entry.outcome)) {
				c.note("unanswered")
				continue
			}
			const stored = entry.outcome.success
			c.note(stored.put)
			yield* law(
				"answered under its key",
				stored.key === key,
				() => "a put answered another body's key"
			)
			yield* law(
				"stored once answered",
				HashMap.has(objects, key),
				() => "an answered put's body is not in the bucket"
			)
			if (stored.put === "created") {
				created.set(key, (created.get(key) ?? 0) + 1)
			}
			if (
				stored.put === "already-identical" &&
				!Arr.some(
					log,
					(other) =>
						other !== entry &&
						other.body === entry.body &&
						Result.isSuccess(other.outcome) &&
						other.outcome.success.put === "created"
				)
			) {
				c.note("answer-lost")
			}
		}
		yield* law(
			"created at most once",
			Arr.every(Arr.fromIterable(created.values()), (count) => count <= 1),
			() => "one key was created twice"
		)
		const raced = Arr.some(
			race.bodies,
			(_body, index) =>
				Arr.filter(["first", "second", "third"] as const, (session) =>
					Arr.contains(race.puts[session], index)
				).length > 1
		)
		if (raced) {
			c.note("raced")
		}
	})
