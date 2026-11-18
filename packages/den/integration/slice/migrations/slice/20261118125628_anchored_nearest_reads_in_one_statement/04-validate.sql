ALTER TABLE "slice"."assign_assignment_input"
  DROP CONSTRAINT "__assign_assignment_input_key_scope_root_bchsw4ix2g",
  ADD CONSTRAINT "__assign_assignment_input_key_scope_root_bchsw4ix2g" UNIQUE USING INDEX "__next_assign_assignment_input_key_scope_root_bchsw_yfdnoawuaf";

ALTER TABLE "slice"."assign_assignment_input"
  DROP CONSTRAINT "__assign_assignment_input_key_scope_root_gibc2wxiel",
  ADD CONSTRAINT "__assign_assignment_input_key_scope_root_gibc2wxiel" UNIQUE USING INDEX "__next_assign_assignment_input_key_scope_root_gibc_2_izbr5d5avb";

ALTER TABLE "slice"."assign_decide_input"
  DROP CONSTRAINT "__assign_decide_input_key_step_root_wkkmcf3pki",
  ADD CONSTRAINT "__assign_decide_input_key_step_root_wkkmcf3pki" UNIQUE USING INDEX "__next_assign_decide_input_key_step_root_wkkmcf_3_gezl6jtgr5";

ALTER TABLE "slice"."assign_decide_input"
  DROP CONSTRAINT "__assign_decide_input_key_step_root_kr2gl2vduy",
  ADD CONSTRAINT "__assign_decide_input_key_step_root_kr2gl2vduy" UNIQUE USING INDEX "__next_assign_decide_input_key_step_root_kr_2_gl_2_7v6ifgcvxe";

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv";

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme";

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_assignment_input" ("__scope_44i2s4kbue", "__root_h2ohpjyioe") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" VALIDATE CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp";

ALTER TABLE "slice"."assign_assignment_input_mode_within" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_assignment_input" ("__scope_3owcvq3eou", "__root_i3j5qytpxw") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_within" VALIDATE CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7";

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz";

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4";

ALTER TABLE "slice"."assign_decide_input_mode_nearest" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("__step_rbt3e5bpyf", "__root_h2ohpjyioe") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_nearest" VALIDATE CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2";

ALTER TABLE "slice"."assign_decide_input_mode_within" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("__step_5ftuveszke", "__root_i3j5qytpxw") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_within" VALIDATE CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o";
