import * as g from "@bjornpagen/grizzle"
import { regex } from "arkregex"
import {
	Array as Arr,
	Clock,
	Context,
	Data,
	Duration,
	Effect,
	Layer,
	Ref,
	Result,
	Schema
} from "effect"
import { environmentPattern } from "#lower/keys.ts"

/**
 * The wake contract every transport meets. A wake is a doorbell: the ledger is the only authority, so a lost,
 * duplicated or late wake costs nothing (a lost one is healed by the relay or the census, a duplicate loses its key
 * race). It names its flow, so one consumer serves every flow an app runs, and what it rings: a step's attempt, or a
 * scope's admission.
 */

/** A flow's declared name, the prefix of everything it lowers to, as a wake carries it. */
export const FlowName = Schema.String.pipe(Schema.brand("den/FlowName"))
export type FlowName = typeof FlowName.Type

/** The claim attempt a wake rings for: its place among the step's claims, from 0. */
export const AttemptNumber = Schema.Int.check(Schema.isGreaterThanOrEqualTo(0)).pipe(
	Schema.brand("den/Attempt")
)
export type AttemptNumber = typeof AttemptNumber.Type

/** An instant a census wake is for: the start of a census period, in milliseconds since the epoch. */
export const CensusInstant = Schema.Int.check(Schema.isGreaterThanOrEqualTo(0)).pipe(
	Schema.brand("den/CensusInstant")
)
export type CensusInstant = typeof CensusInstant.Type

/**
 * A wake for the census of one period, named by the instant it starts: its tick of every flow an app runs, its
 * retirements, and the next period's wake. The census is a doorbell like any other, so it runs wherever the transport
 * delivers, every environment alike, and its timer is the transport's delay.
 */
export const CensusWake = Schema.TaggedStruct("Census", { at: CensusInstant })

/** A deployment's id, as its host names it (Vercel's `VERCEL_DEPLOYMENT_ID`): the code a consumer runs. */
export const DeploymentId = Schema.NonEmptyString.pipe(Schema.brand("den/DeploymentId"))
export type DeploymentId = typeof DeploymentId.Type

/**
 * An environment's name, as its host names it (Vercel's `VERCEL_ENV`): each serves one deployment at a time, and its
 * name is the ledger's DenEnvironment, parsed here once.
 */
export const EnvironmentName = Schema.String.check(
	Schema.isPattern(regex(environmentPattern, "u"))
).pipe(Schema.brand("DenEnvironment"))
export type EnvironmentName = typeof EnvironmentName.Type

/**
 * Where an invocation runs: the environment it serves and the deployment whose code it runs, read once at a host's
 * boundary. A transport partitions its wakes by deployment (Vercel Queues', each topic by deployment), so a wake rung
 * from a deployment lands on that deployment again, and a turn serves a wake only where its environment still serves
 * its deployment (runtime/turn.ts invoke).
 */
export class Host extends Context.Service<
	Host,
	{ readonly environment: EnvironmentName; readonly deployment: DeploymentId }
>()("@bjornpagen/den/transport/Host") {}

/**
 * A wake as the wire carries it: a step's attempt beside its root, a root's admission, or a period's census, each key
 * its digest's hex (Sha256.toHex). Every read of a step's rows binds its root, the unit's key; a root's scope is its
 * own root.
 * A transport that sends wakes over a wire encodes this schema (wireOf) and decodes it once at its consumer's boundary,
 * then parses its keys (wakeOf).
 */
export const WireWakeSchema = Schema.Union([
	Schema.TaggedStruct("Step", {
		flow: FlowName,
		root: Schema.String,
		step: Schema.String,
		attempt: AttemptNumber
	}),
	Schema.TaggedStruct("Admit", { flow: FlowName, scope: Schema.String }),
	CensusWake
])
export type WireWake = typeof WireWakeSchema.Type

/**
 * A wake: a step's attempt beside its root, a root's admission, or a period's census, each key the digest den derived.
 */
export type Wake =
	| {
			readonly _tag: "Step"
			readonly flow: FlowName
			readonly root: g.Sha256
			readonly step: g.Sha256
			readonly attempt: AttemptNumber
	  }
	| { readonly _tag: "Admit"; readonly flow: FlowName; readonly scope: g.Sha256 }
	| typeof CensusWake.Type

/** A wake of one flow: a step's attempt or a scope's admission, which that flow's ledger serves. */
export type FlowWake = Extract<Wake, { readonly flow: FlowName }>

/** A wake as the wire carries it, each key as its digest's hex. */
export const wireOf = (wake: Wake): WireWake => {
	switch (wake._tag) {
		case "Step":
			return { ...wake, root: g.Sha256.toHex(wake.root), step: g.Sha256.toHex(wake.step) }
		case "Admit":
			return { ...wake, scope: g.Sha256.toHex(wake.scope) }
		case "Census":
			return wake
	}
}

/** A wire wake whose key is no digest's hex: the text, and why Sha256.fromHex refused it. */
export class NotAKey extends Data.TaggedError("NotAKey")<{ readonly message: string }> {}

/** A wire key's digest, parsed from its hex once. */
const keyOf = (text: string): Result.Result<g.Sha256, NotAKey> => {
	const parsed = g.Sha256.fromHex(text)
	return parsed.ok
		? Result.succeed(parsed.value)
		: Result.fail(
				new NotAKey({ message: `a wake's key ${text} is no digest's hex: ${parsed.error}` })
			)
}

/** A wire wake's wake: each key parsed from its hex, once, at the consumer's boundary. */
export const wakeOf = (wire: WireWake): Result.Result<Wake, NotAKey> => {
	switch (wire._tag) {
		case "Step":
			return Result.flatMap(keyOf(wire.root), (root) =>
				Result.map(keyOf(wire.step), (step) => ({ ...wire, root, step }))
			)
		case "Admit":
			return Result.map(keyOf(wire.scope), (scope) => ({ ...wire, scope }))
		case "Census":
			return Result.succeed(wire)
	}
}

/** What a wake names, as text: its flow, and the step's attempt or the scope it rings; or its census's period. */
export const wakeText = (wake: Wake): string => {
	switch (wake._tag) {
		case "Step":
			return `${wake.flow}:step:${g.Sha256.toHex(wake.step)}:${wake.attempt}`
		case "Admit":
			return `${wake.flow}:admit:${g.Sha256.toHex(wake.scope)}`
		case "Census":
			return `census:${wake.at}`
	}
}

/**
 * Why a wake was rung, which its idempotency key names (edullm's wake causes): a turn's end, the turn by the wake it
 * served and the instant it ended at, so a commit's onward wakes ring once however often its answer is read back; the
 * relay at the committed state it rang for, so a leader hand-over's replay of the same commits is the duplicate it is;
 * a census tick at its instant; or a root's request, its admission rung by the write that requested it once that write has
 * committed (runtime/request.ts), the wake naming the root, so a root requested again is one message.
 */
export type Cause =
	| { readonly _tag: "Turn"; readonly by: Wake; readonly at: number }
	| { readonly _tag: "Relay"; readonly position: string }
	| { readonly _tag: "Census"; readonly at: number }
	| { readonly _tag: "Request" }

const causeText = (cause: Cause): string => {
	switch (cause._tag) {
		case "Turn":
			return `turn:${wakeText(cause.by)}:${cause.at}`
		case "Relay":
			return `relay:${cause.position}`
		case "Census":
			return `census:${cause.at}`
		case "Request":
			return "request"
	}
}

/** A wake to send, why it was rung, and how long the transport holds it before delivering it: an exact timer rides the delay. */
export interface Ring {
	readonly wake: Wake
	readonly delay: Duration.Duration
	readonly cause: Cause
}

/**
 * A ring's idempotency key: the wake and the cause that rang it, so two rings of one cause share a key and a transport
 * delivers them once, while a wake rung again by another cause (a later tick, another commit) is never dropped as a
 * duplicate of the first, whatever became of it. A duplicate delivery is harmless: the claim decides. A census wake is
 * its period's own, whoever rings it (the census before it, a cron, a write's revival), so its key is its wake alone,
 * and the rings of one period's census, from any number of chains, are one message.
 */
export const idempotencyKey = (ring: Pick<Ring, "wake" | "cause">): string => {
	switch (ring.wake._tag) {
		case "Census":
			return wakeText(ring.wake)
		case "Step":
		case "Admit":
			return `${wakeText(ring.wake)}@${causeText(ring.cause)}`
	}
}

/**
 * The doorbell. `send` never fails its caller: a wake it loses is healed by the relay or the census, so a transport logs
 * its own failures. A delivered wake is handed to the runtime, which always acknowledges it: its ending is the ledger's.
 */
export class Transport extends Context.Service<
	Transport,
	{ readonly send: (rings: ReadonlyArray<Ring>) => Effect.Effect<void> }
>()("@bjornpagen/den/transport") {}

/** A wake the in-process transport holds, with the instant of the caller's clock from which it may be delivered. */
export interface Held {
	readonly wake: Wake
	readonly at: number
}

/**
 * The in-process transport: wakes go into a list a driver in the same process takes them from, each once its delay has
 * passed on the caller's clock, so a flow runs without Vercel and a test's clock decides when a delayed wake lands. The
 * list is unbounded, because a wake is never dropped for want of room: it holds what was sent.
 */
export class InProcess extends Context.Service<
	InProcess,
	{ readonly held: Ref.Ref<ReadonlyArray<Held>> }
>()("@bjornpagen/den/transport/InProcess") {}

/** The in-process transport and its list, built together. */
export const inProcess: Layer.Layer<Transport | InProcess> = Layer.effectContext(
	Effect.map(Ref.make<ReadonlyArray<Held>>([]), (held) =>
		Context.make(InProcess, { held }).pipe(
			Context.add(Transport, {
				send: (rings) =>
					Effect.flatMap(Clock.currentTimeMillis, (millis) =>
						Ref.update(held, (list) => [
							...list,
							...Arr.map(rings, (ring) => ({
								wake: ring.wake,
								at: millis + Duration.toMillis(ring.delay)
							}))
						])
					)
			})
		)
	)
)
