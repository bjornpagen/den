import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { lawful, type Noticed } from "#laws.fixtures.ts"
import { scenarioGen } from "#scenarios.ts"

/**
 * den's laws over generated programs: pending steps move, one result each, scopes finish once after their children,
 * seats are exact, exclusive runs never overlap, preconditions hold, re-runs change nothing, stale drains, nothing is
 * fire-and-forget, windows hold census ticks and a re-rung wake is delivered. Each kill breaks one decision of the
 * ledger or the platform the way a real slip would, and some law catches it.
 *
 * Budget: its suite's count before the conversion (laws: 2000 independent cases and 400 steered, Vitest at den
 * aa4e12b).
 */
export const densLawsHoldOverGeneratedPrograms = property.explore(
	scenarioGen((shape) => shape, []),
	{
		needs: {},
		situations: [
			"claimed",
			"reclaimed",
			"retried",
			"waited",
			"exhausted",
			"failed",
			"stale",
			"late-accepted",
			"late-lost",
			"rerun-commit",
			"full",
			"behind",
			"early",
			"closed",
			"paused",
			"read",
			"finished",
			"held",
			"blocked",
			"retired",
			"readmitted-retired",
			"continued",
			"rang",
			"relayed",
			"timer",
			"handover",
			"replayed",
			"redelivered",
			"deduplicated",
			"refused-declaration"
		] satisfies ReadonlyArray<Reached<Noticed>>,
		check: (_, c: Case<Noticed>) => (scenario) => lawful(scenario, c),
		oracle: {
			kind: "specification",
			name: "den's laws (properties.ts), checked over the trace a simulated run commits"
		},
		budget: { runs: 2000, steered: 400 },
		kept: [],
		kills: [
			{
				file: "packages/den-model/src/simulator.ts",
				original: "\t\tArr.forEach(ledger.standings.eligibleAt(world.state, world.now), (row) =>\n",
				replacement:
					'\t\tArr.forEach(Arr.filter(ledger.standings.eligibleAt(world.state, world.now), (row) => row.phase._tag === "Due"), (row) =>\n',
				why: "The census rings only steps due by their own instant and forgets a claim whose lease ran out: a holder that died after its claim leaves its step held, and nothing rings it again (no-stall)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: "\t\t\treturn spent >= ladder.attempts\n",
				replacement: "\t\t\treturn false\n",
				why: "The ladder never ends a step: one that retries every time retries for ever (no-stall)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: '\t\t\treturn isLanded(row.phase.ending, attempt, reported) ? "rerun" : "lost"\n',
				replacement: '\t\t\treturn "open"\n',
				why: "The commit is fenced on its claim alone and blind to a result already there: a step a commit already ended takes a second result from a holder whose answer was lost (one-result)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: '\t\t\t\t\tcase "lost":\n\t\t\t\t\t\treturn decided(tx, at, command, "lost")\n',
				replacement:
					'\t\t\t\t\tcase "lost":\n\t\t\t\t\t\tif (reported._tag === "Output") { Arr.forEach(reported.writes, (write) => tx.emit(plain({ _tag: "Wrote", writer: { _tag: "Step", step: row.id }, write, at }))) }\n\t\t\t\t\t\treturn decided(tx, at, command, "lost")\n',
				why: "A lost commit still lands its writes, as a loader transaction outside the fence would (one-result)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: "\tif (HashSet.has(state.retired, text)) {\n",
				replacement: "\tif (false) {\n",
				why: "Retired keys recur: a root admitted again under one starts a new graph under the same derived keys, whose claims count from 0 again, and a holder of the retired graph passes for the new graph's claim of the same number, the hole grizzle's RETIRE closes (one-result)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original:
					'\t\tcase "Scope":\n\t\t\treturn Option.exists(HashMap.get(state.scopes, child.text), (row) =>\n\t\t\t\tOption.isSome(row.ending)\n\t\t\t)\n',
				replacement: '\t\tcase "Scope":\n\t\t\treturn true\n',
				why: "A scope counts only its steps as children, so it finishes while a child scope still runs (scope-once)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original:
					'\tArr.isReadonlyArrayEmpty(scope.finishes)\n\t\t? Option.some({ _tag: "FinishStep", scope: scope.id })\n\t\t: Option.none()\n',
				replacement:
					'\tOption.some({ _tag: "EdgeStep", by: { _tag: "FinishStep", scope: scope.id }, edge: "again", ordinal: scope.finishes.length })\n',
				why: "A scope's finish is no key race: each time the scope is seen complete it gets another finish (scope-once)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: "const leaseLapsed = (until: number, at: number): boolean => until <= at\n",
				replacement:
					"const leaseLapsed = (until: number, at: number): boolean => until <= at + 1\n",
				why: "A claim's lease counts as run out one tick before its end, so its seats are free while its holder may still run up to its deadline: another claim takes the seat from a live holder (seats)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: '\t\t\t\t\t\t"Finish",\n\t\t\t\t\t\tat\n\t\t\t\t\t)\n',
				replacement:
					'\t\t\t\t\t\t"Finish",\n\t\t\t\t\t\tat\n\t\t\t\t\t)\n\t\t\t\t\tunseatScope(tx, scope, at)\n',
				why: "A scope gives back its exclusivity seat once its finish is spawned, not once it finishes: the next run of its key is admitted while the finish, which moves the cursor, still runs (exclusive)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original:
					"\t\t\t\t\tOption.isNone(endingOf(row)) && Arr.contains(query.roots, row.rooted.kind)\n",
				replacement:
					'\t\t\t\t\trow.phase._tag === "Due" && Arr.contains(query.roots, row.rooted.kind)\n',
				why: "A Pending read counts only the steps due and forgets those a claim holds: a precondition admits its root while a step it names runs (precondition)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: "\t\t\treturn Option.match(query.key, {\n",
				replacement: "\t\t\treturn Option.match(Option.none<string>(), {\n",
				why: "A keyed read ignores its key and returns its whole relation: a step reads every row as its own (reads)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original: "\t\t\t\tconst ordinal = item.ordinal\n",
				replacement: "\t\t\t\tconst ordinal = item.ordinal + HashMap.size(tx.state().steps)\n",
				why: "A child's ordinal is the ledger's count of steps, not its position in its edge's output: its identity is not derived, so a commit made again lands its children again under new keys (rerun)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original:
					"const serves = (caller: number, current: number): boolean => caller === current\n",
				replacement: "const serves = (caller: number, current: number): boolean => true\n",
				why: "The ledger serves every deployment: an old deployment keeps claiming and committing after a new one is current (stale-drains)."
			},
			{
				file: "packages/den-model/src/simulator.ts",
				original: '\t\tnote("stale")\n\t\texit(worker)\n\t}\n',
				replacement:
					'\t\tnote("stale")\n\t\texit(worker)\n\t\tsend({ step: worker.message.step, attempt: 0, cause: { _tag: "Continuation", worker: worker.id }, deployment: worker.deployment, deliverAt: 0 }, false)\n\t}\n',
				why: "A worker answered stale rings on before it exits, pinned to its own deployment: the old deployment keeps waking itself and never drains (stale-drains)."
			},
			{
				file: "packages/den-model/src/simulator.ts",
				original:
					'const keyOf = (send: Send): string => Arr.join([causeText(send.cause), stepText(send.step)], ":")\n',
				replacement:
					'const keyOf = (send: Send): string => Arr.join([stepText(send.step), String(send.attempt)], ":")\n',
				why: "Every ring is keyed by its step and attempt, not its cause: a delivery that ends without claiming spent the key, and every later ring of that attempt, the census's included, is dropped as a duplicate for the transport's whole window, so the step waits on it (rewake, no-stall)."
			},
			{
				file: "packages/den-model/src/ledger.ts",
				original:
					"\tOption.exists(HashMap.get(state.scopes, root.scope), (scope) => Option.isSome(scope.ending))\n",
				replacement:
					"\tOption.exists(HashMap.get(state.scopes, root.scope), (scope) => complete(scope, state))\n",
				why: "A root is retired once every child of its scope ended, before its finish ran: the finish runs with no graph to join it, fire-and-forget (owned)."
			},
			{
				file: "packages/den-model/src/search.ts",
				original:
					"\tArr.every(windowsOf(program), (window) => window.closes - window.opens >= census)\n",
				replacement:
					"\tArr.every(windowsOf(program), (window) => window.closes - window.opens >= census - 1)\n",
				why: "The declaration check of a window is off by one: a window open one tick shorter than the census's period is admitted, and some of its spans fall between two ticks (window-tick)."
			}
		]
	}
)
