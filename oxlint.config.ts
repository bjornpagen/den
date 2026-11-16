import { LIMIT_TESTS, standard } from "@bjornpagen/devtools/preset"
import { CLOCK_RULES, EVERY_FILE_RULES, TEST_RULES } from "@bjornpagen/testing/oxlint"
import { defineConfig } from "oxlint"
import toolchain from "#toolchain.config.ts"

const { lintConfig } = standard(toolchain)

const ZOD = {
	name: "zod",
	message:
		"Zod is banned. Effect Schema admits a foreign value once at its boundary, into a type that carries the proof."
} as const

/**
 * Where den's limits are minted and written (@den/limits), and the test files the limit rules leave alone: the dev
 * tools' list, and the vertical slice's suites and their support (integration/).
 */
const LIMITS = {
	packages: ["packages/limits"],
	tests: {
		suffixes: LIMIT_TESTS.suffixes,
		directories: [...LIMIT_TESTS.directories, "integration"]
	}
} as const

/** den's lists for the shared standard; everything else comes from the dev tools' preset. */
export default defineConfig(
	lintConfig({
		ignorePatterns: ["sources/**", "vendor/**"],
		restrictedImports: { paths: [ZOD], patterns: [] },
		restrictedGlobals: [],
		restrictedProperties: [],
		unassignedImports: [],
		environment: { library: [], readers: [] },
		ceremony: [],
		plugin: {
			"bearer-owners": {
				owners: ["packages/den-vercel/src/census.ts", "packages/den-vercel/test/census.test.ts"]
			},
			"side-effect-free": { modules: [] },
			"import-doors": { doors: [] },
			"limits-sole-mint": LIMITS,
			"no-bare-limit": LIMITS,
			"brands-sole-mint": {
				mints: [
					{
						doors: ["vendor/toolchain/packages/testing/src/random.ts"],
						brands: ["LabelStream", "RunStream"]
					},
					{
						doors: ["vendor/toolchain/packages/testing/src/vitest/mutated-file.ts"],
						brands: ["RealPath"]
					}
				]
			},
			"no-raw-sql": { sources: [], writers: [] },
			"no-dynamic-imports": { allowed: [] },
			"no-spread-argument": { tuples: [] },
			"no-case-list": {
				searches: [
					{ module: "@bjornpagen/testing/explore", name: "exhaust", space: "generator" },
					{ module: "@bjornpagen/testing/explore", name: "explore", space: "draw" }
				],
				generators: [
					{ module: "@bjornpagen/testing/gen", names: ["element"], draws: "list" },
					{ module: "@bjornpagen/testing/gen", names: ["constant"], draws: "value" },
					{ module: "@bjornpagen/testing/gen", names: ["map", "span"], draws: "each" },
					{
						module: "@bjornpagen/testing/gen",
						names: ["oneOf", "weighted", "proportional"],
						draws: "union"
					},
					{ module: "@bjornpagen/testing/explore", names: ["drawn", "sketched"], draws: "each" }
				],
				cases: [
					"packages/den/test/",
					"packages/den/integration/",
					"packages/den-model/src/",
					"packages/den-vercel/test/",
					"packages/edullm/"
				]
			},
			"test-no-prose-search": {
				fields: ["capability", "what"],
				textHelpers: ["containsText", "lacksText", "contains", "lacks"],
				searchHelpers: ["contains", "containsText"]
			},
			"test-no-spelled-names": { markers: [] }
		},
		ownPlugins: [],
		tests: {
			library: "installed",
			jsPlugin: "@bjornpagen/testing/oxlint",
			rules: TEST_RULES,
			everyFile: EVERY_FILE_RULES,
			clock: { files: [], rules: CLOCK_RULES }
		},
		overrides: [
			{
				/** den's test support packages, the reference model and simulator (den-model) and the outside systems' fakes
				 * (edullm): what is left in them are a search's generator bounds and draw weights, a test's own inputs, as
				 * the limit rules leave a test file's alone; the limits they model are read from @den/limits all the same. */
				files: ["packages/den-model/**", "packages/edullm/**"],
				rules: { "devtools/no-bare-limit": "off", "devtools/limits-sole-mint": "off" }
			}
		]
	})
)
