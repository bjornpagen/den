import { censusPeriodSeconds } from "@bjornpagen/den/algebra/kinds"
import { censusRing } from "@bjornpagen/den/runtime/census"
import { caseHangMillis } from "@bjornpagen/den/test/support/suites"
import { idempotencyKey } from "@bjornpagen/den/transport"
import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { characterOf, type Gen, oneOf, option, string } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { assert, it } from "@effect/vitest"
import { Effect, Formatter, Option, Redacted } from "effect"
import { census } from "#census.ts"

/**
 * The census route: a request runs the tick exactly when its bearer is the cron secret, and answers 200 when the tick
 * succeeded, 500 when it failed, and 401, having run nothing, otherwise.
 *
 * Oracle (specification): Vercel Cron's `Authorization: Bearer <CRON_SECRET>`, compared whole.
 */

/** A cron secret, a request's authorization header, and whether the tick fails. */
interface Call {
	readonly secret: string
	readonly authorization: Option.Option<string>
	readonly fails: boolean
}

const token = string(characterOf(["a", "B", "0"]), { min: 1, max: 4 })

const call: Gen<Call> = (source) => {
	const secret = source.draw(token)
	return {
		secret,
		authorization: source.draw(
			option(
				oneOf([
					() => `Bearer ${secret}`,
					(s) => `Bearer ${s.draw(token)}`,
					() => secret,
					(s) => `Bearer ${secret}${s.draw(token)}`
				])
			)
		),
		fails: source.draw(oneOf([() => false, () => true]))
	}
}

type Answered = "ran and succeeded" | "ran and failed" | "refused"

it.effect("the census runs its tick only for the cron secret, and says how the tick went", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "census route",
				oracle: { kind: "specification", name: "Bearer <CRON_SECRET>, compared whole" },
				draw: drawn(call),
				literal: Formatter.format,
				coverage: required<Answered>(["ran and succeeded", "ran and failed", "refused"], {
					cases: 40,
					sense: notesOnly
				}),
				kept: [],
				runs: 200,
				shrink: boundedShrink(40),
				steerEvery: 16,
				caseHang: caseHangMillis
			},
			(drawnCall, c) =>
				Effect.gen(function* () {
					let ticks = 0
					const tick = Effect.suspend(() => {
						ticks += 1
						const ring = censusRing(ticks * censusPeriodSeconds * 1000)
						return drawnCall.fails
							? Effect.fail("unreadable ledger")
							: Effect.succeed({ at: ring.wake.at, key: idempotencyKey(ring) })
					})
					const route = yield* census(tick, Redacted.make(drawnCall.secret))
					const headers = Option.match(drawnCall.authorization, {
						onNone: (): Record<string, string> => ({}),
						onSome: (authorization): Record<string, string> => ({ authorization })
					})
					const response = yield* Effect.promise(() =>
						route(new Request("https://den.invalid/census", { headers }))
					)
					const authorized = Option.contains(drawnCall.authorization, `Bearer ${drawnCall.secret}`)
					const answered: Answered = authorized
						? drawnCall.fails
							? "ran and failed"
							: "ran and succeeded"
						: "refused"
					c.note(answered)
					assert.strictEqual(ticks, authorized ? 1 : 0)
					assert.strictEqual(
						response.status,
						answered === "refused" ? 401 : answered === "ran and failed" ? 500 : 200
					)
				})
		)
	)
)
