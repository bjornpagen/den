import { Array as Arr, Option, Order } from "effect"
import type { By } from "#facts.ts"
import {
	admissionOf,
	type Claimed,
	type Counts,
	type Ladder,
	open,
	type Outcome,
	ordinals,
	type Program,
	type Resource,
	type RootKind,
	rootedOf,
	type Runs,
	type ScopeKind,
	type StepKind,
	spawn,
	spawnAt,
	stepAt,
	stepOf,
	type Window,
	type Write
} from "#program.ts"
import type { Act } from "#simulator.ts"

/**
 * How a generated step behaves on a claim: it outputs; it fails with its typed error; it retries a number of claims
 * before it outputs; it retries until an outage outside ends at an instant (W6's Timeback, down for a while); or it
 * retries every claim, spending an attempt, so only its ladder ends it.
 */
export type Behaviour =
	| Readonly<{ _tag: "Ok" }>
	| Readonly<{ _tag: "Fails" }>
	| Readonly<{ _tag: "Retries"; times: number; counts: Counts }>
	| Readonly<{ _tag: "Outage"; until: number; counts: Counts }>
	| Readonly<{ _tag: "Forever" }>

/** How a generated step runs: its lease and its ladder. */
export type Running = Readonly<{ lease: number; ladder: Ladder }>

/** A generated child scope: none, or one that opens leaves. */
export type Sub = Readonly<{ _tag: "None" }> | Readonly<{ _tag: "Sub" }>

/** A generated timer: none, or a step due `after` ticks on, re-armed up to `rearms` times until a read stops it. */
export type Timer =
	| Readonly<{ _tag: "None" }>
	| Readonly<{ _tag: "Timer"; after: number; rearms: number }>

/**
 * The shape of a generated program, every part drawn:
 * - one resource of `seats` seats, which the chain's steps and the leaves hold when `holds` says;
 * - how its steps run;
 * - a chain of `chain.length` steps, each naming the next;
 * - a fan-out into `fan.leaves` leaves, and with `sub` a child scope of as many leaves whose finish starts a follow-up
 *   step in the root;
 * - a timer re-armed by its edge, which reads the app relation `outside` and stops once its root's row is there;
 * - the root kind's window and whether every root holds one exclusivity seat, under one key;
 * - the behaviour of each kind;
 * - when roots are admitted, and by whom; when a gate root, whose precondition is that no generated step is pending,
 *   is pressed; and when the app writes its `outside` rows.
 */
export type Shape = Readonly<{
	seats: number
	running: Running
	chain: Readonly<{ length: number; behaviour: Behaviour; holds: boolean }>
	fan: Readonly<{ leaves: number; behaviour: Behaviour; leaf: Behaviour; holds: boolean }>
	sub: Sub
	timer: Timer
	window: Option.Option<Window>
	exclusive: boolean
	finish: Behaviour
	roots: Arr.NonEmptyReadonlyArray<Readonly<{ at: number; by: By }>>
	gates: ReadonlyArray<number>
	outside: ReadonlyArray<Readonly<{ at: number; root: number }>>
}>

/** What a generated step outputs and what it fails with: a count, shown as itself. */
const show = (value: number) => value

/** A behaviour's outcome on a claim, outputting `output`. */
const behave = <O>(behaviour: Behaviour, claimed: Claimed, output: O): Outcome<O, number> => {
	switch (behaviour._tag) {
		case "Ok":
			return { _tag: "Output", output, writes: [] }
		case "Fails":
			return { _tag: "Failure", error: claimed.attempts }
		case "Retries":
			return claimed.attempt < behaviour.times
				? { _tag: "Retry", at: claimed.at + 1, counts: behaviour.counts }
				: { _tag: "Output", output, writes: [] }
		case "Outage":
			return claimed.at < behaviour.until
				? { _tag: "Retry", at: claimed.at + 1, counts: behaviour.counts }
				: { _tag: "Output", output, writes: [] }
		case "Forever":
			return { _tag: "Retry", at: claimed.at + 1, counts: "attempt" }
	}
}

/** A behaviour's outcome with one app write landing beside its output. */
const writing = <O>(outcome: Outcome<O, number>, write: Write): Outcome<O, number> =>
	outcome._tag === "Output" ? { ...outcome, writes: [write] } : outcome

/** The input every generated step carries: its root's key, so its writes name it, and a count. */
type Input = Readonly<{ root: string; n: number }>

const showInput = (input: Input) => ({ root: input.root, n: input.n })

/** The latest instant a behaviour names, so the run's horizon covers its outage. */
const horizonOf = (behaviour: Behaviour): number =>
	behaviour._tag === "Outage" ? behaviour.until : 0

/**
 * The generated program of a shape and what the world does to it: the program, its acts in order, and the horizon,
 * the latest instant the shape names.
 */
export const syntheticOf = (
	shape: Shape
): Readonly<{ program: Program; acts: ReadonlyArray<Act>; horizon: number }> => {
	const resource: Resource = { name: "r", seats: shape.seats }
	const on = (holds: boolean): Runs => ({
		lease: shape.running.lease,
		holds: holds ? [resource] : [],
		ladder: shape.running.ladder
	})

	const Chain: StepKind<Input, number, number> = {
		name: "Chain",
		runs: on(shape.chain.holds),
		input: showInput,
		output: show,
		error: show,
		reads: () => [],
		body: (input, claimed) =>
			writing(behave(shape.chain.behaviour, claimed, input.n), {
				relation: "chain",
				key: `${input.root}:${input.n}`,
				value: input.n
			}),
		edges: () => [
			spawn("next", Chain, (input: Input, left: number) =>
				left > 0 ? [{ root: input.root, n: left - 1 }] : []
			)
		]
	}

	const Leaf: StepKind<Input, number, number> = {
		name: "Leaf",
		runs: on(shape.fan.holds),
		input: showInput,
		output: show,
		error: show,
		reads: () => [],
		body: (input, claimed) =>
			writing(behave(shape.fan.leaf, claimed, input.n), {
				relation: "leaf",
				key: `${input.root}:${input.n}`,
				value: input.n
			}),
		edges: () => []
	}

	const After: StepKind<Input, number, number> = {
		name: "After",
		runs: on(false),
		input: showInput,
		output: show,
		error: show,
		reads: () => [],
		body: (input, claimed) => behave({ _tag: "Ok" }, claimed, input.n),
		edges: () => []
	}

	const Sub: ScopeKind<Input, number, number> = {
		name: "Sub",
		input: showInput,
		start: (input) =>
			Arr.map(ordinals(input.n), (index) => stepOf(Leaf, { root: input.root, n: index + 100 })),
		finish: {
			runs: on(false),
			output: show,
			error: show,
			body: (input, children, claimed) =>
				writing(
					behave(
						shape.finish,
						claimed,
						Arr.filter(children, (child) => child._tag === "Done").length
					),
					{ relation: "sub", key: input.root, value: children.length }
				)
		}
	}

	const Fan: StepKind<Input, number, number> = {
		name: "Fan",
		runs: on(false),
		input: showInput,
		output: show,
		error: show,
		reads: () => [],
		body: (input, claimed) => behave(shape.fan.behaviour, claimed, input.n),
		edges: () => [
			spawn("leaves", Leaf, (input: Input, leaves: number) =>
				Arr.map(ordinals(leaves), (index) => ({ root: input.root, n: index }))
			),
			...(shape.sub._tag === "Sub"
				? [
						open(
							"sub",
							Sub,
							(input: Input, leaves: number) => [{ root: input.root, n: leaves }],
							() => [
								spawn("after", After, (input: Input, done: number) => [
									{ root: input.root, n: done }
								])
							]
						)
					]
				: [])
		]
	}

	const after = shape.timer._tag === "Timer" ? shape.timer.after : 1

	/** A timer: it reads whether its root's `outside` row is there, and re-arms while it is not and rearms remain. */
	const Timer: StepKind<Input, Readonly<{ at: number; seen: boolean }>, number> = {
		name: "Timer",
		runs: on(false),
		input: showInput,
		output: (fired) => ({ at: fired.at, seen: fired.seen }),
		error: show,
		reads: (input) => [
			{
				name: "outside",
				query: { _tag: "Rows", relation: "outside", key: Option.some(input.root) }
			}
		],
		body: (_input, claimed) => ({
			_tag: "Output",
			output: { at: claimed.at, seen: Arr.isReadonlyArrayNonEmpty(claimed.read("outside")) },
			writes: []
		}),
		edges: () => [
			spawnAt("rearm", Timer, (input: Input, fired: Readonly<{ at: number; seen: boolean }>) =>
				!fired.seen && input.n > 0
					? [{ input: { root: input.root, n: input.n - 1 }, at: fired.at + after }]
					: []
			)
		]
	}

	const Root: ScopeKind<Input, number, number> = {
		name: "Synthetic",
		input: showInput,
		start: (input) => [
			...(shape.chain.length > 0
				? [stepOf(Chain, { root: input.root, n: shape.chain.length - 1 })]
				: []),
			...(shape.fan.leaves > 0 ? [stepOf(Fan, { root: input.root, n: shape.fan.leaves })] : []),
			...(shape.timer._tag === "Timer"
				? [stepAt(Timer, { root: input.root, n: shape.timer.rearms }, input.n + after)]
				: [])
		],
		finish: {
			runs: on(false),
			output: show,
			error: show,
			body: (input, children, claimed) =>
				writing(behave(shape.finish, claimed, children.length), {
					relation: "synthetic",
					key: input.root,
					value: Arr.filter(children, (child) => child._tag === "Done").length
				})
		}
	}

	const Synthetic: RootKind<Input, number, number> = {
		name: "Synthetic",
		trigger: { _tag: "Operator" },
		from: { _tag: "Given", heading: "SyntheticInput" },
		precondition: Option.none(),
		exclusive: shape.exclusive ? Option.some(() => "shared") : Option.none(),
		window: shape.window,
		scope: Root
	}

	const Pass: StepKind<Input, number, number> = {
		name: "Pass",
		runs: on(false),
		input: showInput,
		output: show,
		error: show,
		reads: () => [],
		body: (input, claimed) => behave({ _tag: "Ok" }, claimed, input.n),
		edges: () => []
	}

	/** A gate: admitted only while no generated step is pending anywhere, W4's quiescence precondition. */
	const Gate: RootKind<Input, number, number> = {
		name: "Gate",
		trigger: { _tag: "Operator" },
		from: { _tag: "Given", heading: "GateInput" },
		precondition: Option.some({ _tag: "Pending", roots: ["Synthetic"] }),
		window: Option.none(),
		exclusive: Option.some(() => "gate"),
		scope: {
			name: "Gate",
			input: showInput,
			start: (input) => [stepOf(Pass, input)],
			finish: {
				runs: on(false),
				output: show,
				error: show,
				body: (_input, children) => ({ _tag: "Output", output: children.length, writes: [] })
			}
		}
	}

	const admissions = Arr.map(shape.roots, (root, index): Act => {
		const key = `r${index}`
		return {
			_tag: "Admit",
			at: root.at,
			admission: admissionOf(Synthetic, key, { root: key, n: root.at }),
			by: root.by
		}
	})
	const gates = Arr.map(shape.gates, (at, index): Act => ({
		_tag: "Admit",
		at,
		admission: admissionOf(Gate, `g${index}`, { root: `g${index}`, n: at }),
		by: "operator"
	}))
	const outside = Arr.map(shape.outside, (write): Act => ({
		_tag: "Write",
		at: write.at,
		writes: [{ relation: "outside", key: `r${write.root}`, value: write.at }],
		admits: []
	}))
	const acts = Arr.sort([...admissions, ...gates, ...outside], ACT_ORDER)
	const horizon = Arr.reduce(
		[
			...Arr.map(acts, (act) => act.at),
			horizonOf(shape.chain.behaviour),
			horizonOf(shape.fan.behaviour),
			horizonOf(shape.fan.leaf),
			horizonOf(shape.finish)
		],
		0,
		(latest, at) => Math.max(latest, at)
	)
	const program: Program = {
		name: "synthetic",
		resources: [resource],
		roots: [rootedOf(Synthetic), rootedOf(Gate)]
	}
	return { program, acts, horizon }
}

/** Acts in the order the world does them: by instant, and in the order drawn within one. */
const ACT_ORDER = Order.mapInput(Order.Number, (act: Act) => act.at)
