import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Fan to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import { ChangeSet, Num, Type, clocked, param, query, role, v, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { fan as declaredFlow } from "#integration/slice/flows.ts"
import {
	FanKind,
	FanRootKind,
	FanChildKind,
	FanOutcome,
	FanRetryWhy,
	FanPausable,
	FanResource,
	FanScope,
	FanRoot,
	FanRequestedWith,
	FanWithin,
	FanExclusiveKey,
	FanAdmitted,
	FanSkipped,
	FanStep,
	FanStartStep,
	FanStartScope,
	FanFinish,
	FanClaim,
	FanEnded,
	FanRetry,
	FanFenced,
	FanResult,
	FanDone,
	FanFailed,
	FanHeld,
	FanRefusal,
	FanExhausted,
	fan_square_input_ifddbjkaokoig,
	fan_dust_input_lelfhikaelkja,
	fan_mop_input_ngghbiaegmghl,
	fan_batch_input_hjhhnklpfiilh,
	fan_fan_run_input_bghibckinpfgk,
	fan_sweep_input_bnmfcblhkahec,
	fan_wanted_input_nfecjpihiaope,
	fan_wanted_key_ldjmcglkghhjb,
	fan_square_output_gofcfljmlelgo,
	fan_dust_output_pgpcjjjdmhkim,
	fan_mop_output_okmfngilefbec,
	fan_batch_finish_output_djinnhndkglgj,
	fan_fan_run_finish_output_kcmicfckgdcip,
	fan_sweep_finish_output_nebomlkgaabji,
	fan_wanted_finish_output_lmjmjmcffnbda,
	FanExclusive,
	FanReleased,
	FanPaused,
	FanResumed,
	FanServed,
	fanGraph,
	fanCoordination
} from "#integration/slice/generated/fan.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Fan: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains, live holds and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const FanDen = role(
	App,
	"fan_den",
	{
		...fanGraph.relations,
		FanExclusive,
		FanReleased,
		FanPaused,
		FanResumed,
		FanServed,
		FanLive: query(App).rule((r) => {
			const { resource, seat, step, root, attempt, until } = v(App.relations.FanLive, "live")
			return r
				.match(App.relations.FanLive, { resource, seat, step, root, attempt, until })
				.find({ resource, seat, step, root, attempt, until })
		})
	},
	{
		insert: [
			"FanScope",
			"FanRoot",
			"FanRequestedWith",
			"FanWithin",
			"FanExclusiveKey",
			"FanAdmitted",
			"FanSkipped",
			"FanStep",
			"FanStartStep",
			"FanStartScope",
			"FanFinish",
			"FanClaim",
			"FanEnded",
			"FanRetry",
			"FanFenced",
			"FanResult",
			"FanDone",
			"FanFailed",
			"FanHeld",
			"FanRefusal",
			"FanExhausted",
			"fan_square_input_ifddbjkaokoig",
			"fan_dust_input_lelfhikaelkja",
			"fan_mop_input_ngghbiaegmghl",
			"fan_batch_input_hjhhnklpfiilh",
			"fan_fan_run_input_bghibckinpfgk",
			"fan_sweep_input_bnmfcblhkahec",
			"fan_wanted_input_nfecjpihiaope",
			"fan_wanted_key_ldjmcglkghhjb",
			"fan_batch_finish_output_djinnhndkglgj",
			"fan_fan_run_finish_output_kcmicfckgdcip",
			"fan_sweep_finish_output_nebomlkgaabji",
			"fan_wanted_finish_output_lmjmjmcffnbda",
			"FanHold"
		]
	}
)

/** den's coordinator role for the flow Fan: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const FanCoordinator = role(
	App,
	"fan_coordinator",
	{
		FanKind,
		FanRootKind,
		FanChildKind,
		FanOutcome,
		FanRetryWhy,
		FanPausable,
		FanResource,
		FanExclusive,
		FanReleased,
		FanPaused,
		FanResumed,
		FanServed
	},
	{ insert: ["FanExclusive", "FanReleased", "FanPaused", "FanResumed", "FanServed"] }
)

const fanPendingRead = query(FanDen).rule((r) => {
	const { root, step, kind, scope, due } = v(FanStep, "step")
	return r
		.match(FanStep, { root, step, kind, scope, due })
		.where(r.not(FanResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const fanRequestedRead = query(FanDen).rule((r) => {
	const { scope } = v(FanScope, "scope")
	return r
		.match(FanRoot, { root: scope })
		.match(FanScope, { root: scope, scope })
		.where(r.not(FanAdmitted, { root: scope, scope }), r.not(FanSkipped, { root: scope, scope }))
		.find({ scope })
})

const fanRunningRead = query(FanDen).rule((r) => {
	const { root, scope, step } = v(FanFinish, "finish")
	return r
		.match(FanFinish, { root, scope, step })
		.where(r.not(FanResult, { root, step }))
		.find({ scope })
})

const fanLatestServed = query(FanDen).rule((r) => {
	const { environment, at } = v(FanServed, "served")
	return r
		.match(FanServed, { environment, at })
		.where(r.eq(environment, r.param("environment", FanServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const fanDenPrograms = Object.freeze({
	fanNow: clocked(
		query(fanGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanReading: clocked(
		query(FanDen).reads({
			now: query(fanGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: query(FanDen).rule((r) => {
				const { environment, at, deployment } = v(FanServed, "served")
				return r
					.match(
						fanLatestServed.bind({
							environment: r.param("environment", FanServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(FanServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	fanClaim: clocked(
		ChangeSet.empty(fanGraph)
			.insertAllComputed(
				{ FanClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("denNow", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(FanEnded, [])
			.read("held", (delta) =>
				query(fanGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(FanClaim), "added")
					return r
						.match(delta.added(FanClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanRetry: clocked(
		ChangeSet.empty(fanGraph)
			.insert(FanEnded, [])
			.insert(
				FanRetry,
				query(fanGraph).rule((r) =>
					r.find({
						step: r.param("step", FanRetry.fields.step),
						attempt: r.param("attempt", FanRetry.fields.attempt),
						at: Type.cast(
							Num.add(
								Type.base(r.param("denNow", DenInstant)),
								Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", FanRetry.fields.why),
						root: r.param("root", FanRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanFence: ChangeSet.empty(fanGraph).insert(FanEnded, []).insert(FanFenced, []),
	fanHolds: query(FanDen).rule((r) => {
		const { resource, seat, step, root, attempt, until } = v(FanDen.relations.FanLive, "live")
		return r
			.match(FanDen.relations.FanLive, { resource, seat, step, root, attempt, until })
			.find({ resource, seat, step, root, attempt, until })
	}),
	fanRefuse: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanFailed, [])
		.insert(FanHeld, [])
		.insert(FanRefusal, []),
	fanExhaust: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanFailed, [])
		.insert(FanHeld, [])
		.insert(FanExhausted, []),
	fanAdmit: clocked(
		ChangeSet.empty(fanGraph)
			.insert(FanAdmitted, [])
			.insert(FanFinish, [])
			.insert(FanStartStep, [])
			.insert(FanScope, [])
			.insert(FanWithin, [])
			.insert(FanStartScope, [])
			.insert(fan_square_input_ifddbjkaokoig, [])
			.insert(fan_dust_input_lelfhikaelkja, [])
			.insert(fan_mop_input_ngghbiaegmghl, [])
			.insert(fan_batch_input_hjhhnklpfiilh, [])
			.insert(
				FanStep,
				query(fanGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: FanStep.fields.step,
						kind: FanStep.fields.kind,
						scope: FanStep.fields.scope,
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
						root: r.param("root", FanStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanSkip: ChangeSet.empty(fanGraph).insert(FanSkipped, []),
	fanSkippedOf: query(fanGraph).rule((r) => {
		const { root, scope, by } = v(FanSkipped, "fanSkipped")
		return r
			.match(FanSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", FanSkipped.fields.root)),
				r.eq(scope, r.param("scope", FanSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	fanStepOf: query(fanGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(FanStep, "fanStep")
		return r
			.match(FanStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", FanStep.fields.root)),
				r.eq(step, r.param("step", FanStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	fanResultOf: query(fanGraph).rule((r) => {
		const { root, step, outcome } = v(FanResult, "fanResult")
		return r
			.match(FanResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", FanResult.fields.root)),
				r.eq(step, r.param("step", FanResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	fanHeldOf: query(fanGraph).rule((r) => {
		const { root, step, attempt } = v(FanHeld, "fanHeld")
		return r
			.match(FanHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", FanHeld.fields.root)),
				r.eq(step, r.param("step", FanHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	fanWithinOf: query(fanGraph).rule((r) => {
		const { root, scope, parent, kind } = v(FanWithin, "fanWithin")
		return r
			.match(FanWithin, { root, scope, parent, kind })
			.where(
				r.eq(root, r.param("root", FanWithin.fields.root)),
				r.eq(scope, r.param("scope", FanWithin.fields.scope))
			)
			.find({ root, scope, parent, kind })
	}),
	fanAdmittedOf: query(fanGraph).rule((r) => {
		const { root, scope } = v(FanAdmitted, "fanAdmitted")
		return r
			.match(FanAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", FanAdmitted.fields.root)),
				r.eq(scope, r.param("scope", FanAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	fanRootOf: query(fanGraph).rule((r) => {
		const { kind, key, at } = v(FanRoot, "root")
		const { scope } = v(FanScope, "scope")
		return r
			.match(FanRoot, { root: scope, kind, key, at })
			.match(FanScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", FanRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	fanExclusiveKeyOf: query(fanGraph).rule((r) => {
		const { root, scope, key, id } = v(FanExclusiveKey, "fanExclusiveKey")
		return r
			.match(FanExclusiveKey, { root, scope, key, id })
			.where(
				r.eq(root, r.param("root", FanExclusiveKey.fields.root)),
				r.eq(scope, r.param("scope", FanExclusiveKey.fields.scope))
			)
			.find({ root, scope, key, id })
	}),
	fanFinishedRoots: query(fanGraph)
		.rule((r) => {
			const { scope, step } = v(FanFinish, "finish")
			return r
				.match(FanFinish, { root: scope, scope, step })
				.match(FanResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(FanSkipped, "skipped")
			return r.match(FanSkipped, { root: scope, scope }).find({ scope })
		}),
	fanClaimsOf: query(fanGraph).rule((r) => {
		const { root, step, attempt, until } = v(FanClaim, "claim")
		return r
			.match(FanClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(step, r.param("step", FanStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	fanRetriesOf: query(fanGraph).rule((r) => {
		const { root, step, attempt, at, why } = v(FanRetry, "retry")
		return r
			.match(FanRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(step, r.param("step", FanStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	fanFencedOf: query(fanGraph).rule((r) => {
		const { root, step, attempt } = v(FanFenced, "fenced")
		return r
			.match(FanFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(step, r.param("step", FanStep.fields.step))
			)
			.find({ step, attempt })
	}),
	fanUnendedSteps: query(fanGraph).rule((r) => {
		const { root, step, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(scope, r.param("scope", FanScope.fields.scope)),
				r.not(FanResult, { root, step }),
				r.not(FanFinish, { root, scope, step })
			)
			.find({ step })
	}),
	fanOpenChildren: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		return r
			.match(FanWithin, { root, scope, parent })
			.match(FanFinish, { root, scope, step })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope)),
				r.not(FanResult, { root, step })
			)
			.find({ child: scope })
	}),
	fanFinished: query(fanGraph).rule((r) => {
		const { root, scope, step } = v(FanFinish, "finish")
		return r
			.match(FanFinish, { root, scope, step })
			.match(FanResult, { root, step })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(scope, r.param("scope", FanScope.fields.scope))
			)
			.find({ step })
	}),
	fanPending: fanPendingRead,
	fanRequested: fanRequestedRead,
	fanRunning: fanRunningRead,
	fanSnapshot: query(FanDen).reads({
		steps: fanPendingRead,
		claims: query(FanDen).rule((r) => {
			const { root, step, attempt, until } = v(FanClaim, "claim")
			return r
				.match(FanClaim, { root, step, attempt, until })
				.where(r.not(FanResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: query(FanDen).rule((r) => {
			const { root, step, attempt, at, why } = v(FanRetry, "retry")
			return r
				.match(FanRetry, { root, step, attempt, at, why })
				.where(r.not(FanResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: query(FanDen).rule((r) => {
			const { root, step, attempt } = v(FanFenced, "fenced")
			return r
				.match(FanFenced, { root, step, attempt })
				.where(r.not(FanResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: fanRequestedRead,
		running: fanRunningRead,
		withins: query(FanDen).rule((r) => {
			const { scope, parent, kind } = v(FanWithin, "fanWithin")
			return r.match(FanWithin, { scope, parent, kind }).find({ scope, parent, kind })
		}),
		roots: query(FanDen).rule((r) => {
			const { kind, key, at } = v(FanRoot, "root")
			const { scope } = v(FanScope, "scope")
			return r
				.match(FanRoot, { root: scope, kind, key, at })
				.match(FanScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		keys: query(FanDen).rule((r) => {
			const { scope, key, id } = v(FanExclusiveKey, "fanExclusiveKey")
			return r.match(FanExclusiveKey, { scope, key, id }).find({ scope, key, id })
		}),
		holds: query(FanDen).rule((r) => {
			const { resource, seat, step, root, attempt, until } = v(FanDen.relations.FanLive, "live")
			return r
				.match(FanDen.relations.FanLive, { resource, seat, step, root, attempt, until })
				.find({ resource, seat, step, root, attempt, until })
		}),
		exclusives: query(FanDen).rule((r) => {
			const { kind, key, turn, scope } = v(FanExclusive, "fanExclusive")
			return r
				.match(FanExclusive, { kind, key, turn, scope })
				.where(r.not(FanReleased, { kind, key, turn }))
				.find({ kind, key, turn, scope })
		}),
		paused: query(FanDen).rule((r) => {
			const { target, turn } = v(FanPaused, "fanPaused")
			return r
				.match(FanPaused, { target, turn })
				.where(r.not(FanResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	fanReadfan_square_input_ifddbjkaokoig: query(fanGraph).rule((r) => {
		const { root, step, batch, n } = v(
			fan_square_input_ifddbjkaokoig,
			"fan_square_input_ifddbjkaokoig"
		)
		return r
			.match(fan_square_input_ifddbjkaokoig, { root, step, batch, n })
			.where(
				r.eq(root, r.param("root", fan_square_input_ifddbjkaokoig.fields.root)),
				r.eq(step, r.param("step", fan_square_input_ifddbjkaokoig.fields.step))
			)
			.find({ root, step, batch, n })
	}),
	fanReadfan_dust_input_lelfhikaelkja: query(fanGraph).rule((r) => {
		const { root, step, sweep } = v(fan_dust_input_lelfhikaelkja, "fan_dust_input_lelfhikaelkja")
		return r
			.match(fan_dust_input_lelfhikaelkja, { root, step, sweep })
			.where(
				r.eq(root, r.param("root", fan_dust_input_lelfhikaelkja.fields.root)),
				r.eq(step, r.param("step", fan_dust_input_lelfhikaelkja.fields.step))
			)
			.find({ root, step, sweep })
	}),
	fanReadfan_mop_input_ngghbiaegmghl: query(fanGraph).rule((r) => {
		const { root, step, sweep } = v(fan_mop_input_ngghbiaegmghl, "fan_mop_input_ngghbiaegmghl")
		return r
			.match(fan_mop_input_ngghbiaegmghl, { root, step, sweep })
			.where(
				r.eq(root, r.param("root", fan_mop_input_ngghbiaegmghl.fields.root)),
				r.eq(step, r.param("step", fan_mop_input_ngghbiaegmghl.fields.step))
			)
			.find({ root, step, sweep })
	}),
	fanReadfan_batch_input_hjhhnklpfiilh: query(fanGraph).rule((r) => {
		const { root, scope, batch, size } = v(
			fan_batch_input_hjhhnklpfiilh,
			"fan_batch_input_hjhhnklpfiilh"
		)
		return r
			.match(fan_batch_input_hjhhnklpfiilh, { root, scope, batch, size })
			.where(
				r.eq(root, r.param("root", fan_batch_input_hjhhnklpfiilh.fields.root)),
				r.eq(scope, r.param("scope", fan_batch_input_hjhhnklpfiilh.fields.scope))
			)
			.find({ root, scope, batch, size })
	}),
	fanOutputsBatchSquare: query(fanGraph).rule((r) => {
		const { root, step, scope } = v(FanStep, "step")
		const { square } = v(fan_square_output_gofcfljmlelgo, "output")
		return r
			.match(FanStep, { root, step, kind: "Square", scope })
			.match(fan_square_output_gofcfljmlelgo, { root, step, square })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(scope, r.param("scope", FanScope.fields.scope))
			)
			.find({ step, square })
	}),
	fanInputsBatchSquare: query(fanGraph).rule((r) => {
		const { root, step, scope } = v(FanStep, "step")
		const { batch, n } = v(fan_square_input_ifddbjkaokoig, "input")
		return r
			.match(FanStep, { root, step, kind: "Square", scope })
			.match(fan_square_input_ifddbjkaokoig, { root, step, batch, n })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(scope, r.param("scope", FanScope.fields.scope))
			)
			.find({ step, batch, n })
	}),
	fanFailuresBatchSquare: query(fanGraph).rule((r) => {
		const { root, step, scope } = v(FanStep, "step")
		return r
			.match(FanStep, { root, step, kind: "Square", scope })
			.match(FanResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(scope, r.param("scope", FanScope.fields.scope))
			)
			.find({ step })
	}),
	fanReadfan_fan_run_input_bghibckinpfgk: query(fanGraph).rule((r) => {
		const { root, scope, batch, size } = v(
			fan_fan_run_input_bghibckinpfgk,
			"fan_fan_run_input_bghibckinpfgk"
		)
		return r
			.match(fan_fan_run_input_bghibckinpfgk, { root, scope, batch, size })
			.where(
				r.eq(root, r.param("root", fan_fan_run_input_bghibckinpfgk.fields.root)),
				r.eq(scope, r.param("scope", fan_fan_run_input_bghibckinpfgk.fields.scope))
			)
			.find({ root, scope, batch, size })
	}),
	fanRequestFanRun: clocked(
		ChangeSet.empty(fanGraph)
			.insert(
				FanScope,
				query(fanGraph).rule((r) => {
					const requested = r.relation("fanFanRunFanScope", {
						root: FanScope.fields.root,
						scope: FanScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(FanRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				fan_fan_run_input_bghibckinpfgk,
				query(fanGraph).rule((r) => {
					const requested = r.relation("fanFanRunfan_fan_run_input_bghibckinpfgk", {
						root: fan_fan_run_input_bghibckinpfgk.fields.root,
						scope: fan_fan_run_input_bghibckinpfgk.fields.scope,
						batch: fan_fan_run_input_bghibckinpfgk.fields.batch,
						size: fan_fan_run_input_bghibckinpfgk.fields.size
					})
					const { root, scope, batch, size } = v(requested, "requested")
					return r
						.match(requested, { root, scope, batch, size })
						.where(r.not(FanRoot, { root }))
						.find({ root, scope, batch, size })
				})
			)
			.insert(
				FanRequestedWith,
				query(fanGraph)
					.rule((r) => {
						const requested = r.relation("fanFanRunFanRequestedWith", {
							root: FanRequestedWith.fields.root,
							fingerprint: FanRequestedWith.fields.fingerprint,
							input: FanRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(FanRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("fanFanRunFanRequestedWith", {
							root: FanRequestedWith.fields.root,
							fingerprint: FanRequestedWith.fields.fingerprint,
							input: FanRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(FanRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(FanRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				FanRoot,
				query(fanGraph).rule((r) => {
					const requested = r.relation("fanFanRunFanScope", {
						root: FanScope.fields.root,
						scope: FanScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("fanFanRunScope", FanRoot.fields.root)),
							r.not(FanRoot, { root })
						)
						.find({
							root,
							kind: FanRootKind.handle("FanRun"),
							key: r.param("fanFanRunKey", FanRoot.fields.key),
							at: r.param("denNow", FanRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanOutputsFanRunBatch: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		return r
			.match(FanWithin, { root, scope, parent, kind: "Batch" })
			.match(FanFinish, { root, scope, step })
			.match(fan_batch_finish_output_djinnhndkglgj, { root, step })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope))
			)
			.find({ step })
	}),
	fanInputsFanRunBatch: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		const { batch, size } = v(fan_batch_input_hjhhnklpfiilh, "input")
		return r
			.match(FanWithin, { root, scope, parent, kind: "Batch" })
			.match(FanFinish, { root, scope, step })
			.match(fan_batch_input_hjhhnklpfiilh, { root, scope, batch, size })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope))
			)
			.find({ step, batch, size })
	}),
	fanFailuresFanRunBatch: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		return r
			.match(FanWithin, { root, scope, parent, kind: "Batch" })
			.match(FanFinish, { root, scope, step })
			.match(FanResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope))
			)
			.find({ step })
	}),
	fanReadfan_sweep_input_bnmfcblhkahec: query(fanGraph).rule((r) => {
		const { root, scope, sweep } = v(fan_sweep_input_bnmfcblhkahec, "fan_sweep_input_bnmfcblhkahec")
		return r
			.match(fan_sweep_input_bnmfcblhkahec, { root, scope, sweep })
			.where(
				r.eq(root, r.param("root", fan_sweep_input_bnmfcblhkahec.fields.root)),
				r.eq(scope, r.param("scope", fan_sweep_input_bnmfcblhkahec.fields.scope))
			)
			.find({ root, scope, sweep })
	}),
	fanRequestSweep: clocked(
		ChangeSet.empty(fanGraph)
			.insert(
				FanScope,
				query(fanGraph).rule((r) => {
					const requested = r.relation("fanSweepFanScope", {
						root: FanScope.fields.root,
						scope: FanScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(FanRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				fan_sweep_input_bnmfcblhkahec,
				query(fanGraph).rule((r) => {
					const requested = r.relation("fanSweepfan_sweep_input_bnmfcblhkahec", {
						root: fan_sweep_input_bnmfcblhkahec.fields.root,
						scope: fan_sweep_input_bnmfcblhkahec.fields.scope,
						sweep: fan_sweep_input_bnmfcblhkahec.fields.sweep
					})
					const { root, scope, sweep } = v(requested, "requested")
					return r
						.match(requested, { root, scope, sweep })
						.where(r.not(FanRoot, { root }))
						.find({ root, scope, sweep })
				})
			)
			.insert(
				FanRequestedWith,
				query(fanGraph)
					.rule((r) => {
						const requested = r.relation("fanSweepFanRequestedWith", {
							root: FanRequestedWith.fields.root,
							fingerprint: FanRequestedWith.fields.fingerprint,
							input: FanRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(FanRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("fanSweepFanRequestedWith", {
							root: FanRequestedWith.fields.root,
							fingerprint: FanRequestedWith.fields.fingerprint,
							input: FanRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(FanRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(FanRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				FanRoot,
				query(fanGraph).rule((r) => {
					const requested = r.relation("fanSweepFanScope", {
						root: FanScope.fields.root,
						scope: FanScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("fanSweepScope", FanRoot.fields.root)),
							r.not(FanRoot, { root })
						)
						.find({
							root,
							kind: FanRootKind.handle("Sweep"),
							key: r.param("fanSweepKey", FanRoot.fields.key),
							at: r.param("denNow", FanRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanReadfan_wanted_input_nfecjpihiaope: query(fanGraph).rule((r) => {
		const { root, scope, batch, size } = v(
			fan_wanted_input_nfecjpihiaope,
			"fan_wanted_input_nfecjpihiaope"
		)
		return r
			.match(fan_wanted_input_nfecjpihiaope, { root, scope, batch, size })
			.where(
				r.eq(root, r.param("root", fan_wanted_input_nfecjpihiaope.fields.root)),
				r.eq(scope, r.param("scope", fan_wanted_input_nfecjpihiaope.fields.scope))
			)
			.find({ root, scope, batch, size })
	}),
	fanOutputsWantedBatch: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		return r
			.match(FanWithin, { root, scope, parent, kind: "Batch" })
			.match(FanFinish, { root, scope, step })
			.match(fan_batch_finish_output_djinnhndkglgj, { root, step })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope))
			)
			.find({ step })
	}),
	fanInputsWantedBatch: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		const { batch, size } = v(fan_batch_input_hjhhnklpfiilh, "input")
		return r
			.match(FanWithin, { root, scope, parent, kind: "Batch" })
			.match(FanFinish, { root, scope, step })
			.match(fan_batch_input_hjhhnklpfiilh, { root, scope, batch, size })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope))
			)
			.find({ step, batch, size })
	}),
	fanFailuresWantedBatch: query(fanGraph).rule((r) => {
		const { root, scope, parent } = v(FanWithin, "within")
		const { step } = v(FanFinish, "finish")
		return r
			.match(FanWithin, { root, scope, parent, kind: "Batch" })
			.match(FanFinish, { root, scope, step })
			.match(FanResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", FanScope.fields.root)),
				r.eq(parent, r.param("scope", FanScope.fields.scope))
			)
			.find({ step })
	})
})

export const fanDenWorkload = workload(FanDen, fanDenPrograms)

export const fanCoordinatorPrograms = Object.freeze({
	fanHoldExclusive: ChangeSet.empty(fanCoordination).insert(FanExclusive, []),
	fanReleaseExclusive: ChangeSet.empty(fanCoordination).insert(FanReleased, []),
	fanExclusiveTurns: query(fanCoordination).rule((r) => {
		const { kind, key, turn } = v(FanExclusive, "fanExclusive")
		return r.match(FanExclusive, { kind, key, turn }).find({ kind, key, turn: r.max(turn) })
	}),
	fanExclusives: query(fanCoordination).rule((r) => {
		const { kind, key, turn, scope } = v(FanExclusive, "fanExclusive")
		return r
			.match(FanExclusive, { kind, key, turn, scope })
			.where(r.not(FanReleased, { kind, key, turn }))
			.find({ kind, key, turn, scope })
	}),
	fanPromote: clocked(
		ChangeSet.empty(fanCoordination).insert(
			FanServed,
			query(fanCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", FanServed.fields.environment),
					at: r.param("denNow", FanServed.fields.at),
					deployment: r.param("deployment", FanServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanPause: ChangeSet.empty(fanCoordination).insert(FanPaused, []),
	fanResume: ChangeSet.empty(fanCoordination).insert(FanResumed, []),
	fanPauseTurns: query(fanCoordination).rule((r) => {
		const { target, turn } = v(FanPaused, "fanPaused")
		return r.match(FanPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	fanPausedAll: query(fanCoordination).rule((r) => {
		const { target, turn } = v(FanPaused, "fanPaused")
		return r
			.match(FanPaused, { target, turn })
			.where(r.not(FanResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const fanCoordinatorWorkload = workload(FanCoordinator, fanCoordinatorPrograms)

/** den's retiring role for the flow Fan: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const FanRetirer = role(
	App,
	"fan_retirer",
	{ ...fanGraph.relations },
	{
		write: [
			"FanScope",
			"FanWithin",
			"FanExclusiveKey",
			"FanAdmitted",
			"FanSkipped",
			"FanStep",
			"FanStartStep",
			"FanStartScope",
			"FanFinish",
			"FanClaim",
			"FanEnded",
			"FanRetry",
			"FanFenced",
			"FanResult",
			"FanDone",
			"FanFailed",
			"FanHeld",
			"FanRefusal",
			"FanExhausted",
			"fan_square_input_ifddbjkaokoig",
			"fan_dust_input_lelfhikaelkja",
			"fan_mop_input_ngghbiaegmghl",
			"fan_batch_input_hjhhnklpfiilh",
			"fan_fan_run_input_bghibckinpfgk",
			"fan_sweep_input_bnmfcblhkahec",
			"fan_wanted_input_nfecjpihiaope",
			"fan_square_output_gofcfljmlelgo",
			"fan_dust_output_pgpcjjjdmhkim",
			"fan_mop_output_okmfngilefbec",
			"fan_batch_finish_output_djinnhndkglgj",
			"fan_fan_run_finish_output_kcmicfckgdcip",
			"fan_sweep_finish_output_nebomlkgaabji",
			"fan_wanted_finish_output_lmjmjmcffnbda",
			"FanHold"
		]
	}
)

export const fanRetirerPrograms = Object.freeze({
	fanRetire: ChangeSet.empty(fanGraph).deleteWhere({
		FanScope: { root: param("root", FanRoot.fields.root) },
		FanWithin: { root: param("root", FanRoot.fields.root) },
		FanExclusiveKey: { root: param("root", FanRoot.fields.root) },
		FanAdmitted: { root: param("root", FanRoot.fields.root) },
		FanSkipped: { root: param("root", FanRoot.fields.root) },
		FanStep: { root: param("root", FanRoot.fields.root) },
		FanStartStep: { root: param("root", FanRoot.fields.root) },
		FanStartScope: { root: param("root", FanRoot.fields.root) },
		FanFinish: { root: param("root", FanRoot.fields.root) },
		FanClaim: { root: param("root", FanRoot.fields.root) },
		FanEnded: { root: param("root", FanRoot.fields.root) },
		FanRetry: { root: param("root", FanRoot.fields.root) },
		FanFenced: { root: param("root", FanRoot.fields.root) },
		FanResult: { root: param("root", FanRoot.fields.root) },
		FanDone: { root: param("root", FanRoot.fields.root) },
		FanFailed: { root: param("root", FanRoot.fields.root) },
		FanHeld: { root: param("root", FanRoot.fields.root) },
		FanRefusal: { root: param("root", FanRoot.fields.root) },
		FanExhausted: { root: param("root", FanRoot.fields.root) },
		fan_square_input_ifddbjkaokoig: { root: param("root", FanRoot.fields.root) },
		fan_dust_input_lelfhikaelkja: { root: param("root", FanRoot.fields.root) },
		fan_mop_input_ngghbiaegmghl: { root: param("root", FanRoot.fields.root) },
		fan_batch_input_hjhhnklpfiilh: { root: param("root", FanRoot.fields.root) },
		fan_fan_run_input_bghibckinpfgk: { root: param("root", FanRoot.fields.root) },
		fan_sweep_input_bnmfcblhkahec: { root: param("root", FanRoot.fields.root) },
		fan_wanted_input_nfecjpihiaope: { root: param("root", FanRoot.fields.root) },
		fan_square_output_gofcfljmlelgo: { root: param("root", FanRoot.fields.root) },
		fan_dust_output_pgpcjjjdmhkim: { root: param("root", FanRoot.fields.root) },
		fan_mop_output_okmfngilefbec: { root: param("root", FanRoot.fields.root) },
		fan_batch_finish_output_djinnhndkglgj: { root: param("root", FanRoot.fields.root) },
		fan_fan_run_finish_output_kcmicfckgdcip: { root: param("root", FanRoot.fields.root) },
		fan_sweep_finish_output_nebomlkgaabji: { root: param("root", FanRoot.fields.root) },
		fan_wanted_finish_output_lmjmjmcffnbda: { root: param("root", FanRoot.fields.root) }
	})
})

export const fanRetirerWorkload = workload(FanRetirer, fanRetirerPrograms)

/** The commits and declared reads of the flow Fan, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const fanCommitPrograms = Object.freeze({
	fanAuthenticated: clocked(
		query(fanGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	fanCommitSquare: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(fan_square_output_gofcfljmlelgo, []),
	fanCommitDust: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(fan_dust_output_pgpcjjjdmhkim, []),
	fanCommitMop: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(fan_mop_output_okmfngilefbec, []),
	fanCommitBatchFinish: ChangeSet.union(
		ChangeSet.empty(fanGraph)
			.insert(FanResult, [])
			.insert(FanDone, [])
			.insert(FanHeld, [])
			.insert(fan_batch_finish_output_djinnhndkglgj, []),
		declaredFlow.kinds[1].finish.writes.changes(Loader)
	),
	fanCommitFanRunFinish: ChangeSet.union(
		ChangeSet.empty(fanGraph)
			.insert(FanResult, [])
			.insert(FanDone, [])
			.insert(FanHeld, [])
			.insert(fan_fan_run_finish_output_kcmicfckgdcip, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	),
	fanCommitSweepFinish: ChangeSet.empty(fanGraph)
		.insert(FanResult, [])
		.insert(FanDone, [])
		.insert(FanHeld, [])
		.insert(fan_sweep_finish_output_nebomlkgaabji, []),
	fanCommitWantedFinish: ChangeSet.union(
		ChangeSet.empty(fanGraph)
			.insert(FanResult, [])
			.insert(FanDone, [])
			.insert(FanHeld, [])
			.insert(fan_wanted_finish_output_lmjmjmcffnbda, []),
		declaredFlow.kinds[6].finish.writes.changes(Loader)
	)
})

export const fanCommits = workload(Loader, fanCommitPrograms)

/** The requests of the flow's roots the app's own write starts, each a ChangeSet the app's write commits beside its own: over the flow's graph, unioned with it, or, for a root whose input derives from its key, over the app's schema, sequenced after the strata whose facts it derives from. */
export const fanRequests = Object.freeze({
	Wanted: ChangeSet.empty(App)
		.insert(
			FanScope,
			query(App).rule((r) => {
				const requested = r.relation("fanWantedFanScope", {
					root: FanScope.fields.root,
					scope: FanScope.fields.scope
				})
				const { root, scope } = v(requested, "requested")
				const derived = declaredFlow.kinds[6].from.read.bind({
					batch: r.param("fanWantedKeyBatch", fan_wanted_key_ldjmcglkghhjb.fields.batch)
				})
				const { batch: derivedBatch, size: derivedSize } = v(derived, "derived")
				return r
					.match(requested, { root, scope })
					.match(derived, { batch: derivedBatch, size: derivedSize })
					.where(r.not(FanRoot, { root }))
					.find({ root, scope })
			})
		)
		.insert(
			FanExclusiveKey,
			query(App).rule((r) => {
				const requested = r.relation("fanWantedFanExclusiveKey", {
					root: FanExclusiveKey.fields.root,
					scope: FanExclusiveKey.fields.scope,
					key: FanExclusiveKey.fields.key,
					id: FanExclusiveKey.fields.id
				})
				const { root, scope, key, id } = v(requested, "requested")
				const derived = declaredFlow.kinds[6].from.read.bind({
					batch: r.param("fanWantedKeyBatch", fan_wanted_key_ldjmcglkghhjb.fields.batch)
				})
				const { batch: derivedBatch, size: derivedSize } = v(derived, "derived")
				return r
					.match(requested, { root, scope, key, id })
					.match(derived, { batch: derivedBatch, size: derivedSize })
					.where(r.not(FanRoot, { root }))
					.find({ root, scope, key, id })
			})
		)
		.insert(
			fan_wanted_key_ldjmcglkghhjb,
			query(App).rule((r) => {
				const requested = r.relation("fanWantedFanScope", {
					root: FanScope.fields.root,
					scope: FanScope.fields.scope
				})
				const { root, scope } = v(requested, "requested")
				const derived = declaredFlow.kinds[6].from.read.bind({
					batch: r.param("fanWantedKeyBatch", fan_wanted_key_ldjmcglkghhjb.fields.batch)
				})
				const { batch: derivedBatch, size: derivedSize } = v(derived, "derived")
				return r
					.match(requested, { root, scope })
					.match(derived, { batch: derivedBatch, size: derivedSize })
					.where(r.eq(scope, root), r.not(FanRoot, { root }))
					.find({
						root,
						batch: r.param("fanWantedKeyBatch", fan_wanted_key_ldjmcglkghhjb.fields.batch)
					})
			})
		)
		.insert(
			fan_wanted_input_nfecjpihiaope,
			query(App).rule((r) => {
				const requested = r.relation("fanWantedFanScope", {
					root: FanScope.fields.root,
					scope: FanScope.fields.scope
				})
				const { root, scope } = v(requested, "requested")
				const derived = declaredFlow.kinds[6].from.read.bind({
					batch: r.param("fanWantedKeyBatch", fan_wanted_key_ldjmcglkghhjb.fields.batch)
				})
				const { batch: derivedBatch, size: derivedSize } = v(derived, "derived")
				return r
					.match(requested, { root, scope })
					.match(derived, { batch: derivedBatch, size: derivedSize })
					.where(r.eq(scope, root), r.not(FanRoot, { root }))
					.find({ scope, root, batch: derivedBatch, size: derivedSize })
			})
		)
		.insert(
			FanRoot,
			query(App).rule((r) => {
				const requested = r.relation("fanWantedFanScope", {
					root: FanScope.fields.root,
					scope: FanScope.fields.scope
				})
				const { root, scope } = v(requested, "requested")
				const derived = declaredFlow.kinds[6].from.read.bind({
					batch: r.param("fanWantedKeyBatch", fan_wanted_key_ldjmcglkghhjb.fields.batch)
				})
				const { batch: derivedBatch, size: derivedSize } = v(derived, "derived")
				return r
					.match(requested, { root, scope })
					.match(derived, { batch: derivedBatch, size: derivedSize })
					.where(
						r.eq(scope, root),
						r.eq(root, r.param("fanWantedScope", FanRoot.fields.root)),
						r.not(FanRoot, { root })
					)
					.find({
						root,
						kind: FanRootKind.handle("Wanted"),
						key: r.param("fanWantedKey", FanRoot.fields.key),
						at: r.param("denNow", FanRoot.fields.at)
					})
			})
		)
})

/** What each of the flow's requests inserts, by its root: a role whose write composes a request inserts these beside its write's own, and none of den's step commits; a role composing several of the flow's requests names each relation in its insert list once. */
export const fanRequestWrites = Object.freeze({
	Wanted: [
		"FanScope",
		"FanExclusiveKey",
		"fan_wanted_key_ldjmcglkghhjb",
		"fan_wanted_input_nfecjpihiaope",
		"FanRoot"
	] as const
})
