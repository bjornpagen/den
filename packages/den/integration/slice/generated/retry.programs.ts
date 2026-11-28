import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Retry to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import * as g from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { retry as declaredFlow } from "#integration/slice/flows.ts"
import {
	RetryKind,
	RetryRootKind,
	RetryOutcome,
	RetryRetryWhy,
	RetryPausable,
	RetryScope,
	RetryRoot,
	RetryRequestedWith,
	RetryAdmitted,
	RetrySkipped,
	RetryStep,
	RetryStartStep,
	RetryFinish,
	RetryClaim,
	RetryEnded,
	RetryRetry,
	RetryFenced,
	RetryResult,
	RetryDone,
	RetryFailed,
	RetryHeld,
	RetryRefusal,
	RetryExhausted,
	RetrySteadfastInput,
	RetryBrittleInput,
	RetryPoliteInput,
	RetryPatientInput,
	RetryLaddersInput,
	RetryThrottledInput,
	RetryUnhurriedInput,
	RetrySteadfastOutput,
	RetryBrittleOutput,
	RetryPoliteOutput,
	RetryPatientOutput,
	RetryLaddersFinishOutput,
	RetryThrottledFinishOutput,
	RetryUnhurriedFinishOutput,
	RetryPaused,
	RetryResumed,
	RetryServed,
	retryGraph,
	retryCoordination
} from "#integration/slice/generated/retry.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Retry: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const RetryDen = g.role(
	App,
	"retry_den",
	{ ...retryGraph.relations, RetryPaused, RetryResumed, RetryServed },
	{
		insert: [
			"RetryScope",
			"RetryRoot",
			"RetryRequestedWith",
			"RetryAdmitted",
			"RetrySkipped",
			"RetryStep",
			"RetryStartStep",
			"RetryFinish",
			"RetryClaim",
			"RetryEnded",
			"RetryRetry",
			"RetryFenced",
			"RetryResult",
			"RetryDone",
			"RetryFailed",
			"RetryHeld",
			"RetryRefusal",
			"RetryExhausted",
			"RetrySteadfastInput",
			"RetryBrittleInput",
			"RetryPoliteInput",
			"RetryPatientInput",
			"RetryLaddersInput",
			"RetryThrottledInput",
			"RetryUnhurriedInput",
			"RetryLaddersFinishOutput",
			"RetryThrottledFinishOutput",
			"RetryUnhurriedFinishOutput"
		]
	}
)

/** den's coordinator role for the flow Retry: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const RetryCoordinator = g.role(
	App,
	"retry_coordinator",
	{
		RetryKind,
		RetryRootKind,
		RetryOutcome,
		RetryRetryWhy,
		RetryPausable,
		RetryPaused,
		RetryResumed,
		RetryServed
	},
	{ insert: ["RetryPaused", "RetryResumed", "RetryServed"] }
)

const retryPendingRead = g.query(RetryDen).rule((r) => {
	const { root, step, kind, scope, due } = g.v(RetryStep, "step")
	return r
		.match(RetryStep, { root, step, kind, scope, due })
		.where(r.not(RetryResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const retryRequestedRead = g.query(RetryDen).rule((r) => {
	const { scope } = g.v(RetryScope, "scope")
	return r
		.match(RetryRoot, { root: scope })
		.match(RetryScope, { root: scope, scope })
		.where(
			r.not(RetryAdmitted, { root: scope, scope }),
			r.not(RetrySkipped, { root: scope, scope })
		)
		.find({ scope })
})

const retryRunningRead = g.query(RetryDen).rule((r) => {
	const { root, scope, step } = g.v(RetryFinish, "finish")
	return r
		.match(RetryFinish, { root, scope, step })
		.where(r.not(RetryResult, { root, step }))
		.find({ scope })
})

const retryLatestServed = g.query(RetryDen).rule((r) => {
	const { environment, at } = g.v(RetryServed, "served")
	return r
		.match(RetryServed, { environment, at })
		.where(r.eq(environment, r.param("environment", RetryServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const retryDenPrograms = Object.freeze({
	retryNow: g.clocked(
		g.query(retryGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryReading: g.clocked(
		g.query(RetryDen).reads({
			now: g.query(retryGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: g.query(RetryDen).rule((r) => {
				const { environment, at, deployment } = g.v(RetryServed, "served")
				return r
					.match(
						retryLatestServed.bind({
							environment: r.param("environment", RetryServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(RetryServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	retryClaim: g.clocked(
		g.ChangeSet.empty(retryGraph)
			.insertAllComputed(
				{ RetryClaim: [] },
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
			.insert(RetryEnded, [])
			.read("held", (delta) =>
				g.query(retryGraph).rule((r) => {
					const { step, root, attempt } = g.v(delta.added(RetryClaim), "added")
					return r
						.match(delta.added(RetryClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryRetry: g.clocked(
		g.ChangeSet.empty(retryGraph)
			.insert(RetryEnded, [])
			.insert(
				RetryRetry,
				g.query(retryGraph).rule((r) =>
					r.find({
						step: r.param("step", RetryRetry.fields.step),
						attempt: r.param("attempt", RetryRetry.fields.attempt),
						at: g.Type.cast(
							g.Num.add(
								g.Type.base(r.param("denNow", DenInstant)),
								g.Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", RetryRetry.fields.why),
						root: r.param("root", RetryRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryFence: g.ChangeSet.empty(retryGraph).insert(RetryEnded, []).insert(RetryFenced, []),
	retryRefuse: g.ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryFailed, [])
		.insert(RetryHeld, [])
		.insert(RetryRefusal, []),
	retryExhaust: g.ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryFailed, [])
		.insert(RetryHeld, [])
		.insert(RetryExhausted, []),
	retryAdmit: g.clocked(
		g.ChangeSet.empty(retryGraph)
			.insert(RetryAdmitted, [])
			.insert(RetryFinish, [])
			.insert(RetryStartStep, [])
			.insert(RetryScope, [])
			.insert(RetrySteadfastInput, [])
			.insert(RetryBrittleInput, [])
			.insert(RetryPoliteInput, [])
			.insert(RetryPatientInput, [])
			.insert(
				RetryStep,
				g.query(retryGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: RetryStep.fields.step,
						kind: RetryStep.fields.kind,
						scope: RetryStep.fields.scope,
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
						root: r.param("root", RetryStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retrySkip: g.ChangeSet.empty(retryGraph).insert(RetrySkipped, []),
	retrySkippedOf: g.query(retryGraph).rule((r) => {
		const { root, scope, by } = g.v(RetrySkipped, "retrySkipped")
		return r
			.match(RetrySkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", RetrySkipped.fields.root)),
				r.eq(scope, r.param("scope", RetrySkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	retryStepOf: g.query(retryGraph).rule((r) => {
		const { root, step, kind, scope, due } = g.v(RetryStep, "retryStep")
		return r
			.match(RetryStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", RetryStep.fields.root)),
				r.eq(step, r.param("step", RetryStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	retryResultOf: g.query(retryGraph).rule((r) => {
		const { root, step, outcome } = g.v(RetryResult, "retryResult")
		return r
			.match(RetryResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", RetryResult.fields.root)),
				r.eq(step, r.param("step", RetryResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	retryHeldOf: g.query(retryGraph).rule((r) => {
		const { root, step, attempt } = g.v(RetryHeld, "retryHeld")
		return r
			.match(RetryHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", RetryHeld.fields.root)),
				r.eq(step, r.param("step", RetryHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	retryAdmittedOf: g.query(retryGraph).rule((r) => {
		const { root, scope } = g.v(RetryAdmitted, "retryAdmitted")
		return r
			.match(RetryAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", RetryAdmitted.fields.root)),
				r.eq(scope, r.param("scope", RetryAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	retryRootOf: g.query(retryGraph).rule((r) => {
		const { kind, key, at } = g.v(RetryRoot, "root")
		const { scope } = g.v(RetryScope, "scope")
		return r
			.match(RetryRoot, { root: scope, kind, key, at })
			.match(RetryScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", RetryRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	retryFinishedRoots: g
		.query(retryGraph)
		.rule((r) => {
			const { scope, step } = g.v(RetryFinish, "finish")
			return r
				.match(RetryFinish, { root: scope, scope, step })
				.match(RetryResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = g.v(RetrySkipped, "skipped")
			return r.match(RetrySkipped, { root: scope, scope }).find({ scope })
		}),
	retryClaimsOf: g.query(retryGraph).rule((r) => {
		const { root, step, attempt, until } = g.v(RetryClaim, "claim")
		return r
			.match(RetryClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(step, r.param("step", RetryStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	retryRetriesOf: g.query(retryGraph).rule((r) => {
		const { root, step, attempt, at, why } = g.v(RetryRetry, "retry")
		return r
			.match(RetryRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(step, r.param("step", RetryStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	retryFencedOf: g.query(retryGraph).rule((r) => {
		const { root, step, attempt } = g.v(RetryFenced, "fenced")
		return r
			.match(RetryFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(step, r.param("step", RetryStep.fields.step))
			)
			.find({ step, attempt })
	}),
	retryUnendedSteps: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		return r
			.match(RetryStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope)),
				r.not(RetryResult, { root, step }),
				r.not(RetryFinish, { root, scope, step })
			)
			.find({ step })
	}),
	retryFinished: g.query(retryGraph).rule((r) => {
		const { root, scope, step } = g.v(RetryFinish, "finish")
		return r
			.match(RetryFinish, { root, scope, step })
			.match(RetryResult, { root, step })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step })
	}),
	retryPending: retryPendingRead,
	retryRequested: retryRequestedRead,
	retryRunning: retryRunningRead,
	retrySnapshot: g.query(RetryDen).reads({
		steps: retryPendingRead,
		claims: g.query(RetryDen).rule((r) => {
			const { root, step, attempt, until } = g.v(RetryClaim, "claim")
			return r
				.match(RetryClaim, { root, step, attempt, until })
				.where(r.not(RetryResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: g.query(RetryDen).rule((r) => {
			const { root, step, attempt, at, why } = g.v(RetryRetry, "retry")
			return r
				.match(RetryRetry, { root, step, attempt, at, why })
				.where(r.not(RetryResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: g.query(RetryDen).rule((r) => {
			const { root, step, attempt } = g.v(RetryFenced, "fenced")
			return r
				.match(RetryFenced, { root, step, attempt })
				.where(r.not(RetryResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: retryRequestedRead,
		running: retryRunningRead,
		roots: g.query(RetryDen).rule((r) => {
			const { kind, key, at } = g.v(RetryRoot, "root")
			const { scope } = g.v(RetryScope, "scope")
			return r
				.match(RetryRoot, { root: scope, kind, key, at })
				.match(RetryScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: g.query(RetryDen).rule((r) => {
			const { target, turn } = g.v(RetryPaused, "retryPaused")
			return r
				.match(RetryPaused, { target, turn })
				.where(r.not(RetryResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	retryReadRetrySteadfastInput: g.query(retryGraph).rule((r) => {
		const { root, step, key } = g.v(RetrySteadfastInput, "retrySteadfastInput")
		return r
			.match(RetrySteadfastInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetrySteadfastInput.fields.root)),
				r.eq(step, r.param("step", RetrySteadfastInput.fields.step))
			)
			.find({ root, step, key })
	}),
	retryReadRetryBrittleInput: g.query(retryGraph).rule((r) => {
		const { root, step, key } = g.v(RetryBrittleInput, "retryBrittleInput")
		return r
			.match(RetryBrittleInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryBrittleInput.fields.root)),
				r.eq(step, r.param("step", RetryBrittleInput.fields.step))
			)
			.find({ root, step, key })
	}),
	retryReadRetryPoliteInput: g.query(retryGraph).rule((r) => {
		const { root, step, key } = g.v(RetryPoliteInput, "retryPoliteInput")
		return r
			.match(RetryPoliteInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryPoliteInput.fields.root)),
				r.eq(step, r.param("step", RetryPoliteInput.fields.step))
			)
			.find({ root, step, key })
	}),
	retryReadRetryPatientInput: g.query(retryGraph).rule((r) => {
		const { root, step, key } = g.v(RetryPatientInput, "retryPatientInput")
		return r
			.match(RetryPatientInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryPatientInput.fields.root)),
				r.eq(step, r.param("step", RetryPatientInput.fields.step))
			)
			.find({ root, step, key })
	}),
	retryReadRetryLaddersInput: g.query(retryGraph).rule((r) => {
		const { root, scope, steadfast, brittle } = g.v(RetryLaddersInput, "retryLaddersInput")
		return r
			.match(RetryLaddersInput, { root, scope, steadfast, brittle })
			.where(
				r.eq(root, r.param("root", RetryLaddersInput.fields.root)),
				r.eq(scope, r.param("scope", RetryLaddersInput.fields.scope))
			)
			.find({ root, scope, steadfast, brittle })
	}),
	retryRequestLadders: g.clocked(
		g.ChangeSet.empty(retryGraph)
			.insert(
				RetryScope,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryLaddersRetryScope", {
						root: RetryScope.fields.root,
						scope: RetryScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(RetryRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				RetryLaddersInput,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryLaddersRetryLaddersInput", {
						root: RetryLaddersInput.fields.root,
						scope: RetryLaddersInput.fields.scope,
						steadfast: RetryLaddersInput.fields.steadfast,
						brittle: RetryLaddersInput.fields.brittle
					})
					const { root, scope, steadfast, brittle } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, steadfast, brittle })
						.where(r.not(RetryRoot, { root }))
						.find({ root, scope, steadfast, brittle })
				})
			)
			.insert(
				RetryRequestedWith,
				g
					.query(retryGraph)
					.rule((r) => {
						const requested = r.relation("retryLaddersRetryRequestedWith", {
							root: RetryRequestedWith.fields.root,
							fingerprint: RetryRequestedWith.fields.fingerprint,
							input: RetryRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(RetryRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("retryLaddersRetryRequestedWith", {
							root: RetryRequestedWith.fields.root,
							fingerprint: RetryRequestedWith.fields.fingerprint,
							input: RetryRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(RetryRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(RetryRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				RetryRoot,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryLaddersRetryScope", {
						root: RetryScope.fields.root,
						scope: RetryScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("retryLaddersScope", RetryRoot.fields.root)),
							r.not(RetryRoot, { root })
						)
						.find({
							root,
							kind: RetryRootKind.handle("Ladders"),
							key: r.param("retryLaddersKey", RetryRoot.fields.key),
							at: r.param("denNow", RetryRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryOutputsLaddersSteadfast: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetrySteadfastOutput, "output")
		return r
			.match(RetryStep, { root, step, kind: "Steadfast", scope })
			.match(RetrySteadfastOutput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryInputsLaddersSteadfast: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetrySteadfastInput, "input")
		return r
			.match(RetryStep, { root, step, kind: "Steadfast", scope })
			.match(RetrySteadfastInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryFailuresLaddersSteadfast: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		return r
			.match(RetryStep, { root, step, kind: "Steadfast", scope })
			.match(RetryResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step })
	}),
	retryOutputsLaddersBrittle: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetryBrittleOutput, "output")
		return r
			.match(RetryStep, { root, step, kind: "Brittle", scope })
			.match(RetryBrittleOutput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryInputsLaddersBrittle: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetryBrittleInput, "input")
		return r
			.match(RetryStep, { root, step, kind: "Brittle", scope })
			.match(RetryBrittleInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryFailuresLaddersBrittle: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		return r
			.match(RetryStep, { root, step, kind: "Brittle", scope })
			.match(RetryResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step })
	}),
	retryReadRetryThrottledInput: g.query(retryGraph).rule((r) => {
		const { root, scope, key } = g.v(RetryThrottledInput, "retryThrottledInput")
		return r
			.match(RetryThrottledInput, { root, scope, key })
			.where(
				r.eq(root, r.param("root", RetryThrottledInput.fields.root)),
				r.eq(scope, r.param("scope", RetryThrottledInput.fields.scope))
			)
			.find({ root, scope, key })
	}),
	retryRequestThrottled: g.clocked(
		g.ChangeSet.empty(retryGraph)
			.insert(
				RetryScope,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryThrottledRetryScope", {
						root: RetryScope.fields.root,
						scope: RetryScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(RetryRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				RetryThrottledInput,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryThrottledRetryThrottledInput", {
						root: RetryThrottledInput.fields.root,
						scope: RetryThrottledInput.fields.scope,
						key: RetryThrottledInput.fields.key
					})
					const { root, scope, key } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, key })
						.where(r.not(RetryRoot, { root }))
						.find({ root, scope, key })
				})
			)
			.insert(
				RetryRequestedWith,
				g
					.query(retryGraph)
					.rule((r) => {
						const requested = r.relation("retryThrottledRetryRequestedWith", {
							root: RetryRequestedWith.fields.root,
							fingerprint: RetryRequestedWith.fields.fingerprint,
							input: RetryRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(RetryRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("retryThrottledRetryRequestedWith", {
							root: RetryRequestedWith.fields.root,
							fingerprint: RetryRequestedWith.fields.fingerprint,
							input: RetryRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(RetryRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(RetryRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				RetryRoot,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryThrottledRetryScope", {
						root: RetryScope.fields.root,
						scope: RetryScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("retryThrottledScope", RetryRoot.fields.root)),
							r.not(RetryRoot, { root })
						)
						.find({
							root,
							kind: RetryRootKind.handle("Throttled"),
							key: r.param("retryThrottledKey", RetryRoot.fields.key),
							at: r.param("denNow", RetryRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryOutputsThrottledPolite: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetryPoliteOutput, "output")
		return r
			.match(RetryStep, { root, step, kind: "Polite", scope })
			.match(RetryPoliteOutput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryInputsThrottledPolite: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetryPoliteInput, "input")
		return r
			.match(RetryStep, { root, step, kind: "Polite", scope })
			.match(RetryPoliteInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryFailuresThrottledPolite: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		return r
			.match(RetryStep, { root, step, kind: "Polite", scope })
			.match(RetryResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step })
	}),
	retryReadRetryUnhurriedInput: g.query(retryGraph).rule((r) => {
		const { root, scope, key } = g.v(RetryUnhurriedInput, "retryUnhurriedInput")
		return r
			.match(RetryUnhurriedInput, { root, scope, key })
			.where(
				r.eq(root, r.param("root", RetryUnhurriedInput.fields.root)),
				r.eq(scope, r.param("scope", RetryUnhurriedInput.fields.scope))
			)
			.find({ root, scope, key })
	}),
	retryRequestUnhurried: g.clocked(
		g.ChangeSet.empty(retryGraph)
			.insert(
				RetryScope,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryUnhurriedRetryScope", {
						root: RetryScope.fields.root,
						scope: RetryScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(RetryRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				RetryUnhurriedInput,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryUnhurriedRetryUnhurriedInput", {
						root: RetryUnhurriedInput.fields.root,
						scope: RetryUnhurriedInput.fields.scope,
						key: RetryUnhurriedInput.fields.key
					})
					const { root, scope, key } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope, key })
						.where(r.not(RetryRoot, { root }))
						.find({ root, scope, key })
				})
			)
			.insert(
				RetryRequestedWith,
				g
					.query(retryGraph)
					.rule((r) => {
						const requested = r.relation("retryUnhurriedRetryRequestedWith", {
							root: RetryRequestedWith.fields.root,
							fingerprint: RetryRequestedWith.fields.fingerprint,
							input: RetryRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(RetryRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("retryUnhurriedRetryRequestedWith", {
							root: RetryRequestedWith.fields.root,
							fingerprint: RetryRequestedWith.fields.fingerprint,
							input: RetryRequestedWith.fields.input
						})
						const { root, fingerprint, input } = g.v(requested, "requested")
						const { input: held } = g.v(RetryRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(RetryRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				RetryRoot,
				g.query(retryGraph).rule((r) => {
					const requested = r.relation("retryUnhurriedRetryScope", {
						root: RetryScope.fields.root,
						scope: RetryScope.fields.scope
					})
					const { root, scope } = g.v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("retryUnhurriedScope", RetryRoot.fields.root)),
							r.not(RetryRoot, { root })
						)
						.find({
							root,
							kind: RetryRootKind.handle("Unhurried"),
							key: r.param("retryUnhurriedKey", RetryRoot.fields.key),
							at: r.param("denNow", RetryRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryOutputsUnhurriedPatient: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetryPatientOutput, "output")
		return r
			.match(RetryStep, { root, step, kind: "Patient", scope })
			.match(RetryPatientOutput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryInputsUnhurriedPatient: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		const { key } = g.v(RetryPatientInput, "input")
		return r
			.match(RetryStep, { root, step, kind: "Patient", scope })
			.match(RetryPatientInput, { root, step, key })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step, key })
	}),
	retryFailuresUnhurriedPatient: g.query(retryGraph).rule((r) => {
		const { root, step, scope } = g.v(RetryStep, "step")
		return r
			.match(RetryStep, { root, step, kind: "Patient", scope })
			.match(RetryResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", RetryScope.fields.root)),
				r.eq(scope, r.param("scope", RetryScope.fields.scope))
			)
			.find({ step })
	})
})

export const retryDenWorkload = g.workload(RetryDen, retryDenPrograms)

export const retryCoordinatorPrograms = Object.freeze({
	retryPromote: g.clocked(
		g.ChangeSet.empty(retryCoordination).insert(
			RetryServed,
			g.query(retryCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", RetryServed.fields.environment),
					at: r.param("denNow", RetryServed.fields.at),
					deployment: r.param("deployment", RetryServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryPause: g.ChangeSet.empty(retryCoordination).insert(RetryPaused, []),
	retryResume: g.ChangeSet.empty(retryCoordination).insert(RetryResumed, []),
	retryPauseTurns: g.query(retryCoordination).rule((r) => {
		const { target, turn } = g.v(RetryPaused, "retryPaused")
		return r.match(RetryPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	retryPausedAll: g.query(retryCoordination).rule((r) => {
		const { target, turn } = g.v(RetryPaused, "retryPaused")
		return r
			.match(RetryPaused, { target, turn })
			.where(r.not(RetryResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const retryCoordinatorWorkload = g.workload(RetryCoordinator, retryCoordinatorPrograms)

/** den's retiring role for the flow Retry: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const RetryRetirer = g.role(
	App,
	"retry_retirer",
	{ ...retryGraph.relations },
	{
		write: [
			"RetryScope",
			"RetryAdmitted",
			"RetrySkipped",
			"RetryStep",
			"RetryStartStep",
			"RetryFinish",
			"RetryClaim",
			"RetryEnded",
			"RetryRetry",
			"RetryFenced",
			"RetryResult",
			"RetryDone",
			"RetryFailed",
			"RetryHeld",
			"RetryRefusal",
			"RetryExhausted",
			"RetrySteadfastInput",
			"RetryBrittleInput",
			"RetryPoliteInput",
			"RetryPatientInput",
			"RetryLaddersInput",
			"RetryThrottledInput",
			"RetryUnhurriedInput",
			"RetrySteadfastOutput",
			"RetryBrittleOutput",
			"RetryPoliteOutput",
			"RetryPatientOutput",
			"RetryLaddersFinishOutput",
			"RetryThrottledFinishOutput",
			"RetryUnhurriedFinishOutput"
		]
	}
)

export const retryRetirerPrograms = Object.freeze({
	retryRetire: g.ChangeSet.empty(retryGraph).deleteWhere({
		RetryScope: { root: g.param("root", RetryRoot.fields.root) },
		RetryAdmitted: { root: g.param("root", RetryRoot.fields.root) },
		RetrySkipped: { root: g.param("root", RetryRoot.fields.root) },
		RetryStep: { root: g.param("root", RetryRoot.fields.root) },
		RetryStartStep: { root: g.param("root", RetryRoot.fields.root) },
		RetryFinish: { root: g.param("root", RetryRoot.fields.root) },
		RetryClaim: { root: g.param("root", RetryRoot.fields.root) },
		RetryEnded: { root: g.param("root", RetryRoot.fields.root) },
		RetryRetry: { root: g.param("root", RetryRoot.fields.root) },
		RetryFenced: { root: g.param("root", RetryRoot.fields.root) },
		RetryResult: { root: g.param("root", RetryRoot.fields.root) },
		RetryDone: { root: g.param("root", RetryRoot.fields.root) },
		RetryFailed: { root: g.param("root", RetryRoot.fields.root) },
		RetryHeld: { root: g.param("root", RetryRoot.fields.root) },
		RetryRefusal: { root: g.param("root", RetryRoot.fields.root) },
		RetryExhausted: { root: g.param("root", RetryRoot.fields.root) },
		RetrySteadfastInput: { root: g.param("root", RetryRoot.fields.root) },
		RetryBrittleInput: { root: g.param("root", RetryRoot.fields.root) },
		RetryPoliteInput: { root: g.param("root", RetryRoot.fields.root) },
		RetryPatientInput: { root: g.param("root", RetryRoot.fields.root) },
		RetryLaddersInput: { root: g.param("root", RetryRoot.fields.root) },
		RetryThrottledInput: { root: g.param("root", RetryRoot.fields.root) },
		RetryUnhurriedInput: { root: g.param("root", RetryRoot.fields.root) },
		RetrySteadfastOutput: { root: g.param("root", RetryRoot.fields.root) },
		RetryBrittleOutput: { root: g.param("root", RetryRoot.fields.root) },
		RetryPoliteOutput: { root: g.param("root", RetryRoot.fields.root) },
		RetryPatientOutput: { root: g.param("root", RetryRoot.fields.root) },
		RetryLaddersFinishOutput: { root: g.param("root", RetryRoot.fields.root) },
		RetryThrottledFinishOutput: { root: g.param("root", RetryRoot.fields.root) },
		RetryUnhurriedFinishOutput: { root: g.param("root", RetryRoot.fields.root) }
	})
})

export const retryRetirerWorkload = g.workload(RetryRetirer, retryRetirerPrograms)

/** The commits and declared reads of the flow Retry, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const retryCommitPrograms = Object.freeze({
	retryAuthenticated: g.clocked(
		g.query(retryGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	retryCommitSteadfast: g.ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetrySteadfastOutput, []),
	retryCommitBrittle: g.ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryBrittleOutput, []),
	retryCommitPolite: g.ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryPoliteOutput, []),
	retryCommitPatient: g.ChangeSet.empty(retryGraph)
		.insert(RetryResult, [])
		.insert(RetryDone, [])
		.insert(RetryHeld, [])
		.insert(RetryPatientOutput, []),
	retryCommitLaddersFinish: g.ChangeSet.union(
		g.ChangeSet.empty(retryGraph)
			.insert(RetryResult, [])
			.insert(RetryDone, [])
			.insert(RetryHeld, [])
			.insert(RetryLaddersFinishOutput, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	),
	retryCommitThrottledFinish: g.ChangeSet.union(
		g.ChangeSet.empty(retryGraph)
			.insert(RetryResult, [])
			.insert(RetryDone, [])
			.insert(RetryHeld, [])
			.insert(RetryThrottledFinishOutput, []),
		declaredFlow.kinds[4].finish.writes.changes(Loader)
	),
	retryCommitUnhurriedFinish: g.ChangeSet.union(
		g.ChangeSet.empty(retryGraph)
			.insert(RetryResult, [])
			.insert(RetryDone, [])
			.insert(RetryHeld, [])
			.insert(RetryUnhurriedFinishOutput, []),
		declaredFlow.kinds[6].finish.writes.changes(Loader)
	)
})

export const retryCommits = g.workload(Loader, retryCommitPrograms)
