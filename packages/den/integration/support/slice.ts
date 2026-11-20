import { instantOf } from "@bjornpagen/den/runtime/identity"
import type { Ledger } from "@bjornpagen/den/runtime/ledger"
import type { Ledgers } from "@bjornpagen/den/runtime/turn"
import { inProcess } from "@bjornpagen/den/transport"
import { Db, DbLayer, LiveSource, roleNameOf, served } from "@bjornpagen/grizzle/runtime"
import { NeedFailed } from "@bjornpagen/testing/property"
import { Database, type DatabaseNeed, type PgMember, Template } from "@bjornpagen/testing/resources"
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
import { Digest } from "effect/crypto"
import { ChildProcess } from "effect/process"
import { TestClock } from "effect/testing"
import pg from "pg"
import { Faults } from "#integration/slice/flows.ts"
import { assignLedger } from "#integration/slice/generated/assign.binding.ts"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { fanLedger } from "#integration/slice/generated/fan.binding.ts"
import { retryLedger } from "#integration/slice/generated/retry.binding.ts"
import { syncLedger } from "#integration/slice/generated/sync.binding.ts"
import type { AppLogin, Worker } from "#integration/slice/logins.ts"
import initMigration from "#integration/slice/migrations/slice/20261120062825_init/meta.json" with { type: "json" }
import appFile from "#integration/slice/migrations/slice/served/app.json" with { type: "json" }
import workerFile from "#integration/slice/migrations/slice/served/worker.json" with { type: "json" }
import snapshotFile from "#integration/slice/migrations/slice/snapshot.json" with { type: "json" }
import { connectTimeoutMillis, connectionTo } from "#integration/support/cluster.ts"

/**
 * The vertical slice installed on den's cluster, as the needs of the integration properties: a template of the slice
 * migrated by `grizzle migrate` from its committed migrations under a role prefix of its own, built once on the cluster
 * and cloned for every case (sliceCase, liveSliceCase), and, for a case that streams from the installation's live
 * source, an installation of its own on a clone of den_template (installedSliceCase). Every case's database is its own,
 * and dropped once the case ends.
 */

const WorkerServed = served<typeof Worker>(workerFile, "worker")
export const AppServed = served<typeof AppLogin>(appFile, "app")

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
	"20261120062825_init": initMigration
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

/** A session of the cluster's owner in `database`, connected, and ended once its scope closes. */
const ownerSession = (member: PgMember, database: string) =>
	Effect.acquireRelease(
		Effect.tap(
			Effect.sync(
				() =>
					new pg.Client({
						host: "localhost",
						port: member.port,
						user: member.owner,
						password: Redacted.value(member.password),
						database,
						ssl: { ca: member.ca, servername: "localhost" }
					})
			),
			(client) =>
				Effect.tryPromise({
					try: () => client.connect(),
					catch: (cause) =>
						new SetupFailed({ message: `connecting as ${member.owner}: ${String(cause)}` })
				})
		),
		(client) => Effect.promise(() => client.end())
	)

/** Runs one statement on an owner's session, and returns its rows' first column. */
const runOn = (client: pg.Client, statement: string) =>
	Effect.map(
		Effect.tryPromise({
			try: () => client.query<{ readonly name: string }>(statement),
			catch: (cause) => new SetupFailed({ message: `${statement}: ${String(cause)}` })
		}),
		(result) => Arr.map(result.rows, (row) => row.name)
	)

/** Runs one statement as the cluster's owner, in `database`, and returns its rows' first column. */
const asOwner = (member: PgMember, database: string, statement: string) =>
	Effect.scoped(
		Effect.flatMap(ownerSession(member, database), (client) => runOn(client, statement))
	)

/**
 * Runs a grizzle command over the configuration in `directory` (the slice's own, or a copy of it), for the database and
 * role prefix `env` names. The command inherits the test process's environment, and with it the compile cache the
 * testing library's setup hands to every process a test starts, so it loads grizzle's modules from the V8 code the
 * run's processes already compiled.
 */
export const grizzle = (
	command: string,
	env: Readonly<Record<string, string>>,
	directory: string
) =>
	Effect.scoped(
		Effect.gen(function* () {
			const handle = yield* ChildProcess.make(grizzleBin, [command, "grizzle.config.ts"], {
				cwd: directory,
				env,
				extendEnv: true,
				stdin: "ignore"
			})
			const [stdout, stderr, code] = yield* Effect.all(
				[
					Stream.mkString(Stream.decodeText(handle.stdout)),
					Stream.mkString(Stream.decodeText(handle.stderr)),
					handle.exitCode
				],
				{ concurrency: "unbounded" }
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
	readonly member: PgMember
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
const envOf = (member: PgMember, database: string, rolePrefix: string) => ({
	DEN_PG_PORT: String(member.port),
	DEN_PG_CA: member.ca,
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
	member: PgMember,
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
		yield* grizzle("migrate", env, sliceDir)
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
const templatePassword = (member: PgMember, role: string): Redacted.Redacted =>
	Redacted.make(`${Redacted.value(member.password)}:${role}`)

/** The passwords of the template under `rolePrefix`'s three logins (templatePassword). */
const templatePasswords = (member: PgMember, rolePrefix: string) => {
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
const dropLeftRoles = (member: PgMember, rolePrefix: string) =>
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
	from: Template.cluster,
	build: (target) =>
		Effect.mapError(
			Effect.gen(function* () {
				const rolePrefix = templatePrefixOf(target.name)
				yield* dropLeftRoles(target.member, rolePrefix)
				yield* install(
					target.member,
					target.name,
					rolePrefix,
					templatePasswords(target.member, rolePrefix)
				)
			}),
			setupNeedFailed("den slice template")
		)
})

/** An empty database, den_template's clone, as a template: what a case installs the slice into itself. */
const emptyTemplate = Template.database({
	declaredIn: import.meta,
	name: "den empty",
	content: {},
	from: Template.cluster,
	build: () => Effect.void
})

/**
 * A login's pool: four sessions, the most one case holds at once (a relay's watches beside a claim and a read), each
 * closed once idle as long as a connection attempt may take, so no session outlives the cases that opened it for long.
 */
const pool = Object.freeze({ max: 4, min: 0, idleTimeoutMs: connectTimeoutMillis })

/** The app's loader, which den's commits run under. */
const openLoader = Db.open(AppServed.roles.loader, {})

/**
 * The app's loader as a deployment configured with another login's secret opens it: its login offers the worker's
 * password, which the app's role refuses, so every call on it meets `credentialRefused`.
 */
class Misconfigured extends Context.Service<
	Misconfigured,
	{ readonly loader: Effect.Success<typeof openLoader> }
>()("@bjornpagen/den/integration/support/slice/Misconfigured") {}

/**
 * The worker and app logins' layers over the case's database, and the misconfigured loader, over the installation's
 * live source, which connects nothing until a Db's first watch.
 */
const loginsLayer = (installed: Installed) => {
	const connection = (password: Redacted.Redacted) => ({
		...connectionTo(installed.member, installed.database, password),
		rolePrefix: installed.rolePrefix
	})
	const live = LiveSource.layer({ ...connection(installed.decoder), login: WorkerServed })
	const misconfigured = Layer.effect(
		Misconfigured,
		Effect.map(openLoader, (loader) => ({ loader }))
	).pipe(Layer.provide(DbLayer.make({ ...connection(installed.worker), login: AppServed, pool })))
	return Layer.mergeAll(
		DbLayer.make({ ...connection(installed.worker), login: WorkerServed, pool }),
		DbLayer.make({ ...connection(installed.app), login: AppServed, pool }),
		misconfigured
	).pipe(Layer.provide(live))
}

/**
 * The faults the retry suites plant, as a service: each key's remaining deaths, counted down by its bodies, and how many
 * times each key's body ran, since a body asks once a run whether it dies.
 */
export class Planted extends Context.Service<
	Planted,
	{
		readonly faults: Ref.Ref<HashMap.HashMap<string, number>>
		readonly runs: Ref.Ref<HashMap.HashMap<string, number>>
	}
>()("@bjornpagen/den/integration/support/slice/Planted") {}

const faultsLayer = Layer.effectContext(
	Effect.map(
		Effect.all([
			Ref.make(HashMap.empty<string, number>()),
			Ref.make(HashMap.empty<string, number>())
		]),
		([faults, runs]) =>
			Context.make(Planted, { faults, runs }).pipe(
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
						)
				})
			)
	)
)

/**
 * Everything a slice case runs on, over its installation: its database, both logins, the in-process transport, SHA-256
 * and the faults, on the platform.
 */
const caseLayer = (installed: Installed) =>
	loginsLayer(installed).pipe(
		Layer.provideMerge(Layer.succeed(Installation, installed)),
		Layer.provideMerge(Layer.mergeAll(inProcess, Digest.layerWebCrypto, faultsLayer)),
		Layer.provideMerge(NodeServices.layer)
	)

/**
 * A case's clock: the TestClock a case moves to let a lease lapse or a retry come due (as @effect/vitest gave every
 * suite but those streaming or migrating), or the machine's, for a case whose live reads and child processes wait on
 * real time.
 */
type CaseClock = "test" | "live"

/**
 * The services of a slice case, built in the case's scope under the case's clock, so its transport's delays and its
 * logins' pools read the clock the case moves, as @effect/vitest built a suite's layer over its TestClock.
 */
const caseOf = (installed: Installed, clock: CaseClock) =>
	Layer.build(
		clock === "test"
			? Layer.provideMerge(caseLayer(installed), TestClock.layer())
			: caseLayer(installed)
	)

/** The services of every slice case, whatever its clock. */
export type SliceCase = Layer.Success<ReturnType<typeof caseLayer>>

/** The installation a case over a clone of the slice template has: the clone, under the template's prefix. */
const clonedInstallation = (member: PgMember, database: string, template: string): Installed => {
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
		template: sliceTemplate,
		open: Effect.andThen(
			committedFolders,
			Effect.map(fresh.open, (take) =>
				Effect.flatMap(take, (db) =>
					Effect.mapError(
						caseOf(clonedInstallation(db.member, db.name, db.template), clock),
						builtAs(key)
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
const ownInstallation = (database: Database) =>
	Effect.acquireRelease(
		Effect.gen(function* () {
			const suffix = yield* freshName
			const password = Effect.map(Effect.all([freshName, freshName]), ([a, b]) =>
				Redacted.make(`p${a}${b}`)
			)
			return yield* install(database.member, database.name, `t${suffix}`, {
				worker: yield* password,
				app: yield* password,
				decoder: yield* password
			})
		}),
		(installed) => Effect.orDie(grizzle("uninstall", installed.env, sliceDir))
	)

/**
 * Each case an installation of its own (ownInstallation) on its own clone of den_template, under the machine's clock:
 * for a case that streams from the live source, whose replication slot its decoder login names, so two clones of one
 * installation would claim one slot.
 */
export const installedSliceCase: DatabaseNeed<Context.Context<SliceCase>> = {
	key: "den slice installed, live clock",
	template: emptyTemplate,
	open: Effect.zipWith(
		Effect.context<NodeServices.NodeServices>(),
		Database.fresh(emptyTemplate).open,
		(platform, take) =>
			Effect.flatMap(take, (db) =>
				Effect.mapError(
					Effect.flatMap(Effect.provideContext(ownInstallation(db), platform), (installed) =>
						caseOf(installed, "live")
					),
					builtAs("den slice installed, live clock")
				)
			)
	)
}

/**
 * Migrates the case's database by the configuration in `directory`, a copy of the slice whose migrations continue the
 * slice's: grizzle migrate's output, or the SetupFailed its refusal ends with.
 */
export const migrateIn = (directory: string) =>
	Effect.flatMap(Installation, (installed) => grizzle("migrate", installed.env, directory))

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
 * A ledger whose readings of the database's instant are moved on by the time the suite's clock, its TestClock, has
 * travelled since `opened`. The database's clock cannot be moved, and a suite moves its TestClock to let a lease lapse
 * or a retry come due, which the in-process transport's delays follow too; while the suite's clock stands, a reading is
 * the database's own.
 */
const travelling = <R>(ledger: Ledger<R>, opened: number): Ledger<R> => ({
	...ledger,
	now: Effect.zipWith(ledger.now, Clock.currentTimeMillis, (reading, at) =>
		instantOf(Number(reading) + at - opened)
	)
})

/** Ledgers by their flow's name. */
const byFlow = (all: ReadonlyArray<Ledger<Faults>>): Ledgers<Faults> =>
	new Map(Arr.map(all, (l) => [l.flow, l] as const))

/**
 * The slice's five flows' ledgers over Dbs opened on the worker's den and coordinator roles and the app's loader, each
 * reading the database's instant moved on by the time the suite's clock travels from here; and `misconfigured`, the
 * same five committing through the misconfigured loader, whose every commit meets `credentialRefused` while their own
 * roles' calls are let in.
 */
export const openLedgers = Effect.gen(function* () {
	const opened = yield* Clock.currentTimeMillis
	const loader = yield* openLoader
	const refusing = (yield* Misconfigured).loader.workload
	const commits = loader.workload
	const roles = {
		chain: {
			den: (yield* Db.open(WorkerServed.roles.chain_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.chain_coordinator, {})).workload,
			retirer: (yield* Db.open(WorkerServed.roles.chain_retirer, {})).workload
		},
		fan: {
			den: (yield* Db.open(WorkerServed.roles.fan_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.fan_coordinator, {})).workload,
			retirer: (yield* Db.open(WorkerServed.roles.fan_retirer, {})).workload
		},
		sync: {
			den: (yield* Db.open(WorkerServed.roles.sync_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.sync_coordinator, {})).workload,
			retirer: (yield* Db.open(WorkerServed.roles.sync_retirer, {})).workload
		},
		retry: {
			den: (yield* Db.open(WorkerServed.roles.retry_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.retry_coordinator, {})).workload,
			retirer: (yield* Db.open(WorkerServed.roles.retry_retirer, {})).workload
		},
		assign: {
			den: (yield* Db.open(WorkerServed.roles.assign_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.assign_coordinator, {})).workload,
			retirer: (yield* Db.open(WorkerServed.roles.assign_retirer, {})).workload
		}
	}
	const chainBound = chainLedger({ ...roles.chain, commits })
	const fanBound = fanLedger({ ...roles.fan, commits })
	const syncBound = syncLedger({ ...roles.sync, commits })
	const retryBound = retryLedger({ ...roles.retry, commits })
	const assignBound = assignLedger({ ...roles.assign, commits })
	const chain = { ...chainBound, ledger: travelling(chainBound.ledger, opened) }
	const fan = { ...fanBound, ledger: travelling(fanBound.ledger, opened) }
	const sync = { ...syncBound, ledger: travelling(syncBound.ledger, opened) }
	const retry = { ...retryBound, ledger: travelling(retryBound.ledger, opened) }
	const assign = { ...assignBound, ledger: travelling(assignBound.ledger, opened) }
	const all: ReadonlyArray<Ledger<Faults>> = [
		chain.ledger,
		fan.ledger,
		sync.ledger,
		retry.ledger,
		assign.ledger
	]
	const refused: ReadonlyArray<Ledger<Faults>> = Arr.map(
		[
			chainLedger({ ...roles.chain, commits: refusing }).ledger,
			fanLedger({ ...roles.fan, commits: refusing }).ledger,
			syncLedger({ ...roles.sync, commits: refusing }).ledger,
			retryLedger({ ...roles.retry, commits: refusing }).ledger,
			assignLedger({ ...roles.assign, commits: refusing }).ledger
		],
		(ledger) => travelling(ledger, opened)
	)
	return {
		chain,
		fan,
		sync,
		retry,
		assign,
		all,
		ledgers: byFlow(all),
		misconfigured: { all: refused, ledgers: byFlow(refused) },
		loader
	}
})
