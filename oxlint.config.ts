import { standard } from "@bjornpagen/devtools/preset"
import {
	CASE_LISTS,
	CLOCK_RULES,
	EVERY_FILE_RULES,
	MODULE_RULES,
	TEST_RULES
} from "@bjornpagen/testing/oxlint"
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
		environment: { library: [], readers: [] },
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
						doors: ["vendor/toolchain/packages/testing/src/mutate/mutated.ts"],
						brands: ["RealPath"]
					},
					{
						doors: ["vendor/toolchain/packages/testing/src/mutate/checkout.ts"],
						brands: ["CheckoutDir"]
					}
				]
			},
			"no-raw-sql": { sources: [], writers: [] },
			"no-dynamic-imports": { allowed: [] },
			"no-spread-argument": { tuples: [] },
			"no-case-list": {
				searches: CASE_LISTS.searches,
				generators: CASE_LISTS.generators,
				mints: CASE_LISTS.mints,
				cases: ["packages/den-model/src/", "packages/edullm/"],
				dictionaries: []
			},
			"single-permit-owners": {
				owners: [
					{
						file: "packages/den/integration/support/runner.ts",
						reason:
							"An owner session's turn (ownerSession's `turn`): one connection's wire carries one statement and its answer at a time, so the toolchain's concurrent callers of the session take turns on it."
					}
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
			modules: MODULE_RULES,
			everyFile: EVERY_FILE_RULES,
			clock: { files: [], rules: CLOCK_RULES }
		},
		overrides: [
			{
				/** The slice's ledgers read the database's instant moved on by the time the suite's TestClock has travelled
				 * (travelling, openLedgers): reading Effect's Clock is this support module's job, and under a test it is the
				 * TestClock the case moves, never the machine's. */
				files: ["packages/den/integration/support/slice.ts"],
				rules: { "testing/no-wall-clock-verdict": "off" }
			}
		]
	})
)
