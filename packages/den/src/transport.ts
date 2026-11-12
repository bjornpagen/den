import { Context, Effect, Layer, Queue, Schema } from "effect"

/**
 * The wake contract every transport meets. A wake is a doorbell: the ledger is the only authority, so a lost,
 * duplicated or late wake costs nothing (a lost one is healed by the census, a duplicate loses its claim's key race).
 */

/** A lane's declared name, as a wake carries it. */
export const LaneName = Schema.String.pipe(Schema.brand("den/LaneName"))
export type LaneName = typeof LaneName.Type

/** A step's key as text: the uuid den derives for it, five hyphenated groups, branded as the ledger's DenStep. */
export const StepText = Schema.TemplateLiteral([
	Schema.String,
	"-",
	Schema.String,
	"-",
	Schema.String,
	"-",
	Schema.String,
	"-",
	Schema.String
])
	.check(Schema.isUUID())
	.pipe(Schema.brand("DenStep"))
export type StepText = typeof StepText.Type

/** The claim attempt a wake rings for: an integer of at least 1. */
export const AttemptNumber = Schema.Int.check(Schema.isGreaterThanOrEqualTo(1)).pipe(
	Schema.brand("den/Attempt")
)
export type AttemptNumber = typeof AttemptNumber.Type

/** A wake: the lane, the step and the attempt it rings for. Decoded once, at a consumer's boundary. */
export const WakeSchema = Schema.Struct({ lane: LaneName, step: StepText, attempt: AttemptNumber })
export type Wake = typeof WakeSchema.Type

/** A wake's idempotency key, `${lane}:${step}:${attempt}`: one per step attempt, so a transport delivers it once. */
export const idempotencyKey = (wake: Wake): string => `${wake.lane}:${wake.step}:${wake.attempt}`

/**
 * The doorbell. `send` never fails its caller: a wake it loses is healed by the census, so a transport logs its own
 * failures. A delivered wake is handed to the runtime, which always acknowledges it: its ending is the ledger's.
 */
export class Transport extends Context.Service<
	Transport,
	{ readonly send: (wakes: ReadonlyArray<Wake>) => Effect.Effect<void> }
>()("@bjornpagen/den/transport") {}

/**
 * The in-process transport: wakes go into an unbounded queue a driver in the same process takes them from, so a flow
 * runs without Vercel. Unbounded, because a wake is never dropped for want of room: the queue holds what was sent.
 */
export class InProcess extends Context.Service<InProcess, { readonly queue: Queue.Queue<Wake> }>()(
	"@bjornpagen/den/transport/InProcess"
) {}

/** The in-process transport and its queue, built together. */
export const inProcess: Layer.Layer<Transport | InProcess> = Layer.effectContext(
	Effect.map(Queue.unbounded<Wake>(), (queue) =>
		Context.make(InProcess, { queue }).pipe(
			Context.add(Transport, {
				send: (wakes) => Queue.offerAll(queue, wakes).pipe(Effect.asVoid)
			})
		)
	)
)
