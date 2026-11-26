import type { Lowered } from "@bjornpagen/den/lower/fragment"
import {
	type Placement,
	printBinding,
	printFragment,
	printPrograms
} from "@bjornpagen/den/lower/print"
import { authenticationTimeoutSeconds, type Ledgers, promote } from "@bjornpagen/den/runtime/turn"
import { DeploymentId, EnvironmentName, Host, inProcess } from "@bjornpagen/den/transport"
import { compileServedMoved } from "@bjornpagen/grizzle/compile"
import { Db, DbLayer, LiveSource, roleNameOf, served } from "@bjornpagen/grizzle/runtime"
import { waitingOn } from "@bjornpagen/testing/live"
import { type Need, NeedFailed } from "@bjornpagen/testing/property"
import { Database, type DatabaseNeed, Template } from "@bjornpagen/testing/resources"
import * as NodeServices from "@effect/platform-node/NodeServices"
import { regex } from "arkregex"
import {
	Array as Arr,
	Clock,
	Context,
	Data,
	Effect,
	Fiber,
	FileSystem,
	HashMap,
	type PlatformError,
	Layer,
	Option,
	Path,
	Random,
	Redacted,
	Record as Rec,
	Ref,
	Stream,
	String as Str
} from "effect"
import { ChildProcess } from "effect/process"
import { TestClock } from "effect/testing"
import pg from "pg"
import { Faults } from "#integration/slice/flows.ts"
import { assignLedger } from "#integration/slice/generated/assign.binding.ts"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { clockLedger } from "#integration/slice/generated/clock.binding.ts"
import { fanLedger } from "#integration/slice/generated/fan.binding.ts"
import { retryLedger } from "#integration/slice/generated/retry.binding.ts"
import { reviewLedger } from "#integration/slice/generated/review.binding.ts"
import { syncLedger } from "#integration/slice/generated/sync.binding.ts"
import { writebackLedger } from "#integration/slice/generated/writeback.binding.ts"
import { AppLogin, Worker } from "#integration/slice/logins.ts"
import initMigration from "#integration/slice/migrations/slice/20261126010058_init/meta.json" with { type: "json" }
import appFile from "#integration/slice/migrations/slice/served/app.json" with { type: "json" }
import workerFile from "#integration/slice/migrations/slice/served/worker.json" with { type: "json" }
import snapshotFile from "#integration/slice/migrations/slice/snapshot.json" with { type: "json" }
import {
	awaitingPostgres,
	backendOf,
	connectionTo,
	overTls,
	signingIn,
	type TlsMember
} from "#integration/support/cluster.ts"

/**
 * The vertical slice installed on den's cluster, as the needs of the integration properties: a template of the slice
 * migrated by `grizzle migrate` from its committed migrations under a role prefix of its own, built once on the cluster
 * and cloned for every case (sliceCase, liveSliceCase), and, for a case that streams from the installation's live
 * source, an installation of its own on a clone of den_template (installedSliceCase). Every case's database is its own,
 * and dropped once the case ends.
 */

const WorkerServed = served<typeof Worker>(workerFile, "worker")
const AppServed = served<typeof AppLogin>(appFile, "app")

/**
 * The slice's two logins served for a moved clock (compileServedMoved), from the committed snapshot: every clocked read
 * and every ChangeSet of theirs reads the database's clock as the case's instant (Instant), so a case moves the
 * database's clock as it moves its TestClock, and nothing a case judges reads two clocks. The committed served files
 * are their roles' addresses (WorkerServed, AppServed): a role opens on the layer of its login's name, whose roles these
 * files share. Compiled once a process.
 */
const movedLogins = Effect.runSync(
	Effect.cached(
		Effect.all({
			worker: Effect.map(compileServedMoved(Worker, snapshotFile, Worker.workload), (file) =>
				served<typeof Worker>(file, "worker")
			),
			app: Effect.map(compileServedMoved(AppLogin, snapshotFile, AppLogin.workload), (file) =>
				served<typeof AppLogin>(file, "app")
			)
		})
	)
)

/**
 * The instant every reading of the database's clock in a case's call is, in microseconds since the Unix epoch
 * (Db.openMoved's instant), read once at each call: the machine's clock at the call, moved by the time the case's
 * TestClock has travelled since its services were built, or by nothing under the machine's clock. So a lease lapses
 * and a retry comes due when the case travels past it, and each call stands at an instant of its own, as den's facts
 * keyed by an instant need: two promotions of one environment are two `Served` rows, a millisecond of den's clock apart
 * at least, which a case whose calls stood at the instant its TestClock last travelled to stamped at one.
 */
class Instant extends Context.Service<Instant, Effect.Effect<bigint>>()(
	"@bjornpagen/den/integration/support/slice/Instant"
) {}

/** The app's auditor, opened as every Db of a case is, over the case's moved clock (Instant). */
export const openAuditor = Effect.flatMap(Instant, (instant) =>
	Db.openMoved(AppServed.roles.auditor, {}, instant)
)

/** The app's editor, which rewrites the passages and seen passages a decision read (app-programs.ts Editor). */
export const openEditor = Effect.flatMap(Instant, (instant) =>
	Db.openMoved(AppServed.roles.editor, {}, instant)
)

/** The slice's directory, where its migrations and a suite's configuration lie. */
const sliceDir = `${import.meta.dirname}/../slice`

/** The grizzle command line, as @bjornpagen/grizzle publishes it: its package's bin, which pnpm links into den's. */
const grizzleBin = `${import.meta.dirname}/../../node_modules/.bin/grizzle`

/**
 * The slice's committed migrations, by folder, each its meta.json (every statement of the folder, which `grizzle
 * check` holds to its files): what `grizzle migrate` applies, so the slice template's identity, its module's import
 * closure, changes with any of them. sliceTemplate's need refuses a run whose migrations directory holds a folder this
 * record lacks, or lacks one it holds (committedFolders).
 */
const committed = Object.freeze({
	"20261126010058_init": initMigration
})

/** A migration folder's name, as `grizzle generate` drafts it: a UTC timestamp to the second, then its name. */
const migrationFolder = regex("^[0-9]{14}_")

/**
 * Fails unless the slice's migrations directory holds exactly the folders `committed` records, so a migration drafted
 * after this module was written fails every case that would clone a template built without it.
 */
const committedFolders = Effect.gen(function* () {
	const fs = yield* FileSystem.FileSystem
	const path = yield* Path.Path
	const entries = yield* fs.readDirectory(path.join(sliceDir, "migrations", "slice"))
	const onDisk = Arr.sort(
		Arr.filter(entries, (entry) => migrationFolder.test(entry)),
		Str.Order
	)
	const recorded = Arr.sort(Rec.keys(committed), Str.Order)
	if (Arr.join(onDisk, " ") !== Arr.join(recorded, " ")) {
		return yield* NeedFailed.make({
			need: "den slice",
			message: `the slice's migrations are ${Arr.join(onDisk, ", ")}, but integration/support/slice.ts records ${Arr.join(recorded, ", ")}: import each folder's meta.json into \`committed\``
		})
	}
}).pipe(
	Effect.catchTag("PlatformError", (error) =>
		NeedFailed.make({
			need: "den slice",
			message: `reading the slice's migrations: ${error.message}`
		})
	)
)

/** A failure of the suite's setup: a command or statement that did not do what the suite needs. */
class SetupFailed extends Data.TaggedError("SetupFailed")<{ readonly message: string }> {}

/**
 * A session of the cluster's owner: its client, its backend recorded as it signed in (signingIn), and the member it
 * runs on, which its statements' waits ask whether that backend works on them (awaitingPostgres).
 */
interface OwnerSession {
	readonly client: pg.Client
	readonly member: TlsMember
}

/** A session of the cluster's owner in `database`, connected, and ended once its scope closes. */
const ownerSession = (member: TlsMember, database: string) =>
	Effect.acquireRelease(
		Effect.tap(
			Effect.sync((): OwnerSession => ({
				client: signingIn(
					new pg.Client({
						host: "localhost",
						port: member.port,
						user: member.owner,
						password: Redacted.value(member.password),
						database,
						ssl: { ca: member.tls.ca, servername: "localhost" }
					})
				),
				member
			})),
			(owner) =>
				awaitingPostgres(member, Option.none())(`connect as ${member.owner} to ${database}`)(
					Effect.tryPromise({
						try: () => owner.client.connect(),
						catch: (cause) =>
							new SetupFailed({ message: `connecting as ${member.owner}: ${String(cause)}` })
					})
				)
		),
		(owner) =>
			awaitingPostgres(member, Option.none())(`end of the owner's session in ${database}`)(
				Effect.promise(() => owner.client.end())
			)
	)

/** Runs one statement on an owner's session, and returns its rows' first column. */
const runOn = (owner: OwnerSession, statement: string) =>
	Effect.map(
		awaitingPostgres(owner.member, backendOf(owner.client.connection))(statement)(
			Effect.tryPromise({
				try: () => owner.client.query<{ readonly name: string }>(statement),
				catch: (cause) => new SetupFailed({ message: `${statement}: ${String(cause)}` })
			})
		),
		(result) => Arr.map(result.rows, (row) => row.name)
	)

/** Runs one statement as the cluster's owner, in `database`, and returns its rows' first column. */
const asOwner = (member: TlsMember, database: string, statement: string) =>
	Effect.scoped(Effect.flatMap(ownerSession(member, database), (owner) => runOn(owner, statement)))

/**
 * Runs a grizzle command over the configuration in `directory` (the slice's own, or a copy of it), for the database and
 * role prefix `env` names, with the arguments a caller `declared` beside it (a copy's `--drop`s). The command inherits
 * the test process's environment, and with it the compile cache the testing library's setup hands to every process a
 * test starts, so it loads grizzle's modules from the V8 code the run's processes already compiled. Its exit is awaited
 * as a declared wait (waitingOn), named by the command: its statements are PostgreSQL's work and its own a child's,
 * which the case's guard does not read as the worker's.
 */
const grizzle = (
	command: string,
	env: Readonly<Record<string, string>>,
	directory: string,
	declared: ReadonlyArray<string>
) =>
	Effect.scoped(
		Effect.gen(function* () {
			const handle = yield* ChildProcess.make(
				grizzleBin,
				[command, "grizzle.config.ts", ...declared],
				{
					cwd: directory,
					env,
					extendEnv: true,
					stdin: "ignore"
				}
			)
			const [stdout, stderr, code] = yield* waitingOn(`grizzle ${command} in ${directory}`)(
				Effect.all(
					[
						Stream.mkString(Stream.decodeText(handle.stdout)),
						Stream.mkString(Stream.decodeText(handle.stderr)),
						handle.exitCode
					],
					{ concurrency: "unbounded" }
				)
			)
			if (code !== 0) {
				return yield* new SetupFailed({ message: `grizzle ${command}: ${stdout}${stderr}` })
			}
			return stdout
		})
	)

/**
 * The installed database a case runs in: its name, its role prefix, the environment a grizzle command over it reads,
 * and its logins' passwords.
 */
interface Installed {
	readonly member: TlsMember
	readonly database: string
	readonly rolePrefix: string
	readonly env: Readonly<Record<string, string>>
	readonly worker: Redacted.Redacted
	readonly app: Redacted.Redacted
	readonly decoder: Redacted.Redacted
}

class Installation extends Context.Service<Installation, Installed>()(
	"@bjornpagen/den/integration/support/slice/Installation"
) {}

/** The environment a grizzle command over `database` under `rolePrefix` reads (grizzle.config.ts). */
const envOf = (member: TlsMember, database: string, rolePrefix: string) => ({
	DEN_PG_PORT: String(member.port),
	DEN_PG_CA: member.tls.ca,
	DEN_PG_ROLE: member.owner,
	DEN_PG_PASSWORD: Redacted.value(member.password),
	DEN_DATABASE: database,
	DEN_ROLE_PREFIX: rolePrefix
})

/** The slice's three logins whose passwords a case's layers present: the worker's, the app's and the decoder's. */
const loginsOf = (rolePrefix: string) => ({
	worker: roleNameOf(WorkerServed, { rolePrefix }),
	app: roleNameOf(AppServed, { rolePrefix }),
	decoder: roleNameOf(WorkerServed.decoder, { rolePrefix })
})

/**
 * Installs the slice into `database`, an empty clone of den_template, under `rolePrefix`: `grizzle migrate` from the
 * slice's committed migrations, then each login given its password.
 */
const install = (
	member: TlsMember,
	database: string,
	rolePrefix: string,
	passwords: Readonly<{
		worker: Redacted.Redacted
		app: Redacted.Redacted
		decoder: Redacted.Redacted
	}>
) =>
	Effect.gen(function* () {
		const env = envOf(member, database, rolePrefix)
		yield* grizzle("migrate", env, sliceDir, [])
		const roles = loginsOf(rolePrefix)
		const set = (role: string, secret: Redacted.Redacted) =>
			asOwner(member, member.owner, `ALTER ROLE "${role}" PASSWORD '${Redacted.value(secret)}'`)
		yield* set(roles.worker, passwords.worker)
		yield* set(roles.app, passwords.app)
		yield* set(roles.decoder, passwords.decoder)
		const installed: Installed = { member, database, rolePrefix, env, ...passwords }
		return installed
	})

/**
 * The role prefix of the slice template named `template` (`den_t_tpl_<32 hex digits>`, the toolchain's name for it):
 * `t` and its first 12 hex digits, so every worker that clones it, and its build, derive the same prefix, and two
 * templates' roles stay apart.
 */
const templatePrefixOf = (template: string): string => `t${Str.slice(-32, -20)(template)}`

/**
 * The password of a login of the slice template: the owner's password, then the role's name, so only who holds the
 * owner's password knows it, each login's differs from every other's (a login offered another's password is refused,
 * as the misconfigured loader is), and every worker that clones the template logs in without the template keeping a
 * credential.
 */
const templatePassword = (member: TlsMember, role: string): Redacted.Redacted =>
	Redacted.make(`${Redacted.value(member.password)}:${role}`)

/** The passwords of the template under `rolePrefix`'s three logins (templatePassword). */
const templatePasswords = (member: TlsMember, rolePrefix: string) => {
	const roles = loginsOf(rolePrefix)
	return {
		worker: templatePassword(member, roles.worker),
		app: templatePassword(member, roles.app),
		decoder: templatePassword(member, roles.decoder)
	}
}

/**
 * Drops the roles an earlier build of the same template left on the cluster, before this build makes them again. A
 * template's roles are the cluster's, named by its prefix, and outlive its database: collection drops a stale or
 * unused template's database, never its roles, so a template built again under the same identity met them still
 * there and its migration refused them (42710). They own nothing once the database they were made in is gone; a role
 * that still owns something, in a clone another run holds, fails its drop and so the build.
 */
const dropLeftRoles = (member: TlsMember, rolePrefix: string) =>
	Effect.flatMap(
		asOwner(
			member,
			member.owner,
			`SELECT rolname AS name FROM pg_catalog.pg_roles WHERE starts_with(rolname, '${rolePrefix}_') ORDER BY rolname DESC`
		),
		(left) =>
			Effect.forEach(left, (role) => asOwner(member, member.owner, `DROP ROLE "${role}"`), {
				discard: true
			})
	)

/** A setup failure as the need `need` fails with it. */
const setupNeedFailed = (need: string) => (cause: SetupFailed | PlatformError.PlatformError) =>
	NeedFailed.make({ need, message: cause.message })

/**
 * The CPU one open of a slice template's need may spend on a worker (Template.database's `budget`, which the needs that
 * take its clones state too): its build, a migration a child process runs that the worker awaits as a declared wait
 * (`grizzle`), or the wait on another worker's build, and the clone a case takes.
 *
 * @limitKind measured
 * @owner den's integration suites (packages/den/integration)
 * @unit milliseconds of CPU
 * @scope one open of the den slice or den empty template's need on one worker, the worker process's own CPU
 * @evidence each property's `readyingCpu` in ~/.cache/toolchain-test/runs/739101362-3164387.json (`toolchain-test run
 *   integration/claim.test.ts integration/relay.test.ts integration/seatcount.test.ts`, TEST_SEED=739101362), which
 *   bounds any one open of its needs from above (every need of a property opens in its readying); the same properties'
 *   at toolchain a6172d0 and 541d327 in 1854769185-1748472.json and 3087850660-3443342.json
 * @observed 2026-11-21 15:40 to 15:51 UTC (739101362); 13:46 to 13:55 UTC and 14:20 to 14:25 UTC (the others)
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, 1-minute load 410 to 430 from other
 *   lanes' runs; Node 26.13.1, toolchain 46e6e52e43dd, grizzle d81ee19dc (the pin), den-test-0 on the workbench's
 *   PostgreSQL 19.0
 * @workload one run of three properties on three workers, each opening its needs once: claim.test's sliceCase (the den
 *   slice template, built by `grizzle migrate` of the slice's 24,135-line init migration), relay.test's
 *   installedSliceCase (the den empty template), seatcount.test's liveSliceCase beside its lowered copy
 * @result readyingCpu claim 2,824.9 ms, relay 2,814.8 ms, seatcount 3,021.6 ms (its two needs together); at a6172d0
 *   claim 2,624.4 ms and relay 2,609.7 ms; at 541d327 relay 2,675.0 ms. No open failed
 * @decision about ten times the largest readying, 3,021.6 ms, rounded up: a worker's CPU for one open moves with the
 *   load and with a cold compile cache, which the runs met at load 410 to 430, and a guard that kills a building
 *   template fails every case that clones it. Unmeasured: a template built on a quiet machine, and a slice whose
 *   migration grows
 * @revalidate a slice migration grown well past 24,135 lines, a template build that does more in the worker, a toolchain
 *   that counts a need's children in its budget, another machine
 */
const templateBudgetMillis = 30_000

/**
 * The slice installed, as a template: built once on the cluster from den_template by `grizzle migrate` under the
 * template's own role prefix (templatePrefixOf), its logins given the passwords the template derives
 * (templatePassword). Its identity is this module's import closure, which holds the slice's committed migrations
 * (`committed`), its snapshot, its served files and the generated bindings, so a change to any of them is a new
 * template. Its roles are the cluster's, shared by every clone, which is sound for logging in; a case that streams from
 * the live source, whose replication slot the decoder login names, takes an installation of its own instead
 * (installedSliceCase).
 */
const sliceTemplate = Template.database({
	declaredIn: import.meta,
	name: "den slice",
	content: { migrations: Rec.keys(committed), snapshot: snapshotFile.fingerprint },
	budget: templateBudgetMillis,
	from: Template.cluster,
	build: (target) =>
		Effect.flatMap(overTls(target.member), (member) =>
			Effect.mapError(
				Effect.gen(function* () {
					const rolePrefix = templatePrefixOf(target.name)
					yield* dropLeftRoles(member, rolePrefix)
					yield* install(member, target.name, rolePrefix, templatePasswords(member, rolePrefix))
				}),
				setupNeedFailed("den slice template")
			)
		)
})

/** An empty database, den_template's clone, as a template: what a case installs the slice into itself. */
const emptyTemplate = Template.database({
	declaredIn: import.meta,
	name: "den empty",
	content: {},
	budget: templateBudgetMillis,
	from: Template.cluster,
	build: () => Effect.void
})

/**
 * A login's pool: four sessions, the most one case holds at once (a relay's watches beside a claim and a read), each
 * closed once idle as long as a connection attempt may take, the server's authentication_timeout, past which it closes
 * an unauthenticated connection itself, so no session outlives the cases that opened it for long.
 */
const pool = Object.freeze({ max: 4, min: 0, idleTimeoutMs: authenticationTimeoutSeconds * 1000 })

/** The app's loader, which den's commits run under, over the case's moved clock. */
const openLoader = Effect.flatMap(Instant, (instant) =>
	Db.openMoved(AppServed.roles.loader, {}, instant)
)

/**
 * The app's loader as a deployment configured with another login's secret opens it: its login offers the worker's
 * password, which the app's role refuses, so every call on it meets `credentialRefused`.
 */
class Misconfigured extends Context.Service<
	Misconfigured,
	{ readonly loader: Effect.Success<typeof openLoader> }
>()("@bjornpagen/den/integration/support/slice/Misconfigured") {}

/**
 * The worker and app logins' layers over the case's database, each serving its login compiled for a moved clock
 * (movedLogins), and the misconfigured loader, over the installation's live source, which connects nothing until a
 * Db's first watch.
 */
const loginsLayer = (installed: Installed) =>
	Layer.unwrap(
		Effect.map(movedLogins, (logins) => {
			const connection = (password: Redacted.Redacted) => ({
				...connectionTo(installed.member, installed.database, password),
				rolePrefix: installed.rolePrefix
			})
			const live = LiveSource.layer({ ...connection(installed.decoder), login: logins.worker })
			const misconfigured = Layer.effect(
				Misconfigured,
				Effect.map(openLoader, (loader) => ({ loader }))
			).pipe(
				Layer.provide(DbLayer.make({ ...connection(installed.worker), login: logins.app, pool }))
			)
			return Layer.mergeAll(
				DbLayer.make({ ...connection(installed.worker), login: logins.worker, pool }),
				DbLayer.make({ ...connection(installed.app), login: logins.app, pool }),
				misconfigured
			).pipe(Layer.provide(live))
		})
	)

/**
 * The faults the retry suites plant, as a service: each key's remaining deaths, counted down by its bodies, how many
 * times each key's body ran, since a body asks once a run whether it dies, and each key's remaining refusals, the
 * responses its source answers in order, taken one a call.
 */
export class Planted extends Context.Service<
	Planted,
	{
		readonly faults: Ref.Ref<HashMap.HashMap<string, number>>
		readonly runs: Ref.Ref<HashMap.HashMap<string, number>>
		readonly refusals: Ref.Ref<HashMap.HashMap<string, ReadonlyArray<Headers>>>
	}
>()("@bjornpagen/den/integration/support/slice/Planted") {}

const faultsLayer = Layer.effectContext(
	Effect.map(
		Effect.all([
			Ref.make(HashMap.empty<string, number>()),
			Ref.make(HashMap.empty<string, number>()),
			Ref.make(HashMap.empty<string, ReadonlyArray<Headers>>())
		]),
		([faults, runs, refusals]) =>
			Context.make(Planted, { faults, runs, refusals }).pipe(
				Context.add(Faults, {
					dies: (key) =>
						Effect.andThen(
							Ref.update(runs, (map) =>
								HashMap.set(map, key, Option.getOrElse(HashMap.get(map, key), () => 0) + 1)
							),
							Ref.modify(faults, (map) => {
								const left = Option.getOrElse(HashMap.get(map, key), () => 0)
								return left > 0 ? [true, HashMap.set(map, key, left - 1)] : [false, map]
							})
						),
					refuses: (key) =>
						Ref.modify(refusals, (map) => {
							const left = Option.getOrElse(HashMap.get(map, key), () => [])
							return [Arr.head(left), HashMap.set(map, key, Arr.drop(left, 1))]
						})
				})
			)
	)
)

/**
 * A case's clock: the TestClock a case moves to let a lease lapse or a retry come due (as @effect/vitest gave every
 * suite but those streaming or migrating), or the machine's, for a case whose live reads and child processes wait on
 * real time.
 */
type CaseClock = "test" | "live"

/** The machine's clock, as the process reads it before any case's TestClock stands in for it. */
const machineClock = Effect.runSync(Clock.clockWith(Effect.succeed))

/**
 * The case's instant under `clock` (Instant): at each call, the machine's clock moved by the time the case's TestClock
 * has travelled since the services were built, or the machine's clock alone under the machine's clock.
 */
const instantLayer = (clock: CaseClock) =>
	Layer.effect(
		Instant,
		Effect.map(Clock.currentTimeNanos, (built) =>
			Effect.map(
				Effect.all([machineClock.currentTimeNanos, Clock.currentTimeNanos]),
				([now, at]) => (clock === "test" ? now + at - built : now) / 1000n
			)
		)
	)

/**
 * Everything a slice case runs on, over its installation, under `clock`: its database, both logins, the in-process
 * transport, SHA-256, the faults and the database's clock moved as the case's is, on the platform.
 */
const caseLayer = (installed: Installed, clock: CaseClock) =>
	loginsLayer(installed).pipe(
		Layer.provideMerge(Layer.succeed(Installation, installed)),
		Layer.provideMerge(
			Layer.mergeAll(inProcess, faultsLayer, instantLayer(clock), Layer.succeed(Host, sliceHost))
		),
		Layer.provideMerge(NodeServices.layer)
	)

/**
 * The services of a slice case, built in the case's scope under the case's clock, so its transport's delays, its
 * logins' pools and its instant of the database's clock read the clock the case moves, as @effect/vitest built a suite's
 * layer over its TestClock.
 */
const caseOf = (installed: Installed, clock: CaseClock) =>
	Layer.build(
		clock === "test"
			? Layer.provideMerge(caseLayer(installed, clock), TestClock.layer())
			: caseLayer(installed, clock)
	)

/** The services of every slice case, whatever its clock. */
export type SliceCase = Layer.Success<ReturnType<typeof caseLayer>>

/** The installation a case over a clone of the slice template has: the clone, under the template's prefix. */
const clonedInstallation = (member: TlsMember, database: string, template: string): Installed => {
	const rolePrefix = templatePrefixOf(template)
	return {
		member,
		database,
		rolePrefix,
		env: envOf(member, database, rolePrefix),
		...templatePasswords(member, rolePrefix)
	}
}

/** A case's services as a need's take: what building them can fail with, as the need's failure. */
const builtAs = (need: string) => (cause: unknown) =>
	NeedFailed.make({ need, message: `building a slice case: ${String(cause)}` })

/**
 * Each case its own clone of the slice template (Database.fresh), and its services built over it under `clock`: the
 * template's logins, the in-process transport, the faults. A run whose migrations directory disagrees with
 * `committed` fails every case (committedFolders).
 */
const clonedCase = (clock: CaseClock): DatabaseNeed<Context.Context<SliceCase>> => {
	const fresh = Database.fresh(sliceTemplate)
	const key = `den slice clone, ${clock} clock`
	return {
		key,
		budget: sliceTemplate.budget,
		runNeeds: [],
		template: sliceTemplate,
		open: Effect.andThen(
			committedFolders,
			Effect.map(fresh.open, (take) =>
				Effect.flatMap(take, (db) =>
					Effect.flatMap(overTls(db.member), (member) =>
						Effect.mapError(
							caseOf(clonedInstallation(member, db.name, db.template), clock),
							builtAs(key)
						)
					)
				)
			)
		)
	}
}

/** A clone of the slice template a case's own, under the TestClock: what most slice properties need. */
export const sliceCase = clonedCase("test")

/** A clone of the slice template a case's own, under the machine's clock: for a case whose commands wait on real time. */
export const liveSliceCase = clonedCase("live")

/** A fresh name of the case's own, from a draw of Effect's Random. */
const freshName = Effect.map(Random.nextInt, (n) => Math.abs(n).toString(36))

/**
 * The slice installed by the case itself into its own clone of den_template, under a role prefix of its own and fresh
 * passwords, and uninstalled (its roles and its live source's replication slot dropped) once the case ends, before the
 * clone is: so the case's live source claims a slot no other case names.
 */
const ownInstallation = (member: TlsMember, database: string) =>
	Effect.acquireRelease(
		Effect.gen(function* () {
			const suffix = yield* freshName
			const password = Effect.map(Effect.all([freshName, freshName]), ([a, b]) =>
				Redacted.make(`p${a}${b}`)
			)
			return yield* install(member, database, `t${suffix}`, {
				worker: yield* password,
				app: yield* password,
				decoder: yield* password
			})
		}),
		(installed) => Effect.orDie(grizzle("uninstall", installed.env, sliceDir, []))
	)

/**
 * Each case an installation of its own (ownInstallation) on its own clone of den_template, under the machine's clock:
 * for a case that streams from the live source, whose replication slot its decoder login names, so two clones of one
 * installation would claim one slot.
 */
export const installedSliceCase: DatabaseNeed<Context.Context<SliceCase>> = {
	key: "den slice installed, live clock",
	budget: emptyTemplate.budget,
	runNeeds: [],
	template: emptyTemplate,
	open: Effect.zipWith(
		Effect.context<NodeServices.NodeServices>(),
		Database.fresh(emptyTemplate).open,
		(platform, take) =>
			Effect.flatMap(take, (db) =>
				Effect.mapError(
					Effect.flatMap(
						Effect.flatMap(overTls(db.member), (member) =>
							Effect.provideContext(ownInstallation(member, db.name), platform)
						),
						(installed) => caseOf(installed, "live")
					),
					builtAs("den slice installed, live clock")
				)
			)
	)
}

/**
 * A copy of the slice beside it in which den printed `flow`'s fragment, programs and binding again from `lowered`, as a
 * deploy that changed that flow would: every module of it read under the copy's own specifiers, and a migration from
 * the slice's own to it drafted by `grizzle generate`, `drops` declared dropped, which a case's `migrateIn` applies to
 * its own database. It lives in its scope, which removes it.
 */
const sliceCopyOf = (flow: string, lowered: Lowered, drops: ReadonlyArray<string>) =>
	Effect.gen(function* () {
		const fs = yield* FileSystem.FileSystem
		const path = yield* Path.Path
		const workspace = yield* fs.makeTempDirectoryScoped({
			directory: path.dirname(sliceDir),
			prefix: ".copy-"
		})
		const copy = path.join(workspace, "slice")
		const specifier = `#integration/${path.basename(workspace)}/slice/`
		yield* fs.copy(sliceDir, copy)
		const files = yield* fs.readDirectory(copy, { recursive: true })
		yield* Effect.forEach(Arr.filter(files, Str.endsWith(".ts")), (file) =>
			Effect.flatMap(fs.readFileString(path.join(copy, file)), (text) =>
				fs.writeFileString(
					path.join(copy, file),
					Str.replaceAll("#integration/slice/", specifier)(text)
				)
			)
		)
		const placement: Placement = {
			fragment: `${specifier}generated/${flow}.fragment.ts`,
			programs: `${specifier}generated/${flow}.programs.ts`,
			relations: `${specifier}relations.ts`,
			schema: { from: `${specifier}app.ts`, name: "App" },
			writer: { from: `${specifier}roles.ts`, name: "Loader" },
			flow: { from: `${specifier}flows.ts`, name: flow },
			reads: { from: `${specifier}reads.ts`, exports: {} }
		}
		yield* Effect.forEach(
			[
				["fragment", printFragment],
				["programs", printPrograms],
				["binding", printBinding]
			] as const,
			([module, print]) =>
				fs.writeFileString(
					path.join(copy, "generated", `${flow}.${module}.ts`),
					print(lowered, placement)
				)
		)
		yield* grizzle(
			"generate",
			{},
			copy,
			Arr.flatMap(drops, (relation) => ["--drop", relation])
		)
		return copy
	})

/**
 * The CPU a slice copy's open may spend on a worker (`sliceCopyNeed`'s budget): the slice copied, one flow's modules
 * printed again, and `grizzle generate` over the copy, a child process whose CPU the open's bound counts with the
 * worker's own (its process tree).
 *
 * @limitKind measured
 * @owner den's integration suites (packages/den/integration)
 * @unit milliseconds of CPU
 * @scope one open of a slice copy on one worker, its process tree
 * @evidence `grizzle generate` of the whole slice from no snapshot (its init drafted from nothing, more than a copy's
 *   one-flow delta), its user and system CPU by /usr/bin/time
 *   (~/.cache/den/METIS-PROCTOR-logs/slice-generate-time-2149.log)
 * @observed 2026-11-25 21:49 UTC
 * @environment cassowary, Ubuntu 26.04 on arm64 in AWS, 64 cores and 247 GiB, shared with other lanes' runs; den on
 *   00f23edb with lane METIS-PROCTOR's derived root inputs
 * @workload one `grizzle generate integration/slice/grizzle.config.ts`
 * @result 32.10 s user and 1.14 s system: 33.2 s of CPU (30.1 s wall)
 * @decision about twice the drafting, rounded up: a child's CPU moves with the load and with a cold compile cache
 * @revalidate a slice whose generate grows, a grizzle repin, another machine
 */
const sliceCopyBudgetMillis = 70_000

/**
 * A copy of the slice in which `flow`'s fragment is `lowered` (`sliceCopyOf`), once per worker: a need opened in the
 * worker's scope, so the copy is removed when the worker ends, every case of the worker migrating its own database to
 * it and reading it only. `drops` are the relations the deploy drops, which `grizzle generate` drafts only where its
 * caller declares each (`--drop`): a root whose input derived from its key and is now given drops its key's relation.
 */
export const sliceCopyNeed = (
	key: string,
	flow: string,
	lowered: Lowered,
	drops: ReadonlyArray<string>
): Need<string> => ({
	key,
	budget: sliceCopyBudgetMillis,
	runNeeds: [],
	open: Effect.mapBoth(sliceCopyOf(flow, lowered, drops), {
		onSuccess: Effect.succeed,
		onFailure: (cause) =>
			NeedFailed.make({ need: key, message: `the slice's copy: ${cause.message}` })
	})
})

/**
 * Migrates the case's database by the configuration in `directory`, a copy of the slice whose migrations continue the
 * slice's: grizzle migrate's output, or the SetupFailed its refusal ends with.
 */
export const migrateIn = (directory: string) =>
	Effect.flatMap(Installation, (installed) => grizzle("migrate", installed.env, directory, []))

/** The case's member's wal_level, as the owner's session in the case's database reads it. */
export const walLevel = Effect.flatMap(Installation, (installed) =>
	asOwner(
		installed.member,
		installed.database,
		"SELECT pg_catalog.current_setting('wal_level') AS name"
	)
)

/**
 * Runs `reader` while an owner's transaction holds `table` of the case's database locked against every read, and
 * `writer` once a session waits on that lock, then frees it and waits for the reader; its answer is both outcomes. A
 * statement that waited on the lock reads the database as it stood before the writer, since PostgreSQL takes a
 * statement's snapshot before its locks, and a statement the reader starts after the lock is freed reads the writer's
 * commits: so a reader whose reads span two transactions reads two states, and one whose reads are one statement reads
 * one.
 */
export const readAcrossWrite = <A, B, E, F, R, Q>(
	table: string,
	reader: Effect.Effect<A, E, R>,
	writer: Effect.Effect<B, F, Q>
) =>
	Effect.scoped(
		Effect.gen(function* () {
			const installed = yield* Installation
			const owner = yield* ownerSession(installed.member, installed.database)
			yield* runOn(owner, "BEGIN ISOLATION LEVEL READ COMMITTED")
			yield* runOn(owner, `LOCK TABLE ${table} IN ACCESS EXCLUSIVE MODE`)
			const reading = yield* Effect.forkScoped(reader)
			yield* Effect.repeat(
				runOn(
					owner,
					`SELECT count(*)::text AS name FROM pg_catalog.pg_locks WHERE NOT granted AND relation = '${table}'::regclass`
				),
				{ until: (waiting) => !Arr.contains(waiting, "0") }
			)
			const wrote = yield* writer
			yield* runOn(owner, "ROLLBACK")
			const read = yield* Fiber.join(reading)
			return [read, wrote] as const
		})
	)

/** A read's rows, as an array. */
export const rows = <A, E>(
	read: Effect.Effect<Iterable<A>, E>
): Effect.Effect<ReadonlyArray<A>, E> => Effect.map(read, Arr.fromIterable)

/**
/**
 * Where a slice case runs: the case's environment and its one deployment, which its ledgers promote when they open, so
 * every turn of the case is served; the serving suite opens a deployment of its own beside it.
 */
export const sliceHost = Object.freeze({
	environment: EnvironmentName.make("case"),
	deployment: DeploymentId.make("slice")
})

/**
 * The slice's flows' ledgers over Dbs opened on the worker's den, coordinator and retiring roles and the app's loader,
 * each over the case's moved clock, so every reading of the database's instant, a clocked read's and a commit's alike,
 * is moved on by the time the case's clock travels; and `misconfigured`, the
 * same seven committing through the misconfigured loader, whose every commit meets `credentialRefused` while their own
 * roles' calls are let in. The clock's ledger serves its wakes beside them but stands apart from `all`, the flows a
 * tick of every flow ticks, since each of its ticks requests a root of its own; its suite ticks it alone.
 */
export const openLedgers = Effect.gen(function* () {
	const instant = yield* Instant
	const loader = yield* openLoader
	const refusing = (yield* Misconfigured).loader.workload
	const commits = loader.workload
	const roles = {
		chain: {
			den: (yield* Db.openMoved(WorkerServed.roles.chain_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.chain_coordinator, {}, instant))
				.workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.chain_retirer, {}, instant)).workload
		},
		fan: {
			den: (yield* Db.openMoved(WorkerServed.roles.fan_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.fan_coordinator, {}, instant)).workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.fan_retirer, {}, instant)).workload
		},
		sync: {
			den: (yield* Db.openMoved(WorkerServed.roles.sync_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.sync_coordinator, {}, instant)).workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.sync_retirer, {}, instant)).workload
		},
		retry: {
			den: (yield* Db.openMoved(WorkerServed.roles.retry_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.retry_coordinator, {}, instant))
				.workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.retry_retirer, {}, instant)).workload
		},
		assign: {
			den: (yield* Db.openMoved(WorkerServed.roles.assign_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.assign_coordinator, {}, instant))
				.workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.assign_retirer, {}, instant)).workload
		},
		review: {
			den: (yield* Db.openMoved(WorkerServed.roles.review_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.review_coordinator, {}, instant))
				.workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.review_retirer, {}, instant)).workload
		},
		writeback: {
			den: (yield* Db.openMoved(WorkerServed.roles.writeback_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.writeback_coordinator, {}, instant))
				.workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.writeback_retirer, {}, instant)).workload
		},
		clock: {
			den: (yield* Db.openMoved(WorkerServed.roles.clock_den, {}, instant)).workload,
			coordinator: (yield* Db.openMoved(WorkerServed.roles.clock_coordinator, {}, instant))
				.workload,
			retirer: (yield* Db.openMoved(WorkerServed.roles.clock_retirer, {}, instant)).workload
		}
	}
	const chain = chainLedger({ ...roles.chain, commits })
	const fan = fanLedger({ ...roles.fan, commits })
	const sync = syncLedger({ ...roles.sync, commits })
	const retry = retryLedger({ ...roles.retry, commits })
	const assign = assignLedger({ ...roles.assign, commits })
	const review = reviewLedger({ ...roles.review, commits })
	const writeback = writebackLedger({ ...roles.writeback, commits })
	const clock = clockLedger({ ...roles.clock, commits })
	const all: Ledgers<Faults> = [
		chain.ledger,
		fan.ledger,
		sync.ledger,
		retry.ledger,
		assign.ledger,
		review.ledger,
		writeback.ledger
	]
	const refused: Ledgers<Faults> = [
		chainLedger({ ...roles.chain, commits: refusing }).ledger,
		fanLedger({ ...roles.fan, commits: refusing }).ledger,
		syncLedger({ ...roles.sync, commits: refusing }).ledger,
		retryLedger({ ...roles.retry, commits: refusing }).ledger,
		assignLedger({ ...roles.assign, commits: refusing }).ledger,
		reviewLedger({ ...roles.review, commits: refusing }).ledger,
		writebackLedger({ ...roles.writeback, commits: refusing }).ledger
	]
	yield* promote(Arr.append(all, clock.ledger))
	return {
		chain,
		fan,
		sync,
		retry,
		assign,
		review,
		writeback,
		clock,
		all,
		ledgers: Arr.append(all, clock.ledger),
		misconfigured: { all: refused, ledgers: refused },
		loader
	}
})
