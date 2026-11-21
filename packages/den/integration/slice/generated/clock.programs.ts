import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Clock to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import {
	ChangeSet,
	Num,
	Type,
	clocked,
	deferrable,
	param,
	query,
	role,
	v,
	workload
} from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { clock as declaredFlow } from "#integration/slice/flows.ts"
import {
	ClockKind,
	ClockRootKind,
	ClockOutcome,
	ClockRetryWhy,
	ClockPausable,
	ClockChimeInputBell,
	ClockHourlyInputBell,
	ClockChimeOutputBell,
	ClockScope,
	ClockRoot,
	ClockAdmitted,
	ClockSkipped,
	ClockStep,
	ClockStartStep,
	ClockFinish,
	ClockClaim,
	ClockEnded,
	ClockRetry,
	ClockFenced,
	ClockResult,
	ClockDone,
	ClockFailed,
	ClockHeld,
	ClockRefusal,
	ClockExhausted,
	ClockChimeInput,
	ClockCloseInput,
	ClockHourlyInput,
	ClockSittingInput,
	ClockChimeOutput,
	ClockCloseOutput,
	ClockHourlyFinishOutput,
	ClockSittingFinishOutput,
	ClockPaused,
	ClockResumed,
	ClockServed,
	clockGraph,
	clockCoordination
} from "#integration/slice/generated/clock.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Clock: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ClockDen = role(
	App,
	"clock_den",
	{ ...clockGraph.relations, ClockPaused, ClockResumed, ClockServed },
	{
		insert: [
			"ClockScope",
			"ClockRoot",
			"ClockAdmitted",
			"ClockSkipped",
			"ClockStep",
			"ClockStartStep",
			"ClockFinish",
			"ClockClaim",
			"ClockEnded",
			"ClockRetry",
			"ClockFenced",
			"ClockResult",
			"ClockDone",
			"ClockFailed",
			"ClockHeld",
			"ClockRefusal",
			"ClockExhausted",
			"ClockChimeInput",
			"ClockCloseInput",
			"ClockHourlyInput",
			"ClockSittingInput",
			"ClockHourlyFinishOutput",
			"ClockSittingFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Clock: the turns of its seats, exclusivity seats and pauses, the seat module's. It holds the coordination group's rosters and relations whole, no role holding a closed relation. */
export const ClockCoordinator = role(
	App,
	"clock_coordinator",
	{
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockRetryWhy,
		ClockPausable,
		ClockChimeInputBell,
		ClockHourlyInputBell,
		ClockChimeOutputBell,
		ClockPaused,
		ClockResumed,
		ClockServed
	},
	{ insert: ["ClockPaused", "ClockResumed", "ClockServed"] }
)

const clockPendingRead = query(ClockDen).rule((r) => {
	const { step, kind, scope, due } = v(ClockStep, "step")
	return r
		.match(ClockStep, { step, kind, scope, due })
		.where(r.not(ClockResult, { step }))
		.find({ step, kind, scope, due })
})

const clockRequestedRead = query(ClockDen).rule((r) => {
	const { scope } = v(ClockRoot, "root")
	return r
		.match(ClockRoot, { scope })
		.match(ClockScope, { scope })
		.where(r.not(ClockAdmitted, { scope }), r.not(ClockSkipped, { scope }))
		.find({ scope })
})

const clockRunningRead = query(ClockDen).rule((r) => {
	const { scope, step } = v(ClockFinish, "finish")
	return r.match(ClockFinish, { scope, step }).where(r.not(ClockResult, { step })).find({ scope })
})

const clockLatestServed = query(ClockDen).rule((r) => {
	const { environment, at } = v(ClockServed, "served")
	return r
		.match(ClockServed, { environment, at })
		.where(r.eq(environment, r.param("environment", ClockServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const clockDenPrograms = Object.freeze({
	clockNow: clocked(
		query(clockGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	clockReading: clocked(
		query(ClockDen).reads({
			now: query(clockGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
			serving: query(ClockDen).rule((r) => {
				const { environment, at, deployment } = v(ClockServed, "served")
				return r
					.match(
						clockLatestServed.bind({
							environment: r.param("environment", ClockServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(ClockServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.now": "millis" }
	),
	clockClaim: clocked(
		ChangeSet.empty(clockGraph)
			.insertComputed(ClockClaim, [], {
				until: Type.cast(
					Num.add(Type.base(param("now", DenInstant)), Type.base(param("budget", DenDelay))),
					DenInstant
				)
			})
			.insert(ClockEnded, [])
			.read("held", (delta) =>
				query(clockGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(ClockClaim), "added")
					return r
						.match(delta.added(ClockClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ now: "millis" }
	),
	clockRetry: clocked(
		ChangeSet.empty(clockGraph)
			.insert(ClockEnded, [])
			.insert(
				ClockRetry,
				query(clockGraph).rule((r) =>
					r.find({
						step: r.param("step", ClockRetry.fields.step),
						attempt: r.param("attempt", ClockRetry.fields.attempt),
						at: Type.cast(
							Num.add(Type.base(r.param("now", DenInstant)), Type.base(r.param("delay", DenDelay))),
							DenInstant
						),
						why: r.param("why", ClockRetry.fields.why),
						root: r.param("root", ClockRetry.fields.root)
					})
				)
			),
		{ now: "millis" }
	),
	clockFence: ChangeSet.empty(clockGraph).insert(ClockEnded, []).insert(ClockFenced, []),
	clockRefuse: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockFailed, [])
		.insert(ClockHeld, [])
		.insert(ClockRefusal, []),
	clockExhaust: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockFailed, [])
		.insert(ClockHeld, [])
		.insert(ClockExhausted, []),
	clockAdmit: clocked(
		ChangeSet.empty(clockGraph)
			.insert(ClockAdmitted, [])
			.insert(ClockFinish, [])
			.insert(ClockStartStep, [])
			.insert(ClockScope, [])
			.insert(ClockChimeInput, [])
			.insert(ClockCloseInput, [])
			.insert(
				ClockStep,
				query(clockGraph)
					.rule((r) => {
						const steps = r.relation("steps", {
							step: ClockStep.fields.step,
							kind: ClockStep.fields.kind,
							scope: ClockStep.fields.scope,
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
							root: r.param("root", ClockStep.fields.root)
						})
					})
					.rule((r) => {
						const timed = r.relation("timed", {
							step: ClockStep.fields.step,
							kind: ClockStep.fields.kind,
							scope: ClockStep.fields.scope,
							due: ClockStep.fields.due
						})
						const { step, kind, scope, due } = v(timed, "timed")
						return r
							.match(timed, { step, kind, scope, due })
							.find({ step, kind, scope, due, root: r.param("root", ClockStep.fields.root) })
					})
			),
		{ now: "millis" }
	),
	clockSkip: ChangeSet.empty(clockGraph).insert(ClockSkipped, []),
	clockSkippedOf: query(clockGraph).rule((r) => {
		const { scope, by, root } = v(ClockSkipped, "clockSkipped")
		return r
			.match(ClockSkipped, { scope, by, root })
			.where(r.eq(scope, r.param("scope", ClockSkipped.fields.scope)))
			.find({ scope, by, root })
	}),
	clockStepOf: query(clockGraph).rule((r) => {
		const { step, kind, scope, due, root } = v(ClockStep, "clockStep")
		return r
			.match(ClockStep, { step, kind, scope, due, root })
			.where(r.eq(step, r.param("step", ClockStep.fields.step)))
			.find({ step, kind, scope, due, root })
	}),
	clockResultOf: query(clockGraph).rule((r) => {
		const { step, outcome, root } = v(ClockResult, "clockResult")
		return r
			.match(ClockResult, { step, outcome, root })
			.where(r.eq(step, r.param("step", ClockResult.fields.step)))
			.find({ step, outcome, root })
	}),
	clockHeldOf: query(clockGraph).rule((r) => {
		const { step, attempt, root } = v(ClockHeld, "clockHeld")
		return r
			.match(ClockHeld, { step, attempt, root })
			.where(r.eq(step, r.param("step", ClockHeld.fields.step)))
			.find({ step, attempt, root })
	}),
	clockAdmittedOf: query(clockGraph).rule((r) => {
		const { scope, root } = v(ClockAdmitted, "clockAdmitted")
		return r
			.match(ClockAdmitted, { scope, root })
			.where(r.eq(scope, r.param("scope", ClockAdmitted.fields.scope)))
			.find({ scope, root })
	}),
	clockRootOf: query(clockGraph).rule((r) => {
		const { scope, kind, key, at } = v(ClockRoot, "clockRoot")
		return r
			.match(ClockRoot, { scope, kind, key, at })
			.where(r.eq(scope, r.param("scope", ClockRoot.fields.scope)))
			.find({ scope, kind, key, at })
	}),
	clockFinishedRoots: deferrable(
		query(clockGraph)
			.rule((r) => {
				const { scope } = v(ClockRoot, "root")
				const { step } = v(ClockFinish, "finish")
				return r
					.match(ClockRoot, { scope })
					.match(ClockFinish, { scope, step })
					.match(ClockResult, { step })
					.find({ scope })
			})
			.rule((r) => {
				const { scope } = v(ClockRoot, "root")
				return r.match(ClockRoot, { scope }).match(ClockSkipped, { scope }).find({ scope })
			})
	),
	clockClaimsOf: query(clockGraph).rule((r) => {
		const { step, attempt, until } = v(ClockClaim, "claim")
		return r
			.match(ClockClaim, { step, attempt, until })
			.where(r.eq(step, r.param("step", ClockStep.fields.step)))
			.find({ step, attempt, until })
	}),
	clockRetriesOf: query(clockGraph).rule((r) => {
		const { step, attempt, at, why } = v(ClockRetry, "retry")
		return r
			.match(ClockRetry, { step, attempt, at, why })
			.where(r.eq(step, r.param("step", ClockStep.fields.step)))
			.find({ step, attempt, at, why })
	}),
	clockFencedOf: query(clockGraph).rule((r) => {
		const { step, attempt } = v(ClockFenced, "fenced")
		return r
			.match(ClockFenced, { step, attempt })
			.where(r.eq(step, r.param("step", ClockStep.fields.step)))
			.find({ step, attempt })
	}),
	clockUnendedSteps: query(clockGraph).rule((r) => {
		const { step, scope } = v(ClockStep, "step")
		return r
			.match(ClockStep, { step, scope })
			.where(
				r.eq(scope, r.param("scope", ClockScope.fields.scope)),
				r.not(ClockResult, { step }),
				r.not(ClockFinish, { scope, step })
			)
			.find({ step })
	}),
	clockFinished: query(clockGraph).rule((r) => {
		const { scope, step } = v(ClockFinish, "finish")
		return r
			.match(ClockFinish, { scope, step })
			.match(ClockResult, { step })
			.where(r.eq(scope, r.param("scope", ClockScope.fields.scope)))
			.find({ step })
	}),
	clockPending: deferrable(clockPendingRead),
	clockRequested: deferrable(clockRequestedRead),
	clockRunning: deferrable(clockRunningRead),
	clockSnapshot: deferrable(
		query(ClockDen).reads({
			steps: clockPendingRead,
			claims: query(ClockDen).rule((r) => {
				const { step, attempt, until } = v(ClockClaim, "claim")
				return r
					.match(ClockClaim, { step, attempt, until })
					.where(r.not(ClockResult, { step }))
					.find({ step, attempt, until })
			}),
			retries: query(ClockDen).rule((r) => {
				const { step, attempt, at, why } = v(ClockRetry, "retry")
				return r
					.match(ClockRetry, { step, attempt, at, why })
					.where(r.not(ClockResult, { step }))
					.find({ step, attempt, at, why })
			}),
			fenced: query(ClockDen).rule((r) => {
				const { step, attempt } = v(ClockFenced, "fenced")
				return r
					.match(ClockFenced, { step, attempt })
					.where(r.not(ClockResult, { step }))
					.find({ step, attempt })
			}),
			requested: clockRequestedRead,
			running: clockRunningRead,
			roots: query(ClockDen).rule((r) => {
				const { scope, kind, key, at } = v(ClockRoot, "clockRoot")
				return r.match(ClockRoot, { scope, kind, key, at }).find({ scope, kind, key, at })
			}),
			paused: query(ClockDen).rule((r) => {
				const { target, turn } = v(ClockPaused, "clockPaused")
				return r
					.match(ClockPaused, { target, turn })
					.where(r.not(ClockResumed, { target, turn }))
					.find({ target, turn })
			})
		})
	),
	clockReadClockChimeInput: query(clockGraph).rule((r) => {
		const { step, hour, bell, root } = v(ClockChimeInput, "clockChimeInput")
		return r
			.match(ClockChimeInput, { step, hour, bell, root })
			.where(r.eq(step, r.param("step", ClockChimeInput.fields.step)))
			.find({ step, hour, bell, root })
	}),
	clockReadClockCloseInput: query(clockGraph).rule((r) => {
		const { step, sitting, deadline, root } = v(ClockCloseInput, "clockCloseInput")
		return r
			.match(ClockCloseInput, { step, sitting, deadline, root })
			.where(r.eq(step, r.param("step", ClockCloseInput.fields.step)))
			.find({ step, sitting, deadline, root })
	}),
	clockReadClockHourlyInput: query(clockGraph).rule((r) => {
		const { scope, hour, bell, root } = v(ClockHourlyInput, "clockHourlyInput")
		return r
			.match(ClockHourlyInput, { scope, hour, bell, root })
			.where(r.eq(scope, r.param("scope", ClockHourlyInput.fields.scope)))
			.find({ scope, hour, bell, root })
	}),
	clockRequestHourly: clocked(
		ChangeSet.empty(clockGraph)
			.insert(ClockScope, [])
			.insert(ClockHourlyInput, [])
			.insert(
				ClockRoot,
				query(clockGraph).rule((r) =>
					r.find({
						scope: r.param("clockHourlyScope", ClockRoot.fields.scope),
						kind: ClockRootKind.handle("Hourly"),
						key: r.param("clockHourlyKey", ClockRoot.fields.key),
						at: r.param("now", ClockRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	),
	clockReadClockSittingInput: query(clockGraph).rule((r) => {
		const { scope, sitting, deadline, root } = v(ClockSittingInput, "clockSittingInput")
		return r
			.match(ClockSittingInput, { scope, sitting, deadline, root })
			.where(r.eq(scope, r.param("scope", ClockSittingInput.fields.scope)))
			.find({ scope, sitting, deadline, root })
	}),
	clockRequestSitting: clocked(
		ChangeSet.empty(clockGraph)
			.insert(ClockScope, [])
			.insert(ClockSittingInput, [])
			.insert(
				ClockRoot,
				query(clockGraph).rule((r) =>
					r.find({
						scope: r.param("clockSittingScope", ClockRoot.fields.scope),
						kind: ClockRootKind.handle("Sitting"),
						key: r.param("clockSittingKey", ClockRoot.fields.key),
						at: r.param("now", ClockRoot.fields.at)
					})
				)
			),
		{ now: "millis" }
	)
})

export const clockDenWorkload = workload(ClockDen, clockDenPrograms)

export const clockCoordinatorPrograms = Object.freeze({
	clockPromote: clocked(
		ChangeSet.empty(clockCoordination).insert(
			ClockServed,
			query(clockCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", ClockServed.fields.environment),
					at: r.param("now", ClockServed.fields.at),
					deployment: r.param("deployment", ClockServed.fields.deployment)
				})
			)
		),
		{ now: "millis" }
	),
	clockPause: ChangeSet.empty(clockCoordination).insert(ClockPaused, []),
	clockResume: ChangeSet.empty(clockCoordination).insert(ClockResumed, []),
	clockPauseTurns: deferrable(
		query(clockCoordination).rule((r) => {
			const { target, turn } = v(ClockPaused, "clockPaused")
			return r.match(ClockPaused, { target, turn }).find({ target, turn: r.max(turn) })
		})
	),
	clockPausedAll: deferrable(
		query(clockCoordination).rule((r) => {
			const { target, turn } = v(ClockPaused, "clockPaused")
			return r
				.match(ClockPaused, { target, turn })
				.where(r.not(ClockResumed, { target, turn }))
				.find({ target, turn })
		})
	)
})

export const clockCoordinatorWorkload = workload(ClockCoordinator, clockCoordinatorPrograms)

/** den's retiring role for the flow Clock: it retires finished roots' graphs whole, grizzle's retirement of the flow's unit, and writes nothing else: a role of its own, as grizzle's retirement asks. */
export const ClockRetirer = role(
	App,
	"clock_retirer",
	{ ...clockGraph.relations },
	{ retire: ["ClockRoot"] }
)

export const clockRetirerPrograms = Object.freeze({
	clockRetire: ChangeSet.empty(clockGraph).retire(ClockRoot, [])
})

export const clockRetirerWorkload = workload(ClockRetirer, clockRetirerPrograms)

/** The commits and declared reads of the flow Clock, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const clockCommitPrograms = Object.freeze({
	clockAuthenticated: clocked(
		query(clockGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	clockCommitChime: ChangeSet.union(
		ChangeSet.empty(clockGraph)
			.insert(ClockResult, [])
			.insert(ClockDone, [])
			.insert(ClockHeld, [])
			.insert(ClockChimeOutput, []),
		declaredFlow.kinds[0].writes.changes(Loader)
	),
	clockCommitClose: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockCloseOutput, []),
	clockCommitHourlyFinish: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockHourlyFinishOutput, []),
	clockCommitSittingFinish: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockSittingFinishOutput, [])
})

export const clockCommits = workload(Loader, clockCommitPrograms)
