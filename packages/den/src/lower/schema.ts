import { Array as Arr, Option, Record, Schema } from "effect"
import {
	type ElementSchema,
	type ErrorSchema,
	type FieldSchema,
	named,
	Refused,
	type Stored,
	type TaggedUnionSchema
} from "#algebra/kinds.ts"

/**
 * Effect Schema, lowered to typed relations: a struct to a relation keyed by its owner; text, bigint, finite number and
 * boolean to their PostgreSQL types (a finite number to double precision, held finite by a row check), a literal union
 * of texts to a closed roster, a brand to a contract of its base; an Option to a relation of its own, holding a row
 * exactly when the value is there; an array to an ordered family; and a tagged union to its tag and a relation per
 * variant. `Unknown` and `Any` have no typed home and never reach here: the algebra's types admit only these forms, and
 * anything else is refused by name.
 */

/** A column's base PostgreSQL type: text, bigint, double precision or boolean. */
export type Base = "text" | "bigint" | "double" | "boolean"

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

/** What an array holds: one column's values, or the columns of a struct. */
export type Element =
	| { readonly kind: "value"; readonly type: ColumnType }
	| { readonly kind: "struct"; readonly columns: ReadonlyArray<Column> }

/** An array field: its name and what it holds, an ordered family of its own. */
export interface ArrayField {
	readonly name: string
	readonly element: Element
}

/** A tagged union's variant: its tag and its columns. */
export interface Variant {
	readonly tag: string
	readonly columns: ReadonlyArray<Column>
}

/** A tagged union field: its name and its variants, in declared order. */
export interface UnionField {
	readonly name: string
	readonly variants: readonly [Variant, ...Array<Variant>]
}

/**
 * A value's relational shape: its columns, which its owner's row holds; its optional ones, each a relation; its arrays,
 * each an ordered family; and its tagged unions, each a tag column of its owner's row and a relation per variant.
 */
export interface Shape {
	readonly columns: ReadonlyArray<Column>
	readonly options: ReadonlyArray<Column>
	readonly arrays: ReadonlyArray<ArrayField>
	readonly unions: ReadonlyArray<UnionField>
}

/** The shape of no value: a step that never fails with a typed error. */
export const noShape: Shape = { columns: [], options: [], arrays: [], unions: [] }

const baseOf = (declaration: string, field: string, schema: Schema.Top): Base => {
	const ast = schema.ast
	if (ast === Schema.Finite.ast) {
		return "double"
	}
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
		why: `field ${field} is a ${ast._tag}, which has no typed home: use text, a bigint, Schema.Finite, a boolean, a literal union of texts or a brand of one, an Option of one, an array of columns or of structs of them, or a tagged union of structs of columns`
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

/**
 * A column's type, read off its schema value: a brand's identifier rides on the value, which the AST does not hold. A
 * variant's fields arrive as any schema (TaggedUnionSchema), so each form is read by what its value holds, and anything
 * else is a base or refused.
 */
const columnOf = (declaration: string, field: string, schema: Schema.Top): ColumnType => {
	if (
		"identifier" in schema &&
		typeof schema.identifier === "string" &&
		"schema" in schema &&
		Schema.isSchema(schema.schema)
	) {
		return {
			kind: "brand",
			brand: schema.identifier,
			base: baseOf(declaration, field, schema.schema)
		}
	}
	if ("literals" in schema && Arr.isArray(schema.literals)) {
		return { kind: "roster", handles: textsOf(declaration, field, schema.literals) }
	}
	if ("literal" in schema) {
		return { kind: "roster", handles: textsOf(declaration, field, [schema.literal]) }
	}
	return { kind: "base", base: baseOf(declaration, field, schema) }
}

/** The columns of a struct's fields, each a column and none named as one the owner's relation keeps for itself. */
const columnsOf = (
	declaration: string,
	field: string,
	fields: { readonly [name: string]: Schema.Top },
	reserved: ReadonlyArray<string>
): ReadonlyArray<Column> =>
	Arr.map(Record.toEntries(fields), ([name, schema]) => {
		if (Arr.contains(reserved, name)) {
			throw new Refused({
				declaration,
				why: `field ${field} holds a field ${name}, which its relation keeps for itself`
			})
		}
		return { name, type: columnOf(declaration, `${field}.${name}`, schema) }
	})

/** How a field lowers: a column of its owner's row, an option, an array or a tagged union. */
type Part =
	| { readonly kind: "column"; readonly type: ColumnType }
	| { readonly kind: "option"; readonly type: ColumnType }
	| { readonly kind: "array"; readonly element: Element }
	| { readonly kind: "union"; readonly variants: readonly [Variant, ...Array<Variant>] }

const isArray = (schema: FieldSchema): schema is Schema.$Array<ElementSchema> =>
	schema.ast._tag === "Arrays"

const variantsOf = (
	declaration: string,
	field: string,
	schema: TaggedUnionSchema
): readonly [Variant, ...Array<Variant>] => {
	const variants = Arr.map(Record.toEntries(schema.cases), ([tag, variant]): Variant => {
		named(`${declaration}, field ${field}`, tag)
		const { _tag: _, ...fields } = variant.fields
		return { tag, columns: columnsOf(declaration, field, fields, ["step", "scope"]) }
	})
	if (!Arr.isReadonlyArrayNonEmpty(variants)) {
		throw new Refused({ declaration, why: `field ${field} is a tagged union of no variant` })
	}
	return variants
}

const partOf = (declaration: string, field: string, schema: FieldSchema): Part => {
	if (isArray(schema)) {
		const element = schema.value
		return {
			kind: "array",
			element:
				"fields" in element
					? {
							kind: "struct",
							columns: columnsOf(declaration, field, element.fields, ["step", "scope", "ordinal"])
						}
					: { kind: "value", type: columnOf(declaration, field, element) }
		}
	}
	if ("cases" in schema) {
		return { kind: "union", variants: variantsOf(declaration, field, schema) }
	}
	if ("value" in schema) {
		return { kind: "option", type: columnOf(declaration, field, schema.value) }
	}
	return { kind: "column", type: columnOf(declaration, field, schema) }
}

/** The shape of a stored struct: each field a column, an option, an array or a tagged union. */
export const shapeOf = (declaration: string, schema: Stored): Shape => {
	const parts = Arr.map(Record.toEntries(schema.fields), ([name, field]) => ({
		name,
		part: partOf(declaration, name, field)
	}))
	return {
		columns: Arr.flatMap(parts, ({ name, part }) =>
			part.kind === "column" ? [{ name, type: part.type }] : []
		),
		options: Arr.flatMap(parts, ({ name, part }) =>
			part.kind === "option" ? [{ name, type: part.type }] : []
		),
		arrays: Arr.flatMap(parts, ({ name, part }) =>
			part.kind === "array" ? [{ name, element: part.element }] : []
		),
		unions: Arr.flatMap(parts, ({ name, part }) =>
			part.kind === "union" ? [{ name, variants: part.variants }] : []
		)
	}
}

/** The shape of an error: a struct's, or none for Never. */
export const errorShapeOf = (declaration: string, schema: ErrorSchema): Option.Option<Shape> =>
	"fields" in schema ? Option.some(shapeOf(declaration, schema)) : Option.none()
