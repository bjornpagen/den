import { active, lintConfig } from "@den/devtools/preset"
import { CLOCK_RULES, TEST_RULES } from "@den/testing/oxlint"
import { defineConfig } from "oxlint"

const ZOD = {
	name: "zod",
	message:
		"Zod is banned. Effect Schema admits a foreign value once at its boundary, into a type that carries the proof."
} as const

/** den's lists for the shared standard; everything else comes from the dev tools' preset. */
export default defineConfig(
	lintConfig({
		ignorePatterns: ["packages/devtools/src/*/fixtures/**", "sources/**"],
		restrictedImports: { paths: [ZOD], patterns: [] },
		restrictedGlobals: [],
		restrictedProperties: [],
		unassignedImports: [],
		effectFree: [],
		ceremony: ["packages/devtools/**"],
		plugin: {
			"import-doors": { doors: [] },
			"brands-sole-mint": {
				mints: [{ doors: ["packages/testing/src/vitest/mutated-file.ts"], brands: ["RealPath"] }]
			},
			"no-raw-sql": { sources: ["packages/testing/src", "packages/devtools/src"], writers: [] },
			"no-dynamic-imports": { allowed: [] },
			"test-no-prose-search": {
				fields: ["capability", "what"],
				textHelpers: ["containsText", "lacksText", "contains", "lacks"],
				searchHelpers: ["contains", "containsText"]
			},
			"test-no-spelled-names": { markers: [] }
		},
		tests: {
			jsPlugin: "@den/testing/oxlint",
			rules: TEST_RULES,
			clock: { files: ["packages/testing/src/**"], rules: CLOCK_RULES }
		},
		overrides: [
			{
				files: ["packages/testing/**"],
				rules: active({
					/** The library's own suites draw each count they pass makeBy at least 1. */
					"testing/no-clamped-count": "off"
				})
			},
			{
				files: ["packages/testing/src/witness.fixtures.ts"],
				rules: active({
					/** A type test's refusal is a `@ts-expect-error` that names what it refuses. */
					"typescript/ban-ts-comment": [
						"error",
						{
							"ts-check": true,
							"ts-expect-error": "allow-with-description",
							"ts-ignore": true,
							"ts-nocheck": true
						}
					]
				})
			},
			{
				files: ["packages/testing/src/live.ts"],
				rules: active({
					/** The live clock a case's hang guard and a fuzz run's time budget read: its job is the clock. */
					"testing/no-wall-clock-verdict": "off"
				})
			}
		]
	})
)
