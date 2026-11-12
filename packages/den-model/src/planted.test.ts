import { type Case, drawn, explore, Run } from "@den/testing/explore"
import { noCoverage } from "@den/testing/features"
import type { Gen } from "@den/testing/gen"
import { runOfTest } from "@den/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Effect } from "effect"
import { ledgerOf } from "#ledger.ts"
import {
	ceilingsIgnored,
	censusBlindToExpiry,
	fenceBlindToResult,
	finishBlindToScopes,
	finishWithoutKey,
	lostWritesLand,
	ordinalNotDerived,
	type Planted,
	servesOldDeployments,
	staleRingsOn,
	stopBlindToSpawns,
	widthOffByOne
} from "#planted.ts"
import { natureOf, type Scenario, scenarioGen } from "#scenarios.ts"
import { caught, evidenceOf, exploration, holds } from "#search.ts"
import { simulate } from "#simulator.ts"
import { type Shape, syntheticOf } from "#workloads/synthetic.ts"

/**
 * The search a planted bug must fail: generated programs run over the planted ledger and platform, checking only the
 * law the bug was planted to break, which must catch it in the floor its suite's label fixes.
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
					const { program, admissions } = syntheticOf(scenario.shape)
					const run = simulate(
						{
							program,
							admissions,
							ledger: ledgerOf(planted.rules),
							policy: planted.policy,
							platform: scenario.platform
						},
						natureOf(c, scenario.faults)
					)
					yield* holds([planted.law], evidenceOf(run, program.lanes))
				})
		)
	)

const withChain =
	(length: number) =>
	(shape: Shape): Shape => ({
		...shape,
		chain: { ...shape.chain, length: Math.max(length, shape.chain.length) }
	})

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

	it.effect("no-stall catches ceilings that never end a step", (ctx) =>
		plantedSearch(
			"planted: ceilings ignored",
			ceilingsIgnored,
			scenarioGen(
				(shape) => ({
					...withChain(1)(shape),
					chain: {
						length: Math.max(1, shape.chain.length),
						behaviour: { _tag: "Forever", counts: "attempt" }
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
			scenarioGen(withChain(2), ["stop", "pause"])
		).pipe(inTheirRun(ctx))
	)

	it.effect("scope-once catches a scope that finishes while its child scope runs", (ctx) =>
		plantedSearch(
			"planted: finish blind to child scopes",
			finishBlindToScopes,
			scenarioGen(
				(shape) => ({
					...shape,
					sub: true,
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

	it.effect("width catches a claim's width check off by one", (ctx) =>
		plantedSearch(
			"planted: width off by one",
			widthOffByOne,
			scenarioGen(
				(shape) => ({
					...shape,
					lanes: { a: { ...shape.lanes.a, width: 1 }, b: { ...shape.lanes.b, width: 1 } },
					fan: { ...shape.fan, leaves: Math.max(2, shape.fan.leaves) }
				}),
				["duplicate"]
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

	it.effect("owned catches a stop that does not fence a holder's spawns", (ctx) =>
		plantedSearch(
			"planted: stop blind to spawns",
			stopBlindToSpawns,
			scenarioGen(withChain(3), ["stop"])
		).pipe(inTheirRun(ctx))
	)
})
