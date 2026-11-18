#!/usr/bin/env bash
# den's own PostgreSQL 19 cluster, run from the build vendor/grizzle pins (scripts/pg/pin.env), which grizzle's
# scripts/pg/build.sh makes. It never touches grizzle's cluster (port 5433) or its data directory. The data directory
# carries the pinned version it was initialized from, and start refuses it once the pin moves on.
#   pg.sh init [--force]   TLS material, configuration, the den_dev owner role and the template database
#   pg.sh start | stop | status             start issues the TLS material again once it has expired
#   pg.sh psql [database] [psql args...]    verify-full TLS as den_dev
#   pg.sh admin [database] [psql args...]   bootstrap superuser over the socket
#   pg.sh reset                             drop every test database and every role but the bootstrap ones
#   pg.sh env                               the cluster's coordinates, one KEY=value per line, for the suites
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN="$ROOT/vendor/grizzle/scripts/pg/pin.env"
if [[ ! -f "$PIN" ]]; then
	echo "grizzle's PostgreSQL pin $PIN is missing; run git submodule update --init" >&2
	exit 1
fi
# One setting of grizzle's pin, read in a subshell so none of the pin's other settings reaches this script.
pinned() { (source "$PIN" && printf '%s' "${!1}"); }
PG_VERSION="$(pinned PG_PIN_VERSION)"
PREFIX="$(pinned GRIZZLE_PG_PREFIX)"
PG_PORT=5435
DEV_ROLE=den_dev
TEMPLATE_DB=den_template
TEST_DB_PREFIX=den_t_
STATE="$HOME/.local/var/den/pg"
STAMP="$STATE/pin"
DATA="$STATE/data"
TLS="$STATE/tls"
LOG="$STATE/log"
SOCKET="$STATE/socket"
PASSWORD_FILE="$STATE/$DEV_ROLE.password"

bin() { echo "$PREFIX/bin/$1"; }

require_build() {
	if [[ ! -x "$(bin postgres)" ]]; then
		echo "PostgreSQL $PG_VERSION is not built at $PREFIX; run grizzle's scripts/pg/build.sh" >&2
		exit 1
	fi
}

require_stamp() {
	if [[ ! -f "$STAMP" ]]; then
		echo "den's cluster at $STATE records no PostgreSQL version; run pg.sh init, with --force if $STATE exists" >&2
		exit 1
	fi
	if [[ "$(cat "$STAMP")" != "$PG_VERSION" ]]; then
		echo "den's cluster at $STATE was initialized from PostgreSQL $(cat "$STAMP"), not the pinned $PG_VERSION; run pg.sh init --force" >&2
		exit 1
	fi
}

running() { "$(bin pg_ctl)" -D "$DATA" status >/dev/null 2>&1; }

admin_psql() { "$(bin psql)" -X -q -v ON_ERROR_STOP=1 -h "$SOCKET" -p "$PG_PORT" -U postgres "$@"; }

tls_psql() {
	local db=$1
	shift
	PGPASSWORD="$(cat "$PASSWORD_FILE")" "$(bin psql)" -X -q -v ON_ERROR_STOP=1 \
		"host=localhost port=$PG_PORT dbname=$db user=$DEV_ROLE sslmode=verify-full sslrootcert=$TLS/ca.crt" "$@"
}

# The cluster's CA and the server's certificate, each for openssl's default lifetime: start issues both again once
# either has expired, so the cluster needs no lifetime of its own.
issue_tls() {
	(
		cd "$TLS"
		openssl req -x509 -new -nodes -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -sha256 \
			-subj "/CN=den local development CA" -keyout ca.key -out ca.crt 2>/dev/null
		openssl req -new -nodes -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -sha256 \
			-subj "/CN=localhost" -keyout server.key -out server.csr 2>/dev/null
		printf "subjectAltName=DNS:localhost,IP:127.0.0.1,IP:::1\nextendedKeyUsage=serverAuth\n" >server.ext
		openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -sha256 \
			-extfile server.ext -out server.crt 2>/dev/null
		rm -f server.csr server.ext ca.srl
		chmod 600 ./*.key
	)
}

tls_current() {
	openssl x509 -checkend 0 -noout -in "$TLS/ca.crt" >/dev/null &&
		openssl x509 -checkend 0 -noout -in "$TLS/server.crt" >/dev/null
}

init() {
	if [[ -d "$STATE" ]]; then
		if [[ "${1:-}" != "--force" ]]; then
			echo "A cluster already exists at $DATA; pass --force to delete and recreate it" >&2
			exit 1
		fi
		running && "$(bin pg_ctl)" -D "$DATA" -m fast -w stop >/dev/null
		rm -rf "$STATE"
	fi
	mkdir -p "$TLS" "$LOG" "$SOCKET"
	chmod 700 "$STATE"
	issue_tls
	openssl rand -hex 24 >"$PASSWORD_FILE"
	chmod 600 "$PASSWORD_FILE"

	"$(bin initdb)" -D "$DATA" -U postgres -E UTF8 \
		--locale-provider=builtin --builtin-locale=C.UTF-8 --locale=C.UTF-8 \
		--auth-local=peer --auth-host=reject >/dev/null

	# The cluster's max_replication_slots and max_wal_senders, one bound for both: every live source's leader holds one
	# replication slot and one walsender, and each walsender holds a connection.
	#
	# @limitKind derived
	# @unit replication slots, and walsenders
	# @derivation a walsender is a connection and a leader holds a slot with its walsender, so a bound of
	#   max_connections, which the cluster leaves at its default, can never be the one that runs out
	# @from max_connections, PostgreSQL 19's default of 100 connections (published, configurable default;
	#   https://www.postgresql.org/docs/19/runtime-config-connection.html: "Determines the maximum number of concurrent
	#   connections to the database server. The default is typically 100 connections, but might be less if your kernel
	#   settings will not support it (as determined during initdb)."; verified 2026-11-16)
	local replication=100
	# The cluster's max_pred_locks_per_transaction: every grizzle transaction that is not certified READ COMMITTED is
	# SERIALIZABLE, and its writes and plain reads take predicate locks, which grizzle leaves the operator to size.
	#
	# @limitKind published
	# @owner grizzle, the operator's PostgreSQL settings its README recommends (vendor/grizzle)
	# @unit predicate locks
	# @constraint advisory threshold
	# @source https://github.com/bjornpagen/grizzle/blob/8c0b69ea7f434cdbf51975f3c71eb4dac98c53d9/README.md#L1305
	# @quote **`max_pred_locks_per_transaction = 2048`**, recommended: a server-start setting, about 115 MB of shared
	#   memory at 200 connections.
	# @verified 2026-11-16
	local pred_locks=2048
	# The cluster's client_connection_check_interval: a backend polls its client's socket this often while it runs a
	# statement, so the backend of a test process killed mid-statement (a hang guard, a SIGKILL) ends at its next poll
	# and lets go of its transaction id and its locks, where without it the backend runs on until the statement ends,
	# and every logical slot's creation (a live source's) waits for every transaction id running when it starts. An
	# idle session is never polled.
	#
	# @limitKind measured
	# @owner grizzle's local test clusters (vendor/grizzle/packages/pg/src/settings.ts, clientCheckInterval), whose
	#   evidence is this number's
	# @unit milliseconds
	# @source https://github.com/bjornpagen/grizzle/blob/e713f6c59bcdad5d21e1f54c210a1ab0df78a7ec/packages/pg/src/settings.ts#L14-L40
	# @result polls cost nothing measurable on a statement of seconds (median 5,762.8 ms at 0, 5,754.7 ms at 1,000);
	#   backends of SIGKILLed clients left pg_stat_activity 1,000 to 1,017 ms after the kill at 1,000, where orphans at
	#   0 ran 44 minutes to 5.7 hours
	# @verified 2026-11-17
	local client_check=1000
	cat >>"$DATA/postgresql.conf" <<EOF

# den's cluster (scripts/pg.sh). Everything else is the PostgreSQL $PG_VERSION default.
port = $PG_PORT
listen_addresses = 'localhost'
unix_socket_directories = '$SOCKET'
ssl = on
ssl_cert_file = '$TLS/server.crt'
ssl_key_file = '$TLS/server.key'
ssl_min_protocol_version = 'TLSv1.3'
password_encryption = 'scram-sha-256'
# grizzle's live reads decode the WAL, and grizzle migrate refuses a cluster below logical.
wal_level = logical
# The cluster never waits for the disk. A suite's database is a clone of the template made for it and dropped after it,
# and every DROP DATABASE forces a checkpoint it waits for, which with fsync on syncs every file the cluster wrote since
# the last one. No answer a suite reads changes: the WAL is still written and its flush pointer still advances past every
# commit. What it gives up is surviving a crash of the machine, which a test cluster, made again by init, never needs.
# grizzle's local test clusters hold the same (vendor/grizzle/packages/pg/src/settings.ts, clusterSettings).
fsync = off
# The three locals above, with each number's evidence.
max_replication_slots = $replication
max_wal_senders = $replication
max_pred_locks_per_transaction = $pred_locks
client_connection_check_interval = $client_check
logging_collector = on
log_directory = '$LOG'
log_filename = 'postgresql-%Y-%m-%d.log'
EOF

	cat >"$DATA/pg_hba.conf" <<EOF
local   all   postgres                 peer map=admin
hostssl all   all        127.0.0.1/32  scram-sha-256
hostssl all   all        ::1/128       scram-sha-256
hostssl replication all  127.0.0.1/32  scram-sha-256
hostssl replication all  ::1/128       scram-sha-256
EOF
	cat >"$DATA/pg_ident.conf" <<EOF
admin   $(id -un)   postgres
EOF

	"$(bin pg_ctl)" -D "$DATA" -l "$LOG/startup.log" -w start >/dev/null
	local password
	password="$(cat "$PASSWORD_FILE")"
	admin_psql -d postgres <<SQL
-- REPLICATION, so the migration identity gives each installation's decoder login its replication right.
CREATE ROLE $DEV_ROLE LOGIN CREATEDB CREATEROLE REPLICATION PASSWORD '$password';
-- DROP DATABASE ... WITH (FORCE) ends the sessions of the roles a suite's migrations created, which only a member of
-- pg_signal_backend may do for roles it is not a member of.
GRANT pg_signal_backend TO $DEV_ROLE;
CREATE DATABASE $TEMPLATE_DB OWNER $DEV_ROLE TEMPLATE template0 ENCODING 'UTF8'
	LOCALE_PROVIDER builtin BUILTIN_LOCALE 'C.UTF-8' LOCALE 'C.UTF-8' IS_TEMPLATE true;
SQL
	# pgvector is no trusted extension, so the owner, a migration identity that is no superuser, cannot create it: the
	# template carries it in vector_ext, the schema grizzle compiles a vector field's type and operators into, and a
	# migration's "create if absent" finds it there (vendor/grizzle's scripts/pg/init.sh does the same).
	admin_psql -d "$TEMPLATE_DB" <<SQL
CREATE SCHEMA vector_ext AUTHORIZATION $DEV_ROLE;
CREATE EXTENSION vector SCHEMA vector_ext;
SQL
	admin_psql -d postgres -c "CREATE DATABASE $DEV_ROLE OWNER $DEV_ROLE TEMPLATE $TEMPLATE_DB"
	# A session inside the template would make every clone fail.
	admin_psql -d postgres -c "ALTER DATABASE $TEMPLATE_DB ALLOW_CONNECTIONS false"
	printf '%s\n' "$PG_VERSION" >"$STAMP"
	echo "den's cluster: PostgreSQL $PG_VERSION on localhost:$PG_PORT (verify-full TLS, CA $TLS/ca.crt)"
	echo "Owner role $DEV_ROLE; password in $PASSWORD_FILE; template database $TEMPLATE_DB"
}

require_build
case "${1:-}" in
	init)
		shift
		init "${1:-}"
		;;
	start)
		require_stamp
		if ! tls_current; then
			issue_tls
			running && "$(bin pg_ctl)" -D "$DATA" reload >/dev/null
		fi
		running || "$(bin pg_ctl)" -D "$DATA" -l "$LOG/startup.log" -w start >/dev/null
		echo "PostgreSQL $PG_VERSION running on localhost:$PG_PORT"
		;;
	stop)
		running && "$(bin pg_ctl)" -D "$DATA" -m fast -w stop >/dev/null
		echo "PostgreSQL stopped"
		;;
	status)
		if running; then
			echo "PostgreSQL $PG_VERSION running on localhost:$PG_PORT"
		else
			echo "PostgreSQL stopped"
			exit 3
		fi
		;;
	psql)
		shift
		db="${1:-$DEV_ROLE}"
		shift || true
		tls_psql "$db" "$@"
		;;
	admin)
		shift
		db="${1:-postgres}"
		shift || true
		admin_psql -d "$db" "$@"
		;;
	reset)
		for db in $(admin_psql -d postgres -At -c "SELECT datname FROM pg_database WHERE starts_with(datname, '$TEST_DB_PREFIX')"); do
			admin_psql -d postgres -c "DROP DATABASE \"$db\" WITH (FORCE)"
		done
		for role in $(admin_psql -d postgres -At -c "SELECT rolname FROM pg_roles WHERE NOT starts_with(rolname, 'pg_') AND rolname NOT IN ('postgres', '$DEV_ROLE')"); do
			for db in $(admin_psql -d postgres -At -c "SELECT datname FROM pg_database WHERE datallowconn"); do
				admin_psql -d "$db" -c "DROP OWNED BY \"$role\"" >/dev/null
			done
			admin_psql -d postgres -c "DROP ROLE \"$role\""
		done
		echo "Test databases and non-bootstrap roles dropped"
		;;
	env)
		echo "DEN_PG_PORT=$PG_PORT"
		echo "DEN_PG_ROLE=$DEV_ROLE"
		echo "DEN_PG_TEMPLATE=$TEMPLATE_DB"
		echo "DEN_PG_TEST_PREFIX=$TEST_DB_PREFIX"
		echo "DEN_PG_CA=$TLS/ca.crt"
		echo "DEN_PG_PASSWORD_FILE=$PASSWORD_FILE"
		;;
	*)
		sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//' >&2
		exit 2
		;;
esac
