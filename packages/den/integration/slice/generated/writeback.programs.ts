import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Writeback to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, Num, Type, clocked, param, query, role, v, workload } from "@bjornpagen/grizzle"
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
	WritebackRequestedWith,
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
	WritebackServed,
	writebackGraph,
	writebackCoordination
} from "#integration/slice/generated/writeback.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Writeback: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const WritebackDen = role(
	App,
	"writeback_den",
	{ ...writebackGraph.relations, WritebackPaused, WritebackResumed, WritebackServed },
	{
		insert: [
			"WritebackScope",
			"WritebackRoot",
			"WritebackRequestedWith",
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
		WritebackResumed,
		WritebackServed
	},
	{ insert: ["WritebackPaused", "WritebackResumed", "WritebackServed"] }
)

const writebackPendingRead = query(WritebackDen).rule((r) => {
	const { step, kind, scope, due } = v(WritebackStep, "step")
	return r
		.match(WritebackStep, { step, kind, scope, due })
		.where(r.not(WritebackResult, { step }))
		.find({ step, kind, scope, due })
})

const writebackRequestedRead = query(WritebackDen).rule((r) => {
	const { scope } = v(WritebackScope, "scope")
	return r
		.match(WritebackRoot, { root: scope })
		.match(WritebackScope, { root: scope, scope })
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

const writebackLatestServed = query(WritebackDen).rule((r) => {
	const { environment, at } = v(WritebackServed, "served")
	return r
		.match(WritebackServed, { environment, at })
		.where(r.eq(environment, r.param("environment", WritebackServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const writebackDenPrograms = Object.freeze({
	writebackNow: clocked(
		query(writebackGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" }
	),
	writebackReading: clocked(
		query(WritebackDen).reads({
			now: query(writebackGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: query(WritebackDen).rule((r) => {
				const { environment, at, deployment } = v(WritebackServed, "served")
				return r
					.match(
						writebackLatestServed.bind({
							environment: r.param("environment", WritebackServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(WritebackServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" }
	),
	writebackClaim: clocked(
		ChangeSet.empty(writebackGraph)
			.insertAllComputed(
				{ WritebackClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("denNow", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant
					)
				}
			)
			.insert(WritebackEnded, [])
			.read("held", (delta) =>
				query(writebackGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(WritebackClaim), "added")
					return r
						.match(delta.added(WritebackClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" }
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
						at: Type.cast(
							Num.add(
								Type.base(r.param("denNow", DenInstant)),
								Type.base(r.param("delay", DenDelay))
							),
							DenInstant
						),
						why: r.param("why", WritebackRetry.fields.why),
						root: r.param("root", WritebackRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" }
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
						due: Type.cast(
							Num.add(Type.base(r.param("denNow", DenInstant)), Type.base(delay)),
							DenInstant
						),
						root: r.param("root", WritebackStep.fields.root)
					})
				})
			),
		{ denNow: "millis" }
	),
	writebackSkip: ChangeSet.empty(writebackGraph).insert(WritebackSkipped, []),
	writebackSkippedOf: query(writebackGraph).rule((r) => {
		const { root, scope, by } = v(WritebackSkipped, "writebackSkipped")
		return r
			.match(WritebackSkipped, { root, scope, by })
			.where(r.eq(scope, r.param("scope", WritebackSkipped.fields.scope)))
			.find({ root, scope, by })
	}),
	writebackStepOf: query(writebackGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(WritebackStep, "writebackStep")
		return r
			.match(WritebackStep, { root, step, kind, scope, due })
			.where(r.eq(step, r.param("step", WritebackStep.fields.step)))
			.find({ root, step, kind, scope, due })
	}),
	writebackResultOf: query(writebackGraph).rule((r) => {
		const { root, step, outcome } = v(WritebackResult, "writebackResult")
		return r
			.match(WritebackResult, { root, step, outcome })
			.where(r.eq(step, r.param("step", WritebackResult.fields.step)))
			.find({ root, step, outcome })
	}),
	writebackHeldOf: query(writebackGraph).rule((r) => {
		const { root, step, attempt } = v(WritebackHeld, "writebackHeld")
		return r
			.match(WritebackHeld, { root, step, attempt })
			.where(r.eq(step, r.param("step", WritebackHeld.fields.step)))
			.find({ root, step, attempt })
	}),
	writebackAdmittedOf: query(writebackGraph).rule((r) => {
		const { root, scope } = v(WritebackAdmitted, "writebackAdmitted")
		return r
			.match(WritebackAdmitted, { root, scope })
			.where(r.eq(scope, r.param("scope", WritebackAdmitted.fields.scope)))
			.find({ root, scope })
	}),
	writebackRootOf: query(writebackGraph).rule((r) => {
		const { kind, key, at } = v(WritebackRoot, "root")
		const { scope } = v(WritebackScope, "scope")
		return r
			.match(WritebackRoot, { root: scope, kind, key, at })
			.match(WritebackScope, { root: scope, scope })
			.where(r.eq(scope, r.param("scope", WritebackRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	writebackFinishedRoots: query(writebackGraph)
		.rule((r) => {
			const { scope, step } = v(WritebackFinish, "finish")
			return r
				.match(WritebackFinish, { root: scope, scope, step })
				.match(WritebackResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(WritebackSkipped, "skipped")
			return r.match(WritebackSkipped, { root: scope, scope }).find({ scope })
		}),
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
	writebackPending: writebackPendingRead,
	writebackRequested: writebackRequestedRead,
	writebackRunning: writebackRunningRead,
	writebackSnapshot: query(WritebackDen).reads({
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
			const { kind, key, at } = v(WritebackRoot, "root")
			const { scope } = v(WritebackScope, "scope")
			return r
				.match(WritebackRoot, { root: scope, kind, key, at })
				.match(WritebackScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: query(WritebackDen).rule((r) => {
			const { target, turn } = v(WritebackPaused, "writebackPaused")
			return r
				.match(WritebackPaused, { target, turn })
				.where(r.not(WritebackResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	writebackReadWritebackDeliverInput: query(writebackGraph).rule((r) => {
		const { root, step, attempt } = v(WritebackDeliverInput, "writebackDeliverInput")
		return r
			.match(WritebackDeliverInput, { root, step, attempt })
			.where(r.eq(step, r.param("step", WritebackDeliverInput.fields.step)))
			.find({ root, step, attempt })
	}),
	writebackReadWritebackWritebackInput: query(writebackGraph).rule((r) => {
		const { root, scope, attempt } = v(WritebackWritebackInput, "writebackWritebackInput")
		return r
			.match(WritebackWritebackInput, { root, scope, attempt })
			.where(r.eq(scope, r.param("scope", WritebackWritebackInput.fields.scope)))
			.find({ root, scope, attempt })
	}),
	writebackRequestWriteback: clocked(
		ChangeSet.empty(writebackGraph)
			.insert(
				WritebackScope,
				query(writebackGraph).rule((r) => {
					const requested = r.relation("writebackWritebackWritebackScope", {
						root: WritebackScope.fields.root,
						scope: WritebackScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(WritebackRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				WritebackWritebackInput,
				query(writebackGraph).rule((r) => {
					const requested = r.relation("writebackWritebackWritebackWritebackInput", {
						root: WritebackWritebackInput.fields.root,
						scope: WritebackWritebackInput.fields.scope,
						attempt: WritebackWritebackInput.fields.attempt
					})
					const { root, scope, attempt } = v(requested, "requested")
					return r
						.match(requested, { root, scope, attempt })
						.where(r.not(WritebackRoot, { root }))
						.find({ root, scope, attempt })
				})
			)
			.insert(
				WritebackRequestedWith,
				query(writebackGraph)
					.rule((r) => {
						const requested = r.relation("writebackWritebackWritebackRequestedWith", {
							root: WritebackRequestedWith.fields.root,
							fingerprint: WritebackRequestedWith.fields.fingerprint,
							input: WritebackRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(WritebackRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("writebackWritebackWritebackRequestedWith", {
							root: WritebackRequestedWith.fields.root,
							fingerprint: WritebackRequestedWith.fields.fingerprint,
							input: WritebackRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(WritebackRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(WritebackRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				WritebackRoot,
				query(writebackGraph).rule((r) => {
					const requested = r.relation("writebackWritebackWritebackScope", {
						root: WritebackScope.fields.root,
						scope: WritebackScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("writebackWritebackScope", WritebackRoot.fields.root)),
							r.not(WritebackRoot, { root })
						)
						.find({
							root,
							kind: WritebackRootKind.handle("Writeback"),
							key: r.param("writebackWritebackKey", WritebackRoot.fields.key),
							at: r.param("denNow", WritebackRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" }
	)
})

export const writebackDenWorkload = workload(WritebackDen, writebackDenPrograms)

export const writebackCoordinatorPrograms = Object.freeze({
	writebackPromote: clocked(
		ChangeSet.empty(writebackCoordination).insert(
			WritebackServed,
			query(writebackCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", WritebackServed.fields.environment),
					at: r.param("denNow", WritebackServed.fields.at),
					deployment: r.param("deployment", WritebackServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" }
	),
	writebackPause: ChangeSet.empty(writebackCoordination).insert(WritebackPaused, []),
	writebackResume: ChangeSet.empty(writebackCoordination).insert(WritebackResumed, []),
	writebackPauseTurns: query(writebackCoordination).rule((r) => {
		const { target, turn } = v(WritebackPaused, "writebackPaused")
		return r.match(WritebackPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	writebackPausedAll: query(writebackCoordination).rule((r) => {
		const { target, turn } = v(WritebackPaused, "writebackPaused")
		return r
			.match(WritebackPaused, { target, turn })
			.where(r.not(WritebackResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const writebackCoordinatorWorkload = workload(
	WritebackCoordinator,
	writebackCoordinatorPrograms
)

/** den's retiring role for the flow Writeback: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const WritebackRetirer = role(
	App,
	"writeback_retirer",
	{ ...writebackGraph.relations },
	{
		write: [
			"WritebackScope",
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
			"WritebackDeliverOutput",
			"WritebackWritebackFinishOutput"
		]
	}
)

export const writebackRetirerPrograms = Object.freeze({
	writebackRetire: ChangeSet.empty(writebackGraph).deleteWhere({
		WritebackScope: { root: param("root", WritebackRoot.fields.root) },
		WritebackAdmitted: { root: param("root", WritebackRoot.fields.root) },
		WritebackSkipped: { root: param("root", WritebackRoot.fields.root) },
		WritebackStep: { root: param("root", WritebackRoot.fields.root) },
		WritebackStartStep: { root: param("root", WritebackRoot.fields.root) },
		WritebackFinish: { root: param("root", WritebackRoot.fields.root) },
		WritebackClaim: { root: param("root", WritebackRoot.fields.root) },
		WritebackEnded: { root: param("root", WritebackRoot.fields.root) },
		WritebackRetry: { root: param("root", WritebackRoot.fields.root) },
		WritebackFenced: { root: param("root", WritebackRoot.fields.root) },
		WritebackResult: { root: param("root", WritebackRoot.fields.root) },
		WritebackDone: { root: param("root", WritebackRoot.fields.root) },
		WritebackFailed: { root: param("root", WritebackRoot.fields.root) },
		WritebackHeld: { root: param("root", WritebackRoot.fields.root) },
		WritebackRefusal: { root: param("root", WritebackRoot.fields.root) },
		WritebackExhausted: { root: param("root", WritebackRoot.fields.root) },
		WritebackDeliverInput: { root: param("root", WritebackRoot.fields.root) },
		WritebackWritebackInput: { root: param("root", WritebackRoot.fields.root) },
		WritebackDeliverOutput: { root: param("root", WritebackRoot.fields.root) },
		WritebackWritebackFinishOutput: { root: param("root", WritebackRoot.fields.root) }
	})
})

export const writebackRetirerWorkload = workload(WritebackRetirer, writebackRetirerPrograms)

/** The commits and declared reads of the flow Writeback, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const writebackCommitPrograms = Object.freeze({
	writebackAuthenticated: clocked(
		query(writebackGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" }
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
