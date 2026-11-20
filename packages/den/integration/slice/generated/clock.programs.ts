import { DenDelay, DenInstant } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Clock to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
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
	ClockHourlyInput,
	ClockChimeOutput,
	ClockHourlyFinishOutput,
	ClockPaused,
	ClockResumed,
	clockGraph,
	clockCoordination
} from "#integration/slice/generated/clock.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Clock: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ClockDen = role(
	App,
	"clock_den",
	{ ...clockGraph.relations, ClockPaused, ClockResumed },
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
			"ClockHourlyInput",
			"ClockHourlyFinishOutput"
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
		ClockResumed
	},
	{ insert: ["ClockPaused", "ClockResumed"] }
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

export const clockDenPrograms = Object.freeze({
	clockNow: clocked(
		query(clockGraph).rule((r) => r.find({ now: r.param("now", DenInstant) })),
		{ now: "millis" }
	),
	clockClaim: clocked(
		ChangeSet.empty(clockGraph)
			.insertComputed(ClockClaim, [], {
				until: Compute.cast(
					Compute.add(
						Compute.base(param("now", DenInstant)),
						Compute.base(param("budget", DenDelay))
					),
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
						at: Compute.cast(
							Compute.add(
								Compute.base(r.param("now", DenInstant)),
								Compute.base(r.param("delay", DenDelay))
							),
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
			.insert(
				ClockStep,
				query(clockGraph).rule((r) => {
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
						due: Compute.cast(
							Compute.add(Compute.base(r.param("now", DenInstant)), Compute.base(delay)),
							DenInstant
						),
						root: r.param("root", ClockStep.fields.root)
					})
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
	)
})

export const clockDenWorkload = workload(ClockDen, clockDenPrograms)

export const clockCoordinatorPrograms = Object.freeze({
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
		ChangeSet.empty(Loader).insert(App.relations.Chimed, [])
	),
	clockCommitHourlyFinish: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockHourlyFinishOutput, [])
})

export const clockCommits = workload(Loader, clockCommitPrograms)
