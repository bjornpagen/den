/** The programs den lowered the flow Sync to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, deferrable, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	SyncScope,
	SyncRoot,
	SyncWithin,
	SyncExclusiveKey,
	SyncAdmitted,
	SyncSkipped,
	SyncStep,
	SyncStartStep,
	SyncStartScope,
	SyncFinish,
	SyncDue,
	SyncClaim,
	SyncRetry,
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
	SyncPaused,
	syncGraph,
	syncCoordination
} from "#integration/slice/generated/sync.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Sync: claims, retries, failures, admissions, requests, and every read the scheduler makes. */
export const SyncDen = role(
	App,
	"sync_den",
	{
		...syncGraph.relations,
		ChainStep: App.relations.ChainStep,
		ChainResult: App.relations.ChainResult
	},
	{
		insert: [
			"SyncScope",
			"SyncRoot",
			"SyncWithin",
			"SyncExclusiveKey",
			"SyncAdmitted",
			"SyncSkipped",
			"SyncStep",
			"SyncStartStep",
			"SyncStartScope",
			"SyncFinish",
			"SyncDue",
			"SyncClaim",
			"SyncRetry",
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

/** den's coordination role for the flow Sync: seats, holds, exclusivity seats and pauses, the seat module's (LEASE replaces it). */
export const SyncSeats = role(
	App,
	"sync_seats",
	{ ...syncCoordination.relations },
	{ write: ["SyncExclusive", "SyncPaused"] }
)

export const syncDenPrograms = Object.freeze({
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
		.insert(SyncStartScope, [])
		.insert(SyncStep, [])
		.insert(SyncDue, [])
		.insert(SyncScope, [])
		.insert(SyncWithin, [])
		.insert(SyncCopyInput, [])
		.insert(SyncBuildInput, []),
	syncSkip: ChangeSet.empty(syncGraph).insert(SyncSkipped, []),
	syncSkippedOf: SyncSkipped,
	syncStepOf: SyncStep,
	syncResultOf: SyncResult,
	syncHeldOf: SyncHeld,
	syncDueOf: SyncDue,
	syncScopeOf: SyncScope,
	syncWithinOf: SyncWithin,
	syncAdmittedOf: SyncAdmitted,
	syncRootOf: SyncRoot,
	syncExclusiveKeyOf: SyncExclusiveKey,
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
	syncOpenChildren: query(syncGraph)
		.rule((r) => {
			const { scope, parent } = v(SyncWithin, "within")
			return r
				.match(SyncWithin, { scope, parent })
				.where(
					r.eq(parent, r.param("scope", SyncScope.fields.scope)),
					r.not(SyncAdmitted, { scope })
				)
				.find({ child: scope })
		})
		.rule((r) => {
			const { scope, parent } = v(SyncWithin, "within")
			const { step } = v(SyncFinish, "finish")
			return r
				.match(SyncWithin, { scope, parent })
				.match(SyncFinish, { scope, step })
				.where(r.eq(parent, r.param("scope", SyncScope.fields.scope)), r.not(SyncResult, { step }))
				.find({ child: scope })
		}),
	syncFinished: query(syncGraph).rule((r) => {
		const { scope, step } = v(SyncFinish, "finish")
		return r
			.match(SyncFinish, { scope, step })
			.match(SyncResult, { step })
			.where(r.eq(scope, r.param("scope", SyncScope.fields.scope)))
			.find({ step })
	}),
	syncPending: deferrable(
		query(syncGraph).rule((r) => {
			const { step, kind, scope } = v(SyncStep, "step")
			return r
				.match(SyncStep, { step, kind, scope })
				.where(r.not(SyncResult, { step }))
				.find({ step, kind, scope })
		})
	),
	syncPendingClaims: deferrable(
		query(syncGraph).rule((r) => {
			const { step, attempt, until } = v(SyncClaim, "claim")
			return r
				.match(SyncClaim, { step, attempt, until })
				.where(r.not(SyncResult, { step }))
				.find({ step, attempt, until })
		})
	),
	syncPendingRetries: deferrable(
		query(syncGraph).rule((r) => {
			const { step, attempt, at, spent } = v(SyncRetry, "retry")
			return r
				.match(SyncRetry, { step, attempt, at, spent })
				.where(r.not(SyncResult, { step }))
				.find({ step, attempt, at, spent })
		})
	),
	syncPendingDues: deferrable(
		query(syncGraph).rule((r) => {
			const { step, at } = v(SyncDue, "due")
			return r.match(SyncDue, { step, at }).where(r.not(SyncResult, { step })).find({ step, at })
		})
	),
	syncRequested: deferrable(
		query(syncGraph).rule((r) => {
			const { scope, kind } = v(SyncScope, "scope")
			return r
				.match(SyncScope, { scope, kind })
				.where(r.not(SyncAdmitted, { scope }), r.not(SyncSkipped, { scope }))
				.find({ scope, kind })
		})
	),
	syncRunning: deferrable(
		query(syncGraph).rule((r) => {
			const { scope, kind } = v(SyncScope, "scope")
			const { step } = v(SyncFinish, "finish")
			return r
				.match(SyncScope, { scope, kind })
				.match(SyncFinish, { scope, step })
				.where(r.not(SyncResult, { step }))
				.find({ scope, kind })
		})
	),
	syncWithins: deferrable(
		query(syncGraph).rule((r) => {
			const { scope, parent } = v(SyncWithin, "syncWithin")
			return r.match(SyncWithin, { scope, parent }).find({ scope, parent })
		})
	),
	syncRoots: deferrable(
		query(syncGraph).rule((r) => {
			const { scope, key, at } = v(SyncRoot, "syncRoot")
			return r.match(SyncRoot, { scope, key, at }).find({ scope, key, at })
		})
	),
	syncExclusiveKeys: deferrable(
		query(syncGraph).rule((r) => {
			const { scope, key, id } = v(SyncExclusiveKey, "syncExclusiveKey")
			return r.match(SyncExclusiveKey, { scope, key, id }).find({ scope, key, id })
		})
	),
	syncBusyChain: deferrable(
		query(SyncDen).rule((r) => {
			const { step } = v(App.relations.ChainStep, "step")
			return r
				.match(App.relations.ChainStep, { step })
				.where(r.not(App.relations.ChainResult, { step }))
				.find({ step })
		})
	),
	syncReadSyncCopyInput: SyncCopyInput,
	syncReadSyncBuildInput: SyncBuildInput,
	syncReadSyncSyncRunInput: SyncSyncRunInput,
	syncRequestSyncRun: ChangeSet.empty(syncGraph)
		.insert(SyncScope, [])
		.insert(SyncRoot, [])
		.insert(SyncExclusiveKey, [])
		.insert(SyncSyncRunInput, []),
	syncReadSyncGoldInput: SyncGoldInput,
	syncRequestGold: ChangeSet.empty(syncGraph)
		.insert(SyncScope, [])
		.insert(SyncRoot, [])
		.insert(SyncGoldInput, [])
})

export const syncDenWorkload = workload(SyncDen, syncDenPrograms)

export const syncSeatsPrograms = Object.freeze({
	syncHoldExclusive: ChangeSet.empty(syncCoordination).insert(SyncExclusive, []),
	syncReleaseExclusive: ChangeSet.empty(syncCoordination).delete(SyncExclusive, []),
	syncExclusives: deferrable(
		query(syncCoordination).rule((r) => {
			const { kind, key, scope } = v(SyncExclusive, "syncExclusive")
			return r.match(SyncExclusive, { kind, key, scope }).find({ kind, key, scope })
		})
	),
	syncPause: ChangeSet.empty(syncCoordination).insert(SyncPaused, []),
	syncResume: ChangeSet.empty(syncCoordination).delete(SyncPaused, []),
	syncPausedAll: deferrable(
		query(syncCoordination).rule((r) => {
			const { target } = v(SyncPaused, "syncPaused")
			return r.match(SyncPaused, { target }).find({ target })
		})
	)
})

export const syncSeatsWorkload = workload(SyncSeats, syncSeatsPrograms)

/** The commits and declared reads of the flow Sync, over its app role Loader. */
export const syncCommitPrograms = Object.freeze({
	syncCommitCopy: ChangeSet.empty(Loader)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
		.insert(SyncCopyOutput, [])
		.insert(App.relations.Copied, []),
	syncCommitBuild: ChangeSet.empty(Loader)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
		.insert(SyncBuildOutput, [])
		.insert(App.relations.Built, []),
	syncCommitSyncRunFinish: ChangeSet.empty(Loader)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, []),
	syncCommitGoldFinish: ChangeSet.empty(Loader)
		.insert(SyncResult, [])
		.insert(SyncDone, [])
		.insert(SyncHeld, [])
})

export const syncCommits = workload(Loader, syncCommitPrograms)
