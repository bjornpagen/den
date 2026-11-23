import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Sync to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, Num, Type, clocked, param, query, role, v, workload } from "@bjornpagen/grizzle"
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
export const SyncDen = role(
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

/** den's coordinator role for the flow Sync: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const SyncCoordinator = role(
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

const syncPendingRead = query(SyncDen).rule((r) => {
	const { step, kind, scope, due } = v(SyncStep, "step")
	return r
		.match(SyncStep, { step, kind, scope, due })
		.where(r.not(SyncResult, { step }))
		.find({ step, kind, scope, due })
})

const syncRequestedRead = query(SyncDen).rule((r) => {
	const { scope } = v(SyncScope, "scope")
	return r
		.match(SyncRoot, { root: scope })
		.match(SyncScope, { root: scope, scope })
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

const syncLatestServed = query(SyncDen).rule((r) => {
	const { environment, at } = v(SyncServed, "served")
	return r
		.match(SyncServed, { environment, at })
		.where(r.eq(environment, r.param("environment", SyncServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const syncDenPrograms = Object.freeze({
	syncNow: clocked(
		query(syncGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	syncReading: clocked(
		query(SyncDen).reads({
			now: query(syncGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
			serving: query(SyncDen).rule((r) => {
				const { environment, at, deployment } = v(SyncServed, "served")
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
		{ "now.now": "millis" }
	),
	syncClaim: clocked(
		ChangeSet.empty(syncGraph)
			.insertComputed(SyncClaim, [], {
				until: Type.cast(
					Num.add(Type.base(param("now", DenInstant)), Type.base(param("budget", DenDelay))),
					DenInstant
				)
			})
			.insert(SyncEnded, [])
			.read("held", (delta) =>
				query(syncGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(SyncClaim), "added")
					return r
						.match(delta.added(SyncClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ now: "millis" }
	),
	syncRetry: clocked(
		ChangeSet.empty(syncGraph)
			.insert(SyncEnded, [])
			.insert(
				SyncRetry,
				query(syncGraph).rule((r) =>
					r.find({
						step: r.param("step", SyncRetry.fields.step),
						attempt: r.param("attempt", SyncRetry.fields.attempt),
						at: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(r.param("delay", DenDelay))),
							DenInstant
						),
						why: r.param("why", SyncRetry.fields.why),
						root: r.param("root", SyncRetry.fields.root)
					})
				)
			),
		{ now: "millis" }
	),
	syncFence: ChangeSet.empty(syncGraph).insert(SyncEnded, []).insert(SyncFenced, []),
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
	syncAdmit: clocked(
		ChangeSet.empty(syncGraph)
			.insert(SyncAdmitted, [])
			.insert(SyncFinish, [])
			.insert(SyncStartStep, [])
			.insert(SyncScope, [])
			.insert(SyncCopyInput, [])
			.insert(SyncBuildInput, [])
			.insert(
				SyncStep,
				query(syncGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: SyncStep.fields.step,
						kind: SyncStep.fields.kind,
						scope: SyncStep.fields.scope,
						delay: DenDelay
					})
					const { step, kind, scope, delay } = v(steps, "spawned")
					return r.match(steps, { step, kind, scope, delay }).find({
						step,
						kind,
						scope,
						due: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(delay)),
							DenInstant
						),
						root: r.param("root", SyncStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	syncSkip: ChangeSet.empty(syncGraph).insert(SyncSkipped, []),
	syncSkippedOf: query(syncGraph).rule((r) => {
		const { root, scope, by } = v(SyncSkipped, "syncSkipped")
		return r
			.match(SyncSkipped, { root, scope, by })
			.where(r.eq(scope, r.param("scope", SyncSkipped.fields.scope)))
			.find({ root, scope, by })
	}),
	syncStepOf: query(syncGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(SyncStep, "syncStep")
		return r
			.match(SyncStep, { root, step, kind, scope, due })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ root, step, kind, scope, due })
	}),
	syncResultOf: query(syncGraph).rule((r) => {
		const { root, step, outcome } = v(SyncResult, "syncResult")
		return r
			.match(SyncResult, { root, step, outcome })
			.where(r.eq(step, r.param("step", SyncResult.fields.step)))
			.find({ root, step, outcome })
	}),
	syncHeldOf: query(syncGraph).rule((r) => {
		const { root, step, attempt } = v(SyncHeld, "syncHeld")
		return r
			.match(SyncHeld, { root, step, attempt })
			.where(r.eq(step, r.param("step", SyncHeld.fields.step)))
			.find({ root, step, attempt })
	}),
	syncAdmittedOf: query(syncGraph).rule((r) => {
		const { root, scope } = v(SyncAdmitted, "syncAdmitted")
		return r
			.match(SyncAdmitted, { root, scope })
			.where(r.eq(scope, r.param("scope", SyncAdmitted.fields.scope)))
			.find({ root, scope })
	}),
	syncRootOf: query(syncGraph).rule((r) => {
		const { kind, key, at } = v(SyncRoot, "root")
		const { scope } = v(SyncScope, "scope")
		return r
			.match(SyncRoot, { root: scope, kind, key, at })
			.match(SyncScope, { root: scope, scope })
			.where(r.eq(scope, r.param("scope", SyncRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	syncExclusiveKeyOf: query(syncGraph).rule((r) => {
		const { root, scope, key, id } = v(SyncExclusiveKey, "syncExclusiveKey")
		return r
			.match(SyncExclusiveKey, { root, scope, key, id })
			.where(r.eq(scope, r.param("scope", SyncExclusiveKey.fields.scope)))
			.find({ root, scope, key, id })
	}),
	syncFinishedRoots: query(syncGraph)
		.rule((r) => {
			const { scope, step } = v(SyncFinish, "finish")
			return r
				.match(SyncFinish, { root: scope, scope, step })
				.match(SyncResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(SyncSkipped, "skipped")
			return r.match(SyncSkipped, { root: scope, scope }).find({ scope })
		}),
	syncClaimsOf: query(syncGraph).rule((r) => {
		const { step, attempt, until } = v(SyncClaim, "claim")
		return r
			.match(SyncClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt, until })
	}),
	syncRetriesOf: query(syncGraph).rule((r) => {
		const { step, attempt, at, why } = v(SyncRetry, "retry")
		return r
			.match(SyncRetry, { step, attempt, at, why })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt, at, why })
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
	syncPending: syncPendingRead,
	syncRequested: syncRequestedRead,
	syncRunning: syncRunningRead,
	syncBusyChain: syncBusyChainRead,
	syncBusy: query(SyncDen).reads({ busyChain: syncBusyChainRead }),
	syncSnapshot: query(SyncDen).reads({
		steps: syncPendingRead,
		claims: query(SyncDen).rule((r) => {
			const { step, attempt, until } = v(SyncClaim, "claim")
			return r
				.match(SyncClaim, { step, attempt, until })
				.where(r.not(SyncResult, { step }))
				.find({ step, attempt, until })
		}),
		retries: query(SyncDen).rule((r) => {
			const { step, attempt, at, why } = v(SyncRetry, "retry")
			return r
				.match(SyncRetry, { step, attempt, at, why })
				.where(r.not(SyncResult, { step }))
				.find({ step, attempt, at, why })
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
			const { kind, key, at } = v(SyncRoot, "root")
			const { scope } = v(SyncScope, "scope")
			return r
				.match(SyncRoot, { root: scope, kind, key, at })
				.match(SyncScope, { root: scope, scope })
				.find({ scope, kind, key, at })
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
	}),
	syncReadSyncCopyInput: query(syncGraph).rule((r) => {
		const { root, step, relation, run } = v(SyncCopyInput, "syncCopyInput")
		return r
			.match(SyncCopyInput, { root, step, relation, run })
			.where(r.eq(step, r.param("step", SyncCopyInput.fields.step)))
			.find({ root, step, relation, run })
	}),
	syncReadSyncBuildInput: query(syncGraph).rule((r) => {
		const { root, step, build } = v(SyncBuildInput, "syncBuildInput")
		return r
			.match(SyncBuildInput, { root, step, build })
			.where(r.eq(step, r.param("step", SyncBuildInput.fields.step)))
			.find({ root, step, build })
	}),
	syncReadSyncSyncRunInput: query(syncGraph).rule((r) => {
		const { root, scope, relation, run } = v(SyncSyncRunInput, "syncSyncRunInput")
		return r
			.match(SyncSyncRunInput, { root, scope, relation, run })
			.where(r.eq(scope, r.param("scope", SyncSyncRunInput.fields.scope)))
			.find({ root, scope, relation, run })
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
						root: r.param("syncSyncRunScope", SyncRoot.fields.root),
						kind: SyncRootKind.handle("SyncRun"),
						key: r.param("syncSyncRunKey", SyncRoot.fields.key),
						at: r.param("now", SyncRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	syncReadSyncGoldInput: query(syncGraph).rule((r) => {
		const { root, scope, build } = v(SyncGoldInput, "syncGoldInput")
		return r
			.match(SyncGoldInput, { root, scope, build })
			.where(r.eq(scope, r.param("scope", SyncGoldInput.fields.scope)))
			.find({ root, scope, build })
	}),
	syncRequestGold: clocked(
		ChangeSet.empty(syncGraph)
			.insert(SyncScope, [])
			.insert(SyncGoldInput, [])
			.insert(
				SyncRoot,
				query(syncGraph).rule((r) =>
					r.find({
						root: r.param("syncGoldScope", SyncRoot.fields.root),
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
	syncExclusiveTurns: query(syncCoordination).rule((r) => {
		const { kind, key, turn } = v(SyncExclusive, "syncExclusive")
		return r.match(SyncExclusive, { kind, key, turn }).find({ kind, key, turn: r.max(turn) })
	}),
	syncExclusives: query(syncCoordination).rule((r) => {
		const { kind, key, turn, scope } = v(SyncExclusive, "syncExclusive")
		return r
			.match(SyncExclusive, { kind, key, turn, scope })
			.where(r.not(SyncReleased, { kind, key, turn }))
			.find({ kind, key, turn, scope })
	}),
	syncPromote: clocked(
		ChangeSet.empty(syncCoordination).insert(
			SyncServed,
			query(syncCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", SyncServed.fields.environment),
					at: r.param("now", SyncServed.fields.at),
					deployment: r.param("deployment", SyncServed.fields.deployment)
				})
			)
		),
		{ now: "millis" }
	),
	syncPause: ChangeSet.empty(syncCoordination).insert(SyncPaused, []),
	syncResume: ChangeSet.empty(syncCoordination).insert(SyncResumed, []),
	syncPauseTurns: query(syncCoordination).rule((r) => {
		const { target, turn } = v(SyncPaused, "syncPaused")
		return r.match(SyncPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	syncPausedAll: query(syncCoordination).rule((r) => {
		const { target, turn } = v(SyncPaused, "syncPaused")
		return r
			.match(SyncPaused, { target, turn })
			.where(r.not(SyncResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const syncCoordinatorWorkload = workload(SyncCoordinator, syncCoordinatorPrograms)

/** den's retiring role for the flow Sync: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const SyncRetirer = role(
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
	syncRetire: ChangeSet.empty(syncGraph).deleteWhere({
		SyncScope: { root: param("root", SyncRoot.fields.root) },
		SyncExclusiveKey: { root: param("root", SyncRoot.fields.root) },
		SyncAdmitted: { root: param("root", SyncRoot.fields.root) },
		SyncSkipped: { root: param("root", SyncRoot.fields.root) },
		SyncStep: { root: param("root", SyncRoot.fields.root) },
		SyncStartStep: { root: param("root", SyncRoot.fields.root) },
		SyncFinish: { root: param("root", SyncRoot.fields.root) },
		SyncClaim: { root: param("root", SyncRoot.fields.root) },
		SyncEnded: { root: param("root", SyncRoot.fields.root) },
		SyncRetry: { root: param("root", SyncRoot.fields.root) },
		SyncFenced: { root: param("root", SyncRoot.fields.root) },
		SyncResult: { root: param("root", SyncRoot.fields.root) },
		SyncDone: { root: param("root", SyncRoot.fields.root) },
		SyncFailed: { root: param("root", SyncRoot.fields.root) },
		SyncHeld: { root: param("root", SyncRoot.fields.root) },
		SyncRefusal: { root: param("root", SyncRoot.fields.root) },
		SyncExhausted: { root: param("root", SyncRoot.fields.root) },
		SyncCopyInput: { root: param("root", SyncRoot.fields.root) },
		SyncBuildInput: { root: param("root", SyncRoot.fields.root) },
		SyncSyncRunInput: { root: param("root", SyncRoot.fields.root) },
		SyncGoldInput: { root: param("root", SyncRoot.fields.root) },
		SyncCopyOutput: { root: param("root", SyncRoot.fields.root) },
		SyncBuildOutput: { root: param("root", SyncRoot.fields.root) },
		SyncSyncRunFinishOutput: { root: param("root", SyncRoot.fields.root) },
		SyncGoldFinishOutput: { root: param("root", SyncRoot.fields.root) }
	})
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
		declaredFlow.kinds[0].writes.changes(Loader)
	),
	syncCommitBuild: ChangeSet.union(
		ChangeSet.empty(syncGraph)
			.insert(SyncResult, [])
			.insert(SyncDone, [])
			.insert(SyncHeld, [])
			.insert(SyncBuildOutput, []),
		declaredFlow.kinds[2].writes.changes(Loader)
	),
	syncCommitSyncRunFinish: ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
		.insert(SyncSyncRunFinishOutput, []),
	syncCommitGoldFinish: ChangeSet.empty(syncGraph)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
		.insert(SyncGoldFinishOutput, [])
})

export const syncCommits = workload(Loader, syncCommitPrograms)
