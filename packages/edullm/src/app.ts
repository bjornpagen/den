import { Schema } from "effect"
import { Sha256 } from "#bronze.ts"
import { COLLECTIONS } from "#qti-sync.ts"

/**
 * The app's own facts that edullm's workloads write, as Effect Schemas, the types den lowers into the app's grizzle
 * relations once its API settles. They hold what is, never why (edullm's ruling): the only pipeline state that outlives
 * a job is one cursor per source; Silver is the typed projection of Bronze; Bronze is bytes by content address. A
 * workload's own queue state (pages, links, prints) is den's graph, not the app's.
 */

/** An instant of the simulation's clock, in milliseconds. */
const Instant = Schema.Finite

/** W1: how far a Timeback relation was read: its heap's blocks for growth, the instant changes were read from. */
export const TimebackCursor = Schema.Struct({
	relation: Schema.NonEmptyString,
	blocks: Schema.Int.check(Schema.isGreaterThanOrEqualTo(0)),
	since: Instant
})
export type TimebackCursor = typeof TimebackCursor.Type

/** W1: a row Silver mirrors of a Timeback relation, keyed by its source key. */
export const SilverRow = Schema.Struct({
	relation: Schema.NonEmptyString,
	key: Schema.NonEmptyString,
	payload: Schema.Uint8Array
})
export type SilverRow = typeof SilverRow.Type

/** W3: a QTI collection's frontier: every document updated before it is read. */
export const QtiSyncCursor = Schema.Struct({
	collection: Schema.Literals(COLLECTIONS),
	frontier: Instant
})
export type QtiSyncCursor = typeof QtiSyncCursor.Type

/** W3: a QTI document as Silver holds it, with the Bronze page it was read from. */
export const QtiSyncDocument = Schema.Struct({
	collection: Schema.Literals(COLLECTIONS),
	id: Schema.NonEmptyString,
	updatedAt: Instant,
	page: Sha256
})
export type QtiSyncDocument = typeof QtiSyncDocument.Type

/** W2: AlphaTest's frontier: every assignment changed before it is read. */
export const AlphaTestCursor = Schema.Struct({ frontier: Instant })
export type AlphaTestCursor = typeof AlphaTestCursor.Type

/** W2: a final answer of one AlphaTest target: its status and the Bronze object of its exact bytes. */
export const AlphaTestAnswer = Schema.Struct({
	target: Schema.NonEmptyString,
	status: Schema.Int,
	body: Sha256
})
export type AlphaTestAnswer = typeof AlphaTestAnswer.Type

/** W6: Timeback's acceptance of a report, first write wins. */
export const ReportAccepted = Schema.Struct({ reportId: Schema.NonEmptyString, at: Instant })
export type ReportAccepted = typeof ReportAccepted.Type

/** W7: a student's intent, its version, and whether a pass applied it. */
export const EnrollmentIntent = Schema.Struct({
	student: Schema.NonEmptyString,
	kind: Schema.Literals(["automatic-enrolled", "admin-enrolled", "admin-unenrolled"]),
	version: Schema.Int,
	applied: Schema.Boolean
})
export type EnrollmentIntent = typeof EnrollmentIntent.Type
