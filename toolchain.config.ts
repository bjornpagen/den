import { grizzle, toolchain } from "@bjornpagen/devtools/config"

/** den's toolchain: the rules and diagnostics it rejects, its Effect-free packages and its packs. */
export default toolchain({
	rejected: {
		rules: {
			"eslint/constructor-super": "the compiler owns it (TS2335, TS2377)",
			"eslint/getter-return": "the compiler owns it (TS2378)",
			"eslint/init-declarations":
				"it forces an initializer on every let, which is a sentinel, and definite-assignment analysis already proves an uninitialized let is set on every path",
			"eslint/max-depth": "it breeds single-use helpers to cut nesting",
			"eslint/no-class-assign": "the compiler owns it (TS2629)",
			"eslint/no-const-assign": "the compiler owns it (TS2588)",
			"eslint/no-dupe-class-members": "the compiler owns it (TS2393, TS2300)",
			"eslint/no-dupe-keys": "the compiler owns it (TS1117)",
			"eslint/no-fallthrough": "the compiler owns it (noFallthroughCasesInSwitch)",
			"eslint/no-func-assign": "the compiler owns it (TS2630)",
			"eslint/no-implied-eval": "its type-aware twin typescript/no-implied-eval owns it",
			"eslint/no-import-assign": "the compiler owns it (TS2632, TS2540)",
			"eslint/no-inner-declarations":
				"it is an ES5-era rule: a block-level function is legal in a strict module",
			"eslint/no-new-native-nonconstructor": "the compiler owns it (TS7009)",
			"eslint/no-obj-calls": "the compiler owns it (TS2349)",
			"eslint/no-redeclare":
				"it flags a type and a value of the same name, such as a brand and its mint or a Schema and its type, which TypeScript allows, and TypeScript already refuses a real redeclaration",
			"eslint/no-setter-return": "the compiler owns it (TS2408)",
			"eslint/no-this-before-super": "the compiler owns it (TS2376, TS17009)",
			"eslint/no-throw-literal": "it is deprecated, and typescript/only-throw-error owns it",
			"eslint/no-underscore-dangle": "it is naming taste that already needs an allow-list",
			"eslint/no-unreachable": "the compiler owns it (allowUnreachableCode: false)",
			"eslint/no-unsafe-negation": "the compiler owns it (TS2365, TS2322, TS2358)",
			"eslint/no-unsafe-optional-chaining":
				"the compiler owns it (strictNullChecks: TS2722, TS18048)",
			"eslint/no-unused-labels": "the compiler owns it (allowUnusedLabels: false)",
			"eslint/no-unused-private-class-members":
				"the compiler owns it (noUnusedLocals, noUnusedParameters)",
			"eslint/no-unused-vars": "the compiler owns it (noUnusedLocals, noUnusedParameters)",
			"eslint/no-use-before-define":
				"with functions, classes and variables allowed only the temporal dead zone remains, which the compiler owns (TS2448, TS2449)",
			"eslint/no-with": "the compiler owns it (TS1101, TS2410)",
			"eslint/prefer-regex-literals":
				"it pushes toward regex literals, and arkregex's regex() is the only regex form",
			"eslint/prefer-spread":
				"it turns f.apply(this, list) into f(...list), a variable-length list on the call stack, which superlint's no-spread-argument refuses",
			"eslint/preserve-caught-error": "try/catch is Effect's tryCatchInEffectGen's",
			"eslint/require-await": "async is banned, and Effect's asyncFunction owns it",
			"import/no-absolute-path": "it came only with the suspicious category, which is off",
			"import/no-empty-named-blocks": "it came only with the suspicious category, which is off",
			"import/no-named-as-default": "it came only with the suspicious category, which is off",
			"import/no-named-as-default-member":
				"it came only with the suspicious category, which is off",
			"import/no-self-import": "it came only with the suspicious category, which is off",
			"node/no-sync": "Effect's nodeBuiltinImport owns it",
			"oxc/no-async-endpoint-handlers": "async is banned, and Effect's asyncFunction owns it",
			"oxc/no-const-enum": "erasableSyntaxOnly already refuses every enum",
			"typescript/ban-types":
				"it is deprecated, and no-empty-object-type, no-unsafe-function-type and no-wrapper-object-types own it",
			"typescript/consistent-return":
				"it contradicts Effect's missingReturnYieldStar (return yield*) and exhaustive switches without a default, and noImplicitReturns already refuses a real missing return",
			"typescript/consistent-type-exports":
				"verbatimModuleSyntax already makes it a compiler error",
			"typescript/consistent-type-imports":
				"verbatimModuleSyntax already makes it a compiler error",
			"typescript/no-confusing-void-expression":
				"it forces block bodies on void callbacks, and typescript/no-misused-promises and Effect's floatingEffect own the real bugs",
			"typescript/no-empty-interface":
				"it is deprecated, and typescript/no-empty-object-type owns it",
			"typescript/no-invalid-void-type":
				"oxlint's port refuses void as a type argument (Promise.withResolvers<void>()), which the rule exists to allow",
			"typescript/no-mixed-enums": "erasableSyntaxOnly already refuses every enum",
			"typescript/no-unnecessary-qualifier":
				"erasableSyntaxOnly already refuses every enum and runtime namespace",
			"typescript/no-unnecessary-type-assertion":
				"typescript/consistent-type-assertions already bans every cast",
			"typescript/no-unsafe-enum-comparison": "erasableSyntaxOnly already refuses every enum",
			"typescript/no-unsafe-type-assertion":
				"typescript/consistent-type-assertions already bans every cast",
			"typescript/non-nullable-type-assertion-style":
				"it recommends the non-null assertion, which typescript/no-non-null-assertion bans",
			"typescript/prefer-enum-initializers": "erasableSyntaxOnly already refuses every enum",
			"typescript/prefer-literal-enum-member": "erasableSyntaxOnly already refuses every enum",
			"typescript/prefer-readonly-parameter-types":
				"it needs an allow-list of every library, error and resource type, sees through no alias, and refuses state that is mutable by design",
			"typescript/promise-function-async": "async is banned",
			"typescript/require-await": "async is banned, and Effect's asyncFunction owns it",
			"typescript/return-await": "async is banned, and Effect's asyncFunction owns it",
			"typescript/strict-void-return":
				"it forces block bodies on void callbacks, and typescript/no-misused-promises and Effect's floatingEffect own the real bugs",
			"unicorn/consistent-function-scoping": "it moves a helper away from its one use",
			"unicorn/explicit-length-check": "it is opinion",
			"unicorn/no-array-for-each": "it misreads Effect's Arr.forEach and only enforces taste",
			"unicorn/no-instanceof-array": "unicorn/no-instanceof-builtins covers it",
			"unicorn/no-static-only-class": "its type-aware twin typescript/no-extraneous-class owns it",
			"unicorn/no-unnecessary-await": "its type-aware twin typescript/await-thenable owns it",
			"unicorn/prefer-array-index-of": "it pushes toward indexOf, whose -1 is a sentinel",
			"unicorn/prefer-date-now": "Effect's globalDate owns it",
			"unicorn/prefer-string-starts-ends-with":
				"its type-aware twin typescript/prefer-string-starts-ends-with owns it"
		},
		diagnostics: {
			apiStabilityLeak: "unstable Effect APIs stay usable, so exposing one is no defect",
			experimentalApiUsage:
				"unstable Effect APIs stay usable, so using an experimental one is no defect",
			missingPipeableSignature:
				"Function.dual is an overload in disguise that dispatches on arguments.length on every call, for a data-last form almost nothing calls (owner, 2026-10-26)",
			preferSchemaTaggedError:
				"Effect Schema is for types, never runtime validation: errors are Data.TaggedError (owner, 2026-11-04)",
			unstableApiUsage: "Effect's whole Node platform layer is marked unstable"
		}
	},
	exceptions: [],
	effectFree: [],
	core: {
		uncheckedVocabularyLiteral: {
			support: [],
			vocabularies: [],
			titled: ["describe", "layer", "it", "test", "effect", "live", "each"],
			explanations: ["message", "why"]
		}
	},
	packs: [
		grizzle({
			sqlTextAssertion: { files: [], exempt: [], texts: [], matchers: [], equalities: [] },
			limitEvidence: {
				limits: {
					module: "packages/den/src/limits.ts",
					mints: ["published", "measured", "derived"]
				},
				formatTag: "formatConstant",
				modules: [
					{ package: "effect", module: "Duration", category: "time" },
					{ package: "effect", module: "Schedule", category: "retry" }
				],
				wrappers: [{ package: "effect", module: "Effect", names: ["fn", "fnUntraced"] }],
				vocabulary: {
					length: {
						parameters: [
							"start",
							"end",
							"count",
							"length",
							"maxLength",
							"targetLength",
							"arrayLength",
							"deleteCount",
							"n"
						],
						words: []
					},
					time: {
						parameters: [
							"ms",
							"millis",
							"milliseconds",
							"delay",
							"timeout",
							"duration",
							"seconds",
							"minutes",
							"hours",
							"days",
							"weeks",
							"nanos",
							"micros",
							"interval",
							"timeToLive"
						],
						words: [
							"timeout",
							"deadline",
							"idle",
							"ms",
							"millis",
							"milliseconds",
							"seconds",
							"minutes",
							"hours",
							"interval",
							"delay",
							"grace",
							"backoff",
							"duration",
							"lifetime",
							"ttl"
						]
					},
					concurrency: {
						parameters: ["permits", "concurrency"],
						words: ["concurrency", "permits", "parallelism", "workers"]
					},
					retry: {
						parameters: ["times", "retries", "attempts"],
						words: ["retries", "retry", "attempts", "attempt", "times", "tries"]
					},
					size: {
						parameters: ["capacity", "size", "max", "min", "limit"],
						words: [
							"max",
							"min",
							"size",
							"limit",
							"budget",
							"depth",
							"capacity",
							"cap",
							"threshold"
						]
					}
				},
				scopes: [
					{
						files: ["packages/den/src/", "packages/den-vercel/src/"],
						generated: [],
						positions: [
							"comparison",
							"loop",
							"extremum",
							"length",
							"time",
							"concurrency",
							"retry",
							"size"
						],
						words: "every property",
						constants: [
							"max",
							"min",
							"limit",
							"bound",
							"budget",
							"timeout",
							"deadline",
							"retries",
							"size",
							"depth",
							"cap",
							"threshold",
							"grace",
							"ms",
							"millis",
							"seconds"
						],
						inputs: []
					},
					{
						files: [
							"packages/den/test/",
							"packages/den/integration/",
							"packages/den-model/src/",
							"packages/den-vercel/test/",
							"packages/edullm/"
						],
						generated: [],
						positions: ["time", "concurrency", "retry"],
						words: "library properties",
						constants: [
							"timeout",
							"deadline",
							"retries",
							"attempts",
							"concurrency",
							"grace",
							"ms",
							"millis",
							"seconds",
							"minutes",
							"backoff",
							"interval",
							"delay",
							"idle"
						],
						inputs: [{ module: "vendor/toolchain/packages/testing/src/gen.ts", alias: "Gen" }]
					}
				]
			},
			noEnvironment: {
				files: [],
				readers: [],
				sources: [
					{
						package: "@types/node",
						module: "process",
						reads: {
							kind: "exports",
							names: [
								"env",
								"cwd",
								"chdir",
								"argv",
								"argv0",
								"execArgv",
								"execPath",
								"loadEnvFile",
								"platform",
								"arch",
								"version",
								"versions",
								"release",
								"config",
								"features",
								"title",
								"ppid",
								"getuid",
								"geteuid",
								"getgid",
								"getegid",
								"getgroups",
								"umask",
								"memoryUsage",
								"resourceUsage",
								"availableMemory",
								"constrainedMemory",
								"allowedNodeEnvironmentFlags",
								"permission"
							]
						}
					},
					{ package: "@types/node", module: "os", reads: { kind: "module" } },
					{ package: "@types/node", module: "navigator", reads: { kind: "module" } },
					{
						package: "@types/node",
						module: "v8",
						reads: {
							kind: "exports",
							names: ["getHeapStatistics", "getHeapSpaceStatistics", "getHeapCodeStatistics"]
						}
					},
					{ package: "effect", module: "Config", reads: { kind: "module" } },
					{ package: "effect", module: "ConfigProvider", reads: { kind: "module" } }
				],
				entryReads: ["argv", "cwd"]
			},
			testCaseIsSearch: {
				files: [
					"packages/den/test/",
					"packages/den/integration/",
					"packages/den-model/src/",
					"packages/den-vercel/test/",
					"packages/edullm/"
				],
				registrars: [
					{ package: "@effect/vitest", declarations: ["Test", "each", "prop"] },
					{
						package: "vitest",
						declarations: ["TestCollectorCallable", "EachFunctionReturn", "TestForFunctionReturn"]
					}
				],
				searches: [
					{
						module: "vendor/toolchain/packages/testing/src/explore.ts",
						names: ["explore", "exhaust"]
					},
					{ module: "vendor/toolchain/packages/testing/src/interleave.ts", names: ["interleave"] }
				],
				scaffolds: [],
				exempt: []
			},
			noCaseList: {
				files: [
					"packages/den/test/",
					"packages/den/integration/",
					"packages/den-model/src/",
					"packages/den-vercel/test/",
					"packages/edullm/"
				],
				cases: [
					"packages/den/test/",
					"packages/den/integration/",
					"packages/den-model/src/",
					"packages/den-vercel/test/",
					"packages/edullm/"
				],
				dictionaries: [],
				searches: [
					{
						module: "vendor/toolchain/packages/testing/src/explore.ts",
						name: "exhaust",
						space: "generator"
					},
					{
						module: "vendor/toolchain/packages/testing/src/explore.ts",
						name: "explore",
						space: "draw"
					}
				],
				generators: [
					{
						module: "vendor/toolchain/packages/testing/src/gen.ts",
						names: ["element"],
						draws: "list"
					},
					{
						module: "vendor/toolchain/packages/testing/src/gen.ts",
						names: ["constant"],
						draws: "value"
					},
					{
						module: "vendor/toolchain/packages/testing/src/gen.ts",
						names: ["map", "span"],
						draws: "each"
					},
					{
						module: "vendor/toolchain/packages/testing/src/explore.ts",
						names: ["drawn", "sketched"],
						draws: "each"
					},
					{
						module: "vendor/toolchain/packages/testing/src/gen.ts",
						names: ["oneOf", "weighted", "proportional"],
						draws: "union"
					}
				]
			}
		})
	],
	own: []
})
