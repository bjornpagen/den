import { caseHang } from "@bjornpagen/den/limits"
import { exhaust } from "@den/testing/explore"
import { requiredInSpace } from "@den/testing/features"
import { element } from "@den/testing/gen"
import { searched } from "@den/testing/vitest"
import { NodeServices } from "@effect/platform-node"
import { layer } from "@effect/vitest"
import { assert } from "@effect/vitest"
import { Array as Arr, Effect, FileSystem, Formatter, Option, Path, Schema, Stream } from "effect"
import { ChildProcess } from "effect/process"
import config from "#integration/slice/grizzle.config.ts"

/**
 * What `grizzle generate` certifies. Every role of the slice's two logins, den's workers and the app's auditor, runs
 * READ COMMITTED: den's relations are insert-only for every role, every law is a native key or containment, and every
 * read of another call's rows is a point read of an insert-only relation by a whole key. And the app's auditor, which
 * reads den's results and inserts audits referencing them by foreign key, is certified exactly as when the
 * installation holds no den writer at all: den's workers move no app role.
 *
 * Oracle (postgresql): `grizzle generate`'s certifier over the installation, against its certificate of the same
 * installation without den's workers.
 */

type Feature = "a den worker" | "an app role"

const Served = Schema.Struct({
	roles: Schema.Struct({
		"~a": Schema.Array(
			Schema.Struct({
				name: Schema.String,
				isolation: Schema.Literals(["readCommitted", "serializable"])
			})
		)
	})
})

const sliceDir = `${import.meta.dirname}/slice`

/** The served file of each login the slice's committed configuration lists. */
const servedFiles = Arr.map(
	config.logins,
	(login) => `${sliceDir}/migrations/slice/served/${login.name}.json`
)
const grizzleBin = `${import.meta.dirname}/../../../vendor/grizzle/packages/grizzle/src/cli/main.ts`

/** The roles of a served file, with the level `grizzle generate` certified each at. */
const levelsOf = (file: string) =>
	Effect.gen(function* () {
		const fs = yield* FileSystem.FileSystem
		const text = yield* fs.readFileString(file)
		const served = yield* Schema.decodeEffect(Schema.fromJsonString(Served))(text)
		return served.roles["~a"]
	})

/** The app login's levels when the installation lists no den login: `grizzle generate` in a scratch workspace. */
const withoutDen = Effect.scoped(
	Effect.gen(function* () {
		const fs = yield* FileSystem.FileSystem
		const path = yield* Path.Path
		const workspace = yield* fs.makeTempDirectoryScoped({
			directory: path.join(import.meta.dirname),
			prefix: ".certify-"
		})
		yield* fs.writeFileString(
			path.join(workspace, "grizzle.config.ts"),
			`import { defineConfig } from "@bjornpagen/grizzle"\nimport { App } from "#integration/slice/app.ts"\nimport { AppLogin } from "#integration/slice/logins.ts"\nimport base from "#integration/slice/grizzle.config.ts"\n\nexport default defineConfig({ ...base, schemas: [App], logins: [AppLogin] })\n`
		)
		const handle = yield* ChildProcess.make(
			process.execPath,
			["--conditions=grizzle-source", grizzleBin, "generate", "grizzle.config.ts"],
			{ cwd: workspace, extendEnv: true, stdin: "ignore" }
		)
		const [, code] = yield* Effect.all(
			[Stream.mkString(Stream.decodeText(handle.stdout)), handle.exitCode],
			{ concurrency: "unbounded" }
		)
		assert.strictEqual(code, 0)
		return yield* levelsOf(path.join(workspace, "migrations", "slice", "served", "app.json"))
	})
)

layer(NodeServices.layer, { excludeTestServices: true })("certification", (it) => {
	it.effect("certifies every role READ COMMITTED, the app's as without den", (ctx) =>
		searched(
			ctx,
			Effect.gen(function* () {
				assert.deepStrictEqual(servedFiles, [
					`${sliceDir}/migrations/slice/served/worker.json`,
					`${sliceDir}/migrations/slice/served/app.json`
				])
				const workers = yield* levelsOf(`${sliceDir}/migrations/slice/served/worker.json`)
				const apps = yield* levelsOf(`${sliceDir}/migrations/slice/served/app.json`)
				const alone = yield* withoutDen
				const owned = (of: "den" | "app") => (role: (typeof workers)[number]) => ({ ...role, of })
				const roles = [...Arr.map(workers, owned("den")), ...Arr.map(apps, owned("app"))]
				if (!Arr.isReadonlyArrayNonEmpty(roles)) {
					return yield* Effect.die("the slice's logins hold roles")
				}
				return yield* exhaust(
					{
						suite: "certification",
						generator: element(roles),
						literal: Formatter.format,
						limit: roles.length,
						coverage: requiredInSpace<Feature>(["a den worker", "an app role"]),
						caseHang,
						box: "every role of the slice's worker and app logins",
						oracle: {
							kind: "postgresql",
							name: "grizzle generate's certificate, against the installation's without den's workers"
						}
					},
					(role, c) =>
						Effect.sync(() => {
							c.note(role.of === "den" ? "a den worker" : "an app role")
							assert.strictEqual(role.isolation, "readCommitted")
							if (role.of === "app") {
								const before = Arr.findFirst(alone, (r) => r.name === role.name)
								assert.deepStrictEqual(
									Option.map(before, (r) => r.isolation),
									Option.some(role.isolation)
								)
							}
						})
				)
			})
		)
	)
})
