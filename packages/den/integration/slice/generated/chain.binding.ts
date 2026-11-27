import { mintEnvironment } from "@bjornpagen/den/lower/keys"
import {
	any,
	committedFacts,
	dueOf,
	fresh,
	held,
	one,
	only,
	readingOf,
	recordText,
	rowsOf,
	signals,
	spawnedOf,
	type SpawnRows
} from "@bjornpagen/den/runtime/bind"
import {
	edgeStep,
	atOnce,
	finishStep,
	rootScope,
	codecTextsOf,
	inputDigest,
	inputFingerprint,
	rowDigest,
	startedStep
} from "@bjornpagen/den/runtime/identity"
import type {
	FlowNeeds,
	Admission,
	Ledger,
	RootRunner,
	ScopeView,
	Snapshot,
	Spawned
} from "@bjornpagen/den/runtime/ledger"
import { UnknownPauseTarget } from "@bjornpagen/den/runtime/ledger"
import { type PauseChains, pauseIn, resumeIn } from "@bjornpagen/den/runtime/seats"
import { settled } from "@bjornpagen/den/runtime/settled"
import { runnerOf } from "@bjornpagen/den/runtime/turn"
import { FlowName } from "@bjornpagen/den/transport"
/** The ledger port of the flow Chain over its served programs; `den generate` writes it, and nothing edits it. */
import { type Addition, recordsFacts, Sha256 } from "@bjornpagen/grizzle"
import { codecText } from "@bjornpagen/grizzle/compile"
import type { MemberHandle } from "@bjornpagen/grizzle/runtime"
import { Array as Arr, Brand, Effect, Option, pipe, Result, Stream } from "effect"
import { chain } from "#integration/slice/flows.ts"
import {
	seqMint,
	ChainPausable,
	chain_page_read_weights_agiabippcbobbRecords,
	chain_page_read_earlier_dgehlbgebidjcRecords,
	chain_page_read_tree_lakencnpkciinRecords,
	chainGraph,
	chain_chain_run_input_glnkafcnkbnnn,
	chain_ordered_input_pbjpmafopnahk
} from "#integration/slice/generated/chain.fragment.ts"
import type {
	ChainScope,
	ChainAdmitted,
	ChainFinish,
	ChainStartStep,
	chain_page_input_jhliinhchcgno,
	chain_page_input_after_gdigbcabbnakb,
	chain_next_bbflpfpnlejpm,
	ChainKind,
	ChainRootKind
} from "#integration/slice/generated/chain.fragment.ts"
import type {
	chainDenPrograms,
	chainCoordinatorPrograms,
	chainRetirerPrograms,
	chainCommitPrograms
} from "#integration/slice/generated/chain.programs.ts"

/** The text of a row step Page's read `weights` found, its digest's input. */
const chain_page_read_weights_agiabippcbobbText = recordText(chain.kinds[0].reads.named.weights)
/** The text of a row step Page's read `earlier` found, its digest's input. */
const chain_page_read_earlier_dgehlbgebidjcText = recordText(chain.kinds[0].reads.named.earlier)
/** The text of a row step Page's read `tree` found, its digest's input. */
const chain_page_read_tree_lakencnpkciinText = recordText(chain.kinds[0].reads.named.tree)
/** The codec text of each declared field of chain_chain_run_input_glnkafcnkbnnn, a request's input row, bound once (grizzle's codecText). */
const chain_chain_run_input_glnkafcnkbnnnTexts = Object.freeze({
	feed: codecText(chain_chain_run_input_glnkafcnkbnnn.fields.feed),
	pages: codecText(chain_chain_run_input_glnkafcnkbnnn.fields.pages)
})
/** The codec text of each declared field of chain_ordered_input_pbjpmafopnahk, a request's input row, bound once (grizzle's codecText). */
const chain_ordered_input_pbjpmafopnahkTexts = Object.freeze({
	feed: codecText(chain_ordered_input_pbjpmafopnahk.fields.feed),
	pages: codecText(chain_ordered_input_pbjpmafopnahk.fields.pages)
})
/** The fingerprint of root kind ChainRun's input heading, taken once. */
const chainChainRunHeading = inputFingerprint(
	'137:35:chain_chain_run_input_glnkafcnkbnnn75:4:feed66:8:closedId40:chain_chain_run_input_feed_dcnlhjpledlkf4:news5:sport18:5:pages9:pg.bigint287:6:digest275:[...pipe([{ scope: scope, root: scope, feed: input.feed, pages: input.pages }], Arr.flatMap((row) => [Result.succeed("chain_chain_run_input_glnkafcnkbnnn"), chain_chain_run_input_glnkafcnkbnnnTexts.feed(row.feed), chain_chain_run_input_glnkafcnkbnnnTexts.pages(row.pages)]))]'
)
/** The fingerprint of root kind Ordered's input heading, taken once. */
const chainOrderedHeading = inputFingerprint(
	'133:33:chain_ordered_input_pbjpmafopnahk73:4:feed64:8:closedId38:chain_ordered_input_feed_hbpmfpphpfngm4:news5:sport18:5:pages9:pg.bigint281:6:digest269:[...pipe([{ scope: scope, root: scope, feed: input.feed, pages: input.pages }], Arr.flatMap((row) => [Result.succeed("chain_ordered_input_pbjpmafopnahk"), chain_ordered_input_pbjpmafopnahkTexts.feed(row.feed), chain_ordered_input_pbjpmafopnahkTexts.pages(row.pages)]))]'
)

/** The handles the ledger calls: den's role's, its coordinator role's, and the app role's commits, from whichever logins serve them. */
export interface ChainHandles {
	readonly den: {
		readonly [K in keyof typeof chainDenPrograms]: MemberHandle<(typeof chainDenPrograms)[K]>
	}
	readonly coordinator: {
		readonly [K in keyof typeof chainCoordinatorPrograms]: MemberHandle<
			(typeof chainCoordinatorPrograms)[K]
		>
	}
	readonly retirer: {
		readonly [K in keyof typeof chainRetirerPrograms]: MemberHandle<
			(typeof chainRetirerPrograms)[K]
		>
	}
	readonly commits: {
		readonly [K in keyof typeof chainCommitPrograms]: MemberHandle<(typeof chainCommitPrograms)[K]>
	}
}

interface Rows {
	readonly ChainScope: ReadonlyArray<Addition<typeof ChainScope>>
	readonly ChainAdmitted: ReadonlyArray<Addition<typeof ChainAdmitted>>
	readonly ChainFinish: ReadonlyArray<Addition<typeof ChainFinish>>
	readonly ChainStartStep: ReadonlyArray<Addition<typeof ChainStartStep>>
	readonly chain_page_input_jhliinhchcgno: ReadonlyArray<
		Addition<typeof chain_page_input_jhliinhchcgno>
	>
	readonly chain_page_input_after_gdigbcabbnakb: ReadonlyArray<
		Addition<typeof chain_page_input_after_gdigbcabbnakb>
	>
	readonly chain_next_bbflpfpnlejpm: ReadonlyArray<Addition<typeof chain_next_bbflpfpnlejpm>>
}

/** What a call grows: the rows it inserts, the steps it spawns by when each is due, which the database writes, and what it spawned. */
interface Grown extends SpawnRows<(typeof ChainKind)["handles"][number]> {
	readonly rows: Rows
	readonly spawned: Spawned
}

const pausableOf = (
	target: string
): Effect.Effect<(typeof ChainPausable)["handles"][number], UnknownPauseTarget> =>
	Effect.mapError(
		Effect.fromOption(Arr.findFirst(ChainPausable.handles, (handle) => handle === target)),
		() => new UnknownPauseTarget({ flow: FlowName.make("Chain"), target })
	)

/** Each app root's request as a host names it, by the root: the flow, the root's scope, and the parameters of its printed request (`chainRequests`), which the app's write commits beside its own and rings once committed, with no ledger opened. */
export const chainAppRequests = Object.freeze({
	Ordered: (key: string, input: Parameters<(typeof chain.kinds)[2]["start"]>[0]) =>
		pipe(rootScope("Chain", "Ordered", key), (scope) => ({
			flow: FlowName.make("Chain"),
			scope,
			params: {
				chainOrderedScope: scope,
				chainOrderedKey: key,
				chainOrderedChainScope: [{ scope, root: scope }],
				chainOrderedchain_ordered_input_pbjpmafopnahk: [
					{ scope: scope, root: scope, feed: input.feed, pages: input.pages }
				],
				chainOrderedChainRequestedWith: Option.toArray(
					Option.map(
						codecTextsOf([
							...pipe(
								[{ scope: scope, root: scope, feed: input.feed, pages: input.pages }],
								Arr.flatMap((row) => [
									Result.succeed("chain_ordered_input_pbjpmafopnahk"),
									chain_ordered_input_pbjpmafopnahkTexts.feed(row.feed),
									chain_ordered_input_pbjpmafopnahkTexts.pages(row.pages)
								])
							)
						]),
						(texts) => ({
							root: scope,
							fingerprint: chainOrderedHeading,
							input: inputDigest("Chain", "Ordered", texts)
						})
					)
				)
			}
		}))
})

/** The ledger of the flow Chain over its handles, with the requests of the roots den requests. */
export const chainLedger = (h: ChainHandles) => {
	const noRows: Rows = {
		ChainScope: [],
		ChainAdmitted: [],
		ChainFinish: [],
		ChainStartStep: [],
		chain_page_input_jhliinhchcgno: [],
		chain_page_input_after_gdigbcabbnakb: [],
		chain_next_bbflpfpnlejpm: []
	}
	const nothingGrown: Grown = {
		rows: noRows,
		steps: [],
		timed: [],
		spawned: { steps: [], finishes: [] }
	}
	const hasChildren = (grown: Grown, scope: Sha256): boolean =>
		Arr.some(grown.rows.ChainStartStep, (s) => Sha256.equals(s.scope, scope))
	const joined = (a: Grown, b: Grown): Grown => ({
		rows: {
			ChainScope: [...a.rows.ChainScope, ...b.rows.ChainScope],
			ChainAdmitted: [...a.rows.ChainAdmitted, ...b.rows.ChainAdmitted],
			ChainFinish: [...a.rows.ChainFinish, ...b.rows.ChainFinish],
			ChainStartStep: [...a.rows.ChainStartStep, ...b.rows.ChainStartStep],
			chain_page_input_jhliinhchcgno: [
				...a.rows.chain_page_input_jhliinhchcgno,
				...b.rows.chain_page_input_jhliinhchcgno
			],
			chain_page_input_after_gdigbcabbnakb: [
				...a.rows.chain_page_input_after_gdigbcabbnakb,
				...b.rows.chain_page_input_after_gdigbcabbnakb
			],
			chain_next_bbflpfpnlejpm: [
				...a.rows.chain_next_bbflpfpnlejpm,
				...b.rows.chain_next_bbflpfpnlejpm
			]
		},
		steps: [...a.steps, ...b.steps],
		timed: [...a.timed, ...b.timed],
		spawned: {
			steps: [...a.spawned.steps, ...b.spawned.steps],
			finishes: [...a.spawned.finishes, ...b.spawned.finishes]
		}
	})
	const startChainRun = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(chain.kinds[1].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						ChainStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						chain_page_input_jhliinhchcgno: [
							{
								step: key,
								root: root,
								feed: spawn.input.feed,
								seq: seqMint(spawn.input.seq),
								pages: spawn.input.pages
							}
						],
						chain_page_input_after_gdigbcabbnakb: Option.toArray(
							Option.map(spawn.input.after, (value) => ({ step: key, root: root, value: value }))
						)
					},
					...spawnedOf(
						{ step: key, kind: "Page", scope: scope },
						dueOf(chain.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const startOrdered = (
		root: Sha256,
		scope: Sha256,
		input: Parameters<(typeof chain.kinds)[2]["start"]>[0]
	): Grown =>
		Arr.reduce(
			Arr.map(chain.kinds[2].start(input), (spawn, ordinal): Grown =>
				pipe(startedStep(scope, ordinal), (key): Grown => ({
					rows: {
						...noRows,
						ChainStartStep: [{ scope, ordinal: BigInt(ordinal), step: key, root }],
						chain_page_input_jhliinhchcgno: [
							{
								step: key,
								root: root,
								feed: spawn.input.feed,
								seq: seqMint(spawn.input.seq),
								pages: spawn.input.pages
							}
						],
						chain_page_input_after_gdigbcabbnakb: Option.toArray(
							Option.map(spawn.input.after, (value) => ({ step: key, root: root, value: value }))
						)
					},
					...spawnedOf(
						{ step: key, kind: "Page", scope: scope },
						dueOf(chain.kinds[0].due, spawn.input)
					)
				}))
			),
			nothingGrown,
			joined
		)
	const readchain_page_input_jhliinhchcgno = (root: Sha256, step: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(
					h.den.chainReadchain_page_input_jhliinhchcgno.once({ params: { root, step }, facts: {} })
				),
				one
			)
			const side0 = yield* Effect.map(
				settled(
					h.den.chainReadchain_page_input_after_gdigbcabbnakb.once({
						params: { root, step },
						facts: {}
					})
				),
				one
			)
			return Option.map(row, (found) => ({
				feed: found.feed,
				seq: Brand.nominal<bigint & Brand.Brand<"Seq">>()(found.seq),
				pages: found.pages,
				after: Option.map(side0, (o) => o.value)
			}))
		})
	const readchain_chain_run_input_glnkafcnkbnnn = (root: Sha256, scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(
					h.den.chainReadchain_chain_run_input_glnkafcnkbnnn.once({
						params: { root, scope },
						facts: {}
					})
				),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const readchain_ordered_input_pbjpmafopnahk = (root: Sha256, scope: Sha256) =>
		Effect.gen(function* () {
			const row = yield* Effect.map(
				settled(
					h.den.chainReadchain_ordered_input_pbjpmafopnahk.once({
						params: { root, scope },
						facts: {}
					})
				),
				one
			)
			return Option.map(row, (found) => ({ feed: found.feed, pages: found.pages }))
		})
	const pauseChains: PauseChains<(typeof ChainPausable)["handles"][number]> = {
		flow: FlowName.make("Chain"),
		turns: Effect.map(
			settled(h.coordinator.chainPauseTurns.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		live: Effect.map(
			settled(h.coordinator.chainPausedAll.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => ({ target: row.target, turn: row.turn }))
		),
		pause: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainPause.once({ params: {}, facts: { insert: { ChainPaused: [row] } } })
				)
			),
		resume: (row) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainResume.once({ params: {}, facts: { insert: { ChainResumed: [row] } } })
				)
			)
	}
	const coordination: Ledger<never>["coordination"] = {
		exclusiveTurns: Effect.succeed([]),
		exclusives: Effect.succeed([]),
		paused: pauseChains.live,
		holdExclusive: () => Effect.void,
		releaseExclusive: () => Effect.void,
		pause: (target) => Effect.flatMap(pausableOf(target), pauseIn(pauseChains)),
		resume: (target) => Effect.flatMap(pausableOf(target), resumeIn(pauseChains))
	}
	const request = {
		ChainRun: (key: string, input: Parameters<(typeof chain.kinds)[1]["start"]>[0]) =>
			pipe(rootScope("Chain", "ChainRun", key), (scope) =>
				pipe(
					h.den.chainRequestChainRun.once({
						params: {
							chainChainRunScope: scope,
							chainChainRunKey: key,
							chainChainRunChainScope: [{ scope, root: scope }],
							chainChainRunchain_chain_run_input_glnkafcnkbnnn: [
								{ scope: scope, root: scope, feed: input.feed, pages: input.pages }
							],
							chainChainRunChainRequestedWith: Option.toArray(
								Option.map(
									codecTextsOf([
										...pipe(
											[{ scope: scope, root: scope, feed: input.feed, pages: input.pages }],
											Arr.flatMap((row) => [
												Result.succeed("chain_chain_run_input_glnkafcnkbnnn"),
												chain_chain_run_input_glnkafcnkbnnnTexts.feed(row.feed),
												chain_chain_run_input_glnkafcnkbnnnTexts.pages(row.pages)
											])
										)
									]),
									(texts) => ({
										root: scope,
										fingerprint: chainChainRunHeading,
										input: inputDigest("Chain", "ChainRun", texts)
									})
								)
							)
						},
						facts: {}
					}),
					settled,
					fresh,
					Effect.map((accepted) => ({ flow: FlowName.make("Chain"), scope, fresh: accepted }))
				)
			)
	}
	const runners = {
		Page: runnerOf(
			chain.kinds[0],
			{
				input: ({ root, step }) => readchain_page_input_jhliinhchcgno(root, step),
				read: (input) =>
					Effect.flatMap(
						settled(
							h.commits.chainReadPage.once({
								params: chain.kinds[0].reads.params(input),
								facts: {}
							})
						),
						only
					),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = Arr.reduce(
							[
								Arr.reduce(
									Arr.map(chain.edges[0].next(done.input, done.output), (input, ordinal): Grown =>
										pipe(edgeStep(done.turn.step, "Next", ordinal), (key): Grown => ({
											rows: {
												...noRows,
												chain_next_bbflpfpnlejpm: [
													{
														from: done.turn.step,
														ordinal: BigInt(ordinal),
														to: key,
														root: done.turn.root
													}
												],
												chain_page_input_jhliinhchcgno: [
													{
														step: key,
														root: done.turn.root,
														feed: input.feed,
														seq: seqMint(input.seq),
														pages: input.pages
													}
												],
												chain_page_input_after_gdigbcabbnakb: Option.toArray(
													Option.map(input.after, (value) => ({
														step: key,
														root: done.turn.root,
														value: value
													}))
												)
											},
											...spawnedOf(
												{ step: key, kind: "Page", scope: done.turn.scope },
												dueOf(chain.kinds[0].due, input)
											)
										}))
									),
									nothingGrown,
									joined
								)
							],
							nothingGrown,
							joined
						)
						const recordedWeights = yield* Effect.forEach(done.rows.weights, (row) =>
							Effect.map(chain_page_read_weights_agiabippcbobbText(row), (text) => ({
								row,
								digest: rowDigest("weights", text)
							}))
						)
						const uniqueWeights = Arr.dedupeWith(recordedWeights, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const recordedEarlier = yield* Effect.forEach(done.rows.earlier, (row) =>
							Effect.map(chain_page_read_earlier_dgehlbgebidjcText(row), (text) => ({
								row,
								digest: rowDigest("earlier", text)
							}))
						)
						const uniqueEarlier = Arr.dedupeWith(recordedEarlier, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const recordedTree = yield* Effect.forEach(done.rows.tree, (row) =>
							Effect.map(chain_page_read_tree_lakencnpkciinText(row), (text) => ({
								row,
								digest: rowDigest("tree", text)
							}))
						)
						const uniqueTree = Arr.dedupeWith(recordedTree, (a, b) =>
							Sha256.equals(a.digest, b.digest)
						)
						const outcome = yield* settled(
							h.commits.chainCommitPage.once({
								params: { steps: grown.steps, root: done.turn.root, ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											...grown.rows,
											ChainResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ChainDone: [{ step: done.turn.step, root: done.turn.root }],
											ChainHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											chain_page_output_dniojohpmhcee: [
												{
													step: done.turn.step,
													root: done.turn.root,
													seq: seqMint(done.output.seq),
													items: done.output.items,
													earlier: done.output.earlier
												}
											],
											chain_page_output_next_pocjijjpkpono: Option.toArray(
												Option.map(done.output.next, (value) => ({
													step: done.turn.step,
													root: done.turn.root,
													value: value
												}))
											),
											...recordsFacts(
												chainGraph,
												chain_page_read_weights_agiabippcbobbRecords
											)(
												Arr.map(
													uniqueWeights,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											chain_page_read_weights_agiabippcbobb: Arr.map(
												recordedWeights,
												(found, ordinal) => ({
													step: done.turn.step,
													root: done.turn.root,
													ordinal: BigInt(ordinal),
													digest: found.digest
												})
											),
											...recordsFacts(
												chainGraph,
												chain_page_read_earlier_dgehlbgebidjcRecords
											)(
												Arr.map(
													uniqueEarlier,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											chain_page_read_earlier_dgehlbgebidjc: Arr.map(
												recordedEarlier,
												(found, ordinal) => ({
													step: done.turn.step,
													root: done.turn.root,
													ordinal: BigInt(ordinal),
													digest: found.digest
												})
											),
											...recordsFacts(
												chainGraph,
												chain_page_read_tree_lakencnpkciinRecords
											)(
												Arr.map(
													uniqueTree,
													(found) => [{ digest: found.digest }, found.row] as const
												)
											),
											chain_page_read_tree_lakencnpkciin: Arr.map(
												recordedTree,
												(found, ordinal) => ({
													step: done.turn.step,
													root: done.turn.root,
													ordinal: BigInt(ordinal),
													digest: found.digest
												})
											)
										}
									},
									done.writes.facts
								)
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.none()
		),
		ChainRunFinish: runnerOf(
			{
				name: "ChainRunFinish",
				uses: chain.kinds[1].finish.uses,
				retry: chain.kinds[1].finish.retry,
				waits: chain.kinds[1].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof chain.kinds)[1]["start"]>[0]
					readonly endings: Parameters<(typeof chain.kinds)[1]["finish"]["body"]>[1]
				}) => chain.kinds[1].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.chainStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readchain_chain_run_input_glnkafcnkbnnn(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputPageRows = yield* Effect.map(
							settled(h.den.chainOutputsChainRunPage.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const outputPageSide0 = yield* Effect.map(
							settled(
								h.den.chainOutputsChainRunPageNext.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputPageRows = yield* Effect.map(
							settled(h.den.chainInputsChainRunPage.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const inputPageSide0 = yield* Effect.map(
							settled(
								h.den.chainInputsChainRunPageAfter.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresPage = yield* Effect.map(
							settled(h.den.chainFailuresChainRunPage.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const inputPage = (child: (typeof inputPageRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputPageRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({
										feed: row.feed,
										seq: Brand.nominal<bigint & Brand.Brand<"Seq">>()(row.seq),
										pages: row.pages,
										after: Option.map(
											Arr.findFirst(inputPageSide0, (o) => Sha256.equals(o.step, row.step)),
											(o) => o.value
										)
									})
								)
							)
						const Page = [
							...(yield* Effect.forEach(outputPageRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputPage(row.step),
										output: Effect.succeed({
											seq: Brand.nominal<bigint & Brand.Brand<"Seq">>()(row.seq),
											items: row.items,
											earlier: row.earlier,
											next: Option.map(
												Arr.findFirst(outputPageSide0, (o) => Sha256.equals(o.step, row.step)),
												(o) => o.value
											)
										})
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresPage, (failed) =>
								Effect.map(inputPage(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Page } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.chainCommitChainRunFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ChainResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ChainDone: [{ step: done.turn.step, root: done.turn.root }],
											ChainHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											chain_chain_run_finish_output_lhniobmdeemdb: [
												{ step: done.turn.step, root: done.turn.root }
											]
										}
									},
									done.writes.facts
								)
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("ChainRun")
		),
		OrderedFinish: runnerOf(
			{
				name: "OrderedFinish",
				uses: chain.kinds[2].finish.uses,
				retry: chain.kinds[2].finish.retry,
				waits: chain.kinds[2].finish.waits,
				awaits: [],
				body: (read: {
					readonly input: Parameters<(typeof chain.kinds)[2]["start"]>[0]
					readonly endings: Parameters<(typeof chain.kinds)[2]["finish"]["body"]>[1]
				}) => chain.kinds[2].finish.body(read.input, read.endings)
			},
			{
				input: ({ root, step }) =>
					Effect.gen(function* () {
						const located = yield* Effect.map(
							settled(h.den.chainStepOf.once({ params: { root, step }, facts: {} })),
							one
						)
						if (Option.isNone(located)) {
							return Option.none()
						}
						const scope = located.value.scope
						const input = yield* readchain_ordered_input_pbjpmafopnahk(root, scope)
						if (Option.isNone(input)) {
							return Option.none()
						}
						const outputPageRows = yield* Effect.map(
							settled(h.den.chainOutputsOrderedPage.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const outputPageSide0 = yield* Effect.map(
							settled(
								h.den.chainOutputsOrderedPageNext.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const inputPageRows = yield* Effect.map(
							settled(h.den.chainInputsOrderedPage.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const inputPageSide0 = yield* Effect.map(
							settled(
								h.den.chainInputsOrderedPageAfter.once({ params: { root, scope }, facts: {} })
							),
							rowsOf
						)
						const failuresPage = yield* Effect.map(
							settled(h.den.chainFailuresOrderedPage.once({ params: { root, scope }, facts: {} })),
							rowsOf
						)
						const inputPage = (child: (typeof inputPageRows)[number]["step"]) =>
							held(
								Option.map(
									Arr.findFirst(inputPageRows, (row) => Sha256.equals(row.step, child)),
									(row) => ({
										feed: row.feed,
										seq: Brand.nominal<bigint & Brand.Brand<"Seq">>()(row.seq),
										pages: row.pages,
										after: Option.map(
											Arr.findFirst(inputPageSide0, (o) => Sha256.equals(o.step, row.step)),
											(o) => o.value
										)
									})
								)
							)
						const Page = [
							...(yield* Effect.forEach(outputPageRows, (row) =>
								Effect.map(
									Effect.all({
										input: inputPage(row.step),
										output: Effect.succeed({
											seq: Brand.nominal<bigint & Brand.Brand<"Seq">>()(row.seq),
											items: row.items,
											earlier: row.earlier,
											next: Option.map(
												Arr.findFirst(outputPageSide0, (o) => Sha256.equals(o.step, row.step)),
												(o) => o.value
											)
										})
									}),
									(ended) => ({ _tag: "Done" as const, ...ended })
								)
							)),
							...(yield* Effect.forEach(failuresPage, (failed) =>
								Effect.map(inputPage(failed.step), (given) => ({
									_tag: "Failed" as const,
									input: given
								}))
							))
						]
						return Option.some({ input: input.value, endings: { Page } })
					}),
				read: () => Effect.succeed([]),
				commit: (done) =>
					Effect.gen(function* () {
						const grown = nothingGrown
						const outcome = yield* settled(
							h.commits.chainCommitOrderedFinish.once({
								params: { ...done.writes.params },
								facts: committedFacts(
									{
										insert: {
											ChainResult: [
												{ step: done.turn.step, root: done.turn.root, outcome: "done" }
											],
											ChainDone: [{ step: done.turn.step, root: done.turn.root }],
											ChainHeld: [
												{ step: done.turn.step, root: done.turn.root, attempt: done.turn.attempt }
											],
											chain_ordered_finish_output_nnemphmmfdblb: [
												{ step: done.turn.step, root: done.turn.root }
											]
										}
									},
									done.writes.facts
								)
							})
						)
						return { outcome, spawned: grown.spawned }
					}),
				fail: (failed) => Effect.die(failed.error)
			},
			Option.some("Ordered")
		)
	}
	const roots: { readonly [K in (typeof ChainRootKind)["handles"][number]]: RootRunner } = {
		ChainRun: {
			window: chain.kinds[1].window,
			precondition: chain.kinds[1].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readchain_chain_run_input_glnkafcnkbnnn(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startChainRun(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "ChainRunFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof ChainAdmitted>> = [
						...grown.rows.ChainAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof ChainFinish>> = [
						...grown.rows.ChainFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.chainAdmit.once({
							params: { steps, root: scope },
							facts: {
								insert: {
									ChainScope: grown.rows.ChainScope,
									ChainStartStep: grown.rows.ChainStartStep,
									chain_page_input_jhliinhchcgno: grown.rows.chain_page_input_jhliinhchcgno,
									chain_page_input_after_gdigbcabbnakb:
										grown.rows.chain_page_input_after_gdigbcabbnakb,
									ChainAdmitted: admitted,
									ChainFinish: finishes
								}
							}
						})
					)
					return Option.some({
						outcome,
						spawned: {
							steps: grown.spawned.steps,
							finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])]
						}
					})
				})
		},
		Ordered: {
			window: chain.kinds[2].window,
			precondition: chain.kinds[2].precondition,
			admit: (scope: Sha256) =>
				Effect.gen(function* () {
					const input = yield* readchain_ordered_input_pbjpmafopnahk(scope, scope)
					if (Option.isNone(input)) {
						return Option.none()
					}
					const grown = startOrdered(scope, scope, input.value)
					const finish = finishStep(scope)
					const steps: Grown["steps"] = [
						...grown.steps,
						{ step: finish, kind: "OrderedFinish", scope, delay: atOnce }
					]
					const admitted: ReadonlyArray<Addition<typeof ChainAdmitted>> = [
						...grown.rows.ChainAdmitted,
						{ scope, root: scope }
					]
					const finishes: ReadonlyArray<Addition<typeof ChainFinish>> = [
						...grown.rows.ChainFinish,
						{ scope, step: finish, root: scope }
					]
					const outcome = yield* settled(
						h.den.chainAdmit.once({
							params: { steps, root: scope },
							facts: {
								insert: {
									ChainScope: grown.rows.ChainScope,
									ChainStartStep: grown.rows.ChainStartStep,
									chain_page_input_jhliinhchcgno: grown.rows.chain_page_input_jhliinhchcgno,
									chain_page_input_after_gdigbcabbnakb:
										grown.rows.chain_page_input_after_gdigbcabbnakb,
									ChainAdmitted: admitted,
									ChainFinish: finishes
								}
							}
						})
					)
					return Option.some({
						outcome,
						spawned: {
							steps: grown.spawned.steps,
							finishes: [...grown.spawned.finishes, ...(hasChildren(grown, scope) ? [] : [finish])]
						}
					})
				})
		}
	}
	const ledger: Ledger<FlowNeeds<typeof chain>> = {
		flow: FlowName.make("Chain"),
		now: Effect.flatMap(settled(h.den.chainNow.once({ params: {}, facts: {} })), readingOf),
		reading: (environment) =>
			Effect.flatMap(
				settled(
					h.den.chainReading.once({
						params: { "serving.environment": mintEnvironment(environment) },
						facts: {}
					})
				),
				(rows) =>
					Effect.flatMap(only(rows), (row) =>
						Effect.map(readingOf(row.now), (now) => ({
							now,
							serving: Option.map(Arr.head(row.serving), (served) => served.deployment)
						}))
					)
			),
		promote: (host) =>
			Effect.asVoid(
				settled(
					h.coordinator.chainPromote.once({
						params: { environment: mintEnvironment(host.environment), deployment: host.deployment },
						facts: {}
					})
				)
			),
		authenticated: Effect.asVoid(
			settled(h.commits.chainAuthenticated.once({ params: {}, facts: {} }))
		),
		holds: Effect.succeed([]),
		stepOf: (at) =>
			Effect.map(
				settled(h.den.chainStepOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) =>
					Option.map(one(rows), (row) => ({
						runner: runners[row.kind],
						scope: row.scope,
						due: row.due
					}))
			),
		resultOf: (at) =>
			Effect.map(
				settled(h.den.chainResultOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.outcome)
			),
		heldOf: (at) =>
			Effect.map(
				settled(h.den.chainHeldOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				(rows) => Option.map(one(rows), (row) => row.attempt)
			),
		claimsOf: (at) =>
			Effect.map(
				settled(h.den.chainClaimsOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		retriesOf: (at) =>
			Effect.map(
				settled(h.den.chainRetriesOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		fencedOf: (at) =>
			Effect.map(
				settled(h.den.chainFencedOf.once({ params: { root: at.root, step: at.step }, facts: {} })),
				rowsOf
			),
		scopeOf: ({ root, scope }) =>
			Effect.gen(function* () {
				if (!Sha256.equals(root, scope)) {
					return Option.none()
				}
				const standing = yield* Effect.map(
					settled(h.den.chainRootOf.once({ params: { root }, facts: {} })),
					one
				)
				if (Option.isNone(standing)) {
					return Option.none()
				}
				const admitted = yield* Effect.map(
					settled(h.den.chainAdmittedOf.once({ params: { root, scope }, facts: {} })),
					one
				)
				const skipped = yield* Effect.map(
					settled(h.den.chainSkippedOf.once({ params: { root, scope }, facts: {} })),
					one
				)
				const admission: Admission = Option.isSome(admitted)
					? "admitted"
					: Option.isSome(skipped)
						? "skipped"
						: "requested"
				return Option.some<ScopeView>({
					place: "root",
					scope,
					kind: standing.value.kind,
					key: standing.value.key,
					at: standing.value.at,
					admission,
					exclusive: Option.none(),
					runner: roots[standing.value.kind]
				})
			}),
		unended: ({ root, scope }) =>
			h.den.chainUnendedSteps.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
		finished: ({ root, scope }) =>
			h.den.chainFinished.once({ params: { root, scope }, facts: {} }).pipe(settled, any),
		busy: Effect.succeed([]),
		awaits: [],
		awaiting: () => Effect.succeed(false),
		ready: Effect.succeed([]),
		claim: (row) =>
			Effect.flatMap(
				settled(
					h.den.chainClaim.once({
						params: { budget: row.budget },
						facts: {
							insert: { ChainClaim: [{ step: row.step, root: row.root }], ChainEnded: row.lapsed }
						}
					})
				),
				(outcome) => Effect.map(only(rowsOf(outcome.reads.held)), (c) => c.attempt)
			),
		retry: (row) =>
			settled(
				h.den.chainRetry.once({
					params: {
						step: row.step,
						attempt: row.attempt,
						delay: row.delay,
						why: row.why,
						root: row.root
					},
					facts: {
						insert: { ChainEnded: [{ step: row.step, root: row.root, attempt: row.attempt }] }
					}
				})
			),
		fence: (row) =>
			settled(
				h.den.chainFence.once({
					params: {},
					facts: {
						insert: {
							ChainEnded: [{ step: row.step, root: row.root, attempt: row.attempt }],
							ChainFenced: [row]
						}
					}
				})
			),
		refuse: ({ step, root, attempt }, law) =>
			settled(
				h.den.chainRefuse.once({
					params: {},
					facts: {
						insert: {
							ChainResult: [{ step, root, outcome: "failed" }],
							ChainFailed: [{ step, root }],
							ChainHeld: [{ step, root, attempt }],
							ChainRefusal: [{ step, root, law }]
						}
					}
				})
			),
		skip: (scope, by) =>
			settled(
				h.den.chainSkip.once({
					params: {},
					facts: { insert: { ChainSkipped: [{ scope, by, root: scope }] } }
				})
			),
		exhaust: ({ step, root, attempt }) =>
			settled(
				h.den.chainExhaust.once({
					params: {},
					facts: {
						insert: {
							ChainResult: [{ step, root, outcome: "failed" }],
							ChainFailed: [{ step, root }],
							ChainHeld: [{ step, root, attempt }],
							ChainExhausted: [{ step, root }]
						}
					}
				})
			),
		finishedRoots: Effect.map(
			settled(h.den.chainFinishedRoots.once({ params: {}, facts: {} })),
			(rows) => Arr.map(rowsOf(rows), (row) => row.scope)
		),
		retire: (root) => settled(h.retirer.chainRetire.once({ params: { root }, facts: {} })),
		snapshot: Effect.flatMap(settled(h.den.chainSnapshot.once({ params: {}, facts: {} })), (rows) =>
			Effect.map(only(rows), (read): Snapshot<FlowNeeds<typeof chain>> => {
				const view = (scope: Sha256, admission: Admission): ReadonlyArray<ScopeView> =>
					Option.match(
						Arr.findFirst(read.roots, (o) => Sha256.equals(o.scope, scope)),
						{
							onSome: (o): ReadonlyArray<ScopeView> => [
								{
									place: "root",
									scope,
									kind: o.kind,
									key: o.key,
									at: o.at,
									admission,
									exclusive: Option.none(),
									runner: roots[o.kind]
								}
							],
							onNone: (): ReadonlyArray<ScopeView> => []
						}
					)
				return {
					steps: Arr.map(read.steps, (s) => ({
						step: s.step,
						root: s.root,
						runner: runners[s.kind],
						scope: s.scope,
						due: s.due
					})),
					claims: read.claims,
					retries: read.retries,
					fenced: read.fenced,
					scopes: [
						...Arr.flatMap(read.requested, (s) => view(s.scope, "requested")),
						...Arr.flatMap(read.running, (s) => view(s.scope, "admitted"))
					],
					holds: [],
					exclusives: [],
					paused: Arr.map(read.paused, (row) => row.target),
					busy: [],
					awaiting: []
				}
			})
		),
		changes: Stream.mergeAll(
			[
				signals(h.den.chainPending.watch({ params: {}, facts: {} })),
				signals(h.den.chainRequested.watch({ params: {}, facts: {} })),
				signals(h.den.chainRunning.watch({ params: {}, facts: {} })),
				signals(h.coordinator.chainPausedAll.watch({ params: {}, facts: {} }))
			],
			{ concurrency: "unbounded" }
		),
		coordination,
		scheduled: []
	}
	return {
		ledger,
		request
	}
}
