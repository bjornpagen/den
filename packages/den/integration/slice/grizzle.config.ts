import net from "node:net"
import { connectTimeoutMillis } from "@bjornpagen/den/limits"
import { CredentialError, defineConfig } from "@bjornpagen/grizzle"
import { Config, Effect } from "effect"
import pgDriver from "pg"
import { App } from "#integration/slice/app.ts"
import { AppLogin, Worker } from "#integration/slice/logins.ts"

/**
 * The slice's configuration. `grizzle generate` and `grizzle check` never call its connection; `grizzle migrate` and
 * `grizzle uninstall`, which a suite runs for its own database, call it with the suite's database, role prefix,
 * cluster CA and owner password in the process's environment (support/slice.ts).
 */
export default defineConfig({
	schemas: [App],
	logins: [Worker, AppLogin],
	migrations: "migrations",
	connection: () => ({
		driver: pgDriver,
		transport: {
			kind: "sslRequest",
			host: "localhost",
			port: Effect.runSync(Config.Int("DEN_PG_PORT")),
			open: () => new net.Socket(),
			ca: Effect.runSync(Config.String("DEN_PG_CA")),
			servername: "localhost"
		},
		database: Effect.runSync(Config.String("DEN_DATABASE")),
		role: Effect.runSync(Config.String("DEN_PG_ROLE")),
		rolePrefix: Effect.runSync(Config.String("DEN_ROLE_PREFIX")),
		password: Config.Redacted("DEN_PG_PASSWORD").pipe(
			Effect.mapError((cause) => new CredentialError({ cause }))
		),
		connectTimeoutMs: connectTimeoutMillis.value
	})
})
