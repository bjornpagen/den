import type { AnyRelation, Written } from "@bjornpagen/grizzle"
import { regex } from "arkregex"
import { Data, type Cron, type Effect, type Schema } from "effect"

/**
 * The declarations of den's algebra (the proposal's section 4): lanes, step kinds, awaits, scope kinds, roots and
 * edges, each typed by Effect Schemas, so a flow's whole shape is known before anything runs and lowers into grizzle
 * relations. Work nobody joins is unrepresentable: a step is only ever a spawn a scope's `children` or an edge names, and
 * a scope finishes only after every child has a result.
 */

/** A declaration den refuses, with what it refuses: a name, a lane, an edge or a scope's shape. */
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

/** When a lane's steps may be claimed: at every instant, or at the instants a cron expression matches. */
export type LaneWindow =
	| { readonly kind: "always" }
	| { readonly kind: "cron"; readonly cron: Cron.Cron }

/** The standing a lane is installed in: running, or paused until an operator resumes it. */
export type LanePause = "running" | "paused"

/**
 * A lane: the most of its steps running at once across every graph (`width`), when they may be claimed (`window`), the
 * standing it starts in (`pause`), and the ceiling of attempts after which a step that keeps failing ends `failed`.
 */
export interface Lane<Name extends string = string> {
	readonly _tag: "Lane"
	readonly name: Name
	readonly width: number
	readonly window: LaneWindow
	readonly pause: LanePause
	readonly attempts: number
}

/** A lane's declaration: its width, window, standing and ceiling of attempts, each the flow's own choice. */
export interface LaneOptions {
	readonly width: number
	readonly window: LaneWindow
	readonly pause: LanePause
	readonly attempts: number
}

const positive = (declaration: string, what: string, n: number): void => {
	if (!Number.isSafeInteger(n) || n < 1) {
		throw new Refused({ declaration, why: `${what} ${String(n)} is no positive integer` })
	}
}

export const lane = <const Name extends string>(name: Name, options: LaneOptions): Lane<Name> => {
	named("lane", name)
	positive(`lane ${name}`, "width", options.width)
	positive(`lane ${name}`, "attempts", options.attempts)
	return { _tag: "Lane", name, ...options }
}

/** A column's schema: text, a bigint, a boolean, a literal union of texts, or a brand of one. */
export type ColumnSchema =
	| Schema.String
	| Schema.BigInt
	| Schema.Boolean
	| Schema.Literal<string>
	| Schema.Literals<ReadonlyArray<string>>
	| Schema.brand<Schema.String | Schema.BigInt | Schema.Boolean, string>

/** A field's schema: a column, or an Option of one, which lowers to a relation of its own. */
export type FieldSchema = ColumnSchema | Schema.Option<ColumnSchema>

/** A step's input, output or error: a struct of fields den lowers to typed relations. */
export type Stored = Schema.Struct<{ readonly [field: string]: FieldSchema }>

/** A step's error: a struct of fields, or Never for a step that never fails with a typed error. */
export type ErrorSchema = Stored | Schema.Never

/**
 * What a step may write into the app's relations, by operation, as the facts of the ChangeSet its commit applies with
 * the step's result: a served Db runs only workload members, so a step's writes are that member's array facts, never a
 * ChangeSet built at run time.
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

/** What a body returns: its output and its writes into the app's relations, committed with its result in one call. */
export interface Done<O, W extends WritesDeclaration> {
	readonly output: O
	readonly writes: Writes<W>
}

/**
 * A spawn: a step, await or scope of the kind named `kind`, with its input. A spawn exists only as a scope's start or
 * an edge's yield, so every piece of work has the scope that joins it.
 */
export interface Spawn<Kind extends string, I> {
	readonly _tag: "Spawn"
	readonly kind: Kind
	readonly input: I
}

const spawnOf =
	<Kind extends string, I>(kind: Kind) =>
	(input: I): Spawn<Kind, I> => ({ _tag: "Spawn", kind, input })

/** A step's body: from its input to its output and writes, never holding grizzle's Db, which den alone opens. */
export type Body<I, O, E, W extends WritesDeclaration, R> = (
	input: I
) => Effect.Effect<Done<O, W>, E, R>

/** A step kind: its name, lane, schemas, declared writes and body; `of` spawns one. */
export interface StepKind<
	Name extends string,
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
> {
	readonly _tag: "Step"
	readonly name: Name
	readonly lane: Lane
	readonly input: IS
	readonly output: OS
	readonly error: ES
	readonly writes: W
	readonly body: Body<IS["Type"], OS["Type"], ES["Type"], W, R>
	readonly of: (input: IS["Type"]) => Spawn<Name, IS["Type"]>
}

/** Any step kind, as a flow lists it. */
export interface AnyStepKind {
	readonly _tag: "Step"
	readonly name: string
	readonly lane: Lane
	readonly input: Stored
	readonly output: Stored
	readonly error: ErrorSchema
	readonly writes: WritesDeclaration
}

export const step = <
	const Name extends string,
	IS extends Stored,
	OS extends Stored,
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
>(
	on: Lane,
	name: Name,
	shape: { readonly input: IS; readonly output: OS; readonly error: ES; readonly writes: W },
	body: Body<IS["Type"], OS["Type"], ES["Type"], W, R>
): StepKind<Name, IS, OS, ES, W, R> => {
	named("step", name)
	return { _tag: "Step", name, lane: on, ...shape, body, of: spawnOf(name) }
}

/**
 * An await: a step with no body whose result is inserted from outside (a webhook, an operator, an instant passing),
 * the first insert winning. It runs on no lane and is never claimed.
 */
export interface AwaitKind<Name extends string, IS extends Stored, OS extends Stored> {
	readonly _tag: "Await"
	readonly name: Name
	readonly input: IS
	readonly output: OS
	readonly of: (input: IS["Type"]) => Spawn<Name, IS["Type"]>
}

/** Any await, as a flow lists it. */
export interface AnyAwaitKind {
	readonly _tag: "Await"
	readonly name: string
	readonly input: Stored
	readonly output: Stored
}

export const awaiting = <const Name extends string, IS extends Stored, OS extends Stored>(
	name: Name,
	shape: { readonly input: IS; readonly output: OS }
): AwaitKind<Name, IS, OS> => {
	named("await", name)
	return { _tag: "Await", name, ...shape, of: spawnOf(name) }
}

/** What a scope may start or an edge may spawn: a step kind, an await or a scope kind. */
export type ChildKind = AnyStepKind | AnyAwaitKind | AnyScopeKind

/** The spawn of one of `Children`, typed by that kind's input. */
export type SpawnOf<Children extends ReadonlyArray<ChildKind>> = {
	readonly [K in keyof Children]: Spawn<Children[K]["name"], Children[K]["input"]["Type"]>
}[number]

/** The outputs a finish reads, by the kind of each child it reads. */
export type ResultsOf<Reads extends ReadonlyArray<AnyStepKind | AnyAwaitKind>> = {
	readonly [K in Reads[number] as K["name"]]: ReadonlyArray<K["output"]["Type"]>
}

/** A scope's finish: what it reads of its children's outputs, and a body that returns only writes. */
export interface Finish<
	I,
	Reads extends ReadonlyArray<AnyStepKind | AnyAwaitKind>,
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
> {
	readonly lane: Lane
	readonly reads: Reads
	readonly error: ES
	readonly writes: W
	readonly body: (input: I, results: ResultsOf<Reads>) => Effect.Effect<Writes<W>, ES["Type"], R>
}

/** Any finish, as a flow reads it. */
export interface AnyFinish {
	readonly lane: Lane
	readonly reads: ReadonlyArray<AnyStepKind | AnyAwaitKind>
	readonly error: ErrorSchema
	readonly writes: WritesDeclaration
}

/**
 * A scope kind: a join. It owns what its start and its children's edges spawn, and finishes exactly once, after every
 * child has a result, by running its finish. `children` names every kind its start may spawn.
 */
export interface ScopeKind<
	Name extends string,
	IS extends Stored,
	Children extends ReadonlyArray<ChildKind>,
	F extends AnyFinish
> {
	readonly _tag: "Scope"
	readonly name: Name
	readonly input: IS
	readonly children: Children
	readonly start: (input: IS["Type"]) => ReadonlyArray<SpawnOf<Children>>
	readonly finish: F
	readonly of: (input: IS["Type"]) => Spawn<Name, IS["Type"]>
}

/** Any scope kind, a root's included. */
export interface AnyScopeKind {
	readonly _tag: "Scope" | "Root"
	readonly name: string
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly name: string }>
	readonly finish: AnyFinish
}

export const scope = <
	const Name extends string,
	IS extends Stored,
	const Children extends ReadonlyArray<ChildKind>,
	const Reads extends ReadonlyArray<AnyStepKind | AnyAwaitKind>,
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
>(
	name: Name,
	shape: {
		readonly input: IS
		readonly children: Children
		readonly start: (input: IS["Type"]) => ReadonlyArray<SpawnOf<Children>>
		readonly finish: Finish<IS["Type"], Reads, ES, W, R>
	}
): ScopeKind<Name, IS, Children, Finish<IS["Type"], Reads, ES, W, R>> => {
	named("scope", name)
	return { _tag: "Scope", name, ...shape, of: spawnOf(name) }
}

/** What starts a root: a schedule, an operator's command, or an API call. */
export type Trigger =
	| { readonly kind: "schedule"; readonly cron: Cron.Cron }
	| { readonly kind: "command" }
	| { readonly kind: "api" }

/**
 * A root kind: a scope a trigger starts, the only way a graph begins. Its identity is its kind and the idempotency key
 * its trigger gives, so starting it twice with one key starts one graph.
 */
export interface RootKind<
	Name extends string,
	IS extends Stored,
	Children extends ReadonlyArray<ChildKind>,
	F extends AnyFinish
> {
	readonly _tag: "Root"
	readonly name: Name
	readonly trigger: Trigger
	readonly input: IS
	readonly children: Children
	readonly start: (input: IS["Type"]) => ReadonlyArray<SpawnOf<Children>>
	readonly finish: F
}

export const root = <
	const Name extends string,
	IS extends Stored,
	const Children extends ReadonlyArray<ChildKind>,
	const Reads extends ReadonlyArray<AnyStepKind | AnyAwaitKind>,
	ES extends ErrorSchema,
	W extends WritesDeclaration,
	R
>(
	name: Name,
	shape: {
		readonly trigger: Trigger
		readonly input: IS
		readonly children: Children
		readonly start: (input: IS["Type"]) => ReadonlyArray<SpawnOf<Children>>
		readonly finish: Finish<IS["Type"], Reads, ES, W, R>
	}
): RootKind<Name, IS, Children, Finish<IS["Type"], Reads, ES, W, R>> => {
	named("root", name)
	return { _tag: "Root", name, ...shape }
}

/**
 * A spawn edge: a pure function from a step's input and output to the inputs of the children it starts, of kind `to`,
 * in the step's own scope (a step or await) or as new child scopes (a scope kind). A result decides only which declared
 * edges it takes, and how often.
 */
export interface Edge<
	Name extends string,
	From extends AnyStepKind,
	To extends AnyStepKind | AnyAwaitKind | AnyScopeKindOf
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

/** A scope kind an edge spawns: never a root, which only a trigger starts. */
export interface AnyScopeKindOf {
	readonly _tag: "Scope"
	readonly name: string
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly name: string }>
	readonly finish: AnyFinish
}

/** Any edge, as a flow lists it. */
export interface AnyEdge {
	readonly _tag: "Edge"
	readonly name: string
	readonly from: AnyStepKind
	readonly to: AnyStepKind | AnyAwaitKind | AnyScopeKindOf
}

export const edge = <
	const Name extends string,
	From extends AnyStepKind,
	To extends AnyStepKind | AnyAwaitKind | AnyScopeKindOf
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
