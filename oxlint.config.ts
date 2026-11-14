import { standard } from "@bjornpagen/devtools/preset"
import { CLOCK_RULES, EVERY_FILE_RULES, TEST_RULES } from "@bjornpagen/testing/oxlint"
import { defineConfig } from "oxlint"
import toolchain from "#toolchain.config.ts"

const { lintConfig } = standard(toolchain)

const ZOD = {
	name: "zod",
	message:
		"Zod is banned. Effect Schema admits a foreign value once at its boundary, into a type that carries the proof."
} as const

/** den's lists for the shared standard; everything else comes from the dev tools' preset. */
export default defineConfig(
	lintConfig({
		ignorePatterns: ["sources/**", "vendor/**"],
		restrictedImports: { paths: [ZOD], patterns: [] },
		restrictedGlobals: [],
		restrictedProperties: [],
		unassignedImports: [],
		ceremony: [],
		plugin: {
			"bearer-owners": {
				owners: ["packages/den-vercel/src/census.ts", "packages/den-vercel/test/census.test.ts"]
			},
			"side-effect-free": { modules: [] },
			"import-doors": { doors: [] },
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
		overrides: []
	})
)
