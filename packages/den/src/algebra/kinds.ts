import type { AnyRelation, Fact, Vector, Written } from "@bjornpagen/grizzle"
import { regex } from "arkregex"
import {
	Array as Arr,
	type Cron,
	Data,
	Duration,
	type Effect,
	Record as Rec,
	type Schema
} from "effect"

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

/**
 * A column's schema: text, a bigint, a finite number, a boolean, a literal union of texts, or a brand of one.
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
 * What a step may write into the app's relations, by operation, as the facts of the ChangeSet its commit applies with
 * the step's result under the flow's app role: a served Db runs only workload members, so a step's writes are that
 * member's array facts, never a ChangeSet built at run time.
 */
export interface WritesDeclaration<
	Ins extends ReadonlyArray<AnyRelation> = ReadonlyArray<AnyRelation>,
	Put extends ReadonlyArray<AnyRelation> = ReadonlyArray<AnyRelation>,
	Del extends ReadonlyArray<AnyRelation> = ReadonlyArray<AnyRelation>
> {
	readonly insert: Ins
	readonly put: Put
	readonly delete: Del
}

/** The facts a body returns for each relation its step declares, under each operation. */
export type Writes<W extends WritesDeclaration> = {
	readonly insert: { readonly [R in W["insert"][number] as R["name"]]: ReadonlyArray<Written<R>> }
	readonly put: { readonly [R in W["put"][number] as R["name"]]: ReadonlyArray<Written<R>> }
	readonly delete: { readonly [R in W["delete"][number] as R["name"]]: ReadonlyArray<Written<R>> }
}

/** The relations a step inserts into, puts and deletes from. */
export const writes = <
	const Ins extends ReadonlyArray<AnyRelation>,
	const Put extends ReadonlyArray<AnyRelation>,
	const Del extends ReadonlyArray<AnyRelation>
>(declared: {
	readonly insert: Ins
	readonly put: Put
	readonly delete: Del
}): WritesDeclaration<Ins, Put, Del> => declared

/** A step that writes nothing outside den's own relations. */
export const writesNothing: WritesDeclaration<readonly [], readonly [], readonly []> = {
	insert: [],
	put: [],
	delete: []
}

/** A read's name, which lowers into its record's relation name: camelCase, letters and digits. */
const READ = regex("^[a-z][A-Za-z0-9]*$")

/** The fields of `R` that hold a vector, the fields a nearest read ranks by. */
export type VectorFieldOf<R extends AnyRelation> = {
	readonly [K in keyof Fact<R>]: Fact<R>[K] extends Vector ? K : never
}[keyof Fact<R>] &
	string

/**
 * A step's declared reads, all taken in one statement after the claim and before the body (grizzle's `reads`), so they
 * read one snapshot of the database, and recorded with its result row by row, so every input a step saw is a fact of
 * the graph, describing one moment (W1's fingerprint, W5's presence, W7's intents, the assignment engine's ledger rows
 * and nearest content). Two forms:
 *
 * - `rows`: the rows of one of the app's relations whose fields `by` equal what `params` takes from the step's input;
 * - `nearest`: at most `take` rows of one of the app's relations whose fields `by` equal what `params` takes, nearest
 *   by the cosine distance of their field `vector` to the stored vector of an anchor, the row of the anchor relation
 *   whose whole key `params` gives under `anchor` (the engine's missed question), through grizzle's
 *   `approximateNearest` over pgvector's HNSW index. Each row arrives without the vector it was ranked by and with its
 *   `distance`, and that is what is recorded: the neighbours and how near each was, never their vectors. An anchor key
 *   that holds no row finds none.
 *
 * Which rows a nearest read finds depends on the index and the database owner's pgvector settings as well as on the
 * facts (grizzle's README, "Every answer is a function of the facts"), so the record, not a second search, is what the
 * step saw. A read that depends on what a body computed becomes its own step, joined by an edge.
 */
export type Read<I = never> =
	| {
			readonly kind: "rows"
			readonly relation: AnyRelation
			readonly by: ReadonlyArray<string>
			readonly params: (input: I) => Readonly<Record<string, unknown>>
	  }
	| {
			readonly kind: "nearest"
			readonly relation: AnyRelation
			readonly vector: string
			readonly take: number
			readonly by: ReadonlyArray<string>
			readonly anchor: { readonly relation: AnyRelation; readonly vector: string }
			readonly params: (input: I) => Readonly<Record<string, unknown>>
	  }

/** A step's declared reads, by name: none, one, or several, taken together before the body runs and recorded. */
export type Reads<I = never> = { readonly [name: string]: Read<I> }

/** A declared read of `relation`'s rows whose fields `by` hold what `params` gives. */
export interface RowsRead<R extends AnyRelation, I, By extends keyof Fact<R> & string> {
	readonly kind: "rows"
	readonly relation: R
	readonly by: ReadonlyArray<By>
	readonly params: (input: I) => Pick<Fact<R>, By>
}

/** The rows of `relation` whose fields `by` hold the values `params` takes from the input. */
export const rows = <R extends AnyRelation, const By extends keyof Fact<R> & string, I>(
	relation: R,
	by: ReadonlyArray<By>,
	params: (input: I) => Pick<Fact<R>, By>
): RowsRead<R, I, By> => ({ kind: "rows", relation, by, params })

/** A relation's whole key, as a fact's fields: what names one of its rows. */
export type KeyOf<A extends AnyRelation> = Pick<Fact<A>, A["primaryKey"][number] & keyof Fact<A>>

/** The stored vector a nearest read ranks by: the field `vector` of the row of `relation` its whole key names. */
export interface Anchor<A extends AnyRelation, AV extends VectorFieldOf<A>> {
	readonly relation: A
	readonly vector: AV
}

/** The anchor of a nearest read: the field `vector` of one row of `relation`, named by its whole key. */
export const anchor = <A extends AnyRelation, const AV extends VectorFieldOf<A>>(
	relation: A,
	vector: AV
): Anchor<A, AV> => ({ relation, vector })

/** What a nearest read takes from the input: the fields it filters by, and the anchor's whole key. */
export type NearParams<R extends AnyRelation, By extends string, A extends AnyRelation> = Pick<
	Fact<R>,
	By & keyof Fact<R>
> & { readonly anchor: KeyOf<A> }

/** A declared read of at most `take` rows of `relation` nearest an anchor's vector by `vector`, among those `by` holds. */
export interface NearestRead<
	R extends AnyRelation,
	I,
	V extends VectorFieldOf<R>,
	By extends keyof Fact<R> & string,
	Take extends number,
	A extends AnyRelation,
	AV extends VectorFieldOf<A>
> {
	readonly kind: "nearest"
	readonly relation: R
	readonly vector: V
	readonly take: Take
	readonly by: ReadonlyArray<By>
	readonly anchor: Anchor<A, AV>
	readonly params: (input: I) => NearParams<R, By, A>
}

/**
 * At most `take` rows of `relation`, among those whose fields `by` hold what `params` gives, nearest by the cosine
 * distance of their vector field `ranked` to the vector of the anchor's row its whole key, `params`' `anchor`, names.
 * `take` is the result's bound, the caller's number with its evidence; den refuses one that is no positive integer.
 */
export const nearest = <
	R extends AnyRelation,
	const V extends VectorFieldOf<R>,
	const Take extends number,
	const By extends Exclude<keyof Fact<R> & string, V | "anchor">,
	A extends AnyRelation,
	const AV extends VectorFieldOf<A>,
	I
>(
	relation: R,
	ranked: V,
	take: Take,
	by: ReadonlyArray<By>,
	near: Anchor<A, AV>,
	params: (input: I) => NearParams<R, By, A>
): NearestRead<R, I, V, By, Take, A, AV> => {
	positive(`nearest ${relation.name}`, "take", take)
	return { kind: "nearest", relation, vector: ranked, take, by, anchor: near, params }
}

/** What a nearest read finds of one row: the row but the vector it was ranked by, and its distance to the query. */
export type Neighbour<R extends AnyRelation, V extends string> = Omit<Fact<R>, V> & {
	readonly distance: number
}

/** What a body sees of one declared read: the rows it found, or the neighbours a nearest read found. */
export type FoundOf<D> = D extends {
	readonly kind: "nearest"
	readonly relation: infer R extends AnyRelation
	readonly vector: infer V extends string
}
	? ReadonlyArray<Neighbour<R, V>>
	: D extends { readonly kind: "rows"; readonly relation: infer R extends AnyRelation }
		? ReadonlyArray<Fact<R>>
		: never

/** What a body sees of its declared reads, by name. */
export type Found<D> = { readonly [K in keyof D]: FoundOf<D[K]> }

/** Refuses a read's name den cannot lower into its record's relation name. */
export const readNamed = (declaration: string, name: string): void => {
	const why = `its read ${name} is no camelCase name of letters and digits`
	if (!READ.test(name)) {
		throw new Refused({ declaration, why })
	}
}

/** When a step is first due: as soon as it is spawned, or a delay after (W5's timer, W6's delay). */
export type Due = { readonly kind: "spawned" } | { readonly kind: "after"; readonly millis: number }

/** Due when spawned. */
export const atSpawn: Due = { kind: "spawned" }

/** Due `millis` after its spawn: an exact timer, which rides the transport's delay with the census as its net. */
export const after = (millis: number): Due => ({ kind: "after", millis })

/** What a body returns: its output and its writes into the app's relations, committed with its result in one call. */
export interface Done<O, W extends WritesDeclaration> {
	readonly output: O
	readonly writes: Writes<W>
}

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
 * grizzle's Db, which den alone opens.
 */
export type Body<I, F, O, E, W extends WritesDeclaration, R> = (
	input: I,
	found: F
) => Effect.Effect<Done<O, W>, E, R>

/** What a step kind declares besides its body. */
export interface StepShape<
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	D extends Reads<IS["Type"]>,
	W extends WritesDeclaration
> {
	readonly input: IS
	readonly output: OS
	readonly error: ES
	readonly reads: D
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	readonly due: Due
	readonly writes: W
}

/** A step kind: its name, its shape, and its body; `of` spawns one. */
export interface StepKind<
	Name extends string,
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	D extends Reads<IS["Type"]>,
	W extends WritesDeclaration,
	R
> extends StepShape<IS, OS, ES, D, W> {
	readonly _tag: "Step"
	readonly name: Name
	readonly body: Body<IS["Type"], Found<D>, OS["Type"], ES["Type"], W, R>
	readonly of: (input: IS["Type"]) => Spawn<Name, IS["Type"]>
}

/** Any step kind, as a flow lists it. */
export interface AnyStepKind {
	readonly _tag: "Step"
	readonly name: string
	readonly input: Stored
	readonly output: Stored
	readonly error: ErrorSchema
	readonly reads: Reads
	readonly uses: ReadonlyArray<Resource>
	readonly retry: Ladder
	readonly due: Due
	readonly writes: WritesDeclaration
}

export const step = <
	const Name extends string,
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	D extends Reads<IS["Type"]>,
	W extends WritesDeclaration,
	R
>(
	name: Name,
	shape: StepShape<IS, OS, ES, D, W>,
	body: Body<IS["Type"], Found<D>, OS["Type"], ES["Type"], W, R>
): StepKind<Name, IS, OS, ES, D, W, R> => {
	named("step", name)
	Arr.forEach(Rec.keys(shape.reads), (read) => readNamed(`step ${name}`, read))
	return { _tag: "Step", name, ...shape, body, of: spawnOf(name) }
}

/** What a scope may start or an edge may spawn: a step kind or a scope kind. */
export type ChildKind = AnyStepKind | AnyScopeKind

/** The spawn of one of `Children`, typed by that kind's input. */
export type SpawnOf<Children extends ReadonlyArray<ChildKind>> = {
	readonly [K in keyof Children]: Spawn<Children[K]["name"], Children[K]["input"]["Type"]>
}[number]

/** How a child step ended, as its scope's finish reads it: done with its output, or failed. */
export type Ending<O> = { readonly _tag: "Done"; readonly output: O } | { readonly _tag: "Failed" }

/** How a child scope ended, as its parent's finish reads it: its own finish done, or failed. A scope has no output. */
export type ScopeEnding = { readonly _tag: "Done" } | { readonly _tag: "Failed" }

/** What a finish reads of a child kind: a step kind's ending with its output, a scope kind's ending. */
type EndingOf<K> = K extends { readonly _tag: "Step"; readonly output: infer OS }
	? OS extends Stored
		? Ending<OS["Type"]>
		: never
	: ScopeEnding

/** The endings a finish reads, by the kind of each child it reads. */
export type EndingsOf<Ended extends ReadonlyArray<ChildKind>> = {
	readonly [K in Ended[number] as K["name"]]: ReadonlyArray<EndingOf<K>>
}

/**
 * A scope's finish: a step that runs once every child has ended, reads the endings of the kinds it names (done or
 * failed), and returns writes (a cursor moved, or held where a child failed).
 */
export interface Finish<
	I,
	Ended extends ReadonlyArray<ChildKind>,
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
> {
	readonly reads: Ended
	readonly error: ES
	readonly retry: Ladder
	readonly writes: W
	readonly body: (input: I, endings: EndingsOf<Ended>) => Effect.Effect<Writes<W>, ES["Type"], R>
}

/** Any finish, as a flow reads it. */
export interface AnyFinish {
	readonly reads: ReadonlyArray<{ readonly _tag: string; readonly name: string }>
	readonly error: ErrorSchema
	readonly retry: Ladder
	readonly writes: WritesDeclaration
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
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
>(
	name: Name,
	shape: ScopeShape<IS, Children, Finish<IS["Type"], Ended, ES, W, R>>
): ScopeKind<Name, IS, Children, Finish<IS["Type"], Ended, ES, W, R>> => {
	named("scope", name)
	return { _tag: "Scope", name, ...shape, of: spawnOf(name) }
}

/**
 * What starts a root: a schedule, whose every instant is one root keyed by it; an operator's command; or the app's own
 * write, which requests the root inside the app's own transaction.
 */
export type Trigger<I> =
	| {
			readonly kind: "schedule"
			readonly cron: Cron.Cron
			readonly input: (at: bigint) => I
	  }
	| { readonly kind: "operator" }
	| { readonly kind: "app" }

/** A root started at each instant `cron` matches, its input what `input` makes of that instant. */
export const schedule = <I>(cron: Cron.Cron, input: (at: bigint) => I): Trigger<I> => ({
	kind: "schedule",
	cron,
	input
})

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
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
>(
	name: Name,
	shape: ScopeShape<IS, Children, Finish<IS["Type"], Ended, ES, W, R>> & RootGates<IS["Type"]>
): RootKind<Name, IS, Children, Finish<IS["Type"], Ended, ES, W, R>> => {
	named("root", name)
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

/**
 * A spawn edge: a pure function from a step's input and output to the inputs of the children it starts, of kind `to`,
 * in the step's own scope (a step) or as new child scopes (a scope kind). A result decides only which declared edges it
 * takes, and how often; a step that fails spawns nothing.
 */
export interface Edge<
	Name extends string,
	From extends AnyStepKind,
	To extends AnyStepKind | AnyScopeKindOf
> {
	readonly _tag: "Edge"
	readonly name: Name
	readonly from: From
	readonly to: To
	readonly next: (
		input: From["input"]["Type"],
		output: From["output"]["Type"]
	) => ReadonlyArray<To["input"]["Type"]>
}

/** Any edge, as a flow lists it. */
export interface AnyEdge {
	readonly _tag: "Edge"
	readonly name: string
	readonly from: AnyStepKind
	readonly to: AnyStepKind | AnyScopeKindOf
}

export const edge = <
	const Name extends string,
	From extends AnyStepKind,
	To extends AnyStepKind | AnyScopeKindOf
>(
	name: Name,
	from: From,
	to: To,
	next: (
		input: From["input"]["Type"],
		output: From["output"]["Type"]
	) => ReadonlyArray<To["input"]["Type"]>
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
