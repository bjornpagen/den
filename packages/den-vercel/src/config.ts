import { censusStepMinutes } from "@den/limits/vercel-cron"
import { functionLifetimeSeconds } from "@den/limits/vercel-functions"
import { maxDeliveries } from "@den/limits/vercel-queues"
import {
	Array as Arr,
	Effect,
	Equal,
	Formatter,
	Option,
	Record as Rec,
	Schema,
	String as Str
} from "effect"
import { TOPIC } from "#queue.ts"

/**
 * den's part of a host's `vercel.json`, which cannot import TypeScript: the one queue trigger, the census cron, and
 * both functions' lifetimes, rendered from den's limits, and the check a host's own repository check calls, so the
 * file that Vercel reads never drifts from the limits den's runtime assumes.
 */

/**
 * Where a host serves den: the consumer's route file, as `functions` names it, and the census route's file and the
 * path Vercel Cron requests. They are two routes: a queue consumer has no URL, and a cron requests one.
 */
export interface Routes {
	readonly consumer: string
	readonly census: Readonly<{ file: string; path: `/${string}` }>
}

/** den's queue trigger: the one topic, and a finite ceiling of deliveries; the retry delay is Vercel's default. */
export interface Trigger {
	readonly type: "queue/v2beta"
	readonly topic: string
	readonly maxDeliveries: number
}

/** The consumer's function: its lifetime and its one trigger. */
export interface ConsumerFunction {
	readonly maxDuration: number
	readonly experimentalTriggers: readonly [Trigger]
}

/** The census route's function: its lifetime. */
export interface CensusFunction {
	readonly maxDuration: number
}

/** A Vercel Cron job: the path it requests and when. */
export interface CronJob {
	readonly path: string
	readonly schedule: string
}

/** den's part of `vercel.json`, by key as the file holds it. */
export interface Fragment {
	readonly functions: Readonly<Record<string, ConsumerFunction | CensusFunction>>
	readonly crons: readonly [CronJob]
}

/** The census's tick: once per census period, the finest interval Vercel Cron runs on Pro. */
const CENSUS_SCHEDULE = `*/${censusStepMinutes.value} * * * *`

/**
 * den's consumer: it lives as long as Vercel lets an invocation live, which every lease and budget of den's runtime
 * assumes (Vercel's default is shorter), on the one topic, every wake delivered at most `maxDeliveries` times.
 */
const CONSUMER: ConsumerFunction = {
	maxDuration: functionLifetimeSeconds.value,
	experimentalTriggers: [{ type: "queue/v2beta", topic: TOPIC, maxDeliveries: maxDeliveries.value }]
}

/** The census route: an invocation's whole lifetime for a tick of every flow. */
const CENSUS: CensusFunction = { maxDuration: functionLifetimeSeconds.value }

/** den's fragment for a host's routes. */
export const fragment = (routes: Routes): Fragment => ({
	functions: { [routes.consumer]: CONSUMER, [routes.census.file]: CENSUS },
	crons: [{ path: routes.census.path, schedule: CENSUS_SCHEDULE }]
})

/** A host's `vercel.json` that is no JSON, or whose functions or crons are not as Vercel reads them. */
export class VercelConfigUnreadable extends Schema.TaggedError<
	VercelConfigUnreadable,
	{ readonly brand: unique symbol }
>()("VercelConfigUnreadable", { issue: Schema.String }) {}

/** A host's `vercel.json` whose den entries differ from den's fragment, each difference as `subject: expected, actual`. */
export class VercelConfigStale extends Schema.TaggedError<
	VercelConfigStale,
	{ readonly brand: unique symbol }
>()("VercelConfigStale", { differences: Schema.Array(Schema.String) }) {}

/** A host's function as den reads it: the two keys den sets, as written, whatever else the host sets beside them. */
const HostFunction = Schema.Struct({
	maxDuration: Schema.optionalKey(Schema.Unknown),
	experimentalTriggers: Schema.optionalKey(Schema.Array(Schema.Unknown))
})

/** A trigger on a queue topic, as a function of the host's names it. */
const TopicTrigger = Schema.Struct({ topic: Schema.String })

const HostConfig = Schema.fromJsonString(
	Schema.Struct({
		functions: Schema.Record(Schema.String, HostFunction).pipe(
			Schema.withDecodingDefaultKey(Effect.succeed({}))
		),
		crons: Schema.Array(Schema.Struct({ path: Schema.String, schedule: Schema.String })).pipe(
			Schema.withDecodingDefaultKey(Effect.succeed([]))
		)
	})
)

/** Whether a trigger's topic, a name or a trailing wildcard, takes den's topic. */
const takesTopic = (pattern: string): boolean =>
	pattern === TOPIC ||
	(Str.endsWith("*")(pattern) && Str.startsWith(Str.slice(0, -1)(pattern))(TOPIC))

const differenceOf = (subject: string, expected: unknown, actual: unknown): ReadonlyArray<string> =>
	Equal.equals(expected, actual)
		? []
		: [
				`${subject}\n  expected: ${Formatter.format(expected)}\n  actual:   ${Formatter.format(actual)}`
			]

/**
 * Holds a host's `vercel.json` text to den's fragment: den's two functions set their lifetimes and the consumer its
 * one trigger exactly as the fragment does (the host's other keys on them are its own); no other function consumes
 * den's topic, since every consumer group receives a copy of every wake; and the census path is requested by exactly
 * the fragment's cron.
 */
export const check = (
	text: string,
	routes: Routes
): Effect.Effect<void, VercelConfigUnreadable | VercelConfigStale> =>
	Effect.gen(function* () {
		const config = yield* Effect.mapError(Schema.decodeEffect(HostConfig)(text), (issue) =>
			VercelConfigUnreadable.make({ issue: issue.message })
		)
		const functionAt = (file: string) => Option.getOrUndefined(Rec.get(config.functions, file))
		const consumer = functionAt(routes.consumer)
		const census = functionAt(routes.census.file)
		const intruders = Arr.flatMap(Rec.toEntries(config.functions), ([file, entry]) =>
			file !== routes.consumer &&
			Arr.some(
				entry.experimentalTriggers ?? [],
				(trigger) => Schema.is(TopicTrigger)(trigger) && takesTopic(trigger.topic)
			)
				? [
						`functions[${Formatter.format(file)}] consumes ${TOPIC}: its consumer group would receive a copy of every wake`
					]
				: []
		)
		const differences = [
			...differenceOf(
				`functions[${Formatter.format(routes.consumer)}].maxDuration`,
				CONSUMER.maxDuration,
				consumer?.maxDuration
			),
			...differenceOf(
				`functions[${Formatter.format(routes.consumer)}].experimentalTriggers`,
				CONSUMER.experimentalTriggers,
				consumer?.experimentalTriggers
			),
			...differenceOf(
				`functions[${Formatter.format(routes.census.file)}].maxDuration`,
				CENSUS.maxDuration,
				census?.maxDuration
			),
			...intruders,
			...differenceOf(
				`crons requesting ${routes.census.path}`,
				fragment(routes).crons,
				Arr.filter(config.crons, (cron) => cron.path === routes.census.path)
			)
		]
		if (Arr.isReadonlyArrayNonEmpty(differences)) {
			return yield* VercelConfigStale.make({ differences })
		}
	})
