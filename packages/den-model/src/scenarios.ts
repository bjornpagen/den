import type { Case } from "@den/testing/explore"
import { boolean, type Gen, int, weighted } from "@den/testing/gen"
import { type Swarm, swarm, weightOf } from "@den/testing/swarm"
import { Array as Arr, Record } from "effect"
import type { Counts, Window } from "#program.ts"
import { type Fault, FAULTS, type Nature, type Platform } from "#simulator.ts"
import type { Behaviour, Running, Shape } from "#workloads/synthetic.ts"

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

/** The platform's settings, drawn small, so a case's whole run fits in a few hundred events. */
export const platformGen: Gen<Platform> = (source) => ({
	census: source.draw(int(1, 4)),
	lifetime: source.draw(int(4, 12)),
	turns: source.draw(int(1, 4)),
	deliveries: source.draw(int(1, 4)),
	dedup: source.draw(int(0, 8)),
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

/** A generated step's behaviour, mostly an output, shrinking toward one. */
export const behaviourGen: Gen<Behaviour> = weighted<Behaviour>([
	[6, () => ({ _tag: "Ok" })],
	[1, () => ({ _tag: "Fails" })],
	[
		3,
		(source) => ({ _tag: "Retries", times: source.draw(int(1, 3)), counts: source.draw(countsGen) })
	],
	[1, (source) => ({ _tag: "Forever", counts: source.draw(countsGen) })]
])

/**
 * A lane's window: mostly always open, sometimes open for part of a short period. The open span is never shorter than
 * the census's period, so every window holds a census tick: a wake that finds the window closed is consumed, and only
 * the census rings again, so a window no census tick lands in is never served.
 */
export const windowGen = (census: number): Gen<Window> =>
	weighted<Window>([
		[4, () => ({ _tag: "Always" })],
		[
			1,
			(source) => {
				const span = census + source.draw(int(0, 3))
				const period = span + source.draw(int(1, 4))
				const opens = source.draw(int(0, period - span))
				return { _tag: "Periodic", period, opens, closes: opens + span }
			}
		]
	])

/** How a generated step runs: a short lease, small ceilings, a short ladder. */
export const runningGen: Gen<Running> = (source) => {
	const first = source.draw(int(1, 3))
	return {
		lease: source.draw(int(2, 6)),
		ceilings: {
			attempts: source.draw(int(1, 5)),
			waits: source.draw(int(0, 4)),
			reclaims: source.draw(int(1, 5))
		},
		ladder: { first, last: first + source.draw(int(0, 6)) }
	}
}

/** A generated program's shape, every part drawn small, its windows holding a tick of a census of this period. */
export const shapeGen =
	(census: number): Gen<Shape> =>
	(source) => ({
		lanes: {
			a: { width: source.draw(int(1, 3)), window: source.draw(windowGen(census)) },
			b: { width: source.draw(int(1, 3)), window: source.draw(windowGen(census)) }
		},
		running: source.draw(runningGen),
		chain: { length: source.draw(int(0, 4)), behaviour: source.draw(behaviourGen) },
		fan: {
			leaves: source.draw(int(0, 4)),
			behaviour: source.draw(behaviourGen),
			leaf: source.draw(behaviourGen)
		},
		sub: source.draw(boolean),
		join: source.draw(boolean),
		gate: source.draw(
			weighted<Shape["gate"]>([
				[2, () => ({ _tag: "None" })],
				[1, () => ({ _tag: "External" })],
				[1, (inner) => ({ _tag: "Timer", after: inner.draw(int(1, 6)) })]
			])
		),
		finish: source.draw(
			weighted<Behaviour>([
				[4, () => ({ _tag: "Ok" })],
				[1, (inner) => inner.draw(behaviourGen)]
			])
		),
		roots: source.draw(int(1, 3))
	})

/** A case of a generated program: its shape, the platform and the faults on. */
export type Scenario = Readonly<{ shape: Shape; platform: Platform; faults: Swarm<Fault> }>

/** A generated program's scenario, its shape adjusted and `forced` faults always on. */
export const scenarioGen =
	(adjust: (shape: Shape) => Shape, forced: ReadonlyArray<Fault>): Gen<Scenario> =>
	(source) => {
		const platform = source.draw(platformGen)
		return {
			shape: adjust(source.draw(shapeGen(platform.census))),
			platform,
			faults: source.draw(faultsGen(forced))
		}
	}
