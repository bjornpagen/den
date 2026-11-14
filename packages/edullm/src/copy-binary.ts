import { Array as Arr, Option, Result, Schema } from "effect"

/**
 * PostgreSQL's binary COPY format as data: the signature, the widths of its integers, the flag bits that mark a
 * critical format issue, the largest field count and length, the trailer and the null length. A scanner reads one
 * format, so the protocol's every number is stated once, here, and a broken format is a value a search can plant.
 * Source: https://www.postgresql.org/docs/current/sql-copy.html, "Binary Format": "11-byte sequence PGCOPY\n\377\r\n\0",
 * "32-bit integer bit mask", "Bits 16–31 are reserved to denote critical file format issues", "a 16-bit integer word
 * containing the number of fields", "-1 indicates a NULL field value", "a 16-bit integer word containing -1".
 */
export type CopyFormat = Readonly<{
	signature: Arr.NonEmptyReadonlyArray<number>
	shortBytes: number
	wordBytes: number
	criticalFlags: number
	maximumFields: number
	maximumLength: number
	trailer: number
	nullLength: number
}>

/** The binary COPY format PostgreSQL writes (verified 2026-11-11 against the page `CopyFormat` cites). */
export const PGCOPY: CopyFormat = {
	signature: [80, 71, 67, 79, 80, 89, 10, 255, 13, 10, 0],
	shortBytes: 2,
	wordBytes: 4,
	criticalFlags: 0xffff_0000,
	maximumFields: 0x7fff,
	maximumLength: 0x7fff_ffff,
	trailer: 0xffff,
	nullLength: 0xffff_ffff
}

/** How many fields each tuple of a body carries: the roster's width, at most `PGCOPY.maximumFields`. */
export const FieldCount = Schema.Int.check(
	Schema.isBetween({ minimum: 0, maximum: PGCOPY.maximumFields })
).pipe(Schema.brand("FieldCount"))
export type FieldCount = typeof FieldCount.Type

/** Why a body is not a well-formed binary COPY body of its roster's width, and the byte it was refused at. */
export class FramesRefused extends Schema.TaggedError<
	FramesRefused,
	{ readonly brand: unique symbol }
>()("FramesRefused", {
	reason: Schema.Literals([
		"signature",
		"critical-flags",
		"extension-length",
		"tuple-field-count",
		"field-length",
		"trailing-bytes",
		"truncated"
	]),
	byteOffset: Schema.Int
}) {}

/** Where a scanner is in the grammar: inside the signature, an integer word, a skipped run of bytes, or past the trailer. */
type Phase =
	| "signature"
	| "flags"
	| "extension-length"
	| "extension"
	| "fields"
	| "length"
	| "payload"
	| "trailer"

/**
 * A scanner of one body, fed its chunks in order: `write` reads a chunk and refuses the first malformed byte; `finish`
 * says how many tuples the body held once its trailer was read, or refuses a body that ended before it. It allocates no
 * field, tuple or buffer, so a page of tens of megabytes is counted as it streams past.
 */
export type Scanner = Readonly<{
	write: (chunk: Uint8Array) => Result.Result<void, FramesRefused>
	finish: () => Result.Result<number, FramesRefused>
}>

/** A scanner of `format` for tuples of `fields` fields. */
export const scannerOf = (format: CopyFormat, fields: FieldCount): Scanner => {
	let phase: Phase = "signature"
	let bytes = 0
	let tuples = 0
	let signatureAt = 0
	let word = 0
	let wordBytes = 0
	let remaining = 0
	let fieldsLeft = 0

	const refused = (reason: FramesRefused["reason"], byteOffset: number) =>
		Result.fail(FramesRefused.make({ reason, byteOffset }))
	const enter = (next: Phase) => {
		phase = next
		word = 0
		wordBytes = 0
	}
	const endField = () => {
		fieldsLeft -= 1
		if (fieldsLeft === 0) {
			tuples += 1
			enter("fields")
			return
		}
		enter("length")
	}
	const acceptFields = (value: number): Result.Result<void, FramesRefused> => {
		if (value === format.trailer) {
			enter("trailer")
			return Result.void
		}
		if (value !== fields) {
			return refused("tuple-field-count", bytes - format.shortBytes)
		}
		fieldsLeft = value
		if (value === 0) {
			tuples += 1
			enter("fields")
			return Result.void
		}
		enter("length")
		return Result.void
	}
	const acceptLength = (value: number): Result.Result<void, FramesRefused> => {
		if (value === format.nullLength || value === 0) {
			endField()
			return Result.void
		}
		if (value > format.maximumLength) {
			return refused("field-length", bytes - format.wordBytes)
		}
		remaining = value
		enter("payload")
		return Result.void
	}
	const acceptWord = (value: number): Result.Result<void, FramesRefused> => {
		switch (phase) {
			case "flags":
				if ((value & format.criticalFlags) !== 0) {
					return refused("critical-flags", bytes - format.wordBytes)
				}
				enter("extension-length")
				return Result.void
			case "extension-length":
				if (value > format.maximumLength) {
					return refused("extension-length", bytes - format.wordBytes)
				}
				remaining = value
				enter(value === 0 ? "fields" : "extension")
				return Result.void
			case "fields":
				return acceptFields(value)
			case "length":
				return acceptLength(value)
			case "signature":
			case "extension":
			case "payload":
			case "trailer":
				return Result.void
		}
	}
	const acceptByte = (byte: number): Result.Result<void, FramesRefused> => {
		bytes += 1
		if (phase === "signature") {
			if (Option.getOrUndefined(Arr.get(format.signature, signatureAt)) !== byte) {
				return refused("signature", bytes - 1)
			}
			signatureAt += 1
			if (signatureAt === format.signature.length) {
				enter("flags")
			}
			return Result.void
		}
		word = word * 256 + byte
		wordBytes += 1
		return wordBytes === (phase === "fields" ? format.shortBytes : format.wordBytes)
			? acceptWord(word)
			: Result.void
	}
	const skip = (available: number): number => {
		const consumed = Math.min(available, remaining)
		remaining -= consumed
		bytes += consumed
		if (remaining === 0) {
			if (phase === "extension") {
				enter("fields")
			} else {
				endField()
			}
		}
		return consumed
	}

	return {
		write: (chunk) => {
			let offset = 0
			while (offset < chunk.byteLength) {
				if (phase === "trailer") {
					return refused("trailing-bytes", bytes)
				}
				if (phase === "extension" || phase === "payload") {
					offset += skip(chunk.byteLength - offset)
					continue
				}
				const accepted = acceptByte(chunk[offset] ?? 0)
				offset += 1
				if (Result.isFailure(accepted)) {
					return accepted
				}
			}
			return Result.void
		},
		finish: () => (phase === "trailer" ? Result.succeed(tuples) : refused("truncated", bytes))
	}
}

/** How many tuples a whole body, given as its chunks, holds: one scanner fed every chunk, then finished. */
export const tuplesOf = (
	format: CopyFormat,
	fields: FieldCount,
	chunks: ReadonlyArray<Uint8Array>
): Result.Result<number, FramesRefused> => {
	const scanner = scannerOf(format, fields)
	for (const chunk of chunks) {
		const written = scanner.write(chunk)
		if (Result.isFailure(written)) {
			return Result.fail(written.failure)
		}
	}
	return scanner.finish()
}

/** One field of a tuple as COPY writes it: its bytes, or none for SQL NULL. */
export type Field = Option.Option<Uint8Array>

/** A tuple: one field for each column of the roster, in the roster's order. */
export type Tuple = ReadonlyArray<Field>

/** `value` as a big-endian integer of `width` bytes. */
const bigEndian = (value: number, width: number): ReadonlyArray<number> =>
	Array.from({ length: width }, (_, at) => Math.floor(value / 256 ** (width - 1 - at)) % 256)

/**
 * The binary COPY body PostgreSQL writes for `tuples` under `format`, with `flags` in its header (zero, or bits below
 * the critical ones) and no header extension: the replica's answer to a page, and the scanner's oracle.
 */
export const bodyOf = (
	format: CopyFormat,
	flags: number,
	tuples: ReadonlyArray<Tuple>
): Uint8Array => {
	const header = [
		...format.signature,
		...bigEndian(flags, format.wordBytes),
		...bigEndian(0, format.wordBytes)
	]
	const fieldBytes = (field: Field): ReadonlyArray<number> =>
		Option.match(field, {
			onNone: () => bigEndian(format.nullLength, format.wordBytes),
			onSome: (bytes) => [...bigEndian(bytes.byteLength, format.wordBytes), ...bytes]
		})
	const tupleBytes = (tuple: Tuple): ReadonlyArray<number> => [
		...bigEndian(tuple.length, format.shortBytes),
		...Arr.flatMap(tuple, fieldBytes)
	]
	return Uint8Array.from([
		...header,
		...Arr.flatMap(tuples, tupleBytes),
		...bigEndian(format.trailer, format.shortBytes)
	])
}
