import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Sync to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import * as g from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { sync as declaredFlow } from "#integration/slice/flows.ts"
import {
	SyncKind,
	SyncRootKind,
	SyncOutcome,
	SyncRetryWhy,
	SyncPausable,
	SyncScope,
	SyncRoot,
	SyncRequestedWith,
	SyncExclusiveKey,
	SyncAdmitted,
	SyncSkipped,
	SyncStep,
	SyncStartStep,
	SyncFinish,
	SyncClaim,
	SyncEnded,
	SyncRetry,
	SyncFenced,
	SyncResult,
	SyncDone,
	SyncFailed,
	SyncHeld,
	SyncRefusal,
	SyncExhausted,
	SyncCopyInput,
	SyncBuildInput,
	SyncSyncRunInput,
	SyncGoldInput,
	SyncCopyOutput,
	SyncBuildOutput,
	SyncSyncRunFinishOutput,
	SyncGoldFinishOutput,
	SyncExclusive,
	SyncReleased,
	SyncPaused,
	SyncResumed,
	SyncServed,
	syncGraph,
	syncCoordination
} from "#integration/slice/generated/sync.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Sync: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const SyncDen = g.role(
	App,
	"sync_den",
	{
		...syncGraph.relations,
		SyncExclusive,
		SyncReleased,
		SyncPaused,
		SyncResumed,
		SyncServed,
		ChainStep: App.relations.ChainStep,
		ChainResult: App.relations.ChainResult
	},
	{
		insert: [
			"SyncScope",
			"SyncRoot",
			"SyncRequestedWith",
			"SyncExclusiveKey",
			"SyncAdmitted",
			"SyncSkipped",
			"SyncStep",
			"SyncStartStep",
			"SyncFinish",
			"SyncClaim",
			"SyncEnded",
			"SyncRetry",
			"SyncFenced",
			"SyncResult",
			"SyncDone",
			"SyncFailed",
			"SyncHeld",
			"SyncRefusal",
			"SyncExhausted",
			"SyncCopyInput",
			"SyncBuildInput",
			"SyncSyncRunInput",
			"SyncGoldInput",
			"SyncSyncRunFinishOutput",
			"SyncGoldFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Sync: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const SyncCoordinator = g.role(
	App,
	"sync_coordinator",
	{
		SyncKind,
		SyncRootKind,
		SyncOutcome,
		SyncRetryWhy,
		SyncPausable,
		SyncExclusive,
		SyncReleased,
		SyncPaused,
		SyncResumed,
		SyncServed
	},
	{ insert: ["SyncExclusive", "SyncReleased", "SyncPaused", "SyncResumed", "SyncServed"] }
)

const syncPendingRead = g.query(SyncDen).rule((r) => {
	const { root, step, kind, scope, due } = g.v(SyncStep, "step")
	return r
		.match(SyncStep, { root, step, kind, scope, due })
		.where(r.not(SyncResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const syncRequestedRead = g.query(SyncDen).rule((r) => {
	const { scope } = g.v(SyncScope, "scope")
	return r
		.match(SyncRoot, { root: scope })
		.match(SyncScope, { root: scope, scope })
		.where(r.not(SyncAdmitted, { root: scope, scope }), r.not(SyncSkipped, { root: scope, scope }))
		.find({ scope })
})

const syncRunningRead = g.query(SyncDen).rule((r) => {
	const { root, scope, step } = g.v(SyncFinish, "finish")
	return r
		.match(SyncFinish, { root, scope, step })
		.where(r.not(SyncResult, { root, step }))
		.find({ scope })
})

const syncBusyChainRead = g.query(SyncDen).rule((r) => {
	const { root, step } = g.v(App.relations.ChainStep, "step")
	return r
		.match(App.relations.ChainStep, { root, step })
		.where(r.not(App.relations.ChainResult, { root, step }))
		.find({ step })
})

const syncLatestServed = g.query(SyncDen).rule((r) => {
	const { environment, at } = g.v(SyncServed, "served")
	return r
		.match(SyncServed, { environment, at })
		.where(r.eq(environment, r.param("environment", SyncServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const syncDenPrograms = Object.freeze({
	syncNow: g.clocked(
		g.query(syncGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncReading: g.clocked(
		g.query(SyncDen).reads({
			now: g.query(syncGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: g.query(SyncDen).rule((r) => {
				const { environment, at, deployment } = g.v(SyncServed, "served")
				return r
					.match(
						syncLatestServed.bind({
							environment: r.param("environment", SyncServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(SyncServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	syncClaim: g.clocked(
		g.ChangeSet.empty(syncGraph)
			.insertAllComputed(
				{ SyncClaim: [] },
				{
					until: g.Type.cast(
						g.Num.add(
							g.Type.base(g.param("denNow", DenInstant)),
							g.Type.base(g.param("budget", DenDelay))
						),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(SyncEnded, [])
			.read("held", (delta) =>
				g.query(syncGraph).rule((r) => {
					const { step, root, attempt } = g.v(delta.added(SyncClaim), "added")
					return r
						.match(delta.added(SyncClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncRetry: g.clocked(
		g.ChangeSet.empty(syncGraph)
			.insert(SyncEnded, [])
			.insert(
				SyncRetry,
				g.query(syncGraph).rule((r) =>
					r.find({
						step: r.param("step", SyncRetry.fields.step),
						attempt: r.param("attempt", SyncRetry.fields.attempt),
						at: g.Type.cast(
							g.Num.add(
								g.Type.base(r.param("denNow", DenInstant)),
								g.Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", SyncRetry.fields.why),
						root: r.param("root", SyncRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncFence: g.ChangeSet.empty(syncGraph).insert(SyncEnded, []).insert(SyncFenced, []),
	syncRefuse: g.ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncFailed, [])
		.insert(SyncHeld, [])
		.insert(SyncRefusal, []),
	syncExhaust: g.ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncFailed, [])
		.insert(SyncHeld, [])
		.insert(SyncExhausted, []),
	syncAdmit: g.clocked(
		g.ChangeSet.empty(syncGraph)
			.insert(SyncAdmitted, [])
			.insert(SyncFinish, [])
			.insert(SyncStartStep, [])
			.insert(SyncScope, [])
			.insert(SyncCopyInput, [])
			.insert(SyncBuildInput, [])
			.insert(
				SyncStep,
				g.query(syncGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: SyncStep.fields.step,
						kind: SyncStep.fields.kind,
						scope: SyncStep.fields.scope,
						delay: DenDelay
					})
					const { step, kind, scope, delay } = g.v(steps, "spawned")
					return r.match(steps, { step, kind, scope, delay }).find({
						step,
						kind,
						scope,
						due: g.Type.cast(
							g.Num.add(g.Type.base(r.param("denNow", DenInstant)), g.Type.base(delay)),
							DenInstant,
							denInstantKey
						),
						root: r.param("root", SyncStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncSkip: g.ChangeSet.empty(syncGraph).insert(SyncSkipped, []),
	syncSkippedOf: g.query(syncGraph).rule((r) => {
		const { root, scope, by } = g.v(SyncSkipped, "syncSkipped")
		return r
			.match(SyncSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", SyncSkipped.fields.root)),
				r.eq(scope, r.param("scope", SyncSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	syncStepOf: g.query(syncGraph).rule((r) => {
		const { root, step, kind, scope, due } = g.v(SyncStep, "syncStep")
		return r
			.match(SyncStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", SyncStep.fields.root)),
				r.eq(step, r.param("step", SyncStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	syncResultOf: g.query(syncGraph).rule((r) => {
		const { root, step, outcome } = g.v(SyncResult, "syncResult")
		return r
			.match(SyncResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", SyncResult.fields.root)),
				r.eq(step, r.param("step", SyncResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	syncHeldOf: g.query(syncGraph).rule((r) => {
		const { root, step, attempt } = g.v(SyncHeld, "syncHeld")
		return r
			.match(SyncHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", SyncHeld.fields.root)),
				r.eq(step, r.param("step", SyncHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	syncAdmittedOf: g.query(syncGraph).rule((r) => {
		const { root, scope } = g.v(SyncAdmitted, "syncAdmitted")
		return r
			.match(SyncAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", SyncAdmitted.fields.root)),
				r.eq(scope, r.param("scope", SyncAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	syncRootOf: g.query(syncGraph).rule((r) => {
		const { kind, key, at } = g.v(SyncRoot, "root")
		const { scope } = g.v(SyncScope, "scope")
		return r
			.match(SyncRoot, { root: scope, kind, key, at })
			.match(SyncScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", SyncRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	syncExclusiveKeyOf: g.query(syncGraph).rule((r) => {
		const { root, scope, key, id } = g.v(SyncExclusiveKey, "syncExclusiveKey")
		return r
			.match(SyncExclusiveKey, { root, scope, key, id })
			.where(
				r.eq(root, r.param("root", SyncExclusiveKey.fields.root)),
				r.eq(scope, r.param("scope", SyncExclusiveKey.fields.scope))
			)
			.find({ root, scope, key, id })
	}),
	syncFinishedRoots: g
		.query(syncGraph)
		.rule((r) => {
			const { scope, step } = g.v(SyncFinish, "finish")
			return r
				.match(SyncFinish, { root: scope, scope, step })
				.match(SyncResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = g.v(SyncSkipped, "skipped")
			return r.match(SyncSkipped, { root: scope, scope }).find({ scope })
		}),
	syncClaimsOf: g.query(syncGraph).rule((r) => {
		const { root, step, attempt, until } = g.v(SyncClaim, "claim")
		return r
			.match(SyncClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", SyncScope.fields.root)),
				r.eq(step, r.param("step", SyncStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	syncRetriesOf: g.query(syncGraph).rule((r) => {
		const { root, step, attempt, at, why } = g.v(SyncRetry, "retry")
		return r
			.match(SyncRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", SyncScope.fields.root)),
				r.eq(step, r.param("step", SyncStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	syncFencedOf: g.query(syncGraph).rule((r) => {
		const { root, step, attempt } = g.v(SyncFenced, "fenced")
		return r
			.match(SyncFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", SyncScope.fields.root)),
				r.eq(step, r.param("step", SyncStep.fields.step))
			)
			.find({ step, attempt })
	}),
	syncUnendedSteps: g.query(syncGraph).rule((r) => {
		const { root, step, scope } = g.v(SyncStep, "step")
		return r
			.match(SyncStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", SyncScope.fields.root)),
				r.eq(scope, r.param("scope", SyncScope.fields.scope)),
				r.not(SyncResult, { root, step }),
				r.not(SyncFinish, { root, scope, step })
			)
			.find({ step })
	}),
	syncFinished: g.query(syncGraph).rule((r) => {
		const { root, scope, step } = g.v(SyncFinish, "finish")
		return r
			.match(SyncFinish, { root, scope, step })
			.match(SyncResult, { root, step })
			.where(
				r.eq(root, r.param("root", SyncScope.fields.root)),
				r.eq(scope, r.param("scope", SyncScope.fields.scope))
			)
			.find({ step })
	}),
	syncPending: syncPendingRead,
	syncRequested: syncRequestedRead,
	syncRunning: syncRunningRead,
	syncBusyChain: syncBusyChainRead,
	syncBusy: g.query(SyncDen).reads({ busyChain: syncBusyChainRead }),
	syncSnapshot: g.query(SyncDen).reads({
		steps: syncPendingRead,
		claims: g.query(SyncDen).rule((r) => {
			const { root, step, attempt, until } = g.v(SyncClaim, "claim")
			return r
				.match(SyncClaim, { root, step, attempt, until })
				.where(r.not(SyncResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: g.query(SyncDen).rule((r) => {
			const { root, step, attempt, at, why } = g.v(SyncRetry, "retry")
			return r
				.match(SyncRetry, { root, step, attempt, at, why })
				.where(r.not(SyncResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: g.query(SyncDen).rule((r) => {
			const { root, step, attempt } = g.v(SyncFenced, "fenced")
			return r
				.match(SyncFenced, { root, step, attempt })
				.where(r.not(SyncResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: syncRequestedRead,
		running: syncRunningRead,
		roots: g.query(SyncDen).rule((r) => {
			const { kind, key, at } = g.v(SyncRoot, "root")
			const { scope } = g.v(SyncScope, "scope")
			return r
				.match(SyncRoot, { root: scope, kind, key, at })
				.match(SyncScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		keys: g.query(SyncDen).rule((r) => {
			const { scope, key, id } = g.v(SyncExclusiveKey, "syncExclusiveKey")
			return r.match(SyncExclusiveKey, { scope, key, id }).find({ scope, key, id })
		}),
		exclusives: g.query(SyncDen).rule((r) => {
			const { kind, key, turn, scope } = g.v(SyncExclusive, "syncExclusive")
			return r
				.match(SyncExclusive, { kind, key, turn, scope })
				.where(r.not(SyncReleased, { kind, key, turn }))
				.find({ kind, key, turn, scope })
		}),
		paused: g.query(SyncDen).rule((r) => {
			const { target, turn } = g.v(SyncPaused, "syncPaused")
			return r
				.match(SyncPaused, { target, turn })
				.where(r.not(SyncResumed, { target, turn }))
				.find({ target, turn })
		}),
		busyChain: syncBusyChainRead
	}),
	syncReadSyncCopyInput: g.query(syncGraph).rule((r) => {
		const { root, step, relation, run } = g.v(SyncCopyInput, "syncCopyInput")
		return r
			.match(SyncCopyInput, { root, step, relation, run })
			.where(
				r.eq(root, r.param("root", SyncCopyInput.fields.root)),
				r.eq(step, r.param("step", SyncCopyInput.fields.step))
			)
			.find({ root, step, relation, run })
	}),
	syncReadSyncBuildInput: g.query(syncGraph).rule((r) => {
		const { root, step, build } = g.v(SyncBuildInput, "syncBuildInput")
		return r
			.match(SyncBuildInput, { root, step, build })
			.where(
				r.eq(root, r.param("root", SyncBuildInput.fields.root)),
				r.eq(step, r.param("step", SyncBuildInput.fields.step))
			)
			.find({ root, step, build })
	}),
	syncReadSyncSyncRunInput: g.query(syncGraph).rule((r) => {
		const { root, scope, relation, run } = g.v(SyncSyncRunInput, "syncSyncRunInput")
		return r
			.match(SyncSyncRunInput, { root, scope, relation, run })
			.where(
				r.eq(root, r.param("root", SyncSyncRunInput.fields.root)),
				r.eq(scope, r.param("scope", SyncSyncRunInput.fields.scope))
			)
			.find({ root, scope, relation, run })
	}),
	syncRequestSyncRun: g.clocked(
		g.ChangeSet.empty(syncGraph)
			.insert(
				SyncScope,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncSyncRunSyncScope", {
						root: SyncScope.fields.root,
						scope: SyncScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(SyncRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				SyncExclusiveKey,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncSyncRunSyncExclusiveKey", {
						root: SyncExclusiveKey.fields.root,
						scope: SyncExclusiveKey.fields.scope,
						key: SyncExclusiveKey.fields.key,
						id: SyncExclusiveKey.fields.id
					})
					const { root, scope, key, id } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, key, id })
						.where(r.not(SyncRoot, { root }))
						.find({ root, scope, key, id })
				})
			)
			.insert(
				SyncSyncRunInput,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncSyncRunSyncSyncRunInput", {
						root: SyncSyncRunInput.fields.root,
						scope: SyncSyncRunInput.fields.scope,
						relation: SyncSyncRunInput.fields.relation,
						run: SyncSyncRunInput.fields.run
					})
					const { root, scope, relation, run } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, relation, run })
						.where(r.not(SyncRoot, { root }))
						.find({ root, scope, relation, run })
				})
			)
			.insert(
				SyncRequestedWith,
				g
					.query(syncGraph)
					.rule((r) => {
						const requested = r.relation("syncSyncRunSyncRequestedWith", {
							root: SyncRequestedWith.fields.root,
							fingerprint: SyncRequestedWith.fields.fingerprint,
							input: SyncRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(SyncRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("syncSyncRunSyncRequestedWith", {
							root: SyncRequestedWith.fields.root,
							fingerprint: SyncRequestedWith.fields.fingerprint,
							input: SyncRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(SyncRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(SyncRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				SyncRoot,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncSyncRunSyncScope", {
						root: SyncScope.fields.root,
						scope: SyncScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("syncSyncRunScope", SyncRoot.fields.root)),
							r.not(SyncRoot, { root })
						)
						.find({
							root,
							kind: SyncRootKind.handle("SyncRun"),
							key: r.param("syncSyncRunKey", SyncRoot.fields.key),
							at: r.param("denNow", SyncRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncReadSyncGoldInput: g.query(syncGraph).rule((r) => {
		const { root, scope, build } = g.v(SyncGoldInput, "syncGoldInput")
		return r
			.match(SyncGoldInput, { root, scope, build })
			.where(
				r.eq(root, r.param("root", SyncGoldInput.fields.root)),
				r.eq(scope, r.param("scope", SyncGoldInput.fields.scope))
			)
			.find({ root, scope, build })
	}),
	syncRequestGold: g.clocked(
		g.ChangeSet.empty(syncGraph)
			.insert(
				SyncScope,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncGoldSyncScope", {
						root: SyncScope.fields.root,
						scope: SyncScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(SyncRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				SyncGoldInput,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncGoldSyncGoldInput", {
						root: SyncGoldInput.fields.root,
						scope: SyncGoldInput.fields.scope,
						build: SyncGoldInput.fields.build
					})
					const { root, scope, build } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, build })
						.where(r.not(SyncRoot, { root }))
						.find({ root, scope, build })
				})
			)
			.insert(
				SyncRequestedWith,
				g
					.query(syncGraph)
					.rule((r) => {
						const requested = r.relation("syncGoldSyncRequestedWith", {
							root: SyncRequestedWith.fields.root,
							fingerprint: SyncRequestedWith.fields.fingerprint,
							input: SyncRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(SyncRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("syncGoldSyncRequestedWith", {
							root: SyncRequestedWith.fields.root,
							fingerprint: SyncRequestedWith.fields.fingerprint,
							input: SyncRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(SyncRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(SyncRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				SyncRoot,
				g.query(syncGraph).rule((r) => {
					const requested = r.relation("syncGoldSyncScope", {
						root: SyncScope.fields.root,
						scope: SyncScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("syncGoldScope", SyncRoot.fields.root)),
							r.not(SyncRoot, { root })
						)
						.find({
							root,
							kind: SyncRootKind.handle("Gold"),
							key: r.param("syncGoldKey", SyncRoot.fields.key),
							at: r.param("denNow", SyncRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	)
})

export const syncDenWorkload = g.workload(SyncDen, syncDenPrograms)

export const syncCoordinatorPrograms = Object.freeze({
	syncHoldExclusive: g.ChangeSet.empty(syncCoordination).insert(SyncExclusive, []),
	syncReleaseExclusive: g.ChangeSet.empty(syncCoordination).insert(SyncReleased, []),
	syncExclusiveTurns: g.query(syncCoordination).rule((r) => {
		const { kind, key, turn } = g.v(SyncExclusive, "syncExclusive")
		return r.match(SyncExclusive, { kind, key, turn }).find({ kind, key, turn: r.max(turn) })
	}),
	syncExclusives: g.query(syncCoordination).rule((r) => {
		const { kind, key, turn, scope } = g.v(SyncExclusive, "syncExclusive")
		return r
			.match(SyncExclusive, { kind, key, turn, scope })
			.where(r.not(SyncReleased, { kind, key, turn }))
			.find({ kind, key, turn, scope })
	}),
	syncPromote: g.clocked(
		g.ChangeSet.empty(syncCoordination).insert(
			SyncServed,
			g.query(syncCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", SyncServed.fields.environment),
					at: r.param("denNow", SyncServed.fields.at),
					deployment: r.param("deployment", SyncServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncPause: g.ChangeSet.empty(syncCoordination).insert(SyncPaused, []),
	syncResume: g.ChangeSet.empty(syncCoordination).insert(SyncResumed, []),
	syncPauseTurns: g.query(syncCoordination).rule((r) => {
		const { target, turn } = g.v(SyncPaused, "syncPaused")
		return r.match(SyncPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	syncPausedAll: g.query(syncCoordination).rule((r) => {
		const { target, turn } = g.v(SyncPaused, "syncPaused")
		return r
			.match(SyncPaused, { target, turn })
			.where(r.not(SyncResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const syncCoordinatorWorkload = g.workload(SyncCoordinator, syncCoordinatorPrograms)

/** den's retiring role for the flow Sync: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const SyncRetirer = g.role(
	App,
	"sync_retirer",
	{ ...syncGraph.relations },
	{
		write: [
			"SyncScope",
			"SyncExclusiveKey",
			"SyncAdmitted",
			"SyncSkipped",
			"SyncStep",
			"SyncStartStep",
			"SyncFinish",
			"SyncClaim",
			"SyncEnded",
			"SyncRetry",
			"SyncFenced",
			"SyncResult",
			"SyncDone",
			"SyncFailed",
			"SyncHeld",
			"SyncRefusal",
			"SyncExhausted",
			"SyncCopyInput",
			"SyncBuildInput",
			"SyncSyncRunInput",
			"SyncGoldInput",
			"SyncCopyOutput",
			"SyncBuildOutput",
			"SyncSyncRunFinishOutput",
			"SyncGoldFinishOutput"
		]
	}
)

export const syncRetirerPrograms = Object.freeze({
	syncRetire: g.ChangeSet.empty(syncGraph).deleteWhere({
		SyncScope: { root: g.param("root", SyncRoot.fields.root) },
		SyncExclusiveKey: { root: g.param("root", SyncRoot.fields.root) },
		SyncAdmitted: { root: g.param("root", SyncRoot.fields.root) },
		SyncSkipped: { root: g.param("root", SyncRoot.fields.root) },
		SyncStep: { root: g.param("root", SyncRoot.fields.root) },
		SyncStartStep: { root: g.param("root", SyncRoot.fields.root) },
		SyncFinish: { root: g.param("root", SyncRoot.fields.root) },
		SyncClaim: { root: g.param("root", SyncRoot.fields.root) },
		SyncEnded: { root: g.param("root", SyncRoot.fields.root) },
		SyncRetry: { root: g.param("root", SyncRoot.fields.root) },
		SyncFenced: { root: g.param("root", SyncRoot.fields.root) },
		SyncResult: { root: g.param("root", SyncRoot.fields.root) },
		SyncDone: { root: g.param("root", SyncRoot.fields.root) },
		SyncFailed: { root: g.param("root", SyncRoot.fields.root) },
		SyncHeld: { root: g.param("root", SyncRoot.fields.root) },
		SyncRefusal: { root: g.param("root", SyncRoot.fields.root) },
		SyncExhausted: { root: g.param("root", SyncRoot.fields.root) },
		SyncCopyInput: { root: g.param("root", SyncRoot.fields.root) },
		SyncBuildInput: { root: g.param("root", SyncRoot.fields.root) },
		SyncSyncRunInput: { root: g.param("root", SyncRoot.fields.root) },
		SyncGoldInput: { root: g.param("root", SyncRoot.fields.root) },
		SyncCopyOutput: { root: g.param("root", SyncRoot.fields.root) },
		SyncBuildOutput: { root: g.param("root", SyncRoot.fields.root) },
		SyncSyncRunFinishOutput: { root: g.param("root", SyncRoot.fields.root) },
		SyncGoldFinishOutput: { root: g.param("root", SyncRoot.fields.root) }
	})
})

export const syncRetirerWorkload = g.workload(SyncRetirer, syncRetirerPrograms)

/** The commits and declared reads of the flow Sync, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const syncCommitPrograms = Object.freeze({
	syncAuthenticated: g.clocked(
		g.query(syncGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	syncCommitCopy: g.ChangeSet.union(
		g.ChangeSet.empty(syncGraph)
			.insert(SyncResult, [])
			.insert(SyncDone, [])
			.insert(SyncHeld, [])
			.insert(SyncCopyOutput, []),
		declaredFlow.kinds[0].writes.changes(Loader)
	),
	syncCommitBuild: g.clocked(
		g.ChangeSet.union(
			g.ChangeSet.empty(syncGraph)
				.insert(SyncResult, [])
				.insert(SyncDone, [])
				.insert(SyncHeld, [])
				.insert(SyncBuildOutput, []),
			declaredFlow.kinds[2].writes.changes(Loader)
		),
		{ builtAt: "millis" },
		{ ...declaredFlow.kinds[2].writes.keys[0] }
	),
	syncCommitSyncRunFinish: g.ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
		.insert(SyncSyncRunFinishOutput, []),
	syncCommitGoldFinish: g.ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
		.insert(SyncGoldFinishOutput, [])
})

export const syncCommits = g.workload(Loader, syncCommitPrograms)
