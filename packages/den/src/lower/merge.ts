import { Array as Arr, Record } from "effect"
import { Refused } from "#algebra/kinds.ts"

/**
 * The seam CLASH replaces, and the one conversion of a fragment's list of relations into the record `schema()` takes
 * at `a226cbac`. A fragment is an ordered list (`lower/fragment.ts`), the form `schema()` takes once CLASH lands, and
 * grizzle then refuses a clash itself as `DuplicateIdentity`; at the repin this module is deleted and the app's
 * `schema(...)` takes its relations and the fragments' as one list. Until then it merges them into one record, refusing
 * a name two of them hold: a JavaScript spread keeps the later of two equal keys and drops the other before grizzle
 * could refuse it.
 */

/** A declaration a fragment lists: a relation or a roster, by its name. */
interface Named {
	readonly name: string
}

/** The record of a list of declarations, each under its own name. */
export type RecordOf<L extends ReadonlyArray<Named>> = { readonly [D in L[number] as D["name"]]: D }

/** The claim behind the conversion, unchecked: a record built from a list by each declaration's name is its record. */
const keyedByName: <L extends ReadonlyArray<Named>>(
	record: Readonly<Record<string, Named>>,
	list: L
) => asserts record is RecordOf<L> = () => undefined

/** The conversion: a list of declarations as the record of them by name. */
const recordOf = <L extends ReadonlyArray<Named>>(declarations: L): RecordOf<L> => {
	const record: Readonly<Record<string, Named>> = Record.fromEntries(
		Arr.map(declarations, (d) => [d.name, d] as const)
	)
	keyedByName(record, declarations)
	return record
}

/** The app's relations and the fragments' declarations, as the one record `schema()` takes, refusing any clash. */
export const merge = <
	A extends Readonly<Record<string, unknown>>,
	const F extends ReadonlyArray<ReadonlyArray<Named>>
>(
	app: A,
	...fragments: F
): A & RecordOf<F[number]> => {
	const names = [...Record.keys(app), ...Arr.flatMap(fragments, (f) => Arr.map(f, (d) => d.name))]
	const clashes = Arr.dedupe(
		Arr.filter(names, (name, i) => Arr.some(Arr.take(names, i), (earlier) => earlier === name))
	)
	if (Arr.isReadonlyArrayNonEmpty(clashes)) {
		throw new Refused({
			declaration: "merge",
			why: `two declarations are named ${Arr.join(clashes, ", ")}`
		})
	}
	return { ...app, ...recordOf(Arr.flatten(fragments)) }
}
