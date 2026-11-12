import { Array as Arr, Option } from "effect"
import type { Datum } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type Ceilings,
	type Ladder,
	type Lane,
	type Program,
	type RootKind,
	type Runs,
	type ScopeKind,
	type StepKind,
	scopeOf,
	spawn,
	stepOf
} from "#program.ts"

/**
 * The QTI workload's limits, each the test's input: the lane's width (edullm's `LANE_WIDTHS.qti`, one chain per
 * collection), and how a page runs: its lease, ceilings and ladder.
 */
export type QtiLimits = Readonly<{
	width: number
	lease: number
	ceilings: Ceilings
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
type Window = Readonly<{ collection: Collection; since: number; until: number }>

/** One page's read: the collection, the page's position in the chain, and the `after` position it reads from. */
type PageInput = Readonly<{ window: Window; seq: number; after: number }>

/** What a page read answered: the position of the page after it, or the end of the list. */
type PageRead = Readonly<{ next: Option.Option<number>; documents: number }>

/** The source's refusal of a page. */
type QtiRefused = Readonly<{ status: number }>

/** How many documents a page holds, so a page's `after` advances by it. */
const PAGE_DOCUMENTS = 50

/** The night a QTI root reads, and the collections it reads. */
export type Night = Readonly<{ night: number; collections: ReadonlyArray<Collection> }>

/**
 * edullm's QTI chain as a den program: a nightly root opens one read scope per collection; each read is a chain of
 * pages, each naming the next, until the list's end; a read's finish moves its collection's frontier to its window's
 * end, or holds it where a page failed.
 */
export const qtiOf = (
	limits: QtiLimits
): Readonly<{ program: Program; admit: (night: Night) => Admission }> => {
	const qti: Lane = { name: "qti", width: limits.width, window: { _tag: "Always" } }
	const runs: Runs = {
		lane: qti,
		lease: limits.lease,
		ceilings: limits.ceilings,
		ladder: limits.ladder
	}
	const showPage = (page: PageInput): Datum => ({
		collection: page.window.collection.name,
		seq: page.seq,
		after: page.after
	})

	const Page: StepKind<PageInput, PageRead, QtiRefused> = {
		name: "QtiPage",
		runs,
		input: showPage,
		output: (read) =>
			Option.match(read.next, {
				onNone: () => ({ end: true, documents: read.documents }),
				onSome: (next) => ({ next, documents: read.documents })
			}),
		error: (refused) => ({ status: refused.status }),
		body: (page, claimed) => {
			const collection = page.window.collection
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
					{ relation: "qti_document", key: `${collection.name}:${page.seq}`, value: page.after }
				]
			}
		},
		edges: () => [
			spawn("next", Page, (page: PageInput, read: PageRead) =>
				Option.match(read.next, {
					onNone: () => [],
					onSome: (after) => [{ window: page.window, seq: page.seq + 1, after }]
				})
			)
		]
	}

	const Read: ScopeKind<Window, boolean, never> = {
		name: "QtiRead",
		input: (window) => ({
			collection: window.collection.name,
			since: window.since,
			until: window.until
		}),
		start: (window) => [stepOf(Page, { window, seq: 0, after: window.since })],
		finish: {
			runs,
			output: (moved) => moved,
			error: () => false,
			body: (window, children) => {
				const moved = Arr.every(children, (child) => child._tag === "Done")
				return {
					_tag: "Output",
					output: moved,
					writes: moved
						? [{ relation: "qti_cursor", key: window.collection.name, value: window.until }]
						: []
				}
			}
		}
	}

	const Nightly: RootKind<Night, number, never> = {
		name: "QtiNightly",
		trigger: { _tag: "Schedule", every: 1 },
		scope: {
			name: "QtiNightly",
			input: (night) => ({ night: night.night }),
			start: (night) =>
				Arr.map(night.collections, (collection) =>
					scopeOf(Read, { collection, since: night.night - 1, until: night.night }, () => [])
				),
			finish: {
				runs,
				output: (read) => read,
				error: () => 0,
				body: (_night, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}

	return {
		program: { name: "qti", lanes: [qti] },
		admit: (night) => admissionOf(Nightly, `${night.night}`, night)
	}
}
