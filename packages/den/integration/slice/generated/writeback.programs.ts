import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Writeback to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import {
	ChangeSet,
	Compute,
	clocked,
	deferrable,
	param,
	query,
	role,
	v,
	workload
} from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { writeback as declaredFlow } from "#integration/slice/flows.ts"
import {
	WritebackKind,
	WritebackRootKind,
	WritebackOutcome,
	WritebackRetryWhy,
	WritebackPausable,
	WritebackScope,
	WritebackRoot,
	WritebackAdmitted,
	WritebackSkipped,
	WritebackStep,
	WritebackStartStep,
	WritebackFinish,
	WritebackClaim,
	WritebackEnded,
	WritebackRetry,
	WritebackFenced,
	WritebackResult,
	WritebackDone,
	WritebackFailed,
	WritebackHeld,
	WritebackRefusal,
	WritebackExhausted,
	WritebackDeliverInput,
	WritebackWritebackInput,
	WritebackDeliverOutput,
	WritebackWritebackFinishOutput,
	WritebackPaused,
	WritebackResumed,
	writebackGraph,
	writebackCoordination
} from "#integration/slice/generated/writeback.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Writeback: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const WritebackDen = role(
	App,
	"writeback_den",
	{ ...writebackGraph.relations, WritebackPaused, WritebackResumed },
	{
		insert: [
			"WritebackScope",
			"WritebackRoot",
			"WritebackAdmitted",
			"WritebackSkipped",
			"WritebackStep",
			"WritebackStartStep",
			"WritebackFinish",
			"WritebackClaim",
			"WritebackEnded",
			"WritebackRetry",
			"WritebackFenced",
			"WritebackResult",
			"WritebackDone",
			"WritebackFailed",
			"WritebackHeld",
			"WritebackRefusal",
			"WritebackExhausted",
			"WritebackDeliverInput",
			"WritebackWritebackInput",
			"WritebackWritebackFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Writeback: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const WritebackCoordinator = role(
	App,
	"writeback_coordinator",
	{
		WritebackKind,
		WritebackRootKind,
		WritebackOutcome,
		WritebackRetryWhy,
		WritebackPausable,
		WritebackPaused,
		WritebackResumed
	},
	{ insert: ["WritebackPaused", "WritebackResumed"] }
)

const writebackPendingRead = query(WritebackDen).rule((r) => {
	const { step, kind, scope, due } = v(WritebackStep, "step")
	return r
		.match(WritebackStep, { step, kind, scope, due })
		.where(r.not(WritebackResult, { step }))
		.find({ step, kind, scope, due })
})

const writebackRequestedRead = query(WritebackDen).rule((r) => {
	const { scope } = v(WritebackRoot, "root")
	return r
		.match(WritebackRoot, { scope })
		.match(WritebackScope, { scope })
		.where(r.not(WritebackAdmitted, { scope }), r.not(WritebackSkipped, { scope }))
		.find({ scope })
})

const writebackRunningRead = query(WritebackDen).rule((r) => {
	const { scope, step } = v(WritebackFinish, "finish")
	return r
		.match(WritebackFinish, { scope, step })
		.where(r.not(WritebackResult, { step }))
		.find({ scope })
})

export const writebackDenPrograms = Object.freeze({
	writebackNow: clocked(
		query(writebackGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	writebackClaim: clocked(
		ChangeSet.empty(writebackGraph)
			.insertComputed(WritebackClaim, [], {
				until: Compute.cast(
					Compute.add(
						Compute.base(param("now", DenInstant)),
						Compute.base(param("budget", DenDelay))
					),
					DenInstant
				)
			})
			.insert(WritebackEnded, [])
			.read("held", (delta) =>
				query(writebackGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(WritebackClaim), "added")
					return r
						.match(delta.added(WritebackClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ now: "millis" }
	),
	writebackRetry: clocked(
		ChangeSet.empty(writebackGraph)
			.insert(WritebackEnded, [])
			.insert(
				WritebackRetry,
				query(writebackGraph).rule((r) =>
					r.find({
						step: r.param("step", WritebackRetry.fields.step),
						attempt: r.param("attempt", WritebackRetry.fields.attempt),
						at: Compute.cast(
							Compute.add(
								Compute.base(r.param("now", DenInstant)),
								Compute.base(r.param("delay", DenDelay))
							),
							DenInstant
						),
						why: r.param("why", WritebackRetry.fields.why),
						root: r.param("root", WritebackRetry.fields.root)
					})
				)
			),
		{ now: "millis" }
	),
	writebackFence: ChangeSet.empty(writebackGraph)
		.insert(WritebackEnded, [])
		.insert(WritebackFenced, []),
	writebackRefuse: ChangeSet.empty(writebackGraph)
		.insert(WritebackResult, [])
		.insert(WritebackFailed, [])
		.insert(WritebackHeld, [])
		.insert(WritebackRefusal, []),
	writebackExhaust: ChangeSet.empty(writebackGraph)
		.insert(WritebackResult, [])
		.insert(WritebackFailed, [])
		.insert(WritebackHeld, [])
		.insert(WritebackExhausted, []),
	writebackAdmit: clocked(
		ChangeSet.empty(writebackGraph)
			.insert(WritebackAdmitted, [])
			.insert(WritebackFinish, [])
			.insert(WritebackStartStep, [])
			.insert(WritebackScope, [])
			.insert(WritebackDeliverInput, [])
			.insert(
				WritebackStep,
				query(writebackGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: WritebackStep.fields.step,
						kind: WritebackStep.fields.kind,
						scope: WritebackStep.fields.scope,
						delay: DenDelay
					})
					const { step, kind, scope, delay } = v(steps, "spawned")
					return r.match(steps, { step, kind, scope, delay }).find({
						step,
						kind,
						scope,
						due: Compute.cast(
							Compute.add(Compute.base(r.param("now", DenInstant)), Compute.base(delay)),
							DenInstant
						),
						root: r.param("root", WritebackStep.fields.root)
					})
				})
			),
		{ now: "millis" }
	),
	writebackSkip: ChangeSet.empty(writebackGraph).insert(WritebackSkipped, []),
	writebackSkippedOf: query(writebackGraph).rule((r) => {
		const { scope, by, root } = v(WritebackSkipped, "writebackSkipped")
		return r
			.match(WritebackSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", WritebackSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	writebackStepOf: query(writebackGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(WritebackStep, "writebackStep")
		return r
			.match(WritebackStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", WritebackStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	writebackResultOf: query(writebackGraph).rule((r) => {
		const { step, outcome, root } = v(WritebackResult, "writebackResult")
		return r
			.match(WritebackResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", WritebackResult.fields.step)))
			.find({ step, outcome, root })
	}),
	writebackHeldOf: query(writebackGraph).rule((r) => {
		const { step, attempt, root } = v(WritebackHeld, "writebackHeld")
		return r
			.match(WritebackHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", WritebackHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	writebackAdmittedOf: query(writebackGraph).rule((r) => {
		const { scope, root } = v(WritebackAdmitted, "writebackAdmitted")
		return r
			.match(WritebackAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", WritebackAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	writebackRootOf: query(writebackGraph).rule((r) => {
		const { scope, kind, key, at } = v(WritebackRoot, "writebackRoot")
		return r
			.match(WritebackRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", WritebackRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	writebackFinishedRoots: deferrable(
		query(writebackGraph)
			.rule((r) => {
				const { scope } = v(WritebackRoot, "root")
				const { step } = v(WritebackFinish, "finish")
				return r
					.match(WritebackRoot, { scope })
					.match(WritebackFinish, { scope, step })
					.match(WritebackResult, { step })
					.find({ scope })
			})
			.rule((r) => {
				const { scope } = v(WritebackRoot, "root")
				return r.match(WritebackRoot, { scope }).match(WritebackSkipped, { scope }).find({ scope })
			})
	),
	writebackClaimsOf: query(writebackGraph).rule((r) => {
		const { step, attempt, until } = v(WritebackClaim, "claim")
		return r
			.match(WritebackClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", WritebackStep.fields.step)))
			.find({ step, attempt, until })
	}),
	writebackRetriesOf: query(writebackGraph).rule((r) => {
		const { step, attempt, at, why } = v(WritebackRetry, "retry")
		return r
			.match(WritebackRetry, { step, attempt, at, why })
			.where(r.eq(step, r.param("step", WritebackStep.fields.step)))
			.find({ step, attempt, at, why })
	}),
	writebackFencedOf: query(writebackGraph).rule((r) => {
		const { step, attempt } = v(WritebackFenced, "fenced")
		return r
			.match(WritebackFenced, { step, attempt })
			.where(r.eq(step, r.param("step", WritebackStep.fields.step)))
			.find({ step, attempt })
	}),
	writebackUnendedSteps: query(writebackGraph).rule((r) => {
		const { step, scope } = v(WritebackStep, "step")
		return r
			.match(WritebackStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", WritebackScope.fields.scope)),
				r.not(WritebackResult, { step }),
				r.not(WritebackFinish, { scope, step })
			)
			.find({ step })
	}),
	writebackFinished: query(writebackGraph).rule((r) => {
		const { scope, step } = v(WritebackFinish, "finish")
		return r
			.match(WritebackFinish, { scope, step })
			.match(WritebackResult, { step })
			.where(r.eq(scope, r.param("scope", WritebackScope.fields.scope)))
			.find({ step })
	}),
	writebackPending: deferrable(writebackPendingRead),
	writebackRequested: deferrable(writebackRequestedRead),
	writebackRunning: deferrable(writebackRunningRead),
	writebackSnapshot: deferrable(
		query(WritebackDen).reads({
			steps: writebackPendingRead,
			claims: query(WritebackDen).rule((r) => {
				const { step, attempt, until } = v(WritebackClaim, "claim")
				return r
					.match(WritebackClaim, { step, attempt, until })
					.where(r.not(WritebackResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(WritebackDen).rule((r) => {
				const { step, attempt, at, why } = v(WritebackRetry, "retry")
				return r
					.match(WritebackRetry, { step, attempt, at, why })
					.where(r.not(WritebackResult, { step }))
					.find({ step, attempt, at, why })
			}),
			fenced: query(WritebackDen).rule((r) => {
				const { step, attempt } = v(WritebackFenced, "fenced")
				return r
					.match(WritebackFenced, { step, attempt })
					.where(r.not(WritebackResult, { step }))
					.find({ step, attempt })
			}),
			requested: writebackRequestedRead,
			running: writebackRunningRead,
			roots: query(WritebackDen).rule((r) => {
				const { scope, kind, key, at } = v(WritebackRoot, "writebackRoot")
				return r.match(WritebackRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			paused: query(WritebackDen).rule((r) => {
				const { target, turn } = v(WritebackPaused, "writebackPaused")
				return r
					.match(WritebackPaused, { target, turn })
					.where(r.not(WritebackResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	writebackReadWritebackDeliverInput: query(writebackGraph).rule((r) => {
		const { step, attempt, root } = v(WritebackDeliverInput, "writebackDeliverInput")
		return r
			.match(WritebackDeliverInput, { step, attempt, root })
			.where(r.eq(step, r.param("step", WritebackDeliverInput.fields.step)))
			.find({ step, attempt, root })
	}),
	writebackReadWritebackWritebackInput: query(writebackGraph).rule((r) => {
		const { scope, attempt, root } = v(WritebackWritebackInput, "writebackWritebackInput")
		return r
			.match(WritebackWritebackInput, { scope, attempt, root })
			.where(r.eq(scope, r.param("scope", WritebackWritebackInput.fields.scope)))
			.find({ scope, attempt, root })
	}),
	writebackRequestWriteback: clocked(
		ChangeSet.empty(writebackGraph)
			.insert(WritebackScope, [])
			.insert(WritebackWritebackInput, [])
			.insert(
				WritebackRoot,
				query(writebackGraph).rule((r) =>
					r.find({
						scope: r.param("writebackWritebackScope", WritebackRoot.fields.scope),
						kind: WritebackRootKind.handle("Writeback"),
						key: r.param("writebackWritebackKey", WritebackRoot.fields.key),
						at: r.param("now", WritebackRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	)
})

export const writebackDenWorkload = workload(WritebackDen, writebackDenPrograms)

export const writebackCoordinatorPrograms = Object.freeze({
	writebackPause: ChangeSet.empty(writebackCoordination).insert(WritebackPaused, []),
	writebackResume: ChangeSet.empty(writebackCoordination).insert(WritebackResumed, []),
	writebackPauseTurns: deferrable(
		query(writebackCoordination).rule((r) => {
			const { target, turn } = v(WritebackPaused, "writebackPaused")
			return r.match(WritebackPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	writebackPausedAll: deferrable(
		query(writebackCoordination).rule((r) => {
			const { target, turn } = v(WritebackPaused, "writebackPaused")
			return r
				.match(WritebackPaused, { target, turn })
				.where(r.not(WritebackResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const writebackCoordinatorWorkload = workload(
	WritebackCoordinator,
	writebackCoordinatorPrograms
)

/** den's retiring role for the flow Writeback: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const WritebackRetirer = role(
	App,
	"writeback_retirer",
	{ ...writebackGraph.relations },
	{ retire: ["WritebackRoot"] }
)

export const writebackRetirerPrograms = Object.freeze({
	writebackRetire: ChangeSet.empty(writebackGraph).retire(WritebackRoot, [])
})

export const writebackRetirerWorkload = workload(WritebackRetirer, writebackRetirerPrograms)

/** The commits and declared reads of the flow Writeback, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const writebackCommitPrograms = Object.freeze({
	writebackAuthenticated: clocked(
		query(writebackGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	writebackCommitDeliver: ChangeSet.union(
		ChangeSet.empty(writebackGraph)
			.insert(WritebackResult, [])
			.insert(WritebackDone, [])
			.insert(WritebackHeld, [])
			.insert(WritebackDeliverOutput, []),
		declaredFlow.kinds[0].writes.changes(Loader)
	),
	writebackCommitWritebackFinish: ChangeSet.empty(writebackGraph)
		.insert(WritebackResult, [])
		.insert(WritebackDone, [])
		.insert(WritebackHeld, [])
		.insert(WritebackWritebackFinishOutput, [])
})

export const writebackCommits = workload(Loader, writebackCommitPrograms)
