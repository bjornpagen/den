import { connectTimeoutMillis } from "@bjornpagen/den/limits"
import type { Ledger } from "@bjornpagen/den/runtime/ledger"
import type { Ledgers } from "@bjornpagen/den/runtime/turn"
import { inProcess } from "@bjornpagen/den/transport"
import { Db, DbLayer, LiveSource, roleNameOf, served } from "@bjornpagen/grizzle/runtime"
import { NodeServices } from "@effect/platform-node"
import {
	Array as Arr,
	Context,
	Data,
	Effect,
	HashMap,
	Layer,
	Option,
	Random,
	Redacted,
	Ref,
	Stream,
	String as Str
} from "effect"
import { Digest } from "effect/crypto"
import { ChildProcess } from "effect/process"
import pg from "pg"
import { Faults } from "#integration/slice/flows.ts"
import { chainLedger } from "#integration/slice/generated/chain.binding.ts"
import { fanLedger } from "#integration/slice/generated/fan.binding.ts"
import { retryLedger } from "#integration/slice/generated/retry.binding.ts"
import { syncLedger } from "#integration/slice/generated/sync.binding.ts"
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
 * source's decoder login given passwords, and uninstalled and dropped when the suite's scope closes. At `a226cbac`
 * grizzle grants its decoder login SELECT on the live secret but not USAGE on the schema the secret lies in
 * (packages/engine/src/physical/ddl/live.ts:178-186), so its leader's first read is refused with "permission denied for
 * schema slice"; the suite grants it as the owner until the repin, whose LIVE-SOURCE (faa8053f) opens the source under
 * the installation's roles.
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

/** Runs a grizzle command over the slice's configuration, for the database and role prefix `env` names. */
const grizzle = (command: string, env: Readonly<Record<string, string>>) =>
	Effect.scoped(
		Effect.gen(function* () {
			const handle = yield* ChildProcess.make(
				process.execPath,
				["--conditions=grizzle-source", grizzleBin, command, "grizzle.config.ts"],
				{ cwd: sliceDir, env, extendEnv: true, stdin: "ignore" }
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

/** The installed database a suite runs in: its name, its role prefix, and its logins' passwords. */
interface Installed {
	readonly cluster: Cluster
	readonly database: string
	readonly rolePrefix: string
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
		yield* grizzle("migrate", env)
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

		const workerRole = roleNameOf(WorkerServed, { rolePrefix })
		const appRole = roleNameOf(AppServed, { rolePrefix })
		const unprefixed = roleNameOf(WorkerServed, {})
		const namespace = Str.slice(0, workerRole.length - unprefixed.length - 2)(workerRole)
		const decoders = yield* asOwner(
			cluster,
			ownerRole,
			`SELECT rolname::text AS name FROM pg_catalog.pg_roles WHERE rolreplication AND starts_with(rolname::text, '${namespace}__') AND rolname::text NOT IN ('${workerRole}', '${appRole}')`
		)
		yield* Effect.forEach(decoders, (role) =>
			Effect.andThen(
				set(role, decoder),
				asOwner(cluster, database, `GRANT USAGE ON SCHEMA "slice" TO "${role}"`)
			)
		)
		const done: Installed = { cluster, database, rolePrefix, worker, app, decoder }
		return { done, env }
	}),
	({ done, env }) =>
		Effect.gen(function* () {
			yield* grizzle("uninstall", env)
			yield* asOwner(done.cluster, ownerRole, `DROP DATABASE "${done.database}" WITH (FORCE)`)
		}).pipe(Effect.orDie)
).pipe(Effect.map(({ done }) => done))

/** The suite's database, installed for the layer's scope. */
const databaseLayer = Layer.effect(Database, installed)

/**
 * A login's pool: four sessions, the most one suite's cases hold at once (a relay's watches beside a claim and a
 * read), each closed once idle as long as a connection attempt may take, so no session outlives the cases that opened
 * it for long.
 */
const pool = Object.freeze({ max: 4, min: 0, idleTimeoutMs: connectTimeoutMillis.value })

/** The worker and app logins' layers over the suite's database, over the installation's live source. */
const loginsLayer = Layer.unwrap(
	Effect.map(Database, (db) => {
		const connection = (password: Redacted.Redacted) => ({
			...connectionTo(db.cluster, db.database, password),
			rolePrefix: db.rolePrefix
		})
		const live = LiveSource.layer({ ...connection(db.decoder), login: WorkerServed })
		return Layer.mergeAll(
			DbLayer.make({ ...connection(db.worker), login: WorkerServed, pool }),
			DbLayer.make({ ...connection(db.app), login: AppServed, pool })
		).pipe(Layer.provide(live))
	})
)

/** The faults the retry suite plants, as a service: each key's remaining deaths, counted down by its bodies. */
export class Planted extends Context.Service<
	Planted,
	{ readonly faults: Ref.Ref<HashMap.HashMap<string, number>> }
>()("@bjornpagen/den/integration/support/slice/Planted") {}

const faultsLayer = Layer.effectContext(
	Effect.map(Ref.make(HashMap.empty<string, number>()), (faults) =>
		Context.make(Planted, { faults }).pipe(
			Context.add(Faults, {
				dies: (key) =>
					Ref.modify(faults, (map) => {
						const left = Option.getOrElse(HashMap.get(map, key), () => 0)
						return left > 0 ? [true, HashMap.set(map, key, left - 1)] : [false, map]
					})
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

/** The slice's four flows' ledgers over Dbs opened on the worker's den and coordination roles and the app's loader. */
export const openLedgers = Effect.gen(function* () {
	const loader = yield* Db.open(AppServed.roles.loader, {})
	const commits = loader.workload
	const chain = chainLedger({
		den: (yield* Db.open(WorkerServed.roles.chain_den, {})).workload,
		seats: (yield* Db.open(WorkerServed.roles.chain_seats, {})).workload,
		commits
	})
	const fan = fanLedger({
		den: (yield* Db.open(WorkerServed.roles.fan_den, {})).workload,
		seats: (yield* Db.open(WorkerServed.roles.fan_seats, {})).workload,
		commits
	})
	const sync = syncLedger({
		den: (yield* Db.open(WorkerServed.roles.sync_den, {})).workload,
		seats: (yield* Db.open(WorkerServed.roles.sync_seats, {})).workload,
		commits
	})
	const retry = retryLedger({
		den: (yield* Db.open(WorkerServed.roles.retry_den, {})).workload,
		seats: (yield* Db.open(WorkerServed.roles.retry_seats, {})).workload,
		commits
	})
	const all: ReadonlyArray<Ledger<Faults>> = [chain.ledger, fan.ledger, sync.ledger, retry.ledger]
	const ledgers: Ledgers<Faults> = new Map(Arr.map(all, (l) => [l.flow, l] as const))
	return { chain, fan, sync, retry, all, ledgers, loader }
})
