import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Clock to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import * as g from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { clock as declaredFlow } from "#integration/slice/flows.ts"
import {
	ClockKind,
	ClockRootKind,
	ClockOutcome,
	ClockRetryWhy,
	ClockPausable,
	ClockScope,
	ClockRoot,
	ClockRequestedWith,
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
	ClockHourlyKey,
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

/** den's role for the flow Clock: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains, the levels its derived roots' reads are over, whole, and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ClockDen = g.role(
	App,
	"clock_den",
	{
		...clockGraph.relations,
		...declaredFlow.kinds[1].from.over.relations,
		ClockPaused,
		ClockResumed,
		ClockServed
	},
	{
		insert: [
			"ClockScope",
			"ClockRoot",
			"ClockRequestedWith",
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
			"ClockHourlyKey",
			"ClockHourlyFinishOutput",
			"ClockSittingFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Clock: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const ClockCoordinator = g.role(
	App,
	"clock_coordinator",
	{
		ClockKind,
		ClockRootKind,
		ClockOutcome,
		ClockRetryWhy,
		ClockPausable,
		ClockPaused,
		ClockResumed,
		ClockServed
	},
	{ insert: ["ClockPaused", "ClockResumed", "ClockServed"] }
)

const clockPendingRead = g.query(ClockDen).rule((r) => {
	const { root, step, kind, scope, due } = g.v(ClockStep, "step")
	return r
		.match(ClockStep, { root, step, kind, scope, due })
		.where(r.not(ClockResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const clockRequestedRead = g.query(ClockDen).rule((r) => {
	const { scope } = g.v(ClockScope, "scope")
	return r
		.match(ClockRoot, { root: scope })
		.match(ClockScope, { root: scope, scope })
		.where(
			r.not(ClockAdmitted, { root: scope, scope }),
			r.not(ClockSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const clockRunningRead = g.query(ClockDen).rule((r) => {
	const { root, scope, step } = g.v(ClockFinish, "finish")
	return r
		.match(ClockFinish, { root, scope, step })
		.where(r.not(ClockResult, { root, step }))
		.find({ scope })
})

const clockLatestServed = g.query(ClockDen).rule((r) => {
	const { environment, at } = g.v(ClockServed, "served")
	return r
		.match(ClockServed, { environment, at })
		.where(r.eq(environment, r.param("environment", ClockServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const clockDenPrograms = Object.freeze({
	clockNow: g.clocked(
		g.query(clockGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockReading: g.clocked(
		g.query(ClockDen).reads({
			now: g.query(clockGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: g.query(ClockDen).rule((r) => {
				const { environment, at, deployment } = g.v(ClockServed, "served")
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
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	clockClaim: g.clocked(
		g.ChangeSet.empty(clockGraph)
			.insertAllComputed(
				{ ClockClaim: [] },
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
			.insert(ClockEnded, [])
			.read("held", (delta) =>
				g.query(clockGraph).rule((r) => {
					const { step, root, attempt } = g.v(delta.added(ClockClaim), "added")
					return r
						.match(delta.added(ClockClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockRetry: g.clocked(
		g.ChangeSet.empty(clockGraph)
			.insert(ClockEnded, [])
			.insert(
				ClockRetry,
				g.query(clockGraph).rule((r) =>
					r.find({
						step: r.param("step", ClockRetry.fields.step),
						attempt: r.param("attempt", ClockRetry.fields.attempt),
						at: g.Type.cast(
							g.Num.add(
								g.Type.base(r.param("denNow", DenInstant)),
								g.Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", ClockRetry.fields.why),
						root: r.param("root", ClockRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockFence: g.ChangeSet.empty(clockGraph).insert(ClockEnded, []).insert(ClockFenced, []),
	clockRefuse: g.ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockFailed, [])
		.insert(ClockHeld, [])
		.insert(ClockRefusal, []),
	clockExhaust: g.ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockFailed, [])
		.insert(ClockHeld, [])
		.insert(ClockExhausted, []),
	clockAdmit: g.clocked(
		g.ChangeSet.empty(clockGraph)
			.insert(ClockAdmitted, [])
			.insert(ClockFinish, [])
			.insert(ClockStartStep, [])
			.insert(ClockScope, [])
			.insert(ClockChimeInput, [])
			.insert(ClockCloseInput, [])
			.insert(
				ClockStep,
				g
					.query(clockGraph)
					.rule((r) => {
						const steps = r.relation("steps", {
							step: ClockStep.fields.step,
							kind: ClockStep.fields.kind,
							scope: ClockStep.fields.scope,
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
						const { step, kind, scope, due } = g.v(timed, "timed")
						return r
							.match(timed, { step, kind, scope, due })
							.find({ step, kind, scope, due, root: r.param("root", ClockStep.fields.root) })
					})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockSkip: g.ChangeSet.empty(clockGraph).insert(ClockSkipped, []),
	clockSkippedOf: g.query(clockGraph).rule((r) => {
		const { root, scope, by } = g.v(ClockSkipped, "clockSkipped")
		return r
			.match(ClockSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", ClockSkipped.fields.root)),
				r.eq(scope, r.param("scope", ClockSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	clockStepOf: g.query(clockGraph).rule((r) => {
		const { root, step, kind, scope, due } = g.v(ClockStep, "clockStep")
		return r
			.match(ClockStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", ClockStep.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	clockResultOf: g.query(clockGraph).rule((r) => {
		const { root, step, outcome } = g.v(ClockResult, "clockResult")
		return r
			.match(ClockResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", ClockResult.fields.root)),
				r.eq(step, r.param("step", ClockResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	clockHeldOf: g.query(clockGraph).rule((r) => {
		const { root, step, attempt } = g.v(ClockHeld, "clockHeld")
		return r
			.match(ClockHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ClockHeld.fields.root)),
				r.eq(step, r.param("step", ClockHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	clockAdmittedOf: g.query(clockGraph).rule((r) => {
		const { root, scope } = g.v(ClockAdmitted, "clockAdmitted")
		return r
			.match(ClockAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", ClockAdmitted.fields.root)),
				r.eq(scope, r.param("scope", ClockAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	clockRootOf: g.query(clockGraph).rule((r) => {
		const { kind, key, at } = g.v(ClockRoot, "root")
		const { scope } = g.v(ClockScope, "scope")
		return r
			.match(ClockRoot, { root: scope, kind, key, at })
			.match(ClockScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", ClockRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	clockFinishedRoots: g
		.query(clockGraph)
		.rule((r) => {
			const { scope, step } = g.v(ClockFinish, "finish")
			return r
				.match(ClockFinish, { root: scope, scope, step })
				.match(ClockResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = g.v(ClockSkipped, "skipped")
			return r.match(ClockSkipped, { root: scope, scope }).find({ scope })
		}),
	clockClaimsOf: g.query(clockGraph).rule((r) => {
		const { root, step, attempt, until } = g.v(ClockClaim, "claim")
		return r
			.match(ClockClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	clockRetriesOf: g.query(clockGraph).rule((r) => {
		const { root, step, attempt, at, why } = g.v(ClockRetry, "retry")
		return r
			.match(ClockRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	clockFencedOf: g.query(clockGraph).rule((r) => {
		const { root, step, attempt } = g.v(ClockFenced, "fenced")
		return r
			.match(ClockFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ step, attempt })
	}),
	clockUnendedSteps: g.query(clockGraph).rule((r) => {
		const { root, step, scope } = g.v(ClockStep, "step")
		return r
			.match(ClockStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(scope, r.param("scope", ClockScope.fields.scope)),
				r.not(ClockResult, { root, step }),
				r.not(ClockFinish, { root, scope, step })
			)
			.find({ step })
	}),
	clockFinished: g.query(clockGraph).rule((r) => {
		const { root, scope, step } = g.v(ClockFinish, "finish")
		return r
			.match(ClockFinish, { root, scope, step })
			.match(ClockResult, { root, step })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(scope, r.param("scope", ClockScope.fields.scope))
			)
			.find({ step })
	}),
	clockPending: clockPendingRead,
	clockRequested: clockRequestedRead,
	clockRunning: clockRunningRead,
	clockSnapshot: g.query(ClockDen).reads({
		steps: clockPendingRead,
		claims: g.query(ClockDen).rule((r) => {
			const { root, step, attempt, until } = g.v(ClockClaim, "claim")
			return r
				.match(ClockClaim, { root, step, attempt, until })
				.where(r.not(ClockResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: g.query(ClockDen).rule((r) => {
			const { root, step, attempt, at, why } = g.v(ClockRetry, "retry")
			return r
				.match(ClockRetry, { root, step, attempt, at, why })
				.where(r.not(ClockResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: g.query(ClockDen).rule((r) => {
			const { root, step, attempt } = g.v(ClockFenced, "fenced")
			return r
				.match(ClockFenced, { root, step, attempt })
				.where(r.not(ClockResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: clockRequestedRead,
		running: clockRunningRead,
		roots: g.query(ClockDen).rule((r) => {
			const { kind, key, at } = g.v(ClockRoot, "root")
			const { scope } = g.v(ClockScope, "scope")
			return r
				.match(ClockRoot, { root: scope, kind, key, at })
				.match(ClockScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: g.query(ClockDen).rule((r) => {
			const { target, turn } = g.v(ClockPaused, "clockPaused")
			return r
				.match(ClockPaused, { target, turn })
				.where(r.not(ClockResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	clockReadClockChimeInput: g.query(clockGraph).rule((r) => {
		const { root, step, hour, bell } = g.v(ClockChimeInput, "clockChimeInput")
		return r
			.match(ClockChimeInput, { root, step, hour, bell })
			.where(
				r.eq(root, r.param("root", ClockChimeInput.fields.root)),
				r.eq(step, r.param("step", ClockChimeInput.fields.step))
			)
			.find({ root, step, hour, bell })
	}),
	clockReadClockCloseInput: g.query(clockGraph).rule((r) => {
		const { root, step, sitting, deadline } = g.v(ClockCloseInput, "clockCloseInput")
		return r
			.match(ClockCloseInput, { root, step, sitting, deadline })
			.where(
				r.eq(root, r.param("root", ClockCloseInput.fields.root)),
				r.eq(step, r.param("step", ClockCloseInput.fields.step))
			)
			.find({ root, step, sitting, deadline })
	}),
	clockReadClockHourlyInput: g.query(clockGraph).rule((r) => {
		const { root, scope, hour, bell } = g.v(ClockHourlyInput, "clockHourlyInput")
		return r
			.match(ClockHourlyInput, { root, scope, hour, bell })
			.where(
				r.eq(root, r.param("root", ClockHourlyInput.fields.root)),
				r.eq(scope, r.param("scope", ClockHourlyInput.fields.scope))
			)
			.find({ root, scope, hour, bell })
	}),
	clockRequestHourly: g.clocked(
		g.ChangeSet.empty(ClockDen)
			.insert(
				ClockScope,
				g.query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", ClockHourlyKey.fields.at),
						member: r.param("clockHourlyKeyMember", ClockHourlyKey.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = g.v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(r.not(ClockRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				ClockHourlyKey,
				g.query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", ClockHourlyKey.fields.at),
						member: r.param("clockHourlyKeyMember", ClockHourlyKey.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = g.v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(r.eq(scope, root), r.not(ClockRoot, { root }))
						.find({
							root,
							at: r.param("clockHourlyKeyAt", ClockHourlyKey.fields.at),
							member: r.param("clockHourlyKeyMember", ClockHourlyKey.fields.member)
						})
				})
			)
			.insert(
				ClockHourlyInput,
				g.query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", ClockHourlyKey.fields.at),
						member: r.param("clockHourlyKeyMember", ClockHourlyKey.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = g.v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(r.eq(scope, root), r.not(ClockRoot, { root }))
						.find({ scope, root, hour: derivedHour, bell: derivedBell })
				})
			)
			.insert(
				ClockRoot,
				g.query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", ClockHourlyKey.fields.at),
						member: r.param("clockHourlyKeyMember", ClockHourlyKey.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = g.v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("clockHourlyScope", ClockRoot.fields.root)),
							r.not(ClockRoot, { root })
						)
						.find({
							root,
							kind: ClockRootKind.handle("Hourly"),
							key: r.param("clockHourlyKey", ClockRoot.fields.key),
							at: r.param("denNow", ClockRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockReadClockSittingInput: g.query(clockGraph).rule((r) => {
		const { root, scope, sitting, deadline } = g.v(ClockSittingInput, "clockSittingInput")
		return r
			.match(ClockSittingInput, { root, scope, sitting, deadline })
			.where(
				r.eq(root, r.param("root", ClockSittingInput.fields.root)),
				r.eq(scope, r.param("scope", ClockSittingInput.fields.scope))
			)
			.find({ root, scope, sitting, deadline })
	}),
	clockRequestSitting: g.clocked(
		g.ChangeSet.empty(clockGraph)
			.insert(
				ClockScope,
				g.query(clockGraph).rule((r) => {
					const requested = r.relation("clockSittingClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(ClockRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				ClockSittingInput,
				g.query(clockGraph).rule((r) => {
					const requested = r.relation("clockSittingClockSittingInput", {
						root: ClockSittingInput.fields.root,
						scope: ClockSittingInput.fields.scope,
						sitting: ClockSittingInput.fields.sitting,
						deadline: ClockSittingInput.fields.deadline
					})
					const { root, scope, sitting, deadline } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, sitting, deadline })
						.where(r.not(ClockRoot, { root }))
						.find({ root, scope, sitting, deadline })
				})
			)
			.insert(
				ClockRequestedWith,
				g
					.query(clockGraph)
					.rule((r) => {
						const requested = r.relation("clockSittingClockRequestedWith", {
							root: ClockRequestedWith.fields.root,
							fingerprint: ClockRequestedWith.fields.fingerprint,
							input: ClockRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(ClockRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("clockSittingClockRequestedWith", {
							root: ClockRequestedWith.fields.root,
							fingerprint: ClockRequestedWith.fields.fingerprint,
							input: ClockRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(ClockRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(ClockRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				ClockRoot,
				g.query(clockGraph).rule((r) => {
					const requested = r.relation("clockSittingClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("clockSittingScope", ClockRoot.fields.root)),
							r.not(ClockRoot, { root })
						)
						.find({
							root,
							kind: ClockRootKind.handle("Sitting"),
							key: r.param("clockSittingKey", ClockRoot.fields.key),
							at: r.param("denNow", ClockRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	)
})

export const clockDenWorkload = g.workload(ClockDen, clockDenPrograms)

export const clockCoordinatorPrograms = Object.freeze({
	clockPromote: g.clocked(
		g.ChangeSet.empty(clockCoordination).insert(
			ClockServed,
			g.query(clockCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", ClockServed.fields.environment),
					at: r.param("denNow", ClockServed.fields.at),
					deployment: r.param("deployment", ClockServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockPause: g.ChangeSet.empty(clockCoordination).insert(ClockPaused, []),
	clockResume: g.ChangeSet.empty(clockCoordination).insert(ClockResumed, []),
	clockPauseTurns: g.query(clockCoordination).rule((r) => {
		const { target, turn } = g.v(ClockPaused, "clockPaused")
		return r.match(ClockPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	clockPausedAll: g.query(clockCoordination).rule((r) => {
		const { target, turn } = g.v(ClockPaused, "clockPaused")
		return r
			.match(ClockPaused, { target, turn })
			.where(r.not(ClockResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const clockCoordinatorWorkload = g.workload(ClockCoordinator, clockCoordinatorPrograms)

/** den's retiring role for the flow Clock: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const ClockRetirer = g.role(
	App,
	"clock_retirer",
	{ ...clockGraph.relations },
	{
		write: [
			"ClockScope",
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
			"ClockChimeOutput",
			"ClockCloseOutput",
			"ClockHourlyFinishOutput",
			"ClockSittingFinishOutput"
		]
	}
)

export const clockRetirerPrograms = Object.freeze({
	clockRetire: g.ChangeSet.empty(clockGraph).deleteWhere({
		ClockScope: { root: g.param("root", ClockRoot.fields.root) },
		ClockAdmitted: { root: g.param("root", ClockRoot.fields.root) },
		ClockSkipped: { root: g.param("root", ClockRoot.fields.root) },
		ClockStep: { root: g.param("root", ClockRoot.fields.root) },
		ClockStartStep: { root: g.param("root", ClockRoot.fields.root) },
		ClockFinish: { root: g.param("root", ClockRoot.fields.root) },
		ClockClaim: { root: g.param("root", ClockRoot.fields.root) },
		ClockEnded: { root: g.param("root", ClockRoot.fields.root) },
		ClockRetry: { root: g.param("root", ClockRoot.fields.root) },
		ClockFenced: { root: g.param("root", ClockRoot.fields.root) },
		ClockResult: { root: g.param("root", ClockRoot.fields.root) },
		ClockDone: { root: g.param("root", ClockRoot.fields.root) },
		ClockFailed: { root: g.param("root", ClockRoot.fields.root) },
		ClockHeld: { root: g.param("root", ClockRoot.fields.root) },
		ClockRefusal: { root: g.param("root", ClockRoot.fields.root) },
		ClockExhausted: { root: g.param("root", ClockRoot.fields.root) },
		ClockChimeInput: { root: g.param("root", ClockRoot.fields.root) },
		ClockCloseInput: { root: g.param("root", ClockRoot.fields.root) },
		ClockHourlyInput: { root: g.param("root", ClockRoot.fields.root) },
		ClockSittingInput: { root: g.param("root", ClockRoot.fields.root) },
		ClockChimeOutput: { root: g.param("root", ClockRoot.fields.root) },
		ClockCloseOutput: { root: g.param("root", ClockRoot.fields.root) },
		ClockHourlyFinishOutput: { root: g.param("root", ClockRoot.fields.root) },
		ClockSittingFinishOutput: { root: g.param("root", ClockRoot.fields.root) }
	})
})

export const clockRetirerWorkload = g.workload(ClockRetirer, clockRetirerPrograms)

/** The commits and declared reads of the flow Clock, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const clockCommitPrograms = Object.freeze({
	clockAuthenticated: g.clocked(
		g.query(clockGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockCommitChime: g.ChangeSet.union(
		g.ChangeSet.empty(clockGraph)
			.insert(ClockResult, [])
			.insert(ClockDone, [])
			.insert(ClockHeld, [])
			.insert(ClockChimeOutput, []),
		declaredFlow.kinds[0].writes.changes(Loader)
	),
	clockCommitClose: g.ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockCloseOutput, []),
	clockCommitHourlyFinish: g.ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockHourlyFinishOutput, []),
	clockCommitSittingFinish: g.ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(ClockSittingFinishOutput, [])
})

export const clockCommits = g.workload(Loader, clockCommitPrograms)
