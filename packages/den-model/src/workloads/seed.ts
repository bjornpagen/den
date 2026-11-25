import { Option } from "effect"
import {
	type Admission,
	admissionOf,
	type Ladder,
	type Program,
	type RootKind,
	rootedOf,
	type Runs,
	type StepKind,
	spawn,
	stepOf
} from "#program.ts"

/** W8's limits, each the test's input: how a seed step runs. */
export type SeedLimits = Readonly<{ lease: number; ladder: Ladder }>

/** One seed run: its key, the operator's, and the tables it seeds, in order. */
export type Seeding = Readonly<{ key: string; tables: number }>

/** One table's seed: its run and its place. */
type Table = Readonly<{ seeding: Seeding; table: number }>

/**
 * W8, the Silver seed, as a den program: a one-off root the operator starts, seeding one table per step, each naming
 * the next.
 */
export const seedOf = (
	limits: SeedLimits
): Readonly<{ program: Program; start: (seeding: Seeding) => Admission }> => {
	const runs: Runs = { lease: limits.lease, holds: [], ladder: limits.ladder }

	const Seed: StepKind<Table, number, never> = {
		name: "SilverSeed",
		runs,
		input: (table) => ({ seeding: table.seeding.key, table: table.table }),
		output: (table) => table,
		error: () => 0,
		reads: () => [],
		body: (table) => ({
			_tag: "Output",
			output: table.table,
			writes: [
				{ relation: "silver_seed", key: `${table.seeding.key}:${table.table}`, value: table.table }
			]
		}),
		edges: () => [
			spawn("next", Seed, (table: Table) =>
				table.table + 1 < table.seeding.tables
					? [{ seeding: table.seeding, table: table.table + 1 }]
					: []
			)
		]
	}

	const SeedRoot: RootKind<Seeding, number, never> = {
		name: "SilverSeedRun",
		trigger: { _tag: "Operator" },
		from: { _tag: "Given", heading: "SilverSeedRunInput" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "SilverSeedRun",
			input: (seeding) => ({ key: seeding.key, tables: seeding.tables }),
			start: (seeding) => [stepOf(Seed, { seeding, table: 0 })],
			finish: {
				runs,
				output: (seeded) => seeded,
				error: () => 0,
				body: (_seeding, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}

	return {
		program: { name: "seed", resources: [], roots: [rootedOf(SeedRoot)] },
		start: (seeding) => admissionOf(SeedRoot, seeding.key, seeding)
	}
}
