import net from "node:net"
import type { DbConnection } from "@bjornpagen/grizzle/runtime"
import type { PgMember } from "@bjornpagen/testing/resources"
import type { Redacted } from "effect"
import pgDriver from "pg"
import { authenticationTimeoutSeconds } from "#runtime/turn.ts"

/**
 * How long one connection attempt to den's cluster may take: as long as the server lets it authenticate.
 *
 * @limitKind derived
 * @owner den's suites on its own cluster (pg.config.ts)
 * @unit milliseconds
 * @scope one connection attempt of a suite's DbLayer, and the CancelRequest an interrupted statement sends
 * @derivation the cluster runs at PostgreSQL's default authentication_timeout, past which it closes the connection
 *   itself
 * @from {@link authenticationTimeoutSeconds}
 */
export const connectTimeoutMillis = authenticationTimeoutSeconds * 1000

/** A connection to `database` on `member` over verify-full TLS against the member's CA, under `password`. */
export const connectionTo = (
	member: PgMember,
	database: string,
	password: Redacted.Redacted
): DbConnection => ({
	driver: pgDriver,
	transport: {
		kind: "sslRequest",
		host: "localhost",
		port: member.port,
		open: () => new net.Socket(),
		ca: member.ca,
		servername: "localhost"
	},
	database,
	password,
	connectTimeoutMs: connectTimeoutMillis
})
