import { Array as Arr, Option } from "effect"
import type { Datum } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type Ladder,
	type Program,
	type RootKind,
	rootedOf,
	type Runs,
	type StepKind,
	spawn,
	stepOf,
	type Window
} from "#program.ts"

/** W3's limits, each the test's input: the window a collection's read claims in, and how a page runs. */
export type QtiSyncLimits = Readonly<{
	window: Option.Option<Window>
	lease: number
	ladder: Ladder
}>

/**
 * A QTI collection as the source answers it: its pages, how many times the source throttles a page before it answers
 * it (a wait, honouring the source's `Retry-After`), and the page it refuses, if one.
 */
export type Collection = Readonly<{
	name: string
	pages: number
	throttles: number
	refuses: Option.Option<number>
}>

/** One night's window of one collection: `[since, until)`, the frontier less a day, up to the night's instant. */
type Span = Readonly<{ collection: Collection; since: number; until: number }>

/** One page's read: the collection, the page's position in the chain, and the `after` position it reads from. */
type PageInput = Readonly<{ span: Span; seq: number; after: number }>

/** What a page read answered: the position of the page after it, or the end of the list. */
type PageRead = Readonly<{ next: Option.Option<number>; documents: number }>

/** The source's refusal of a page. */
type QtiRefused = Readonly<{ status: number }>

/** How many documents a page holds, so a page's `after` advances by it. */
const PAGE_DOCUMENTS = 50

/** The night the schedule admits a read of each of its collections for. */
export type Night = Readonly<{ night: number; collections: ReadonlyArray<Collection> }>

/** The root kind of W3, by name, for the precondition of W4. */
export const QTI_SYNC = "QtiSync"

/**
 * W3, edullm's QTI sync (qti-sync), as a den program: each night the schedule admits one root per collection, exclusive per
 * collection and inside its window, so a night whose previous read of a collection still runs is held for that
 * collection and reads the others; a read is a chain of pages, each naming the next, until the list's end; its finish
 * moves the collection's frontier to its span's end, or holds it where a page failed.
 */
export const qtiSyncOf = (
	limits: QtiSyncLimits
): Readonly<{ program: Program; admit: (night: Night) => ReadonlyArray<Admission> }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }
	const showPage = (page: PageInput): Datum => ({
		collection: page.span.collection.name,
		seq: page.seq,
		after: page.after
	})

	const Page: StepKind<PageInput, PageRead, QtiRefused> = {
		name: "QtiSyncPage",
		runs,
		input: showPage,
		output: (read) =>
			Option.match(read.next, {
				onNone: () => ({ end: true, documents: read.documents }),
				onSome: (next) => ({ next, documents: read.documents })
			}),
		error: (refused) => ({ status: refused.status }),
		reads: () => [],
		body: (page, claimed) => {
			const collection = page.span.collection
			if (Option.contains(collection.refuses, page.seq)) {
				return { _tag: "Failure", error: { status: 403 } }
			}
			if (claimed.waits < collection.throttles) {
				return { _tag: "Retry", at: claimed.at + limits.ladder.last, counts: "wait" }
			}
			const last = page.seq + 1 >= collection.pages
			return {
				_tag: "Output",
				output: {
					next: last ? Option.none() : Option.some(page.after + PAGE_DOCUMENTS),
					documents: PAGE_DOCUMENTS
				},
				writes: [
					{
						relation: "qti_sync_document",
						key: `${collection.name}:${page.seq}`,
						value: page.after
					}
				]
			}
		},
		edges: () => [
			spawn("next", Page, (page: PageInput, read: PageRead) =>
				Option.match(read.next, {
					onNone: () => [],
					onSome: (after) => [{ span: page.span, seq: page.seq + 1, after }]
				})
			)
		]
	}

	const Read: RootKind<Span, boolean, never> = {
		name: QTI_SYNC,
		trigger: { _tag: "Schedule", every: 1 },
		precondition: Option.none(),
		exclusive: Option.some((span) => span.collection.name),
		window: limits.window,
		scope: {
			name: QTI_SYNC,
			input: (span) => ({ collection: span.collection.name, since: span.since, until: span.until }),
			start: (span) => [stepOf(Page, { span, seq: 0, after: span.since })],
			finish: {
				runs,
				output: (moved) => moved,
				error: () => false,
				body: (span, children) => {
					const moved = Arr.every(children, (child) => child._tag === "Done")
					return {
						_tag: "Output",
						output: moved,
						writes: moved
							? [{ relation: "qti_sync_cursor", key: span.collection.name, value: span.until }]
							: []
					}
				}
			}
		}
	}

	return {
		program: {
			name: "qti-sync",
			resources: [],
			roots: [rootedOf(Read)]
		},
		admit: (night) =>
			Arr.map(night.collections, (collection) =>
				admissionOf(Read, `${collection.name}:${night.night}`, {
					collection,
					since: night.night - 1,
					until: night.night
				})
			)
	}
}
