import type * as g from "@bjornpagen/grizzle"
import * as gCompile from "@bjornpagen/grizzle/compile"
import type * as gRuntime from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Effect, Option, Order, Predicate, Result, Stream } from "effect"
import type { Due, Exclusive } from "#algebra/kinds.ts"
import { mintInstant } from "#lower/keys.ts"
import {
	atOnce,
	type Delay,
	delayOf,
	exclusiveId,
	framedText,
	type Instant
} from "#runtime/identity.ts"
import type { SpawnDue, Spawned } from "#runtime/ledger.ts"
import type { Settled } from "#runtime/settled.ts"

/**
 * What every printed binding shares (lower/print.ts) beside running each call settled (runtime/settled.ts): reading a
 * key member's one row, the database's instant and a read's rows, an array's elements in order and a value's tagged
 * unions, a spawn's due instant, a scope's exclusivity key and a derived root's key, and a watch's events as the
 * relay's signals.
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
 * A value the database holds by law, found: a value whose tagged unions each found the row of the variant its tag
 * names, or the input of a child a finish read the ending of, which every step and scope holds. None is a broken law,
 * and dies.
 */
export const held = <A>(value: Option.Option<A>): Effect.Effect<A> =>
	Option.match(value, {
		onNone: () => Effect.die("a value the database holds by law has no row"),
		onSome: (found) => Effect.succeed(found)
	})

/**
 * A commit's facts: den's own inserts, and the facts of the ChangeSet its step commits through, op by op, the inserts of
 * both under `insert`, as the union of den's ChangeSet with the step's holds the array members of both, each under its
 * own relation.
 */
export const committedFacts = <const D extends { readonly insert: object }, F extends object>(
	den: D,
	step: F
): D & F =>
	Predicate.hasProperty(step, "insert") && Predicate.isObject(step.insert)
		? { ...den, ...step, insert: { ...den.insert, ...step.insert } }
		: { ...den, ...step }

/**
 * The text of a row a step's read `query` found, grizzle's rowText of the query, the input of the row's digest. The query
 * is one grizzle made records of, so its text compiles, and each row is one the query delivered: a failure of either is
 * a broken contract, and dies.
 */
export const recordText = <Q extends g.RecordedQuery>(
	query: Q
): ((row: g.HeadOf<Q>) => Effect.Effect<string>) => {
	const texts = gCompile.rowText(query)
	return (row) =>
		Result.match(texts, {
			onFailure: (refused) => Effect.die(refused),
			onSuccess: (text) =>
				Result.match(text(row), {
					onFailure: (fault) => Effect.die(fault),
					onSuccess: (written) => Effect.succeed(written)
				})
		})
}

/** When a step of input `input` is first due, by its kind's declaration: a delay after its spawn, or its input's instant. */
export const dueOf = <I>(due: Due<I>, input: I): SpawnDue => {
	switch (due.kind) {
		case "spawned":
			return { kind: "after", delay: atOnce }
		case "after":
			return { kind: "after", delay: delayOf(due.millis) }
		case "at":
			return { kind: "at", instant: mintInstant(due.instant(input)) }
	}
}

/** A spawned step's row, as the call that spawns it names it: its key, its kind and its owning scope. */
export interface SpawnAt<K> {
	readonly step: g.Sha256
	readonly kind: K
	readonly scope: g.Sha256
}

/**
 * The steps a call spawns, by when each is first due: its `steps`, each due its delay after the call's reading of the
 * database's clock, which the statement adds, and its `timed`, each due at the instant its input holds.
 */
export interface SpawnRows<K> {
	readonly steps: ReadonlyArray<SpawnAt<K> & { readonly delay: Delay }>
	readonly timed: ReadonlyArray<SpawnAt<K> & { readonly due: Instant }>
}

/** A step a call spawns: its row among the call's `steps` or `timed`, by when it is due, and the step as spawned. */
export const spawnedOf = <K extends string>(
	at: SpawnAt<K>,
	due: SpawnDue
): SpawnRows<K> & { readonly spawned: Spawned } => {
	const spawned: Spawned = { steps: [{ step: at.step, kind: at.kind, due }], finishes: [] }
	switch (due.kind) {
		case "after":
			return { steps: [{ ...at, delay: due.delay }], timed: [], spawned }
		case "at":
			return { steps: [], timed: [{ ...at, due: due.instant }], spawned }
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
 * The exclusivity key rows of a scope of kind `kind` and input `input`: its key text and the seat's digest, none for a
 * shared scope kind.
 */
export const exclusiveRows = <I>(
	flow: string,
	kind: string,
	exclusive: Exclusive<I>,
	input: I,
	scope: g.Sha256
): ReadonlyArray<{ readonly scope: g.Sha256; readonly key: string; readonly id: g.Sha256 }> =>
	Arr.map(Option.toArray(exclusiveKey(exclusive, input)), (key) => ({
		scope,
		key,
		id: exclusiveId(flow, kind, key)
	}))

/**
 * The idempotency key of a derived root, its key's fields `fields` named by a request (`key`): each field's name and
 * its value's text, framed (runtime/identity.ts framedText), the fields in the order of their names, so a deploy that
 * only reorders the key's struct keeps every root's key. A key field holds a text, a bigint or a boolean
 * (lower/fragment.ts derivable), each of which `String` writes one way, so two keys share a text exactly where they are
 * equal; a schedule's root's key is its instant and its member.
 */
export const derivedKey = (
	fields: ReadonlyArray<string>,
	key: Readonly<Record<string, string | bigint | boolean>>
): string =>
	framedText(
		Arr.flatMap(Arr.sort(fields, Order.String), (field: string) => [field, String(key[field])])
	)

/**
 * A watch's events as the relay's signals: a change for every row event and `ready`, the CallError for `error`, and
 * nothing for `reset` and `end`.
 */
export const signals = <E extends { readonly _tag: string; readonly error?: gRuntime.CallError }>(
	events: Stream.Stream<E>
): Stream.Stream<Option.Option<gRuntime.CallError>> =>
	events.pipe(
		Stream.filter((event) => event._tag !== "reset" && event._tag !== "end"),
		Stream.map((event) => Option.fromNullishOr(event.error))
	)

/**
 * Whether a root's request started it: accepted, where no change means the root was already requested, whatever became
 * of its graph since, or, for a root whose input derives from its key, that its read derived none, so it stands
 * nowhere. A request inserts its Root and its graph's rows only where no Root holds its root (and, derived, where its
 * read finds its row), and its record keeps the key once its graph is cleared (lower/print.ts requestOfRoot), so a
 * request of a key already requested, a retired root's included, adds nothing, and one whose input it gives of another
 * input under its kind's same input heading is refused on its record's key (RequestedWith).
 */
export const fresh = (
	write: Effect.Effect<gRuntime.WriteOutcome<unknown>, Settled>
): Effect.Effect<boolean, Settled> => Effect.map(write, (outcome) => outcome._tag === "accepted")

/** Whether a read found any row. */
export const any = <A>(
	read: Effect.Effect<Iterable<A>, Settled>
): Effect.Effect<boolean, Settled> =>
	Effect.map(read, (rows) => Arr.isReadonlyArrayNonEmpty(Arr.fromIterable(rows)))
