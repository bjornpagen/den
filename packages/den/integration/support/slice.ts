import { instantOf } from "@bjornpagen/den/runtime/identity"
import type { Ledger } from "@bjornpagen/den/runtime/ledger"
import type { Ledgers } from "@bjornpagen/den/runtime/turn"
import { inProcess } from "@bjornpagen/den/transport"
import { Db, DbLayer, LiveSource, roleNameOf, served } from "@bjornpagen/grizzle/runtime"
import { NodeServices } from "@effect/platform-node"
import {
	Array as Arr,
	Clock,
	Context,
	Data,
	Effect,
	HashMap,
	Layer,
	Option,
	Random,
	Redacted,
	Ref,
	Stream
} from "effect"
import { Digest } from "effect/crypto"
import { ChildProcess } from "effect/process"
import pg from "pg"
import { Faults } from "#integration/slice/flows.ts"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { fanLedger } from "#integration/slice/generated/fan.binding.ts"
import { retryLedger } from "#integration/slice/generated/retry.binding.ts"
import { syncLedger } from "#integration/slice/generated/sync.binding.ts"
import { connectTimeoutMillis } from "#integration/slice/grizzle.config.ts"
import type { AppLogin, Worker } from "#integration/slice/logins.ts"
import appFile from "#integration/slice/migrations/slice/served/app.json" with { type: "json" }
import workerFile from "#integration/slice/migrations/slice/served/worker.json" with { type: "json" }
import {
	type Cluster,
	clusterPort,
	connectionTo,
	ownerRole,
	readCluster,
	templateDatabase,
	testDatabasePrefix
} from "#integration/support/cluster.ts"

/**
 * A suite's own database on den's cluster: created from the template, migrated by `grizzle migrate` from the slice's
 * committed migrations under a role prefix of its own (PostgreSQL roles are cluster-wide), its logins and its live
 * source's decoder login given passwords, and uninstalled and dropped when the suite's scope closes.
 */

const WorkerServed = served<typeof Worker>(workerFile, "worker")
export const AppServed = served<typeof AppLogin>(appFile, "app")

/** The slice's directory, where its migrations and a suite's configuration lie. */
const sliceDir = `${import.meta.dirname}/../slice`

/** The grizzle command line, run from its source. */
const grizzleBin = `${import.meta.dirname}/../../../../vendor/grizzle/packages/grizzle/src/cli/main.ts`

/** A failure of the suite's setup: a command or statement that did not do what the suite needs. */
class SetupFailed extends Data.TaggedError("SetupFailed")<{ readonly message: string }> {}

/** Runs one statement as the cluster's owner, in `database`, and returns its rows' first column. */
const asOwner = (cluster: Cluster, database: string, statement: string) =>
	Effect.acquireUseRelease(
		Effect.tap(
			Effect.sync(
				() =>
					new pg.Client({
						host: "localhost",
						port: clusterPort,
						user: ownerRole,
						password: Redacted.value(cluster.password),
						database,
						ssl: { ca: cluster.ca, servername: "localhost" }
					})
			),
			(client) =>
				Effect.tryPromise({
					try: () => client.connect(),
					catch: (cause) =>
						new SetupFailed({ message: `connecting as ${ownerRole}: ${String(cause)}` })
				})
		),
		(client) =>
			Effect.map(
				Effect.tryPromise({
					try: () => client.query<{ readonly name: string }>(statement),
					catch: (cause) => new SetupFailed({ message: `${statement}: ${String(cause)}` })
				}),
				(result) => Arr.map(result.rows, (row) => row.name)
			),
		(client) => Effect.promise(() => client.end())
	)

/**
 * Runs a grizzle command over the configuration in `directory` (the slice's own, or a copy of it), for the database and
 * role prefix `env` names.
 */
const grizzle = (command: string, env: Readonly<Record<string, string>>, directory: string) =>
	Effect.scoped(
		Effect.gen(function* () {
			const handle = yield* ChildProcess.make(
				process.execPath,
				[grizzleBin, command, "grizzle.config.ts"],
				{ cwd: directory, env, extendEnv: true, stdin: "ignore" }
			)
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
 * The installed database a suite runs in: its name, its role prefix, the environment a grizzle command over it reads,
 * and its logins' passwords.
 */
interface Installed {
	readonly cluster: Cluster
	readonly database: string
	readonly rolePrefix: string
	readonly env: Readonly<Record<string, string>>
	readonly worker: Redacted.Redacted
	readonly app: Redacted.Redacted
	readonly decoder: Redacted.Redacted
}

class Database extends Context.Service<Database, Installed>()(
	"@bjornpagen/den/integration/support/slice/Database"
) {}

/** A fresh name of the suite's own, from a draw of Effect's Random. */
const freshName = Effect.map(Random.nextInt, (n) => Math.abs(n).toString(36))

const installed = Effect.acquireRelease(
	Effect.gen(function* () {
		const cluster = yield* readCluster
		const suffix = yield* freshName
		const database = `${testDatabasePrefix}${suffix}`
		const rolePrefix = `t${suffix}`
		const env = {
			DEN_PG_PORT: String(clusterPort),
			DEN_PG_CA: cluster.ca,
			DEN_PG_ROLE: ownerRole,
			DEN_PG_PASSWORD: Redacted.value(cluster.password),
			DEN_DATABASE: database,
			DEN_ROLE_PREFIX: rolePrefix
		}
		yield* asOwner(cluster, ownerRole, `CREATE DATABASE "${database}" TEMPLATE ${templateDatabase}`)
		yield* grizzle("migrate", env, sliceDir)
		const password = Effect.map(Effect.all([freshName, freshName]), ([a, b]) =>
			Redacted.make(`p${a}${b}`)
		)
		const worker = yield* password
		const app = yield* password
		const decoder = yield* password
		const set = (role: string, secret: Redacted.Redacted) =>
			asOwner(cluster, ownerRole, `ALTER ROLE "${role}" PASSWORD '${Redacted.value(secret)}'`)
		yield* set(roleNameOf(WorkerServed, { rolePrefix }), worker)
		yield* set(roleNameOf(AppServed, { rolePrefix }), app)
		yield* set(roleNameOf(WorkerServed.decoder, { rolePrefix }), decoder)
		const done: Installed = { cluster, database, rolePrefix, env, worker, app, decoder }
		return { done, env }
	}),
	({ done, env }) =>
		Effect.gen(function* () {
			yield* grizzle("uninstall", env, sliceDir)
			yield* asOwner(done.cluster, ownerRole, `DROP DATABASE "${done.database}" WITH (FORCE)`)
		}).pipe(Effect.orDie)
).pipe(Effect.map(({ done }) => done))

/**
 * Migrates the suite's database by the configuration in `directory`, a copy of the slice whose migrations continue the
 * slice's: grizzle migrate's output, or the SetupFailed its refusal ends with.
 */
export const migrateIn = (directory: string) =>
	Effect.flatMap(Database, (db) => grizzle("migrate", db.env, directory))

/** The suite's database, installed for the layer's scope. */
const databaseLayer = Layer.effect(Database, installed)

/**
 * A login's pool: four sessions, the most one suite's cases hold at once (a relay's watches beside a claim and a
 * read), each closed once idle as long as a connection attempt may take, so no session outlives the cases that opened
 * it for long.
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
 * The worker and app logins' layers over the suite's database, and the misconfigured loader, over the installation's
 * live source.
 */
const loginsLayer = Layer.unwrap(
	Effect.map(Database, (db) => {
		const connection = (password: Redacted.Redacted) => ({
			...connectionTo(db.cluster, db.database, password),
			rolePrefix: db.rolePrefix
		})
		const live = LiveSource.layer({ ...connection(db.decoder), login: WorkerServed })
		const misconfigured = Layer.effect(
			Misconfigured,
			Effect.map(openLoader, (loader) => ({ loader }))
		).pipe(Layer.provide(DbLayer.make({ ...connection(db.worker), login: AppServed, pool })))
		return Layer.mergeAll(
			DbLayer.make({ ...connection(db.worker), login: WorkerServed, pool }),
			DbLayer.make({ ...connection(db.app), login: AppServed, pool }),
			misconfigured
		).pipe(Layer.provide(live))
	})
)

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

/** Everything a slice suite runs on: its database, both logins, the in-process transport, SHA-256 and the faults. */
export const sliceLayer = loginsLayer.pipe(
	Layer.provideMerge(databaseLayer),
	Layer.provideMerge(Layer.mergeAll(inProcess, Digest.layerWebCrypto, faultsLayer)),
	Layer.provideMerge(NodeServices.layer)
)

/** A name no other case of the suite's database holds: a draw of Effect's Random, which every case draws apart. */
export const nonce: Effect.Effect<string> = Effect.map(Random.nextInt, (n) =>
	Math.abs(n).toString(36)
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
 * The slice's four flows' ledgers over Dbs opened on the worker's den and coordinator roles and the app's loader, each
 * reading the database's instant moved on by the time the suite's clock travels from here; and `misconfigured`, the
 * same four committing through the misconfigured loader, whose every commit meets `credentialRefused` while their own
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
			coordinator: (yield* Db.open(WorkerServed.roles.chain_coordinator, {})).workload
		},
		fan: {
			den: (yield* Db.open(WorkerServed.roles.fan_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.fan_coordinator, {})).workload
		},
		sync: {
			den: (yield* Db.open(WorkerServed.roles.sync_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.sync_coordinator, {})).workload
		},
		retry: {
			den: (yield* Db.open(WorkerServed.roles.retry_den, {})).workload,
			coordinator: (yield* Db.open(WorkerServed.roles.retry_coordinator, {})).workload
		}
	}
	const chainBound = chainLedger({ ...roles.chain, commits })
	const fanBound = fanLedger({ ...roles.fan, commits })
	const syncBound = syncLedger({ ...roles.sync, commits })
	const retryBound = retryLedger({ ...roles.retry, commits })
	const chain = { ...chainBound, ledger: travelling(chainBound.ledger, opened) }
	const fan = { ...fanBound, ledger: travelling(fanBound.ledger, opened) }
	const sync = { ...syncBound, ledger: travelling(syncBound.ledger, opened) }
	const retry = { ...retryBound, ledger: travelling(retryBound.ledger, opened) }
	const all: ReadonlyArray<Ledger<Faults>> = [chain.ledger, fan.ledger, sync.ledger, retry.ledger]
	const refused: ReadonlyArray<Ledger<Faults>> = Arr.map(
		[
			chainLedger({ ...roles.chain, commits: refusing }).ledger,
			fanLedger({ ...roles.fan, commits: refusing }).ledger,
			syncLedger({ ...roles.sync, commits: refusing }).ledger,
			retryLedger({ ...roles.retry, commits: refusing }).ledger
		],
		(ledger) => travelling(ledger, opened)
	)
	return {
		chain,
		fan,
		sync,
		retry,
		all,
		ledgers: byFlow(all),
		misconfigured: { all: refused, ledgers: byFlow(refused) },
		loader
	}
})
