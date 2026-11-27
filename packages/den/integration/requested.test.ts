import { given, operator } from "@bjornpagen/den/algebra/kinds"
import { lower } from "@bjornpagen/den/lower/fragment"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { finite, type Gen, int } from "@bjornpagen/testing/gen"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, String as Str } from "effect"
import { clock } from "#integration/slice/flows.ts"
import { liveSliceCase, migrateIn, openLedgers, sliceCopyNeed } from "#integration/support/slice.ts"

/**
 * A root whose input its request gives stands only beside what it was requested with (`<P>RequestedWith`), a law of
 * den's fragment, so an installation that holds such a root without its record cannot be migrated to a den that states
 * the law: grizzle validates the law over the rows the installation holds, and refuses the migration naming it. It is
 * the one-init cutover's guard (docs/decisions.md): an installation of a den from before the record holds every app's
 * and operator's root without one, and no migration takes it silently.
 *
 * The case stands it up the one way the slice can: a root whose input derives from its key records nothing, so the
 * clock's hourly bells, requested by the census's own request, are roots without a record; a copy of the slice in
 * which the hourly kind is an operator's, its input given, lowered by den, states the law over them, and
 * `grizzle generate` drafts the migration that adds it and drops the hourly kind's key, which a given input keeps none
 * of.
 *
 * Oracle (postgresql): `grizzle migrate` of the slice to that copy, over a database holding some hourly roots or none:
 * admitted where none stands, and refused by the law the roots violate where any does (its validation's
 * integrity_constraint_violation, naming the law).
 */

type Standing = "no root stands" | "a root stands without its record"

/** How many hourly roots stand when the migration runs: none, or one to three, each its own hour. */
const hours: Gen<number> = int(0, 3)

/**
 * The clock flow as a deploy that made its hourly kind an operator's, its input given by its request, declares it:
 * every other kind as it is.
 */
const recording = Object.freeze({
	...clock,
	kinds: Arr.map(clock.kinds, (kind) =>
		kind._tag === "Root" && kind.name === "Hourly"
			? { ...kind, trigger: operator, from: given }
			: kind
	)
})

/** The slice with its clock's hourly kind an operator's, which den lowers to the law over the hourly roots. */
const recordingSlice = sliceCopyNeed(
	"den requests: the slice with its hourly kind an operator's",
	"clock",
	lower(recording),
	["clock_hourly_key_cnlgnmcbbcgma"]
)

/**
 * A migration that makes a root kind record what it was requested with is admitted exactly where no root of the kind
 * stands, and refused by the law, naming it, where one stands without its record.
 *
 * Budget: the box, four cases, one a count of hourly roots.
 */
export const aRootWithoutItsRecordRefusesTheMigrationThatStatesIt = property.exhaust(
	finite(hours),
	{
		box: "the hourly roots standing when the migration runs: none, or one to three",
		needs: { slice: liveSliceCase, recordingCopy: recordingSlice },
		situations: ["no root stands", "a root stands without its record"] satisfies ReadonlyArray<
			Reached<Standing>
		>,
		check:
			({ slice, recordingCopy: copied }, c: Case<Standing>) =>
			(count) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							c.note(count === 0 ? "no root stands" : "a root stands without its record")
							const { clock: clockLedger } = yield* openLedgers
							yield* Effect.forEach(
								Arr.filter(Arr.range(1, 3), (hour) => hour <= count),
								(hour) => clockLedger.request.Hourly({ at: BigInt(hour), member: "east" })
							)
							const copy = yield* copied
							const migrated = yield* Effect.result(migrateIn(copy))
							assert.deepEqual(
								migrated._tag === "Success"
									? "admitted"
									: Str.includes("SQLSTATE 23000")(migrated.failure.message) &&
										  Str.includes("clock_root_kind_in_clock_requested_with")(
												migrated.failure.message
										  )
										? "refused by the law"
										: migrated.failure.message,
								count === 0 ? "admitted" : "refused by the law"
							)
						}),
						services
					)
				),
		oracle: {
			kind: "postgresql",
			name: "grizzle migrate to a copy whose hourly kind records, validating each of its roots against its record"
		},
		kept: [],
		kills: [
			{
				file: "packages/den/src/lower/fragment.ts",
				original: 'const recordsRequestOf = (from: InputFrom["kind"]): boolean => from === "given"',
				replacement:
					'const recordsRequestOf = (from: InputFrom["kind"]): boolean => from === "derived"',
				why: "A root whose input its request gives records nothing and no law holds it, so the migration over roots without their record is admitted and an installation from before the record migrates silently."
			}
		]
	}
)
