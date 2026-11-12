#!/usr/bin/env bash
# den's own PostgreSQL 19 cluster, from the build grizzle's scripts/pg/build.sh makes. It never touches grizzle's
# cluster (port 5433) or its data directory.
#   pg.sh init [--force]   TLS material, configuration, the den_dev owner role and the template database
#   pg.sh start | stop | status
#   pg.sh psql [database] [psql args...]    verify-full TLS as den_dev
#   pg.sh admin [database] [psql args...]   bootstrap superuser over the socket
#   pg.sh reset                             drop every test database and every role but the bootstrap ones
#   pg.sh env                               the cluster's coordinates, one KEY=value per line, for the suites
set -euo pipefail

PG_VERSION=19rc1
PG_PORT=5435
DEV_ROLE=den_dev
TEMPLATE_DB=den_template
TEST_DB_PREFIX=den_t_
PREFIX="$HOME/.local/opt/postgresql/$PG_VERSION"
STATE="$HOME/.local/var/den/pg$PG_VERSION"
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

running() { "$(bin pg_ctl)" -D "$DATA" status >/dev/null 2>&1; }

admin_psql() { "$(bin psql)" -X -q -v ON_ERROR_STOP=1 -h "$SOCKET" -p "$PG_PORT" -U postgres "$@"; }

tls_psql() {
	local db=$1
	shift
	PGPASSWORD="$(cat "$PASSWORD_FILE")" "$(bin psql)" -X -q -v ON_ERROR_STOP=1 \
		"host=localhost port=$PG_PORT dbname=$db user=$DEV_ROLE sslmode=verify-full sslrootcert=$TLS/ca.crt" "$@"
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
	(
		cd "$TLS"
		openssl req -x509 -new -nodes -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -sha256 -days 3650 \
			-subj "/CN=den local development CA" -keyout ca.key -out ca.crt 2>/dev/null
		openssl req -new -nodes -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -sha256 \
			-subj "/CN=localhost" -keyout server.key -out server.csr 2>/dev/null
		printf "subjectAltName=DNS:localhost,IP:127.0.0.1,IP:::1\nextendedKeyUsage=serverAuth\n" >server.ext
		openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -sha256 -days 3650 \
			-extfile server.ext -out server.crt 2>/dev/null
		rm -f server.csr server.ext ca.srl
		chmod 600 ./*.key
	)
	openssl rand -hex 24 >"$PASSWORD_FILE"
	chmod 600 "$PASSWORD_FILE"

	"$(bin initdb)" -D "$DATA" -U postgres -E UTF8 \
		--locale-provider=builtin --builtin-locale=C.UTF-8 --locale=C.UTF-8 \
		--auth-local=peer --auth-host=reject >/dev/null

	# Every live source's leader holds one replication slot and one walsender, and each holds a connection: a bound of
	# max_connections (PostgreSQL's default, 100) for both can never be the one that runs out.
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
max_replication_slots = 100
max_wal_senders = 100
# Every grizzle transaction that is not certified READ COMMITTED is SERIALIZABLE: grizzle's README asks for 2048.
max_pred_locks_per_transaction = 2048
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
	admin_psql -d postgres -c "CREATE DATABASE $DEV_ROLE OWNER $DEV_ROLE TEMPLATE $TEMPLATE_DB"
	# A session inside the template would make every clone fail.
	admin_psql -d postgres -c "ALTER DATABASE $TEMPLATE_DB ALLOW_CONNECTIONS false"
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
