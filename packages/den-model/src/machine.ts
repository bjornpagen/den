import { accepted, type Machine, refused, type Verdict } from "@den/testing/commands"
import { boolean, type Gen, int } from "@den/testing/gen"
import { Array as Arr, Option } from "effect"
import type { Answer } from "#facts.ts"
import { type Answered, emptyState, type Lease, ledgerOf, type Rules, type State } from "#ledger.ts"
import {
	type Admission,
	admissionOf,
	type Ceilings,
	type Lane,
	type RootKind,
	type Settled,
	type StepKind,
	stepOf,
	ordinals
} from "#program.ts"

/**
 * A flat program, the smallest that holds every race of the claim and commit: one root whose start holds `steps` steps
 * on one lane of `width`, each leased for `lease` ticks under `ceilings`, outputting at once, then the root's finish.
 */
export type Flat = Readonly<{ width: number; steps: number; lease: number; ceilings: Ceilings }>

/** The flat program's lane, its root's key and its admission. */
export const flatOf = (
	flat: Flat
): Readonly<{ lane: Lane; trigger: string; key: string; admission: Admission }> => {
	const lane: Lane = { name: "flat", width: flat.width, window: { _tag: "Always" } }
	const runs = { lane, lease: flat.lease, ceilings: flat.ceilings, ladder: { first: 1, last: 1 } }
	const Work: StepKind<number, number, never> = {
		name: "Work",
		runs,
		input: (n) => n,
		output: (n) => n,
		error: () => 0,
		body: (n) => ({
			_tag: "Output",
			output: n,
			writes: [{ relation: "flat", key: `${n}`, value: n }]
		}),
		edges: () => []
	}
	const Root: RootKind<number, number, never> = {
		name: "Flat",
		trigger: { _tag: "Operator" },
		scope: {
			name: "Flat",
			input: (n) => n,
			start: (n) => Arr.map(ordinals(n), (index) => stepOf(Work, index + 1)),
			finish: {
				runs,
				output: (n) => n,
				error: () => 0,
				body: (_n, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}
	return { lane, trigger: "Flat", key: "flat", admission: admissionOf(Root, "flat", flat.steps) }
}

/** What a worker reports of a lease in the machine: its body's output, or a failed call's retry, an attempt. */
export type Report = "output" | "retry"

/** The machine's state: the model ledger, its clock, and every lease a claim won so far, in order. */
export type Model = Readonly<{ state: State; now: number; leases: ReadonlyArray<Lease> }>

/** Each command's parameters: a commit names a lease by its place in `leases` and how it ran. */
export type Parameters = Readonly<{
	admit: undefined
	claim: undefined
	commit: Readonly<{ lease: number; report: Report }>
	tick: number
	stop: undefined
	retire: undefined
}>

/** What the ledger refuses a call with: every answer that commits nothing. */
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
		case "paused":
		case "closed":
		case "at-width":
		case "idle":
		case "live":
			return refused(answered.answer)
	}
}

/** The report a lease carries for a commit: its body's settled outcome, or a retry due at once. */
export const settledOf = (lease: Lease, report: Report, now: number): Settled =>
	report === "output" ? lease.run(lease.claimed) : { _tag: "Retry", at: now, counts: "attempt" }

const none: Gen<undefined> = () => undefined

/**
 * The ledger as a command machine over a flat program, its model the ledger under `rules` (`SOUND` for den's laws, a
 * planted bug's to prove a test catches it): the oracle a differential test of
 * the real engine runs its own ledger against, command by command, through `runProgram` from `@den/testing/commands`.
 * The commands an operator, a worker and the clock make (admit, claim, commit a lease won earlier, let time pass,
 * stop the root, retire it) are drawn as readily where the model refuses them as where it accepts them.
 */
export const flatMachine = (flat: Flat, rules: Rules): Machine<Model, Parameters, Refusal> => {
	const ledger = ledgerOf(rules)
	const { lane, admission, trigger, key } = flatOf(flat)
	return {
		initial: { state: emptyState, now: 0, leases: [] },
		commands: {
			admit: {
				weight: 1,
				applies: () => true,
				parameters: () => none,
				judge: (model) =>
					verdictOf(model, ledger.admit(model.state, admission, model.now), model.leases)
			},
			claim: {
				weight: 4,
				applies: () => true,
				parameters: () => none,
				judge: (model) => {
					const answered = ledger.claim(model.state, lane, 0, model.now)
					return verdictOf(
						model,
						answered,
						Option.match(answered.lease, {
							onNone: () => model.leases,
							onSome: (lease) => Arr.append(model.leases, lease)
						})
					)
				}
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
										claim: held.claim,
										token: held.token,
										settled: settledOf(held, report, model.now),
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
			stop: {
				weight: 1,
				applies: () => true,
				parameters: () => none,
				judge: (model) =>
					verdictOf(
						model,
						ledger.stop(model.state, { _tag: "RootScope", root: { trigger, key } }, model.now),
						model.leases
					)
			},
			retire: {
				weight: 1,
				applies: () => true,
				parameters: () => none,
				judge: (model) =>
					verdictOf(model, ledger.retire(model.state, { trigger, key }, model.now), model.leases)
			}
		}
	}
}
