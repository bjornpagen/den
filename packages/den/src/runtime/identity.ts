import { Array as Arr, Effect } from "effect"
import type { Brand } from "effect"
import { Digest } from "effect/crypto"

/**
 * Identity, derived: a step's key is its parent, its edge kind and its ordinal; a scope's start child is its scope and
 * its ordinal; a scope's finish is its scope; a root's scope is its flow, its kind and its trigger's idempotency key.
 * Each key is the SHA-256 of its parts, in grizzle's `sha256` spelling (64 lowercase hex digits), a content digest and
 * so a natural key, so a step run twice spawns onto the same keys, which grizzle reads as no change.
 */

/** A step's key: the ledger's `DenStep`, a SHA-256 digest's text, 64 lowercase hex digits, as grizzle's `sha256` holds it. */
export type StepKey = string & Brand.Brand<"DenStep">

/** A scope's key: the ledger's `DenScope`. */
export type ScopeKey = string & Brand.Brand<"DenScope">

/** An exclusivity seat's key: the digest of a scope kind and the key text its input names, the ledger's `DenExclusive`. */
export type ExclusiveId = string & Brand.Brand<"DenExclusive">

/** An instant, milliseconds since the epoch: the ledger's `DenInstant`, the caller's clock as grizzle takes it. */
export type Instant = bigint & Brand.Brand<"DenInstant">

/** The claim behind each mint, unchecked: a value made here by its derivation is a key of its kind. */
const derivedStep: (value: string) => asserts value is StepKey = () => undefined
const derivedScope: (value: string) => asserts value is ScopeKey = () => undefined
const derivedExclusive: (value: string) => asserts value is ExclusiveId = () => undefined
const readInstant: (value: bigint) => asserts value is Instant = () => undefined

/** The instant `millis` milliseconds after the epoch, the one mint of an Instant. */
export const instantOf = (millis: number): Instant => {
	const value = BigInt(millis)
	readInstant(value)
	return value
}

const encoder = new TextEncoder()

/** The SHA-256 of a derivation's parts, each kept apart by a NUL, which no key's text holds, as Effect's digestHex spells it. */
const derive = (parts: ReadonlyArray<string>): Effect.Effect<string, never, Digest.Digest> =>
	Effect.flatMap(Digest.Digest, (digest) =>
		digest.digestHex(Digest.sha256, encoder.encode(Arr.join(parts, "\u0000")))
	)

const asStep = (value: string): StepKey => {
	derivedStep(value)
	return value
}

const asScope = (value: string): ScopeKey => {
	derivedScope(value)
	return value
}

/** The scope of root kind `kind` of flow `flow`, started under the idempotency key `key`. */
export const rootScope = (flow: string, kind: string, key: string) =>
	Effect.map(derive(["root", flow, kind, key]), asScope)

/** The step a scope's start spawns at `ordinal`. */
export const startedStep = (scope: ScopeKey, ordinal: number) =>
	Effect.map(derive(["start", scope, String(ordinal)]), asStep)

/** The child scope a scope's start spawns at `ordinal`. */
export const startedScope = (scope: ScopeKey, ordinal: number) =>
	Effect.map(derive(["start-scope", scope, String(ordinal)]), asScope)

/** The step edge `edge` of step `step` spawns at `ordinal`. */
export const edgeStep = (step: StepKey, edge: string, ordinal: number) =>
	Effect.map(derive(["edge", step, edge, String(ordinal)]), asStep)

/** The child scope edge `edge` of step `step` spawns at `ordinal`. */
export const edgeScope = (step: StepKey, edge: string, ordinal: number) =>
	Effect.map(derive(["edge-scope", step, edge, String(ordinal)]), asScope)

/** The step that runs scope `scope`'s finish: one per scope, the key its finish's race is decided on. */
export const finishStep = (scope: ScopeKey) => Effect.map(derive(["finish", scope]), asStep)

/** The exclusivity seat of scope kind `kind` of flow `flow` under the key text `key`. */
export const exclusiveId = (flow: string, kind: string, key: string) =>
	Effect.map(derive(["exclusive", flow, kind, key]), (value) => {
		derivedExclusive(value)
		return value
	})
