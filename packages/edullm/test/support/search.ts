import {
	type Draw,
	type Exploration,
	type Explored,
	isWitness,
	type Oracle,
	type Run,
	type SearchFailure
} from "@bjornpagen/testing/explore"
import type { Coverage } from "@bjornpagen/testing/features"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { Data, Duration, Effect, Formatter } from "effect"

/**
 * A search of this package's suites: its sketch printed with Formatter, no kept case, one case at a time, its windows
 * of sixteen. A case has no hang guard of its own (`Duration.infinity`): every fake and every pure piece is a bounded
 * loop over its drawn scenario, and the test's deadline reports a case still in flight.
 */
export const exploration = <S, F extends string>(
	fields: Readonly<{
		suite: string
		draw: Draw<S, S>
		coverage: Coverage<F>
		runs: number
		shrink: number
		oracle: Oracle
	}>
): Exploration<S, S, F> => ({
	suite: fields.suite,
	draw: fields.draw,
	literal: Formatter.format,
	coverage: fields.coverage,
	kept: [],
	runs: fields.runs,
	shrink: boundedShrink(fields.shrink),
	concurrency: 1,
	steerEvery: 16,
	caseHang: Duration.infinity,
	oracle: fields.oracle
})

/** A planted bug's search passed, or failed only where the run's seed drew the case: its law did not catch it. */
class PlantedSurvived extends Data.TaggedError("PlantedSurvived")<{
	suite: string
	message: string
}> {}

/**
 * Requires a search over a planted bug to fail in a witness phase, the floor or the steered phase its suite's label
 * fixes, so its law catches the bug on every run seed. A pass, or a failure only the run's own seed drew, is the bug
 * surviving.
 */
export const caught = (
	search: Effect.Effect<Explored, SearchFailure, Run>
): Effect.Effect<void, SearchFailure | PlantedSurvived, Run> =>
	search.pipe(
		Effect.flatMap((explored) =>
			Effect.fail(
				new PlantedSurvived({
					suite: explored.suite,
					message: `${explored.suite}: every one of ${explored.cases} cases kept the law the bug was planted to break`
				})
			)
		),
		Effect.catchTag("PropertyFalsified", (falsified) =>
			isWitness(falsified.phase)
				? Effect.void
				: Effect.fail(
						new PlantedSurvived({
							suite: falsified.suite,
							message: `${falsified.suite}: only the ${falsified.phase} stream, which the run's seed draws, caught the bug`
						})
					)
		)
	)

/** A law a property found broken, with what broke it. */
class LawBroken extends Data.TaggedError("LawBroken")<{ law: string; message: string }> {}

/** Fails with the law unless it holds. */
export const law = (
	name: string,
	holds: boolean,
	message: () => string
): Effect.Effect<void, LawBroken> =>
	holds ? Effect.void : Effect.fail(new LawBroken({ law: name, message: message() }))
