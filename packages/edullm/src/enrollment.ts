import type { Gen } from "@bjornpagen/testing/gen"
import { Array as Arr, Context, Effect, HashMap, Layer, Option, Ref, Schema } from "effect"
import type { EnrollmentIntent } from "#app.ts"
import type { Nature } from "#nature.ts"

/**
 * Enrollment as edullm's W7 reconciles it: our intent ledger (the latest admin decision, else the automatic one, each a
 * version that a pass marks applied) against Timeback's roster for our course, read and written through EduBridge's
 * course-level calls at our org. The roster is shared with every school and drifts on its own: another org enrolls or
 * retires the student, a teacher retires our record, the account is deactivated, the course is unregistered. Once our
 * change is applied, Timeback's word wins and nothing is planned until an admin changes it (edullm's `plan.ts`).
 */

/** One of a student's records in our course's classes: whose org holds it, and whether it is a current membership. */
export type Membership = Readonly<{ org: "home" | "elsewhere"; status: "active" | "tobedeleted" }>

/** A student as Timeback holds them: whether their account is active, and their records in the course. */
export type Student = Readonly<{ accountActive: boolean; memberships: ReadonlyArray<Membership> }>

/** One live read of the roster for one student: our course unregistered, or registered with the student's records. */
export type RosterRead = Readonly<{
	course:
		| Readonly<{ _tag: "Unregistered" }>
		| Readonly<{ _tag: "Registered"; memberships: ReadonlyArray<Membership> }>
	accountActive: boolean
}>

/** What an outside actor does to the roster between two of our calls. */
export type Drift =
	| Readonly<{ _tag: "Still" }>
	| Readonly<{ _tag: "ElsewhereEnrolls" }>
	| Readonly<{ _tag: "ElsewhereRetires" }>
	| Readonly<{ _tag: "TeacherRetiresOurs" }>
	| Readonly<{ _tag: "AccountDeactivated" }>
	| Readonly<{ _tag: "AccountReactivated" }>
	| Readonly<{ _tag: "CourseUnregistered" }>

/** What one call meets on its own: an answer, EduBridge unavailable, or a 403. */
export type Weather = "answered" | "unavailable" | "forbidden"

/** One roster as a simulation draws it: whether our course is registered, its students, and its drift and weather. */
export type World = Readonly<{
	registered: boolean
	students: HashMap.HashMap<string, Student>
	drift: Gen<Drift>
	weather: Gen<Weather>
}>

/** EduBridge did not answer a call, or refused it: nothing is known of whether a write landed. */
export class RosterUnanswered extends Schema.TaggedError<
	RosterUnanswered,
	{ readonly brand: unique symbol }
>()("RosterUnanswered", { status: Schema.Literals([403, 503]) }) {}

/** A write the plan makes: EduBridge's enroll or unenroll of the student at our org. */
export type Op = "enroll" | "unenroll"

/** The fake roster: one student's read, and EduBridge's two writes. */
export class TimebackRoster extends Context.Service<
	TimebackRoster,
	{
		readonly read: (student: string) => Effect.Effect<RosterRead, RosterUnanswered>
		readonly write: (student: string, op: Op) => Effect.Effect<void, RosterUnanswered>
		readonly students: Effect.Effect<HashMap.HashMap<string, Student>>
		readonly drifts: Effect.Effect<ReadonlyArray<Drift>>
	}
>()("@den/edullm/enrollment/TimebackRoster") {}

const current = (membership: Membership) => membership.status === "active"

const drifted = (student: Student, drift: Drift): Student => {
	switch (drift._tag) {
		case "Still":
		case "CourseUnregistered":
			return student
		case "ElsewhereEnrolls":
			return {
				...student,
				memberships: [...student.memberships, { org: "elsewhere", status: "active" }]
			}
		case "ElsewhereRetires":
			return {
				...student,
				memberships: Arr.map(student.memberships, (m) =>
					m.org === "elsewhere" ? { ...m, status: "tobedeleted" } : m
				)
			}
		case "TeacherRetiresOurs":
			return {
				...student,
				memberships: Arr.map(student.memberships, (m) =>
					m.org === "home" ? { ...m, status: "tobedeleted" } : m
				)
			}
		case "AccountDeactivated":
			return { ...student, accountActive: false }
		case "AccountReactivated":
			return { ...student, accountActive: true }
	}
}

/**
 * EduBridge's writes: `enroll` makes the student's record at our org current, or creates one; `unenroll` retires every
 * record of the student at our org, whoever wrote it, and leaves another org's alone.
 */
const written = (student: Student, op: Op): Student => {
	switch (op) {
		case "enroll":
			return Arr.some(student.memberships, (m) => m.org === "home")
				? {
						...student,
						memberships: Arr.map(student.memberships, (m) =>
							m.org === "home" ? { ...m, status: "active" } : m
						)
					}
				: { ...student, memberships: [...student.memberships, { org: "home", status: "active" }] }
		case "unenroll":
			return {
				...student,
				memberships: Arr.map(student.memberships, (m) =>
					m.org === "home" ? { ...m, status: "tobedeleted" } : m
				)
			}
	}
}

type Roster = Readonly<{ registered: boolean; students: HashMap.HashMap<string, Student> }>

const NOBODY: Student = { accountActive: true, memberships: [] }

/** The fake over one world: before each call an outside actor may drift the student, then the call meets its weather. */
export const makeRoster = (
	world: World,
	nature: Nature
): Effect.Effect<TimebackRoster["Service"]> =>
	Effect.gen(function* () {
		const roster = yield* Ref.make<Roster>({
			registered: world.registered,
			students: world.students
		})
		const drifts = yield* Ref.make<ReadonlyArray<Drift>>([])
		const touched = (student: string) =>
			Effect.gen(function* () {
				const drift = nature.draw(world.drift)
				yield* Ref.update(drifts, (seen) => [...seen, drift])
				yield* Ref.update(roster, (held) => ({
					registered: held.registered && drift._tag !== "CourseUnregistered",
					students: HashMap.set(
						held.students,
						student,
						drifted(
							Option.getOrElse(HashMap.get(held.students, student), () => NOBODY),
							drift
						)
					)
				}))
				const weather = nature.draw(world.weather)
				if (weather !== "answered") {
					return yield* RosterUnanswered.make({ status: weather === "forbidden" ? 403 : 503 })
				}
				return yield* Ref.get(roster)
			})
		return TimebackRoster.of({
			read: (student) =>
				Effect.map(touched(student), (held): RosterRead => {
					const found = Option.getOrElse(HashMap.get(held.students, student), () => NOBODY)
					return {
						course: held.registered
							? { _tag: "Registered", memberships: found.memberships }
							: { _tag: "Unregistered" },
						accountActive: found.accountActive
					}
				}),
			write: (student, op) =>
				Effect.flatMap(touched(student), (held) =>
					held.registered
						? Ref.update(roster, (now) => ({
								...now,
								students: HashMap.modify(now.students, student, (found) => written(found, op))
							}))
						: Effect.void
				),
			students: Effect.map(Ref.get(roster), (held) => held.students),
			drifts: Ref.get(drifts)
		})
	})

/** The fake as a layer. */
export const rosterLayer = (world: World, nature: Nature): Layer.Layer<TimebackRoster> =>
	Layer.effect(TimebackRoster, makeRoster(world, nature))

/** The intent kinds: the automatic enrollment, and an admin's decision either way, which outranks it. */
export type IntentKind = EnrollmentIntent["kind"]

/** A student's current intent: its kind, its version (the ledger's count), and whether a pass applied it. */
export type Intent = Omit<EnrollmentIntent, "student">

/** What a pass does about one student: nothing, a write, or wait for a person, who alone can fix either reason. */
export type Plan =
	| Readonly<{ _tag: "Settled" }>
	| Readonly<{ _tag: "Write"; op: Op }>
	| Readonly<{ _tag: "Blocked"; reason: "account-inactive" | "course-unregistered" }>

/** Timeback's word on membership: a current record somewhere in the course. */
export const enrolledSomewhere = (read: RosterRead): boolean =>
	read.course._tag === "Registered" && Arr.some(read.course.memberships, current)

/**
 * The diff between what we want and what Timeback holds (edullm's `plan`): an applied intent is settled; an enrolling
 * one waits for an unregistered course or an inactive account, and writes `enroll` unless the student is enrolled
 * anywhere; an unenrolling one writes `unenroll` while a record at our org is current.
 */
export const plan = (intent: Intent, read: RosterRead): Plan => {
	if (intent.applied) {
		return { _tag: "Settled" }
	}
	switch (intent.kind) {
		case "automatic-enrolled":
		case "admin-enrolled":
			if (read.course._tag === "Unregistered") {
				return { _tag: "Blocked", reason: "course-unregistered" }
			}
			if (!read.accountActive) {
				return { _tag: "Blocked", reason: "account-inactive" }
			}
			return enrolledSomewhere(read) ? { _tag: "Settled" } : { _tag: "Write", op: "enroll" }
		case "admin-unenrolled":
			return read.course._tag === "Registered" &&
				Arr.some(read.course.memberships, (m) => m.org === "home" && current(m))
				? { _tag: "Write", op: "unenroll" }
				: { _tag: "Settled" }
	}
}

/**
 * Our intent ledger: a decision records a new version, except an automatic one while an admin's stands (the latest admin
 * decision outranks every automatic one); a pass marks a version applied only while it is current.
 */
export class IntentLedger extends Context.Service<
	IntentLedger,
	{
		readonly decide: (student: string, kind: IntentKind) => Effect.Effect<Intent>
		readonly current: (student: string) => Effect.Effect<Option.Option<Intent>>
		readonly applied: (student: string, version: number) => Effect.Effect<boolean>
	}
>()("@den/edullm/enrollment/IntentLedger") {}

/** An empty ledger. */
export const makeIntentLedger: Effect.Effect<IntentLedger["Service"]> = Effect.gen(function* () {
	const intents = yield* Ref.make(HashMap.empty<string, Intent>())
	const versions = yield* Ref.make(0)
	return IntentLedger.of({
		decide: (student, kind) =>
			Effect.gen(function* () {
				const held = yield* Ref.get(intents)
				const outranking = Option.filter(
					HashMap.get(held, student),
					(standing) => kind === "automatic-enrolled" && standing.kind !== "automatic-enrolled"
				)
				if (Option.isSome(outranking)) {
					return outranking.value
				}
				const version = yield* Ref.updateAndGet(versions, (count) => count + 1)
				const intent: Intent = { kind, version, applied: false }
				yield* Ref.update(intents, (now) => HashMap.set(now, student, intent))
				return intent
			}),
		current: (student) => Effect.map(Ref.get(intents), (held) => HashMap.get(held, student)),
		applied: (student, version) =>
			Ref.modify(intents, (held): readonly [boolean, HashMap.HashMap<string, Intent>] =>
				Option.match(
					Option.filter(HashMap.get(held, student), (intent) => intent.version === version),
					{
						onNone: () => [false, held],
						onSome: (intent) => [true, HashMap.set(held, student, { ...intent, applied: true })]
					}
				)
			)
	})
})
