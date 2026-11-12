import { type Case, drawn, explore } from "@den/testing/explore"
import { required } from "@den/testing/features"
import { array, constant, element, type Gen, production, weighted } from "@den/testing/gen"
import { notesOnly } from "@den/testing/sense"
import { searched } from "@den/testing/vitest"
import { describe, it } from "@effect/vitest"
import { Array as Arr, Effect, HashMap, Option, Result } from "effect"
import {
	type Drift,
	enrolledSomewhere,
	type Intent,
	IntentLedger,
	type IntentKind,
	makeIntentLedger,
	makeRoster,
	type Membership,
	plan,
	type RosterRead,
	TimebackRoster,
	type Weather,
	type World
} from "#enrollment.ts"
import { exploration, law } from "#test/support/search.ts"

const STUDENT = "student"

/** What happens next: an admin or the automatic enrollment decides, or a reconciliation pass runs, perhaps with a decision landing inside it. */
type Step =
	| Readonly<{ _tag: "Decide"; kind: IntentKind }>
	| Readonly<{ _tag: "Pass"; midPass: Option.Option<IntentKind> }>

type Scenario = Readonly<{ world: World; steps: ReadonlyArray<Step> }>

type Seen =
	| "enrolled"
	| "unenrolled"
	| "blocked"
	| "stale-mark"
	| "refused"
	| "already-applied"
	| "admin-outranks"
	| "drifted"

const KINDS: Arr.NonEmptyReadonlyArray<IntentKind> = [
	"automatic-enrolled",
	"admin-enrolled",
	"admin-unenrolled"
]

const driftGen: Gen<Drift> = weighted<Drift>([
	[12, constant({ _tag: "Still" })],
	[1, constant({ _tag: "ElsewhereEnrolls" })],
	[1, constant({ _tag: "ElsewhereRetires" })],
	[1, constant({ _tag: "TeacherRetiresOurs" })],
	[1, constant({ _tag: "AccountDeactivated" })],
	[1, constant({ _tag: "AccountReactivated" })]
])

const weatherGen: Gen<Weather> = weighted<Weather>([
	[10, constant("answered")],
	[1, constant("unavailable")],
	[1, constant("forbidden")]
])

const membershipGen: Gen<Membership> = (source) => ({
	org: source.draw(element(["home", "elsewhere"] as const)),
	status: source.draw(element(["active", "tobedeleted"] as const))
})

const stepGen: Gen<Step> = weighted<Step>([
	[1, (source) => ({ _tag: "Decide", kind: source.draw(element(KINDS)) })],
	[
		2,
		(source) => ({
			_tag: "Pass",
			midPass: source.draw(
				weighted([
					[4, constant(Option.none())],
					[1, (s) => Option.some(s.draw(element(KINDS)))]
				])
			)
		})
	]
])

const scenarioGen: Gen<Scenario> = (source) => ({
	world: {
		registered: source.draw(production(true, [false])),
		students: HashMap.make([
			STUDENT,
			{
				accountActive: source.draw(production(true, [false])),
				memberships: source.draw(array(membershipGen, { min: 0, max: 3 }))
			}
		]),
		drift: source.draw(
			weighted([
				[1, constant(constant<Drift>({ _tag: "Still" }))],
				[2, constant(driftGen)]
			])
		),
		weather: weatherGen
	},
	steps: source.draw(array(stepGen, { min: 1, max: 8 }))
})

/** Whether a read agrees with an intent: enrolled somewhere for an enrolling one, no current record of ours for an unenrolling one. */
const agrees = (intent: Intent, read: RosterRead): boolean =>
	intent.kind === "admin-unenrolled"
		? read.course._tag === "Unregistered" ||
			!Arr.some(read.course.memberships, (m) => m.org === "home" && m.status === "active")
		: enrolledSomewhere(read)

/**
 * One reconciliation pass over the student, as W7's sweep runs one: the current intent, nothing if applied; else a read,
 * the plan, a write and a verifying read, and the version marked applied once the roster agrees with it.
 */
const passOf = (midPass: Option.Option<IntentKind>, c: Case<Seen>) =>
	Effect.gen(function* () {
		const ledger = yield* IntentLedger
		const roster = yield* TimebackRoster
		const found = yield* ledger.current(STUDENT)
		if (Option.isNone(found)) {
			return
		}
		const intent = found.value
		if (intent.applied) {
			c.note("already-applied")
			yield* law(
				"an applied intent plans nothing",
				plan(intent, { course: { _tag: "Unregistered" }, accountActive: false })._tag === "Settled",
				() => "an applied intent planned a write"
			)
			return
		}
		let read = yield* Effect.result(roster.read(STUDENT))
		for (;;) {
			if (Result.isFailure(read)) {
				c.note("refused")
				return
			}
			const planned = plan(intent, read.success)
			if (planned._tag === "Blocked") {
				c.note("blocked")
				return
			}
			if (planned._tag === "Settled") {
				break
			}
			const wrote = yield* Effect.result(roster.write(STUDENT, planned.op))
			if (Result.isFailure(wrote)) {
				c.note("refused")
				return
			}
			c.note(planned.op === "enroll" ? "enrolled" : "unenrolled")
			read = yield* Effect.result(roster.read(STUDENT))
		}
		yield* law(
			"applied only where the roster agrees",
			agrees(intent, read.success),
			() => `a ${intent.kind} intent was settled against a roster that disagrees`
		)
		yield* Option.match(midPass, {
			onNone: () => Effect.void,
			onSome: (kind) => Effect.asVoid(ledger.decide(STUDENT, kind))
		})
		const marked = yield* ledger.applied(STUDENT, intent.version)
		const now = yield* ledger.current(STUDENT)
		const stale = Option.exists(now, (latest) => latest.version !== intent.version)
		if (stale) {
			c.note("stale-mark")
		}
		yield* law(
			"a mark lands only on its own version",
			marked === !stale,
			() => "a pass marked a version that was no longer current, or failed to mark its own"
		)
	})

describe("enrollment reconciliation", () => {
	it.effect(
		"passes against a drifting roster apply an intent only where Timeback agrees, fenced by its version",
		(ctx) =>
			searched(
				ctx,
				explore(
					exploration({
						suite: "enrollment: reconciliation",
						draw: drawn(scenarioGen),
						coverage: required<Seen>(
							[
								"enrolled",
								"unenrolled",
								"blocked",
								"stale-mark",
								"refused",
								"already-applied",
								"admin-outranks",
								"drifted"
							],
							{
								cases: 200,
								sense: notesOnly
							}
						),
						runs: 400,
						shrink: 200,
						oracle: {
							kind: "specification",
							name: "edullm's plan: Timeback's word on membership, admin over automatic, an applied version settled"
						}
					}),
					(scenario: Scenario, c: Case<Seen>) =>
						Effect.gen(function* () {
							const ledger = yield* IntentLedger
							const roster = yield* TimebackRoster
							for (const step of scenario.steps) {
								if (step._tag === "Pass") {
									yield* passOf(step.midPass, c)
									continue
								}
								const standing = yield* ledger.current(STUDENT)
								const decided = yield* ledger.decide(STUDENT, step.kind)
								const outranked =
									step.kind === "automatic-enrolled" &&
									Option.exists(standing, (intent) => intent.kind !== "automatic-enrolled")
								if (outranked) {
									c.note("admin-outranks")
								}
								yield* law(
									"an admin's decision outranks the automatic one",
									outranked
										? Option.exists(standing, (intent) => intent.version === decided.version)
										: decided.kind === step.kind && !decided.applied,
									() => `deciding ${step.kind} left ${decided.kind}`
								)
							}
							const drifts = yield* roster.drifts
							if (Arr.some(drifts, (drift) => drift._tag !== "Still")) {
								c.note("drifted")
							}
						}).pipe(
							Effect.provideServiceEffect(TimebackRoster, makeRoster(scenario.world, c)),
							Effect.provideServiceEffect(IntentLedger, makeIntentLedger)
						)
				)
			)
	)
})
