CREATE STATISTICS "slice"."__assign_finish_stats_scope_step_ld6jyxztu6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."assign_finish";

ANALYZE "slice"."assign_finish";

CREATE STATISTICS "slice"."__chain_finish_stats_scope_step_z7lvm6j2l6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."chain_finish";

ANALYZE "slice"."chain_finish";

CREATE STATISTICS "slice"."__fan_finish_stats_scope_step_4mm4p6zm66" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."fan_finish";

ANALYZE "slice"."fan_finish";

CREATE STATISTICS "slice"."__retry_finish_stats_scope_step_2nxi4d7tdj" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."retry_finish";

ANALYZE "slice"."retry_finish";

CREATE STATISTICS "slice"."__sync_finish_stats_scope_step_xiaq6np7mf" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."sync_finish";

ANALYZE "slice"."sync_finish";
