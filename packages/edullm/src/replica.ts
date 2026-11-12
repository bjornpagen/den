import { type Gen, int } from "@den/testing/gen"
import { Array as Arr, Context, Effect, HashMap, Layer, Option, Ref, Schema } from "effect"
import { Digest } from "effect/crypto"
import { bodyOf, FieldCount, PGCOPY, type Tuple } from "#copy-binary.ts"
import { digestOf, type Mark, markOf, type Print, printOf } from "#fingerprint.ts"
import type { Nature } from "#nature.ts"
import type { Range } from "#ranges.ts"

/**
 * Timeback's read replica as edullm's W1 meets it: PostgreSQL behind a shared SSM bastion, read by `COPY … TO STDOUT
 * (FORMAT binary)` one page of heap blocks at a time, a daily print of per-bucket key fingerprints, and the keys of the
 * buckets a prune names. Every statement runs on a bastion session; the bastion is shared with other principals, and
 * the operator's hold on it is its seats. A statement takes as long as its bytes or keys take at the session's share
 * of the bastion, and one that would outlast the session's statement timeout is cancelled by the server (SQLSTATE
 * 57014): a page too large must split. Every call takes the instant it starts at and answers the instant it ended.
 */

/** A row of a relation: its key's text, the rest of its columns as one payload, and when it last changed. */
export type Row = Readonly<{ key: string; payload: Uint8Array; changedAt: number }>

/** A relation's heap: its blocks in order, each the rows it holds. */
export type Heap = ReadonlyArray<ReadonlyArray<Row>>

/** Every COPY this fake answers has two columns: the key's text and the payload. */
export const ROW_FIELDS = FieldCount.make(2)

const tupleOf = (row: Row): Tuple => [
	Option.some(new TextEncoder().encode(row.key)),
	Option.some(row.payload)
]

/** The binary COPY body the replica writes for rows. */
export const pageBodyOf = (rows: ReadonlyArray<Row>): Uint8Array =>
	bodyOf(PGCOPY, 0, Arr.map(rows, tupleOf))

/**
 * The bastion's capacity as the operator holds it, and the replica's rates through it at that hold.
 *
 * @limitKind measured
 * @owner the shared Timeback SSM bastion, held by edullm's operator
 * @unit sessions; bytes a second; keys a second
 * @scope the Timeback replica fake's bastion
 * @evidence edullm `packages/platform/pipeline/src/limits.ts` `LANE_WIDTHS.timeback` and `PRUNE_FETCH_KEYS`, and den's
 * `docs/research/edullm-kernel.md` §3.2 and §5
 * @observed 2026-09-16 06:37–07:37Z (the eight-slot trial); 2026-10-15T17:41Z (the key rate)
 * @environment Vercel production iad1, Timeback's Aurora PostgreSQL 17.7 through the shared us-east-1 SSM bastion
 * @workload eight concurrent COPY sessions of whole relations (545 COPY attempts, 538 pages); `resources`' key scan,
 * 2,490,370 keys, with eight leases on the bastion
 * @result 18,820,212,728 bytes in the hour, 5,227,836.87 bytes a second, bastion CPU 67.41% mean and 71.16% max; 2,490,370
 * keys in 178,630 ms, 13,941 keys a second a lease
 * @decision eight seats, the operator's 60–70% CPU band; a session's share is the hour's bytes over the eight, and a
 * session past the eighth shares the same bytes with every other session open
 * @revalidate a bastion CPU above 70% at eight sessions, or a widening trial (mean CPU ≤ 60% and ≤ 11 sessions)
 */
export type Bastion = Readonly<{
	seats: number
	bytesPerSecond: number
	keysPerSecondPerSession: number
}>

/** The bastion as the operator held it on 2026-09-16 and 2026-10-15 (`Bastion`'s evidence). */
export const MEASURED_BASTION: Bastion = {
	seats: 8,
	bytesPerSecond: 5_227_836.87,
	keysPerSecondPerSession: 13_941
}

/** What a statement meets on its own: nothing, or one of the failures edullm's copy ladder names. */
export type Weather =
	| Readonly<{ _tag: "Clear" }>
	| Readonly<{
			_tag: "Failed"
			cause: "transport" | "recovery-conflict" | "admin-shutdown" | "resources"
	  }>

/** One replica as a simulation draws it: its relations, the bastion, and the weather each statement meets. */
export type World = Readonly<{
	relations: HashMap.HashMap<string, Heap>
	bastion: Bastion
	weather: Gen<Weather>
}>

/** A statement's failure, by the cause edullm's copy ladder settles: a timeout or a resource error splits a page. */
export class CopyFailed extends Schema.TaggedError<CopyFailed, { readonly brand: unique symbol }>()(
	"CopyFailed",
	{
		cause: Schema.Literals([
			"statement-timeout",
			"resources",
			"transport",
			"recovery-conflict",
			"admin-shutdown",
			"undefined-object"
		]),
		at: Schema.Finite
	}
) {}

/** A bastion session: the seat of one statement at a time, with the statement timeout it was opened with. */
export type Session = Readonly<{ id: number; statementTimeoutMillis: number }>

/** What the replica's catalog says of a relation at admission: its heap blocks, its bytes per block, its columns. */
export type Catalog = Readonly<{ blocks: number; bytesPerBlock: number; fields: FieldCount }>

/** A `changes` read's clock filter: rows changed at or after `since` and before `before`, the print's instant. */
export type Changes = Readonly<{ since: number; before: number }>

/** A page's answer: its binary COPY body, in the chunks the stream delivered, and the instant it ended. */
export type Copied = Readonly<{ chunks: ReadonlyArray<Uint8Array>; at: number }>

/** A key of a relation with its digest's mark, as the print and the prune read it. */
export type Key = Readonly<{ text: string; mark: Mark }>

/** One open or close of a bastion session, and how many were open after it. */
export type Seating = Readonly<{
	session: number
	at: number
	open: number
	event: "opened" | "closed"
}>

/** The fake replica and its bastion. */
export class TimebackReplica extends Context.Service<
	TimebackReplica,
	{
		readonly open: (at: number, statementTimeoutMillis: number) => Effect.Effect<Session>
		readonly close: (session: Session, at: number) => Effect.Effect<void>
		readonly catalog: (relation: string, at: number) => Effect.Effect<Catalog, CopyFailed>
		readonly page: (
			session: Session,
			relation: string,
			blocks: Range,
			changes: Option.Option<Changes>,
			at: number
		) => Effect.Effect<Copied, CopyFailed>
		readonly print: (
			session: Session,
			relation: string,
			at: number
		) => Effect.Effect<Readonly<{ print: Print; printedAt: number; at: number }>, CopyFailed>
		readonly bucketKeys: (
			session: Session,
			relation: string,
			buckets: ReadonlyArray<number>,
			at: number
		) => Effect.Effect<Readonly<{ keys: ReadonlyArray<Key>; at: number }>, CopyFailed>
		readonly edit: (relation: string, edit: Edit) => Effect.Effect<void>
		readonly seatings: Effect.Effect<ReadonlyArray<Seating>>
	}
>()("@den/edullm/replica/TimebackReplica") {}

/** A change the source makes between reads: a row inserted at the heap's end, a row's columns changed, a row deleted. */
export type Edit =
	| Readonly<{ _tag: "Insert"; row: Row; newBlock: boolean }>
	| Readonly<{ _tag: "Update"; key: string; payload: Uint8Array; at: number }>
	| Readonly<{ _tag: "Delete"; key: string }>

const edited = (heap: Heap, edit: Edit): Heap => {
	switch (edit._tag) {
		case "Insert":
			return edit.newBlock || !Arr.isReadonlyArrayNonEmpty(heap)
				? [...heap, [edit.row]]
				: [...Arr.dropRight(heap, 1), [...Arr.lastNonEmpty(heap), edit.row]]
		case "Update":
			return Arr.map(heap, (block) =>
				Arr.map(block, (row) =>
					row.key === edit.key ? { ...row, payload: edit.payload, changedAt: edit.at } : row
				)
			)
		case "Delete":
			return Arr.map(heap, (block) => Arr.filter(block, (row) => row.key !== edit.key))
	}
}

type State = Readonly<{
	relations: HashMap.HashMap<string, Heap>
	open: ReadonlyArray<number>
	next: number
	seatings: ReadonlyArray<Seating>
}>

const MILLIS_PER_SECOND = 1000

/** The fake over one world, its statements' weather drawn from `nature`. */
export const makeReplica = (
	world: World,
	nature: Nature
): Effect.Effect<TimebackReplica["Service"], never, Digest.Digest> =>
	Effect.gen(function* () {
		const state = yield* Ref.make<State>({
			relations: world.relations,
			open: [],
			next: 0,
			seatings: []
		})
		const heapOf = (relation: string, at: number) =>
			Effect.flatMap(Ref.get(state), (current) =>
				Effect.fromOption(HashMap.get(current.relations, relation)).pipe(
					Effect.mapError(() => CopyFailed.make({ cause: "undefined-object", at }))
				)
			)
		/** How many sessions share the bastion's bytes: its seats, or every open session once more are open. */
		const sharers = Effect.map(Ref.get(state), (current) =>
			Math.max(world.bastion.seats, current.open.length)
		)
		/**
		 * One statement on a session: refused at once on a closed session, ended by its weather, cancelled at the
		 * session's timeout when its work would take longer, and otherwise answered when its work is done.
		 */
		const statement = <A>(
			session: Session,
			at: number,
			millis: number,
			answer: (endsAt: number) => A
		) =>
			Effect.gen(function* () {
				const current = yield* Ref.get(state)
				if (!Arr.contains(current.open, session.id)) {
					return yield* CopyFailed.make({ cause: "transport", at })
				}
				const weather = nature.draw(world.weather)
				if (weather._tag === "Failed") {
					return yield* CopyFailed.make({ cause: weather.cause, at })
				}
				return millis > session.statementTimeoutMillis
					? yield* CopyFailed.make({
							cause: "statement-timeout",
							at: at + session.statementTimeoutMillis
						})
					: answer(Math.round(at + millis))
			})
		const digest = yield* Digest.Digest
		const keysOf = (heap: Heap) =>
			Effect.forEach(Arr.flatten(heap), (row) =>
				Effect.map(digestOf([row.key]), (bytes): Key => ({ text: row.key, mark: markOf(bytes) }))
			).pipe(Effect.provideService(Digest.Digest, digest))
		return TimebackReplica.of({
			open: (at, statementTimeoutMillis) =>
				Ref.modify(state, (current): readonly [Session, State] => {
					const open = [...current.open, current.next]
					return [
						{ id: current.next, statementTimeoutMillis },
						{
							...current,
							open,
							next: current.next + 1,
							seatings: [
								...current.seatings,
								{ session: current.next, at, open: open.length, event: "opened" as const }
							]
						}
					]
				}),
			close: (session, at) =>
				Ref.update(state, (current) => {
					const open = Arr.filter(current.open, (id) => id !== session.id)
					return {
						...current,
						open,
						seatings: [
							...current.seatings,
							{ session: session.id, at, open: open.length, event: "closed" as const }
						]
					}
				}),
			catalog: (relation, at) =>
				Effect.map(heapOf(relation, at), (heap): Catalog => {
					const bytes = pageBodyOf(Arr.flatten(heap)).length
					return {
						blocks: heap.length,
						bytesPerBlock: Math.max(1, Math.ceil(bytes / Math.max(1, heap.length))),
						fields: ROW_FIELDS
					}
				}),
			page: (session, relation, blocks, changes, at) =>
				Effect.gen(function* () {
					const heap = yield* heapOf(relation, at)
					const scanned = Arr.flatten(Arr.take(Arr.drop(heap, blocks.lo), blocks.hi - blocks.lo))
					const rows = Option.match(changes, {
						onNone: () => scanned,
						onSome: ({ since, before }) =>
							Arr.filter(scanned, (row) => row.changedAt >= since && row.changedAt < before)
					})
					const body = pageBodyOf(rows)
					const share = world.bastion.bytesPerSecond / (yield* sharers)
					const pieces = nature.draw(int(0, 3))
					return yield* statement(
						session,
						at,
						(body.length / share) * MILLIS_PER_SECOND,
						(endsAt): Copied => ({
							chunks: chunked(body, pieces),
							at: endsAt
						})
					)
				}),
			print: (session, relation, at) =>
				Effect.gen(function* () {
					const heap = yield* heapOf(relation, at)
					const keys = yield* keysOf(heap)
					const millis = (keys.length / world.bastion.keysPerSecondPerSession) * MILLIS_PER_SECOND
					return yield* statement(session, at, millis, (endsAt) => ({
						print: printOf(Arr.map(keys, (key) => key.mark)),
						printedAt: at,
						at: endsAt
					}))
				}),
			bucketKeys: (session, relation, buckets, at) =>
				Effect.gen(function* () {
					const heap = yield* heapOf(relation, at)
					const every = yield* keysOf(heap)
					const keys = Arr.filter(every, (key) => Arr.contains(buckets, key.mark.bucket))
					const millis = (keys.length / world.bastion.keysPerSecondPerSession) * MILLIS_PER_SECOND
					return yield* statement(session, at, millis, (endsAt) => ({ keys, at: endsAt }))
				}),
			edit: (relation, edit) =>
				Ref.update(state, (current) => ({
					...current,
					relations: HashMap.modify(current.relations, relation, (heap) => edited(heap, edit))
				})),
			seatings: Effect.map(Ref.get(state), (current) => current.seatings)
		})
	})

/** A body cut into `pieces + 1` chunks of near-equal size, as a stream would deliver it. */
const chunked = (body: Uint8Array, pieces: number): ReadonlyArray<Uint8Array> => {
	const size = Math.max(1, Math.ceil(body.length / (pieces + 1)))
	const chunks: Array<Uint8Array> = []
	for (let lo = 0; lo < body.length; lo += size) {
		chunks.push(body.subarray(lo, lo + size))
	}
	return chunks
}

/** The fake as a layer. */
export const replicaLayer = (
	world: World,
	nature: Nature
): Layer.Layer<TimebackReplica, never, Digest.Digest> =>
	Layer.effect(TimebackReplica, makeReplica(world, nature))
