import net from "node:net"
import type { DbConnection, PgDriver } from "@bjornpagen/grizzle/runtime"
import { waitingOn, waitingOnWork } from "@bjornpagen/testing/live"
import { backendWorking } from "@bjornpagen/testing/pg-session"
import { NeedFailed } from "@bjornpagen/testing/property"
import type { PgMember } from "@bjornpagen/testing/resources"
import { regex } from "arkregex"
import {
	Array as Arr,
	Deferred,
	Effect,
	Exit,
	Option,
	Predicate,
	type Redacted,
	String as Str
} from "effect"
import pgDriver from "pg"

/** How many of a statement's first words name the declared wait on its answer (awaitingPostgres): what a report shows. */
const waitNameWords = 6

/**
 * The backend each connection of den's clients signed in as: the process id its BackendKeyData names, which pg reads at
 * sign-in (signingIn), keyed by the connection pg submits every statement on.
 */
const backends = new WeakMap<object, number>()

/** Whether a message pg's connection emits is a BackendKeyData's, naming its backend's process id. */
const isBackendKeyData = (message: unknown): message is { readonly processID: number } =>
	Predicate.hasProperty(message, "processID") && Predicate.isNumber(message.processID)

/** `client`, its connection's backend recorded as it signs in (backends), for its statements' checked waits. */
export const signingIn = <C extends pgDriver.Client>(client: C): C => {
	client.connection.once("backendKeyData", (message: unknown) => {
		if (isBackendKeyData(message)) {
			backends.set(client.connection, message.processID)
		}
	})
	return client
}

/** The backend `connection` signed in as, or none before its BackendKeyData. */
export const backendOf = (connection: object): Option.Option<number> =>
	Option.fromNullishOr(backends.get(connection))

/**
 * `effect`, which awaits PostgreSQL's answer to `sql` on `member`, as a declared wait of this process on work the server
 * does: the server is no process of a case's tree, so a case's guard would read the wall time a statement spends in
 * flight, its CPU unmoved, as a stall, and judge a case hung that waits on a statement a loaded server is slow to
 * answer. A statement on a backend this process knows is a claim the guard checks against the member
 * (@bjornpagen/testing/live waitingOnWork, @bjornpagen/testing/pg-session backendWorking): its backend working is the
 * member's work, and one idle while its client still awaits it is none, which the guard reads as the stall it is; a
 * login, whose backend is not yet known, is a declared wait the guard trusts (waitingOn). Every place den's suites hand
 * work to PostgreSQL awaits its answer through this: grizzle's statements and logins under test (driverOf) and the
 * owner's sessions of support/slice.ts. Named by the statement's first words, so a verdict reached while it is open
 * names the statement.
 */
export const awaitingPostgres =
	(member: TlsMember, backend: Option.Option<number>) => (sql: string) => {
		const on = `PostgreSQL: ${Arr.join(Arr.take(Str.split(Str.trim(sql), regex("\\s+")), waitNameWords), " ")}`
		return Option.match(backend, {
			onNone: () => waitingOn(on),
			onSome: (pid) => waitingOnWork(on, backendWorking(member, pid))
		})
	}

/**
 * The pg module as den's suites hand it to grizzle's adapter for `member` (DbConnection.driver): pg's own classes, each
 * login and each statement awaiting PostgreSQL's answer (awaitingPostgres). Its Client awaits its login from its
 * construction, which the adapter and pg's Pool follow at once with its connect, to the first ReadyForQuery of its
 * connection, or its end or error (a connection that never stood ends, and pg reports its end), and records its backend
 * (signingIn). Its Query awaits its answer from the moment pg submits it on a connection, whose backend then answers for
 * it, to the end or the error pg reports for it: pg reports one of the two for every query it was given, a query of a
 * connection that ended included.
 */
const driverOf = (member: TlsMember): PgDriver => {
	class AwaitedQuery extends pgDriver.Query {
		constructor(config: ConstructorParameters<PgDriver["Query"]>[0]) {
			super(config)
			const answered = Deferred.makeUnsafe<void>()
			const settle = (): void => {
				Deferred.doneUnsafe(answered, Exit.void)
			}
			this.once("end", settle)
			this.once("error", settle)
			const submit = this.submit.bind(this)
			this.submit = (connection) => {
				Effect.runFork(
					awaitingPostgres(member, backendOf(connection))(config.text)(Deferred.await(answered))
				)
				return submit(connection)
			}
		}
	}
	class AwaitedClient extends pgDriver.Client {
		constructor(config: ConstructorParameters<PgDriver["Client"]>[0]) {
			super(config)
			signingIn(this)
			const ready = Deferred.makeUnsafe<void>()
			Effect.runFork(
				awaitingPostgres(member, Option.none())(`connect as ${config.user} to ${config.database}`)(
					Deferred.await(ready)
				)
			)
			const settle = (): void => {
				Deferred.doneUnsafe(ready, Exit.void)
			}
			this.connection.once("readyForQuery", settle)
			this.once("end", settle)
			this.once("error", settle)
		}
	}
	return {
		Client: AwaitedClient,
		Pool: pgDriver.Pool,
		Query: AwaitedQuery,
		DatabaseError: pgDriver.DatabaseError
	}
}

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

/** A connection to `database` on `member` over verify-full TLS against the member's CA, under `password`. */
export const connectionTo = (
	member: TlsMember,
	database: string,
	password: Redacted.Redacted
): DbConnection => ({
	driver: driverOf(member),
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
