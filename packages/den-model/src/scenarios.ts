import type { Case } from "@den/testing/explore"
import { boolean, type Gen, int, production, type Weighted, weighted } from "@den/testing/gen"
import { type Swarm, swarm, weightOf } from "@den/testing/swarm"
import { Array as Arr, Option, Record } from "effect"
import type { By } from "#facts.ts"
import { type Counts, type Ladder, ordinals, type Window } from "#program.ts"
import { type Fault, FAULTS, type Nature, type Platform } from "#simulator.ts"
import type { Behaviour, Running, Shape, Sub, Timer } from "#workloads/synthetic.ts"

/**
 * The simulator's nature drawn from a case's tape: each choice a decision of the case, so a run replays from its token
 * and shrinks like any value. A fault strikes, where it may, at most three times in eight, by its swarm weight, and
 * never when its swarm leaves it off; every decision shrinks toward no fault and the first option.
 */
export const natureOf = <F extends string>(c: Case<F>, faults: Swarm<Fault>): Nature => ({
	pick: (options) => (options <= 1 ? 0 : c.draw(int(0, options - 1))),
	bool: (fault) => {
		const weight = weightOf(faults, fault)
		return weight > 0 && c.draw(int(0, 7)) >= 8 - weight
	},
	upTo: (most) => (most <= 0 ? 0 : c.draw(int(0, most)))
})

/**
 * How long the transport deduplicates a key: Vercel Queues drops a later send of a key it has seen for the shorter of
 * the message's retention and 24 hours, processed or not (https://vercel.com/docs/queues/concepts), so at the model's tick of a
 * minute a key is spent for a day, longer than any run.
 *
 * @limitKind published
 * @owner the model's transport
 * @unit ticks of a minute
 * @scope the deduplication window of every simulated send
 * @derivation 24 hours of 60 minutes, the window Vercel's client types, README and KB give
 */
const VERCEL_DEDUP_TICKS = 24 * 60

/** The platform's settings, drawn small, so a case's whole run fits in a few hundred events, its dedup window Vercel's. */
export const platformGen: Gen<Platform> = (source) => ({
	census: source.draw(int(1, 4)),
	lifetime: source.draw(int(4, 12)),
	turns: source.draw(int(1, 4)),
	deliveries: source.draw(int(1, 4)),
	dedup: source.draw(production(VERCEL_DEDUP_TICKS, [0, 1, 4])),
	events: source.draw(int(8, 120)),
	stall: source.draw(int(1, 8))
})

/** The faults a case turns on, by swarm, with `forced` always on at full weight. */
export const faultsGen =
	(forced: ReadonlyArray<Fault>): Gen<Swarm<Fault>> =>
	(source) => ({
		...source.draw(swarm(FAULTS)),
		...Record.fromEntries(Arr.map(forced, (fault) => [fault, 3 as const]))
	})

const countsGen: Gen<Counts> = (source) => (source.draw(boolean) ? "wait" : "attempt")

/**
 * A generated step's behaviour, mostly an output, shrinking toward one: never a retry for ever on a ladder that never
 * ends, which only an outage that heals may stand in for.
 */
export const behaviourGen = (ladder: Ladder): Gen<Behaviour> => {
	const forever: ReadonlyArray<Weighted<Behaviour>> =
		ladder._tag === "Attempts" ? [[1, () => ({ _tag: "Forever" })]] : []
	return weighted<Behaviour>([
		[6, () => ({ _tag: "Ok" })],
		[1, () => ({ _tag: "Fails" })],
		[
			3,
			(source) => ({
				_tag: "Retries",
				times: source.draw(int(1, 3)),
				counts: source.draw(countsGen)
			})
		],
		[
			1,
			(source) => ({
				_tag: "Outage",
				until: source.draw(int(1, 40)),
				counts: source.draw(countsGen)
			})
		],
		...forever
	])
}

/** How far a window's open span runs past one tick short of the census's period: mostly a tick or more. */
const spareGen: Gen<number> = weighted<number>([
	[1, () => 0],
	[4, (source) => 1 + source.draw(int(0, 3))]
])

/**
 * A root kind's window: mostly none, sometimes one open for part of a short period. Its open span is drawn from one tick
 * shorter than the census's period up, so a flow's declaration check sees spans it must refuse: a wake that finds the
 * window closed is consumed, and only the census rings again.
 */
export const windowGen = (census: number): Gen<Option.Option<Window>> =>
	weighted<Option.Option<Window>>([
		[4, () => Option.none()],
		[
			1,
			(source) => {
				const span = Math.max(1, census - 1 + source.draw(spareGen))
				const period = span + source.draw(int(1, 4))
				const opens = source.draw(int(0, period - span))
				return Option.some({ period, opens, closes: opens + span })
			}
		]
	])

/** A ladder: mostly one that ends after a few attempts, sometimes one that never ends. */
export const ladderGen: Gen<Ladder> = (source) => {
	const first = source.draw(int(1, 3))
	const last = first + source.draw(int(0, 6))
	return source.draw(
		weighted<Ladder>([
			[4, (inner) => ({ _tag: "Attempts", attempts: inner.draw(int(1, 5)), first, last })],
			[1, () => ({ _tag: "Never", first, last })]
		])
	)
}

/** How a generated step runs: a short lease and a short ladder. */
export const runningGen: Gen<Running> = (source) => ({
	lease: source.draw(int(2, 6)),
	ladder: source.draw(ladderGen)
})

const byGen: Gen<By> = weighted<By>([
	[2, () => "schedule"],
	[1, () => "operator"],
	[1, () => "app"]
])

const subGen: Gen<Sub> = weighted<Sub>([
	[2, () => ({ _tag: "None" })],
	[1, () => ({ _tag: "Sub" })]
])

const timerGen: Gen<Timer> = weighted<Timer>([
	[2, () => ({ _tag: "None" })],
	[
		1,
		(source) => ({ _tag: "Timer", after: source.draw(int(1, 6)), rearms: source.draw(int(0, 3)) })
	]
])

/** A generated program's shape, every part drawn small, its window drawn against a census of this period. */
export const shapeGen =
	(census: number): Gen<Shape> =>
	(source) => {
		const running = source.draw(runningGen)
		const behaviour = behaviourGen(running.ladder)
		const roots = source.draw(int(1, 3))
		return {
			seats: source.draw(int(1, 3)),
			running,
			chain: {
				length: source.draw(int(0, 4)),
				behaviour: source.draw(behaviour),
				holds: source.draw(boolean)
			},
			fan: {
				leaves: source.draw(int(0, 4)),
				behaviour: source.draw(behaviour),
				leaf: source.draw(behaviour),
				holds: source.draw(boolean)
			},
			sub: source.draw(subGen),
			timer: source.draw(timerGen),
			window: source.draw(windowGen(census)),
			exclusive: source.draw(
				weighted<boolean>([
					[3, () => false],
					[1, () => true]
				])
			),
			finish: source.draw(
				weighted<Behaviour>([
					[4, () => ({ _tag: "Ok" })],
					[1, (inner) => inner.draw(behaviour)]
				])
			),
			roots: Arr.map(Arr.range(1, roots), () => ({
				at: source.draw(int(0, 12)),
				by: source.draw(byGen)
			})),
			gates: Arr.map(ordinals(source.draw(int(0, 2))), () => source.draw(int(0, 24))),
			outside: Arr.map(ordinals(source.draw(int(0, 2))), () => ({
				at: source.draw(int(0, 16)),
				root: source.draw(int(0, roots - 1))
			}))
		}
	}

/** A case of a generated program: its shape, the platform and the faults on. */
export type Scenario = Readonly<{ shape: Shape; platform: Platform; faults: Swarm<Fault> }>

/** A generated program's scenario, its shape adjusted for its platform and `forced` faults always on. */
export const scenarioGen =
	(
		adjust: (shape: Shape, platform: Platform) => Shape,
		forced: ReadonlyArray<Fault>
	): Gen<Scenario> =>
	(source) => {
		const platform = source.draw(platformGen)
		return {
			shape: adjust(source.draw(shapeGen(platform.census)), platform),
			platform,
			faults: source.draw(faultsGen(forced))
		}
	}
