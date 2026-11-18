ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_key_scope_ww7cpygqna" UNIQUE USING INDEX "__assign_assignment_input_key_scope_ww7cpygqna";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_key_scope_xkzvuysyji" UNIQUE USING INDEX "__assign_assignment_input_key_scope_xkzvuysyji";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_key_step_2jprqspwz2" UNIQUE USING INDEX "__assign_decide_input_key_step_2jprqspwz2";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_key_step_sjxw7625ad" UNIQUE USING INDEX "__assign_decide_input_key_step_sjxw7625ad";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_key_step_jskz62lztu" UNIQUE USING INDEX "__assign_decide_output_key_step_jskz62lztu";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_key_step_cazpxzqxko" UNIQUE USING INDEX "__assign_decide_output_key_step_cazpxzqxko";

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "assign_decide_output_confidence_finite";

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_esvfiv3erb";

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_ephkx6dc57";

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_3fapehithe" FOREIGN KEY ("scope") REFERENCES "slice"."assign_assignment_input" ("__scope_44i2s4kbue") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" VALIDATE CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_3fapehithe";

ALTER TABLE "slice"."assign_assignment_input_mode_within" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_ldeuocbixk" FOREIGN KEY ("scope") REFERENCES "slice"."assign_assignment_input" ("__scope_3owcvq3eou") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_within" VALIDATE CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_ldeuocbixk";

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_smeb6dksjy";

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_vlinncoes5";

ALTER TABLE "slice"."assign_decide_input_mode_nearest" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_lzlwvj6kch" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_input" ("__step_rbt3e5bpyf") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_nearest" VALIDATE CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_lzlwvj6kch";

ALTER TABLE "slice"."assign_decide_input_mode_within" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_step_4aicgmlk2z" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_input" ("__step_5ftuveszke") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_within" VALIDATE CONSTRAINT "__assign_decide_input_mode_within_fk_step_4aicgmlk2z";

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_step_6eza3ipk3z";

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_step_uf2quv342e";

ALTER TABLE "slice"."assign_decide_output_stage_rest" ADD CONSTRAINT "__assign_decide_output_stage_rest_fk_step_wwk6mswm3e" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_output" ("__step_zqzc7m2bzh") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_stage_rest" VALIDATE CONSTRAINT "__assign_decide_output_stage_rest_fk_step_wwk6mswm3e";

ALTER TABLE "slice"."assign_decide_output_stage_serve" ADD CONSTRAINT "__assign_decide_output_stage_serve_fk_step_f2p5s2crcy" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_output" ("__step_7f435gey6a") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_stage_serve" VALIDATE CONSTRAINT "__assign_decide_output_stage_serve_fk_step_f2p5s2crcy";
