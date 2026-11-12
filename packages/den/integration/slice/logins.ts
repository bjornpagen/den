import { login } from "@bjornpagen/grizzle"
import { appWorkload, Auditor, auditWorkload } from "#integration/slice/app-programs.ts"
import { App } from "#integration/slice/app.ts"
import {
	ChainDen,
	ChainSeats,
	chainCommits,
	chainDenWorkload,
	chainSeatsWorkload
} from "#integration/slice/generated/chain.programs.ts"
import {
	FanDen,
	FanSeats,
	fanCommits,
	fanDenWorkload,
	fanSeatsWorkload
} from "#integration/slice/generated/fan.programs.ts"
import {
	RetryDen,
	RetrySeats,
	retryCommits,
	retryDenWorkload,
	retrySeatsWorkload
} from "#integration/slice/generated/retry.programs.ts"
import {
	SyncDen,
	SyncSeats,
	syncCommits,
	syncDenWorkload,
	syncSeatsWorkload
} from "#integration/slice/generated/sync.programs.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's runtime login: each flow's den role and coordination role. */
export const Worker = login(
	App,
	"worker",
	[ChainDen, ChainSeats, FanDen, FanSeats, SyncDen, SyncSeats, RetryDen, RetrySeats],
	{
		workload: [
			chainDenWorkload,
			chainSeatsWorkload,
			fanDenWorkload,
			fanSeatsWorkload,
			syncDenWorkload,
			syncSeatsWorkload,
			retryDenWorkload,
			retrySeatsWorkload
		]
	}
)

/** The app's login: its writer role, which den's commits run under beside the app's own writes, and its auditor. */
export const AppLogin = login(App, "app", [Loader, Auditor], {
	workload: [chainCommits, fanCommits, syncCommits, retryCommits, appWorkload, auditWorkload]
})
