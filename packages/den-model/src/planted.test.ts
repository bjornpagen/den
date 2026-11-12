import { type Case, drawn, explore, Run } from "@den/testing/explore"
import { noCoverage } from "@den/testing/features"
import type { Gen } from "@den/testing/gen"
import { runOfTest } from "@den/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option } from "effect"
import { ledgerOf } from "#ledger.ts"
import {
	censusBlindToExpiry,
	exclusiveReleasedEarly,
	fenceBlindToResult,
	finishBlindToScopes,
	finishWithoutKey,
	keyPerAttempt,
	ladderIgnored,
	lapseEarly,
	lostWritesLand,
	ordinalNotDerived,
	type Planted,
	preconditionBlindToHeld,
	readIgnoresKey,
	retireBeforeFinish,
	retiredKeysRecur,
	servesOldDeployments,
	staleRingsOn,
	windowCheckOffByOne
} from "#planted.ts"
import { ordinals } from "#program.ts"
import { natureOf, type Scenario, scenarioGen } from "#scenarios.ts"
import { caught, declares, evidenceOf, exploration, holds } from "#search.ts"
import { simulate } from "#simulator.ts"
import { type Shape, syntheticOf } from "#workloads/synthetic.ts"

/**
 * The search a planted bug must fail: generated programs run over the planted ledger and platform, checking only the
 * law the bug was planted to break, which must catch it in the floor or steered stream its suite's label fixes.
 */
const plantedSearch = (suite: string, planted: Planted, scenarios: Gen<Scenario>) =>
	caught(
		explore(
			exploration({
				suite,
				draw: drawn(scenarios),
				coverage: noCoverage,
				runs: 160,
				shrink: 40,
				oracle: {
					kind: "specification",
					name: `the ${planted.law} law (properties.ts), over a ledger and platform with one decision broken`
				}
			}),
			(scenario: Scenario, c: Case<never>) =>
				Effect.gen(function* () {
					const { program, acts, horizon } = syntheticOf(scenario.shape)
					if (!declares(planted.rules, program, scenario.platform.census)) {
						return
					}
					const run = simulate(
						{
							program,
							acts,
							ledger: ledgerOf(planted.rules),
							policy: planted.policy,
							platform: scenario.platform,
							horizon
						},
						natureOf(c, scenario.faults)
					)
					yield* holds([planted.law], evidenceOf(run, program))
				})
		)
	)

const withChain =
	(length: number) =>
	(shape: Shape): Shape => ({
		...shape,
		chain: { ...shape.chain, length: Math.max(length, shape.chain.length) }
	})

/**
 * Roots under one exclusivity key admitted tick after tick, each a step and a finish that retries twice before it
 * lands, so a run's finish is pending while the next root of its key is admitted.
 */
const contended = (shape: Shape): Shape => ({
	...withChain(1)(shape),
	exclusive: true,
	finish: { _tag: "Retries", times: 2, counts: "wait" },
	roots: [
		{ at: 0, by: "schedule" },
		...Arr.map(ordinals(6), (at): Shape["roots"][number] => ({ at: at + 1, by: "schedule" }))
	]
})

/** One seat that a chain and several leaves all hold, so a ring can find it held and end without a claim. */
const seatHeld = (shape: Shape): Shape => ({
	...shape,
	seats: 1,
	chain: { ...shape.chain, length: Math.max(2, shape.chain.length), holds: true },
	fan: { ...shape.fan, leaves: Math.max(2, shape.fan.leaves), holds: true }
})

/** Scenarios whose chaotic phase runs long enough for a race that needs many moves: a retirement and more. */
const lengthened =
	(scenarios: Gen<Scenario>): Gen<Scenario> =>
	(source) => {
		const scenario = source.draw(scenarios)
		return {
			...scenario,
			platform: { ...scenario.platform, events: scenario.platform.events + 80 }
		}
	}

const inTheirRun = (ctx: Parameters<Parameters<typeof it.effect>[1]>[0]) =>
	Effect.provideServiceEffect(Run, runOfTest(ctx))

describe("each law catches the bug planted to break it", () => {
	it.effect("no-stall catches a census blind to leases that ran out", (ctx) =>
		plantedSearch(
			"planted: census blind to expiry",
			censusBlindToExpiry,
			scenarioGen(withChain(1), ["death-after-claim"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("no-stall catches a ladder that never ends a step", (ctx) =>
		plantedSearch(
			"planted: ladder ignored",
			ladderIgnored,
			scenarioGen(
				(shape) => ({
					...shape,
					running: {
						...shape.running,
						ladder: {
							_tag: "Attempts",
							attempts:
								shape.running.ladder._tag === "Attempts" ? shape.running.ladder.attempts : 1,
							first: shape.running.ladder.first,
							last: shape.running.ladder.last
						}
					},
					chain: {
						...shape.chain,
						length: Math.max(1, shape.chain.length),
						behaviour: { _tag: "Forever" }
					}
				}),
				[]
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("one-result catches a commit fenced on its claim alone", (ctx) =>
		plantedSearch(
			"planted: fence blind to a result",
			fenceBlindToResult,
			scenarioGen(withChain(1), ["lost-answer"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("one-result catches a lost commit whose writes still land", (ctx) =>
		plantedSearch(
			"planted: lost writes land",
			lostWritesLand,
			lengthened(
				scenarioGen(
					(shape) => ({
						...withChain(2)(shape),
						running: { ...shape.running, lease: 2 }
					}),
					["pause", "death-after-claim"]
				)
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect(
		"one-result catches retired keys that recur, the fence hole on the claim's key",
		(ctx) =>
			plantedSearch(
				"planted: retired keys recur",
				retiredKeysRecur,
				lengthened(
					scenarioGen(
						(shape) => ({
							...shape,
							chain: { ...shape.chain, length: Math.min(1, shape.chain.length) },
							fan: { ...shape.fan, leaves: 0 },
							timer: { _tag: "None" },
							window: Option.none(),
							roots: [{ at: 0, by: "operator" }]
						}),
						["readmit"]
					)
				)
			).pipe(inTheirRun(ctx))
	)

	it.effect("scope-once catches a scope that finishes while its child scope runs", (ctx) =>
		plantedSearch(
			"planted: finish blind to child scopes",
			finishBlindToScopes,
			scenarioGen(
				(shape) => ({
					...shape,
					sub: { _tag: "Sub" },
					fan: { ...shape.fan, leaves: Math.max(1, shape.fan.leaves) }
				}),
				[]
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("scope-once catches a finish that is no key race", (ctx) =>
		plantedSearch(
			"planted: finish without its key",
			finishWithoutKey,
			scenarioGen(withChain(1), [])
		).pipe(inTheirRun(ctx))
	)

	it.effect("seats catches a lease counted as run out a tick early", (ctx) =>
		plantedSearch(
			"planted: lease lapses early",
			lapseEarly,
			scenarioGen(
				(shape) => ({
					...shape,
					seats: 1,
					chain: { ...shape.chain, length: Math.max(1, shape.chain.length), holds: true },
					fan: { ...shape.fan, leaves: Math.max(2, shape.fan.leaves), holds: true }
				}),
				[]
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("exclusive catches a seat given back before the scope finished", (ctx) =>
		plantedSearch(
			"planted: exclusivity released early",
			exclusiveReleasedEarly,
			scenarioGen(contended, ["death-after-commit"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("precondition catches a read blind to the steps a claim holds", (ctx) =>
		plantedSearch(
			"planted: precondition blind to held steps",
			preconditionBlindToHeld,
			scenarioGen(
				(shape) => ({
					...withChain(2)(shape),
					gates: [1, 2, 3, 5, 8, ...shape.gates]
				}),
				["pause"]
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("reads catches a keyed read that returns its whole relation", (ctx) =>
		plantedSearch(
			"planted: read ignores its key",
			readIgnoresKey,
			scenarioGen(
				(shape) => ({
					...shape,
					timer: { _tag: "Timer", after: 1 + (shape.roots.length % 3), rearms: 2 },
					roots: [{ at: 0, by: "app" }, { at: 1, by: "app" }, ...shape.roots],
					outside: [{ at: 0, root: 1 }, ...shape.outside]
				}),
				[]
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("rerun catches children whose identity is not derived", (ctx) =>
		plantedSearch(
			"planted: ordinal not derived",
			ordinalNotDerived,
			scenarioGen(withChain(2), [])
		).pipe(inTheirRun(ctx))
	)

	it.effect("stale-drains catches a ledger that serves an old deployment", (ctx) =>
		plantedSearch(
			"planted: serves old deployments",
			servesOldDeployments,
			scenarioGen(withChain(2), ["deploy"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("stale-drains catches a stale worker that rings itself on", (ctx) =>
		plantedSearch(
			"planted: stale rings on",
			staleRingsOn,
			scenarioGen(withChain(2), ["deploy"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("owned catches a root retired before its finish ran", (ctx) =>
		plantedSearch(
			"planted: retired before the finish",
			retireBeforeFinish,
			scenarioGen(withChain(1), ["death-after-commit"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("rewake catches rings keyed by their attempt, not their cause", (ctx) =>
		plantedSearch("planted: key per attempt", keyPerAttempt, scenarioGen(seatHeld, [])).pipe(
			inTheirRun(ctx)
		)
	)

	it.effect("no-stall catches the stall a key per attempt causes when a seat is held", (ctx) =>
		plantedSearch(
			"planted: key per attempt, a seat held",
			{ ...keyPerAttempt, law: "no-stall" },
			scenarioGen(seatHeld, [])
		).pipe(inTheirRun(ctx))
	)

	it.effect("no-stall catches the stall a key per attempt causes when a window is closed", (ctx) =>
		plantedSearch(
			"planted: key per attempt, a window closed",
			{ ...keyPerAttempt, law: "no-stall" },
			scenarioGen(
				(shape, platform) => ({
					...shape,
					chain: { ...shape.chain, holds: false },
					fan: { ...shape.fan, holds: false },
					timer: { _tag: "Timer", after: 1 + (shape.roots.length % 4), rearms: 1 },
					window: Option.some({ period: platform.census + 4, opens: 0, closes: platform.census })
				}),
				[]
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect(
		"window-tick catches a window declared a tick shorter than the census's period",
		(ctx) =>
			plantedSearch(
				"planted: window check off by one",
				windowCheckOffByOne,
				scenarioGen((shape, platform) => {
					const span = Math.max(1, platform.census - 1)
					const period = span + 3
					return {
						...withChain(2)(shape),
						window: Option.some({ period, opens: 1, closes: 1 + span })
					}
				}, [])
			).pipe(inTheirRun(ctx))
	)
})
