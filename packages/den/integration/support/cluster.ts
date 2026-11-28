import net from "node:net"
import type { DbConnection } from "@bjornpagen/grizzle/runtime"
import { NeedFailed } from "@bjornpagen/testing/property"
import type { PgMember } from "@bjornpagen/testing/resources"
import { Effect, type Redacted } from "effect"
import pgDriver from "pg"

/** A member of den's cluster as a TLS client reaches it: its CA's PEM text beside its port. */
export type TlsMember = Omit<PgMember, "tls"> & {
	readonly tls: Extract<PgMember["tls"], { readonly kind: "tls" }>
}

/**
 * `member` as den's clients reach it, over verify-full TLS, read once where a need takes its member: grizzle's client
 * speaks nothing else, so pg.config.ts states `network: { kind: "tls" }`, and a member reached over its socket alone
 * fails the need.
 */
export const overTls = (member: PgMember): Effect.Effect<TlsMember, NeedFailed> =>
	member.tls.kind === "tls"
		? Effect.succeed({ ...member, tls: member.tls })
		: NeedFailed.make({
				need: "den's cluster",
				message: `member ${member.name} is reached over its socket alone, and grizzle's client speaks verify-full TLS only: pg.config.ts states network tls`
			})

/**
 * A connection to `database` on `member` over verify-full TLS against the member's CA, under `password`, over pg's own
 * classes: a statement's backend serves a socket of the case's process tree, so the runner counts its work as the
 * case's (the testing library's runner/backends.ts), and no statement is a declared wait.
 */
export const connectionTo = (
	member: TlsMember,
	database: string,
	password: Redacted.Redacted
): DbConnection => ({
	driver: pgDriver,
	transport: {
		kind: "sslRequest",
		host: "localhost",
		port: member.port,
		open: () => new net.Socket(),
		ca: member.tls.ca,
		servername: "localhost"
	},
	database,
	password
})
