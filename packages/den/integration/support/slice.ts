import { connectTimeoutMillis } from "@bjornpagen/den/limits"
import { inProcess } from "@bjornpagen/den/transport"
import { DbLayer, LiveSource, roleNameOf, served } from "@bjornpagen/grizzle/runtime"
import { NodeServices } from "@effect/platform-node"
import { Context, Data, Effect, Layer, Random, Redacted, Stream } from "effect"
import { Digest } from "effect/crypto"
import { ChildProcess } from "effect/process"
import pg from "pg"
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
 * committed migrations under a role prefix of its own (PostgreSQL roles are cluster-wide), its logins given passwords,
 * and uninstalled and dropped when the suite's scope closes.
 */

export const WorkerServed = served<typeof Worker>(workerFile, "worker")
export const AppServed = served<typeof AppLogin>(appFile, "app")

/** The slice's directory, where its migrations and a suite's configuration lie. */
const sliceDir = `${import.meta.dirname}/../slice`

/** The grizzle command line, run from its source. */
const grizzleBin = `${import.meta.dirname}/../../../../vendor/grizzle/packages/grizzle/src/cli/main.ts`

/** A failure of the suite's setup: a command or statement that did not do what the suite needs. */
class SetupFailed extends Data.TaggedError("SetupFailed")<{ readonly message: string }> {}

/** Runs one statement as the cluster's owner, in `database`. */
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
			Effect.tryPromise({
				try: () => client.query(statement),
				catch: (cause) => new SetupFailed({ message: `${statement}: ${String(cause)}` })
			}),
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
		const worker = Redacted.make(`w${yield* freshName}${yield* freshName}`)
		const app = Redacted.make(`a${yield* freshName}${yield* freshName}`)
		yield* asOwner(
			cluster,
			ownerRole,
			`ALTER ROLE "${roleNameOf(WorkerServed, { rolePrefix })}" PASSWORD '${Redacted.value(worker)}'`
		)
		yield* asOwner(
			cluster,
			ownerRole,
			`ALTER ROLE "${roleNameOf(AppServed, { rolePrefix })}" PASSWORD '${Redacted.value(app)}'`
		)
		const done: Installed = { cluster, database, rolePrefix, worker, app }
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
 * A login's pool: two sessions, the most one suite's sequential cases hold at once (a claim's and a read's), each closed
 * once idle as long as a connection attempt may take, so no session outlives the cases that opened it for long.
 */
const pool = Object.freeze({ max: 2, min: 0, idleTimeoutMs: connectTimeoutMillis.value })

/** The worker and app logins' layers over the suite's database. */
const loginsLayer = Layer.unwrap(
	Effect.map(Database, (db) => {
		const connection = (password: Redacted.Redacted) => ({
			...connectionTo(db.cluster, db.database, password),
			rolePrefix: db.rolePrefix
		})
		const live = LiveSource.layer({ ...connection(db.worker), login: WorkerServed })
		return Layer.mergeAll(
			DbLayer.make({ ...connection(db.worker), login: WorkerServed, pool }),
			DbLayer.make({ ...connection(db.app), login: AppServed, pool })
		).pipe(Layer.provide(live))
	})
)

/** Everything a slice suite runs on: its database, both logins, the in-process transport and SHA-256. */
export const sliceLayer = loginsLayer.pipe(
	Layer.provideMerge(databaseLayer),
	Layer.provideMerge(Layer.mergeAll(inProcess, Digest.layerWebCrypto)),
	Layer.provideMerge(NodeServices.layer)
)
