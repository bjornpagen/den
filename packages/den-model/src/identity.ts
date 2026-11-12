import { textOf } from "#datum.ts"

/**
 * A root's key: the trigger that started it and the idempotency key it gave. A second admission under the key of a
 * live root is no change; once the root is retired the key is free, and the next admission starts a new graph.
 */
export type RootKey = Readonly<{ trigger: string; key: string }>

/**
 * A scope's identity, derived from where it was opened, so a re-run opens it under the same key: a root's scope by its
 * root's key; a scope its parent scope's start opened, by that scope and the child's ordinal; a scope a step's edge
 * opened, by the step, the edge and the ordinal of the input among those the edge returned.
 */
export type ScopeId =
	| Readonly<{ _tag: "RootScope"; root: RootKey }>
	| Readonly<{ _tag: "StartScope"; scope: ScopeId; ordinal: number }>
	| Readonly<{ _tag: "EdgeScope"; by: StepId; edge: string; ordinal: number }>

/**
 * A step's identity, derived the same way: a scope's start child by the scope and its ordinal; a spawned step by its
 * parent step, the edge and its ordinal; a joined step, which a feed edge starts once every parent role arrived, by its
 * scope, the feed and the join key the parents named; a scope's finish by its scope alone, so a scope has one finish.
 */
export type StepId =
	| Readonly<{ _tag: "StartStep"; scope: ScopeId; ordinal: number }>
	| Readonly<{ _tag: "EdgeStep"; by: StepId; edge: string; ordinal: number }>
	| Readonly<{ _tag: "JoinStep"; scope: ScopeId; feed: string; key: string }>
	| Readonly<{ _tag: "FinishStep"; scope: ScopeId }>

/** A root key's canonical text. */
export const rootText = (root: RootKey): string => `${root.trigger}(${textOf(root.key)})`

/**
 * A scope's canonical text, the key the ledger files it under and a trace prints: the path from its root, `/` before
 * each segment. A scope a start opened is `<scope>/start[<n>]`, one an edge opened `<step>/<edge>[<n>]`.
 */
export const scopeText = (scope: ScopeId): string => {
	switch (scope._tag) {
		case "RootScope":
			return rootText(scope.root)
		case "StartScope":
			return `${scopeText(scope.scope)}/start[${scope.ordinal}]`
		case "EdgeScope":
			return `${stepText(scope.by)}/${scope.edge}[${scope.ordinal}]`
	}
}

/**
 * A step's canonical text: `<scope>/start#<n>`, `<step>/<edge>#<n>`, `<scope>/<feed>@<key>` and `<scope>/finish`. A
 * step's `#` and a scope's `[ ]` keep the two kinds apart where one edge could name both.
 */
export const stepText = (step: StepId): string => {
	switch (step._tag) {
		case "StartStep":
			return `${scopeText(step.scope)}/start#${step.ordinal}`
		case "EdgeStep":
			return `${stepText(step.by)}/${step.edge}#${step.ordinal}`
		case "JoinStep":
			return `${scopeText(step.scope)}/${step.feed}@${textOf(step.key)}`
		case "FinishStep":
			return `${scopeText(step.scope)}/finish`
	}
}

/** The root a scope belongs to, the end of its chain of owners. */
export const rootOfScope = (scope: ScopeId): RootKey => {
	switch (scope._tag) {
		case "RootScope":
			return scope.root
		case "StartScope":
			return rootOfScope(scope.scope)
		case "EdgeScope":
			return rootOfStep(scope.by)
	}
}

/** The root a step belongs to. */
export const rootOfStep = (step: StepId): RootKey => {
	switch (step._tag) {
		case "StartStep":
		case "JoinStep":
		case "FinishStep":
			return rootOfScope(step.scope)
		case "EdgeStep":
			return rootOfStep(step.by)
	}
}
