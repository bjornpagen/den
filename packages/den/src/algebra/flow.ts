import { Array as Arr, Option } from "effect"
import {
	type AnyEdge,
	type AnyFinish,
	type AnyStepKind,
	type Exclusive,
	named,
	type PauseHandle,
	type Precondition,
	Refused,
	type Resource,
	seatedOf,
	type Stored,
	type Trigger,
	type Window,
	type Writer
} from "#algebra/kinds.ts"

/** Any root kind, as a flow lists it. */
export interface AnyRootKind {
	readonly _tag: "Root"
	readonly name: string
	readonly trigger: { readonly kind: Trigger<never>["kind"] }
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly _tag: string; readonly name: string }>
	readonly exclusive: Exclusive<never>
	readonly window: Window
	readonly precondition: Precondition
	readonly finish: AnyFinish
}

/** Any non-root scope kind, as a flow lists it. */
export interface AnyScope {
	readonly _tag: "Scope"
	readonly name: string
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly _tag: string; readonly name: string }>
	readonly finish: AnyFinish
}

/** Every kind a flow declares: step kinds, scope kinds and roots. */
export type AnyKind = AnyStepKind | AnyScope | AnyRootKind

/**
 * A flow: the app role its steps write under, its kinds and its edges, checked when it is declared. Its name prefixes
 * every relation, roster, role and program it lowers to, so two flows never meet in an app's schema.
 */
export interface Flow<
	Name extends string,
	Kinds extends ReadonlyArray<AnyKind>,
	Edges extends ReadonlyArray<AnyEdge>
> {
	readonly _tag: "Flow"
	readonly name: Name
	readonly writes: Writer
	readonly kinds: Kinds
	readonly edges: Edges
	/** The resources its steps and finishes use, each once, in the order they name them. */
	readonly resources: ReadonlyArray<Resource>
	/** The pause handles its steps and finishes use, each once, in the order they name them. */
	readonly handles: ReadonlyArray<PauseHandle>
}

/** Any flow. */
export type AnyFlow = Flow<string, ReadonlyArray<AnyKind>, ReadonlyArray<AnyEdge>>

/** A scope or a root: what joins children. */
export type AnyJoin = AnyScope | AnyRootKind

/** The name of a scope's finish, the step kind it runs as. */
export const finishName = (join: { readonly name: string }): string => `${join.name}Finish`

const refuse = (declaration: string, why: string): never => {
	throw new Refused({ declaration, why })
}

const unique = (declaration: string, names: ReadonlyArray<string>): void => {
	Arr.forEach(names, (name, index) => {
		if (Arr.some(Arr.take(names, index), (earlier) => earlier === name)) {
			refuse(declaration, `${name} is declared twice`)
		}
	})
}

/** The joins a flow declares: its scope kinds and its roots. */
export const joinsOf = (kinds: ReadonlyArray<AnyKind>): ReadonlyArray<AnyJoin> =>
	Arr.filter(kinds, (kind): kind is AnyJoin => kind._tag === "Scope" || kind._tag === "Root")

/** The step kinds a flow declares. */
export const stepsOf = (kinds: ReadonlyArray<AnyKind>): ReadonlyArray<AnyStepKind> =>
	Arr.filter(kinds, (kind): kind is AnyStepKind => kind._tag === "Step")

/**
 * The kinds a join holds: its children, and what the edges from them spawn, from a step in the same scope and from a
 * child scope in the scope that holds it, as steps or child scopes, transitively, never into a child scope's own
 * members.
 */
export const membersOf = (
	join: AnyJoin,
	kinds: ReadonlyArray<AnyKind>,
	edges: ReadonlyArray<AnyEdge>
): ReadonlyArray<AnyKind> => {
	const declared = (name: string): Option.Option<AnyKind> =>
		Arr.findFirst(kinds, (kind) => kind.name === name && kind._tag !== "Root")
	const grow = (found: ReadonlyArray<AnyKind>): ReadonlyArray<AnyKind> => {
		const reached: ReadonlyArray<AnyKind> = [
			...found,
			...Arr.flatMap(edges, (e) =>
				Arr.some(found, (k) => k.name === e.from.name) ? Option.toArray(declared(e.to.name)) : []
			)
		]
		const next = Arr.dedupeWith(reached, (a, b) => a.name === b.name)
		return next.length === found.length ? found : grow(next)
	}
	return grow(Arr.flatMap(join.children, (child) => Option.toArray(declared(child.name))))
}

/**
 * The resources and the pause handles a flow's steps and finishes use, each once, refusing two uses of one name and a
 * use named as a root kind: each names a target of the flow's pauses, as a root kind does.
 */
const usesOf = (
	declaration: string,
	steps: ReadonlyArray<AnyStepKind>,
	joins: ReadonlyArray<AnyJoin>
): {
	readonly resources: ReadonlyArray<Resource>
	readonly handles: ReadonlyArray<PauseHandle>
} => {
	const used = [...Arr.flatMap(steps, (s) => s.uses), ...Arr.flatMap(joins, (j) => j.finish.uses)]
	const distinct = Arr.dedupeWith(used, (a, b) => a === b)
	unique(`${declaration} pause targets`, [
		...Arr.map(distinct, (u) => u.name),
		...Arr.map(
			Arr.filter(joins, (j) => j._tag === "Root"),
			(j) => j.name
		)
	])
	return {
		resources: seatedOf(distinct),
		handles: Arr.flatMap(distinct, (u) => (u._tag === "PauseHandle" ? [u] : []))
	}
}

/**
 * A flow, checked: its names unique and PascalCase, every edge between declared kinds and from a step or a child scope (a
 * root has no parent to spawn its next stage in), every kind but a
 * root owned by some scope (named by a join's children or an edge's target), at least one root, every finish reading
 * only kinds its scope holds, and its resources, pause handles and roots distinct by name. A refusal is thrown as
 * `Refused`, when the module declaring the flow loads.
 */
export const flow = <
	const Name extends string,
	const Kinds extends ReadonlyArray<AnyKind>,
	const Edges extends ReadonlyArray<AnyEdge>
>(
	name: Name,
	declared: { readonly writes: Writer; readonly kinds: Kinds; readonly edges: Edges }
): Flow<Name, Kinds, Edges> => {
	named("flow", name)
	const { writes, kinds, edges } = declared
	const declaration = `flow ${name}`
	const joins = joinsOf(kinds)
	const steps = stepsOf(kinds)
	unique(`${declaration} kinds`, [...Arr.map(kinds, (k) => k.name), ...Arr.map(joins, finishName)])
	unique(
		`${declaration} edges`,
		Arr.map(edges, (e) => e.name)
	)
	if (!Arr.some(kinds, (k) => k._tag === "Root")) {
		refuse(declaration, "no root starts it: a graph begins only at a root")
	}
	const declaredKind = (kind: { readonly name: string }) =>
		Arr.some(kinds, (k) => k === kind || (k.name === kind.name && k._tag !== "Root"))
	Arr.forEach(edges, (e) => {
		if (!Arr.some(kinds, (k) => k === e.from)) {
			refuse(
				declaration,
				`edge ${e.name} starts at ${e.from.name}, a kind the flow does not declare`
			)
		}
		if (!declaredKind(e.to)) {
			refuse(declaration, `edge ${e.name} spawns ${e.to.name}, which the flow does not declare`)
		}
	})
	Arr.forEach(joins, (j) =>
		Arr.forEach(j.children, (child) => {
			if (child._tag === "Root") {
				refuse(declaration, `${j.name} starts the root ${child.name}: only a trigger starts a root`)
			}
			if (!declaredKind(child)) {
				refuse(declaration, `${j.name} starts ${child.name}, which the flow does not declare`)
			}
		})
	)
	Arr.forEach(kinds, (k) => {
		if (k._tag === "Root") {
			return
		}
		const owned =
			Arr.some(joins, (j) => Arr.some(j.children, (child) => child.name === k.name)) ||
			Arr.some(edges, (e) => e.to.name === k.name)
		if (!owned) {
			refuse(declaration, `${k.name} has no owning scope: no join starts it and no edge spawns it`)
		}
	})
	Arr.forEach(joins, (j) => {
		const members = membersOf(j, kinds, edges)
		Arr.forEach(j.finish.reads, (read) => {
			if (!Arr.some(members, (m) => m.name === read.name)) {
				refuse(
					declaration,
					`the finish of ${j.name} reads ${read.name}, which ${j.name} never holds`
				)
			}
		})
	})
	const { resources, handles } = usesOf(declaration, steps, joins)
	return { _tag: "Flow", name, writes, kinds, edges, resources, handles }
}
