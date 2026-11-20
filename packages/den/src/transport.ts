import { regex } from "arkregex"
import { Array as Arr, Clock, Context, Duration, Effect, Layer, Ref, Schema } from "effect"

/**
 * The wake contract every transport meets. A wake is a doorbell: the ledger is the only authority, so a lost,
 * duplicated or late wake costs nothing (a lost one is healed by the relay or the census, a duplicate loses its key
 * race). It names its flow, so one consumer serves every flow an app runs, and what it rings: a step's attempt, or a
 * scope's admission.
 */

/** A flow's declared name, the prefix of everything it lowers to, as a wake carries it. */
export const FlowName = Schema.String.pipe(Schema.brand("den/FlowName"))
export type FlowName = typeof FlowName.Type

/** A SHA-256 digest's text, 64 lowercase hex digits, as den derives a key (runtime/identity.ts) and grizzle's `sha256`
 * holds it. */
const DigestText = Schema.String.check(Schema.isPattern(regex("^[0-9a-f]{64}$")))

/** A step's key as text: the digest den derives for it, branded as the ledger's DenStep. */
export const StepText = DigestText.pipe(Schema.brand("DenStep"))
export type StepText = typeof StepText.Type

/** A scope's key as text: the digest den derives for it, branded as the ledger's DenScope. */
export const ScopeText = DigestText.pipe(Schema.brand("DenScope"))
export type ScopeText = typeof ScopeText.Type

/** The claim attempt a wake rings for: its place among the step's claims, from 0. */
export const AttemptNumber = Schema.Int.check(Schema.isGreaterThanOrEqualTo(0)).pipe(
	Schema.brand("den/Attempt")
)
export type AttemptNumber = typeof AttemptNumber.Type

/** A wake for one attempt of a step. */
export const StepWake = Schema.TaggedStruct("Step", {
	flow: FlowName,
	step: StepText,
	attempt: AttemptNumber
})

/** A wake for a scope's admission: its exclusivity seat, its precondition, then its start. */
export const AdmitWake = Schema.TaggedStruct("Admit", { flow: FlowName, scope: ScopeText })

/** A wake: a step's attempt or a scope's admission. Decoded once, at a consumer's boundary. */
export const WakeSchema = Schema.Union([StepWake, AdmitWake])
export type Wake = typeof WakeSchema.Type

/** What a wake names, as text: its flow, and the step's attempt or the scope it rings. */
export const wakeText = (wake: Wake): string => {
	switch (wake._tag) {
		case "Step":
			return `${wake.flow}:step:${wake.step}:${wake.attempt}`
		case "Admit":
			return `${wake.flow}:admit:${wake.scope}`
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
 * duplicate of the first, whatever became of it. A duplicate delivery is harmless: the claim decides.
 */
export const idempotencyKey = (ring: Pick<Ring, "wake" | "cause">): string =>
	`${wakeText(ring.wake)}@${causeText(ring.cause)}`

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
