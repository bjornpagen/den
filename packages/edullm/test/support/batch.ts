import { int } from "@den/testing/gen"
import { Array as Arr, Effect } from "effect"
import { AlphaTestApi, type Answered, classify, type Request } from "#alphatest.ts"
import {
	type Controller,
	controllerOf,
	type Flow,
	flowOf,
	type Rules,
	type Sent,
	windowOf
} from "#flow-control.ts"
import type { Nature } from "#nature.ts"

/** One of the controller's transitions on a read's end, with the controller before and after it. */
export type Transition = Readonly<{
	event: "delivered" | "congested" | "settled"
	sent: Sent
	before: Controller
	after: Controller
}>

/** A batch's end: the flow it reports, every transition, and how its reads ended. */
type Batch = Readonly<{
	flow: Flow
	transitions: ReadonlyArray<Transition>
	finals: number
	unfinished: number
}>

type InFlight = Readonly<{ answered: Answered; sent: Sent }>

/** How a read's end moves the controller: a final answer delivers, a refused credential settles, anything else is the source's load. */
const endOf = (answered: Answered): Transition["event"] => {
	if (answered.response._tag === "TransportFailed") {
		return "congested"
	}
	const classified = classify(answered.response.status)
	if (classified.finality === "final") {
		return "delivered"
	}
	return classified.cause === "credential" ? "settled" : "congested"
}

/**
 * A batch of reads through the controller, as edullm's `fetchAll` runs one: a request starts whenever one ends, up to
 * the window; each read's end is a delivery (a final answer), a congestion signal (the throttle, a transient status, the
 * transport failing) or neither (a refused credential). Time is the fake's: the batch moves to each read's completion
 * in order. The uniform draws BBR's probe wait takes come from the nature.
 */
export const batchOf = (
	rules: Rules,
	items: ReadonlyArray<Request>,
	flow: Flow,
	startAt: number,
	nature: Nature
) =>
	Effect.gen(function* () {
		const api = yield* AlphaTestApi
		const control = controllerOf(rules)
		const uniform = () => nature.draw(int(0, 999)) / 1000
		let controller = control.start(flow, startAt, uniform())
		let now = startAt
		let next = 0
		const pending: Array<InFlight> = []
		const transitions: Array<Transition> = []
		let finals = 0
		let unfinished = 0
		for (;;) {
			for (const item of Arr.take(
				Arr.drop(items, next),
				Math.max(0, windowOf(controller) - pending.length)
			)) {
				const [sending, sent] = control.send(controller, now, pending.length + 1)
				controller = sending
				const answered = yield* api.read(item, now)
				pending.push({ answered, sent })
				next += 1
			}
			if (!Arr.isReadonlyArrayNonEmpty(pending)) {
				break
			}
			const first = Arr.reduce(pending, Arr.headNonEmpty(pending), (earliest, read) =>
				read.answered.at < earliest.answered.at ||
				(read.answered.at === earliest.answered.at && read.sent.seq < earliest.sent.seq)
					? read
					: earliest
			)
			pending.splice(pending.indexOf(first), 1)
			now = Math.max(now, first.answered.at)
			const before = controller
			const event = endOf(first.answered)
			switch (event) {
				case "delivered":
					finals += 1
					controller = control.delivered(controller, first.sent, now, uniform(), pending.length)
					break
				case "settled":
					unfinished += 1
					controller = control.settled(controller, first.sent)
					break
				case "congested":
					unfinished += 1
					controller = control.congested(controller, first.sent, now, uniform())
					break
			}
			transitions.push({ event, sent: first.sent, before, after: controller })
		}
		return {
			flow: flowOf(controller),
			transitions,
			finals,
			unfinished
		} satisfies Batch
	})
