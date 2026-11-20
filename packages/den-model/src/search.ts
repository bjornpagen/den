import { Array as Arr, Effect, Option } from "effect"
import { type Program, windowsOf } from "#program.ts"
import { type Evidence, firstBroken, type Law, type LawBroken } from "#properties.ts"
import type { Run as Simulated } from "#simulator.ts"

/** What a simulated run's laws are checked over. */
export const evidenceOf = (run: Simulated, program: Program): Evidence => ({
	trace: run.trace,
	program,
	reruns: run.reruns,
	sends: run.sends,
	fairFrom: run.fairFrom,
	end: run.end
})

/**
 * Whether a flow may declare a program under a census of this period: every window it carries is open at least a
 * census period, so it holds a tick. A program refused here never runs, so its case checks nothing.
 */
export const declares = (program: Program, census: number): boolean =>
	Arr.every(windowsOf(program), (window) => window.closes - window.opens >= census)

/** Fails with the first of `laws` the evidence breaks. */
export const holds = (
	laws: ReadonlyArray<Law>,
	evidence: Evidence
): Effect.Effect<void, LawBroken> =>
	Option.match(firstBroken(laws, evidence), { onNone: () => Effect.void, onSome: Effect.fail })
