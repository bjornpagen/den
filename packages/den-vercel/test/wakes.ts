import { characterOf, type Gen, int, oneOf, string } from "@bjornpagen/testing/gen"
import { Array as Arr } from "effect"

/**
 * Wakes as the suites draw them, in their encoded form: flows whose names hold colons and the words a key spells
 * (`step`, `admit`), steps and scopes over a small alphabet so keys share their parts, and attempts near 1.
 */

/** A wake as its JSON holds it. */
export type Encoded =
	| Readonly<{ _tag: "Step"; flow: string; step: string; attempt: number }>
	| Readonly<{ _tag: "Admit"; flow: string; scope: string }>

const hex = characterOf(["0", "1", "a"])

const group = (length: number): Gen<string> => string(hex, { min: length, max: length })

/** A uuid of version 8 and its variant, as den derives one. */
const uuid: Gen<string> = (source) =>
	`${source.draw(group(8))}-${source.draw(group(4))}-8${source.draw(group(3))}-a${source.draw(group(3))}-${source.draw(group(12))}`

/** A flow's name, from letters a key also spells and its separator. */
const flow: Gen<string> = string(characterOf(["Q", ":", "s", "t", "e", "p", "a"]), {
	min: 1,
	max: 6
})

/** A step's attempt. */
const attempt: Gen<number> = int(1, 12)

/** A wake for a step's attempt. */
const step: Gen<Encoded> = (source) => ({
	_tag: "Step",
	flow: source.draw(flow),
	step: source.draw(uuid),
	attempt: source.draw(attempt)
})

/** A wake for a scope's admission. */
const admit: Gen<Encoded> = (source) => ({
	_tag: "Admit",
	flow: source.draw(flow),
	scope: source.draw(uuid)
})

/** A wake of either kind. */
export const encodedWake: Gen<Encoded> = oneOf([step, admit])

/**
 * Wakes some of which repeat an earlier one, as a commit and the census ring one attempt twice: each draw is a new
 * wake or a copy of one already drawn.
 */
export const wakes =
	(size: Readonly<{ min: number; max: number }>): Gen<ReadonlyArray<Encoded>> =>
	(source) => {
		const length = source.draw(int(size.min, size.max))
		const drawn: Array<Encoded> = []
		for (let at = 0; at < length; at += 1) {
			const pick = source.draw(int(0, at))
			drawn.push(pick === at ? source.draw(encodedWake) : Arr.getUnsafe(drawn, pick))
		}
		return drawn
	}
