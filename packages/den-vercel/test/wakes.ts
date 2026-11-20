import { boolean, characterOf, type Gen, int, oneOf, string } from "@bjornpagen/testing/gen"
import { Array as Arr } from "effect"

/**
 * Wakes and the rings that send them as the suites draw them, in their encoded form: flows whose names hold colons and
 * the words a key spells (`step`, `admit`), steps and scopes over a small alphabet so keys share their parts, attempts
 * near 1, and causes over few instants and positions.
 */

/** A wake as its JSON holds it. */
export type Encoded =
	| Readonly<{ _tag: "Step"; flow: string; step: string; attempt: number }>
	| Readonly<{ _tag: "Admit"; flow: string; scope: string }>

const hex = characterOf(["0", "1", "a"])

/** A SHA-256 digest's text, 64 hex digits, as den derives a key. */
const digest: Gen<string> = string(hex, { min: 64, max: 64 })

/** A flow's name, from letters a key also spells and its separator. */
const flow: Gen<string> = string(characterOf(["Q", ":", "s", "t", "e", "p", "a"]), {
	min: 1,
	max: 6
})

/** A step's attempt. */
const attempt: Gen<number> = int(0, 11)

/** A wake for a step's attempt. */
const step: Gen<Encoded> = (source) => ({
	_tag: "Step",
	flow: source.draw(flow),
	step: source.draw(digest),
	attempt: source.draw(attempt)
})

/** A wake for a scope's admission. */
const admit: Gen<Encoded> = (source) => ({
	_tag: "Admit",
	flow: source.draw(flow),
	scope: source.draw(digest)
})

/** A wake of either kind. */
export const encodedWake: Gen<Encoded> = oneOf([step, admit])

/** A ring's cause as the suites draw it, a turn's by the wake it served in its encoded form. */
export type EncodedCause =
	| Readonly<{ _tag: "Turn"; by: Encoded; at: number }>
	| Readonly<{ _tag: "Relay"; position: string }>
	| Readonly<{ _tag: "Census"; at: number }>
	| Readonly<{ _tag: "Request" }>

/** A ring as the suites draw it: its wake and its cause, both encoded; every ring of the suites is due at once. */
export interface EncodedRing {
	readonly wake: Encoded
	readonly cause: EncodedCause
}

/** An instant a cause names, few of them, so two causes of one kind often name the same one. */
const instant: Gen<number> = int(0, 2)

/** A cause of each kind: a turn's end, the relay at a position, a census tick or a root's request. */
const cause: Gen<EncodedCause> = oneOf<EncodedCause>([
	(source) => ({ _tag: "Turn", by: source.draw(encodedWake), at: source.draw(instant) }),
	(source) => ({ _tag: "Relay", position: source.draw(string(hex, { min: 1, max: 2 })) }),
	(source) => ({ _tag: "Census", at: source.draw(instant) }),
	() => ({ _tag: "Request" })
])

/**
 * Rings some of which repeat an earlier one, as a relay's replay of the commits it rang for does, and some of which
 * ring an earlier ring's wake for another cause, as a commit and the census ring one attempt each: each draw is a new
 * ring, a copy of one already drawn, or one already drawn's wake under a cause of its own.
 */
export const rings =
	(size: Readonly<{ min: number; max: number }>): Gen<ReadonlyArray<EncodedRing>> =>
	(source) => {
		const length = source.draw(int(size.min, size.max))
		const drawn: Array<EncodedRing> = []
		for (let at = 0; at < length; at += 1) {
			const pick = source.draw(int(0, at))
			if (pick === at) {
				drawn.push({ wake: source.draw(encodedWake), cause: source.draw(cause) })
			} else {
				const earlier = Arr.getUnsafe(drawn, pick)
				drawn.push(
					source.draw(boolean) ? earlier : { wake: earlier.wake, cause: source.draw(cause) }
				)
			}
		}
		return drawn
	}

/** A ring of `wake`, drawn alone. */
export const ringOf =
	(wake: Gen<Encoded>): Gen<EncodedRing> =>
	(source) => ({
		wake: source.draw(wake),
		cause: source.draw(cause)
	})
