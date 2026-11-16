import { published } from "@bjornpagen/limit"

/** PostgreSQL 19's own numbers: the defaults den's cluster and suites run at (the limits skill, .agents/skills/limits; this package's README). */

/** The PostgreSQL documentation every PostgreSQL limit is read from: release 19's, which documents 19rc2, den's pin. */
const connectionsPage = "https://www.postgresql.org/docs/19/runtime-config-connection.html"

/**
 * How long a PostgreSQL server lets a client take to authenticate before it closes the connection, by default: no
 * connection attempt to a server at its default can usefully take longer.
 */
export const authenticationTimeoutSeconds = published({
	value: 60,
	owner: "PostgreSQL 19, the authentication_timeout setting",
	unit: "seconds",
	scope:
		"one client's authentication on one connection, from its start until the server closes the connection",
	constraint: "configurable default",
	source: connectionsPage,
	quote:
		"Maximum amount of time allowed to complete client authentication. [...] The default is one minute (1m).",
	verified: "2026-11-16"
})

/**
 * How many connections a PostgreSQL server admits at once, by default: den's cluster leaves max_connections at it, so
 * nothing that holds a connection can be more numerous.
 */
export const maxConnections = published({
	value: 100,
	owner: "PostgreSQL 19, the max_connections setting",
	unit: "connections",
	scope: "the concurrent connections of one server",
	constraint: "configurable default",
	source: connectionsPage,
	quote:
		"Determines the maximum number of concurrent connections to the database server. The default is typically 100 connections, but might be less if your kernel settings will not support it (as determined during initdb).",
	verified: "2026-11-16"
})
