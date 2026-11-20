import type { CallError, Settled, WriteOutcome } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, type Cron, Effect, Option, Order, Stream } from "effect"
import type { Digest } from "effect/crypto"
import type { Due, Exclusive, Trigger } from "#algebra/kinds.ts"
import { exclusiveId, type Instant, instantOf, type ScopeKey } from "#runtime/identity.ts"
import { refusedOnKey } from "#runtime/ledger.ts"

/**
 * What every printed binding shares (lower/print.ts): every call settled, reading a key member's one row, the
 * database's instant and a read's rows, an array's elements in order and a value's tagged unions, a spawn's due
 * instant, a scope's exclusivity key and a root's schedule, and a watch's events as the relay's signals.
 */

/** The one row a key member found, if it found one. */
export const one = <A>(rows: Iterable<A>): Option.Option<A> => Arr.head(Arr.fromIterable(rows))

/**
 * The one row a read of exactly one row answered (a clocked read of the database's instant, a step's record of reads):
 * none is a broken contract, and dies.
 */
export const only = <A>(rows: Iterable<A>): Effect.Effect<A> =>
	Option.match(one(rows), {
		onNone: () => Effect.die("a read of exactly one row answered none"),
		onSome: (row) => Effect.succeed(row)
	})

/** The instant a clocked read of the database's clock answered, its one row's `now`. */
export const readingOf = <I>(rows: Iterable<{ readonly now: I }>): Effect.Effect<I> =>
	Effect.map(only(rows), (row) => row.now)

/** A read's rows, as an array. */
export const rowsOf = <A>(rows: Iterable<A>): ReadonlyArray<A> => Arr.fromIterable(rows)

/** An ordered family's rows, an array's elements, in their order. */
export const ordered = <A extends { readonly ordinal: bigint }>(
	rows: Iterable<A>
): ReadonlyArray<A> =>
	Arr.sort(
		Arr.fromIterable(rows),
		Order.mapInput(Order.BigInt, (row: A) => row.ordinal)
	)

/**
 * A value whose tagged unions each found the row of the variant its tag names, which the database holds there by law:
 * none is a broken law, and dies.
 */
export const held = <A>(value: Option.Option<A>): Effect.Effect<A> =>
	Option.match(value, {
		onNone: () => Effect.die("a tagged union's tag names a variant with no row"),
		onSome: (found) => Effect.succeed(found)
	})

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
 * the same key with its own instant, either of which means the root was already requested, whatever became of its graph
 * since: its header keeps the key once its graph is retired, so a retired root's request again is answered so too.
 */
export const fresh = (
	flow: string,
	write: Effect.Effect<WriteOutcome<unknown>, Settled>
): Effect.Effect<boolean, Settled> =>
	write.pipe(
		Effect.map((outcome) => outcome.kind === "accepted"),
		Effect.catchIf(
			(error: Settled) => refusedOnKey(error, [`${flow}Root`]),
			() => Effect.succeed(false)
		)
	)

/** Whether a read found any row. */
export const any = <A>(
	read: Effect.Effect<Iterable<A>, Settled>
): Effect.Effect<boolean, Settled> =>
	Effect.map(read, (rows) => Arr.isReadonlyArrayNonEmpty(Arr.fromIterable(rows)))
