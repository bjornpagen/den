# The seams grizzle's main replaces

den is pinned on grizzle's `main`, into which `live` merged, so every commit below is in its pin. Taken: CLASH
(`schema()` takes a list, `lower/merge.ts` deleted), LIVE-SOURCE (the suites' decoder grant deleted), DEFERRABLE (the
status and declared reads deferrable), LEASE and DELTAMET for claims (each flow's Claim races its key, and a claim reads
back the holder it added or met), CARRIER (that read-back rides the claim's one statement, which generate compiles; den
has no other read-back), POROUS (each flow is two grizzle fragments the app lists, its graph and its coordination
group; den's programs are written over them, and each commit is a union of den's facts with the app's writes), LEASE
for the coordination group, and DBCLOCK:

- **LEASE for the coordination group (28496788).** The group is insert-only, and each flow's coordinator role
  certifies READ COMMITTED. Each exclusivity seat and pause is a chain of turns: exclusivity seats (`<P>Exclusive` and
  `<P>Released`, by `(kind, key, turn)`) and pauses (`<P>Paused` and `<P>Resumed`, by `(target, turn)`, a target of
  `<P>Pausable`: a resource, a pause handle or a root kind, a pause handle holding no seat), each turn after
  the first contained in its predecessor's end, so a chain holds at most one live turn, which the database enforces. A
  resource's seat count is a closed relation, `closed.relation("<P>Seats", { resource, seats }, ["resource"], …)` from
  the flow's declaration, and every live hold's seat is checked below it, so provisioning is gone. A step's seats are
  its claim's (**Stamped claims** below), no longer a chain. The coordinator role (`<p>_coordinator`) holds the group's
  rosters and relations by name, since no role holds a closed relation. None of
  these relations races: a multi-resource take must win every seat or none, which one call refused whole on any held key
  gives and a raced insert would not (it can win one seat and meet another), and a raced insert at a turn a stale read
  chose meets that turn's old row, which says nothing of who holds the key now; a refusal and a fresh read do. Until
  RETIRE, the turns accumulate as the graph does, and the status reads scan them as the graph's do.

  One outcome moved: **lowering a resource's seat count.** The provisioned seats let the census remove a seat once its
  hold was given back. A hold whose attempt ended now stays a row until its graph retires, so the seat bound is over the
  live holds alone: `<P>Live`, a derived relation of the holds whose claim's attempt has neither an `<P>Ended` nor a
  `<P>Held`, keyed by `(resource, seat)` and under `check("<P>SeatBelowCount", <P>Live, (row) => row.lt(row.seat,
  <P>Seats.at("seats", row.resource)))`, rules over a query. A fragment declares no derived relation, so the fragment
  module exports them as `<p>SeatLevel`, and the schema that lists the graph states them on a level over itself (the
  slice's `App`, `schema.extend([Listed], "SliceSeats", …)`). den's role reads the live holds through a query entry over
  `<P>Live`, so a schema without the level fails to typecheck. A migration that lowers a count is refused while a live
  hold sits at or above the new count and admitted over ended attempts' holds (`seatcount.test.ts`, whose kill checks
  every hold). Growing a count is a migration that validates at once.

- **Stamped claims (grizzle 208ff7519, b8717adbb, 4fd74fbad).** A claim's attempt is its place among its step's claims,
  `attempt: place`, stamped by the database from 0, so concurrent claimants serialize on the step's head and none
  chooses an attempt; a turn learns its attempt from the claim's read-back of `delta.added(<P>Claim)`, which rides the
  claim's one statement, and a claim is its turn's identity, with no holder and no nonce beside it (den-model's holder
  was always `Claim{step, attempt}`). A claim's seats are members of its ordered family, `ordered(on(<P>Hold, "step",
  "root", "attempt", "at"), fin(<P>Claim, "holds"))`, written in the claim's one write and carrying its step, root and
  attempt, so a lost claim holds no seat and nothing gives seats back after one. An attempt's end is `<P>Ended(step,
  attempt)`, written beside its `<P>Retry` and its `<P>Fenced` (each contained in it), or by the next claim of its step
  or of one of its seats once its lease has passed at that turn's reading, as the call's own rows, since a call holds
  every graph it touches; and `contained(on(select(<P>Claim, attempt ≥ 1), "step", pred("attempt")), on(<P>Ended,
  "step", "attempt"))` makes a claim after the first follow its predecessor's end, so a claimant whose serialization
  failure is run again, and stamps past a live attempt, is refused whole as a race lost. A seat is given back by the fact
  that ends its claim's attempt. Seats were turn chains in the coordination group, which outlive the graphs whose steps
  took them, and a chain's turn is proved from its predecessor's end, so a hold could be no claim's member while it was a
  turn: retiring a graph would delete turns later turns are proved from. So the chain law goes with the turns, the
  holds join the graph and retire with it (a retirable graph's attempts have all ended, so its holds are never live),
  and a seat holds at most one live hold by the live holds' key.

- **DBCLOCK (44cade74, 6172e92c, 8081e6ce).** `clocked(program, { now: unit })` binds `now` to
  `transaction_timestamp()`, one reading per call. Each flow's den role serves a clocked read of the database's instant
  alone, `<p>Now: clocked(query(<p>Graph).rule((r) => r.find({ now: r.param("now", DenInstant) })), { now: "millis" })`,
  and the ledger port answers it as `now`. The census's tick and the relay's pass read it once each and judge leases,
  due instants and windows at that reading; a turn judges its claim and its gates at a reading, and the timers it rings
  are its delays and the durations between two readings. A retry's due instant and every spawned step's are computed in
  the statement that writes them, the call's own reading plus a `DenDelay` (a step's delay after its spawn, a retry's
  rung), `Type.cast(Num.add(Type.base(now), Type.base(delay)), DenInstant)` in a clocked ChangeSet, which
  grizzle types with no guard since a reading lies in the clock's range and a delay in its contract's (79874ab5f), so no
  host names an instant a write stores (DECISIONS 43(a)). An invocation's end is its first reading plus its budget, and
  a claim's lease is computed in the claim's own statement, its reading plus the time the invocation has left at the
  turn's reading, `insertComputed(<P>Claim, [], { until })` with its holds nested as before, so no host names when a
  lease ends and no host's clock judges anything. `runtime/clock.ts` keeps only the in-process transport's clock, at which the in-process driver
  delivers a held wake once its delay has passed. Clocked reads serve `once` and no `watch`, which matches den's split:
  the relay's watch reads what commits made eligible, without time, and the census reads what time made eligible. The
  suites move the database's clock itself as they move their TestClock (**The moved clock** below).

- **RETIRE (c70cbed8, 1f935498, f14a46da, and RETIRE3's c782217b2).** Each flow's graph is one retirable unit:
  `retirable(<P>Root, [on(<Rel>, "root"), …])`, the header `<P>Root` with its `retired: retirement` field, every other
  graph relation a body carrying `root: DenScope` in every key it holds and on both sides of every containment between
  bodies. `<p>_retirer`, a role of its own whose option `retire` names the header, serves
  `ChangeSet.empty(<p>Graph).retire(<P>Root, [])`; `runtime/retire.ts` retires every ended root nothing still needs, a
  call each. Each role certifies as **Certificates** below says. Two laws moved: the header is no longer
  contained in `<P>Scope`, since a header that references a body would block its own retirement, and a skipped root's
  `by` names the holder's header, not its `Admitted` row, a fact of another unit that may retire first. The grizzle
  session's rulings on den's use (2026-11-18): every graph relation carries its root's key as a column, `root: DenScope`, contained in `<P>Root`, so a
  retired unit's fence refuses an insert by that key row by row (a unit reached through `Within`'s tree would make
  every insert's check recursive); a stale holder's insert and a root requested again under a retired key are both
  refused (since an operator's or the app's root is written at its request's own instant, its request again under any
  key already requested, a retired one's included, is refused on the header's key, which the request answers as
  already requested: it starts nothing, and the retired key never starts a graph again); the retire call is a role of
  its own; an app row that references a
  body row refuses the retirement (NO ACTION) unless the app declares its relation among the unit's bodies; and
  grizzle retires whole units only, never a chain's prefix, so the coordination group's chains of turns, each turn
  proved from its predecessor's end, must be restated before they can be retired: one current row per exclusivity seat
  or pause, or each turn a unit whose containment reads only its live predecessor. A step's seats are no chain since
  stamped claims: they retire with their graph. The restatement of the exclusivity and pause chains waits on the owner.

- **Certificates, and every call settled (grizzle's SELECTWHOLE, bb62f0fa1; Bjorn's ruling of 2026-11-19).** A
  containment with a selected side is judged whole, as a rule over a query, where the relations it reads are immutable
  and its two sides join within one unit: each step's and scope's input in its Step or Scope of its kind
  (`select(<P>Step, kind = …)`), each Done and Failed in its Result of its outcome, and the Assign flow's tagged
  unions' variant pairs, both ways. A plain containment into a declared key stays a foreign key, and so does each
  retirement fence. A write can break such a rule through a row another role writes, so every role that writes one
  certifies SERIALIZABLE (`laws`): each flow's `<p>_den` and `<p>_retirer`, and the app's `loader`, which commits the
  steps. Each flow's `<p>_coordinator` and the app's `auditor` certify READ COMMITTED; the app's and the worker's
  logins fence ChainResult, each of their writes of it locking it in exclusive mode before its snapshot, for the
  auditor's read committed foreign key checks into it. Bjorn ruled that den does
  whatever it needs to be correct, and performance only after correctness, so den takes those certificates.

  Under SERIALIZABLE a call can be refused as `transient`, which changed nothing, and grizzle never runs a call again
  of its own. So the ledger port fails only with den's `Settled`, every CallError but `transient`: the printed
  binding runs each of its calls through den's `settled` (`runtime/settled.ts`, @bjornpagen/den/runtime/settled), again
  at once while it is refused as transient, with no bound, since PostgreSQL cancels a transaction for a serialization
  failure only once another transaction of the conflict has committed, so the next run reads that work and does not
  fail on conflicts with the same transactions (README-SSI), and a deadlock cancels one of its two transactions, the
  other going on. No ending, record or retirement of den's holds a transient: the turn's retries of its claim and
  writes and the seat module's are the port's, a write still running at its turn's deadline is a wait that spends
  nothing, and two retirements of one flow, which run at once, both retire (`retire.test.ts`'s
  `concurrentRetirementsOfFinishedRootsAllRetire`, whose kill ends the binding's retirement on a transient refusal and
  keeps the root). The combinator is den's, not grizzle's: den is the one place anything goes again (Bjorn,
  2026-11-21), so grizzle keeps none, and an app runs its own calls to its served programs through den's too.

- **The moved clock (grizzle d37c40141).** A suite reads the database's clock at the instant its TestClock stands at,
  through the statements the served files run: `integration/support/slice.ts` serves each login from its file compiled
  for a moved clock (`compileServedMoved(login, snapshot, login.workload)`, from the committed snapshot, once a
  process), and every Db of a case is opened by `Db.openMoved(role, {}, offset)`, the offset the case's `Offset`: under
  the TestClock, the time it travelled since the case's services were built, in microseconds, read at each call; under
  the machine's clock, none. So a clocked read's reading, a ChangeSet's `now` and every instant an insert stamps are all
  the one moved instant of their call, a lease lapses and a retry comes due when the TestClock travels past it, and no
  suite reads two clocks. The ledgers' `travelling`, which shifted den's `now` reads alone by the TestClock's travel while
  clocked writes stamped the database's own instant, is deleted, and with it its double count under the machine's
  clock, where it added real time the database had already read. The committed served files stay the roles'
  addresses (`WorkerServed`, `AppServed`): a role opens on the layer of its login's name. The tests open the app's
  auditor through `openAuditor`, a moved Db like the ledgers', since a moved file refuses a ChangeSet call that states
  no offset.

- **The scalar namespaces (grizzle 51dff4bc0)** and **a level's bases as a list (ca3c91ee3).** `Compute` is gone: den's
  printed programs compute a due instant or a lease's end as `Type.cast(Num.add(Type.base(now), Type.base(delay)),
  DenInstant)`, a finite double's law is `Num.isFinite`, `DenDelay`'s contract is `Logic.and(Logic.ge(d, 0n),
  Logic.le(d, longestDelayMillis))`, and the slice's nearest-row distance is `Distance.cosine`. The slice's `App` is
  `schema.extend([Listed], "SliceSeats", …)`. grizzle's packages include `packages/openapi`, which
  `@bjornpagen/grizzle` depends on, so den's workspace lists it beside the others.

Still to come from the grizzle session: GUARD and SCHEMAMAP.
