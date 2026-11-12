import { Array as Arr, Option } from "effect"
import {
	type AnyAwaitKind,
	type AnyEdge,
	type AnyFinish,
	type AnyStepKind,
	type Lane,
	named,
	Refused,
	type Stored,
	type Trigger
} from "#algebra/kinds.ts"

/** Any root kind, as a flow lists it. */
export interface AnyRootKind {
	readonly _tag: "Root"
	readonly name: string
	readonly trigger: Trigger
	readonly input: Stored
	readonly children: ReadonlyArray<{ readonly _tag: string; readonly name: string }>
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

/** Every kind a flow declares: step kinds, awaits, scope kinds and roots. */
export type AnyKind = AnyStepKind | AnyAwaitKind | AnyScope | AnyRootKind

/**
 * A flow: its lanes, kinds and edges, checked when it is declared. Its name prefixes every relation, roster, role and
 * program it lowers to, so two flows never meet in an app's schema.
 */
export interface Flow<
	Name extends string,
	Lanes extends ReadonlyArray<Lane>,
	Kinds extends ReadonlyArray<AnyKind>,
	Edges extends ReadonlyArray<AnyEdge>
> {
	readonly _tag: "Flow"
	readonly name: Name
	readonly lanes: Lanes
	readonly kinds: Kinds
	readonly edges: Edges
}

/** Any flow. */
export type AnyFlow = Flow<
	string,
	ReadonlyArray<Lane>,
	ReadonlyArray<AnyKind>,
	ReadonlyArray<AnyEdge>
>

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

/** The steps and awaits of a join: its children's, and what edges from them spawn in the same scope, transitively. */
export const membersOf = (
	join: AnyJoin,
	kinds: ReadonlyArray<AnyKind>,
	edges: ReadonlyArray<AnyEdge>
): ReadonlyArray<AnyStepKind | AnyAwaitKind> => {
	const inScope = (name: string): Option.Option<AnyStepKind | AnyAwaitKind> =>
		Arr.findFirst(
			kinds,
			(kind): kind is AnyStepKind | AnyAwaitKind =>
				(kind._tag === "Step" || kind._tag === "Await") && kind.name === name
		)
	const grow = (
		found: ReadonlyArray<AnyStepKind | AnyAwaitKind>
	): ReadonlyArray<AnyStepKind | AnyAwaitKind> => {
		const reached: ReadonlyArray<AnyStepKind | AnyAwaitKind> = [
			...found,
			...Arr.flatMap(edges, (e) =>
				Arr.some(found, (k) => k.name === e.from.name) ? Option.toArray(inScope(e.to.name)) : []
			)
		]
		const next = Arr.dedupeWith(reached, (a, b) => a.name === b.name)
		return next.length === found.length ? found : grow(next)
	}
	return grow(Arr.flatMap(join.children, (child) => Option.toArray(inScope(child.name))))
}

/** The joins a flow declares: its scope kinds and its roots. */
export const joinsOf = (kinds: ReadonlyArray<AnyKind>): ReadonlyArray<AnyJoin> =>
	Arr.filter(kinds, (kind): kind is AnyJoin => kind._tag === "Scope" || kind._tag === "Root")

/** The step kinds a flow declares. */
export const stepsOf = (kinds: ReadonlyArray<AnyKind>): ReadonlyArray<AnyStepKind> =>
	Arr.filter(kinds, (kind): kind is AnyStepKind => kind._tag === "Step")

/** The awaits a flow declares. */
export const awaitsOf = (kinds: ReadonlyArray<AnyKind>): ReadonlyArray<AnyAwaitKind> =>
	Arr.filter(kinds, (kind): kind is AnyAwaitKind => kind._tag === "Await")

/**
 * A flow, checked: its names unique and PascalCase, every step kind on a declared lane, every edge between declared
 * kinds and from a step, every kind but a root owned by some scope (named by a join's children or an edge's target),
 * every root with a trigger, and every finish reading only kinds its scope holds. A refusal is thrown as `Refused`,
 * when the module declaring the flow loads.
 */
export const flow = <
	const Name extends string,
	const Lanes extends ReadonlyArray<Lane>,
	const Kinds extends ReadonlyArray<AnyKind>,
	const Edges extends ReadonlyArray<AnyEdge>
>(
	name: Name,
	declared: { readonly lanes: Lanes; readonly kinds: Kinds; readonly edges: Edges }
): Flow<Name, Lanes, Kinds, Edges> => {
	named("flow", name)
	const { lanes, kinds, edges } = declared
	const declaration = `flow ${name}`
	const joins = joinsOf(kinds)
	unique(
		`${declaration} lanes`,
		Arr.map(lanes, (l) => l.name)
	)
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
	const onLane = (what: string, l: Lane) => {
		if (!Arr.some(lanes, (declaredLane) => declaredLane === l)) {
			refuse(declaration, `${what} runs on lane ${l.name}, which the flow does not declare`)
		}
	}
	Arr.forEach(stepsOf(kinds), (s) => onLane(`step ${s.name}`, s.lane))
	Arr.forEach(joins, (j) => onLane(`the finish of ${j.name}`, j.finish.lane))
	Arr.forEach(edges, (e) => {
		if (!Arr.some(kinds, (k) => k === e.from)) {
			refuse(
				declaration,
				`edge ${e.name} starts at ${e.from.name}, a step the flow does not declare`
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
	return { _tag: "Flow", name, lanes, kinds, edges }
}
