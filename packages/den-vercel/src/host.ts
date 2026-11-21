import { DeploymentId, EnvironmentName, Host } from "@bjornpagen/den/transport"
import { Config, Layer } from "effect"

/**
 * Where a function runs, read once from the environment Vercel gives it: the environment it serves (`VERCEL_ENV`) and
 * the deployment whose code it runs (`VERCEL_DEPLOYMENT_ID`), which den judges every turn by against the deployment its
 * environment serves, so a replaced deployment's chains end at their next ring.
 */
export const host: Layer.Layer<Host, Config.ConfigError> = Layer.effect(
	Host,
	Config.all({
		environment: Config.schema(EnvironmentName, "VERCEL_ENV"),
		deployment: Config.schema(DeploymentId, "VERCEL_DEPLOYMENT_ID")
	})
)
