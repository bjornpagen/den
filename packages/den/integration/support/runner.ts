import { NeedFailed } from "@bjornpagen/testing/property"
import {
	DatabasePrefix,
	PgCluster,
	type PgMember,
	type PgSession
} from "@bjornpagen/testing/resources"
import { Effect, FileSystem, Layer, Path, Redacted, type Scope, Semaphore } from "effect"
import pg from "pg"
import {
	type Cluster,
	clusterPort,
	ownerRole,
	readCluster,
	templateDatabase,
	testDatabasePrefix
} from "#integration/support/cluster.ts"

/**
 * den's services for the toolchain's runner (`toolchain-test`, test.config.ts): den's own PostgreSQL 19 cluster
 * (scripts/pg.sh) as the cluster every database need of an integration property clones from
 * (@bjornpagen/testing/resources PgCluster). The cluster is one member, its port, reached over verify-full TLS as the
 * owner role den_dev with the CA and password scripts/pg.sh wrote (cluster.ts readCluster).
 */
declare module "@bjornpagen/testing/property" {
	interface RunnerServices {
		readonly cluster: PgCluster
	}
}

declare module "@bjornpagen/testing/resources" {
	interface PgMember {
		/** What scripts/pg.sh made of the member: its CA and its owner's password. */
		readonly cluster: Cluster
	}
}

/** A failure of den's cluster as a need's: what was being done, and the driver's or the server's report. */
const clusterFailed = (doing: string) => (cause: unknown) =>
	NeedFailed.make({ need: "den cluster", message: `${doing}: ${String(cause)}` })

/**
 * A session as the owner, den_dev, in `database` on `member`, for the scope: pg's own client over verify-full TLS, its
 * statements taking turns on its one connection (`turn`), every row's columns as an array of the server's text.
 */
const ownerSession = (
	member: PgMember,
	database: string
): Effect.Effect<PgSession, NeedFailed, Scope.Scope> =>
	Effect.gen(function* () {
		const client = yield* Effect.acquireRelease(
			Effect.tap(
				Effect.sync(
					() =>
						new pg.Client({
							host: "localhost",
							port: clusterPort,
							user: ownerRole,
							password: Redacted.value(member.cluster.password),
							database,
							ssl: { ca: member.cluster.ca, servername: "localhost" },
							application_name: "den-resources owner"
						})
				),
				(opened) =>
					Effect.tryPromise({
						try: () => opened.connect(),
						catch: clusterFailed(`a session in ${database} on member ${member.name}`)
					})
			),
			(opened) => Effect.promise(() => opened.end())
		)
		const turn = yield* Semaphore.make(1)
		const session: PgSession = {
			query: (sql, params) =>
				turn.withPermits(1)(
					Effect.map(
						Effect.tryPromise({
							try: () =>
								client.query<Array<unknown>>({ text: sql, values: [...params], rowMode: "array" }),
							catch: clusterFailed(`${sql} in ${database}`)
						}),
						(result) => result.rows
					)
				)
		}
		return session
	})

/**
 * The runner layer test.config.ts provides: PgCluster over den's one-member cluster, read the first time a need asks
 * (PgCluster.layer reads nothing as it builds), every database it names after den's test prefix (pg.sh reset drops
 * them), templates built from den_template, the toolchain's owner sessions and advisory locks in the owner's own
 * database, every session the owner's (ownerSession).
 */
export const denCluster: Layer.Layer<PgCluster, never, FileSystem.FileSystem | Path.Path> =
	Layer.unwrap(
		Effect.gen(function* () {
			const fs = yield* FileSystem.FileSystem
			const path = yield* Path.Path
			return PgCluster.layer({
				prefix: DatabasePrefix(testDatabasePrefix),
				members: readCluster.pipe(
					Effect.provideService(FileSystem.FileSystem, fs),
					Effect.provideService(Path.Path, path),
					Effect.mapBoth({
						onSuccess: (cluster): readonly [PgMember] => [{ name: String(clusterPort), cluster }],
						onFailure: clusterFailed("reading the cluster scripts/pg.sh made")
					})
				),
				base: templateDatabase,
				maintenance: ownerRole,
				connect: ownerSession
			})
		})
	)
