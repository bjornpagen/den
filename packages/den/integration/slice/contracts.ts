import { contractParser } from "@bjornpagen/grizzle/runtime"
import buildNumberFile from "#integration/slice/migrations/contract-checks/BuildNumber.json" with { type: "json" }
import { BuildNumber, buildNumberKey } from "#integration/slice/relations.ts"

/**
 * The slice's contracts' checked mints, each over the checker file `grizzle generate` compiles for the slice's
 * configuration (its `contracts`), which a running worker reads with no compiler loaded: a module of its own, which no
 * schema module imports, so generate loads the schemas while it writes the files.
 */

/** BuildNumber's checked mint, which a step's input of a build's number decodes through (flows.ts BuildInput). */
export const buildNumberParser = contractParser(buildNumberFile, BuildNumber, buildNumberKey)
