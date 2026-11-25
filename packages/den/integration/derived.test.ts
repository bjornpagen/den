import { instantOf } from "@bjornpagen/den/runtime/identity"
import { settled } from "@bjornpagen/den/runtime/settled"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { Sha256 } from "@bjornpagen/grizzle"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import { aimed, array, element, type Gen, int, oneOf } from "@bjornpagen/testing/gen"
import { type Case, property, ReplayToken } from "@bjornpagen/testing/property"
import { Array as Arr, Effect, HashMap, Number as Num, Option, Order } from "effect"
import { poolSeats } from "#integration/slice/flows.ts"
import { ringOnAndDrain } from "#integration/support/run.ts"
import { openAuditor, openLedgers, rows, sliceCase } from "#integration/support/slice.ts"
import { longestLeaseMillis } from "#runtime/turn.ts"

/**
 * A root whose input derives from its key (den's `derived`, grizzle main's ruling, 2026-11-25): the fan's Wanted, which
 * the app's write requests by its batch alone, its size the largest the app wants the batch at (reads.ts WantedOf),
 * read in the request's own statement. The app's `wantRun` write sequences the sizes it wants beside its request
 * before it, as metis's ending of a sitting sequences its essay's request after its grading, so the read finds them
 * too. Two batches share each case's database, so a read that strays past its key derives another's size.
 *
 * Oracle (specification): docs/decisions.md, a derived root's input is its read's row at its request's commit: no root
 * stands until the read derives one, the first request that finds a row starts the root with it and keeps its key, and
 * every request of the key after it starts nothing and leaves the input as it was, whatever the app wanted since.
 */

type Feature =
	| "a key that derives no run"
	| "a run derived at its request"
	| "a size wanted beside its run's request"
	| "a key requested again"
	| "a key requested again after the app wanted more"

/** The batches a case's app wants and requests runs of, each its own key. */
const batches = ["left", "right"] as const

type Batch = (typeof batches)[number]

/**
 * What the app does next: wants a batch at a size, or requests a batch's run, wanting sizes of it beside the request.
 */
type Event =
	| Readonly<{ _tag: "Want"; batch: Batch; size: number }>
	| Readonly<{ _tag: "Request"; batch: Batch; beside: ReadonlyArray<number> }>

/** A batch's size, empty to past the Pool's seats. */
const wantedSize: Gen<number> = int(0, poolSeats + 1)

/**
 * Sequences of the app's wants and requests of either batch; while a situation few sequences reach is pending, one that
 * reaches it: a request of a batch the app wants at no size, or a request again after the app wanted its batch at more.
 */
const events = aimed(
	array(
		oneOf<Event>([
			(source) => ({
				_tag: "Want",
				batch: source.draw(element(batches)),
				size: source.draw(wantedSize)
			}),
			(source) => ({
				_tag: "Request",
				batch: source.draw(element(batches)),
				beside: source.draw(array(wantedSize, { min: 0, max: 2 }))
			})
		]),
		{ min: 1, max: 6 }
	),
	[
		[
			"a key that derives no run",
			(source): ReadonlyArray<Event> => [
				{ _tag: "Request", batch: source.draw(element(batches)), beside: [] }
			]
		],
		[
			"a key requested again after the app wanted more",
			(source): ReadonlyArray<Event> => {
				const batch = source.draw(element(batches))
				return [
					{ _tag: "Want", batch, size: 1 },
					{ _tag: "Request", batch, beside: [] },
					{ _tag: "Request", batch, beside: [poolSeats + 1] }
				]
			}
		]
	]
)

/** Where a batch stands: the sizes the app wanted it at so far, and its run's size once a request derived one. */
interface Standing {
	readonly wanted: ReadonlyArray<number>
	readonly input: Option.Option<number>
}

/** A batch the app has done nothing with. */
const untouched: Standing = { wanted: [], input: Option.none() }

/** The largest of `sizes`, none of none. */
const largest = (sizes: ReadonlyArray<number>): Option.Option<number> =>
	Arr.isReadonlyArrayNonEmpty(sizes) ? Option.some(Arr.max(sizes, Num.Order)) : Option.none()

/**
 * Derives a root's input from the read at its request's commit, and keeps it: over drawn sequences of the app's wants
 * and requests of two batches, each request is read back from the fan's graph, its root and its key standing exactly
 * where the sizes of its batch wanted up to it (its own write's among them) are some, its input their largest at the
 * first request that found one, and each run, admitted at its own seat (its key's), squares that many.
 *
 * Budget: provisional, the slice's request suites' (8 independent cases and 8 steered), each case a few writes and one
 * fan-out run per batch.
 */
export const aDerivedRootsInputIsItsReadAtItsRequest = property.explore(events, {
	needs: { slice: sliceCase },
	situations: [
		"a key that derives no run",
		"a run derived at its request",
		"a size wanted beside its run's request",
		"a key requested again",
		"a key requested again after the app wanted more"
	] satisfies ReadonlyArray<Reached<Feature>>,
	check:
		({ slice }, c: Case<Feature>) =>
		(drawn) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						const { fan, ledgers, loader } = yield* openLedgers
						const app = yield* openAuditor
						const none = { params: {}, facts: {} } as const
						const wants = (batch: Batch, sizes: ReadonlyArray<number>) =>
							Arr.map(sizes, (size) => ({ batch, size: BigInt(size) }))
						/**
						 * A batch's run's input, key and root as the fan's graph holds them, by its request's scope.
						 */
						const held = (scope: Sha256) =>
							Effect.gen(function* () {
								const inputs = yield* rows(app.workload.fanWantedInputs.once(none))
								const keys = yield* rows(app.workload.fanWantedKeys.once(none))
								const roots = yield* rows(app.workload.fanRoots.once(none))
								return {
									input: Arr.map(
										Arr.filter(inputs, (i) => Sha256.equals(i.scope, scope)),
										(i) => [i.batch, Number(i.size)] as const
									),
									key: Arr.map(
										Arr.filter(keys, (k) => Sha256.equals(k.root, scope)),
										(k) => k.batch
									),
									root: Arr.some(roots, (r) => Sha256.equals(r.scope, scope))
								}
							})
						const standings = yield* Effect.reduce(
							drawn,
							() => HashMap.empty<Batch, Standing>(),
							(state: HashMap.HashMap<Batch, Standing>, event) => {
								const standing = Option.getOrElse(HashMap.get(state, event.batch), () => untouched)
								if (event._tag === "Want") {
									return Effect.as(
										settled(
											loader.workload.want.once({
												params: {},
												facts: { insert: { Want: wants(event.batch, [event.size]) } }
											})
										),
										HashMap.set(state, event.batch, {
											...standing,
											wanted: [...standing.wanted, event.size]
										})
									)
								}
								const wanted = [...standing.wanted, ...event.beside]
								const derived = largest(wanted)
								const before = standing.input
								const input = Option.orElse(before, () => derived)
								if (Option.isSome(before)) {
									c.note("a key requested again")
									if (Option.exists(derived, (size) => size > before.value)) {
										c.note("a key requested again after the app wanted more")
									}
								} else if (Option.isNone(derived)) {
									c.note("a key that derives no run")
								} else {
									c.note("a run derived at its request")
									if (
										!Option.exists(largest(standing.wanted), (size) =>
											Option.contains(derived, size)
										)
									) {
										c.note("a size wanted beside its run's request")
									}
								}
								const asked = fan.appRequests.Wanted({ batch: event.batch })
								return Effect.gen(function* () {
									yield* settled(
										loader.workload.wantRun.once({
											params: asked.params,
											facts: { insert: { Want: wants(event.batch, event.beside) } }
										})
									)
									const found = yield* held(asked.scope)
									assert.deepEqual(
										found.input,
										Option.toArray(Option.map(input, (size) => [event.batch, size] as const)),
										"the run's input is its batch's largest wanted size at its first deriving request, kept since"
									)
									assert.deepEqual(
										found.key,
										Option.isSome(input) ? [event.batch] : [],
										"a root's key stands exactly beside its root"
									)
									assert.equal(
										found.root,
										Option.isSome(input),
										"a root stands exactly where a request's read derived its input"
									)
									return HashMap.set(state, event.batch, { wanted, input })
								})
							}
						)
						const started = Arr.flatMap(batches, (batch) =>
							Option.toArray(
								Option.flatMap(HashMap.get(standings, batch), (standing) =>
									Option.map(standing.input, (size) => ({
										batch,
										size,
										asked: fan.appRequests.Wanted({ batch })
									}))
								)
							)
						)
						const at = yield* fan.ledger.now
						const ends = instantOf(Number(at) + longestLeaseMillis)
						/** Each batch's run admitted before any runs, each at its own seat, its key's. */
						const admitted = yield* Effect.forEach(started, (run) =>
							serve(
								ledgers,
								{ _tag: "Admit", flow: FlowName.make("Fan"), scope: run.asked.scope },
								ends
							)
						)
						assert.deepEqual(
							Arr.map(admitted, (served) => served.ending.kind),
							Arr.map(started, () => "admitted" as const),
							"each batch's run holds its own seat, named by its key"
						)
						yield* Effect.forEach(admitted, (served) => ringOnAndDrain(ledgers, served))
						const tallies = yield* rows(app.workload.tallies.once(none))
						assert.deepEqual(
							Arr.sort(
								Arr.map(
									Arr.filter(tallies, (t) => Arr.contains(batches, t.batch)),
									(t) => `${t.batch} ${String(t.count)}`
								),
								Order.String
							),
							Arr.sort(
								Arr.map(started, (run) => `${run.batch} ${String(run.size)}`),
								Order.String
							),
							"each run squares its own batch's derived size"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a derived root's input is its read's row at its request's commit, and a request again of its key keeps it"
	},
	budget: { runs: 8, steered: 8 },
	kept: [
		{
			token: ReplayToken(
				"integration/derived.test.ts#aDerivedRootsInputIsItsReadAtItsRequest:-:3.0.0.2.1.0.0.1.0.1.3"
			),
			reason:
				"grizzle main's kept case: the read's relations change after the first request, and a second request of the key starts nothing and leaves the input as it was at the first commit",
			since: "2026-11-25"
		},
		{
			token: ReplayToken(
				"integration/derived.test.ts#aDerivedRootsInputIsItsReadAtItsRequest:-:5.1.0.0.0.0.1.1.0.0.0.0.3.1.0.0"
			),
			reason:
				"a key that derives no run starts one once the app wants its batch, and keeps its size when the app wants more after",
			since: "2026-11-25"
		},
		{
			token: ReplayToken(
				"integration/derived.test.ts#aDerivedRootsInputIsItsReadAtItsRequest:-:4.0.0.1.0.1.3.1.0.0.1.1.0"
			),
			reason:
				"two batches' runs in one database, each its own batch's size: no read derives past its key",
			since: "2026-11-25"
		}
	],
	kills: [
		{
			file: "packages/den/integration/slice/generated/fan.binding.ts",
			original:
				'pipe(exclusiveRows("Fan", "Wanted", fan.kinds[6].exclusive, key, scope), (keys) => ({',
			replacement:
				'pipe(exclusiveRows("Fan", "Wanted", fan.kinds[6].exclusive, { batch: "one" }, scope), (keys) => ({',
			why: "A derived root's seat is named by something other than its key: two batches' runs meet at one seat, one is skipped, and its batch is never squared."
		},
		{
			file: "packages/den/integration/slice/generated/fan.programs.ts",
			original:
				"\t\t\t\t\t.where(r.eq(scope, root), r.not(FanRoot, { root }))\n\t\t\t\t\t.find({ scope, root, batch: derivedBatch, size: derivedSize })\n",
			replacement:
				"\t\t\t\t\t.where(r.eq(scope, root))\n\t\t\t\t\t.find({ scope, root, batch: derivedBatch, size: derivedSize })\n",
			why: "A request again of a held key derives its input again: once the app wants more, its row meets the held input's key with another size, and the app's write is refused."
		},
		{
			file: "packages/den/integration/slice/app-programs.ts",
			original:
				"\t\tChangeSet.sequence(ChangeSet.empty(Loader).insert(Want, []), fanRequests.Wanted),\n",
			replacement:
				"\t\tChangeSet.union(ChangeSet.empty(Loader).insert(Want, []), fanRequests.Wanted),\n",
			why: "The request reads the state before its own write: a size wanted beside it derives nothing, and no run stands where the read at its commit derives one."
		}
	]
})
