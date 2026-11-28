import { denClock } from "@bjornpagen/den/algebra/kinds"
import { denInstantKey } from "@bjornpagen/den/lower/keys"
import { derivedKey, exclusiveRows } from "@bjornpagen/den/runtime/bind"
import { instantOf, rootScope } from "@bjornpagen/den/runtime/identity"
import { refusedLaws } from "@bjornpagen/den/runtime/ledger"
import { settled } from "@bjornpagen/den/runtime/settled"
import { serve } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
import { ChangeSet, clocked, pg, relation, Sha256, schema, workload } from "@bjornpagen/grizzle"
import { compileServed, type ServedRefusal } from "@bjornpagen/grizzle/compile"
import { assert } from "@bjornpagen/testing/assert"
import type { Reached } from "@bjornpagen/testing/features"
import {
	aimed,
	array,
	boolean,
	element,
	finite,
	type Gen,
	int,
	oneOf
} from "@bjornpagen/testing/gen"
import { type Case, type CheckContext, property, ReplayToken } from "@bjornpagen/testing/property"
import {
	Array as Arr,
	Effect,
	Exit,
	HashMap,
	Number as Num,
	Option,
	Order,
	type PlatformError,
	Result
} from "effect"
import { App } from "#integration/slice/app.ts"
import {
	Composer,
	Composing,
	composerInserts,
	composerPrograms
} from "#integration/slice/composing.ts"
import { fan as fanFlow, poolSeats } from "#integration/slice/flows.ts"
import { fanAppRequests } from "#integration/slice/generated/fan.binding.ts"
import { fanRequests } from "#integration/slice/generated/fan.programs.ts"
import { AppLogin } from "#integration/slice/logins.ts"
import snapshotFile from "#integration/slice/migrations/slice/snapshot.json" with { type: "json" }
import { Want } from "#integration/slice/relations.ts"
import { Loader } from "#integration/slice/roles.ts"
import { ringOnAndDrain } from "#integration/support/run.ts"
import {
	generatedFrom,
	openAuditor,
	openLedgers,
	rows,
	sliceCase
} from "#integration/support/slice.ts"
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
								const asked = fanAppRequests.Wanted({ batch: event.batch })
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
										asked: fanAppRequests.Wanted({ batch })
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

/**
 * Where a derived root's request is composed: a write over the app's schema served by the flow's writer, or by the
 * app's composing role, another role holding the schema whole (slice/composing.ts); a configuration of the composing
 * role alone, inserting every relation it inserts or lacking one, which `grizzle generate` drafts, certifies and
 * compiles as a deploy would; or a write over a level above the schema.
 */
type Composition =
	| { readonly kind: "the flow's writer" }
	| { readonly kind: "the composing role" }
	| { readonly kind: "a configuration of the composing role" }
	| { readonly kind: "a composing role lacking one insert"; readonly lacking: ComposerInsert }
	| { readonly kind: "a write over a level above the schema" }

/** A relation the composing role inserts: the app's want and order, and each its requests insert. */
type ComposerInsert = (typeof composerInserts)[number]

const compositions: Gen<Composition> = (source) =>
	source.draw(
		oneOf<Composition>([
			() => ({ kind: "the flow's writer" }),
			() => ({ kind: "the composing role" }),
			() => ({ kind: "a configuration of the composing role" }),
			(s) => ({
				kind: "a composing role lacking one insert",
				lacking: s.draw(element(composerInserts))
			}),
			() => ({ kind: "a write over a level above the schema" })
		])
	)

/**
 * The slice's configuration with its composing login alone, whose role inserts `inserts`, running the composing role's
 * programs: a module's text, which `grizzle generate` reads in a directory of its own beside the slice (support/slice.ts
 * generatedFrom).
 */
const composingConfig = (
	inserts: ReadonlyArray<ComposerInsert>
): string => `import { defineConfig, login, role, wholeEntriesOf } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { composerPrograms } from "#integration/slice/composing.ts"

const composer = role(App, "composer", wholeEntriesOf(App), {
	insert: [${Arr.join(
		Arr.map(inserts, (insert) => `"${insert}"`),
		", "
	)}]
})

export default defineConfig({
	schemas: [App],
	logins: [login(App, "composing", [composer], { workload: [composerPrograms(composer)] })],
	contracts: [],
	migrations: "migrations",
	rolePrefixBytes: 13,
	connection: () => {
		throw new Error("grizzle generate connects to nothing")
	}
})
`

/** What a write over a level above the app's schema writes beside the request, as metis's proctored submit does. */
const Noted = relation("Noted", { size: pg.bigint }, ["size"])

/** A level above the app's schema, as metis's proctoring levels stand above essay grading's. */
const Above = schema.extend([App], "SliceAbove", [Noted], [])

/**
 * Composes a derived app root's request into every write of the app's over its schema or a level above it: the fan's
 * Wanted, sequenced after the sizes the write wants, compiled as a workload of the fan's writer and of the app's
 * composing role, which inserts what the request inserts (`fanRequestWrites`), as it compiles the chain's Ordered, a
 * given root's, beside the app's order; and built into a write over a level above the schema (its levels alone: no
 * installation holds that level). A role that lacks any one relation the composing role inserts cannot run its
 * programs: `grizzle generate`, which drafts, certifies and compiles whatever a configuration holds, drafts the
 * composing role's configuration alone and refuses it with any one relation taken from the role's list. A login no
 * installation holds is no test's to compile (grizzle's compileServed refuses it, UninstalledRole), so both verdicts
 * are generate's.
 *
 * Oracle (specification): docs/decisions.md, a root the app's own write requests is written over the app's schema, so
 * it composes into any of the app's writes over the schema or a level above it, run by a role that holds it whole and
 * inserts what the request inserts.
 *
 * Box: its suite's, every case of it (the places a write composes the fan's Wanted request, the chain's Ordered beside
 * it in the composing role's, the composing role's configuration, and that configuration lacking each relation its
 * role inserts).
 */
export const aDerivedAppRequestComposesIntoEveryWriteOverItsSchema = property.exhaust(
	finite(compositions),
	{
		box: "the fan's Wanted request compiled for the fan's writer and for the app's composing role, the chain's Ordered for that role, a configuration whose composing role lacks each relation it inserts, and the request in a write over a level above the app's schema",
		needs: {},
		situations: [
			"the flow's writer",
			"the composing role",
			"a configuration of the composing role",
			"a composing role lacking one insert",
			"a write over a level above the schema"
		] satisfies ReadonlyArray<Reached<Composition["kind"]>>,
		check:
			(_, c: Case<Composition["kind"]>) =>
			(
				composer
			): Effect.Effect<void, ServedRefusal | PlatformError.PlatformError, CheckContext> => {
				c.note(composer.kind)
				switch (composer.kind) {
					case "the flow's writer":
						return Effect.asVoid(
							compileServed(AppLogin, snapshotFile, [
								workload(Loader, {
									wantRun: clocked(
										ChangeSet.sequence(
											ChangeSet.empty(Loader).insert(Want, []),
											fanRequests.Wanted
										),
										{ [denClock]: "millis" },
										{ [denClock]: denInstantKey }
									)
								})
							])
						)
					case "the composing role":
						return Effect.asVoid(
							compileServed(Composing, snapshotFile, [composerPrograms(Composer)])
						)
					case "a configuration of the composing role":
						return Effect.map(generatedFrom(composingConfig(composerInserts)), (generated) => {
							assert.ok(
								Result.isSuccess(generated),
								"a composing role inserting every relation its programs write is drafted and certified"
							)
						})
					case "a composing role lacking one insert":
						return Effect.map(
							generatedFrom(
								composingConfig(
									Arr.filter(composerInserts, (insert) => insert !== composer.lacking)
								)
							),
							(generated) => {
								assert.ok(
									Result.isFailure(generated) && generated.failure._tag === "SetupFailed",
									`a composing role that does not insert ${composer.lacking} cannot run its programs`
								)
							}
						)
					case "a write over a level above the schema":
						return Effect.asVoid(
							Effect.sync(() =>
								ChangeSet.sequence(ChangeSet.empty(Above).insert(Noted, []), fanRequests.Wanted)
							)
						)
				}
			},
		oracle: {
			kind: "specification",
			name: "a derived app root's request composes into any of the app's writes over its schema or a level above it"
		},
		kept: [],
		kills: [
			{
				file: "packages/den/integration/slice/generated/fan.programs.ts",
				original: "\tWanted: ChangeSet.empty(App)\n",
				replacement: "\tWanted: ChangeSet.empty(Loader)\n",
				why: "The request is written over the fan's writer role: neither another role holding the same schema nor a write over a level above it can compose it, and each is refused."
			},
			{
				file: "packages/den/integration/slice/generated/fan.programs.ts",
				original:
					'\tWanted: ["FanScope", "FanExclusiveKey", "FanWantedKey", "FanWantedInput", "FanRoot"] as const\n',
				replacement:
					'\tWanted: ["FanScope", "FanExclusiveKey", "FanWantedKey", "FanWantedInput"] as const\n',
				why: "The request's insert list omits its Root: a role that inserts what the list names cannot write the request, and its workload's compile is refused."
			},
			{
				file: "packages/den/integration/slice/generated/fan.programs.ts",
				original:
					'\tWanted: ["FanScope", "FanExclusiveKey", "FanWantedKey", "FanWantedInput", "FanRoot"] as const\n',
				replacement:
					'\tWanted: ["FanScope", "FanExclusiveKey", "FanWantedKey", "FanWantedInput", "FanRoot", "FanResult"] as const\n',
				why: "The request's insert list names a relation the request never inserts, a step commit's: a role without it still writes the request, so the list grants more than the request needs."
			},
			{
				file: "packages/den/integration/slice/generated/chain.programs.ts",
				original:
					'\tOrdered: ["ChainScope", "ChainOrderedInput", "ChainRequestedWith", "ChainRoot"] as const\n',
				replacement:
					'\tOrdered: ["ChainScope", "ChainOrderedInput", "ChainRequestedWith", "ChainRoot", "ChainResult"] as const\n',
				why: "A given root's request's insert list names a step commit's relation too: a role without it still writes the request, so the list grants more than the request needs."
			}
		]
	}
)

/** Whether a batch's root stands under its own key's text before a request of it under a renamed field's text. */
type Renamed = "a renamed field's key after its fields' root" | "a renamed field's key alone"

const renamings: Gen<Renamed> = (source) =>
	source.draw(boolean)
		? "a renamed field's key after its fields' root"
		: "a renamed field's key alone"

/**
 * Keys a derived root by its fields, whatever text names them: the fan's Wanted requested under the key text a deploy
 * that renamed its key's field `batch` to `group` computes for the same batch (runtime/bind.ts derivedKey), so its root
 * scope is another. Where the batch's root stands under its own text, the request is refused, the key's fields naming
 * that root already; where none stands, its root stands alone.
 *
 * Oracle (specification): docs/decisions.md, a derived root's key is keyed by its fields, each text by its digest, so
 * one key's fields name one root and a request of them under another key text is refused by that law where a root of
 * them stands, and fails for nothing else.
 *
 * Box: its suite's, every case of it (the renamed key's request after its batch's root, and alone).
 */
export const aKeysFieldsNameOneRoot = property.exhaust(finite(renamings), {
	box: "the fan's Wanted requested under a renamed field's key text, after its batch's root and alone",
	needs: { slice: sliceCase },
	situations: [
		"a renamed field's key after its fields' root",
		"a renamed field's key alone"
	] satisfies ReadonlyArray<Reached<Renamed>>,
	check:
		({ slice }, c: Case<Renamed>) =>
		(renamed) =>
			Effect.flatMap(slice, (services) =>
				Effect.provideContext(
					Effect.gen(function* () {
						c.note(renamed)
						const { loader } = yield* openLedgers
						const batch = "renamed"
						const want = { insert: { Want: [{ batch, size: 2n }] } }
						if (renamed === "a renamed field's key after its fields' root") {
							yield* settled(
								loader.workload.wantRun.once({
									params: fanAppRequests.Wanted({ batch }).params,
									facts: want
								})
							)
						}
						const keyText = derivedKey(["group"], { group: batch })
						const scope = rootScope("Fan", "Wanted", keyText)
						const keys = exclusiveRows(
							"Fan",
							"Wanted",
							fanFlow.kinds[6].exclusive,
							{ batch },
							scope
						)
						const requested = yield* Effect.exit(
							settled(
								loader.workload.wantRun.once({
									params: {
										fanWantedScope: scope,
										fanWantedKey: keyText,
										fanWantedFanScope: [{ scope, root: scope }],
										fanWantedFanExclusiveKey: Arr.map(keys, (k) => ({ ...k, root: scope })),
										fanWantedKeyBatch: batch
									},
									facts: want
								})
							)
						)
						const refusedOnItsFields = Option.exists(
							Exit.findErrorOption(requested),
							(error) =>
								error.kind === "refused" &&
								Arr.some(
									refusedLaws(error.refused),
									({ law }) => law.kind === "key" && law.side.relation === "FanWantedKey"
								)
						)
						assert.equal(
							refusedOnItsFields,
							renamed === "a renamed field's key after its fields' root",
							"a request under another text of a key's fields is refused by the key's law exactly where a root of those fields stands"
						)
						assert.equal(
							Exit.isFailure(requested),
							refusedOnItsFields,
							"the request fails for nothing else"
						)
					}),
					services
				)
			),
	oracle: {
		kind: "specification",
		name: "a derived root's key is keyed by its fields, so one key's fields name one root"
	},
	kept: [],
	kills: [
		{
			file: "packages/den/integration/slice/generated/fan.fragment.ts",
			original: '\t\tkey(on(FanWantedKey, "batchDigest")),\n',
			replacement: "",
			why: "No law keys the key's fields: the installed index still refuses the renamed text's root, but as no law of the code's, so the refusal names no key law and the request fails for something else."
		}
	]
})
