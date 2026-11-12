import { regex } from "arkregex"
import { Array as Arr, Effect, Option, String as Str } from "effect"
import type { Brand } from "effect"
import { Digest } from "effect/crypto"

/**
 * Identity, derived: a step's key is its parent, its edge kind and its ordinal; a scope's start child is its scope and
 * its ordinal; a scope's finish is its scope; a root's scope is its flow, its kind and its trigger's idempotency key.
 * Each key is the uuid of the SHA-256 of its parts (version 8, RFC 9562's custom layout), so a step run twice spawns
 * onto the same keys, which grizzle reads as no change.
 */

/** A uuid's text: five hyphenated groups, as grizzle's uuid field holds it. */
export type Uuid = `${string}-${string}-${string}-${string}-${string}`

/** A step's key: the ledger's `DenStep`. */
export type StepKey = Uuid & Brand.Brand<"DenStep">

/** A scope's key: the ledger's `DenScope`. */
export type ScopeKey = Uuid & Brand.Brand<"DenScope">

/** A claim's holder: one turn's own key, the ledger's `DenHolder`. */
export type Holder = Uuid & Brand.Brand<"DenHolder">

/** An exclusivity seat's key: the uuid of a scope kind and the key text its input names, the ledger's `DenExclusive`. */
export type ExclusiveId = Uuid & Brand.Brand<"DenExclusive">

/** An instant, milliseconds since the epoch: the ledger's `DenInstant`, the caller's clock as grizzle takes it. */
export type Instant = bigint & Brand.Brand<"DenInstant">

/** The claim behind each mint, unchecked: a value made here by its derivation is a key of its kind. */
const derivedStep: (value: Uuid) => asserts value is StepKey = () => undefined
const derivedScope: (value: Uuid) => asserts value is ScopeKey = () => undefined
const derivedHolder: (value: Uuid) => asserts value is Holder = () => undefined
const derivedExclusive: (value: Uuid) => asserts value is ExclusiveId = () => undefined
const readInstant: (value: bigint) => asserts value is Instant = () => undefined

/** The instant `millis` milliseconds after the epoch, the one mint of an Instant. */
export const instantOf = (millis: number): Instant => {
	const value = BigInt(millis)
	readInstant(value)
	return value
}

/** A SHA-256 digest's leading 128 bits, in the groups of a uuid, its version and variant digits apart. */
const LAYOUT = regex(
	"^(?<a>[0-9a-f]{8})(?<b>[0-9a-f]{4})[0-9a-f](?<c>[0-9a-f]{3})(?<v>[0-9a-f])(?<d>[0-9a-f]{3})(?<e>[0-9a-f]{12})"
)

/** The variant digit, 10 in its top two bits, for each hex digit a digest holds there. */
const VARIANT = "89ab89ab89ab89ab"

/** The uuid of version 8 of a SHA-256 digest's leading 128 bits, set as RFC 9562's custom layout sets them. */
const uuidOf = (hex: string): Effect.Effect<Uuid> =>
	Effect.map(Effect.orDie(Effect.fromNullishOr(LAYOUT.exec(hex)?.groups)), (groups): Uuid => {
		const variant = Option.getOrElse(Str.charAt(Number.parseInt(groups.v, 16))(VARIANT), () => "8")
		return `${groups.a}-${groups.b}-8${groups.c}-${variant}${groups.d}-${groups.e}`
	})

const encoder = new TextEncoder()

/** The uuid of a derivation's parts, each kept apart by a NUL, which no key's text holds. */
const derive = (parts: ReadonlyArray<string>): Effect.Effect<Uuid, never, Digest.Digest> =>
	Effect.flatMap(Digest.Digest, (digest) =>
		Effect.flatMap(
			digest.digestHex(Digest.sha256, encoder.encode(Arr.join(parts, "\u0000"))),
			uuidOf
		)
	)

const asStep = (value: Uuid): StepKey => {
	derivedStep(value)
	return value
}

const asScope = (value: Uuid): ScopeKey => {
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

/** A claim's holder for one turn of `step` at `attempt`, from a nonce the caller draws, so two turns never share one. */
export const holderOf = (step: StepKey, attempt: number, nonce: number) =>
	Effect.map(derive(["holder", step, String(attempt), String(nonce)]), (value) => {
		derivedHolder(value)
		return value
	})
