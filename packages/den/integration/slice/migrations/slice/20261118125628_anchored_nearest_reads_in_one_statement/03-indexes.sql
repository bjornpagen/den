-- grizzle: no-transaction

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_assignment_input_key_scope_root_bchsw_yfdnoawuaf";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_assignment_input_key_scope_root_bchsw_yfdnoawuaf" ON "slice"."assign_assignment_input" USING btree ("__scope_44i2s4kbue", "__root_h2ohpjyioe");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_assignment_input_key_scope_root_gibc_2_izbr5d5avb";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_assignment_input_key_scope_root_gibc_2_izbr5d5avb" ON "slice"."assign_assignment_input" USING btree ("__scope_3owcvq3eou", "__root_i3j5qytpxw");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_input_key_step_root_wkkmcf_3_gezl6jtgr5";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_input_key_step_root_wkkmcf_3_gezl6jtgr5" ON "slice"."assign_decide_input" USING btree ("__step_rbt3e5bpyf", "__root_h2ohpjyioe");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_input_key_step_root_kr_2_gl_2_7v6ifgcvxe";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_input_key_step_root_kr_2_gl_2_7v6ifgcvxe" ON "slice"."assign_decide_input" USING btree ("__step_5ftuveszke", "__root_i3j5qytpxw");
