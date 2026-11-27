import { DenEnvironment, DenInstant, Text } from "@bjornpagen/den/lower/keys"
/** The fragment den lowered the flow Retry to; `den generate` writes it, and nothing edits it. */
import {
	closed,
	closedId,
	contained,
	fragment,
	key,
	mutable,
	natural,
	on,
	place,
	pred,
	relation,
	select,
	sha256,
	unit
} from "@bjornpagen/grizzle"

export const RetryKind = closed.unordered("RetryKind", [
	"Steadfast",
	"Brittle",
	"Polite",
	"Patient",
	"LaddersFinish",
	"ThrottledFinish",
	"UnhurriedFinish"
])
export const RetryRootKind = closed.unordered("RetryRootKind", [
	"Ladders",
	"Throttled",
	"Unhurried"
])
export const RetryOutcome = closed.unordered("RetryOutcome", ["done", "failed"])
export const RetryRetryWhy = closed.unordered("RetryRetryWhy", ["spent", "transient", "later"])
export const RetryPausable = closed.unordered("RetryPausable", [
	"Ladders",
	"Throttled",
	"Unhurried"
])

export const RetryScope = relation("RetryScope", { root: sha256, scope: sha256 }, ["root", "scope"])
export const RetryRoot = relation(
	"RetryRoot",
	{ root: sha256, kind: closedId(RetryRootKind), key: Text, at: DenInstant },
	["root"]
)
export const RetryRequestedWith = relation(
	"RetryRequestedWith",
	{ root: sha256, fingerprint: sha256, input: sha256 },
	["root"]
)
export const RetryAdmitted = relation("RetryAdmitted", { root: sha256, scope: sha256 }, [
	"root",
	"scope"
])
export const RetrySkipped = relation("RetrySkipped", { root: sha256, scope: sha256, by: sha256 }, [
	"root",
	"scope"
])
export const RetryStep = relation(
	"RetryStep",
	{ root: sha256, step: sha256, kind: closedId(RetryKind), scope: sha256, due: DenInstant },
	["root", "step"]
)
export const RetryStartStep = relation(
	"RetryStartStep",
	{ root: sha256, scope: sha256, ordinal: natural, step: sha256 },
	["root", "scope", "ordinal"]
)
export const RetryFinish = relation("RetryFinish", { root: sha256, scope: sha256, step: sha256 }, [
	"root",
	"scope"
])
export const RetryClaim = relation(
	"RetryClaim",
	{ root: sha256, step: sha256, attempt: place, until: DenInstant },
	["root", "step", "attempt"]
)
export const RetryEnded = relation("RetryEnded", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step",
	"attempt"
])
export const RetryRetry = relation(
	"RetryRetry",
	{ root: sha256, step: sha256, attempt: natural, at: DenInstant, why: closedId(RetryRetryWhy) },
	["root", "step", "attempt"]
)
export const RetryFenced = relation(
	"RetryFenced",
	{ root: sha256, step: sha256, attempt: natural },
	["root", "step", "attempt"]
)
export const RetryResult = relation(
	"RetryResult",
	{ root: sha256, step: sha256, outcome: closedId(RetryOutcome) },
	["root", "step"]
)
export const RetryDone = relation("RetryDone", { root: sha256, step: sha256 }, ["root", "step"])
export const RetryFailed = relation("RetryFailed", { root: sha256, step: sha256 }, ["root", "step"])
export const RetryHeld = relation("RetryHeld", { root: sha256, step: sha256, attempt: natural }, [
	"root",
	"step"
])
export const RetryRefusal = relation("RetryRefusal", { root: sha256, step: sha256, law: Text }, [
	"root",
	"step"
])
export const RetryExhausted = relation("RetryExhausted", { root: sha256, step: sha256 }, [
	"root",
	"step"
])
export const retry_steadfast_input_ebanfagjeadim = relation(
	"retry_steadfast_input_ebanfagjeadim",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_brittle_input_jbcpaiekdedpp = relation(
	"retry_brittle_input_jbcpaiekdedpp",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_polite_input_iopjdjgdhfide = relation(
	"retry_polite_input_iopjdjgdhfide",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_patient_input_ndliolfjpjnoc = relation(
	"retry_patient_input_ndliolfjpjnoc",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_ladders_input_fkbbgblmfmhbi = relation(
	"retry_ladders_input_fkbbgblmfmhbi",
	{ root: sha256, scope: sha256, steadfast: Text, brittle: Text },
	["root", "scope"]
)
export const retry_throttled_input_bfjgfamhjmgcd = relation(
	"retry_throttled_input_bfjgfamhjmgcd",
	{ root: sha256, scope: sha256, key: Text },
	["root", "scope"]
)
export const retry_unhurried_input_mccbdnleajjif = relation(
	"retry_unhurried_input_mccbdnleajjif",
	{ root: sha256, scope: sha256, key: Text },
	["root", "scope"]
)
export const retry_steadfast_output_aacklbgjpefbn = relation(
	"retry_steadfast_output_aacklbgjpefbn",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_brittle_output_bajcdgadpoeak = relation(
	"retry_brittle_output_bajcdgadpoeak",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_polite_output_nicaghgpaemah = relation(
	"retry_polite_output_nicaghgpaemah",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_patient_output_geoaicaaojcfl = relation(
	"retry_patient_output_geoaicaaojcfl",
	{ root: sha256, step: sha256, key: Text },
	["root", "step"]
)
export const retry_ladders_finish_output_pgebkobjaoiih = relation(
	"retry_ladders_finish_output_pgebkobjaoiih",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const retry_throttled_finish_output_plgallgljmddo = relation(
	"retry_throttled_finish_output_plgallgljmddo",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const retry_unhurried_finish_output_oipogmdgcfehf = relation(
	"retry_unhurried_finish_output_oipogmdgcfehf",
	{ root: sha256, step: sha256 },
	["root", "step"]
)
export const RetryPaused = relation(
	"RetryPaused",
	{ target: closedId(RetryPausable), turn: natural },
	["target", "turn"]
)
export const RetryResumed = relation(
	"RetryResumed",
	{ target: closedId(RetryPausable), turn: natural },
	["target", "turn"]
)
export const RetryServed = relation(
	"RetryServed",
	{ environment: DenEnvironment, at: DenInstant, deployment: Text },
	["environment", "at"]
)

/** The flow's graph: its rosters, its graph relations and their laws, which den's role and its app role `loader` hold whole. */
export const retryGraph = fragment(
	[
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
		retry_steadfast_input_ebanfagjeadim,
		retry_brittle_input_jbcpaiekdedpp,
		retry_polite_input_iopjdjgdhfide,
		retry_patient_input_ndliolfjpjnoc,
		retry_ladders_input_fkbbgblmfmhbi,
		retry_throttled_input_bfjgfamhjmgcd,
		retry_unhurried_input_mccbdnleajjif,
		retry_steadfast_output_aacklbgjpefbn,
		retry_brittle_output_bajcdgadpoeak,
		retry_polite_output_nicaghgpaemah,
		retry_patient_output_geoaicaaojcfl,
		retry_ladders_finish_output_pgebkobjaoiih,
		retry_throttled_finish_output_plgallgljmddo,
		retry_unhurried_finish_output_oipogmdgcfehf
	],
	[
		unit("DenRoot", { root: sha256 }),
		key(on(RetryScope, "scope")),
		key(on(RetryStep, "step")),
		contained(on(RetryAdmitted, "root", "scope"), on(RetryScope, "root", "scope")),
		contained(on(RetrySkipped, "scope"), on(RetryRoot, "root")),
		contained(on(RetrySkipped, "by"), on(RetryRoot, "root")),
		contained(on(RetryRequestedWith, "root"), on(RetryRoot, "root")),
		contained(on(RetryStep, "root", "scope"), on(RetryAdmitted, "root", "scope")),
		contained(on(RetryStartStep, "root", "scope"), on(RetryAdmitted, "root", "scope")),
		contained(on(RetryStartStep, "root", "step"), on(RetryStep, "root", "step")),
		key(on(RetryStartStep, "root", "step")),
		contained(on(RetryFinish, "root", "scope"), on(RetryAdmitted, "root", "scope")),
		contained(on(RetryFinish, "root", "step"), on(RetryStep, "root", "step")),
		key(on(RetryFinish, "root", "step")),
		contained(on(RetryClaim, "root", "step"), on(RetryStep, "root", "step")),
		contained(on(RetryEnded, "root", "step", "attempt"), on(RetryClaim, "root", "step", "attempt")),
		contained(
			on(
				select(RetryClaim, (row) => row.ge(row.attempt, 1n)),
				"root",
				"step",
				pred("attempt")
			),
			on(RetryEnded, "root", "step", "attempt")
		),
		contained(on(RetryRetry, "root", "step", "attempt"), on(RetryEnded, "root", "step", "attempt")),
		contained(
			on(RetryFenced, "root", "step", "attempt"),
			on(RetryEnded, "root", "step", "attempt")
		),
		contained(on(RetryResult, "root", "step"), on(RetryStep, "root", "step")),
		contained(on(RetryHeld, "root", "step", "attempt"), on(RetryClaim, "root", "step", "attempt")),
		contained(on(RetryHeld, "root", "step"), on(RetryResult, "root", "step")),
		contained(
			on(RetryDone, "root", "step"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "done")),
				"root",
				"step"
			)
		),
		contained(
			on(RetryFailed, "root", "step"),
			on(
				select(RetryResult, (row) => row.eq(row.outcome, "failed")),
				"root",
				"step"
			)
		),
		contained(on(RetryRefusal, "root", "step"), on(RetryFailed, "root", "step")),
		contained(on(RetryExhausted, "root", "step"), on(RetryFailed, "root", "step")),
		contained(
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"root"
			),
			on(RetryRequestedWith, "root")
		),
		contained(
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"root"
			),
			on(RetryRequestedWith, "root")
		),
		contained(
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Unhurried")),
				"root"
			),
			on(RetryRequestedWith, "root")
		),
		contained(
			on(retry_steadfast_input_ebanfagjeadim, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Steadfast")),
				"root",
				"step"
			)
		),
		contained(
			on(retry_brittle_input_jbcpaiekdedpp, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Brittle")),
				"root",
				"step"
			)
		),
		contained(
			on(retry_polite_input_iopjdjgdhfide, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Polite")),
				"root",
				"step"
			)
		),
		contained(
			on(retry_patient_input_ndliolfjpjnoc, "root", "step"),
			on(
				select(RetryStep, (row) => row.eq(row.kind, "Patient")),
				"root",
				"step"
			)
		),
		contained(
			on(retry_ladders_input_fkbbgblmfmhbi, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Ladders")),
				"root"
			)
		),
		contained(
			on(retry_throttled_input_bfjgfamhjmgcd, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Throttled")),
				"root"
			)
		),
		contained(
			on(retry_unhurried_input_mccbdnleajjif, "scope"),
			on(
				select(RetryRoot, (row) => row.eq(row.kind, "Unhurried")),
				"root"
			)
		),
		contained(
			on(retry_steadfast_output_aacklbgjpefbn, "root", "step"),
			on(retry_steadfast_input_ebanfagjeadim, "root", "step")
		),
		contained(
			on(retry_steadfast_output_aacklbgjpefbn, "root", "step"),
			on(RetryDone, "root", "step")
		),
		contained(
			on(retry_brittle_output_bajcdgadpoeak, "root", "step"),
			on(retry_brittle_input_jbcpaiekdedpp, "root", "step")
		),
		contained(
			on(retry_brittle_output_bajcdgadpoeak, "root", "step"),
			on(RetryDone, "root", "step")
		),
		contained(
			on(retry_polite_output_nicaghgpaemah, "root", "step"),
			on(retry_polite_input_iopjdjgdhfide, "root", "step")
		),
		contained(on(retry_polite_output_nicaghgpaemah, "root", "step"), on(RetryDone, "root", "step")),
		contained(
			on(retry_patient_output_geoaicaaojcfl, "root", "step"),
			on(retry_patient_input_ndliolfjpjnoc, "root", "step")
		),
		contained(
			on(retry_patient_output_geoaicaaojcfl, "root", "step"),
			on(RetryDone, "root", "step")
		),
		contained(
			on(retry_ladders_finish_output_pgebkobjaoiih, "root", "step"),
			on(RetryDone, "root", "step")
		),
		contained(
			on(retry_throttled_finish_output_plgallgljmddo, "root", "step"),
			on(RetryDone, "root", "step")
		),
		contained(
			on(retry_unhurried_finish_output_oipogmdgcfehf, "root", "step"),
			on(RetryDone, "root", "step")
		),
		contained(on(RetryScope, "root"), on(RetryRoot, "root")),
		mutable(RetryScope),
		mutable(RetryAdmitted),
		contained(on(RetrySkipped, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetrySkipped),
		contained(on(RetryStep, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryStep),
		contained(on(RetryStartStep, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryStartStep),
		contained(on(RetryFinish, "root", "scope"), on(RetryScope, "root", "scope")),
		mutable(RetryFinish),
		mutable(RetryClaim),
		contained(on(RetryEnded, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryEnded),
		contained(on(RetryRetry, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryRetry),
		contained(on(RetryFenced, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryFenced),
		mutable(RetryResult),
		contained(on(RetryDone, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryDone),
		contained(on(RetryFailed, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryFailed),
		contained(on(RetryHeld, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryHeld),
		contained(on(RetryRefusal, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryRefusal),
		contained(on(RetryExhausted, "root", "step"), on(RetryStep, "root", "step")),
		mutable(RetryExhausted),
		contained(
			on(retry_steadfast_input_ebanfagjeadim, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_steadfast_input_ebanfagjeadim),
		contained(on(retry_brittle_input_jbcpaiekdedpp, "root", "step"), on(RetryStep, "root", "step")),
		mutable(retry_brittle_input_jbcpaiekdedpp),
		contained(on(retry_polite_input_iopjdjgdhfide, "root", "step"), on(RetryStep, "root", "step")),
		mutable(retry_polite_input_iopjdjgdhfide),
		contained(on(retry_patient_input_ndliolfjpjnoc, "root", "step"), on(RetryStep, "root", "step")),
		mutable(retry_patient_input_ndliolfjpjnoc),
		contained(
			on(retry_ladders_input_fkbbgblmfmhbi, "root", "scope"),
			on(RetryScope, "root", "scope")
		),
		mutable(retry_ladders_input_fkbbgblmfmhbi),
		contained(
			on(retry_throttled_input_bfjgfamhjmgcd, "root", "scope"),
			on(RetryScope, "root", "scope")
		),
		mutable(retry_throttled_input_bfjgfamhjmgcd),
		contained(
			on(retry_unhurried_input_mccbdnleajjif, "root", "scope"),
			on(RetryScope, "root", "scope")
		),
		mutable(retry_unhurried_input_mccbdnleajjif),
		contained(
			on(retry_steadfast_output_aacklbgjpefbn, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_steadfast_output_aacklbgjpefbn),
		contained(
			on(retry_brittle_output_bajcdgadpoeak, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_brittle_output_bajcdgadpoeak),
		contained(on(retry_polite_output_nicaghgpaemah, "root", "step"), on(RetryStep, "root", "step")),
		mutable(retry_polite_output_nicaghgpaemah),
		contained(
			on(retry_patient_output_geoaicaaojcfl, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_patient_output_geoaicaaojcfl),
		contained(
			on(retry_ladders_finish_output_pgebkobjaoiih, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_ladders_finish_output_pgebkobjaoiih),
		contained(
			on(retry_throttled_finish_output_plgallgljmddo, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_throttled_finish_output_plgallgljmddo),
		contained(
			on(retry_unhurried_finish_output_oipogmdgcfehf, "root", "step"),
			on(RetryStep, "root", "step")
		),
		mutable(retry_unhurried_finish_output_oipogmdgcfehf)
	]
)

/** The flow's coordination group: its rosters, its seat counts, and its chains of exclusivity seats and pauses, which den's coordinator role holds whole. */
export const retryCoordination = fragment(
	[
		RetryKind,
		RetryRootKind,
		RetryOutcome,
		RetryRetryWhy,
		RetryPausable,
		RetryPaused,
		RetryResumed,
		RetryServed
	],
	[
		contained(on(RetryResumed, "target", "turn"), on(RetryPaused, "target", "turn")),
		contained(on(RetryPaused, "target", pred("turn")), on(RetryResumed, "target", "turn"))
	]
)

/** The den relations the flow's app role `loader` inserts into: each step's commit's, and each app root's request's. */
export const retryWriter = [
	"RetryResult",
	"RetryDone",
	"RetryHeld",
	"retry_steadfast_output_aacklbgjpefbn",
	"retry_brittle_output_bajcdgadpoeak",
	"retry_polite_output_nicaghgpaemah",
	"retry_patient_output_geoaicaaojcfl",
	"retry_ladders_finish_output_pgebkobjaoiih",
	"retry_throttled_finish_output_plgallgljmddo",
	"retry_unhurried_finish_output_oipogmdgcfehf"
] as const
