import { type Case, drawn, explore, Run } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { array, bytes, type Gen, increasing, int, option, oneOf } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { searched } from "@bjornpagen/testing/vitest"
import { runOfTest } from "@bjornpagen/testing/vitest/run"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, Option, Result } from "effect"
import {
	bodyOf,
	type CopyFormat,
	FieldCount,
	FramesRefused,
	PGCOPY,
	type Tuple,
	tuplesOf
} from "#copy-binary.ts"
import { caught, exploration, law } from "#test/support/search.ts"

/** How a drawn body is made wrong, if it is: each is one way a replica's answer or its transport can break it. */
type Corruption =
	| Readonly<{ _tag: "Whole" }>
	| Readonly<{ _tag: "Truncated"; keep: number }>
	| Readonly<{ _tag: "Trailing"; extra: Uint8Array }>
	| Readonly<{ _tag: "Widened"; tuple: number }>
	| Readonly<{ _tag: "Critical"; bit: number }>
	| Readonly<{ _tag: "Signature"; at: number; byte: number }>

type Noticed = Corruption["_tag"] | "null" | "empty-field" | "chunked" | "no-tuple"

type Scenario = Readonly<{
	fields: FieldCount
	tuples: ReadonlyArray<Tuple>
	flags: number
	corruption: Corruption
	body: Uint8Array
	cuts: ReadonlyArray<number>
}>

const tupleGen =
	(fields: number): Gen<Tuple> =>
	(source) =>
		source.draw(array(option(bytes({ min: 0, max: 6 })), { min: fields, max: fields }))

const corruptionGen =
	(tuples: number, whole: number): Gen<Corruption> =>
	(source) =>
		source.draw(
			oneOf<Corruption>([
				() => ({ _tag: "Whole" }),
				(s) => ({ _tag: "Truncated", keep: s.draw(int(0, whole - 1)) }),
				(s) => ({ _tag: "Trailing", extra: s.draw(bytes({ min: 1, max: 3 })) }),
				(s) =>
					tuples === 0 ? { _tag: "Whole" } : { _tag: "Widened", tuple: s.draw(int(0, tuples - 1)) },
				(s) => ({ _tag: "Critical", bit: s.draw(int(16, 31)) }),
				(s) => {
					const at = s.draw(int(0, PGCOPY.signature.length - 1))
					const original = PGCOPY.signature[at] ?? 0
					return { _tag: "Signature", at, byte: (original + s.draw(int(1, 255))) % 256 }
				}
			])
		)

/** The body a scenario's corruption makes of its tuples, encoded by PostgreSQL's own format. */
const corruptedOf = (
	tuples: ReadonlyArray<Tuple>,
	flags: number,
	corruption: Corruption
): Uint8Array => {
	const whole = bodyOf(PGCOPY, flags, tuples)
	switch (corruption._tag) {
		case "Whole":
			return whole
		case "Truncated":
			return whole.subarray(0, corruption.keep)
		case "Trailing":
			return Uint8Array.from([...whole, ...corruption.extra])
		case "Widened":
			return bodyOf(
				PGCOPY,
				flags,
				Arr.map(tuples, (tuple, at) =>
					at === corruption.tuple ? [...tuple, Option.none()] : tuple
				)
			)
		case "Critical":
			return bodyOf(PGCOPY, (flags | (2 ** corruption.bit)) >>> 0, tuples)
		case "Signature":
			return Uint8Array.from(whole, (byte, at) => (at === corruption.at ? corruption.byte : byte))
	}
}

const scenarioGen: Gen<Scenario> = (source) => {
	const fields = FieldCount.make(source.draw(int(0, 4)))
	const tuples = source.draw(array(tupleGen(fields), { min: 0, max: 5 }))
	const flags = source.draw(int(0, 0xffff))
	const corruption = source.draw(corruptionGen(tuples.length, bodyOf(PGCOPY, flags, tuples).length))
	const body = corruptedOf(tuples, flags, corruption)
	const cuts = source.draw(increasing(1, Math.max(1, body.length - 1), { min: 0, max: 4 }))
	return { fields, tuples, flags, corruption, body, cuts }
}

/** A body cut into chunks at the scenario's cuts. */
const chunksOf = (body: Uint8Array, cuts: ReadonlyArray<number>): ReadonlyArray<Uint8Array> => {
	const bounds = [0, ...Arr.filter(cuts, (cut) => cut < body.length), body.length]
	return Arr.map(Arr.zip(bounds, Arr.drop(bounds, 1)), ([lo, hi]) => body.subarray(lo, hi))
}

/** The bytes before a tuple: the header, and every tuple before it, as the format writes them. */
const offsetOfTuple = (flags: number, tuples: ReadonlyArray<Tuple>, tuple: number): number =>
	bodyOf(PGCOPY, flags, Arr.take(tuples, tuple)).length - PGCOPY.shortBytes

/** What PostgreSQL's grammar says a scenario's body is: its tuples, or the first refusal and where it falls. */
const expectedOf = (scenario: Scenario): Result.Result<number, FramesRefused> => {
	const { corruption, flags, tuples } = scenario
	const refusal = (reason: FramesRefused["reason"], byteOffset: number) =>
		Result.fail(FramesRefused.make({ reason, byteOffset }))
	switch (corruption._tag) {
		case "Whole":
			return Result.succeed(tuples.length)
		case "Truncated":
			return refusal("truncated", corruption.keep)
		case "Trailing":
			return refusal("trailing-bytes", bodyOf(PGCOPY, flags, tuples).length)
		case "Widened":
			return refusal("tuple-field-count", offsetOfTuple(flags, tuples, corruption.tuple))
		case "Critical":
			return refusal("critical-flags", PGCOPY.signature.length)
		case "Signature":
			return refusal("signature", corruption.at)
	}
}

const sameOutcome = (
	left: Result.Result<number, FramesRefused>,
	right: Result.Result<number, FramesRefused>
): boolean =>
	Result.isSuccess(left)
		? Result.isSuccess(right) && left.success === right.success
		: Result.isFailure(right) &&
			left.failure.reason === right.failure.reason &&
			left.failure.byteOffset === right.failure.byteOffset

const framesSearch = (suite: string, format: CopyFormat, runs: number) =>
	explore(
		exploration({
			suite,
			draw: drawn(scenarioGen),
			coverage: required<Noticed>(
				[
					"Whole",
					"Truncated",
					"Trailing",
					"Widened",
					"Critical",
					"Signature",
					"null",
					"empty-field",
					"chunked",
					"no-tuple"
				],
				{ cases: 200, sense: notesOnly }
			),
			runs,
			shrink: 200,
			oracle: {
				kind: "specification",
				name: "PostgreSQL's binary COPY grammar: a body's tuple count, or its first malformed byte"
			}
		}),
		(scenario: Scenario, c: Case<Noticed>) => {
			c.note(scenario.corruption._tag)
			const fields = Arr.flatten(scenario.tuples)
			if (Arr.some(fields, Option.isNone)) {
				c.note("null")
			}
			if (
				Arr.some(fields, (field) => Option.exists(field, (payload) => payload.byteLength === 0))
			) {
				c.note("empty-field")
			}
			if (Arr.isReadonlyArrayNonEmpty(scenario.cuts)) {
				c.note("chunked")
			}
			if (scenario.tuples.length === 0) {
				c.note("no-tuple")
			}
			const scanned = tuplesOf(format, scenario.fields, chunksOf(scenario.body, scenario.cuts))
			const expected = expectedOf(scenario)
			return law(
				"frames",
				sameOutcome(scanned, expected),
				() => `scanned ${String(scanned)}, the grammar says ${String(expected)}`
			)
		}
	)

const inTheirRun = (ctx: Parameters<Parameters<typeof it.effect>[1]>[0]) =>
	Effect.provideServiceEffect(Run, runOfTest(ctx))

describe("the binary COPY frame scanner", () => {
	it.effect(
		"counts a body's tuples however it is chunked, and refuses its first malformed byte",
		(ctx) => searched(ctx, framesSearch("copy-binary: frames", PGCOPY, 600))
	)

	it.effect("catches a scanner blind to the critical flag bits", (ctx) =>
		caught(
			framesSearch(
				"copy-binary planted: critical flags ignored",
				{ ...PGCOPY, criticalFlags: 0 },
				100
			)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches a scanner that reads a NULL's length as a payload's", (ctx) =>
		caught(
			framesSearch("copy-binary planted: null read as a length", { ...PGCOPY, nullLength: 0 }, 100)
		).pipe(inTheirRun(ctx))
	)

	it.effect("catches a scanner whose signature lacks its final zero byte", (ctx) =>
		caught(
			framesSearch(
				"copy-binary planted: signature short by its terminator",
				{ ...PGCOPY, signature: [80, 71, 67, 79, 80, 89, 10, 255, 13, 10] },
				100
			)
		).pipe(inTheirRun(ctx))
	)
})
