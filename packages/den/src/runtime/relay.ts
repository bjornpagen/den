import type { CallError } from "@bjornpagen/grizzle/runtime"
import {
	Array as Arr,
	Duration,
	Effect,
	Formatter,
	HashSet,
	Option,
	Order,
	Ref,
	Stream
} from "effect"
import { Digest } from "effect/crypto"
import { eligible } from "#runtime/eligible.ts"
import type { Ledger, Snapshot } from "#runtime/ledger.ts"
import { type Ring, Transport, wakeText } from "#transport.ts"

/**
 * The relay: the transactional outbox by log tailing. It watches the served reads eligibility depends on through
 * grizzle's live source, whose leader streams commits in commit order, at least once and only once they are visible,
 * and at each change rings what someone else's commit made eligible (the app's own write requesting a root, an
 * operator's, a seat given back), one transport message per wake it has not rung while that wake stayed eligible. No
 * wake table: the ledger is the outbox. A lease that lapsed is time passing, no commit, so the census rings it.
 *
 * A ring's cause is the committed state it rang for, a digest of the snapshot it read: grizzle's watch events carry no
 * commit position, so a leader hand-over that replays the same commits reads the same state and rings under the same
 * keys, which the transport drops as the duplicates they are.
 */

/** What ended a relay: the CallError one of its watches ended with, or its watches' end. */
export type RelayEnd = Option.Option<CallError>

const encoder = new TextEncoder()

/** A snapshot's canonical text: each part's rows as text, sorted, so two reads of one committed state agree. */
const textOf = <R>(snapshot: Snapshot<R>): string => {
	const rows = (part: ReadonlyArray<unknown>) =>
		Arr.join(
			Arr.sort(
				Arr.map(part, (row) => Formatter.format(row)),
				Order.String
			),
			"\n"
		)
	return Arr.join(
		[
			rows(
				Arr.map(snapshot.steps, (s) => ({
					step: s.step,
					kind: s.runner.kind,
					scope: s.scope,
					due: s.due
				}))
			),
			rows(snapshot.claims),
			rows(snapshot.retries),
			rows(snapshot.fenced),
			rows(
				Arr.map(snapshot.scopes, (s) =>
					s.place === "root"
						? {
								place: s.place,
								scope: s.scope,
								kind: s.kind,
								key: s.key,
								at: s.at,
								admission: s.admission,
								exclusive: s.exclusive
							}
						: s
				)
			),
			rows(snapshot.holds),
			rows(snapshot.exclusives),
			rows(snapshot.paused),
			rows(snapshot.busy)
		],
		"\u0000"
	)
}

/**
 * Runs the relay of one flow until one of its watches ends with an error grizzle does not call safe to run again, which
 * it returns: its host runs it again. A watch that ends safe to retry (no session yet, a connection broken, the
 * installation's replication slot not yet made by its leader) is opened again at once, as a transient refusal is retried
 * in place. At each change it reads the scheduler's snapshot and the database's instant, rings the wakes eligible at
 * that reading that it had not rung since they became eligible, and forgets those no longer eligible, so a wake that
 * falls out of eligibility and back in is rung again. A step whose latest attempt was fenced waits on the deployment,
 * which the census asks after, never the relay.
 */
export const relay = <R>(
	ledger: Ledger<R>
): Effect.Effect<RelayEnd, never, Transport | Digest.Digest> =>
	Effect.gen(function* () {
		const transport = yield* Transport
		const digest = yield* Digest.Digest
		const rung = yield* Ref.make(HashSet.empty<string>())
		const pass = Effect.gen(function* () {
			const snapshot = yield* ledger.snapshot
			const at = yield* ledger.now
			const found = eligible(ledger, snapshot, at)
			const position = yield* digest.digestHex(Digest.sha256, encoder.encode(textOf(snapshot)))
			const before = yield* Ref.get(rung)
			const fresh = Arr.filter(found.wakes, (wake) => !HashSet.has(before, wakeText(wake)))
			yield* transport.send(
				Arr.map(fresh, (wake): Ring => ({
					wake,
					delay: Duration.zero,
					cause: { _tag: "Relay", position }
				}))
			)
			yield* Ref.set(rung, HashSet.fromIterable(Arr.map(found.wakes, wakeText)))
		})
		const watched = Effect.map(
			ledger.changes.pipe(
				Stream.mapArrayEffect((signals) =>
					Effect.as(Arr.some(signals, Option.isNone) ? Effect.ignore(pass) : Effect.void, signals)
				),
				Stream.filter(Option.isSome),
				Stream.runHead
			),
			Option.flatten
		)
		const watch = (): Effect.Effect<RelayEnd> =>
			Effect.filterOrElse(
				watched,
				(ended) => !Option.exists(ended, (error) => error.retry === "safe"),
				() => Effect.andThen(Effect.yieldNow, watch())
			)
		return yield* watch()
	})
