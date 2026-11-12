import { Array as Arr, Order, Record, String as Str } from "effect"

/**
 * A value as the ledger records it: what a step's input, output and error, a write's value and a read's rows
 * are once they leave the typed code that made them. It is the JSON tree a grizzle row's typed columns encode, so a
 * trace the real engine writes and one this model writes compare value by value. A step's typed input lives in the
 * closure its spawn built, and its datum is only what the trace shows of it; the rows a read returns are the one datum
 * a body takes apart, as data from outside its typed code.
 */
export type Datum =
	| string
	| number
	| boolean
	| ReadonlyArray<Datum>
	| Readonly<{ [key: string]: Datum }>

const isList = (datum: Datum): datum is ReadonlyArray<Datum> => Arr.isArray(datum)

const BY_NAME: Order.Order<readonly [string, Datum]> = Order.mapInput(
	Order.String,
	([name]: readonly [string, Datum]) => name
)

const quoted = (text: string): string =>
	`"${Str.replaceAll('"', '\\"')(Str.replaceAll("\\", "\\\\")(text))}"`

/**
 * A datum's canonical text: strings quoted with `"` and `\` escaped, numbers as JavaScript prints them, a list's items
 * in order, a record's fields by their names' code points. Two data are equal exactly when their texts are, so the
 * text keys a datum in a map and prints it in a report.
 */
export const textOf = (datum: Datum): string => {
	if (typeof datum === "string") {
		return quoted(datum)
	}
	if (typeof datum === "number" || typeof datum === "boolean") {
		return `${datum}`
	}
	if (isList(datum)) {
		return `[${Arr.join(
			Arr.map(datum, (item) => textOf(item)),
			","
		)}]`
	}
	const fields = Arr.sort(Record.toEntries(datum), BY_NAME)
	return `{${Arr.join(
		Arr.map(fields, ([name, value]) => `${quoted(name)}:${textOf(value)}`),
		","
	)}}`
}
