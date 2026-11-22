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

const { active, lintConfig } = standard(toolchain)

/** den's lists for the shared standard; everything else comes from the dev tools' preset. */
export default defineConfig(
	lintConfig({
		ignorePatterns: ["sources/**", "vendor/**"],
		restrictedImports: { paths: [], patterns: [] },
		restrictedGlobals: [],
		restrictedProperties: [],
		restrictions: [],
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
				files: ["packages/den/integration/support/slice.ts"],
				rules: active({
					/** A case moves the database's clock by the time its TestClock has travelled (Offset, offsetLayer): reading Effect's Clock is this support module's job, and under a test it is the TestClock the case moves, never the machine's. */
					"testing/no-wall-clock-verdict": "off"
				})
			},
			{
				files: ["packages/edullm/src/fingerprint.ts"],
				rules: active({
					/** Timeback's key digest is an MD5 Timeback's replica computes (PostgreSQL's md5 over concat_ws('|', …) in its daily print), an outside system's definition the bucketed fingerprint must match byte for byte, so digestOf computes the same MD5. */
					"devtools/sha256-digests": "off"
				})
			}
		]
	})
)
