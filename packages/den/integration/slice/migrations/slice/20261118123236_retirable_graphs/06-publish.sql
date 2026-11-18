CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice"."assign_admitted" ("scope", "root"), "slice"."assign_assignment_input" ("scope", "root"), "slice"."assign_assignment_input_exclude" ("scope", "ordinal", "root"), "slice"."assign_assignment_input_mode_nearest" ("scope", "root"), "slice"."assign_assignment_input_mode_within" ("scope", "root"), "slice"."assign_claim" ("step", "attempt", "root"), "slice"."assign_decide_input" ("step", "root"), "slice"."assign_decide_input_exclude" ("step", "ordinal", "root"), "slice"."assign_decide_input_mode_nearest" ("step", "root"), "slice"."assign_decide_input_mode_within" ("step", "root"), "slice"."assign_decide_nearest_read" ("step", "ordinal", "root"), "slice"."assign_decide_output" ("step", "root"), "slice"."assign_decide_output_stage_rest" ("step", "root"), "slice"."assign_decide_output_stage_serve" ("step", "root"), "slice"."assign_decide_output_weighed" ("step", "ordinal", "root"), "slice"."assign_decide_seen_read" ("step", "ordinal", "root"), "slice"."assign_due" ("step", "root"), "slice"."assign_fenced" ("step", "attempt", "root"), "slice"."assign_finish" ("scope", "root"), "slice"."assign_held" ("step", "root"), "slice"."assign_paused" ("target", "turn"), "slice"."assign_result" ("step", "root"), "slice"."assign_resumed" ("target", "turn"), "slice"."assign_retry" ("step", "attempt", "root"), "slice"."assign_root" ("scope"), "slice"."assign_scope" ("scope", "root"), "slice"."assign_skipped" ("scope", "root"), "slice"."assign_step", "slice"."assign_within", "slice"."assigned" ("learner"), "slice"."audit" ("step"), "slice"."built" ("build"), "slice"."chain_admitted" ("scope", "root"), "slice"."chain_chain_run_input" ("scope", "root"), "slice"."chain_claim" ("step", "attempt", "root"), "slice"."chain_due" ("step", "root"), "slice"."chain_fenced" ("step", "attempt", "root"), "slice"."chain_finish" ("scope", "root"), "slice"."chain_held" ("step", "root"), "slice"."chain_next" ("from", "ordinal", "root"), "slice"."chain_ordered_input" ("scope", "root"), "slice"."chain_page_input" ("step", "root"), "slice"."chain_page_input_after" ("step", "root"), "slice"."chain_page_output" ("step", "root"), "slice"."chain_page_output_next" ("step", "root"), "slice"."chain_page_weights_read" ("step", "ordinal", "root"), "slice"."chain_paused" ("target", "turn"), "slice"."chain_result" ("step", "root"), "slice"."chain_resumed" ("target", "turn"), "slice"."chain_retry" ("step", "attempt", "root"), "slice"."chain_root" ("scope"), "slice"."chain_scope" ("scope", "root"), "slice"."chain_skipped" ("scope", "root"), "slice"."chain_start_scope" ("scope", "ordinal", "root"), "slice"."chain_start_step" ("scope", "ordinal", "root"), "slice"."chain_step", "slice"."chain_within", "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."fan_admitted" ("scope", "root"), "slice"."fan_batch_input" ("scope", "root"), "slice"."fan_claim" ("step", "attempt", "root"), "slice"."fan_due" ("step", "root"), "slice"."fan_fan_run_input" ("scope", "root"), "slice"."fan_fenced" ("step", "attempt", "root"), "slice"."fan_finish" ("scope", "root"), "slice"."fan_freed" ("resource", "seat", "turn"), "slice"."fan_held" ("step", "root"), "slice"."fan_hold" ("resource", "seat", "turn"), "slice"."fan_paused" ("target", "turn"), "slice"."fan_result" ("step", "root"), "slice"."fan_resumed" ("target", "turn"), "slice"."fan_retry" ("step", "attempt", "root"), "slice"."fan_root" ("scope"), "slice"."fan_scope" ("scope", "root"), "slice"."fan_skipped" ("scope", "root"), "slice"."fan_square_input" ("step", "root"), "slice"."fan_square_output" ("step", "root"), "slice"."fan_start_scope" ("scope", "ordinal", "root"), "slice"."fan_start_step" ("scope", "ordinal", "root"), "slice"."fan_step", "slice"."fan_within", "slice"."item" ("feed", "seq", "n"), "slice"."passage", "slice"."retry_admitted" ("scope", "root"), "slice"."retry_brittle_input" ("step", "root"), "slice"."retry_brittle_output" ("step", "root"), "slice"."retry_claim" ("step", "attempt", "root"), "slice"."retry_due" ("step", "root"), "slice"."retry_exhausted" ("step", "root"), "slice"."retry_fenced" ("step", "attempt", "root"), "slice"."retry_finish" ("scope", "root"), "slice"."retry_held" ("step", "root"), "slice"."retry_ladders_input" ("scope", "root"), "slice"."retry_paused" ("target", "turn"), "slice"."retry_result" ("step", "root"), "slice"."retry_resumed" ("target", "turn"), "slice"."retry_retry" ("step", "attempt", "root"), "slice"."retry_root" ("scope"), "slice"."retry_scope" ("scope", "root"), "slice"."retry_skipped" ("scope", "root"), "slice"."retry_steadfast_input" ("step", "root"), "slice"."retry_steadfast_output" ("step", "root"), "slice"."retry_step", "slice"."retry_within", "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."sync_admitted" ("scope", "root"), "slice"."sync_build_input" ("step", "root"), "slice"."sync_claim" ("step", "attempt", "root"), "slice"."sync_copy_input" ("step", "root"), "slice"."sync_due" ("step", "root"), "slice"."sync_exclusive" ("kind", "key", "turn"), "slice"."sync_exclusive_key" ("scope", "root"), "slice"."sync_fenced" ("step", "attempt", "root"), "slice"."sync_finish" ("scope", "root"), "slice"."sync_gold_input" ("scope", "root"), "slice"."sync_held" ("step", "root"), "slice"."sync_paused" ("target", "turn"), "slice"."sync_released" ("kind", "key", "turn"), "slice"."sync_result" ("step", "root"), "slice"."sync_resumed" ("target", "turn"), "slice"."sync_retry" ("step", "attempt", "root"), "slice"."sync_root" ("scope"), "slice"."sync_scope" ("scope", "root"), "slice"."sync_skipped" ("scope", "root"), "slice"."sync_step", "slice"."sync_sync_run_input" ("scope", "root"), "slice"."sync_within", "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice"."__ledger"
  WITH (publish_generated_columns = stored);

ALTER TABLE "slice"."sync_sync_run_input" DROP CONSTRAINT "__sync_sync_run_input_fk_scope_tag_kind_sync_run_axve4fqawx";

ALTER TABLE "slice"."sync_gold_input" DROP CONSTRAINT "__sync_gold_input_fk_scope_tag_kind_gold_m6g42g4z2p";

ALTER TABLE "slice"."sync_failed" DROP CONSTRAINT "__sync_failed_fk_step_tag_outcome_failed_w7buaawyeg";

ALTER TABLE "slice"."sync_done" DROP CONSTRAINT "__sync_done_fk_step_tag_outcome_done_axqxsievib";

ALTER TABLE "slice"."sync_copy_input" DROP CONSTRAINT "__sync_copy_input_fk_step_tag_kind_copy_uakhf373ei";

ALTER TABLE "slice"."sync_build_input" DROP CONSTRAINT "__sync_build_input_fk_step_tag_kind_build_2rrvrdqk3o";

ALTER TABLE "slice"."retry_steadfast_input" DROP CONSTRAINT "__retry_steadfast_input_fk_step_tag_kind_steadfast_u2z775muth";

ALTER TABLE "slice"."retry_ladders_input" DROP CONSTRAINT "__retry_ladders_input_fk_scope_tag_kind_ladders_vn6lnz3pry";

ALTER TABLE "slice"."retry_failed" DROP CONSTRAINT "__retry_failed_fk_step_tag_outcome_failed_3iz2aprkti";

ALTER TABLE "slice"."retry_done" DROP CONSTRAINT "__retry_done_fk_step_tag_outcome_done_fmzgo4pn2r";

ALTER TABLE "slice"."retry_brittle_input" DROP CONSTRAINT "__retry_brittle_input_fk_step_tag_kind_brittle_kchbox44ml";

ALTER TABLE "slice"."fan_square_input" DROP CONSTRAINT "__fan_square_input_fk_step_tag_kind_square_dshd7bwrky";

ALTER TABLE "slice"."fan_fan_run_input" DROP CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_tihneov63d";

ALTER TABLE "slice"."fan_failed" DROP CONSTRAINT "__fan_failed_fk_step_tag_outcome_failed_isdm7nl2mt";

ALTER TABLE "slice"."fan_done" DROP CONSTRAINT "__fan_done_fk_step_tag_outcome_done_jagqpg3plp";

ALTER TABLE "slice"."fan_batch_input" DROP CONSTRAINT "__fan_batch_input_fk_scope_tag_kind_batch_b6gxzmmqsm";

ALTER TABLE "slice"."chain_page_input" DROP CONSTRAINT "__chain_page_input_fk_step_tag_kind_page_iu55gzqbo5";

ALTER TABLE "slice"."chain_ordered_input" DROP CONSTRAINT "__chain_ordered_input_fk_scope_tag_kind_ordered_hubpibwkd5";

ALTER TABLE "slice"."chain_failed" DROP CONSTRAINT "__chain_failed_fk_step_tag_outcome_failed_2enwrjafnc";

ALTER TABLE "slice"."chain_done" DROP CONSTRAINT "__chain_done_fk_step_tag_outcome_done_chiiliaypx";

ALTER TABLE "slice"."chain_chain_run_input" DROP CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_m37i2umurb";

ALTER TABLE "slice"."assign_failed" DROP CONSTRAINT "__assign_failed_fk_step_tag_outcome_failed_rzgbd4gb37";

ALTER TABLE "slice"."assign_done" DROP CONSTRAINT "__assign_done_fk_step_tag_outcome_done_e5hddkaj3g";

ALTER TABLE "slice"."assign_decide_output_stage_serve" DROP CONSTRAINT "__assign_decide_output_stage_serve_fk_step_f2p5s2crcy";

ALTER TABLE "slice"."assign_decide_output_stage_rest" DROP CONSTRAINT "__assign_decide_output_stage_rest_fk_step_wwk6mswm3e";

ALTER TABLE "slice"."assign_decide_input_mode_within" DROP CONSTRAINT "__assign_decide_input_mode_within_fk_step_4aicgmlk2z";

ALTER TABLE "slice"."assign_decide_input_mode_nearest" DROP CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_lzlwvj6kch";

ALTER TABLE "slice"."assign_decide_input" DROP CONSTRAINT "__assign_decide_input_fk_step_tag_kind_decide_xsqmsuqet4";

ALTER TABLE "slice"."assign_assignment_input_mode_within" DROP CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_ldeuocbixk";

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" DROP CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_3fapehithe";

ALTER TABLE "slice"."assign_assignment_input" DROP CONSTRAINT "__assign_assignment_input_fk_scope_tag_kind_4hflxzmwtj";

ALTER TABLE "slice"."sync_step" DROP CONSTRAINT "__sync_step_key_step_kind_wiu4mx45lf";

ALTER TABLE "slice"."sync_start_step" DROP CONSTRAINT "__sync_start_step_key_step_qq4dgpmkqz";

ALTER TABLE "slice"."sync_start_scope" DROP CONSTRAINT "__sync_start_scope_key_child_5un3xf76pf";

ALTER TABLE "slice"."sync_scope" DROP CONSTRAINT "__sync_scope_key_scope_kind_unp3injvzz";

ALTER TABLE "slice"."sync_result" DROP CONSTRAINT "__sync_result_key_step_outcome_wyar5y72qb";

ALTER TABLE "slice"."sync_finish" DROP CONSTRAINT "__sync_finish_key_step_wzmqfzha66";

ALTER TABLE "slice"."retry_step" DROP CONSTRAINT "__retry_step_key_step_kind_aacvsq3pqx";

ALTER TABLE "slice"."retry_start_step" DROP CONSTRAINT "__retry_start_step_key_step_bbqb64zg6p";

ALTER TABLE "slice"."retry_start_scope" DROP CONSTRAINT "__retry_start_scope_key_child_6csfbzabat";

ALTER TABLE "slice"."retry_scope" DROP CONSTRAINT "__retry_scope_key_scope_kind_u77uvbp4xb";

ALTER TABLE "slice"."retry_result" DROP CONSTRAINT "__retry_result_key_step_outcome_vx2zehdpf7";

ALTER TABLE "slice"."retry_finish" DROP CONSTRAINT "__retry_finish_key_step_lifwe43hve";

ALTER TABLE "slice"."fan_step" DROP CONSTRAINT "__fan_step_key_step_kind_6mwvvgt65w";

ALTER TABLE "slice"."fan_start_step" DROP CONSTRAINT "__fan_start_step_key_step_777capvdxg";

ALTER TABLE "slice"."fan_start_scope" DROP CONSTRAINT "__fan_start_scope_key_child_gmvcyvsk2k";

ALTER TABLE "slice"."fan_scope" DROP CONSTRAINT "__fan_scope_key_scope_kind_epdwnzjh52";

ALTER TABLE "slice"."fan_result" DROP CONSTRAINT "__fan_result_key_step_outcome_5nrb7r22qd";

ALTER TABLE "slice"."fan_finish" DROP CONSTRAINT "__fan_finish_key_step_v72sacijwp";

ALTER TABLE "slice"."chain_step" DROP CONSTRAINT "__chain_step_key_step_kind_dlshgwdqz2";

ALTER TABLE "slice"."chain_start_step" DROP CONSTRAINT "__chain_start_step_key_step_ygziyjwk3l";

ALTER TABLE "slice"."chain_start_scope" DROP CONSTRAINT "__chain_start_scope_key_child_h23cre6olg";

ALTER TABLE "slice"."chain_scope" DROP CONSTRAINT "__chain_scope_key_scope_kind_f3gtwiklfd";

ALTER TABLE "slice"."chain_result" DROP CONSTRAINT "__chain_result_key_step_outcome_hqqrqon5z3";

ALTER TABLE "slice"."chain_next" DROP CONSTRAINT "__chain_next_key_to_jqccfs2l4c";

ALTER TABLE "slice"."chain_finish" DROP CONSTRAINT "__chain_finish_key_step_x7i5pvi5jm";

ALTER TABLE "slice"."assign_step" DROP CONSTRAINT "__assign_step_key_step_kind_5vttbbv3md";

ALTER TABLE "slice"."assign_start_step" DROP CONSTRAINT "__assign_start_step_key_step_b3r7vmxqkm";

ALTER TABLE "slice"."assign_start_scope" DROP CONSTRAINT "__assign_start_scope_key_child_hlw5b67j2d";

ALTER TABLE "slice"."assign_scope" DROP CONSTRAINT "__assign_scope_key_scope_kind_vvjb4nuh5r";

ALTER TABLE "slice"."assign_result" DROP CONSTRAINT "__assign_result_key_step_outcome_4i7igve5uz";

ALTER TABLE "slice"."assign_finish" DROP CONSTRAINT "__assign_finish_key_step_nthyxvagme";

ALTER TABLE "slice"."assign_decide_output" DROP CONSTRAINT "__assign_decide_output_key_step_cazpxzqxko";

ALTER TABLE "slice"."assign_decide_output" DROP CONSTRAINT "__assign_decide_output_key_step_jskz62lztu";

ALTER TABLE "slice"."assign_decide_input" DROP CONSTRAINT "__assign_decide_input_key_step_sjxw7625ad";

ALTER TABLE "slice"."assign_decide_input" DROP CONSTRAINT "__assign_decide_input_key_step_2jprqspwz2";

ALTER TABLE "slice"."assign_assignment_input" DROP CONSTRAINT "__assign_assignment_input_key_scope_xkzvuysyji";

ALTER TABLE "slice"."assign_assignment_input" DROP CONSTRAINT "__assign_assignment_input_key_scope_ww7cpygqna";

CREATE ROLE :"slice_seats__assign_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__chain_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__fan_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__retry_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__sync_retirer" NOLOGIN;

CREATE SCHEMA "slice_seats__assign_retirer";

CREATE SCHEMA "slice_seats__chain_retirer";

CREATE SCHEMA "slice_seats__fan_retirer";

CREATE SCHEMA "slice_seats__retry_retirer";

CREATE SCHEMA "slice_seats__sync_retirer";

CREATE VIEW "slice_seats__assign_retirer"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input" ("scope", "learner", "topic", "near", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."near", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_exclude" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_claim" ("step", "attempt", "holder", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until", "r1"."root"
FROM "slice"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input" ("step", "learner", "topic", "near", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."near", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_nearest_read" ("step", "ordinal", "passage", "topic", "distance", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."topic", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_nearest_read" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_vvnbi7fwx4"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output_stage_rest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_seen_read" ("step", "ordinal", "learner", "passage", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."learner", "r1"."passage", "r1"."root"
FROM "slice"."assign_decide_seen_read" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_done" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_due" ("step", "at", "root") AS
SELECT "r1"."step", "r1"."at", "r1"."root"
FROM "slice"."assign_due" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_exhausted" ("step", "attempts", "root") AS
SELECT "r1"."step", "r1"."attempts", "r1"."root"
FROM "slice"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_held" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_result" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_retry" ("step", "attempt", "at", "spent", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent", "r1"."root"
FROM "slice"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_root" ("scope", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."assign_root" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_scope" ("scope", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_join_names_cks63qswdh"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."assign_start_scope" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_step" ("step", "kind", "kind_name", "scope", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_nlpfxx2ign"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."root"
FROM "slice"."assign_step" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_within" ("scope", "parent", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."root"
FROM "slice"."assign_within" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_claim" ("step", "attempt", "holder", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until", "r1"."root"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_done" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_due" ("step", "at", "root") AS
SELECT "r1"."step", "r1"."at", "r1"."root"
FROM "slice"."chain_due" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_exhausted" ("step", "attempts", "root") AS
SELECT "r1"."step", "r1"."attempts", "r1"."root"
FROM "slice"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_held" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_output" ("step", "seq", "items", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."root"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_weights_read" ("step", "ordinal", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_weights_read" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_retry" ("step", "attempt", "at", "spent", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent", "r1"."root"
FROM "slice"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_root" ("scope", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_scope" ("scope", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_join_names_hvq3dwjqow"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."chain_start_scope" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_step" ("step", "kind", "kind_name", "scope", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_73btyxoydp"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."root"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_within" ("scope", "parent", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."root"
FROM "slice"."chain_within" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_claim" ("step", "attempt", "holder", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until", "r1"."root"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_done" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_due" ("step", "at", "root") AS
SELECT "r1"."step", "r1"."at", "r1"."root"
FROM "slice"."fan_due" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_exhausted" ("step", "attempts", "root") AS
SELECT "r1"."step", "r1"."attempts", "r1"."root"
FROM "slice"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_fenced" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_held" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_retry" ("step", "attempt", "at", "spent", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent", "r1"."root"
FROM "slice"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_root" ("scope", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_scope" ("scope", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_join_names_gct5lzhdqo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."fan_skipped" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_step" ("step", "kind", "kind_name", "scope", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_gikh2fxf2t"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."root"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_within" ("scope", "parent", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."root"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_claim" ("step", "attempt", "holder", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until", "r1"."root"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_done" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_due" ("step", "at", "root") AS
SELECT "r1"."step", "r1"."at", "r1"."root"
FROM "slice"."retry_due" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_exhausted" ("step", "attempts", "root") AS
SELECT "r1"."step", "r1"."attempts", "r1"."root"
FROM "slice"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_failed" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_fenced" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."retry_finish" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_held" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_retry" ("step", "attempt", "at", "spent", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent", "r1"."root"
FROM "slice"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_root" ("scope", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."retry_root" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_scope" ("scope", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_join_names_st4whng7gb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."retry_start_scope" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_step" ("step", "kind", "kind_name", "scope", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_pa363dov7n"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."root"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_within" ("scope", "parent", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."root"
FROM "slice"."retry_within" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_claim" ("step", "attempt", "holder", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until", "r1"."root"
FROM "slice"."sync_claim" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_copy_input" ("step", "relation", "run", "root") AS
SELECT "r1"."step", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_copy_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_copy_output" ("step", "run", "root") AS
SELECT "r1"."step", "r1"."run", "r1"."root"
FROM "slice"."sync_copy_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_done" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_due" ("step", "at", "root") AS
SELECT "r1"."step", "r1"."at", "r1"."root"
FROM "slice"."sync_due" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_exhausted" ("step", "attempts", "root") AS
SELECT "r1"."step", "r1"."attempts", "r1"."root"
FROM "slice"."sync_exhausted" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_failed" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_fenced" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_gold_input" ("scope", "build", "root") AS
SELECT "r1"."scope", "r1"."build", "r1"."root"
FROM "slice"."sync_gold_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_held" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."sync_refusal" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_retry" ("step", "attempt", "at", "spent", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent", "r1"."root"
FROM "slice"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_root" ("scope", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."sync_root" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_scope" ("scope", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_join_names_cci5jmwoiz"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."sync_start_scope" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_step" ("step", "kind", "kind_name", "scope", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_4mra6ojpzm"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."root"
FROM "slice"."sync_step" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_within" ("scope", "parent", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."root"
FROM "slice"."sync_within" AS "r1";

GRANT :"slice_seats__assign_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" FROM :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__assign_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_admitted" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_assignment_input" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_assignment_input_exclude" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_assignment_input_mode_nearest" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_assignment_input_mode_within" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_claim" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_input" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_input_exclude" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_nearest" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_within" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_seen_read" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_done" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_due" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_exhausted" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_failed" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_fenced" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_finish" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_held" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_refusal" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_result" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_retry" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_root" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_scope" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_skipped" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_start_scope" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_start_step" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_step" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_within" FROM :"slice_seats__assign_den";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__assign_den";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() FROM :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" FROM :"slice_seats__auditor";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_decide_output_stage", "slice"."assign_kind", "slice"."assign_outcome", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__auditor";

REVOKE SELECT ON TABLE "slice_seats__auditor"."assigned", "slice_seats__auditor"."built", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."settled", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" FROM :"slice_seats__auditor";

REVOKE SELECT, INSERT ON TABLE "slice"."audit" FROM :"slice_seats__auditor";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__auditor";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() FROM :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_den" FROM :"slice_seats__chain_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."feed" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_admitted" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_chain_run_input" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_claim" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_done" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_due" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_exhausted" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_failed" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_fenced" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_finish" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_held" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_ordered_input" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_input" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_input_after" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_weights_read" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_refusal" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_result" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_retry" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_root" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_scope" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_skipped" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_start_scope" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_start_step" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_step" FROM :"slice_seats__chain_den";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_within" FROM :"slice_seats__chain_den";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__chain_den";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__feed_names_azjbqebc6i"() FROM :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__fan_den" FROM :"slice_seats__fan_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_admitted" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_batch_input" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_claim" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_done" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_due" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_exhausted" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_failed" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_fan_run_input" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_fenced" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_finish" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_held" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_refusal" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_result" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_retry" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_root" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_scope" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_skipped" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_square_input" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_start_scope" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_start_step" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_step" FROM :"slice_seats__fan_den";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_within" FROM :"slice_seats__fan_den";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__fan_den";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"() FROM :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__loader";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__loader";

REVOKE SELECT ON TABLE "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."tally", "slice_seats__loader"."weight" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_output_stage_rest" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_output_stage_serve" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_output_weighed" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_seen_read" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assigned" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."built" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_admitted" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_due" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_finish" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_next" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_ordered_input" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_input" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_input_after" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_output_next" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_page_weights_read" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_root" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_scope" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_start_scope" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_start_step" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_step" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."chain_within" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."concluded" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."copied" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."cursor" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."fan_square_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."item" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."order" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."passage" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_brittle_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_steadfast_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."seen" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."settled" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_build_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_copy_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."tally" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."weight" FROM :"slice_seats__loader";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__loader";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__retry_den" FROM :"slice_seats__retry_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_admitted" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_brittle_input" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_claim" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_done" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_due" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_exhausted" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_failed" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_fenced" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_finish" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_held" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_ladders_input" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_refusal" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_result" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_retry" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_root" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_scope" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_skipped" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_start_scope" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_start_step" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_steadfast_input" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_step" FROM :"slice_seats__retry_den";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_within" FROM :"slice_seats__retry_den";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__retry_den";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"() FROM :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__sync_den" FROM :"slice_seats__sync_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_kind", "slice"."chain_outcome", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_admitted" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_build_input" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_claim" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_copy_input" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_done" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_due" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_exclusive_key" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_exhausted" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_failed" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_fenced" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_finish" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_gold_input" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_held" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_refusal" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_result" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_retry" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_root" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_scope" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_skipped" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_start_scope" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_start_step" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_step" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_sync_run_input" FROM :"slice_seats__sync_den";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_within" FROM :"slice_seats__sync_den";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__sync_den";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() FROM :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_den";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_admitted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_claim" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_seen_read" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_done" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_due" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_exhausted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_failed" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_fenced" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_finish" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_held" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_refusal" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_result" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_retry" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_root" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_scope" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_skipped" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_start_scope" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_start_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_within" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_retirer" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_retirer";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_due", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_scope", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__assign_retirer"."assign_within" TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" TO :"slice_seats__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_decide_output_stage", "slice"."assign_kind", "slice"."assign_outcome", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() TO :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_den" TO :"slice_seats__chain_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."feed" TO :"slice_seats__chain_den";

GRANT SELECT ON TABLE "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_due", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_scope", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_den"."chain_within" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_admitted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_chain_run_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_claim" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_done" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_due" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_exhausted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_failed" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_fenced" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_weights_read" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_refusal" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_retry" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_skipped" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_scope" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_within" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__feed_names_azjbqebc6i"() TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_retirer" TO :"slice_seats__chain_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."feed" TO :"slice_seats__chain_retirer";

GRANT SELECT ON TABLE "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_due", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_weights_read", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_scope", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step", "slice_seats__chain_retirer"."chain_within" TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__feed_names_azjbqebc6i"() TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_chain_root_ji6nmac7of"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__chain_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__fan_den" TO :"slice_seats__fan_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource" TO :"slice_seats__fan_den";

GRANT SELECT ON TABLE "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_due", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_within" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_admitted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_batch_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_claim" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_done" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_due" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_exhausted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_failed" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fan_run_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fenced" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_finish" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_refusal" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_result" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_retry" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_root" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_scope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_skipped" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_start_scope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_start_step" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_step" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_within" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"() TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__fan_retirer" TO :"slice_seats__fan_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource" TO :"slice_seats__fan_retirer";

GRANT SELECT ON TABLE "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_due", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_within" TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"() TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_fan_root_niesya7vcd"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__fan_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_stage_rest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_stage_serve" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_weighed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_seen_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assigned" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."built" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_due" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_next" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output_next" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_weights_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."concluded" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."copied" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."cursor" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."item" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."order" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."passage" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_brittle_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_steadfast_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."seen" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."settled" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_build_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_copy_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."tally" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."weight" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__retry_den" TO :"slice_seats__retry_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable" TO :"slice_seats__retry_den";

GRANT SELECT ON TABLE "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_due", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_scope", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_within" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_admitted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_brittle_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_claim" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_done" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_due" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_exhausted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_failed" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_fenced" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_finish" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_held" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_ladders_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_refusal" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_result" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_retry" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_root" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_scope" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_skipped" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_start_scope" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_start_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_steadfast_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_within" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"() TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__retry_retirer" TO :"slice_seats__retry_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable" TO :"slice_seats__retry_retirer";

GRANT SELECT ON TABLE "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_due", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_scope", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_within" TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"() TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_retry_root_kays5vv5ic"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__retry_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__sync_den" TO :"slice_seats__sync_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_kind", "slice"."chain_outcome", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable" TO :"slice_seats__sync_den";

GRANT SELECT ON TABLE "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_due", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_scope", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_den"."sync_within" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_admitted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_build_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_claim" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_copy_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_done" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_due" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exclusive_key" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exhausted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_failed" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_fenced" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_finish" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_gold_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_held" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_refusal" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_result" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_retry" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_root" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_scope" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_skipped" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_start_scope" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_start_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_sync_run_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_within" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__sync_retirer" TO :"slice_seats__sync_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable" TO :"slice_seats__sync_retirer";

GRANT SELECT ON TABLE "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_due", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_scope", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_input", "slice_seats__sync_retirer"."sync_within" TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_sync_root_ygktrpeohu"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__sync_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE ALL ON SCHEMA "slice", "slice_seats", "slice_seats__auditor", "slice_seats__loader", "slice_seats__assign_coordinator", "slice_seats__assign_den", "slice_seats__assign_retirer", "slice_seats__chain_coordinator", "slice_seats__chain_den", "slice_seats__chain_retirer", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__fan_retirer", "slice_seats__retry_coordinator", "slice_seats__retry_den", "slice_seats__retry_retirer", "slice_seats__sync_coordinator", "slice_seats__sync_den", "slice_seats__sync_retirer" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."assign_admitted", "slice"."assign_assignment_input", "slice"."assign_assignment_input_exclude", "slice"."assign_assignment_input_mode_nearest", "slice"."assign_assignment_input_mode_within", "slice"."assign_claim", "slice"."assign_decide_input", "slice"."assign_decide_input_exclude", "slice"."assign_decide_input_mode_nearest", "slice"."assign_decide_input_mode_within", "slice"."assign_decide_nearest_read", "slice"."assign_decide_output", "slice"."assign_decide_output_stage_rest", "slice"."assign_decide_output_stage_serve", "slice"."assign_decide_output_weighed", "slice"."assign_decide_seen_read", "slice"."assign_done", "slice"."assign_due", "slice"."assign_exhausted", "slice"."assign_failed", "slice"."assign_fenced", "slice"."assign_finish", "slice"."assign_held", "slice"."assign_paused", "slice"."assign_refusal", "slice"."assign_result", "slice"."assign_resumed", "slice"."assign_retry", "slice"."assign_root", "slice"."assign_scope", "slice"."assign_skipped", "slice"."assign_start_scope", "slice"."assign_start_step", "slice"."assign_step", "slice"."assign_within", "slice"."assigned", "slice"."audit", "slice"."built", "slice"."chain_admitted", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_done", "slice"."chain_due", "slice"."chain_exhausted", "slice"."chain_failed", "slice"."chain_fenced", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_ordered_input", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_page_weights_read", "slice"."chain_paused", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_resumed", "slice"."chain_retry", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_skipped", "slice"."chain_start_scope", "slice"."chain_start_step", "slice"."chain_step", "slice"."chain_within", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."fan_admitted", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_done", "slice"."fan_due", "slice"."fan_exhausted", "slice"."fan_failed", "slice"."fan_fan_run_input", "slice"."fan_fenced", "slice"."fan_finish", "slice"."fan_freed", "slice"."fan_held", "slice"."fan_hold", "slice"."fan_paused", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_resumed", "slice"."fan_retry", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_skipped", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_within", "slice"."item", "slice"."order", "slice"."passage", "slice"."retry_admitted", "slice"."retry_brittle_input", "slice"."retry_brittle_output", "slice"."retry_claim", "slice"."retry_done", "slice"."retry_due", "slice"."retry_exhausted", "slice"."retry_failed", "slice"."retry_fenced", "slice"."retry_finish", "slice"."retry_held", "slice"."retry_ladders_input", "slice"."retry_paused", "slice"."retry_refusal", "slice"."retry_result", "slice"."retry_resumed", "slice"."retry_retry", "slice"."retry_root", "slice"."retry_scope", "slice"."retry_skipped", "slice"."retry_start_scope", "slice"."retry_start_step", "slice"."retry_steadfast_input", "slice"."retry_steadfast_output", "slice"."retry_step", "slice"."retry_within", "slice"."seen", "slice"."settled", "slice"."sync_admitted", "slice"."sync_build_input", "slice"."sync_build_output", "slice"."sync_claim", "slice"."sync_copy_input", "slice"."sync_copy_output", "slice"."sync_done", "slice"."sync_due", "slice"."sync_exclusive", "slice"."sync_exclusive_key", "slice"."sync_exhausted", "slice"."sync_failed", "slice"."sync_fenced", "slice"."sync_finish", "slice"."sync_gold_input", "slice"."sync_held", "slice"."sync_paused", "slice"."sync_refusal", "slice"."sync_released", "slice"."sync_result", "slice"."sync_resumed", "slice"."sync_retry", "slice"."sync_root", "slice"."sync_scope", "slice"."sync_skipped", "slice"."sync_start_scope", "slice"."sync_start_step", "slice"."sync_step", "slice"."sync_sync_run_input", "slice"."sync_within", "slice"."tally", "slice"."weight", "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight", "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within", "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_due", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_scope", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__assign_retirer"."assign_within", "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_due", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_scope", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_den"."chain_within", "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_due", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_weights_read", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_scope", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step", "slice_seats__chain_retirer"."chain_within", "slice_seats__fan_coordinator"."fan_freed", "slice_seats__fan_coordinator"."fan_hold", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_due", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_within", "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_due", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_within", "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_due", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_scope", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_within", "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_due", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_scope", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_within", "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_due", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_scope", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_den"."sync_within", "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_due", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_scope", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_input", "slice_seats__sync_retirer"."sync_within" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__param_topic_q7i3hfsnkd", "slice"."__param_learner_um3dilfdml" FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON SEQUENCES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_seats" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_seats" REVOKE ALL ON SEQUENCES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES REVOKE ALL ON FUNCTIONS FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES REVOKE ALL ON TYPES FROM PUBLIC;

DROP INDEX "slice"."__sync_within_ix_parent_xnkjm556so";

DROP INDEX "slice"."__sync_claim_ix_step_fxyms_236_d_4_pred_attempt_ltqcryx7yu";

DROP INDEX "slice"."__retry_within_ix_parent_d7nkgphtnq";

DROP INDEX "slice"."__retry_step_ix_scope_kind_gvjz7p6rcr";

DROP INDEX "slice"."__retry_claim_ix_step_fxyms_236_d_4_pred_attempt_ln4othihnf";

DROP INDEX "slice"."__fan_within_ix_parent_7swblvcobd";

DROP INDEX "slice"."__fan_step_ix_scope_kind_h2wuapaqs3";

DROP INDEX "slice"."__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_rdwu35kano";

DROP INDEX "slice"."__chain_within_ix_parent_3xemf3jvuy";

DROP INDEX "slice"."__chain_step_ix_scope_kind_spn3gys2vi";

DROP INDEX "slice"."__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_cgz4fqmrbd";

DROP INDEX "slice"."__assign_within_ix_parent_pf64og3aei";

DROP INDEX "slice"."__assign_step_ix_scope_kind_4jyx7qz4gq";

DROP INDEX "slice"."__assign_decide_output_weighed_ix_step_mjpuijzth_4_ejefxdhh4l";

DROP INDEX "slice"."__assign_decide_input_exclude_ix_step_mjpuijzth_4_ej2iltl5l2";

DROP INDEX "slice"."__assign_claim_ix_step_fxyms_236_d_4_pred_attempt_x24ydo4nq6";

DROP INDEX "slice"."__assign_assignment_input_exclude_ix_scope_u_6_ypqf_62yp6oy7kl";

ALTER TABLE "slice"."sync_claim" DROP COLUMN "__aside_pred_attempt_xnnzpydhox_l2q3nazdh7";

ALTER TABLE "slice"."sync_claim" DROP COLUMN "__aside_step_fxyms_236_d_4_6brw7qhhh6";

ALTER TABLE "slice"."retry_claim" DROP COLUMN "__aside_pred_attempt_xnnzpydhox_l2q3nazdh7";

ALTER TABLE "slice"."retry_claim" DROP COLUMN "__aside_step_fxyms_236_d_4_6brw7qhhh6";

ALTER TABLE "slice"."fan_claim" DROP COLUMN "__aside_pred_attempt_xnnzpydhox_l2q3nazdh7";

ALTER TABLE "slice"."fan_claim" DROP COLUMN "__aside_step_fxyms_236_d_4_6brw7qhhh6";

ALTER TABLE "slice"."chain_claim" DROP COLUMN "__aside_pred_attempt_xnnzpydhox_l2q3nazdh7";

ALTER TABLE "slice"."chain_claim" DROP COLUMN "__aside_step_fxyms_236_d_4_6brw7qhhh6";

ALTER TABLE "slice"."assign_decide_output_weighed" DROP COLUMN "__aside_pred_ordinal_rdz_3_ttleig_ev4tsxumx5";

ALTER TABLE "slice"."assign_decide_output_weighed" DROP COLUMN "__aside_step_mjpuijzth_4_bne3ucvv57";

ALTER TABLE "slice"."assign_decide_output" DROP COLUMN "__aside_step_7_f_435_gey_6_a_wt2davhuj2";

ALTER TABLE "slice"."assign_decide_output" DROP COLUMN "__aside_step_zqzc_7_m_2_bzh_7z67thegzt";

ALTER TABLE "slice"."assign_decide_input_exclude" DROP COLUMN "__aside_pred_ordinal_rdz_3_ttleig_ev4tsxumx5";

ALTER TABLE "slice"."assign_decide_input_exclude" DROP COLUMN "__aside_step_mjpuijzth_4_bne3ucvv57";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "__aside_step_5_ftuveszke_c5xuankces";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "__aside_step_rbt_3_e_5_bpyf_ipzmead7hm";

ALTER TABLE "slice"."assign_claim" DROP COLUMN "__aside_pred_attempt_xnnzpydhox_l2q3nazdh7";

ALTER TABLE "slice"."assign_claim" DROP COLUMN "__aside_step_fxyms_236_d_4_6brw7qhhh6";

ALTER TABLE "slice"."assign_assignment_input_exclude" DROP COLUMN "__aside_pred_ordinal_rdz_3_ttleig_ev4tsxumx5";

ALTER TABLE "slice"."assign_assignment_input_exclude" DROP COLUMN "__aside_scope_u_6_ypqf_2_r_2_z_bdlus5jxfi";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "__aside_scope_3_owcvq_3_eou_nxyk7fmtmy";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "__aside_scope_44_i_2_s_4_kbue_nyhfuakrfc";

COMMENT ON CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" ON "slice"."assign_admitted" IS 'primary key of AssignAdmitted';

COMMENT ON CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" ON "slice"."assign_assignment_input" IS 'primary key of AssignAssignmentInput';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" ON "slice"."assign_assignment_input_exclude" IS 'primary key of AssignAssignmentInputExclude';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" ON "slice"."assign_assignment_input_mode_nearest" IS 'primary key of AssignAssignmentInputModeNearest';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" ON "slice"."assign_assignment_input_mode_within" IS 'primary key of AssignAssignmentInputModeWithin';

COMMENT ON CONSTRAINT "__assign_claim_pk_gy4yhzk2me" ON "slice"."assign_claim" IS 'primary key of AssignClaim';

COMMENT ON CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" ON "slice"."assign_decide_input" IS 'primary key of AssignDecideInput';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" ON "slice"."assign_decide_input_exclude" IS 'primary key of AssignDecideInputExclude';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" ON "slice"."assign_decide_input_mode_nearest" IS 'primary key of AssignDecideInputModeNearest';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" ON "slice"."assign_decide_input_mode_within" IS 'primary key of AssignDecideInputModeWithin';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss" ON "slice"."assign_decide_nearest_read" IS 'primary key of AssignDecideNearestRead';

COMMENT ON CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" ON "slice"."assign_decide_output" IS 'primary key of AssignDecideOutput';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" ON "slice"."assign_decide_output_stage_rest" IS 'primary key of AssignDecideOutputStageRest';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" ON "slice"."assign_decide_output_stage_serve" IS 'primary key of AssignDecideOutputStageServe';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" ON "slice"."assign_decide_output_weighed" IS 'primary key of AssignDecideOutputWeighed';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7" ON "slice"."assign_decide_seen_read" IS 'primary key of AssignDecideSeenRead';

COMMENT ON CONSTRAINT "__assign_done_pk_gzil7jvxpz" ON "slice"."assign_done" IS 'primary key of AssignDone';

COMMENT ON CONSTRAINT "__assign_due_pk_mgahvzt6eh" ON "slice"."assign_due" IS 'primary key of AssignDue';

COMMENT ON CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" ON "slice"."assign_exhausted" IS 'primary key of AssignExhausted';

COMMENT ON CONSTRAINT "__assign_failed_pk_ygxslcya4o" ON "slice"."assign_failed" IS 'primary key of AssignFailed';

COMMENT ON CONSTRAINT "__assign_fenced_pk_y6jyfviepa" ON "slice"."assign_fenced" IS 'primary key of AssignFenced';

COMMENT ON CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" ON "slice"."assign_finish" IS 'primary key of AssignFinish';

COMMENT ON CONSTRAINT "__assign_finish_key_step_root_4woj5zibbd" ON "slice"."assign_finish" IS 'key AssignFinish(step, root)';

COMMENT ON CONSTRAINT "__assign_held_pk_by245z7t45" ON "slice"."assign_held" IS 'primary key of AssignHeld';

COMMENT ON CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" ON "slice"."assign_refusal" IS 'primary key of AssignRefusal';

COMMENT ON CONSTRAINT "__assign_result_pk_i2yxmpkyzr" ON "slice"."assign_result" IS 'primary key of AssignResult';

COMMENT ON CONSTRAINT "__assign_result_key_step_root_outcome_abohxidqgh" ON "slice"."assign_result" IS 'key AssignResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" ON "slice"."assign_retry" IS 'primary key of AssignRetry';

COMMENT ON CONSTRAINT "__assign_scope_pk_xytntbncid" ON "slice"."assign_scope" IS 'primary key of AssignScope';

COMMENT ON CONSTRAINT "__assign_scope_key_scope_root_kind_r44d3akhzm" ON "slice"."assign_scope" IS 'key AssignScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__assign_skipped_pk_5qhgbueof7" ON "slice"."assign_skipped" IS 'primary key of AssignSkipped';

COMMENT ON CONSTRAINT "__assign_start_scope_pk_ldqdb5b25z" ON "slice"."assign_start_scope" IS 'primary key of AssignStartScope';

COMMENT ON CONSTRAINT "__assign_start_scope_key_child_root_dlh7bpcpep" ON "slice"."assign_start_scope" IS 'key AssignStartScope(child, root)';

COMMENT ON CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" ON "slice"."assign_start_step" IS 'primary key of AssignStartStep';

COMMENT ON CONSTRAINT "__assign_start_step_key_step_root_k27j2tutjj" ON "slice"."assign_start_step" IS 'key AssignStartStep(step, root)';

COMMENT ON CONSTRAINT "__assign_step_pk_2oc4ehvfzd" ON "slice"."assign_step" IS 'primary key of AssignStep';

COMMENT ON CONSTRAINT "__assign_step_key_step_root_kind_gglnf6zhrr" ON "slice"."assign_step" IS 'key AssignStep(step, root, kind)';

COMMENT ON CONSTRAINT "__assign_within_pk_vvbm6qryed" ON "slice"."assign_within" IS 'primary key of AssignWithin';

COMMENT ON CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" ON "slice"."chain_admitted" IS 'primary key of ChainAdmitted';

COMMENT ON CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" ON "slice"."chain_chain_run_input" IS 'primary key of ChainChainRunInput';

COMMENT ON CONSTRAINT "__chain_claim_pk_nrr2rn3gui" ON "slice"."chain_claim" IS 'primary key of ChainClaim';

COMMENT ON CONSTRAINT "__chain_done_pk_tyyx2hmu3r" ON "slice"."chain_done" IS 'primary key of ChainDone';

COMMENT ON CONSTRAINT "__chain_due_pk_d5xdvmzepr" ON "slice"."chain_due" IS 'primary key of ChainDue';

COMMENT ON CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" ON "slice"."chain_exhausted" IS 'primary key of ChainExhausted';

COMMENT ON CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" ON "slice"."chain_failed" IS 'primary key of ChainFailed';

COMMENT ON CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" ON "slice"."chain_fenced" IS 'primary key of ChainFenced';

COMMENT ON CONSTRAINT "__chain_finish_pk_ebe75jmnzy" ON "slice"."chain_finish" IS 'primary key of ChainFinish';

COMMENT ON CONSTRAINT "__chain_finish_key_step_root_5aj26igjty" ON "slice"."chain_finish" IS 'key ChainFinish(step, root)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_pk_qeumlilvtk" ON "slice"."chain_next" IS 'primary key of ChainNext';

COMMENT ON CONSTRAINT "__chain_next_key_to_root_qxqaughmvp" ON "slice"."chain_next" IS 'key ChainNext(to, root)';

COMMENT ON CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" ON "slice"."chain_ordered_input" IS 'primary key of ChainOrderedInput';

COMMENT ON CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" ON "slice"."chain_page_input" IS 'primary key of ChainPageInput';

COMMENT ON CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" ON "slice"."chain_page_input_after" IS 'primary key of ChainPageInputAfter';

COMMENT ON CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" ON "slice"."chain_page_output" IS 'primary key of ChainPageOutput';

COMMENT ON CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" ON "slice"."chain_page_output_next" IS 'primary key of ChainPageOutputNext';

COMMENT ON CONSTRAINT "__chain_page_weights_read_pk_mvr5jc4gry" ON "slice"."chain_page_weights_read" IS 'primary key of ChainPageWeightsRead';

COMMENT ON CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" ON "slice"."chain_refusal" IS 'primary key of ChainRefusal';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_result_key_step_root_outcome_gzg5dgd4yf" ON "slice"."chain_result" IS 'key ChainResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__chain_retry_pk_522nodru3s" ON "slice"."chain_retry" IS 'primary key of ChainRetry';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_scope_key_scope_root_kind_f66lrzuxpl" ON "slice"."chain_scope" IS 'key ChainScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" ON "slice"."chain_skipped" IS 'primary key of ChainSkipped';

COMMENT ON CONSTRAINT "__chain_start_scope_pk_t4giphzblt" ON "slice"."chain_start_scope" IS 'primary key of ChainStartScope';

COMMENT ON CONSTRAINT "__chain_start_scope_key_child_root_qaucku2a5l" ON "slice"."chain_start_scope" IS 'key ChainStartScope(child, root)';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_step_root_sgonmabfyw" ON "slice"."chain_start_step" IS 'key ChainStartStep(step, root)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__chain_step_key_step_root_kind_5usafjldb4" ON "slice"."chain_step" IS 'key ChainStep(step, root, kind)';

COMMENT ON CONSTRAINT "__chain_within_pk_ihqzjavdib" ON "slice"."chain_within" IS 'primary key of ChainWithin';

COMMENT ON CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" ON "slice"."fan_admitted" IS 'primary key of FanAdmitted';

COMMENT ON CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" ON "slice"."fan_batch_input" IS 'primary key of FanBatchInput';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_done_pk_5u65252q52" ON "slice"."fan_done" IS 'primary key of FanDone';

COMMENT ON CONSTRAINT "__fan_due_pk_yc6ppd3zm6" ON "slice"."fan_due" IS 'primary key of FanDue';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_failed_pk_z4etp5dmax" ON "slice"."fan_failed" IS 'primary key of FanFailed';

COMMENT ON CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" ON "slice"."fan_fan_run_input" IS 'primary key of FanFanRunInput';

COMMENT ON CONSTRAINT "__fan_fenced_pk_6tkvirerez" ON "slice"."fan_fenced" IS 'primary key of FanFenced';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_step_root_xshxj2rwb2" ON "slice"."fan_finish" IS 'key FanFinish(step, root)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_result_key_step_root_outcome_pigdtsfrtf" ON "slice"."fan_result" IS 'key FanResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__fan_retry_pk_7xubce4v66" ON "slice"."fan_retry" IS 'primary key of FanRetry';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_scope_key_scope_root_kind_4tsq5wlw2m" ON "slice"."fan_scope" IS 'key FanScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__fan_skipped_pk_22erbmfzer" ON "slice"."fan_skipped" IS 'primary key of FanSkipped';

COMMENT ON CONSTRAINT "__fan_square_input_pk_uzumoizv53" ON "slice"."fan_square_input" IS 'primary key of FanSquareInput';

COMMENT ON CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" ON "slice"."fan_square_output" IS 'primary key of FanSquareOutput';

COMMENT ON CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" ON "slice"."fan_start_scope" IS 'primary key of FanStartScope';

COMMENT ON CONSTRAINT "__fan_start_scope_key_child_root_twylnvawre" ON "slice"."fan_start_scope" IS 'key FanStartScope(child, root)';

COMMENT ON CONSTRAINT "__fan_start_step_pk_7e247xk4mz" ON "slice"."fan_start_step" IS 'primary key of FanStartStep';

COMMENT ON CONSTRAINT "__fan_start_step_key_step_root_h32wwrpq3c" ON "slice"."fan_start_step" IS 'key FanStartStep(step, root)';

COMMENT ON CONSTRAINT "__fan_step_pk_2f4tcxnofk" ON "slice"."fan_step" IS 'primary key of FanStep';

COMMENT ON CONSTRAINT "__fan_step_key_step_root_kind_ybszf77kal" ON "slice"."fan_step" IS 'key FanStep(step, root, kind)';

COMMENT ON CONSTRAINT "__fan_within_pk_g5tswgjfa6" ON "slice"."fan_within" IS 'primary key of FanWithin';

COMMENT ON CONSTRAINT "__retry_admitted_pk_qyp7cminjx" ON "slice"."retry_admitted" IS 'primary key of RetryAdmitted';

COMMENT ON CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" ON "slice"."retry_brittle_input" IS 'primary key of RetryBrittleInput';

COMMENT ON CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" ON "slice"."retry_brittle_output" IS 'primary key of RetryBrittleOutput';

COMMENT ON CONSTRAINT "__retry_claim_pk_aayzt5ni6z" ON "slice"."retry_claim" IS 'primary key of RetryClaim';

COMMENT ON CONSTRAINT "__retry_done_pk_vtkpce7rkq" ON "slice"."retry_done" IS 'primary key of RetryDone';

COMMENT ON CONSTRAINT "__retry_due_pk_lerzzlnz7o" ON "slice"."retry_due" IS 'primary key of RetryDue';

COMMENT ON CONSTRAINT "__retry_exhausted_pk_v56c23krid" ON "slice"."retry_exhausted" IS 'primary key of RetryExhausted';

COMMENT ON CONSTRAINT "__retry_failed_pk_mygc4onczp" ON "slice"."retry_failed" IS 'primary key of RetryFailed';

COMMENT ON CONSTRAINT "__retry_fenced_pk_umzicmiruo" ON "slice"."retry_fenced" IS 'primary key of RetryFenced';

COMMENT ON CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" ON "slice"."retry_finish" IS 'primary key of RetryFinish';

COMMENT ON CONSTRAINT "__retry_finish_key_step_root_a7vhiwagne" ON "slice"."retry_finish" IS 'key RetryFinish(step, root)';

COMMENT ON CONSTRAINT "__retry_held_pk_nvgeylmjp2" ON "slice"."retry_held" IS 'primary key of RetryHeld';

COMMENT ON CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" ON "slice"."retry_ladders_input" IS 'primary key of RetryLaddersInput';

COMMENT ON CONSTRAINT "__retry_refusal_pk_nifndsd6pp" ON "slice"."retry_refusal" IS 'primary key of RetryRefusal';

COMMENT ON CONSTRAINT "__retry_result_pk_5fegihvmml" ON "slice"."retry_result" IS 'primary key of RetryResult';

COMMENT ON CONSTRAINT "__retry_result_key_step_root_outcome_rartod3xj4" ON "slice"."retry_result" IS 'key RetryResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__retry_retry_pk_slrwn4rt5d" ON "slice"."retry_retry" IS 'primary key of RetryRetry';

COMMENT ON CONSTRAINT "__retry_scope_pk_fgji2phvxy" ON "slice"."retry_scope" IS 'primary key of RetryScope';

COMMENT ON CONSTRAINT "__retry_scope_key_scope_root_kind_pcegt2scnb" ON "slice"."retry_scope" IS 'key RetryScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__retry_skipped_pk_au5z33ql7a" ON "slice"."retry_skipped" IS 'primary key of RetrySkipped';

COMMENT ON CONSTRAINT "__retry_start_scope_pk_wsif6notdn" ON "slice"."retry_start_scope" IS 'primary key of RetryStartScope';

COMMENT ON CONSTRAINT "__retry_start_scope_key_child_root_yq5q4xexcm" ON "slice"."retry_start_scope" IS 'key RetryStartScope(child, root)';

COMMENT ON CONSTRAINT "__retry_start_step_pk_mp77csmi26" ON "slice"."retry_start_step" IS 'primary key of RetryStartStep';

COMMENT ON CONSTRAINT "__retry_start_step_key_step_root_fudt2vk7zs" ON "slice"."retry_start_step" IS 'key RetryStartStep(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" ON "slice"."retry_steadfast_input" IS 'primary key of RetrySteadfastInput';

COMMENT ON CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" ON "slice"."retry_steadfast_output" IS 'primary key of RetrySteadfastOutput';

COMMENT ON CONSTRAINT "__retry_step_pk_opjqidwhzg" ON "slice"."retry_step" IS 'primary key of RetryStep';

COMMENT ON CONSTRAINT "__retry_step_key_step_root_kind_xonebqedgz" ON "slice"."retry_step" IS 'key RetryStep(step, root, kind)';

COMMENT ON CONSTRAINT "__retry_within_pk_t64odgwbuc" ON "slice"."retry_within" IS 'primary key of RetryWithin';

COMMENT ON CONSTRAINT "__sync_admitted_pk_ral53o3fpi" ON "slice"."sync_admitted" IS 'primary key of SyncAdmitted';

COMMENT ON CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" ON "slice"."sync_build_input" IS 'primary key of SyncBuildInput';

COMMENT ON CONSTRAINT "__sync_build_output_pk_rhnco3epch" ON "slice"."sync_build_output" IS 'primary key of SyncBuildOutput';

COMMENT ON CONSTRAINT "__sync_claim_pk_s2tqnziq4u" ON "slice"."sync_claim" IS 'primary key of SyncClaim';

COMMENT ON CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" ON "slice"."sync_copy_input" IS 'primary key of SyncCopyInput';

COMMENT ON CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" ON "slice"."sync_copy_output" IS 'primary key of SyncCopyOutput';

COMMENT ON CONSTRAINT "__sync_done_pk_nllomjb7og" ON "slice"."sync_done" IS 'primary key of SyncDone';

COMMENT ON CONSTRAINT "__sync_due_pk_hkeoswqthe" ON "slice"."sync_due" IS 'primary key of SyncDue';

COMMENT ON CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" ON "slice"."sync_exclusive_key" IS 'primary key of SyncExclusiveKey';

COMMENT ON CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" ON "slice"."sync_exhausted" IS 'primary key of SyncExhausted';

COMMENT ON CONSTRAINT "__sync_failed_pk_gqykngewxb" ON "slice"."sync_failed" IS 'primary key of SyncFailed';

COMMENT ON CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" ON "slice"."sync_fenced" IS 'primary key of SyncFenced';

COMMENT ON CONSTRAINT "__sync_finish_pk_hn7tmx25xc" ON "slice"."sync_finish" IS 'primary key of SyncFinish';

COMMENT ON CONSTRAINT "__sync_finish_key_step_root_kpt2idultt" ON "slice"."sync_finish" IS 'key SyncFinish(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" ON "slice"."sync_gold_input" IS 'primary key of SyncGoldInput';

COMMENT ON CONSTRAINT "__sync_held_pk_wsme4moka4" ON "slice"."sync_held" IS 'primary key of SyncHeld';

COMMENT ON CONSTRAINT "__sync_refusal_pk_mbmfornc5c" ON "slice"."sync_refusal" IS 'primary key of SyncRefusal';

COMMENT ON CONSTRAINT "__sync_result_pk_jmwy2p3mqf" ON "slice"."sync_result" IS 'primary key of SyncResult';

COMMENT ON CONSTRAINT "__sync_result_key_step_root_outcome_c673vsbm4i" ON "slice"."sync_result" IS 'key SyncResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__sync_retry_pk_6q52red7iw" ON "slice"."sync_retry" IS 'primary key of SyncRetry';

COMMENT ON CONSTRAINT "__sync_scope_pk_bg72sm6p4z" ON "slice"."sync_scope" IS 'primary key of SyncScope';

COMMENT ON CONSTRAINT "__sync_scope_key_scope_root_kind_hda5oz5d4v" ON "slice"."sync_scope" IS 'key SyncScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__sync_skipped_pk_yutjqacvws" ON "slice"."sync_skipped" IS 'primary key of SyncSkipped';

COMMENT ON CONSTRAINT "__sync_start_scope_pk_zsezuom4ll" ON "slice"."sync_start_scope" IS 'primary key of SyncStartScope';

COMMENT ON CONSTRAINT "__sync_start_scope_key_child_root_bqxek2fkcn" ON "slice"."sync_start_scope" IS 'key SyncStartScope(child, root)';

COMMENT ON CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" ON "slice"."sync_start_step" IS 'primary key of SyncStartStep';

COMMENT ON CONSTRAINT "__sync_start_step_key_step_root_rkceslwobo" ON "slice"."sync_start_step" IS 'key SyncStartStep(step, root)';

COMMENT ON CONSTRAINT "__sync_step_pk_wfgcxdvbwo" ON "slice"."sync_step" IS 'primary key of SyncStep';

COMMENT ON CONSTRAINT "__sync_step_key_step_root_kind_6xdmzwacqb" ON "slice"."sync_step" IS 'key SyncStep(step, root, kind)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" ON "slice"."sync_sync_run_input" IS 'primary key of SyncSyncRunInput';

COMMENT ON CONSTRAINT "__sync_within_pk_xcfutikja2" ON "slice"."sync_within" IS 'primary key of SyncWithin';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__root_h2ohpjyioe" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__root_i3j5qytpxw" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__scope_44i2s4kbue" IS 'scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__scope_3owcvq3eou" IS 'scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__root_yjobx7uyrd" IS 'root where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__scope_u6ypqf2r2z" IS 'scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__pred_ordinal_rdz3ttleig" IS 'pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_claim"."__root_47s5vbj2pp" IS 'root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."assign_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."assign_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__root_h2ohpjyioe" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__root_i3j5qytpxw" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__step_rbt3e5bpyf" IS 'step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__step_5ftuveszke" IS 'step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__root_yjobx7uyrd" IS 'root where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__pred_ordinal_rdz3ttleig" IS 'pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_output"."__root_safjiw7jol" IS 'root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}';

COMMENT ON COLUMN "slice"."assign_decide_output"."__root_dp4c6pzr4n" IS 'root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}';

COMMENT ON COLUMN "slice"."assign_decide_output"."__step_zqzc7m2bzh" IS 'step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}';

COMMENT ON COLUMN "slice"."assign_decide_output"."__step_7f435gey6a" IS 'step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__root_yjobx7uyrd" IS 'root where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__pred_ordinal_rdz3ttleig" IS 'pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."chain_claim"."__root_47s5vbj2pp" IS 'root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."fan_claim"."__root_47s5vbj2pp" IS 'root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."retry_claim"."__root_47s5vbj2pp" IS 'root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."retry_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."retry_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."retry_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."sync_claim"."__root_47s5vbj2pp" IS 'root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."sync_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."sync_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."sync_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON CONSTRAINT "__assign_assignment_input_key_scope_root_bchsw4ix2g" ON "slice"."assign_assignment_input" IS 'key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_key_scope_root_gibc2wxiel" ON "slice"."assign_assignment_input" IS 'key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_key_step_root_wkkmcf3pki" ON "slice"."assign_decide_input" IS 'key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_key_step_root_kr2gl2vduy" ON "slice"."assign_decide_input" IS 'key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_key_step_root_wxkoynzs3a" ON "slice"."assign_decide_output" IS 'key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}, root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_key_step_root_vlmv6k3h4l" ON "slice"."assign_decide_output" IS 'key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}, root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}})';

COMMENT ON CONSTRAINT "__assign_root_key_scope_77r36z7vhn" ON "slice"."assign_root" IS 'key AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_root_key_scope_prbadyie6j" ON "slice"."chain_root" IS 'key ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_root_key_scope_i3qel4nyj5" ON "slice"."fan_root" IS 'key FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_root_key_scope_yc7em5k35u" ON "slice"."retry_root" IS 'key RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_root_key_scope_lxj4sb3mcx" ON "slice"."sync_root" IS 'key SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf" ON "slice"."assign_admitted" IS 'foreign key AssignAdmitted(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd" ON "slice"."assign_admitted" IS 'foreign key AssignAdmitted(scope, root) to AssignScope(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_root_tag_kind_ige6b2tsmh" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope, root, tag AssignScope.kind = Assignment) to AssignScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}) to AssignAssignmentInputModeNearest(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}) to AssignAssignmentInputModeWithin(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope, root) to AssignAssignmentInput(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_gg2bohya6p" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, root where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}) to AssignAssignmentInputExclude(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv" ON "slice"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp" ON "slice"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(scope, root) to AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm" ON "slice"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7" ON "slice"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(scope, root) to AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_tccogfd3gj" ON "slice"."assign_claim" IS 'foreign key AssignClaim(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc" ON "slice"."assign_claim" IS 'foreign key AssignClaim(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_wmdynbkcix" ON "slice"."assign_claim" IS 'foreign key AssignClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_root_tag_kind_decide_l6m3oymdxi" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step, root, tag AssignStep.kind = Decide) to AssignStep(step, root, kind)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}) to AssignDecideInputModeNearest(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}) to AssignDecideInputModeWithin(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_7st2gu5z77" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, root where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}) to AssignDecideInputExclude(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd" ON "slice"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2" ON "slice"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(step, root) to AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j" ON "slice"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o" ON "slice"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(step, root) to AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_fk_root_bofoevlhaq" ON "slice"."assign_decide_nearest_read" IS 'foreign key AssignDecideNearestRead(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_fk_step_root_bdcjrgm56g" ON "slice"."assign_decide_nearest_read" IS 'foreign key AssignDecideNearestRead(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_7g22ekvp7m" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}, root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}) to AssignDecideOutputStageRest(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_tycn2t2kae" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}, root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}) to AssignDecideOutputStageServe(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs" ON "slice"."assign_decide_output_stage_rest" IS 'foreign key AssignDecideOutputStageRest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_fk_step_root_fnzfalcnrc" ON "slice"."assign_decide_output_stage_rest" IS 'foreign key AssignDecideOutputStageRest(step, root) to AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}, root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt" ON "slice"."assign_decide_output_stage_serve" IS 'foreign key AssignDecideOutputStageServe(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_fk_step_root_n4b5lyao3i" ON "slice"."assign_decide_output_stage_serve" IS 'foreign key AssignDecideOutputStageServe(step, root) to AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}, root where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step, root) to AssignDecideOutput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_zt6dalxe4q" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, root where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}) to AssignDecideOutputWeighed(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_fk_root_padlqqdvnt" ON "slice"."assign_decide_seen_read" IS 'foreign key AssignDecideSeenRead(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_fk_step_root_lfxhtzprjs" ON "slice"."assign_decide_seen_read" IS 'foreign key AssignDecideSeenRead(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_done_fk_root_bm6oxygwbu" ON "slice"."assign_done" IS 'foreign key AssignDone(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_done_fk_step_root_tag_outcome_done_jmgpbmloey" ON "slice"."assign_done" IS 'foreign key AssignDone(step, root, tag AssignResult.outcome = done) to AssignResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__assign_due_fk_root_wmzjy6jkdr" ON "slice"."assign_due" IS 'foreign key AssignDue(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_due_fk_step_root_xxrlwthpgp" ON "slice"."assign_due" IS 'foreign key AssignDue(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b" ON "slice"."assign_exhausted" IS 'foreign key AssignExhausted(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy" ON "slice"."assign_exhausted" IS 'foreign key AssignExhausted(step, root) to AssignFailed(step, root)';

COMMENT ON CONSTRAINT "__assign_failed_fk_root_oyplqvhznf" ON "slice"."assign_failed" IS 'foreign key AssignFailed(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_failed_fk_step_root_tag_outcome_failed_p7wvqfw4dg" ON "slice"."assign_failed" IS 'foreign key AssignFailed(step, root, tag AssignResult.outcome = failed) to AssignResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2" ON "slice"."assign_fenced" IS 'foreign key AssignFenced(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_fenced_fk_step_attempt_root_ycfgkdukim" ON "slice"."assign_fenced" IS 'foreign key AssignFenced(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_6bbfqqziln" ON "slice"."assign_finish" IS 'foreign key AssignFinish(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod" ON "slice"."assign_finish" IS 'foreign key AssignFinish(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc" ON "slice"."assign_finish" IS 'foreign key AssignFinish(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f" ON "slice"."assign_held" IS 'foreign key AssignHeld(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo" ON "slice"."assign_held" IS 'foreign key AssignHeld(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi" ON "slice"."assign_held" IS 'foreign key AssignHeld(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg" ON "slice"."assign_refusal" IS 'foreign key AssignRefusal(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4" ON "slice"."assign_refusal" IS 'foreign key AssignRefusal(step, root) to AssignFailed(step, root)';

COMMENT ON CONSTRAINT "__assign_result_fk_root_mbig2yym5s" ON "slice"."assign_result" IS 'foreign key AssignResult(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_result_fk_step_root_ie57r22uco" ON "slice"."assign_result" IS 'foreign key AssignResult(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh" ON "slice"."assign_retry" IS 'foreign key AssignRetry(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_retry_fk_step_attempt_root_ezozngsv5b" ON "slice"."assign_retry" IS 'foreign key AssignRetry(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t" ON "slice"."assign_scope" IS 'foreign key AssignScope(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_skipped_fk_by_yi4ixsfumz" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(by) to AssignRoot(scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_start_scope_fk_child_root_unb2sahoa2" ON "slice"."assign_start_scope" IS 'foreign key AssignStartScope(child, root) to AssignScope(scope, root)';

COMMENT ON CONSTRAINT "__assign_start_scope_fk_root_csyxhr5qfs" ON "slice"."assign_start_scope" IS 'foreign key AssignStartScope(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_start_scope_fk_scope_root_cgft7ovcb4" ON "slice"."assign_start_scope" IS 'foreign key AssignStartScope(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_me4zj64243" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_qky3m5h2ys" ON "slice"."assign_step" IS 'foreign key AssignStep(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua" ON "slice"."assign_step" IS 'foreign key AssignStep(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_within_fk_parent_root_r7meyh6lci" ON "slice"."assign_within" IS 'foreign key AssignWithin(parent, root) to AssignScope(scope, root)';

COMMENT ON CONSTRAINT "__assign_within_fk_root_6jsrxij73c" ON "slice"."assign_within" IS 'foreign key AssignWithin(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_within_fk_scope_root_mjox635vdp" ON "slice"."assign_within" IS 'foreign key AssignWithin(scope, root) to AssignScope(scope, root)';

COMMENT ON CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" ON "slice"."audit" IS 'foreign key Audit(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_admitted_fk_root_abvywhprzd" ON "slice"."chain_admitted" IS 'foreign key ChainAdmitted(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero" ON "slice"."chain_admitted" IS 'foreign key ChainAdmitted(scope, root) to ChainScope(scope, root)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten" ON "slice"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_scope_root_tag_kind_chain_5co3lkpgyw" ON "slice"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(scope, root, tag ChainScope.kind = ChainRun) to ChainScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_e4z56epu62" ON "slice"."chain_claim" IS 'foreign key ChainClaim(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_hf2626wosn" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_done_fk_root_p5unbx53ay" ON "slice"."chain_done" IS 'foreign key ChainDone(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_done_fk_step_root_tag_outcome_done_jdaqfgpo2u" ON "slice"."chain_done" IS 'foreign key ChainDone(step, root, tag ChainResult.outcome = done) to ChainResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__chain_due_fk_root_k5aesh6gjx" ON "slice"."chain_due" IS 'foreign key ChainDue(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_due_fk_step_root_33wex3hch5" ON "slice"."chain_due" IS 'foreign key ChainDue(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_az7it7tady" ON "slice"."chain_exhausted" IS 'foreign key ChainExhausted(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t" ON "slice"."chain_exhausted" IS 'foreign key ChainExhausted(step, root) to ChainFailed(step, root)';

COMMENT ON CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4" ON "slice"."chain_failed" IS 'foreign key ChainFailed(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_failed_fk_step_root_tag_outcome_failed_bmg2beeawf" ON "slice"."chain_failed" IS 'foreign key ChainFailed(step, root, tag ChainResult.outcome = failed) to ChainResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p" ON "slice"."chain_fenced" IS 'foreign key ChainFenced(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_fenced_fk_step_attempt_root_2h5dov2hfr" ON "slice"."chain_fenced" IS 'foreign key ChainFenced(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a" ON "slice"."chain_finish" IS 'foreign key ChainFinish(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35" ON "slice"."chain_finish" IS 'foreign key ChainFinish(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z" ON "slice"."chain_finish" IS 'foreign key ChainFinish(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_7gjoucbs6t" ON "slice"."chain_held" IS 'foreign key ChainHeld(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc" ON "slice"."chain_held" IS 'foreign key ChainHeld(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko" ON "slice"."chain_held" IS 'foreign key ChainHeld(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_next_fk_from_root_ohfyewhufb" ON "slice"."chain_next" IS 'foreign key ChainNext(from, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g" ON "slice"."chain_next" IS 'foreign key ChainNext(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs" ON "slice"."chain_next" IS 'foreign key ChainNext(to, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v" ON "slice"."chain_ordered_input" IS 'foreign key ChainOrderedInput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_scope_root_tag_kind_ordered_67li62ghxx" ON "slice"."chain_ordered_input" IS 'foreign key ChainOrderedInput(scope, root, tag ChainScope.kind = Ordered) to ChainScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai" ON "slice"."chain_page_input" IS 'foreign key ChainPageInput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_input_fk_step_root_tag_kind_page_25a3ht7nmv" ON "slice"."chain_page_input" IS 'foreign key ChainPageInput(step, root, tag ChainStep.kind = Page) to ChainStep(step, root, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4" ON "slice"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab" ON "slice"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(step, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux" ON "slice"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao" ON "slice"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(step, root) to ChainPageOutput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_weights_read_fk_root_jeksctdxbs" ON "slice"."chain_page_weights_read" IS 'foreign key ChainPageWeightsRead(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_weights_read_fk_step_root_cs5oeb2hng" ON "slice"."chain_page_weights_read" IS 'foreign key ChainPageWeightsRead(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf" ON "slice"."chain_refusal" IS 'foreign key ChainRefusal(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov" ON "slice"."chain_refusal" IS 'foreign key ChainRefusal(step, root) to ChainFailed(step, root)';

COMMENT ON CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd" ON "slice"."chain_result" IS 'foreign key ChainResult(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_result_fk_step_root_rytllwqxot" ON "slice"."chain_result" IS 'foreign key ChainResult(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso" ON "slice"."chain_retry" IS 'foreign key ChainRetry(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_retry_fk_step_attempt_root_dgakh6chs4" ON "slice"."chain_retry" IS 'foreign key ChainRetry(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_scope_fk_root_5dnilqnmua" ON "slice"."chain_scope" IS 'foreign key ChainScope(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_skipped_fk_by_zwz72yquyv" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(by) to ChainRoot(scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_child_root_3akc5v73xx" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(child, root) to ChainScope(scope, root)';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_root_kp7nzhmkrn" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_scope_root_q6ze2pghlq" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_n4wedmpzhn" ON "slice"."chain_step" IS 'foreign key ChainStep(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f" ON "slice"."chain_step" IS 'foreign key ChainStep(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_within_fk_parent_root_qcmegji4lp" ON "slice"."chain_within" IS 'foreign key ChainWithin(parent, root) to ChainScope(scope, root)';

COMMENT ON CONSTRAINT "__chain_within_fk_root_sh46agmkgi" ON "slice"."chain_within" IS 'foreign key ChainWithin(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_within_fk_scope_root_ifxt6ilqws" ON "slice"."chain_within" IS 'foreign key ChainWithin(scope, root) to ChainScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk" ON "slice"."fan_admitted" IS 'foreign key FanAdmitted(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6" ON "slice"."fan_admitted" IS 'foreign key FanAdmitted(scope, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl" ON "slice"."fan_batch_input" IS 'foreign key FanBatchInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_scope_root_tag_kind_batch_viognqxr2c" ON "slice"."fan_batch_input" IS 'foreign key FanBatchInput(scope, root, tag FanScope.kind = Batch) to FanScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7" ON "slice"."fan_claim" IS 'foreign key FanClaim(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab" ON "slice"."fan_claim" IS 'foreign key FanClaim(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_msshdcusww" ON "slice"."fan_claim" IS 'foreign key FanClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_done_fk_root_cfizuozacw" ON "slice"."fan_done" IS 'foreign key FanDone(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_done_fk_step_root_tag_outcome_done_t2ofw76cf5" ON "slice"."fan_done" IS 'foreign key FanDone(step, root, tag FanResult.outcome = done) to FanResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__fan_due_fk_root_6e42fnfds2" ON "slice"."fan_due" IS 'foreign key FanDue(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_due_fk_step_root_xposal5kpr" ON "slice"."fan_due" IS 'foreign key FanDue(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk" ON "slice"."fan_exhausted" IS 'foreign key FanExhausted(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd" ON "slice"."fan_exhausted" IS 'foreign key FanExhausted(step, root) to FanFailed(step, root)';

COMMENT ON CONSTRAINT "__fan_failed_fk_root_3gq7ifprza" ON "slice"."fan_failed" IS 'foreign key FanFailed(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_failed_fk_step_root_tag_outcome_failed_oddalhdclf" ON "slice"."fan_failed" IS 'foreign key FanFailed(step, root, tag FanResult.outcome = failed) to FanResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27" ON "slice"."fan_fan_run_input" IS 'foreign key FanFanRunInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_scope_root_tag_kind_fan_run_sri3xfs45t" ON "slice"."fan_fan_run_input" IS 'foreign key FanFanRunInput(scope, root, tag FanScope.kind = FanRun) to FanScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5" ON "slice"."fan_fenced" IS 'foreign key FanFenced(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_fenced_fk_step_attempt_root_3hdoippknh" ON "slice"."fan_fenced" IS 'foreign key FanFenced(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_evgrt3slao" ON "slice"."fan_finish" IS 'foreign key FanFinish(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy" ON "slice"."fan_finish" IS 'foreign key FanFinish(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab" ON "slice"."fan_finish" IS 'foreign key FanFinish(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_cnpqjrp534" ON "slice"."fan_held" IS 'foreign key FanHeld(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6" ON "slice"."fan_held" IS 'foreign key FanHeld(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3" ON "slice"."fan_held" IS 'foreign key FanHeld(step, root) to FanResult(step, root)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e" ON "slice"."fan_refusal" IS 'foreign key FanRefusal(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w" ON "slice"."fan_refusal" IS 'foreign key FanRefusal(step, root) to FanFailed(step, root)';

COMMENT ON CONSTRAINT "__fan_result_fk_root_m233bhejob" ON "slice"."fan_result" IS 'foreign key FanResult(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_result_fk_step_root_kkph4igmst" ON "slice"."fan_result" IS 'foreign key FanResult(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh" ON "slice"."fan_retry" IS 'foreign key FanRetry(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_retry_fk_step_attempt_root_mkghdiqon7" ON "slice"."fan_retry" IS 'foreign key FanRetry(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6" ON "slice"."fan_scope" IS 'foreign key FanScope(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_skipped_fk_by_o76cwxye2w" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(by) to FanRoot(scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja" ON "slice"."fan_square_input" IS 'foreign key FanSquareInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_square_input_fk_step_root_tag_kind_square_4xfxkafkn7" ON "slice"."fan_square_input" IS 'foreign key FanSquareInput(step, root, tag FanStep.kind = Square) to FanStep(step, root, kind)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_root_dpyr2dahw3" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_root_ibp6l2tkc5" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_root_kilcbg5jn4" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(step, root) to FanSquareInput(step, root)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_child_root_dn65r3vwqt" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(child, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_24pfkxnibn" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_scope_root_clsa2be3m7" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_4rwp7q56wg" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_start_step_fk_scope_root_vh2ut5ssmk" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_step_root_din6bp4kp3" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_step_fk_root_eueisdyp32" ON "slice"."fan_step" IS 'foreign key FanStep(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_step_fk_scope_root_dyjpxhnjhz" ON "slice"."fan_step" IS 'foreign key FanStep(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh" ON "slice"."fan_within" IS 'foreign key FanWithin(parent, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_k7476egnhf" ON "slice"."fan_within" IS 'foreign key FanWithin(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip" ON "slice"."fan_within" IS 'foreign key FanWithin(scope, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g" ON "slice"."retry_admitted" IS 'foreign key RetryAdmitted(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v" ON "slice"."retry_admitted" IS 'foreign key RetryAdmitted(scope, root) to RetryScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg" ON "slice"."retry_brittle_input" IS 'foreign key RetryBrittleInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_brittle_input_fk_step_root_tag_kind_brittle_qnzv3qlfo5" ON "slice"."retry_brittle_input" IS 'foreign key RetryBrittleInput(step, root, tag RetryStep.kind = Brittle) to RetryStep(step, root, kind)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step, root) to RetryBrittleInput(step, root)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq" ON "slice"."retry_claim" IS 'foreign key RetryClaim(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l" ON "slice"."retry_claim" IS 'foreign key RetryClaim(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_jmq6tipywk" ON "slice"."retry_claim" IS 'foreign key RetryClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_done_fk_root_eegigvha5p" ON "slice"."retry_done" IS 'foreign key RetryDone(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_done_fk_step_root_tag_outcome_done_gydqih3xgi" ON "slice"."retry_done" IS 'foreign key RetryDone(step, root, tag RetryResult.outcome = done) to RetryResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__retry_due_fk_root_mwvrowgwb3" ON "slice"."retry_due" IS 'foreign key RetryDue(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_due_fk_step_root_q3iqhwjvtk" ON "slice"."retry_due" IS 'foreign key RetryDue(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv" ON "slice"."retry_exhausted" IS 'foreign key RetryExhausted(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw" ON "slice"."retry_exhausted" IS 'foreign key RetryExhausted(step, root) to RetryFailed(step, root)';

COMMENT ON CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7" ON "slice"."retry_failed" IS 'foreign key RetryFailed(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_failed_fk_step_root_tag_outcome_failed_nodqbw6cvx" ON "slice"."retry_failed" IS 'foreign key RetryFailed(step, root, tag RetryResult.outcome = failed) to RetryResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_q2hes57bil" ON "slice"."retry_fenced" IS 'foreign key RetryFenced(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_fenced_fk_step_attempt_root_b4uk64byz5" ON "slice"."retry_fenced" IS 'foreign key RetryFenced(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_iv6szs7lco" ON "slice"."retry_finish" IS 'foreign key RetryFinish(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc" ON "slice"."retry_finish" IS 'foreign key RetryFinish(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy" ON "slice"."retry_finish" IS 'foreign key RetryFinish(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_3v46rzikqg" ON "slice"."retry_held" IS 'foreign key RetryHeld(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex" ON "slice"."retry_held" IS 'foreign key RetryHeld(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya" ON "slice"."retry_held" IS 'foreign key RetryHeld(step, root) to RetryResult(step, root)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w" ON "slice"."retry_ladders_input" IS 'foreign key RetryLaddersInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_scope_root_tag_kind_ladders_xj5lywbiap" ON "slice"."retry_ladders_input" IS 'foreign key RetryLaddersInput(scope, root, tag RetryScope.kind = Ladders) to RetryScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v" ON "slice"."retry_refusal" IS 'foreign key RetryRefusal(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib" ON "slice"."retry_refusal" IS 'foreign key RetryRefusal(step, root) to RetryFailed(step, root)';

COMMENT ON CONSTRAINT "__retry_result_fk_root_zoskj252jz" ON "slice"."retry_result" IS 'foreign key RetryResult(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq" ON "slice"."retry_result" IS 'foreign key RetryResult(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3" ON "slice"."retry_retry" IS 'foreign key RetryRetry(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_retry_fk_step_attempt_root_ldqa5lz2mu" ON "slice"."retry_retry" IS 'foreign key RetryRetry(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_scope_fk_root_veata66enh" ON "slice"."retry_scope" IS 'foreign key RetryScope(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_skipped_fk_by_iokgypc6cl" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(by) to RetryRoot(scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_start_scope_fk_child_root_qaa27gkwr7" ON "slice"."retry_start_scope" IS 'foreign key RetryStartScope(child, root) to RetryScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_start_scope_fk_root_wh7mjbpwzn" ON "slice"."retry_start_scope" IS 'foreign key RetryStartScope(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_start_scope_fk_scope_root_vxvoiw5spy" ON "slice"."retry_start_scope" IS 'foreign key RetryStartScope(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_lgh6lskept" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t" ON "slice"."retry_steadfast_input" IS 'foreign key RetrySteadfastInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_steadfast_input_fk_step_root_tag_kind_etgiqb7tal" ON "slice"."retry_steadfast_input" IS 'foreign key RetrySteadfastInput(step, root, tag RetryStep.kind = Steadfast) to RetryStep(step, root, kind)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step, root) to RetrySteadfastInput(step, root)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_zww4hkltkz" ON "slice"."retry_step" IS 'foreign key RetryStep(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq" ON "slice"."retry_step" IS 'foreign key RetryStep(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_within_fk_parent_root_ih6e44xo3t" ON "slice"."retry_within" IS 'foreign key RetryWithin(parent, root) to RetryScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_within_fk_root_zznwq6jdjx" ON "slice"."retry_within" IS 'foreign key RetryWithin(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_within_fk_scope_root_6md7lilvxc" ON "slice"."retry_within" IS 'foreign key RetryWithin(scope, root) to RetryScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_admitted_fk_root_pazobscutb" ON "slice"."sync_admitted" IS 'foreign key SyncAdmitted(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7" ON "slice"."sync_admitted" IS 'foreign key SyncAdmitted(scope, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2" ON "slice"."sync_build_input" IS 'foreign key SyncBuildInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_build_input_fk_step_root_tag_kind_build_embx45msmt" ON "slice"."sync_build_input" IS 'foreign key SyncBuildInput(step, root, tag SyncStep.kind = Build) to SyncStep(step, root, kind)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(step, root) to SyncBuildInput(step, root)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t" ON "slice"."sync_claim" IS 'foreign key SyncClaim(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc" ON "slice"."sync_claim" IS 'foreign key SyncClaim(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_rrog54g4mf" ON "slice"."sync_claim" IS 'foreign key SyncClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, root where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs" ON "slice"."sync_copy_input" IS 'foreign key SyncCopyInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_copy_input_fk_step_root_tag_kind_copy_inrne672nm" ON "slice"."sync_copy_input" IS 'foreign key SyncCopyInput(step, root, tag SyncStep.kind = Copy) to SyncStep(step, root, kind)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(step, root) to SyncCopyInput(step, root)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_done_fk_root_kbt6t66k7r" ON "slice"."sync_done" IS 'foreign key SyncDone(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_done_fk_step_root_tag_outcome_done_zk6igchbo3" ON "slice"."sync_done" IS 'foreign key SyncDone(step, root, tag SyncResult.outcome = done) to SyncResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__sync_due_fk_root_ascq4gdhcl" ON "slice"."sync_due" IS 'foreign key SyncDue(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_due_fk_step_root_kgwge6lib7" ON "slice"."sync_due" IS 'foreign key SyncDue(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7" ON "slice"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb" ON "slice"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(scope, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u" ON "slice"."sync_exhausted" IS 'foreign key SyncExhausted(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet" ON "slice"."sync_exhausted" IS 'foreign key SyncExhausted(step, root) to SyncFailed(step, root)';

COMMENT ON CONSTRAINT "__sync_failed_fk_root_utdobwjqln" ON "slice"."sync_failed" IS 'foreign key SyncFailed(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_failed_fk_step_root_tag_outcome_failed_n4oc4imnsd" ON "slice"."sync_failed" IS 'foreign key SyncFailed(step, root, tag SyncResult.outcome = failed) to SyncResult(step, root, outcome)';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c" ON "slice"."sync_fenced" IS 'foreign key SyncFenced(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_fenced_fk_step_attempt_root_5tuvabpoxw" ON "slice"."sync_fenced" IS 'foreign key SyncFenced(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt" ON "slice"."sync_finish" IS 'foreign key SyncFinish(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e" ON "slice"."sync_finish" IS 'foreign key SyncFinish(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq" ON "slice"."sync_finish" IS 'foreign key SyncFinish(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq" ON "slice"."sync_gold_input" IS 'foreign key SyncGoldInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_scope_root_tag_kind_gold_kfo5edtr3r" ON "slice"."sync_gold_input" IS 'foreign key SyncGoldInput(scope, root, tag SyncScope.kind = Gold) to SyncScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_62s5pmsoqa" ON "slice"."sync_held" IS 'foreign key SyncHeld(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy" ON "slice"."sync_held" IS 'foreign key SyncHeld(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_held_fk_step_root_waydyqivsc" ON "slice"."sync_held" IS 'foreign key SyncHeld(step, root) to SyncResult(step, root)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu" ON "slice"."sync_refusal" IS 'foreign key SyncRefusal(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3" ON "slice"."sync_refusal" IS 'foreign key SyncRefusal(step, root) to SyncFailed(step, root)';

COMMENT ON CONSTRAINT "__sync_result_fk_root_vnymla3qhz" ON "slice"."sync_result" IS 'foreign key SyncResult(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_result_fk_step_root_x2umddyh22" ON "slice"."sync_result" IS 'foreign key SyncResult(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m" ON "slice"."sync_retry" IS 'foreign key SyncRetry(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_retry_fk_step_attempt_root_7rpqzqdnqb" ON "slice"."sync_retry" IS 'foreign key SyncRetry(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_scope_fk_root_whqzszw2jj" ON "slice"."sync_scope" IS 'foreign key SyncScope(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_skipped_fk_by_zsxc5osgwh" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(by) to SyncRoot(scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_root_33hfwafoud" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_start_scope_fk_child_root_bfah526wa7" ON "slice"."sync_start_scope" IS 'foreign key SyncStartScope(child, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_start_scope_fk_root_4ys6ftxnzl" ON "slice"."sync_start_scope" IS 'foreign key SyncStartScope(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_start_scope_fk_scope_root_d2xbykpoy6" ON "slice"."sync_start_scope" IS 'foreign key SyncStartScope(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_rmc4nivt3i" ON "slice"."sync_step" IS 'foreign key SyncStep(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y" ON "slice"."sync_step" IS 'foreign key SyncStep(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz" ON "slice"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_scope_root_tag_kind_sync_nywcyhb4rh" ON "slice"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(scope, root, tag SyncScope.kind = SyncRun) to SyncScope(scope, root, kind)';

COMMENT ON CONSTRAINT "__sync_within_fk_parent_root_xuxk3jxvng" ON "slice"."sync_within" IS 'foreign key SyncWithin(parent, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_within_fk_root_wq5xadgno2" ON "slice"."sync_within" IS 'foreign key SyncWithin(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_within_fk_scope_root_zwg5s2mvrv" ON "slice"."sync_within" IS 'foreign key SyncWithin(scope, root) to SyncScope(scope, root)';

COMMENT ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jotafzuj2i"[]) IS 'hold function of the groups of AssignRoot';

COMMENT ON FUNCTION "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jotafzuj2i"[]) IS 'hold function of the groups of ChainRoot';

COMMENT ON FUNCTION "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jotafzuj2i"[]) IS 'hold function of the groups of FanRoot';

COMMENT ON FUNCTION "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jotafzuj2i"[]) IS 'hold function of the groups of RetryRoot';

COMMENT ON FUNCTION "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jotafzuj2i"[]) IS 'hold function of the groups of SyncRoot';

COMMENT ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jotafzuj2i"[]) IS 'retire function of the groups of AssignRoot';

COMMENT ON FUNCTION "slice"."__retire_chain_root_ji6nmac7of"("slice"."__domain_jotafzuj2i"[]) IS 'retire function of the groups of ChainRoot';

COMMENT ON FUNCTION "slice"."__retire_fan_root_niesya7vcd"("slice"."__domain_jotafzuj2i"[]) IS 'retire function of the groups of FanRoot';

COMMENT ON FUNCTION "slice"."__retire_retry_root_kays5vv5ic"("slice"."__domain_jotafzuj2i"[]) IS 'retire function of the groups of RetryRoot';

COMMENT ON FUNCTION "slice"."__retire_sync_root_ygktrpeohu"("slice"."__domain_jotafzuj2i"[]) IS 'retire function of the groups of SyncRoot';

COMMENT ON INDEX "slice"."__assign_admitted_ix_root_pot3vpqjrt" IS 'btree index AssignAdmitted(root)';

COMMENT ON INDEX "slice"."__assign_assignment_input_ix_root_gup4vjwekt" IS 'btree index AssignAssignmentInput(root)';

COMMENT ON INDEX "slice"."__assign_assignment_input_exclude_ix_scope_u_6_ypqf_45dew4mkec" IS 'btree index AssignAssignmentInputExclude(__scope_u6ypqf2r2z, __pred_ordinal_rdz3ttleig, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice"."__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" IS 'btree index AssignAssignmentInputExclude(root, scope)';

COMMENT ON INDEX "slice"."__assign_assignment_input_mode_nearest_ix_root_geksrwbvbt" IS 'btree index AssignAssignmentInputModeNearest(root)';

COMMENT ON INDEX "slice"."__assign_assignment_input_mode_within_ix_root_4mo3ngsp77" IS 'btree index AssignAssignmentInputModeWithin(root)';

COMMENT ON INDEX "slice"."__assign_claim_ix_step_fxyms_236_d_4_pred_attempt_gr25qcsssc" IS 'btree index AssignClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox, __root_47s5vbj2pp)';

COMMENT ON INDEX "slice"."__assign_claim_ix_root_step_xwit6s2vsb" IS 'btree index AssignClaim(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_input_ix_root_p3wqyck24p" IS 'btree index AssignDecideInput(root)';

COMMENT ON INDEX "slice"."__assign_decide_input_exclude_ix_step_mjpuijzth_4_2wmsrdnp2v" IS 'btree index AssignDecideInputExclude(__step_mjpuijzth4, __pred_ordinal_rdz3ttleig, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice"."__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" IS 'btree index AssignDecideInputExclude(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_input_mode_nearest_ix_root_cwtrrsp2t6" IS 'btree index AssignDecideInputModeNearest(root)';

COMMENT ON INDEX "slice"."__assign_decide_input_mode_within_ix_root_cv2vov6qoa" IS 'btree index AssignDecideInputModeWithin(root)';

COMMENT ON INDEX "slice"."__assign_decide_nearest_read_ix_root_step_4c4574ihrx" IS 'btree index AssignDecideNearestRead(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_output_ix_root_zj6f5mecax" IS 'btree index AssignDecideOutput(root)';

COMMENT ON INDEX "slice"."__assign_decide_output_stage_rest_ix_root_yrhjqr3wmn" IS 'btree index AssignDecideOutputStageRest(root)';

COMMENT ON INDEX "slice"."__assign_decide_output_stage_serve_ix_root_woxsq76rll" IS 'btree index AssignDecideOutputStageServe(root)';

COMMENT ON INDEX "slice"."__assign_decide_output_weighed_ix_step_mjpuijzth_4_6xa7a6vtga" IS 'btree index AssignDecideOutputWeighed(__step_mjpuijzth4, __pred_ordinal_rdz3ttleig, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice"."__assign_decide_output_weighed_ix_root_step_gncwdipl43" IS 'btree index AssignDecideOutputWeighed(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_seen_read_ix_root_step_ybtvecx7oy" IS 'btree index AssignDecideSeenRead(root, step)';

COMMENT ON INDEX "slice"."__assign_done_ix_root_5bapdliaci" IS 'btree index AssignDone(root)';

COMMENT ON INDEX "slice"."__assign_due_ix_root_sk35qnuc2b" IS 'btree index AssignDue(root)';

COMMENT ON INDEX "slice"."__assign_exhausted_ix_root_gsga5kdkq3" IS 'btree index AssignExhausted(root)';

COMMENT ON INDEX "slice"."__assign_failed_ix_root_qmypgaa57u" IS 'btree index AssignFailed(root)';

COMMENT ON INDEX "slice"."__assign_fenced_ix_root_jvlqbasn7e" IS 'btree index AssignFenced(root)';

COMMENT ON INDEX "slice"."__assign_finish_ix_root_ilehlpwnxm" IS 'btree index AssignFinish(root)';

COMMENT ON INDEX "slice"."__assign_finish_ix_scope_step_53o4eorqpr" IS 'btree index AssignFinish(scope, step)';

COMMENT ON INDEX "slice"."__assign_held_ix_root_35l4gc35rc" IS 'btree index AssignHeld(root)';

COMMENT ON INDEX "slice"."__assign_refusal_ix_root_qadi23h44a" IS 'btree index AssignRefusal(root)';

COMMENT ON INDEX "slice"."__assign_result_ix_root_6rct54h6yp" IS 'btree index AssignResult(root)';

COMMENT ON INDEX "slice"."__assign_retry_ix_root_oaojw2snch" IS 'btree index AssignRetry(root)';

COMMENT ON INDEX "slice"."__assign_scope_ix_root_v6jmsbgzsq" IS 'btree index AssignScope(root)';

COMMENT ON INDEX "slice"."__assign_skipped_ix_root_dzieud2d67" IS 'btree index AssignSkipped(root)';

COMMENT ON INDEX "slice"."__assign_start_scope_ix_root_scope_dy4riv6ey6" IS 'btree index AssignStartScope(root, scope)';

COMMENT ON INDEX "slice"."__assign_start_step_ix_root_scope_j5eqvalej3" IS 'btree index AssignStartStep(root, scope)';

COMMENT ON INDEX "slice"."__assign_step_ix_root_scope_64vujnvoiu" IS 'btree index AssignStep(root, scope)';

COMMENT ON INDEX "slice"."__assign_step_ix_scope_kind_step_xn2zxx73po" IS 'btree index AssignStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__assign_within_ix_parent_root_zoknt3xjag" IS 'btree index AssignWithin(parent, root)';

COMMENT ON INDEX "slice"."__assign_within_ix_parent_scope_rjijde5lm7" IS 'btree index AssignWithin(parent, scope)';

COMMENT ON INDEX "slice"."__assign_within_ix_root_lkh7fcbhwq" IS 'btree index AssignWithin(root)';

COMMENT ON INDEX "slice"."__chain_admitted_ix_root_3xhdqkpeqw" IS 'btree index ChainAdmitted(root)';

COMMENT ON INDEX "slice"."__chain_chain_run_input_ix_root_7abe6kcg67" IS 'btree index ChainChainRunInput(root)';

COMMENT ON INDEX "slice"."__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_dmkyo32uvz" IS 'btree index ChainClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox, __root_47s5vbj2pp)';

COMMENT ON INDEX "slice"."__chain_claim_ix_root_step_vf7fvyvhwc" IS 'btree index ChainClaim(root, step)';

COMMENT ON INDEX "slice"."__chain_done_ix_root_lpu4obg6gs" IS 'btree index ChainDone(root)';

COMMENT ON INDEX "slice"."__chain_due_ix_root_4j7ovoyxfr" IS 'btree index ChainDue(root)';

COMMENT ON INDEX "slice"."__chain_exhausted_ix_root_fjn7tzhjc7" IS 'btree index ChainExhausted(root)';

COMMENT ON INDEX "slice"."__chain_failed_ix_root_a2qzbvndwy" IS 'btree index ChainFailed(root)';

COMMENT ON INDEX "slice"."__chain_fenced_ix_root_mnawzvb34e" IS 'btree index ChainFenced(root)';

COMMENT ON INDEX "slice"."__chain_finish_ix_root_ypjcgcan7b" IS 'btree index ChainFinish(root)';

COMMENT ON INDEX "slice"."__chain_finish_ix_scope_step_om6bljb56e" IS 'btree index ChainFinish(scope, step)';

COMMENT ON INDEX "slice"."__chain_held_ix_root_havzgkxex3" IS 'btree index ChainHeld(root)';

COMMENT ON INDEX "slice"."__chain_next_ix_root_from_5hhx2qutdl" IS 'btree index ChainNext(root, from)';

COMMENT ON INDEX "slice"."__chain_ordered_input_ix_root_wmmk2yqn4t" IS 'btree index ChainOrderedInput(root)';

COMMENT ON INDEX "slice"."__chain_page_input_ix_root_pguivwmlnv" IS 'btree index ChainPageInput(root)';

COMMENT ON INDEX "slice"."__chain_page_input_after_ix_root_hmbetlosxh" IS 'btree index ChainPageInputAfter(root)';

COMMENT ON INDEX "slice"."__chain_page_output_ix_root_g3alpbog4o" IS 'btree index ChainPageOutput(root)';

COMMENT ON INDEX "slice"."__chain_page_output_next_ix_root_r662e4fglp" IS 'btree index ChainPageOutputNext(root)';

COMMENT ON INDEX "slice"."__chain_page_weights_read_ix_root_step_qkx2asxvn7" IS 'btree index ChainPageWeightsRead(root, step)';

COMMENT ON INDEX "slice"."__chain_refusal_ix_root_t2ancje4qy" IS 'btree index ChainRefusal(root)';

COMMENT ON INDEX "slice"."__chain_result_ix_root_cccvvlnnit" IS 'btree index ChainResult(root)';

COMMENT ON INDEX "slice"."__chain_retry_ix_root_nhtemmz6f2" IS 'btree index ChainRetry(root)';

COMMENT ON INDEX "slice"."__chain_scope_ix_root_idrabjw6oz" IS 'btree index ChainScope(root)';

COMMENT ON INDEX "slice"."__chain_skipped_ix_root_4knz5mxvl4" IS 'btree index ChainSkipped(root)';

COMMENT ON INDEX "slice"."__chain_start_scope_ix_root_scope_pmsejobbzx" IS 'btree index ChainStartScope(root, scope)';

COMMENT ON INDEX "slice"."__chain_start_step_ix_root_scope_76rv5icpsa" IS 'btree index ChainStartStep(root, scope)';

COMMENT ON INDEX "slice"."__chain_step_ix_root_scope_srrhrbyetn" IS 'btree index ChainStep(root, scope)';

COMMENT ON INDEX "slice"."__chain_step_ix_scope_kind_step_tsdjtgaey5" IS 'btree index ChainStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__chain_within_ix_parent_root_ou2ppyokg3" IS 'btree index ChainWithin(parent, root)';

COMMENT ON INDEX "slice"."__chain_within_ix_parent_scope_qsgaheyd4k" IS 'btree index ChainWithin(parent, scope)';

COMMENT ON INDEX "slice"."__chain_within_ix_root_2yyvyz27do" IS 'btree index ChainWithin(root)';

COMMENT ON INDEX "slice"."__fan_admitted_ix_root_cjavzjrmil" IS 'btree index FanAdmitted(root)';

COMMENT ON INDEX "slice"."__fan_batch_input_ix_root_qd4jgfp6sf" IS 'btree index FanBatchInput(root)';

COMMENT ON INDEX "slice"."__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_k77hys4jpf" IS 'btree index FanClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox, __root_47s5vbj2pp)';

COMMENT ON INDEX "slice"."__fan_claim_ix_root_step_t6nf6jsksj" IS 'btree index FanClaim(root, step)';

COMMENT ON INDEX "slice"."__fan_done_ix_root_wzyxthndzd" IS 'btree index FanDone(root)';

COMMENT ON INDEX "slice"."__fan_due_ix_root_x6ltys4whh" IS 'btree index FanDue(root)';

COMMENT ON INDEX "slice"."__fan_exhausted_ix_root_2diuxfgt5s" IS 'btree index FanExhausted(root)';

COMMENT ON INDEX "slice"."__fan_failed_ix_root_mjqlvft3l4" IS 'btree index FanFailed(root)';

COMMENT ON INDEX "slice"."__fan_fan_run_input_ix_root_25alzzoykh" IS 'btree index FanFanRunInput(root)';

COMMENT ON INDEX "slice"."__fan_fenced_ix_root_3xl5uhzvmu" IS 'btree index FanFenced(root)';

COMMENT ON INDEX "slice"."__fan_finish_ix_root_i6xnvwhwty" IS 'btree index FanFinish(root)';

COMMENT ON INDEX "slice"."__fan_finish_ix_scope_step_gv7mbzp7pp" IS 'btree index FanFinish(scope, step)';

COMMENT ON INDEX "slice"."__fan_held_ix_root_6a5cilujsl" IS 'btree index FanHeld(root)';

COMMENT ON INDEX "slice"."__fan_refusal_ix_root_s5ydavkzd3" IS 'btree index FanRefusal(root)';

COMMENT ON INDEX "slice"."__fan_result_ix_root_lp2cxandbo" IS 'btree index FanResult(root)';

COMMENT ON INDEX "slice"."__fan_retry_ix_root_sirifasnll" IS 'btree index FanRetry(root)';

COMMENT ON INDEX "slice"."__fan_scope_ix_root_a5wtvynqul" IS 'btree index FanScope(root)';

COMMENT ON INDEX "slice"."__fan_skipped_ix_root_7ktlrax2wh" IS 'btree index FanSkipped(root)';

COMMENT ON INDEX "slice"."__fan_square_input_ix_root_zbpnkjxbkt" IS 'btree index FanSquareInput(root)';

COMMENT ON INDEX "slice"."__fan_square_output_ix_root_vc5qn45ria" IS 'btree index FanSquareOutput(root)';

COMMENT ON INDEX "slice"."__fan_start_scope_ix_root_scope_t5ybmxw7ah" IS 'btree index FanStartScope(root, scope)';

COMMENT ON INDEX "slice"."__fan_start_step_ix_root_scope_vn7amkfoey" IS 'btree index FanStartStep(root, scope)';

COMMENT ON INDEX "slice"."__fan_step_ix_root_scope_aw525h7gua" IS 'btree index FanStep(root, scope)';

COMMENT ON INDEX "slice"."__fan_step_ix_scope_kind_step_5arz2gb4sb" IS 'btree index FanStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__fan_within_ix_parent_root_eiovyuswcz" IS 'btree index FanWithin(parent, root)';

COMMENT ON INDEX "slice"."__fan_within_ix_parent_scope_ic53myxv2p" IS 'btree index FanWithin(parent, scope)';

COMMENT ON INDEX "slice"."__fan_within_ix_root_clgremqn26" IS 'btree index FanWithin(root)';

COMMENT ON INDEX "slice"."__retry_admitted_ix_root_ewgjxicsia" IS 'btree index RetryAdmitted(root)';

COMMENT ON INDEX "slice"."__retry_brittle_input_ix_root_5xzuq5cejn" IS 'btree index RetryBrittleInput(root)';

COMMENT ON INDEX "slice"."__retry_brittle_output_ix_root_zbwyfvhpop" IS 'btree index RetryBrittleOutput(root)';

COMMENT ON INDEX "slice"."__retry_claim_ix_step_fxyms_236_d_4_pred_attempt_srdfpfzfhz" IS 'btree index RetryClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox, __root_47s5vbj2pp)';

COMMENT ON INDEX "slice"."__retry_claim_ix_root_step_kvsdksyi7f" IS 'btree index RetryClaim(root, step)';

COMMENT ON INDEX "slice"."__retry_done_ix_root_ze7pkgg6hl" IS 'btree index RetryDone(root)';

COMMENT ON INDEX "slice"."__retry_due_ix_root_fhrepcl5cl" IS 'btree index RetryDue(root)';

COMMENT ON INDEX "slice"."__retry_exhausted_ix_root_zequtvgrfg" IS 'btree index RetryExhausted(root)';

COMMENT ON INDEX "slice"."__retry_failed_ix_root_6jd525cfhz" IS 'btree index RetryFailed(root)';

COMMENT ON INDEX "slice"."__retry_fenced_ix_root_4x3i3cxxnz" IS 'btree index RetryFenced(root)';

COMMENT ON INDEX "slice"."__retry_finish_ix_root_sr33zcrg2m" IS 'btree index RetryFinish(root)';

COMMENT ON INDEX "slice"."__retry_finish_ix_scope_step_6tswescc6v" IS 'btree index RetryFinish(scope, step)';

COMMENT ON INDEX "slice"."__retry_held_ix_root_ytwhkhubpt" IS 'btree index RetryHeld(root)';

COMMENT ON INDEX "slice"."__retry_ladders_input_ix_root_co4bnpgzm5" IS 'btree index RetryLaddersInput(root)';

COMMENT ON INDEX "slice"."__retry_refusal_ix_root_7f4y3ykjiz" IS 'btree index RetryRefusal(root)';

COMMENT ON INDEX "slice"."__retry_result_ix_root_y3xgh3ebnm" IS 'btree index RetryResult(root)';

COMMENT ON INDEX "slice"."__retry_retry_ix_root_pkjsumgznf" IS 'btree index RetryRetry(root)';

COMMENT ON INDEX "slice"."__retry_scope_ix_root_7gpsngzwhs" IS 'btree index RetryScope(root)';

COMMENT ON INDEX "slice"."__retry_skipped_ix_root_uaslhltkgy" IS 'btree index RetrySkipped(root)';

COMMENT ON INDEX "slice"."__retry_start_scope_ix_root_scope_c6swz2xyob" IS 'btree index RetryStartScope(root, scope)';

COMMENT ON INDEX "slice"."__retry_start_step_ix_root_scope_f733eg3dwz" IS 'btree index RetryStartStep(root, scope)';

COMMENT ON INDEX "slice"."__retry_steadfast_input_ix_root_cw3fjd7jjf" IS 'btree index RetrySteadfastInput(root)';

COMMENT ON INDEX "slice"."__retry_steadfast_output_ix_root_sp7in5arxz" IS 'btree index RetrySteadfastOutput(root)';

COMMENT ON INDEX "slice"."__retry_step_ix_root_scope_ogbhay3han" IS 'btree index RetryStep(root, scope)';

COMMENT ON INDEX "slice"."__retry_step_ix_scope_kind_step_m6ufaqcqmk" IS 'btree index RetryStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__retry_within_ix_parent_root_ygagejv6gt" IS 'btree index RetryWithin(parent, root)';

COMMENT ON INDEX "slice"."__retry_within_ix_parent_scope_fssz5dsvdf" IS 'btree index RetryWithin(parent, scope)';

COMMENT ON INDEX "slice"."__retry_within_ix_root_lho5kgjqvt" IS 'btree index RetryWithin(root)';

COMMENT ON INDEX "slice"."__sync_admitted_ix_root_vormyuqk5x" IS 'btree index SyncAdmitted(root)';

COMMENT ON INDEX "slice"."__sync_build_input_ix_root_bo452cnu36" IS 'btree index SyncBuildInput(root)';

COMMENT ON INDEX "slice"."__sync_build_output_ix_root_amskeycb7k" IS 'btree index SyncBuildOutput(root)';

COMMENT ON INDEX "slice"."__sync_claim_ix_step_fxyms_236_d_4_pred_attempt_fgejxj3qxw" IS 'btree index SyncClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox, __root_47s5vbj2pp)';

COMMENT ON INDEX "slice"."__sync_claim_ix_root_step_e3c7mrrjvs" IS 'btree index SyncClaim(root, step)';

COMMENT ON INDEX "slice"."__sync_copy_input_ix_root_uxey54zae4" IS 'btree index SyncCopyInput(root)';

COMMENT ON INDEX "slice"."__sync_copy_output_ix_root_k6ia72urcq" IS 'btree index SyncCopyOutput(root)';

COMMENT ON INDEX "slice"."__sync_done_ix_root_4b7w6baznw" IS 'btree index SyncDone(root)';

COMMENT ON INDEX "slice"."__sync_due_ix_root_43jv75wrd2" IS 'btree index SyncDue(root)';

COMMENT ON INDEX "slice"."__sync_exclusive_key_ix_root_tfhjjf4qg2" IS 'btree index SyncExclusiveKey(root)';

COMMENT ON INDEX "slice"."__sync_exhausted_ix_root_yqhpt7jtz4" IS 'btree index SyncExhausted(root)';

COMMENT ON INDEX "slice"."__sync_failed_ix_root_vh4bwqsmns" IS 'btree index SyncFailed(root)';

COMMENT ON INDEX "slice"."__sync_fenced_ix_root_peedftug4f" IS 'btree index SyncFenced(root)';

COMMENT ON INDEX "slice"."__sync_finish_ix_root_zrpyhvrere" IS 'btree index SyncFinish(root)';

COMMENT ON INDEX "slice"."__sync_finish_ix_scope_step_owsw7m5w74" IS 'btree index SyncFinish(scope, step)';

COMMENT ON INDEX "slice"."__sync_gold_input_ix_root_fmnsnept43" IS 'btree index SyncGoldInput(root)';

COMMENT ON INDEX "slice"."__sync_held_ix_root_yxqvodlkmy" IS 'btree index SyncHeld(root)';

COMMENT ON INDEX "slice"."__sync_refusal_ix_root_642sem4ijz" IS 'btree index SyncRefusal(root)';

COMMENT ON INDEX "slice"."__sync_result_ix_root_jbuoavfd4m" IS 'btree index SyncResult(root)';

COMMENT ON INDEX "slice"."__sync_retry_ix_root_j5nndics7d" IS 'btree index SyncRetry(root)';

COMMENT ON INDEX "slice"."__sync_scope_ix_root_7f6s5dqo5t" IS 'btree index SyncScope(root)';

COMMENT ON INDEX "slice"."__sync_skipped_ix_root_cjefss5pid" IS 'btree index SyncSkipped(root)';

COMMENT ON INDEX "slice"."__sync_start_scope_ix_root_scope_amosehm6j2" IS 'btree index SyncStartScope(root, scope)';

COMMENT ON INDEX "slice"."__sync_start_step_ix_root_scope_5d3x6uas5c" IS 'btree index SyncStartStep(root, scope)';

COMMENT ON INDEX "slice"."__sync_step_ix_root_scope_l4sfn7gzd3" IS 'btree index SyncStep(root, scope)';

COMMENT ON INDEX "slice"."__sync_sync_run_input_ix_root_bp43cbf2uj" IS 'btree index SyncSyncRunInput(root)';

COMMENT ON INDEX "slice"."__sync_within_ix_parent_root_ukspdoqdvf" IS 'btree index SyncWithin(parent, root)';

COMMENT ON INDEX "slice"."__sync_within_ix_parent_scope_w4luz7lz7c" IS 'btree index SyncWithin(parent, scope)';

COMMENT ON INDEX "slice"."__sync_within_ix_root_mivp3mp4oa" IS 'btree index SyncWithin(root)';

COMMENT ON STATISTICS "slice"."__assign_finish_stats_scope_step_ld6jyxztu6" IS 'statistics AssignFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__chain_finish_stats_scope_step_z7lvm6j2l6" IS 'statistics ChainFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__fan_finish_stats_scope_step_4mm4p6zm66" IS 'statistics FanFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__retry_finish_stats_scope_step_2nxi4d7tdj" IS 'statistics RetryFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__sync_finish_stats_scope_step_xiaq6np7mf" IS 'statistics SyncFinish(scope, step)';
