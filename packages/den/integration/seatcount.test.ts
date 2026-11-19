import { lower } from "@bjornpagen/den/lower/fragment"
import { printFragment } from "@bjornpagen/den/lower/print"
import { holderOf, instantOf, rootScope, startedStep } from "@bjornpagen/den/runtime/identity"
import { giveBack, take } from "@bjornpagen/den/runtime/seats"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { boolean, finite, type Gen } from "@bjornpagen/testing/gen"
import { type Case, type Need, NeedFailed, property } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, FileSystem, Option, Path, String as Str } from "effect"
import { fan, pool } from "#integration/slice/flows.ts"
import { grizzle, liveSliceCase, migrateIn, openLedgers } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A resource's seat count is a closed relation of the flow's declaration, and every live hold's seat is checked below
 * it, on the seat level the slice's schema states over its own: the live holds, a derived relation of the holds no free
 * ended, under a rule over a query. Lowering the Pool from two seats to one is a migration that grizzle validates
 * against the live holds, so it is admitted exactly when no live hold sits at seat 1: a freed turn stays a row until
 * RETIRE deletes it, and it is no live hold.
 *
 * Oracle (postgresql): `grizzle migrate` of the slice to a copy of it whose Pool holds one seat, over a database where
 * seat 0 is held and seat 1 was never taken, is held, or was taken and freed: admitted, or refused by the seat law the
 * existing rows violate (its validation's integrity_constraint_violation, SQLSTATE 23000, naming the law).
 */

/** What became of seat 1 after seat 0 was taken: never taken, or taken and then held or given back. */
type Seat = "never taken" | "held" | "freed"

/**
 * Seat 1's fate, each of the three a case of its own: whether it was taken after seat 0, and only once it was, whether
 * its hold was then given back.
 */
const seatOne: Gen<Seat> = (source) => {
	if (!source.draw(boolean)) {
		return "never taken"
	}
	return source.draw(boolean) ? "freed" : "held"
}

const sliceDir = `${import.meta.dirname}/slice`

/**
 * A copy of the slice, beside it, whose Pool holds one seat: every module of it read under the copy's own specifiers,
 * the fan-out's fragment printed again with the lowered count, and a migration from the slice's own to it drafted by
 * `grizzle generate`.
 */
const lowered = Effect.gen(function* () {
	const fs = yield* FileSystem.FileSystem
	const path = yield* Path.Path
	const workspace = yield* fs.makeTempDirectoryScoped({
		directory: import.meta.dirname,
		prefix: ".seats-"
	})
	const copy = path.join(workspace, "slice")
	const specifier = `#integration/${path.basename(workspace)}/slice/`
	yield* fs.copy(sliceDir, copy)
	const files = yield* fs.readDirectory(copy, { recursive: true })
	yield* Effect.forEach(Arr.filter(files, Str.endsWith(".ts")), (file) =>
		Effect.flatMap(fs.readFileString(path.join(copy, file)), (text) =>
			fs.writeFileString(
				path.join(copy, file),
				Str.replaceAll("#integration/slice/", specifier)(text)
			)
		)
	)
	const flow = lower(fan)
	const oneSeat = {
		...flow,
		seats: Option.map(flow.seats, (seats) => ({
			...seats,
			counts: {
				...seats.counts,
				rows: Arr.map(seats.counts.rows, (row) => ({ ...row, count: 1n }))
			}
		}))
	}
	yield* fs.writeFileString(
		path.join(copy, "generated", "fan.fragment.ts"),
		printFragment(oneSeat, {
			fragment: `${specifier}generated/fan.fragment.ts`,
			programs: `${specifier}generated/fan.programs.ts`,
			relations: `${specifier}relations.ts`,
			schema: { from: `${specifier}app.ts`, name: "App" },
			writer: { from: `${specifier}roles.ts`, name: "Loader" },
			flow: { from: `${specifier}flows.ts`, name: "fan" }
		})
	)
	yield* grizzle("generate", {}, copy)
	return copy
})

/**
 * The lowered copy of the slice, once per worker (a need opened in the worker's scope, so the copy is removed when the
 * worker ends): every case of a worker migrates its own database to it, and reads it only.
 */
const loweredSlice: Need<string> = {
	key: "den seat counts: the slice lowered to one Pool seat",
	open: Effect.mapBoth(lowered, {
		onSuccess: Effect.succeed,
		onFailure: (cause) =>
			NeedFailed.make({ need: "den seat counts", message: `the lowered copy: ${cause.message}` })
	})
}

/**
 * Admits lowering a seat count exactly when no live hold sits at or above the new count.
 *
 * Box: its suite's, every case of it.
 */
export const admitsLoweringASeatCountExactlyWhenNoLiveHoldSitsAtOrAboveTheNewCount =
	property.exhaust(finite(seatOne), {
		box: "seat 1 of the Pool's two, never taken, held or freed, beside seat 0 held",
		needs: { slice: liveSliceCase, loweredCopy: loweredSlice },
		situations: ["never taken", "held", "freed"] satisfies ReadonlyArray<Reached<Seat>>,
		check:
			({ slice, loweredCopy }, c: Case<Seat>) =>
			(seat) =>
				Effect.flatMap(slice, (services) =>
					Effect.provideContext(
						Effect.gen(function* () {
							c.note(seat)
							const { fan: ledgers } = yield* openLedgers
							const ledger = ledgers.ledger
							const at = yield* ledger.now
							const until = instantOf(Number(at) + longestLeaseMillis)
							const scope = yield* rootScope("Fan", "FanRun", "seat counts")
							const holder = (ordinal: number) =>
								Effect.flatMap(startedStep(scope, ordinal), (step) => holderOf(step, 1, ordinal))
							const takeOne = (ordinal: number) =>
								Effect.flatMap(holder(ordinal), (h) => take(ledger, [pool], h, until, at))
							const first = yield* takeOne(0)
							assert.deepStrictEqual(
								Option.map(
									first,
									Arr.map((hold) => hold.seat)
								),
								Option.some([0n])
							)
							if (seat !== "never taken") {
								const second = yield* takeOne(1)
								assert.deepStrictEqual(
									Option.map(
										second,
										Arr.map((hold) => hold.seat)
									),
									Option.some([1n])
								)
								if (seat === "freed") {
									yield* giveBack(
										ledger,
										Option.getOrElse(second, () => [])
									)
								}
							}
							const copy = yield* loweredCopy
							const migrated = yield* Effect.result(migrateIn(copy))
							assert.deepStrictEqual(
								migrated._tag === "Success"
									? "admitted"
									: Str.includes("SQLSTATE 23000")(migrated.failure.message) &&
										  Str.includes("fan_seat_below_count")(migrated.failure.message)
										? "refused by the seat law"
										: migrated.failure.message,
								seat === "held" ? "refused by the seat law" : "admitted"
							)
						}),
						services
					)
				),
		oracle: {
			kind: "postgresql",
			name: "grizzle migrate to one Pool seat, validating each live hold's seat below the count"
		},
		kept: [],
		kills: [
			{
				file: "packages/den/src/lower/fragment.ts",
				original: "\tterms: Arr.map(terms, (field) => ({ field, pred: false }))",
				replacement: "\tterms: Arr.map(terms, (field) => ({ field, pred: true }))",
				why: "Operator mutant (boolean) at packages/den/src/lower/fragment.ts:248 in sideOf: `false` becomes `true`; the property fails (lane CATCH, den 9cffaba)."
			},
			{
				file: "packages/den/src/lower/print.ts",
				original: `\t\t\t\`const \${st.live} = derived(\${q(st.live)}, \${liveOf(n.coordination, st.hold, st.freed, ["resource", "seat"], ["holder", "until"])})\`,\n`,
				replacement: `\t\t\t\`const \${st.live} = derived(\${q(st.live)}, query(\${n.coordination}).rule((r) => { const { resource, seat, turn, holder, until } = v(\${st.hold}, "hold"); return r.match(\${st.hold}, { resource, seat, turn, holder, until }).find({ resource, seat, turn, holder, until }) }))\`,\n`,
				why: "The seat level checks every hold, freed turns included; the property fails on it (one of den's kept mutants before the conversion)."
			}
		]
	})
