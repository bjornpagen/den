import { nextCensus } from "@bjornpagen/den/runtime/census"
import { drain } from "@bjornpagen/den/runtime/drive"
import { type Ending, promote } from "@bjornpagen/den/runtime/turn"
import {
	DeploymentId,
	EnvironmentName,
	Host,
	InProcess,
	Transport
} from "@bjornpagen/den/transport"
import * as g from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { element, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Duration, Effect, Ref } from "effect"
import { ringAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase, sliceHost } from "#integration/support/slice.ts"

/**
 * A turn serves a wake only where its environment serves the deployment it runs on: Vercel Queues partitions a topic by
 * deployment, so a wake rung from a deployment lands on it again, and a replaced deployment's chains, its census's
 * among them, would otherwise run its old code beside the new deployment's for good. The slice's ledgers promote the
 * case's deployment when they open.
 *
 * Oracle (specification): on a first deploy, an environment no promotion named, a root's admission and a census end
 * `unserved`, writing nothing and ringing nothing, and once its deploy step promotes it a census admits the root and
 * runs its pages; after a second deployment of the case's environment is promoted, the first deployment's admission
 * and census wakes end `replaced` by the second, writing and ringing nothing, while the second's census admits the root
 * the first left and runs its pages.
 */

type Feature = "first deploy" | "a deployment replaced" | "one page" | "several pages"

interface Run {
	readonly deploy: "first" | "replaced"
	readonly feed: "news" | "sport"
	readonly pages: number
}

const runs: Gen<Run> = (source) => ({
	deploy: source.draw(element(["first", "replaced"] as const)),
	feed: source.draw(element(["news", "sport"] as const)),
	pages: source.draw(int(1, 3))
})

/** A deployment of its own, in the environment `environment`. */
const hostOf = (environment: string, deployment: string) => ({
	environment: EnvironmentName.make(environment),
	deployment: DeploymentId.make(deployment)
})

/**
 * A replaced deployment's chains end at their next ring and an environment that serves none runs nothing, while the
 * serving deployment's run.
 *
 * Budget: provisional, two deploys crossed with one or several pages, each reached by eight cases and eight steered.
 */
export const aTurnRunsOnlyOnTheDeploymentItsEnvironmentServes = property.explore(runs, {
	needs: { slice: sliceCase },
	situations: [
		"first deploy",
		"a deployment replaced",
		"one page",
		"several pages"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(run) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(run.deploy === "first" ? "first deploy" : "a deployment replaced")
						c.note(run.pages === 1 ? "one page" : "several pages")
						const { chain, ledgers } = yield* openLedgers
						const app = yield* openAuditor
						const { held } = yield* InProcess
						const transport = yield* Transport
						const pagesOf = (scope: g.Sha256) =>
							Effect.map(
								rows(app.workload.pages.once({ params: {}, facts: {} })),
								(pages) => Arr.filter(pages, (page) => g.Sha256.equals(page.scope, scope)).length
							)
						const census = Effect.gen(function* () {
							const reading = yield* chain.ledger.now
							const first = nextCensus(Number(reading)).wake
							yield* transport.send([
								{ wake: first, delay: Duration.zero, cause: { _tag: "Census", at: first.at } }
							])
							return yield* drain(ledgers)
						})
						const ended = (endings: ReadonlyArray<Ending>) => Arr.map(endings, (e) => e.kind)
						const stale = run.deploy === "first" ? hostOf("fresh", "first") : sliceHost
						const serving =
							run.deploy === "first" ? hostOf("fresh", "first") : hostOf("case", "next")
						const before = yield* chain.request.ChainRun("before", {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						yield* Effect.provideService(ringAndDrain(ledgers, [before]), Host, sliceHost)
						const ranBefore = yield* pagesOf(before.scope)
						assert.equal(ranBefore, run.pages, "the served deployment runs its root")
						if (run.deploy === "replaced") {
							yield* Effect.provideService(promote(ledgers), Host, serving)
						}
						const left = yield* chain.request.ChainRun("left", {
							feed: run.feed,
							pages: BigInt(run.pages)
						})
						const refused = yield* Effect.provideService(
							Effect.zipWith(ringAndDrain(ledgers, [left]), census, (a, b) => [...a, ...b]),
							Host,
							stale
						)
						assert.deepEqual(
							ended(refused),
							run.deploy === "first" ? ["unserved", "unserved"] : ["replaced", "replaced"],
							"a deployment its environment does not serve ends its admission and its census"
						)
						assert.ok(
							Arr.every(refused, (e) => e.kind !== "replaced" || e.by === serving.deployment),
							"a replaced deployment's turn names the deployment that replaced it"
						)
						const rung = yield* Ref.get(held)
						assert.deepEqual(rung, [], "and rings nothing, so its chains end")
						const leftUnrun = yield* pagesOf(left.scope)
						assert.equal(leftUnrun, 0, "and writes nothing")
						if (run.deploy === "first") {
							yield* Effect.provideService(promote(ledgers), Host, serving)
						}
						const ran = yield* Effect.provideService(census, Host, serving)
						assert.ok(Arr.contains(ended(ran), "censused"))
						const leftRun = yield* pagesOf(left.scope)
						assert.equal(
							leftRun,
							run.pages,
							"the serving deployment's census admits the root left and runs its pages"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a turn runs only on the deployment its environment serves; an unserved or replaced one writes and rings nothing"
	},
	budget: { runs: 8, steered: 8 },
	kept: [],
	kills: [
		{
			file: "packages/den/src/runtime/turn.ts",
			original: "deployment === host.deployment",
			replacement: "deployment.length > 0",
			why: "A turn on a replaced deployment is served as on the serving one: the replaced deployment admits the root and runs its old code beside the new deployment's."
		}
	]
})
