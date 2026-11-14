import { caseHang } from "@bjornpagen/den/limits"
import type { AnyLogin } from "@bjornpagen/grizzle"
import { served } from "@bjornpagen/grizzle/runtime"
import { exhaust } from "@bjornpagen/testing/explore"
import { requiredInSpace } from "@bjornpagen/testing/features"
import { element } from "@bjornpagen/testing/gen"
import { searched } from "@bjornpagen/testing/vitest"
import { NodeServices } from "@effect/platform-node"
import { assert, layer } from "@effect/vitest"
import {
	Array as Arr,
	Effect,
	FileSystem,
	Formatter,
	Option,
	Path,
	Record,
	Schema,
	Stream,
	String as Str
} from "effect"
import { ChildProcess } from "effect/process"
import config from "#integration/slice/grizzle.config.ts"

/**
 * What `grizzle generate` certifies. Every den role of the worker login, each flow's own, runs READ
 * COMMITTED: its relations are insert-only for every role, every law is a native key or containment, each selected
 * side of a result has one source, and every read of another call's rows is a point read of an insert-only relation by
 * a whole key. Each flow's coordinator role runs READ COMMITTED too: a seat, an exclusivity seat and a pause are each a
 * chain of turns it only inserts into, each turn after the first contained in its predecessor's end and each hold's
 * seat checked below the resource's count, all native laws, and its reads of the live turns and the latest turn are
 * deferrable reads of their own. The app's own roles, its writer, which den's commits run under beside the app's own
 * writes, and its auditor, run READ COMMITTED, exactly as when the installation holds no den program at all.
 *
 * Oracle (postgresql): `grizzle generate`'s certifier over the installation, against its certificate of the same
 * schema with den's logins and commits taken out.
 */

type Feature = "a den role" | "a coordinator role" | "an app role"

const sliceDir = `${import.meta.dirname}/slice`
const grizzleBin = `${import.meta.dirname}/../../../vendor/grizzle/packages/grizzle/src/cli/main.ts`

/** The roles of a login's served file, with the level `grizzle generate` certified each at. */
const levelsOf = (file: string, login: string) =>
	Effect.gen(function* () {
		const fs = yield* FileSystem.FileSystem
		const text = yield* fs.readFileString(file)
		const json = yield* Schema.decodeEffect(Schema.fromJsonString(Schema.Unknown))(text)
		return Arr.map(Record.toEntries(served<AnyLogin>(json, login).roles), ([name, role]) => ({
			name,
			isolation: role.isolation
		}))
	})

/** The app login's levels when the installation holds no den program: `grizzle generate` in a scratch workspace. */
const withoutDen = Effect.scoped(
	Effect.gen(function* () {
		const fs = yield* FileSystem.FileSystem
		const path = yield* Path.Path
		const workspace = yield* fs.makeTempDirectoryScoped({
			directory: import.meta.dirname,
			prefix: ".certify-"
		})
		yield* fs.writeFileString(
			path.join(workspace, "grizzle.config.ts"),
			Arr.join(
				[
					`import { defineConfig, login } from "@bjornpagen/grizzle"`,
					`import { App } from "#integration/slice/app.ts"`,
					`import { appWorkload, Auditor, auditWorkload } from "#integration/slice/app-programs.ts"`,
					`import { Loader } from "#integration/slice/roles.ts"`,
					``,
					`const AppAlone = login(App, "app", [Loader, Auditor], { workload: [appWorkload, auditWorkload] })`,
					``,
					`/** generate never connects, so the connection is the slice's shape with no coordinates of its own. */`,
					`export default defineConfig({ schemas: [App], logins: [AppAlone], migrations: "migrations", connection: () => { throw new Error("generate never connects") } })`,
					``
				],
				"\n"
			)
		)
		const handle = yield* ChildProcess.make(
			process.execPath,
			[grizzleBin, "generate", "grizzle.config.ts"],
			{ cwd: workspace, extendEnv: true, stdin: "ignore" }
		)
		const [out, code] = yield* Effect.all(
			[Stream.mkString(Stream.decodeText(handle.stdout)), handle.exitCode],
			{
				concurrency: "unbounded"
			}
		)
		assert.strictEqual(code, 0, out)
		return yield* levelsOf(path.join(workspace, "migrations", "slice", "served", "app.json"), "app")
	})
)

layer(NodeServices.layer, { excludeTestServices: true })("certification", (it) => {
	it.effect(
		"certifies den's roles and its coordinator roles READ COMMITTED, the app's as without den",
		(ctx) =>
			searched(
				ctx,
				Effect.gen(function* () {
					const servedFile = (name: string) => `${sliceDir}/migrations/slice/served/${name}.json`
					assert.deepStrictEqual(
						Arr.map(config.logins, (login) => login.name),
						["worker", "app"]
					)
					const workers = yield* levelsOf(servedFile("worker"), "worker")
					const apps = yield* levelsOf(servedFile("app"), "app")
					const alone = yield* withoutDen
					const owned = (of: "worker" | "app") => (role: (typeof workers)[number]) => ({
						...role,
						of
					})
					const roles = [...Arr.map(workers, owned("worker")), ...Arr.map(apps, owned("app"))]
					if (!Arr.isReadonlyArrayNonEmpty(roles)) {
						return yield* Effect.die("the slice's logins hold roles")
					}
					return yield* exhaust(
						{
							suite: "certification",
							generator: element(roles),
							literal: Formatter.format,
							coverage: requiredInSpace<Feature>([
								"a den role",
								"a coordinator role",
								"an app role"
							]),
							caseHang,
							box: "every role of the slice's worker and app logins",
							oracle: {
								kind: "postgresql",
								name: "grizzle generate's certificate, against the schema's with den's logins and commits taken out"
							}
						},
						(role, c) =>
							Effect.sync(() => {
								if (role.of === "app") {
									c.note("an app role")
									assert.strictEqual(role.isolation, "readCommitted")
									const before = Arr.findFirst(alone, (r) => r.name === role.name)
									assert.deepStrictEqual(
										Option.map(before, (r) => r.isolation),
										Option.some(role.isolation)
									)
									return
								}
								c.note(
									Str.endsWith("_coordinator")(role.name) ? "a coordinator role" : "a den role"
								)
								assert.strictEqual(role.isolation, "readCommitted")
							})
					)
				})
			)
	)
})
