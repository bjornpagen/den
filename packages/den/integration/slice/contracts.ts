import * as gDomain from "@bjornpagen/grizzle/domain"
import { BuildNumber, buildNumberKey } from "#integration/slice/relations.ts"

/** BuildNumber's checked mint, its checker derived from the contract, which a step's input of a build's number decodes through (flows.ts BuildInput). */
export const buildNumberParser = gDomain.domainParser(BuildNumber, buildNumberKey)
