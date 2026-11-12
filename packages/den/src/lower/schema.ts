import { Array as Arr, Option, Record, type Schema } from "effect"
import {
	type ColumnSchema,
	type ErrorSchema,
	type FieldSchema,
	Refused,
	type Stored
} from "#algebra/kinds.ts"

/**
 * Effect Schema, lowered to typed columns: a struct to a relation keyed by its owner, text, bigint and boolean to their
 * PostgreSQL types, a literal union of texts to a closed roster, a brand to a contract of its base, and an Option to a
 * relation of its own, holding a row exactly when the value is there. `Unknown` and `Any` have no typed home and never
 * reach here: the algebra's types admit only these forms, and anything else is refused by name.
 */

/** A column's base PostgreSQL type. */
export type Base = "text" | "bigint" | "boolean"

/** What a column holds. */
export type ColumnType =
	| { readonly kind: "base"; readonly base: Base }
	| { readonly kind: "roster"; readonly handles: readonly [string, ...Array<string>] }
	| { readonly kind: "brand"; readonly brand: string; readonly base: Base }

/** A column: its field's name and type. */
export interface Column {
	readonly name: string
	readonly type: ColumnType
}

/** A value's relational shape: its columns, which its owner's row holds, and its optional ones, each a relation. */
export interface Shape {
	readonly columns: ReadonlyArray<Column>
	readonly options: ReadonlyArray<Column>
}

/** The shape of no value: a step that never fails with a typed error. */
export const noShape: Shape = { columns: [], options: [] }

const baseOf = (declaration: string, field: string, schema: Schema.Top): Base => {
	const ast = schema.ast
	if (ast.checks !== undefined) {
		throw new Refused({
			declaration,
			why: `field ${field} is refined by a check, which den does not yet lower to a law`
		})
	}
	if (ast._tag === "String") {
		return "text"
	}
	if (ast._tag === "BigInt") {
		return "bigint"
	}
	if (ast._tag === "Boolean") {
		return "boolean"
	}
	throw new Refused({
		declaration,
		why: `field ${field} is a ${ast._tag}, which has no typed home: use text, a bigint, a boolean, a literal union of texts, a brand of one or an Option of one`
	})
}

const textsOf = (
	declaration: string,
	field: string,
	literals: ReadonlyArray<unknown>
): readonly [string, ...Array<string>] => {
	const texts = Arr.filter(literals, (l): l is string => typeof l === "string")
	if (texts.length !== literals.length || !Arr.isReadonlyArrayNonEmpty(texts)) {
		throw new Refused({ declaration, why: `field ${field} is a literal union of more than texts` })
	}
	return texts
}

const columnOf = (declaration: string, field: string, schema: ColumnSchema): ColumnType => {
	if ("identifier" in schema) {
		return {
			kind: "brand",
			brand: schema.identifier,
			base: baseOf(declaration, field, schema.schema)
		}
	}
	if ("literals" in schema) {
		return { kind: "roster", handles: textsOf(declaration, field, schema.literals) }
	}
	if ("literal" in schema) {
		return { kind: "roster", handles: textsOf(declaration, field, [schema.literal]) }
	}
	return { kind: "base", base: baseOf(declaration, field, schema) }
}

const isOption = (schema: FieldSchema): schema is Schema.Option<ColumnSchema> => "value" in schema

/** The shape of a stored struct: each field a column, or an optional column of a relation of its own. */
export const shapeOf = (declaration: string, schema: Stored): Shape => {
	const fields = Arr.map(Record.toEntries(schema.fields), ([name, field]) => ({ name, field }))
	return {
		columns: Arr.flatMap(fields, ({ name, field }) =>
			isOption(field) ? [] : [{ name, type: columnOf(declaration, name, field) }]
		),
		options: Arr.flatMap(fields, ({ name, field }) =>
			isOption(field) ? [{ name, type: columnOf(declaration, name, field.value) }] : []
		)
	}
}

/** The shape of an error: a struct's, or none for Never. */
export const errorShapeOf = (declaration: string, schema: ErrorSchema): Option.Option<Shape> =>
	"fields" in schema ? Option.some(shapeOf(declaration, schema)) : Option.none()
