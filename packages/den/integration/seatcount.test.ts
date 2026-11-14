import { caseHang, longestLeaseMillis } from "@bjornpagen/den/limits"
import { lower } from "@bjornpagen/den/lower/fragment"
import { printFragment } from "@bjornpagen/den/lower/print"
import { holderOf, instantOf, rootScope, startedStep } from "@bjornpagen/den/runtime/identity"
import { giveBack, take } from "@bjornpagen/den/runtime/seats"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { boolean, type Gen } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { NodeServices } from "@effect/platform-node"
import { assert, layer } from "@effect/vitest"
import {
	Array as Arr,
	Effect,
	FileSystem,
	Formatter,
	Layer,
	Option,
	Path,
	Stream,
	String as Str
} from "effect"
import { ChildProcess } from "effect/process"
import { fan } from "#integration/slice/flows.ts"
import { migrateIn, openLedgers, sliceLayer } from "#integration/support/slice.ts"

/**
 * A resource's seat count is a closed relation of the flow's declaration, and every hold's seat is checked below it.
 * Lowering the Pool from two seats to one is a migration that grizzle validates against every hold, so it is admitted
 * exactly when no hold, live or freed, sits at seat 1: a freed turn stays a row until RETIRE deletes it.
 *
 * Oracle (postgresql): `grizzle migrate` of the slice to a copy of it whose Pool holds one seat, over a database where
 * seat 0 is held and seat 1 was never taken, is held, or was taken and freed: admitted, or refused by a check a row
 * violates (SQLSTATE 23514).
 */

type Feature = "never taken" | "held" | "freed"

/** What became of seat 1: whether it was taken after seat 0, and whether its hold was then given back. */
interface Seat {
	readonly taken: boolean
	readonly freed: boolean
}

const seatOne: Gen<Seat> = (source) => ({
	taken: source.draw(boolean),
	freed: source.draw(boolean)
})

const featureOf = (seat: Seat): Feature =>
	!seat.taken ? "never taken" : seat.freed ? "freed" : "held"

const sliceDir = `${import.meta.dirname}/slice`
const grizzleBin = `${import.meta.dirname}/../../../vendor/grizzle/packages/grizzle/src/cli/main.ts`

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
		counts: Option.map(flow.counts, (counts) => ({
			...counts,
			rows: Arr.map(counts.rows, (row) => ({ ...row, count: 1n }))
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
	const handle = yield* ChildProcess.make(
		process.execPath,
		[grizzleBin, "generate", "grizzle.config.ts"],
		{ cwd: copy, extendEnv: true, stdin: "ignore" }
	)
	const [out, code] = yield* Effect.all(
		[Stream.mkString(Stream.decodeText(handle.stdout)), handle.exitCode],
		{ concurrency: "unbounded" }
	)
	assert.strictEqual(code, 0, out)
	return copy
})

layer(NodeServices.layer, { excludeTestServices: true })("seat counts", (it) => {
	it.effect(
		"admits lowering a seat count exactly when no hold sits at or above the new count",
		(ctx) =>
			searched(
				ctx,
				Effect.scoped(
					Effect.gen(function* () {
						const copy = yield* lowered
						return yield* exhaust(
							{
								suite: "seat counts",
								generator: seatOne,
								literal: Formatter.format,
								coverage: requiredInSpace<Feature>(["never taken", "held", "freed"]),
								caseHang,
								box: "seat 1 of the Pool's two, never taken, held or freed, beside seat 0 held",
								oracle: {
									kind: "postgresql",
									name: "grizzle migrate to one Pool seat, validating each hold's seat below the count"
								}
							},
							(seat, c) =>
								Effect.gen(function* () {
									c.note(featureOf(seat))
									const { fan: ledgers } = yield* openLedgers
									const ledger = ledgers.ledger
									const at = yield* ledger.now
									const until = instantOf(Number(at) + longestLeaseMillis.value)
									const scope = yield* rootScope("Fan", "FanRun", "seat counts")
									const holder = (ordinal: number) =>
										Effect.flatMap(startedStep(scope, ordinal), (step) =>
											holderOf(step, 1, ordinal)
										)
									const takeOne = (ordinal: number) =>
										Effect.flatMap(holder(ordinal), (h) => take(ledger, ["Pool"], h, until, at))
									const first = yield* takeOne(0)
									assert.deepStrictEqual(
										Option.map(
											first,
											Arr.map((hold) => hold.seat)
										),
										Option.some([0n])
									)
									if (seat.taken) {
										const second = yield* takeOne(1)
										assert.deepStrictEqual(
											Option.map(
												second,
												Arr.map((hold) => hold.seat)
											),
											Option.some([1n])
										)
										if (seat.freed) {
											yield* giveBack(
												ledger,
												Option.getOrElse(second, () => [])
											)
										}
									}
									const migrated = yield* Effect.result(migrateIn(copy))
									assert.deepStrictEqual(
										migrated._tag === "Success"
											? "admitted"
											: Str.includes("SQLSTATE 23514")(migrated.failure.message)
												? "refused by a check"
												: migrated.failure.message,
										seat.taken ? "refused by a check" : "admitted"
									)
								}).pipe(
									(body) =>
										Effect.flatMap(Layer.build(sliceLayer), (installed) =>
											Effect.provideContext(body, installed)
										),
									Effect.scoped
								)
						)
					})
				)
			)
	)
})
