import { measured } from "@bjornpagen/limit"

/**
 * Timeback's shared SSM bastion as edullm's operator holds it (the replica fake in packages/edullm/src/replica.ts): its
 * seats, and the replica's rates through it at that hold. The records are edullm's, at 28ddb047f, in
 * packages/platform/pipeline/src/limits.ts; the
 * the limits skill, .agents/skills/limits; this package's README.
 */

/** What the seats and the byte rate share: edullm's eight-slot trial of 2026-09-16. */
const trial = {
	owner: "the shared Timeback SSM bastion, held by edullm's operator",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts LANE_WIDTHS.timeback, from the eight-slot trial's copy receipt, source lifecycle, bastion midpoint and close captures, and the 08:40:18Z follow-up",
	observed: "2026-09-16 06:37:15Z–07:37:15Z, and the follow-up 07:40–08:40Z",
	environment:
		"Vercel production iad1, Timeback's Aurora PostgreSQL 17.7 through the shared us-east-1 SSM bastion, other principals' sessions on it",
	workload:
		"eight concurrent COPY sessions of whole relations across both origins: 545 completed COPY attempts, 538 retained pages",
	revalidate:
		"a bastion mean CPU above 70% at eight sessions; other-owner sessions at most 3 for a full hour; a widening trial (mean CPU at most 60% and at most 11 sessions)"
} as const

/** The bastion sessions the operator holds: the fake's seats. */
export const bastionSeats = measured({
	...trial,
	value: 8,
	unit: "sessions",
	scope: "the Timeback replica fake's bastion, its sessions at once",
	result:
		"bastion CPU 67.41% mean and 71.16% max over the hour, every principal included; the follow-up hour 66.96% mean and 71.71% max, with eight supplied-principal and five other-owner sessions",
	decision:
		"eight, under the operator's 60–70% mean-CPU hold band; both widening prerequisites failed, so eight is retained"
})

/** The replica's bytes a second through the bastion at the operator's hold, shared by every session open. */
export const bastionBytesPerSecond = measured({
	...trial,
	value: 5_227_836.87,
	unit: "bytes a second",
	scope: "the Timeback replica fake's bastion, every session's COPY bytes together",
	result:
		"18,820,212,728 bytes and 17,468,347 rows over 3,600 seconds: 5,227,836.87 bytes a second",
	decision:
		"a session's share is these bytes over the eight seats, and a session past the eighth shares the same bytes with every other session open"
})

/** The keys a second one bastion session's key scan streams. */
export const bastionKeysPerSecondPerSession = measured({
	owner: "the shared Timeback SSM bastion, held by edullm's operator",
	value: 13_941,
	unit: "keys a second",
	scope: "one session's key scan in the Timeback replica fake",
	evidence:
		"edullm 28ddb047f packages/platform/pipeline/src/limits.ts PRUNE_FETCH_KEYS, from the 2026-10-15 refresh's replica stream",
	observed: "2026-10-15 17:41Z",
	environment:
		"Vercel production iad1, Timeback's Aurora PostgreSQL 17.7 through the shared us-east-1 SSM bastion",
	workload: "resources' key scan, 2,490,370 keys, with eight leases on the bastion",
	result:
		"2,490,370 keys in 178,630 ms: 13,941 keys a second, the slowest measured (component_resources and resources_metadata streamed 13,993 and 13,948)",
	decision: "the fake streams a session's keys at the slowest measured rate",
	revalidate: "a key scan slower than this; a bastion or Aurora change"
})
