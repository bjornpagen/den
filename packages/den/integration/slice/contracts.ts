import { contractParser } from "@bjornpagen/grizzle/contract"
import { BuildNumber, buildNumberKey } from "#integration/slice/relations.ts"

/** BuildNumber's checked mint, its checker derived from the contract, which a step's input of a build's number decodes through (flows.ts BuildInput). */
export const buildNumberParser = contractParser(BuildNumber, buildNumberKey)
