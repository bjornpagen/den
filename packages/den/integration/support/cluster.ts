import net from "node:net"
import type { DbConnection } from "@bjornpagen/grizzle/runtime"
import { Config, Effect, FileSystem, Path, Redacted, String as Str } from "effect"
import pgDriver from "pg"
import { connectTimeoutMillis } from "#integration/slice/grizzle.config.ts"

/**
 * den's own PostgreSQL 19 cluster (scripts/pg.sh): localhost on port 5435, verify-full TLS against its CA, the owner
 * role den_dev, whose password lies beside the cluster's data. A suite reaches it only through these coordinates.
 */
export const clusterPort = 5435
export const ownerRole = "den_dev"
export const templateDatabase = "den_template"
export const testDatabasePrefix = "den_t_"

/** What a suite needs of the cluster: its CA and its owner's password. */
export interface Cluster {
	readonly ca: string
	readonly password: Redacted.Redacted
}

/** Reads the cluster's CA and its owner's password from where scripts/pg.sh wrote them. */
export const readCluster = Effect.gen(function* () {
	const fs = yield* FileSystem.FileSystem
	const path = yield* Path.Path
	const home = yield* Config.String("HOME")
	const state = path.join(home, ".local", "var", "den", "pg")
	const ca = yield* fs.readFileString(path.join(state, "tls", "ca.crt"))
	const written = yield* fs.readFileString(path.join(state, `${ownerRole}.password`))
	const cluster: Cluster = { ca, password: Redacted.make(Str.trim(written)) }
	return cluster
})

/** A connection to `database` on the cluster, without its role. */
export const connectionTo = (
	cluster: Cluster,
	database: string,
	password: Redacted.Redacted
): DbConnection => ({
	driver: pgDriver,
	transport: {
		kind: "sslRequest",
		host: "localhost",
		port: clusterPort,
		open: () => new net.Socket(),
		ca: cluster.ca,
		servername: "localhost"
	},
	database,
	password,
	connectTimeoutMs: connectTimeoutMillis
})
