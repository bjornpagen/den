import { DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Sync to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, clocked, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	SyncKind,
	SyncRootKind,
	SyncOutcome,
	SyncPausable,
	SyncScope,
	SyncRoot,
	SyncExclusiveKey,
	SyncAdmitted,
	SyncSkipped,
	SyncStep,
	SyncStartStep,
	SyncFinish,
	SyncClaim,
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
	SyncExclusive,
	SyncReleased,
	SyncPaused,
	SyncResumed,
	syncGraph,
	syncCoordination
} from "#integration/slice/generated/sync.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Sync: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const SyncDen = role(
	App,
	"sync_den",
	{
		...syncGraph.relations,
		SyncExclusive,
		SyncReleased,
		SyncPaused,
		SyncResumed,
		ChainStep: App.relations.ChainStep,
		ChainResult: App.relations.ChainResult
	},
	{
		insert: [
			"SyncScope",
			"SyncRoot",
			"SyncExclusiveKey",
			"SyncAdmitted",
			"SyncSkipped",
			"SyncStep",
			"SyncStartStep",
			"SyncFinish",
			"SyncClaim",
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
			"SyncGoldInput"
		]
	}
)

/** den's coordinator role for the flow Sync: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const SyncCoordinator = role(
	App,
	"sync_coordinator",
	{
		SyncKind,
		SyncRootKind,
		SyncOutcome,
		SyncPausable,
		SyncExclusive,
		SyncReleased,
		SyncPaused,
		SyncResumed
	},
	{ insert: ["SyncExclusive", "SyncReleased", "SyncPaused", "SyncResumed"] }
)

const syncPendingRead = query(SyncDen).rule((r) => {
	const { step, kind, scope, due } = v(SyncStep, "step")
	return r
		.match(SyncStep, { step, kind, scope, due })
		.where(r.not(SyncResult, { step }))
		.find({ step, kind, scope, due })
})

const syncRequestedRead = query(SyncDen).rule((r) => {
	const { scope } = v(SyncRoot, "root")
	return r
		.match(SyncRoot, { scope })
		.where(r.not(SyncAdmitted, { scope }), r.not(SyncSkipped, { scope }))
		.find({ scope })
})

const syncRunningRead = query(SyncDen).rule((r) => {
	const { scope, step } = v(SyncFinish, "finish")
	return r.match(SyncFinish, { scope, step }).where(r.not(SyncResult, { step })).find({ scope })
})

const syncBusyChainRead = query(SyncDen).rule((r) => {
	const { step } = v(App.relations.ChainStep, "step")
	return r
		.match(App.relations.ChainStep, { step })
		.where(r.not(App.relations.ChainResult, { step }))
		.find({ step })
})

export const syncDenPrograms = Object.freeze({
	syncNow: clocked(
		query(syncGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	syncClaim: ChangeSet.empty(syncGraph)
		.insert(SyncClaim, [])
		.read("held", (delta) =>
			query(syncGraph)
				.rule((r) => {
					const { step, attempt, holder } = v(delta.added(SyncClaim), "added")
					return r
						.match(delta.added(SyncClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
				.rule((r) => {
					const { step, attempt, holder } = v(delta.met(SyncClaim), "met")
					return r
						.match(delta.met(SyncClaim), { step, attempt, holder })
						.find({ step, attempt, holder })
				})
		),
	syncRetry: ChangeSet.empty(syncGraph).insert(SyncRetry, []),
	syncFence: ChangeSet.empty(syncGraph).insert(SyncFenced, []),
	syncRefuse: ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncFailed, [])
		.insert(SyncHeld, [])
		.insert(SyncRefusal, []),
	syncExhaust: ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncFailed, [])
		.insert(SyncHeld, [])
		.insert(SyncExhausted, []),
	syncAdmit: ChangeSet.empty(syncGraph)
		.insert(SyncAdmitted, [])
		.insert(SyncFinish, [])
		.insert(SyncStartStep, [])
		.insert(SyncStep, [])
		.insert(SyncScope, [])
		.insert(SyncCopyInput, [])
		.insert(SyncBuildInput, []),
	syncSkip: ChangeSet.empty(syncGraph).insert(SyncSkipped, []),
	syncSkippedOf: query(syncGraph).rule((r) => {
		const { scope, by, root } = v(SyncSkipped, "syncSkipped")
		return r
			.match(SyncSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", SyncSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	syncStepOf: query(syncGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(SyncStep, "syncStep")
		return r
			.match(SyncStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	syncResultOf: query(syncGraph).rule((r) => {
		const { step, outcome, root } = v(SyncResult, "syncResult")
		return r
			.match(SyncResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", SyncResult.fields.step)))
			.find({ step, outcome, root })
	}),
	syncHeldOf: query(syncGraph).rule((r) => {
		const { step, attempt, root } = v(SyncHeld, "syncHeld")
		return r
			.match(SyncHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", SyncHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	syncAdmittedOf: query(syncGraph).rule((r) => {
		const { scope, root } = v(SyncAdmitted, "syncAdmitted")
		return r
			.match(SyncAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", SyncAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	syncRootOf: query(syncGraph).rule((r) => {
		const { scope, kind, key, at } = v(SyncRoot, "syncRoot")
		return r
			.match(SyncRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", SyncRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	syncExclusiveKeyOf: query(syncGraph).rule((r) => {
		const { scope, key, id, root } = v(SyncExclusiveKey, "syncExclusiveKey")
		return r
			.match(SyncExclusiveKey, { scope, key, id, root })
			.where(r.eq(scope, r.param("scope", SyncExclusiveKey.fields.scope)))
			.find({ scope, key, id, root })
	}),
	syncFinishedRoots: deferrable(
		query(syncGraph)
			.rule((r) => {
				const { scope, kind, at } = v(SyncRoot, "root")
				const { step } = v(SyncFinish, "finish")
				return r
					.match(SyncRoot, { scope, kind, at })
					.match(SyncFinish, { scope, step })
					.match(SyncResult, { step })
					.find({ scope, kind, at })
			})
			.rule((r) => {
				const { scope, kind, at } = v(SyncRoot, "root")
				return r
					.match(SyncRoot, { scope, kind, at })
					.match(SyncSkipped, { scope })
					.find({ scope, kind, at })
			})
	),
	syncClaimsOf: query(syncGraph).rule((r) => {
		const { step, attempt, holder, until } = v(SyncClaim, "claim")
		return r
			.match(SyncClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	syncRetriesOf: query(syncGraph).rule((r) => {
		const { step, attempt, at, spent } = v(SyncRetry, "retry")
		return r
			.match(SyncRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	syncFencedOf: query(syncGraph).rule((r) => {
		const { step, attempt } = v(SyncFenced, "fenced")
		return r
			.match(SyncFenced, { step, attempt })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt })
	}),
	syncUnendedSteps: query(syncGraph).rule((r) => {
		const { step, scope } = v(SyncStep, "step")
		return r
			.match(SyncStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", SyncScope.fields.scope)),
				r.not(SyncResult, { step }),
				r.not(SyncFinish, { scope, step })
			)
			.find({ step })
	}),
	syncFinished: query(syncGraph).rule((r) => {
		const { scope, step } = v(SyncFinish, "finish")
		return r
			.match(SyncFinish, { scope, step })
			.match(SyncResult, { step })
			.where(r.eq(scope, r.param("scope", SyncScope.fields.scope)))
			.find({ step })
	}),
	syncPending: deferrable(syncPendingRead),
	syncRequested: deferrable(syncRequestedRead),
	syncRunning: deferrable(syncRunningRead),
	syncBusyChain: deferrable(syncBusyChainRead),
	syncBusy: deferrable(query(SyncDen).reads({ busyChain: syncBusyChainRead })),
	syncSnapshot: deferrable(
		query(SyncDen).reads({
			steps: syncPendingRead,
			claims: query(SyncDen).rule((r) => {
				const { step, attempt, until } = v(SyncClaim, "claim")
				return r
					.match(SyncClaim, { step, attempt, until })
					.where(r.not(SyncResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(SyncDen).rule((r) => {
				const { step, attempt, at, spent } = v(SyncRetry, "retry")
				return r
					.match(SyncRetry, { step, attempt, at, spent })
					.where(r.not(SyncResult, { step }))
					.find({ step, attempt, at, spent })
			}),
			fenced: query(SyncDen).rule((r) => {
				const { step, attempt } = v(SyncFenced, "fenced")
				return r
					.match(SyncFenced, { step, attempt })
					.where(r.not(SyncResult, { step }))
					.find({ step, attempt })
			}),
			requested: syncRequestedRead,
			running: syncRunningRead,
			roots: query(SyncDen).rule((r) => {
				const { scope, kind, key, at } = v(SyncRoot, "syncRoot")
				return r.match(SyncRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			keys: query(SyncDen).rule((r) => {
				const { scope, key, id } = v(SyncExclusiveKey, "syncExclusiveKey")
				return r.match(SyncExclusiveKey, { scope, key, id }).find({ scope, key, id })
			}),
			exclusives: query(SyncDen).rule((r) => {
				const { kind, key, turn, scope } = v(SyncExclusive, "syncExclusive")
				return r
					.match(SyncExclusive, { kind, key, turn, scope })
					.where(r.not(SyncReleased, { kind, key, turn }))
					.find({ kind, key, turn, scope })
			}),
			paused: query(SyncDen).rule((r) => {
				const { target, turn } = v(SyncPaused, "syncPaused")
				return r
					.match(SyncPaused, { target, turn })
					.where(r.not(SyncResumed, { target, turn }))
					.find({ target, turn })
			}),
			busyChain: syncBusyChainRead
		})
	),
	syncReadSyncCopyInput: query(syncGraph).rule((r) => {
		const { step, relation, run, root } = v(SyncCopyInput, "syncCopyInput")
		return r
			.match(SyncCopyInput, { step, relation, run, root })
			.where(r.eq(step, r.param("step", SyncCopyInput.fields.step)))
			.find({ step, relation, run, root })
	}),
	syncReadSyncBuildInput: query(syncGraph).rule((r) => {
		const { step, build, root } = v(SyncBuildInput, "syncBuildInput")
		return r
			.match(SyncBuildInput, { step, build, root })
			.where(r.eq(step, r.param("step", SyncBuildInput.fields.step)))
			.find({ step, build, root })
	}),
	syncReadSyncSyncRunInput: query(syncGraph).rule((r) => {
		const { scope, relation, run, root } = v(SyncSyncRunInput, "syncSyncRunInput")
		return r
			.match(SyncSyncRunInput, { scope, relation, run, root })
			.where(r.eq(scope, r.param("scope", SyncSyncRunInput.fields.scope)))
			.find({ scope, relation, run, root })
	}),
	syncRequestSyncRun: clocked(
		ChangeSet.empty(syncGraph)
			.insert(SyncScope, [])
			.insert(SyncExclusiveKey, [])
			.insert(SyncSyncRunInput, [])
			.insert(
				SyncRoot,
				query(syncGraph).rule((r) =>
					r.find({
						scope: r.param("syncSyncRunScope", SyncRoot.fields.scope),
						kind: SyncRootKind.handle("SyncRun"),
						key: r.param("syncSyncRunKey", SyncRoot.fields.key),
						at: r.param("now", SyncRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	syncReadSyncGoldInput: query(syncGraph).rule((r) => {
		const { scope, build, root } = v(SyncGoldInput, "syncGoldInput")
		return r
			.match(SyncGoldInput, { scope, build, root })
			.where(r.eq(scope, r.param("scope", SyncGoldInput.fields.scope)))
			.find({ scope, build, root })
	}),
	syncRequestGold: clocked(
		ChangeSet.empty(syncGraph)
			.insert(SyncScope, [])
			.insert(SyncGoldInput, [])
			.insert(
				SyncRoot,
				query(syncGraph).rule((r) =>
					r.find({
						scope: r.param("syncGoldScope", SyncRoot.fields.scope),
						kind: SyncRootKind.handle("Gold"),
						key: r.param("syncGoldKey", SyncRoot.fields.key),
						at: r.param("now", SyncRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	)
})

export const syncDenWorkload = workload(SyncDen, syncDenPrograms)

export const syncCoordinatorPrograms = Object.freeze({
	syncHoldExclusive: ChangeSet.empty(syncCoordination).insert(SyncExclusive, []),
	syncReleaseExclusive: ChangeSet.empty(syncCoordination).insert(SyncReleased, []),
	syncExclusiveTurns: deferrable(
		query(syncCoordination).rule((r) => {
			const { kind, key, turn } = v(SyncExclusive, "syncExclusive")
			return r.match(SyncExclusive, { kind, key, turn }).find({ kind, key, turn: r.max(turn) })
		})
	),
	syncExclusives: deferrable(
		query(syncCoordination).rule((r) => {
			const { kind, key, turn, scope } = v(SyncExclusive, "syncExclusive")
			return r
				.match(SyncExclusive, { kind, key, turn, scope })
				.where(r.not(SyncReleased, { kind, key, turn }))
				.find({ kind, key, turn, scope })
		})
	),
	syncPause: ChangeSet.empty(syncCoordination).insert(SyncPaused, []),
	syncResume: ChangeSet.empty(syncCoordination).insert(SyncResumed, []),
	syncPauseTurns: deferrable(
		query(syncCoordination).rule((r) => {
			const { target, turn } = v(SyncPaused, "syncPaused")
			return r.match(SyncPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	syncPausedAll: deferrable(
		query(syncCoordination).rule((r) => {
			const { target, turn } = v(SyncPaused, "syncPaused")
			return r
				.match(SyncPaused, { target, turn })
				.where(r.not(SyncResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const syncCoordinatorWorkload = workload(SyncCoordinator, syncCoordinatorPrograms)

/** den's retiring role for the flow Sync: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const SyncRetirer = role(
	App,
	"sync_retirer",
	{ ...syncGraph.relations },
	{ retire: ["SyncRoot"] }
)

export const syncRetirerPrograms = Object.freeze({
	syncRetire: ChangeSet.empty(syncGraph).retire(SyncRoot, [])
})

export const syncRetirerWorkload = workload(SyncRetirer, syncRetirerPrograms)

/** The commits and declared reads of the flow Sync, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const syncCommitPrograms = Object.freeze({
	syncAuthenticated: clocked(
		query(syncGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	syncCommitCopy: ChangeSet.union(
		ChangeSet.empty(syncGraph)
			.insert(SyncResult, [])
			.insert(SyncDone, [])
			.insert(SyncHeld, [])
			.insert(SyncCopyOutput, []),
		ChangeSet.empty(Loader).insert(App.relations.Copied, [])
	),
	syncCommitBuild: ChangeSet.union(
		ChangeSet.empty(syncGraph)
			.insert(SyncResult, [])
			.insert(SyncDone, [])
			.insert(SyncHeld, [])
			.insert(SyncBuildOutput, []),
		ChangeSet.empty(Loader).insert(App.relations.Built, [])
	),
	syncCommitSyncRunFinish: ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, []),
	syncCommitGoldFinish: ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
})

export const syncCommits = workload(Loader, syncCommitPrograms)
