import { drawn, explore } from "@bjornpagen/testing/explore"
import { required } from "@bjornpagen/testing/features"
import { characterOf, type Gen, int, oneOf, option, string } from "@bjornpagen/testing/gen"
import { notesOnly } from "@bjornpagen/testing/sense"
import { boundedShrink } from "@bjornpagen/testing/shrink"
import { searched } from "@bjornpagen/testing/vitest"
import { caseHangMillis } from "@den/limits/suites"
import { functionLifetimeSeconds } from "@den/limits/vercel-functions"
import { maxDeliveries } from "@den/limits/vercel-queues"
import { assert, it } from "@effect/vitest"
import {
	Array as Arr,
	Effect,
	Exit,
	Formatter,
	Option,
	Record as Rec,
	Schema,
	String as Str
} from "effect"
import { check, fragment, type Routes } from "#config.ts"
import { TOPIC } from "#queue.ts"

/**
 * The vercel.json check: a host's file holding den's fragment beside the host's own entries passes, and one edit of it
 * is reported exactly when it changes what den owns: its functions' lifetimes, the consumer's one trigger, any other
 * consumer of den's topic, and the crons requesting the census path.
 *
 * Oracle (specification): which edits touch den, written from the check's rule apart from its code.
 */

/** An edit of a host's vercel.json. */
type Edit =
	| Readonly<{ kind: "consumer lifetime"; to: Option.Option<number> }>
	| Readonly<{ kind: "census lifetime"; to: Option.Option<number> }>
	| Readonly<{ kind: "consumer ceiling"; to: number }>
	| Readonly<{ kind: "consumer topic"; to: string }>
	| Readonly<{ kind: "consumer trigger removed" }>
	| Readonly<{ kind: "consumer retry delay"; seconds: number }>
	| Readonly<{ kind: "another consumer"; topic: string }>
	| Readonly<{ kind: "census schedule"; to: string }>
	| Readonly<{ kind: "census cron removed" }>
	| Readonly<{ kind: "census cron doubled" }>
	| Readonly<{ kind: "memory beside den's keys"; megabytes: number }>
	| Readonly<{ kind: "another cron"; path: string }>

/** A host's routes, and at most one edit of its file. */
interface Drawn {
	readonly routes: Routes
	readonly edit: Option.Option<Edit>
}

const word = string(characterOf(["a", "p", "i", "/"]), { min: 1, max: 4 })

/** A topic near den's: a prefix of it, sometimes a wildcard, sometimes off by its end. */
const topic: Gen<string> = (source) => {
	const prefix = Str.slice(0, source.draw(int(0, TOPIC.length)))(TOPIC)
	return `${prefix}${source.draw(oneOf([word, (s) => (s.draw(int(0, 1)) === 0 ? "*" : "")]))}`
}

const edit: Gen<Edit> = oneOf<Edit>([
	(s) => ({ kind: "consumer lifetime", to: s.draw(option(int(799, 801))) }),
	(s) => ({ kind: "census lifetime", to: s.draw(option(int(799, 801))) }),
	(s) => ({
		kind: "consumer ceiling",
		to: s.draw(int(maxDeliveries.value - 1, maxDeliveries.value + 1))
	}),
	(s) => ({ kind: "consumer topic", to: s.draw(topic) }),
	() => ({ kind: "consumer trigger removed" }),
	(s) => ({ kind: "consumer retry delay", seconds: s.draw(int(1, 120)) }),
	(s) => ({ kind: "another consumer", topic: s.draw(topic) }),
	(s) => ({ kind: "census schedule", to: `${s.draw(int(0, 2))} * * * *` }),
	() => ({ kind: "census cron removed" }),
	() => ({ kind: "census cron doubled" }),
	(s) => ({ kind: "memory beside den's keys", megabytes: s.draw(int(1024, 3009)) }),
	(s) => ({ kind: "another cron", path: `/${s.draw(word)}` })
])

const sketch: Gen<Drawn> = (source) => {
	const census: `/${string}` = `/${source.draw(word)}`
	return {
		routes: {
			consumer: `consumer/${source.draw(word)}/route.ts`,
			census: { file: `census/${source.draw(word)}/route.ts`, path: census }
		},
		edit: source.draw(option(edit))
	}
}

/** Whether a trigger's topic, a name or a trailing wildcard, takes den's topic: the rule, written apart. */
const consumesDen = (pattern: string): boolean =>
	Str.endsWith("*")(pattern) ? Str.startsWith(Str.slice(0, -1)(pattern))(TOPIC) : pattern === TOPIC

/** Whether an edit changes what den owns, given the census path. */
const touchesDen = (e: Edit, census: string): boolean => {
	switch (e.kind) {
		case "consumer lifetime":
		case "census lifetime":
			return !Option.contains(e.to, functionLifetimeSeconds.value)
		case "consumer ceiling":
			return e.to !== maxDeliveries.value
		case "consumer topic":
			return e.to !== TOPIC
		case "another consumer":
			return consumesDen(e.topic)
		case "census schedule":
			return true
		case "another cron":
			return e.path === census
		case "consumer trigger removed":
		case "consumer retry delay":
		case "census cron removed":
		case "census cron doubled":
			return true
		case "memory beside den's keys":
			return false
	}
}

type Json = { [key: string]: unknown }

/** The host's file: den's fragment, a consumer and a cron of the host's own, and a key of its own. */
const hostOf = (routes: Routes): Json => {
	const den = fragment(routes)
	return {
		framework: "nextjs",
		functions: {
			...den.functions,
			"orders/route.ts": { experimentalTriggers: [{ type: "queue/v2beta", topic: "orders" }] }
		},
		crons: [...den.crons, { path: "/api/daily", schedule: "0 7 * * *" }]
	}
}

const record = (value: unknown): Json =>
	typeof value === "object" && value !== null ? { ...value } : {}

/** An edit applied to the host's file. */
const applied = (config: Json, e: Edit, routes: Routes): Json => {
	const functions = record(config["functions"])
	const crons: ReadonlyArray<unknown> = Arr.isArray(config["crons"]) ? config["crons"] : []
	const withFunction = (file: string, change: (entry: Json) => Json): Json => ({
		...config,
		functions: { ...functions, [file]: change(record(functions[file])) }
	})
	const withTrigger = (change: (trigger: Json) => Json): Json =>
		withFunction(routes.consumer, (entry) => ({
			...entry,
			experimentalTriggers: Arr.map(
				Arr.isArray(entry["experimentalTriggers"]) ? entry["experimentalTriggers"] : [],
				(trigger) => change(record(trigger))
			)
		}))
	const lifetime = (file: string, to: Option.Option<number>): Json =>
		withFunction(file, (entry) =>
			Option.match(to, {
				onNone: () => Rec.remove(entry, "maxDuration"),
				onSome: (seconds) => ({ ...entry, maxDuration: seconds })
			})
		)
	const isCensus = (cron: unknown): boolean => record(cron)["path"] === routes.census.path
	switch (e.kind) {
		case "consumer lifetime":
			return lifetime(routes.consumer, e.to)
		case "census lifetime":
			return lifetime(routes.census.file, e.to)
		case "consumer ceiling":
			return withTrigger((trigger) => ({ ...trigger, maxDeliveries: e.to }))
		case "consumer topic":
			return withTrigger((trigger) => ({ ...trigger, topic: e.to }))
		case "consumer trigger removed":
			return withFunction(routes.consumer, (entry) => ({ ...entry, experimentalTriggers: [] }))
		case "consumer retry delay":
			return withTrigger((trigger) => ({ ...trigger, retryAfterSeconds: e.seconds }))
		case "another consumer":
			return withFunction("other/route.ts", () => ({
				experimentalTriggers: [{ type: "queue/v2beta", topic: e.topic }]
			}))
		case "census schedule":
			return {
				...config,
				crons: Arr.map(crons, (cron) =>
					isCensus(cron) ? { ...record(cron), schedule: e.to } : cron
				)
			}
		case "census cron removed":
			return { ...config, crons: Arr.filter(crons, (cron) => !isCensus(cron)) }
		case "census cron doubled":
			return { ...config, crons: [...crons, ...Arr.filter(crons, isCensus)] }
		case "memory beside den's keys":
			return withFunction(routes.consumer, (entry) => ({ ...entry, memory: e.megabytes }))
		case "another cron":
			return { ...config, crons: [...crons, { path: e.path, schedule: "0 * * * *" }] }
	}
}

type Checked = "den's file passes" | "an edit of den's entries" | "an edit of the host's own"

it.effect("the check reports exactly the edits of den's entries", (ctx) =>
	searched(
		ctx,
		explore(
			{
				suite: "vercel.json check",
				oracle: {
					kind: "specification",
					name: "the edits that change what den owns, written apart"
				},
				draw: drawn(sketch),
				literal: Formatter.format,
				coverage: required<Checked>(
					["den's file passes", "an edit of den's entries", "an edit of the host's own"],
					{ cases: 40, sense: notesOnly }
				),
				kept: [],
				runs: 200,
				shrink: boundedShrink(40),
				steerEvery: 16,
				caseHang: caseHangMillis.value
			},
			({ routes, edit: drawnEdit }, c) =>
				Effect.gen(function* () {
					const edited = Option.match(drawnEdit, {
						onNone: () => hostOf(routes),
						onSome: (e) => applied(hostOf(routes), e, routes)
					})
					const text = yield* Effect.orDie(
						Schema.encodeEffect(Schema.fromJsonString(Schema.Unknown))(edited)
					)
					const exit = yield* Effect.exit(check(text, routes))
					const touched = Option.exists(drawnEdit, (e) => touchesDen(e, routes.census.path))
					c.note(
						touched
							? "an edit of den's entries"
							: Option.isSome(drawnEdit)
								? "an edit of the host's own"
								: "den's file passes"
					)
					assert.strictEqual(
						Exit.isFailure(exit),
						touched,
						Formatter.format({ edit: drawnEdit, exit })
					)
				})
		)
	)
)
