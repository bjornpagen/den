import { accepted, type Machine, refused, type Verdict } from "@bjornpagen/testing/commands"
import { boolean, type Gen, int } from "@bjornpagen/testing/gen"
import { Array as Arr, Option } from "effect"
import type { Answer } from "#facts.ts"
import type { StepId } from "#identity.ts"
import { type Answered, emptyState, type Lease, ledger, type State } from "#ledger.ts"
import {
	type Admission,
	admissionOf,
	type Resource,
	type RootKind,
	type Runs,
	type Settled,
	type StepKind,
	stepOf,
	ordinals
} from "#program.ts"

/**
 * A flat program, the smallest that holds every race of the claim, the seat and the commit: one root whose start holds
 * `steps` steps, each holding a seat of one resource of `seats` seats while it runs, leased for `lease` ticks on a
 * ladder of `attempts` attempts, outputting at once, then the root's finish, which holds no seat.
 */
export type Flat = Readonly<{ seats: number; steps: number; lease: number; attempts: number }>

/** The flat program's root's key, its admission, and the steps a claim may name, its finish first. */
export const flatOf = (
	flat: Flat
): Readonly<{
	kind: string
	key: string
	admission: Admission
	steps: Arr.NonEmptyReadonlyArray<StepId>
}> => {
	const resource: Resource = { name: "seat", seats: flat.seats }
	const ladder = { _tag: "Attempts", attempts: flat.attempts, first: 1, last: 1 } as const
	const runs: Runs = { lease: flat.lease, holds: [resource], ladder }
	const Work: StepKind<number, number, never> = {
		name: "Work",
		runs,
		input: (n) => n,
		output: (n) => n,
		error: () => 0,
		reads: () => [],
		body: (n) => ({
			_tag: "Output",
			output: n,
			writes: [{ relation: "flat", key: `${n}`, value: n }]
		}),
		edges: () => []
	}
	const Root: RootKind<number, number, never> = {
		name: "Flat",
		trigger: { _tag: "Operator", heading: "FlatInput" },
		precondition: Option.none(),
		window: Option.none(),
		exclusive: Option.none(),
		scope: {
			name: "Flat",
			input: (n) => n,
			start: (n) => Arr.map(ordinals(n), (index) => stepOf(Work, index + 1)),
			finish: {
				runs: { lease: flat.lease, holds: [], ladder },
				output: (n) => n,
				error: () => 0,
				body: (_n, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}
	const scope = { _tag: "RootScope", root: { kind: "Flat", key: "flat" } } as const
	return {
		kind: "Flat",
		key: "flat",
		admission: admissionOf(Root, "flat", flat.steps),
		steps: [
			{ _tag: "FinishStep", scope },
			...Arr.map(ordinals(flat.steps), (ordinal): StepId => ({ _tag: "StartStep", scope, ordinal }))
		]
	}
}

/** What a worker reports of a lease in the machine: its body's output, or a failed call's retry, an attempt. */
export type Report = "output" | "retry"

/** The machine's state: the model ledger, its clock, and every lease a claim won so far, in order. */
export type Model = Readonly<{ state: State; now: number; leases: ReadonlyArray<Lease> }>

/**
 * Each command's parameters: a claim names a step by its place among the flat program's steps, the finish first; a
 * commit names a lease by its place in `leases` and how it ran.
 */
export type Parameters = Readonly<{
	admit: undefined
	claim: number
	commit: Readonly<{ lease: number; report: Report }>
	tick: number
	retire: undefined
}>

/** What the ledger refuses a call with: every answer that commits nothing, which the machine's type states. */
export type Refusal = Exclude<Answer, "accepted" | "exhausted">

/** A ledger answer as a verdict: committed facts are accepted with the state after them, anything else is refused. */
const verdictOf = (
	model: Model,
	answered: Answered,
	leases: ReadonlyArray<Lease>
): Verdict<Model, Refusal> => {
	switch (answered.answer) {
		case "accepted":
		case "exhausted":
			return accepted({ ...model, state: answered.state, leases })
		case "unchanged":
		case "lost":
		case "gone":
		case "stale":
		case "early":
		case "closed":
		case "paused":
		case "full":
		case "behind":
		case "live":
		case "held":
		case "retired":
		case "blocked":
		case "differs":
			return refused(answered.answer)
	}
}

/** The report a lease carries for a commit: its body's settled outcome, or a retry due at once. */
export const settledOf = (lease: Lease, report: Report, now: number): Settled =>
	report === "output" ? lease.run(lease.claimed) : { _tag: "Retry", at: now, counts: "attempt" }

const none: Gen<undefined> = () => undefined

/**
 * The ledger as a command machine over a flat program, its model the ledger: the oracle a differential test of the real engine runs its own ledger
 * against, command by command, through `runProgram` from `@bjornpagen/testing/commands`. The commands an operator, a worker
 * and the clock make (admit, claim a step, commit a lease won earlier, let time pass, retire the root) are drawn as
 * readily where the model refuses them as where it accepts them.
 */
export const flatMachine = (flat: Flat): Machine<Model, Parameters, Refusal> => {
	const { admission, kind, key, steps } = flatOf(flat)
	return {
		initial: { state: emptyState, now: 0, leases: [] },
		commands: {
			admit: {
				weight: 1,
				applies: () => true,
				parameters: () => none,
				judge: (model) =>
					verdictOf(
						model,
						ledger.admit(model.state, admission, "operator", model.now),
						model.leases
					)
			},
			claim: {
				weight: 4,
				applies: () => true,
				parameters: () => int(0, steps.length - 1),
				judge: (model, index) =>
					Option.match(Arr.get(steps, index), {
						onNone: () => refused("gone"),
						onSome: (step) => {
							const answered = ledger.claim(
								model.state,
								step,
								`t${model.leases.length}`,
								0,
								model.now
							)
							return verdictOf(
								model,
								answered,
								Option.match(answered.lease, {
									onNone: () => model.leases,
									onSome: (lease) => Arr.append(model.leases, lease)
								})
							)
						}
					})
			},
			commit: {
				weight: 4,
				applies: (model) => Arr.isReadonlyArrayNonEmpty(model.leases),
				parameters: (model) => (source) => ({
					lease: source.draw(int(0, model.leases.length - 1)),
					report: source.draw(boolean) ? "retry" : "output"
				}),
				judge: (model, { lease, report }) =>
					Option.match(Arr.get(model.leases, lease), {
						onNone: () => refused("gone"),
						onSome: (held) =>
							verdictOf(
								model,
								ledger.commit(
									model.state,
									{
										step: held.step,
										attempt: held.attempt,
										turn: held.turn,
										settled: settledOf(held, report, model.now),
										reads: held.taken,
										deployment: 0
									},
									model.now
								),
								model.leases
							)
					})
			},
			tick: {
				weight: 2,
				applies: () => true,
				parameters: () => int(1, flat.lease + 1),
				judge: (model, ticks) => accepted({ ...model, now: model.now + ticks })
			},
			retire: {
				weight: 1,
				applies: () => true,
				parameters: () => none,
				judge: (model) =>
					verdictOf(model, ledger.retire(model.state, { kind, key }, model.now), model.leases)
			}
		}
	}
}
