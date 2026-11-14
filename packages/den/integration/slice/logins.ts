import { login } from "@bjornpagen/grizzle"
import { appWorkload, Auditor, auditWorkload } from "#integration/slice/app-programs.ts"
import { App } from "#integration/slice/app.ts"
import {
	ChainDen,
	ChainCoordinator,
	chainCommits,
	chainDenWorkload,
	chainCoordinatorWorkload
} from "#integration/slice/generated/chain.programs.ts"
import {
	FanDen,
	FanCoordinator,
	fanCommits,
	fanDenWorkload,
	fanCoordinatorWorkload
} from "#integration/slice/generated/fan.programs.ts"
import {
	RetryDen,
	RetryCoordinator,
	retryCommits,
	retryDenWorkload,
	retryCoordinatorWorkload
} from "#integration/slice/generated/retry.programs.ts"
import {
	SyncDen,
	SyncCoordinator,
	syncCommits,
	syncDenWorkload,
	syncCoordinatorWorkload
} from "#integration/slice/generated/sync.programs.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's runtime login: each flow's den role and coordinator role. */
export const Worker = login(
	App,
	"worker",
	[
		ChainDen,
		ChainCoordinator,
		FanDen,
		FanCoordinator,
		SyncDen,
		SyncCoordinator,
		RetryDen,
		RetryCoordinator
	],
	{
		workload: [
			chainDenWorkload,
			chainCoordinatorWorkload,
			fanDenWorkload,
			fanCoordinatorWorkload,
			syncDenWorkload,
			syncCoordinatorWorkload,
			retryDenWorkload,
			retryCoordinatorWorkload
		]
	}
)

/** The app's login: its writer role, which den's commits run under beside the app's own writes, and its auditor. */
export const AppLogin = login(App, "app", [Loader, Auditor], {
	workload: [chainCommits, fanCommits, syncCommits, retryCommits, appWorkload, auditWorkload]
})
