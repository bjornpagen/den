import { Array as Arr, HashMap, Option } from "effect"
import { type Answer, type By, type Entry, type Fact, type Target, type Trace } from "#facts.ts"
import { type StepId, stepText } from "#identity.ts"
import {
	type Answered,
	dueAtOf,
	emptyState,
	endingOf,
	type Lease,
	ledger,
	pendingOf,
	type State,
	type StepRow
} from "#ledger.ts"
import {
	type Admission,
	closedSpanOf,
	type Program,
	rungOf,
	type Settled,
	windowsOf,
	type Write
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
 * - `handover`: the relay's leader hands over, and the new one replays from the last position its leader saved;
 * - `relay-lag`: the relay's leader sends but does not save its position, so a hand-over replays what it sent;
 * - `operator-pause`: an operator pauses and resumes resources and root kinds;
 * - `readmit`: a root is admitted again under its key, live or retired.
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
	"relay-lag",
	"operator-pause",
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

/** The faults a move may draw: whether one strikes where it may, and a magnitude of `0..n`. */
type Faults = Pick<Nature, "bool" | "upTo">

/** The fair phase's faults: none strikes, and every magnitude is 0. */
const noFaults: Faults = { bool: () => false, upTo: () => 0 }

/**
 * A message in the transport: a doorbell for one step, its key, the deployment it is pinned to, the instant it may be
 * delivered (later than its send for a delayed delivery, an exact timer), and its deliveries so far.
 */
export type Message = Readonly<{
	id: number
	key: string
	step: StepId
	deployment: number
	deliverAt: number
	deliveries: number
}>

/** Where a worker stands in its invocation. */
type Phase =
	| Readonly<{ _tag: "Ready"; step: StepId }>
	| Readonly<{ _tag: "Running"; lease: Lease; done: number }>
	| Readonly<{ _tag: "Reporting"; lease: Lease; settled: Settled; arrives: number }>
	| Readonly<{ _tag: "Turned"; next: Option.Option<StepId>; rings: Logged; position: number }>

/** One function invocation: the message that woke it, the deployment it runs, when it started, and its turns. */
type Worker = Readonly<{
	id: number
	message: Message
	deployment: number
	started: number
	turns: number
	phase: Phase
}>

/**
 * What made a ring: the worker's commit that rang it, by its place in the trace (the fast path); the relay, at the
 * position of the commit it streamed; the census's tick, at its instant; or a worker out of turns sending its
 * continuation.
 */
export type Cause =
	| Readonly<{ _tag: "Commit"; position: number }>
	| Readonly<{ _tag: "Relay"; position: number }>
	| Readonly<{ _tag: "Census"; tick: number }>
	| Readonly<{ _tag: "Continuation"; worker: number }>

/** A cause's canonical text. */
export const causeText = (cause: Cause): string => {
	switch (cause._tag) {
		case "Commit":
			return `commit@${cause.position}`
		case "Relay":
			return `relay@${cause.position}`
		case "Census":
			return `census@${cause.tick}`
		case "Continuation":
			return `continue@${cause.worker}`
	}
}

/**
 * A message a worker, the relay or the census asks the transport to send: the step it rings and the attempt it is due
 * for, what made the ring, its deployment and the instant it may be delivered.
 */
export type Send = Readonly<{
	step: StepId
	attempt: number
	cause: Cause
	deployment: number
	deliverAt: number
}>

/**
 * The idempotency key a send carries, which the transport deduplicates for its whole window (Vercel Queues: up to 24 h,
 * processed or not): the ring's cause and its step, so a retry of one cause, a relay's replay of one position, is a true
 * duplicate and a later cause is never absorbed by an earlier one's key.
 */
const keyOf = (send: Send): string => Arr.join([causeText(send.cause), stepText(send.step)], ":")

/**
 * One send the transport was asked for: when, its key, its step, its cause's text, and its fate: queued, dropped by a
 * fault, or dropped as a duplicate of a key the transport saw within its window.
 */
export type Sent = Readonly<{
	at: number
	key: string
	step: string
	cause: string
	fate: "queued" | "dropped" | "deduplicated"
}>

/**
 * What the world outside den does at an instant: a trigger admits a root (a schedule's tick, an operator's verb), or
 * the app commits its own transaction, its writes and the roots it admits with them.
 */
export type Act =
	| Readonly<{ _tag: "Admit"; at: number; admission: Admission; by: By }>
	| Readonly<{
			_tag: "Write"
			at: number
			writes: ReadonlyArray<Write>
			admits: ReadonlyArray<Admission>
	  }>

/** A re-run the simulator made of an accepted call, at once, to check it changed nothing: the call and its re-run. */
export type Rerun = Readonly<{ entry: Entry; again: Entry }>

/**
 * How a run's fair phase ended: every root finished and retired, every act done and nothing left in flight; a step
 * pending with no move for longer than the patience its program allows; an old deployment's messages or workers still
 * about past the drain bound; or a step past its ladder, or the phase's whole budget, spent.
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
 * What a run shows its laws: its trace, the re-runs it made, every send and its fate, the instant its fair phase began,
 * how that phase ended,
 * the ledger it left, and what it noticed along the way (`seen`), the situations a search steers by.
 */
export type Run = Readonly<{
	trace: Trace
	reruns: ReadonlyArray<Rerun>
	sends: ReadonlyArray<Sent>
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
	| "waited"
	| "exhausted"
	| "failed"
	| "stale"
	| "late-accepted"
	| "late-lost"
	| "rerun-commit"
	| "full"
	| "behind"
	| "early"
	| "closed"
	| "paused"
	| "read"
	| "finished"
	| "held"
	| "blocked"
	| "retired"
	| "readmitted-retired"
	| "continued"
	| "rang"
	| "relayed"
	| "timer"
	| "handover"
	| "replayed"
	| "redelivered"
	| "deduplicated"
	| "deployed"

/** What a run is: the program, what the world does when, the platform, and the horizon. */
export type Setup = Readonly<{
	program: Program
	acts: ReadonlyArray<Act>
	platform: Platform
	horizon: number
}>

/** What the relay owes per trace entry: the steps the entry made eligible, each from the instant it is due. */
type Logged = ReadonlyArray<Readonly<{ step: StepId; attempt: number; at: number }>>

/** What a worker's call left it: its continuation, if one, and the rest of what its call made eligible, to ring. */
type Committed = Readonly<{ next: Option.Option<StepId>; rings: Logged; position: number }>

/** Who made a call: a worker, which continues with its own first spawn and rings the rest, or anyone else. */
type Caller = "worker" | "other"

/** The mutable world one run steps through; a run is a pure function of its setup and its nature's choices. */
type World = {
	state: State
	now: number
	messages: Array<Message>
	sent: Map<string, number>
	sends: Array<Sent>
	workers: Array<Worker>
	relay: { deployment: number; position: number; durable: number }
	log: Array<Logged>
	trace: Array<Entry>
	reruns: Array<Rerun>
	seen: Set<Seen>
	ids: number
	acted: number
	admitted: Array<Readonly<{ admission: Admission; by: By }>>
	spawned: number
}

/** The kinds of event the chaotic phase draws among, each when it applies. */
type Move =
	| "deliver"
	| "work"
	| "tick"
	| "census"
	| "relay"
	| "readmit"
	| "handover"
	| "deploy"
	| "pause"
	| "resume"

/** Every target an operator may pause: the program's resources and its root kinds. */
const targetsOf = (program: Program): Arr.NonEmptyReadonlyArray<Target> => [
	...Arr.map(program.roots, (root): Target => ({ _tag: "Root", kind: root.kind })),
	...Arr.map(program.resources, (resource): Target => ({ _tag: "Resource", name: resource.name }))
]

/** The key of a step's attempt, as the relay and the continuation name it. */
const attemptKey = (step: StepId, attempt: number): string => `${stepText(step)}:${attempt}`

/**
 * Runs a setup: a chaotic phase of `platform.events` events drawn from nature, faults on as nature's swarm says, then a
 * fair phase in which no fault strikes, everything paused is resumed, the relay hands over to the current deployment
 * and every delivery is prompt, until the ledger is empty, every act done and nothing in flight, a step pends past its
 * patience, an old deployment stays past its drain bound, or the phase's budget is spent. Every call of the ledger
 * lands in the trace, and every accepted call that names its keys is made again at once into `reruns`.
 */
export const simulate = (setup: Setup, nature: Nature): Run => {
	const { platform, program } = setup
	const world: World = {
		state: emptyState,
		now: 0,
		messages: [],
		sent: new Map(),
		sends: [],
		workers: [],
		relay: { deployment: 0, position: 0, durable: 0 },
		log: [],
		trace: [],
		reruns: [],
		seen: new Set(),
		ids: 0,
		acted: 0,
		admitted: [],
		spawned: 0
	}
	const note = (seen: Seen) => world.seen.add(seen)
	const eligibleKeys = (state: State, at: number): ReadonlySet<string> =>
		new Set(
			Arr.map(ledger.standings.eligibleAt(state, at), (row) => attemptKey(row.id, row.claims))
		)

	/**
	 * Records a call: its entry in the trace, and in the relay's log the steps it made eligible: those eligible after it
	 * and not before, at once, and the timers it spawned, from their instants. A worker's call keeps for itself its
	 * first spawn eligible at once, its continuation, and rings the rest of what the log holds for it; the relay rings
	 * all of it, so the two ring the same steps harmlessly: the claim decides.
	 */
	const record = (answered: Answered, caller: Caller): Committed => {
		const entry = answered.entry
		const before = world.state
		world.trace.push(entry)
		world.state = answered.state
		const position = world.trace.length - 1
		if (Arr.isReadonlyArrayEmpty(entry.facts)) {
			world.log.push([])
			return { next: Option.none(), rings: [], position }
		}
		const was = eligibleKeys(before, entry.at)
		const after = ledger.standings.eligibleAt(answered.state, entry.at)
		const spawned = Arr.flatMap(entry.facts, (fact) => (fact._tag === "Spawned" ? [fact] : []))
		world.spawned += spawned.length
		const continuation =
			caller === "worker"
				? Arr.findFirst(spawned, (fact) =>
						Arr.some(after, (row) => row.text === stepText(fact.step) && row.claims === 0)
					)
				: Option.none()
		const kept = Option.map(continuation, (fact) => stepText(fact.step))
		const now = Arr.flatMap(after, (row) =>
			was.has(attemptKey(row.id, row.claims))
				? []
				: [{ step: row.id, attempt: row.claims, at: entry.at }]
		)
		const timers = Arr.flatMap(spawned, (fact) =>
			fact.due > entry.at ? [{ step: fact.step, attempt: 0, at: fact.due }] : []
		)
		const logged = [...now, ...timers]
		world.log.push(logged)
		Arr.forEach(entry.facts, (fact) => {
			if (fact._tag === "Read") {
				note("read")
			}
		})
		return {
			position,
			next: Option.map(continuation, (fact) => fact.step),
			rings:
				caller === "worker"
					? Arr.filter(logged, (ring) => !Option.contains(kept, stepText(ring.step)))
					: []
		}
	}

	/** Records a keyed call, and makes it again at once: an accepted call's second run must add nothing. */
	const keyed = (call: (state: State) => Answered): Answered => {
		const answered = call(world.state)
		record(answered, "other")
		if (answered.answer === "accepted") {
			const again = call(answered.state)
			world.reruns.push({ entry: answered.entry, again: again.entry })
			world.state = again.state
		}
		return answered
	}

	/**
	 * Sends a message, as Vercel Queues takes it: a fault may drop it, and a key the transport accepted within its
	 * deduplication window drops it out of band, however the first was processed.
	 */
	const send = (message: Send, faults: Faults): void => {
		const key = keyOf(message)
		const sent = (fate: Sent["fate"]) =>
			world.sends.push({
				at: world.now,
				key,
				step: stepText(message.step),
				cause: causeText(message.cause),
				fate
			})
		if (faults.bool("drop")) {
			sent("dropped")
			return
		}
		const previous = world.sent.get(key)
		if (previous !== undefined && world.now - previous < platform.dedup) {
			note("deduplicated")
			sent("deduplicated")
			return
		}
		sent("queued")
		world.sent.set(key, world.now)
		world.ids += 1
		world.messages.push({
			id: world.ids,
			key,
			step: message.step,
			deployment: message.deployment,
			deliverAt:
				Math.max(world.now, message.deliverAt) +
				(faults.bool("delay") ? 1 + faults.upTo(platform.stall) : 0),
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

	/** A ring of a step's attempt, from its instant, by its cause: a worker's commit or the relay's position. */
	const ring = (
		target: Readonly<{ step: StepId; attempt: number; at: number }>,
		cause: Cause,
		deployment: number,
		faults: Faults
	) =>
		send(
			{ step: target.step, attempt: target.attempt, cause, deployment, deliverAt: target.at },
			faults
		)

	/**
	 * A worker's turn is over: it rings the rest of what its commit made eligible, then continues with its continuation
	 * while its invocation has turns and time, sends the continuation as a message when it has neither, and exits when
	 * it has none.
	 */
	const turned = (worker: Worker, committed: Committed, faults: Faults) => {
		Arr.forEach(committed.rings, (target) => {
			note("rang")
			ring(target, { _tag: "Commit", position: committed.position }, worker.deployment, faults)
		})
		Option.match(committed.next, {
			onNone: () => exit(worker),
			onSome: (step) => {
				if (worker.turns < platform.turns && world.now < worker.started + platform.lifetime) {
					note("continued")
					replace({ ...worker, phase: { _tag: "Ready", step } })
					return
				}
				exit(worker)
				send(
					{
						step,
						attempt: 0,
						cause: { _tag: "Continuation", worker: worker.id },
						deployment: worker.deployment,
						deliverAt: world.now
					},
					faults
				)
			}
		})
	}

	const stale = (worker: Worker) => {
		note("stale")
		exit(worker)
	}

	/** What a worker's run of its lease reports: its body's outcome, or a failed call's retry on the ladder. */
	const settledOf = (lease: Lease, done: number, faults: Faults): Settled => {
		const ladder = lease.runs.ladder
		if (done >= lease.until - 1) {
			return { _tag: "Retry", at: done + rungOf(ladder, lease.claimed.attempts), counts: "attempt" }
		}
		if (faults.bool("transient")) {
			return { _tag: "Retry", at: done + rungOf(ladder, lease.claimed.waits), counts: "wait" }
		}
		if (faults.bool("unavailable")) {
			return { _tag: "Retry", at: done + rungOf(ladder, lease.claimed.attempts), counts: "attempt" }
		}
		return lease.run(lease.claimed)
	}

	const claimed = (worker: Worker, step: StepId, faults: Faults): void => {
		const turn = `w${worker.id}.${worker.turns}`
		const lapsed = Option.exists(
			HashMap.get(world.state.steps, stepText(step)),
			(row) => row.phase._tag === "Held"
		)
		const answered = ledger.claim(world.state, step, turn, worker.deployment, world.now)
		const committed = record(answered, "worker")
		switch (answered.answer) {
			case "stale":
				stale(worker)
				return
			case "exhausted":
				note("exhausted")
				turned({ ...worker, turns: worker.turns + 1 }, committed, faults)
				return
			case "accepted":
				Option.match(answered.lease, {
					onNone: () => exit(worker),
					onSome: (lease) => {
						note("claimed")
						if (lapsed) {
							note("reclaimed")
						}
						const took = faults.upTo(lease.runs.lease)
						replace({ ...worker, phase: { _tag: "Running", lease, done: world.now + took } })
					}
				})
				return
			case "full":
			case "behind":
			case "early":
			case "closed":
			case "paused":
				note(answered.answer)
				exit(worker)
				return
			case "unchanged":
			case "lost":
			case "gone":
			case "live":
			case "held":
			case "retired":
			case "blocked":
				exit(worker)
		}
	}

	/** One move of a worker, faults striking where its phase allows them. */
	const step = (worker: Worker, faults: Faults): void => {
		switch (worker.phase._tag) {
			case "Ready":
				if (faults.bool("death-before-claim")) {
					die(worker)
					return
				}
				claimed(worker, worker.phase.step, faults)
				return
			case "Running": {
				const { lease, done } = worker.phase
				if (world.now < Math.min(done, lease.until - 1)) {
					return
				}
				if (faults.bool("death-after-claim")) {
					die(worker)
					return
				}
				const settled = settledOf(lease, Math.min(done, lease.until - 1), faults)
				const arrives = world.now + (faults.bool("pause") ? 1 + faults.upTo(platform.stall) : 0)
				replace({ ...worker, phase: { _tag: "Reporting", lease, settled, arrives } })
				return
			}
			case "Reporting": {
				const { lease, settled, arrives } = worker.phase
				if (world.now < arrives) {
					return
				}
				if (faults.bool("death-after-claim")) {
					die(worker)
					return
				}
				const late = world.now >= lease.until
				const answered = ledger.commit(
					world.state,
					{
						step: lease.step,
						attempt: lease.attempt,
						turn: lease.turn,
						settled,
						reads: lease.taken,
						deployment: worker.deployment
					},
					world.now
				)
				const committed = record(answered, "worker")
				if (answered.answer === "accepted") {
					const again = ledger.commit(
						answered.state,
						{
							step: lease.step,
							attempt: lease.attempt,
							turn: lease.turn,
							settled,
							reads: lease.taken,
							deployment: worker.deployment
						},
						world.now
					)
					world.reruns.push({ entry: answered.entry, again: again.entry })
					world.state = again.state
				}
				noteCommit(answered, settled, late)
				if (answered.answer === "stale") {
					stale(worker)
					return
				}
				if (faults.bool("lost-answer")) {
					note("rerun-commit")
					return
				}
				replace({
					...worker,
					turns: worker.turns + 1,
					phase: {
						_tag: "Turned",
						next: committed.next,
						rings: committed.rings,
						position: committed.position
					}
				})
				return
			}
			case "Turned":
				if (faults.bool("death-after-commit")) {
					exit(worker)
					return
				}
				turned(worker, worker.phase, faults)
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
	 * The relay: the leader streams the log in commit order from its position, ringing every step each entry made
	 * eligible, pinned to its own deployment, keyed by step and attempt, a timer delayed to its instant; then it saves
	 * its position, unless it lags, so a hand-over replays from the last position saved: at least once.
	 */
	const relay = (faults: Faults) => {
		for (let at = world.relay.position; at < world.log.length; at += 1) {
			Arr.forEach(Arr.getUnsafe(world.log, at), (target) => {
				note(target.at > world.now ? "timer" : "relayed")
				ring(target, { _tag: "Relay", position: at }, world.relay.deployment, faults)
			})
		}
		world.relay.position = world.log.length
		if (!faults.bool("relay-lag")) {
			world.relay.durable = world.relay.position
		}
	}

	/** The relay's leader hands over to the current deployment, which replays from the last position saved. */
	const handover = () => {
		note("handover")
		if (world.relay.durable < world.relay.position) {
			note("replayed")
		}
		world.relay = {
			deployment: world.state.deployment,
			position: world.relay.durable,
			durable: world.relay.durable
		}
	}

	/**
	 * The census: its read at the tick in the trace, every root the ledger finds finished retired, and every step
	 * eligible at the tick rung, in order, keyed by the tick, pinned to the current deployment. Eligibility bounds the
	 * rings by free seats.
	 */
	const census = (faults: Faults) => {
		record(ledger.census(world.state, world.now), "other")
		Arr.forEach(ledger.retirable(world.state), (root) => {
			const retired = keyed((state) => ledger.retire(state, root, world.now))
			if (retired.answer === "accepted") {
				note("retired")
			}
		})
		Arr.forEach(ledger.standings.eligibleAt(world.state, world.now), (row) =>
			send(
				{
					step: row.id,
					attempt: row.claims,
					cause: { _tag: "Census", tick: world.now },
					deployment: world.state.deployment,
					deliverAt: world.now
				},
				faults
			)
		)
	}

	const deliverable = () => Arr.filter(world.messages, (message) => message.deliverAt <= world.now)

	const deliver = (message: Message, faults: Faults) => {
		const duplicate = faults.bool("duplicate")
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
			phase: { _tag: "Ready", step: message.step }
		})
	}

	const noteAdmission = (answered: Answered) =>
		Option.match(seenOfAdmission(answered.answer), { onNone: () => undefined, onSome: note })

	/** Every act whose instant has come, in order. */
	const act = () => {
		while (world.acted < setup.acts.length) {
			const next = Arr.getUnsafe(setup.acts, world.acted)
			if (next.at > world.now) {
				return
			}
			world.acted += 1
			switch (next._tag) {
				case "Admit":
					noteAdmission(keyed((state) => ledger.admit(state, next.admission, next.by, world.now)))
					world.admitted.push({ admission: next.admission, by: next.by })
					break
				case "Write":
					record(ledger.write(world.state, next.writes, next.admits, world.now), "other")
					Arr.forEach(next.admits, (admission) => world.admitted.push({ admission, by: "app" }))
			}
		}
	}

	const targets = targetsOf(program)

	const moves = (): Arr.NonEmptyReadonlyArray<Move> => [
		"tick",
		"census",
		"relay",
		...(Arr.isReadonlyArrayNonEmpty(deliverable()) ? (["deliver"] as const) : []),
		...(Arr.isReadonlyArrayNonEmpty(world.workers) ? (["work", "work", "work"] as const) : []),
		...(Arr.isReadonlyArrayNonEmpty(world.admitted) && nature.bool("readmit")
			? (["readmit"] as const)
			: []),
		...(nature.bool("handover") ? (["handover"] as const) : []),
		...(nature.bool("deploy") ? (["deploy"] as const) : []),
		...(nature.bool("operator-pause") ? (["pause", "resume"] as const) : [])
	]

	const chaos = (move: Move) => {
		switch (move) {
			case "tick":
				world.now += 1
				act()
				return
			case "census":
				census(nature)
				return
			case "relay":
				relay(nature)
				return
			case "deliver": {
				const ready = deliverable()
				if (Arr.isReadonlyArrayNonEmpty(ready)) {
					deliver(
						nature.bool("reorder")
							? Arr.getUnsafe(ready, nature.pick(ready.length))
							: Arr.headNonEmpty(ready),
						nature
					)
				}
				return
			}
			case "work":
				if (Arr.isReadonlyArrayNonEmpty(world.workers)) {
					step(Arr.getUnsafe(world.workers, nature.pick(world.workers.length)), nature)
				}
				return
			case "readmit": {
				if (Arr.isReadonlyArrayNonEmpty(world.admitted)) {
					const again = Arr.getUnsafe(world.admitted, nature.pick(world.admitted.length))
					noteAdmission(keyed((state) => ledger.admit(state, again.admission, again.by, world.now)))
				}
				return
			}
			case "handover":
				handover()
				return
			case "deploy":
				note("deployed")
				record(ledger.deploy(world.state, world.now), "other")
				return
			case "pause": {
				const target = Arr.getUnsafe(targets, nature.pick(targets.length))
				keyed((state) => ledger.pause(state, target, world.now))
				return
			}
			case "resume": {
				const target = Arr.getUnsafe(targets, nature.pick(targets.length))
				keyed((state) => ledger.resume(state, target, world.now))
			}
		}
	}

	act()
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
		act,
		targets
	})
}

/** The calls the fair phase makes of the world the chaotic phase left. */
type Hands = Readonly<{
	keyed: (call: (state: State) => Answered) => Answered
	relay: (faults: Faults) => void
	census: (faults: Faults) => void
	deliver: (message: Message, faults: Faults) => void
	deliverable: () => ReadonlyArray<Message>
	step: (worker: Worker, faults: Faults) => void
	handover: () => void
	act: () => void
	targets: ReadonlyArray<Target>
}>

/**
 * The patience the fair phase grants a pending step before its next move, counted from the last move `since`. A step's
 * next move waits at most for its holder's lease to run out, its retry or its timer to fall due, or the windows over it
 * to open, and then for the census's next tick, which is at most a period away and rings it, so it is delivered and
 * claimed that tick. The patience is the sum of the longest of each: every step has a move within it, under fair
 * scheduling. A due instant counts from the last move, never from the instant judged: judged from it, a timer re-armed
 * at the last move and due later than the rest of the patience would be called stalled before it fell due.
 */
export const patienceOf = (
	state: State,
	program: Program,
	platform: Platform,
	since: number
): number => {
	const rows = HashMap.toValues(state.steps)
	const longest = (values: ReadonlyArray<number>) => Arr.reduce(values, 0, Math.max)
	return (
		longest(Arr.map(rows, (row) => row.runs.lease + row.runs.ladder.last)) +
		longest(
			Arr.flatMap(rows, (row) =>
				Option.isNone(endingOf(row))
					? Option.toArray(Option.map(dueAtOf(row), (due) => due - since))
					: []
			)
		) +
		platform.census +
		longest(Arr.map(windowsOf(program), closedSpanOf)) +
		1
	)
}

/** The most attempts any step of the ledger's ladders allows, a never-ending ladder counting as one. */
const attemptsOf = (state: State): number =>
	Arr.reduce(HashMap.toValues(state.steps), 1, (most, row) =>
		Math.max(most, row.runs.ladder._tag === "Attempts" ? row.runs.ladder.attempts : 1)
	)

/** Whether a step has spent its ladder and still pends: a ladder that never ends what it should. */
const restless = (row: StepRow): boolean =>
	row.runs.ladder._tag === "Attempts" &&
	row.attempts >= row.runs.ladder.attempts &&
	Option.isNone(endingOf(row))

/**
 * The fair phase: everything paused resumed and the relay handed to the current deployment; then per tick every act
 * due, the relay's log served, the census on its period, every deliverable message delivered and every worker run to
 * the end of its turns. It ends quiescent, stalled, undrained or spent: its budget is the patience for every move its
 * steps may make, each step's moves bounded by its ladder, past the horizon of what the world does.
 */
const fair = (setup: Setup, world: World, hands: Hands): Run => {
	const { platform, program } = setup
	const fairFrom = world.now
	Arr.forEach(hands.targets, (target) =>
		hands.keyed((state) => ledger.resume(state, target, world.now))
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
	const tick = () => {
		hands.act()
		hands.relay(noFaults)
		if (world.now % platform.census === 0) {
			hands.census(noFaults)
		}
		Arr.forEach(hands.deliverable(), (message) => hands.deliver(message, noFaults))
		let busy = true
		while (busy) {
			const before = signatureOf(world)
			Arr.forEach(Arr.copy(world.workers), (worker) =>
				Option.match(
					Arr.findFirst(world.workers, (current) => current.id === worker.id),
					{ onNone: () => undefined, onSome: (current) => hands.step(current, noFaults) }
				)
			)
			busy = signatureOf(world) !== before
		}
	}
	const end = (): FairEnd => {
		for (;;) {
			const pending = pendingOf(world.state)
			const quiet =
				!Arr.isReadonlyArrayNonEmpty(pending) &&
				HashMap.isEmpty(world.state.roots) &&
				world.acted >= setup.acts.length &&
				!Arr.isReadonlyArrayNonEmpty(world.messages) &&
				!Arr.isReadonlyArrayNonEmpty(world.workers)
			if (quiet) {
				return { _tag: "Quiescent", at: world.now }
			}
			const patience = patienceOf(world.state, program, platform, lastMove)
			if (Arr.isReadonlyArrayNonEmpty(pending) && world.now - lastMove > patience) {
				return { _tag: "Stalled", at: world.now, since: lastMove, patience, pending }
			}
			const left = deploymentsLeft()
			if (Arr.isReadonlyArrayNonEmpty(left) && world.now - fairFrom > drainBound(patience)) {
				return { _tag: "Undrained", at: world.now, deployments: left }
			}
			const spent = Arr.findFirst(HashMap.toValues(world.state.steps), restless)
			if (Option.isSome(spent)) {
				return { _tag: "Spent", at: world.now, pending: [spent.value.text] }
			}
			const budget =
				patience * (world.spawned + 2) * (attemptsOf(world.state) + 2) +
				drainBound(patience) +
				Math.max(0, setup.horizon - fairFrom)
			if (world.now - fairFrom > budget) {
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
	const ended = end()
	return {
		trace: world.trace,
		reruns: world.reruns,
		sends: world.sends,
		fairFrom,
		end: ended,
		state: world.state,
		seen: world.seen
	}
}

/** What a run notices of a fact a commit landed. */
const seenOfFact = (fact: Fact): Option.Option<Seen> => {
	switch (fact._tag) {
		case "Retried":
			return Option.some(fact.counts === "wait" ? "waited" : "retried")
		case "Failed":
			return Option.some("failed")
		case "Finished":
			return Option.some(fact.ending === "Held" ? "held" : "finished")
		case "Admitted":
		case "Opened":
		case "Spawned":
		case "Claimed":
		case "Read":
		case "Seated":
		case "Unseated":
		case "Done":
		case "Wrote":
		case "Paused":
		case "Resumed":
		case "Deployed":
		case "Retired":
			return Option.none()
	}
}

/** What a run notices of an admission's answer. */
const seenOfAdmission = (answer: Answer): Option.Option<Seen> => {
	switch (answer) {
		case "held":
			return Option.some("held")
		case "blocked":
			return Option.some("blocked")
		case "retired":
			return Option.some("readmitted-retired")
		case "accepted":
		case "unchanged":
		case "lost":
		case "gone":
		case "stale":
		case "early":
		case "closed":
		case "paused":
		case "full":
		case "behind":
		case "exhausted":
		case "live":
			return Option.none()
	}
}

/** What a fair tick's inner loop watches for progress: the trace's length and every worker's phase. */
const signatureOf = (world: World): string =>
	`${world.trace.length}|${Arr.join(
		Arr.map(world.workers, (worker) => `${worker.id}:${worker.phase._tag}`),
		","
	)}`
