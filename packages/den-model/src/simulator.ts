import { Array as Arr, HashMap, Option } from "effect"
import type { Entry } from "#facts.ts"
import type { RootKey } from "#identity.ts"
import {
	type Answered,
	type AwaitRow,
	type BodyRow,
	claimable,
	emptyState,
	endingOf,
	freeSlots,
	type Lease,
	type Ledger,
	type ScopeRow,
	type State
} from "#ledger.ts"
import {
	type Admission,
	type Ceilings,
	closedSpanOf,
	type Lane,
	type Program,
	rungOf,
	type Settled
} from "#program.ts"

/**
 * The simulated platform's settings, every one a bound the test draws: the census's period in ticks; an invocation's
 * lifetime, which is also a delivery's visibility timeout; the turns one invocation takes at most; a message's
 * deliveries at most (`maxDeliveries`); the transport's deduplication window; the events of the chaotic phase; and the
 * ticks a process pause, a delayed delivery or a body may take at most.
 */
export type Platform = Readonly<{
	census: number
	lifetime: number
	turns: number
	deliveries: number
	dedup: number
	events: number
	stall: number
}>

/**
 * The faults a run's chaotic phase may inject, each turned on per case by a swarm:
 * - `drop`: a send never reaches the queue;
 * - `duplicate`: a delivery is made again, as a lapsed visibility timeout or a zone failover makes it;
 * - `delay`: a delivery arrives late;
 * - `reorder`: any deliverable message is delivered next, not the oldest;
 * - `deploy`: a new deployment becomes current, leaving the old one's messages and workers behind;
 * - `death-before-claim`, `death-after-claim`, `death-after-commit`: a worker dies at that point of its turn;
 * - `pause`: a worker's process pauses before its commit reaches the ledger, maybe past its lease;
 * - `lost-answer`: a commit lands but its answer is lost, so the worker sends it again;
 * - `transient`, `unavailable`: a step's call fails outside its body (grizzle's `CallError`): a wait, or an attempt;
 * - `handover`: the relay's leader hands over, and the new one replays the read it serves;
 * - `stop`, `operator-pause`: an operator stops a scope, or pauses and resumes a lane;
 * - `double-complete`: an await is completed again, maybe with another value;
 * - `readmit`: a root is admitted again under its key.
 */
export const FAULTS = [
	"drop",
	"duplicate",
	"delay",
	"reorder",
	"deploy",
	"death-before-claim",
	"death-after-claim",
	"death-after-commit",
	"pause",
	"lost-answer",
	"transient",
	"unavailable",
	"handover",
	"stop",
	"operator-pause",
	"double-complete",
	"readmit"
] as const

/** A fault of the chaotic phase. */
export type Fault = (typeof FAULTS)[number]

/**
 * Where the simulation's choices come from: a case's tape, so a run replays from its token and shrinks like any value.
 * `pick(n)` chooses one of `n` options, `bool` whether a fault strikes where it may, `upTo(n)` a magnitude of `0..n`.
 */
export type Nature = Readonly<{
	pick: (options: number) => number
	bool: (fault: Fault) => boolean
	upTo: (most: number) => number
}>

/** A message in the transport: a doorbell for a lane, its key, the deployment it is pinned to, and its deliveries. */
export type Message = Readonly<{
	id: number
	key: string
	lane: string
	deployment: number
	deliverAt: number
	deliveries: number
}>

/** Where a worker stands in its invocation. */
type Phase =
	| Readonly<{ _tag: "Ready" }>
	| Readonly<{ _tag: "Running"; lease: Lease; done: number }>
	| Readonly<{ _tag: "Reporting"; lease: Lease; settled: Settled; arrives: number }>
	| Readonly<{ _tag: "Turned" }>

/** One function invocation: the message that woke it, the deployment it runs, when it started, and its turns. */
type Worker = Readonly<{
	id: number
	message: Message
	deployment: number
	started: number
	turns: number
	worked: boolean
	phase: Phase
}>

/**
 * How the platform around the ledger behaves, each a function so a planted bug replaces one (planted.ts):
 * - `counts`: whether the census counts a step as due at an instant;
 * - `afterStale`: what a worker answered `stale` sends before it exits (sound: nothing).
 */
export type Policy = Readonly<{
	counts: (row: BodyRow, at: number) => boolean
	afterStale: (lane: string, deployment: number, worker: number) => ReadonlyArray<Send>
}>

/** A message a worker or the census asks the transport to send. */
export type Send = Readonly<{ key: string; lane: string; deployment: number }>

/** The platform as den's proposal describes it. */
export const SOUND_POLICY: Policy = {
	counts: () => true,
	afterStale: () => []
}

/** A re-run the simulator made of an accepted call, at once, to check it changed nothing: the call and its re-run. */
export type Rerun = Readonly<{ entry: Entry; again: Entry }>

/**
 * How a run's fair phase ended: every root finished and retired and nothing left in flight; a step pending with no
 * move for longer than the patience its program allows; an old deployment's messages or workers still about past the
 * drain bound; or the phase's whole budget spent without either.
 */
export type FairEnd =
	| Readonly<{ _tag: "Quiescent"; at: number }>
	| Readonly<{
			_tag: "Stalled"
			at: number
			since: number
			patience: number
			pending: ReadonlyArray<string>
	  }>
	| Readonly<{ _tag: "Undrained"; at: number; deployments: ReadonlyArray<number> }>
	| Readonly<{ _tag: "Spent"; at: number; pending: ReadonlyArray<string> }>

/**
 * What a run shows its properties: its trace, the re-runs it made, the instant its fair phase began, how that phase
 * ended, the ledger it left, and what it noticed along the way (`seen`), the situations a search steers by.
 */
export type Run = Readonly<{
	trace: ReadonlyArray<Entry>
	reruns: ReadonlyArray<Rerun>
	fairFrom: number
	end: FairEnd
	state: State
	seen: ReadonlySet<Seen>
}>

/** What a run can notice of itself, for a search to require and steer by. */
export type Seen =
	| "claimed"
	| "reclaimed"
	| "retried"
	| "exhausted"
	| "failed"
	| "stale"
	| "late-accepted"
	| "late-lost"
	| "rerun-commit"
	| "stopped"
	| "paused"
	| "at-width"
	| "completed"
	| "timer"
	| "joined"
	| "finished"
	| "retired"
	| "handover"
	| "redelivered"
	| "deduplicated"
	| "deployed"

/** What a run is: the program, its admissions, the ledger's transitions, the platform's behaviour and settings. */
export type Setup = Readonly<{
	program: Program
	admissions: Arr.NonEmptyReadonlyArray<Admission>
	ledger: Ledger
	policy: Policy
	platform: Platform
}>

/** The mutable world one run steps through; a run is a pure function of its setup and its nature's choices. */
type World = {
	state: State
	now: number
	messages: Array<Message>
	sent: Map<string, number>
	workers: Array<Worker>
	relay: { deployment: number; sent: Set<string> }
	trace: Array<Entry>
	reruns: Array<Rerun>
	seen: Set<Seen>
	ids: number
	admitted: Array<number>
	claims: number
	spawned: number
}

/** The kinds of event the chaotic phase draws among, each when it applies. */
type Move =
	| "deliver"
	| "work"
	| "tick"
	| "census"
	| "relay"
	| "admit"
	| "handover"
	| "deploy"
	| "stop"
	| "pause"
	| "resume"
	| "complete"

const laneOf = (program: Program, name: string): Option.Option<Lane> =>
	Arr.findFirst(program.lanes, (lane) => lane.name === name)

/** Every pending step and unfinished scope of the ledger, by key: what a stall leaves behind. */
export const pendingOf = (state: State): ReadonlyArray<string> => [
	...Arr.flatMap(HashMap.toValues(state.steps), (row) =>
		Option.isNone(endingOf(row)) ? [row.text] : []
	),
	...Arr.flatMap(HashMap.toValues(state.scopes), (row) =>
		Option.isNone(row.ending) ? [row.text] : []
	)
]

/**
 * Runs a setup: a chaotic phase of `platform.events` events drawn from nature, faults on as nature's swarm says, then a
 * fair phase in which no fault strikes, every lane is resumed, every await is completed, the relay hands over to the
 * current deployment and every delivery is prompt, until the ledger is empty and nothing is in flight, a step pends
 * past its patience, an old deployment stays past its drain bound, or the phase's budget is spent. Every call of the
 * ledger lands in the trace, and every accepted call that names its keys is made again at once into `reruns`.
 */
export const simulate = (setup: Setup, nature: Nature): Run => {
	const { ledger, platform, program, policy } = setup
	const world: World = {
		state: emptyState,
		now: 0,
		messages: [],
		sent: new Map(),
		workers: [],
		relay: { deployment: 0, sent: new Set() },
		trace: [],
		reruns: [],
		seen: new Set(),
		ids: 0,
		admitted: [],
		claims: 0,
		spawned: 0
	}
	const record = (answered: Answered): State => {
		world.trace.push(answered.entry)
		world.spawned += Arr.filter(answered.entry.facts, (fact) => fact._tag === "Spawned").length
		world.state = answered.state
		return answered.state
	}
	/** Records a keyed call, and makes it again at once: an accepted call's second run must add nothing. */
	const keyed = (call: (state: State) => Answered): Answered => {
		const answered = call(world.state)
		record(answered)
		if (answered.answer === "accepted") {
			const again = call(answered.state)
			world.reruns.push({ entry: answered.entry, again: again.entry })
			world.state = again.state
		}
		return answered
	}
	const note = (seen: Seen) => world.seen.add(seen)

	const send = (message: Send, faulty: boolean): void => {
		if (faulty && nature.bool("drop")) {
			return
		}
		const previous = world.sent.get(message.key)
		if (previous !== undefined && world.now - previous < platform.dedup) {
			note("deduplicated")
			return
		}
		world.sent.set(message.key, world.now)
		world.ids += 1
		world.messages.push({
			...message,
			id: world.ids,
			deliverAt: world.now + (faulty && nature.bool("delay") ? 1 + nature.upTo(platform.stall) : 0),
			deliveries: 0
		})
	}

	/** Ends a worker's invocation: its delivery is acknowledged, whatever happened. */
	const exit = (worker: Worker) => {
		world.workers = Arr.filter(world.workers, (other) => other.id !== worker.id)
	}

	/** A worker died: its delivery's visibility lapses and the message comes back, up to its deliveries. */
	const die = (worker: Worker) => {
		exit(worker)
		if (worker.message.deliveries + 1 >= platform.deliveries) {
			return
		}
		note("redelivered")
		world.ids += 1
		world.messages.push({
			...worker.message,
			id: world.ids,
			deliverAt: world.now + platform.lifetime,
			deliveries: worker.message.deliveries + 1
		})
	}

	const replace = (worker: Worker) => {
		world.workers = Arr.map(world.workers, (other) => (other.id === worker.id ? worker : other))
	}

	const ring = (lane: string, deployment: number, key: string, faulty: boolean) =>
		send({ key, lane, deployment }, faulty)

	/** A worker's turn is over: it claims again while its invocation has turns and time, else it rings on and exits. */
	const turned = (worker: Worker, faulty: boolean) => {
		if (worker.turns < platform.turns && world.now < worker.started + platform.lifetime) {
			replace({ ...worker, phase: { _tag: "Ready" } })
			return
		}
		exit(worker)
		if (worker.worked) {
			ring(worker.message.lane, worker.deployment, `continue:${worker.id}`, faulty)
		}
	}

	const stale = (worker: Worker) => {
		note("stale")
		exit(worker)
		Arr.forEach(policy.afterStale(worker.message.lane, worker.deployment, worker.id), (message) =>
			send(message, false)
		)
	}

	/** What a worker's run of its lease reports: its body's outcome, or a failed call's retry on the ladder. */
	const settledOf = (lease: Lease, done: number, faulty: boolean): Settled => {
		const ladder = lease.runs.ladder
		if (done >= lease.until - 1) {
			return { _tag: "Retry", at: done + rungOf(ladder, lease.claimed.attempts), counts: "attempt" }
		}
		if (faulty && nature.bool("transient")) {
			return { _tag: "Retry", at: done + rungOf(ladder, lease.claimed.waits), counts: "wait" }
		}
		if (faulty && nature.bool("unavailable")) {
			return { _tag: "Retry", at: done + rungOf(ladder, lease.claimed.attempts), counts: "attempt" }
		}
		return lease.run(lease.claimed)
	}

	/** One move of a worker, faults striking where its phase allows them. */
	const step = (worker: Worker, faulty: boolean): void => {
		switch (worker.phase._tag) {
			case "Ready": {
				if (faulty && nature.bool("death-before-claim")) {
					die(worker)
					return
				}
				const lane = laneOf(program, worker.message.lane)
				if (Option.isNone(lane)) {
					exit(worker)
					return
				}
				const answered = ledger.claim(world.state, lane.value, worker.deployment, world.now)
				record(answered)
				switch (answered.answer) {
					case "stale":
						stale(worker)
						return
					case "exhausted":
						note("exhausted")
						turned({ ...worker, turns: worker.turns + 1, worked: true }, faulty)
						return
					case "accepted":
						Option.match(answered.lease, {
							onNone: () => exit(worker),
							onSome: (lease) => {
								note("claimed")
								world.claims = Math.max(world.claims, claimsBoundOf(lease.runs.ceilings))
								if (lease.claimed.reclaims > 0) {
									note("reclaimed")
								}
								const took = faulty ? nature.upTo(lease.runs.lease) : 0
								replace({ ...worker, phase: { _tag: "Running", lease, done: world.now + took } })
							}
						})
						return
					case "at-width":
						note("at-width")
						exit(worker)
						return
					case "paused":
						note("paused")
						exit(worker)
						return
					case "closed":
					case "idle":
					case "unchanged":
					case "lost":
					case "gone":
					case "live":
						exit(worker)
						return
				}
			}
			case "Running": {
				const { lease, done } = worker.phase
				if (world.now < Math.min(done, lease.until - 1)) {
					return
				}
				if (faulty && nature.bool("death-after-claim")) {
					die(worker)
					return
				}
				const settled = settledOf(lease, Math.min(done, lease.until - 1), faulty)
				const arrives =
					world.now + (faulty && nature.bool("pause") ? 1 + nature.upTo(platform.stall) : 0)
				replace({ ...worker, phase: { _tag: "Reporting", lease, settled, arrives } })
				return
			}
			case "Reporting": {
				const { lease, settled, arrives } = worker.phase
				if (world.now < arrives) {
					return
				}
				if (faulty && nature.bool("death-after-claim")) {
					die(worker)
					return
				}
				const late = world.now >= lease.until
				const answered = keyed((state) =>
					ledger.commit(
						state,
						{
							step: lease.step,
							claim: lease.claim,
							token: lease.token,
							settled,
							deployment: worker.deployment
						},
						world.now
					)
				)
				noteCommit(answered, settled, late)
				if (answered.answer === "stale") {
					stale(worker)
					return
				}
				if (faulty && nature.bool("lost-answer")) {
					note("rerun-commit")
					return
				}
				replace({ ...worker, turns: worker.turns + 1, worked: true, phase: { _tag: "Turned" } })
				return
			}
			case "Turned":
				if (faulty && nature.bool("death-after-commit")) {
					exit(worker)
					return
				}
				turned(worker, faulty)
		}
	}

	const noteCommit = (answered: Answered, settled: Settled, late: boolean) => {
		if (answered.answer === "accepted") {
			if (late) {
				note("late-accepted")
			}
			Arr.forEach(answered.entry.facts, (fact) =>
				Option.match(seenOfFact(fact), { onNone: () => undefined, onSome: note })
			)
		}
		if (answered.answer === "lost" && late) {
			note("late-lost")
		}
		if (settled._tag === "Retry") {
			note("retried")
		}
	}

	/**
	 * The relay's read, a served live read the leader streams in commit order: per lane, the steps that were due the
	 * moment a commit made them so (spawned, or retried at once), up to its free slots. A step that falls due by time
	 * passing, a deferred retry or a lease that ran out, is the census's to find.
	 */
	const relay = (faulty: boolean) => {
		Arr.forEach(program.lanes, (lane) => {
			const ready = Arr.take(
				Arr.filter(
					claimable(world.state, lane.name, world.now),
					(row) => row.phase._tag === "Due" && row.phase.at <= row.phase.since
				),
				freeSlots(world.state, lane, world.now)
			)
			Arr.forEach(ready, (row) => {
				const key = `wake:${row.text}:${row.claims}`
				if (!world.relay.sent.has(key)) {
					world.relay.sent.add(key)
					ring(lane.name, world.relay.deployment, key, faulty)
				}
			})
		})
	}

	const handover = () => {
		note("handover")
		world.relay = { deployment: world.state.deployment, sent: new Set() }
	}

	/** The census: timers fired, finished roots retired, and per lane as many doorbells as due steps and free slots. */
	const census = (faulty: boolean) => {
		const fired = keyed((state) => ledger.fire(state, world.now))
		if (fired.answer === "accepted") {
			note("timer")
		}
		Arr.forEach(finishedRoots(world.state), (root) => {
			const retired = keyed((state) => ledger.retire(state, root, world.now))
			if (retired.answer === "accepted") {
				note("retired")
			}
		})
		Arr.forEach(program.lanes, (lane) => {
			const due = Arr.filter(claimable(world.state, lane.name, world.now), (row) =>
				policy.counts(row, world.now)
			).length
			const rings = Math.min(due, freeSlots(world.state, lane, world.now))
			for (let at = 0; at < rings; at += 1) {
				ring(lane.name, world.state.deployment, `census:${lane.name}:${world.now}:${at}`, faulty)
			}
		})
	}

	const deliverable = () => Arr.filter(world.messages, (message) => message.deliverAt <= world.now)

	const deliver = (message: Message, faulty: boolean) => {
		const duplicate = faulty && nature.bool("duplicate")
		world.messages = Arr.filter(world.messages, (other) => other.id !== message.id || duplicate)
		if (duplicate) {
			note("redelivered")
		}
		world.ids += 1
		world.workers.push({
			id: world.ids,
			message,
			deployment: message.deployment,
			started: world.now,
			turns: 0,
			worked: false,
			phase: { _tag: "Ready" }
		})
	}

	const admit = (index: number) => {
		const admission = Arr.getUnsafe(setup.admissions, index)
		keyed((state) => ledger.admit(state, admission, world.now))
		world.admitted.push(index)
	}

	const moves = (): Arr.NonEmptyReadonlyArray<Move> => [
		"tick",
		"census",
		"relay",
		...(Arr.isReadonlyArrayNonEmpty(deliverable()) ? (["deliver"] as const) : []),
		...(Arr.isReadonlyArrayNonEmpty(world.workers) ? (["work", "work", "work"] as const) : []),
		...(world.admitted.length < setup.admissions.length || nature.bool("readmit")
			? (["admit"] as const)
			: []),
		...(nature.bool("handover") ? (["handover"] as const) : []),
		...(nature.bool("deploy") ? (["deploy"] as const) : []),
		...(nature.bool("stop") ? (["stop"] as const) : []),
		...(nature.bool("operator-pause") ? (["pause", "resume"] as const) : []),
		...(Arr.isReadonlyArrayNonEmpty(awaitsOf(world.state, true)) ? (["complete"] as const) : [])
	]

	const chaos = (move: Move) => {
		switch (move) {
			case "tick":
				world.now += 1
				return
			case "census":
				census(true)
				return
			case "relay":
				relay(true)
				return
			case "deliver": {
				const ready = deliverable()
				if (Arr.isReadonlyArrayNonEmpty(ready)) {
					deliver(
						nature.bool("reorder")
							? Arr.getUnsafe(ready, nature.pick(ready.length))
							: Arr.headNonEmpty(ready),
						true
					)
				}
				return
			}
			case "work":
				if (Arr.isReadonlyArrayNonEmpty(world.workers)) {
					step(Arr.getUnsafe(world.workers, nature.pick(world.workers.length)), true)
				}
				return
			case "admit": {
				const next = world.admitted.length < setup.admissions.length
				admit(next ? world.admitted.length : nature.pick(setup.admissions.length))
				return
			}
			case "handover":
				handover()
				return
			case "deploy":
				note("deployed")
				record(ledger.deploy(world.state, world.now))
				return
			case "stop": {
				const open = openScopes(world.state)
				if (Arr.isReadonlyArrayNonEmpty(open)) {
					const scope = Arr.getUnsafe(open, nature.pick(open.length))
					const stopped = keyed((state) => ledger.stop(state, scope.id, world.now))
					if (stopped.answer === "accepted") {
						note("stopped")
					}
				}
				return
			}
			case "pause": {
				const lane = Arr.getUnsafe(program.lanes, nature.pick(program.lanes.length)).name
				keyed((state) => ledger.pause(state, lane, world.now))
				return
			}
			case "resume": {
				const lane = Arr.getUnsafe(program.lanes, nature.pick(program.lanes.length)).name
				keyed((state) => ledger.resume(state, lane, world.now))
				return
			}
			case "complete": {
				const waiting = awaitsOf(world.state, nature.bool("double-complete"))
				if (Arr.isReadonlyArrayNonEmpty(waiting)) {
					const row = Arr.getUnsafe(waiting, nature.pick(waiting.length))
					const value = nature.upTo(1)
					const completed = keyed((state) => ledger.complete(state, row.id, value, world.now))
					if (completed.answer === "accepted") {
						note("completed")
					}
				}
			}
		}
	}

	for (let event = 0; event < platform.events; event += 1) {
		const options = moves()
		chaos(Arr.getUnsafe(options, nature.pick(options.length)))
	}

	return fair(setup, world, {
		keyed,
		relay,
		census,
		deliver,
		deliverable,
		step,
		handover,
		admit
	})
}

/** The calls the fair phase makes of the world the chaotic phase left. */
type Hands = Readonly<{
	keyed: (call: (state: State) => Answered) => Answered
	relay: (faulty: boolean) => void
	census: (faulty: boolean) => void
	deliver: (message: Message, faulty: boolean) => void
	deliverable: () => ReadonlyArray<Message>
	step: (worker: Worker, faulty: boolean) => void
	handover: () => void
	admit: (index: number) => void
}>

/**
 * The patience the fair phase grants a pending step before its next move. A step's next move waits at most for its
 * holder's lease to run out, its retry to fall due, its timer to fire or its lane's window to open, and then for the
 * census's next tick, which is at most a period away and rings it, so it is delivered and claimed that tick. The
 * patience is the sum of the longest of each: every step has a move within it, under fair scheduling.
 */
export const patienceOf = (
	state: State,
	program: Program,
	platform: Platform,
	now: number
): number => {
	const rows = HashMap.toValues(state.steps)
	const longest = (values: ReadonlyArray<number>) => Arr.reduce(values, 0, Math.max)
	return (
		longest(
			Arr.flatMap(rows, (row) =>
				row._tag === "Body" ? [row.runs.lease + row.runs.ladder.last] : []
			)
		) +
		longest(
			Arr.flatMap(rows, (row) =>
				row._tag === "Await" && row.awaiting._tag === "Timer" ? [row.awaiting.fires - now] : []
			)
		) +
		platform.census +
		longest(Arr.map(program.lanes, (lane) => closedSpanOf(lane.window)))
	)
}

/**
 * The fair phase: every remaining admission made, every lane resumed, the relay handed to the current deployment; then
 * per tick every await completed, the relay's read served, the census on its period, every deliverable message
 * delivered and every worker run to the end of its turns. It ends quiescent, stalled, undrained or spent: its budget is
 * the patience for every move its steps may make, each step's moves bounded by its ceilings (a claim and an end for
 * each attempt, wait and reclaim, and a few more), so a step that moves without end spends it.
 */
const fair = (setup: Setup, world: World, hands: Hands): Run => {
	const { ledger, platform, program } = setup
	const fairFrom = world.now
	for (let index = world.admitted.length; index < setup.admissions.length; index += 1) {
		hands.admit(index)
	}
	Arr.forEach(program.lanes, (lane) =>
		hands.keyed((state) => ledger.resume(state, lane.name, world.now))
	)
	hands.handover()
	let lastMove = world.now
	let moves = world.trace.length
	const deploymentsLeft = () =>
		Arr.dedupe([
			...Arr.flatMap(world.messages, (message) =>
				message.deployment < world.state.deployment ? [message.deployment] : []
			),
			...Arr.flatMap(world.workers, (worker) =>
				worker.deployment < world.state.deployment ? [worker.deployment] : []
			)
		])
	/**
	 * How long an old deployment may outlast the fair phase's start: a dead holder's delivery comes back within a
	 * lifetime, a delayed one within the stall, and a holder still running commits, and is answered `stale`, within its
	 * patience. Every one of them then exits, and sends nothing.
	 */
	const drainBound = (patience: number) => platform.lifetime + platform.stall + patience
	const end = (): FairEnd => {
		for (;;) {
			const pending = pendingOf(world.state)
			const quiet =
				!Arr.isReadonlyArrayNonEmpty(pending) &&
				HashMap.isEmpty(world.state.roots) &&
				!Arr.isReadonlyArrayNonEmpty(world.messages) &&
				!Arr.isReadonlyArrayNonEmpty(world.workers)
			if (quiet) {
				return { _tag: "Quiescent", at: world.now }
			}
			const patience = patienceOf(world.state, program, platform, world.now)
			if (Arr.isReadonlyArrayNonEmpty(pending) && world.now - lastMove > patience) {
				return { _tag: "Stalled", at: world.now, since: lastMove, patience, pending }
			}
			const left = deploymentsLeft()
			if (Arr.isReadonlyArrayNonEmpty(left) && world.now - fairFrom > drainBound(patience)) {
				return { _tag: "Undrained", at: world.now, deployments: left }
			}
			const bodies = Arr.flatMap(HashMap.toValues(world.state.steps), (row) =>
				row._tag === "Body" ? [row] : []
			)
			const restless = Arr.findFirst(bodies, (row) => row.claims > claimsBoundOf(row.runs.ceilings))
			if (Option.isSome(restless)) {
				return { _tag: "Spent", at: world.now, pending: [restless.value.text] }
			}
			const claims = Arr.reduce(bodies, world.claims, (most, row) =>
				Math.max(most, claimsBoundOf(row.runs.ceilings))
			)
			if (world.now - fairFrom > patience * world.spawned * 2 * claims + drainBound(patience)) {
				return { _tag: "Spent", at: world.now, pending }
			}
			tick()
			const facts = Arr.reduce(
				Arr.drop(world.trace, moves),
				0,
				(sum, entry) => sum + entry.facts.length
			)
			moves = world.trace.length
			if (facts > 0) {
				lastMove = world.now
			}
			world.now += 1
		}
	}
	const tick = () => {
		Arr.forEach(awaitsOf(world.state, false), (row) =>
			hands.keyed((state) => ledger.complete(state, row.id, 0, world.now))
		)
		hands.relay(false)
		if (world.now % platform.census === 0) {
			hands.census(false)
		}
		Arr.forEach(hands.deliverable(), (message) => hands.deliver(message, false))
		let busy = true
		while (busy) {
			const before = signatureOf(world)
			Arr.forEach(Arr.copy(world.workers), (worker) =>
				Option.match(
					Arr.findFirst(world.workers, (current) => current.id === worker.id),
					{ onNone: () => undefined, onSome: (current) => hands.step(current, false) }
				)
			)
			busy = signatureOf(world) !== before
		}
	}
	const ended = end()
	return {
		trace: world.trace,
		reruns: world.reruns,
		fairFrom,
		end: ended,
		state: world.state,
		seen: world.seen
	}
}

/** What a fair tick's inner loop watches for progress: the trace's length and every worker's phase. */
const signatureOf = (world: World): string =>
	`${world.trace.length}|${Arr.join(
		Arr.map(world.workers, (worker) => `${worker.id}:${worker.phase._tag}`),
		","
	)}`

/** What a run notices of a fact a commit landed. */
const seenOfFact = (fact: Entry["facts"][number]): Option.Option<Seen> => {
	switch (fact._tag) {
		case "Retried":
			return Option.some("retried")
		case "Failed":
			return Option.some("failed")
		case "Fed":
			return Option.some("joined")
		case "Finished":
			return Option.some("finished")
		case "Admitted":
		case "Opened":
		case "Spawned":
		case "Claimed":
		case "Done":
		case "Wrote":
		case "Completed":
		case "Stopped":
		case "Paused":
		case "Resumed":
		case "Deployed":
		case "Retired":
			return Option.none()
	}
}

/**
 * The most claims a step can take before its ceilings end it: each claim but the last ends in a retry, which spends an
 * attempt or a wait (a wait past its ceiling spends an attempt), or in a lease running out, which the next claim
 * counts as a reclaim, and the step fails at its attempts' or its reclaims' ceiling.
 */
export const claimsBoundOf = (ceilings: Ceilings): number =>
	ceilings.attempts + ceilings.waits + ceilings.reclaims - 1

/** The roots whose scope has finished: what the census retires. */
const finishedRoots = (state: State): ReadonlyArray<RootKey> =>
	Arr.flatMap(HashMap.toValues(state.roots), (root) =>
		Option.exists(HashMap.get(state.scopes, root.scope), (scope) => Option.isSome(scope.ending))
			? [root.key]
			: []
	)

/** The scopes not yet finished: what an operator may stop. */
const openScopes = (state: State): ReadonlyArray<ScopeRow> =>
	Arr.flatMap(HashMap.toValues(state.scopes), (row) => (Option.isNone(row.ending) ? [row] : []))

/** The external awaits an outside actor may complete: those pending, and with `again`, those completed too. */
const awaitsOf = (state: State, again: boolean): ReadonlyArray<AwaitRow> =>
	Arr.flatMap(HashMap.toValues(state.steps), (row) =>
		row._tag === "Await" && row.awaiting._tag === "External" && (again || Option.isNone(row.ending))
			? [row]
			: []
	)
