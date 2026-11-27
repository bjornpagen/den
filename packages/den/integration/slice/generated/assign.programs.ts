import { DenDelay, DenInstant, denInstantKey } from "@bjornpagen/den/lower/keys"
/** The programs den lowered the flow Assign to, over its fragments, and its roles over the schema App; `den generate` writes them, and nothing edits them. */
import {
	ChangeSet,
	Num,
	Type,
	clocked,
	param,
	query,
	recordsFacts,
	role,
	v,
	workload
} from "@bjornpagen/grizzle"
import { Array as Arr } from "effect"
import { App } from "#integration/slice/app.ts"
import { assign as declaredFlow } from "#integration/slice/flows.ts"
import {
	AssignKind,
	AssignRootKind,
	AssignOutcome,
	AssignRetryWhy,
	AssignPausable,
	assign_embed_input_mode_pblkjdhncepei,
	assign_decide_input_mode_beoibaghjodnf,
	assign_assignment_input_mode_pgalmghonldnf,
	assign_decide_output_stage_bjoijbfcegdbp,
	AssignScope,
	AssignRoot,
	AssignRequestedWith,
	AssignAdmitted,
	AssignSkipped,
	AssignStep,
	AssignStartStep,
	AssignFinish,
	AssignClaim,
	AssignEnded,
	AssignRetry,
	AssignFenced,
	AssignResult,
	AssignDone,
	AssignFailed,
	AssignHeld,
	AssignRefusal,
	AssignExhausted,
	assign_embed_input_kmlepfpdepkmo,
	assign_embed_input_near_dhffcaodkgemm,
	assign_embed_input_exclude_gcjikbkjkcefj,
	assign_embed_input_mode_nearest_bdiihcbmhfojp,
	assign_embed_input_mode_within_oiehjhalkkkfi,
	assign_decide_input_ffhdojphbdjfc,
	assign_decide_input_exclude_bpjgmijefddch,
	assign_decide_input_mode_nearest_ijgbegdphofca,
	assign_decide_input_mode_within_fgbilcoafbdcg,
	assign_assignment_input_kijoknpmnpomn,
	assign_assignment_input_near_acilimddcfjog,
	assign_assignment_input_exclude_paaebdpkimebl,
	assign_assignment_input_mode_nearest_jdmfgbfmpepjd,
	assign_assignment_input_mode_within_iahlinklmdadj,
	assign_embed_output_ghdpbieopfmkd,
	assign_decide_output_fkgbaoobeoima,
	assign_decide_output_weighed_gpdibcghlfbhb,
	assign_decide_output_stage_serve_chfjeagmkjoef,
	assign_decide_output_stage_rest_gohjkdlkfnkca,
	assign_assignment_finish_output_dehjnhpeahpgb,
	assign_asked_fobgfofknpfgd,
	assign_decide_read_nearest_mlemoegfgpbbi,
	assign_decide_read_seen_oahojgbpphboo,
	AssignPaused,
	AssignResumed,
	AssignServed,
	assign_decide_read_nearest_mlemoegfgpbbiRecords,
	assign_decide_read_seen_oahojgbpphbooRecords,
	assignGraph,
	assignCoordination
} from "#integration/slice/generated/assign.fragment.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's role for the flow Assign: the database's instant, claims, retries, fenced attempts, failures, admissions, requests, and every read the scheduler makes. It holds the graph, the coordination group's chains and the steps and results of the flows its preconditions name, writing only the graph, so the scheduler's snapshot reads all of them in one statement. */
export const AssignDen = role(
	App,
	"assign_den",
	{ ...assignGraph.relations, AssignPaused, AssignResumed, AssignServed },
	{
		insert: [
			"AssignScope",
			"AssignRoot",
			"AssignRequestedWith",
			"AssignAdmitted",
			"AssignSkipped",
			"AssignStep",
			"AssignStartStep",
			"AssignFinish",
			"AssignClaim",
			"AssignEnded",
			"AssignRetry",
			"AssignFenced",
			"AssignResult",
			"AssignDone",
			"AssignFailed",
			"AssignHeld",
			"AssignRefusal",
			"AssignExhausted",
			"assign_embed_input_kmlepfpdepkmo",
			"assign_embed_input_near_dhffcaodkgemm",
			"assign_embed_input_exclude_gcjikbkjkcefj",
			"assign_embed_input_mode_nearest_bdiihcbmhfojp",
			"assign_embed_input_mode_within_oiehjhalkkkfi",
			"assign_decide_input_ffhdojphbdjfc",
			"assign_decide_input_exclude_bpjgmijefddch",
			"assign_decide_input_mode_nearest_ijgbegdphofca",
			"assign_decide_input_mode_within_fgbilcoafbdcg",
			"assign_assignment_input_kijoknpmnpomn",
			"assign_assignment_input_near_acilimddcfjog",
			"assign_assignment_input_exclude_paaebdpkimebl",
			"assign_assignment_input_mode_nearest_jdmfgbfmpepjd",
			"assign_assignment_input_mode_within_iahlinklmdadj",
			"assign_assignment_finish_output_dehjnhpeahpgb",
			"assign_decide_read_nearest_mlemoegfgpbbi",
			"assign_decide_read_seen_oahojgbpphboo",
			...Arr.map(assign_decide_read_nearest_mlemoegfgpbbiRecords.relations, (rel) => rel.name),
			...Arr.map(assign_decide_read_seen_oahojgbpphbooRecords.relations, (rel) => rel.name)
		]
	}
)

/** den's coordinator role for the flow Assign: the turns of its exclusivity seats and pauses. It holds the coordination group's rosters and relations whole, no role holding a closed relation, and no live hold, which only den's role reads, over the graph it holds. */
export const AssignCoordinator = role(
	App,
	"assign_coordinator",
	{
		AssignKind,
		AssignRootKind,
		AssignOutcome,
		AssignRetryWhy,
		AssignPausable,
		assign_embed_input_mode_pblkjdhncepei,
		assign_decide_input_mode_beoibaghjodnf,
		assign_assignment_input_mode_pgalmghonldnf,
		assign_decide_output_stage_bjoijbfcegdbp,
		AssignPaused,
		AssignResumed,
		AssignServed
	},
	{ insert: ["AssignPaused", "AssignResumed", "AssignServed"] }
)

const assignPendingRead = query(AssignDen).rule((r) => {
	const { root, step, kind, scope, due } = v(AssignStep, "step")
	return r
		.match(AssignStep, { root, step, kind, scope, due })
		.where(r.not(AssignResult, { root, step }))
		.find({ root, step, kind, scope, due })
})

const assignRequestedRead = query(AssignDen).rule((r) => {
	const { scope } = v(AssignScope, "scope")
	return r
		.match(AssignRoot, { root: scope })
		.match(AssignScope, { root: scope, scope })
		.where(
			r.not(AssignAdmitted, { root: scope, scope }),
			r.not(AssignSkipped, { root: scope, scope })
		)
		.find({ scope })
})

const assignRunningRead = query(AssignDen).rule((r) => {
	const { root, scope, step } = v(AssignFinish, "finish")
	return r
		.match(AssignFinish, { root, scope, step })
		.where(r.not(AssignResult, { root, step }))
		.find({ scope })
})

const assignLatestServed = query(AssignDen).rule((r) => {
	const { environment, at } = v(AssignServed, "served")
	return r
		.match(AssignServed, { environment, at })
		.where(r.eq(environment, r.param("environment", AssignServed.fields.environment)))
		.find({ environment, at: r.max(at) })
})

export const assignDenPrograms = Object.freeze({
	assignNow: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignReading: clocked(
		query(AssignDen).reads({
			now: query(assignGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
			serving: query(AssignDen).rule((r) => {
				const { environment, at, deployment } = v(AssignServed, "served")
				return r
					.match(
						assignLatestServed.bind({
							environment: r.param("environment", AssignServed.fields.environment)
						}),
						{ environment, at }
					)
					.match(AssignServed, { environment, at, deployment })
					.find({ deployment })
			})
		}),
		{ "now.denNow": "millis" },
		{ "now.denNow": denInstantKey }
	),
	assignClaim: clocked(
		ChangeSet.empty(assignGraph)
			.insertAllComputed(
				{ AssignClaim: [] },
				{
					until: Type.cast(
						Num.add(Type.base(param("denNow", DenInstant)), Type.base(param("budget", DenDelay))),
						DenInstant,
						denInstantKey
					)
				}
			)
			.insert(AssignEnded, [])
			.read("held", (delta) =>
				query(assignGraph).rule((r) => {
					const { step, root, attempt } = v(delta.added(AssignClaim), "added")
					return r
						.match(delta.added(AssignClaim), { step, root, attempt })
						.find({ step, root, attempt })
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignRetry: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignEnded, [])
			.insert(
				AssignRetry,
				query(assignGraph).rule((r) =>
					r.find({
						step: r.param("step", AssignRetry.fields.step),
						attempt: r.param("attempt", AssignRetry.fields.attempt),
						at: Type.cast(
							Num.add(
								Type.base(r.param("denNow", DenInstant)),
								Type.base(r.param("delay", DenDelay))
							),
							DenInstant,
							denInstantKey
						),
						why: r.param("why", AssignRetry.fields.why),
						root: r.param("root", AssignRetry.fields.root)
					})
				)
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignFence: ChangeSet.empty(assignGraph).insert(AssignEnded, []).insert(AssignFenced, []),
	assignRefuse: ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignFailed, [])
		.insert(AssignHeld, [])
		.insert(AssignRefusal, []),
	assignExhaust: ChangeSet.empty(assignGraph)
		.insert(AssignResult, [])
		.insert(AssignFailed, [])
		.insert(AssignHeld, [])
		.insert(AssignExhausted, []),
	assignAdmit: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignAdmitted, [])
			.insert(AssignFinish, [])
			.insert(AssignStartStep, [])
			.insert(AssignScope, [])
			.insert(assign_embed_input_kmlepfpdepkmo, [])
			.insert(assign_embed_input_near_dhffcaodkgemm, [])
			.insert(assign_embed_input_exclude_gcjikbkjkcefj, [])
			.insert(assign_embed_input_mode_nearest_bdiihcbmhfojp, [])
			.insert(assign_embed_input_mode_within_oiehjhalkkkfi, [])
			.insert(assign_decide_input_ffhdojphbdjfc, [])
			.insert(assign_decide_input_exclude_bpjgmijefddch, [])
			.insert(assign_decide_input_mode_nearest_ijgbegdphofca, [])
			.insert(assign_decide_input_mode_within_fgbilcoafbdcg, [])
			.insert(
				AssignStep,
				query(assignGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: AssignStep.fields.step,
						kind: AssignStep.fields.kind,
						scope: AssignStep.fields.scope,
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
						root: r.param("root", AssignStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignSkip: ChangeSet.empty(assignGraph).insert(AssignSkipped, []),
	assignSkippedOf: query(assignGraph).rule((r) => {
		const { root, scope, by } = v(AssignSkipped, "assignSkipped")
		return r
			.match(AssignSkipped, { root, scope, by })
			.where(
				r.eq(root, r.param("root", AssignSkipped.fields.root)),
				r.eq(scope, r.param("scope", AssignSkipped.fields.scope))
			)
			.find({ root, scope, by })
	}),
	assignStepOf: query(assignGraph).rule((r) => {
		const { root, step, kind, scope, due } = v(AssignStep, "assignStep")
		return r
			.match(AssignStep, { root, step, kind, scope, due })
			.where(
				r.eq(root, r.param("root", AssignStep.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ root, step, kind, scope, due })
	}),
	assignResultOf: query(assignGraph).rule((r) => {
		const { root, step, outcome } = v(AssignResult, "assignResult")
		return r
			.match(AssignResult, { root, step, outcome })
			.where(
				r.eq(root, r.param("root", AssignResult.fields.root)),
				r.eq(step, r.param("step", AssignResult.fields.step))
			)
			.find({ root, step, outcome })
	}),
	assignHeldOf: query(assignGraph).rule((r) => {
		const { root, step, attempt } = v(AssignHeld, "assignHeld")
		return r
			.match(AssignHeld, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", AssignHeld.fields.root)),
				r.eq(step, r.param("step", AssignHeld.fields.step))
			)
			.find({ root, step, attempt })
	}),
	assignAdmittedOf: query(assignGraph).rule((r) => {
		const { root, scope } = v(AssignAdmitted, "assignAdmitted")
		return r
			.match(AssignAdmitted, { root, scope })
			.where(
				r.eq(root, r.param("root", AssignAdmitted.fields.root)),
				r.eq(scope, r.param("scope", AssignAdmitted.fields.scope))
			)
			.find({ root, scope })
	}),
	assignRootOf: query(assignGraph).rule((r) => {
		const { kind, key, at } = v(AssignRoot, "root")
		const { scope } = v(AssignScope, "scope")
		return r
			.match(AssignRoot, { root: scope, kind, key, at })
			.match(AssignScope, { root: scope, scope })
			.where(r.eq(scope, r.param("root", AssignRoot.fields.root)))
			.find({ scope, kind, key, at })
	}),
	assignFinishedRoots: query(assignGraph)
		.rule((r) => {
			const { scope, step } = v(AssignFinish, "finish")
			return r
				.match(AssignFinish, { root: scope, scope, step })
				.match(AssignResult, { root: scope, step })
				.find({ scope })
		})
		.rule((r) => {
			const { scope } = v(AssignSkipped, "skipped")
			return r.match(AssignSkipped, { root: scope, scope }).find({ scope })
		}),
	assignClaimsOf: query(assignGraph).rule((r) => {
		const { root, step, attempt, until } = v(AssignClaim, "claim")
		return r
			.match(AssignClaim, { root, step, attempt, until })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ step, attempt, until })
	}),
	assignRetriesOf: query(assignGraph).rule((r) => {
		const { root, step, attempt, at, why } = v(AssignRetry, "retry")
		return r
			.match(AssignRetry, { root, step, attempt, at, why })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ step, attempt, at, why })
	}),
	assignFencedOf: query(assignGraph).rule((r) => {
		const { root, step, attempt } = v(AssignFenced, "fenced")
		return r
			.match(AssignFenced, { root, step, attempt })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(step, r.param("step", AssignStep.fields.step))
			)
			.find({ step, attempt })
	}),
	assignUnendedSteps: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, scope })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope)),
				r.not(AssignResult, { root, step }),
				r.not(AssignFinish, { root, scope, step })
			)
			.find({ step })
	}),
	assignFinished: query(assignGraph).rule((r) => {
		const { root, scope, step } = v(AssignFinish, "finish")
		return r
			.match(AssignFinish, { root, scope, step })
			.match(AssignResult, { root, step })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	}),
	assignPending: assignPendingRead,
	assignRequested: assignRequestedRead,
	assignRunning: assignRunningRead,
	assignSnapshot: query(AssignDen).reads({
		steps: assignPendingRead,
		claims: query(AssignDen).rule((r) => {
			const { root, step, attempt, until } = v(AssignClaim, "claim")
			return r
				.match(AssignClaim, { root, step, attempt, until })
				.where(r.not(AssignResult, { root, step }))
				.find({ step, attempt, until })
		}),
		retries: query(AssignDen).rule((r) => {
			const { root, step, attempt, at, why } = v(AssignRetry, "retry")
			return r
				.match(AssignRetry, { root, step, attempt, at, why })
				.where(r.not(AssignResult, { root, step }))
				.find({ step, attempt, at, why })
		}),
		fenced: query(AssignDen).rule((r) => {
			const { root, step, attempt } = v(AssignFenced, "fenced")
			return r
				.match(AssignFenced, { root, step, attempt })
				.where(r.not(AssignResult, { root, step }))
				.find({ step, attempt })
		}),
		requested: assignRequestedRead,
		running: assignRunningRead,
		roots: query(AssignDen).rule((r) => {
			const { kind, key, at } = v(AssignRoot, "root")
			const { scope } = v(AssignScope, "scope")
			return r
				.match(AssignRoot, { root: scope, kind, key, at })
				.match(AssignScope, { root: scope, scope })
				.find({ scope, kind, key, at })
		}),
		paused: query(AssignDen).rule((r) => {
			const { target, turn } = v(AssignPaused, "assignPaused")
			return r
				.match(AssignPaused, { target, turn })
				.where(r.not(AssignResumed, { target, turn }))
				.find({ target, turn })
		})
	}),
	assignReadassign_embed_input_kmlepfpdepkmo: query(assignGraph).rule((r) => {
		const { root, step, learner, topic, mode } = v(
			assign_embed_input_kmlepfpdepkmo,
			"assign_embed_input_kmlepfpdepkmo"
		)
		return r
			.match(assign_embed_input_kmlepfpdepkmo, { root, step, learner, topic, mode })
			.where(
				r.eq(root, r.param("root", assign_embed_input_kmlepfpdepkmo.fields.root)),
				r.eq(step, r.param("step", assign_embed_input_kmlepfpdepkmo.fields.step))
			)
			.find({ root, step, learner, topic, mode })
	}),
	assignReadassign_embed_input_mode_nearest_bdiihcbmhfojp: query(assignGraph).rule((r) => {
		const { root, step } = v(
			assign_embed_input_mode_nearest_bdiihcbmhfojp,
			"assign_embed_input_mode_nearest_bdiihcbmhfojp"
		)
		return r
			.match(assign_embed_input_mode_nearest_bdiihcbmhfojp, { root, step })
			.where(
				r.eq(root, r.param("root", assign_embed_input_mode_nearest_bdiihcbmhfojp.fields.root)),
				r.eq(step, r.param("step", assign_embed_input_mode_nearest_bdiihcbmhfojp.fields.step))
			)
			.find({ root, step })
	}),
	assignReadassign_embed_input_mode_within_oiehjhalkkkfi: query(assignGraph).rule((r) => {
		const { root, step, radius } = v(
			assign_embed_input_mode_within_oiehjhalkkkfi,
			"assign_embed_input_mode_within_oiehjhalkkkfi"
		)
		return r
			.match(assign_embed_input_mode_within_oiehjhalkkkfi, { root, step, radius })
			.where(
				r.eq(root, r.param("root", assign_embed_input_mode_within_oiehjhalkkkfi.fields.root)),
				r.eq(step, r.param("step", assign_embed_input_mode_within_oiehjhalkkkfi.fields.step))
			)
			.find({ root, step, radius })
	}),
	assignReadassign_embed_input_near_dhffcaodkgemm: query(assignGraph).rule((r) => {
		const { root, step, ordinal, value } = v(assign_embed_input_near_dhffcaodkgemm, "part")
		return r
			.match(assign_embed_input_near_dhffcaodkgemm, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", assign_embed_input_near_dhffcaodkgemm.fields.root)),
				r.eq(step, r.param("step", assign_embed_input_near_dhffcaodkgemm.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	assignReadassign_embed_input_exclude_gcjikbkjkcefj: query(assignGraph).rule((r) => {
		const { root, step, ordinal, value } = v(assign_embed_input_exclude_gcjikbkjkcefj, "part")
		return r
			.match(assign_embed_input_exclude_gcjikbkjkcefj, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", assign_embed_input_exclude_gcjikbkjkcefj.fields.root)),
				r.eq(step, r.param("step", assign_embed_input_exclude_gcjikbkjkcefj.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	assignReadassign_decide_input_ffhdojphbdjfc: query(assignGraph).rule((r) => {
		const { root, step, learner, topic, vector, mode } = v(
			assign_decide_input_ffhdojphbdjfc,
			"assign_decide_input_ffhdojphbdjfc"
		)
		return r
			.match(assign_decide_input_ffhdojphbdjfc, { root, step, learner, topic, vector, mode })
			.where(
				r.eq(root, r.param("root", assign_decide_input_ffhdojphbdjfc.fields.root)),
				r.eq(step, r.param("step", assign_decide_input_ffhdojphbdjfc.fields.step))
			)
			.find({ root, step, learner, topic, vector, mode })
	}),
	assignReadassign_decide_input_mode_nearest_ijgbegdphofca: query(assignGraph).rule((r) => {
		const { root, step } = v(
			assign_decide_input_mode_nearest_ijgbegdphofca,
			"assign_decide_input_mode_nearest_ijgbegdphofca"
		)
		return r
			.match(assign_decide_input_mode_nearest_ijgbegdphofca, { root, step })
			.where(
				r.eq(root, r.param("root", assign_decide_input_mode_nearest_ijgbegdphofca.fields.root)),
				r.eq(step, r.param("step", assign_decide_input_mode_nearest_ijgbegdphofca.fields.step))
			)
			.find({ root, step })
	}),
	assignReadassign_decide_input_mode_within_fgbilcoafbdcg: query(assignGraph).rule((r) => {
		const { root, step, radius } = v(
			assign_decide_input_mode_within_fgbilcoafbdcg,
			"assign_decide_input_mode_within_fgbilcoafbdcg"
		)
		return r
			.match(assign_decide_input_mode_within_fgbilcoafbdcg, { root, step, radius })
			.where(
				r.eq(root, r.param("root", assign_decide_input_mode_within_fgbilcoafbdcg.fields.root)),
				r.eq(step, r.param("step", assign_decide_input_mode_within_fgbilcoafbdcg.fields.step))
			)
			.find({ root, step, radius })
	}),
	assignReadassign_decide_input_exclude_bpjgmijefddch: query(assignGraph).rule((r) => {
		const { root, step, ordinal, value } = v(assign_decide_input_exclude_bpjgmijefddch, "part")
		return r
			.match(assign_decide_input_exclude_bpjgmijefddch, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", assign_decide_input_exclude_bpjgmijefddch.fields.root)),
				r.eq(step, r.param("step", assign_decide_input_exclude_bpjgmijefddch.fields.step))
			)
			.find({ root, step, ordinal, value })
	}),
	assignReadassign_assignment_input_kijoknpmnpomn: query(assignGraph).rule((r) => {
		const { root, scope, learner, topic, mode } = v(
			assign_assignment_input_kijoknpmnpomn,
			"assign_assignment_input_kijoknpmnpomn"
		)
		return r
			.match(assign_assignment_input_kijoknpmnpomn, { root, scope, learner, topic, mode })
			.where(
				r.eq(root, r.param("root", assign_assignment_input_kijoknpmnpomn.fields.root)),
				r.eq(scope, r.param("scope", assign_assignment_input_kijoknpmnpomn.fields.scope))
			)
			.find({ root, scope, learner, topic, mode })
	}),
	assignReadassign_assignment_input_mode_nearest_jdmfgbfmpepjd: query(assignGraph).rule((r) => {
		const { root, scope } = v(
			assign_assignment_input_mode_nearest_jdmfgbfmpepjd,
			"assign_assignment_input_mode_nearest_jdmfgbfmpepjd"
		)
		return r
			.match(assign_assignment_input_mode_nearest_jdmfgbfmpepjd, { root, scope })
			.where(
				r.eq(root, r.param("root", assign_assignment_input_mode_nearest_jdmfgbfmpepjd.fields.root)),
				r.eq(
					scope,
					r.param("scope", assign_assignment_input_mode_nearest_jdmfgbfmpepjd.fields.scope)
				)
			)
			.find({ root, scope })
	}),
	assignReadassign_assignment_input_mode_within_iahlinklmdadj: query(assignGraph).rule((r) => {
		const { root, scope, radius } = v(
			assign_assignment_input_mode_within_iahlinklmdadj,
			"assign_assignment_input_mode_within_iahlinklmdadj"
		)
		return r
			.match(assign_assignment_input_mode_within_iahlinklmdadj, { root, scope, radius })
			.where(
				r.eq(root, r.param("root", assign_assignment_input_mode_within_iahlinklmdadj.fields.root)),
				r.eq(
					scope,
					r.param("scope", assign_assignment_input_mode_within_iahlinklmdadj.fields.scope)
				)
			)
			.find({ root, scope, radius })
	}),
	assignReadassign_assignment_input_near_acilimddcfjog: query(assignGraph).rule((r) => {
		const { root, scope, ordinal, value } = v(assign_assignment_input_near_acilimddcfjog, "part")
		return r
			.match(assign_assignment_input_near_acilimddcfjog, { root, scope, ordinal, value })
			.where(
				r.eq(root, r.param("root", assign_assignment_input_near_acilimddcfjog.fields.root)),
				r.eq(scope, r.param("scope", assign_assignment_input_near_acilimddcfjog.fields.scope))
			)
			.find({ root, scope, ordinal, value })
	}),
	assignReadassign_assignment_input_exclude_paaebdpkimebl: query(assignGraph).rule((r) => {
		const { root, scope, ordinal, value } = v(assign_assignment_input_exclude_paaebdpkimebl, "part")
		return r
			.match(assign_assignment_input_exclude_paaebdpkimebl, { root, scope, ordinal, value })
			.where(
				r.eq(root, r.param("root", assign_assignment_input_exclude_paaebdpkimebl.fields.root)),
				r.eq(scope, r.param("scope", assign_assignment_input_exclude_paaebdpkimebl.fields.scope))
			)
			.find({ root, scope, ordinal, value })
	}),
	assignRequestAssignment: clocked(
		ChangeSet.empty(assignGraph)
			.insert(
				AssignScope,
				query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignScope", {
						root: AssignScope.fields.root,
						scope: AssignScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				assign_assignment_input_kijoknpmnpomn,
				query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentassign_assignment_input_kijoknpmnpomn", {
						root: assign_assignment_input_kijoknpmnpomn.fields.root,
						scope: assign_assignment_input_kijoknpmnpomn.fields.scope,
						learner: assign_assignment_input_kijoknpmnpomn.fields.learner,
						topic: assign_assignment_input_kijoknpmnpomn.fields.topic,
						mode: assign_assignment_input_kijoknpmnpomn.fields.mode
					})
					const { root, scope, learner, topic, mode } = v(requested, "requested")
					return r
						.match(requested, { root, scope, learner, topic, mode })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, learner, topic, mode })
				})
			)
			.insert(
				assign_assignment_input_near_acilimddcfjog,
				query(assignGraph).rule((r) => {
					const requested = r.relation(
						"assignAssignmentassign_assignment_input_near_acilimddcfjog",
						{
							root: assign_assignment_input_near_acilimddcfjog.fields.root,
							scope: assign_assignment_input_near_acilimddcfjog.fields.scope,
							ordinal: assign_assignment_input_near_acilimddcfjog.fields.ordinal,
							value: assign_assignment_input_near_acilimddcfjog.fields.value
						}
					)
					const { root, scope, ordinal, value } = v(requested, "requested")
					return r
						.match(requested, { root, scope, ordinal, value })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, ordinal, value })
				})
			)
			.insert(
				assign_assignment_input_exclude_paaebdpkimebl,
				query(assignGraph).rule((r) => {
					const requested = r.relation(
						"assignAssignmentassign_assignment_input_exclude_paaebdpkimebl",
						{
							root: assign_assignment_input_exclude_paaebdpkimebl.fields.root,
							scope: assign_assignment_input_exclude_paaebdpkimebl.fields.scope,
							ordinal: assign_assignment_input_exclude_paaebdpkimebl.fields.ordinal,
							value: assign_assignment_input_exclude_paaebdpkimebl.fields.value
						}
					)
					const { root, scope, ordinal, value } = v(requested, "requested")
					return r
						.match(requested, { root, scope, ordinal, value })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, ordinal, value })
				})
			)
			.insert(
				assign_assignment_input_mode_nearest_jdmfgbfmpepjd,
				query(assignGraph).rule((r) => {
					const requested = r.relation(
						"assignAssignmentassign_assignment_input_mode_nearest_jdmfgbfmpepjd",
						{
							root: assign_assignment_input_mode_nearest_jdmfgbfmpepjd.fields.root,
							scope: assign_assignment_input_mode_nearest_jdmfgbfmpepjd.fields.scope
						}
					)
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope })
				})
			)
			.insert(
				assign_assignment_input_mode_within_iahlinklmdadj,
				query(assignGraph).rule((r) => {
					const requested = r.relation(
						"assignAssignmentassign_assignment_input_mode_within_iahlinklmdadj",
						{
							root: assign_assignment_input_mode_within_iahlinklmdadj.fields.root,
							scope: assign_assignment_input_mode_within_iahlinklmdadj.fields.scope,
							radius: assign_assignment_input_mode_within_iahlinklmdadj.fields.radius
						}
					)
					const { root, scope, radius } = v(requested, "requested")
					return r
						.match(requested, { root, scope, radius })
						.where(r.not(AssignRoot, { root }))
						.find({ root, scope, radius })
				})
			)
			.insert(
				AssignRequestedWith,
				query(assignGraph)
					.rule((r) => {
						const requested = r.relation("assignAssignmentAssignRequestedWith", {
							root: AssignRequestedWith.fields.root,
							fingerprint: AssignRequestedWith.fields.fingerprint,
							input: AssignRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						return r
							.match(requested, { root, fingerprint, input })
							.where(r.not(AssignRoot, { root }))
							.find({ root, fingerprint, input })
					})
					.rule((r) => {
						const requested = r.relation("assignAssignmentAssignRequestedWith", {
							root: AssignRequestedWith.fields.root,
							fingerprint: AssignRequestedWith.fields.fingerprint,
							input: AssignRequestedWith.fields.input
						})
						const { root, fingerprint, input } = v(requested, "requested")
						const { input: held } = v(AssignRequestedWith, "held")
						return r
							.match(requested, { root, fingerprint, input })
							.match(AssignRequestedWith, { root, fingerprint, input: held })
							.find({ root, fingerprint, input })
					})
			)
			.insert(
				AssignRoot,
				query(assignGraph).rule((r) => {
					const requested = r.relation("assignAssignmentAssignScope", {
						root: AssignScope.fields.root,
						scope: AssignScope.fields.scope
					})
					const { root, scope } = v(requested, "requested")
					return r
						.match(requested, { root, scope })
						.where(
							r.eq(scope, root),
							r.eq(root, r.param("assignAssignmentScope", AssignRoot.fields.root)),
							r.not(AssignRoot, { root })
						)
						.find({
							root,
							kind: AssignRootKind.handle("Assignment"),
							key: r.param("assignAssignmentKey", AssignRoot.fields.key),
							at: r.param("denNow", AssignRoot.fields.at)
						})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignOutputsAssignmentDecide: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		const { confidence, stage } = v(assign_decide_output_fkgbaoobeoima, "output")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_output_fkgbaoobeoima, { root, step, confidence, stage })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, confidence, stage })
	}),
	assignOutputsAssignmentDecideWeighed: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		const { ordinal, passage, distance, passed } = v(
			assign_decide_output_weighed_gpdibcghlfbhb,
			"part"
		)
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_output_weighed_gpdibcghlfbhb, {
				root,
				step,
				ordinal,
				passage,
				distance,
				passed
			})
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, ordinal, passage, distance, passed })
	}),
	assignOutputsAssignmentDecideStageServe: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		const { passage, distance } = v(assign_decide_output_stage_serve_chfjeagmkjoef, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_output_stage_serve_chfjeagmkjoef, { root, step, passage, distance })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, passage, distance })
	}),
	assignOutputsAssignmentDecideStageRest: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_output_stage_rest_gohjkdlkfnkca, { root, step })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	}),
	assignInputsAssignmentDecide: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		const { learner, topic, vector, mode } = v(assign_decide_input_ffhdojphbdjfc, "input")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_input_ffhdojphbdjfc, { root, step, learner, topic, vector, mode })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, learner, topic, vector, mode })
	}),
	assignInputsAssignmentDecideExclude: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		const { ordinal, value } = v(assign_decide_input_exclude_bpjgmijefddch, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_input_exclude_bpjgmijefddch, { root, step, ordinal, value })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, ordinal, value })
	}),
	assignInputsAssignmentDecideModeNearest: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_input_mode_nearest_ijgbegdphofca, { root, step })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	}),
	assignInputsAssignmentDecideModeWithin: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		const { radius } = v(assign_decide_input_mode_within_fgbilcoafbdcg, "part")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(assign_decide_input_mode_within_fgbilcoafbdcg, { root, step, radius })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step, radius })
	}),
	assignFailuresAssignmentDecide: query(assignGraph).rule((r) => {
		const { root, step, scope } = v(AssignStep, "step")
		return r
			.match(AssignStep, { root, step, kind: "Decide", scope })
			.match(AssignResult, { root, step, outcome: "failed" })
			.where(
				r.eq(root, r.param("root", AssignScope.fields.root)),
				r.eq(scope, r.param("scope", AssignScope.fields.scope))
			)
			.find({ step })
	})
})

export const assignDenWorkload = workload(AssignDen, assignDenPrograms)

export const assignCoordinatorPrograms = Object.freeze({
	assignPromote: clocked(
		ChangeSet.empty(assignCoordination).insert(
			AssignServed,
			query(assignCoordination).rule((r) =>
				r.find({
					environment: r.param("environment", AssignServed.fields.environment),
					at: r.param("denNow", AssignServed.fields.at),
					deployment: r.param("deployment", AssignServed.fields.deployment)
				})
			)
		),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignPause: ChangeSet.empty(assignCoordination).insert(AssignPaused, []),
	assignResume: ChangeSet.empty(assignCoordination).insert(AssignResumed, []),
	assignPauseTurns: query(assignCoordination).rule((r) => {
		const { target, turn } = v(AssignPaused, "assignPaused")
		return r.match(AssignPaused, { target, turn }).find({ target, turn: r.max(turn) })
	}),
	assignPausedAll: query(assignCoordination).rule((r) => {
		const { target, turn } = v(AssignPaused, "assignPaused")
		return r
			.match(AssignPaused, { target, turn })
			.where(r.not(AssignResumed, { target, turn }))
			.find({ target, turn })
	})
})

export const assignCoordinatorWorkload = workload(AssignCoordinator, assignCoordinatorPrograms)

/** den's retiring role for the flow Assign: it clears finished roots' graphs, deleting every row of a root's graph but its record, under its root, and writes nothing else. */
export const AssignRetirer = role(
	App,
	"assign_retirer",
	{ ...assignGraph.relations },
	{
		write: [
			"AssignScope",
			"AssignAdmitted",
			"AssignSkipped",
			"AssignStep",
			"AssignStartStep",
			"AssignFinish",
			"AssignClaim",
			"AssignEnded",
			"AssignRetry",
			"AssignFenced",
			"AssignResult",
			"AssignDone",
			"AssignFailed",
			"AssignHeld",
			"AssignRefusal",
			"AssignExhausted",
			"assign_embed_input_kmlepfpdepkmo",
			"assign_embed_input_near_dhffcaodkgemm",
			"assign_embed_input_exclude_gcjikbkjkcefj",
			"assign_embed_input_mode_nearest_bdiihcbmhfojp",
			"assign_embed_input_mode_within_oiehjhalkkkfi",
			"assign_decide_input_ffhdojphbdjfc",
			"assign_decide_input_exclude_bpjgmijefddch",
			"assign_decide_input_mode_nearest_ijgbegdphofca",
			"assign_decide_input_mode_within_fgbilcoafbdcg",
			"assign_assignment_input_kijoknpmnpomn",
			"assign_assignment_input_near_acilimddcfjog",
			"assign_assignment_input_exclude_paaebdpkimebl",
			"assign_assignment_input_mode_nearest_jdmfgbfmpepjd",
			"assign_assignment_input_mode_within_iahlinklmdadj",
			"assign_embed_output_ghdpbieopfmkd",
			"assign_decide_output_fkgbaoobeoima",
			"assign_decide_output_weighed_gpdibcghlfbhb",
			"assign_decide_output_stage_serve_chfjeagmkjoef",
			"assign_decide_output_stage_rest_gohjkdlkfnkca",
			"assign_assignment_finish_output_dehjnhpeahpgb",
			"assign_asked_fobgfofknpfgd",
			"assign_decide_read_nearest_mlemoegfgpbbi",
			"assign_decide_read_seen_oahojgbpphboo"
		]
	}
)

export const assignRetirerPrograms = Object.freeze({
	assignRetire: ChangeSet.empty(assignGraph).deleteWhere({
		AssignScope: { root: param("root", AssignRoot.fields.root) },
		AssignAdmitted: { root: param("root", AssignRoot.fields.root) },
		AssignSkipped: { root: param("root", AssignRoot.fields.root) },
		AssignStep: { root: param("root", AssignRoot.fields.root) },
		AssignStartStep: { root: param("root", AssignRoot.fields.root) },
		AssignFinish: { root: param("root", AssignRoot.fields.root) },
		AssignClaim: { root: param("root", AssignRoot.fields.root) },
		AssignEnded: { root: param("root", AssignRoot.fields.root) },
		AssignRetry: { root: param("root", AssignRoot.fields.root) },
		AssignFenced: { root: param("root", AssignRoot.fields.root) },
		AssignResult: { root: param("root", AssignRoot.fields.root) },
		AssignDone: { root: param("root", AssignRoot.fields.root) },
		AssignFailed: { root: param("root", AssignRoot.fields.root) },
		AssignHeld: { root: param("root", AssignRoot.fields.root) },
		AssignRefusal: { root: param("root", AssignRoot.fields.root) },
		AssignExhausted: { root: param("root", AssignRoot.fields.root) },
		assign_embed_input_kmlepfpdepkmo: { root: param("root", AssignRoot.fields.root) },
		assign_embed_input_near_dhffcaodkgemm: { root: param("root", AssignRoot.fields.root) },
		assign_embed_input_exclude_gcjikbkjkcefj: { root: param("root", AssignRoot.fields.root) },
		assign_embed_input_mode_nearest_bdiihcbmhfojp: { root: param("root", AssignRoot.fields.root) },
		assign_embed_input_mode_within_oiehjhalkkkfi: { root: param("root", AssignRoot.fields.root) },
		assign_decide_input_ffhdojphbdjfc: { root: param("root", AssignRoot.fields.root) },
		assign_decide_input_exclude_bpjgmijefddch: { root: param("root", AssignRoot.fields.root) },
		assign_decide_input_mode_nearest_ijgbegdphofca: { root: param("root", AssignRoot.fields.root) },
		assign_decide_input_mode_within_fgbilcoafbdcg: { root: param("root", AssignRoot.fields.root) },
		assign_assignment_input_kijoknpmnpomn: { root: param("root", AssignRoot.fields.root) },
		assign_assignment_input_near_acilimddcfjog: { root: param("root", AssignRoot.fields.root) },
		assign_assignment_input_exclude_paaebdpkimebl: { root: param("root", AssignRoot.fields.root) },
		assign_assignment_input_mode_nearest_jdmfgbfmpepjd: {
			root: param("root", AssignRoot.fields.root)
		},
		assign_assignment_input_mode_within_iahlinklmdadj: {
			root: param("root", AssignRoot.fields.root)
		},
		assign_embed_output_ghdpbieopfmkd: { root: param("root", AssignRoot.fields.root) },
		assign_decide_output_fkgbaoobeoima: { root: param("root", AssignRoot.fields.root) },
		assign_decide_output_weighed_gpdibcghlfbhb: { root: param("root", AssignRoot.fields.root) },
		assign_decide_output_stage_serve_chfjeagmkjoef: { root: param("root", AssignRoot.fields.root) },
		assign_decide_output_stage_rest_gohjkdlkfnkca: { root: param("root", AssignRoot.fields.root) },
		assign_assignment_finish_output_dehjnhpeahpgb: { root: param("root", AssignRoot.fields.root) },
		assign_asked_fobgfofknpfgd: { root: param("root", AssignRoot.fields.root) },
		assign_decide_read_nearest_mlemoegfgpbbi: { root: param("root", AssignRoot.fields.root) },
		assign_decide_read_seen_oahojgbpphboo: { root: param("root", AssignRoot.fields.root) }
	})
})

export const assignRetirerWorkload = workload(AssignRetirer, assignRetirerPrograms)

/** The commits and declared reads of the flow Assign, over its app role Loader, and a read of the database's instant that says the role's login is let in. */
export const assignCommitPrograms = Object.freeze({
	assignAuthenticated: clocked(
		query(assignGraph).rule((r) => r.find({ now: r.param("denNow", DenInstant) })),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignCommitEmbed: clocked(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(assign_embed_output_ghdpbieopfmkd, [])
			.insert(AssignScope, [])
			.insert(AssignAdmitted, [])
			.insert(AssignFinish, [])
			.insert(AssignStartStep, [])
			.insert(assign_embed_input_kmlepfpdepkmo, [])
			.insert(assign_embed_input_near_dhffcaodkgemm, [])
			.insert(assign_embed_input_exclude_gcjikbkjkcefj, [])
			.insert(assign_embed_input_mode_nearest_bdiihcbmhfojp, [])
			.insert(assign_embed_input_mode_within_oiehjhalkkkfi, [])
			.insert(assign_decide_input_ffhdojphbdjfc, [])
			.insert(assign_decide_input_exclude_bpjgmijefddch, [])
			.insert(assign_decide_input_mode_nearest_ijgbegdphofca, [])
			.insert(assign_decide_input_mode_within_fgbilcoafbdcg, [])
			.insert(assign_asked_fobgfofknpfgd, [])
			.insert(
				AssignStep,
				query(assignGraph).rule((r) => {
					const steps = r.relation("steps", {
						step: AssignStep.fields.step,
						kind: AssignStep.fields.kind,
						scope: AssignStep.fields.scope,
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
						root: r.param("root", AssignStep.fields.root)
					})
				})
			),
		{ denNow: "millis" },
		{ denNow: denInstantKey }
	),
	assignCommitDecide: ChangeSet.union(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(assign_decide_output_fkgbaoobeoima, [])
			.insert(assign_decide_output_weighed_gpdibcghlfbhb, [])
			.insert(assign_decide_output_stage_serve_chfjeagmkjoef, [])
			.insert(assign_decide_output_stage_rest_gohjkdlkfnkca, [])
			.insert(assign_decide_read_nearest_mlemoegfgpbbi, [])
			.insert(assign_decide_read_seen_oahojgbpphboo, [])
			.insertAll(recordsFacts(assignGraph, assign_decide_read_nearest_mlemoegfgpbbiRecords)([]))
			.insertAll(recordsFacts(assignGraph, assign_decide_read_seen_oahojgbpphbooRecords)([])),
		declaredFlow.kinds[1].writes.changes(Loader)
	),
	assignReadDecide: query(Loader).reads(declaredFlow.kinds[1].reads.named),
	assignCommitAssignmentFinish: ChangeSet.union(
		ChangeSet.empty(assignGraph)
			.insert(AssignResult, [])
			.insert(AssignDone, [])
			.insert(AssignHeld, [])
			.insert(assign_assignment_finish_output_dehjnhpeahpgb, []),
		declaredFlow.kinds[2].finish.writes.changes(Loader)
	)
})

export const assignCommits = workload(Loader, assignCommitPrograms)
