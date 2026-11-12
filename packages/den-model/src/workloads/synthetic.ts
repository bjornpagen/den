import { Array as Arr, Option, Record } from "effect"
import { type Datum, textOf } from "#datum.ts"
import {
	type Admission,
	admissionOf,
	type AwaitKind,
	type Ceilings,
	type Claimed,
	type Counts,
	contribute,
	type Feed,
	feed,
	type Ladder,
	type Lane,
	type Outcome,
	open,
	type Program,
	type RootKind,
	type Runs,
	type ScopeKind,
	type StepKind,
	spawn,
	stepOf,
	awaitOf,
	ordinals,
	type Window
} from "#program.ts"

/**
 * How a generated step behaves on a claim: it outputs; it fails with its typed error; it retries a number of times
 * before it outputs; or it retries every time, so only its ceilings end it.
 */
export type Behaviour =
	| Readonly<{ _tag: "Ok" }>
	| Readonly<{ _tag: "Fails" }>
	| Readonly<{ _tag: "Retries"; times: number; counts: Counts }>
	| Readonly<{ _tag: "Forever"; counts: Counts }>

/** How a generated step runs: its lease, ceilings and ladder. */
export type Running = Readonly<{ lease: number; ceilings: Ceilings; ladder: Ladder }>

/**
 * The shape of a generated program, every part drawn:
 * - two lanes, each a width and a window;
 * - how its steps run;
 * - a chain of `chain.length` steps on lane `a`, each naming the next;
 * - a fan-out on lane `b` into `fan.leaves` leaves on lane `a`, which with `join` pair up into joined steps through a
 *   feed, and with `sub` also open a child scope of as many leaves, whose finish starts a follow-up step in the root;
 * - an await in the root's start, completed from outside or by a timer, whose completion starts one more chain step;
 * - the behaviour of each kind;
 * - how many roots the run admits.
 */
export type Shape = Readonly<{
	lanes: Readonly<{
		a: Readonly<{ width: number; window: Window }>
		b: Readonly<{ width: number; window: Window }>
	}>
	running: Running
	chain: Readonly<{ length: number; behaviour: Behaviour }>
	fan: Readonly<{ leaves: number; behaviour: Behaviour; leaf: Behaviour }>
	sub: boolean
	join: boolean
	gate:
		| Readonly<{ _tag: "None" }>
		| Readonly<{ _tag: "External" }>
		| Readonly<{ _tag: "Timer"; after: number }>
	finish: Behaviour
	roots: number
}>

/** What a generated step outputs and what it fails with: a count, shown as itself. */
const show = (value: number): Datum => value

/** A behaviour's outcome on a claim, outputting `output`. */
const behave = <O>(behaviour: Behaviour, claimed: Claimed, output: O): Outcome<O, number> => {
	switch (behaviour._tag) {
		case "Ok":
			return { _tag: "Output", output, writes: [] }
		case "Fails":
			return { _tag: "Failure", error: claimed.attempts }
		case "Retries":
			return claimed.attempts + claimed.waits < behaviour.times
				? { _tag: "Retry", at: claimed.at + 1, counts: behaviour.counts }
				: { _tag: "Output", output, writes: [] }
		case "Forever":
			return { _tag: "Retry", at: claimed.at + 1, counts: behaviour.counts }
	}
}

/** A behaviour's outcome with one app write landing beside its output. */
const writing = <O>(
	outcome: Outcome<O, number>,
	relation: string,
	key: string,
	value: Datum
): Outcome<O, number> =>
	outcome._tag === "Output" ? { ...outcome, writes: [{ relation, key, value }] } : outcome

/** The input every generated step carries: its root's key, so its writes name it, and a count. */
type Input = Readonly<{ root: string; n: number }>

const showInput = (input: Input): Datum => ({ root: input.root, n: input.n })

/** The generated program of a shape, and the admissions of its roots. */
export const syntheticOf = (
	shape: Shape
): Readonly<{ program: Program; admissions: Arr.NonEmptyReadonlyArray<Admission> }> => {
	const a: Lane = { name: "a", width: shape.lanes.a.width, window: shape.lanes.a.window }
	const b: Lane = { name: "b", width: shape.lanes.b.width, window: shape.lanes.b.window }
	const on = (lane: Lane): Runs => ({ lane, ...shape.running })

	const Chain: StepKind<Input, number, number> = {
		name: "Chain",
		runs: on(a),
		input: showInput,
		output: show,
		error: show,
		body: (input, claimed) =>
			writing(
				behave(shape.chain.behaviour, claimed, input.n),
				"chain",
				`${input.root}:${input.n}`,
				input.n
			),
		edges: () => [
			spawn("next", Chain, (input: Input, left: number) =>
				left > 0 ? [{ root: input.root, n: left - 1 }] : []
			)
		]
	}

	const Joined: StepKind<Readonly<{ [role: string]: Datum }>, number, number> = {
		name: "Joined",
		runs: on(b),
		input: (parts) => parts,
		output: show,
		error: show,
		body: (parts, claimed) =>
			writing(
				behave(shape.chain.behaviour, claimed, 0),
				"joined",
				textOf(parts),
				Record.size(parts)
			),
		edges: () => []
	}

	const Pair: Feed = feed("pair", ["left", "right"], Joined)

	const Leaf: StepKind<Input, number, number> = {
		name: "Leaf",
		runs: on(a),
		input: showInput,
		output: show,
		error: show,
		body: (input, claimed) =>
			writing(
				behave(shape.fan.leaf, claimed, input.n),
				"leaf",
				`${input.root}:${input.n}`,
				input.n
			),
		edges: () =>
			shape.join
				? [
						contribute(Pair, "left", (input: Input, index: number) =>
							index % 2 === 0
								? Option.some({
										key: `${Math.floor(index / 2)}`,
										value: { root: input.root, n: index }
									})
								: Option.none()
						),
						contribute(Pair, "right", (input: Input, index: number) =>
							index % 2 === 1
								? Option.some({
										key: `${Math.floor(index / 2)}`,
										value: { root: input.root, n: index }
									})
								: Option.none()
						)
					]
				: []
	}

	const After: StepKind<Input, number, number> = {
		name: "After",
		runs: on(a),
		input: showInput,
		output: show,
		error: show,
		body: (input, claimed) => behave({ _tag: "Ok" }, claimed, input.n),
		edges: () => []
	}

	const Sub: ScopeKind<Input, number, number> = {
		name: "Sub",
		input: showInput,
		start: (input) =>
			Arr.map(ordinals(input.n), (index) => stepOf(Leaf, { root: input.root, n: index + 100 })),
		finish: {
			runs: on(b),
			output: show,
			error: show,
			body: (input, children, claimed) =>
				writing(
					behave(
						shape.finish,
						claimed,
						Arr.filter(children, (child) => child._tag === "Done").length
					),
					"sub",
					`${input.root}:${input.n}`,
					children.length
				)
		}
	}

	const Fan: StepKind<Input, number, number> = {
		name: "Fan",
		runs: on(b),
		input: showInput,
		output: show,
		error: show,
		body: (input, claimed) => behave(shape.fan.behaviour, claimed, input.n),
		edges: () => [
			spawn("leaves", Leaf, (input: Input, leaves: number) =>
				Arr.map(ordinals(leaves), (index) => ({ root: input.root, n: index }))
			),
			...(shape.sub
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

	const Gate: AwaitKind<Input> = {
		name: "Gate",
		input: showInput,
		completion: () =>
			shape.gate._tag === "Timer"
				? { _tag: "Timer", after: shape.gate.after }
				: { _tag: "External" },
		edges: () => [spawn("opened", Chain, (input: Input) => [{ root: input.root, n: 0 }])]
	}

	const Root: ScopeKind<Input, number, number> = {
		name: "Synthetic",
		input: showInput,
		start: (input) => [
			...(shape.chain.length > 0
				? [stepOf(Chain, { root: input.root, n: shape.chain.length - 1 })]
				: []),
			...(shape.fan.leaves > 0 ? [stepOf(Fan, { root: input.root, n: shape.fan.leaves })] : []),
			...(shape.gate._tag === "None" ? [] : [awaitOf(Gate, input)])
		],
		finish: {
			runs: on(a),
			output: show,
			error: show,
			body: (input, children, claimed) =>
				writing(
					behave(shape.finish, claimed, children.length),
					"synthetic",
					input.root,
					Arr.filter(children, (child) => child._tag === "Done").length
				)
		}
	}

	const Synthetic: RootKind<Input, number, number> = {
		name: "Synthetic",
		trigger: { _tag: "Operator" },
		scope: Root
	}

	const admissions = Arr.map(Arr.range(1, Math.max(1, shape.roots)), (index) =>
		admissionOf(Synthetic, `r${index}`, { root: `r${index}`, n: index })
	)
	return { program: { name: "synthetic", lanes: [a, b] }, admissions }
}
