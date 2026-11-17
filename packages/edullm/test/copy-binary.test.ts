/**
 * The binary COPY frame scanner: bodies PostgreSQL's own format writes for drawn tuples (NULL fields, empty fields, no
 * tuple at all), whole or made wrong one way a replica's answer or its transport can break one (cut short, trailing
 * bytes, a tuple one field wider, a critical flag bit set, a signature byte changed), fed to the scanner in drawn
 * chunks. It counts a whole body's tuples however the body is chunked, and refuses a wrong one at its first malformed
 * byte.
 *
 * Oracle (specification): PostgreSQL's binary COPY grammar, as its documentation states the format apart from the
 * scanner's: a body's tuple count, or its first malformed byte.
 */
import type { Reached } from "@bjornpagen/testing/features"
import { type Case, property } from "@bjornpagen/testing/property"
import { Array as Arr, Option } from "effect"
import { PGCOPY, tuplesOf } from "#copy-binary.ts"
import {
	chunksOf,
	expectedOf,
	type Noticed,
	sameOutcome,
	type Scenario,
	scenarioGen
} from "#test/copy-binary.fixtures.ts"
import { law } from "#test/support/law.ts"

/**
 * The binary COPY frame scanner counts a body's tuples however it is chunked, and refuses its first malformed byte.
 *
 * Budget: its suite's count before the conversion (copy-binary: frames: 600 independent cases and 200 steered, Vitest
 * at den dc5bd11).
 */
export const frames = property.explore(scenarioGen, {
	needs: {},
	situations: [
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
	] satisfies ReadonlyArray<Reached<Noticed>>,
	check: (_, c: Case<Noticed>) => (scenario: Scenario) => {
		c.note(scenario.corruption._tag)
		const fields = Arr.flatten(scenario.tuples)
		if (Arr.some(fields, Option.isNone)) {
			c.note("null")
		}
		if (Arr.some(fields, (field) => Option.exists(field, (payload) => payload.byteLength === 0))) {
			c.note("empty-field")
		}
		if (Arr.isReadonlyArrayNonEmpty(scenario.cuts)) {
			c.note("chunked")
		}
		if (scenario.tuples.length === 0) {
			c.note("no-tuple")
		}
		const scanned = tuplesOf(PGCOPY, scenario.fields, chunksOf(scenario.body, scenario.cuts))
		const expected = expectedOf(scenario)
		return law(
			"frames",
			sameOutcome(scanned, expected),
			() => `scanned ${String(scanned)}, the grammar says ${String(expected)}`
		)
	},
	oracle: {
		kind: "specification",
		name: "PostgreSQL's binary COPY grammar: a body's tuple count, or its first malformed byte"
	},
	budget: { runs: 600, steered: 200 },
	kept: [],
	kills: [
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: "\tcriticalFlags: 0xffff_0000,",
			replacement: "\tcriticalFlags: 0,",
			why: "A scanner blind to the critical flag bits reads a body whose flags mark a critical format issue as a well-formed one; the frames property fails on a Critical body."
		},
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: "\tnullLength: 0xffff_ffff",
			replacement: "\tnullLength: 0",
			why: "A scanner that reads a NULL's length as a payload's refuses a NULL field as a field too long; the frames property fails on a whole body that holds a NULL."
		},
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: "\tsignature: [80, 71, 67, 79, 80, 89, 10, 255, 13, 10, 0],",
			replacement: "\tsignature: [80, 71, 67, 79, 80, 89, 10, 255, 13, 10],",
			why: "A scanner whose signature lacks its final zero byte reads every header one byte early; the frames property fails on a whole body."
		},
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: '\t\t\t\treturn refused("signature", bytes - 1)',
			replacement: '\t\t\t\treturn refused("signature", bytes - 0)',
			why: "Operator mutant (bound) at packages/edullm/src/copy-binary.ts:164 in acceptByte: `1` becomes `0`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: "\t\tif (remaining === 0) {",
			replacement: "\t\tif (remaining === 1) {",
			why: "Operator mutant (bound) at packages/edullm/src/copy-binary.ts:182 in skip: `0` becomes `1`; the property fails (lane CATCH, den 9cffaba)."
		},
		{
			file: "packages/edullm/src/copy-binary.ts",
			original: "\t\t\t\t\toffset += skip(chunk.byteLength - offset)",
			replacement: "\t\t\t\t\toffset += skip(offset - chunk.byteLength)",
			why: "Operator mutant (operand-swap) at packages/edullm/src/copy-binary.ts:200 in scannerOf: `chunk.byteLength - offset` becomes `offset - chunk.byteLength`; the property fails (lane CATCH, den 9cffaba)."
		}
	]
})
