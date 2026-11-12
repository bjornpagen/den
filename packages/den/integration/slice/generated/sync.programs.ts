/** The programs den lowered the flow Sync to, over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import {
	SyncKind,
	SyncJoin,
	SyncOutcome,
	SyncPausable,
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
	SyncPaused
} from "#integration/slice/generated/sync.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Sync: claims, retries, failures, admissions, requests, and every read the scheduler makes. */
export const SyncDen = role(
	App,
	"sync_den",
	{
		SyncKind,
		SyncJoin,
		SyncOutcome,
		SyncPausable,
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
	{ SyncKind, SyncJoin, SyncOutcome, SyncPausable, SyncExclusive, SyncPaused },
	{ write: ["SyncExclusive", "SyncPaused"] }
)

export const syncDenPrograms = Object.freeze({
	syncClaim: ChangeSet.empty(SyncDen).insert(SyncClaim, []),
	syncRetry: ChangeSet.empty(SyncDen).insert(SyncRetry, []),
	syncRefuse: ChangeSet.empty(SyncDen)
		.insert(SyncResult, [])
		.insert(SyncFailed, [])
		.insert(SyncHeld, [])
		.insert(SyncRefusal, []),
	syncExhaust: ChangeSet.empty(SyncDen)
		.insert(SyncResult, [])
		.insert(SyncFailed, [])
		.insert(SyncHeld, [])
		.insert(SyncExhausted, []),
	syncAdmit: ChangeSet.empty(SyncDen)
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
	syncSkip: ChangeSet.empty(SyncDen).insert(SyncSkipped, []),
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
	syncClaimsOf: query(SyncDen).rule((r) => {
		const { step, attempt, holder, until } = v(SyncClaim, "claim")
		return r
			.match(SyncClaim, { step, attempt, holder, until })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt, holder, until })
	}),
	syncRetriesOf: query(SyncDen).rule((r) => {
		const { step, attempt, at, spent } = v(SyncRetry, "retry")
		return r
			.match(SyncRetry, { step, attempt, at, spent })
			.where(r.eq(step, r.param("step", SyncStep.fields.step)))
			.find({ step, attempt, at, spent })
	}),
	syncUnendedSteps: query(SyncDen).rule((r) => {
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
	syncOpenChildren: query(SyncDen)
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
	syncFinished: query(SyncDen).rule((r) => {
		const { scope, step } = v(SyncFinish, "finish")
		return r
			.match(SyncFinish, { scope, step })
			.match(SyncResult, { step })
			.where(r.eq(scope, r.param("scope", SyncScope.fields.scope)))
			.find({ step })
	}),
	syncPending: query(SyncDen).rule((r) => {
		const { step, kind, scope } = v(SyncStep, "step")
		return r
			.match(SyncStep, { step, kind, scope })
			.where(r.not(SyncResult, { step }))
			.find({ step, kind, scope })
	}),
	syncPendingClaims: query(SyncDen).rule((r) => {
		const { step, attempt, until } = v(SyncClaim, "claim")
		return r
			.match(SyncClaim, { step, attempt, until })
			.where(r.not(SyncResult, { step }))
			.find({ step, attempt, until })
	}),
	syncPendingRetries: query(SyncDen).rule((r) => {
		const { step, attempt, at, spent } = v(SyncRetry, "retry")
		return r
			.match(SyncRetry, { step, attempt, at, spent })
			.where(r.not(SyncResult, { step }))
			.find({ step, attempt, at, spent })
	}),
	syncPendingDues: query(SyncDen).rule((r) => {
		const { step, at } = v(SyncDue, "due")
		return r.match(SyncDue, { step, at }).where(r.not(SyncResult, { step })).find({ step, at })
	}),
	syncRequested: query(SyncDen).rule((r) => {
		const { scope, kind } = v(SyncScope, "scope")
		return r
			.match(SyncScope, { scope, kind })
			.where(r.not(SyncAdmitted, { scope }), r.not(SyncSkipped, { scope }))
			.find({ scope, kind })
	}),
	syncRunning: query(SyncDen).rule((r) => {
		const { scope, kind } = v(SyncScope, "scope")
		const { step } = v(SyncFinish, "finish")
		return r
			.match(SyncScope, { scope, kind })
			.match(SyncFinish, { scope, step })
			.where(r.not(SyncResult, { step }))
			.find({ scope, kind })
	}),
	syncWithins: query(SyncDen).rule((r) => {
		const { scope, parent } = v(SyncWithin, "syncWithin")
		return r.match(SyncWithin, { scope, parent }).find({ scope, parent })
	}),
	syncRoots: query(SyncDen).rule((r) => {
		const { scope, key, at } = v(SyncRoot, "syncRoot")
		return r.match(SyncRoot, { scope, key, at }).find({ scope, key, at })
	}),
	syncExclusiveKeys: query(SyncDen).rule((r) => {
		const { scope, key, id } = v(SyncExclusiveKey, "syncExclusiveKey")
		return r.match(SyncExclusiveKey, { scope, key, id }).find({ scope, key, id })
	}),
	syncBusyChain: query(SyncDen).rule((r) => {
		const { step } = v(App.relations.ChainStep, "step")
		return r
			.match(App.relations.ChainStep, { step })
			.where(r.not(App.relations.ChainResult, { step }))
			.find({ step })
	}),
	syncReadSyncCopyInput: SyncCopyInput,
	syncReadSyncBuildInput: SyncBuildInput,
	syncReadSyncSyncRunInput: SyncSyncRunInput,
	syncRequestSyncRun: ChangeSet.empty(SyncDen)
		.insert(SyncScope, [])
		.insert(SyncRoot, [])
		.insert(SyncExclusiveKey, [])
		.insert(SyncSyncRunInput, []),
	syncReadSyncGoldInput: SyncGoldInput,
	syncRequestGold: ChangeSet.empty(SyncDen)
		.insert(SyncScope, [])
		.insert(SyncRoot, [])
		.insert(SyncGoldInput, [])
})

export const syncDenWorkload = workload(SyncDen, syncDenPrograms)

export const syncSeatsPrograms = Object.freeze({
	syncHoldExclusive: ChangeSet.empty(SyncSeats).insert(SyncExclusive, []),
	syncReleaseExclusive: ChangeSet.empty(SyncSeats).delete(SyncExclusive, []),
	syncExclusives: query(SyncSeats).rule((r) => {
		const { kind, key, scope } = v(SyncExclusive, "syncExclusive")
		return r.match(SyncExclusive, { kind, key, scope }).find({ kind, key, scope })
	}),
	syncPause: ChangeSet.empty(SyncSeats).insert(SyncPaused, []),
	syncResume: ChangeSet.empty(SyncSeats).delete(SyncPaused, []),
	syncPausedAll: query(SyncSeats).rule((r) => {
		const { target } = v(SyncPaused, "syncPaused")
		return r.match(SyncPaused, { target }).find({ target })
	})
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
