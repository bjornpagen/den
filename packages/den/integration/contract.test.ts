import { instantOf } from "@bjornpagen/den/runtime/identity"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, Result } from "effect"
import { buildNumberParser } from "#integration/slice/contracts.ts"
import { toBuildNumber } from "#integration/slice/relations.ts"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A field of a consumer's contract that den stores: the Gold root's and its Build step's input hold a build's number,
 * BuildNumber, a contract of the slice's app (relations.ts), decoded through its checked mint (contractInput), so den's
 * input and output columns of it are BuildNumber itself, its domain on PostgreSQL, as metis's essay flow holds a
 * sitting's stage, qti-pie's SittingKey. A request of a number the contract holds commits, is admitted and builds: its
 * Build step reads its input back from den's column, the contract's host type, and writes Built by it, a parameter of
 * BuildNumber. A request of a number outside it, made by the contract's unchecked mint, is refused by PostgreSQL at
 * den's input column, the domain's CHECK, and leaves no build.
 *
 * Oracle: PostgreSQL itself, its domain of BuildNumber on den's columns, beside the contract's parser's verdict of each
 * number.
 */

type Feature = "built" | "refused by the domain"

/** A build's number around zero: the contract's lower edge, below it and above it. */
const numbers: Gen<bigint> = (source) => BigInt(source.draw(int(-3, 3)))

/** A number the contract holds is built through den's columns of it; one it does not is refused by its domain. */
export const aBuildNumberOutsideItsContractIsRefusedByItsDomainAndOneInsideIsBuilt =
	property.explore(numbers, {
		needs: { slice: sliceCase },
		situations: ["built", "refused by the domain"] satisfies ReadonlyArray<Reached<Feature>>,
		check:
			({ slice }, c: Case<Feature>) =>
			(n) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							const { sync, ledgers } = yield* openLedgers
							const app = yield* openAuditor
							const parsed = buildNumberParser.parse(n)
							if (Result.isFailure(parsed)) {
								c.note("refused by the domain")
								const refused = yield* Effect.result(
									sync.request.Gold("gold", { build: toBuildNumber(n) })
								)
								assert.ok(Result.isFailure(refused), `a request of ${String(n)} is refused`)
								if (Result.isFailure(refused)) {
									assert.equal(refused.failure.kind, "refused")
								}
								const built = yield* rows(app.workload.built.once({ params: {}, facts: {} }))
								assert.equal(built.length, 0, "no build")
								return
							}
							c.note("built")
							const at = yield* sync.ledger.now
							const ends = instantOf(Number(at) + longestLeaseMillis)
							const gold = yield* sync.request.Gold("gold", { build: parsed.success })
							assert.ok(gold.fresh)
							const admitted = yield* serve(
								ledgers,
								{ _tag: "Admit", flow: FlowName.make("Sync"), scope: gold.scope },
								ends
							)
							assert.equal(admitted.ending.kind, "admitted")
							yield* ringOnAndDrain(ledgers, admitted)
							const built = yield* rows(app.workload.built.once({ params: {}, facts: {} }))
							assert.ok(
								Arr.some(built, (b) => b.build === parsed.success),
								`${String(n)} is built`
							)
						}),
						services
					)
				),
		oracle: {
			kind: "postgresql",
			name: "PostgreSQL's domain of BuildNumber on den's columns, beside the contract's parser's verdict"
		},
		budget: { runs: 7, steered: 7 },
		kept: [],
		kills: []
	})
