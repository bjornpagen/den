import { Array as Arr, Effect, HashMap, Option, Order, Result } from "effect"
import { Digest } from "effect/crypto"
import { halvesOf, type Range } from "#ranges.ts"

/**
 * The key buckets a print has: two digest bytes, 2^16. Two bytes keep the print of the largest relation
 * (`assessment_results`, 27.7 M keys on 2026-10-15) at 65,536 rows while one deleted key costs a fetch of its bucket's
 * ~420 keys; one byte would cost ~108 k keys per deletion, three a 16.7 M-row print (edullm
 * `packages/data/database/src/kernel/timeback-prune.ts`, `PRINT_BUCKETS`).
 *
 * @formatConstant two bytes of a key's MD5 digest, read as one big-endian integer
 */
export const PRINT_BUCKETS = 65_536

/** Every bucket a print can hold: the range a daily prune starts from. */
export const EVERY_BUCKET: Range = { lo: 0, hi: PRINT_BUCKETS }

/**
 * What a key's digest says of it: its bucket (the digest's first two bytes) and its fingerprint (the next three, below
 * 2^24). Summed with their count over a bucket's keys, fingerprints tell which keys a bucket holds.
 */
export type Mark = Readonly<{ bucket: number; fingerprint: number }>

/**
 * A key's digest, as the replica and Silver both compute it: MD5 of its parts joined by `|` (PostgreSQL's
 * `concat_ws('|', …)`), MD5 being the one hash both servers compute identically.
 */
export const digestOf = Effect.fnUntraced(function* (parts: Arr.NonEmptyReadonlyArray<string>) {
	const digest = yield* Digest.Digest
	return yield* digest.digest(Digest.md5, new TextEncoder().encode(Arr.join(parts, "|")))
})

/** A digest's mark: bytes 0–1 its bucket, bytes 2–4 its fingerprint. */
export const markOf = (digest: Uint8Array): Mark => {
	const byte = (at: number) => digest[at] ?? 0
	return {
		bucket: byte(0) * 256 + byte(1),
		fingerprint: byte(2) * 65_536 + byte(3) * 256 + byte(4)
	}
}

/** One bucket of a print: how many keys it holds and the sum of their fingerprints. */
export type Tally = Readonly<{ keys: number; sums: number }>

/** A print: every non-empty bucket's tally. */
export type Print = HashMap.HashMap<number, Tally>

/** The print of a set of keys' marks. */
export const printOf = (marks: Iterable<Mark>): Print => {
	let print = HashMap.empty<number, Tally>()
	for (const mark of marks) {
		const before = Option.getOrElse(HashMap.get(print, mark.bucket), (): Tally => ({
			keys: 0,
			sums: 0
		}))
		print = HashMap.set(print, mark.bucket, {
			keys: before.keys + 1,
			sums: before.sums + mark.fingerprint
		})
	}
	return print
}

/** A bucket where Silver's print and the source's differ, with the source's key count there: what fetching it costs. */
export type Differing = Readonly<{ bucket: number; sourceKeys: number }>

const inRange = (range: Range) => (bucket: number) => bucket >= range.lo && bucket < range.hi

/**
 * The buckets of `range` where Silver's tally differs from the source's. Only a bucket Silver holds can have a key to
 * delete, so Silver's buckets drive, and a bucket the source lacks is a source tally of none. Ordered by bucket.
 */
export const differingOf = (silver: Print, source: Print, range: Range): ReadonlyArray<Differing> =>
	Arr.sort(
		Arr.filterMap(Arr.fromIterable(silver), ([bucket, ours]): Result.Result<Differing, void> => {
			const theirs = HashMap.get(source, bucket)
			const same = Option.exists(
				theirs,
				(tally) => tally.keys === ours.keys && tally.sums === ours.sums
			)
			return inRange(range)(bucket) && !same
				? Result.succeed({
						bucket,
						sourceKeys: Option.match(theirs, { onNone: () => 0, onSome: (tally) => tally.keys })
					})
				: Result.failVoid
		}),
		Order.mapInput(Order.Number, (row: Differing) => row.bucket)
	)

/**
 * What a prune of one range does: nothing, when no bucket differs; split at its midpoint, when fetching the differing
 * buckets' keys would read more than `fetchKeys` keys and the range is wider than one bucket; otherwise fetch exactly
 * the differing buckets' keys from the replica, and delete Silver's keys of those buckets the fetch lacks.
 */
export type Settled =
	| Readonly<{ _tag: "Untouched" }>
	| Readonly<{ _tag: "Split"; halves: readonly [Range, Range]; keys: number }>
	| Readonly<{ _tag: "Fetch"; buckets: Arr.NonEmptyReadonlyArray<number> }>

export const settledOf = (
	differing: ReadonlyArray<Differing>,
	range: Range,
	fetchKeys: number
): Settled => {
	if (!Arr.isReadonlyArrayNonEmpty(differing)) {
		return { _tag: "Untouched" }
	}
	const keys = Arr.reduce(differing, 0, (total, row) => total + row.sourceKeys)
	const fetch: Settled = { _tag: "Fetch", buckets: Arr.map(differing, (row) => row.bucket) }
	return keys > fetchKeys
		? Option.match(halvesOf(range), {
				onNone: () => fetch,
				onSome: (halves): Settled => ({ _tag: "Split", halves, keys })
			})
		: fetch
}

/**
 * The keys a fetch deletes: Silver's keys of the fetched buckets that the replica's keys of those buckets lack. Keys
 * compare by their text, the canonical rendering both servers digest.
 */
export const absentOf = <K extends Readonly<{ text: string; mark: Mark }>>(
	silver: ReadonlyArray<K>,
	fetched: ReadonlyArray<K>,
	buckets: ReadonlyArray<number>
): ReadonlyArray<K> => {
	const present = new Set(Arr.map(fetched, (key) => key.text))
	return Arr.filter(
		silver,
		(key) => Arr.contains(buckets, key.mark.bucket) && !present.has(key.text)
	)
}
