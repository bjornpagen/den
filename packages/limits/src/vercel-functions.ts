import { derived, published } from "@bjornpagen/limit"

/**
 * Vercel Functions: how long one invocation lives, and the budget den's turns take from it (the limits skill, .agents/skills/limits; this package's README).
 */

/**
 * The longest a Vercel function invocation lives, Fluid compute on the Pro and Enterprise plans: past it Vercel
 * terminates the invocation. Every unit of den's work fits one invocation (the proposal's ninth principle). Vercel's
 * longer durations are a beta, configured per function, which den does not take.
 */
export const functionLifetimeSeconds = published({
	value: 800,
	owner: "Vercel Functions, Fluid compute, Pro and Enterprise plans",
	unit: "seconds",
	scope: "one function invocation, from its start until Vercel terminates it",
	constraint: "hard quota",
	source: "https://vercel.com/docs/functions/configuring-functions/duration",
	quote: "The 800 second maximum is generally available for Pro and Enterprise teams.",
	verified: "2026-11-16"
})

/**
 * The most milliseconds one invocation spends taking turns: its whole lifetime. A turn starts only while its deadline
 * and the lease margin still fit inside what is left of it.
 */
export const invocationBudgetMillis = derived({
	owner: "den's runtime (packages/den/src/runtime/drive.ts)",
	unit: "milliseconds",
	scope: "one invocation's turns, from the instant it was woken",
	from: [functionLifetimeSeconds],
	derivation: "an invocation takes turns only while the platform keeps it alive",
	compute: ([lifetime]) => lifetime.value * 1000
})
