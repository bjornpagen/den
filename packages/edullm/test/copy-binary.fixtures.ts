/**
 * What the properties of copy-binary.test.ts read: its spaces, PostgreSQL's grammar as written apart from the scanner,
 * and its helpers.
 */

import { array, bytes, type Gen, increasing, int, option, oneOf } from "@bjornpagen/testing/gen"
import { Array as Arr, Option, Result } from "effect"
import { bodyOf, type CopyFormat, FieldCount, FramesRefused, type Tuple } from "#copy-binary.ts"

/**
 * The binary COPY format as PostgreSQL's documentation states it, apart from the scanner's `PGCOPY`, so a body this
 * writes is the grammar's and not the scanner's: https://www.postgresql.org/docs/current/sql-copy.html, "Binary
 * Format": "11-byte sequence PGCOPY\n\377\r\n\0", "32-bit integer bit mask", "Bits 16–31 are reserved to denote
 * critical file format issues", "a 16-bit integer word containing the number of fields", "-1 indicates a NULL field
 * value", "a 16-bit integer word containing -1".
 */
const DOCUMENTED: CopyFormat = {
	signature: [80, 71, 67, 79, 80, 89, 10, 255, 13, 10, 0],
	shortBytes: 2,
	wordBytes: 4,
	criticalFlags: 0xffff_0000,
	maximumFields: 0x7fff,
	maximumLength: 0x7fff_ffff,
	trailer: 0xffff,
	nullLength: 0xffff_ffff
}

/** How a drawn body is made wrong, if it is: each is one way a replica's answer or its transport can break it. */
type Corruption =
	| Readonly<{ _tag: "Whole" }>
	| Readonly<{ _tag: "Truncated"; keep: number }>
	| Readonly<{ _tag: "Trailing"; extra: Uint8Array }>
	| Readonly<{ _tag: "Widened"; tuple: number }>
	| Readonly<{ _tag: "Critical"; bit: number }>
	| Readonly<{ _tag: "Signature"; at: number; byte: number }>

export type Noticed = Corruption["_tag"] | "null" | "empty-field" | "chunked" | "no-tuple"

export type Scenario = Readonly<{
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
					const at = s.draw(int(0, DOCUMENTED.signature.length - 1))
					const original = DOCUMENTED.signature[at] ?? 0
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
	const whole = bodyOf(DOCUMENTED, flags, tuples)
	switch (corruption._tag) {
		case "Whole":
			return whole
		case "Truncated":
			return whole.subarray(0, corruption.keep)
		case "Trailing":
			return Uint8Array.from([...whole, ...corruption.extra])
		case "Widened":
			return bodyOf(
				DOCUMENTED,
				flags,
				Arr.map(tuples, (tuple, at) =>
					at === corruption.tuple ? [...tuple, Option.none()] : tuple
				)
			)
		case "Critical":
			return bodyOf(DOCUMENTED, (flags | (2 ** corruption.bit)) >>> 0, tuples)
		case "Signature":
			return Uint8Array.from(whole, (byte, at) => (at === corruption.at ? corruption.byte : byte))
	}
}

export const scenarioGen: Gen<Scenario> = (source) => {
	const fields = FieldCount.make(source.draw(int(0, 4)))
	const tuples = source.draw(array(tupleGen(fields), { min: 0, max: 5 }))
	const flags = source.draw(int(0, 0xffff))
	const corruption = source.draw(
		corruptionGen(tuples.length, bodyOf(DOCUMENTED, flags, tuples).length)
	)
	const body = corruptedOf(tuples, flags, corruption)
	const cuts = source.draw(increasing(1, Math.max(1, body.length - 1), { min: 0, max: 4 }))
	return { fields, tuples, flags, corruption, body, cuts }
}

/** A body cut into chunks at the scenario's cuts. */
export const chunksOf = (
	body: Uint8Array,
	cuts: ReadonlyArray<number>
): ReadonlyArray<Uint8Array> => {
	const bounds = [0, ...Arr.filter(cuts, (cut) => cut < body.length), body.length]
	return Arr.map(Arr.zip(bounds, Arr.drop(bounds, 1)), ([lo, hi]) => body.subarray(lo, hi))
}

/** The bytes before a tuple: the header, and every tuple before it, as the format writes them. */
const offsetOfTuple = (flags: number, tuples: ReadonlyArray<Tuple>, tuple: number): number =>
	bodyOf(DOCUMENTED, flags, Arr.take(tuples, tuple)).length - DOCUMENTED.shortBytes

/** What PostgreSQL's grammar says a scenario's body is: its tuples, or the first refusal and where it falls. */
export const expectedOf = (scenario: Scenario): Result.Result<number, FramesRefused> => {
	const { corruption, flags, tuples } = scenario
	const refusal = (reason: FramesRefused["reason"], byteOffset: number) =>
		Result.fail(FramesRefused.make({ reason, byteOffset }))
	switch (corruption._tag) {
		case "Whole":
			return Result.succeed(tuples.length)
		case "Truncated":
			return refusal("truncated", corruption.keep)
		case "Trailing":
			return refusal("trailing-bytes", bodyOf(DOCUMENTED, flags, tuples).length)
		case "Widened":
			return refusal("tuple-field-count", offsetOfTuple(flags, tuples, corruption.tuple))
		case "Critical":
			return refusal("critical-flags", DOCUMENTED.signature.length)
		case "Signature":
			return refusal("signature", corruption.at)
	}
}

export const sameOutcome = (
	left: Result.Result<number, FramesRefused>,
	right: Result.Result<number, FramesRefused>
): boolean =>
	Result.isSuccess(left)
		? Result.isSuccess(right) && left.success === right.success
		: Result.isFailure(right) &&
			left.failure.reason === right.failure.reason &&
			left.failure.byteOffset === right.failure.byteOffset
