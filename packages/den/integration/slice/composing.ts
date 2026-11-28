import { denClock } from "@bjornpagen/den/algebra/kinds"
import { denInstantKey } from "@bjornpagen/den/lower/keys"
import { ChangeSet, clocked, login, role, wholeEntriesOf, workload } from "@bjornpagen/grizzle"
import { App } from "#integration/slice/app.ts"
import { chainRequests, chainRequestWrites } from "#integration/slice/generated/chain.programs.ts"
import { fanRequests, fanRequestWrites } from "#integration/slice/generated/fan.programs.ts"
import { Order, Want } from "#integration/slice/relations.ts"

/**
 * What the composing role inserts: the sizes the app wants batches at and the orders it places, with every relation the
 * fan's Wanted request and the chain's Ordered request insert, as den's programs list them (`fanRequestWrites`,
 * `chainRequestWrites`).
 */
export const composerInserts = [
	"Want",
	...fanRequestWrites.Wanted,
	"Order",
	...chainRequestWrites.Ordered
] as const

/**
 * Another role of the app's than the one the flows name as their writer: it holds the app's schema whole and inserts
 * `composerInserts`, so a derived app root's request composes into its writes, as metis's student role inserts what its
 * proctored submit requests.
 */
export const Composer = role(App, "composer", wholeEntriesOf(App), { insert: composerInserts })

/**
 * The composing role's programs: the app's want of a batch with the fan's Wanted request sequenced after it, so the
 * request's read finds the sizes it wants, and the app's order with the chain's Ordered request, a given root's,
 * beside it. A role's programs are its own, so a configuration of another role of the same name and lists takes them
 * over it.
 */
export const composerPrograms = (composer: typeof Composer) =>
	workload(composer, {
		wantRun: clocked(
			ChangeSet.sequence(ChangeSet.empty(composer).insert(Want, []), fanRequests.Wanted),
			{ [denClock]: "millis" },
			{ [denClock]: denInstantKey }
		),
		order: clocked(
			ChangeSet.union(ChangeSet.empty(composer).insert(Order, []), chainRequests.Ordered),
			{ [denClock]: "millis" },
			{ [denClock]: denInstantKey }
		)
	})

/** The app's composing login: the composing role alone, running its programs. */
export const Composing = login(App, "composing", [Composer], {
	workload: [composerPrograms(Composer)]
})
