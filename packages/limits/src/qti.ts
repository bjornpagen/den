import { published } from "@bjornpagen/limit"

/**
 * The QTI REST API's numbers, as edullm's W3 reads its three collections (packages/edullm/src/qti.ts);
 * the limits skill, .agents/skills/limits; this package's README.
 */

/** The most documents one page of a list may hold, on every list endpoint's `limit` parameter. */
export const qtiPageLimit = published({
	value: 1000,
	owner: "the QTI REST API, the list endpoints' `limit` parameter",
	unit: "documents a page",
	scope: "one `after` page of one collection's list read",
	constraint: "hard quota",
	source: "https://qti.alpha-1edtech.ai/openapi.yaml",
	quote:
		"name: limit schema: default: 10 description: Number of items per page [...] type: integer minimum: 1 maximum: 1000",
	verified: "2026-11-16"
})
