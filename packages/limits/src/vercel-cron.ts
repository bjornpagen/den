import { derived, published } from "@bjornpagen/limit"

/**
 * Vercel Cron Jobs: how often den's census can tick, and the cron step that ticks it (the limits skill, .agents/skills/limits; this package's README).
 */

/**
 * How often the census can tick: Vercel Cron's minimum interval on the Pro and Enterprise plans. A window shorter than
 * this could hold no tick, so den refuses one, and the first rung of a retry ladder waits this long. Vercel calls Cron
 * Jobs legacy, to be migrated to Schedules; the interval stands until den moves.
 */
export const censusPeriodSeconds = published({
	value: 60,
	owner: "Vercel Cron Jobs, Pro and Enterprise plans",
	unit: "seconds",
	scope: "the interval between two census ticks, at its shortest",
	constraint: "hard quota",
	source: "https://vercel.com/docs/schedules/cron-jobs/usage-and-pricing",
	quote:
		"| **Pro**        | 100 cron jobs                       | Once per minute      | Per-minute               |",
	verified: "2026-11-16"
})

/** The census cron's step, in the minutes a cron expression's minute field counts: one tick per census period. */
export const censusStepMinutes = derived({
	owner: "den's census cron (packages/den-vercel/src/config.ts)",
	unit: "minutes",
	scope: "the step of the census cron's minute field, `*/n`",
	from: [censusPeriodSeconds],
	derivation:
		"the census ticks once per censusPeriodSeconds, which a minute field counts in minutes",
	compute: ([period]) => period.value / 60
})
