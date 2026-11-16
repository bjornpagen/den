import type { CallError, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, type Cron, Effect, Option, Stream } from "effect"
import type { Digest } from "effect/crypto"
import type { Due, Exclusive, Trigger } from "#algebra/kinds.ts"
import { exclusiveId, type Instant, instantOf, type ScopeKey } from "#runtime/identity.ts"

/**
 * What every printed binding shares (lower/print.ts): reading a key member's one row, the database's instant and a
 * read's rows, a spawn's due instant, a scope's exclusivity key and a root's schedule, and a watch's events as the
 * relay's signals.
 */

/** The one row a key member found, if it found one. */
export const one = <A>(rows: Iterable<A>): Option.Option<A> => Arr.head(Arr.fromIterable(rows))

/**
 * The instant a clocked read of the database's clock answered, its one row's `now`: a query of no relation that finds
 * a parameter answers exactly one row.
 */
export const readingOf = <I>(rows: Iterable<{ readonly now: I }>): Effect.Effect<I> =>
	Option.match(one(rows), {
		onNone: () => Effect.die("a clocked read of the database's instant answered no row"),
		onSome: (row) => Effect.succeed(row.now)
	})

/** A read's rows, as an array. */
export const rowsOf = <A>(rows: Iterable<A>): ReadonlyArray<A> => Arr.fromIterable(rows)

/** The instant a step spawned at `at` is first due. */
export const dueAt = (due: Due, at: Instant): Instant => {
	switch (due.kind) {
		case "spawned":
			return at
		case "after":
			return instantOf(Number(at) + due.millis)
	}
}

/** The exclusivity key a scope of input `input` holds, none for a shared scope kind. */
export const exclusiveKey = <I>(exclusive: Exclusive<I>, input: I): Option.Option<string> => {
	switch (exclusive.kind) {
		case "shared":
			return Option.none()
		case "exclusive":
			return Option.some(exclusive.key(input))
	}
}

/**
 * The exclusivity key rows of a scope of kind `kind` and input `input`: its key text and the seat's uuid, none for a
 * shared scope kind.
 */
export const exclusiveRows = <I>(
	flow: string,
	kind: string,
	exclusive: Exclusive<I>,
	input: I,
	scope: ScopeKey
) =>
	Option.match(exclusiveKey(exclusive, input), {
		onNone: () => Effect.succeed([]),
		onSome: (key) => Effect.map(exclusiveId(flow, kind, key), (id) => [{ scope, key, id }])
	}) satisfies Effect.Effect<ReadonlyArray<unknown>, never, Digest.Digest>

/** A root kind's schedule, none for a root an operator or the app starts. */
export const scheduleOf = <I>(
	trigger: Trigger<I>
): Option.Option<{ readonly cron: Cron.Cron; readonly input: (at: bigint) => I }> => {
	switch (trigger.kind) {
		case "schedule":
			return Option.some({ cron: trigger.cron, input: trigger.input })
		case "operator":
		case "app":
			return Option.none()
	}
}

/**
 * A watch's events as the relay's signals: a change for every row event and `ready`, the CallError for `error`, and
 * nothing for `reset` and `end`.
 */
export const signals = <E extends { readonly kind: string; readonly error?: CallError }>(
	events: Stream.Stream<E>
): Stream.Stream<Option.Option<CallError>> =>
	events.pipe(
		Stream.filter((event) => event.kind !== "reset" && event.kind !== "end"),
		Stream.map((event) => Option.fromNullishOr(event.error))
	)

/**
 * Whether a root's request started it: accepted, or no change or a refusal on the root's key, another request's under
 * the same key with its own instant, either of which means the root was already requested.
 */
export const fresh = (
	flow: string,
	write: Effect.Effect<WriteOutcome<unknown>, CallError>
): Effect.Effect<boolean, CallError> =>
	write.pipe(
		Effect.map((outcome) => outcome.kind === "accepted"),
		Effect.catchIf(
			(error: CallError) =>
				error.kind === "refused" &&
				Arr.some(
					error.refused.laws,
					({ law }) => law.kind === "primaryKey" && law.relation === `${flow}Root`
				),
			() => Effect.succeed(false)
		)
	)

/** Whether a read found any row. */
export const any = <A>(
	read: Effect.Effect<Iterable<A>, CallError>
): Effect.Effect<boolean, CallError> =>
	Effect.map(read, (rows) => Arr.isReadonlyArrayNonEmpty(Arr.fromIterable(rows)))
