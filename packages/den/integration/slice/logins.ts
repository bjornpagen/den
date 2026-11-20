import { login } from "@bjornpagen/grizzle"
import { appWorkload, Auditor, auditWorkload } from "#integration/slice/app-programs.ts"
import { App } from "#integration/slice/app.ts"
import {
	AssignCoordinator,
	AssignDen,
	AssignRetirer,
	assignCommits,
	assignCoordinatorWorkload,
	assignDenWorkload,
	assignRetirerWorkload
} from "#integration/slice/generated/assign.programs.ts"
import {
	ChainDen,
	ChainCoordinator,
	ChainRetirer,
	chainCommits,
	chainDenWorkload,
	chainCoordinatorWorkload,
	chainRetirerWorkload
} from "#integration/slice/generated/chain.programs.ts"
import {
	ClockCoordinator,
	ClockDen,
	ClockRetirer,
	clockCommits,
	clockCoordinatorWorkload,
	clockDenWorkload,
	clockRetirerWorkload
} from "#integration/slice/generated/clock.programs.ts"
import {
	FanDen,
	FanCoordinator,
	FanRetirer,
	fanCommits,
	fanDenWorkload,
	fanCoordinatorWorkload,
	fanRetirerWorkload
} from "#integration/slice/generated/fan.programs.ts"
import {
	RetryDen,
	RetryCoordinator,
	RetryRetirer,
	retryCommits,
	retryDenWorkload,
	retryCoordinatorWorkload,
	retryRetirerWorkload
} from "#integration/slice/generated/retry.programs.ts"
import {
	ReviewCoordinator,
	ReviewDen,
	ReviewRetirer,
	reviewCommits,
	reviewCoordinatorWorkload,
	reviewDenWorkload,
	reviewRetirerWorkload
} from "#integration/slice/generated/review.programs.ts"
import {
	SyncDen,
	SyncCoordinator,
	SyncRetirer,
	syncCommits,
	syncDenWorkload,
	syncCoordinatorWorkload,
	syncRetirerWorkload
} from "#integration/slice/generated/sync.programs.ts"
import {
	WritebackCoordinator,
	WritebackDen,
	WritebackRetirer,
	writebackCommits,
	writebackCoordinatorWorkload,
	writebackDenWorkload,
	writebackRetirerWorkload
} from "#integration/slice/generated/writeback.programs.ts"
import { Loader } from "#integration/slice/roles.ts"

/** den's runtime login: each flow's den role, coordinator role and retiring role. */
export const Worker = login(
	App,
	"worker",
	[
		ChainDen,
		ChainCoordinator,
		ChainRetirer,
		FanDen,
		FanCoordinator,
		FanRetirer,
		SyncDen,
		SyncCoordinator,
		SyncRetirer,
		RetryDen,
		RetryCoordinator,
		RetryRetirer,
		AssignDen,
		AssignCoordinator,
		AssignRetirer,
		ReviewDen,
		ReviewCoordinator,
		ReviewRetirer,
		WritebackDen,
		WritebackCoordinator,
		WritebackRetirer,
		ClockDen,
		ClockCoordinator,
		ClockRetirer
	],
	{
		workload: [
			chainDenWorkload,
			chainCoordinatorWorkload,
			chainRetirerWorkload,
			fanDenWorkload,
			fanCoordinatorWorkload,
			fanRetirerWorkload,
			syncDenWorkload,
			syncCoordinatorWorkload,
			syncRetirerWorkload,
			retryDenWorkload,
			retryCoordinatorWorkload,
			retryRetirerWorkload,
			assignDenWorkload,
			assignCoordinatorWorkload,
			assignRetirerWorkload,
			reviewDenWorkload,
			reviewCoordinatorWorkload,
			reviewRetirerWorkload,
			writebackDenWorkload,
			writebackCoordinatorWorkload,
			writebackRetirerWorkload,
			clockDenWorkload,
			clockCoordinatorWorkload,
			clockRetirerWorkload
		]
	}
)

/** The app's login: its writer role, which den's commits run under beside the app's own writes, and its auditor. */
export const AppLogin = login(App, "app", [Loader, Auditor], {
	workload: [
		chainCommits,
		fanCommits,
		syncCommits,
		retryCommits,
		assignCommits,
		reviewCommits,
		writebackCommits,
		clockCommits,
		appWorkload,
		auditWorkload
	]
})
