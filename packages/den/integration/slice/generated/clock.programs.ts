import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Clock to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, Num, Type, clocked, param, query, role, v, workload } from "@bjornpagen/grizzle"
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
	clock_chime_input_bfjhiocgaifco,
	clock_close_input_bajjphdpmhlbc,
	clock_hourly_input_nknibbhbedpnl,
	clock_sitting_input_bckcjcndffgmo,
	clock_hourly_key_cnlgnmcbbcgma,
	clock_chime_output_bddonoddgecmi,
	clock_close_output_aoheikcdnbjpp,
	clock_hourly_finish_output_mgokiakijlfbi,
	clock_sitting_finish_output_aahppmdaoafco,
	ClockPaused,
	ClockResumed,
	ClockServed,
	clockGraph,
	clockCoordination
} from "#integration/slice/generated/clock.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Clock: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains, the levels its derived roots' reads are over, whole, and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const ClockDen = role(
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
			"clock_chime_input_bfjhiocgaifco",
			"clock_close_input_bajjphdpmhlbc",
			"clock_hourly_input_nknibbhbedpnl",
			"clock_sitting_input_bckcjcndffgmo",
			"clock_hourly_key_cnlgnmcbbcgma",
			"clock_hourly_finish_output_mgokiakijlfbi",
			"clock_sitting_finish_output_aahppmdaoafco"
		]
	}
)

/** den's coordinator role for the flow Clock: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const ClockCoordinator = role(
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

const clockPendingRead = query(ClockDen).rule((r) => {
	const { root, step, kind, scope, due } = v(ClockStep, "step")
	return r
		.match(ClockStep, { root, step, kind, scope, due })
		.where(r.not(ClockResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const clockRequestedRead = query(ClockDen).rule((r) => {
	const { scope } = v(ClockScope, "scope")
	return r
		.match(ClockRoot, { root: scope })
		.match(ClockScope, { root: scope, scope })
		.where(
			r.not(ClockAdmitted, { root: scope, scope }),
			r.not(ClockSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const clockRunningRead = query(ClockDen).rule((r) => {
	const { root, scope, step } = v(ClockFinish, "finish")
	return r
		.match(ClockFinish, { root, scope, step })
		.where(r.not(ClockResult, { root, step }))
		.find({ scope })
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
		query(clockGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockReading: clocked(
		query(ClockDen).reads({
			now: query(clockGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
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
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	clockClaim: clocked(
		ChangeSet.empty(clockGraph)
			.insertAllComputed(
				{ ClockClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("denNow", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(ClockEnded, [])
			.read("held", (delta) =>
				query(clockGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(ClockClaim), "added")
					return r
						.match(delta.added(ClockClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
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
							Num.add(
								Type.base(r.param("denNow", DenInstant)),
								Type.base(r.param("delay", DenDelay))
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
			.insert(clock_chime_input_bfjhiocgaifco, [])
			.insert(clock_close_input_bajjphdpmhlbc, [])
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
								Num.add(Type.base(r.param("denNow", DenInstant)), Type.base(delay)),
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
						const { step, kind, scope, due } = v(timed, "timed")
						return r
							.match(timed, { step, kind, scope, due })
							.find({ step, kind, scope, due, root: r.param("root", ClockStep.fields.root) })
					})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockSkip: ChangeSet.empty(clockGraph).insert(ClockSkipped, []),
	clockSkippedOf: query(clockGraph).rule((r) => {
		const { root, scope, by } = v(ClockSkipped, "clockSkipped")
		return r
			.match(ClockSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", ClockSkipped.fields.root)),
				r.eq(scope, r.param("scope", ClockSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	clockStepOf: query(clockGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(ClockStep, "clockStep")
		return r
			.match(ClockStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", ClockStep.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	clockResultOf: query(clockGraph).rule((r) => {
		const { root, step, outcome } = v(ClockResult, "clockResult")
		return r
			.match(ClockResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", ClockResult.fields.root)),
				r.eq(step, r.param("step", ClockResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	clockHeldOf: query(clockGraph).rule((r) => {
		const { root, step, attempt } = v(ClockHeld, "clockHeld")
		return r
			.match(ClockHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ClockHeld.fields.root)),
				r.eq(step, r.param("step", ClockHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	clockAdmittedOf: query(clockGraph).rule((r) => {
		const { root, scope } = v(ClockAdmitted, "clockAdmitted")
		return r
			.match(ClockAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", ClockAdmitted.fields.root)),
				r.eq(scope, r.param("scope", ClockAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	clockRootOf: query(clockGraph).rule((r) => {
		const { kind, key, at } = v(ClockRoot, "root")
		const { scope } = v(ClockScope, "scope")
		return r
			.match(ClockRoot, { root: scope, kind, key, at })
			.match(ClockScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", ClockRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	clockFinishedRoots: query(clockGraph)
		.rule((r) => {
			const { scope, step } = v(ClockFinish, "finish")
			return r
				.match(ClockFinish, { root: scope, scope, step })
				.match(ClockResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(ClockSkipped, "skipped")
			return r.match(ClockSkipped, { root: scope, scope }).find({ scope })
		}),
	clockClaimsOf: query(clockGraph).rule((r) => {
		const { root, step, attempt, until } = v(ClockClaim, "claim")
		return r
			.match(ClockClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	clockRetriesOf: query(clockGraph).rule((r) => {
		const { root, step, attempt, at, why } = v(ClockRetry, "retry")
		return r
			.match(ClockRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	clockFencedOf: query(clockGraph).rule((r) => {
		const { root, step, attempt } = v(ClockFenced, "fenced")
		return r
			.match(ClockFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", ClockScope.fields.root)),
				r.eq(step, r.param("step", ClockStep.fields.step))
			)
			.find({ step, attempt })
	}),
	clockUnendedSteps: query(clockGraph).rule((r) => {
		const { root, step, scope } = v(ClockStep, "step")
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
	clockFinished: query(clockGraph).rule((r) => {
		const { root, scope, step } = v(ClockFinish, "finish")
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
	clockSnapshot: query(ClockDen).reads({
		steps: clockPendingRead,
		claims: query(ClockDen).rule((r) => {
			const { root, step, attempt, until } = v(ClockClaim, "claim")
			return r
				.match(ClockClaim, { root, step, attempt, until })
				.where(r.not(ClockResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: query(ClockDen).rule((r) => {
			const { root, step, attempt, at, why } = v(ClockRetry, "retry")
			return r
				.match(ClockRetry, { root, step, attempt, at, why })
				.where(r.not(ClockResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: query(ClockDen).rule((r) => {
			const { root, step, attempt } = v(ClockFenced, "fenced")
			return r
				.match(ClockFenced, { root, step, attempt })
				.where(r.not(ClockResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: clockRequestedRead,
		running: clockRunningRead,
		roots: query(ClockDen).rule((r) => {
			const { kind, key, at } = v(ClockRoot, "root")
			const { scope } = v(ClockScope, "scope")
			return r
				.match(ClockRoot, { root: scope, kind, key, at })
				.match(ClockScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: query(ClockDen).rule((r) => {
			const { target, turn } = v(ClockPaused, "clockPaused")
			return r
				.match(ClockPaused, { target, turn })
				.where(r.not(ClockResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	clockReadclock_chime_input_bfjhiocgaifco: query(clockGraph).rule((r) => {
		const { root, step, hour, bell } = v(
			clock_chime_input_bfjhiocgaifco,
			"clock_chime_input_bfjhiocgaifco"
		)
		return r
			.match(clock_chime_input_bfjhiocgaifco, { root, step, hour, bell })
			.where(
				r.eq(root, r.param("root", clock_chime_input_bfjhiocgaifco.fields.root)),
				r.eq(step, r.param("step", clock_chime_input_bfjhiocgaifco.fields.step))
			)
			.find({ root, step, hour, bell })
	}),
	clockReadclock_close_input_bajjphdpmhlbc: query(clockGraph).rule((r) => {
		const { root, step, sitting, deadline } = v(
			clock_close_input_bajjphdpmhlbc,
			"clock_close_input_bajjphdpmhlbc"
		)
		return r
			.match(clock_close_input_bajjphdpmhlbc, { root, step, sitting, deadline })
			.where(
				r.eq(root, r.param("root", clock_close_input_bajjphdpmhlbc.fields.root)),
				r.eq(step, r.param("step", clock_close_input_bajjphdpmhlbc.fields.step))
			)
			.find({ root, step, sitting, deadline })
	}),
	clockReadclock_hourly_input_nknibbhbedpnl: query(clockGraph).rule((r) => {
		const { root, scope, hour, bell } = v(
			clock_hourly_input_nknibbhbedpnl,
			"clock_hourly_input_nknibbhbedpnl"
		)
		return r
			.match(clock_hourly_input_nknibbhbedpnl, { root, scope, hour, bell })
			.where(
				r.eq(root, r.param("root", clock_hourly_input_nknibbhbedpnl.fields.root)),
				r.eq(scope, r.param("scope", clock_hourly_input_nknibbhbedpnl.fields.scope))
			)
			.find({ root, scope, hour, bell })
	}),
	clockRequestHourly: clocked(
		ChangeSet.empty(ClockDen)
			.insert(
				ClockScope,
				query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", clock_hourly_key_cnlgnmcbbcgma.fields.at),
						member: r.param("clockHourlyKeyMember", clock_hourly_key_cnlgnmcbbcgma.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(r.not(ClockRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				clock_hourly_key_cnlgnmcbbcgma,
				query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", clock_hourly_key_cnlgnmcbbcgma.fields.at),
						member: r.param("clockHourlyKeyMember", clock_hourly_key_cnlgnmcbbcgma.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(r.eq(scope, root), r.not(ClockRoot, { root }))
						.find({
							root,
							at: r.param("clockHourlyKeyAt", clock_hourly_key_cnlgnmcbbcgma.fields.at),
							member: r.param("clockHourlyKeyMember", clock_hourly_key_cnlgnmcbbcgma.fields.member)
						})
				})
			)
			.insert(
				clock_hourly_input_nknibbhbedpnl,
				query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", clock_hourly_key_cnlgnmcbbcgma.fields.at),
						member: r.param("clockHourlyKeyMember", clock_hourly_key_cnlgnmcbbcgma.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = v(derived, "derived")
					return r
						.match(requested, { root, scope })
						.match(derived, { hour: derivedHour, bell: derivedBell })
						.where(r.eq(scope, root), r.not(ClockRoot, { root }))
						.find({ scope, root, hour: derivedHour, bell: derivedBell })
				})
			)
			.insert(
				ClockRoot,
				query(ClockDen).rule((r) => {
					const requested = r.relation("clockHourlyClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					const derived = declaredFlow.kinds[1].from.read.bind({
						at: r.param("clockHourlyKeyAt", clock_hourly_key_cnlgnmcbbcgma.fields.at),
						member: r.param("clockHourlyKeyMember", clock_hourly_key_cnlgnmcbbcgma.fields.member)
					})
					const { hour: derivedHour, bell: derivedBell } = v(derived, "derived")
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
	clockReadclock_sitting_input_bckcjcndffgmo: query(clockGraph).rule((r) => {
		const { root, scope, sitting, deadline } = v(
			clock_sitting_input_bckcjcndffgmo,
			"clock_sitting_input_bckcjcndffgmo"
		)
		return r
			.match(clock_sitting_input_bckcjcndffgmo, { root, scope, sitting, deadline })
			.where(
				r.eq(root, r.param("root", clock_sitting_input_bckcjcndffgmo.fields.root)),
				r.eq(scope, r.param("scope", clock_sitting_input_bckcjcndffgmo.fields.scope))
			)
			.find({ root, scope, sitting, deadline })
	}),
	clockRequestSitting: clocked(
		ChangeSet.empty(clockGraph)
			.insert(
				ClockScope,
				query(clockGraph).rule((r) => {
					const requested = r.relation("clockSittingClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(ClockRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				clock_sitting_input_bckcjcndffgmo,
				query(clockGraph).rule((r) => {
					const requested = r.relation("clockSittingclock_sitting_input_bckcjcndffgmo", {
						root: clock_sitting_input_bckcjcndffgmo.fields.root,
						scope: clock_sitting_input_bckcjcndffgmo.fields.scope,
						sitting: clock_sitting_input_bckcjcndffgmo.fields.sitting,
						deadline: clock_sitting_input_bckcjcndffgmo.fields.deadline
					})
					const { root, scope, sitting, deadline } = v(requested, "requested")
					return r
						.match(requested, { root, scope, sitting, deadline })
						.where(r.not(ClockRoot, { root }))
						.find({ root, scope, sitting, deadline })
				})
			)
			.insert(
				ClockRequestedWith,
				query(clockGraph)
					.rule((r) => {
						const requested = r.relation("clockSittingClockRequestedWith", {
							root: ClockRequestedWith.fields.root,
							fingerprint: ClockRequestedWith.fields.fingerprint,
							input: ClockRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
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
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(ClockRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(ClockRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				ClockRoot,
				query(clockGraph).rule((r) => {
					const requested = r.relation("clockSittingClockScope", {
						root: ClockScope.fields.root,
						scope: ClockScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
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

export const clockDenWorkload = workload(ClockDen, clockDenPrograms)

export const clockCoordinatorPrograms = Object.freeze({
	clockPromote: clocked(
		ChangeSet.empty(clockCoordination).insert(
			ClockServed,
			query(clockCoordination).rule((r) =>
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
	clockPause: ChangeSet.empty(clockCoordination).insert(ClockPaused, []),
	clockResume: ChangeSet.empty(clockCoordination).insert(ClockResumed, []),
	clockPauseTurns: query(clockCoordination).rule((r) => {
		const { target, turn } = v(ClockPaused, "clockPaused")
		return r.match(ClockPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	clockPausedAll: query(clockCoordination).rule((r) => {
		const { target, turn } = v(ClockPaused, "clockPaused")
		return r
			.match(ClockPaused, { target, turn })
			.where(r.not(ClockResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const clockCoordinatorWorkload = workload(ClockCoordinator, clockCoordinatorPrograms)

/** den's retiring role for the flow Clock: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const ClockRetirer = role(
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
			"clock_chime_input_bfjhiocgaifco",
			"clock_close_input_bajjphdpmhlbc",
			"clock_hourly_input_nknibbhbedpnl",
			"clock_sitting_input_bckcjcndffgmo",
			"clock_chime_output_bddonoddgecmi",
			"clock_close_output_aoheikcdnbjpp",
			"clock_hourly_finish_output_mgokiakijlfbi",
			"clock_sitting_finish_output_aahppmdaoafco"
		]
	}
)

export const clockRetirerPrograms = Object.freeze({
	clockRetire: ChangeSet.empty(clockGraph).deleteWhere({
		ClockScope: { root: param("root", ClockRoot.fields.root) },
		ClockAdmitted: { root: param("root", ClockRoot.fields.root) },
		ClockSkipped: { root: param("root", ClockRoot.fields.root) },
		ClockStep: { root: param("root", ClockRoot.fields.root) },
		ClockStartStep: { root: param("root", ClockRoot.fields.root) },
		ClockFinish: { root: param("root", ClockRoot.fields.root) },
		ClockClaim: { root: param("root", ClockRoot.fields.root) },
		ClockEnded: { root: param("root", ClockRoot.fields.root) },
		ClockRetry: { root: param("root", ClockRoot.fields.root) },
		ClockFenced: { root: param("root", ClockRoot.fields.root) },
		ClockResult: { root: param("root", ClockRoot.fields.root) },
		ClockDone: { root: param("root", ClockRoot.fields.root) },
		ClockFailed: { root: param("root", ClockRoot.fields.root) },
		ClockHeld: { root: param("root", ClockRoot.fields.root) },
		ClockRefusal: { root: param("root", ClockRoot.fields.root) },
		ClockExhausted: { root: param("root", ClockRoot.fields.root) },
		clock_chime_input_bfjhiocgaifco: { root: param("root", ClockRoot.fields.root) },
		clock_close_input_bajjphdpmhlbc: { root: param("root", ClockRoot.fields.root) },
		clock_hourly_input_nknibbhbedpnl: { root: param("root", ClockRoot.fields.root) },
		clock_sitting_input_bckcjcndffgmo: { root: param("root", ClockRoot.fields.root) },
		clock_chime_output_bddonoddgecmi: { root: param("root", ClockRoot.fields.root) },
		clock_close_output_aoheikcdnbjpp: { root: param("root", ClockRoot.fields.root) },
		clock_hourly_finish_output_mgokiakijlfbi: { root: param("root", ClockRoot.fields.root) },
		clock_sitting_finish_output_aahppmdaoafco: { root: param("root", ClockRoot.fields.root) }
	})
})

export const clockRetirerWorkload = workload(ClockRetirer, clockRetirerPrograms)

/** The commits and declared reads of the flow Clock, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const clockCommitPrograms = Object.freeze({
	clockAuthenticated: clocked(
		query(clockGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	clockCommitChime: ChangeSet.union(
		ChangeSet.empty(clockGraph)
			.insert(ClockResult, [])
			.insert(ClockDone, [])
			.insert(ClockHeld, [])
			.insert(clock_chime_output_bddonoddgecmi, []),
		declaredFlow.kinds[0].writes.changes(Loader)
	),
	clockCommitClose: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(clock_close_output_aoheikcdnbjpp, []),
	clockCommitHourlyFinish: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(clock_hourly_finish_output_mgokiakijlfbi, []),
	clockCommitSittingFinish: ChangeSet.empty(clockGraph)
		.insert(ClockResult, [])
		.insert(ClockDone, [])
		.insert(ClockHeld, [])
		.insert(clock_sitting_finish_output_aahppmdaoafco, [])
})

export const clockCommits = workload(Loader, clockCommitPrograms)
