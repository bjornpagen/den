import { Array as Arr, Record } from "effect"
import { Refused } from "#algebra/kinds.ts"

/**
 * The app's relations and a flow's fragment, merged into the one record the app's `schema(...)` takes, refusing a name
 * both hold: a JavaScript spread keeps the later of two equal keys and drops the other before grizzle could refuse it.
 * The seam CLASH replaces, once grizzle refuses a fragment's clashes itself.
 */
export const merge = <
	A extends Readonly<Record<string, unknown>>,
	B extends Readonly<Record<string, unknown>>
>(
	app: A,
	fragment: B
): A & B => {
	const clashes = Arr.filter(Record.keys(fragment), (name) => Record.has(app, name))
	if (Arr.isReadonlyArrayNonEmpty(clashes)) {
		throw new Refused({
			declaration: "merge",
			why: `the app and a fragment both declare ${Arr.join(clashes, ", ")}`
		})
	}
	return { ...app, ...fragment }
}
