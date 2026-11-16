import { derived, published } from "@bjornpagen/limit"
import { authenticationTimeoutSeconds, maxConnections } from "#postgres.ts"

/**
 * den's own PostgreSQL cluster (scripts/pg.sh) and its suites' connections to it. pg.sh reads its settings from here
 * when it writes the cluster's configuration (`node` on this module), so the shell holds no copy of a number;
 * the limits skill, .agents/skills/limits; this package's README.
 */

/** How long one connection attempt to den's cluster may take: as long as the server lets it authenticate. */
export const connectTimeoutMillis = derived({
	owner: "den's suites on its own cluster (scripts/pg.sh)",
	unit: "milliseconds",
	scope:
		"one connection attempt of a suite's DbLayer, and the CancelRequest an interrupted statement sends",
	from: [authenticationTimeoutSeconds],
	derivation:
		"the cluster runs at PostgreSQL's default authentication_timeout, past which it closes the connection itself",
	compute: ([authentication]) => authentication.value * 1000
})

/**
 * The cluster's max_replication_slots and max_wal_senders, one bound for both: every live source's leader holds one
 * replication slot and one walsender, and each walsender holds a connection.
 */
export const replicationSlotsAndSenders = derived({
	owner: "den's cluster (scripts/pg.sh), max_replication_slots and max_wal_senders",
	unit: "replication slots, and walsenders",
	scope: "the replication slots, and apart from them the walsenders, of den's cluster",
	from: [maxConnections],
	derivation:
		"a walsender is a connection and a leader holds a slot with its walsender, so a bound of max_connections, which the cluster leaves at its default, can never be the one that runs out",
	compute: ([connections]) => connections.value
})

/**
 * The cluster's max_pred_locks_per_transaction: every grizzle transaction that is not certified READ COMMITTED is
 * SERIALIZABLE, and its writes and plain reads take predicate locks, which grizzle leaves the operator to size.
 */
export const maxPredLocksPerTransaction = published({
	value: 2048,
	owner: "grizzle, the operator's PostgreSQL settings its README recommends (vendor/grizzle)",
	unit: "predicate locks",
	scope:
		"the predicate locks of one transaction, on average, that den's cluster sizes its shared lock table by",
	constraint: "advisory threshold",
	source:
		"https://github.com/bjornpagen/grizzle/blob/8c0b69ea7f434cdbf51975f3c71eb4dac98c53d9/README.md#L1305",
	quote:
		"**`max_pred_locks_per_transaction = 2048`**, recommended: a server-start setting, about 115 MB of shared memory at 200 connections.",
	verified: "2026-11-16"
})
