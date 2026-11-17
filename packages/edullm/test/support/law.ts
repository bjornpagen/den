import { Data, Effect } from "effect"

/** A law a property found broken, with what broke it. */
class LawBroken extends Data.TaggedError("LawBroken")<{ law: string; message: string }> {}

/** Fails with the law unless it holds. */
export const law = (
	name: string,
	holds: boolean,
	message: () => string
): Effect.Effect<void, LawBroken> =>
	holds ? Effect.void : Effect.fail(new LawBroken({ law: name, message: message() }))
