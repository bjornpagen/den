-- grizzle: no-transaction

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_key_scope_ww7cpygqna";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_assignment_input_key_scope_ww7cpygqna" ON "slice"."assign_assignment_input" USING btree ("__scope_44i2s4kbue");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_key_scope_xkzvuysyji";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_assignment_input_key_scope_xkzvuysyji" ON "slice"."assign_assignment_input" USING btree ("__scope_3owcvq3eou");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_key_step_2jprqspwz2";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_input_key_step_2jprqspwz2" ON "slice"."assign_decide_input" USING btree ("__step_rbt3e5bpyf");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_key_step_sjxw7625ad";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_input_key_step_sjxw7625ad" ON "slice"."assign_decide_input" USING btree ("__step_5ftuveszke");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_key_step_jskz62lztu";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_output_key_step_jskz62lztu" ON "slice"."assign_decide_output" USING btree ("__step_zqzc7m2bzh");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_key_step_cazpxzqxko";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_output_key_step_cazpxzqxko" ON "slice"."assign_decide_output" USING btree ("__step_7f435gey6a");
