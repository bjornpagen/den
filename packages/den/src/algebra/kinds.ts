import type {
	AnyChangeSet,
	AnyRelation,
	ClockUnit,
	Clocked,
	Fact,
	HeadOf,
	InputOf,
	ParamArg,
	ParamsOf,
	Vector
} from "@bjornpagen/grizzle"
import { regex } from "arkregex"
import {
	Array as Arr,
	type Cron,
	Data,
	Duration,
	type Effect,
	Option,
	Record as Rec,
	Schema
} from "effect"
import type { Later } from "#algebra/later.ts"

/**
 * How often the census can tick: Vercel Cron's minimum interval on the Pro and Enterprise plans. A window shorter than
 * this could hold no tick, so den refuses one, and the first rung of a retry ladder waits this long. Vercel calls Cron
 * Jobs legacy, to be migrated to Schedules; the interval stands until den moves.
 *
 * @limitKind published
 * @owner Vercel Cron Jobs, Pro and Enterprise plans
 * @unit seconds
 * @scope the interval between two census ticks, at its shortest
 * @constraint hard quota
 * @source https://vercel.com/docs/schedules/cron-jobs/usage-and-pricing
 * @quote | **Pro** | 100 cron jobs | Once per minute | Per-minute |
 * @verified 2026-11-16
 */
export const censusPeriodSeconds = 60

/**
 * The declarations of den's algebra (the proposal's section 4): step kinds, scope kinds, roots, spawn edges and
 * resources, each typed by Effect Schemas, so a flow's whole shape is known before anything runs and lowers into grizzle
 * relations. Work nobody joins is unrepresentable: a step is only ever a spawn a scope's start or an edge names, and a
 * scope finishes only after every child has ended.
 */

/** A declaration den refuses, with what it refuses: a name, an edge, a window or a scope's shape. */
export class Refused extends Data.TaggedError("Refused")<{
	readonly declaration: string
	readonly why: string
}> {}

/** A name den lowers into relation names: PascalCase, letters and digits. */
const NAME = regex("^[A-Z][A-Za-z0-9]*$")

/** A schedule's member: letters and digits, so its key never holds the separator between instant and member. */
const MEMBER = regex("^[A-Za-z0-9]+$")

/** Refuses a name den cannot lower into a relation name. */
export const named = (declaration: string, name: string): void => {
	const why = `${name} is no PascalCase name of letters and digits`
	if (!NAME.test(name)) {
		throw new Refused({ declaration, why })
	}
}

const positive = (declaration: string, what: string, n: number): void => {
	if (!Number.isSafeInteger(n) || n < 1) {
		throw new Refused({ declaration, why: `${what} ${String(n)} is no positive integer` })
	}
}

/** Refuses a count that is no integer of at least 0. */
const nonNegative = (declaration: string, what: string, n: number): void => {
	if (!Number.isSafeInteger(n) || n < 0) {
		throw new Refused({ declaration, why: `${what} ${String(n)} is no count of 0 or more` })
	}
}

/**
 * A resource: a named bottleneck whose capacity is its seats, each a row, so no two holders share one and a bound is
 * never exceeded. Its count is a limit with evidence (W1's replica holds 8). A step holds a seat of every resource it
 * uses while it runs.
 */
export interface Resource<Name extends string = string> {
	readonly _tag: "Resource"
	readonly name: Name
	readonly seats: number
}

export const resource = <const Name extends string>(name: Name, seats: number): Resource<Name> => {
	named("resource", name)
	positive(`resource ${name}`, "seats", seats)
	return { _tag: "Resource", name, seats }
}

/**
 * A step's retry ladder, written out: it ends after `attempts` attempts (W1 to W4), its next claim then failing the
 * step, or it never ends (W6's reports). Each spent attempt waits a rung before the next is due.
 */
export type Ladder =
	| { readonly kind: "attempts"; readonly attempts: number }
	| { readonly kind: "never" }

/** A ladder that ends the step `failed` once `count` attempts are spent. */
export const attempts = (count: number): Ladder => {
	positive("ladder", "attempts", count)
	return { kind: "attempts", attempts: count }
}

/** A ladder that never ends: the step is due again after every spent attempt. */
export const never: Ladder = { kind: "never" }

/**
 * When a scope's work may run: at every instant, or inside the UTC hours `[opens, closes)` of each day (W1 to W4's
 * 07:00 to 13:00). A window holds at least one census tick, or work due in it could stall for good.
 */
export type Window =
	| { readonly kind: "always" }
	| { readonly kind: "utcHours"; readonly opens: number; readonly closes: number }

/** Always open. */
export const always: Window = { kind: "always" }

/**
 * The hours of a day in UTC, from midnight: a window's hours lie within one.
 *
 * @formatConstant a day in UTC: 24 hours from midnight, every day, since UTC has no daylight saving time
 */
export const HOURS_IN_DAY = 24

/**
 * Open inside the UTC hours `[opens, closes)` of each day, refused when it is empty, reaches past a day, or is shorter
 * than the census's period, so it always holds a tick.
 */
export const utcHours = (opens: number, closes: number): Window => {
	const declaration = `window ${String(opens)} to ${String(closes)}`
	if (!Number.isSafeInteger(opens) || !Number.isSafeInteger(closes) || opens < 0) {
		throw new Refused({ declaration, why: "its hours are whole hours of a day" })
	}
	if (closes <= opens || closes > HOURS_IN_DAY) {
		throw new Refused({ declaration, why: "it closes after it opens, within one day" })
	}
	if (Duration.isLessThan(Duration.hours(closes - opens), Duration.seconds(censusPeriodSeconds))) {
		throw new Refused({ declaration, why: "it is shorter than the census's period" })
	}
	return { kind: "utcHours", opens, closes }
}

/** A vector's schema: grizzle's Vector of its dimensions, a Float32Array. */
export type VectorSchema<N extends number = number> = Schema.declare<Vector<N>>

/** The dimensions of each vector schema `vectorOf` made, read by lowering: a schema value holds no number of its own. */
const vectorDimensions = new WeakMap<Schema.Top, number>()

/**
 * A vector of `dimensions` components, which lowers to grizzle's `pg.vector(dimensions)`: a step's input or output may
 * hold one, so a vector a body computed (a query's embedding) reaches the next step on an edge and its reads as a
 * parameter of their query. A read's record holds none: a body never sees the vectors a search ranked by.
 */
export const vectorOf = <const N extends number>(dimensions: N): VectorSchema<N> => {
	positive("vector", "dimensions", dimensions)
	const schema = Schema.declare(
		(value: unknown): value is Vector<N> =>
			value instanceof Float32Array && value.length === dimensions
	)
	vectorDimensions.set(schema, dimensions)
	return schema
}

/** The dimensions of a schema `vectorOf` made, none for any other schema. */
export const dimensionsOf = (schema: Schema.Top): Option.Option<number> =>
	Option.fromNullishOr(vectorDimensions.get(schema))

/**
 * A column's schema: text, a bigint, a finite number, a boolean, a literal union of texts, a brand of one, or a vector.
 * A number is `Schema.Finite`, which lowers to double precision under a row check that holds it finite.
 */
export type ColumnSchema =
	| Schema.String
	| Schema.BigInt
	| Schema.Finite
	| Schema.Boolean
	| Schema.Literal<string>
	| Schema.Literals<ReadonlyArray<string>>
	| Schema.brand<Schema.String | Schema.BigInt | Schema.Finite | Schema.Boolean, string>
	| VectorSchema

/** The fields of a struct an array holds or a tagged union's variant carries: columns. */
export type ColumnFields = { readonly [field: string]: ColumnSchema }

/** What an array holds: a column, or a struct of columns. */
export type ElementSchema = ColumnSchema | Schema.Struct<ColumnFields>

/**
 * A tagged union's schema as den reads it, `Schema.TaggedUnion`'s: its cases by tag, each a struct whose fields den
 * lowers, its `_tag` among them. TypeScript cannot state a tagged union of column structs, since a variant's
 * constructor takes its tag as optional and the union's guards hold it invariant, so lowering refuses a variant field
 * that is no column.
 */
export interface TaggedUnionSchema extends Schema.Top {
	readonly cases: {
		readonly [tag: string]: { readonly fields: { readonly [field: string]: Schema.Top } }
	}
}

/**
 * A field's schema: a column; an Option of one, which lowers to a relation of its own; an array of columns or of
 * structs of them, which lowers to an ordered family, a relation keyed by its owner and a gap-free ordinal from 0; or a
 * tagged union (`Schema.TaggedUnion`) of structs of columns, which lowers to its tag, a roster column of its owner's
 * row, and a relation per variant keyed by its owner, which holds a row exactly when the tag names that variant. A
 * model's structured answer is a struct of these.
 */
export type FieldSchema =
	| ColumnSchema
	| Schema.Option<ColumnSchema>
	| Schema.$Array<ElementSchema>
	| TaggedUnionSchema

/** A step's input, output or error: a struct of fields den lowers to typed relations. */
export type Stored = Schema.Struct<{ readonly [field: string]: FieldSchema }>

/** A step's error: a struct of fields, or Never for a step that never fails with a typed error. */
export type ErrorSchema = Stored | Schema.Never

/**
 * The parameters den's own commit names: the steps a commit spawns, the root they spawn in, and the call's reading of
 * the database's clock. A step's ChangeSet names none of them, since a ChangeSet's free parameters are one namespace,
 * its union's and its members', and a served commit binds no value when it is built.
 */
export type DenCommitParam = "steps" | "root" | "now"

/** A ChangeSet's parameters bound to the database's clock, each by the unit of its reading. */
export interface ClockBinding {
	readonly [param: string]: ClockUnit
}

/**
 * What a step or a finish commits into the app's relations beside its result: a ChangeSet `changes` makes of the flow's
 * app role, which den's commit unions with its own facts, so both commit in one call, in one transaction, and a
 * refusal of either refuses both (the essay grader's evaluation, recorded through the app's own ChangeSet with the
 * draw's result). `clock` binds the ChangeSet's instants to the database's clock, each in its unit, as the app's own
 * workload would serve it `clocked`; a body supplies every other parameter and the facts of its array members, the
 * ChangeSet's served input. A plain insert is the ChangeSet of that one member.
 */
export interface Through<W, C, B> {
	readonly kind: "through"
	readonly changes: (role: W) => C
	readonly clock: B
}

/** A step that commits nothing into the app's relations beside its result. */
export interface CommitsNothing {
	readonly kind: "nothing"
}

/** What any step commits, as a flow and lowering read it: nothing, or a ChangeSet over the app role. */
export type AnyCommit =
	| CommitsNothing
	| {
			readonly kind: "through"
			readonly changes: (role: never) => unknown
			readonly clock: ClockBinding
	  }

/**
 * A ChangeSet that names none of den's commit parameters (DenCommitParam): any other refuses `through`, by the member
 * this type adds, which no ChangeSet holds.
 */
type FreeOfDen<C> = [Extract<keyof ParamsOf<C>, DenCommitParam>] extends [never]
	? unknown
	: {
			readonly "a step's ChangeSet names no parameter den's commit names: steps, root or now": never
		}

/** A step's commit through `changes`, a ChangeSet over the flow's app role, its instants bound by `clock`. */
export const through = <W, const C extends AnyChangeSet, const B extends ClockBinding>(
	changes: (role: W) => C & FreeOfDen<C>,
	clock: B
): Through<W, C, B> => ({ kind: "through", changes, clock })

/** A step that commits nothing beside its result. */
export const writesNothing: CommitsNothing = { kind: "nothing" }

/** A read's name, which lowers into its record's relation name: camelCase, letters and digits. */
const READ = regex("^[a-z][A-Za-z0-9]*$")

/**
 * A record's field: a column, or the rows an attachment of the query delivers under it (grizzle's `attach`), each a
 * record of its own: at most one, an Option of a record (`"option"`), or in order, an array of records (`"array"`), to
 * any depth (an essay's item and its stimuli, each document's scan of nodes and each node's attributes).
 */
export type RecordField = ColumnSchema | Schema.Option<RecordSchema> | Schema.$Array<RecordSchema>

/** The fields of a record. */
export interface RecordFields {
	readonly [field: PropertyKey]: RecordField
}

/**
 * What a read records of each row it found, and what a body sees of it: a struct of columns and attachments. Lowering
 * refuses a record with a field no column schema states, a vector, and an attachment delivered otherwise.
 */
export type RecordSchema = Schema.Struct<RecordFields>

/** A step's records, by the name of the query whose rows each records. */
export type Records = { readonly [name: string]: RecordSchema }

/**
 * A step's declared reads: one grizzle query over the flow's app role, `query(W).reads({ name: query, ... })`, a record
 * of named queries, any a grizzle query can state (a range or a set of values, an exact order by a computed distance
 * and a take, `approximateNearest` from a parameter's vector or a stored row's, a hybrid of searches), whose parameters
 * `params` takes from the step's input, a vector a body before it computed among them. They are taken in one statement
 * after the claim and before the body, deferrable, so they read one snapshot and what they record describes one moment
 * of the database (W1's fingerprint, W5's presence, W7's intents, the assignment engine's ledger rows and nearest
 * content, DCAN's catalog search and its thread); each named query's rows are recorded with the step's result by its
 * record, so every input a step saw is a fact of the graph, and the body sees each name's rows as its record states
 * them. A row is recorded once per root, by the digest of its record, and each step's record of it is a reference: a
 * chain of turns that reads a thread as it grows stores each of its rows once, not once per turn. Which rows an
 * approximate search finds depends on the index and the database owner's pgvector settings as well as on the facts
 * (grizzle's README, "Every answer is a function of the facts"), so the record, not a second search, is what the step
 * saw. The query is a function of the app role, which a flow declared before the schema its fragment is spread into
 * cannot hold.
 */
export interface Reads<W, Q, I, R extends Records> {
	readonly kind: "query"
	readonly query: (writer: W) => Q
	readonly records: R
	readonly params: (input: I) => ParamArg<ParamsOf<Q>>
}

/** A step's reads over its input `I`, whatever role, query and records they name. */
export type ReadsOver<I> =
	| { readonly kind: "none" }
	| {
			readonly kind: "query"
			readonly query: (writer: never) => unknown
			readonly records: Records
			readonly params: (input: I) => unknown
	  }

/** Any step's reads, as a flow and lowering read them. */
export type AnyReads =
	| { readonly kind: "none" }
	| {
			readonly kind: "query"
			readonly query: (writer: never) => unknown
			readonly records: Records
			readonly params: (input: never) => unknown
	  }

/** A step that reads nothing before its body. */
export const noReads: { readonly kind: "none" } = { kind: "none" }

/**
 * The records a reads query's rows fit: one record per named query, each a record whose type holds that query's rows,
 * and none for a name the query does not read.
 */
type RecordsOf<H, R> = {
	readonly [K in keyof H]: K extends keyof R
		? R[K] extends { readonly Type: infer T }
			? H[K] extends ReadonlyArray<T>
				? R[K]
				: never
			: never
		: RecordSchema
} & { readonly [K in Exclude<keyof R, keyof H>]: never }

/**
 * A step's reads: the query `query` makes of the flow's app role, the record of each of its named queries' rows, and its
 * parameters from the step's input.
 */
export const reads = <W, Q, const R extends Records, I>(
	query: (writer: W) => Q,
	records: R & RecordsOf<HeadOf<Q>, R>,
	params: (input: I) => ParamArg<ParamsOf<Q>>
): Reads<W, Q, I, R> => ({ kind: "query", query, records, params })

/** What a body sees of its declared reads: each named query's rows, as its record states them. */
export type Found<D> = D extends {
	readonly kind: "query"
	readonly records: infer R extends Records
}
	? { readonly [K in keyof R]: ReadonlyArray<R[K]["Type"]> }
	: { readonly [name: string]: never }

/** Refuses a read's name den cannot lower into its record's relation name. */
export const readNamed = (declaration: string, name: string): void => {
	const why = `its read ${name} is no camelCase name of letters and digits`
	if (!READ.test(name)) {
		throw new Refused({ declaration, why })
	}
}

/**
 * A fact a step awaits: the row of one of the app's relations whose whole key the step's input names, each key field
 * by the input field that holds its value. A step is joined on its own input and every fact it awaits: it is eligible
 * only once each awaited row exists, so a step spawned before its fact waits, spending nothing, and is rung by
 * whichever commit completes the pair, its spawn's where the fact came first and the fact's where the step did (a
 * step's commit in any flow the app runs that writes the awaited relation), the census healing a ring that is lost
 * (AlphaTest's gap analysis after the gradebook's delivery). A fact is awaited, not read: a step that needs its fields
 * declares a read of it too.
 */
export interface AwaitedFact {
	readonly relation: AnyRelation
	readonly key: { readonly [field: string]: string }
}

/** The fields of `R`'s whole key. */
export type KeyFieldOf<R extends AnyRelation> = R["primaryKey"][number] & keyof Fact<R> & string

/**
 * The fact a step awaits: the row of `relation` whose every key field holds what the input field `key` names for it
 * holds. Lowering refuses an input field that is no column of the step's input, and types each such column as the key
 * field it holds, so the printed programs join the step's input to the relation.
 */
export const awaitFact = <R extends AnyRelation>(
	relation: R,
	key: { readonly [K in KeyFieldOf<R>]: string }
): AwaitedFact => ({ relation, key })

/**
 * An instant on the database's clock, in milliseconds since the epoch, den's `DenInstant`, as a column of a step's or a
 * root's input: a timed sitting's deadline, which the write that requested its root computed from its own reading of
 * the database's clock. No host mints one: an input's instant is a value the database computed or stored, carried.
 */
export const instant = Schema.BigInt.pipe(Schema.brand("DenInstant"))

/** An instant a step's input holds, as its `instant` column delivers it. */
export type InstantValue = typeof instant.Type

/** Due as soon as it is spawned. */
export interface DueAtSpawn {
	readonly kind: "spawned"
}

/** Due a fixed delay after its spawn. */
export interface DueAfter {
	readonly kind: "after"
	readonly millis: number
}

/**
 * When a step of input `I` is first due: as soon as it is spawned, a delay after (W5's timer, W6's delay), or at the
 * instant its input holds (a timed sitting closed at its own deadline): each is an exact timer, which rides the
 * transport's delay with the census as its net.
 */
export type Due<I> =
	| DueAtSpawn
	| DueAfter
	| { readonly kind: "at"; readonly instant: (input: I) => InstantValue }

/** Due when spawned. */
export const atSpawn: DueAtSpawn = { kind: "spawned" }

/** Due `millis` after its spawn. */
export const after = (millis: number): DueAfter => ({ kind: "after", millis })

/**
 * Due at the instant the step's input holds in its `instant` column `field`, a value the database computed: a step
 * spawned after it is due at once. A step kind whose input holds no instant of that name is a type error.
 */
export const dueAt = <const F extends string>(
	field: F
): {
	readonly kind: "at"
	readonly instant: (input: { readonly [K in F]: InstantValue }) => InstantValue
} => ({ kind: "at", instant: (input) => input[field] })

/**
 * What a body returns: its output, and, for a step that commits through a ChangeSet, that ChangeSet's served input, its
 * parameters but those its clock binds and its array members' facts, committed with its result in one call.
 */
export type Done<O, T> = T extends {
	readonly kind: "through"
	readonly changes: (role: never) => infer C
	readonly clock: infer B
}
	? { readonly output: O; readonly writes: InputOf<Clocked<C, B>> }
	: { readonly output: O }

/**
 * A spawn: a step or scope of the kind named `kind`, with its input. A spawn exists only as a scope's start or an
 * edge's yield, so every piece of work has the scope that joins it.
 */
export interface Spawn<Kind extends string, I> {
	readonly _tag: "Spawn"
	readonly kind: Kind
	readonly input: I
}

const spawnOf =
	<Kind extends string, I>(kind: Kind) =>
	(input: I): Spawn<Kind, I> => ({ _tag: "Spawn", kind, input })

/**
 * A step's body: from its input and what its declared reads found, by name, to its output and writes, never holding
 * grizzle's Db, which den alone opens. It fails with its step's typed error, or with `Later` where its source refused
 * the call for now and named when to call again.
 */
export type Body<I, F, O, E, T, R> = (input: I, found: F) => Effect.Effect<Done<O, T>, E | Later, R>

/** What a step kind declares besides its body. */
export interface StepShape<
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	D extends ReadsOver<IS["Type"]>,
	T extends AnyCommit
> {
	readonly input: IS
	readonly output: OS
	readonly error: ES
	readonly reads: D
	/** The facts it awaits beside its input: it is eligible once each exists. */
	readonly awaits: ReadonlyArray<AwaitedFact>
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	/**
	 * How many times the step may wait on its source, each a body that failed with `Later`, before the next `Later`
	 * ends it `failed`, recorded as exhausted, as a spent ladder ends it: a wait spends no attempt, so without this count
	 * a source that keeps refusing would hold its step waiting for good, with no failure for its scope's finish to read.
	 * It counts every wait of the step, across its attempts, and is always finite: no step waits on its source forever.
	 * A step whose body never fails with `Later` states 0, and so does one that fails at its source's first refusal. A
	 * count above 0 is a limit with its evidence beside the step that states it (an Anthropic call's, upstream's five
	 * waits).
	 */
	readonly waits: number
	readonly due: Due<IS["Type"]>
	readonly writes: T
}

/** A step kind: its name, its shape, and its body; `of` spawns one. */
export interface StepKind<
	Name extends string,
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	D extends ReadsOver<IS["Type"]>,
	T extends AnyCommit,
	R
> extends StepShape<IS, OS, ES, D, T> {
	readonly _tag: "Step"
	readonly name: Name
	readonly body: Body<IS["Type"], Found<D>, OS["Type"], ES["Type"], T, R>
	readonly of: (input: IS["Type"]) => Spawn<Name, IS["Type"]>
}

/** Any step kind, as a flow lists it. */
export interface AnyStepKind {
	readonly _tag: "Step"
	readonly name: string
	readonly input: Stored
	readonly output: Stored
	readonly error: ErrorSchema
	readonly reads: AnyReads
	readonly awaits: ReadonlyArray<AwaitedFact>
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	readonly waits: number
	readonly due: Due<never>
	readonly writes: AnyCommit
}

export const step = <
	const Name extends string,
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	D extends ReadsOver<IS["Type"]>,
	T extends AnyCommit,
	R
>(
	name: Name,
	shape: StepShape<IS, OS, ES, D, T>,
	body: Body<IS["Type"], Found<D>, OS["Type"], ES["Type"], T, R>
): StepKind<Name, IS, OS, ES, D, T, R> => {
	named("step", name)
	Arr.forEach(shape.reads.kind === "query" ? Rec.keys(shape.reads.records) : [], (read) =>
		readNamed(`step ${name}`, read)
	)
	nonNegative(`step ${name}`, "waits", shape.waits)
	return { _tag: "Step", name, ...shape, body, of: spawnOf(name) }
}

/** What a scope may start or an edge may spawn: a step kind or a scope kind. */
export type ChildKind = AnyStepKind | AnyScopeKind

/** The spawn of one of `Children`, typed by that kind's input. */
export type SpawnOf<Children extends ReadonlyArray<ChildKind>> = {
	readonly [K in keyof Children]: Spawn<Children[K]["name"], Children[K]["input"]["Type"]>
}[number]

/**
 * How a child ended, as its scope's finish reads it: done with its output, or failed, each with the input it was spawned
 * with, so a finish knows which child each ending is (the essay grader's draw that failed, whose application it records
 * declined).
 */
export type Ending<I, O> =
	| { readonly _tag: "Done"; readonly input: I; readonly output: O }
	| { readonly _tag: "Failed"; readonly input: I }

/**
 * What a node of a scope's graph gives the edges that leave it and the finish that reads it: a step kind's output, or
 * a child scope kind's, its finish's, since a child scope ends as its finish does.
 */
export type OutputOf<K> = K extends {
	readonly _tag: "Step"
	readonly output: infer OS extends Stored
}
	? OS["Type"]
	: K extends { readonly finish: { readonly output: infer OS extends Stored } }
		? OS["Type"]
		: never

/**
 * What a finish reads of a child kind: its ending, with its input, done with its output (a child scope's, its finish's),
 * or failed.
 */
type EndingOf<K> = K extends { readonly input: infer IS extends Stored }
	? Ending<IS["Type"], OutputOf<K>>
	: never

/** The endings a finish reads, by the kind of each child it reads. */
export type EndingsOf<Ended extends ReadonlyArray<ChildKind>> = {
	readonly [K in Ended[number] as K["name"]]: ReadonlyArray<EndingOf<K>>
}

/**
 * A scope's finish: a step that runs once every child has ended, reads the endings of the kinds it names (done with
 * their outputs, or failed), and returns its output and writes (a cursor moved, or held where a child failed), as a
 * step does, holding a seat of every resource it uses while it runs, as a step does (AlphaTest's cluster, a model call
 * on Anthropic's seats). A child scope ends as its finish does: its parent's finish reads the finish's output as the scope's, and
 * the edges that leave the scope kind spawn the next stage in its parent from the scope's input and that output.
 */
export interface Finish<
	I,
	Ended extends ReadonlyArray<ChildKind>,
	OS extends Stored,
	ES extends ErrorSchema,
	T extends AnyCommit,
	R
> {
	readonly reads: Ended
	readonly output: OS
	readonly error: ES
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	/** How many times the finish may wait on its source before its next `Later` fails it, as a step's waits. */
	readonly waits: number
	readonly writes: T
	readonly body: (
		input: I,
		endings: EndingsOf<Ended>
	) => Effect.Effect<Done<OS["Type"], T>, ES["Type"] | Later, R>
}

/** Any finish, as a flow reads it. */
export interface AnyFinish {
	readonly reads: ReadonlyArray<{ readonly _tag: string; readonly name: string }>
	readonly output: Stored
	readonly error: ErrorSchema
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	readonly waits: number
	readonly writes: AnyCommit
}

/**
 * Whether a root holds a seat for its whole life: no, or one per key its input names (one live run per relation, W1;
 * per collection, W3; per request kind, W2; one Gold build, W4). A root whose seat another live root of its kind holds
 * is not admitted and is recorded skipped, as edullm's relation skips the night; no child scope holds a seat, so none
 * waits on one and none deadlocks.
 */
export type Exclusive<I> =
	| { readonly kind: "shared" }
	| { readonly kind: "exclusive"; readonly key: (input: I) => string }

/** No exclusivity seat. */
export const shared: { readonly kind: "shared" } = { kind: "shared" }

/** One live scope of the kind per key `key` takes from its input. */
export const exclusiveBy = <I>(key: (input: I) => string): Exclusive<I> => ({
	kind: "exclusive",
	key
})

/**
 * What must hold for a root to be admitted: nothing, or that the flows it names have nothing pending, a read that must
 * be empty (W4: no Timeback or QTI step pending). A root whose precondition does not hold waits, and is admitted once
 * it does.
 */
export type Precondition =
	| { readonly kind: "none" }
	| { readonly kind: "idle"; readonly flows: readonly [string, ...Array<string>] }

/** Admitted with no precondition. */
export const unconditional: Precondition = { kind: "none" }

/** Admitted only while every flow named has no step pending. */
export const idle = (...flows: readonly [string, ...Array<string>]): Precondition => {
	Arr.forEach(flows, (name) => named("idle", name))
	return { kind: "idle", flows }
}

/** What a scope kind declares: its input, children, start and finish. */
export interface ScopeShape<
	IS extends Stored,
	Children extends ReadonlyArray<ChildKind>,
	F extends AnyFinish
> {
	readonly input: IS
	readonly children: Children
	readonly start: (input: IS["Type"]) => ReadonlyArray<SpawnOf<Children>>
	readonly finish: F
}

/** What only a root declares beside its scope's shape: its trigger and its gates, an exclusivity seat, a window and a precondition. */
export interface RootGates<I> {
	readonly trigger: Trigger<I>
	readonly exclusive: Exclusive<I>
	readonly window: Window
	readonly precondition: Precondition
}

/**
 * A scope kind: a join. It owns what its start and its children's edges spawn, and finishes exactly once, after every
 * child has ended, by running its finish. A child scope is admitted in the call that opens it, its start's children
 * spawned with it: only a root waits for its admission.
 */
export interface ScopeKind<
	Name extends string,
	IS extends Stored,
	Children extends ReadonlyArray<ChildKind>,
	F extends AnyFinish
> extends ScopeShape<IS, Children, F> {
	readonly _tag: "Scope"
	readonly name: Name
	readonly of: (input: IS["Type"]) => Spawn<Name, IS["Type"]>
}

/** Any scope kind, a root's included. */
export interface AnyScopeKind {
	readonly _tag: "Scope" | "Root"
	readonly name: string
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly _tag: string; readonly name: string }>
	readonly finish: AnyFinish
}

export const scope = <
	const Name extends string,
	IS extends Stored,
	const Children extends ReadonlyArray<ChildKind>,
	const Ended extends ReadonlyArray<ChildKind>,
	OS extends Stored,
	ES extends ErrorSchema,
	T extends AnyCommit,
	R
>(
	name: Name,
	shape: ScopeShape<IS, Children, Finish<IS["Type"], Ended, OS, ES, T, R>>
): ScopeKind<Name, IS, Children, Finish<IS["Type"], Ended, OS, ES, T, R>> => {
	named("scope", name)
	nonNegative(`the finish of ${name}`, "waits", shape.finish.waits)
	return { _tag: "Scope", name, ...shape, of: spawnOf(name) }
}

/**
 * What starts a root: a schedule, whose every instant starts one root per member of its roster, keyed by the instant
 * and the member; an operator's command; or the app's own write, which requests the root inside the app's own
 * transaction.
 */
export type Trigger<I> =
	| {
			readonly kind: "schedule"
			readonly cron: Cron.Cron
			/** The roots an instant starts: each member of the roster, and its root's input at that instant. */
			readonly roster: (at: bigint) => Arr.NonEmptyReadonlyArray<Scheduled<I>>
	  }
	| { readonly kind: "operator" }
	| { readonly kind: "app" }

/** One member's root at a scheduled instant: the member, and its root's input. */
export interface Scheduled<I> {
	readonly member: string
	readonly input: I
}

/**
 * A root per member of `members` at each instant `cron` matches, keyed by the instant and the member, its input what
 * `input` makes of both (W1's relations, each a night's copy; W3's collections; a schedule of one root is a roster of
 * one member). Members are named as PascalCase or camelCase texts, each once.
 */
export const schedule = <const M extends Arr.NonEmptyReadonlyArray<string>, I>(
	cron: Cron.Cron,
	members: M,
	input: (at: bigint, member: M[number]) => I
): Trigger<I> => {
	Arr.forEach(members, (member: string, index) => {
		const why = `its member ${member} is no name of letters and digits`
		if (!MEMBER.test(member)) {
			throw new Refused({ declaration: "schedule", why })
		}
		if (Arr.contains(Arr.take(members, index), member)) {
			throw new Refused({ declaration: "schedule", why: `its member ${member} is listed twice` })
		}
	})
	return {
		kind: "schedule",
		cron,
		roster: (at) => Arr.map(members, (member) => ({ member, input: input(at, member) }))
	}
}

/** A root an operator starts. */
export const operator: { readonly kind: "operator" } = { kind: "operator" }

/** A root the app's own write requests, in its own transaction. */
export const app: { readonly kind: "app" } = { kind: "app" }

/**
 * A root kind: a scope a trigger starts, the only way a graph begins. Its identity is its kind and the idempotency key
 * its trigger gives, so starting it twice with one key starts one graph. It is admitted once its precondition holds,
 * inside its window, unless its exclusivity seat is held; its work runs only inside its window.
 */
export interface RootKind<
	Name extends string,
	IS extends Stored,
	Children extends ReadonlyArray<ChildKind>,
	F extends AnyFinish
>
	extends ScopeShape<IS, Children, F>, RootGates<IS["Type"]> {
	readonly _tag: "Root"
	readonly name: Name
}

export const root = <
	const Name extends string,
	IS extends Stored,
	const Children extends ReadonlyArray<ChildKind>,
	const Ended extends ReadonlyArray<ChildKind>,
	OS extends Stored,
	ES extends ErrorSchema,
	T extends AnyCommit,
	R
>(
	name: Name,
	shape: ScopeShape<IS, Children, Finish<IS["Type"], Ended, OS, ES, T, R>> & RootGates<IS["Type"]>
): RootKind<Name, IS, Children, Finish<IS["Type"], Ended, OS, ES, T, R>> => {
	named("root", name)
	nonNegative(`the finish of ${name}`, "waits", shape.finish.waits)
	return { _tag: "Root", name, ...shape }
}

/** A scope kind an edge spawns: never a root, which only a trigger starts. */
export interface AnyScopeKindOf {
	readonly _tag: "Scope"
	readonly name: string
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly name: string }>
	readonly finish: AnyFinish
}

/** What an edge leaves and spawns: a step kind, or a child scope kind, never a root, which only a trigger starts. */
export type NodeKind = AnyStepKind | AnyScopeKindOf

/**
 * A spawn edge: a pure function from a node's input and output to the inputs of the children it starts, of kind `to`,
 * a step or a new child scope, in the scope its node lives in. A node is a step, its output its own, or a child scope
 * kind, its output its finish's: an edge from a child scope is the next stage after it ends, spawned in its parent by
 * its finish's commit (Timeback's prune after its pages; AlphaTest's save after its questions' cluster). A result
 * decides only which declared edges it takes, and how often; a node that fails spawns nothing.
 */
export interface Edge<Name extends string, From extends NodeKind, To extends NodeKind> {
	readonly _tag: "Edge"
	readonly name: Name
	readonly from: From
	readonly to: To
	readonly next: (
		input: From["input"]["Type"],
		output: OutputOf<From>
	) => ReadonlyArray<To["input"]["Type"]>
}

/** Any edge, as a flow lists it. */
export interface AnyEdge {
	readonly _tag: "Edge"
	readonly name: string
	readonly from: NodeKind
	readonly to: NodeKind
}

export const edge = <const Name extends string, From extends NodeKind, To extends NodeKind>(
	name: Name,
	from: From,
	to: To,
	next: (input: From["input"]["Type"], output: OutputOf<From>) => ReadonlyArray<To["input"]["Type"]>
): Edge<Name, From, To> => {
	named("edge", name)
	return { _tag: "Edge", name, from, to, next }
}

/**
 * The app role a flow's steps write the app's relations under, named by its stem: den adds its commit programs to that
 * role and never creates a writer of the app's tables. It is named, not held, because the role is declared over the
 * schema the flow's own fragment is spread into; `R` checks the name against the role's type, which costs no import.
 */
export interface Writer<Name extends string = string> {
	readonly _tag: "Writer"
	readonly name: Name
}

/** The app role `R`, by its stem. */
export const writer = <R extends { readonly name: string }>(
	name: R["name"]
): Writer<R["name"]> => ({
	_tag: "Writer",
	name
})
