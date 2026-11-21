CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice"."assign_admitted" ("scope", "root"), "slice"."assign_assignment_input" ("scope", "root"), "slice"."assign_assignment_input_exclude" ("scope", "ordinal", "root"), "slice"."assign_assignment_input_mode_nearest" ("scope", "root"), "slice"."assign_assignment_input_mode_within" ("scope", "root"), "slice"."assign_assignment_input_near" ("scope", "ordinal", "root"), "slice"."assign_claim" ("step", "root", "attempt"), "slice"."assign_decide_input" ("step", "root"), "slice"."assign_decide_input_exclude" ("step", "ordinal", "root"), "slice"."assign_decide_input_mode_nearest" ("step", "root"), "slice"."assign_decide_input_mode_within" ("step", "root"), "slice"."assign_decide_nearest_read" ("step", "ordinal", "root"), "slice"."assign_decide_nearest_row" ("digest", "root"), "slice"."assign_decide_output" ("step", "root"), "slice"."assign_decide_output_stage_rest" ("step", "root"), "slice"."assign_decide_output_stage_serve" ("step", "root"), "slice"."assign_decide_output_weighed" ("step", "ordinal", "root"), "slice"."assign_decide_seen_read" ("step", "ordinal", "root"), "slice"."assign_decide_seen_row" ("digest", "root"), "slice"."assign_embed_input" ("step", "root"), "slice"."assign_embed_input_exclude" ("step", "ordinal", "root"), "slice"."assign_embed_input_mode_nearest" ("step", "root"), "slice"."assign_embed_input_mode_within" ("step", "root"), "slice"."assign_embed_input_near" ("step", "ordinal", "root"), "slice"."assign_fenced" ("step", "attempt", "root"), "slice"."assign_finish" ("scope", "root"), "slice"."assign_held" ("step", "root"), "slice"."assign_paused" ("target", "turn"), "slice"."assign_result" ("step", "root"), "slice"."assign_resumed" ("target", "turn"), "slice"."assign_retry" ("step", "attempt", "root"), "slice"."assign_root" ("scope"), "slice"."assign_scope" ("scope", "root"), "slice"."assign_skipped" ("scope", "root"), "slice"."assign_step", "slice"."assigned" ("learner"), "slice"."audit" ("step"), "slice"."built" ("build"), "slice"."chain_admitted" ("scope", "root"), "slice"."chain_chain_run_input" ("scope", "root"), "slice"."chain_claim" ("step", "root", "attempt"), "slice"."chain_fenced" ("step", "attempt", "root"), "slice"."chain_finish" ("scope", "root"), "slice"."chain_held" ("step", "root"), "slice"."chain_next" ("from", "ordinal", "root"), "slice"."chain_ordered_input" ("scope", "root"), "slice"."chain_page_earlier_row" ("digest", "root"), "slice"."chain_page_input" ("step", "root"), "slice"."chain_page_input_after" ("step", "root"), "slice"."chain_page_output" ("step", "root"), "slice"."chain_page_output_next" ("step", "root"), "slice"."chain_page_tree_first" ("digest", "items", "root"), "slice"."chain_page_tree_items" ("digest", "items", "root"), "slice"."chain_page_tree_read" ("step", "ordinal", "root"), "slice"."chain_page_tree_row" ("digest", "root"), "slice"."chain_page_weights_read" ("step", "ordinal", "root"), "slice"."chain_page_weights_row" ("digest", "root"), "slice"."chain_paused" ("target", "turn"), "slice"."chain_result" ("step", "root"), "slice"."chain_resumed" ("target", "turn"), "slice"."chain_retry" ("step", "attempt", "root"), "slice"."chain_root" ("scope"), "slice"."chain_scope" ("scope", "root"), "slice"."chain_skipped" ("scope", "root"), "slice"."chain_start_step" ("scope", "ordinal", "root"), "slice"."chain_step", "slice"."chimed" ("hour", "bell"), "slice"."clock_admitted" ("scope", "root"), "slice"."clock_chime_input" ("step", "root"), "slice"."clock_claim" ("step", "root", "attempt"), "slice"."clock_close_input" ("step", "root"), "slice"."clock_fenced" ("step", "attempt", "root"), "slice"."clock_finish" ("scope", "root"), "slice"."clock_held" ("step", "root"), "slice"."clock_hourly_input" ("scope", "root"), "slice"."clock_paused" ("target", "turn"), "slice"."clock_result" ("step", "root"), "slice"."clock_resumed" ("target", "turn"), "slice"."clock_retry" ("step", "attempt", "root"), "slice"."clock_root" ("scope"), "slice"."clock_scope" ("scope", "root"), "slice"."clock_sitting_input" ("scope", "root"), "slice"."clock_skipped" ("scope", "root"), "slice"."clock_step", "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."delivered" ("attempt"), "slice"."fan_admitted" ("scope", "root"), "slice"."fan_batch_finish_output" ("step", "root"), "slice"."fan_batch_input" ("scope", "root"), "slice"."fan_claim" ("step", "root", "attempt"), "slice"."fan_dust_input" ("step", "root"), "slice"."fan_ended" ("step", "attempt", "root"), "slice"."fan_fan_run_input" ("scope", "root"), "slice"."fan_fenced" ("step", "attempt", "root"), "slice"."fan_finish" ("scope", "root"), "slice"."fan_held" ("step", "root"), "slice"."fan_hold" ("step", "root", "attempt", "at"), "slice"."fan_mop_input" ("step", "root"), "slice"."fan_paused" ("target", "turn"), "slice"."fan_result" ("step", "root"), "slice"."fan_resumed" ("target", "turn"), "slice"."fan_retry" ("step", "attempt", "root"), "slice"."fan_root" ("scope"), "slice"."fan_scope" ("scope", "root"), "slice"."fan_skipped" ("scope", "root"), "slice"."fan_square_input" ("step", "root"), "slice"."fan_square_output" ("step", "root"), "slice"."fan_start_scope" ("scope", "ordinal", "root"), "slice"."fan_start_step" ("scope", "ordinal", "root"), "slice"."fan_step", "slice"."fan_sweep_input" ("scope", "root"), "slice"."fan_within", "slice"."heard" ("key"), "slice"."item" ("feed", "seq", "n"), "slice"."passage", "slice"."retry_admitted" ("scope", "root"), "slice"."retry_brittle_input" ("step", "root"), "slice"."retry_brittle_output" ("step", "root"), "slice"."retry_claim" ("step", "root", "attempt"), "slice"."retry_exhausted" ("step", "root"), "slice"."retry_fenced" ("step", "attempt", "root"), "slice"."retry_finish" ("scope", "root"), "slice"."retry_held" ("step", "root"), "slice"."retry_ladders_input" ("scope", "root"), "slice"."retry_patient_input" ("step", "root"), "slice"."retry_patient_output" ("step", "root"), "slice"."retry_paused" ("target", "turn"), "slice"."retry_polite_input" ("step", "root"), "slice"."retry_polite_output" ("step", "root"), "slice"."retry_result" ("step", "root"), "slice"."retry_resumed" ("target", "turn"), "slice"."retry_retry" ("step", "attempt", "root"), "slice"."retry_root" ("scope"), "slice"."retry_scope" ("scope", "root"), "slice"."retry_skipped" ("scope", "root"), "slice"."retry_steadfast_input" ("step", "root"), "slice"."retry_steadfast_output" ("step", "root"), "slice"."retry_step", "slice"."retry_throttled_input" ("scope", "root"), "slice"."retry_unhurried_input" ("scope", "root"), "slice"."review_admitted" ("scope", "root"), "slice"."review_analyze_input" ("step", "root"), "slice"."review_analyze_output" ("step", "root"), "slice"."review_claim" ("step", "root", "attempt"), "slice"."review_ended" ("step", "attempt", "root"), "slice"."review_fenced" ("step", "attempt", "root"), "slice"."review_finish" ("scope", "root"), "slice"."review_gather_input" ("step", "root"), "slice"."review_gather_input_sizes" ("step", "ordinal", "root"), "slice"."review_held" ("step", "root"), "slice"."review_hold" ("step", "root", "attempt", "at"), "slice"."review_paused" ("target", "turn"), "slice"."review_questions_finish_output" ("step", "root"), "slice"."review_questions_input" ("scope", "root"), "slice"."review_result" ("step", "root"), "slice"."review_resumed" ("target", "turn"), "slice"."review_retry" ("step", "attempt", "root"), "slice"."review_review_run_input" ("scope", "root"), "slice"."review_review_run_input_sizes" ("scope", "ordinal", "root"), "slice"."review_root" ("scope"), "slice"."review_save_input" ("step", "root"), "slice"."review_save_output" ("step", "root"), "slice"."review_scope" ("scope", "root"), "slice"."review_skipped" ("scope", "root"), "slice"."review_step", "slice"."review_within", "slice"."reviewed" ("review", "group"), "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."summary" ("review"), "slice"."sync_admitted" ("scope", "root"), "slice"."sync_build_input" ("step", "root"), "slice"."sync_claim" ("step", "root", "attempt"), "slice"."sync_copy_input" ("step", "root"), "slice"."sync_exclusive" ("kind", "key", "turn"), "slice"."sync_exclusive_key" ("scope", "root"), "slice"."sync_fenced" ("step", "attempt", "root"), "slice"."sync_finish" ("scope", "root"), "slice"."sync_gold_input" ("scope", "root"), "slice"."sync_held" ("step", "root"), "slice"."sync_paused" ("target", "turn"), "slice"."sync_released" ("kind", "key", "turn"), "slice"."sync_result" ("step", "root"), "slice"."sync_resumed" ("target", "turn"), "slice"."sync_retry" ("step", "attempt", "root"), "slice"."sync_root" ("scope"), "slice"."sync_scope" ("scope", "root"), "slice"."sync_skipped" ("scope", "root"), "slice"."sync_step", "slice"."sync_sync_run_input" ("scope", "root"), "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice"."writeback_admitted" ("scope", "root"), "slice"."writeback_claim" ("step", "root", "attempt"), "slice"."writeback_deliver_input" ("step", "root"), "slice"."writeback_fenced" ("step", "attempt", "root"), "slice"."writeback_finish" ("scope", "root"), "slice"."writeback_held" ("step", "root"), "slice"."writeback_paused" ("target", "turn"), "slice"."writeback_result" ("step", "root"), "slice"."writeback_resumed" ("target", "turn"), "slice"."writeback_retry" ("step", "attempt", "root"), "slice"."writeback_root" ("scope"), "slice"."writeback_scope" ("scope", "root"), "slice"."writeback_skipped" ("scope", "root"), "slice"."writeback_step", "slice"."writeback_writeback_input" ("scope", "root"), "slice"."__ledger"
  WITH (publish_generated_columns = stored);

SELECT "r1"."c1"::"slice"."__domain_gfw43vigph" AS "value"
FROM (VALUES (2::bigint)) AS "r1"("c1");

CREATE ROLE :"slice_seats__app" LOGIN NOINHERIT;

CREATE ROLE :"slice_seats__assign_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__assign_den" NOLOGIN;

CREATE ROLE :"slice_seats__assign_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__auditor" NOLOGIN;

CREATE ROLE :"slice_seats__chain_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__chain_den" NOLOGIN;

CREATE ROLE :"slice_seats__chain_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__clock_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__clock_den" NOLOGIN;

CREATE ROLE :"slice_seats__clock_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__fan_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__fan_den" NOLOGIN;

CREATE ROLE :"slice_seats__fan_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__loader" NOLOGIN;

CREATE ROLE :"slice_seats__retry_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__retry_den" NOLOGIN;

CREATE ROLE :"slice_seats__retry_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__review_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__review_den" NOLOGIN;

CREATE ROLE :"slice_seats__review_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__sync_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__sync_den" NOLOGIN;

CREATE ROLE :"slice_seats__sync_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__worker" LOGIN NOINHERIT;

CREATE ROLE :"slice_seats__writeback_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__writeback_den" NOLOGIN;

CREATE ROLE :"slice_seats__writeback_retirer" NOLOGIN;

CREATE ROLE :"__live_wzkq6p2yii" LOGIN NOINHERIT;

CREATE SCHEMA "slice_seats__assign_coordinator";

CREATE SCHEMA "slice_seats__assign_den";

CREATE SCHEMA "slice_seats__assign_retirer";

CREATE SCHEMA "slice_seats__auditor";

CREATE SCHEMA "slice_seats__chain_coordinator";

CREATE SCHEMA "slice_seats__chain_den";

CREATE SCHEMA "slice_seats__chain_retirer";

CREATE SCHEMA "slice_seats__clock_coordinator";

CREATE SCHEMA "slice_seats__clock_den";

CREATE SCHEMA "slice_seats__clock_retirer";

CREATE SCHEMA "slice_seats__fan_coordinator";

CREATE SCHEMA "slice_seats__fan_den";

CREATE SCHEMA "slice_seats__fan_retirer";

CREATE SCHEMA "slice_seats__loader";

CREATE SCHEMA "slice_seats__retry_coordinator";

CREATE SCHEMA "slice_seats__retry_den";

CREATE SCHEMA "slice_seats__retry_retirer";

CREATE SCHEMA "slice_seats__review_coordinator";

CREATE SCHEMA "slice_seats__review_den";

CREATE SCHEMA "slice_seats__review_retirer";

CREATE SCHEMA "slice_seats__sync_coordinator";

CREATE SCHEMA "slice_seats__sync_den";

CREATE SCHEMA "slice_seats__sync_retirer";

CREATE SCHEMA "slice_seats__writeback_coordinator";

CREATE SCHEMA "slice_seats__writeback_den";

CREATE SCHEMA "slice_seats__writeback_retirer";

CREATE VIEW "slice_seats__assign_coordinator"."assign_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."assign_paused" AS "r1";

CREATE VIEW "slice_seats__assign_coordinator"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."assign_resumed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_asked" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."assign_asked" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input" ("scope", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_exclude" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_near" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_assignment_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input" ("step", "learner", "topic", "vector", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_nearest_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_nearest_read" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_nearest_row" ("digest", "passage", "topic", "distance", "root") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_nearest_row" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_stage_rest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_seen_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_seen_read" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_seen_row" ("digest", "learner", "passage", "root") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage", "r1"."root"
FROM "slice"."assign_decide_seen_row" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_done" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input" ("step", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_embed_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_near" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_embed_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_output" ("step", "vector", "root") AS
SELECT "r1"."step", "r1"."vector", "r1"."root"
FROM "slice"."assign_embed_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_ended" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_held" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."assign_paused" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_result" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."assign_resumed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."assign_root" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."assign_step" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_asked" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."assign_asked" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input" ("scope", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
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

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_near" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_assignment_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input" ("step", "learner", "topic", "vector", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
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

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_nearest_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_nearest_read" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_nearest_row" ("digest", "passage", "topic", "distance", "root") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_nearest_row" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
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

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_seen_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_seen_read" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_seen_row" ("digest", "learner", "passage", "root") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage", "r1"."root"
FROM "slice"."assign_decide_seen_row" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_done" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input" ("step", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_embed_input" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_near" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_embed_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_output" ("step", "vector", "root") AS
SELECT "r1"."step", "r1"."vector", "r1"."root"
FROM "slice"."assign_embed_output" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_ended" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
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

CREATE VIEW "slice_seats__assign_retirer"."assign_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."assign_root" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."assign_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_nearest_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_nearest_read" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_nearest_row" ("digest", "passage", "topic", "distance", "root") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_nearest_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_seen_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_seen_read" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_seen_row" ("digest", "learner", "passage", "root") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage", "r1"."root"
FROM "slice"."assign_decide_seen_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."assign_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

CREATE VIEW "slice_seats__auditor"."audit" ("step", "root", "note") AS
SELECT "r1"."step", "r1"."root", "r1"."note"
FROM "slice"."audit" AS "r1";

CREATE VIEW "slice_seats__auditor"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_earlier_row" ("digest", "feed", "feed_name", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_earlier_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_tree_first" ("digest", "items", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_tree_items" ("digest", "items", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_items" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_tree_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_tree_read" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_tree_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_tree_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_weights_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_weights_read" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_weights_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_weights_row_feed_names_awtorq4cfe"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_weights_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."chimed" ("hour", "bell", "bell_name") AS
SELECT "r1"."hour", "r1"."bell", ("slice"."__bell_names_aiqi4uostx"())["r1"."bell" + 1]::"pg_catalog"."text"
FROM "slice"."chimed" AS "r1";

CREATE VIEW "slice_seats__auditor"."concluded" ("learner", "served", "weighed") AS
SELECT "r1"."learner", "r1"."served", "r1"."weighed"
FROM "slice"."concluded" AS "r1";

CREATE VIEW "slice_seats__auditor"."copied" ("relation", "run") AS
SELECT "r1"."relation", "r1"."run"
FROM "slice"."copied" AS "r1";

CREATE VIEW "slice_seats__auditor"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice_seats__auditor"."heard" ("key", "answered") AS
SELECT "r1"."key", "r1"."answered"
FROM "slice"."heard" AS "r1";

CREATE VIEW "slice_seats__auditor"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "slice_seats__auditor"."order" ("order", "feed", "feed_name") AS
SELECT "r1"."order", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text"
FROM "slice"."order" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."review_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."review_hold" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."review_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_within" AS "r1";

CREATE VIEW "slice_seats__auditor"."reviewed" ("review", "group", "count", "total") AS
SELECT "r1"."review", "r1"."group", "r1"."count", "r1"."total"
FROM "slice"."reviewed" AS "r1";

CREATE VIEW "slice_seats__auditor"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "slice_seats__auditor"."summary" ("review", "groups", "total") AS
SELECT "r1"."review", "r1"."groups", "r1"."total"
FROM "slice"."summary" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__auditor"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice_seats__auditor"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "slice_seats__chain_coordinator"."chain_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."chain_paused" AS "r1";

CREATE VIEW "slice_seats__chain_coordinator"."chain_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."chain_resumed" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_done" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_held" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_earlier_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_earlier_read" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_earlier_row" ("digest", "feed", "feed_name", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_earlier_row" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_tree_first" ("digest", "items", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_tree_items" ("digest", "items", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_items" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_tree_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_tree_read" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_tree_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_tree_row" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_weights_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_weights_read" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_weights_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_weights_row_feed_names_awtorq4cfe"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_weights_row" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."chain_paused" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."chain_resumed" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_done" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
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

CREATE VIEW "slice_seats__chain_retirer"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_earlier_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_earlier_read" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_earlier_row" ("digest", "feed", "feed_name", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_earlier_row" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_tree_first" ("digest", "items", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_tree_items" ("digest", "items", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_items" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_tree_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_tree_read" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_tree_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_tree_row" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_weights_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_weights_read" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_weights_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_weights_row_feed_names_awtorq4cfe"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_weights_row" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice_seats__clock_coordinator"."clock_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."clock_paused" AS "r1";

CREATE VIEW "slice_seats__clock_coordinator"."clock_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."clock_resumed" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."clock_admitted" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_chime_input" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_chime_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_chime_output" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_chime_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."clock_claim" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_close_input" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_close_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_close_output" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_close_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_done" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_ended" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_exhausted" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_failed" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_fenced" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."clock_finish" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_held" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_hourly_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_hourly_input" ("scope", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."scope", "r1"."hour", "r1"."bell", ("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_hourly_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."clock_paused" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."clock_refusal" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_result" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."clock_resumed" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_retry" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."clock_root" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."clock_scope" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_sitting_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_sitting_input" ("scope", "sitting", "deadline", "root") AS
SELECT "r1"."scope", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_sitting_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."clock_skipped" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."clock_start_step" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."clock_step" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."clock_admitted" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_chime_input" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_chime_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_chime_output" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_chime_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."clock_claim" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_close_input" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_close_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_close_output" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_close_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_done" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_ended" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_exhausted" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_failed" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_fenced" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."clock_finish" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_held" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_hourly_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_hourly_input" ("scope", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."scope", "r1"."hour", "r1"."bell", ("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_hourly_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."clock_refusal" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_result" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_retry" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."clock_root" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."clock_scope" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_sitting_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_sitting_input" ("scope", "sitting", "deadline", "root") AS
SELECT "r1"."scope", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_sitting_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."clock_skipped" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."clock_start_step" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."clock_step" AS "r1";

CREATE VIEW "slice_seats__fan_coordinator"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__fan_resource_names_tugc7yp6xo"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice"."fan_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice"."fan_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice"."fan_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__fan_coordinator"."fan_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."fan_paused" AS "r1";

CREATE VIEW "slice_seats__fan_coordinator"."fan_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."fan_resumed" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_batch_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_batch_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_done" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_dust_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_dust_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_dust_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_dust_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_ended" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_fan_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_fan_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_fenced" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_held" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__fan_resource_names_tugc7yp6xo"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice"."fan_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice"."fan_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice"."fan_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__fan_den"."fan_mop_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_mop_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_mop_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_mop_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."fan_paused" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."fan_resumed" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."fan_skipped" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_sweep_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_sweep_input" ("scope", "sweep", "root") AS
SELECT "r1"."scope", "r1"."sweep", "r1"."root"
FROM "slice"."fan_sweep_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_batch_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_batch_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_done" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_dust_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_dust_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_dust_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_dust_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_ended" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_fan_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_fan_run_finish_output" AS "r1";

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

CREATE VIEW "slice_seats__fan_retirer"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_mop_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_mop_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_mop_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_mop_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
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

CREATE VIEW "slice_seats__fan_retirer"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_sweep_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_sweep_input" ("scope", "sweep", "root") AS
SELECT "r1"."scope", "r1"."sweep", "r1"."root"
FROM "slice"."fan_sweep_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_asked" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."assign_asked" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input" ("scope", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_exclude" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_near" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_assignment_input_near" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input" ("step", "learner", "topic", "vector", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_nearest_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_nearest_read" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_nearest_row" ("digest", "passage", "topic", "distance", "root") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_nearest_row" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output_stage_rest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_seen_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."assign_decide_seen_read" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_seen_row" ("digest", "learner", "passage", "root") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage", "r1"."root"
FROM "slice"."assign_decide_seen_row" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_done" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input" ("step", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_embed_input" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_near" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."assign_embed_input_near" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_output" ("step", "vector", "root") AS
SELECT "r1"."step", "r1"."vector", "r1"."root"
FROM "slice"."assign_embed_output" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."assign_held" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_result" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."assign_root" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."assign_step" AS "r1";

CREATE VIEW "slice_seats__loader"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

CREATE VIEW "slice_seats__loader"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_done" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."chain_held" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_earlier_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_earlier_read" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_earlier_row" ("digest", "feed", "feed_name", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_earlier_row" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_tree_first" ("digest", "items", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_tree_items" ("digest", "items", "seq", "n", "root") AS
SELECT "r1"."digest", "r1"."items", "r1"."seq", "r1"."n", "r1"."root"
FROM "slice"."chain_page_tree_items" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_tree_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_tree_read" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_tree_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_tree_row" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_weights_read" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice"."chain_page_weights_read" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_weights_row" ("digest", "feed", "feed_name", "factor", "root") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__chain_page_weights_row_feed_names_awtorq4cfe"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."root"
FROM "slice"."chain_page_weights_row" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice_seats__loader"."chimed" ("hour", "bell", "bell_name") AS
SELECT "r1"."hour", "r1"."bell", ("slice"."__bell_names_aiqi4uostx"())["r1"."bell" + 1]::"pg_catalog"."text"
FROM "slice"."chimed" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."clock_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_chime_input" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_chime_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_chime_output" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_chime_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."clock_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_close_input" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_close_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_close_output" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_close_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_done" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."clock_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."clock_held" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_hourly_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_hourly_input" ("scope", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."scope", "r1"."hour", "r1"."bell", ("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_hourly_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."clock_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_result" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."clock_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."clock_root" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."clock_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_sitting_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_sitting_input" ("scope", "sitting", "deadline", "root") AS
SELECT "r1"."scope", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice"."clock_sitting_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."clock_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."clock_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."clock_step" AS "r1";

CREATE VIEW "slice_seats__loader"."concluded" ("learner", "served", "weighed") AS
SELECT "r1"."learner", "r1"."served", "r1"."weighed"
FROM "slice"."concluded" AS "r1";

CREATE VIEW "slice_seats__loader"."copied" ("relation", "run") AS
SELECT "r1"."relation", "r1"."run"
FROM "slice"."copied" AS "r1";

CREATE VIEW "slice_seats__loader"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "slice_seats__loader"."delivered" ("attempt") AS
SELECT "r1"."attempt"
FROM "slice"."delivered" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_batch_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_batch_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_done" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_dust_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_dust_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_dust_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_dust_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_fan_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_fan_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."fan_held" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_mop_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_mop_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_mop_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice"."fan_mop_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."fan_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_sweep_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_sweep_input" ("scope", "sweep", "root") AS
SELECT "r1"."scope", "r1"."sweep", "r1"."root"
FROM "slice"."fan_sweep_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice_seats__loader"."heard" ("key", "answered") AS
SELECT "r1"."key", "r1"."answered"
FROM "slice"."heard" AS "r1";

CREATE VIEW "slice_seats__loader"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "slice_seats__loader"."order" ("order", "feed", "feed_name") AS
SELECT "r1"."order", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text"
FROM "slice"."order" AS "r1";

CREATE VIEW "slice_seats__loader"."passage" ("passage", "topic", "embedding") AS
SELECT "r1"."passage", "r1"."topic", "r1"."embedding"
FROM "slice"."passage" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_done" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."retry_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_held" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_ladders_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_patient_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_patient_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_patient_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_patient_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_polite_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_polite_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_polite_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_polite_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."retry_root" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_throttled_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_throttled_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice"."retry_throttled_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_unhurried_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_unhurried_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice"."retry_unhurried_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."review_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."review_analyze_input" ("step", "review", "group", "question", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."question", "r1"."root"
FROM "slice"."review_analyze_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_analyze_output" ("step", "score", "root") AS
SELECT "r1"."step", "r1"."score", "r1"."root"
FROM "slice"."review_analyze_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."review_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."review_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_done" AS "r1";

CREATE VIEW "slice_seats__loader"."review_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."review_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."review_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."review_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."review_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."review_gather_input" ("step", "review", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."root"
FROM "slice"."review_gather_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_gather_input_sizes" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."review_gather_input_sizes" AS "r1";

CREATE VIEW "slice_seats__loader"."review_gather_output" ("step", "groups", "root") AS
SELECT "r1"."step", "r1"."groups", "r1"."root"
FROM "slice"."review_gather_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_held" AS "r1";

CREATE VIEW "slice_seats__loader"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."review_hold" AS "r1";

CREATE VIEW "slice_seats__loader"."review_questions_finish_output" ("step", "count", "total", "root") AS
SELECT "r1"."step", "r1"."count", "r1"."total", "r1"."root"
FROM "slice"."review_questions_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_questions_input" ("scope", "review", "group", "size", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."group", "r1"."size", "r1"."root"
FROM "slice"."review_questions_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."review_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_result" AS "r1";

CREATE VIEW "slice_seats__loader"."review_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."review_review_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_review_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_review_run_input" ("scope", "review", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."root"
FROM "slice"."review_review_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_review_run_input_sizes" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "slice_seats__loader"."review_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."review_root" AS "r1";

CREATE VIEW "slice_seats__loader"."review_save_input" ("step", "review", "group", "count", "total", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total", "r1"."root"
FROM "slice"."review_save_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_save_output" ("step", "total", "root") AS
SELECT "r1"."step", "r1"."total", "r1"."root"
FROM "slice"."review_save_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_saved" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."review_saved" AS "r1";

CREATE VIEW "slice_seats__loader"."review_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."review_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."review_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."review_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."review_split" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."review_split" AS "r1";

CREATE VIEW "slice_seats__loader"."review_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."review_start_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."review_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."review_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."review_step" AS "r1";

CREATE VIEW "slice_seats__loader"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_within" AS "r1";

CREATE VIEW "slice_seats__loader"."reviewed" ("review", "group", "count", "total") AS
SELECT "r1"."review", "r1"."group", "r1"."count", "r1"."total"
FROM "slice"."reviewed" AS "r1";

CREATE VIEW "slice_seats__loader"."seen" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."seen" AS "r1";

CREATE VIEW "slice_seats__loader"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "slice_seats__loader"."summary" ("review", "groups", "total") AS
SELECT "r1"."review", "r1"."groups", "r1"."total"
FROM "slice"."summary" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."sync_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_copy_input" ("step", "relation", "run", "root") AS
SELECT "r1"."step", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_copy_input" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_copy_output" ("step", "run", "root") AS
SELECT "r1"."step", "r1"."run", "r1"."root"
FROM "slice"."sync_copy_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_done" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_gold_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_gold_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_gold_input" ("scope", "build", "root") AS
SELECT "r1"."scope", "r1"."build", "r1"."root"
FROM "slice"."sync_gold_input" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_held" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."sync_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."sync_root" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."sync_step" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_sync_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice_seats__loader"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."writeback_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."writeback_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_deliver_input" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_deliver_input" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_deliver_output" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_deliver_output" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_done" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."writeback_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_held" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."writeback_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."writeback_result" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."writeback_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."writeback_root" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."writeback_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."writeback_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."writeback_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."writeback_step" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_writeback_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_writeback_input" ("scope", "attempt", "root") AS
SELECT "r1"."scope", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_writeback_input" AS "r1";

CREATE VIEW "slice_seats__retry_coordinator"."retry_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."retry_paused" AS "r1";

CREATE VIEW "slice_seats__retry_coordinator"."retry_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."retry_resumed" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_done" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_ended" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_failed" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_fenced" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."retry_finish" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_held" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_ladders_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_patient_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_patient_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_patient_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_patient_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."retry_paused" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_polite_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_polite_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_polite_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_polite_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."retry_resumed" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."retry_root" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_throttled_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_throttled_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice"."retry_throttled_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_unhurried_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_unhurried_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice"."retry_unhurried_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_done" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."retry_ended" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
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

CREATE VIEW "slice_seats__retry_retirer"."retry_ladders_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_patient_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_patient_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_patient_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_patient_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_polite_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_polite_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_polite_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_polite_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."retry_root" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_throttled_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_throttled_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice"."retry_throttled_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_unhurried_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_unhurried_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice"."retry_unhurried_input" AS "r1";

CREATE VIEW "slice_seats__review_coordinator"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__review_resource_names_ixi3gnpcnp"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice"."review_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice"."review_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice"."review_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice"."review_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__review_coordinator"."review_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."review_paused" AS "r1";

CREATE VIEW "slice_seats__review_coordinator"."review_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."review_resumed" AS "r1";

CREATE VIEW "slice_seats__review_den"."delivered" ("attempt") AS
SELECT "r1"."attempt"
FROM "slice"."delivered" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."review_admitted" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_analyze_input" ("step", "review", "group", "question", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."question", "r1"."root"
FROM "slice"."review_analyze_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_analyze_output" ("step", "score", "root") AS
SELECT "r1"."step", "r1"."score", "r1"."root"
FROM "slice"."review_analyze_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."review_claim" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_done" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_ended" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_exhausted" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_failed" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_fenced" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."review_finish" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_gather_input" ("step", "review", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."root"
FROM "slice"."review_gather_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_gather_input_sizes" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."review_gather_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_gather_output" ("step", "groups", "root") AS
SELECT "r1"."step", "r1"."groups", "r1"."root"
FROM "slice"."review_gather_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_held" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."review_hold" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__review_resource_names_ixi3gnpcnp"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice"."review_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice"."review_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice"."review_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice"."review_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__review_den"."review_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."review_paused" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_questions_finish_output" ("step", "count", "total", "root") AS
SELECT "r1"."step", "r1"."count", "r1"."total", "r1"."root"
FROM "slice"."review_questions_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_questions_input" ("scope", "review", "group", "size", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."group", "r1"."size", "r1"."root"
FROM "slice"."review_questions_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."review_refusal" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_result" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."review_resumed" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_retry" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_review_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_review_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_review_run_input" ("scope", "review", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."root"
FROM "slice"."review_review_run_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_review_run_input_sizes" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."review_root" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_save_input" ("step", "review", "group", "count", "total", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total", "r1"."root"
FROM "slice"."review_save_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_save_output" ("step", "total", "root") AS
SELECT "r1"."step", "r1"."total", "r1"."root"
FROM "slice"."review_save_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_saved" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."review_saved" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."review_scope" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."review_skipped" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_split" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."review_split" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."review_start_scope" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."review_start_step" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."review_step" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_within" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."review_admitted" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_analyze_input" ("step", "review", "group", "question", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."question", "r1"."root"
FROM "slice"."review_analyze_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_analyze_output" ("step", "score", "root") AS
SELECT "r1"."step", "r1"."score", "r1"."root"
FROM "slice"."review_analyze_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice"."review_claim" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_done" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_ended" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_exhausted" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_failed" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_fenced" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."review_finish" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_gather_input" ("step", "review", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."root"
FROM "slice"."review_gather_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_gather_input_sizes" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."review_gather_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_gather_output" ("step", "groups", "root") AS
SELECT "r1"."step", "r1"."groups", "r1"."root"
FROM "slice"."review_gather_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."review_held" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice"."review_hold" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_questions_finish_output" ("step", "count", "total", "root") AS
SELECT "r1"."step", "r1"."count", "r1"."total", "r1"."root"
FROM "slice"."review_questions_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_questions_input" ("scope", "review", "group", "size", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."group", "r1"."size", "r1"."root"
FROM "slice"."review_questions_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."review_refusal" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_result" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_retry" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_review_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."review_review_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_review_run_input" ("scope", "review", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."root"
FROM "slice"."review_review_run_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_review_run_input_sizes" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."review_root" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_save_input" ("step", "review", "group", "count", "total", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total", "r1"."root"
FROM "slice"."review_save_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_save_output" ("step", "total", "root") AS
SELECT "r1"."step", "r1"."total", "r1"."root"
FROM "slice"."review_save_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_saved" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."review_saved" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."review_scope" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."review_skipped" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_split" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice"."review_split" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice"."review_start_scope" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."review_start_step" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."review_step" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."review_within" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice"."sync_exclusive" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."sync_paused" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice"."sync_released" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."sync_resumed" AS "r1";

CREATE VIEW "slice_seats__sync_den"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice_seats__sync_den"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."sync_claim" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_copy_input" ("step", "relation", "run", "root") AS
SELECT "r1"."step", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_copy_input" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_copy_output" ("step", "run", "root") AS
SELECT "r1"."step", "r1"."run", "r1"."root"
FROM "slice"."sync_copy_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_done" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_ended" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice"."sync_exclusive" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_exhausted" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_failed" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_fenced" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_gold_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_gold_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_gold_input" ("scope", "build", "root") AS
SELECT "r1"."scope", "r1"."build", "r1"."root"
FROM "slice"."sync_gold_input" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_held" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."sync_paused" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."sync_refusal" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice"."sync_released" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."sync_resumed" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."sync_root" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."sync_step" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_sync_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
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

CREATE VIEW "slice_seats__sync_retirer"."sync_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."sync_ended" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
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

CREATE VIEW "slice_seats__sync_retirer"."sync_gold_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_gold_finish_output" AS "r1";

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

CREATE VIEW "slice_seats__sync_retirer"."sync_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."sync_root" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."sync_step" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_sync_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__writeback_coordinator"."writeback_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."writeback_paused" AS "r1";

CREATE VIEW "slice_seats__writeback_coordinator"."writeback_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."writeback_resumed" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."writeback_admitted" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."writeback_claim" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_deliver_input" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_deliver_input" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_deliver_output" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_deliver_output" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_done" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_ended" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_exhausted" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_failed" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_fenced" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."writeback_finish" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_held" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."writeback_paused" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."writeback_refusal" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."writeback_result" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."writeback_resumed" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."writeback_retry" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."writeback_root" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."writeback_scope" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."writeback_skipped" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."writeback_start_step" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."writeback_step" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_writeback_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_writeback_input" ("scope", "attempt", "root") AS
SELECT "r1"."scope", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_writeback_input" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."writeback_admitted" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice"."writeback_claim" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_deliver_input" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_deliver_input" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_deliver_output" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_deliver_output" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_done" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_ended" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_exhausted" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_failed" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_fenced" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice"."writeback_finish" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_held" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice"."writeback_refusal" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."writeback_result" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."writeback_retry" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice"."writeback_root" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."writeback_scope" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice"."writeback_skipped" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice"."writeback_start_step" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice"."writeback_step" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_writeback_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_writeback_input" ("scope", "attempt", "root") AS
SELECT "r1"."scope", "r1"."attempt", "r1"."root"
FROM "slice"."writeback_writeback_input" AS "r1";

GRANT :"slice_seats__assign_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__assign_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__assign_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__auditor" TO :"slice_seats__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__clock_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__clock_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__clock_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__loader" TO :"slice_seats__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__review_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__review_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__review_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__writeback_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__writeback_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__writeback_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"slice_seats__app";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__app";

GRANT MAINTAIN ON TABLE "slice"."chain_result" TO :"slice_seats__app";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_coordinator" TO :"slice_seats__assign_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_embed_input_mode", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."assign_retry_why", "slice"."assign_root_kind" TO :"slice_seats__assign_coordinator";

GRANT SELECT ON TABLE "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."assign_paused" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"() TO :"slice_seats__assign_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_embed_input_mode", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."assign_retry_why", "slice"."assign_root_kind" TO :"slice_seats__assign_den";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_asked", "slice_seats__assign_den"."assign_assignment_finish_output", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_assignment_input_near", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_nearest_row", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_decide_seen_row", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_embed_input", "slice_seats__assign_den"."assign_embed_input_exclude", "slice_seats__assign_den"."assign_embed_input_mode_nearest", "slice_seats__assign_den"."assign_embed_input_mode_within", "slice_seats__assign_den"."assign_embed_input_near", "slice_seats__assign_den"."assign_embed_output", "slice_seats__assign_den"."assign_ended", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_paused", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_resumed", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_admitted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_finish_output" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input_near" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_claim" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_row" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_seen_read" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_seen_row" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_done" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_near" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_ended" TO :"slice_seats__assign_den";

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

GRANT SELECT, INSERT ON TABLE "slice"."assign_start_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_step" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"() TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_retirer" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_embed_input_mode", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."assign_retry_why", "slice"."assign_root_kind" TO :"slice_seats__assign_retirer";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_asked", "slice_seats__assign_retirer"."assign_assignment_finish_output", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_assignment_input_near", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_nearest_row", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_decide_seen_row", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_embed_input", "slice_seats__assign_retirer"."assign_embed_input_exclude", "slice_seats__assign_retirer"."assign_embed_input_mode_nearest", "slice_seats__assign_retirer"."assign_embed_input_mode_within", "slice_seats__assign_retirer"."assign_embed_input_near", "slice_seats__assign_retirer"."assign_embed_output", "slice_seats__assign_retirer"."assign_ended", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step" TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"() TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" TO :"slice_seats__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."assign_decide_output_stage", "slice"."assign_kind", "slice"."assign_outcome", "slice"."bell", "slice"."chain_chain_run_input_feed", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_earlier_row_feed", "slice"."chain_page_input_feed", "slice"."chain_page_tree_row_feed", "slice"."chain_page_weights_row_feed", "slice"."chain_root_kind", "slice"."fan_child_kind", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_resource", "slice"."fan_root_kind", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."review_child_kind", "slice"."review_kind", "slice"."review_outcome", "slice"."review_resource", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_nearest_row", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_decide_seen_row", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_earlier_row", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_tree_first", "slice_seats__auditor"."chain_page_tree_items", "slice_seats__auditor"."chain_page_tree_read", "slice_seats__auditor"."chain_page_tree_row", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_page_weights_row", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chimed", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_claim", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_hold", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."heard", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."review_finish", "slice_seats__auditor"."review_hold", "slice_seats__auditor"."review_result", "slice_seats__auditor"."review_step", "slice_seats__auditor"."review_within", "slice_seats__auditor"."reviewed", "slice_seats__auditor"."settled", "slice_seats__auditor"."summary", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__bell_names_aiqi4uostx"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"(), "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_root_kind_names_nagupzc3sq"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__sync_outcome_names_xzb4y4xgki"() TO :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_coordinator" TO :"slice_seats__chain_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."chain_chain_run_input_feed", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_earlier_row_feed", "slice"."chain_page_input_feed", "slice"."chain_page_tree_row_feed", "slice"."chain_page_weights_row_feed", "slice"."chain_pausable", "slice"."chain_retry_why", "slice"."chain_root_kind" TO :"slice_seats__chain_coordinator";

GRANT SELECT ON TABLE "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."chain_paused" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."chain_resumed" TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"(), "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"() TO :"slice_seats__chain_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_den" TO :"slice_seats__chain_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_earlier_row_feed", "slice"."chain_page_input_feed", "slice"."chain_page_tree_row_feed", "slice"."chain_page_weights_row_feed", "slice"."chain_pausable", "slice"."chain_retry_why", "slice"."chain_root_kind" TO :"slice_seats__chain_den";

GRANT SELECT ON TABLE "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_finish_output", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_ended", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_finish_output", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_earlier_read", "slice_seats__chain_den"."chain_page_earlier_row", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_tree_first", "slice_seats__chain_den"."chain_page_tree_items", "slice_seats__chain_den"."chain_page_tree_read", "slice_seats__chain_den"."chain_page_tree_row", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_page_weights_row", "slice_seats__chain_den"."chain_paused", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_resumed", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_admitted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_chain_run_finish_output" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_chain_run_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_claim" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_done" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ended" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_exhausted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_failed" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_fenced" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_finish_output" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_earlier_read" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_earlier_row" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_first" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_items" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_read" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_row" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_weights_read" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_weights_row" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_refusal" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_retry" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_skipped" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"(), "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"() TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_retirer" TO :"slice_seats__chain_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_earlier_row_feed", "slice"."chain_page_input_feed", "slice"."chain_page_tree_row_feed", "slice"."chain_page_weights_row_feed", "slice"."chain_pausable", "slice"."chain_retry_why", "slice"."chain_root_kind" TO :"slice_seats__chain_retirer";

GRANT SELECT ON TABLE "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_finish_output", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_ended", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_finish_output", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_earlier_read", "slice_seats__chain_retirer"."chain_page_earlier_row", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_tree_first", "slice_seats__chain_retirer"."chain_page_tree_items", "slice_seats__chain_retirer"."chain_page_tree_read", "slice_seats__chain_retirer"."chain_page_tree_row", "slice_seats__chain_retirer"."chain_page_weights_read", "slice_seats__chain_retirer"."chain_page_weights_row", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step" TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"(), "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"() TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_chain_root_ji6nmac7of"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__chain_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__clock_coordinator" TO :"slice_seats__clock_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."clock_chime_input_bell", "slice"."clock_chime_output_bell", "slice"."clock_hourly_input_bell", "slice"."clock_kind", "slice"."clock_outcome", "slice"."clock_pausable", "slice"."clock_retry_why", "slice"."clock_root_kind" TO :"slice_seats__clock_coordinator";

GRANT SELECT ON TABLE "slice_seats__clock_coordinator"."clock_paused", "slice_seats__clock_coordinator"."clock_resumed" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."clock_paused" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."clock_resumed" TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"() TO :"slice_seats__clock_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__clock_den" TO :"slice_seats__clock_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."clock_chime_input_bell", "slice"."clock_chime_output_bell", "slice"."clock_hourly_input_bell", "slice"."clock_kind", "slice"."clock_outcome", "slice"."clock_pausable", "slice"."clock_retry_why", "slice"."clock_root_kind" TO :"slice_seats__clock_den";

GRANT SELECT ON TABLE "slice_seats__clock_den"."clock_admitted", "slice_seats__clock_den"."clock_chime_input", "slice_seats__clock_den"."clock_chime_output", "slice_seats__clock_den"."clock_claim", "slice_seats__clock_den"."clock_close_input", "slice_seats__clock_den"."clock_close_output", "slice_seats__clock_den"."clock_done", "slice_seats__clock_den"."clock_ended", "slice_seats__clock_den"."clock_exhausted", "slice_seats__clock_den"."clock_failed", "slice_seats__clock_den"."clock_fenced", "slice_seats__clock_den"."clock_finish", "slice_seats__clock_den"."clock_held", "slice_seats__clock_den"."clock_hourly_finish_output", "slice_seats__clock_den"."clock_hourly_input", "slice_seats__clock_den"."clock_paused", "slice_seats__clock_den"."clock_refusal", "slice_seats__clock_den"."clock_result", "slice_seats__clock_den"."clock_resumed", "slice_seats__clock_den"."clock_retry", "slice_seats__clock_den"."clock_root", "slice_seats__clock_den"."clock_scope", "slice_seats__clock_den"."clock_sitting_finish_output", "slice_seats__clock_den"."clock_sitting_input", "slice_seats__clock_den"."clock_skipped", "slice_seats__clock_den"."clock_start_step", "slice_seats__clock_den"."clock_step" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_admitted" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_chime_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_claim" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_close_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_done" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_ended" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_exhausted" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_failed" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_fenced" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_finish" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_held" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_hourly_finish_output" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_hourly_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_refusal" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_result" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_retry" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_root" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_scope" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_sitting_finish_output" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_sitting_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_skipped" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_start_step" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice"."clock_step" TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"() TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_clock_root_bawnkhmkww"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__clock_retirer" TO :"slice_seats__clock_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."clock_chime_input_bell", "slice"."clock_chime_output_bell", "slice"."clock_hourly_input_bell", "slice"."clock_kind", "slice"."clock_outcome", "slice"."clock_pausable", "slice"."clock_retry_why", "slice"."clock_root_kind" TO :"slice_seats__clock_retirer";

GRANT SELECT ON TABLE "slice_seats__clock_retirer"."clock_admitted", "slice_seats__clock_retirer"."clock_chime_input", "slice_seats__clock_retirer"."clock_chime_output", "slice_seats__clock_retirer"."clock_claim", "slice_seats__clock_retirer"."clock_close_input", "slice_seats__clock_retirer"."clock_close_output", "slice_seats__clock_retirer"."clock_done", "slice_seats__clock_retirer"."clock_ended", "slice_seats__clock_retirer"."clock_exhausted", "slice_seats__clock_retirer"."clock_failed", "slice_seats__clock_retirer"."clock_fenced", "slice_seats__clock_retirer"."clock_finish", "slice_seats__clock_retirer"."clock_held", "slice_seats__clock_retirer"."clock_hourly_finish_output", "slice_seats__clock_retirer"."clock_hourly_input", "slice_seats__clock_retirer"."clock_refusal", "slice_seats__clock_retirer"."clock_result", "slice_seats__clock_retirer"."clock_retry", "slice_seats__clock_retirer"."clock_root", "slice_seats__clock_retirer"."clock_scope", "slice_seats__clock_retirer"."clock_sitting_finish_output", "slice_seats__clock_retirer"."clock_sitting_input", "slice_seats__clock_retirer"."clock_skipped", "slice_seats__clock_retirer"."clock_start_step", "slice_seats__clock_retirer"."clock_step" TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"() TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_clock_root_6pfo6eeroe"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__clock_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__fan_coordinator" TO :"slice_seats__fan_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."fan_child_kind", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."fan_retry_why", "slice"."fan_root_kind" TO :"slice_seats__fan_coordinator";

GRANT SELECT ON TABLE "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."fan_paused" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."fan_resumed" TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_7t2samsp7b"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"() TO :"slice_seats__fan_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__fan_den" TO :"slice_seats__fan_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."fan_child_kind", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."fan_retry_why", "slice"."fan_root_kind" TO :"slice_seats__fan_den";

GRANT SELECT ON TABLE "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_finish_output", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_dust_input", "slice_seats__fan_den"."fan_dust_output", "slice_seats__fan_den"."fan_ended", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_finish_output", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_hold", "slice_seats__fan_den"."fan_live", "slice_seats__fan_den"."fan_mop_input", "slice_seats__fan_den"."fan_mop_output", "slice_seats__fan_den"."fan_paused", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_resumed", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_sweep_finish_output", "slice_seats__fan_den"."fan_sweep_input", "slice_seats__fan_den"."fan_within" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_admitted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_batch_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_batch_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_claim" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_done" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_dust_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_ended" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_exhausted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_failed" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fan_run_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fan_run_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fenced" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_finish" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_hold" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_mop_input" TO :"slice_seats__fan_den";

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

GRANT SELECT, INSERT ON TABLE "slice"."fan_sweep_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_sweep_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_within" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_7t2samsp7b"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"() TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__fan_retirer" TO :"slice_seats__fan_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."fan_child_kind", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."fan_retry_why", "slice"."fan_root_kind" TO :"slice_seats__fan_retirer";

GRANT SELECT ON TABLE "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_finish_output", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_dust_input", "slice_seats__fan_retirer"."fan_dust_output", "slice_seats__fan_retirer"."fan_ended", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_finish_output", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_hold", "slice_seats__fan_retirer"."fan_mop_input", "slice_seats__fan_retirer"."fan_mop_output", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_sweep_finish_output", "slice_seats__fan_retirer"."fan_sweep_input", "slice_seats__fan_retirer"."fan_within" TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_7t2samsp7b"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"() TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_fan_root_niesya7vcd"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__fan_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_embed_input_mode", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."assign_retry_why", "slice"."assign_root_kind", "slice"."bell", "slice"."chain_chain_run_input_feed", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_earlier_row_feed", "slice"."chain_page_input_feed", "slice"."chain_page_tree_row_feed", "slice"."chain_page_weights_row_feed", "slice"."chain_pausable", "slice"."chain_retry_why", "slice"."chain_root_kind", "slice"."clock_chime_input_bell", "slice"."clock_chime_output_bell", "slice"."clock_hourly_input_bell", "slice"."clock_kind", "slice"."clock_outcome", "slice"."clock_pausable", "slice"."clock_retry_why", "slice"."clock_root_kind", "slice"."fan_child_kind", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."fan_retry_why", "slice"."fan_root_kind", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."retry_retry_why", "slice"."retry_root_kind", "slice"."review_child_kind", "slice"."review_kind", "slice"."review_outcome", "slice"."review_pausable", "slice"."review_resource", "slice"."review_retry_why", "slice"."review_root_kind", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."sync_retry_why", "slice"."sync_root_kind", "slice"."writeback_kind", "slice"."writeback_outcome", "slice"."writeback_pausable", "slice"."writeback_retry_why", "slice"."writeback_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_asked", "slice_seats__loader"."assign_assignment_finish_output", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_assignment_input_near", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_nearest_row", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_decide_seen_row", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_embed_input", "slice_seats__loader"."assign_embed_input_exclude", "slice_seats__loader"."assign_embed_input_mode_nearest", "slice_seats__loader"."assign_embed_input_mode_within", "slice_seats__loader"."assign_embed_input_near", "slice_seats__loader"."assign_embed_output", "slice_seats__loader"."assign_ended", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_finish_output", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_ended", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_finish_output", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_earlier_read", "slice_seats__loader"."chain_page_earlier_row", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_tree_first", "slice_seats__loader"."chain_page_tree_items", "slice_seats__loader"."chain_page_tree_read", "slice_seats__loader"."chain_page_tree_row", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_page_weights_row", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chimed", "slice_seats__loader"."clock_admitted", "slice_seats__loader"."clock_chime_input", "slice_seats__loader"."clock_chime_output", "slice_seats__loader"."clock_claim", "slice_seats__loader"."clock_close_input", "slice_seats__loader"."clock_close_output", "slice_seats__loader"."clock_done", "slice_seats__loader"."clock_ended", "slice_seats__loader"."clock_exhausted", "slice_seats__loader"."clock_failed", "slice_seats__loader"."clock_fenced", "slice_seats__loader"."clock_finish", "slice_seats__loader"."clock_held", "slice_seats__loader"."clock_hourly_finish_output", "slice_seats__loader"."clock_hourly_input", "slice_seats__loader"."clock_refusal", "slice_seats__loader"."clock_result", "slice_seats__loader"."clock_retry", "slice_seats__loader"."clock_root", "slice_seats__loader"."clock_scope", "slice_seats__loader"."clock_sitting_finish_output", "slice_seats__loader"."clock_sitting_input", "slice_seats__loader"."clock_skipped", "slice_seats__loader"."clock_start_step", "slice_seats__loader"."clock_step", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."delivered", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_finish_output", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_dust_input", "slice_seats__loader"."fan_dust_output", "slice_seats__loader"."fan_ended", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_finish_output", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_hold", "slice_seats__loader"."fan_mop_input", "slice_seats__loader"."fan_mop_output", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_sweep_finish_output", "slice_seats__loader"."fan_sweep_input", "slice_seats__loader"."fan_within", "slice_seats__loader"."heard", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_ended", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_finish_output", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_patient_input", "slice_seats__loader"."retry_patient_output", "slice_seats__loader"."retry_polite_input", "slice_seats__loader"."retry_polite_output", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_throttled_finish_output", "slice_seats__loader"."retry_throttled_input", "slice_seats__loader"."retry_unhurried_finish_output", "slice_seats__loader"."retry_unhurried_input", "slice_seats__loader"."review_admitted", "slice_seats__loader"."review_analyze_input", "slice_seats__loader"."review_analyze_output", "slice_seats__loader"."review_claim", "slice_seats__loader"."review_done", "slice_seats__loader"."review_ended", "slice_seats__loader"."review_exhausted", "slice_seats__loader"."review_failed", "slice_seats__loader"."review_fenced", "slice_seats__loader"."review_finish", "slice_seats__loader"."review_gather_input", "slice_seats__loader"."review_gather_input_sizes", "slice_seats__loader"."review_gather_output", "slice_seats__loader"."review_held", "slice_seats__loader"."review_hold", "slice_seats__loader"."review_questions_finish_output", "slice_seats__loader"."review_questions_input", "slice_seats__loader"."review_refusal", "slice_seats__loader"."review_result", "slice_seats__loader"."review_retry", "slice_seats__loader"."review_review_run_finish_output", "slice_seats__loader"."review_review_run_input", "slice_seats__loader"."review_review_run_input_sizes", "slice_seats__loader"."review_root", "slice_seats__loader"."review_save_input", "slice_seats__loader"."review_save_output", "slice_seats__loader"."review_saved", "slice_seats__loader"."review_scope", "slice_seats__loader"."review_skipped", "slice_seats__loader"."review_split", "slice_seats__loader"."review_start_scope", "slice_seats__loader"."review_start_step", "slice_seats__loader"."review_step", "slice_seats__loader"."review_within", "slice_seats__loader"."reviewed", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."summary", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_ended", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_finish_output", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_finish_output", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__loader"."writeback_admitted", "slice_seats__loader"."writeback_claim", "slice_seats__loader"."writeback_deliver_input", "slice_seats__loader"."writeback_deliver_output", "slice_seats__loader"."writeback_done", "slice_seats__loader"."writeback_ended", "slice_seats__loader"."writeback_exhausted", "slice_seats__loader"."writeback_failed", "slice_seats__loader"."writeback_fenced", "slice_seats__loader"."writeback_finish", "slice_seats__loader"."writeback_held", "slice_seats__loader"."writeback_refusal", "slice_seats__loader"."writeback_result", "slice_seats__loader"."writeback_retry", "slice_seats__loader"."writeback_root", "slice_seats__loader"."writeback_scope", "slice_seats__loader"."writeback_skipped", "slice_seats__loader"."writeback_start_step", "slice_seats__loader"."writeback_step", "slice_seats__loader"."writeback_writeback_finish_output", "slice_seats__loader"."writeback_writeback_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_asked" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_exclude" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_nearest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input_mode_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_stage_rest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_stage_serve" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_weighed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_seen_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_seen_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_exclude" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_mode_nearest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_mode_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_input_near" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_embed_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assigned" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."built" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_chain_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_next" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_earlier_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_earlier_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output_next" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_first" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_items" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_tree_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_weights_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_weights_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chimed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_chime_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_close_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_hourly_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."clock_sitting_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."concluded" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."copied" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."cursor" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."delivered" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_batch_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_dust_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fan_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_mop_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_sweep_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."heard" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."item" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."order" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."passage" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_brittle_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_ladders_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_patient_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_polite_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_steadfast_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_throttled_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_unhurried_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_analyze_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_analyze_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_gather_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_gather_input_sizes" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_gather_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_questions_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_questions_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_review_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_save_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_save_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_saved" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_split" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_start_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."review_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."reviewed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."seen" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."settled" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."summary" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_build_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_copy_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_gold_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_sync_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."tally" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."weight" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_deliver_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_writeback_finish_output" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__bell_names_aiqi4uostx"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"(), "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_7t2samsp7b"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"() TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_clock_root_bawnkhmkww"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_review_root_j3blgclwnl"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jevqauzmw6"[]), "slice"."__hold_writeback_root_msmvpm3j7g"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__retry_coordinator" TO :"slice_seats__retry_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."retry_retry_why", "slice"."retry_root_kind" TO :"slice_seats__retry_coordinator";

GRANT SELECT ON TABLE "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."retry_paused" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."retry_resumed" TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"() TO :"slice_seats__retry_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__retry_den" TO :"slice_seats__retry_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."retry_retry_why", "slice"."retry_root_kind" TO :"slice_seats__retry_den";

GRANT SELECT ON TABLE "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_ended", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_finish_output", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_patient_input", "slice_seats__retry_den"."retry_patient_output", "slice_seats__retry_den"."retry_paused", "slice_seats__retry_den"."retry_polite_input", "slice_seats__retry_den"."retry_polite_output", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_resumed", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_throttled_finish_output", "slice_seats__retry_den"."retry_throttled_input", "slice_seats__retry_den"."retry_unhurried_finish_output", "slice_seats__retry_den"."retry_unhurried_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_admitted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_brittle_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_claim" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_done" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_ended" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_exhausted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_failed" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_fenced" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_finish" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_held" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_ladders_finish_output" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_ladders_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_patient_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_polite_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_refusal" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_result" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_retry" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_root" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_scope" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_skipped" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_start_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_steadfast_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_throttled_finish_output" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_throttled_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_unhurried_finish_output" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_unhurried_input" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"() TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__retry_retirer" TO :"slice_seats__retry_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."retry_retry_why", "slice"."retry_root_kind" TO :"slice_seats__retry_retirer";

GRANT SELECT ON TABLE "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_ended", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_finish_output", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_patient_input", "slice_seats__retry_retirer"."retry_patient_output", "slice_seats__retry_retirer"."retry_polite_input", "slice_seats__retry_retirer"."retry_polite_output", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_throttled_finish_output", "slice_seats__retry_retirer"."retry_throttled_input", "slice_seats__retry_retirer"."retry_unhurried_finish_output", "slice_seats__retry_retirer"."retry_unhurried_input" TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"() TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_retry_root_kays5vv5ic"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__retry_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__review_coordinator" TO :"slice_seats__review_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."review_child_kind", "slice"."review_kind", "slice"."review_outcome", "slice"."review_pausable", "slice"."review_resource", "slice"."review_retry_why", "slice"."review_root_kind" TO :"slice_seats__review_coordinator";

GRANT SELECT ON TABLE "slice_seats__review_coordinator"."review_live", "slice_seats__review_coordinator"."review_paused", "slice_seats__review_coordinator"."review_resumed" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."review_paused" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."review_resumed" TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"() TO :"slice_seats__review_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__review_den" TO :"slice_seats__review_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."review_child_kind", "slice"."review_kind", "slice"."review_outcome", "slice"."review_pausable", "slice"."review_resource", "slice"."review_retry_why", "slice"."review_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__review_den";

GRANT SELECT ON TABLE "slice_seats__review_den"."delivered", "slice_seats__review_den"."review_admitted", "slice_seats__review_den"."review_analyze_input", "slice_seats__review_den"."review_analyze_output", "slice_seats__review_den"."review_claim", "slice_seats__review_den"."review_done", "slice_seats__review_den"."review_ended", "slice_seats__review_den"."review_exhausted", "slice_seats__review_den"."review_failed", "slice_seats__review_den"."review_fenced", "slice_seats__review_den"."review_finish", "slice_seats__review_den"."review_gather_input", "slice_seats__review_den"."review_gather_input_sizes", "slice_seats__review_den"."review_gather_output", "slice_seats__review_den"."review_held", "slice_seats__review_den"."review_hold", "slice_seats__review_den"."review_live", "slice_seats__review_den"."review_paused", "slice_seats__review_den"."review_questions_finish_output", "slice_seats__review_den"."review_questions_input", "slice_seats__review_den"."review_refusal", "slice_seats__review_den"."review_result", "slice_seats__review_den"."review_resumed", "slice_seats__review_den"."review_retry", "slice_seats__review_den"."review_review_run_finish_output", "slice_seats__review_den"."review_review_run_input", "slice_seats__review_den"."review_review_run_input_sizes", "slice_seats__review_den"."review_root", "slice_seats__review_den"."review_save_input", "slice_seats__review_den"."review_save_output", "slice_seats__review_den"."review_saved", "slice_seats__review_den"."review_scope", "slice_seats__review_den"."review_skipped", "slice_seats__review_den"."review_split", "slice_seats__review_den"."review_start_scope", "slice_seats__review_den"."review_start_step", "slice_seats__review_den"."review_step", "slice_seats__review_den"."review_within" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_admitted" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_analyze_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_claim" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_done" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_ended" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_exhausted" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_failed" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_fenced" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_finish" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_gather_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_gather_input_sizes" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_held" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_hold" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_questions_finish_output" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_questions_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_refusal" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_result" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_retry" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_review_run_finish_output" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_review_run_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_review_run_input_sizes" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_root" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_save_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_scope" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_skipped" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_start_scope" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_start_step" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_step" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice"."review_within" TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"() TO :"slice_seats__review_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_review_root_j3blgclwnl"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__review_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__review_retirer" TO :"slice_seats__review_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."review_child_kind", "slice"."review_kind", "slice"."review_outcome", "slice"."review_pausable", "slice"."review_resource", "slice"."review_retry_why", "slice"."review_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__review_retirer";

GRANT SELECT ON TABLE "slice_seats__review_retirer"."review_admitted", "slice_seats__review_retirer"."review_analyze_input", "slice_seats__review_retirer"."review_analyze_output", "slice_seats__review_retirer"."review_claim", "slice_seats__review_retirer"."review_done", "slice_seats__review_retirer"."review_ended", "slice_seats__review_retirer"."review_exhausted", "slice_seats__review_retirer"."review_failed", "slice_seats__review_retirer"."review_fenced", "slice_seats__review_retirer"."review_finish", "slice_seats__review_retirer"."review_gather_input", "slice_seats__review_retirer"."review_gather_input_sizes", "slice_seats__review_retirer"."review_gather_output", "slice_seats__review_retirer"."review_held", "slice_seats__review_retirer"."review_hold", "slice_seats__review_retirer"."review_questions_finish_output", "slice_seats__review_retirer"."review_questions_input", "slice_seats__review_retirer"."review_refusal", "slice_seats__review_retirer"."review_result", "slice_seats__review_retirer"."review_retry", "slice_seats__review_retirer"."review_review_run_finish_output", "slice_seats__review_retirer"."review_review_run_input", "slice_seats__review_retirer"."review_review_run_input_sizes", "slice_seats__review_retirer"."review_root", "slice_seats__review_retirer"."review_save_input", "slice_seats__review_retirer"."review_save_output", "slice_seats__review_retirer"."review_saved", "slice_seats__review_retirer"."review_scope", "slice_seats__review_retirer"."review_skipped", "slice_seats__review_retirer"."review_split", "slice_seats__review_retirer"."review_start_scope", "slice_seats__review_retirer"."review_start_step", "slice_seats__review_retirer"."review_step", "slice_seats__review_retirer"."review_within" TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"() TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_review_root_itykotyltd"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__review_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__sync_coordinator" TO :"slice_seats__sync_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."sync_retry_why", "slice"."sync_root_kind" TO :"slice_seats__sync_coordinator";

GRANT SELECT ON TABLE "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exclusive" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."sync_paused" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."sync_released" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."sync_resumed" TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"() TO :"slice_seats__sync_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__sync_den" TO :"slice_seats__sync_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."chain_kind", "slice"."chain_outcome", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."sync_retry_why", "slice"."sync_root_kind" TO :"slice_seats__sync_den";

GRANT SELECT ON TABLE "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_ended", "slice_seats__sync_den"."sync_exclusive", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_finish_output", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_paused", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_released", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_resumed", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_finish_output", "slice_seats__sync_den"."sync_sync_run_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_admitted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_build_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_claim" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_copy_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_done" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_ended" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exclusive_key" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exhausted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_failed" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_fenced" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_finish" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_gold_finish_output" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_gold_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_held" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_refusal" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_result" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_retry" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_root" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_scope" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_skipped" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_start_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_sync_run_finish_output" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_sync_run_input" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"() TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__sync_retirer" TO :"slice_seats__sync_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."sync_retry_why", "slice"."sync_root_kind" TO :"slice_seats__sync_retirer";

GRANT SELECT ON TABLE "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_ended", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_finish_output", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_finish_output", "slice_seats__sync_retirer"."sync_sync_run_input" TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"() TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_sync_root_ygktrpeohu"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__sync_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"slice_seats__worker";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__worker";

GRANT MAINTAIN ON TABLE "slice"."chain_result" TO :"slice_seats__worker";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__writeback_coordinator" TO :"slice_seats__writeback_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."writeback_kind", "slice"."writeback_outcome", "slice"."writeback_pausable", "slice"."writeback_retry_why", "slice"."writeback_root_kind" TO :"slice_seats__writeback_coordinator";

GRANT SELECT ON TABLE "slice_seats__writeback_coordinator"."writeback_paused", "slice_seats__writeback_coordinator"."writeback_resumed" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_paused" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_resumed" TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"() TO :"slice_seats__writeback_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__writeback_den" TO :"slice_seats__writeback_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."writeback_kind", "slice"."writeback_outcome", "slice"."writeback_pausable", "slice"."writeback_retry_why", "slice"."writeback_root_kind" TO :"slice_seats__writeback_den";

GRANT SELECT ON TABLE "slice_seats__writeback_den"."writeback_admitted", "slice_seats__writeback_den"."writeback_claim", "slice_seats__writeback_den"."writeback_deliver_input", "slice_seats__writeback_den"."writeback_deliver_output", "slice_seats__writeback_den"."writeback_done", "slice_seats__writeback_den"."writeback_ended", "slice_seats__writeback_den"."writeback_exhausted", "slice_seats__writeback_den"."writeback_failed", "slice_seats__writeback_den"."writeback_fenced", "slice_seats__writeback_den"."writeback_finish", "slice_seats__writeback_den"."writeback_held", "slice_seats__writeback_den"."writeback_paused", "slice_seats__writeback_den"."writeback_refusal", "slice_seats__writeback_den"."writeback_result", "slice_seats__writeback_den"."writeback_resumed", "slice_seats__writeback_den"."writeback_retry", "slice_seats__writeback_den"."writeback_root", "slice_seats__writeback_den"."writeback_scope", "slice_seats__writeback_den"."writeback_skipped", "slice_seats__writeback_den"."writeback_start_step", "slice_seats__writeback_den"."writeback_step", "slice_seats__writeback_den"."writeback_writeback_finish_output", "slice_seats__writeback_den"."writeback_writeback_input" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_admitted" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_claim" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_deliver_input" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_done" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_ended" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_exhausted" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_failed" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_fenced" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_finish" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_held" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_refusal" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_result" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_retry" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_root" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_scope" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_skipped" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_start_step" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_step" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_writeback_finish_output" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice"."writeback_writeback_input" TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"() TO :"slice_seats__writeback_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__hold_writeback_root_msmvpm3j7g"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__writeback_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__writeback_retirer" TO :"slice_seats__writeback_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."writeback_kind", "slice"."writeback_outcome", "slice"."writeback_pausable", "slice"."writeback_retry_why", "slice"."writeback_root_kind" TO :"slice_seats__writeback_retirer";

GRANT SELECT ON TABLE "slice_seats__writeback_retirer"."writeback_admitted", "slice_seats__writeback_retirer"."writeback_claim", "slice_seats__writeback_retirer"."writeback_deliver_input", "slice_seats__writeback_retirer"."writeback_deliver_output", "slice_seats__writeback_retirer"."writeback_done", "slice_seats__writeback_retirer"."writeback_ended", "slice_seats__writeback_retirer"."writeback_exhausted", "slice_seats__writeback_retirer"."writeback_failed", "slice_seats__writeback_retirer"."writeback_fenced", "slice_seats__writeback_retirer"."writeback_finish", "slice_seats__writeback_retirer"."writeback_held", "slice_seats__writeback_retirer"."writeback_refusal", "slice_seats__writeback_retirer"."writeback_result", "slice_seats__writeback_retirer"."writeback_retry", "slice_seats__writeback_retirer"."writeback_root", "slice_seats__writeback_retirer"."writeback_scope", "slice_seats__writeback_retirer"."writeback_skipped", "slice_seats__writeback_retirer"."writeback_start_step", "slice_seats__writeback_retirer"."writeback_step", "slice_seats__writeback_retirer"."writeback_writeback_finish_output", "slice_seats__writeback_retirer"."writeback_writeback_input" TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"() TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_writeback_root_oprw3k6une"("slice"."__domain_jevqauzmw6"[]) TO :"slice_seats__writeback_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"__live_wzkq6p2yii";

GRANT SELECT ON TABLE "slice"."__live_secret" TO :"__live_wzkq6p2yii";

GRANT SELECT ON TABLE "slice"."__ledger" TO :"slice_seats__app", :"slice_seats__worker";

ALTER ROLE :"slice_seats__app" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice_seats__app" SET extra_float_digits = '1';

ALTER ROLE :"slice_seats__app" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice_seats__app" SET bytea_output = 'hex';

ALTER ROLE :"slice_seats__app" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice_seats__app" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice_seats__app" SET lc_time = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice_seats__worker" SET extra_float_digits = '1';

ALTER ROLE :"slice_seats__worker" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice_seats__worker" SET bytea_output = 'hex';

ALTER ROLE :"slice_seats__worker" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET lc_time = 'C.UTF-8';

SELECT "vector_ext"."vector_dims"('[1]'::"vector_ext"."vector");

ALTER ROLE :"slice_seats__app" SET hnsw.iterative_scan = 'strict_order';

ALTER ROLE :"slice_seats__worker" SET hnsw.iterative_scan = 'strict_order';

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE ALL ON SCHEMA "slice", "slice_seats", "slice_seats__auditor", "slice_seats__loader", "slice_seats__assign_coordinator", "slice_seats__assign_den", "slice_seats__assign_retirer", "slice_seats__chain_coordinator", "slice_seats__chain_den", "slice_seats__chain_retirer", "slice_seats__clock_coordinator", "slice_seats__clock_den", "slice_seats__clock_retirer", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__fan_retirer", "slice_seats__retry_coordinator", "slice_seats__retry_den", "slice_seats__retry_retirer", "slice_seats__review_coordinator", "slice_seats__review_den", "slice_seats__review_retirer", "slice_seats__sync_coordinator", "slice_seats__sync_den", "slice_seats__sync_retirer", "slice_seats__writeback_coordinator", "slice_seats__writeback_den", "slice_seats__writeback_retirer" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."assign_admitted", "slice"."assign_asked", "slice"."assign_assignment_finish_output", "slice"."assign_assignment_input", "slice"."assign_assignment_input_exclude", "slice"."assign_assignment_input_mode_nearest", "slice"."assign_assignment_input_mode_within", "slice"."assign_assignment_input_near", "slice"."assign_claim", "slice"."assign_decide_input", "slice"."assign_decide_input_exclude", "slice"."assign_decide_input_mode_nearest", "slice"."assign_decide_input_mode_within", "slice"."assign_decide_nearest_read", "slice"."assign_decide_nearest_row", "slice"."assign_decide_output", "slice"."assign_decide_output_stage_rest", "slice"."assign_decide_output_stage_serve", "slice"."assign_decide_output_weighed", "slice"."assign_decide_seen_read", "slice"."assign_decide_seen_row", "slice"."assign_done", "slice"."assign_embed_input", "slice"."assign_embed_input_exclude", "slice"."assign_embed_input_mode_nearest", "slice"."assign_embed_input_mode_within", "slice"."assign_embed_input_near", "slice"."assign_embed_output", "slice"."assign_ended", "slice"."assign_exhausted", "slice"."assign_failed", "slice"."assign_fenced", "slice"."assign_finish", "slice"."assign_held", "slice"."assign_paused", "slice"."assign_refusal", "slice"."assign_result", "slice"."assign_resumed", "slice"."assign_retry", "slice"."assign_root", "slice"."assign_scope", "slice"."assign_skipped", "slice"."assign_start_step", "slice"."assign_step", "slice"."assigned", "slice"."audit", "slice"."built", "slice"."chain_admitted", "slice"."chain_chain_run_finish_output", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_done", "slice"."chain_ended", "slice"."chain_exhausted", "slice"."chain_failed", "slice"."chain_fenced", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_ordered_finish_output", "slice"."chain_ordered_input", "slice"."chain_page_earlier_read", "slice"."chain_page_earlier_row", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_page_tree_first", "slice"."chain_page_tree_items", "slice"."chain_page_tree_read", "slice"."chain_page_tree_row", "slice"."chain_page_weights_read", "slice"."chain_page_weights_row", "slice"."chain_paused", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_resumed", "slice"."chain_retry", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_skipped", "slice"."chain_start_step", "slice"."chain_step", "slice"."chimed", "slice"."clock_admitted", "slice"."clock_chime_input", "slice"."clock_chime_output", "slice"."clock_claim", "slice"."clock_close_input", "slice"."clock_close_output", "slice"."clock_done", "slice"."clock_ended", "slice"."clock_exhausted", "slice"."clock_failed", "slice"."clock_fenced", "slice"."clock_finish", "slice"."clock_held", "slice"."clock_hourly_finish_output", "slice"."clock_hourly_input", "slice"."clock_paused", "slice"."clock_refusal", "slice"."clock_result", "slice"."clock_resumed", "slice"."clock_retry", "slice"."clock_root", "slice"."clock_scope", "slice"."clock_sitting_finish_output", "slice"."clock_sitting_input", "slice"."clock_skipped", "slice"."clock_start_step", "slice"."clock_step", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."delivered", "slice"."fan_admitted", "slice"."fan_batch_finish_output", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_done", "slice"."fan_dust_input", "slice"."fan_dust_output", "slice"."fan_ended", "slice"."fan_exhausted", "slice"."fan_failed", "slice"."fan_fan_run_finish_output", "slice"."fan_fan_run_input", "slice"."fan_fenced", "slice"."fan_finish", "slice"."fan_held", "slice"."fan_hold", "slice"."fan_mop_input", "slice"."fan_mop_output", "slice"."fan_paused", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_resumed", "slice"."fan_retry", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_skipped", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_sweep_finish_output", "slice"."fan_sweep_input", "slice"."fan_within", "slice"."heard", "slice"."item", "slice"."order", "slice"."passage", "slice"."retry_admitted", "slice"."retry_brittle_input", "slice"."retry_brittle_output", "slice"."retry_claim", "slice"."retry_done", "slice"."retry_ended", "slice"."retry_exhausted", "slice"."retry_failed", "slice"."retry_fenced", "slice"."retry_finish", "slice"."retry_held", "slice"."retry_ladders_finish_output", "slice"."retry_ladders_input", "slice"."retry_patient_input", "slice"."retry_patient_output", "slice"."retry_paused", "slice"."retry_polite_input", "slice"."retry_polite_output", "slice"."retry_refusal", "slice"."retry_result", "slice"."retry_resumed", "slice"."retry_retry", "slice"."retry_root", "slice"."retry_scope", "slice"."retry_skipped", "slice"."retry_start_step", "slice"."retry_steadfast_input", "slice"."retry_steadfast_output", "slice"."retry_step", "slice"."retry_throttled_finish_output", "slice"."retry_throttled_input", "slice"."retry_unhurried_finish_output", "slice"."retry_unhurried_input", "slice"."review_admitted", "slice"."review_analyze_input", "slice"."review_analyze_output", "slice"."review_claim", "slice"."review_done", "slice"."review_ended", "slice"."review_exhausted", "slice"."review_failed", "slice"."review_fenced", "slice"."review_finish", "slice"."review_gather_input", "slice"."review_gather_input_sizes", "slice"."review_gather_output", "slice"."review_held", "slice"."review_hold", "slice"."review_paused", "slice"."review_questions_finish_output", "slice"."review_questions_input", "slice"."review_refusal", "slice"."review_result", "slice"."review_resumed", "slice"."review_retry", "slice"."review_review_run_finish_output", "slice"."review_review_run_input", "slice"."review_review_run_input_sizes", "slice"."review_root", "slice"."review_save_input", "slice"."review_save_output", "slice"."review_saved", "slice"."review_scope", "slice"."review_skipped", "slice"."review_split", "slice"."review_start_scope", "slice"."review_start_step", "slice"."review_step", "slice"."review_within", "slice"."reviewed", "slice"."seen", "slice"."settled", "slice"."summary", "slice"."sync_admitted", "slice"."sync_build_input", "slice"."sync_build_output", "slice"."sync_claim", "slice"."sync_copy_input", "slice"."sync_copy_output", "slice"."sync_done", "slice"."sync_ended", "slice"."sync_exclusive", "slice"."sync_exclusive_key", "slice"."sync_exhausted", "slice"."sync_failed", "slice"."sync_fenced", "slice"."sync_finish", "slice"."sync_gold_finish_output", "slice"."sync_gold_input", "slice"."sync_held", "slice"."sync_paused", "slice"."sync_refusal", "slice"."sync_released", "slice"."sync_result", "slice"."sync_resumed", "slice"."sync_retry", "slice"."sync_root", "slice"."sync_scope", "slice"."sync_skipped", "slice"."sync_start_step", "slice"."sync_step", "slice"."sync_sync_run_finish_output", "slice"."sync_sync_run_input", "slice"."tally", "slice"."weight", "slice"."writeback_admitted", "slice"."writeback_claim", "slice"."writeback_deliver_input", "slice"."writeback_deliver_output", "slice"."writeback_done", "slice"."writeback_ended", "slice"."writeback_exhausted", "slice"."writeback_failed", "slice"."writeback_fenced", "slice"."writeback_finish", "slice"."writeback_held", "slice"."writeback_paused", "slice"."writeback_refusal", "slice"."writeback_result", "slice"."writeback_resumed", "slice"."writeback_retry", "slice"."writeback_root", "slice"."writeback_scope", "slice"."writeback_skipped", "slice"."writeback_start_step", "slice"."writeback_step", "slice"."writeback_writeback_finish_output", "slice"."writeback_writeback_input", "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_nearest_row", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_decide_seen_row", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_earlier_row", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_tree_first", "slice_seats__auditor"."chain_page_tree_items", "slice_seats__auditor"."chain_page_tree_read", "slice_seats__auditor"."chain_page_tree_row", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_page_weights_row", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chimed", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_claim", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_hold", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."heard", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."review_finish", "slice_seats__auditor"."review_hold", "slice_seats__auditor"."review_result", "slice_seats__auditor"."review_step", "slice_seats__auditor"."review_within", "slice_seats__auditor"."reviewed", "slice_seats__auditor"."settled", "slice_seats__auditor"."summary", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight", "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_asked", "slice_seats__loader"."assign_assignment_finish_output", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_assignment_input_near", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_nearest_row", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_decide_seen_row", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_embed_input", "slice_seats__loader"."assign_embed_input_exclude", "slice_seats__loader"."assign_embed_input_mode_nearest", "slice_seats__loader"."assign_embed_input_mode_within", "slice_seats__loader"."assign_embed_input_near", "slice_seats__loader"."assign_embed_output", "slice_seats__loader"."assign_ended", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_finish_output", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_ended", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_finish_output", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_earlier_read", "slice_seats__loader"."chain_page_earlier_row", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_tree_first", "slice_seats__loader"."chain_page_tree_items", "slice_seats__loader"."chain_page_tree_read", "slice_seats__loader"."chain_page_tree_row", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_page_weights_row", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chimed", "slice_seats__loader"."clock_admitted", "slice_seats__loader"."clock_chime_input", "slice_seats__loader"."clock_chime_output", "slice_seats__loader"."clock_claim", "slice_seats__loader"."clock_close_input", "slice_seats__loader"."clock_close_output", "slice_seats__loader"."clock_done", "slice_seats__loader"."clock_ended", "slice_seats__loader"."clock_exhausted", "slice_seats__loader"."clock_failed", "slice_seats__loader"."clock_fenced", "slice_seats__loader"."clock_finish", "slice_seats__loader"."clock_held", "slice_seats__loader"."clock_hourly_finish_output", "slice_seats__loader"."clock_hourly_input", "slice_seats__loader"."clock_refusal", "slice_seats__loader"."clock_result", "slice_seats__loader"."clock_retry", "slice_seats__loader"."clock_root", "slice_seats__loader"."clock_scope", "slice_seats__loader"."clock_sitting_finish_output", "slice_seats__loader"."clock_sitting_input", "slice_seats__loader"."clock_skipped", "slice_seats__loader"."clock_start_step", "slice_seats__loader"."clock_step", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."delivered", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_finish_output", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_dust_input", "slice_seats__loader"."fan_dust_output", "slice_seats__loader"."fan_ended", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_finish_output", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_hold", "slice_seats__loader"."fan_mop_input", "slice_seats__loader"."fan_mop_output", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_sweep_finish_output", "slice_seats__loader"."fan_sweep_input", "slice_seats__loader"."fan_within", "slice_seats__loader"."heard", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_ended", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_finish_output", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_patient_input", "slice_seats__loader"."retry_patient_output", "slice_seats__loader"."retry_polite_input", "slice_seats__loader"."retry_polite_output", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_throttled_finish_output", "slice_seats__loader"."retry_throttled_input", "slice_seats__loader"."retry_unhurried_finish_output", "slice_seats__loader"."retry_unhurried_input", "slice_seats__loader"."review_admitted", "slice_seats__loader"."review_analyze_input", "slice_seats__loader"."review_analyze_output", "slice_seats__loader"."review_claim", "slice_seats__loader"."review_done", "slice_seats__loader"."review_ended", "slice_seats__loader"."review_exhausted", "slice_seats__loader"."review_failed", "slice_seats__loader"."review_fenced", "slice_seats__loader"."review_finish", "slice_seats__loader"."review_gather_input", "slice_seats__loader"."review_gather_input_sizes", "slice_seats__loader"."review_gather_output", "slice_seats__loader"."review_held", "slice_seats__loader"."review_hold", "slice_seats__loader"."review_questions_finish_output", "slice_seats__loader"."review_questions_input", "slice_seats__loader"."review_refusal", "slice_seats__loader"."review_result", "slice_seats__loader"."review_retry", "slice_seats__loader"."review_review_run_finish_output", "slice_seats__loader"."review_review_run_input", "slice_seats__loader"."review_review_run_input_sizes", "slice_seats__loader"."review_root", "slice_seats__loader"."review_save_input", "slice_seats__loader"."review_save_output", "slice_seats__loader"."review_saved", "slice_seats__loader"."review_scope", "slice_seats__loader"."review_skipped", "slice_seats__loader"."review_split", "slice_seats__loader"."review_start_scope", "slice_seats__loader"."review_start_step", "slice_seats__loader"."review_step", "slice_seats__loader"."review_within", "slice_seats__loader"."reviewed", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."summary", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_ended", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_finish_output", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_finish_output", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__loader"."writeback_admitted", "slice_seats__loader"."writeback_claim", "slice_seats__loader"."writeback_deliver_input", "slice_seats__loader"."writeback_deliver_output", "slice_seats__loader"."writeback_done", "slice_seats__loader"."writeback_ended", "slice_seats__loader"."writeback_exhausted", "slice_seats__loader"."writeback_failed", "slice_seats__loader"."writeback_fenced", "slice_seats__loader"."writeback_finish", "slice_seats__loader"."writeback_held", "slice_seats__loader"."writeback_refusal", "slice_seats__loader"."writeback_result", "slice_seats__loader"."writeback_retry", "slice_seats__loader"."writeback_root", "slice_seats__loader"."writeback_scope", "slice_seats__loader"."writeback_skipped", "slice_seats__loader"."writeback_start_step", "slice_seats__loader"."writeback_step", "slice_seats__loader"."writeback_writeback_finish_output", "slice_seats__loader"."writeback_writeback_input", "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_asked", "slice_seats__assign_den"."assign_assignment_finish_output", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_assignment_input_near", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_nearest_row", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_decide_seen_row", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_embed_input", "slice_seats__assign_den"."assign_embed_input_exclude", "slice_seats__assign_den"."assign_embed_input_mode_nearest", "slice_seats__assign_den"."assign_embed_input_mode_within", "slice_seats__assign_den"."assign_embed_input_near", "slice_seats__assign_den"."assign_embed_output", "slice_seats__assign_den"."assign_ended", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_paused", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_resumed", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_asked", "slice_seats__assign_retirer"."assign_assignment_finish_output", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_assignment_input_near", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_nearest_row", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_decide_seen_row", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_embed_input", "slice_seats__assign_retirer"."assign_embed_input_exclude", "slice_seats__assign_retirer"."assign_embed_input_mode_nearest", "slice_seats__assign_retirer"."assign_embed_input_mode_within", "slice_seats__assign_retirer"."assign_embed_input_near", "slice_seats__assign_retirer"."assign_embed_output", "slice_seats__assign_retirer"."assign_ended", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_finish_output", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_ended", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_finish_output", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_earlier_read", "slice_seats__chain_den"."chain_page_earlier_row", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_tree_first", "slice_seats__chain_den"."chain_page_tree_items", "slice_seats__chain_den"."chain_page_tree_read", "slice_seats__chain_den"."chain_page_tree_row", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_page_weights_row", "slice_seats__chain_den"."chain_paused", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_resumed", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_finish_output", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_ended", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_finish_output", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_earlier_read", "slice_seats__chain_retirer"."chain_page_earlier_row", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_tree_first", "slice_seats__chain_retirer"."chain_page_tree_items", "slice_seats__chain_retirer"."chain_page_tree_read", "slice_seats__chain_retirer"."chain_page_tree_row", "slice_seats__chain_retirer"."chain_page_weights_read", "slice_seats__chain_retirer"."chain_page_weights_row", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step", "slice_seats__clock_coordinator"."clock_paused", "slice_seats__clock_coordinator"."clock_resumed", "slice_seats__clock_den"."clock_admitted", "slice_seats__clock_den"."clock_chime_input", "slice_seats__clock_den"."clock_chime_output", "slice_seats__clock_den"."clock_claim", "slice_seats__clock_den"."clock_close_input", "slice_seats__clock_den"."clock_close_output", "slice_seats__clock_den"."clock_done", "slice_seats__clock_den"."clock_ended", "slice_seats__clock_den"."clock_exhausted", "slice_seats__clock_den"."clock_failed", "slice_seats__clock_den"."clock_fenced", "slice_seats__clock_den"."clock_finish", "slice_seats__clock_den"."clock_held", "slice_seats__clock_den"."clock_hourly_finish_output", "slice_seats__clock_den"."clock_hourly_input", "slice_seats__clock_den"."clock_paused", "slice_seats__clock_den"."clock_refusal", "slice_seats__clock_den"."clock_result", "slice_seats__clock_den"."clock_resumed", "slice_seats__clock_den"."clock_retry", "slice_seats__clock_den"."clock_root", "slice_seats__clock_den"."clock_scope", "slice_seats__clock_den"."clock_sitting_finish_output", "slice_seats__clock_den"."clock_sitting_input", "slice_seats__clock_den"."clock_skipped", "slice_seats__clock_den"."clock_start_step", "slice_seats__clock_den"."clock_step", "slice_seats__clock_retirer"."clock_admitted", "slice_seats__clock_retirer"."clock_chime_input", "slice_seats__clock_retirer"."clock_chime_output", "slice_seats__clock_retirer"."clock_claim", "slice_seats__clock_retirer"."clock_close_input", "slice_seats__clock_retirer"."clock_close_output", "slice_seats__clock_retirer"."clock_done", "slice_seats__clock_retirer"."clock_ended", "slice_seats__clock_retirer"."clock_exhausted", "slice_seats__clock_retirer"."clock_failed", "slice_seats__clock_retirer"."clock_fenced", "slice_seats__clock_retirer"."clock_finish", "slice_seats__clock_retirer"."clock_held", "slice_seats__clock_retirer"."clock_hourly_finish_output", "slice_seats__clock_retirer"."clock_hourly_input", "slice_seats__clock_retirer"."clock_refusal", "slice_seats__clock_retirer"."clock_result", "slice_seats__clock_retirer"."clock_retry", "slice_seats__clock_retirer"."clock_root", "slice_seats__clock_retirer"."clock_scope", "slice_seats__clock_retirer"."clock_sitting_finish_output", "slice_seats__clock_retirer"."clock_sitting_input", "slice_seats__clock_retirer"."clock_skipped", "slice_seats__clock_retirer"."clock_start_step", "slice_seats__clock_retirer"."clock_step", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_finish_output", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_dust_input", "slice_seats__fan_den"."fan_dust_output", "slice_seats__fan_den"."fan_ended", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_finish_output", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_hold", "slice_seats__fan_den"."fan_live", "slice_seats__fan_den"."fan_mop_input", "slice_seats__fan_den"."fan_mop_output", "slice_seats__fan_den"."fan_paused", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_resumed", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_sweep_finish_output", "slice_seats__fan_den"."fan_sweep_input", "slice_seats__fan_den"."fan_within", "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_finish_output", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_dust_input", "slice_seats__fan_retirer"."fan_dust_output", "slice_seats__fan_retirer"."fan_ended", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_finish_output", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_hold", "slice_seats__fan_retirer"."fan_mop_input", "slice_seats__fan_retirer"."fan_mop_output", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_sweep_finish_output", "slice_seats__fan_retirer"."fan_sweep_input", "slice_seats__fan_retirer"."fan_within", "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_ended", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_finish_output", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_patient_input", "slice_seats__retry_den"."retry_patient_output", "slice_seats__retry_den"."retry_paused", "slice_seats__retry_den"."retry_polite_input", "slice_seats__retry_den"."retry_polite_output", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_resumed", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_throttled_finish_output", "slice_seats__retry_den"."retry_throttled_input", "slice_seats__retry_den"."retry_unhurried_finish_output", "slice_seats__retry_den"."retry_unhurried_input", "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_ended", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_finish_output", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_patient_input", "slice_seats__retry_retirer"."retry_patient_output", "slice_seats__retry_retirer"."retry_polite_input", "slice_seats__retry_retirer"."retry_polite_output", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_throttled_finish_output", "slice_seats__retry_retirer"."retry_throttled_input", "slice_seats__retry_retirer"."retry_unhurried_finish_output", "slice_seats__retry_retirer"."retry_unhurried_input", "slice_seats__review_coordinator"."review_live", "slice_seats__review_coordinator"."review_paused", "slice_seats__review_coordinator"."review_resumed", "slice_seats__review_den"."delivered", "slice_seats__review_den"."review_admitted", "slice_seats__review_den"."review_analyze_input", "slice_seats__review_den"."review_analyze_output", "slice_seats__review_den"."review_claim", "slice_seats__review_den"."review_done", "slice_seats__review_den"."review_ended", "slice_seats__review_den"."review_exhausted", "slice_seats__review_den"."review_failed", "slice_seats__review_den"."review_fenced", "slice_seats__review_den"."review_finish", "slice_seats__review_den"."review_gather_input", "slice_seats__review_den"."review_gather_input_sizes", "slice_seats__review_den"."review_gather_output", "slice_seats__review_den"."review_held", "slice_seats__review_den"."review_hold", "slice_seats__review_den"."review_live", "slice_seats__review_den"."review_paused", "slice_seats__review_den"."review_questions_finish_output", "slice_seats__review_den"."review_questions_input", "slice_seats__review_den"."review_refusal", "slice_seats__review_den"."review_result", "slice_seats__review_den"."review_resumed", "slice_seats__review_den"."review_retry", "slice_seats__review_den"."review_review_run_finish_output", "slice_seats__review_den"."review_review_run_input", "slice_seats__review_den"."review_review_run_input_sizes", "slice_seats__review_den"."review_root", "slice_seats__review_den"."review_save_input", "slice_seats__review_den"."review_save_output", "slice_seats__review_den"."review_saved", "slice_seats__review_den"."review_scope", "slice_seats__review_den"."review_skipped", "slice_seats__review_den"."review_split", "slice_seats__review_den"."review_start_scope", "slice_seats__review_den"."review_start_step", "slice_seats__review_den"."review_step", "slice_seats__review_den"."review_within", "slice_seats__review_retirer"."review_admitted", "slice_seats__review_retirer"."review_analyze_input", "slice_seats__review_retirer"."review_analyze_output", "slice_seats__review_retirer"."review_claim", "slice_seats__review_retirer"."review_done", "slice_seats__review_retirer"."review_ended", "slice_seats__review_retirer"."review_exhausted", "slice_seats__review_retirer"."review_failed", "slice_seats__review_retirer"."review_fenced", "slice_seats__review_retirer"."review_finish", "slice_seats__review_retirer"."review_gather_input", "slice_seats__review_retirer"."review_gather_input_sizes", "slice_seats__review_retirer"."review_gather_output", "slice_seats__review_retirer"."review_held", "slice_seats__review_retirer"."review_hold", "slice_seats__review_retirer"."review_questions_finish_output", "slice_seats__review_retirer"."review_questions_input", "slice_seats__review_retirer"."review_refusal", "slice_seats__review_retirer"."review_result", "slice_seats__review_retirer"."review_retry", "slice_seats__review_retirer"."review_review_run_finish_output", "slice_seats__review_retirer"."review_review_run_input", "slice_seats__review_retirer"."review_review_run_input_sizes", "slice_seats__review_retirer"."review_root", "slice_seats__review_retirer"."review_save_input", "slice_seats__review_retirer"."review_save_output", "slice_seats__review_retirer"."review_saved", "slice_seats__review_retirer"."review_scope", "slice_seats__review_retirer"."review_skipped", "slice_seats__review_retirer"."review_split", "slice_seats__review_retirer"."review_start_scope", "slice_seats__review_retirer"."review_start_step", "slice_seats__review_retirer"."review_step", "slice_seats__review_retirer"."review_within", "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_ended", "slice_seats__sync_den"."sync_exclusive", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_finish_output", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_paused", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_released", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_resumed", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_finish_output", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_ended", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_finish_output", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_finish_output", "slice_seats__sync_retirer"."sync_sync_run_input", "slice_seats__writeback_coordinator"."writeback_paused", "slice_seats__writeback_coordinator"."writeback_resumed", "slice_seats__writeback_den"."writeback_admitted", "slice_seats__writeback_den"."writeback_claim", "slice_seats__writeback_den"."writeback_deliver_input", "slice_seats__writeback_den"."writeback_deliver_output", "slice_seats__writeback_den"."writeback_done", "slice_seats__writeback_den"."writeback_ended", "slice_seats__writeback_den"."writeback_exhausted", "slice_seats__writeback_den"."writeback_failed", "slice_seats__writeback_den"."writeback_fenced", "slice_seats__writeback_den"."writeback_finish", "slice_seats__writeback_den"."writeback_held", "slice_seats__writeback_den"."writeback_paused", "slice_seats__writeback_den"."writeback_refusal", "slice_seats__writeback_den"."writeback_result", "slice_seats__writeback_den"."writeback_resumed", "slice_seats__writeback_den"."writeback_retry", "slice_seats__writeback_den"."writeback_root", "slice_seats__writeback_den"."writeback_scope", "slice_seats__writeback_den"."writeback_skipped", "slice_seats__writeback_den"."writeback_start_step", "slice_seats__writeback_den"."writeback_step", "slice_seats__writeback_den"."writeback_writeback_finish_output", "slice_seats__writeback_den"."writeback_writeback_input", "slice_seats__writeback_retirer"."writeback_admitted", "slice_seats__writeback_retirer"."writeback_claim", "slice_seats__writeback_retirer"."writeback_deliver_input", "slice_seats__writeback_retirer"."writeback_deliver_output", "slice_seats__writeback_retirer"."writeback_done", "slice_seats__writeback_retirer"."writeback_ended", "slice_seats__writeback_retirer"."writeback_exhausted", "slice_seats__writeback_retirer"."writeback_failed", "slice_seats__writeback_retirer"."writeback_fenced", "slice_seats__writeback_retirer"."writeback_finish", "slice_seats__writeback_retirer"."writeback_held", "slice_seats__writeback_retirer"."writeback_refusal", "slice_seats__writeback_retirer"."writeback_result", "slice_seats__writeback_retirer"."writeback_retry", "slice_seats__writeback_retirer"."writeback_root", "slice_seats__writeback_retirer"."writeback_scope", "slice_seats__writeback_retirer"."writeback_skipped", "slice_seats__writeback_retirer"."writeback_start_step", "slice_seats__writeback_retirer"."writeback_step", "slice_seats__writeback_retirer"."writeback_writeback_finish_output", "slice_seats__writeback_retirer"."writeback_writeback_input" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_embed_input_mode", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."assign_retry_why", "slice"."assign_root_kind", "slice"."bell", "slice"."chain_chain_run_input_feed", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_earlier_row_feed", "slice"."chain_page_input_feed", "slice"."chain_page_tree_row_feed", "slice"."chain_page_weights_row_feed", "slice"."chain_pausable", "slice"."chain_retry_why", "slice"."chain_root_kind", "slice"."clock_chime_input_bell", "slice"."clock_chime_output_bell", "slice"."clock_hourly_input_bell", "slice"."clock_kind", "slice"."clock_outcome", "slice"."clock_pausable", "slice"."clock_retry_why", "slice"."clock_root_kind", "slice"."fan_child_kind", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."fan_retry_why", "slice"."fan_root_kind", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."retry_retry_why", "slice"."retry_root_kind", "slice"."review_child_kind", "slice"."review_kind", "slice"."review_outcome", "slice"."review_pausable", "slice"."review_resource", "slice"."review_retry_why", "slice"."review_root_kind", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."sync_retry_why", "slice"."sync_root_kind", "slice"."writeback_kind", "slice"."writeback_outcome", "slice"."writeback_pausable", "slice"."writeback_retry_why", "slice"."writeback_root_kind", "slice"."__text_t4rwovzmqj", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."__domain_jevqauzmw6", "slice"."__domain_jevqauzmw6", "slice"."__domain_jevqauzmw6", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__domain_p7dj7oebtz", "slice"."__param_nearest_topic_4eruqlfauv", "slice"."__param_seen_learner_exdgowkpja" FROM PUBLIC;

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

COMMENT ON FUNCTION "slice"."__constant_ejkw66w2je"() IS 'closed constant c0425c74dfc7eff7c10920bb9b085c2f0b3353baca0710384369fe1232e405b8';

COMMENT ON FUNCTION "slice"."__constant_ib5zplua3f"() IS 'closed constant e74e8afa12f9482972f8c3a277d42e6adeba09f7057c2e49ce81978193dcd5e4';

COMMENT ON FUNCTION "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"() IS 'names of roster AssignAssignmentInputMode (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_decide_input_mode_names_zoydpw665o"() IS 'names of roster AssignDecideInputMode (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_decide_output_stage_names_ehhgk5bunv"() IS 'names of roster AssignDecideOutputStage (339c465d1efa6f01b66b7f28251a710c6ef4b703c2ae24784db44b69786c3ad6)';

COMMENT ON FUNCTION "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"() IS 'names of roster AssignEmbedInputMode (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_kind_names_rtvscvwquk"() IS 'names of roster AssignKind (89a3cbff0adc5997cf87a5c997d0ac5c2f0e099c2743f1579471dc5d45703b53)';

COMMENT ON FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() IS 'names of roster AssignOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() IS 'names of roster AssignPausable (1c3fe9c5114875213e61eef4023fbb27b30c5ca204b84f617d53b3a1262d2815)';

COMMENT ON FUNCTION "slice"."__assign_retry_why_names_5ckzenntb2"() IS 'names of roster AssignRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__assign_root_kind_names_opbaefdfbo"() IS 'names of roster AssignRootKind (1c3fe9c5114875213e61eef4023fbb27b30c5ca204b84f617d53b3a1262d2815)';

COMMENT ON FUNCTION "slice"."__bell_names_aiqi4uostx"() IS 'names of roster Bell (5c192627910396d71af4625a6f192b79d3980866ac98ede221e06a20e5ba18d2)';

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() IS 'names of roster ChainChainRunInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() IS 'names of roster ChainKind (e7bcf98ec63bf066e30e455f58e78f32232c8dc01b1a10cba9914a6fa99d1e74)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"() IS 'names of roster ChainOrderedInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() IS 'names of roster ChainOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"() IS 'names of roster ChainPageEarlierRowFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() IS 'names of roster ChainPageInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"() IS 'names of roster ChainPageTreeRowFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"() IS 'names of roster ChainPageWeightsRowFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_pausable_names_vjdoymenyq"() IS 'names of roster ChainPausable (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__chain_retry_why_names_zmog33hzfy"() IS 'names of roster ChainRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__chain_root_kind_names_ndmuh43zki"() IS 'names of roster ChainRootKind (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__clock_chime_input_bell_names_nkzi4dgaig"() IS 'names of roster ClockChimeInputBell (5c192627910396d71af4625a6f192b79d3980866ac98ede221e06a20e5ba18d2)';

COMMENT ON FUNCTION "slice"."__clock_chime_output_bell_names_tzmx63kpb4"() IS 'names of roster ClockChimeOutputBell (5c192627910396d71af4625a6f192b79d3980866ac98ede221e06a20e5ba18d2)';

COMMENT ON FUNCTION "slice"."__clock_hourly_input_bell_names_vugtqsvsug"() IS 'names of roster ClockHourlyInputBell (5c192627910396d71af4625a6f192b79d3980866ac98ede221e06a20e5ba18d2)';

COMMENT ON FUNCTION "slice"."__clock_kind_names_7yqk67pwg5"() IS 'names of roster ClockKind (470d74a7a6f92cf958567d6d47a51d8c96bb4a79460d3dcd271053aca971f13c)';

COMMENT ON FUNCTION "slice"."__clock_outcome_names_rqtqczot4q"() IS 'names of roster ClockOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__clock_pausable_names_phjbr2fipl"() IS 'names of roster ClockPausable (62edc48c84e06e981b949cb51c8337c58291d320e97ddaa90c0ffa0d47a1438c)';

COMMENT ON FUNCTION "slice"."__clock_retry_why_names_pjdgx4s6a4"() IS 'names of roster ClockRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__clock_root_kind_names_3kro23qfv4"() IS 'names of roster ClockRootKind (62edc48c84e06e981b949cb51c8337c58291d320e97ddaa90c0ffa0d47a1438c)';

COMMENT ON FUNCTION "slice"."__fan_child_kind_names_i6k53d3e2e"() IS 'names of roster FanChildKind (8ded20e9870697347aad8af4862ccc68f6964e6f66ab9fd021269b219a0d455a)';

COMMENT ON FUNCTION "slice"."__fan_kind_names_rrax7ylsix"() IS 'names of roster FanKind (e194d4b4e07bb1835c540acc135973f3b536eb2f6b9676fb701370eedbd65df6)';

COMMENT ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() IS 'names of roster FanOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__fan_pausable_names_7t2samsp7b"() IS 'names of roster FanPausable (24b359011c6c3fe5bcb73c2ef6ae1b3c7bfc2dd0bd31cc845200772c427f14e6)';

COMMENT ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() IS 'names of roster FanResource (5bea949a8ab6e8182609b54fd43410c2c13a5abe4a43bb2905848fd3ad333c76)';

COMMENT ON FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() IS 'names of roster FanRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__fan_root_kind_names_nagupzc3sq"() IS 'names of roster FanRootKind (8df9150d29772af1e6ce6f68ab64da111c13b555fff7f89945d8718a438d5e0c)';

COMMENT ON FUNCTION "slice"."__feed_names_azjbqebc6i"() IS 'names of roster Feed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__retry_kind_names_yg2tu5rejg"() IS 'names of roster RetryKind (52d1641ee7becdce043e47817f26bcd0053f8104ccc945dc8eee1631d285632a)';

COMMENT ON FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() IS 'names of roster RetryOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__retry_pausable_names_hen5ycf77m"() IS 'names of roster RetryPausable (5afc5b4d0dc688a8cb761da4f852c480fcc608475687c142d6abd7f05faf8f28)';

COMMENT ON FUNCTION "slice"."__retry_retry_why_names_pwmdyzqghs"() IS 'names of roster RetryRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__retry_root_kind_names_bhf4onc7wq"() IS 'names of roster RetryRootKind (5afc5b4d0dc688a8cb761da4f852c480fcc608475687c142d6abd7f05faf8f28)';

COMMENT ON FUNCTION "slice"."__review_child_kind_names_jn3iwx7yal"() IS 'names of roster ReviewChildKind (e585af7cda5f761a356c3a25337e96da40d454ae758150759a49577600d2f0b2)';

COMMENT ON FUNCTION "slice"."__review_kind_names_j4pukr2klj"() IS 'names of roster ReviewKind (0c55b46af9d21a92397a045d5a98b91cd92ae1cee79a210d6d92ca722f50c804)';

COMMENT ON FUNCTION "slice"."__review_outcome_names_nlfaf7zb7f"() IS 'names of roster ReviewOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__review_pausable_names_uhujnxcsz6"() IS 'names of roster ReviewPausable (7ff6017ce866d4117f5ca1a9bc062a167944c3de157f8bf04e9be7ead037b00b)';

COMMENT ON FUNCTION "slice"."__review_resource_names_ixi3gnpcnp"() IS 'names of roster ReviewResource (833b456ce4c6de0e144d62ab9a919da80622a598640450650574ef374bf96815)';

COMMENT ON FUNCTION "slice"."__review_retry_why_names_4ux5dj2mh3"() IS 'names of roster ReviewRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__review_root_kind_names_uvxmjcavxb"() IS 'names of roster ReviewRootKind (56ff295fd83dd6bed36ee892223241caf26f3ada4b800c3c1ae54b28b7ad608e)';

COMMENT ON FUNCTION "slice"."__sync_kind_names_oq6b66cstu"() IS 'names of roster SyncKind (1db7074a36145942b21817905eb40c653b0824cd2fa05fe9b9549907562b977c)';

COMMENT ON FUNCTION "slice"."__sync_outcome_names_xzb4y4xgki"() IS 'names of roster SyncOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__sync_pausable_names_3hzpsqgfjl"() IS 'names of roster SyncPausable (5599aacd43f74e79063c3306c8bd73db92d44f3dcabfcb5d022a7900cfa5c56a)';

COMMENT ON FUNCTION "slice"."__sync_retry_why_names_o3uvvn3247"() IS 'names of roster SyncRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__sync_root_kind_names_drp422srbk"() IS 'names of roster SyncRootKind (5599aacd43f74e79063c3306c8bd73db92d44f3dcabfcb5d022a7900cfa5c56a)';

COMMENT ON FUNCTION "slice"."__writeback_kind_names_dbe6fofbjq"() IS 'names of roster WritebackKind (54a3dcd1be7f6066502214901f3047974d0f174a6228e1bc4f2d0ecb861e3a57)';

COMMENT ON FUNCTION "slice"."__writeback_outcome_names_oq43xsnmec"() IS 'names of roster WritebackOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__writeback_pausable_names_mqzeerbulh"() IS 'names of roster WritebackPausable (f92156d78e6d6b3d8acddabc8c25f812877811ffa6d2b4a84de1d6ef10fc80c2)';

COMMENT ON FUNCTION "slice"."__writeback_retry_why_names_7a7eowjbic"() IS 'names of roster WritebackRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__writeback_root_kind_names_bz7cmi256x"() IS 'names of roster WritebackRootKind (f92156d78e6d6b3d8acddabc8c25f812877811ffa6d2b4a84de1d6ef10fc80c2)';

COMMENT ON DOMAIN "slice"."__domain_gfw43vigph" IS 'domain of definition 39922592cedecf769d6df372d6df99e0b82206b0bf6dacd9722d0490f83cc782';

COMMENT ON DOMAIN "slice"."__domain_jevqauzmw6" IS 'domain of definition 9ee012fb79fcb52e1281f9b222071737e340dc146c2082aa3a4646fcd0f11d41';

COMMENT ON DOMAIN "slice"."__domain_mxhao3k6ss" IS 'domain of definition be4e1f34160619e14c4a8009e96d1ced7b683a1e169a9e4d0e9e10640701b8aa';

COMMENT ON DOMAIN "slice"."__domain_p7dj7oebtz" IS 'domain of definition db25dd39e94cd7f1ccb54e669ba299e617489799d273326e340a1a533e0b94bd';

COMMENT ON DOMAIN "slice"."__text_t4rwovzmqj" IS 'text domain of definition 6f5ba169462bdb47db4c56bb5fe21d5091867333e4952f2c20b18e8fa085befc';

COMMENT ON DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" IS 'pattern domain of parameter nearest.topic of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON DOMAIN "slice"."__param_seen_learner_exdgowkpja" IS 'pattern domain of parameter seen.learner of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" ON "slice"."assign_admitted" IS 'primary key of AssignAdmitted';

COMMENT ON CONSTRAINT "__assign_asked_pk_5hpdamg2sv" ON "slice"."assign_asked" IS 'primary key of AssignAsked';

COMMENT ON CONSTRAINT "__assign_asked_key_to_root_7prfl6pubf" ON "slice"."assign_asked" IS 'key AssignAsked(to, root)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_pk_djholiuras" ON "slice"."assign_assignment_finish_output" IS 'primary key of AssignAssignmentFinishOutput';

COMMENT ON CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" ON "slice"."assign_assignment_input" IS 'primary key of AssignAssignmentInput';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" ON "slice"."assign_assignment_input_exclude" IS 'primary key of AssignAssignmentInputExclude';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" ON "slice"."assign_assignment_input_mode_nearest" IS 'primary key of AssignAssignmentInputModeNearest';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" ON "slice"."assign_assignment_input_mode_within" IS 'primary key of AssignAssignmentInputModeWithin';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_pk_yr4pki7m7t" ON "slice"."assign_assignment_input_near" IS 'primary key of AssignAssignmentInputNear';

COMMENT ON CONSTRAINT "__assign_claim_pk_gy4yhzk2me" ON "slice"."assign_claim" IS 'primary key of AssignClaim';

COMMENT ON CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" ON "slice"."assign_decide_input" IS 'primary key of AssignDecideInput';

COMMENT ON CONSTRAINT "__assign_decide_input_norm_vector_it3heqzuab" ON "slice"."assign_decide_input" IS 'cosine norm check of AssignDecideInput.vector';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" ON "slice"."assign_decide_input_exclude" IS 'primary key of AssignDecideInputExclude';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" ON "slice"."assign_decide_input_mode_nearest" IS 'primary key of AssignDecideInputModeNearest';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" ON "slice"."assign_decide_input_mode_within" IS 'primary key of AssignDecideInputModeWithin';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss" ON "slice"."assign_decide_nearest_read" IS 'primary key of AssignDecideNearestRead';

COMMENT ON CONSTRAINT "__assign_decide_nearest_row_pk_6muanewnph" ON "slice"."assign_decide_nearest_row" IS 'primary key of AssignDecideNearestRow';

COMMENT ON CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" ON "slice"."assign_decide_output" IS 'primary key of AssignDecideOutput';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" ON "slice"."assign_decide_output_stage_rest" IS 'primary key of AssignDecideOutputStageRest';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" ON "slice"."assign_decide_output_stage_serve" IS 'primary key of AssignDecideOutputStageServe';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" ON "slice"."assign_decide_output_weighed" IS 'primary key of AssignDecideOutputWeighed';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7" ON "slice"."assign_decide_seen_read" IS 'primary key of AssignDecideSeenRead';

COMMENT ON CONSTRAINT "__assign_decide_seen_row_pk_lwsmcq6igk" ON "slice"."assign_decide_seen_row" IS 'primary key of AssignDecideSeenRow';

COMMENT ON CONSTRAINT "__assign_done_pk_gzil7jvxpz" ON "slice"."assign_done" IS 'primary key of AssignDone';

COMMENT ON CONSTRAINT "__assign_embed_input_pk_q4ezcfvwia" ON "slice"."assign_embed_input" IS 'primary key of AssignEmbedInput';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_pk_5bklowmkgt" ON "slice"."assign_embed_input_exclude" IS 'primary key of AssignEmbedInputExclude';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_pk_wiskd5j54m" ON "slice"."assign_embed_input_mode_nearest" IS 'primary key of AssignEmbedInputModeNearest';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_pk_zldmxccjlo" ON "slice"."assign_embed_input_mode_within" IS 'primary key of AssignEmbedInputModeWithin';

COMMENT ON CONSTRAINT "__assign_embed_input_near_pk_bkusmda72a" ON "slice"."assign_embed_input_near" IS 'primary key of AssignEmbedInputNear';

COMMENT ON CONSTRAINT "__assign_embed_output_pk_noiv3qgtry" ON "slice"."assign_embed_output" IS 'primary key of AssignEmbedOutput';

COMMENT ON CONSTRAINT "__assign_embed_output_norm_vector_yuy6gaplly" ON "slice"."assign_embed_output" IS 'cosine norm check of AssignEmbedOutput.vector';

COMMENT ON CONSTRAINT "__assign_ended_pk_nriwwbcneu" ON "slice"."assign_ended" IS 'primary key of AssignEnded';

COMMENT ON CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" ON "slice"."assign_exhausted" IS 'primary key of AssignExhausted';

COMMENT ON CONSTRAINT "__assign_failed_pk_ygxslcya4o" ON "slice"."assign_failed" IS 'primary key of AssignFailed';

COMMENT ON CONSTRAINT "__assign_fenced_pk_y6jyfviepa" ON "slice"."assign_fenced" IS 'primary key of AssignFenced';

COMMENT ON CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" ON "slice"."assign_finish" IS 'primary key of AssignFinish';

COMMENT ON CONSTRAINT "__assign_finish_key_step_root_4woj5zibbd" ON "slice"."assign_finish" IS 'key AssignFinish(step, root)';

COMMENT ON CONSTRAINT "__assign_held_pk_by245z7t45" ON "slice"."assign_held" IS 'primary key of AssignHeld';

COMMENT ON CONSTRAINT "__assign_paused_pk_ulo4grv4e2" ON "slice"."assign_paused" IS 'primary key of AssignPaused';

COMMENT ON CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" ON "slice"."assign_refusal" IS 'primary key of AssignRefusal';

COMMENT ON CONSTRAINT "__assign_result_pk_i2yxmpkyzr" ON "slice"."assign_result" IS 'primary key of AssignResult';

COMMENT ON CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" ON "slice"."assign_resumed" IS 'primary key of AssignResumed';

COMMENT ON CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" ON "slice"."assign_retry" IS 'primary key of AssignRetry';

COMMENT ON CONSTRAINT "__assign_root_pk_b23qqyryx4" ON "slice"."assign_root" IS 'primary key of AssignRoot';

COMMENT ON CONSTRAINT "__assign_scope_pk_xytntbncid" ON "slice"."assign_scope" IS 'primary key of AssignScope';

COMMENT ON CONSTRAINT "__assign_skipped_pk_5qhgbueof7" ON "slice"."assign_skipped" IS 'primary key of AssignSkipped';

COMMENT ON CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" ON "slice"."assign_start_step" IS 'primary key of AssignStartStep';

COMMENT ON CONSTRAINT "__assign_start_step_key_step_root_k27j2tutjj" ON "slice"."assign_start_step" IS 'key AssignStartStep(step, root)';

COMMENT ON CONSTRAINT "__assign_step_pk_2oc4ehvfzd" ON "slice"."assign_step" IS 'primary key of AssignStep';

COMMENT ON CONSTRAINT "__assigned_pk_72xowecbf7" ON "slice"."assigned" IS 'primary key of Assigned';

COMMENT ON CONSTRAINT "__audit_pk_dcvpvv5cjz" ON "slice"."audit" IS 'primary key of Audit';

COMMENT ON CONSTRAINT "__built_pk_5tj25hcq6k" ON "slice"."built" IS 'primary key of Built';

COMMENT ON CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" ON "slice"."chain_admitted" IS 'primary key of ChainAdmitted';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_pk_hj22ebjnf7" ON "slice"."chain_chain_run_finish_output" IS 'primary key of ChainChainRunFinishOutput';

COMMENT ON CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" ON "slice"."chain_chain_run_input" IS 'primary key of ChainChainRunInput';

COMMENT ON CONSTRAINT "__chain_claim_pk_nrr2rn3gui" ON "slice"."chain_claim" IS 'primary key of ChainClaim';

COMMENT ON CONSTRAINT "__chain_done_pk_tyyx2hmu3r" ON "slice"."chain_done" IS 'primary key of ChainDone';

COMMENT ON CONSTRAINT "__chain_ended_pk_wusc7vjjx6" ON "slice"."chain_ended" IS 'primary key of ChainEnded';

COMMENT ON CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" ON "slice"."chain_exhausted" IS 'primary key of ChainExhausted';

COMMENT ON CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" ON "slice"."chain_failed" IS 'primary key of ChainFailed';

COMMENT ON CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" ON "slice"."chain_fenced" IS 'primary key of ChainFenced';

COMMENT ON CONSTRAINT "__chain_finish_pk_ebe75jmnzy" ON "slice"."chain_finish" IS 'primary key of ChainFinish';

COMMENT ON CONSTRAINT "__chain_finish_key_step_root_5aj26igjty" ON "slice"."chain_finish" IS 'key ChainFinish(step, root)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_pk_qeumlilvtk" ON "slice"."chain_next" IS 'primary key of ChainNext';

COMMENT ON CONSTRAINT "__chain_next_key_to_root_qxqaughmvp" ON "slice"."chain_next" IS 'key ChainNext(to, root)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_pk_t5k5pqxfdo" ON "slice"."chain_ordered_finish_output" IS 'primary key of ChainOrderedFinishOutput';

COMMENT ON CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" ON "slice"."chain_ordered_input" IS 'primary key of ChainOrderedInput';

COMMENT ON CONSTRAINT "__chain_page_earlier_read_pk_y5utsccddc" ON "slice"."chain_page_earlier_read" IS 'primary key of ChainPageEarlierRead';

COMMENT ON CONSTRAINT "__chain_page_earlier_row_pk_itz6dseape" ON "slice"."chain_page_earlier_row" IS 'primary key of ChainPageEarlierRow';

COMMENT ON CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" ON "slice"."chain_page_input" IS 'primary key of ChainPageInput';

COMMENT ON CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" ON "slice"."chain_page_input_after" IS 'primary key of ChainPageInputAfter';

COMMENT ON CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" ON "slice"."chain_page_output" IS 'primary key of ChainPageOutput';

COMMENT ON CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" ON "slice"."chain_page_output_next" IS 'primary key of ChainPageOutputNext';

COMMENT ON CONSTRAINT "__chain_page_tree_first_pk_zmjcrvbs5g" ON "slice"."chain_page_tree_first" IS 'primary key of ChainPageTreeFirst';

COMMENT ON CONSTRAINT "__chain_page_tree_items_pk_nexmib4mim" ON "slice"."chain_page_tree_items" IS 'primary key of ChainPageTreeItems';

COMMENT ON CONSTRAINT "__chain_page_tree_read_pk_mwu5hv6p26" ON "slice"."chain_page_tree_read" IS 'primary key of ChainPageTreeRead';

COMMENT ON CONSTRAINT "__chain_page_tree_row_pk_zydwodr3pp" ON "slice"."chain_page_tree_row" IS 'primary key of ChainPageTreeRow';

COMMENT ON CONSTRAINT "__chain_page_weights_read_pk_mvr5jc4gry" ON "slice"."chain_page_weights_read" IS 'primary key of ChainPageWeightsRead';

COMMENT ON CONSTRAINT "__chain_page_weights_row_pk_qxdvvigywk" ON "slice"."chain_page_weights_row" IS 'primary key of ChainPageWeightsRow';

COMMENT ON CONSTRAINT "__chain_paused_pk_oorovhvyps" ON "slice"."chain_paused" IS 'primary key of ChainPaused';

COMMENT ON CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" ON "slice"."chain_refusal" IS 'primary key of ChainRefusal';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" ON "slice"."chain_resumed" IS 'primary key of ChainResumed';

COMMENT ON CONSTRAINT "__chain_retry_pk_522nodru3s" ON "slice"."chain_retry" IS 'primary key of ChainRetry';

COMMENT ON CONSTRAINT "__chain_root_pk_wqfycdg3x5" ON "slice"."chain_root" IS 'primary key of ChainRoot';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" ON "slice"."chain_skipped" IS 'primary key of ChainSkipped';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_step_root_sgonmabfyw" ON "slice"."chain_start_step" IS 'key ChainStartStep(step, root)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__chimed_pk_7p6ypuplhn" ON "slice"."chimed" IS 'primary key of Chimed';

COMMENT ON CONSTRAINT "__clock_admitted_pk_a7wwsyakra" ON "slice"."clock_admitted" IS 'primary key of ClockAdmitted';

COMMENT ON CONSTRAINT "__clock_chime_input_pk_rx6722hrpy" ON "slice"."clock_chime_input" IS 'primary key of ClockChimeInput';

COMMENT ON CONSTRAINT "__clock_chime_output_pk_aqm3k5vyxa" ON "slice"."clock_chime_output" IS 'primary key of ClockChimeOutput';

COMMENT ON CONSTRAINT "__clock_claim_pk_ihqmnokjqm" ON "slice"."clock_claim" IS 'primary key of ClockClaim';

COMMENT ON CONSTRAINT "__clock_close_input_pk_kzcush3qdx" ON "slice"."clock_close_input" IS 'primary key of ClockCloseInput';

COMMENT ON CONSTRAINT "__clock_close_output_pk_ckrp5oabyy" ON "slice"."clock_close_output" IS 'primary key of ClockCloseOutput';

COMMENT ON CONSTRAINT "__clock_done_pk_f4vl6frrax" ON "slice"."clock_done" IS 'primary key of ClockDone';

COMMENT ON CONSTRAINT "__clock_ended_pk_pqp6yh3qgg" ON "slice"."clock_ended" IS 'primary key of ClockEnded';

COMMENT ON CONSTRAINT "__clock_exhausted_pk_4m2tieyrky" ON "slice"."clock_exhausted" IS 'primary key of ClockExhausted';

COMMENT ON CONSTRAINT "__clock_failed_pk_6twuzcs6kf" ON "slice"."clock_failed" IS 'primary key of ClockFailed';

COMMENT ON CONSTRAINT "__clock_fenced_pk_mzppv2rrab" ON "slice"."clock_fenced" IS 'primary key of ClockFenced';

COMMENT ON CONSTRAINT "__clock_finish_pk_eqj7fcnrnq" ON "slice"."clock_finish" IS 'primary key of ClockFinish';

COMMENT ON CONSTRAINT "__clock_finish_key_step_root_qqome46md2" ON "slice"."clock_finish" IS 'key ClockFinish(step, root)';

COMMENT ON CONSTRAINT "__clock_held_pk_qqxrvee2gy" ON "slice"."clock_held" IS 'primary key of ClockHeld';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_pk_6bcdc5q3dt" ON "slice"."clock_hourly_finish_output" IS 'primary key of ClockHourlyFinishOutput';

COMMENT ON CONSTRAINT "__clock_hourly_input_pk_s536mhvux3" ON "slice"."clock_hourly_input" IS 'primary key of ClockHourlyInput';

COMMENT ON CONSTRAINT "__clock_paused_pk_fsld2lekav" ON "slice"."clock_paused" IS 'primary key of ClockPaused';

COMMENT ON CONSTRAINT "__clock_refusal_pk_dslb6cgxa3" ON "slice"."clock_refusal" IS 'primary key of ClockRefusal';

COMMENT ON CONSTRAINT "__clock_result_pk_yptcdjm6pu" ON "slice"."clock_result" IS 'primary key of ClockResult';

COMMENT ON CONSTRAINT "__clock_resumed_pk_iqjwv5tioc" ON "slice"."clock_resumed" IS 'primary key of ClockResumed';

COMMENT ON CONSTRAINT "__clock_retry_pk_4kyiqeoeqd" ON "slice"."clock_retry" IS 'primary key of ClockRetry';

COMMENT ON CONSTRAINT "__clock_root_pk_rnmiw3efr2" ON "slice"."clock_root" IS 'primary key of ClockRoot';

COMMENT ON CONSTRAINT "__clock_scope_pk_dux445xz6c" ON "slice"."clock_scope" IS 'primary key of ClockScope';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_pk_pejmuwtji5" ON "slice"."clock_sitting_finish_output" IS 'primary key of ClockSittingFinishOutput';

COMMENT ON CONSTRAINT "__clock_sitting_input_pk_le4qxvpabo" ON "slice"."clock_sitting_input" IS 'primary key of ClockSittingInput';

COMMENT ON CONSTRAINT "__clock_skipped_pk_2whj2jo6zo" ON "slice"."clock_skipped" IS 'primary key of ClockSkipped';

COMMENT ON CONSTRAINT "__clock_start_step_pk_qgw6bnuo54" ON "slice"."clock_start_step" IS 'primary key of ClockStartStep';

COMMENT ON CONSTRAINT "__clock_start_step_key_step_root_oseon2uqng" ON "slice"."clock_start_step" IS 'key ClockStartStep(step, root)';

COMMENT ON CONSTRAINT "__clock_step_pk_jjmk3diqpl" ON "slice"."clock_step" IS 'primary key of ClockStep';

COMMENT ON CONSTRAINT "__concluded_pk_b44jbktrki" ON "slice"."concluded" IS 'primary key of Concluded';

COMMENT ON CONSTRAINT "__copied_pk_6dsi4gohbu" ON "slice"."copied" IS 'primary key of Copied';

COMMENT ON CONSTRAINT "__cursor_pk_wl2ngqny4j" ON "slice"."cursor" IS 'primary key of Cursor';

COMMENT ON CONSTRAINT "__delivered_pk_xzukubt47t" ON "slice"."delivered" IS 'primary key of Delivered';

COMMENT ON CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" ON "slice"."fan_admitted" IS 'primary key of FanAdmitted';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_pk_mq5omzswqd" ON "slice"."fan_batch_finish_output" IS 'primary key of FanBatchFinishOutput';

COMMENT ON CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" ON "slice"."fan_batch_input" IS 'primary key of FanBatchInput';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_claim_key_step_root_attempt_holds_iqkydblyix" ON "slice"."fan_claim" IS 'key FanClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_done_pk_5u65252q52" ON "slice"."fan_done" IS 'primary key of FanDone';

COMMENT ON CONSTRAINT "__fan_dust_input_pk_xyleoykgmc" ON "slice"."fan_dust_input" IS 'primary key of FanDustInput';

COMMENT ON CONSTRAINT "__fan_dust_output_pk_3ve4gi5x6b" ON "slice"."fan_dust_output" IS 'primary key of FanDustOutput';

COMMENT ON CONSTRAINT "__fan_ended_pk_23aeteyyv7" ON "slice"."fan_ended" IS 'primary key of FanEnded';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_failed_pk_z4etp5dmax" ON "slice"."fan_failed" IS 'primary key of FanFailed';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_pk_rhhjregxru" ON "slice"."fan_fan_run_finish_output" IS 'primary key of FanFanRunFinishOutput';

COMMENT ON CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" ON "slice"."fan_fan_run_input" IS 'primary key of FanFanRunInput';

COMMENT ON CONSTRAINT "__fan_fenced_pk_6tkvirerez" ON "slice"."fan_fenced" IS 'primary key of FanFenced';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_step_root_xshxj2rwb2" ON "slice"."fan_finish" IS 'key FanFinish(step, root)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_hold_pk_avuqdkljvb" ON "slice"."fan_hold" IS 'primary key of FanHold';

COMMENT ON CONSTRAINT "__fan_mop_input_pk_jwnqekad76" ON "slice"."fan_mop_input" IS 'primary key of FanMopInput';

COMMENT ON CONSTRAINT "__fan_mop_output_pk_rcebyoc32v" ON "slice"."fan_mop_output" IS 'primary key of FanMopOutput';

COMMENT ON CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" ON "slice"."fan_paused" IS 'primary key of FanPaused';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" ON "slice"."fan_resumed" IS 'primary key of FanResumed';

COMMENT ON CONSTRAINT "__fan_retry_pk_7xubce4v66" ON "slice"."fan_retry" IS 'primary key of FanRetry';

COMMENT ON CONSTRAINT "__fan_root_pk_jesu7xtefn" ON "slice"."fan_root" IS 'primary key of FanRoot';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_skipped_pk_22erbmfzer" ON "slice"."fan_skipped" IS 'primary key of FanSkipped';

COMMENT ON CONSTRAINT "__fan_square_input_pk_uzumoizv53" ON "slice"."fan_square_input" IS 'primary key of FanSquareInput';

COMMENT ON CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" ON "slice"."fan_square_output" IS 'primary key of FanSquareOutput';

COMMENT ON CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" ON "slice"."fan_start_scope" IS 'primary key of FanStartScope';

COMMENT ON CONSTRAINT "__fan_start_scope_key_child_root_twylnvawre" ON "slice"."fan_start_scope" IS 'key FanStartScope(child, root)';

COMMENT ON CONSTRAINT "__fan_start_step_pk_7e247xk4mz" ON "slice"."fan_start_step" IS 'primary key of FanStartStep';

COMMENT ON CONSTRAINT "__fan_start_step_key_step_root_h32wwrpq3c" ON "slice"."fan_start_step" IS 'key FanStartStep(step, root)';

COMMENT ON CONSTRAINT "__fan_step_pk_2f4tcxnofk" ON "slice"."fan_step" IS 'primary key of FanStep';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_pk_7dvx2ngckn" ON "slice"."fan_sweep_finish_output" IS 'primary key of FanSweepFinishOutput';

COMMENT ON CONSTRAINT "__fan_sweep_input_pk_zzlgjjqr6f" ON "slice"."fan_sweep_input" IS 'primary key of FanSweepInput';

COMMENT ON CONSTRAINT "__fan_within_pk_g5tswgjfa6" ON "slice"."fan_within" IS 'primary key of FanWithin';

COMMENT ON CONSTRAINT "__heard_pk_sdu7ysinks" ON "slice"."heard" IS 'primary key of Heard';

COMMENT ON CONSTRAINT "__item_pk_ai4obgmq4k" ON "slice"."item" IS 'primary key of Item';

COMMENT ON CONSTRAINT "__order_pk_qodq3est7o" ON "slice"."order" IS 'primary key of Order';

COMMENT ON CONSTRAINT "__passage_pk_kayjlxd3gv" ON "slice"."passage" IS 'primary key of Passage';

COMMENT ON CONSTRAINT "__passage_norm_embedding_d2siyt575a" ON "slice"."passage" IS 'cosine norm check of Passage.embedding';

COMMENT ON CONSTRAINT "__retry_admitted_pk_qyp7cminjx" ON "slice"."retry_admitted" IS 'primary key of RetryAdmitted';

COMMENT ON CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" ON "slice"."retry_brittle_input" IS 'primary key of RetryBrittleInput';

COMMENT ON CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" ON "slice"."retry_brittle_output" IS 'primary key of RetryBrittleOutput';

COMMENT ON CONSTRAINT "__retry_claim_pk_aayzt5ni6z" ON "slice"."retry_claim" IS 'primary key of RetryClaim';

COMMENT ON CONSTRAINT "__retry_done_pk_vtkpce7rkq" ON "slice"."retry_done" IS 'primary key of RetryDone';

COMMENT ON CONSTRAINT "__retry_ended_pk_hq35r7u2t2" ON "slice"."retry_ended" IS 'primary key of RetryEnded';

COMMENT ON CONSTRAINT "__retry_exhausted_pk_v56c23krid" ON "slice"."retry_exhausted" IS 'primary key of RetryExhausted';

COMMENT ON CONSTRAINT "__retry_failed_pk_mygc4onczp" ON "slice"."retry_failed" IS 'primary key of RetryFailed';

COMMENT ON CONSTRAINT "__retry_fenced_pk_umzicmiruo" ON "slice"."retry_fenced" IS 'primary key of RetryFenced';

COMMENT ON CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" ON "slice"."retry_finish" IS 'primary key of RetryFinish';

COMMENT ON CONSTRAINT "__retry_finish_key_step_root_a7vhiwagne" ON "slice"."retry_finish" IS 'key RetryFinish(step, root)';

COMMENT ON CONSTRAINT "__retry_held_pk_nvgeylmjp2" ON "slice"."retry_held" IS 'primary key of RetryHeld';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_pk_5352zkn7xu" ON "slice"."retry_ladders_finish_output" IS 'primary key of RetryLaddersFinishOutput';

COMMENT ON CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" ON "slice"."retry_ladders_input" IS 'primary key of RetryLaddersInput';

COMMENT ON CONSTRAINT "__retry_patient_input_pk_74247zb7wo" ON "slice"."retry_patient_input" IS 'primary key of RetryPatientInput';

COMMENT ON CONSTRAINT "__retry_patient_output_pk_whtgus732k" ON "slice"."retry_patient_output" IS 'primary key of RetryPatientOutput';

COMMENT ON CONSTRAINT "__retry_paused_pk_umm2nscqny" ON "slice"."retry_paused" IS 'primary key of RetryPaused';

COMMENT ON CONSTRAINT "__retry_polite_input_pk_ptzd72dxff" ON "slice"."retry_polite_input" IS 'primary key of RetryPoliteInput';

COMMENT ON CONSTRAINT "__retry_polite_output_pk_2kuwfluplv" ON "slice"."retry_polite_output" IS 'primary key of RetryPoliteOutput';

COMMENT ON CONSTRAINT "__retry_refusal_pk_nifndsd6pp" ON "slice"."retry_refusal" IS 'primary key of RetryRefusal';

COMMENT ON CONSTRAINT "__retry_result_pk_5fegihvmml" ON "slice"."retry_result" IS 'primary key of RetryResult';

COMMENT ON CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" ON "slice"."retry_resumed" IS 'primary key of RetryResumed';

COMMENT ON CONSTRAINT "__retry_retry_pk_slrwn4rt5d" ON "slice"."retry_retry" IS 'primary key of RetryRetry';

COMMENT ON CONSTRAINT "__retry_root_pk_qi2iw36jky" ON "slice"."retry_root" IS 'primary key of RetryRoot';

COMMENT ON CONSTRAINT "__retry_scope_pk_fgji2phvxy" ON "slice"."retry_scope" IS 'primary key of RetryScope';

COMMENT ON CONSTRAINT "__retry_skipped_pk_au5z33ql7a" ON "slice"."retry_skipped" IS 'primary key of RetrySkipped';

COMMENT ON CONSTRAINT "__retry_start_step_pk_mp77csmi26" ON "slice"."retry_start_step" IS 'primary key of RetryStartStep';

COMMENT ON CONSTRAINT "__retry_start_step_key_step_root_fudt2vk7zs" ON "slice"."retry_start_step" IS 'key RetryStartStep(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" ON "slice"."retry_steadfast_input" IS 'primary key of RetrySteadfastInput';

COMMENT ON CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" ON "slice"."retry_steadfast_output" IS 'primary key of RetrySteadfastOutput';

COMMENT ON CONSTRAINT "__retry_step_pk_opjqidwhzg" ON "slice"."retry_step" IS 'primary key of RetryStep';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_pk_o6epepnuox" ON "slice"."retry_throttled_finish_output" IS 'primary key of RetryThrottledFinishOutput';

COMMENT ON CONSTRAINT "__retry_throttled_input_pk_zv264azw4s" ON "slice"."retry_throttled_input" IS 'primary key of RetryThrottledInput';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_pk_d5mmuqfkuq" ON "slice"."retry_unhurried_finish_output" IS 'primary key of RetryUnhurriedFinishOutput';

COMMENT ON CONSTRAINT "__retry_unhurried_input_pk_g5dkiedexm" ON "slice"."retry_unhurried_input" IS 'primary key of RetryUnhurriedInput';

COMMENT ON CONSTRAINT "__review_admitted_pk_woy7ee4y4p" ON "slice"."review_admitted" IS 'primary key of ReviewAdmitted';

COMMENT ON CONSTRAINT "__review_analyze_input_pk_jr7qmhqwgi" ON "slice"."review_analyze_input" IS 'primary key of ReviewAnalyzeInput';

COMMENT ON CONSTRAINT "__review_analyze_output_pk_35aclxnkmb" ON "slice"."review_analyze_output" IS 'primary key of ReviewAnalyzeOutput';

COMMENT ON CONSTRAINT "__review_claim_pk_twa72qaol7" ON "slice"."review_claim" IS 'primary key of ReviewClaim';

COMMENT ON CONSTRAINT "__review_claim_key_step_root_attempt_holds_25ppgtp6nm" ON "slice"."review_claim" IS 'key ReviewClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__review_done_pk_ve6inioidy" ON "slice"."review_done" IS 'primary key of ReviewDone';

COMMENT ON CONSTRAINT "__review_ended_pk_2hihcuxln2" ON "slice"."review_ended" IS 'primary key of ReviewEnded';

COMMENT ON CONSTRAINT "__review_exhausted_pk_5bmktauwd3" ON "slice"."review_exhausted" IS 'primary key of ReviewExhausted';

COMMENT ON CONSTRAINT "__review_failed_pk_7iszsjaybr" ON "slice"."review_failed" IS 'primary key of ReviewFailed';

COMMENT ON CONSTRAINT "__review_fenced_pk_chaexdbnzu" ON "slice"."review_fenced" IS 'primary key of ReviewFenced';

COMMENT ON CONSTRAINT "__review_finish_pk_ovczbakxjz" ON "slice"."review_finish" IS 'primary key of ReviewFinish';

COMMENT ON CONSTRAINT "__review_finish_key_step_root_tcsouam46b" ON "slice"."review_finish" IS 'key ReviewFinish(step, root)';

COMMENT ON CONSTRAINT "__review_gather_input_pk_rllaxtocmq" ON "slice"."review_gather_input" IS 'primary key of ReviewGatherInput';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_pk_w5cgw65wpx" ON "slice"."review_gather_input_sizes" IS 'primary key of ReviewGatherInputSizes';

COMMENT ON CONSTRAINT "__review_gather_output_pk_fecesmjazj" ON "slice"."review_gather_output" IS 'primary key of ReviewGatherOutput';

COMMENT ON CONSTRAINT "__review_held_pk_cwyo7jovuu" ON "slice"."review_held" IS 'primary key of ReviewHeld';

COMMENT ON CONSTRAINT "__review_hold_pk_uhb6w3fp5v" ON "slice"."review_hold" IS 'primary key of ReviewHold';

COMMENT ON CONSTRAINT "__review_paused_pk_eamccblv6g" ON "slice"."review_paused" IS 'primary key of ReviewPaused';

COMMENT ON CONSTRAINT "__review_questions_finish_output_pk_36plo53gmb" ON "slice"."review_questions_finish_output" IS 'primary key of ReviewQuestionsFinishOutput';

COMMENT ON CONSTRAINT "__review_questions_input_pk_4d27veaz4g" ON "slice"."review_questions_input" IS 'primary key of ReviewQuestionsInput';

COMMENT ON CONSTRAINT "__review_refusal_pk_ajyglinn6r" ON "slice"."review_refusal" IS 'primary key of ReviewRefusal';

COMMENT ON CONSTRAINT "__review_result_pk_o5x5griurk" ON "slice"."review_result" IS 'primary key of ReviewResult';

COMMENT ON CONSTRAINT "__review_resumed_pk_jqgqbkvl65" ON "slice"."review_resumed" IS 'primary key of ReviewResumed';

COMMENT ON CONSTRAINT "__review_retry_pk_is3m5sa5tx" ON "slice"."review_retry" IS 'primary key of ReviewRetry';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_pk_qwfb4ycp7r" ON "slice"."review_review_run_finish_output" IS 'primary key of ReviewReviewRunFinishOutput';

COMMENT ON CONSTRAINT "__review_review_run_input_pk_7ommryhd6b" ON "slice"."review_review_run_input" IS 'primary key of ReviewReviewRunInput';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_pk_bguaae726h" ON "slice"."review_review_run_input_sizes" IS 'primary key of ReviewReviewRunInputSizes';

COMMENT ON CONSTRAINT "__review_root_pk_btvrw2kxvs" ON "slice"."review_root" IS 'primary key of ReviewRoot';

COMMENT ON CONSTRAINT "__review_save_input_pk_iaqr5cg2c2" ON "slice"."review_save_input" IS 'primary key of ReviewSaveInput';

COMMENT ON CONSTRAINT "__review_save_output_pk_usbddkytv7" ON "slice"."review_save_output" IS 'primary key of ReviewSaveOutput';

COMMENT ON CONSTRAINT "__review_saved_pk_mrkz2ovxcx" ON "slice"."review_saved" IS 'primary key of ReviewSaved';

COMMENT ON CONSTRAINT "__review_saved_key_to_root_ah3zbczbbn" ON "slice"."review_saved" IS 'key ReviewSaved(to, root)';

COMMENT ON CONSTRAINT "__review_scope_pk_grsivyyp7b" ON "slice"."review_scope" IS 'primary key of ReviewScope';

COMMENT ON CONSTRAINT "__review_skipped_pk_ymsn25w74u" ON "slice"."review_skipped" IS 'primary key of ReviewSkipped';

COMMENT ON CONSTRAINT "__review_split_pk_im65kbvnho" ON "slice"."review_split" IS 'primary key of ReviewSplit';

COMMENT ON CONSTRAINT "__review_split_key_to_root_d3l6kwiq3j" ON "slice"."review_split" IS 'key ReviewSplit(to, root)';

COMMENT ON CONSTRAINT "__review_start_scope_pk_qlm2r5uhqp" ON "slice"."review_start_scope" IS 'primary key of ReviewStartScope';

COMMENT ON CONSTRAINT "__review_start_scope_key_child_root_vwlxhagth3" ON "slice"."review_start_scope" IS 'key ReviewStartScope(child, root)';

COMMENT ON CONSTRAINT "__review_start_step_pk_w5suwqqg4p" ON "slice"."review_start_step" IS 'primary key of ReviewStartStep';

COMMENT ON CONSTRAINT "__review_start_step_key_step_root_lnw5ylpuoc" ON "slice"."review_start_step" IS 'key ReviewStartStep(step, root)';

COMMENT ON CONSTRAINT "__review_step_pk_gfbmnzqbc3" ON "slice"."review_step" IS 'primary key of ReviewStep';

COMMENT ON CONSTRAINT "__review_within_pk_ohgogpkz4s" ON "slice"."review_within" IS 'primary key of ReviewWithin';

COMMENT ON CONSTRAINT "__reviewed_pk_z3sm6wzse2" ON "slice"."reviewed" IS 'primary key of Reviewed';

COMMENT ON CONSTRAINT "__seen_pk_g4ptcxwowb" ON "slice"."seen" IS 'primary key of Seen';

COMMENT ON CONSTRAINT "__settled_pk_yitdz6z3ts" ON "slice"."settled" IS 'primary key of Settled';

COMMENT ON CONSTRAINT "__summary_pk_rpajkerfah" ON "slice"."summary" IS 'primary key of Summary';

COMMENT ON CONSTRAINT "__sync_admitted_pk_ral53o3fpi" ON "slice"."sync_admitted" IS 'primary key of SyncAdmitted';

COMMENT ON CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" ON "slice"."sync_build_input" IS 'primary key of SyncBuildInput';

COMMENT ON CONSTRAINT "__sync_build_output_pk_rhnco3epch" ON "slice"."sync_build_output" IS 'primary key of SyncBuildOutput';

COMMENT ON CONSTRAINT "__sync_claim_pk_s2tqnziq4u" ON "slice"."sync_claim" IS 'primary key of SyncClaim';

COMMENT ON CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" ON "slice"."sync_copy_input" IS 'primary key of SyncCopyInput';

COMMENT ON CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" ON "slice"."sync_copy_output" IS 'primary key of SyncCopyOutput';

COMMENT ON CONSTRAINT "__sync_done_pk_nllomjb7og" ON "slice"."sync_done" IS 'primary key of SyncDone';

COMMENT ON CONSTRAINT "__sync_ended_pk_uxijjz7koz" ON "slice"."sync_ended" IS 'primary key of SyncEnded';

COMMENT ON CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" ON "slice"."sync_exclusive" IS 'primary key of SyncExclusive';

COMMENT ON CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" ON "slice"."sync_exclusive_key" IS 'primary key of SyncExclusiveKey';

COMMENT ON CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" ON "slice"."sync_exhausted" IS 'primary key of SyncExhausted';

COMMENT ON CONSTRAINT "__sync_failed_pk_gqykngewxb" ON "slice"."sync_failed" IS 'primary key of SyncFailed';

COMMENT ON CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" ON "slice"."sync_fenced" IS 'primary key of SyncFenced';

COMMENT ON CONSTRAINT "__sync_finish_pk_hn7tmx25xc" ON "slice"."sync_finish" IS 'primary key of SyncFinish';

COMMENT ON CONSTRAINT "__sync_finish_key_step_root_kpt2idultt" ON "slice"."sync_finish" IS 'key SyncFinish(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_pk_3z5gemduto" ON "slice"."sync_gold_finish_output" IS 'primary key of SyncGoldFinishOutput';

COMMENT ON CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" ON "slice"."sync_gold_input" IS 'primary key of SyncGoldInput';

COMMENT ON CONSTRAINT "__sync_held_pk_wsme4moka4" ON "slice"."sync_held" IS 'primary key of SyncHeld';

COMMENT ON CONSTRAINT "__sync_paused_pk_tstk2okngj" ON "slice"."sync_paused" IS 'primary key of SyncPaused';

COMMENT ON CONSTRAINT "__sync_refusal_pk_mbmfornc5c" ON "slice"."sync_refusal" IS 'primary key of SyncRefusal';

COMMENT ON CONSTRAINT "__sync_released_pk_k7qaw2iram" ON "slice"."sync_released" IS 'primary key of SyncReleased';

COMMENT ON CONSTRAINT "__sync_result_pk_jmwy2p3mqf" ON "slice"."sync_result" IS 'primary key of SyncResult';

COMMENT ON CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" ON "slice"."sync_resumed" IS 'primary key of SyncResumed';

COMMENT ON CONSTRAINT "__sync_retry_pk_6q52red7iw" ON "slice"."sync_retry" IS 'primary key of SyncRetry';

COMMENT ON CONSTRAINT "__sync_root_pk_daktpubfe2" ON "slice"."sync_root" IS 'primary key of SyncRoot';

COMMENT ON CONSTRAINT "__sync_scope_pk_bg72sm6p4z" ON "slice"."sync_scope" IS 'primary key of SyncScope';

COMMENT ON CONSTRAINT "__sync_skipped_pk_yutjqacvws" ON "slice"."sync_skipped" IS 'primary key of SyncSkipped';

COMMENT ON CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" ON "slice"."sync_start_step" IS 'primary key of SyncStartStep';

COMMENT ON CONSTRAINT "__sync_start_step_key_step_root_rkceslwobo" ON "slice"."sync_start_step" IS 'key SyncStartStep(step, root)';

COMMENT ON CONSTRAINT "__sync_step_pk_wfgcxdvbwo" ON "slice"."sync_step" IS 'primary key of SyncStep';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_pk_n74f63qvg6" ON "slice"."sync_sync_run_finish_output" IS 'primary key of SyncSyncRunFinishOutput';

COMMENT ON CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" ON "slice"."sync_sync_run_input" IS 'primary key of SyncSyncRunInput';

COMMENT ON CONSTRAINT "__tally_pk_7jc66uxxx4" ON "slice"."tally" IS 'primary key of Tally';

COMMENT ON CONSTRAINT "__weight_pk_p77rl634io" ON "slice"."weight" IS 'primary key of Weight';

COMMENT ON CONSTRAINT "__writeback_admitted_pk_eplj3gsbzy" ON "slice"."writeback_admitted" IS 'primary key of WritebackAdmitted';

COMMENT ON CONSTRAINT "__writeback_claim_pk_j7bglnjq7b" ON "slice"."writeback_claim" IS 'primary key of WritebackClaim';

COMMENT ON CONSTRAINT "__writeback_deliver_input_pk_i7vk7dq3eb" ON "slice"."writeback_deliver_input" IS 'primary key of WritebackDeliverInput';

COMMENT ON CONSTRAINT "__writeback_deliver_output_pk_jkhggp3cer" ON "slice"."writeback_deliver_output" IS 'primary key of WritebackDeliverOutput';

COMMENT ON CONSTRAINT "__writeback_done_pk_x32l3wxb3c" ON "slice"."writeback_done" IS 'primary key of WritebackDone';

COMMENT ON CONSTRAINT "__writeback_ended_pk_atnezxtfz6" ON "slice"."writeback_ended" IS 'primary key of WritebackEnded';

COMMENT ON CONSTRAINT "__writeback_exhausted_pk_sqddw6eedo" ON "slice"."writeback_exhausted" IS 'primary key of WritebackExhausted';

COMMENT ON CONSTRAINT "__writeback_failed_pk_g4uud6r5kb" ON "slice"."writeback_failed" IS 'primary key of WritebackFailed';

COMMENT ON CONSTRAINT "__writeback_fenced_pk_exblcoemag" ON "slice"."writeback_fenced" IS 'primary key of WritebackFenced';

COMMENT ON CONSTRAINT "__writeback_finish_pk_htcvidwpy6" ON "slice"."writeback_finish" IS 'primary key of WritebackFinish';

COMMENT ON CONSTRAINT "__writeback_finish_key_step_root_cz7xuvvbbm" ON "slice"."writeback_finish" IS 'key WritebackFinish(step, root)';

COMMENT ON CONSTRAINT "__writeback_held_pk_5tktjcet5w" ON "slice"."writeback_held" IS 'primary key of WritebackHeld';

COMMENT ON CONSTRAINT "__writeback_paused_pk_ncs2aff76t" ON "slice"."writeback_paused" IS 'primary key of WritebackPaused';

COMMENT ON CONSTRAINT "__writeback_refusal_pk_lqictdn67w" ON "slice"."writeback_refusal" IS 'primary key of WritebackRefusal';

COMMENT ON CONSTRAINT "__writeback_result_pk_lygppaax77" ON "slice"."writeback_result" IS 'primary key of WritebackResult';

COMMENT ON CONSTRAINT "__writeback_resumed_pk_qrrua45xou" ON "slice"."writeback_resumed" IS 'primary key of WritebackResumed';

COMMENT ON CONSTRAINT "__writeback_retry_pk_j2ien3obty" ON "slice"."writeback_retry" IS 'primary key of WritebackRetry';

COMMENT ON CONSTRAINT "__writeback_root_pk_a5puwyrem6" ON "slice"."writeback_root" IS 'primary key of WritebackRoot';

COMMENT ON CONSTRAINT "__writeback_scope_pk_aywjorzcsy" ON "slice"."writeback_scope" IS 'primary key of WritebackScope';

COMMENT ON CONSTRAINT "__writeback_skipped_pk_3pijvusl26" ON "slice"."writeback_skipped" IS 'primary key of WritebackSkipped';

COMMENT ON CONSTRAINT "__writeback_start_step_pk_sp7hkcjz7m" ON "slice"."writeback_start_step" IS 'primary key of WritebackStartStep';

COMMENT ON CONSTRAINT "__writeback_start_step_key_step_root_dqjb67a3dj" ON "slice"."writeback_start_step" IS 'key WritebackStartStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_step_pk_xsrl5j4mlf" ON "slice"."writeback_step" IS 'primary key of WritebackStep';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_pk_payvcqalt7" ON "slice"."writeback_writeback_finish_output" IS 'primary key of WritebackWritebackFinishOutput';

COMMENT ON CONSTRAINT "__writeback_writeback_input_pk_ejs235aju2" ON "slice"."writeback_writeback_input" IS 'primary key of WritebackWritebackInput';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__scope_u6ypqf2r2z" IS 'scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."assign_assignment_input_near"."__scope_u6ypqf2r2z" IS 'scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_near"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."assign_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."assign_embed_input_exclude"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_embed_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."assign_embed_input_near"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_embed_input_near"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."assign_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."assign_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."chain_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."chain_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."chain_page_tree_items"."__digest_eiwkcq6olq" IS 'digest where {"kind":"compare","left":{"field":"items","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."chain_page_tree_items"."__pred_items_3qltx5cx27" IS 'pred(items)';

COMMENT ON COLUMN "slice"."chain_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."chain_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."clock_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."clock_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."clock_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."clock_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."fan_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."fan_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."fan_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice"."fan_hold"."__copy_holds_c6hi2i2kfb" IS 'the owner''s count of the family FanClaim.holds';

COMMENT ON COLUMN "slice"."fan_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice"."fan_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."fan_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."retry_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."retry_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."retry_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."retry_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."review_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."review_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."review_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice"."review_gather_input_sizes"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."review_gather_input_sizes"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."review_hold"."__copy_holds_j7qe5qdydj" IS 'the owner''s count of the family ReviewClaim.holds';

COMMENT ON COLUMN "slice"."review_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice"."review_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."review_review_run_input_sizes"."__scope_u6ypqf2r2z" IS 'scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."review_review_run_input_sizes"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice"."review_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."sync_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."sync_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."sync_exclusive"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."sync_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."sync_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON COLUMN "slice"."writeback_claim"."__step_ouvkclqzzd" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."writeback_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice"."writeback_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice"."writeback_root"."__scope_jdl7uajdrr" IS 'scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}}';

COMMENT ON CONSTRAINT "__assign_root_key_scope_77r36z7vhn" ON "slice"."assign_root" IS 'key AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_root_key_scope_prbadyie6j" ON "slice"."chain_root" IS 'key ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_root_key_scope_cpqrcv6qzu" ON "slice"."clock_root" IS 'key ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_hold_key_step_root_attempt_pred_at_kgbxki2ddu" ON "slice"."fan_hold" IS 'key FanHold(step, root, attempt, pred(at))';

COMMENT ON CONSTRAINT "__fan_root_key_scope_i3qel4nyj5" ON "slice"."fan_root" IS 'key FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_root_key_scope_yc7em5k35u" ON "slice"."retry_root" IS 'key RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_hold_key_step_root_attempt_pred_at_kuzm5unl2b" ON "slice"."review_hold" IS 'key ReviewHold(step, root, attempt, pred(at))';

COMMENT ON CONSTRAINT "__review_root_key_scope_db6eo7ifjm" ON "slice"."review_root" IS 'key ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_root_key_scope_lxj4sb3mcx" ON "slice"."sync_root" IS 'key SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_root_key_scope_epb6awnxkj" ON "slice"."writeback_root" IS 'key WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_bb3ww7vxet" ON "slice"."fan_hold" IS 'check of FanHold for law ordered FanHold(step, root, attempt, at) in fin(FanClaim, holds)';

COMMENT ON CONSTRAINT "__review_hold_check_review_hold_ordered_review_claim_2wbcergshn" ON "slice"."review_hold" IS 'check of ReviewHold for law ordered ReviewHold(step, root, attempt, at) in fin(ReviewClaim, holds)';

COMMENT ON CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf" ON "slice"."assign_admitted" IS 'foreign key AssignAdmitted(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd" ON "slice"."assign_admitted" IS 'foreign key AssignAdmitted(scope, root) to AssignScope(scope, root)';

COMMENT ON CONSTRAINT "__assign_asked_fk_from_root_jbwoju3nkb" ON "slice"."assign_asked" IS 'foreign key AssignAsked(from, root) to AssignEmbedOutput(step, root)';

COMMENT ON CONSTRAINT "__assign_asked_fk_root_zheeongpsu" ON "slice"."assign_asked" IS 'foreign key AssignAsked(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_asked_fk_to_root_kg4yqbs5ps" ON "slice"."assign_asked" IS 'foreign key AssignAsked(to, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_fk_root_cxywb372kl" ON "slice"."assign_assignment_finish_output" IS 'foreign key AssignAssignmentFinishOutput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_fk_step_root_btb6cwfo73" ON "slice"."assign_assignment_finish_output" IS 'foreign key AssignAssignmentFinishOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope, root) to AssignAssignmentInput(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_yyclsqsijg" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to AssignAssignmentInputExclude(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv" ON "slice"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm" ON "slice"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_root_6cdqioe6mu" ON "slice"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_scope_root_lyuzgkqxtu" ON "slice"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(scope, root) to AssignAssignmentInput(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_scope_pred_ordinal_m5mnmsqnzk" ON "slice"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to AssignAssignmentInputNear(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_tccogfd3gj" ON "slice"."assign_claim" IS 'foreign key AssignClaim(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc" ON "slice"."assign_claim" IS 'foreign key AssignClaim(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_qq7m4vgq5c" ON "slice"."assign_claim" IS 'foreign key AssignClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to AssignEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_ud7okz5qbt" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to AssignDecideInputExclude(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd" ON "slice"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j" ON "slice"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_fk_digest_root_nabgfbbfiv" ON "slice"."assign_decide_nearest_read" IS 'foreign key AssignDecideNearestRead(digest, root) to AssignDecideNearestRow(digest, root)';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_fk_root_bofoevlhaq" ON "slice"."assign_decide_nearest_read" IS 'foreign key AssignDecideNearestRead(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_fk_step_root_bdcjrgm56g" ON "slice"."assign_decide_nearest_read" IS 'foreign key AssignDecideNearestRead(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_nearest_row_fk_root_uvtvvcuvan" ON "slice"."assign_decide_nearest_row" IS 'foreign key AssignDecideNearestRow(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs" ON "slice"."assign_decide_output_stage_rest" IS 'foreign key AssignDecideOutputStageRest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt" ON "slice"."assign_decide_output_stage_serve" IS 'foreign key AssignDecideOutputStageServe(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step, root) to AssignDecideOutput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_6nj2mzauma" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to AssignDecideOutputWeighed(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_fk_digest_root_wdcopjmkbl" ON "slice"."assign_decide_seen_read" IS 'foreign key AssignDecideSeenRead(digest, root) to AssignDecideSeenRow(digest, root)';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_fk_root_padlqqdvnt" ON "slice"."assign_decide_seen_read" IS 'foreign key AssignDecideSeenRead(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_fk_step_root_lfxhtzprjs" ON "slice"."assign_decide_seen_read" IS 'foreign key AssignDecideSeenRead(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_seen_row_fk_root_3mnfet3qme" ON "slice"."assign_decide_seen_row" IS 'foreign key AssignDecideSeenRow(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_done_fk_root_bm6oxygwbu" ON "slice"."assign_done" IS 'foreign key AssignDone(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_input_fk_root_cwfcfjex6q" ON "slice"."assign_embed_input" IS 'foreign key AssignEmbedInput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_root_ukjqxbt7ap" ON "slice"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_step_root_wl7z42ozbz" ON "slice"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(step, root) to AssignEmbedInput(step, root)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_step_pred_ordinal_uyhiasutyq" ON "slice"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to AssignEmbedInputExclude(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_fk_root_4znytbmmeu" ON "slice"."assign_embed_input_mode_nearest" IS 'foreign key AssignEmbedInputModeNearest(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_fk_root_sntsbzyy4j" ON "slice"."assign_embed_input_mode_within" IS 'foreign key AssignEmbedInputModeWithin(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_root_tre2sdwjfz" ON "slice"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_step_root_rjswhmogx2" ON "slice"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(step, root) to AssignEmbedInput(step, root)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_step_pred_ordinal_root_4z756q6ieo" ON "slice"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to AssignEmbedInputNear(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_root_2s3kxqf4fq" ON "slice"."assign_embed_output" IS 'foreign key AssignEmbedOutput(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_step_root_amg3l6sdib" ON "slice"."assign_embed_output" IS 'foreign key AssignEmbedOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_step_root_yoz2l6kzsz" ON "slice"."assign_embed_output" IS 'foreign key AssignEmbedOutput(step, root) to AssignEmbedInput(step, root)';

COMMENT ON CONSTRAINT "__assign_ended_fk_root_snn64so4y5" ON "slice"."assign_ended" IS 'foreign key AssignEnded(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_ended_fk_step_attempt_root_6glu7zitw6" ON "slice"."assign_ended" IS 'foreign key AssignEnded(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b" ON "slice"."assign_exhausted" IS 'foreign key AssignExhausted(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy" ON "slice"."assign_exhausted" IS 'foreign key AssignExhausted(step, root) to AssignFailed(step, root)';

COMMENT ON CONSTRAINT "__assign_failed_fk_root_oyplqvhznf" ON "slice"."assign_failed" IS 'foreign key AssignFailed(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2" ON "slice"."assign_fenced" IS 'foreign key AssignFenced(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_fenced_fk_step_attempt_root_ibfrwtujam" ON "slice"."assign_fenced" IS 'foreign key AssignFenced(step, attempt, root) to AssignEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_6bbfqqziln" ON "slice"."assign_finish" IS 'foreign key AssignFinish(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod" ON "slice"."assign_finish" IS 'foreign key AssignFinish(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc" ON "slice"."assign_finish" IS 'foreign key AssignFinish(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f" ON "slice"."assign_held" IS 'foreign key AssignHeld(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo" ON "slice"."assign_held" IS 'foreign key AssignHeld(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi" ON "slice"."assign_held" IS 'foreign key AssignHeld(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" ON "slice"."assign_paused" IS 'foreign key AssignPaused(target, pred(turn)) to AssignResumed(target, turn)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg" ON "slice"."assign_refusal" IS 'foreign key AssignRefusal(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4" ON "slice"."assign_refusal" IS 'foreign key AssignRefusal(step, root) to AssignFailed(step, root)';

COMMENT ON CONSTRAINT "__assign_result_fk_root_mbig2yym5s" ON "slice"."assign_result" IS 'foreign key AssignResult(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_result_fk_step_root_ie57r22uco" ON "slice"."assign_result" IS 'foreign key AssignResult(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" ON "slice"."assign_resumed" IS 'foreign key AssignResumed(target, turn) to AssignPaused(target, turn)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh" ON "slice"."assign_retry" IS 'foreign key AssignRetry(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_retry_fk_step_attempt_root_gsye2j667t" ON "slice"."assign_retry" IS 'foreign key AssignRetry(step, attempt, root) to AssignEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t" ON "slice"."assign_scope" IS 'foreign key AssignScope(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_skipped_fk_by_yi4ixsfumz" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(by) to AssignRoot(scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_skipped_fk_scope_6ks53lak4r" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(scope) to AssignRoot(scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_me4zj64243" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_qky3m5h2ys" ON "slice"."assign_step" IS 'foreign key AssignStep(root) to AssignRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua" ON "slice"."assign_step" IS 'foreign key AssignStep(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" ON "slice"."audit" IS 'foreign key Audit(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_admitted_fk_root_abvywhprzd" ON "slice"."chain_admitted" IS 'foreign key ChainAdmitted(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero" ON "slice"."chain_admitted" IS 'foreign key ChainAdmitted(scope, root) to ChainScope(scope, root)';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_fk_root_4rmekbji4d" ON "slice"."chain_chain_run_finish_output" IS 'foreign key ChainChainRunFinishOutput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_fk_step_root_xr4ypwejog" ON "slice"."chain_chain_run_finish_output" IS 'foreign key ChainChainRunFinishOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten" ON "slice"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_e4z56epu62" ON "slice"."chain_claim" IS 'foreign key ChainClaim(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_mekmccmxkt" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to ChainEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_done_fk_root_p5unbx53ay" ON "slice"."chain_done" IS 'foreign key ChainDone(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_ended_fk_root_mzyjkgh7kn" ON "slice"."chain_ended" IS 'foreign key ChainEnded(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_ended_fk_step_attempt_root_hqs5hboik5" ON "slice"."chain_ended" IS 'foreign key ChainEnded(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_az7it7tady" ON "slice"."chain_exhausted" IS 'foreign key ChainExhausted(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t" ON "slice"."chain_exhausted" IS 'foreign key ChainExhausted(step, root) to ChainFailed(step, root)';

COMMENT ON CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4" ON "slice"."chain_failed" IS 'foreign key ChainFailed(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p" ON "slice"."chain_fenced" IS 'foreign key ChainFenced(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_fenced_fk_step_attempt_root_wtvf2kpo3y" ON "slice"."chain_fenced" IS 'foreign key ChainFenced(step, attempt, root) to ChainEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a" ON "slice"."chain_finish" IS 'foreign key ChainFinish(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35" ON "slice"."chain_finish" IS 'foreign key ChainFinish(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z" ON "slice"."chain_finish" IS 'foreign key ChainFinish(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_7gjoucbs6t" ON "slice"."chain_held" IS 'foreign key ChainHeld(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc" ON "slice"."chain_held" IS 'foreign key ChainHeld(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko" ON "slice"."chain_held" IS 'foreign key ChainHeld(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_next_fk_from_root_fp74n4ao6b" ON "slice"."chain_next" IS 'foreign key ChainNext(from, root) to ChainPageOutput(step, root)';

COMMENT ON CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g" ON "slice"."chain_next" IS 'foreign key ChainNext(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs" ON "slice"."chain_next" IS 'foreign key ChainNext(to, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_fk_root_dbbcetmlpl" ON "slice"."chain_ordered_finish_output" IS 'foreign key ChainOrderedFinishOutput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_fk_step_root_jvdqnoziiv" ON "slice"."chain_ordered_finish_output" IS 'foreign key ChainOrderedFinishOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v" ON "slice"."chain_ordered_input" IS 'foreign key ChainOrderedInput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_earlier_read_fk_digest_root_rdy323u3bs" ON "slice"."chain_page_earlier_read" IS 'foreign key ChainPageEarlierRead(digest, root) to ChainPageEarlierRow(digest, root)';

COMMENT ON CONSTRAINT "__chain_page_earlier_read_fk_root_dfn3birdd5" ON "slice"."chain_page_earlier_read" IS 'foreign key ChainPageEarlierRead(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_earlier_read_fk_step_root_qfjrh5spdl" ON "slice"."chain_page_earlier_read" IS 'foreign key ChainPageEarlierRead(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_page_earlier_row_fk_root_zlddkw7rkf" ON "slice"."chain_page_earlier_row" IS 'foreign key ChainPageEarlierRow(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai" ON "slice"."chain_page_input" IS 'foreign key ChainPageInput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4" ON "slice"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab" ON "slice"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(step, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux" ON "slice"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao" ON "slice"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(step, root) to ChainPageOutput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_first_fk_digest_items_root_7aqgs54zox" ON "slice"."chain_page_tree_first" IS 'foreign key ChainPageTreeFirst(digest, items, root) to ChainPageTreeItems(digest, items, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_first_fk_root_gjfr2xpivs" ON "slice"."chain_page_tree_first" IS 'foreign key ChainPageTreeFirst(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_tree_items_fk_digest_root_m6wzp3qjum" ON "slice"."chain_page_tree_items" IS 'foreign key ChainPageTreeItems(digest, root) to ChainPageTreeRow(digest, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_items_fk_root_dtaaizvian" ON "slice"."chain_page_tree_items" IS 'foreign key ChainPageTreeItems(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_tree_items_fk_digest_pred_items_root_cygr4alwsu" ON "slice"."chain_page_tree_items" IS 'foreign key ChainPageTreeItems(digest where {"kind":"compare","left":{"field":"items","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(items), root) to ChainPageTreeItems(digest, items, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_read_fk_digest_root_resd5qnln7" ON "slice"."chain_page_tree_read" IS 'foreign key ChainPageTreeRead(digest, root) to ChainPageTreeRow(digest, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_read_fk_root_jcl7nqjdau" ON "slice"."chain_page_tree_read" IS 'foreign key ChainPageTreeRead(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_tree_read_fk_step_root_xbggf6dgaw" ON "slice"."chain_page_tree_read" IS 'foreign key ChainPageTreeRead(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_row_fk_root_bo7lxrqlak" ON "slice"."chain_page_tree_row" IS 'foreign key ChainPageTreeRow(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_weights_read_fk_digest_root_uhg6hn6q56" ON "slice"."chain_page_weights_read" IS 'foreign key ChainPageWeightsRead(digest, root) to ChainPageWeightsRow(digest, root)';

COMMENT ON CONSTRAINT "__chain_page_weights_read_fk_root_jeksctdxbs" ON "slice"."chain_page_weights_read" IS 'foreign key ChainPageWeightsRead(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_page_weights_read_fk_step_root_cs5oeb2hng" ON "slice"."chain_page_weights_read" IS 'foreign key ChainPageWeightsRead(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_page_weights_row_fk_root_jfbrlyb33o" ON "slice"."chain_page_weights_row" IS 'foreign key ChainPageWeightsRow(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" ON "slice"."chain_paused" IS 'foreign key ChainPaused(target, pred(turn)) to ChainResumed(target, turn)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf" ON "slice"."chain_refusal" IS 'foreign key ChainRefusal(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov" ON "slice"."chain_refusal" IS 'foreign key ChainRefusal(step, root) to ChainFailed(step, root)';

COMMENT ON CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd" ON "slice"."chain_result" IS 'foreign key ChainResult(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_result_fk_step_root_rytllwqxot" ON "slice"."chain_result" IS 'foreign key ChainResult(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" ON "slice"."chain_resumed" IS 'foreign key ChainResumed(target, turn) to ChainPaused(target, turn)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso" ON "slice"."chain_retry" IS 'foreign key ChainRetry(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_retry_fk_step_attempt_root_mwa5szmjq5" ON "slice"."chain_retry" IS 'foreign key ChainRetry(step, attempt, root) to ChainEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_scope_fk_root_5dnilqnmua" ON "slice"."chain_scope" IS 'foreign key ChainScope(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_skipped_fk_by_zwz72yquyv" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(by) to ChainRoot(scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_skipped_fk_scope_ozicxyda6o" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(scope) to ChainRoot(scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_n4wedmpzhn" ON "slice"."chain_step" IS 'foreign key ChainStep(root) to ChainRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f" ON "slice"."chain_step" IS 'foreign key ChainStep(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__clock_admitted_fk_root_7dydra2fa6" ON "slice"."clock_admitted" IS 'foreign key ClockAdmitted(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_admitted_fk_scope_root_iq667y6auq" ON "slice"."clock_admitted" IS 'foreign key ClockAdmitted(scope, root) to ClockScope(scope, root)';

COMMENT ON CONSTRAINT "__clock_chime_input_fk_root_plvhx4qyi5" ON "slice"."clock_chime_input" IS 'foreign key ClockChimeInput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_root_75doh4g3jb" ON "slice"."clock_chime_output" IS 'foreign key ClockChimeOutput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_step_root_x3amhltgq6" ON "slice"."clock_chime_output" IS 'foreign key ClockChimeOutput(step, root) to ClockChimeInput(step, root)';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_step_root_3wm3i6ov6f" ON "slice"."clock_chime_output" IS 'foreign key ClockChimeOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_claim_fk_root_hmpra5qlcp" ON "slice"."clock_claim" IS 'foreign key ClockClaim(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_claim_fk_step_root_vptogyiqam" ON "slice"."clock_claim" IS 'foreign key ClockClaim(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_claim_fk_step_pred_attempt_root_qvfbouzl5p" ON "slice"."clock_claim" IS 'foreign key ClockClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to ClockEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_close_input_fk_root_txagvl3rnl" ON "slice"."clock_close_input" IS 'foreign key ClockCloseInput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_close_output_fk_root_5jk2orzbti" ON "slice"."clock_close_output" IS 'foreign key ClockCloseOutput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_close_output_fk_step_root_fooxwxkcx3" ON "slice"."clock_close_output" IS 'foreign key ClockCloseOutput(step, root) to ClockCloseInput(step, root)';

COMMENT ON CONSTRAINT "__clock_close_output_fk_step_root_accrzxyiql" ON "slice"."clock_close_output" IS 'foreign key ClockCloseOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_done_fk_root_soqskjsjao" ON "slice"."clock_done" IS 'foreign key ClockDone(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_ended_fk_root_g3cnl7xafr" ON "slice"."clock_ended" IS 'foreign key ClockEnded(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_ended_fk_step_attempt_root_dimjqmfaqh" ON "slice"."clock_ended" IS 'foreign key ClockEnded(step, attempt, root) to ClockClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_root_xskm7prc74" ON "slice"."clock_exhausted" IS 'foreign key ClockExhausted(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_step_root_ydvibsvd3a" ON "slice"."clock_exhausted" IS 'foreign key ClockExhausted(step, root) to ClockFailed(step, root)';

COMMENT ON CONSTRAINT "__clock_failed_fk_root_tkhs7qqr4z" ON "slice"."clock_failed" IS 'foreign key ClockFailed(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_fenced_fk_root_t4ntcqjpyp" ON "slice"."clock_fenced" IS 'foreign key ClockFenced(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_fenced_fk_step_attempt_root_6wai42b7gk" ON "slice"."clock_fenced" IS 'foreign key ClockFenced(step, attempt, root) to ClockEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_pmnnbogxf6" ON "slice"."clock_finish" IS 'foreign key ClockFinish(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_finish_fk_scope_root_ncra3pc2vm" ON "slice"."clock_finish" IS 'foreign key ClockFinish(scope, root) to ClockAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__clock_finish_fk_step_root_kr2hfecrdl" ON "slice"."clock_finish" IS 'foreign key ClockFinish(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_u3vxrlyseh" ON "slice"."clock_held" IS 'foreign key ClockHeld(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_held_fk_step_attempt_root_rggju54zr5" ON "slice"."clock_held" IS 'foreign key ClockHeld(step, attempt, root) to ClockClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_held_fk_step_root_oboys6ct6s" ON "slice"."clock_held" IS 'foreign key ClockHeld(step, root) to ClockResult(step, root)';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_fk_root_wn7gvu3f26" ON "slice"."clock_hourly_finish_output" IS 'foreign key ClockHourlyFinishOutput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_fk_step_root_xwntxefqc6" ON "slice"."clock_hourly_finish_output" IS 'foreign key ClockHourlyFinishOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_hourly_input_fk_root_ixovd5y6h4" ON "slice"."clock_hourly_input" IS 'foreign key ClockHourlyInput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_paused_fk_target_pred_turn_7tgjovpr6x" ON "slice"."clock_paused" IS 'foreign key ClockPaused(target, pred(turn)) to ClockResumed(target, turn)';

COMMENT ON CONSTRAINT "__clock_refusal_fk_root_ekomnyuzgo" ON "slice"."clock_refusal" IS 'foreign key ClockRefusal(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_refusal_fk_step_root_cwz55xrfvz" ON "slice"."clock_refusal" IS 'foreign key ClockRefusal(step, root) to ClockFailed(step, root)';

COMMENT ON CONSTRAINT "__clock_result_fk_root_mlw7uyvsd5" ON "slice"."clock_result" IS 'foreign key ClockResult(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_result_fk_step_root_ywzn6yx56v" ON "slice"."clock_result" IS 'foreign key ClockResult(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_resumed_fk_target_turn_45dwn4cwo5" ON "slice"."clock_resumed" IS 'foreign key ClockResumed(target, turn) to ClockPaused(target, turn)';

COMMENT ON CONSTRAINT "__clock_retry_fk_root_zrptzgm66d" ON "slice"."clock_retry" IS 'foreign key ClockRetry(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_retry_fk_step_attempt_root_rbqzkwnwmy" ON "slice"."clock_retry" IS 'foreign key ClockRetry(step, attempt, root) to ClockEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_scope_fk_root_2os4agb6vo" ON "slice"."clock_scope" IS 'foreign key ClockScope(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_fk_root_5s5nbif4nr" ON "slice"."clock_sitting_finish_output" IS 'foreign key ClockSittingFinishOutput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_fk_step_root_mkypttatse" ON "slice"."clock_sitting_finish_output" IS 'foreign key ClockSittingFinishOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_sitting_input_fk_root_pedoscj3vp" ON "slice"."clock_sitting_input" IS 'foreign key ClockSittingInput(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_skipped_fk_by_joxrltqt4a" ON "slice"."clock_skipped" IS 'foreign key ClockSkipped(by) to ClockRoot(scope)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_root_w4ixxvhwt2" ON "slice"."clock_skipped" IS 'foreign key ClockSkipped(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_skipped_fk_scope_e5ndey7rqw" ON "slice"."clock_skipped" IS 'foreign key ClockSkipped(scope) to ClockRoot(scope)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_s7u7hg3lzj" ON "slice"."clock_start_step" IS 'foreign key ClockStartStep(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_start_step_fk_scope_root_oqopxtg4cc" ON "slice"."clock_start_step" IS 'foreign key ClockStartStep(scope, root) to ClockAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_step_root_7tv5nylxvh" ON "slice"."clock_start_step" IS 'foreign key ClockStartStep(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_step_fk_root_pi7kop6duk" ON "slice"."clock_step" IS 'foreign key ClockStep(root) to ClockRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__clock_step_fk_scope_root_ivit5j6zqd" ON "slice"."clock_step" IS 'foreign key ClockStep(scope, root) to ClockAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk" ON "slice"."fan_admitted" IS 'foreign key FanAdmitted(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6" ON "slice"."fan_admitted" IS 'foreign key FanAdmitted(scope, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_fk_root_dpzlswayvb" ON "slice"."fan_batch_finish_output" IS 'foreign key FanBatchFinishOutput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_fk_step_root_hhniyvx63e" ON "slice"."fan_batch_finish_output" IS 'foreign key FanBatchFinishOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl" ON "slice"."fan_batch_input" IS 'foreign key FanBatchInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7" ON "slice"."fan_claim" IS 'foreign key FanClaim(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab" ON "slice"."fan_claim" IS 'foreign key FanClaim(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_root_attempt_pred_holds_jqx7ma7cam" ON "slice"."fan_claim" IS 'foreign key FanClaim(step, root, attempt, pred(holds)) to FanHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_lvu6wwhaq3" ON "slice"."fan_claim" IS 'foreign key FanClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to FanEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_done_fk_root_cfizuozacw" ON "slice"."fan_done" IS 'foreign key FanDone(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_dust_input_fk_root_3733wzdt23" ON "slice"."fan_dust_input" IS 'foreign key FanDustInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_root_6dquh32eog" ON "slice"."fan_dust_output" IS 'foreign key FanDustOutput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_step_root_qzoffoc32g" ON "slice"."fan_dust_output" IS 'foreign key FanDustOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_step_root_nxpsu4ielv" ON "slice"."fan_dust_output" IS 'foreign key FanDustOutput(step, root) to FanDustInput(step, root)';

COMMENT ON CONSTRAINT "__fan_ended_fk_root_uaaz527dex" ON "slice"."fan_ended" IS 'foreign key FanEnded(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_ended_fk_step_attempt_root_guai42fujd" ON "slice"."fan_ended" IS 'foreign key FanEnded(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk" ON "slice"."fan_exhausted" IS 'foreign key FanExhausted(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd" ON "slice"."fan_exhausted" IS 'foreign key FanExhausted(step, root) to FanFailed(step, root)';

COMMENT ON CONSTRAINT "__fan_failed_fk_root_3gq7ifprza" ON "slice"."fan_failed" IS 'foreign key FanFailed(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_fk_root_ttt7pw4dnn" ON "slice"."fan_fan_run_finish_output" IS 'foreign key FanFanRunFinishOutput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_fk_step_root_yjy4xmcplw" ON "slice"."fan_fan_run_finish_output" IS 'foreign key FanFanRunFinishOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27" ON "slice"."fan_fan_run_input" IS 'foreign key FanFanRunInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5" ON "slice"."fan_fenced" IS 'foreign key FanFenced(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_fenced_fk_step_attempt_root_resahyn2ym" ON "slice"."fan_fenced" IS 'foreign key FanFenced(step, attempt, root) to FanEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_evgrt3slao" ON "slice"."fan_finish" IS 'foreign key FanFinish(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy" ON "slice"."fan_finish" IS 'foreign key FanFinish(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab" ON "slice"."fan_finish" IS 'foreign key FanFinish(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_cnpqjrp534" ON "slice"."fan_held" IS 'foreign key FanHeld(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6" ON "slice"."fan_held" IS 'foreign key FanHeld(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3" ON "slice"."fan_held" IS 'foreign key FanHeld(step, root) to FanResult(step, root)';

COMMENT ON CONSTRAINT "__fan_hold_fk_root_4at7ny23la" ON "slice"."fan_hold" IS 'foreign key FanHold(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_hold_fk_step_root_attempt_copy_holds_jzk5g7klso" ON "slice"."fan_hold" IS 'foreign key FanHold(step, root, attempt, the owner''s count of the family FanClaim.holds) to FanClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_hold_fk_step_root_attempt_pred_at_p4adu554h3" ON "slice"."fan_hold" IS 'foreign key FanHold(step, root, attempt, pred(at)) to FanHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__fan_mop_input_fk_root_iflswncgct" ON "slice"."fan_mop_input" IS 'foreign key FanMopInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_root_2oyshrk7i2" ON "slice"."fan_mop_output" IS 'foreign key FanMopOutput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_step_root_dsgqll32vr" ON "slice"."fan_mop_output" IS 'foreign key FanMopOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_step_root_j2cwqnpbda" ON "slice"."fan_mop_output" IS 'foreign key FanMopOutput(step, root) to FanMopInput(step, root)';

COMMENT ON CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" ON "slice"."fan_paused" IS 'foreign key FanPaused(target, pred(turn)) to FanResumed(target, turn)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e" ON "slice"."fan_refusal" IS 'foreign key FanRefusal(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w" ON "slice"."fan_refusal" IS 'foreign key FanRefusal(step, root) to FanFailed(step, root)';

COMMENT ON CONSTRAINT "__fan_result_fk_root_m233bhejob" ON "slice"."fan_result" IS 'foreign key FanResult(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_result_fk_step_root_kkph4igmst" ON "slice"."fan_result" IS 'foreign key FanResult(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" ON "slice"."fan_resumed" IS 'foreign key FanResumed(target, turn) to FanPaused(target, turn)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh" ON "slice"."fan_retry" IS 'foreign key FanRetry(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_retry_fk_step_attempt_root_jw7ijf5nre" ON "slice"."fan_retry" IS 'foreign key FanRetry(step, attempt, root) to FanEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6" ON "slice"."fan_scope" IS 'foreign key FanScope(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_skipped_fk_by_o76cwxye2w" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(by) to FanRoot(scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_skipped_fk_scope_eomkgfbxwj" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(scope) to FanRoot(scope)';

COMMENT ON CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja" ON "slice"."fan_square_input" IS 'foreign key FanSquareInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

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

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_fk_root_wuiuxdlyfz" ON "slice"."fan_sweep_finish_output" IS 'foreign key FanSweepFinishOutput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_fk_step_root_hvu6m73esm" ON "slice"."fan_sweep_finish_output" IS 'foreign key FanSweepFinishOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_sweep_input_fk_root_uobuoei5yy" ON "slice"."fan_sweep_input" IS 'foreign key FanSweepInput(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh" ON "slice"."fan_within" IS 'foreign key FanWithin(parent, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_k7476egnhf" ON "slice"."fan_within" IS 'foreign key FanWithin(root) to FanRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip" ON "slice"."fan_within" IS 'foreign key FanWithin(scope, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g" ON "slice"."retry_admitted" IS 'foreign key RetryAdmitted(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v" ON "slice"."retry_admitted" IS 'foreign key RetryAdmitted(scope, root) to RetryScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg" ON "slice"."retry_brittle_input" IS 'foreign key RetryBrittleInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step, root) to RetryBrittleInput(step, root)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq" ON "slice"."retry_claim" IS 'foreign key RetryClaim(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l" ON "slice"."retry_claim" IS 'foreign key RetryClaim(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_pnatu7db5m" ON "slice"."retry_claim" IS 'foreign key RetryClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to RetryEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_done_fk_root_eegigvha5p" ON "slice"."retry_done" IS 'foreign key RetryDone(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_ended_fk_root_h23o2xvf4e" ON "slice"."retry_ended" IS 'foreign key RetryEnded(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_ended_fk_step_attempt_root_25duapnk22" ON "slice"."retry_ended" IS 'foreign key RetryEnded(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv" ON "slice"."retry_exhausted" IS 'foreign key RetryExhausted(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw" ON "slice"."retry_exhausted" IS 'foreign key RetryExhausted(step, root) to RetryFailed(step, root)';

COMMENT ON CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7" ON "slice"."retry_failed" IS 'foreign key RetryFailed(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_q2hes57bil" ON "slice"."retry_fenced" IS 'foreign key RetryFenced(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_fenced_fk_step_attempt_root_laqomvgkpu" ON "slice"."retry_fenced" IS 'foreign key RetryFenced(step, attempt, root) to RetryEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_iv6szs7lco" ON "slice"."retry_finish" IS 'foreign key RetryFinish(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc" ON "slice"."retry_finish" IS 'foreign key RetryFinish(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy" ON "slice"."retry_finish" IS 'foreign key RetryFinish(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_3v46rzikqg" ON "slice"."retry_held" IS 'foreign key RetryHeld(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex" ON "slice"."retry_held" IS 'foreign key RetryHeld(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya" ON "slice"."retry_held" IS 'foreign key RetryHeld(step, root) to RetryResult(step, root)';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_fk_root_gmq3iutwdv" ON "slice"."retry_ladders_finish_output" IS 'foreign key RetryLaddersFinishOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_fk_step_root_l5sosf3h23" ON "slice"."retry_ladders_finish_output" IS 'foreign key RetryLaddersFinishOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w" ON "slice"."retry_ladders_input" IS 'foreign key RetryLaddersInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_patient_input_fk_root_x4fak4nifc" ON "slice"."retry_patient_input" IS 'foreign key RetryPatientInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_root_36wgu5rnaa" ON "slice"."retry_patient_output" IS 'foreign key RetryPatientOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_step_root_waswby3piq" ON "slice"."retry_patient_output" IS 'foreign key RetryPatientOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_step_root_buctg5fpry" ON "slice"."retry_patient_output" IS 'foreign key RetryPatientOutput(step, root) to RetryPatientInput(step, root)';

COMMENT ON CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" ON "slice"."retry_paused" IS 'foreign key RetryPaused(target, pred(turn)) to RetryResumed(target, turn)';

COMMENT ON CONSTRAINT "__retry_polite_input_fk_root_5mkc2d4wg5" ON "slice"."retry_polite_input" IS 'foreign key RetryPoliteInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_root_hgdssuqq43" ON "slice"."retry_polite_output" IS 'foreign key RetryPoliteOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_step_root_n3pnixozej" ON "slice"."retry_polite_output" IS 'foreign key RetryPoliteOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_step_root_dzlpbomecj" ON "slice"."retry_polite_output" IS 'foreign key RetryPoliteOutput(step, root) to RetryPoliteInput(step, root)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v" ON "slice"."retry_refusal" IS 'foreign key RetryRefusal(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib" ON "slice"."retry_refusal" IS 'foreign key RetryRefusal(step, root) to RetryFailed(step, root)';

COMMENT ON CONSTRAINT "__retry_result_fk_root_zoskj252jz" ON "slice"."retry_result" IS 'foreign key RetryResult(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq" ON "slice"."retry_result" IS 'foreign key RetryResult(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" ON "slice"."retry_resumed" IS 'foreign key RetryResumed(target, turn) to RetryPaused(target, turn)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3" ON "slice"."retry_retry" IS 'foreign key RetryRetry(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_retry_fk_step_attempt_root_xrpolbmg32" ON "slice"."retry_retry" IS 'foreign key RetryRetry(step, attempt, root) to RetryEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_scope_fk_root_veata66enh" ON "slice"."retry_scope" IS 'foreign key RetryScope(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_skipped_fk_by_iokgypc6cl" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(by) to RetryRoot(scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_skipped_fk_scope_q4224gzqrl" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(scope) to RetryRoot(scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_lgh6lskept" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t" ON "slice"."retry_steadfast_input" IS 'foreign key RetrySteadfastInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step, root) to RetrySteadfastInput(step, root)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_zww4hkltkz" ON "slice"."retry_step" IS 'foreign key RetryStep(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq" ON "slice"."retry_step" IS 'foreign key RetryStep(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_fk_root_aoghadcbu7" ON "slice"."retry_throttled_finish_output" IS 'foreign key RetryThrottledFinishOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_fk_step_root_7s3twuagha" ON "slice"."retry_throttled_finish_output" IS 'foreign key RetryThrottledFinishOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_throttled_input_fk_root_gx2jscz4sq" ON "slice"."retry_throttled_input" IS 'foreign key RetryThrottledInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_fk_root_jiiefymglf" ON "slice"."retry_unhurried_finish_output" IS 'foreign key RetryUnhurriedFinishOutput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_fk_step_root_65bjp55xj7" ON "slice"."retry_unhurried_finish_output" IS 'foreign key RetryUnhurriedFinishOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_unhurried_input_fk_root_eff4ilou6c" ON "slice"."retry_unhurried_input" IS 'foreign key RetryUnhurriedInput(root) to RetryRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_admitted_fk_root_5a2j3m7nju" ON "slice"."review_admitted" IS 'foreign key ReviewAdmitted(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_admitted_fk_scope_root_bzpl734wrx" ON "slice"."review_admitted" IS 'foreign key ReviewAdmitted(scope, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__review_analyze_input_fk_root_73upzaj4eg" ON "slice"."review_analyze_input" IS 'foreign key ReviewAnalyzeInput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_root_qlfzwtt6d2" ON "slice"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_step_root_axdif7cyxp" ON "slice"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(step, root) to ReviewAnalyzeInput(step, root)';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_step_root_arcu4coozk" ON "slice"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_z2utn3xauo" ON "slice"."review_claim" IS 'foreign key ReviewClaim(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_claim_fk_step_root_yqgzabonm6" ON "slice"."review_claim" IS 'foreign key ReviewClaim(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_claim_fk_step_root_attempt_pred_holds_arudmqwanl" ON "slice"."review_claim" IS 'foreign key ReviewClaim(step, root, attempt, pred(holds)) to ReviewHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__review_claim_fk_step_pred_attempt_root_jwqvbkxdcf" ON "slice"."review_claim" IS 'foreign key ReviewClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to ReviewEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_done_fk_root_f374tjslpg" ON "slice"."review_done" IS 'foreign key ReviewDone(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_ended_fk_root_o6manlpvtk" ON "slice"."review_ended" IS 'foreign key ReviewEnded(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_ended_fk_step_attempt_root_a7ck6js3qb" ON "slice"."review_ended" IS 'foreign key ReviewEnded(step, attempt, root) to ReviewClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_exhausted_fk_root_odke37pg7n" ON "slice"."review_exhausted" IS 'foreign key ReviewExhausted(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_exhausted_fk_step_root_74mlwghlwh" ON "slice"."review_exhausted" IS 'foreign key ReviewExhausted(step, root) to ReviewFailed(step, root)';

COMMENT ON CONSTRAINT "__review_failed_fk_root_vohwwobyj7" ON "slice"."review_failed" IS 'foreign key ReviewFailed(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_fenced_fk_root_clolofwycr" ON "slice"."review_fenced" IS 'foreign key ReviewFenced(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_fenced_fk_step_attempt_root_zpc4oiatc2" ON "slice"."review_fenced" IS 'foreign key ReviewFenced(step, attempt, root) to ReviewEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_yivqae7o2r" ON "slice"."review_finish" IS 'foreign key ReviewFinish(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_finish_fk_scope_root_wjpg56iirx" ON "slice"."review_finish" IS 'foreign key ReviewFinish(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_finish_fk_step_root_assajgbrsg" ON "slice"."review_finish" IS 'foreign key ReviewFinish(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_gather_input_fk_root_m5n5ulcugs" ON "slice"."review_gather_input" IS 'foreign key ReviewGatherInput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_root_4jycj2gg73" ON "slice"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_step_root_xkxj3c72dv" ON "slice"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(step, root) to ReviewGatherInput(step, root)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_step_pred_ordinal_h3lguuktus" ON "slice"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to ReviewGatherInputSizes(step, ordinal, root)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_root_pfl7uynvxk" ON "slice"."review_gather_output" IS 'foreign key ReviewGatherOutput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_gather_output_fk_step_root_kfxlxydhp2" ON "slice"."review_gather_output" IS 'foreign key ReviewGatherOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_step_root_sijekb5wr7" ON "slice"."review_gather_output" IS 'foreign key ReviewGatherOutput(step, root) to ReviewGatherInput(step, root)';

COMMENT ON CONSTRAINT "__review_held_fk_root_cq4jfaijwu" ON "slice"."review_held" IS 'foreign key ReviewHeld(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_held_fk_step_attempt_root_63jdmcjpmk" ON "slice"."review_held" IS 'foreign key ReviewHeld(step, attempt, root) to ReviewClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_held_fk_step_root_463posmneo" ON "slice"."review_held" IS 'foreign key ReviewHeld(step, root) to ReviewResult(step, root)';

COMMENT ON CONSTRAINT "__review_hold_fk_root_smobn52snr" ON "slice"."review_hold" IS 'foreign key ReviewHold(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_hold_fk_step_root_attempt_copy_holds_syccyd3g3d" ON "slice"."review_hold" IS 'foreign key ReviewHold(step, root, attempt, the owner''s count of the family ReviewClaim.holds) to ReviewClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__review_hold_fk_step_root_attempt_pred_at_6m6hmj5lir" ON "slice"."review_hold" IS 'foreign key ReviewHold(step, root, attempt, pred(at)) to ReviewHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" ON "slice"."review_paused" IS 'foreign key ReviewPaused(target, pred(turn)) to ReviewResumed(target, turn)';

COMMENT ON CONSTRAINT "__review_questions_finish_output_fk_root_lhkngtysmk" ON "slice"."review_questions_finish_output" IS 'foreign key ReviewQuestionsFinishOutput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_questions_finish_output_fk_step_root_hw7trgc4tp" ON "slice"."review_questions_finish_output" IS 'foreign key ReviewQuestionsFinishOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_questions_input_fk_root_smgug66jwc" ON "slice"."review_questions_input" IS 'foreign key ReviewQuestionsInput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_refusal_fk_root_qvufijkx4k" ON "slice"."review_refusal" IS 'foreign key ReviewRefusal(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_refusal_fk_step_root_dhnaknctqw" ON "slice"."review_refusal" IS 'foreign key ReviewRefusal(step, root) to ReviewFailed(step, root)';

COMMENT ON CONSTRAINT "__review_result_fk_root_go4w3a44a2" ON "slice"."review_result" IS 'foreign key ReviewResult(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_result_fk_step_root_nfnufhm5fh" ON "slice"."review_result" IS 'foreign key ReviewResult(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" ON "slice"."review_resumed" IS 'foreign key ReviewResumed(target, turn) to ReviewPaused(target, turn)';

COMMENT ON CONSTRAINT "__review_retry_fk_root_szjiq4sdny" ON "slice"."review_retry" IS 'foreign key ReviewRetry(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_retry_fk_step_attempt_root_fuuiurkjt7" ON "slice"."review_retry" IS 'foreign key ReviewRetry(step, attempt, root) to ReviewEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fk_root_ttnfn2lndg" ON "slice"."review_review_run_finish_output" IS 'foreign key ReviewReviewRunFinishOutput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fk_step_root_2c63nc4bm4" ON "slice"."review_review_run_finish_output" IS 'foreign key ReviewReviewRunFinishOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_review_run_input_fk_root_nkwzzml3bh" ON "slice"."review_review_run_input" IS 'foreign key ReviewReviewRunInput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_root_otll5lik2n" ON "slice"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_scope_root_qld3u5js7a" ON "slice"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(scope, root) to ReviewReviewRunInput(scope, root)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_scope_pred_2ecx6mfelf" ON "slice"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal), root) to ReviewReviewRunInputSizes(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__review_save_input_fk_root_75g3g3e6l3" ON "slice"."review_save_input" IS 'foreign key ReviewSaveInput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_save_output_fk_root_v6vey436ah" ON "slice"."review_save_output" IS 'foreign key ReviewSaveOutput(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_save_output_fk_step_root_5hdksxptvu" ON "slice"."review_save_output" IS 'foreign key ReviewSaveOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_save_output_fk_step_root_jzs34zo56u" ON "slice"."review_save_output" IS 'foreign key ReviewSaveOutput(step, root) to ReviewSaveInput(step, root)';

COMMENT ON CONSTRAINT "__review_saved_fk_from_root_sm7hkqib23" ON "slice"."review_saved" IS 'foreign key ReviewSaved(from, root) to ReviewQuestionsFinishOutput(step, root)';

COMMENT ON CONSTRAINT "__review_saved_fk_root_4xrfr45gdd" ON "slice"."review_saved" IS 'foreign key ReviewSaved(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_saved_fk_to_root_owp4kjzfm6" ON "slice"."review_saved" IS 'foreign key ReviewSaved(to, root) to ReviewSaveInput(step, root)';

COMMENT ON CONSTRAINT "__review_scope_fk_root_xio6pw6voh" ON "slice"."review_scope" IS 'foreign key ReviewScope(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_skipped_fk_by_ry2tc7ng2c" ON "slice"."review_skipped" IS 'foreign key ReviewSkipped(by) to ReviewRoot(scope)';

COMMENT ON CONSTRAINT "__review_skipped_fk_root_pp4l3yk33h" ON "slice"."review_skipped" IS 'foreign key ReviewSkipped(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_skipped_fk_scope_fduacpn4ws" ON "slice"."review_skipped" IS 'foreign key ReviewSkipped(scope) to ReviewRoot(scope)';

COMMENT ON CONSTRAINT "__review_split_fk_from_root_ep5f5t573x" ON "slice"."review_split" IS 'foreign key ReviewSplit(from, root) to ReviewGatherOutput(step, root)';

COMMENT ON CONSTRAINT "__review_split_fk_root_7vz6jy3jnt" ON "slice"."review_split" IS 'foreign key ReviewSplit(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_split_fk_to_root_ilwolhg4sy" ON "slice"."review_split" IS 'foreign key ReviewSplit(to, root) to ReviewQuestionsInput(scope, root)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_child_root_ntci6w5prg" ON "slice"."review_start_scope" IS 'foreign key ReviewStartScope(child, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_ijnygpifkq" ON "slice"."review_start_scope" IS 'foreign key ReviewStartScope(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_start_scope_fk_scope_root_4dnwn3qe7t" ON "slice"."review_start_scope" IS 'foreign key ReviewStartScope(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_qixpuodpgi" ON "slice"."review_start_step" IS 'foreign key ReviewStartStep(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_start_step_fk_scope_root_ex5wrmacrb" ON "slice"."review_start_step" IS 'foreign key ReviewStartStep(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_start_step_fk_step_root_e5z3u72syf" ON "slice"."review_start_step" IS 'foreign key ReviewStartStep(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_step_fk_root_s325zhfm22" ON "slice"."review_step" IS 'foreign key ReviewStep(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_step_fk_scope_root_eb2a3dvk6c" ON "slice"."review_step" IS 'foreign key ReviewStep(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_within_fk_parent_root_4wk35gfdq4" ON "slice"."review_within" IS 'foreign key ReviewWithin(parent, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__review_within_fk_root_ksa5lhbp2j" ON "slice"."review_within" IS 'foreign key ReviewWithin(root) to ReviewRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__review_within_fk_scope_root_e63iwx6wm2" ON "slice"."review_within" IS 'foreign key ReviewWithin(scope, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_admitted_fk_root_pazobscutb" ON "slice"."sync_admitted" IS 'foreign key SyncAdmitted(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7" ON "slice"."sync_admitted" IS 'foreign key SyncAdmitted(scope, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2" ON "slice"."sync_build_input" IS 'foreign key SyncBuildInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(step, root) to SyncBuildInput(step, root)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t" ON "slice"."sync_claim" IS 'foreign key SyncClaim(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc" ON "slice"."sync_claim" IS 'foreign key SyncClaim(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_aeg32ogl5b" ON "slice"."sync_claim" IS 'foreign key SyncClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to SyncEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs" ON "slice"."sync_copy_input" IS 'foreign key SyncCopyInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(step, root) to SyncCopyInput(step, root)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_done_fk_root_kbt6t66k7r" ON "slice"."sync_done" IS 'foreign key SyncDone(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_ended_fk_root_6yfa76vqgo" ON "slice"."sync_ended" IS 'foreign key SyncEnded(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_ended_fk_step_attempt_root_43aj3jw3bk" ON "slice"."sync_ended" IS 'foreign key SyncEnded(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" ON "slice"."sync_exclusive" IS 'foreign key SyncExclusive(kind, key, pred(turn)) to SyncReleased(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7" ON "slice"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb" ON "slice"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(scope, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u" ON "slice"."sync_exhausted" IS 'foreign key SyncExhausted(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet" ON "slice"."sync_exhausted" IS 'foreign key SyncExhausted(step, root) to SyncFailed(step, root)';

COMMENT ON CONSTRAINT "__sync_failed_fk_root_utdobwjqln" ON "slice"."sync_failed" IS 'foreign key SyncFailed(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c" ON "slice"."sync_fenced" IS 'foreign key SyncFenced(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_fenced_fk_step_attempt_root_ddezsoici7" ON "slice"."sync_fenced" IS 'foreign key SyncFenced(step, attempt, root) to SyncEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt" ON "slice"."sync_finish" IS 'foreign key SyncFinish(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e" ON "slice"."sync_finish" IS 'foreign key SyncFinish(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq" ON "slice"."sync_finish" IS 'foreign key SyncFinish(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_fk_root_w6bne6fmx4" ON "slice"."sync_gold_finish_output" IS 'foreign key SyncGoldFinishOutput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_fk_step_root_2qkffyqtvq" ON "slice"."sync_gold_finish_output" IS 'foreign key SyncGoldFinishOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq" ON "slice"."sync_gold_input" IS 'foreign key SyncGoldInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_held_fk_root_62s5pmsoqa" ON "slice"."sync_held" IS 'foreign key SyncHeld(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy" ON "slice"."sync_held" IS 'foreign key SyncHeld(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_held_fk_step_root_waydyqivsc" ON "slice"."sync_held" IS 'foreign key SyncHeld(step, root) to SyncResult(step, root)';

COMMENT ON CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" ON "slice"."sync_paused" IS 'foreign key SyncPaused(target, pred(turn)) to SyncResumed(target, turn)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu" ON "slice"."sync_refusal" IS 'foreign key SyncRefusal(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3" ON "slice"."sync_refusal" IS 'foreign key SyncRefusal(step, root) to SyncFailed(step, root)';

COMMENT ON CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" ON "slice"."sync_released" IS 'foreign key SyncReleased(kind, key, turn) to SyncExclusive(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_result_fk_root_vnymla3qhz" ON "slice"."sync_result" IS 'foreign key SyncResult(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_result_fk_step_root_x2umddyh22" ON "slice"."sync_result" IS 'foreign key SyncResult(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" ON "slice"."sync_resumed" IS 'foreign key SyncResumed(target, turn) to SyncPaused(target, turn)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m" ON "slice"."sync_retry" IS 'foreign key SyncRetry(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_retry_fk_step_attempt_root_wr6wrg43i4" ON "slice"."sync_retry" IS 'foreign key SyncRetry(step, attempt, root) to SyncEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_scope_fk_root_whqzszw2jj" ON "slice"."sync_scope" IS 'foreign key SyncScope(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_skipped_fk_by_zsxc5osgwh" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(by) to SyncRoot(scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_root_33hfwafoud" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_skipped_fk_scope_33qsksdlcc" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(scope) to SyncRoot(scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_rmc4nivt3i" ON "slice"."sync_step" IS 'foreign key SyncStep(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y" ON "slice"."sync_step" IS 'foreign key SyncStep(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_fk_root_khqmodw54k" ON "slice"."sync_sync_run_finish_output" IS 'foreign key SyncSyncRunFinishOutput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_fk_step_root_n3vgglnveu" ON "slice"."sync_sync_run_finish_output" IS 'foreign key SyncSyncRunFinishOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz" ON "slice"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(root) to SyncRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_admitted_fk_root_zzhx3ymsmx" ON "slice"."writeback_admitted" IS 'foreign key WritebackAdmitted(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_admitted_fk_scope_root_bgkzavlmet" ON "slice"."writeback_admitted" IS 'foreign key WritebackAdmitted(scope, root) to WritebackScope(scope, root)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_root_7agc267qm7" ON "slice"."writeback_claim" IS 'foreign key WritebackClaim(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_claim_fk_step_root_vh7k4u5nuz" ON "slice"."writeback_claim" IS 'foreign key WritebackClaim(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_step_pred_attempt_root_qpbpmxuik3" ON "slice"."writeback_claim" IS 'foreign key WritebackClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(attempt), root) to WritebackEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_deliver_input_fk_root_khq2esrmmb" ON "slice"."writeback_deliver_input" IS 'foreign key WritebackDeliverInput(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_root_e4xa5oep52" ON "slice"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_step_root_3p47hjlrfd" ON "slice"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(step, root) to WritebackDeliverInput(step, root)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_step_root_trjdigghf7" ON "slice"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(step, root) to WritebackDone(step, root)';

COMMENT ON CONSTRAINT "__writeback_done_fk_root_3lnpe5h2ex" ON "slice"."writeback_done" IS 'foreign key WritebackDone(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_ended_fk_root_h7zxc3wrem" ON "slice"."writeback_ended" IS 'foreign key WritebackEnded(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_ended_fk_step_attempt_root_laqrk2e3dt" ON "slice"."writeback_ended" IS 'foreign key WritebackEnded(step, attempt, root) to WritebackClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_root_m3qvioeeek" ON "slice"."writeback_exhausted" IS 'foreign key WritebackExhausted(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_step_root_cwhwzf2upp" ON "slice"."writeback_exhausted" IS 'foreign key WritebackExhausted(step, root) to WritebackFailed(step, root)';

COMMENT ON CONSTRAINT "__writeback_failed_fk_root_ddkqjmy3le" ON "slice"."writeback_failed" IS 'foreign key WritebackFailed(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_root_cishzkxig6" ON "slice"."writeback_fenced" IS 'foreign key WritebackFenced(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_step_attempt_root_7uikhcfpkf" ON "slice"."writeback_fenced" IS 'foreign key WritebackFenced(step, attempt, root) to WritebackEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_4suiathayz" ON "slice"."writeback_finish" IS 'foreign key WritebackFinish(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_finish_fk_scope_root_rp7v2vj6l6" ON "slice"."writeback_finish" IS 'foreign key WritebackFinish(scope, root) to WritebackAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_step_root_7ny2yumuvy" ON "slice"."writeback_finish" IS 'foreign key WritebackFinish(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_dady3frmfj" ON "slice"."writeback_held" IS 'foreign key WritebackHeld(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_held_fk_step_attempt_root_2i7p4i2alp" ON "slice"."writeback_held" IS 'foreign key WritebackHeld(step, attempt, root) to WritebackClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_held_fk_step_root_7yahu5vvit" ON "slice"."writeback_held" IS 'foreign key WritebackHeld(step, root) to WritebackResult(step, root)';

COMMENT ON CONSTRAINT "__writeback_paused_fk_target_pred_turn_rvsgo6wgpe" ON "slice"."writeback_paused" IS 'foreign key WritebackPaused(target, pred(turn)) to WritebackResumed(target, turn)';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_root_hbzez4kebv" ON "slice"."writeback_refusal" IS 'foreign key WritebackRefusal(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_step_root_xf2b5o76fl" ON "slice"."writeback_refusal" IS 'foreign key WritebackRefusal(step, root) to WritebackFailed(step, root)';

COMMENT ON CONSTRAINT "__writeback_result_fk_root_2ds3etg4pt" ON "slice"."writeback_result" IS 'foreign key WritebackResult(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_result_fk_step_root_52vlcqzy4o" ON "slice"."writeback_result" IS 'foreign key WritebackResult(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_resumed_fk_target_turn_vfx6l6vk75" ON "slice"."writeback_resumed" IS 'foreign key WritebackResumed(target, turn) to WritebackPaused(target, turn)';

COMMENT ON CONSTRAINT "__writeback_retry_fk_root_7expqnzkek" ON "slice"."writeback_retry" IS 'foreign key WritebackRetry(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_retry_fk_step_attempt_root_5cwcgqo5s7" ON "slice"."writeback_retry" IS 'foreign key WritebackRetry(step, attempt, root) to WritebackEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_scope_fk_root_7hgmsmhohr" ON "slice"."writeback_scope" IS 'foreign key WritebackScope(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_by_dm2bpfflyw" ON "slice"."writeback_skipped" IS 'foreign key WritebackSkipped(by) to WritebackRoot(scope)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_root_a3d7uviq7u" ON "slice"."writeback_skipped" IS 'foreign key WritebackSkipped(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_scope_veikkumie6" ON "slice"."writeback_skipped" IS 'foreign key WritebackSkipped(scope) to WritebackRoot(scope)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_r7w5ogs6pb" ON "slice"."writeback_start_step" IS 'foreign key WritebackStartStep(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_scope_root_dnvan4vxav" ON "slice"."writeback_start_step" IS 'foreign key WritebackStartStep(scope, root) to WritebackAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_step_root_zuw7g6khi3" ON "slice"."writeback_start_step" IS 'foreign key WritebackStartStep(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_step_fk_root_ikezfkedwk" ON "slice"."writeback_step" IS 'foreign key WritebackStep(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_step_fk_scope_root_htnuvc75ao" ON "slice"."writeback_step" IS 'foreign key WritebackStep(scope, root) to WritebackAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_fk_root_jvtr4eenzd" ON "slice"."writeback_writeback_finish_output" IS 'foreign key WritebackWritebackFinishOutput(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_fk_step_root_fygai72drs" ON "slice"."writeback_writeback_finish_output" IS 'foreign key WritebackWritebackFinishOutput(step, root) to WritebackDone(step, root)';

COMMENT ON CONSTRAINT "__writeback_writeback_input_fk_root_mwnbphwqvk" ON "slice"."writeback_writeback_input" IS 'foreign key WritebackWritebackInput(root) to WritebackRoot(scope where {"kind":"compare","left":{"field":"retired","kind":"field"},"op":"eq","right":{"kind":"literal","value":false}})';

COMMENT ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of AssignRoot';

COMMENT ON FUNCTION "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of ChainRoot';

COMMENT ON FUNCTION "slice"."__hold_clock_root_bawnkhmkww"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of ClockRoot';

COMMENT ON FUNCTION "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of FanRoot';

COMMENT ON FUNCTION "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of RetryRoot';

COMMENT ON FUNCTION "slice"."__hold_review_root_j3blgclwnl"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of ReviewRoot';

COMMENT ON FUNCTION "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of SyncRoot';

COMMENT ON FUNCTION "slice"."__hold_writeback_root_msmvpm3j7g"("slice"."__domain_jevqauzmw6"[]) IS 'hold function of the groups of WritebackRoot';

COMMENT ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of AssignRoot';

COMMENT ON FUNCTION "slice"."__retire_chain_root_ji6nmac7of"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of ChainRoot';

COMMENT ON FUNCTION "slice"."__retire_clock_root_6pfo6eeroe"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of ClockRoot';

COMMENT ON FUNCTION "slice"."__retire_fan_root_niesya7vcd"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of FanRoot';

COMMENT ON FUNCTION "slice"."__retire_retry_root_kays5vv5ic"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of RetryRoot';

COMMENT ON FUNCTION "slice"."__retire_review_root_itykotyltd"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of ReviewRoot';

COMMENT ON FUNCTION "slice"."__retire_sync_root_ygktrpeohu"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of SyncRoot';

COMMENT ON FUNCTION "slice"."__retire_writeback_root_oprw3k6une"("slice"."__domain_jevqauzmw6"[]) IS 'retire function of the groups of WritebackRoot';

COMMENT ON INDEX "slice"."__assign_admitted_ix_root_pot3vpqjrt" IS 'btree index AssignAdmitted(root)';

COMMENT ON INDEX "slice"."__assign_asked_ix_root_from_tqt7dg3fxl" IS 'btree index AssignAsked(root, from)';

COMMENT ON INDEX "slice"."__assign_assignment_finish_output_ix_root_t2nmfubzxm" IS 'btree index AssignAssignmentFinishOutput(root)';

COMMENT ON INDEX "slice"."__assign_assignment_input_ix_root_scope_ndn57wfv5p" IS 'btree index AssignAssignmentInput(root, scope)';

COMMENT ON INDEX "slice"."__assign_assignment_input_exclude_ix_root_scope_u_6_7ph7zpbtp2" IS 'btree index AssignAssignmentInputExclude(root, __scope_u6ypqf2r2z, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" IS 'btree index AssignAssignmentInputExclude(root, scope)';

COMMENT ON INDEX "slice"."__assign_assignment_input_mode_nearest_ix_root_scope_2jryb7pj2a" IS 'btree index AssignAssignmentInputModeNearest(root, scope)';

COMMENT ON INDEX "slice"."__assign_assignment_input_mode_within_ix_root_scope_yleeo72liv" IS 'btree index AssignAssignmentInputModeWithin(root, scope)';

COMMENT ON INDEX "slice"."__assign_assignment_input_near_ix_root_scope_u_6_eoy4ujrqzz" IS 'btree index AssignAssignmentInputNear(root, __scope_u6ypqf2r2z, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__assign_assignment_input_near_ix_root_scope_gswnizhczo" IS 'btree index AssignAssignmentInputNear(root, scope)';

COMMENT ON INDEX "slice"."__assign_claim_ix_root_step_ouvkclqzzd_pred_attempt_wrkk7rllts" IS 'btree index AssignClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__assign_decide_input_ix_root_step_erwflqvcsk" IS 'btree index AssignDecideInput(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_input_exclude_ix_root_step_mjpuijzth_26rzz2ekud" IS 'btree index AssignDecideInputExclude(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" IS 'btree index AssignDecideInputExclude(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_input_mode_nearest_ix_root_step_v54e6no7cj" IS 'btree index AssignDecideInputModeNearest(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_input_mode_within_ix_root_step_trlkcqxcfp" IS 'btree index AssignDecideInputModeWithin(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_nearest_read_ix_root_digest_ahoyjoscuz" IS 'btree index AssignDecideNearestRead(root, digest)';

COMMENT ON INDEX "slice"."__assign_decide_nearest_read_ix_root_step_4c4574ihrx" IS 'btree index AssignDecideNearestRead(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_nearest_row_ix_root_auwnhrklbq" IS 'btree index AssignDecideNearestRow(root)';

COMMENT ON INDEX "slice"."__assign_decide_output_ix_root_step_uxq3vbvjoa" IS 'btree index AssignDecideOutput(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_output_stage_rest_ix_root_step_hkqbk442cr" IS 'btree index AssignDecideOutputStageRest(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_output_stage_serve_ix_root_step_65h35vi6kz" IS 'btree index AssignDecideOutputStageServe(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_output_weighed_ix_root_step_5pk2o2aayf" IS 'btree index AssignDecideOutputWeighed(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__assign_decide_output_weighed_ix_root_step_gncwdipl43" IS 'btree index AssignDecideOutputWeighed(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_seen_read_ix_root_digest_m6pnjyf3tl" IS 'btree index AssignDecideSeenRead(root, digest)';

COMMENT ON INDEX "slice"."__assign_decide_seen_read_ix_root_step_ybtvecx7oy" IS 'btree index AssignDecideSeenRead(root, step)';

COMMENT ON INDEX "slice"."__assign_decide_seen_row_ix_root_yq77kgv2h4" IS 'btree index AssignDecideSeenRow(root)';

COMMENT ON INDEX "slice"."__assign_done_ix_root_step_edz2spjbbn" IS 'btree index AssignDone(root, step)';

COMMENT ON INDEX "slice"."__assign_embed_input_ix_root_step_5ltjxo25vr" IS 'btree index AssignEmbedInput(root, step)';

COMMENT ON INDEX "slice"."__assign_embed_input_exclude_ix_root_step_mjpuijzth_7bmkgreoup" IS 'btree index AssignEmbedInputExclude(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__assign_embed_input_exclude_ix_root_step_hkkmfupglo" IS 'btree index AssignEmbedInputExclude(root, step)';

COMMENT ON INDEX "slice"."__assign_embed_input_mode_nearest_ix_root_step_nyvoanaxpc" IS 'btree index AssignEmbedInputModeNearest(root, step)';

COMMENT ON INDEX "slice"."__assign_embed_input_mode_within_ix_root_step_jaqihe4eqt" IS 'btree index AssignEmbedInputModeWithin(root, step)';

COMMENT ON INDEX "slice"."__assign_embed_input_near_ix_root_step_mjpuijzth_4_p67hugda6z" IS 'btree index AssignEmbedInputNear(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__assign_embed_input_near_ix_root_step_lkjh7aey4z" IS 'btree index AssignEmbedInputNear(root, step)';

COMMENT ON INDEX "slice"."__assign_embed_output_ix_root_qha7oj27r7" IS 'btree index AssignEmbedOutput(root)';

COMMENT ON INDEX "slice"."__assign_ended_ix_root_dw6oimqu3h" IS 'btree index AssignEnded(root)';

COMMENT ON INDEX "slice"."__assign_exhausted_ix_root_gsga5kdkq3" IS 'btree index AssignExhausted(root)';

COMMENT ON INDEX "slice"."__assign_failed_ix_root_step_i7nxwkjb5e" IS 'btree index AssignFailed(root, step)';

COMMENT ON INDEX "slice"."__assign_fenced_ix_root_jvlqbasn7e" IS 'btree index AssignFenced(root)';

COMMENT ON INDEX "slice"."__assign_finish_ix_root_ilehlpwnxm" IS 'btree index AssignFinish(root)';

COMMENT ON INDEX "slice"."__assign_finish_ix_scope_step_53o4eorqpr" IS 'btree index AssignFinish(scope, step)';

COMMENT ON INDEX "slice"."__assign_held_ix_root_35l4gc35rc" IS 'btree index AssignHeld(root)';

COMMENT ON INDEX "slice"."__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" IS 'btree index AssignPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__assign_refusal_ix_root_qadi23h44a" IS 'btree index AssignRefusal(root)';

COMMENT ON INDEX "slice"."__assign_result_ix_root_step_yuug5el3pq" IS 'btree index AssignResult(root, step)';

COMMENT ON INDEX "slice"."__assign_result_ix_step_outcome_root_35vmqe5lxj" IS 'btree index AssignResult(step, outcome, root)';

COMMENT ON INDEX "slice"."__assign_retry_ix_root_oaojw2snch" IS 'btree index AssignRetry(root)';

COMMENT ON INDEX "slice"."__assign_scope_ix_root_v6jmsbgzsq" IS 'btree index AssignScope(root)';

COMMENT ON INDEX "slice"."__assign_skipped_ix_by_phe5rdziqg" IS 'btree index AssignSkipped(by)';

COMMENT ON INDEX "slice"."__assign_skipped_ix_root_dzieud2d67" IS 'btree index AssignSkipped(root)';

COMMENT ON INDEX "slice"."__assign_start_step_ix_root_scope_j5eqvalej3" IS 'btree index AssignStartStep(root, scope)';

COMMENT ON INDEX "slice"."__assign_step_ix_root_scope_64vujnvoiu" IS 'btree index AssignStep(root, scope)';

COMMENT ON INDEX "slice"."__assign_step_ix_scope_kind_step_xn2zxx73po" IS 'btree index AssignStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__chain_admitted_ix_root_3xhdqkpeqw" IS 'btree index ChainAdmitted(root)';

COMMENT ON INDEX "slice"."__chain_chain_run_finish_output_ix_root_wb6phhwc2j" IS 'btree index ChainChainRunFinishOutput(root)';

COMMENT ON INDEX "slice"."__chain_chain_run_input_ix_root_7abe6kcg67" IS 'btree index ChainChainRunInput(root)';

COMMENT ON INDEX "slice"."__chain_claim_ix_root_step_ouvkclqzzd_pred_attempt_azuejmwwty" IS 'btree index ChainClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__chain_done_ix_root_step_nymmh7bgnk" IS 'btree index ChainDone(root, step)';

COMMENT ON INDEX "slice"."__chain_ended_ix_root_e73xltety4" IS 'btree index ChainEnded(root)';

COMMENT ON INDEX "slice"."__chain_exhausted_ix_root_fjn7tzhjc7" IS 'btree index ChainExhausted(root)';

COMMENT ON INDEX "slice"."__chain_failed_ix_root_step_bmwbd7vlrh" IS 'btree index ChainFailed(root, step)';

COMMENT ON INDEX "slice"."__chain_fenced_ix_root_mnawzvb34e" IS 'btree index ChainFenced(root)';

COMMENT ON INDEX "slice"."__chain_finish_ix_root_ypjcgcan7b" IS 'btree index ChainFinish(root)';

COMMENT ON INDEX "slice"."__chain_finish_ix_scope_step_om6bljb56e" IS 'btree index ChainFinish(scope, step)';

COMMENT ON INDEX "slice"."__chain_held_ix_root_havzgkxex3" IS 'btree index ChainHeld(root)';

COMMENT ON INDEX "slice"."__chain_next_ix_root_from_5hhx2qutdl" IS 'btree index ChainNext(root, from)';

COMMENT ON INDEX "slice"."__chain_ordered_finish_output_ix_root_hrdok3djgq" IS 'btree index ChainOrderedFinishOutput(root)';

COMMENT ON INDEX "slice"."__chain_ordered_input_ix_root_wmmk2yqn4t" IS 'btree index ChainOrderedInput(root)';

COMMENT ON INDEX "slice"."__chain_page_earlier_read_ix_root_digest_fxiecdnqw4" IS 'btree index ChainPageEarlierRead(root, digest)';

COMMENT ON INDEX "slice"."__chain_page_earlier_read_ix_root_step_pi6qz5bfaw" IS 'btree index ChainPageEarlierRead(root, step)';

COMMENT ON INDEX "slice"."__chain_page_earlier_row_ix_root_r5voiiw2rg" IS 'btree index ChainPageEarlierRow(root)';

COMMENT ON INDEX "slice"."__chain_page_input_ix_root_step_25b4lmpnjr" IS 'btree index ChainPageInput(root, step)';

COMMENT ON INDEX "slice"."__chain_page_input_after_ix_root_hmbetlosxh" IS 'btree index ChainPageInputAfter(root)';

COMMENT ON INDEX "slice"."__chain_page_output_ix_root_g3alpbog4o" IS 'btree index ChainPageOutput(root)';

COMMENT ON INDEX "slice"."__chain_page_output_next_ix_root_r662e4fglp" IS 'btree index ChainPageOutputNext(root)';

COMMENT ON INDEX "slice"."__chain_page_tree_first_ix_root_gxcpd2aguo" IS 'btree index ChainPageTreeFirst(root)';

COMMENT ON INDEX "slice"."__chain_page_tree_items_ix_root_digest_eiwkcq_6_olq_6yicp4cvau" IS 'btree index ChainPageTreeItems(root, __digest_eiwkcq6olq, __pred_items_3qltx5cx27)';

COMMENT ON INDEX "slice"."__chain_page_tree_items_ix_root_digest_j4l2wg2mhr" IS 'btree index ChainPageTreeItems(root, digest)';

COMMENT ON INDEX "slice"."__chain_page_tree_read_ix_root_digest_q3zaabcene" IS 'btree index ChainPageTreeRead(root, digest)';

COMMENT ON INDEX "slice"."__chain_page_tree_read_ix_root_step_eh6ehvompc" IS 'btree index ChainPageTreeRead(root, step)';

COMMENT ON INDEX "slice"."__chain_page_tree_row_ix_root_nik5vzvev7" IS 'btree index ChainPageTreeRow(root)';

COMMENT ON INDEX "slice"."__chain_page_weights_read_ix_root_digest_75flfwbh4w" IS 'btree index ChainPageWeightsRead(root, digest)';

COMMENT ON INDEX "slice"."__chain_page_weights_read_ix_root_step_qkx2asxvn7" IS 'btree index ChainPageWeightsRead(root, step)';

COMMENT ON INDEX "slice"."__chain_page_weights_row_ix_root_tbrq2r7f3p" IS 'btree index ChainPageWeightsRow(root)';

COMMENT ON INDEX "slice"."__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" IS 'btree index ChainPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__chain_refusal_ix_root_t2ancje4qy" IS 'btree index ChainRefusal(root)';

COMMENT ON INDEX "slice"."__chain_result_ix_root_step_32kpfjvum5" IS 'btree index ChainResult(root, step)';

COMMENT ON INDEX "slice"."__chain_result_ix_step_outcome_root_ipaxj3wl7z" IS 'btree index ChainResult(step, outcome, root)';

COMMENT ON INDEX "slice"."__chain_retry_ix_root_nhtemmz6f2" IS 'btree index ChainRetry(root)';

COMMENT ON INDEX "slice"."__chain_scope_ix_root_idrabjw6oz" IS 'btree index ChainScope(root)';

COMMENT ON INDEX "slice"."__chain_skipped_ix_by_2c45vyfwzy" IS 'btree index ChainSkipped(by)';

COMMENT ON INDEX "slice"."__chain_skipped_ix_root_4knz5mxvl4" IS 'btree index ChainSkipped(root)';

COMMENT ON INDEX "slice"."__chain_start_step_ix_root_scope_76rv5icpsa" IS 'btree index ChainStartStep(root, scope)';

COMMENT ON INDEX "slice"."__chain_step_ix_root_scope_srrhrbyetn" IS 'btree index ChainStep(root, scope)';

COMMENT ON INDEX "slice"."__chain_step_ix_scope_kind_step_tsdjtgaey5" IS 'btree index ChainStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__chain_step_ix_step_kind_root_2pdoze4bhr" IS 'btree index ChainStep(step, kind, root)';

COMMENT ON INDEX "slice"."__clock_admitted_ix_root_s7zcjrj5vn" IS 'btree index ClockAdmitted(root)';

COMMENT ON INDEX "slice"."__clock_chime_input_ix_root_step_ctwanc2seb" IS 'btree index ClockChimeInput(root, step)';

COMMENT ON INDEX "slice"."__clock_chime_output_ix_root_ivn554pu5g" IS 'btree index ClockChimeOutput(root)';

COMMENT ON INDEX "slice"."__clock_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ndcvaxclz" IS 'btree index ClockClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__clock_close_input_ix_root_step_3i3uxrbbrh" IS 'btree index ClockCloseInput(root, step)';

COMMENT ON INDEX "slice"."__clock_close_output_ix_root_56kq4rywmc" IS 'btree index ClockCloseOutput(root)';

COMMENT ON INDEX "slice"."__clock_done_ix_root_step_y7b7fracbz" IS 'btree index ClockDone(root, step)';

COMMENT ON INDEX "slice"."__clock_ended_ix_root_brohrxygrw" IS 'btree index ClockEnded(root)';

COMMENT ON INDEX "slice"."__clock_exhausted_ix_root_mqjwzmnkg2" IS 'btree index ClockExhausted(root)';

COMMENT ON INDEX "slice"."__clock_failed_ix_root_step_h2u36dbqyr" IS 'btree index ClockFailed(root, step)';

COMMENT ON INDEX "slice"."__clock_fenced_ix_root_os2tzc4ej6" IS 'btree index ClockFenced(root)';

COMMENT ON INDEX "slice"."__clock_finish_ix_root_dig34tapz4" IS 'btree index ClockFinish(root)';

COMMENT ON INDEX "slice"."__clock_finish_ix_scope_step_q2cyoxfrgy" IS 'btree index ClockFinish(scope, step)';

COMMENT ON INDEX "slice"."__clock_held_ix_root_x4d2isfem4" IS 'btree index ClockHeld(root)';

COMMENT ON INDEX "slice"."__clock_hourly_finish_output_ix_root_fcxtbzly5h" IS 'btree index ClockHourlyFinishOutput(root)';

COMMENT ON INDEX "slice"."__clock_hourly_input_ix_root_nsyqbwry4l" IS 'btree index ClockHourlyInput(root)';

COMMENT ON INDEX "slice"."__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" IS 'btree index ClockPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__clock_refusal_ix_root_xdxq3ho5kd" IS 'btree index ClockRefusal(root)';

COMMENT ON INDEX "slice"."__clock_result_ix_root_step_vo4ykwoczk" IS 'btree index ClockResult(root, step)';

COMMENT ON INDEX "slice"."__clock_retry_ix_root_zejdeyf4de" IS 'btree index ClockRetry(root)';

COMMENT ON INDEX "slice"."__clock_scope_ix_root_5jnjt75iyn" IS 'btree index ClockScope(root)';

COMMENT ON INDEX "slice"."__clock_sitting_finish_output_ix_root_lvaxizxoa5" IS 'btree index ClockSittingFinishOutput(root)';

COMMENT ON INDEX "slice"."__clock_sitting_input_ix_root_zwyu7ep5i3" IS 'btree index ClockSittingInput(root)';

COMMENT ON INDEX "slice"."__clock_skipped_ix_by_252vuphujb" IS 'btree index ClockSkipped(by)';

COMMENT ON INDEX "slice"."__clock_skipped_ix_root_f3tj6hnqvq" IS 'btree index ClockSkipped(root)';

COMMENT ON INDEX "slice"."__clock_start_step_ix_root_scope_xs5a3wv234" IS 'btree index ClockStartStep(root, scope)';

COMMENT ON INDEX "slice"."__clock_step_ix_root_scope_xautpoatwk" IS 'btree index ClockStep(root, scope)';

COMMENT ON INDEX "slice"."__clock_step_ix_scope_ttvc76thdq" IS 'btree index ClockStep(scope)';

COMMENT ON INDEX "slice"."__fan_admitted_ix_root_cjavzjrmil" IS 'btree index FanAdmitted(root)';

COMMENT ON INDEX "slice"."__fan_batch_finish_output_ix_root_xzmsfqk7gw" IS 'btree index FanBatchFinishOutput(root)';

COMMENT ON INDEX "slice"."__fan_batch_input_ix_root_scope_24ynzsffio" IS 'btree index FanBatchInput(root, scope)';

COMMENT ON INDEX "slice"."__fan_claim_ix_root_step_ouvkclqzzd_pred_attempt_oey_kkpmouft4i" IS 'btree index FanClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__fan_done_ix_root_step_nrkfpkvyya" IS 'btree index FanDone(root, step)';

COMMENT ON INDEX "slice"."__fan_dust_input_ix_root_step_3aq67uii4u" IS 'btree index FanDustInput(root, step)';

COMMENT ON INDEX "slice"."__fan_dust_output_ix_root_72ib45pvnf" IS 'btree index FanDustOutput(root)';

COMMENT ON INDEX "slice"."__fan_ended_ix_root_step_unjzbpnw46" IS 'btree index FanEnded(root, step)';

COMMENT ON INDEX "slice"."__fan_exhausted_ix_root_2diuxfgt5s" IS 'btree index FanExhausted(root)';

COMMENT ON INDEX "slice"."__fan_failed_ix_root_step_ciyeplozai" IS 'btree index FanFailed(root, step)';

COMMENT ON INDEX "slice"."__fan_fan_run_finish_output_ix_root_gol6fu3ini" IS 'btree index FanFanRunFinishOutput(root)';

COMMENT ON INDEX "slice"."__fan_fan_run_input_ix_root_25alzzoykh" IS 'btree index FanFanRunInput(root)';

COMMENT ON INDEX "slice"."__fan_fenced_ix_root_3xl5uhzvmu" IS 'btree index FanFenced(root)';

COMMENT ON INDEX "slice"."__fan_finish_ix_root_i6xnvwhwty" IS 'btree index FanFinish(root)';

COMMENT ON INDEX "slice"."__fan_finish_ix_scope_step_gv7mbzp7pp" IS 'btree index FanFinish(scope, step)';

COMMENT ON INDEX "slice"."__fan_held_ix_root_step_hgpfyg562f" IS 'btree index FanHeld(root, step)';

COMMENT ON INDEX "slice"."__fan_hold_ix_resource_seat_s7bnw22355" IS 'btree index FanHold(resource, seat)';

COMMENT ON INDEX "slice"."__fan_hold_ix_root_ral35akxi3" IS 'btree index FanHold(root)';

COMMENT ON INDEX "slice"."__fan_mop_input_ix_root_step_fyigtnzcib" IS 'btree index FanMopInput(root, step)';

COMMENT ON INDEX "slice"."__fan_mop_output_ix_root_sl77vgnqfl" IS 'btree index FanMopOutput(root)';

COMMENT ON INDEX "slice"."__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" IS 'btree index FanPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__fan_refusal_ix_root_s5ydavkzd3" IS 'btree index FanRefusal(root)';

COMMENT ON INDEX "slice"."__fan_result_ix_root_step_zpvuqrugvb" IS 'btree index FanResult(root, step)';

COMMENT ON INDEX "slice"."__fan_result_ix_step_outcome_root_udaij7stvj" IS 'btree index FanResult(step, outcome, root)';

COMMENT ON INDEX "slice"."__fan_retry_ix_root_sirifasnll" IS 'btree index FanRetry(root)';

COMMENT ON INDEX "slice"."__fan_scope_ix_root_a5wtvynqul" IS 'btree index FanScope(root)';

COMMENT ON INDEX "slice"."__fan_skipped_ix_by_3aejofkhor" IS 'btree index FanSkipped(by)';

COMMENT ON INDEX "slice"."__fan_skipped_ix_root_7ktlrax2wh" IS 'btree index FanSkipped(root)';

COMMENT ON INDEX "slice"."__fan_square_input_ix_root_step_dhgolhjnxl" IS 'btree index FanSquareInput(root, step)';

COMMENT ON INDEX "slice"."__fan_square_output_ix_root_vc5qn45ria" IS 'btree index FanSquareOutput(root)';

COMMENT ON INDEX "slice"."__fan_start_scope_ix_root_scope_t5ybmxw7ah" IS 'btree index FanStartScope(root, scope)';

COMMENT ON INDEX "slice"."__fan_start_step_ix_root_scope_vn7amkfoey" IS 'btree index FanStartStep(root, scope)';

COMMENT ON INDEX "slice"."__fan_step_ix_root_scope_aw525h7gua" IS 'btree index FanStep(root, scope)';

COMMENT ON INDEX "slice"."__fan_step_ix_scope_kind_step_5arz2gb4sb" IS 'btree index FanStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__fan_sweep_finish_output_ix_root_xyklupvq4l" IS 'btree index FanSweepFinishOutput(root)';

COMMENT ON INDEX "slice"."__fan_sweep_input_ix_root_txcp3teesu" IS 'btree index FanSweepInput(root)';

COMMENT ON INDEX "slice"."__fan_within_ix_parent_kind_scope_5ywepfmzj2" IS 'btree index FanWithin(parent, kind, scope)';

COMMENT ON INDEX "slice"."__fan_within_ix_root_parent_ivgq62e3yc" IS 'btree index FanWithin(root, parent)';

COMMENT ON INDEX "slice"."__passage_ix_topic_lzh6djzwn4" IS 'btree index Passage(topic)';

COMMENT ON INDEX "slice"."__passage_ix_embedding_ujugi77ft2" IS 'hnsw index Passage(embedding vectorCosine)';

COMMENT ON INDEX "slice"."__retry_admitted_ix_root_ewgjxicsia" IS 'btree index RetryAdmitted(root)';

COMMENT ON INDEX "slice"."__retry_brittle_input_ix_root_step_hn2bnvkmi5" IS 'btree index RetryBrittleInput(root, step)';

COMMENT ON INDEX "slice"."__retry_brittle_output_ix_root_zbwyfvhpop" IS 'btree index RetryBrittleOutput(root)';

COMMENT ON INDEX "slice"."__retry_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ee63gc76g" IS 'btree index RetryClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__retry_done_ix_root_step_2l3rh6d5g6" IS 'btree index RetryDone(root, step)';

COMMENT ON INDEX "slice"."__retry_ended_ix_root_qdnd63ykxk" IS 'btree index RetryEnded(root)';

COMMENT ON INDEX "slice"."__retry_exhausted_ix_root_zequtvgrfg" IS 'btree index RetryExhausted(root)';

COMMENT ON INDEX "slice"."__retry_failed_ix_root_step_7objnilm6u" IS 'btree index RetryFailed(root, step)';

COMMENT ON INDEX "slice"."__retry_fenced_ix_root_4x3i3cxxnz" IS 'btree index RetryFenced(root)';

COMMENT ON INDEX "slice"."__retry_finish_ix_root_sr33zcrg2m" IS 'btree index RetryFinish(root)';

COMMENT ON INDEX "slice"."__retry_finish_ix_scope_step_6tswescc6v" IS 'btree index RetryFinish(scope, step)';

COMMENT ON INDEX "slice"."__retry_held_ix_root_ytwhkhubpt" IS 'btree index RetryHeld(root)';

COMMENT ON INDEX "slice"."__retry_ladders_finish_output_ix_root_trnh6kkzim" IS 'btree index RetryLaddersFinishOutput(root)';

COMMENT ON INDEX "slice"."__retry_ladders_input_ix_root_co4bnpgzm5" IS 'btree index RetryLaddersInput(root)';

COMMENT ON INDEX "slice"."__retry_patient_input_ix_root_step_ghlof24jma" IS 'btree index RetryPatientInput(root, step)';

COMMENT ON INDEX "slice"."__retry_patient_output_ix_root_zxxckjnki6" IS 'btree index RetryPatientOutput(root)';

COMMENT ON INDEX "slice"."__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" IS 'btree index RetryPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__retry_polite_input_ix_root_step_begldsasuy" IS 'btree index RetryPoliteInput(root, step)';

COMMENT ON INDEX "slice"."__retry_polite_output_ix_root_x5djpoz7ix" IS 'btree index RetryPoliteOutput(root)';

COMMENT ON INDEX "slice"."__retry_refusal_ix_root_7f4y3ykjiz" IS 'btree index RetryRefusal(root)';

COMMENT ON INDEX "slice"."__retry_result_ix_root_step_n7qrlleymb" IS 'btree index RetryResult(root, step)';

COMMENT ON INDEX "slice"."__retry_result_ix_step_outcome_root_5x6caywnin" IS 'btree index RetryResult(step, outcome, root)';

COMMENT ON INDEX "slice"."__retry_retry_ix_root_pkjsumgznf" IS 'btree index RetryRetry(root)';

COMMENT ON INDEX "slice"."__retry_scope_ix_root_7gpsngzwhs" IS 'btree index RetryScope(root)';

COMMENT ON INDEX "slice"."__retry_skipped_ix_by_s7pekf7xtg" IS 'btree index RetrySkipped(by)';

COMMENT ON INDEX "slice"."__retry_skipped_ix_root_uaslhltkgy" IS 'btree index RetrySkipped(root)';

COMMENT ON INDEX "slice"."__retry_start_step_ix_root_scope_f733eg3dwz" IS 'btree index RetryStartStep(root, scope)';

COMMENT ON INDEX "slice"."__retry_steadfast_input_ix_root_step_2oipswgr7i" IS 'btree index RetrySteadfastInput(root, step)';

COMMENT ON INDEX "slice"."__retry_steadfast_output_ix_root_sp7in5arxz" IS 'btree index RetrySteadfastOutput(root)';

COMMENT ON INDEX "slice"."__retry_step_ix_root_scope_ogbhay3han" IS 'btree index RetryStep(root, scope)';

COMMENT ON INDEX "slice"."__retry_step_ix_scope_kind_step_m6ufaqcqmk" IS 'btree index RetryStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__retry_throttled_finish_output_ix_root_tjndqsonfa" IS 'btree index RetryThrottledFinishOutput(root)';

COMMENT ON INDEX "slice"."__retry_throttled_input_ix_root_jl6ezw6jux" IS 'btree index RetryThrottledInput(root)';

COMMENT ON INDEX "slice"."__retry_unhurried_finish_output_ix_root_32l3jvurao" IS 'btree index RetryUnhurriedFinishOutput(root)';

COMMENT ON INDEX "slice"."__retry_unhurried_input_ix_root_fuypwcangl" IS 'btree index RetryUnhurriedInput(root)';

COMMENT ON INDEX "slice"."__review_admitted_ix_root_yaphj2wqrq" IS 'btree index ReviewAdmitted(root)';

COMMENT ON INDEX "slice"."__review_analyze_input_ix_root_step_bdsim6bffp" IS 'btree index ReviewAnalyzeInput(root, step)';

COMMENT ON INDEX "slice"."__review_analyze_output_ix_root_txmlnhynqs" IS 'btree index ReviewAnalyzeOutput(root)';

COMMENT ON INDEX "slice"."__review_claim_ix_root_step_ouvkclqzzd_pred_attempt_y5c5zv3vi7" IS 'btree index ReviewClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__review_done_ix_root_step_wex3643ujb" IS 'btree index ReviewDone(root, step)';

COMMENT ON INDEX "slice"."__review_ended_ix_root_step_7lrp7igbee" IS 'btree index ReviewEnded(root, step)';

COMMENT ON INDEX "slice"."__review_exhausted_ix_root_a6onvxywcp" IS 'btree index ReviewExhausted(root)';

COMMENT ON INDEX "slice"."__review_failed_ix_root_step_cegc4opyjz" IS 'btree index ReviewFailed(root, step)';

COMMENT ON INDEX "slice"."__review_fenced_ix_root_hfika5dgn2" IS 'btree index ReviewFenced(root)';

COMMENT ON INDEX "slice"."__review_finish_ix_root_vnnzpwlvrw" IS 'btree index ReviewFinish(root)';

COMMENT ON INDEX "slice"."__review_finish_ix_scope_step_4k6s2nqgyy" IS 'btree index ReviewFinish(scope, step)';

COMMENT ON INDEX "slice"."__review_gather_input_ix_review_f2zafhsmtj" IS 'btree index ReviewGatherInput(review)';

COMMENT ON INDEX "slice"."__review_gather_input_ix_root_step_wsoyzlnuyr" IS 'btree index ReviewGatherInput(root, step)';

COMMENT ON INDEX "slice"."__review_gather_input_sizes_ix_root_step_mjpuijzth_4_kjg5fulkoq" IS 'btree index ReviewGatherInputSizes(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__review_gather_input_sizes_ix_root_step_dargnvbdje" IS 'btree index ReviewGatherInputSizes(root, step)';

COMMENT ON INDEX "slice"."__review_gather_output_ix_root_5h75f2sreb" IS 'btree index ReviewGatherOutput(root)';

COMMENT ON INDEX "slice"."__review_held_ix_root_step_2vt6xmsrfi" IS 'btree index ReviewHeld(root, step)';

COMMENT ON INDEX "slice"."__review_hold_ix_resource_seat_3p66dnxzad" IS 'btree index ReviewHold(resource, seat)';

COMMENT ON INDEX "slice"."__review_hold_ix_root_escg5zeez6" IS 'btree index ReviewHold(root)';

COMMENT ON INDEX "slice"."__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" IS 'btree index ReviewPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__review_questions_finish_output_ix_root_4nx3bn5p6q" IS 'btree index ReviewQuestionsFinishOutput(root)';

COMMENT ON INDEX "slice"."__review_questions_input_ix_root_scope_sy2ibbggdo" IS 'btree index ReviewQuestionsInput(root, scope)';

COMMENT ON INDEX "slice"."__review_refusal_ix_root_mlhjigotld" IS 'btree index ReviewRefusal(root)';

COMMENT ON INDEX "slice"."__review_result_ix_root_step_h2vlej63gu" IS 'btree index ReviewResult(root, step)';

COMMENT ON INDEX "slice"."__review_result_ix_step_outcome_root_lbrp6nyb6i" IS 'btree index ReviewResult(step, outcome, root)';

COMMENT ON INDEX "slice"."__review_retry_ix_root_jzaljr6st4" IS 'btree index ReviewRetry(root)';

COMMENT ON INDEX "slice"."__review_review_run_finish_output_ix_root_qafu34k5sc" IS 'btree index ReviewReviewRunFinishOutput(root)';

COMMENT ON INDEX "slice"."__review_review_run_input_ix_root_abc3mheba4" IS 'btree index ReviewReviewRunInput(root)';

COMMENT ON INDEX "slice"."__review_review_run_input_sizes_ix_root_scope_u_6_4kpsy5wss6" IS 'btree index ReviewReviewRunInputSizes(root, __scope_u6ypqf2r2z, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice"."__review_review_run_input_sizes_ix_root_scope_2dnx7skohl" IS 'btree index ReviewReviewRunInputSizes(root, scope)';

COMMENT ON INDEX "slice"."__review_save_input_ix_root_step_xd5keujf45" IS 'btree index ReviewSaveInput(root, step)';

COMMENT ON INDEX "slice"."__review_save_output_ix_root_kjgtclpf33" IS 'btree index ReviewSaveOutput(root)';

COMMENT ON INDEX "slice"."__review_saved_ix_root_from_v3hbuyomqf" IS 'btree index ReviewSaved(root, from)';

COMMENT ON INDEX "slice"."__review_scope_ix_root_riuyuqzrup" IS 'btree index ReviewScope(root)';

COMMENT ON INDEX "slice"."__review_skipped_ix_by_6z5g634njq" IS 'btree index ReviewSkipped(by)';

COMMENT ON INDEX "slice"."__review_skipped_ix_root_qms5trih4o" IS 'btree index ReviewSkipped(root)';

COMMENT ON INDEX "slice"."__review_split_ix_root_from_p42z7fr7z4" IS 'btree index ReviewSplit(root, from)';

COMMENT ON INDEX "slice"."__review_start_scope_ix_root_scope_nki37x7g5o" IS 'btree index ReviewStartScope(root, scope)';

COMMENT ON INDEX "slice"."__review_start_step_ix_root_scope_hmuyhclidm" IS 'btree index ReviewStartStep(root, scope)';

COMMENT ON INDEX "slice"."__review_step_ix_root_scope_jvmzqg2kjy" IS 'btree index ReviewStep(root, scope)';

COMMENT ON INDEX "slice"."__review_step_ix_scope_kind_step_udhxex4i5c" IS 'btree index ReviewStep(scope, kind, step)';

COMMENT ON INDEX "slice"."__review_within_ix_parent_kind_scope_dtilr5xomp" IS 'btree index ReviewWithin(parent, kind, scope)';

COMMENT ON INDEX "slice"."__review_within_ix_root_parent_ah77vqo2bx" IS 'btree index ReviewWithin(root, parent)';

COMMENT ON INDEX "slice"."__sync_admitted_ix_root_vormyuqk5x" IS 'btree index SyncAdmitted(root)';

COMMENT ON INDEX "slice"."__sync_build_input_ix_root_step_azxcsmj373" IS 'btree index SyncBuildInput(root, step)';

COMMENT ON INDEX "slice"."__sync_build_output_ix_root_amskeycb7k" IS 'btree index SyncBuildOutput(root)';

COMMENT ON INDEX "slice"."__sync_claim_ix_root_step_ouvkclqzzd_pred_attempt_f3q5xsae3q" IS 'btree index SyncClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__sync_copy_input_ix_root_step_42uulsghoj" IS 'btree index SyncCopyInput(root, step)';

COMMENT ON INDEX "slice"."__sync_copy_output_ix_root_k6ia72urcq" IS 'btree index SyncCopyOutput(root)';

COMMENT ON INDEX "slice"."__sync_done_ix_root_step_ionbtp5et7" IS 'btree index SyncDone(root, step)';

COMMENT ON INDEX "slice"."__sync_ended_ix_root_xi7qlk4cj4" IS 'btree index SyncEnded(root)';

COMMENT ON INDEX "slice"."__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" IS 'btree index SyncExclusive(kind, key, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__sync_exclusive_key_ix_root_tfhjjf4qg2" IS 'btree index SyncExclusiveKey(root)';

COMMENT ON INDEX "slice"."__sync_exhausted_ix_root_yqhpt7jtz4" IS 'btree index SyncExhausted(root)';

COMMENT ON INDEX "slice"."__sync_failed_ix_root_step_iieo2dpdbf" IS 'btree index SyncFailed(root, step)';

COMMENT ON INDEX "slice"."__sync_fenced_ix_root_peedftug4f" IS 'btree index SyncFenced(root)';

COMMENT ON INDEX "slice"."__sync_finish_ix_root_zrpyhvrere" IS 'btree index SyncFinish(root)';

COMMENT ON INDEX "slice"."__sync_finish_ix_scope_step_owsw7m5w74" IS 'btree index SyncFinish(scope, step)';

COMMENT ON INDEX "slice"."__sync_gold_finish_output_ix_root_gqwdl72ukv" IS 'btree index SyncGoldFinishOutput(root)';

COMMENT ON INDEX "slice"."__sync_gold_input_ix_root_fmnsnept43" IS 'btree index SyncGoldInput(root)';

COMMENT ON INDEX "slice"."__sync_held_ix_root_yxqvodlkmy" IS 'btree index SyncHeld(root)';

COMMENT ON INDEX "slice"."__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" IS 'btree index SyncPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__sync_refusal_ix_root_642sem4ijz" IS 'btree index SyncRefusal(root)';

COMMENT ON INDEX "slice"."__sync_result_ix_root_step_t2jh3c7vsq" IS 'btree index SyncResult(root, step)';

COMMENT ON INDEX "slice"."__sync_retry_ix_root_j5nndics7d" IS 'btree index SyncRetry(root)';

COMMENT ON INDEX "slice"."__sync_scope_ix_root_7f6s5dqo5t" IS 'btree index SyncScope(root)';

COMMENT ON INDEX "slice"."__sync_skipped_ix_by_ttq6dm55n2" IS 'btree index SyncSkipped(by)';

COMMENT ON INDEX "slice"."__sync_skipped_ix_root_cjefss5pid" IS 'btree index SyncSkipped(root)';

COMMENT ON INDEX "slice"."__sync_start_step_ix_root_scope_5d3x6uas5c" IS 'btree index SyncStartStep(root, scope)';

COMMENT ON INDEX "slice"."__sync_step_ix_root_scope_l4sfn7gzd3" IS 'btree index SyncStep(root, scope)';

COMMENT ON INDEX "slice"."__sync_step_ix_scope_qlsdbwk3lt" IS 'btree index SyncStep(scope)';

COMMENT ON INDEX "slice"."__sync_sync_run_finish_output_ix_root_7lxs3t6qrm" IS 'btree index SyncSyncRunFinishOutput(root)';

COMMENT ON INDEX "slice"."__sync_sync_run_input_ix_root_bp43cbf2uj" IS 'btree index SyncSyncRunInput(root)';

COMMENT ON INDEX "slice"."__writeback_admitted_ix_root_h3gyzivmzl" IS 'btree index WritebackAdmitted(root)';

COMMENT ON INDEX "slice"."__writeback_claim_ix_root_step_ouvkclqzzd_pred_vsh4c26q54" IS 'btree index WritebackClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice"."__writeback_deliver_input_ix_root_step_42hexztzwm" IS 'btree index WritebackDeliverInput(root, step)';

COMMENT ON INDEX "slice"."__writeback_deliver_output_ix_root_65uep5rbzs" IS 'btree index WritebackDeliverOutput(root)';

COMMENT ON INDEX "slice"."__writeback_done_ix_root_step_dxzcxsyzki" IS 'btree index WritebackDone(root, step)';

COMMENT ON INDEX "slice"."__writeback_ended_ix_root_22eyuup6mt" IS 'btree index WritebackEnded(root)';

COMMENT ON INDEX "slice"."__writeback_exhausted_ix_root_cvj7pxcezh" IS 'btree index WritebackExhausted(root)';

COMMENT ON INDEX "slice"."__writeback_failed_ix_root_step_r27jysgea6" IS 'btree index WritebackFailed(root, step)';

COMMENT ON INDEX "slice"."__writeback_fenced_ix_root_jynr6i3m3n" IS 'btree index WritebackFenced(root)';

COMMENT ON INDEX "slice"."__writeback_finish_ix_root_7jp3nmlcxk" IS 'btree index WritebackFinish(root)';

COMMENT ON INDEX "slice"."__writeback_finish_ix_scope_step_6ooh2ahmws" IS 'btree index WritebackFinish(scope, step)';

COMMENT ON INDEX "slice"."__writeback_held_ix_root_htj435svmc" IS 'btree index WritebackHeld(root)';

COMMENT ON INDEX "slice"."__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" IS 'btree index WritebackPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__writeback_refusal_ix_root_rpqfuncax3" IS 'btree index WritebackRefusal(root)';

COMMENT ON INDEX "slice"."__writeback_result_ix_root_step_m7c5flfb7z" IS 'btree index WritebackResult(root, step)';

COMMENT ON INDEX "slice"."__writeback_retry_ix_root_jksgr5toee" IS 'btree index WritebackRetry(root)';

COMMENT ON INDEX "slice"."__writeback_scope_ix_root_kaxydmiokb" IS 'btree index WritebackScope(root)';

COMMENT ON INDEX "slice"."__writeback_skipped_ix_by_3ei4k4fj53" IS 'btree index WritebackSkipped(by)';

COMMENT ON INDEX "slice"."__writeback_skipped_ix_root_ss2ptzee7p" IS 'btree index WritebackSkipped(root)';

COMMENT ON INDEX "slice"."__writeback_start_step_ix_root_scope_azon5ljjqq" IS 'btree index WritebackStartStep(root, scope)';

COMMENT ON INDEX "slice"."__writeback_step_ix_root_scope_oebhktgfcr" IS 'btree index WritebackStep(root, scope)';

COMMENT ON INDEX "slice"."__writeback_step_ix_scope_smnbmwitav" IS 'btree index WritebackStep(scope)';

COMMENT ON INDEX "slice"."__writeback_writeback_finish_output_ix_root_4g3n3nyiax" IS 'btree index WritebackWritebackFinishOutput(root)';

COMMENT ON INDEX "slice"."__writeback_writeback_input_ix_root_fhpchifc4b" IS 'btree index WritebackWritebackInput(root)';

COMMENT ON STATISTICS "slice"."__assign_finish_stats_scope_step_ld6jyxztu6" IS 'statistics AssignFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__assign_step_stats_kind_scope_wiztsdmmtf" IS 'statistics AssignStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__chain_finish_stats_scope_step_z7lvm6j2l6" IS 'statistics ChainFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__chain_step_stats_kind_scope_tc5nmidpxu" IS 'statistics ChainStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__clock_finish_stats_scope_step_ejqaucw3q4" IS 'statistics ClockFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__fan_finish_stats_scope_step_4mm4p6zm66" IS 'statistics FanFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__fan_step_stats_kind_scope_xmuvugpu6n" IS 'statistics FanStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__fan_within_stats_kind_parent_3vvpgco4da" IS 'statistics FanWithin(kind, parent)';

COMMENT ON STATISTICS "slice"."__retry_finish_stats_scope_step_2nxi4d7tdj" IS 'statistics RetryFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__retry_step_stats_kind_scope_osnqmvpfhd" IS 'statistics RetryStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__review_finish_stats_scope_step_ac6ft3yr6e" IS 'statistics ReviewFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__review_step_stats_kind_scope_kgaij4jpus" IS 'statistics ReviewStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__review_within_stats_kind_parent_w3ajh3gekc" IS 'statistics ReviewWithin(kind, parent)';

COMMENT ON STATISTICS "slice"."__sync_exclusive_stats_key_kind_smed76p3zh" IS 'statistics SyncExclusive(key, kind)';

COMMENT ON STATISTICS "slice"."__sync_finish_stats_scope_step_xiaq6np7mf" IS 'statistics SyncFinish(scope, step)';

COMMENT ON STATISTICS "slice"."__writeback_finish_stats_scope_step_3knpjnabow" IS 'statistics WritebackFinish(scope, step)';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_ll6b7ywsze"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignAssignmentInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_wpkroo4gqt"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignAssignmentInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_i7zu2o4rtk"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_gtyvqnsvt6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_iez77fjrkx"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideOutput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_dl4rc34gos"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideOutputStageRest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_done_4pcl2f7b3b"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_r33s4dgzjf"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignEmbedInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_chain_run_input_uxohggxxkj"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainChainRunInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_done_bny4tyogt6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_q2evszpml3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainPageInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_fzumyjkjso"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockChimeInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_done_6guyjh3v2y"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_input_fn6672r6mx"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockHourlyInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_ahcbwfepfq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanBatchInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_claim_5zhncu7tmh"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_done_l6g3p6tb2e"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_stc6d3drdc"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDustInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_fan_run_input_votrm724i7"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanFanRunInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_cbulcazgwq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryBrittleInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_done_exdy4mgpv7"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_ladders_input_qd7ko7rsgf"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryLaddersInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_ggjatlxopu"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewAnalyzeInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_claim_u72bg4dlcj"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_done_ip44ulamia"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_gxroktbpm3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewQuestionsInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_review_run_input_25ydhlu2pi"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewReviewRunInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_f7w2cjex5n"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncBuildInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_done_e44hnpqjcl"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_gold_input_gc453e6dwy"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncGoldInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_em5yf5j4by"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDeliverInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_xjs6icnj3y"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_writeback_input_q562k5cdao"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackWritebackInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__capture_assign_assignment_input_v4dsbpafdp"() IS 'rule capture of AssignAssignmentInput';

COMMENT ON FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_cz7fec2bmo"() IS 'rule capture of AssignAssignmentInputModeNearest';

COMMENT ON FUNCTION "slice"."__capture_assign_assignment_input_mode_within_zcwpiu2ek3"() IS 'rule capture of AssignAssignmentInputModeWithin';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_input_njdynt4fid"() IS 'rule capture of AssignDecideInput';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_wixai5r2vy"() IS 'rule capture of AssignDecideInputModeNearest';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_input_mode_within_z4yiact3e2"() IS 'rule capture of AssignDecideInputModeWithin';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_output_ha3hhjgf66"() IS 'rule capture of AssignDecideOutput';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_output_stage_rest_6zt5hnpimr"() IS 'rule capture of AssignDecideOutputStageRest';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_output_stage_serve_ksfwcs5uqr"() IS 'rule capture of AssignDecideOutputStageServe';

COMMENT ON FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"() IS 'rule capture of AssignDone';

COMMENT ON FUNCTION "slice"."__capture_assign_embed_input_42cyh7nkt5"() IS 'rule capture of AssignEmbedInput';

COMMENT ON FUNCTION "slice"."__capture_assign_embed_input_mode_nearest_iersiff2v4"() IS 'rule capture of AssignEmbedInputModeNearest';

COMMENT ON FUNCTION "slice"."__capture_assign_embed_input_mode_within_nppeylhr6x"() IS 'rule capture of AssignEmbedInputModeWithin';

COMMENT ON FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"() IS 'rule capture of AssignFailed';

COMMENT ON FUNCTION "slice"."__capture_assign_result_3zix6jjqic"() IS 'rule capture of AssignResult';

COMMENT ON FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"() IS 'rule capture of AssignRoot';

COMMENT ON FUNCTION "slice"."__capture_assign_step_bxkkty5l67"() IS 'rule capture of AssignStep';

COMMENT ON FUNCTION "slice"."__capture_chain_chain_run_input_22zniabfu6"() IS 'rule capture of ChainChainRunInput';

COMMENT ON FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"() IS 'rule capture of ChainDone';

COMMENT ON FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"() IS 'rule capture of ChainFailed';

COMMENT ON FUNCTION "slice"."__capture_chain_ordered_input_gtvtheqcdu"() IS 'rule capture of ChainOrderedInput';

COMMENT ON FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"() IS 'rule capture of ChainPageInput';

COMMENT ON FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"() IS 'rule capture of ChainResult';

COMMENT ON FUNCTION "slice"."__capture_chain_root_3cootamwgf"() IS 'rule capture of ChainRoot';

COMMENT ON FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"() IS 'rule capture of ChainStep';

COMMENT ON FUNCTION "slice"."__capture_clock_chime_input_lqffb4ba6u"() IS 'rule capture of ClockChimeInput';

COMMENT ON FUNCTION "slice"."__capture_clock_close_input_yjeq7jdopp"() IS 'rule capture of ClockCloseInput';

COMMENT ON FUNCTION "slice"."__capture_clock_done_dfh6reh5mi"() IS 'rule capture of ClockDone';

COMMENT ON FUNCTION "slice"."__capture_clock_failed_6qny3r6u6y"() IS 'rule capture of ClockFailed';

COMMENT ON FUNCTION "slice"."__capture_clock_hourly_input_k6w5jmeunh"() IS 'rule capture of ClockHourlyInput';

COMMENT ON FUNCTION "slice"."__capture_clock_result_jy4vcxcejz"() IS 'rule capture of ClockResult';

COMMENT ON FUNCTION "slice"."__capture_clock_root_tuedr7b4mb"() IS 'rule capture of ClockRoot';

COMMENT ON FUNCTION "slice"."__capture_clock_sitting_input_p6iokutf2j"() IS 'rule capture of ClockSittingInput';

COMMENT ON FUNCTION "slice"."__capture_clock_step_u5p64rffid"() IS 'rule capture of ClockStep';

COMMENT ON FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"() IS 'rule capture of FanBatchInput';

COMMENT ON FUNCTION "slice"."__capture_fan_claim_ctcrhycatd"() IS 'rule capture of FanClaim';

COMMENT ON FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"() IS 'rule capture of FanDone';

COMMENT ON FUNCTION "slice"."__capture_fan_dust_input_nul3zoihk6"() IS 'rule capture of FanDustInput';

COMMENT ON FUNCTION "slice"."__capture_fan_ended_gzzovkkada"() IS 'rule capture of FanEnded';

COMMENT ON FUNCTION "slice"."__capture_fan_failed_ecscfsee25"() IS 'rule capture of FanFailed';

COMMENT ON FUNCTION "slice"."__capture_fan_fan_run_input_nhtoc6lxpa"() IS 'rule capture of FanFanRunInput';

COMMENT ON FUNCTION "slice"."__capture_fan_held_ekrigwpm7j"() IS 'rule capture of FanHeld';

COMMENT ON FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() IS 'rule capture of FanHold';

COMMENT ON FUNCTION "slice"."__capture_fan_mop_input_6phw2xwhnz"() IS 'rule capture of FanMopInput';

COMMENT ON FUNCTION "slice"."__capture_fan_result_tevufz2c53"() IS 'rule capture of FanResult';

COMMENT ON FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"() IS 'rule capture of FanRoot';

COMMENT ON FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"() IS 'rule capture of FanSquareInput';

COMMENT ON FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"() IS 'rule capture of FanStep';

COMMENT ON FUNCTION "slice"."__capture_fan_sweep_input_ivp4vsj3q2"() IS 'rule capture of FanSweepInput';

COMMENT ON FUNCTION "slice"."__capture_fan_within_pwsrdikydc"() IS 'rule capture of FanWithin';

COMMENT ON FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"() IS 'rule capture of RetryBrittleInput';

COMMENT ON FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"() IS 'rule capture of RetryDone';

COMMENT ON FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"() IS 'rule capture of RetryFailed';

COMMENT ON FUNCTION "slice"."__capture_retry_ladders_input_omks52b5nc"() IS 'rule capture of RetryLaddersInput';

COMMENT ON FUNCTION "slice"."__capture_retry_patient_input_cfxejzkw67"() IS 'rule capture of RetryPatientInput';

COMMENT ON FUNCTION "slice"."__capture_retry_polite_input_4s6i2erlwp"() IS 'rule capture of RetryPoliteInput';

COMMENT ON FUNCTION "slice"."__capture_retry_result_oof7kiqgid"() IS 'rule capture of RetryResult';

COMMENT ON FUNCTION "slice"."__capture_retry_root_nujht4q2jp"() IS 'rule capture of RetryRoot';

COMMENT ON FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"() IS 'rule capture of RetrySteadfastInput';

COMMENT ON FUNCTION "slice"."__capture_retry_step_gox3p6ldla"() IS 'rule capture of RetryStep';

COMMENT ON FUNCTION "slice"."__capture_retry_throttled_input_yo3mnkz5vy"() IS 'rule capture of RetryThrottledInput';

COMMENT ON FUNCTION "slice"."__capture_retry_unhurried_input_foljexx34z"() IS 'rule capture of RetryUnhurriedInput';

COMMENT ON FUNCTION "slice"."__capture_review_analyze_input_fkzkzvqpo6"() IS 'rule capture of ReviewAnalyzeInput';

COMMENT ON FUNCTION "slice"."__capture_review_claim_qyslgqsqs7"() IS 'rule capture of ReviewClaim';

COMMENT ON FUNCTION "slice"."__capture_review_done_gxpax2oqid"() IS 'rule capture of ReviewDone';

COMMENT ON FUNCTION "slice"."__capture_review_ended_3o7fwr7f2y"() IS 'rule capture of ReviewEnded';

COMMENT ON FUNCTION "slice"."__capture_review_failed_3nd4cow637"() IS 'rule capture of ReviewFailed';

COMMENT ON FUNCTION "slice"."__capture_review_gather_input_kgvjnvjsxw"() IS 'rule capture of ReviewGatherInput';

COMMENT ON FUNCTION "slice"."__capture_review_held_p4ye73l7sh"() IS 'rule capture of ReviewHeld';

COMMENT ON FUNCTION "slice"."__capture_review_hold_3d64vgpezl"() IS 'rule capture of ReviewHold';

COMMENT ON FUNCTION "slice"."__capture_review_questions_input_yqxbkx73iq"() IS 'rule capture of ReviewQuestionsInput';

COMMENT ON FUNCTION "slice"."__capture_review_result_m25jokn327"() IS 'rule capture of ReviewResult';

COMMENT ON FUNCTION "slice"."__capture_review_review_run_input_gxlpdnn5rf"() IS 'rule capture of ReviewReviewRunInput';

COMMENT ON FUNCTION "slice"."__capture_review_root_qgu5iwjyle"() IS 'rule capture of ReviewRoot';

COMMENT ON FUNCTION "slice"."__capture_review_save_input_pdrqqmy66f"() IS 'rule capture of ReviewSaveInput';

COMMENT ON FUNCTION "slice"."__capture_review_step_3y2i7xqqpk"() IS 'rule capture of ReviewStep';

COMMENT ON FUNCTION "slice"."__capture_review_within_aqblir65lf"() IS 'rule capture of ReviewWithin';

COMMENT ON FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"() IS 'rule capture of SyncBuildInput';

COMMENT ON FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"() IS 'rule capture of SyncCopyInput';

COMMENT ON FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"() IS 'rule capture of SyncDone';

COMMENT ON FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"() IS 'rule capture of SyncFailed';

COMMENT ON FUNCTION "slice"."__capture_sync_gold_input_tmd3fs2hx5"() IS 'rule capture of SyncGoldInput';

COMMENT ON FUNCTION "slice"."__capture_sync_result_led6m2o22r"() IS 'rule capture of SyncResult';

COMMENT ON FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"() IS 'rule capture of SyncRoot';

COMMENT ON FUNCTION "slice"."__capture_sync_step_35gtwztkwz"() IS 'rule capture of SyncStep';

COMMENT ON FUNCTION "slice"."__capture_sync_sync_run_input_foaz3a7y6q"() IS 'rule capture of SyncSyncRunInput';

COMMENT ON FUNCTION "slice"."__capture_writeback_deliver_input_zk6wjx47wq"() IS 'rule capture of WritebackDeliverInput';

COMMENT ON FUNCTION "slice"."__capture_writeback_done_qfh7utr7q5"() IS 'rule capture of WritebackDone';

COMMENT ON FUNCTION "slice"."__capture_writeback_failed_xewjzd2yye"() IS 'rule capture of WritebackFailed';

COMMENT ON FUNCTION "slice"."__capture_writeback_result_cd63iav5l7"() IS 'rule capture of WritebackResult';

COMMENT ON FUNCTION "slice"."__capture_writeback_root_4gkeh6e4ge"() IS 'rule capture of WritebackRoot';

COMMENT ON FUNCTION "slice"."__capture_writeback_step_dklkh3hpav"() IS 'rule capture of WritebackStep';

COMMENT ON FUNCTION "slice"."__capture_writeback_writeback_input_wmdhzuwf32"() IS 'rule capture of WritebackWritebackInput';

COMMENT ON FUNCTION "slice"."__immutable_assign_admitted_dmbitza5gi"() IS 'immutability guard of AssignAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_assign_asked_rftjphyude"() IS 'immutability guard of AssignAsked';

COMMENT ON FUNCTION "slice"."__immutable_assign_assignment_finish_output_7ztgeqwapq"() IS 'immutability guard of AssignAssignmentFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_assign_assignment_input_26bgxjv3jk"() IS 'immutability guard of AssignAssignmentInput';

COMMENT ON FUNCTION "slice"."__immutable_assign_assignment_input_exclude_hmyilvuaii"() IS 'immutability guard of AssignAssignmentInputExclude';

COMMENT ON FUNCTION "slice"."__immutable_assign_assignment_input_mode_nearest_k7axrvsa5x"() IS 'immutability guard of AssignAssignmentInputModeNearest';

COMMENT ON FUNCTION "slice"."__immutable_assign_assignment_input_mode_within_prql7mhf6o"() IS 'immutability guard of AssignAssignmentInputModeWithin';

COMMENT ON FUNCTION "slice"."__immutable_assign_assignment_input_near_rv7fv5gqhd"() IS 'immutability guard of AssignAssignmentInputNear';

COMMENT ON FUNCTION "slice"."__immutable_assign_claim_xbbzgda6vw"() IS 'immutability guard of AssignClaim';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_input_5issm7uxuh"() IS 'immutability guard of AssignDecideInput';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_input_exclude_g7vtqkvft7"() IS 'immutability guard of AssignDecideInputExclude';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_input_mode_nearest_aye4p7qnad"() IS 'immutability guard of AssignDecideInputModeNearest';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_input_mode_within_zt3h44y2rx"() IS 'immutability guard of AssignDecideInputModeWithin';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_nearest_read_5yjnbdpdrp"() IS 'immutability guard of AssignDecideNearestRead';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_nearest_row_3kw2p6zy6g"() IS 'immutability guard of AssignDecideNearestRow';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_q7sye4ocju"() IS 'immutability guard of AssignDecideOutput';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_stage_rest_2l67dyutkv"() IS 'immutability guard of AssignDecideOutputStageRest';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_stage_serve_bqiqmjczjs"() IS 'immutability guard of AssignDecideOutputStageServe';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_weighed_yiycf2llnn"() IS 'immutability guard of AssignDecideOutputWeighed';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_seen_read_lrclhhd2kt"() IS 'immutability guard of AssignDecideSeenRead';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_seen_row_h3sk5n26fi"() IS 'immutability guard of AssignDecideSeenRow';

COMMENT ON FUNCTION "slice"."__immutable_assign_done_qrcqni3ju2"() IS 'immutability guard of AssignDone';

COMMENT ON FUNCTION "slice"."__immutable_assign_embed_input_yru3mcm5zw"() IS 'immutability guard of AssignEmbedInput';

COMMENT ON FUNCTION "slice"."__immutable_assign_embed_input_exclude_42jkkh66qm"() IS 'immutability guard of AssignEmbedInputExclude';

COMMENT ON FUNCTION "slice"."__immutable_assign_embed_input_mode_nearest_olysh66fm7"() IS 'immutability guard of AssignEmbedInputModeNearest';

COMMENT ON FUNCTION "slice"."__immutable_assign_embed_input_mode_within_4kmqipjgdu"() IS 'immutability guard of AssignEmbedInputModeWithin';

COMMENT ON FUNCTION "slice"."__immutable_assign_embed_input_near_hybwllbw5h"() IS 'immutability guard of AssignEmbedInputNear';

COMMENT ON FUNCTION "slice"."__immutable_assign_embed_output_lshxp223af"() IS 'immutability guard of AssignEmbedOutput';

COMMENT ON FUNCTION "slice"."__immutable_assign_ended_j57uukfasp"() IS 'immutability guard of AssignEnded';

COMMENT ON FUNCTION "slice"."__immutable_assign_exhausted_vp3saum6wy"() IS 'immutability guard of AssignExhausted';

COMMENT ON FUNCTION "slice"."__immutable_assign_failed_yl6oy344n6"() IS 'immutability guard of AssignFailed';

COMMENT ON FUNCTION "slice"."__immutable_assign_fenced_mpcwo52cz5"() IS 'immutability guard of AssignFenced';

COMMENT ON FUNCTION "slice"."__immutable_assign_finish_4gwwhr7j7j"() IS 'immutability guard of AssignFinish';

COMMENT ON FUNCTION "slice"."__immutable_assign_held_e5omypfirw"() IS 'immutability guard of AssignHeld';

COMMENT ON FUNCTION "slice"."__immutable_assign_paused_5n3oauuljz"() IS 'immutability guard of AssignPaused';

COMMENT ON FUNCTION "slice"."__immutable_assign_refusal_6ndeutorgg"() IS 'immutability guard of AssignRefusal';

COMMENT ON FUNCTION "slice"."__immutable_assign_result_excrys6e3o"() IS 'immutability guard of AssignResult';

COMMENT ON FUNCTION "slice"."__immutable_assign_resumed_wcgii3wia6"() IS 'immutability guard of AssignResumed';

COMMENT ON FUNCTION "slice"."__immutable_assign_retry_qq4klsi3nn"() IS 'immutability guard of AssignRetry';

COMMENT ON FUNCTION "slice"."__immutable_assign_root_z5tsxfpw75"() IS 'immutability guard of AssignRoot';

COMMENT ON FUNCTION "slice"."__immutable_assign_scope_wbrdyjflor"() IS 'immutability guard of AssignScope';

COMMENT ON FUNCTION "slice"."__immutable_assign_skipped_s6cqm663up"() IS 'immutability guard of AssignSkipped';

COMMENT ON FUNCTION "slice"."__immutable_assign_start_step_qt7w56frlu"() IS 'immutability guard of AssignStartStep';

COMMENT ON FUNCTION "slice"."__immutable_assign_step_bwurcagx2e"() IS 'immutability guard of AssignStep';

COMMENT ON FUNCTION "slice"."__immutable_assigned_tbugyxabsc"() IS 'immutability guard of Assigned';

COMMENT ON FUNCTION "slice"."__immutable_audit_tvhiun4dxz"() IS 'immutability guard of Audit';

COMMENT ON FUNCTION "slice"."__immutable_built_2sr4obr6b3"() IS 'immutability guard of Built';

COMMENT ON FUNCTION "slice"."__immutable_chain_admitted_fuqonu5big"() IS 'immutability guard of ChainAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_chain_chain_run_finish_output_u2vsexjljk"() IS 'immutability guard of ChainChainRunFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_chain_chain_run_input_cfqxbaar7v"() IS 'immutability guard of ChainChainRunInput';

COMMENT ON FUNCTION "slice"."__immutable_chain_claim_ds4iaekgzm"() IS 'immutability guard of ChainClaim';

COMMENT ON FUNCTION "slice"."__immutable_chain_done_d4qltap6a2"() IS 'immutability guard of ChainDone';

COMMENT ON FUNCTION "slice"."__immutable_chain_ended_b7gitrghvy"() IS 'immutability guard of ChainEnded';

COMMENT ON FUNCTION "slice"."__immutable_chain_exhausted_6ssacuqoj7"() IS 'immutability guard of ChainExhausted';

COMMENT ON FUNCTION "slice"."__immutable_chain_failed_ygqiyt6fnh"() IS 'immutability guard of ChainFailed';

COMMENT ON FUNCTION "slice"."__immutable_chain_fenced_7wtscdbzek"() IS 'immutability guard of ChainFenced';

COMMENT ON FUNCTION "slice"."__immutable_chain_finish_ksgns4oqkj"() IS 'immutability guard of ChainFinish';

COMMENT ON FUNCTION "slice"."__immutable_chain_held_cqkxomebpa"() IS 'immutability guard of ChainHeld';

COMMENT ON FUNCTION "slice"."__immutable_chain_next_q5lvsogi6m"() IS 'immutability guard of ChainNext';

COMMENT ON FUNCTION "slice"."__immutable_chain_ordered_finish_output_e5q4ti5eip"() IS 'immutability guard of ChainOrderedFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_chain_ordered_input_dcjkg5am3m"() IS 'immutability guard of ChainOrderedInput';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_earlier_read_nqoaojb6qw"() IS 'immutability guard of ChainPageEarlierRead';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_earlier_row_haywtldv4j"() IS 'immutability guard of ChainPageEarlierRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_input_ygs3x37afz"() IS 'immutability guard of ChainPageInput';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_input_after_ebt6pg2db2"() IS 'immutability guard of ChainPageInputAfter';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_output_jgnuxzjizs"() IS 'immutability guard of ChainPageOutput';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_output_next_lihvo4atmg"() IS 'immutability guard of ChainPageOutputNext';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_tree_first_dx6efgvl7m"() IS 'immutability guard of ChainPageTreeFirst';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_tree_items_lkppdwfrxg"() IS 'immutability guard of ChainPageTreeItems';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_tree_read_h43ekusxgb"() IS 'immutability guard of ChainPageTreeRead';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_tree_row_25j5mamg5x"() IS 'immutability guard of ChainPageTreeRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_weights_read_54klb742qw"() IS 'immutability guard of ChainPageWeightsRead';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_weights_row_kngll2a2jo"() IS 'immutability guard of ChainPageWeightsRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_paused_aoyhzggt5w"() IS 'immutability guard of ChainPaused';

COMMENT ON FUNCTION "slice"."__immutable_chain_refusal_26czlahjb4"() IS 'immutability guard of ChainRefusal';

COMMENT ON FUNCTION "slice"."__immutable_chain_result_vjxlyihjif"() IS 'immutability guard of ChainResult';

COMMENT ON FUNCTION "slice"."__immutable_chain_resumed_pyb74if2ds"() IS 'immutability guard of ChainResumed';

COMMENT ON FUNCTION "slice"."__immutable_chain_retry_buegvn7dom"() IS 'immutability guard of ChainRetry';

COMMENT ON FUNCTION "slice"."__immutable_chain_root_kfhmbkwvfv"() IS 'immutability guard of ChainRoot';

COMMENT ON FUNCTION "slice"."__immutable_chain_scope_gfs52bg6zj"() IS 'immutability guard of ChainScope';

COMMENT ON FUNCTION "slice"."__immutable_chain_skipped_b2kct5uern"() IS 'immutability guard of ChainSkipped';

COMMENT ON FUNCTION "slice"."__immutable_chain_start_step_mc64f7frad"() IS 'immutability guard of ChainStartStep';

COMMENT ON FUNCTION "slice"."__immutable_chain_step_cxf3233wsk"() IS 'immutability guard of ChainStep';

COMMENT ON FUNCTION "slice"."__immutable_chimed_gtkcd6vluu"() IS 'immutability guard of Chimed';

COMMENT ON FUNCTION "slice"."__immutable_clock_admitted_2qtned6dte"() IS 'immutability guard of ClockAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_clock_chime_input_s4ceffgsdh"() IS 'immutability guard of ClockChimeInput';

COMMENT ON FUNCTION "slice"."__immutable_clock_chime_output_4wvji5tgxg"() IS 'immutability guard of ClockChimeOutput';

COMMENT ON FUNCTION "slice"."__immutable_clock_claim_v4m4qrly3o"() IS 'immutability guard of ClockClaim';

COMMENT ON FUNCTION "slice"."__immutable_clock_close_input_b3nucms2af"() IS 'immutability guard of ClockCloseInput';

COMMENT ON FUNCTION "slice"."__immutable_clock_close_output_r2xctvwpny"() IS 'immutability guard of ClockCloseOutput';

COMMENT ON FUNCTION "slice"."__immutable_clock_done_vo636oloi4"() IS 'immutability guard of ClockDone';

COMMENT ON FUNCTION "slice"."__immutable_clock_ended_ffrzkvzlmm"() IS 'immutability guard of ClockEnded';

COMMENT ON FUNCTION "slice"."__immutable_clock_exhausted_gkejhufmzg"() IS 'immutability guard of ClockExhausted';

COMMENT ON FUNCTION "slice"."__immutable_clock_failed_ayxzshcyg7"() IS 'immutability guard of ClockFailed';

COMMENT ON FUNCTION "slice"."__immutable_clock_fenced_c5f64ttwnw"() IS 'immutability guard of ClockFenced';

COMMENT ON FUNCTION "slice"."__immutable_clock_finish_wz5pcvxvhv"() IS 'immutability guard of ClockFinish';

COMMENT ON FUNCTION "slice"."__immutable_clock_held_73wmb4e3nd"() IS 'immutability guard of ClockHeld';

COMMENT ON FUNCTION "slice"."__immutable_clock_hourly_finish_output_ns5lfaamhx"() IS 'immutability guard of ClockHourlyFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_clock_hourly_input_vovqay4fkm"() IS 'immutability guard of ClockHourlyInput';

COMMENT ON FUNCTION "slice"."__immutable_clock_paused_3ykaw355ga"() IS 'immutability guard of ClockPaused';

COMMENT ON FUNCTION "slice"."__immutable_clock_refusal_i6pq3fa7fm"() IS 'immutability guard of ClockRefusal';

COMMENT ON FUNCTION "slice"."__immutable_clock_result_ig7iwlfu3h"() IS 'immutability guard of ClockResult';

COMMENT ON FUNCTION "slice"."__immutable_clock_resumed_yqfyfvv7pj"() IS 'immutability guard of ClockResumed';

COMMENT ON FUNCTION "slice"."__immutable_clock_retry_rm5764fwqw"() IS 'immutability guard of ClockRetry';

COMMENT ON FUNCTION "slice"."__immutable_clock_root_75oloon3nz"() IS 'immutability guard of ClockRoot';

COMMENT ON FUNCTION "slice"."__immutable_clock_scope_kdthxacmiq"() IS 'immutability guard of ClockScope';

COMMENT ON FUNCTION "slice"."__immutable_clock_sitting_finish_output_omv4mzb4kb"() IS 'immutability guard of ClockSittingFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_clock_sitting_input_xcdj43nd2a"() IS 'immutability guard of ClockSittingInput';

COMMENT ON FUNCTION "slice"."__immutable_clock_skipped_oq2ldvr42g"() IS 'immutability guard of ClockSkipped';

COMMENT ON FUNCTION "slice"."__immutable_clock_start_step_bpm7rc5yh6"() IS 'immutability guard of ClockStartStep';

COMMENT ON FUNCTION "slice"."__immutable_clock_step_s6q4x6gnea"() IS 'immutability guard of ClockStep';

COMMENT ON FUNCTION "slice"."__immutable_concluded_usqwygcl43"() IS 'immutability guard of Concluded';

COMMENT ON FUNCTION "slice"."__immutable_copied_nroyctccyr"() IS 'immutability guard of Copied';

COMMENT ON FUNCTION "slice"."__immutable_cursor_yzelwkrjiw"() IS 'immutability guard of Cursor';

COMMENT ON FUNCTION "slice"."__immutable_delivered_bv4bssb7wd"() IS 'immutability guard of Delivered';

COMMENT ON FUNCTION "slice"."__immutable_fan_admitted_k3af2vnbsn"() IS 'immutability guard of FanAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_fan_batch_finish_output_gfnclozxa5"() IS 'immutability guard of FanBatchFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_fan_batch_input_vy7siapsvq"() IS 'immutability guard of FanBatchInput';

COMMENT ON FUNCTION "slice"."__immutable_fan_claim_7ntgxwf2ms"() IS 'immutability guard of FanClaim';

COMMENT ON FUNCTION "slice"."__immutable_fan_done_4iktcrxdwx"() IS 'immutability guard of FanDone';

COMMENT ON FUNCTION "slice"."__immutable_fan_dust_input_be7zp6tary"() IS 'immutability guard of FanDustInput';

COMMENT ON FUNCTION "slice"."__immutable_fan_dust_output_55luelojrl"() IS 'immutability guard of FanDustOutput';

COMMENT ON FUNCTION "slice"."__immutable_fan_ended_krmcsxkvy2"() IS 'immutability guard of FanEnded';

COMMENT ON FUNCTION "slice"."__immutable_fan_exhausted_b7pqh4ycpd"() IS 'immutability guard of FanExhausted';

COMMENT ON FUNCTION "slice"."__immutable_fan_failed_zvz5ofhsej"() IS 'immutability guard of FanFailed';

COMMENT ON FUNCTION "slice"."__immutable_fan_fan_run_finish_output_u75rcmavct"() IS 'immutability guard of FanFanRunFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_fan_fan_run_input_mdpqvszyrd"() IS 'immutability guard of FanFanRunInput';

COMMENT ON FUNCTION "slice"."__immutable_fan_fenced_plt6i5m3gf"() IS 'immutability guard of FanFenced';

COMMENT ON FUNCTION "slice"."__immutable_fan_finish_3o3htccact"() IS 'immutability guard of FanFinish';

COMMENT ON FUNCTION "slice"."__immutable_fan_held_dh5ht2fiop"() IS 'immutability guard of FanHeld';

COMMENT ON FUNCTION "slice"."__immutable_fan_hold_ihna3m47qc"() IS 'immutability guard of FanHold';

COMMENT ON FUNCTION "slice"."__immutable_fan_mop_input_lcbvwew7rb"() IS 'immutability guard of FanMopInput';

COMMENT ON FUNCTION "slice"."__immutable_fan_mop_output_4og7ae4wlb"() IS 'immutability guard of FanMopOutput';

COMMENT ON FUNCTION "slice"."__immutable_fan_paused_ybdsv5d4um"() IS 'immutability guard of FanPaused';

COMMENT ON FUNCTION "slice"."__immutable_fan_refusal_2c5njgmdwp"() IS 'immutability guard of FanRefusal';

COMMENT ON FUNCTION "slice"."__immutable_fan_result_f7sqwayl4t"() IS 'immutability guard of FanResult';

COMMENT ON FUNCTION "slice"."__immutable_fan_resumed_euttpstg26"() IS 'immutability guard of FanResumed';

COMMENT ON FUNCTION "slice"."__immutable_fan_retry_qjvuzvpmag"() IS 'immutability guard of FanRetry';

COMMENT ON FUNCTION "slice"."__immutable_fan_root_vjstxtlelj"() IS 'immutability guard of FanRoot';

COMMENT ON FUNCTION "slice"."__immutable_fan_scope_33cpecik4x"() IS 'immutability guard of FanScope';

COMMENT ON FUNCTION "slice"."__immutable_fan_skipped_z4jbjt32cw"() IS 'immutability guard of FanSkipped';

COMMENT ON FUNCTION "slice"."__immutable_fan_square_input_a2dmgunaoc"() IS 'immutability guard of FanSquareInput';

COMMENT ON FUNCTION "slice"."__immutable_fan_square_output_zkcnqinot6"() IS 'immutability guard of FanSquareOutput';

COMMENT ON FUNCTION "slice"."__immutable_fan_start_scope_mhqt7drk7y"() IS 'immutability guard of FanStartScope';

COMMENT ON FUNCTION "slice"."__immutable_fan_start_step_ufa3fogq73"() IS 'immutability guard of FanStartStep';

COMMENT ON FUNCTION "slice"."__immutable_fan_step_xh7ypb2uv7"() IS 'immutability guard of FanStep';

COMMENT ON FUNCTION "slice"."__immutable_fan_sweep_finish_output_sl6klktxcq"() IS 'immutability guard of FanSweepFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_fan_sweep_input_shrufxua63"() IS 'immutability guard of FanSweepInput';

COMMENT ON FUNCTION "slice"."__immutable_fan_within_etr5iewvk6"() IS 'immutability guard of FanWithin';

COMMENT ON FUNCTION "slice"."__immutable_heard_fdsu5343fb"() IS 'immutability guard of Heard';

COMMENT ON FUNCTION "slice"."__immutable_item_4ldnoxfrc7"() IS 'immutability guard of Item';

COMMENT ON FUNCTION "slice"."__immutable_order_ben75ltrft"() IS 'immutability guard of Order';

COMMENT ON FUNCTION "slice"."__immutable_passage_iyn37vjgw2"() IS 'immutability guard of Passage';

COMMENT ON FUNCTION "slice"."__immutable_retry_admitted_eolnjsfyxd"() IS 'immutability guard of RetryAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_retry_brittle_input_ausf5tibvp"() IS 'immutability guard of RetryBrittleInput';

COMMENT ON FUNCTION "slice"."__immutable_retry_brittle_output_svmuqxhg2b"() IS 'immutability guard of RetryBrittleOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_claim_tz6ks3h3vp"() IS 'immutability guard of RetryClaim';

COMMENT ON FUNCTION "slice"."__immutable_retry_done_6va27csru3"() IS 'immutability guard of RetryDone';

COMMENT ON FUNCTION "slice"."__immutable_retry_ended_notesdh2cf"() IS 'immutability guard of RetryEnded';

COMMENT ON FUNCTION "slice"."__immutable_retry_exhausted_pvd3vu4h2a"() IS 'immutability guard of RetryExhausted';

COMMENT ON FUNCTION "slice"."__immutable_retry_failed_ieswkzb7hm"() IS 'immutability guard of RetryFailed';

COMMENT ON FUNCTION "slice"."__immutable_retry_fenced_p7poekl7ys"() IS 'immutability guard of RetryFenced';

COMMENT ON FUNCTION "slice"."__immutable_retry_finish_43po3yfg6c"() IS 'immutability guard of RetryFinish';

COMMENT ON FUNCTION "slice"."__immutable_retry_held_lbawz6yff6"() IS 'immutability guard of RetryHeld';

COMMENT ON FUNCTION "slice"."__immutable_retry_ladders_finish_output_3q4to6cght"() IS 'immutability guard of RetryLaddersFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_ladders_input_okpacstpdm"() IS 'immutability guard of RetryLaddersInput';

COMMENT ON FUNCTION "slice"."__immutable_retry_patient_input_orlvjw2mfn"() IS 'immutability guard of RetryPatientInput';

COMMENT ON FUNCTION "slice"."__immutable_retry_patient_output_ziimw65tav"() IS 'immutability guard of RetryPatientOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_paused_ss7djxjrej"() IS 'immutability guard of RetryPaused';

COMMENT ON FUNCTION "slice"."__immutable_retry_polite_input_irpdtwvabl"() IS 'immutability guard of RetryPoliteInput';

COMMENT ON FUNCTION "slice"."__immutable_retry_polite_output_qhunb73svk"() IS 'immutability guard of RetryPoliteOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_refusal_zjllqdtyq6"() IS 'immutability guard of RetryRefusal';

COMMENT ON FUNCTION "slice"."__immutable_retry_result_zxaurb7hrf"() IS 'immutability guard of RetryResult';

COMMENT ON FUNCTION "slice"."__immutable_retry_resumed_dlzqou5yma"() IS 'immutability guard of RetryResumed';

COMMENT ON FUNCTION "slice"."__immutable_retry_retry_c6bof3tqdn"() IS 'immutability guard of RetryRetry';

COMMENT ON FUNCTION "slice"."__immutable_retry_root_tebbmtjoyc"() IS 'immutability guard of RetryRoot';

COMMENT ON FUNCTION "slice"."__immutable_retry_scope_tcb2yvske4"() IS 'immutability guard of RetryScope';

COMMENT ON FUNCTION "slice"."__immutable_retry_skipped_nnwrhr4oeq"() IS 'immutability guard of RetrySkipped';

COMMENT ON FUNCTION "slice"."__immutable_retry_start_step_duikbwntxe"() IS 'immutability guard of RetryStartStep';

COMMENT ON FUNCTION "slice"."__immutable_retry_steadfast_input_wq2rlbvnku"() IS 'immutability guard of RetrySteadfastInput';

COMMENT ON FUNCTION "slice"."__immutable_retry_steadfast_output_5x5qblbkmn"() IS 'immutability guard of RetrySteadfastOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_step_qlqkam4l4t"() IS 'immutability guard of RetryStep';

COMMENT ON FUNCTION "slice"."__immutable_retry_throttled_finish_output_qtfgse45jp"() IS 'immutability guard of RetryThrottledFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_throttled_input_7xho7h2vz4"() IS 'immutability guard of RetryThrottledInput';

COMMENT ON FUNCTION "slice"."__immutable_retry_unhurried_finish_output_cde4ravv72"() IS 'immutability guard of RetryUnhurriedFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_retry_unhurried_input_yunthjw3fr"() IS 'immutability guard of RetryUnhurriedInput';

COMMENT ON FUNCTION "slice"."__immutable_review_admitted_cctbtav3il"() IS 'immutability guard of ReviewAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_review_analyze_input_ddoiygqq26"() IS 'immutability guard of ReviewAnalyzeInput';

COMMENT ON FUNCTION "slice"."__immutable_review_analyze_output_46xdivyhdg"() IS 'immutability guard of ReviewAnalyzeOutput';

COMMENT ON FUNCTION "slice"."__immutable_review_claim_o4owny47xh"() IS 'immutability guard of ReviewClaim';

COMMENT ON FUNCTION "slice"."__immutable_review_done_ycpiz6hfvz"() IS 'immutability guard of ReviewDone';

COMMENT ON FUNCTION "slice"."__immutable_review_ended_jccxfvuswb"() IS 'immutability guard of ReviewEnded';

COMMENT ON FUNCTION "slice"."__immutable_review_exhausted_izyjr2fdnz"() IS 'immutability guard of ReviewExhausted';

COMMENT ON FUNCTION "slice"."__immutable_review_failed_em7gqggbu3"() IS 'immutability guard of ReviewFailed';

COMMENT ON FUNCTION "slice"."__immutable_review_fenced_rsk5lrhdou"() IS 'immutability guard of ReviewFenced';

COMMENT ON FUNCTION "slice"."__immutable_review_finish_alc7biausi"() IS 'immutability guard of ReviewFinish';

COMMENT ON FUNCTION "slice"."__immutable_review_gather_input_vaaijuigpf"() IS 'immutability guard of ReviewGatherInput';

COMMENT ON FUNCTION "slice"."__immutable_review_gather_input_sizes_dvuwnqrakr"() IS 'immutability guard of ReviewGatherInputSizes';

COMMENT ON FUNCTION "slice"."__immutable_review_gather_output_kdk2xfhyss"() IS 'immutability guard of ReviewGatherOutput';

COMMENT ON FUNCTION "slice"."__immutable_review_held_qcoqzdpofm"() IS 'immutability guard of ReviewHeld';

COMMENT ON FUNCTION "slice"."__immutable_review_hold_xbvcwhgtjs"() IS 'immutability guard of ReviewHold';

COMMENT ON FUNCTION "slice"."__immutable_review_paused_cmayqb3lyz"() IS 'immutability guard of ReviewPaused';

COMMENT ON FUNCTION "slice"."__immutable_review_questions_finish_output_ufpabbpiqs"() IS 'immutability guard of ReviewQuestionsFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_review_questions_input_vtjabhamvi"() IS 'immutability guard of ReviewQuestionsInput';

COMMENT ON FUNCTION "slice"."__immutable_review_refusal_ls4mkh2ynh"() IS 'immutability guard of ReviewRefusal';

COMMENT ON FUNCTION "slice"."__immutable_review_result_q2r5b333th"() IS 'immutability guard of ReviewResult';

COMMENT ON FUNCTION "slice"."__immutable_review_resumed_yerv455d7e"() IS 'immutability guard of ReviewResumed';

COMMENT ON FUNCTION "slice"."__immutable_review_retry_ooig554z7x"() IS 'immutability guard of ReviewRetry';

COMMENT ON FUNCTION "slice"."__immutable_review_review_run_finish_output_sqver4l3jr"() IS 'immutability guard of ReviewReviewRunFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_review_review_run_input_prf4dxiueo"() IS 'immutability guard of ReviewReviewRunInput';

COMMENT ON FUNCTION "slice"."__immutable_review_review_run_input_sizes_7bptjeo4gj"() IS 'immutability guard of ReviewReviewRunInputSizes';

COMMENT ON FUNCTION "slice"."__immutable_review_root_po3ofptpdd"() IS 'immutability guard of ReviewRoot';

COMMENT ON FUNCTION "slice"."__immutable_review_save_input_smmbiztzle"() IS 'immutability guard of ReviewSaveInput';

COMMENT ON FUNCTION "slice"."__immutable_review_save_output_t54wngxzch"() IS 'immutability guard of ReviewSaveOutput';

COMMENT ON FUNCTION "slice"."__immutable_review_saved_uvkannkbrb"() IS 'immutability guard of ReviewSaved';

COMMENT ON FUNCTION "slice"."__immutable_review_scope_dd33gxfgmm"() IS 'immutability guard of ReviewScope';

COMMENT ON FUNCTION "slice"."__immutable_review_skipped_wufsmxgze2"() IS 'immutability guard of ReviewSkipped';

COMMENT ON FUNCTION "slice"."__immutable_review_split_ciexnksfu3"() IS 'immutability guard of ReviewSplit';

COMMENT ON FUNCTION "slice"."__immutable_review_start_scope_vbor3ffd7c"() IS 'immutability guard of ReviewStartScope';

COMMENT ON FUNCTION "slice"."__immutable_review_start_step_iq772ofwks"() IS 'immutability guard of ReviewStartStep';

COMMENT ON FUNCTION "slice"."__immutable_review_step_mfylpvjfmn"() IS 'immutability guard of ReviewStep';

COMMENT ON FUNCTION "slice"."__immutable_review_within_zs65ukuncx"() IS 'immutability guard of ReviewWithin';

COMMENT ON FUNCTION "slice"."__immutable_reviewed_al7kpguevt"() IS 'immutability guard of Reviewed';

COMMENT ON FUNCTION "slice"."__immutable_seen_2hqyun4r6w"() IS 'immutability guard of Seen';

COMMENT ON FUNCTION "slice"."__immutable_settled_wamxlunuss"() IS 'immutability guard of Settled';

COMMENT ON FUNCTION "slice"."__immutable_summary_eaie3elgpy"() IS 'immutability guard of Summary';

COMMENT ON FUNCTION "slice"."__immutable_sync_admitted_w6ae7iqgt2"() IS 'immutability guard of SyncAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_sync_build_input_eb5e7abm2z"() IS 'immutability guard of SyncBuildInput';

COMMENT ON FUNCTION "slice"."__immutable_sync_build_output_se745rutp7"() IS 'immutability guard of SyncBuildOutput';

COMMENT ON FUNCTION "slice"."__immutable_sync_claim_rjzsqgkfdx"() IS 'immutability guard of SyncClaim';

COMMENT ON FUNCTION "slice"."__immutable_sync_copy_input_p6rd7mws42"() IS 'immutability guard of SyncCopyInput';

COMMENT ON FUNCTION "slice"."__immutable_sync_copy_output_sxuosus5zb"() IS 'immutability guard of SyncCopyOutput';

COMMENT ON FUNCTION "slice"."__immutable_sync_done_c7shzbinfq"() IS 'immutability guard of SyncDone';

COMMENT ON FUNCTION "slice"."__immutable_sync_ended_6ruhhxomij"() IS 'immutability guard of SyncEnded';

COMMENT ON FUNCTION "slice"."__immutable_sync_exclusive_wp25ozdfpb"() IS 'immutability guard of SyncExclusive';

COMMENT ON FUNCTION "slice"."__immutable_sync_exclusive_key_4xe5fgrsg2"() IS 'immutability guard of SyncExclusiveKey';

COMMENT ON FUNCTION "slice"."__immutable_sync_exhausted_g7lyw7ulss"() IS 'immutability guard of SyncExhausted';

COMMENT ON FUNCTION "slice"."__immutable_sync_failed_i6efj76jpc"() IS 'immutability guard of SyncFailed';

COMMENT ON FUNCTION "slice"."__immutable_sync_fenced_znp5pfqe6u"() IS 'immutability guard of SyncFenced';

COMMENT ON FUNCTION "slice"."__immutable_sync_finish_gkf55x2w4v"() IS 'immutability guard of SyncFinish';

COMMENT ON FUNCTION "slice"."__immutable_sync_gold_finish_output_kpbilw2xsy"() IS 'immutability guard of SyncGoldFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_sync_gold_input_odzfeneza2"() IS 'immutability guard of SyncGoldInput';

COMMENT ON FUNCTION "slice"."__immutable_sync_held_anzzddtdo7"() IS 'immutability guard of SyncHeld';

COMMENT ON FUNCTION "slice"."__immutable_sync_paused_2kerwzow7r"() IS 'immutability guard of SyncPaused';

COMMENT ON FUNCTION "slice"."__immutable_sync_refusal_wv2age6imb"() IS 'immutability guard of SyncRefusal';

COMMENT ON FUNCTION "slice"."__immutable_sync_released_vxed37ia4q"() IS 'immutability guard of SyncReleased';

COMMENT ON FUNCTION "slice"."__immutable_sync_result_gijuwmex2z"() IS 'immutability guard of SyncResult';

COMMENT ON FUNCTION "slice"."__immutable_sync_resumed_tbwsh2hgo7"() IS 'immutability guard of SyncResumed';

COMMENT ON FUNCTION "slice"."__immutable_sync_retry_73rhk7zz4l"() IS 'immutability guard of SyncRetry';

COMMENT ON FUNCTION "slice"."__immutable_sync_root_hayadibiof"() IS 'immutability guard of SyncRoot';

COMMENT ON FUNCTION "slice"."__immutable_sync_scope_e7doa3r4xk"() IS 'immutability guard of SyncScope';

COMMENT ON FUNCTION "slice"."__immutable_sync_skipped_7o6y2lhuvw"() IS 'immutability guard of SyncSkipped';

COMMENT ON FUNCTION "slice"."__immutable_sync_start_step_agabfoxem4"() IS 'immutability guard of SyncStartStep';

COMMENT ON FUNCTION "slice"."__immutable_sync_step_ophrrrzlnv"() IS 'immutability guard of SyncStep';

COMMENT ON FUNCTION "slice"."__immutable_sync_sync_run_finish_output_vvsnwaeqr6"() IS 'immutability guard of SyncSyncRunFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_sync_sync_run_input_hxmhcedtcp"() IS 'immutability guard of SyncSyncRunInput';

COMMENT ON FUNCTION "slice"."__immutable_tally_6vtadbiqmv"() IS 'immutability guard of Tally';

COMMENT ON FUNCTION "slice"."__immutable_weight_sby3z3ax7g"() IS 'immutability guard of Weight';

COMMENT ON FUNCTION "slice"."__immutable_writeback_admitted_6cddwahck7"() IS 'immutability guard of WritebackAdmitted';

COMMENT ON FUNCTION "slice"."__immutable_writeback_claim_d446vlj34i"() IS 'immutability guard of WritebackClaim';

COMMENT ON FUNCTION "slice"."__immutable_writeback_deliver_input_g3bjjpambh"() IS 'immutability guard of WritebackDeliverInput';

COMMENT ON FUNCTION "slice"."__immutable_writeback_deliver_output_iq6gxg2khn"() IS 'immutability guard of WritebackDeliverOutput';

COMMENT ON FUNCTION "slice"."__immutable_writeback_done_j6dpj2mxje"() IS 'immutability guard of WritebackDone';

COMMENT ON FUNCTION "slice"."__immutable_writeback_ended_u5cq6zdt5y"() IS 'immutability guard of WritebackEnded';

COMMENT ON FUNCTION "slice"."__immutable_writeback_exhausted_ztqr3blmpi"() IS 'immutability guard of WritebackExhausted';

COMMENT ON FUNCTION "slice"."__immutable_writeback_failed_mjo746nnho"() IS 'immutability guard of WritebackFailed';

COMMENT ON FUNCTION "slice"."__immutable_writeback_fenced_p36oq6vycf"() IS 'immutability guard of WritebackFenced';

COMMENT ON FUNCTION "slice"."__immutable_writeback_finish_mn4pvcwvca"() IS 'immutability guard of WritebackFinish';

COMMENT ON FUNCTION "slice"."__immutable_writeback_held_ln64q3nkzp"() IS 'immutability guard of WritebackHeld';

COMMENT ON FUNCTION "slice"."__immutable_writeback_paused_wlprgt3byb"() IS 'immutability guard of WritebackPaused';

COMMENT ON FUNCTION "slice"."__immutable_writeback_refusal_zd5sbhv6py"() IS 'immutability guard of WritebackRefusal';

COMMENT ON FUNCTION "slice"."__immutable_writeback_result_swcuiiltyv"() IS 'immutability guard of WritebackResult';

COMMENT ON FUNCTION "slice"."__immutable_writeback_resumed_vv3hrewq67"() IS 'immutability guard of WritebackResumed';

COMMENT ON FUNCTION "slice"."__immutable_writeback_retry_y45ily2j7s"() IS 'immutability guard of WritebackRetry';

COMMENT ON FUNCTION "slice"."__immutable_writeback_root_ysmkev76k2"() IS 'immutability guard of WritebackRoot';

COMMENT ON FUNCTION "slice"."__immutable_writeback_scope_tbcrtfkxbs"() IS 'immutability guard of WritebackScope';

COMMENT ON FUNCTION "slice"."__immutable_writeback_skipped_mfw3kwqglv"() IS 'immutability guard of WritebackSkipped';

COMMENT ON FUNCTION "slice"."__immutable_writeback_start_step_b6lnnboie7"() IS 'immutability guard of WritebackStartStep';

COMMENT ON FUNCTION "slice"."__immutable_writeback_step_cr32x75nun"() IS 'immutability guard of WritebackStep';

COMMENT ON FUNCTION "slice"."__immutable_writeback_writeback_finish_output_uug5ky36fj"() IS 'immutability guard of WritebackWritebackFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_writeback_writeback_input_o6v4lziekt"() IS 'immutability guard of WritebackWritebackInput';

COMMENT ON ROLE :"__live_wzkq6p2yii" IS 'live source of slice';
