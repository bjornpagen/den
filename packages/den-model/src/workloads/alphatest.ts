import { Array as Arr, Option } from "effect"
import type { Datum } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type Ladder,
	open,
	ordinals,
	type Program,
	type RootKind,
	rootedOf,
	type Runs,
	type ScopeKind,
	type StepKind,
	scopeOf,
	spawn,
	stepOf,
	type Window
} from "#program.ts"

/** W2's limits, each the test's input: the window AlphaTest's claims run in, and how a link runs. */
export type AlphaTestLimits = Readonly<{
	window: Option.Option<Window>
	lease: number
	ladder: Ladder
}>

/** One request kind the listing's pages lead to, and how many requests of it each listing page names. */
export type Kind = Readonly<{ kind: string; perPage: number }>

/**
 * One night of AlphaTest as the source answers it: the listing's pages, the request kinds they lead to, the requests a
 * link fetches at once (`ALPHATEST_BATCH_REQUESTS`), how many times the source throttles a link before it answers, and
 * the assignment-id ranges the out-of-listing scans cover.
 */
export type Night = Readonly<{
	night: number
	pages: number
	kinds: ReadonlyArray<Kind>
	batch: number
	throttles: number
	scans: number
}>

/** A chain of one request kind: its night, its kind, and the requests it fetches. */
type Chain = Readonly<{ night: Night; kind: string; requests: number }>

/**
 * One link: its chain, its position, and the flow window it carries, AlphaTest's discovered concurrency, which bounds
 * requests inside the link's body and travels along the chain edge to the next link.
 */
type Link = Readonly<{ chain: Chain; seq: number; flow: number }>

/** What a link answered: the flow window for the next link, and whether one follows. */
type Answered = Readonly<{ flow: number; next: boolean }>

/** The kind the listing chain reads. */
const LISTING = "listing"

const showChain = (chain: Chain): Datum => ({
	night: chain.night.night,
	kind: chain.kind,
	requests: chain.requests
})

/**
 * W2, edullm's AlphaTest night, as a den program: a singleton root inside its window opens the listing chain, one link
 * per listing page, each naming the next; the listing chain's finish is the listing gate, which, once every page was
 * read, opens one chain per request kind the pages led to, each fetching its requests a batch a link (the singleton
 * root makes each kind's chain the only live one), and then the scans; the root's finish moves the AlphaTest frontier once every chain and scan is done.
 */
export const alphatestOf = (
	limits: AlphaTestLimits
): Readonly<{ program: Program; admit: (night: Night) => Admission }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Fetch: StepKind<Link, Answered, never> = {
		name: "AlphaTestLink",
		runs,
		input: (link) => ({ chain: showChain(link.chain), seq: link.seq, flow: link.flow }),
		output: (answered) => ({ flow: answered.flow, next: answered.next }),
		error: () => 0,
		reads: () => [],
		body: (link, claimed) => {
			const throttled = claimed.waits < link.chain.night.throttles
			if (throttled && claimed.attempt === 0) {
				return { _tag: "Retry", at: claimed.at + 1, counts: "wait" }
			}
			const per = link.chain.kind === LISTING ? 1 : link.chain.night.batch
			return {
				_tag: "Output",
				output: {
					flow: throttled ? Math.max(1, Math.floor(link.flow / 2)) : link.flow + 1,
					next: (link.seq + 1) * per < link.chain.requests
				},
				writes: [
					{
						relation: "alphatest_answer",
						key: `${link.chain.night.night}:${link.chain.kind}:${link.seq}`,
						value: link.flow
					}
				]
			}
		},
		edges: () => [
			spawn("next", Fetch, (link: Link, answered: Answered) =>
				answered.next ? [{ chain: link.chain, seq: link.seq + 1, flow: answered.flow }] : []
			)
		]
	}

	const ChainScope: ScopeKind<Chain, boolean, never> = {
		name: "AlphaTestChain",
		input: showChain,
		start: (chain) => [stepOf(Fetch, { chain, seq: 0, flow: 1 })],
		finish: {
			runs,
			output: (complete) => complete,
			error: () => false,
			body: (_chain, children) => ({
				_tag: "Output",
				output: Arr.every(children, (child) => child._tag === "Done"),
				writes: []
			})
		}
	}

	const Scan: StepKind<Readonly<{ night: number; range: number }>, number, never> = {
		name: "AlphaTestScan",
		runs,
		input: (scan) => ({ night: scan.night, range: scan.range }),
		output: (found) => found,
		error: () => 0,
		reads: () => [],
		body: (scan) => ({
			_tag: "Output",
			output: 0,
			writes: [
				{ relation: "alphatest_scan", key: `${scan.night}:${scan.range}`, value: scan.range }
			]
		}),
		edges: () => []
	}

	const Scans: ScopeKind<Night, boolean, never> = {
		name: "AlphaTestScans",
		input: (night) => ({ night: night.night, scans: night.scans }),
		start: (night) =>
			Arr.map(ordinals(night.scans), (range) => stepOf(Scan, { night: night.night, range })),
		finish: {
			runs,
			output: (complete) => complete,
			error: () => false,
			body: (_night, children) => ({
				_tag: "Output",
				output: Arr.every(children, (child) => child._tag === "Done"),
				writes: []
			})
		}
	}

	/** The listing gate: once the listing chain read every page, the chains of the kinds it led to, then the scans. */
	const gate = () => [
		open(
			"kinds",
			ChainScope,
			(listing: Chain, complete: boolean) =>
				complete
					? Arr.flatMap(listing.night.kinds, (kind) =>
							kind.perPage > 0
								? [
										{
											night: listing.night,
											kind: kind.kind,
											requests: kind.perPage * listing.night.pages
										}
									]
								: []
						)
					: [],
			() => []
		),
		open(
			"scans",
			Scans,
			(listing: Chain, complete: boolean) => (complete ? [listing.night] : []),
			() => []
		)
	]

	const AlphaTestNightly: RootKind<Night, boolean, never> = {
		name: "AlphaTestNightly",
		trigger: { _tag: "Schedule", every: 1 },
		precondition: Option.none(),
		window: limits.window,
		exclusive: Option.some(() => "alphatest"),
		scope: {
			name: "AlphaTestNightly",
			input: (night) => ({ night: night.night }),
			start: (night) => [
				scopeOf(ChainScope, { night, kind: LISTING, requests: Math.max(1, night.pages) }, gate)
			],
			finish: {
				runs,
				output: (moved) => moved,
				error: () => false,
				body: (night, children) => {
					const moved =
						children.length > 1 &&
						Arr.every(children, (child) => child._tag === "Done" && child.output === true)
					return {
						_tag: "Output",
						output: moved,
						writes: moved
							? [{ relation: "alphatest_cursor", key: "frontier", value: night.night }]
							: []
					}
				}
			}
		}
	}

	return {
		program: {
			name: "alphatest",
			resources: [],
			roots: [rootedOf(AlphaTestNightly)]
		},
		admit: (night) => admissionOf(AlphaTestNightly, `${night.night}`, night)
	}
}
